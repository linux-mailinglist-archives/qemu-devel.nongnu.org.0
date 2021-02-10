Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A318316B01
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Feb 2021 17:19:21 +0100 (CET)
Received: from localhost ([::1]:49794 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9sD2-0007Jx-Cd
	for lists+qemu-devel@lfdr.de; Wed, 10 Feb 2021 11:19:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35676)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <minwoo.im.dev@gmail.com>)
 id 1l9s46-0007lp-Dt; Wed, 10 Feb 2021 11:10:07 -0500
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c]:41732)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <minwoo.im.dev@gmail.com>)
 id 1l9s43-0000F6-BW; Wed, 10 Feb 2021 11:10:06 -0500
Received: by mail-pf1-x42c.google.com with SMTP id q20so1546243pfu.8;
 Wed, 10 Feb 2021 08:10:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=pmXG5CH1mG2B5j7cScejmkchXlZv3ukCFFPjvF0PVB8=;
 b=QC0bw2tejIznxV6SJpNQC4PPPcMOir10thewShBKzoeLf5HtiwyEreyokus/6ttHa0
 E7kDUpYJinE3tTA3wYVPN+Sx2L8KIHOKkw9/sJhJ3ZtSpMgGq3Q1mZdOJ9XbfJd/kHf4
 xFzWx19MnM+ITIpId1aslLVp4Wg7RTMQ2LJfle0LgTDRogtL1IVZwN6+7bQeZHFsH/IB
 hCZcSH4ybWjkyTMQ6FGiQ/Wj7rRcoddDopcCVD+Gg+/KZ6pGHSYJL8RWR2pAMOv0L9nm
 hkpQbVYaURcd0oD1tBU0fm4m/2wENP7J3Czbe9LNPzjYpKkWgLL8N/iDbYIQMzUgcsxB
 M0fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=pmXG5CH1mG2B5j7cScejmkchXlZv3ukCFFPjvF0PVB8=;
 b=arMv7wf6PIH+CkIp7kpQWZ5uwEd7fT26+S74h3FRqtBUvAz2U8vPlTfeD0x66Elefl
 r4y1znyXPJ+H/0TZslRCC4rbSnibcmC4iCn0vCSA2lkPVbaHF78cYcxu75TOjAMVQOCY
 xuSpbujlhNYGTK8TtE2mD7BUKUMUBVasr1mNd35dGPXBxGDJNiUDovTKGmCUQPTwrJb8
 WNCo5U4EvFbxP+lvCkQejy9HcUUEJEOpN1SyjRUO12L6hkve7c8Mt0Qc34xQID/Uh6dk
 PFvCx3cl0sWEFBEFTnriHNVRBXKKt1//b3zfNwSrERh4WGzqqajFe0c9CDBTt5qEIGi6
 N3hw==
X-Gm-Message-State: AOAM530WiSv5m+f8xNF4C9sR4cXLKMZaaLrGOtn8kDfMt07KLaa7Hfw/
 CzpBBqkNbQt3HAtnmMOVqlX2Fl/e0vCiWA==
X-Google-Smtp-Source: ABdhPJx4B5tRpyRZ3C9hxlGi3mePBDzwTs0CElTI95wF8vjjKT1ZJG1+PAZqw5ASB/BnBJZoUlqS7w==
X-Received: by 2002:a63:175e:: with SMTP id 30mr3604219pgx.227.1612973401120; 
 Wed, 10 Feb 2021 08:10:01 -0800 (PST)
Received: from localhost.localdomain ([211.108.35.36])
 by smtp.gmail.com with ESMTPSA id 25sm2761195pfj.120.2021.02.10.08.09.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Feb 2021 08:10:00 -0800 (PST)
From: Minwoo Im <minwoo.im.dev@gmail.com>
To: qemu-devel@nongnu.org,
	qemu-block@nongnu.org
Subject: [PATCH V2 6/7] hw/block/nvme: support namespace attachment command
Date: Thu, 11 Feb 2021 01:09:36 +0900
Message-Id: <20210210160937.1100-7-minwoo.im.dev@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210210160937.1100-1-minwoo.im.dev@gmail.com>
References: <20210210160937.1100-1-minwoo.im.dev@gmail.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::42c;
 envelope-from=minwoo.im.dev@gmail.com; helo=mail-pf1-x42c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Keith Busch <kbusch@kernel.org>, Klaus Jensen <its@irrelevant.dk>,
 Minwoo Im <minwoo.im.dev@gmail.com>, Kevin Wolf <kwolf@redhat.com>,
 Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This patch supports Namespace Attachment command for the pre-defined
nvme-ns device nodes.  Of course, attach/detach namespace should only be
supported in case 'subsys' is given.  This is because if we detach a
namespace from a controller, somebody needs to manage the detached, but
allocated namespace in the NVMe subsystem.

