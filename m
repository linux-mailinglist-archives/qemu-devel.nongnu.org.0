Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F0AED38F87C
	for <lists+qemu-devel@lfdr.de>; Tue, 25 May 2021 05:08:42 +0200 (CEST)
Received: from localhost ([::1]:37808 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1llNQw-00014b-1H
	for lists+qemu-devel@lfdr.de; Mon, 24 May 2021 23:08:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50738)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anaidu.gollu@samsung.com>)
 id 1llNOX-0006hv-JG
 for qemu-devel@nongnu.org; Mon, 24 May 2021 23:06:13 -0400
Received: from mailout1.samsung.com ([203.254.224.24]:31909)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anaidu.gollu@samsung.com>)
 id 1llNOU-0001iM-Gs
 for qemu-devel@nongnu.org; Mon, 24 May 2021 23:06:13 -0400
Received: from epcas5p2.samsung.com (unknown [182.195.41.40])
 by mailout1.samsung.com (KnoxPortal) with ESMTP id
 20210525030607epoutp01c9a8e266a7a9af2f02cadc7c5ef5ce1a~CMFdvOJU11469914699epoutp01Y
 for <qemu-devel@nongnu.org>; Tue, 25 May 2021 03:06:07 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.samsung.com
 20210525030607epoutp01c9a8e266a7a9af2f02cadc7c5ef5ce1a~CMFdvOJU11469914699epoutp01Y
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1621911967;
 bh=cSh2mi4FunPPa5ExZK1QoOML2E0m8878KqHQZKmdpy8=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=ryFHS0kgnJx3jwmzl+8ZIs0GevfgX16rv7qnbRta4KC8rtmxMEbMnd4EMZNO7oavh
 uPg10x+D6NBM4Gc1wwRQQIOdwVx01IIa1kh9D/PkQ7omHsj+y9uG4rRSQJFLex3GEA
 fWgUian51XJ65Fe2ET/MmpUmyTheYJrepCnqpi48=
Received: from epsmges5p1new.samsung.com (unknown [182.195.42.73]) by
 epcas5p3.samsung.com (KnoxPortal) with ESMTP id
 20210525030607epcas5p3d3bf167f01e606915aa23a0f35ea7499~CMFdNH3U92941229412epcas5p3d;
 Tue, 25 May 2021 03:06:07 +0000 (GMT)
Received: from epcas5p1.samsung.com ( [182.195.41.39]) by
 epsmges5p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
 8D.0E.09606.F996CA06; Tue, 25 May 2021 12:06:07 +0900 (KST)
Received: from epsmtrp1.samsung.com (unknown [182.195.40.13]) by
 epcas5p1.samsung.com (KnoxPortal) with ESMTPA id
 20210524212841epcas5p1cbca224848d4e3cfa9bf68a7f70d749a~CHe2Cux0_0031400314epcas5p1d;
 Mon, 24 May 2021 21:28:41 +0000 (GMT)
Received: from epsmgms1p2.samsung.com (unknown [182.195.42.42]) by
 epsmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20210524212841epsmtrp1dfdd714346317a1affdbbcfb1e912d70~CHe2ByCDQ1784717847epsmtrp1D;
 Mon, 24 May 2021 21:28:41 +0000 (GMT)
X-AuditID: b6c32a49-bdbff70000002586-8d-60ac699f5d82
Received: from epsmtip1.samsung.com ( [182.195.34.30]) by
 epsmgms1p2.samsung.com (Symantec Messaging Gateway) with SMTP id
 FD.CE.08163.98A1CA06; Tue, 25 May 2021 06:28:41 +0900 (KST)
Received: from 2030045822.sa.corp.samsungelectronics.net (unknown
 [107.108.221.178]) by epsmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20210524212840epsmtip10def819062a99a44dc781fb69857b6d6~CHe0m0RQm3200632006epsmtip1J;
 Mon, 24 May 2021 21:28:40 +0000 (GMT)
