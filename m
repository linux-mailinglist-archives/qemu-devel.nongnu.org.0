Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C8A471A92DB
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Apr 2020 08:04:46 +0200 (CEST)
Received: from localhost ([::1]:43674 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jObAD-0005im-Qr
	for lists+qemu-devel@lfdr.de; Wed, 15 Apr 2020 02:04:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35227)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <its@irrelevant.dk>) id 1jOayg-0001pt-Ib
 for qemu-devel@nongnu.org; Wed, 15 Apr 2020 01:52:52 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <its@irrelevant.dk>) id 1jOaye-0002df-Vp
 for qemu-devel@nongnu.org; Wed, 15 Apr 2020 01:52:50 -0400
Received: from charlie.dont.surf ([128.199.63.193]:47280)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <its@irrelevant.dk>)
 id 1jOayb-0002Qz-Dv; Wed, 15 Apr 2020 01:52:45 -0400
Received: from apples.local (80-167-98-190-cable.dk.customer.tdc.net
 [80.167.98.190])
 by charlie.dont.surf (Postfix) with ESMTPSA id 3E47EBF467;
 Wed, 15 Apr 2020 05:52:23 +0000 (UTC)
From: Klaus Jensen <its@irrelevant.dk>
To: qemu-block@nongnu.org
Subject: [PATCH v7 16/48] nvme: additional tracing
Date: Wed, 15 Apr 2020 07:51:08 +0200
Message-Id: <20200415055140.466900-17-its@irrelevant.dk>
X-Mailer: git-send-email 2.26.0
In-Reply-To: <20200415055140.466900-1-its@irrelevant.dk>
References: <20200415055140.466900-1-its@irrelevant.dk>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 128.199.63.193
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Kevin Wolf <kwolf@redhat.com>, Beata Michalska <beata.michalska@linaro.org>,
 Klaus Jensen <k.jensen@samsung.com>, qemu-devel@nongnu.org,
 Max Reitz <mreitz@redhat.com>, Klaus Jensen <its@irrelevant.dk>,
 Keith Busch <kbusch@kernel.org>, Javier Gonzalez <javier.gonz@samsung.com>,
 Maxim Levitsky <mlevitsk@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Klaus Jensen <k.jensen@samsung.com>

Also, streamline nvme_identify_ns and nvme_identify_ns_list. They do not
need to repeat the command, it is already in the trace name.

Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
---
 hw/block/nvme.c       | 20 ++++++++++++++++++++
 hw/block/trace-events | 13 +++++++++++--
 2 files changed, 31 insertions(+), 2 deletions(-)

diff --git a/hw/block/nvme.c b/hw/block/nvme.c
index e448a1c85cb9..7094767eeccb 100644
--- a/hw/block/nvme.c
+++ b/hw/block/nvme.c
@@ -320,6 +320,8 @@ static void nvme_post_cqes(void *opaque)
 static void nvme_enqueue_req_completion(NvmeCQueue *cq, NvmeRequest *req=
)
 {
     assert(cq->cqid =3D=3D req->sq->cqid);
+    trace_nvme_dev_enqueue_req_completion(nvme_cid(req), cq->cqid,
+                                          req->status);
     QTAILQ_REMOVE(&req->sq->out_req_list, req, entry);
     QTAILQ_INSERT_TAIL(&cq->req_list, req, entry);
     timer_mod(cq->timer, qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL) + 500);
@@ -411,6 +413,8 @@ static void nvme_rw_cb(void *opaque, int ret)
     NvmeCtrl *n =3D sq->ctrl;
     NvmeCQueue *cq =3D n->cq[sq->cqid];
