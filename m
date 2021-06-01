Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C39FE397683
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Jun 2021 17:25:12 +0200 (CEST)
Received: from localhost ([::1]:54378 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lo6GV-00039f-QA
	for lists+qemu-devel@lfdr.de; Tue, 01 Jun 2021 11:25:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39498)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anaidu.gollu@samsung.com>)
 id 1lo61C-0000yh-7g
 for qemu-devel@nongnu.org; Tue, 01 Jun 2021 11:09:22 -0400
Received: from mailout2.samsung.com ([203.254.224.25]:10884)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anaidu.gollu@samsung.com>)
 id 1lo617-00080T-KB
 for qemu-devel@nongnu.org; Tue, 01 Jun 2021 11:09:21 -0400
Received: from epcas5p1.samsung.com (unknown [182.195.41.39])
 by mailout2.samsung.com (KnoxPortal) with ESMTP id
 20210601150913epoutp024007e97196ee495cf54c710b689a6e82~EfdzY0LMX2682326823epoutp02g
 for <qemu-devel@nongnu.org>; Tue,  1 Jun 2021 15:09:13 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.samsung.com
 20210601150913epoutp024007e97196ee495cf54c710b689a6e82~EfdzY0LMX2682326823epoutp02g
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1622560153;
 bh=dCi7GFMamEL1sB9v2PhEauWo7chUkS6/+xD1Z9MrWsg=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=vI79TRJYjKrDmrnvCcMgOolRyBzDeCuAR4ONhz8y13KAdrGu8lxZxzIBlXQ+L/zE/
 E5KSRmfNdFcy34aD3oV+I+HFo+/MEmtDK9m2neJKcqNbkNu4TSY2aOcXl8lNtsWBgJ
 +bZK62Sscd4EcOCC6CF6COMOsF5aJhJVQwQnM7Kw=
Received: from epsmges5p3new.samsung.com (unknown [182.195.42.75]) by
 epcas5p2.samsung.com (KnoxPortal) with ESMTP id
 20210601150912epcas5p225ed510d416c0584511b0ff81a274484~EfdzIqOE_0115401154epcas5p2J;
 Tue,  1 Jun 2021 15:09:12 +0000 (GMT)
Received: from epcas5p3.samsung.com ( [182.195.41.41]) by
 epsmges5p3new.samsung.com (Symantec Messaging Gateway) with SMTP id
 93.AC.09835.89D46B06; Wed,  2 Jun 2021 00:09:12 +0900 (KST)
Received: from epsmtrp2.samsung.com (unknown [182.195.40.14]) by
 epcas5p1.samsung.com (KnoxPortal) with ESMTPA id
 20210601144234epcas5p153e855ad673876cf67e57d4b539dc274~EfGijELoR1532615326epcas5p1B;
 Tue,  1 Jun 2021 14:42:34 +0000 (GMT)
Received: from epsmgms1p2.samsung.com (unknown [182.195.42.42]) by
 epsmtrp2.samsung.com (KnoxPortal) with ESMTP id
 20210601144234epsmtrp244941aa3c055a0b72d0ddd80f119819e~EfGihMC1z3175731757epsmtrp2g;
 Tue,  1 Jun 2021 14:42:34 +0000 (GMT)
X-AuditID: b6c32a4b-7c9ff7000000266b-4a-60b64d9894c5
Received: from epsmtip1.samsung.com ( [182.195.34.30]) by
 epsmgms1p2.samsung.com (Symantec Messaging Gateway) with SMTP id
 E3.B5.08163.A5746B06; Tue,  1 Jun 2021 23:42:34 +0900 (KST)
Received: from 2030045822.sa.corp.samsungelectronics.net (unknown
 [107.108.221.178]) by epsmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20210601144232epsmtip156bab30b6ed5e669ea2eab39a3519834~EfGg_s3nJ2917129171epsmtip1K;
 Tue,  1 Jun 2021 14:42:32 +0000 (GMT)
