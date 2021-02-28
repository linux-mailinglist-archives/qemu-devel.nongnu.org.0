Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 808883273A2
	for <lists+qemu-devel@lfdr.de>; Sun, 28 Feb 2021 18:26:52 +0100 (CET)
Received: from localhost ([::1]:33306 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lGPqF-0004LM-2V
	for lists+qemu-devel@lfdr.de; Sun, 28 Feb 2021 12:26:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59316)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <minwoo.im.dev@gmail.com>)
 id 1lGPmY-0000uk-Pp; Sun, 28 Feb 2021 12:23:03 -0500
Received: from mail-oi1-x235.google.com ([2607:f8b0:4864:20::235]:37591)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <minwoo.im.dev@gmail.com>)
 id 1lGPmW-0004X6-MF; Sun, 28 Feb 2021 12:23:02 -0500
Received: by mail-oi1-x235.google.com with SMTP id l133so15646574oib.4;
 Sun, 28 Feb 2021 09:22:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=lCBwqwdK/I3/mqTdNwTMTiyi+JpI3avrUWNQ+CAnFSU=;
 b=Dd64XgWPQmNheVmnCdn8BNPRgAEfLcH8S+cI51ZlF108mLP9u53KmA6E7C+73zcLMZ
 sOrPz9ls6s8LyiLpUsT7p1iYE0XkSgCIQByMKOyQtrmMvwSu/mXI3Ga8dox4whxLGbxw
 OFRxDef744H9u/paKFqG3jK8y67rOAyofgxwtGo5/WwLeyGgKWCDhXC2Hud9VjRJK4Ci
 E+4NbLCZWlQLzpnO/Bq2s0FHkwn3F5e1aY571m+pZQN0KqZT0QACL+BcbmQdR+cofZRW
 7cbu2jEn557heNLb7UkEqYN8ajvAsB9CRrZOXPIUzs3xQM8vaCJv9cwYGnd7WJvbn17K
 X2Tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=lCBwqwdK/I3/mqTdNwTMTiyi+JpI3avrUWNQ+CAnFSU=;
 b=XwX5QfUtDQEeNzr1UouIFW6301LoiXKtWxgPma+7jkVUO/Wrm0U/rvLcQOzGpGOs5D
 CHNbgP2FcaoUUy9+g+nlTnoua5yX+x42LVImYBGfxPMCVaXXdsbm+ib/XbDDz9VeqTL9
 aY9Nx+j/2dSPMAPceRcxXU1wiAseSBcqaQb24dOqnTPtXK0giGn+nGiSxYvWIEnLotju
 rcokF10eP/iAtmamcBFmJonMn472d23rYGONMAr4GFZHZ/eLjnUUhrOyFWYNHpSziSIg
 PLBOlRnq1jBWZJi2pO5mVuQocoa1sQkC7pguriOy7vJvOQ7BRzrQ36j6VUXH9xyZKRt2
 xuLw==
X-Gm-Message-State: AOAM532NBULGv5wFNVHFwpr5B+CCU+JC+YuXze9Eag2518TRg0xs1AuE
 6ogzoav9CoDmJ/L9qb6EhYTfNCcUmmneiA==
X-Google-Smtp-Source: ABdhPJzUfkJ4Y8ItF/Og00dBqiLyJN3CCGvWYnU98cP9oetmygJsCzCRopHPuB0Teb2/XTEM/1Vh5Q==
X-Received: by 2002:a17:90a:5b0c:: with SMTP id
 o12mr13224382pji.68.1614528677238; 
 Sun, 28 Feb 2021 08:11:17 -0800 (PST)
Received: from localhost.localdomain ([211.108.35.36])
 by smtp.gmail.com with ESMTPSA id x11sm14389781pja.46.2021.02.28.08.11.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 28 Feb 2021 08:11:16 -0800 (PST)
From: Minwoo Im <minwoo.im.dev@gmail.com>
To: qemu-devel@nongnu.org,
	qemu-block@nongnu.org
Subject: [PATCH V3 4/8] hw/block/nvme: support allocated namespace type
Date: Mon,  1 Mar 2021 01:10:56 +0900
Message-Id: <20210228161100.54015-5-minwoo.im.dev@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210228161100.54015-1-minwoo.im.dev@gmail.com>
References: <20210228161100.54015-1-minwoo.im.dev@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::235;
 envelope-from=minwoo.im.dev@gmail.com; helo=mail-oi1-x235.google.com
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
Cc: Kevin Wolf <kwolf@redhat.com>, Klaus Jensen <k.jensen@samsung.com>,
 Max Reitz <mreitz@redhat.com>, Klaus Jensen <its@irrelevant.dk>,
 Minwoo Im <minwoo.im.dev@gmail.com>, Keith Busch <kbusch@kernel.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From NVMe spec 1.4b "6.1.5. NSID and Namespace Relationships" defines
