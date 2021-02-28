Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F2DA33273B4
	for <lists+qemu-devel@lfdr.de>; Sun, 28 Feb 2021 18:53:26 +0100 (CET)
Received: from localhost ([::1]:40530 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lGQFx-0003ze-WE
	for lists+qemu-devel@lfdr.de; Sun, 28 Feb 2021 12:53:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37586)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <minwoo.im.dev@gmail.com>)
 id 1lGQEG-00030w-1z; Sun, 28 Feb 2021 12:51:40 -0500
Received: from mail-pg1-x529.google.com ([2607:f8b0:4864:20::529]:42497)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <minwoo.im.dev@gmail.com>)
 id 1lGQED-0003DY-TY; Sun, 28 Feb 2021 12:51:39 -0500
Received: by mail-pg1-x529.google.com with SMTP id o38so9987735pgm.9;
 Sun, 28 Feb 2021 09:51:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=6uJdErSE1C1h/gmj0xkomziSvRUlZNQsTrL31Svboa0=;
 b=HVADzPSs7g+A6+Y5QLQ4Svh+BqH/gJstGj6sFv0MXA+NZ3P2IMNyphyyNDU+3JFnWr
 hs4XRasp34tvggxupkwgaSxdjeOfVYuboITCkBXtj+ayItEGW7ZLOlhrXZUDGbc0rxIQ
 ZxW6QY0KUZDoIi8aA4olJ4gGpjqIjR6iDK8ns3/4PwWnPfi3xt5qjuWMaylLNK4DTipi
 RGqoLOAWEUeNQhEHUacC3kMHQ20GWiAyUEfmQ8YVxZKRLB7zUZ3+EQPvGE5d0QnF62Vm
 jdmjzhhKDvK9n5AadXe7fdG/iagiCV2zfyjsvye+RAfNyhMYRhUvdu9tEK2s7sDUDeje
 HCHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=6uJdErSE1C1h/gmj0xkomziSvRUlZNQsTrL31Svboa0=;
 b=rIKWzi5oUaWglQk4gmPyBLI4MgTw8WL/YGH4fwTG4VmJBxDAO1vRxmmzkFGXnCbz/y
 Ewx25lvqDIjBPdGZETe2nFZ5dwEUjwkhc4U/9fEVo++w9DX9XQ65RDiNAXttH9OFc6I0
 T47nY+qefYffnU59K9NTDMQob9sqNplidTLmmj/l1Zf1uxXjUadLEh/2fgmyJyOwbDNK
 bePtQ9U70lRSdiLmUZgZyywHshxi7E/e4jIKHetxwwcUqE4H8DJZ69ic1ZqENlyf+gin
 XuBHss8lfnrcU11zWNY392HHsve+4JoKnQegjXGypEl+TvdTBK7c4AcTH3qBeRXQ/Xwo
 kf2A==
X-Gm-Message-State: AOAM531jPfhirnNZbX+cabXpdya1hMP42r383RwdXnkKeaJJF058clIi
 Yk9ZUfmwOaJh0sdpM6YdfJ+8PQsMXwk4iw==
X-Google-Smtp-Source: ABdhPJyWLdLSofJQCgF6nzZWfdz1+FK6wvomO+wdfDs6X1LqTmRZK2YsF1UXNNfVBG0mnOEq74RjNg==
X-Received: by 2002:aa7:80c6:0:b029:1b6:92ae:a199 with SMTP id
 a6-20020aa780c60000b02901b692aea199mr11250162pfn.71.1614528681685; 
 Sun, 28 Feb 2021 08:11:21 -0800 (PST)
Received: from localhost.localdomain ([211.108.35.36])
 by smtp.gmail.com with ESMTPSA id x11sm14389781pja.46.2021.02.28.08.11.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 28 Feb 2021 08:11:21 -0800 (PST)
From: Minwoo Im <minwoo.im.dev@gmail.com>
To: qemu-devel@nongnu.org,
	qemu-block@nongnu.org
Subject: [PATCH V3 6/8] hw/block/nvme: support namespace attachment command
Date: Mon,  1 Mar 2021 01:10:58 +0900
Message-Id: <20210228161100.54015-7-minwoo.im.dev@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210228161100.54015-1-minwoo.im.dev@gmail.com>
References: <20210228161100.54015-1-minwoo.im.dev@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::529;
 envelope-from=minwoo.im.dev@gmail.com; helo=mail-pg1-x529.google.com
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

As command effect for the namespace attachment command is registered,
the host will be notified that namespace inventory is changed so that
host will rescan the namespace inventory after this command.  For
example, kernel driver manages this command effect via passthru IOCTL.

