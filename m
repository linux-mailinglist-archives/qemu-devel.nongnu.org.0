Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C62F215A7
	for <lists+qemu-devel@lfdr.de>; Fri, 17 May 2019 10:50:06 +0200 (CEST)
Received: from localhost ([127.0.0.1]:44622 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hRYZ3-0002zo-FQ
	for lists+qemu-devel@lfdr.de; Fri, 17 May 2019 04:50:05 -0400
Received: from eggs.gnu.org ([209.51.188.92]:59226)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <klaus@birkelund.eu>) id 1hRYTH-0007Ut-Pr
	for qemu-devel@nongnu.org; Fri, 17 May 2019 04:44:10 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <klaus@birkelund.eu>) id 1hRYTF-00063z-9E
	for qemu-devel@nongnu.org; Fri, 17 May 2019 04:44:07 -0400
Received: from charlie.dont.surf ([128.199.63.193]:40176)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <klaus@birkelund.eu>)
	id 1hRYT8-0005tw-ME; Fri, 17 May 2019 04:43:58 -0400
Received: from apples.localdomain (ip-5-186-120-196.cgn.fibianet.dk
	[5.186.120.196])
	by charlie.dont.surf (Postfix) with ESMTPSA id 2380AC06DB;
	Fri, 17 May 2019 08:43:56 +0000 (UTC)
From: Klaus Birkelund Jensen <klaus@birkelund.eu>
To: qemu-block@nongnu.org
Date: Fri, 17 May 2019 10:42:29 +0200
Message-Id: <20190517084234.26923-4-klaus@birkelund.eu>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190517084234.26923-1-klaus@birkelund.eu>
References: <20190517084234.26923-1-klaus@birkelund.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 128.199.63.193
Subject: [Qemu-devel] [PATCH 3/8] nvme: simplify PRP mappings
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Keith Busch <keith.busch@intel.com>, Kevin Wolf <kwolf@redhat.com>,
	qemu-devel@nongnu.org, Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Instead of handling both QSGs and IOVs in multiple places, simply use
QSGs everywhere by assuming that the request does not involve the
controller memory buffer (CMB). If the request is found to involve the
CMB, convert the QSG to an IOV and issue the I/O.

The QSG is converted to an IOV by the dma helpers anyway, so it is not
like the CMB path is unfairly affected by this simplifying change.

Signed-off-by: Klaus Birkelund Jensen <klaus.jensen@cnexlabs.com>
---
 hw/block/nvme.c       | 205 +++++++++++++++++++++++++++---------------
 hw/block/nvme.h       |   3 +-
 hw/block/trace-events |   1 +
 include/block/nvme.h  |   1 +
 4 files changed, 138 insertions(+), 72 deletions(-)

diff --git a/hw/block/nvme.c b/hw/block/nvme.c
index 65dfc04f71e5..453213f9abb4 100644
--- a/hw/block/nvme.c
+++ b/hw/block/nvme.c
@@ -71,14 +71,21 @@
=20
 static void nvme_process_sq(void *opaque);
=20
+static inline uint8_t nvme_addr_is_cmb(NvmeCtrl *n, hwaddr addr)
+{
+    return n->cmbsz && addr >=3D n->ctrl_mem.addr &&
+        addr < (n->ctrl_mem.addr + int128_get64(n->ctrl_mem.size));
+}
+
 static void nvme_addr_read(NvmeCtrl *n, hwaddr addr, void *buf, int size=
)
 {
-    if (n->cmbsz && addr >=3D n->ctrl_mem.addr &&
-                addr < (n->ctrl_mem.addr + int128_get64(n->ctrl_mem.size=
))) {
+    if (nvme_addr_is_cmb(n, addr)) {
         memcpy(buf, (void *)&n->cmbuf[addr - n->ctrl_mem.addr], size);
-    } else {
-        pci_dma_read(&n->parent_obj, addr, buf, size);
+
+        return;
     }
+
+    pci_dma_read(&n->parent_obj, addr, buf, size);
 }
=20
 static void nvme_addr_write(NvmeCtrl *n, hwaddr addr, void *buf, int siz=
e)
@@ -167,31 +174,48 @@ static void nvme_irq_deassert(NvmeCtrl *n, NvmeCQue=
ue *cq)
     }
 }
