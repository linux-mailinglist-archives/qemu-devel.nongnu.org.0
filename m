Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 15A23D73F7
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Oct 2019 12:54:33 +0200 (CEST)
Received: from localhost ([::1]:40696 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iKKTG-0006pi-6a
	for lists+qemu-devel@lfdr.de; Tue, 15 Oct 2019 06:54:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48160)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <its@irrelevant.dk>) id 1iKKF3-0007yr-PO
 for qemu-devel@nongnu.org; Tue, 15 Oct 2019 06:39:53 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <its@irrelevant.dk>) id 1iKKF1-0006hF-0U
 for qemu-devel@nongnu.org; Tue, 15 Oct 2019 06:39:49 -0400
Received: from charlie.dont.surf ([128.199.63.193]:54966)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <its@irrelevant.dk>)
 id 1iKKEt-0006Gu-UI; Tue, 15 Oct 2019 06:39:40 -0400
Received: from apples.localdomain (unknown [194.62.217.57])
 by charlie.dont.surf (Postfix) with ESMTPSA id BF900BF6BA;
 Tue, 15 Oct 2019 10:39:18 +0000 (UTC)
From: Klaus Jensen <its@irrelevant.dk>
To: qemu-block@nongnu.org
Subject: [PATCH v2 18/20] nvme: remove redundant NvmeCmd pointer parameter
Date: Tue, 15 Oct 2019 12:38:58 +0200
Message-Id: <20191015103900.313928-19-its@irrelevant.dk>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191015103900.313928-1-its@irrelevant.dk>
References: <20191015103900.313928-1-its@irrelevant.dk>
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
Cc: Kevin Wolf <kwolf@redhat.com>, Fam Zheng <fam@euphon.net>,
 Javier Gonzalez <javier@javigon.com>, qemu-devel@nongnu.org,
 Max Reitz <mreitz@redhat.com>, Keith Busch <keith.busch@intel.com>,
 Paul Durrant <Paul.Durrant@citrix.com>, Stephen Bates <sbates@raithlin.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The command struct is available in the NvmeRequest that we generally
pass around anyway.

Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
---
 hw/block/nvme.c | 219 +++++++++++++++++++++++-------------------------
 1 file changed, 106 insertions(+), 113 deletions(-)

diff --git a/hw/block/nvme.c b/hw/block/nvme.c
index bcd801c345b6..67f92bf5a3ac 100644
--- a/hw/block/nvme.c
+++ b/hw/block/nvme.c
@@ -574,14 +574,14 @@ static uint16_t nvme_dma_write_sgl(NvmeCtrl *n, uin=
t8_t *ptr, uint32_t len,
 }
=20
 static uint16_t nvme_dma_write(NvmeCtrl *n, uint8_t *ptr, uint32_t len,
-    NvmeCmd *cmd, NvmeRequest *req)
+    NvmeRequest *req)
 {
-    if (NVME_CMD_FLAGS_PSDT(cmd->flags)) {
-        return nvme_dma_write_sgl(n, ptr, len, cmd->dptr.sgl, req);
+    if (NVME_CMD_FLAGS_PSDT(req->cmd.flags)) {
+        return nvme_dma_write_sgl(n, ptr, len, req->cmd.dptr.sgl, req);
     }
=20
-    uint64_t prp1 =3D le64_to_cpu(cmd->dptr.prp.prp1);
-    uint64_t prp2 =3D le64_to_cpu(cmd->dptr.prp.prp2);
+    uint64_t prp1 =3D le64_to_cpu(req->cmd.dptr.prp.prp1);
+    uint64_t prp2 =3D le64_to_cpu(req->cmd.dptr.prp.prp2);
=20
     return nvme_dma_write_prp(n, ptr, len, prp1, prp2, req);
 }
@@ -624,7 +624,7 @@ out:
 }
=20
 static uint16_t nvme_dma_read_sgl(NvmeCtrl *n, uint8_t *ptr, uint32_t le=
n,
-    NvmeSglDescriptor sgl, NvmeCmd *cmd, NvmeRequest *req)
+    NvmeSglDescriptor sgl, NvmeRequest *req)
 {
     QEMUSGList qsg;
     uint16_t err =3D NVME_SUCCESS;
@@ -662,29 +662,29 @@ out:
 }
