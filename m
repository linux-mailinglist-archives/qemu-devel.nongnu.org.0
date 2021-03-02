Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A04032A0F6
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Mar 2021 14:33:01 +0100 (CET)
Received: from localhost ([::1]:42586 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lH592-0007Lt-4t
	for lists+qemu-devel@lfdr.de; Tue, 02 Mar 2021 08:33:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47704)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <minwoo.im.dev@gmail.com>)
 id 1lH52t-0001nU-5K; Tue, 02 Mar 2021 08:26:39 -0500
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b]:35760)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <minwoo.im.dev@gmail.com>)
 id 1lH52r-0001bf-6U; Tue, 02 Mar 2021 08:26:38 -0500
Received: by mail-pf1-x42b.google.com with SMTP id o188so7169448pfg.2;
 Tue, 02 Mar 2021 05:26:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ZMh0IoPWOyypxXpvu7/xaC9C2wnfkURpfB9nXbk03RM=;
 b=TdKq6FzhmehKffTLrnznsHwQk2tP4xsTQlxQYn/ogLL2gNklA/HEm8Hs9h7rzNvqyO
 8lssP8GQOm9Pfkc5QnYeES+gahh65P62GW153XFsujYSSd5qIVFI3eLU9NuJ8hk7aoRZ
 WMABBtlUnuSHU+vFIa6s3lVV9tizL+IOjrbbNDoKbp5SRxTFpmbwyZ0F8A8TMxboSpmK
 JTzanq2oyLvalrpEfhZDuAOUJuTybcfje8Qsl025+iBPvdbq2287gwsa2xAk9jHvc193
 U5UuOUcmiKtOAmIXS9LbqOBAE+vNs7TmMb/hNgfzpqlvxsgj3tKHjJxrbrqnaJx+rz7n
 9UPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ZMh0IoPWOyypxXpvu7/xaC9C2wnfkURpfB9nXbk03RM=;
 b=Ka3q8e1kgYY32+PaWtugQXbd2s2VX+yWpE4n4j73MzkuLFHG96cFFAbrxOQ8F/BFKA
 BTkEM0dje6Rh6tQXhPjf0X05iLpOgHaBisB9/Ahe+WhPozYvI+SCxLPvYZP0scymYfQl
 gnFxwhTzmIxgzQCuRVmqs33rsr+XTx3a4fWgcO0E6/yIWM/rVCfkvhU4LNhGVTY+vx/e
 jt0KOSxgVBmGvFqZunAn4d+fO4Ccq+IwJLNQcZ5+DU+Rkw911qU8XeLI/02yzwClgQaQ
 ApLMgdT7oIne3a37v6PSxzZzOYmYMcO/U3OfRRZDB2eP8PNlePaZte/CERiRmlDCH/Yb
 cT1g==
X-Gm-Message-State: AOAM530foG1Sih/WHs/ytNjAbAIgo9bjivnfI9WlZGpzizI0G5/d58Ya
 /PKw60bFUUBdlwhKO7mywx5KeOBUnXw6Jg==
X-Google-Smtp-Source: ABdhPJz4Xj62HFjMvjo25z56eZSzUYwlEBh1J7T/XsVnCKMiXyrmlKvK3hlmmta8wsSKc1zAkUcCtw==
X-Received: by 2002:aa7:92c7:0:b029:1ee:75b2:2dab with SMTP id
 k7-20020aa792c70000b02901ee75b22dabmr3327034pfa.61.1614691595148; 
 Tue, 02 Mar 2021 05:26:35 -0800 (PST)
Received: from localhost.localdomain ([211.108.35.36])
 by smtp.gmail.com with ESMTPSA id u7sm20166956pfh.150.2021.03.02.05.26.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Mar 2021 05:26:34 -0800 (PST)
From: Minwoo Im <minwoo.im.dev@gmail.com>
To: qemu-devel@nongnu.org,
	qemu-block@nongnu.org
Subject: [PATCH V4 4/8] hw/block/nvme: support allocated namespace type
Date: Tue,  2 Mar 2021 22:26:13 +0900
Message-Id: <20210302132617.18495-5-minwoo.im.dev@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210302132617.18495-1-minwoo.im.dev@gmail.com>
References: <20210302132617.18495-1-minwoo.im.dev@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42b;
 envelope-from=minwoo.im.dev@gmail.com; helo=mail-pf1-x42b.google.com
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
2.27.0