From: Gollu Appalanaidu <anaidu.gollu@samsung.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 1/2] hw/nvme: add support for boot partiotions
Date: Tue,  1 Jun 2021 20:07:48 +0530
Message-Id: <20210601143749.1669-2-anaidu.gollu@samsung.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210601143749.1669-1-anaidu.gollu@samsung.com>
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFvrMIsWRmVeSWpSXmKPExsWy7bCmpu4M320JBhemGlq83nmc2eLK/vOM
 FvsPfmO1mHToGqPFkoupFvNuKVvMetfOZnG8dweLxetJ/1kdOD1+nGtn8zi34zy7x6ZVnWwe
 T65tZvJ4v+8qm0ffllWMAWxRXDYpqTmZZalF+nYJXBlTZj1nLzjdz1hx6d9kxgbGxzldjJwc
 EgImEo8+vmXvYuTiEBLYzSjx8PhXZgjnE6PEpelboTKfGSWeHt7ADtPya80kNojELkaJHRtX
 QDmdTBInX1xjAqliEzCSmP32DSOILSIgKfG76zQziM0MsuTbXJ0uRg4OYQFHifZH/iBhFgFV
 iS2Lb4CV8ArYSKxvm84GsUxeYvWGA2BxTgFbiSf/9jKC7JIQuMcu8bnjCRNEkYvEjAP7oRqE
 JV4d3wJ1qZTE53d7geLsQHa1xOEiiNYORoljlzdAldtL/Hs2jRHkHGYBTYn1u/QhwrISU0+t
 Y4K4mE+i9zfMJl6JHfNgbDWJBbe+Q22SkZj55zYrhO0h8X1uKzTgJjBKvFv2jm0Co9wshBUL
 GBlXMUqmFhTnpqcWmxYY56WW6xUn5haX5qXrJefnbmIEpwst7x2Mjx580DvEyMTBeIhRgoNZ
 SYTXPW9rghBvSmJlVWpRfnxRaU5q8SFGaQ4WJXHeFQ8nJwgJpCeWpGanphakFsFkmTg4pRqY
 WpYIXM9b8X51zwa7Aw8DK2cafud2fntSQsTCcFnoWbaDSxeoxxn9nDe3PN5JuyV18yTFzduq
 1dymlq7bkx9162NKvo7PsT+pk29ZiF3dqMSUM/Fq0L5CydCCCgHJay+uuBxNyrUz+LeVo7r2
 nc4Jk4z3LK3hPx25nsZWJ/8XED4xPzpmSehmp41Fs+9Pb5CaH9kZ3VQcFrB+/63vMucVXII+
 7WQ9eShTY0kS144fN/xOdMh9Llfl8Urx06i65iGyW8pJqzU8j+HdV43P7duCan7qGbwy3RZ+
 YYsUU3mhaF1c7o/t7vO+/9RsNc+R2f+9kMElafbhq49VWu/sFdlu+ZvhL9NRA6PXGqvM9NyV
 WIozEg21mIuKEwEwX4oohgMAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrCLMWRmVeSWpSXmKPExsWy7bCSnG6U+7YEg88HxS1e7zzObHFl/3lG
 i/0Hv7FaTDp0jdFiycVUi3m3lC1mvWtnszjeu4PF4vWk/6wOnB4/zrWzeZzbcZ7dY9OqTjaP
 J9c2M3m833eVzaNvyyrGALYoLpuU1JzMstQifbsErowps56zF5zuZ6y49G8yYwPj45wuRk4O
 CQETiV9rJrGB2EICOxglJv3wg4jLSPw6NZUZwhaWWPnvOTtETTuTxIyZTCA2m4CRxOy3bxhB
 bBEBSYnfXaeB6rk4mAWOMkpcbp/M0sXIwSEs4CjR/sgfpIZFQFViy+IbYDN5BWwk1rdNZ4OY
 Ly+xesMBsDingK3Ek397GSF22Ui0HZ3MOIGRbwEjwypGydSC4tz03GLDAqO81HK94sTc4tK8
 dL3k/NxNjOCA1NLawbhn1Qe9Q4xMHIyHGCU4mJVEeN3ztiYI8aYkVlalFuXHF5XmpBYfYpTm
 YFES573QdTJeSCA9sSQ1OzW1ILUIJsvEwSnVwKQ/baKFzdQDpz8scHG/sSJCVKrrwXO7G5FH
 OKZd23H5wJEr5/ksFkV0yQnu5f+t3Zj0xz2D583hoD9Bk1d+/XKm2uDLx8oZCSUhgb9uLt32
 6did6cZlh6R7RXV+nH3JWvsu/GXr3JVq9fe8dA735ou8LNa89fz/quVtEuYPFblOhrGsfulp
 rPRhWpLynI1s96QuRkd+TFtgPEN6h1bJQvM1r09v+ex5z7rtpXL8n5Vbnj/ebSw0pVO6Y8q3
 L1Kvd6zTlb24u7kmpPSgGp/q4XUx1Rvr976Y0nzhVqj5pU+CrFx/GFzyOMJ4V16J35gT1Nf1
 VGPCvXYFl0c32oqNX152OfnAf7Vg/SzmtA1Xbl8LU2Ipzkg01GIuKk4EAOYBMLi3AgAA
X-CMS-MailID: 20210601144234epcas5p153e855ad673876cf67e57d4b539dc274
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: REQ_APPROVE
CMS-TYPE: 105P
X-CMS-RootMailID: 20210601144234epcas5p153e855ad673876cf67e57d4b539dc274
References: <20210601143749.1669-1-anaidu.gollu@samsung.com>
 <CGME20210601144234epcas5p153e855ad673876cf67e57d4b539dc274@epcas5p1.samsung.com>