valid namespace types:

	- Unallocated: Not exists in the NVMe subsystem
	- Allocated: Exists in the NVMe subsystem
	- Inactive: Not attached to the controller
	- Active: Attached to the controller

This patch added support for allocated, but not attached namespace type:

	!nvme_ns(n, nsid) && nvme_subsys_ns(n->subsys, nsid)

nvme_ns() returns attached namespace instance of the given controller
and nvme_subsys_ns() returns allocated namespace instance in the
subsystem.

Signed-off-by: Minwoo Im <minwoo.im.dev@gmail.com>
Tested-by: Klaus Jensen <k.jensen@samsung.com>
Reviewed-by: Klaus Jensen <k.jensen@samsung.com>
---
 hw/block/nvme-subsys.h | 13 +++++++++
 hw/block/nvme.c        | 63 +++++++++++++++++++++++++++++++-----------
 2 files changed, 60 insertions(+), 16 deletions(-)

diff --git a/hw/block/nvme-subsys.h b/hw/block/nvme-subsys.h
index 8a0732b22316..14627f9ccb41 100644
--- a/hw/block/nvme-subsys.h
+++ b/hw/block/nvme-subsys.h
@@ -30,4 +30,17 @@ typedef struct NvmeSubsystem {
 int nvme_subsys_register_ctrl(NvmeCtrl *n, Error **errp);
 int nvme_subsys_register_ns(NvmeNamespace *ns, Error **errp);
 
+/*
+ * Return allocated namespace of the specified nsid in the subsystem.
+ */
+static inline NvmeNamespace *nvme_subsys_ns(NvmeSubsystem *subsys,
+        uint32_t nsid)
+{
+    if (!subsys) {
+        return NULL;
+    }
+
+    return subsys->namespaces[nsid];
+}
+
 #endif /* NVME_SUBSYS_H */
diff --git a/hw/block/nvme.c b/hw/block/nvme.c
index f6aeae081840..53c4d59e09a7 100644
--- a/hw/block/nvme.c
+++ b/hw/block/nvme.c
@@ -3225,7 +3225,7 @@ static uint16_t nvme_identify_ctrl_csi(NvmeCtrl *n, NvmeRequest *req)
     return NVME_INVALID_FIELD | NVME_DNR;
 }
 