=20
-static uint16_t nvme_map_prp(QEMUSGList *qsg, QEMUIOVector *iov, uint64_=
t prp1,
-                             uint64_t prp2, uint32_t len, NvmeCtrl *n)
+static uint16_t nvme_map_prp(NvmeCtrl *n, QEMUSGList *qsg, uint64_t prp1=
,
+    uint64_t prp2, uint32_t len, NvmeRequest *req)
 {
     hwaddr trans_len =3D n->page_size - (prp1 % n->page_size);
     trans_len =3D MIN(len, trans_len);
     int num_prps =3D (len >> n->page_bits) + 1;
+    uint16_t status =3D NVME_SUCCESS;
+
+    trace_nvme_map_prp(req->cmd_opcode, trans_len, len, prp1, prp2, num_=
prps);
=20
     if (unlikely(!prp1)) {
         trace_nvme_err_invalid_prp();
         return NVME_INVALID_FIELD | NVME_DNR;
-    } else if (n->cmbsz && prp1 >=3D n->ctrl_mem.addr &&
-               prp1 < n->ctrl_mem.addr + int128_get64(n->ctrl_mem.size))=
 {
-        qsg->nsg =3D 0;
-        qemu_iovec_init(iov, num_prps);
-        qemu_iovec_add(iov, (void *)&n->cmbuf[prp1 - n->ctrl_mem.addr], =
trans_len);
+    }
+
+    if (nvme_addr_is_cmb(n, prp1)) {
+        NvmeSQueue *sq =3D req->sq;
+        if (!nvme_addr_is_cmb(n, sq->dma_addr)) {
+            return NVME_INVALID_USE_OF_CMB | NVME_DNR;
+        }
+
+        req->is_cmb =3D true;
     } else {
-        pci_dma_sglist_init(qsg, &n->parent_obj, num_prps);
-        qemu_sglist_add(qsg, prp1, trans_len);
+        req->is_cmb =3D false;
     }
+
+    pci_dma_sglist_init(qsg, &n->parent_obj, num_prps);
+    qemu_sglist_add(qsg, prp1, trans_len);
+
     len -=3D trans_len;
     if (len) {
         if (unlikely(!prp2)) {
             trace_nvme_err_invalid_prp2_missing();
+            status =3D NVME_INVALID_FIELD | NVME_DNR;
             goto unmap;
         }
+
+        if (req->is_cmb && !nvme_addr_is_cmb(n, prp2)) {
+            status =3D NVME_INVALID_USE_OF_CMB | NVME_DNR;
+            goto unmap;
+        }
+
         if (len > n->page_size) {
             uint64_t prp_list[n->max_prp_ents];
             uint32_t nents, prp_trans;
@@ -203,79 +227,99 @@ static uint16_t nvme_map_prp(QEMUSGList *qsg, QEMUI=
OVector *iov, uint64_t prp1,
             while (len !=3D 0) {
                 uint64_t prp_ent =3D le64_to_cpu(prp_list[i]);
=20
+                if (req->is_cmb && !nvme_addr_is_cmb(n, prp_ent)) {
+                    status =3D NVME_INVALID_USE_OF_CMB | NVME_DNR;
+                    goto unmap;
+                }
+
                 if (i =3D=3D n->max_prp_ents - 1 && len > n->page_size) =
{
                     if (unlikely(!prp_ent || prp_ent & (n->page_size - 1=
))) {
                         trace_nvme_err_invalid_prplist_ent(prp_ent);
+                        status =3D NVME_INVALID_FIELD | NVME_DNR;
                         goto unmap;
                     }
=20
                     i =3D 0;
                     nents =3D (len + n->page_size - 1) >> n->page_bits;
                     prp_trans =3D MIN(n->max_prp_ents, nents) * sizeof(u=
int64_t);
-                    nvme_addr_read(n, prp_ent, (void *)prp_list,
-                        prp_trans);
+                    nvme_addr_read(n, prp_ent, (void *)prp_list, prp_tra=
ns);
                     prp_ent =3D le64_to_cpu(prp_list[i]);
                 }
=20
                 if (unlikely(!prp_ent || prp_ent & (n->page_size - 1))) =
{
                     trace_nvme_err_invalid_prplist_ent(prp_ent);
+                    status =3D NVME_INVALID_FIELD | NVME_DNR;
                     goto unmap;
                 }
=20
                 trans_len =3D MIN(len, n->page_size);
-                if (qsg->nsg){
-                    qemu_sglist_add(qsg, prp_ent, trans_len);
-                } else {
-                    qemu_iovec_add(iov, (void *)&n->cmbuf[prp_ent - n->c=
trl_mem.addr], trans_len);
-                }
+                qemu_sglist_add(qsg, prp_ent, trans_len);
+
                 len -=3D trans_len;
                 i++;
             }
         } else {
             if (unlikely(prp2 & (n->page_size - 1))) {
                 trace_nvme_err_invalid_prp2_align(prp2);
+                status =3D NVME_INVALID_FIELD | NVME_DNR;
                 goto unmap;
             }
-            if (qsg->nsg) {
-                qemu_sglist_add(qsg, prp2, len);
-            } else {
-                qemu_iovec_add(iov, (void *)&n->cmbuf[prp2 - n->ctrl_mem=
.addr], trans_len);
-            }
+
+            qemu_sglist_add(qsg, prp2, len);
         }
     }
+
     return NVME_SUCCESS;
=20
- unmap:
+unmap:
     qemu_sglist_destroy(qsg);
-    return NVME_INVALID_FIELD | NVME_DNR;
+
+    return status;
+}
+
+static void dma_to_cmb(NvmeCtrl *n, QEMUSGList *qsg, QEMUIOVector *iov)
+{
+    for (int i =3D 0; i < qsg->nsg; i++) {
+        void *addr =3D &n->cmbuf[qsg->sg[i].base - n->ctrl_mem.addr];
+        qemu_iovec_add(iov, addr, qsg->sg[i].len);
+    }
 }
=20
 static uint16_t nvme_dma_read_prp(NvmeCtrl *n, uint8_t *ptr, uint32_t le=
n,
-    uint64_t prp1, uint64_t prp2)
+    uint64_t prp1, uint64_t prp2, NvmeRequest *req)
 {
     QEMUSGList qsg;
-    QEMUIOVector iov;
-    uint16_t status =3D NVME_SUCCESS;
+    uint16_t err =3D NVME_SUCCESS;
=20
-    trace_nvme_dma_read(prp1, prp2);
-
-    if (nvme_map_prp(&qsg, &iov, prp1, prp2, len, n)) {
-        return NVME_INVALID_FIELD | NVME_DNR;
+    err =3D nvme_map_prp(n, &qsg, prp1, prp2, len, req);
+    if (err) {
+        return err;
     }
-    if (qsg.nsg > 0) {
-        if (unlikely(dma_buf_read(ptr, len, &qsg))) {
+
+    if (req->is_cmb) {
+        QEMUIOVector iov;
+
+        qemu_iovec_init(&iov, qsg.nsg);
+        dma_to_cmb(n, &qsg, &iov);
+
+        if (unlikely(qemu_iovec_from_buf(&iov, 0, ptr, len) !=3D len)) {
             trace_nvme_err_invalid_dma();
-            status =3D NVME_INVALID_FIELD | NVME_DNR;
-        }
-        qemu_sglist_destroy(&qsg);
-    } else {
-        if (unlikely(qemu_iovec_to_buf(&iov, 0, ptr, len) !=3D len)) {
-            trace_nvme_err_invalid_dma();
-            status =3D NVME_INVALID_FIELD | NVME_DNR;
+            err =3D NVME_INVALID_FIELD | NVME_DNR;
         }
+
         qemu_iovec_destroy(&iov);
+
+        return err;
     }
-    return status;
+
+    if (unlikely(dma_buf_read(ptr, len, &qsg))) {
+        trace_nvme_err_invalid_dma();
+        err =3D NVME_INVALID_FIELD | NVME_DNR;
+    }
+
+    qemu_sglist_destroy(&qsg);
+
+    return err;
 }
=20
 static void nvme_post_cqe(NvmeCQueue *cq, NvmeRequest *req)
@@ -415,16 +459,20 @@ static void nvme_rw_cb(void *opaque, int ret)
         block_acct_failed(blk_get_stats(n->conf.blk), &req->acct);
         req->status =3D NVME_INTERNAL_DEV_ERROR;
     }
-    if (req->has_sg) {
+
+    if (req->qsg.nalloc) {
         qemu_sglist_destroy(&req->qsg);
     }
+    if (req->iov.nalloc) {
+        qemu_iovec_destroy(&req->iov);
+    }
+
     nvme_enqueue_req_completion(cq, req);
 }
=20
 static uint16_t nvme_flush(NvmeCtrl *n, NvmeNamespace *ns, NvmeCmd *cmd,
     NvmeRequest *req)
 {
-    req->has_sg =3D false;
     block_acct_start(blk_get_stats(n->conf.blk), &req->acct, 0,
          BLOCK_ACCT_FLUSH);
     req->aiocb =3D blk_aio_flush(n->conf.blk, nvme_rw_cb, req);
@@ -448,7 +496,6 @@ static uint16_t nvme_write_zeros(NvmeCtrl *n, NvmeNam=
espace *ns, NvmeCmd *cmd,
         return NVME_LBA_RANGE | NVME_DNR;
     }
=20
-    req->has_sg =3D false;
     block_acct_start(blk_get_stats(n->conf.blk), &req->acct, 0,
                      BLOCK_ACCT_WRITE);
     req->aiocb =3D blk_aio_pwrite_zeroes(n->conf.blk, offset, count,
@@ -480,21 +527,21 @@ static uint16_t nvme_rw(NvmeCtrl *n, NvmeNamespace =
*ns, NvmeCmd *cmd,
         return NVME_LBA_RANGE | NVME_DNR;
     }
=20
-    if (nvme_map_prp(&req->qsg, &req->iov, prp1, prp2, data_size, n)) {
+    if (nvme_map_prp(n, &req->qsg, prp1, prp2, data_size, req)) {
         block_acct_invalid(blk_get_stats(n->conf.blk), acct);
         return NVME_INVALID_FIELD | NVME_DNR;
     }
=20
     dma_acct_start(n->conf.blk, &req->acct, &req->qsg, acct);
-    if (req->qsg.nsg > 0) {
-        req->has_sg =3D true;
+    if (!req->is_cmb) {
         req->aiocb =3D is_write ?
             dma_blk_write(n->conf.blk, &req->qsg, data_offset, BDRV_SECT=
OR_SIZE,
                           nvme_rw_cb, req) :
             dma_blk_read(n->conf.blk, &req->qsg, data_offset, BDRV_SECTO=
R_SIZE,
                          nvme_rw_cb, req);
     } else {
-        req->has_sg =3D false;
+        qemu_iovec_init(&req->iov, req->qsg.nsg);
+        dma_to_cmb(n, &req->qsg, &req->iov);
         req->aiocb =3D is_write ?
             blk_aio_pwritev(n->conf.blk, data_offset, &req->iov, 0, nvme=
_rw_cb,
                             req) :
@@ -592,7 +639,7 @@ static void nvme_init_sq(NvmeSQueue *sq, NvmeCtrl *n,=
 uint64_t dma_addr,
     sq->size =3D size;
     sq->cqid =3D cqid;
     sq->head =3D sq->tail =3D 0;
-    sq->io_req =3D g_new(NvmeRequest, sq->size);
+    sq->io_req =3D g_new0(NvmeRequest, sq->size);
=20
     QTAILQ_INIT(&sq->req_list);
     QTAILQ_INIT(&sq->out_req_list);
@@ -740,7 +787,8 @@ static uint16_t nvme_create_cq(NvmeCtrl *n, NvmeCmd *=
cmd)
     return NVME_SUCCESS;
 }
=20
-static uint16_t nvme_identify_ctrl(NvmeCtrl *n, NvmeIdentify *c)
+static uint16_t nvme_identify_ctrl(NvmeCtrl *n, NvmeIdentify *c,
+    NvmeRequest *req)
 {
     uint64_t prp1 =3D le64_to_cpu(c->prp1);
     uint64_t prp2 =3D le64_to_cpu(c->prp2);
@@ -748,10 +796,11 @@ static uint16_t nvme_identify_ctrl(NvmeCtrl *n, Nvm=
eIdentify *c)
     trace_nvme_identify_ctrl();
=20
     return nvme_dma_read_prp(n, (uint8_t *)&n->id_ctrl, sizeof(n->id_ctr=
l),
-        prp1, prp2);
+        prp1, prp2, req);
 }
=20
-static uint16_t nvme_identify_ns(NvmeCtrl *n, NvmeIdentify *c)
+static uint16_t nvme_identify_ns(NvmeCtrl *n, NvmeIdentify *c,
+    NvmeRequest *req)
 {
     NvmeNamespace *ns;
     uint32_t nsid =3D le32_to_cpu(c->nsid);
@@ -768,10 +817,11 @@ static uint16_t nvme_identify_ns(NvmeCtrl *n, NvmeI=
dentify *c)
     ns =3D &n->namespaces[nsid - 1];
=20
     return nvme_dma_read_prp(n, (uint8_t *)&ns->id_ns, sizeof(ns->id_ns)=
,
-        prp1, prp2);
+        prp1, prp2, req);
 }
=20
-static uint16_t nvme_identify_ns_list(NvmeCtrl *n, NvmeIdentify *c)
+static uint16_t nvme_identify_ns_list(NvmeCtrl *n, NvmeIdentify *c,
+    NvmeRequest *req)
 {
     static const int data_len =3D 4 * KiB;
     uint32_t min_nsid =3D le32_to_cpu(c->nsid);
@@ -793,12 +843,13 @@ static uint16_t nvme_identify_ns_list(NvmeCtrl *n, =
NvmeIdentify *c)
             break;
         }
     }
-    ret =3D nvme_dma_read_prp(n, (uint8_t *)list, data_len, prp1, prp2);
+    ret =3D nvme_dma_read_prp(n, (uint8_t *)list, data_len, prp1, prp2, =
req);
     g_free(list);
     return ret;
 }
=20
-static uint16_t nvme_identify_ns_descriptor_list(NvmeCtrl *n, NvmeCmd *c=
)
+static uint16_t nvme_identify_ns_descriptor_list(NvmeCtrl *n, NvmeCmd *c=
,
+    NvmeRequest *req)
 {
     static const int data_len =3D sizeof(NvmeIdentifyNamespaceDescriptor=
) + 0x10;
     uint32_t nsid =3D le32_to_cpu(c->nsid);
@@ -813,24 +864,24 @@ static uint16_t nvme_identify_ns_descriptor_list(Nv=
meCtrl *n, NvmeCmd *c)
     list->nidt =3D 0x3;
     list->nidl =3D 0x10;
=20
-    ret =3D nvme_dma_read_prp(n, (uint8_t *) list, data_len, prp1, prp2)=
;
+    ret =3D nvme_dma_read_prp(n, (uint8_t *) list, data_len, prp1, prp2,=
 req);
     g_free(list);
     return ret;
 }
=20
-static uint16_t nvme_identify(NvmeCtrl *n, NvmeCmd *cmd)
+static uint16_t nvme_identify(NvmeCtrl *n, NvmeCmd *cmd, NvmeRequest *re=
q)
 {
     NvmeIdentify *c =3D (NvmeIdentify *)cmd;
=20
     switch (le32_to_cpu(c->cns)) {
     case 0x00:
-        return nvme_identify_ns(n, c);
+        return nvme_identify_ns(n, c, req);
     case 0x01:
-        return nvme_identify_ctrl(n, c);
+        return nvme_identify_ctrl(n, c, req);
     case 0x02:
-        return nvme_identify_ns_list(n, c);
+        return nvme_identify_ns_list(n, c, req);
     case 0x03:
-        return nvme_identify_ns_descriptor_list(n, cmd);
+        return nvme_identify_ns_descriptor_list(n, cmd, req);
     default:
         trace_nvme_err_invalid_identify_cns(le32_to_cpu(c->cns));
         return NVME_INVALID_FIELD | NVME_DNR;
@@ -971,7 +1022,7 @@ static uint16_t nvme_error_log_info(NvmeCtrl *n, Nvm=
eCmd *cmd, uint8_t rae,
     }
=20
     return nvme_dma_read_prp(n, (uint8_t *) n->elpes + off, trans_len, p=
rp1,
-        prp2);
+        prp2, req);
 }
=20
 static uint16_t nvme_smart_info(NvmeCtrl *n, NvmeCmd *cmd, uint8_t rae,
@@ -1014,7 +1065,7 @@ static uint16_t nvme_smart_info(NvmeCtrl *n, NvmeCm=
d *cmd, uint8_t rae,
     }
=20
     return nvme_dma_read_prp(n, (uint8_t *) &smart + off, trans_len, prp=
1,
-        prp2);
+        prp2, req);
 }
=20
 static uint16_t nvme_fw_log_info(NvmeCtrl *n, NvmeCmd *cmd, uint32_t buf=
_len,
@@ -1034,9 +1085,10 @@ static uint16_t nvme_fw_log_info(NvmeCtrl *n, Nvme=
Cmd *cmd, uint32_t buf_len,
     trans_len =3D MIN(sizeof(fw_log) - off, buf_len);
=20
     return nvme_dma_read_prp(n, (uint8_t *) &fw_log + off, trans_len, pr=
p1,
-        prp2);
+        prp2, req);
 }
=20
+
 static uint16_t nvme_get_log(NvmeCtrl *n, NvmeCmd *cmd, NvmeRequest *req=
)
 {
     uint32_t dw10 =3D le32_to_cpu(cmd->cdw10);
@@ -1150,7 +1202,7 @@ static uint16_t nvme_admin_cmd(NvmeCtrl *n, NvmeCmd=
 *cmd, NvmeRequest *req)
     case NVME_ADM_CMD_CREATE_CQ:
         return nvme_create_cq(n, cmd);
     case NVME_ADM_CMD_IDENTIFY:
-        return nvme_identify(n, cmd);
+        return nvme_identify(n, cmd, req);
     case NVME_ADM_CMD_SET_FEATURES:
         return nvme_set_feature(n, cmd, req);
     case NVME_ADM_CMD_GET_FEATURES:
@@ -1167,6 +1219,17 @@ static uint16_t nvme_admin_cmd(NvmeCtrl *n, NvmeCm=
d *cmd, NvmeRequest *req)
     }
 }
=20
+static void nvme_init_req(NvmeCtrl *n, NvmeCmd *cmd, NvmeRequest *req)
+{
+    memset(&req->cqe, 0, sizeof(req->cqe));
+    req->cqe.cid =3D le16_to_cpu(cmd->cid);
+
+    req->cmd_opcode =3D cmd->opcode;
+    req->is_cmb =3D false;
+
+    req->status =3D NVME_SUCCESS;
+}
+
 static void nvme_process_sq(void *opaque)
 {
     NvmeSQueue *sq =3D opaque;
@@ -1190,8 +1253,8 @@ static void nvme_process_sq(void *opaque)
         req =3D QTAILQ_FIRST(&sq->req_list);
         QTAILQ_REMOVE(&sq->req_list, req, entry);
         QTAILQ_INSERT_TAIL(&sq->out_req_list, req, entry);
-        memset(&req->cqe, 0, sizeof(req->cqe));
-        req->cqe.cid =3D cmd.cid;
+
+        nvme_init_req(n, &cmd, req);
=20
         status =3D sq->sqid ? nvme_io_cmd(n, &cmd, req) :
             nvme_admin_cmd(n, &cmd, req);
diff --git a/hw/block/nvme.h b/hw/block/nvme.h
index 8925a05445da..05217257ca3f 100644
--- a/hw/block/nvme.h
+++ b/hw/block/nvme.h
@@ -25,7 +25,8 @@ typedef struct NvmeRequest {
     struct NvmeSQueue       *sq;
     BlockAIOCB              *aiocb;
     uint16_t                status;
-    bool                    has_sg;
+    bool                    is_cmb;
+    uint8_t                 cmd_opcode;
     NvmeCqe                 cqe;
     BlockAcctCookie         acct;
     QEMUSGList              qsg;
diff --git a/hw/block/trace-events b/hw/block/trace-events
index abec518167d0..676a3a615c9d 100644
--- a/hw/block/trace-events
+++ b/hw/block/trace-events
@@ -35,6 +35,7 @@ nvme_irq_msix(uint32_t vector) "raising MSI-X IRQ vecto=
r %u"
 nvme_irq_pin(void) "pulsing IRQ pin"
 nvme_irq_masked(void) "IRQ is masked"
 nvme_dma_read(uint64_t prp1, uint64_t prp2) "DMA read, prp1=3D0x%"PRIx64=
" prp2=3D0x%"PRIx64""
+nvme_map_prp(uint8_t cmd_opcode, uint64_t trans_len, uint32_t len, uint6=
4_t prp1, uint64_t prp2, int num_prps) "cmd_opcode=3D0x%"PRIx8", trans_le=
n=3D%"PRIu64", len=3D%"PRIu32", prp1=3D0x%"PRIx64", prp2=3D0x%"PRIx64", n=
um_prps=3D%d"
 nvme_rw(const char *verb, uint32_t blk_count, uint64_t byte_count, uint6=
4_t lba) "%s %"PRIu32" blocks (%"PRIu64" bytes) from LBA %"PRIu64""
 nvme_create_sq(uint64_t addr, uint16_t sqid, uint16_t cqid, uint16_t qsi=
ze, uint16_t qflags) "create submission queue, addr=3D0x%"PRIx64", sqid=3D=
%"PRIu16", cqid=3D%"PRIu16", qsize=3D%"PRIu16", qflags=3D%"PRIu16""
 nvme_create_cq(uint64_t addr, uint16_t cqid, uint16_t vector, uint16_t s=
ize, uint16_t qflags, int ien) "create completion queue, addr=3D0x%"PRIx6=
4", cqid=3D%"PRIu16", vector=3D%"PRIu16", qsize=3D%"PRIu16", qflags=3D%"P=
RIu16", ien=3D%d"
diff --git a/include/block/nvme.h b/include/block/nvme.h
index 5a169e7ed7ac..c90c36b66971 100644
--- a/include/block/nvme.h
+++ b/include/block/nvme.h
@@ -427,6 +427,7 @@ enum NvmeStatusCodes {
     NVME_CMD_ABORT_MISSING_FUSE =3D 0x000a,
     NVME_INVALID_NSID           =3D 0x000b,
     NVME_CMD_SEQ_ERROR          =3D 0x000c,
+    NVME_INVALID_USE_OF_CMB     =3D 0x0012,
     NVME_LBA_RANGE              =3D 0x0080,
     NVME_CAP_EXCEEDED           =3D 0x0081,
     NVME_NS_NOT_READY           =3D 0x0082,
--=20
2.21.0