From: Gollu Appalanaidu <anaidu.gollu@samsung.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 1/2] hw/nvme: add support for boot partiotions
Date: Tue, 25 May 2021 02:54:15 +0530
Message-Id: <20210524212416.26652-2-anaidu.gollu@samsung.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210524212416.26652-1-anaidu.gollu@samsung.com>
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFvrEIsWRmVeSWpSXmKPExsWy7bCmuu78zDUJBs1dfBavdx5ntriy/zyj
 xf6D31gtJh26xmix5GKqxbxbyhaz3rWzWRzv3cFi8XrSf1YHTo8f59rZPM7tOM/usWlVJ5vH
 k2ubmTze77vK5tG3ZRVjAFsUl01Kak5mWWqRvl0CV8bDbR1sBRd7GSvaNxxlbGC8md3FyMkh
 IWAiceLXDaYuRi4OIYHdjBJHXx9jhnA+MUo8W7CaDcL5zCgx5/1KZpiWn1/+MEIkdjFKrDx/
 hB3C6WSSOPqxC6yKTcBIYvbbN4wgtoiApMTvrtNgcWaQJd/m6oDYwgJ2Ek9vnwWKc3CwCKhK
 9LzWBQnzCthK3F/cygaxTF5i9YYDYK2cQOXbuiaA7ZIQuMcu8X3uLagiF4mbf76wQ9jCEq+O
 b4GypSRe9rcB2exAdrXE4SKI1g5GiWOXN0C12kv8ezaNEeQEZgFNifW79CHCshJTT61jgriY
 T6L39xMmiDivxI55MLaaxIJb36E2yUjM/HObFcL2kOg/PQ3MFhKYyCix4YbSBEa5WQgbFjAy
 rmKUTC0ozk1PLTYtMMxLLdcrTswtLs1L10vOz93ECE4WWp47GO8++KB3iJGJg/EQowQHs5II
 79++lQlCvCmJlVWpRfnxRaU5qcWHGKU5WJTEeVc8nJwgJJCeWJKanZpakFoEk2Xi4JRqYNL7
 MXFJ5Mbs8nMTrb7wss7xmL1snbyk/bzXV0tbLIMCrzepLdPsn5KnJcu2ljHmys29c9Ome85X
 TslykpgZzfk1RlHDzGCJdZprbYTn/8SzJ/UX51pLFgvtEt5+mH/xmoVbnXe6LHvmwCQq+MX6
 fPfeNXyTM8PzDxReMTn4WbTsVOP11V0reT/IOz7asVRSZepEu4fPEiodViVKfbjJGG594JZk
 37z/tvlu6e/n8p7awrTq3gYhbW5j/m9T+/eddTBcNfeEg82Xj+yzRTp5G2w3iQg+7+PIaBSY
 sGj3x0BX1x0/M98dyL0xm/PKkUM9/GKrrZVv6cz8GqYf8KZVav6qZ8mrtmad3LIi37LQoUaJ
 pTgj0VCLuag4EQCHtKD8hQMAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrGLMWRmVeSWpSXmKPExsWy7bCSnG6n1JoEgyMHFS1e7zzObHFl/3lG
 i/0Hv7FaTDp0jdFiycVUi3m3lC1mvWtnszjeu4PF4vWk/6wOnB4/zrWzeZzbcZ7dY9OqTjaP
 J9c2M3m833eVzaNvyyrGALYoLpuU1JzMstQifbsEroyH2zrYCi72Mla0bzjK2MB4M7uLkZND
 QsBE4ueXP4xdjFwcQgI7GCXOLPzECpGQkfh1aiozhC0ssfLfc3aIonYmiXmzHrGAJNgEjCRm
 v33DCGKLCEhK/O46zQxSxCxwlFHicvtksCJhATuJp7fPAiU4OFgEVCV6XuuChHkFbCXuL25l
 g1ggL7F6wwGwZZxA5du6JrCD2EJANScXH2WewMi3gJFhFaNkakFxbnpusWGBUV5quV5xYm5x
 aV66XnJ+7iZGcFBqae1g3LPqg94hRiYOxkOMEhzMSiK8f/tWJgjxpiRWVqUW5ccXleakFh9i
 lOZgURLnvdB1Ml5IID2xJDU7NbUgtQgmy8TBKdXA1KqYllc5TaNxp/SMqFUehyMlVl9/IrBi
 ZYX1yqT3ZRO3ufz5v+jcR9sHUaWLyqo2u+wWrDJ5784pz9Sxi/nZmQnsyyW35Vksv2V4SEHz
 XJb2jBuiq/0nip/c8PXo7dkud6M61oaKVUkEGF89+9djys5VfnXfj34KsXIIr9rU33B3v4Kv
 sPB7A/Y4G5Yn63/p5FmFPbhlfpoj6VRO2Im4sJ1/fW8l1r18HHXdI/ydZJifVa/Ri4g9izZv
 PtN9UbtHdZd/aqmp4Tb2wJUuizfnzTiXvekhU+DSEPnQt0WMr6vVq5a1rM+OZv72031lv8qj
 8Mz7ZYvuhGby6t8Vnt8uGmcptf2a3N5ja+fMm3+4Q4mlOCPRUIu5qDgRAA1Gv8O5AgAA