Signed-off-by: Minwoo Im <minwoo.im.dev@gmail.com>
---
 hw/block/nvme-subsys.h | 10 +++++++
 hw/block/nvme.c        | 59 ++++++++++++++++++++++++++++++++++++++++++
 hw/block/nvme.h        |  5 ++++
 hw/block/trace-events  |  2 ++
 include/block/nvme.h   |  5 ++++
 5 files changed, 81 insertions(+)

diff --git a/hw/block/nvme-subsys.h b/hw/block/nvme-subsys.h
index 14627f9ccb41..ef4bec928eae 100644
--- a/hw/block/nvme-subsys.h
+++ b/hw/block/nvme-subsys.h
@@ -30,6 +30,16 @@ typedef struct NvmeSubsystem {
 int nvme_subsys_register_ctrl(NvmeCtrl *n, Error **errp);
 int nvme_subsys_register_ns(NvmeNamespace *ns, Error **errp);
 
+static inline NvmeCtrl *nvme_subsys_ctrl(NvmeSubsystem *subsys,
+        uint32_t cntlid)
+{
+    if (!subsys) {
+        return NULL;
+    }
+
+    return subsys->ctrls[cntlid];
+}
+
 /*
  * Return allocated namespace of the specified nsid in the subsystem.
  */
diff --git a/hw/block/nvme.c b/hw/block/nvme.c
index 697368a6ae0c..71bcd66f1956 100644
--- a/hw/block/nvme.c
+++ b/hw/block/nvme.c
@@ -183,6 +183,7 @@ static const uint32_t nvme_cse_acs[256] = {
     [NVME_ADM_CMD_SET_FEATURES]     = NVME_CMD_EFF_CSUPP,
     [NVME_ADM_CMD_GET_FEATURES]     = NVME_CMD_EFF_CSUPP,
     [NVME_ADM_CMD_ASYNC_EV_REQ]     = NVME_CMD_EFF_CSUPP,
+    [NVME_ADM_CMD_NS_ATTACHMENT]    = NVME_CMD_EFF_CSUPP,
 };
 
 static const uint32_t nvme_cse_iocs_none[256];
@@ -3766,6 +3767,62 @@ static uint16_t nvme_aer(NvmeCtrl *n, NvmeRequest *req)
     return NVME_NO_COMPLETE;
 }
 
+static void __nvme_select_ns_iocs(NvmeCtrl *n, NvmeNamespace *ns);
+static uint16_t nvme_ns_attachment(NvmeCtrl *n, NvmeRequest *req)
+{
+    NvmeNamespace *ns;
+    NvmeCtrl *ctrl;
+    uint16_t list[NVME_CONTROLLER_LIST_SIZE] = {};
+    uint32_t nsid = le32_to_cpu(req->cmd.nsid);
+    uint32_t dw10 = le32_to_cpu(req->cmd.cdw10);
+    bool attach = !(dw10 & 0xf);
+    uint16_t *nr_ids = &list[0];
+    uint16_t *ids = &list[1];
+    uint16_t ret;
+    int i;
+
+    trace_pci_nvme_ns_attachment(nvme_cid(req), dw10 & 0xf);
+
+    ns = nvme_subsys_ns(n->subsys, nsid);
+    if (!ns) {
+        return NVME_INVALID_FIELD | NVME_DNR;
+    }
+
+    ret = nvme_dma(n, (uint8_t *)list, 4096,
+                   DMA_DIRECTION_TO_DEVICE, req);
+    if (ret) {
+        return ret;
+    }
+
+    if (!*nr_ids) {
+        return NVME_NS_CTRL_LIST_INVALID | NVME_DNR;
+    }
+
+    for (i = 0; i < *nr_ids; i++) {
+        ctrl = nvme_subsys_ctrl(n->subsys, ids[i]);
+        if (!ctrl) {
+            return NVME_NS_CTRL_LIST_INVALID | NVME_DNR;
+        }
+
+        if (attach) {
+            if (nvme_ns_is_attached(ctrl, ns)) {
+                return NVME_NS_ALREADY_ATTACHED | NVME_DNR;
+            }
+
+            nvme_ns_attach(ctrl, ns);
+            __nvme_select_ns_iocs(ctrl, ns);
+        } else {
+            if (!nvme_ns_is_attached(ctrl, ns)) {
+                return NVME_NS_NOT_ATTACHED | NVME_DNR;
+            }
+
+            nvme_ns_detach(ctrl, ns);
+        }
+    }
+
+    return NVME_SUCCESS;
+}
+
 static uint16_t nvme_admin_cmd(NvmeCtrl *n, NvmeRequest *req)
 {
     trace_pci_nvme_admin_cmd(nvme_cid(req), nvme_sqid(req), req->cmd.opcode,
@@ -3797,6 +3854,8 @@ static uint16_t nvme_admin_cmd(NvmeCtrl *n, NvmeRequest *req)
         return nvme_get_feature(n, req);
     case NVME_ADM_CMD_ASYNC_EV_REQ:
         return nvme_aer(n, req);
+    case NVME_ADM_CMD_NS_ATTACHMENT:
+        return nvme_ns_attachment(n, req);
     default:
         assert(false);
     }
diff --git a/hw/block/nvme.h b/hw/block/nvme.h
index 1c7796b20996..5a1ab857d166 100644
--- a/hw/block/nvme.h
+++ b/hw/block/nvme.h
@@ -222,6 +222,11 @@ static inline void nvme_ns_attach(NvmeCtrl *n, NvmeNamespace *ns)
     n->namespaces[nvme_nsid(ns) - 1] = ns;
 }
 