Received-SPF: pass client-ip=203.254.224.25;
 envelope-from=anaidu.gollu@samsung.com; helo=mailout2.samsung.com
X-Spam_score_int: -74
X-Spam_score: -7.5
X-Spam_bar: -------
X-Spam_report: (-7.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.371,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_HI=-5, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
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
Cc: fam@euphon.net, kwolf@redhat.com, qemu-block@nongnu.org,
 Gollu Appalanaidu <anaidu.gollu@samsung.com>, mreitz@redhat.com,
 its@irrelevant.dk, stefanha@redhat.com, kbusch@kernel.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

NVMe Boot Partitions provides an area that may be read by the host
without initializing queues or even enabling the controller. This
allows various platform initialization code to be stored on the NVMe
device instead of some separete medium.

This patch adds the read support for such an area, as well as support
for updating the boot partition contents from the host through the
FW Download and Commit commands.

Signed-off-by: Gollu Appalanaidu <anaidu.gollu@samsung.com>
---
 hw/nvme/ctrl.c       | 207 +++++++++++++++++++++++++++++++++++++++++++
 hw/nvme/nvme.h       |   3 +
 hw/nvme/trace-events |   7 ++
 include/block/nvme.h |  75 +++++++++++++++-
 4 files changed, 291 insertions(+), 1 deletion(-)

diff --git a/hw/nvme/ctrl.c b/hw/nvme/ctrl.c
index 0bcaf7192f..ab72091802 100644
--- a/hw/nvme/ctrl.c
+++ b/hw/nvme/ctrl.c
@@ -100,6 +100,12 @@
  *   the minimum memory page size (CAP.MPSMIN). The default value is 0 (i.e.
  *   defaulting to the value of `mdts`).
  *
+ * - `bootpart`
+ *   NVMe Boot Partitions provides an area that may be read by the host without
+ *   initializing queues or even enabling the controller. This 'bootpart' block
+ *   device stores platform initialization code. Its size shall be in 256 KiB
+ *   units.
+ *
  * nvme namespace device parameters
  * ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  * - `shared`
@@ -215,6 +221,8 @@ static const uint32_t nvme_cse_acs[256] = {
     [NVME_ADM_CMD_ASYNC_EV_REQ]     = NVME_CMD_EFF_CSUPP,
     [NVME_ADM_CMD_NS_ATTACHMENT]    = NVME_CMD_EFF_CSUPP | NVME_CMD_EFF_NIC,
     [NVME_ADM_CMD_FORMAT_NVM]       = NVME_CMD_EFF_CSUPP | NVME_CMD_EFF_LBCC,
+    [NVME_ADM_CMD_DOWNLOAD_FW]      = NVME_CMD_EFF_CSUPP,
+    [NVME_ADM_CMD_COMMIT_FW]        = NVME_CMD_EFF_CSUPP,
 };
 
 static const uint32_t nvme_cse_iocs_none[256];
@@ -5145,6 +5153,112 @@ static uint16_t nvme_format(NvmeCtrl *n, NvmeRequest *req)
     return req->status;
 }
 