=20
 static uint16_t nvme_dma_read(NvmeCtrl *n, uint8_t *ptr, uint32_t len,
-    NvmeCmd *cmd, NvmeRequest *req)
+    NvmeRequest *req)
 {
-    if (NVME_CMD_FLAGS_PSDT(cmd->flags)) {
-        return nvme_dma_read_sgl(n, ptr, len, cmd->dptr.sgl, cmd, req);
+    if (NVME_CMD_FLAGS_PSDT(req->cmd.flags)) {
+        return nvme_dma_read_sgl(n, ptr, len, req->cmd.dptr.sgl, req);
     }
=20
-    uint64_t prp1 =3D le64_to_cpu(cmd->dptr.prp.prp1);
-    uint64_t prp2 =3D le64_to_cpu(cmd->dptr.prp.prp2);
+    uint64_t prp1 =3D le64_to_cpu(req->cmd.dptr.prp.prp1);
+    uint64_t prp2 =3D le64_to_cpu(req->cmd.dptr.prp.prp2);
=20
     return nvme_dma_read_prp(n, ptr, len, prp1, prp2, req);
 }
=20
-static uint16_t nvme_map(NvmeCtrl *n, NvmeCmd *cmd, NvmeRequest *req)
+static uint16_t nvme_map(NvmeCtrl *n, NvmeRequest *req)
 {
     uint32_t len =3D req->nlb << nvme_ns_lbads(req->ns);
     uint64_t prp1, prp2;
=20
-    if (NVME_CMD_FLAGS_PSDT(cmd->flags)) {
-        return nvme_map_sgl(n, &req->qsg, cmd->dptr.sgl, len, req);
+    if (NVME_CMD_FLAGS_PSDT(req->cmd.flags)) {
+        return nvme_map_sgl(n, &req->qsg, req->cmd.dptr.sgl, len, req);
     }
=20
-    prp1 =3D le64_to_cpu(cmd->dptr.prp.prp1);
-    prp2 =3D le64_to_cpu(cmd->dptr.prp.prp2);
+    prp1 =3D le64_to_cpu(req->cmd.dptr.prp.prp1);
+    prp2 =3D le64_to_cpu(req->cmd.dptr.prp.prp2);
=20
     return nvme_map_prp(n, &req->qsg, prp1, prp2, len, req);
 }
@@ -1045,7 +1045,7 @@ static uint16_t nvme_check_rw(NvmeCtrl *n, NvmeRequ=
est *req)
     return NVME_SUCCESS;
 }
=20
-static uint16_t nvme_flush(NvmeCtrl *n, NvmeCmd *cmd, NvmeRequest *req)
+static uint16_t nvme_flush(NvmeCtrl *n, NvmeRequest *req)
 {
     NvmeNamespace *ns =3D req->ns;
=20
@@ -1057,12 +1057,12 @@ static uint16_t nvme_flush(NvmeCtrl *n, NvmeCmd *=
cmd, NvmeRequest *req)
     return NVME_NO_COMPLETE;
 }
=20
-static uint16_t nvme_write_zeros(NvmeCtrl *n, NvmeCmd *cmd, NvmeRequest =
*req)
+static uint16_t nvme_write_zeros(NvmeCtrl *n, NvmeRequest *req)
 {
     NvmeAIO *aio;
=20
     NvmeNamespace *ns =3D req->ns;
-    NvmeRwCmd *rw =3D (NvmeRwCmd *) cmd;
+    NvmeRwCmd *rw =3D (NvmeRwCmd *) &req->cmd;
=20
     int64_t offset;
     size_t count;
@@ -1092,9 +1092,9 @@ static uint16_t nvme_write_zeros(NvmeCtrl *n, NvmeC=
md *cmd, NvmeRequest *req)
     return NVME_NO_COMPLETE;
 }
=20
-static uint16_t nvme_rw(NvmeCtrl *n, NvmeCmd *cmd, NvmeRequest *req)
+static uint16_t nvme_rw(NvmeCtrl *n, NvmeRequest *req)
 {
-    NvmeRwCmd *rw =3D (NvmeRwCmd *) cmd;
+    NvmeRwCmd *rw =3D (NvmeRwCmd *) &req->cmd;
     NvmeNamespace *ns =3D req->ns;
     int status;
=20
@@ -1114,7 +1114,7 @@ static uint16_t nvme_rw(NvmeCtrl *n, NvmeCmd *cmd, =
NvmeRequest *req)
         return status;
     }
=20
-    status =3D nvme_map(n, cmd, req);
+    status =3D nvme_map(n, req);
     if (status) {
         block_acct_invalid(blk_get_stats(ns->conf.blk), acct);
         return status;
@@ -1126,11 +1126,12 @@ static uint16_t nvme_rw(NvmeCtrl *n, NvmeCmd *cmd=
, NvmeRequest *req)
     return NVME_NO_COMPLETE;
 }
=20
-static uint16_t nvme_io_cmd(NvmeCtrl *n, NvmeCmd *cmd, NvmeRequest *req)
+static uint16_t nvme_io_cmd(NvmeCtrl *n, NvmeRequest *req)
 {
-    uint32_t nsid =3D le32_to_cpu(cmd->nsid);
+    uint32_t nsid =3D le32_to_cpu(req->cmd.nsid);
=20
-    trace_nvme_io_cmd(req->cid, nsid, le16_to_cpu(req->sq->sqid), cmd->o=
pcode);
+    trace_nvme_io_cmd(req->cid, nsid, le16_to_cpu(req->sq->sqid),
+        req->cmd.opcode);
=20
     req->ns =3D nvme_ns(n, nsid);
=20
@@ -1139,16 +1140,16 @@ static uint16_t nvme_io_cmd(NvmeCtrl *n, NvmeCmd =
*cmd, NvmeRequest *req)
         return NVME_INVALID_NSID | NVME_DNR;
     }
=20
-    switch (cmd->opcode) {
+    switch (req->cmd.opcode) {
     case NVME_CMD_FLUSH:
-        return nvme_flush(n, cmd, req);
+        return nvme_flush(n, req);
     case NVME_CMD_WRITE_ZEROS:
-        return nvme_write_zeros(n, cmd, req);
+        return nvme_write_zeros(n, req);
     case NVME_CMD_WRITE:
     case NVME_CMD_READ:
-        return nvme_rw(n, cmd, req);
+        return nvme_rw(n, req);
     default:
-        trace_nvme_err_invalid_opc(cmd->opcode);
+        trace_nvme_err_invalid_opc(req->cmd.opcode);
         return NVME_INVALID_OPCODE | NVME_DNR;
     }
 }
@@ -1165,10 +1166,10 @@ static void nvme_free_sq(NvmeSQueue *sq, NvmeCtrl=
 *n)
     n->qs_created--;
 }
