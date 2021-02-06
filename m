Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F3AA7311A53
	for <lists+qemu-devel@lfdr.de>; Sat,  6 Feb 2021 04:40:22 +0100 (CET)
Received: from localhost ([::1]:34956 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l8ESM-00025R-2z
	for lists+qemu-devel@lfdr.de; Fri, 05 Feb 2021 22:40:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37458)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <minwoo.im.dev@gmail.com>)
 id 1l8EOy-00061A-1n; Fri, 05 Feb 2021 22:36:52 -0500
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035]:50496)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <minwoo.im.dev@gmail.com>)
 id 1l8EOw-0003iy-3i; Fri, 05 Feb 2021 22:36:51 -0500
Received: by mail-pj1-x1035.google.com with SMTP id cl8so4671152pjb.0;
 Fri, 05 Feb 2021 19:36:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=XmjP9NNuBar/smLFXQK8etvVLNaY3fMCsBYhqWhRS34=;
 b=CxZ8OAgXTmgVGlecdFlML+/t7AixH8l/2hXYD13wjg3MTuQZ0pMyFKSD4jhIBAcauC
 i5EguzkPUOPPBgYT86kflII+xNvsYkcv2SjQ7MTW3+PHd0sWf43ESlIAfTbBY0tQjudO
 OBWyAugs85IVEOZ+5/xPoK7QZo+AoGaihPSY4fswueqkEblWTQmiBH0Ybn7rJcKAOOEw
 Yd7uqQIzTQqfDEHURhOo4ufSg0n9JdhIPtlyQhBfWHfHbmCXeKLRDtt9aGmti6yuHW4v
 coInH649REYng/ESeg2NsEXhAIitkhI05NZ31zv1AAI2k10jz+fPrHjUQ9CAuUj4a8B6
 tdlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=XmjP9NNuBar/smLFXQK8etvVLNaY3fMCsBYhqWhRS34=;
 b=oJZnpzlGjMchISLiMzG/ZDdeQXaq4kDirgcoDLL+T15AuxABtUDIbVTA+Cy7vU2wd/
 emx0BSAIzDqyG/8SUub3VsMmojdyStuzlKParbCnzlWh8d+m0//vPa3ZGDZhEe4MNGQx
 nwFOF+JVetonEEPBBnV1V/1L11eFu8M/yCU2dkkR9KG5/X49oke6VTBl3WbC095GYoE4
 /vuKRujSLlPGeI/J8km/IlrVY2I7rnhmXyOIhbO1wWucl83G1tIXCncVM+gAeToVyyMH
 cAEC/3tc8zliJTrdj8SsOW1joXEMZUSAYIkzCHu+KIex/fyeaNUjKR8DlKDMso7XBu/u
 owaw==
X-Gm-Message-State: AOAM531KJlWwSzSU0HbCUI1px832jfa1svaYUyAw/IVWU6wQRVVPhWmH
 dCckATSuv2+MC7KpibmqghdSs4taavuGQg==
X-Google-Smtp-Source: ABdhPJwnXrNF1FRA63L3j+zMoj3X3pqVviI97nCHojk+cGlqb7j9HyligkACRLoBMWjKf/QrpHuRVQ==
X-Received: by 2002:a17:902:c684:b029:df:fab3:63de with SMTP id
 r4-20020a170902c684b02900dffab363demr6876232plx.81.1612582608239; 
 Fri, 05 Feb 2021 19:36:48 -0800 (PST)
Received: from localhost.localdomain ([211.108.35.36])
 by smtp.gmail.com with ESMTPSA id j17sm10862375pfh.183.2021.02.05.19.36.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Feb 2021 19:36:47 -0800 (PST)
From: Minwoo Im <minwoo.im.dev@gmail.com>
To: qemu-devel@nongnu.org,
	qemu-block@nongnu.org
Subject: [PATCH 4/6] hw/block/nvme: support allocated namespace type
Date: Sat,  6 Feb 2021 12:36:27 +0900
Message-Id: <20210206033629.4278-5-minwoo.im.dev@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210206033629.4278-1-minwoo.im.dev@gmail.com>
References: <20210206033629.4278-1-minwoo.im.dev@gmail.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::1035;
 envelope-from=minwoo.im.dev@gmail.com; helo=mail-pj1-x1035.google.com
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
index a1e930f7c8e4..d1761a82731f 100644
--- a/hw/block/nvme.c
+++ b/hw/block/nvme.c
@@ -3124,7 +3124,7 @@ static uint16_t nvme_identify_ctrl_csi(NvmeCtrl *n, NvmeRequest *req)
     return NVME_INVALID_FIELD | NVME_DNR;
 }
 
-static uint16_t nvme_identify_ns(NvmeCtrl *n, NvmeRequest *req)
+static uint16_t nvme_identify_ns(NvmeCtrl *n, NvmeRequest *req, bool active)
 {
     NvmeNamespace *ns;
     NvmeIdentify *c = (NvmeIdentify *)&req->cmd;
@@ -3138,7 +3138,14 @@ static uint16_t nvme_identify_ns(NvmeCtrl *n, NvmeRequest *req)
 
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
@@ -3149,7 +3156,8 @@ static uint16_t nvme_identify_ns(NvmeCtrl *n, NvmeRequest *req)
     return NVME_INVALID_CMD_SET | NVME_DNR;
 }
 
-static uint16_t nvme_identify_ns_csi(NvmeCtrl *n, NvmeRequest *req)
+static uint16_t nvme_identify_ns_csi(NvmeCtrl *n, NvmeRequest *req,
+        bool active)
 {
     NvmeNamespace *ns;
     NvmeIdentify *c = (NvmeIdentify *)&req->cmd;
@@ -3163,7 +3171,14 @@ static uint16_t nvme_identify_ns_csi(NvmeCtrl *n, NvmeRequest *req)
 
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
@@ -3176,7 +3191,8 @@ static uint16_t nvme_identify_ns_csi(NvmeCtrl *n, NvmeRequest *req)
     return NVME_INVALID_FIELD | NVME_DNR;
 }
 
-static uint16_t nvme_identify_nslist(NvmeCtrl *n, NvmeRequest *req)
+static uint16_t nvme_identify_nslist(NvmeCtrl *n, NvmeRequest *req,
+        bool active)
 {
     NvmeNamespace *ns;
     NvmeIdentify *c = (NvmeIdentify *)&req->cmd;
@@ -3201,7 +3217,14 @@ static uint16_t nvme_identify_nslist(NvmeCtrl *n, NvmeRequest *req)
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
@@ -3215,7 +3238,8 @@ static uint16_t nvme_identify_nslist(NvmeCtrl *n, NvmeRequest *req)
     return nvme_dma(n, list, data_len, DMA_DIRECTION_FROM_DEVICE, req);
 }
 
-static uint16_t nvme_identify_nslist_csi(NvmeCtrl *n, NvmeRequest *req)
+static uint16_t nvme_identify_nslist_csi(NvmeCtrl *n, NvmeRequest *req,
+        bool active)
 {
     NvmeNamespace *ns;
     NvmeIdentify *c = (NvmeIdentify *)&req->cmd;
@@ -3241,7 +3265,14 @@ static uint16_t nvme_identify_nslist_csi(NvmeCtrl *n, NvmeRequest *req)
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
@@ -3321,25 +3352,25 @@ static uint16_t nvme_identify(NvmeCtrl *n, NvmeRequest *req)
 
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
2.17.1