=20
+    trace_nvme_dev_rw_cb(nvme_cid(req));
+
     if (!ret) {
         block_acct_done(blk_get_stats(n->conf.blk), &req->acct);
         req->status =3D NVME_SUCCESS;
@@ -446,6 +450,8 @@ static uint16_t nvme_write_zeros(NvmeCtrl *n, NvmeNam=
espace *ns, NvmeCmd *cmd,
     uint64_t offset =3D slba << data_shift;
     uint32_t count =3D nlb << data_shift;
=20
+    trace_nvme_dev_write_zeroes(nvme_cid(req), slba, nlb);
+
     if (unlikely(slba + nlb > ns->id_ns.nsze)) {
         trace_nvme_dev_err_invalid_lba_range(slba, nlb, ns->id_ns.nsze);
         return NVME_LBA_RANGE | NVME_DNR;
@@ -513,6 +519,9 @@ static uint16_t nvme_io_cmd(NvmeCtrl *n, NvmeCmd *cmd=
, NvmeRequest *req)
     NvmeNamespace *ns;
     uint32_t nsid =3D le32_to_cpu(cmd->nsid);
=20
+    trace_nvme_dev_io_cmd(nvme_cid(req), nsid, le16_to_cpu(req->sq->sqid=
),
+                          cmd->opcode);
+
     if (unlikely(nsid =3D=3D 0 || nsid > n->num_namespaces)) {
         trace_nvme_dev_err_invalid_ns(nsid, n->num_namespaces);
         return NVME_INVALID_NSID | NVME_DNR;
@@ -1200,6 +1209,9 @@ static uint16_t nvme_aer(NvmeCtrl *n, NvmeCmd *cmd,=
 NvmeRequest *req)
=20
 static uint16_t nvme_admin_cmd(NvmeCtrl *n, NvmeCmd *cmd, NvmeRequest *r=
eq)
 {
+    trace_nvme_dev_admin_cmd(nvme_cid(req), le16_to_cpu(req->sq->sqid),
+                             cmd->opcode);
+
     switch (cmd->opcode) {
     case NVME_ADM_CMD_DELETE_SQ:
         return nvme_del_sq(n, cmd);
@@ -1525,6 +1537,8 @@ static uint64_t nvme_mmio_read(void *opaque, hwaddr=
 addr, unsigned size)
     uint8_t *ptr =3D (uint8_t *)&n->bar;
     uint64_t val =3D 0;
=20
+    trace_nvme_dev_mmio_read(addr);
+
     if (unlikely(addr & (sizeof(uint32_t) - 1))) {
         NVME_GUEST_ERR(nvme_dev_ub_mmiord_misaligned32,
                        "MMIO read not 32-bit aligned,"
@@ -1599,6 +1613,8 @@ static void nvme_process_db(NvmeCtrl *n, hwaddr add=
r, int val)
             return;
         }
=20
+        trace_nvme_dev_mmio_doorbell_cq(cq->cqid, new_head);
+
         start_sqs =3D nvme_cq_full(cq) ? 1 : 0;
         cq->head =3D new_head;
         if (start_sqs) {
@@ -1651,6 +1667,8 @@ static void nvme_process_db(NvmeCtrl *n, hwaddr add=
r, int val)
             return;
         }
=20
+        trace_nvme_dev_mmio_doorbell_sq(sq->sqid, new_tail);
+
         sq->tail =3D new_tail;
         timer_mod(sq->timer, qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL) + 500=
);
     }
@@ -1659,6 +1677,8 @@ static void nvme_process_db(NvmeCtrl *n, hwaddr add=
r, int val)
 static void nvme_mmio_write(void *opaque, hwaddr addr, uint64_t data,
     unsigned size)
 {
+    trace_nvme_dev_mmio_write(addr, data);
+
     NvmeCtrl *n =3D (NvmeCtrl *)opaque;
     if (addr < sizeof(n->bar)) {
         nvme_write_bar(n, addr, data, size);
diff --git a/hw/block/trace-events b/hw/block/trace-events
index b6fde13419bf..659091fc2fed 100644
--- a/hw/block/trace-events
+++ b/hw/block/trace-events
@@ -33,14 +33,18 @@ nvme_dev_irq_msix(uint32_t vector) "raising MSI-X IRQ=
 vector %u"
 nvme_dev_irq_pin(void) "pulsing IRQ pin"
 nvme_dev_irq_masked(void) "IRQ is masked"
 nvme_dev_dma_read(uint64_t prp1, uint64_t prp2) "DMA read, prp1=3D0x%"PR=
Ix64" prp2=3D0x%"PRIx64""
+nvme_dev_io_cmd(uint16_t cid, uint32_t nsid, uint16_t sqid, uint8_t opco=
de) "cid %"PRIu16" nsid %"PRIu32" sqid %"PRIu16" opc 0x%"PRIx8""
+nvme_dev_admin_cmd(uint16_t cid, uint16_t sqid, uint8_t opcode) "cid %"P=
RIu16" sqid %"PRIu16" opc 0x%"PRIx8""
 nvme_dev_rw(const char *verb, uint32_t blk_count, uint64_t byte_count, u=
int64_t lba) "%s %"PRIu32" blocks (%"PRIu64" bytes) from LBA %"PRIu64""
+nvme_dev_rw_cb(uint16_t cid) "cid %"PRIu16""
+nvme_dev_write_zeroes(uint16_t cid, uint64_t slba, uint32_t nlb) "cid %"=
PRIu16" slba %"PRIu64" nlb %"PRIu32""
 nvme_dev_create_sq(uint64_t addr, uint16_t sqid, uint16_t cqid, uint16_t=
 qsize, uint16_t qflags) "create submission queue, addr=3D0x%"PRIx64", sq=
id=3D%"PRIu16", cqid=3D%"PRIu16", qsize=3D%"PRIu16", qflags=3D%"PRIu16""
 nvme_dev_create_cq(uint64_t addr, uint16_t cqid, uint16_t vector, uint16=
_t size, uint16_t qflags, int ien) "create completion queue, addr=3D0x%"P=
RIx64", cqid=3D%"PRIu16", vector=3D%"PRIu16", qsize=3D%"PRIu16", qflags=3D=
%"PRIu16", ien=3D%d"
 nvme_dev_del_sq(uint16_t qid) "deleting submission queue sqid=3D%"PRIu16=
""
 nvme_dev_del_cq(uint16_t cqid) "deleted completion queue, cqid=3D%"PRIu1=
6""
 nvme_dev_identify_ctrl(void) "identify controller"
-nvme_dev_identify_ns(uint16_t ns) "identify namespace, nsid=3D%"PRIu16""
-nvme_dev_identify_nslist(uint16_t ns) "identify namespace list, nsid=3D%=
"PRIu16""
+nvme_dev_identify_ns(uint32_t ns) "nsid %"PRIu32""
+nvme_dev_identify_nslist(uint32_t ns) "nsid %"PRIu32""
 nvme_dev_getfeat(uint16_t cid, uint32_t fid) "cid %"PRIu16" fid 0x%"PRIx=
32""
 nvme_dev_setfeat(uint16_t cid, uint32_t fid, uint32_t val) "cid %"PRIu16=
" fid 0x%"PRIx32" val 0x%"PRIx32""
 nvme_dev_getfeat_vwcache(const char* result) "get feature volatile write=
 cache, result=3D%s"
@@ -54,10 +58,13 @@ nvme_dev_aer(uint16_t cid) "cid %"PRIu16""
 nvme_dev_aer_aerl_exceeded(void) "aerl exceeded"
 nvme_dev_aer_masked(uint8_t type, uint8_t mask) "type 0x%"PRIx8" mask 0x=
%"PRIx8""
 nvme_dev_aer_post_cqe(uint8_t typ, uint8_t info, uint8_t log_page) "type=
 0x%"PRIx8" info 0x%"PRIx8" lid 0x%"PRIx8""
+nvme_dev_enqueue_req_completion(uint16_t cid, uint16_t cqid, uint16_t st=
atus) "cid %"PRIu16" cqid %"PRIu16" status 0x%"PRIx16""
 nvme_dev_enqueue_event(uint8_t typ, uint8_t info, uint8_t log_page) "typ=
e 0x%"PRIx8" info 0x%"PRIx8" lid 0x%"PRIx8""
 nvme_dev_enqueue_event_noqueue(int queued) "queued %d"
 nvme_dev_enqueue_event_masked(uint8_t typ) "type 0x%"PRIx8""
 nvme_dev_no_outstanding_aers(void) "ignoring event; no outstanding AERs"
+nvme_dev_mmio_read(uint64_t addr) "addr 0x%"PRIx64""
+nvme_dev_mmio_write(uint64_t addr, uint64_t data) "addr 0x%"PRIx64" data=
 0x%"PRIx64""
 nvme_dev_mmio_intm_set(uint64_t data, uint64_t new_mask) "wrote MMIO, in=
terrupt mask set, data=3D0x%"PRIx64", new_mask=3D0x%"PRIx64""
 nvme_dev_mmio_intm_clr(uint64_t data, uint64_t new_mask) "wrote MMIO, in=
terrupt mask clr, data=3D0x%"PRIx64", new_mask=3D0x%"PRIx64""
 nvme_dev_mmio_cfg(uint64_t data) "wrote MMIO, config controller config=3D=
0x%"PRIx64""
@@ -70,6 +77,8 @@ nvme_dev_mmio_start_success(void) "setting controller e=
nable bit succeeded"
 nvme_dev_mmio_stopped(void) "cleared controller enable bit"
 nvme_dev_mmio_shutdown_set(void) "shutdown bit set"
 nvme_dev_mmio_shutdown_cleared(void) "shutdown bit cleared"
+nvme_dev_mmio_doorbell_cq(uint16_t cqid, uint16_t new_head) "cqid %"PRIu=
16" new_head %"PRIu16""
+nvme_dev_mmio_doorbell_sq(uint16_t sqid, uint16_t new_tail) "cqid %"PRIu=
16" new_tail %"PRIu16""
=20
 # nvme traces for error conditions
 nvme_dev_err_invalid_dma(void) "PRP/SGL is too small for transfer size"
--=20
2.26.0