=20
-static uint16_t nvme_del_sq(NvmeCtrl *n, NvmeCmd *cmd)
+static uint16_t nvme_del_sq(NvmeCtrl *n, NvmeRequest *req)
 {
-    NvmeDeleteQ *c =3D (NvmeDeleteQ *)cmd;
-    NvmeRequest *req, *next;
+    NvmeDeleteQ *c =3D (NvmeDeleteQ *) &req->cmd;
+    NvmeRequest *next;
     NvmeSQueue *sq;
     NvmeCQueue *cq;
     NvmeAIO *aio;
@@ -1237,10 +1238,10 @@ static void nvme_init_sq(NvmeSQueue *sq, NvmeCtrl=
 *n, uint64_t dma_addr,
     n->qs_created++;
 }
=20
-static uint16_t nvme_create_sq(NvmeCtrl *n, NvmeCmd *cmd)
+static uint16_t nvme_create_sq(NvmeCtrl *n, NvmeRequest *req)
 {
     NvmeSQueue *sq;
-    NvmeCreateSq *c =3D (NvmeCreateSq *)cmd;
+    NvmeCreateSq *c =3D (NvmeCreateSq *) &req->cmd;
=20
     uint16_t cqid =3D le16_to_cpu(c->cqid);
     uint16_t sqid =3D le16_to_cpu(c->sqid);
@@ -1275,8 +1276,8 @@ static uint16_t nvme_create_sq(NvmeCtrl *n, NvmeCmd=
 *cmd)
     return NVME_SUCCESS;
 }
=20
-static uint16_t nvme_error_info(NvmeCtrl *n, NvmeCmd *cmd, uint8_t rae,
-    uint32_t buf_len, uint64_t off, NvmeRequest *req)
+static uint16_t nvme_error_info(NvmeCtrl *n, uint8_t rae, uint32_t buf_l=
en,
+    uint64_t off, NvmeRequest *req)
 {
     uint32_t trans_len;
=20
@@ -1290,13 +1291,13 @@ static uint16_t nvme_error_info(NvmeCtrl *n, Nvme=
Cmd *cmd, uint8_t rae,
         nvme_clear_events(n, NVME_AER_TYPE_ERROR);
     }
=20
-    return nvme_dma_read(n, (uint8_t *) n->elpes + off, trans_len, cmd, =
req);
+    return nvme_dma_read(n, (uint8_t *) n->elpes + off, trans_len, req);
 }
=20
-static uint16_t nvme_smart_info(NvmeCtrl *n, NvmeCmd *cmd, uint8_t rae,
-    uint32_t buf_len, uint64_t off, NvmeRequest *req)
+static uint16_t nvme_smart_info(NvmeCtrl *n, uint8_t rae, uint32_t buf_l=
en,
+    uint64_t off, NvmeRequest *req)
 {
-    uint32_t nsid =3D le32_to_cpu(cmd->nsid);
+    uint32_t nsid =3D le32_to_cpu(req->cmd.nsid);
=20
     uint32_t trans_len;
     time_t current_ms;
@@ -1352,11 +1353,11 @@ static uint16_t nvme_smart_info(NvmeCtrl *n, Nvme=
Cmd *cmd, uint8_t rae,
         nvme_clear_events(n, NVME_AER_TYPE_SMART);
     }
=20
-    return nvme_dma_read(n, (uint8_t *) &smart + off, trans_len, cmd, re=
q);
+    return nvme_dma_read(n, (uint8_t *) &smart + off, trans_len, req);
 }
=20
-static uint16_t nvme_fw_log_info(NvmeCtrl *n, NvmeCmd *cmd, uint32_t buf=
_len,
-    uint64_t off, NvmeRequest *req)
+static uint16_t nvme_fw_log_info(NvmeCtrl *n, uint32_t buf_len, uint64_t=
 off,
+    NvmeRequest *req)
 {
     uint32_t trans_len;
     NvmeFwSlotInfoLog fw_log;
@@ -1369,15 +1370,15 @@ static uint16_t nvme_fw_log_info(NvmeCtrl *n, Nvm=
eCmd *cmd, uint32_t buf_len,
=20
     trans_len =3D MIN(sizeof(fw_log) - off, buf_len);
=20
-    return nvme_dma_read(n, (uint8_t *) &fw_log + off, trans_len, cmd, r=
eq);
+    return nvme_dma_read(n, (uint8_t *) &fw_log + off, trans_len, req);
 }
=20
-static uint16_t nvme_get_log(NvmeCtrl *n, NvmeCmd *cmd, NvmeRequest *req=
)
+static uint16_t nvme_get_log(NvmeCtrl *n, NvmeRequest *req)
 {
-    uint32_t dw10 =3D le32_to_cpu(cmd->cdw10);
-    uint32_t dw11 =3D le32_to_cpu(cmd->cdw11);
-    uint32_t dw12 =3D le32_to_cpu(cmd->cdw12);
-    uint32_t dw13 =3D le32_to_cpu(cmd->cdw13);
+    uint32_t dw10 =3D le32_to_cpu(req->cmd.cdw10);
+    uint32_t dw11 =3D le32_to_cpu(req->cmd.cdw11);
+    uint32_t dw12 =3D le32_to_cpu(req->cmd.cdw12);
+    uint32_t dw13 =3D le32_to_cpu(req->cmd.cdw13);
     uint8_t  lid =3D dw10 & 0xff;
     uint8_t  lsp =3D (dw10 >> 8) & 0xf;
     uint8_t  rae =3D (dw10 >> 15) & 0x1;
@@ -1407,11 +1408,11 @@ static uint16_t nvme_get_log(NvmeCtrl *n, NvmeCmd=
 *cmd, NvmeRequest *req)
=20
     switch (lid) {
     case NVME_LOG_ERROR_INFO:
-        return nvme_error_info(n, cmd, rae, len, off, req);
+        return nvme_error_info(n, rae, len, off, req);
     case NVME_LOG_SMART_INFO:
-        return nvme_smart_info(n, cmd, rae, len, off, req);
+        return nvme_smart_info(n, rae, len, off, req);
     case NVME_LOG_FW_SLOT_INFO:
-        return nvme_fw_log_info(n, cmd, len, off, req);
+        return nvme_fw_log_info(n, len, off, req);
     default:
         trace_nvme_err_invalid_log_page(req->cid, lid);
         return NVME_INVALID_LOG_ID | NVME_DNR;
@@ -1430,9 +1431,9 @@ static void nvme_free_cq(NvmeCQueue *cq, NvmeCtrl *=
n)
     n->qs_created--;
 }
=20
-static uint16_t nvme_del_cq(NvmeCtrl *n, NvmeCmd *cmd)
+static uint16_t nvme_del_cq(NvmeCtrl *n, NvmeRequest *req)
 {
-    NvmeDeleteQ *c =3D (NvmeDeleteQ *)cmd;
+    NvmeDeleteQ *c =3D (NvmeDeleteQ *) &req->cmd;
     NvmeCQueue *cq;
     uint16_t qid =3D le16_to_cpu(c->qid);
=20
@@ -1471,10 +1472,10 @@ static void nvme_init_cq(NvmeCQueue *cq, NvmeCtrl=
 *n, uint64_t dma_addr,
     n->qs_created++;
 }
=20
-static uint16_t nvme_create_cq(NvmeCtrl *n, NvmeCmd *cmd)
+static uint16_t nvme_create_cq(NvmeCtrl *n, NvmeRequest *req)
 {
     NvmeCQueue *cq;
-    NvmeCreateCq *c =3D (NvmeCreateCq *)cmd;
+    NvmeCreateCq *c =3D (NvmeCreateCq *) &req->cmd;
     uint16_t cqid =3D le16_to_cpu(c->cqid);
     uint16_t vector =3D le16_to_cpu(c->irq_vector);
     uint16_t qsize =3D le16_to_cpu(c->qsize);
@@ -1511,17 +1512,16 @@ static uint16_t nvme_create_cq(NvmeCtrl *n, NvmeC=
md *cmd)
     return NVME_SUCCESS;
 }
=20
-static uint16_t nvme_identify_ctrl(NvmeCtrl *n, NvmeCmd *cmd, NvmeReques=
t *req)
+static uint16_t nvme_identify_ctrl(NvmeCtrl *n, NvmeRequest *req)
 {
     trace_nvme_identify_ctrl();
=20
-    return nvme_dma_read(n, (uint8_t *) &n->id_ctrl, sizeof(n->id_ctrl),=
 cmd,
-        req);
+    return nvme_dma_read(n, (uint8_t *) &n->id_ctrl, sizeof(n->id_ctrl),=
 req);
 }
=20
-static uint16_t nvme_identify_ns(NvmeCtrl *n, NvmeCmd *cmd, NvmeRequest =
*req)
+static uint16_t nvme_identify_ns(NvmeCtrl *n, NvmeRequest *req)
 {
-    uint32_t nsid =3D le32_to_cpu(cmd->nsid);
+    uint32_t nsid =3D le32_to_cpu(req->cmd.nsid);
     NvmeNamespace *ns =3D nvme_ns(n, nsid);
=20
     trace_nvme_identify_ns(nsid);
@@ -1531,15 +1531,13 @@ static uint16_t nvme_identify_ns(NvmeCtrl *n, Nvm=
eCmd *cmd, NvmeRequest *req)
         return NVME_INVALID_NSID | NVME_DNR;
     }
=20
-    return nvme_dma_read(n, (uint8_t *) &ns->id_ns, sizeof(ns->id_ns), c=
md,
-        req);
+    return nvme_dma_read(n, (uint8_t *) &ns->id_ns, sizeof(ns->id_ns), r=
eq);
 }
=20
-static uint16_t nvme_identify_ns_list(NvmeCtrl *n, NvmeCmd *cmd,
-    NvmeRequest *req)
+static uint16_t nvme_identify_ns_list(NvmeCtrl *n, NvmeRequest *req)
 {
     static const int data_len =3D 4 * KiB;
-    uint32_t min_nsid =3D le32_to_cpu(cmd->nsid);
+    uint32_t min_nsid =3D le32_to_cpu(req->cmd.nsid);
     uint32_t *list;
     uint16_t ret;
     int i, j =3D 0;
@@ -1556,13 +1554,12 @@ static uint16_t nvme_identify_ns_list(NvmeCtrl *n=
, NvmeCmd *cmd,
             break;
         }
     }
-    ret =3D nvme_dma_read(n, (uint8_t *) list, data_len, cmd, req);
+    ret =3D nvme_dma_read(n, (uint8_t *) list, data_len, req);
     g_free(list);
     return ret;
 }
=20
-static uint16_t nvme_identify_ns_descr_list(NvmeCtrl *n, NvmeCmd *cmd,
-    NvmeRequest *req)
+static uint16_t nvme_identify_ns_descr_list(NvmeCtrl *n, NvmeRequest *re=
q)
 {
     static const int len =3D 4096;
=20
@@ -1573,7 +1570,7 @@ static uint16_t nvme_identify_ns_descr_list(NvmeCtr=
l *n, NvmeCmd *cmd,
         uint8_t nid[16];
     };
=20
-    uint32_t nsid =3D le32_to_cpu(cmd->nsid);
+    uint32_t nsid =3D le32_to_cpu(req->cmd.nsid);
=20
     struct ns_descr *list;
     uint16_t ret;
@@ -1590,33 +1587,33 @@ static uint16_t nvme_identify_ns_descr_list(NvmeC=
trl *n, NvmeCmd *cmd,
     list->nidl =3D 0x10;
     *(uint32_t *) &list->nid[12] =3D cpu_to_be32(nsid);
=20
-    ret =3D nvme_dma_read(n, (uint8_t *) list, len, cmd, req);
+    ret =3D nvme_dma_read(n, (uint8_t *) list, len, req);
     g_free(list);
     return ret;
 }
=20
-static uint16_t nvme_identify(NvmeCtrl *n, NvmeCmd *cmd, NvmeRequest *re=
q)
+static uint16_t nvme_identify(NvmeCtrl *n, NvmeRequest *req)
 {
-    NvmeIdentify *c =3D (NvmeIdentify *)cmd;
+    NvmeIdentify *c =3D (NvmeIdentify *) &req->cmd;
=20
     switch (le32_to_cpu(c->cns)) {
     case 0x00:
-        return nvme_identify_ns(n, cmd, req);
+        return nvme_identify_ns(n, req);
     case 0x01:
-        return nvme_identify_ctrl(n, cmd, req);
+        return nvme_identify_ctrl(n, req);
     case 0x02:
-        return nvme_identify_ns_list(n, cmd, req);
+        return nvme_identify_ns_list(n, req);
     case 0x03:
-        return nvme_identify_ns_descr_list(n, cmd, req);
+        return nvme_identify_ns_descr_list(n, req);
     default:
         trace_nvme_err_invalid_identify_cns(le32_to_cpu(c->cns));
         return NVME_INVALID_FIELD | NVME_DNR;
     }
 }
=20
-static uint16_t nvme_abort(NvmeCtrl *n, NvmeCmd *cmd, NvmeRequest *req)
+static uint16_t nvme_abort(NvmeCtrl *n, NvmeRequest *req)
 {
-    uint16_t sqid =3D le32_to_cpu(cmd->cdw10) & 0xffff;
+    uint16_t sqid =3D le32_to_cpu(req->cmd.cdw10) & 0xffff;
=20
     req->cqe.result =3D 1;
     if (nvme_check_sqid(n, sqid)) {
@@ -1666,21 +1663,19 @@ static inline uint64_t nvme_get_timestamp(const N=
vmeCtrl *n)
     return cpu_to_le64(ts.all);
 }
=20
-static uint16_t nvme_get_feature_timestamp(NvmeCtrl *n, NvmeCmd *cmd,
-    NvmeRequest *req)
+static uint16_t nvme_get_feature_timestamp(NvmeCtrl *n, NvmeRequest *req=
)
 {
     uint64_t timestamp =3D nvme_get_timestamp(n);
=20
-    return nvme_dma_read(n, (uint8_t *)&timestamp, sizeof(timestamp), cm=
d,
-        req);
+    return nvme_dma_read(n, (uint8_t *)&timestamp, sizeof(timestamp), re=
q);
 }
=20
-static uint16_t nvme_get_feature(NvmeCtrl *n, NvmeCmd *cmd, NvmeRequest =
*req)
+static uint16_t nvme_get_feature(NvmeCtrl *n, NvmeRequest *req)
 {
     NvmeNamespace *ns;
=20
-    uint32_t dw10 =3D le32_to_cpu(cmd->cdw10);
-    uint32_t dw11 =3D le32_to_cpu(cmd->cdw11);
+    uint32_t dw10 =3D le32_to_cpu(req->cmd.cdw10);
+    uint32_t dw11 =3D le32_to_cpu(req->cmd.cdw11);
     uint32_t result, nsid;
=20
     trace_nvme_getfeat(dw10);
@@ -1716,7 +1711,7 @@ static uint16_t nvme_get_feature(NvmeCtrl *n, NvmeC=
md *cmd, NvmeRequest *req)
         trace_nvme_getfeat_numq(result);
         break;
     case NVME_TIMESTAMP:
-        return nvme_get_feature_timestamp(n, cmd, req);
+        return nvme_get_feature_timestamp(n, req);
     case NVME_INTERRUPT_COALESCING:
         result =3D cpu_to_le32(n->features.int_coalescing);
         break;
@@ -1742,14 +1737,12 @@ static uint16_t nvme_get_feature(NvmeCtrl *n, Nvm=
eCmd *cmd, NvmeRequest *req)
     return NVME_SUCCESS;
 }
=20
-static uint16_t nvme_set_feature_timestamp(NvmeCtrl *n, NvmeCmd *cmd,
-    NvmeRequest *req)
+static uint16_t nvme_set_feature_timestamp(NvmeCtrl *n, NvmeRequest *req=
)
 {
     uint16_t ret;
     uint64_t timestamp;
=20
-    ret =3D nvme_dma_write(n, (uint8_t *)&timestamp, sizeof(timestamp), =
cmd,
-        req);
+    ret =3D nvme_dma_write(n, (uint8_t *)&timestamp, sizeof(timestamp), =
req);
     if (ret !=3D NVME_SUCCESS) {
         return ret;
     }
@@ -1759,12 +1752,12 @@ static uint16_t nvme_set_feature_timestamp(NvmeCt=
rl *n, NvmeCmd *cmd,
     return NVME_SUCCESS;
 }
=20
-static uint16_t nvme_set_feature(NvmeCtrl *n, NvmeCmd *cmd, NvmeRequest =
*req)
+static uint16_t nvme_set_feature(NvmeCtrl *n, NvmeRequest *req)
 {
     NvmeNamespace *ns;
=20
-    uint32_t dw10 =3D le32_to_cpu(cmd->cdw10);
-    uint32_t dw11 =3D le32_to_cpu(cmd->cdw11);
+    uint32_t dw10 =3D le32_to_cpu(req->cmd.cdw10);
+    uint32_t dw11 =3D le32_to_cpu(req->cmd.cdw11);
     uint32_t nsid;
=20
     trace_nvme_setfeat(dw10, dw11);
@@ -1808,7 +1801,7 @@ static uint16_t nvme_set_feature(NvmeCtrl *n, NvmeC=
md *cmd, NvmeRequest *req)
             ((n->params.num_queues - 2) << 16));
         break;
     case NVME_TIMESTAMP:
-        return nvme_set_feature_timestamp(n, cmd, req);
+        return nvme_set_feature_timestamp(n, req);
     case NVME_ASYNCHRONOUS_EVENT_CONF:
         n->features.async_config =3D dw11;
         break;
@@ -1827,7 +1820,7 @@ static uint16_t nvme_set_feature(NvmeCtrl *n, NvmeC=
md *cmd, NvmeRequest *req)
     return NVME_SUCCESS;
 }
=20
-static uint16_t nvme_aer(NvmeCtrl *n, NvmeCmd *cmd, NvmeRequest *req)
+static uint16_t nvme_aer(NvmeCtrl *n, NvmeRequest *req)
 {
     trace_nvme_aer(req->cid);
=20
@@ -1843,31 +1836,31 @@ static uint16_t nvme_aer(NvmeCtrl *n, NvmeCmd *cm=
d, NvmeRequest *req)
     return NVME_NO_COMPLETE;
 }
=20
-static uint16_t nvme_admin_cmd(NvmeCtrl *n, NvmeCmd *cmd, NvmeRequest *r=
eq)
+static uint16_t nvme_admin_cmd(NvmeCtrl *n, NvmeRequest *req)
 {
-    switch (cmd->opcode) {
+    switch (req->cmd.opcode) {
     case NVME_ADM_CMD_DELETE_SQ:
-        return nvme_del_sq(n, cmd);
+        return nvme_del_sq(n, req);
     case NVME_ADM_CMD_CREATE_SQ:
-        return nvme_create_sq(n, cmd);
+        return nvme_create_sq(n, req);
     case NVME_ADM_CMD_GET_LOG_PAGE:
-        return nvme_get_log(n, cmd, req);
+        return nvme_get_log(n, req);
     case NVME_ADM_CMD_DELETE_CQ:
-        return nvme_del_cq(n, cmd);
+        return nvme_del_cq(n, req);
     case NVME_ADM_CMD_CREATE_CQ:
-        return nvme_create_cq(n, cmd);
+        return nvme_create_cq(n, req);
     case NVME_ADM_CMD_IDENTIFY:
-        return nvme_identify(n, cmd, req);
+        return nvme_identify(n, req);
     case NVME_ADM_CMD_ABORT:
-        return nvme_abort(n, cmd, req);
+        return nvme_abort(n, req);
     case NVME_ADM_CMD_SET_FEATURES:
-        return nvme_set_feature(n, cmd, req);
+        return nvme_set_feature(n, req);
     case NVME_ADM_CMD_GET_FEATURES:
-        return nvme_get_feature(n, cmd, req);
+        return nvme_get_feature(n, req);
     case NVME_ADM_CMD_ASYNC_EV_REQ:
-        return nvme_aer(n, cmd, req);
+        return nvme_aer(n, req);
     default:
-        trace_nvme_err_invalid_admin_opc(cmd->opcode);
+        trace_nvme_err_invalid_admin_opc(req->cmd.opcode);
         return NVME_INVALID_OPCODE | NVME_DNR;
     }
 }
@@ -1944,7 +1937,7 @@ static void nvme_process_sq(void *opaque)
=20
     while (!(nvme_sq_empty(sq) || QTAILQ_EMPTY(&sq->req_list))) {
         addr =3D sq->dma_addr + sq->head * n->sqe_size;
-        nvme_addr_read(n, addr, (void *)&cmd, sizeof(cmd));
+        nvme_addr_read(n, addr, (void *)&cmd, sizeof(NvmeCmd));
         nvme_inc_sq_head(sq);
=20
         req =3D QTAILQ_FIRST(&sq->req_list);
@@ -1953,8 +1946,8 @@ static void nvme_process_sq(void *opaque)
=20
         nvme_init_req(n, &cmd, req);
=20
-        status =3D sq->sqid ? nvme_io_cmd(n, &cmd, req) :
-            nvme_admin_cmd(n, &cmd, req);
+        status =3D sq->sqid ? nvme_io_cmd(n, req) :
+            nvme_admin_cmd(n, req);
         if (status !=3D NVME_NO_COMPLETE) {
             req->status =3D status;
             nvme_enqueue_req_completion(cq, req);
--=20
2.23.0