+struct nvme_bp_read_ctx {
+    NvmeCtrl *n;
+    QEMUSGList qsg;
+};
+
+static void nvme_bp_read_cb(void *opaque, int ret)
+{
+    struct nvme_bp_read_ctx *ctx = opaque;
+    NvmeCtrl *n = ctx->n;
+
+    trace_pci_nvme_bp_read_cb();
+
+    if (ret) {
+        NVME_BPINFO_CLEAR_BRS(n->bar.bpinfo);
+        NVME_BPINFO_SET_BRS(n->bar.bpinfo, NVME_BPINFO_BRS_ERROR);
+        goto free;
+    }
+
+    NVME_BPINFO_CLEAR_BRS(n->bar.bpinfo);
+    NVME_BPINFO_SET_BRS(n->bar.bpinfo, NVME_BPINFO_BRS_SUCCESS);
+
+free:
+    if (ctx->qsg.sg) {
+        qemu_sglist_destroy(&ctx->qsg);
+    }
+
+    g_free(ctx);
+}
+
+static void nvme_fw_commit_cb(void *opaque, int ret)
+{
+    NvmeRequest *req = opaque;
+
+    trace_pci_nvme_fw_commit_cb(nvme_cid(req));
+
+    if (ret) {
+        nvme_aio_err(req, ret);
+    }
+
+    nvme_enqueue_req_completion(nvme_cq(req), req);
+}
+
+static uint16_t nvme_fw_commit(NvmeCtrl *n, NvmeRequest *req)
+{
+    uint32_t dw10 = le32_to_cpu(req->cmd.cdw10);
+    uint8_t fwug = n->id_ctrl.fwug;
+    uint8_t fs = dw10 & 0x7;
+    uint8_t ca = (dw10 >> 3) & 0x7;
+    uint8_t bpid = dw10 >> 31;
+    int64_t offset = 0;
+
+    trace_pci_nvme_fw_commit(nvme_cid(req), dw10, fwug, fs, ca,
+                            bpid);
+
+    if (fs || ca == NVME_FW_CA_REPLACE) {
+        return NVME_INVALID_FW_SLOT | NVME_DNR;
+    }
+    /*
+     * current firmware commit command only support boot partions
+     * related commit actions
+     */
+    if (ca < NVME_FW_CA_REPLACE_BP) {
+        return NVME_FW_ACTIVATE_PROHIBITED | NVME_DNR;
+    }
+
+    if (ca == NVME_FW_CA_ACTIVATE_BP) {
+        NVME_BPINFO_CLEAR_ABPID(n->bar.bpinfo);
+        NVME_BPINFO_SET_ABPID(n->bar.bpinfo, bpid);
+        return NVME_SUCCESS;
+    }
+
+    if (bpid) {
+        offset = n->bp_size;
+    }
+
+    nvme_sg_init(n, &req->sg, false);
+    qemu_iovec_add(&req->sg.iov, n->bp_data, n->bp_size);
+
+    req->aiocb = blk_aio_pwritev(n->blk_bp, offset, &req->sg.iov, 0,
+                                 nvme_fw_commit_cb, req);
+
+    return NVME_NO_COMPLETE;
+}
+
+static uint16_t nvme_fw_download(NvmeCtrl *n, NvmeRequest *req)
+{
+    uint32_t numd = le32_to_cpu(req->cmd.cdw10);
+    uint32_t offset = le32_to_cpu(req->cmd.cdw11);
+    size_t len = 0;
+    uint16_t status = NVME_SUCCESS;
+
+    trace_pci_nvme_fw_download(nvme_cid(req), numd, offset, n->id_ctrl.fwug);
+
+    len = (numd + 1) << 2;
+    offset <<= 2;
+
+    if (len + offset > n->bp_size) {
+        trace_pci_nvme_fw_download_invalid_bp_size(offset, len, n->bp_size);
+        return NVME_INVALID_FIELD | NVME_DNR;
+    }
+
+    status = nvme_h2c(n, n->bp_data + offset, len, req);
+
+    return status;
+}
+
 static uint16_t nvme_admin_cmd(NvmeCtrl *n, NvmeRequest *req)
 {
     trace_pci_nvme_admin_cmd(nvme_cid(req), nvme_sqid(req), req->cmd.opcode,
@@ -5181,6 +5295,10 @@ static uint16_t nvme_admin_cmd(NvmeCtrl *n, NvmeRequest *req)
         return nvme_get_feature(n, req);
     case NVME_ADM_CMD_ASYNC_EV_REQ:
         return nvme_aer(n, req);
+    case NVME_ADM_CMD_COMMIT_FW:
+        return nvme_fw_commit(n, req);
+    case NVME_ADM_CMD_DOWNLOAD_FW:
+        return nvme_fw_download(n, req);
     case NVME_ADM_CMD_NS_ATTACHMENT:
         return nvme_ns_attachment(n, req);
     case NVME_ADM_CMD_FORMAT_NVM:
@@ -5265,6 +5383,7 @@ static void nvme_ctrl_reset(NvmeCtrl *n)
     n->qs_created = false;
 
     n->bar.cc = 0;
+    NVME_BPINFO_CLEAR_BRS(n->bar.bpinfo);
 }
 
 static void nvme_ctrl_shutdown(NvmeCtrl *n)
@@ -5546,6 +5665,47 @@ static void nvme_write_bar(NvmeCtrl *n, hwaddr offset, uint64_t data,
         NVME_GUEST_ERR(pci_nvme_ub_mmiowr_cmbsz_readonly,
                        "invalid write to read only CMBSZ, ignored");
         return;
+    case 0x44:  /* BPRSEL */
+        n->bar.bprsel = data & 0xffffffff;
+        size_t bp_len = NVME_BPRSEL_BPRSZ(n->bar.bprsel) * 4 * KiB;
+        int64_t bp_offset = NVME_BPRSEL_BPROF(n->bar.bprsel) * 4 * KiB;
+        int64_t off = 0;
+        struct nvme_bp_read_ctx *ctx;
+
+        trace_pci_nvme_mmio_bprsel(data, n->bar.bprsel,
+                                   NVME_BPRSEL_BPID(n->bar.bpinfo),
+                                   bp_offset, bp_len);
+
+        if (bp_len + bp_offset > n->bp_size) {
+            NVME_BPINFO_CLEAR_BRS(n->bar.bpinfo);
+            NVME_BPINFO_SET_BRS(n->bar.bpinfo, NVME_BPINFO_BRS_ERROR);
+            return;
+        }
+
+        off = NVME_BPRSEL_BPID(n->bar.bpinfo) * n->bp_size + bp_offset;
+
+        NVME_BPINFO_CLEAR_BRS(n->bar.bpinfo);
+        NVME_BPINFO_SET_BRS(n->bar.bpinfo, NVME_BPINFO_BRS_READING);
+
+        ctx = g_new(struct nvme_bp_read_ctx, 1);
+
+        ctx->n = n;
+
+        pci_dma_sglist_init(&ctx->qsg, &n->parent_obj, 1);
+
+        qemu_sglist_add(&ctx->qsg, n->bar.bpmbl, bp_len);
+
+        dma_blk_read(n->blk_bp, &ctx->qsg, off , BDRV_SECTOR_SIZE,
+                     nvme_bp_read_cb, ctx);
+        return;
+    case 0x48:  /* BPMBL */
+        n->bar.bpmbl = size == 8 ? data :
+            (n->bar.bpmbl & ~0xffffffff) | (data & 0xfffff000);
+        trace_pci_nvme_mmio_bpmbl(data, n->bar.bpmbl);
+        return;
+    case 0x4c:  /* BPMBL hi */
+        n->bar.bpmbl = (n->bar.bpmbl & 0xffffffff) | (data << 32);
+        return;
     case 0x50:  /* CMBMSC */
         if (!NVME_CAP_CMBS(n->bar.cap)) {
             return;
@@ -6074,6 +6234,9 @@ static void nvme_init_ctrl(NvmeCtrl *n, PCIDevice *pci_dev)
     id->mdts = n->params.mdts;
     id->ver = cpu_to_le32(NVME_SPEC_VER);
     id->oacs = cpu_to_le16(NVME_OACS_NS_MGMT | NVME_OACS_FORMAT);
+    if (n->blk_bp) {
+        id->oacs |= NVME_OACS_FW;
+    }
     id->cntrltype = 0x1;
 
     /*
@@ -6135,9 +6298,44 @@ static void nvme_init_ctrl(NvmeCtrl *n, PCIDevice *pci_dev)
     NVME_CAP_SET_MPSMAX(n->bar.cap, 4);
     NVME_CAP_SET_CMBS(n->bar.cap, n->params.cmb_size_mb ? 1 : 0);
     NVME_CAP_SET_PMRS(n->bar.cap, n->pmr.dev ? 1 : 0);
+    NVME_CAP_SET_BPS(n->bar.cap, 0x1);
 
     n->bar.vs = NVME_SPEC_VER;
     n->bar.intmc = n->bar.intms = 0;
+
+    /* Boot Partition Information (BPINFO) */
+    n->bar.bpinfo = 0;
+}
+
+static int nvme_init_boot_partitions(NvmeCtrl *n, Error **errp)
+{
+    BlockBackend *blk = n->blk_bp;
+    uint64_t len, perm, shared_perm;
+    size_t bp_size;
+    int ret;
+
+    len = blk_getlength(blk);
+    if (len % (256 * KiB)) {
+        error_setg(errp, "boot partitions image size shall be"\
+                   " multiple of 256 KiB current size %lu", len);
+        return -1;
+    }
+
+    perm = BLK_PERM_CONSISTENT_READ | BLK_PERM_WRITE;
+    shared_perm = BLK_PERM_ALL;
+
+    ret = blk_set_perm(blk, perm, shared_perm, errp);
+    if (ret) {
+        return ret;
+    }
+
+    bp_size = len / (256 * KiB);
+    NVME_BPINFO_SET_BPSZ(n->bar.bpinfo, bp_size);
+    n->bp_size = bp_size * 128 * KiB;
+
+    n->bp_data = g_malloc(n->bp_size);
+
+    return 0;
 }
 
 static int nvme_init_subsys(NvmeCtrl *n, Error **errp)
@@ -6207,6 +6405,13 @@ static void nvme_realize(PCIDevice *pci_dev, Error **errp)
 
         nvme_attach_ns(n, ns);
     }
+
+    if (n->blk_bp) {
+        if (nvme_init_boot_partitions(n, errp)) {
+            error_propagate(errp, local_err);
+            return;
+        }
+    }
 }
 
 static void nvme_exit(PCIDevice *pci_dev)