X-CMS-MailID: 20210524212841epcas5p1cbca224848d4e3cfa9bf68a7f70d749a
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: REQ_APPROVE
CMS-TYPE: 105P
X-CMS-RootMailID: 20210524212841epcas5p1cbca224848d4e3cfa9bf68a7f70d749a
References: <20210524212416.26652-1-anaidu.gollu@samsung.com>
 <CGME20210524212841epcas5p1cbca224848d4e3cfa9bf68a7f70d749a@epcas5p1.samsung.com>
Received-SPF: pass client-ip=203.254.224.24;
 envelope-from=anaidu.gollu@samsung.com; helo=mailout1.samsung.com
X-Spam_score_int: -74
X-Spam_score: -7.5
X-Spam_bar: -------
X-Spam_report: (-7.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.371,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_HI=-5, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
 hw/nvme/ctrl.c       | 200 +++++++++++++++++++++++++++++++++++++++++++
 hw/nvme/nvme.h       |   3 +
 hw/nvme/trace-events |   7 ++
 include/block/nvme.h |  75 +++++++++++++++-
 4 files changed, 284 insertions(+), 1 deletion(-)

diff --git a/hw/nvme/ctrl.c b/hw/nvme/ctrl.c
index 0bcaf7192f..9314ca90e6 100644
--- a/hw/nvme/ctrl.c
+++ b/hw/nvme/ctrl.c
@@ -169,6 +169,7 @@
 #define NVME_TEMPERATURE_CRITICAL 0x175
 #define NVME_NUM_FW_SLOTS 1
 #define NVME_DEFAULT_MAX_ZA_SIZE (128 * KiB)
+#define NVME_NUM_OF_BPIDS 2
 
 #define NVME_GUEST_ERR(trace, fmt, ...) \
     do { \
@@ -215,6 +216,8 @@ static const uint32_t nvme_cse_acs[256] = {
     [NVME_ADM_CMD_ASYNC_EV_REQ]     = NVME_CMD_EFF_CSUPP,
     [NVME_ADM_CMD_NS_ATTACHMENT]    = NVME_CMD_EFF_CSUPP | NVME_CMD_EFF_NIC,
     [NVME_ADM_CMD_FORMAT_NVM]       = NVME_CMD_EFF_CSUPP | NVME_CMD_EFF_LBCC,
+    [NVME_ADM_CMD_DOWNLOAD_FW]      = NVME_CMD_EFF_CSUPP,
+    [NVME_ADM_CMD_COMMIT_FW]        = NVME_CMD_EFF_CSUPP,
 };
 
 static const uint32_t nvme_cse_iocs_none[256];
@@ -5145,6 +5148,111 @@ static uint16_t nvme_format(NvmeCtrl *n, NvmeRequest *req)
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
+    int offset;
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
+    offset = bpid * (n->bp_size / NVME_NUM_OF_BPIDS);
+
+    nvme_sg_init(n, &req->sg, false);
+    qemu_iovec_add(&req->sg.iov, n->bp_data + offset,
+                   (n->bp_size / NVME_NUM_OF_BPIDS));
+
+    req->aiocb = blk_aio_pwritev(n->blk_bp, offset, &req->sg.iov, 0,
+                    nvme_fw_commit_cb, req);
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
+
+    if (offset >= n->bp_size || len > n->bp_size ||
+        len + offset > n->bp_size) {
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
@@ -5181,6 +5289,10 @@ static uint16_t nvme_admin_cmd(NvmeCtrl *n, NvmeRequest *req)
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
@@ -5546,6 +5658,45 @@ static void nvme_write_bar(NvmeCtrl *n, hwaddr offset, uint64_t data,
         NVME_GUEST_ERR(pci_nvme_ub_mmiowr_cmbsz_readonly,
                        "invalid write to read only CMBSZ, ignored");
         return;
+    case 0x44:  /* BPRSEL */
+        n->bar.bprsel = data & 0xffffffff;
+        size_t bp_len = NVME_BPRSEL_BPRSZ(n->bar.bprsel) * 4 * KiB;
+        int bp_offset = NVME_BPRSEL_BPROF(n->bar.bprsel) * 4 * KiB;
+        struct nvme_bp_read_ctx *ctx;
+
+        trace_pci_nvme_mmio_bprsel(data, n->bar.bprsel,
+                                   NVME_BPRSEL_BPID(n->bar.bpinfo),
+                                   bp_offset, bp_len);
+
+        NVME_BPINFO_CLEAR_BRS(n->bar.bpinfo);
+        NVME_BPINFO_SET_BRS(n->bar.bpinfo, NVME_BPINFO_BRS_READING);
+
+        if (bp_len > n->bp_size || bp_offset > n->bp_size ||
+            bp_len + bp_offset > n->bp_size) {
+            NVME_BPINFO_CLEAR_BRS(n->bar.bpinfo);
+            NVME_BPINFO_SET_BRS(n->bar.bpinfo, NVME_BPINFO_BRS_ERROR);
+            return;
+        }
+
+        ctx = g_new(struct nvme_bp_read_ctx, 1);
+
+        ctx->n = n;
+
+        pci_dma_sglist_init(&ctx->qsg, &n->parent_obj, 1);
+
+        qemu_sglist_add(&ctx->qsg, n->bar.bpmbl, bp_len);
+
+        dma_blk_read(n->blk_bp, &ctx->qsg, NVME_BPRSEL_BPID(n->bar.bpinfo) *
+                     bp_offset, BDRV_SECTOR_SIZE, nvme_bp_read_cb, ctx);
+        return;
+    case 0x48:  /* BPMBL */
+        n->bar.bpmbl = size == 8 ? data :
+            (n->bar.bpmbl & ~0xffffffff) | (data & 0xfffff000);
+        trace_pci_nvme_mmio_bpmbl(data, n->bar.bpmbl);
+        return;
+    case 0x4B:  /* BPMBL hi*/
+        n->bar.bpmbl = (n->bar.bpmbl & 0xffffffff) | (data << 32);
+        return;
     case 0x50:  /* CMBMSC */
         if (!NVME_CAP_CMBS(n->bar.cap)) {
             return;
@@ -6074,6 +6225,9 @@ static void nvme_init_ctrl(NvmeCtrl *n, PCIDevice *pci_dev)
     id->mdts = n->params.mdts;
     id->ver = cpu_to_le32(NVME_SPEC_VER);
     id->oacs = cpu_to_le16(NVME_OACS_NS_MGMT | NVME_OACS_FORMAT);
+    if (n->blk_bp) {
+        id->oacs |= NVME_OACS_FW;
+    }
     id->cntrltype = 0x1;
 
     /*
@@ -6135,9 +6289,46 @@ static void nvme_init_ctrl(NvmeCtrl *n, PCIDevice *pci_dev)
     NVME_CAP_SET_MPSMAX(n->bar.cap, 4);
     NVME_CAP_SET_CMBS(n->bar.cap, n->params.cmb_size_mb ? 1 : 0);
     NVME_CAP_SET_PMRS(n->bar.cap, n->pmr.dev ? 1 : 0);
+    NVME_CAP_SET_BPS(n->bar.cap, 0x1);
 
     n->bar.vs = NVME_SPEC_VER;
     n->bar.intmc = n->bar.intms = 0;
+
+    /* Boot Partition Information (BPINFO) */
+    n->bar.bpinfo = 0;
+    NVME_BPINFO_SET_BRS(n->bar.bpinfo, NVME_BPINFO_BRS_NOREAD);
+    NVME_BPINFO_SET_ABPID(n->bar.bpinfo, 0x1);
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
+    if (len % (NVME_NUM_OF_BPIDS * 128 * KiB)) {
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
+    bp_size = len / (NVME_NUM_OF_BPIDS * 128 * KiB);
+    NVME_BPINFO_SET_BPSZ(n->bar.bpinfo, bp_size);
+    n->bp_size = NVME_BPINFO_BPSZ(n->bar.bpinfo) * 128 * KiB;
+
+    n->bp_data = g_malloc(NVME_NUM_OF_BPIDS * n->bp_size);
+
+    return 0;
 }
 
 static int nvme_init_subsys(NvmeCtrl *n, Error **errp)
@@ -6207,6 +6398,13 @@ static void nvme_realize(PCIDevice *pci_dev, Error **errp)
 
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
@@ -6229,6 +6427,7 @@ static void nvme_exit(PCIDevice *pci_dev)
     g_free(n->cq);
     g_free(n->sq);
     g_free(n->aer_reqs);
+    g_free(n->bp_data);
 
     if (n->params.cmb_size_mb) {
         g_free(n->cmb.buf);
@@ -6247,6 +6446,7 @@ static Property nvme_props[] = {
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