+static inline void nvme_ns_detach(NvmeCtrl *n, NvmeNamespace *ns)
+{
+    n->namespaces[nvme_nsid(ns) - 1] = NULL;
+}
+
 static inline NvmeCQueue *nvme_cq(NvmeRequest *req)
 {
     NvmeSQueue *sq = req->sq;
diff --git a/hw/block/trace-events b/hw/block/trace-events
index b6e972d733a6..bf67fe7873d2 100644
--- a/hw/block/trace-events
+++ b/hw/block/trace-events
@@ -80,6 +80,8 @@ pci_nvme_aer(uint16_t cid) "cid %"PRIu16""
 pci_nvme_aer_aerl_exceeded(void) "aerl exceeded"
 pci_nvme_aer_masked(uint8_t type, uint8_t mask) "type 0x%"PRIx8" mask 0x%"PRIx8""
 pci_nvme_aer_post_cqe(uint8_t typ, uint8_t info, uint8_t log_page) "type 0x%"PRIx8" info 0x%"PRIx8" lid 0x%"PRIx8""
+pci_nvme_ns_attachment(uint16_t cid, uint8_t sel) "cid %"PRIu16", sel=0x%"PRIx8""
+pci_nvme_ns_attachment_attach(uint16_t cntlid, uint32_t nsid) "cntlid=0x%"PRIx16", nsid=0x%"PRIx32""
 pci_nvme_enqueue_event(uint8_t typ, uint8_t info, uint8_t log_page) "type 0x%"PRIx8" info 0x%"PRIx8" lid 0x%"PRIx8""
 pci_nvme_enqueue_event_noqueue(int queued) "queued %d"
 pci_nvme_enqueue_event_masked(uint8_t typ) "type 0x%"PRIx8""
diff --git a/include/block/nvme.h b/include/block/nvme.h
index f82b5ffc2c1d..4b016f954fee 100644
--- a/include/block/nvme.h
+++ b/include/block/nvme.h
@@ -566,6 +566,7 @@ enum NvmeAdminCommands {
     NVME_ADM_CMD_ASYNC_EV_REQ   = 0x0c,
     NVME_ADM_CMD_ACTIVATE_FW    = 0x10,
     NVME_ADM_CMD_DOWNLOAD_FW    = 0x11,
+    NVME_ADM_CMD_NS_ATTACHMENT  = 0x15,
     NVME_ADM_CMD_FORMAT_NVM     = 0x80,
     NVME_ADM_CMD_SECURITY_SEND  = 0x81,
     NVME_ADM_CMD_SECURITY_RECV  = 0x82,
@@ -836,6 +837,9 @@ enum NvmeStatusCodes {
     NVME_FEAT_NOT_CHANGEABLE    = 0x010e,
     NVME_FEAT_NOT_NS_SPEC       = 0x010f,
     NVME_FW_REQ_SUSYSTEM_RESET  = 0x0110,
+    NVME_NS_ALREADY_ATTACHED    = 0x0118,
+    NVME_NS_NOT_ATTACHED        = 0x011A,
+    NVME_NS_CTRL_LIST_INVALID   = 0x011C,
     NVME_CONFLICTING_ATTRS      = 0x0180,
     NVME_INVALID_PROT_INFO      = 0x0181,
     NVME_WRITE_TO_RO            = 0x0182,
@@ -951,6 +955,7 @@ typedef struct QEMU_PACKED NvmePSD {
     uint8_t     resv[16];
 } NvmePSD;
 
+#define NVME_CONTROLLER_LIST_SIZE 2048
 #define NVME_IDENTIFY_DATA_SIZE 4096
 
 enum NvmeIdCns {
-- 
2.17.1