-static uint16_t nvme_identify_ns(NvmeCtrl *n, NvmeRequest *req)
+static uint16_t nvme_identify_ns(NvmeCtrl *n, NvmeRequest *req, bool active)
 {
     NvmeNamespace *ns;
     NvmeIdentify *c = (NvmeIdentify *)&req->cmd;
@@ -3239,7 +3239,14 @@ static uint16_t nvme_identify_ns(NvmeCtrl *n, NvmeRequest *req)
 
     ns = nvme_ns(n, nsid);
     if (unlikely(!ns)) {
-        return nvme_rpt_empty_id_struct(n, req);
+        if (!active) {
+            ns = nvme_subsys_ns(n->subsys, nsid);
+            if (!ns) {
+                return nvme_rpt_empty_id_struct(n, req);
+            }
+        } else {
+            return nvme_rpt_empty_id_struct(n, req);
+        }
     }
 
     if (c->csi == NVME_CSI_NVM && nvme_csi_has_nvm_support(ns)) {
@@ -3250,7 +3257,8 @@ static uint16_t nvme_identify_ns(NvmeCtrl *n, NvmeRequest *req)
     return NVME_INVALID_CMD_SET | NVME_DNR;
 }
 
-static uint16_t nvme_identify_ns_csi(NvmeCtrl *n, NvmeRequest *req)
+static uint16_t nvme_identify_ns_csi(NvmeCtrl *n, NvmeRequest *req,
+        bool active)
 {
     NvmeNamespace *ns;
     NvmeIdentify *c = (NvmeIdentify *)&req->cmd;
@@ -3264,7 +3272,14 @@ static uint16_t nvme_identify_ns_csi(NvmeCtrl *n, NvmeRequest *req)
 
     ns = nvme_ns(n, nsid);
     if (unlikely(!ns)) {
-        return nvme_rpt_empty_id_struct(n, req);
+        if (!active) {
+            ns = nvme_subsys_ns(n->subsys, nsid);
+            if (!ns) {
+                return nvme_rpt_empty_id_struct(n, req);
+            }
+        } else {
+            return nvme_rpt_empty_id_struct(n, req);
+        }
     }
 
     if (c->csi == NVME_CSI_NVM && nvme_csi_has_nvm_support(ns)) {
@@ -3277,7 +3292,8 @@ static uint16_t nvme_identify_ns_csi(NvmeCtrl *n, NvmeRequest *req)
     return NVME_INVALID_FIELD | NVME_DNR;
 }
 
-static uint16_t nvme_identify_nslist(NvmeCtrl *n, NvmeRequest *req)
+static uint16_t nvme_identify_nslist(NvmeCtrl *n, NvmeRequest *req,
+        bool active)
 {
     NvmeNamespace *ns;
     NvmeIdentify *c = (NvmeIdentify *)&req->cmd;
@@ -3302,7 +3318,14 @@ static uint16_t nvme_identify_nslist(NvmeCtrl *n, NvmeRequest *req)
     for (i = 1; i <= n->num_namespaces; i++) {
         ns = nvme_ns(n, i);
         if (!ns) {
-            continue;
+            if (!active) {
+                ns = nvme_subsys_ns(n->subsys, i);
+                if (!ns) {
+                    continue;
+                }
+            } else {
+                continue;
+            }
         }
         if (ns->params.nsid <= min_nsid) {
             continue;
@@ -3316,7 +3339,8 @@ static uint16_t nvme_identify_nslist(NvmeCtrl *n, NvmeRequest *req)
     return nvme_dma(n, list, data_len, DMA_DIRECTION_FROM_DEVICE, req);
 }
 
-static uint16_t nvme_identify_nslist_csi(NvmeCtrl *n, NvmeRequest *req)
+static uint16_t nvme_identify_nslist_csi(NvmeCtrl *n, NvmeRequest *req,
+        bool active)
 {
     NvmeNamespace *ns;
     NvmeIdentify *c = (NvmeIdentify *)&req->cmd;
@@ -3342,7 +3366,14 @@ static uint16_t nvme_identify_nslist_csi(NvmeCtrl *n, NvmeRequest *req)
     for (i = 1; i <= n->num_namespaces; i++) {
         ns = nvme_ns(n, i);
         if (!ns) {
-            continue;
+            if (!active) {
+                ns = nvme_subsys_ns(n->subsys, i);
+                if (!ns) {
+                    continue;
+                }
+            } else {
+                continue;
+            }
         }
         if (ns->params.nsid <= min_nsid || c->csi != ns->csi) {
             continue;
@@ -3422,25 +3453,25 @@ static uint16_t nvme_identify(NvmeCtrl *n, NvmeRequest *req)
 
     switch (le32_to_cpu(c->cns)) {
     case NVME_ID_CNS_NS:
-         /* fall through */
+        return nvme_identify_ns(n, req, true);
     case NVME_ID_CNS_NS_PRESENT:
-        return nvme_identify_ns(n, req);
+        return nvme_identify_ns(n, req, false);
     case NVME_ID_CNS_CS_NS:
-         /* fall through */
+        return nvme_identify_ns_csi(n, req, true);
     case NVME_ID_CNS_CS_NS_PRESENT:
-        return nvme_identify_ns_csi(n, req);
+        return nvme_identify_ns_csi(n, req, false);
     case NVME_ID_CNS_CTRL:
         return nvme_identify_ctrl(n, req);
     case NVME_ID_CNS_CS_CTRL:
         return nvme_identify_ctrl_csi(n, req);
     case NVME_ID_CNS_NS_ACTIVE_LIST:
-         /* fall through */
+        return nvme_identify_nslist(n, req, true);
     case NVME_ID_CNS_NS_PRESENT_LIST:
-        return nvme_identify_nslist(n, req);
+        return nvme_identify_nslist(n, req, false);
     case NVME_ID_CNS_CS_NS_ACTIVE_LIST:
-         /* fall through */
+        return nvme_identify_nslist_csi(n, req, true);
     case NVME_ID_CNS_CS_NS_PRESENT_LIST:
-        return nvme_identify_nslist_csi(n, req);
+        return nvme_identify_nslist_csi(n, req, false);
     case NVME_ID_CNS_NS_DESCR_LIST:
         return nvme_identify_ns_descr_list(n, req);
     case NVME_ID_CNS_IO_COMMAND_SET:
-- 
2.25.1