@@ -6229,6 +6434,7 @@ static void nvme_exit(PCIDevice *pci_dev)
     g_free(n->cq);
     g_free(n->sq);
     g_free(n->aer_reqs);
+    g_free(n->bp_data);
 
     if (n->params.cmb_size_mb) {
         g_free(n->cmb.buf);
@@ -6247,6 +6453,7 @@ static Property nvme_props[] = {
                      HostMemoryBackend *),
     DEFINE_PROP_LINK("subsys", NvmeCtrl, subsys, TYPE_NVME_SUBSYS,
                      NvmeSubsystem *),
+    DEFINE_PROP_DRIVE("bootpart", NvmeCtrl, blk_bp),
     DEFINE_PROP_STRING("serial", NvmeCtrl, params.serial),
     DEFINE_PROP_UINT32("cmb_size_mb", NvmeCtrl, params.cmb_size_mb, 0),
     DEFINE_PROP_UINT32("num_queues", NvmeCtrl, params.num_queues, 0),
diff --git a/hw/nvme/nvme.h b/hw/nvme/nvme.h
index c55293f6d3..1f51e8907e 100644
--- a/hw/nvme/nvme.h
+++ b/hw/nvme/nvme.h
@@ -435,6 +435,9 @@ typedef struct NvmeCtrl {
     DECLARE_BITMAP(changed_nsids, NVME_CHANGED_NSID_SIZE);
 
     NvmeSubsystem   *subsys;
+    BlockBackend    *blk_bp;
+    uint8_t         *bp_data;
+    uint64_t        bp_size;
 
     NvmeNamespace   namespace;
     NvmeNamespace   *namespaces[NVME_MAX_NAMESPACES + 1];
diff --git a/hw/nvme/trace-events b/hw/nvme/trace-events
index ea33d0ccc3..11234b2dba 100644
--- a/hw/nvme/trace-events
+++ b/hw/nvme/trace-events
@@ -80,6 +80,11 @@ pci_nvme_enqueue_event(uint8_t typ, uint8_t info, uint8_t log_page) "type 0x%"PR
 pci_nvme_enqueue_event_noqueue(int queued) "queued %d"
 pci_nvme_enqueue_event_masked(uint8_t typ) "type 0x%"PRIx8""
 pci_nvme_no_outstanding_aers(void) "ignoring event; no outstanding AERs"
+pci_nvme_fw_commit(uint16_t cid, uint32_t dw10, uint8_t fwug, uint8_t fs, uint8_t ca, uint8_t bpid) "cid %"PRIu16" dw10 %"PRIu32" fwug %"PRIu8" fs %"PRIu8" ca %"PRIu8" bpid %"PRIu8""
+pci_nvme_fw_download(uint16_t cid, uint32_t numd, uint32_t ofst, uint8_t fwug) "cid %"PRIu16" numd %"PRIu32" ofst %"PRIu32" fwug %"PRIu8""
+pci_nvme_fw_commit_cb(uint16_t cid) "cid %"PRIu16""
+pci_nvme_bp_read_cb(void) ""
+pci_nvme_fw_download_invalid_bp_size(uint32_t ofst, size_t len, uint64_t bp_size) "ofst %"PRIu32" len %zu bp_size %"PRIu64""
 pci_nvme_enqueue_req_completion(uint16_t cid, uint16_t cqid, uint16_t status) "cid %"PRIu16" cqid %"PRIu16" status 0x%"PRIx16""
 pci_nvme_mmio_read(uint64_t addr, unsigned size) "addr 0x%"PRIx64" size %d"
 pci_nvme_mmio_write(uint64_t addr, uint64_t data, unsigned size) "addr 0x%"PRIx64" data 0x%"PRIx64" size %d"
@@ -96,6 +101,8 @@ pci_nvme_mmio_acqaddr_hi(uint64_t data, uint64_t new_addr) "wrote MMIO, admin co
 pci_nvme_mmio_start_success(void) "setting controller enable bit succeeded"
 pci_nvme_mmio_stopped(void) "cleared controller enable bit"
 pci_nvme_mmio_shutdown_set(void) "shutdown bit set"
+pci_nvme_mmio_bpmbl(uint64_t data, uint64_t bpmbl) "wrote MMIO, boot partitions buffer location data=0x%"PRIx64", bpmbl=0x%"PRIx64""
+pci_nvme_mmio_bprsel(uint64_t data, uint8_t bp_id, uint64_t bp_off, uint64_t bp_size, uint64_t bprsel) "wrote MMIO, boot partitions read select data=0x%"PRIx64", bp_id=0x%"PRIx8" bp_off=0x%"PRIx64", bp_off=0x%"PRIx64", bprsel=0x%"PRIx64""
 pci_nvme_mmio_shutdown_cleared(void) "shutdown bit cleared"
 pci_nvme_open_zone(uint64_t slba, uint32_t zone_idx, int all) "open zone, slba=%"PRIu64", idx=%"PRIu32", all=%"PRIi32""
 pci_nvme_close_zone(uint64_t slba, uint32_t zone_idx, int all) "close zone, slba=%"PRIu64", idx=%"PRIu32", all=%"PRIi32""
diff --git a/include/block/nvme.h b/include/block/nvme.h
index 2b9d849023..4785687ab8 100644
--- a/include/block/nvme.h
+++ b/include/block/nvme.h
@@ -38,6 +38,7 @@ enum NvmeCapShift {
     CAP_DSTRD_SHIFT    = 32,
     CAP_NSSRS_SHIFT    = 36,
     CAP_CSS_SHIFT      = 37,
+    CAP_BPS_SHIFT      = 45,
     CAP_MPSMIN_SHIFT   = 48,
     CAP_MPSMAX_SHIFT   = 52,
     CAP_PMRS_SHIFT     = 56,
@@ -52,6 +53,7 @@ enum NvmeCapMask {
     CAP_DSTRD_MASK     = 0xf,
     CAP_NSSRS_MASK     = 0x1,
     CAP_CSS_MASK       = 0xff,
+    CAP_BPS_MASK       = 0x1,
     CAP_MPSMIN_MASK    = 0xf,
     CAP_MPSMAX_MASK    = 0xf,
     CAP_PMRS_MASK      = 0x1,
@@ -65,6 +67,7 @@ enum NvmeCapMask {
 #define NVME_CAP_DSTRD(cap) (((cap) >> CAP_DSTRD_SHIFT)  & CAP_DSTRD_MASK)
 #define NVME_CAP_NSSRS(cap) (((cap) >> CAP_NSSRS_SHIFT)  & CAP_NSSRS_MASK)
 #define NVME_CAP_CSS(cap)   (((cap) >> CAP_CSS_SHIFT)    & CAP_CSS_MASK)
+#define NVME_CAP_BPS(cap)   (((cap) >> CAP_BPS_SHIFT)    & CAP_BPS_MASK)
 #define NVME_CAP_MPSMIN(cap)(((cap) >> CAP_MPSMIN_SHIFT) & CAP_MPSMIN_MASK)
 #define NVME_CAP_MPSMAX(cap)(((cap) >> CAP_MPSMAX_SHIFT) & CAP_MPSMAX_MASK)
 #define NVME_CAP_PMRS(cap)  (((cap) >> CAP_PMRS_SHIFT)   & CAP_PMRS_MASK)
@@ -84,6 +87,8 @@ enum NvmeCapMask {
                                                            << CAP_NSSRS_SHIFT)
 #define NVME_CAP_SET_CSS(cap, val)    (cap |= (uint64_t)(val & CAP_CSS_MASK)   \
                                                            << CAP_CSS_SHIFT)
+#define NVME_CAP_SET_BPS(cap, val)    (cap |= (uint64_t)(val & CAP_BPS_MASK)   \
+                                                           << CAP_BPS_SHIFT)
 #define NVME_CAP_SET_MPSMIN(cap, val) (cap |= (uint64_t)(val & CAP_MPSMIN_MASK)\
                                                            << CAP_MPSMIN_SHIFT)
 #define NVME_CAP_SET_MPSMAX(cap, val) (cap |= (uint64_t)(val & CAP_MPSMAX_MASK)\
@@ -495,6 +500,63 @@ enum NvmePmrmscMask {
 #define NVME_PMRMSC_SET_CBA(pmrmsc, val)   \
     (pmrmsc |= (uint64_t)(val & PMRMSC_CBA_MASK) << PMRMSC_CBA_SHIFT)
 
+enum NvmeBpReadStatus {
+    NVME_BPINFO_BRS_NOREAD  = 0x0,
+    NVME_BPINFO_BRS_READING = 0x1,
+    NVME_BPINFO_BRS_SUCCESS = 0x2,
+    NVME_BPINFO_BRS_ERROR   = 0x3,
+};
+
+enum NvmeBpInfoShift {
+    BPINFO_BPSZ_SHIFT   = 0,
+    BPINFO_BRS_SHIFT    = 24,
+    BPINFO_ABPID_SHIFT  = 31,
+};
+
+enum NvmeBpInfoMask {
+    BPINFO_BPSZ_MASK  = 0x7fff,
+    BPINFO_BRS_MASK   = 0x3,
+    BPINFO_ABPID_MASK = 0x1,
+};
+
+#define NVME_BPINFO_SET_BPSZ(bpinfo, val) \
+    (bpinfo |= (uint64_t)(val & BPINFO_BPSZ_MASK)  << BPINFO_BPSZ_SHIFT)
+#define NVME_BPINFO_SET_BRS(bpinfo, val)   \
+    (bpinfo |= (uint64_t)(val & BPINFO_BRS_MASK) << BPINFO_BRS_SHIFT)
+#define NVME_BPINFO_SET_ABPID(bpinfo, val)   \
+    (bpinfo |= (uint64_t)(val & BPINFO_ABPID_MASK) << BPINFO_ABPID_SHIFT)
+
+#define NVME_BPINFO_BPSZ(bpinfo)   \
+    ((bpinfo >> BPINFO_BPSZ_SHIFT) & BPINFO_BPSZ_MASK)
+#define NVME_BPINFO_BRS(bpinfo)   \
+    ((bpinfo >> BPINFO_BRS_SHIFT) & BPINFO_BRS_MASK)
+#define NVME_BPINFO_ABPID(bpinfo)   \
+    ((bpinfo >> BPINFO_ABPID_SHIFT) & BPINFO_ABPID_MASK)
+
+#define NVME_BPINFO_CLEAR_ABPID(bpinfo)  \
+    (bpinfo &= (uint64_t)(~(BPINFO_ABPID_MASK << BPINFO_ABPID_SHIFT)))
+#define NVME_BPINFO_CLEAR_BRS(bpinfo)   \
+    (bpinfo &= (uint64_t)(~(BPINFO_BRS_MASK << BPINFO_BRS_SHIFT)))
+
+enum NvmeBpReadSelectShift {
+    BPRSEL_BPRSZ_SHIFT  = 0,
+    BPRSEL_BPROF_SHIFT  = 10,
+    BPRSEL_BPID_SHIFT   = 31,
+};
+
+enum NvmeBpReadSelectMask {
+    BPRSEL_BPRSZ_MASK  = 0x3ff,
+    BPRSEL_BPROF_MASK  = 0xffff,
+    BPRSEL_BPID_MASK   = 0x1,
+};
+
+#define NVME_BPRSEL_BPRSZ(bprsel)   \
+    ((bprsel >> BPRSEL_BPRSZ_SHIFT) & BPRSEL_BPRSZ_MASK)
+#define NVME_BPRSEL_BPROF(bprsel)   \
+    ((bprsel >> BPRSEL_BPROF_SHIFT) & BPRSEL_BPROF_MASK)
+#define NVME_BPRSEL_BPID(bprsel)   \
+    ((bprsel >> BPRSEL_BPID_SHIFT) & BPRSEL_BPID_MASK)
+
 enum NvmeSglDescriptorType {
     NVME_SGL_DESCR_TYPE_DATA_BLOCK          = 0x0,
     NVME_SGL_DESCR_TYPE_BIT_BUCKET          = 0x1,
@@ -564,7 +626,7 @@ enum NvmeAdminCommands {
     NVME_ADM_CMD_SET_FEATURES   = 0x09,
     NVME_ADM_CMD_GET_FEATURES   = 0x0a,
     NVME_ADM_CMD_ASYNC_EV_REQ   = 0x0c,
-    NVME_ADM_CMD_ACTIVATE_FW    = 0x10,
+    NVME_ADM_CMD_COMMIT_FW      = 0x10,
     NVME_ADM_CMD_DOWNLOAD_FW    = 0x11,
     NVME_ADM_CMD_NS_ATTACHMENT  = 0x15,
     NVME_ADM_CMD_FORMAT_NVM     = 0x80,
@@ -846,6 +908,8 @@ enum NvmeStatusCodes {
     NVME_FEAT_NOT_CHANGEABLE    = 0x010e,
     NVME_FEAT_NOT_NS_SPEC       = 0x010f,
     NVME_FW_REQ_SUSYSTEM_RESET  = 0x0110,
+    NVME_FW_ACTIVATE_PROHIBITED = 0x0113,
+    NVME_BP_WRITE_PROHIBITED    = 0x011e,
     NVME_NS_ALREADY_ATTACHED    = 0x0118,
     NVME_NS_PRIVATE             = 0x0119,
     NVME_NS_NOT_ATTACHED        = 0x011a,
@@ -1107,6 +1171,15 @@ enum NvmeIdCtrlFrmw {
     NVME_FRMW_SLOT1_RO = 1 << 0,
 };
 
+enum NvmeFwCommitActions {
+    NVME_FW_CA_REPLACE                  = 0x00,
+    NVME_FW_CA_REPLACE_AND_ACTIVATE     = 0x01,
+    NVME_FW_CA_ACTIVATE                 = 0x02,
+    NVME_FW_CA_REPLACE_AND_ACTIVATE_NOW = 0x03,
+    NVME_FW_CA_REPLACE_BP               = 0x06,
+    NVME_FW_CA_ACTIVATE_BP              = 0x07,
+};
+
 enum NvmeIdCtrlLpa {
     NVME_LPA_NS_SMART = 1 << 0,
     NVME_LPA_CSE      = 1 << 1,
-- 
2.17.1