Signed-off-by: Minwoo Im <minwoo.im.dev@gmail.com>
---
 hw/block/nvme-subsys.h | 10 +++++++
 hw/block/nvme.c        | 61 +++++++++++++++++++++++++++++++++++++++++-
 hw/block/nvme.h        |  5 ++++
 hw/block/trace-events  |  2 ++
 include/block/nvme.h   |  6 +++++
 5 files changed, 83 insertions(+), 1 deletion(-)

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
index b18ab0ef810f..68c2e63d9412 100644
--- a/hw/block/nvme.c
+++ b/hw/block/nvme.c
@@ -187,6 +187,7 @@ static const uint32_t nvme_cse_acs[256] = {
     [NVME_ADM_CMD_SET_FEATURES]     = NVME_CMD_EFF_CSUPP,
     [NVME_ADM_CMD_GET_FEATURES]     = NVME_CMD_EFF_CSUPP,
     [NVME_ADM_CMD_ASYNC_EV_REQ]     = NVME_CMD_EFF_CSUPP,
+    [NVME_ADM_CMD_NS_ATTACHMENT]    = NVME_CMD_EFF_CSUPP | NVME_CMD_EFF_NIC,
 };
 
 static const uint32_t nvme_cse_iocs_none[256];
@@ -3868,6 +3869,62 @@ static uint16_t nvme_aer(NvmeCtrl *n, NvmeRequest *req)
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
@@ -3899,6 +3956,8 @@ static uint16_t nvme_admin_cmd(NvmeCtrl *n, NvmeRequest *req)
         return nvme_get_feature(n, req);
     case NVME_ADM_CMD_ASYNC_EV_REQ:
         return nvme_aer(n, req);
+    case NVME_ADM_CMD_NS_ATTACHMENT:
+        return nvme_ns_attachment(n, req);
     default:
         assert(false);
     }
@@ -4865,7 +4924,7 @@ static void nvme_init_ctrl(NvmeCtrl *n, PCIDevice *pci_dev)
 
     id->mdts = n->params.mdts;
     id->ver = cpu_to_le32(NVME_SPEC_VER);
-    id->oacs = cpu_to_le16(0);
+    id->oacs = cpu_to_le16(NVME_OACS_NS_MGMT);
     id->cntrltype = 0x1;
 
     /*
diff --git a/hw/block/nvme.h b/hw/block/nvme.h
index 7599d6b1a41b..74a00ab21a55 100644
--- a/hw/block/nvme.h
+++ b/hw/block/nvme.h
@@ -220,6 +220,11 @@ static inline void nvme_ns_attach(NvmeCtrl *n, NvmeNamespace *ns)
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
index 25ba51ea5405..98d542c999e2 100644
--- a/hw/block/trace-events
+++ b/hw/block/trace-events
@@ -82,6 +82,8 @@ pci_nvme_aer(uint16_t cid) "cid %"PRIu16""
 pci_nvme_aer_aerl_exceeded(void) "aerl exceeded"
 pci_nvme_aer_masked(uint8_t type, uint8_t mask) "type 0x%"PRIx8" mask 0x%"PRIx8""
 pci_nvme_aer_post_cqe(uint8_t typ, uint8_t info, uint8_t log_page) "type 0x%"PRIx8" info 0x%"PRIx8" lid 0x%"PRIx8""
+pci_nvme_ns_attachment(uint16_t cid, uint8_t sel) "cid %"PRIu16", sel=0x%"PRIx8""
+pci_nvme_ns_attachment_attach(uint16_t cntlid, uint32_t nsid) "cntlid=0x%"PRIx16", nsid=0x%"PRIx32""
 pci_nvme_enqueue_event(uint8_t typ, uint8_t info, uint8_t log_page) "type 0x%"PRIx8" info 0x%"PRIx8" lid 0x%"PRIx8""
 pci_nvme_enqueue_event_noqueue(int queued) "queued %d"
 pci_nvme_enqueue_event_masked(uint8_t typ) "type 0x%"PRIx8""
diff --git a/include/block/nvme.h b/include/block/nvme.h
index b23f3ae2279f..339784d9c23a 100644
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
@@ -1045,6 +1050,7 @@ enum NvmeIdCtrlOacs {
     NVME_OACS_SECURITY  = 1 << 0,
     NVME_OACS_FORMAT    = 1 << 1,
     NVME_OACS_FW        = 1 << 2,
+    NVME_OACS_NS_MGMT   = 1 << 3,
 };
 
 enum NvmeIdCtrlOncs {
-- 
2.25.1


