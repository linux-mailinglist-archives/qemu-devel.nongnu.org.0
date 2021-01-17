Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 77C0C2F931E
	for <lists+qemu-devel@lfdr.de>; Sun, 17 Jan 2021 15:56:37 +0100 (CET)
Received: from localhost ([::1]:56304 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l19To-0006J2-FV
	for lists+qemu-devel@lfdr.de; Sun, 17 Jan 2021 09:56:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43270)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <minwoo.im.dev@gmail.com>)
 id 1l19RG-0004PV-A0; Sun, 17 Jan 2021 09:53:58 -0500
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d]:33766)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <minwoo.im.dev@gmail.com>)
 id 1l19RE-00041s-Ms; Sun, 17 Jan 2021 09:53:58 -0500
Received: by mail-pl1-x62d.google.com with SMTP id b8so7225507plx.0;
 Sun, 17 Jan 2021 06:53:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=ePUqokcNCu1135M5rENh02CwQRe25aSU4ChI3LMevlI=;
 b=oVFDahcwk/VlgBvGHute5RnyZCJHUtHYwD5hDY74wTaZi7d6/bWX3jqzPmI3mBPIv5
 ZiLPgsRUDvT0eNlqsKWgeNK5FHF8rfT/wvcx3XQL/MUSdbMteBSWrQJ4/eU8pOLSXJQl
 lpAj8d31UbIpcNvfElFFsWg6AFU6N01+OFc90DthGWfSWYU/nvv6OkG2JzPkSkTR4/SP
 3k04ZIC+b6vnL8tGZLlj4QeKpJXEjNokofIINRX+tEGscxMl/aKMqcAUSVMMHYVCZ6dM
 YLHAULGzmSQNH2+JIxylfUhSOTnMoWHRsAF2nPja9FQYidyjpn6+91uifnB0TZHza0w3
 tBFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=ePUqokcNCu1135M5rENh02CwQRe25aSU4ChI3LMevlI=;
 b=tsh1pAqALg4q5l3X59CJM975fcalLIMDp5EVt5/0UNcz489A6nkXwJEmrsNfMN7+Ny
 DHWZQQ8bR55H8nf25DFrKI9pcq/WUHLmZfc9lxACFyycqtgKzWLlIzKx+T3tN8gaiE23
 vG1Ap3AQysJo6bFXmt+1r2z4J7bTWFCTI9e0q4sDfHCI1c5M+FsTBkKHPOKbGAFlekqf
 B2xB6VEeZUq2CCLXj8I0TyRZM7FTy1kN9I/dzvho3HLoznpzIAEActsMJsr9CJY2pMiL
 k8vC/U97jwahL3UQbkPWSfakbdrfnBKxuWw3dQgD/w/viL9APBhbk4tX3kYSoaRYrxMv
 8Jsg==
X-Gm-Message-State: AOAM530EUyoWlLa1jHWU6hI5mYkXmzJahbRxIem/C9flyogwUoQGugP2
 n91VVB6A8t2pmKjZzFlSb+IN6JOR8Z+fSA==
X-Google-Smtp-Source: ABdhPJyybzm15A2qGJrFId73tfi/KdkvUyFjOu3w+w901eDtchGm1Prd9k7CPCJLnzkYgZ2kLVfDuw==
X-Received: by 2002:a17:90a:a415:: with SMTP id
 y21mr21537663pjp.88.1610895234823; 
 Sun, 17 Jan 2021 06:53:54 -0800 (PST)
Received: from localhost.localdomain ([211.108.35.36])
 by smtp.gmail.com with ESMTPSA id x127sm13143583pfb.74.2021.01.17.06.53.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 17 Jan 2021 06:53:54 -0800 (PST)
From: Minwoo Im <minwoo.im.dev@gmail.com>
To: qemu-devel@nongnu.org,
	qemu-block@nongnu.org
Subject: [RFC PATCH V2 02/11] hw/block/nvme: open code for volatile write cache
Date: Sun, 17 Jan 2021 23:53:32 +0900
Message-Id: <20210117145341.23310-3-minwoo.im.dev@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210117145341.23310-1-minwoo.im.dev@gmail.com>
References: <20210117145341.23310-1-minwoo.im.dev@gmail.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::62d;
 envelope-from=minwoo.im.dev@gmail.com; helo=mail-pl1-x62d.google.com
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

Volatile Write Cache(VWC) feature is set in nvme_ns_setup() in the
initial time.  This feature is related to block device backed,  but this
feature is controlled in controller level via Set/Get Features command.

This patch removed dependency between nvme and nvme-ns to manage the VWC
flag value.  Also, it open coded the Get Features for VWC to check all
namespaces attached to the controller, and if false detected, return
directly false.

Signed-off-by: Minwoo Im <minwoo.im.dev@gmail.com>
---
 hw/block/nvme-ns.c |  4 ----
 hw/block/nvme.c    | 15 ++++++++++++---
 hw/block/nvme.h    |  1 -
 3 files changed, 12 insertions(+), 8 deletions(-)

diff --git a/hw/block/nvme-ns.c b/hw/block/nvme-ns.c
index 32662230130b..c403cd36b6bd 100644
--- a/hw/block/nvme-ns.c
+++ b/hw/block/nvme-ns.c
@@ -89,10 +89,6 @@ static int nvme_ns_init_blk(NvmeCtrl *n, NvmeNamespace *ns, Error **errp)
         return -1;
     }
 
-    if (blk_enable_write_cache(ns->blkconf.blk)) {
-        n->features.vwc = 0x1;
-    }
-
     return 0;
 }
 
diff --git a/hw/block/nvme.c b/hw/block/nvme.c
index cf0fe28fe6eb..b2a9c48a9d81 100644
--- a/hw/block/nvme.c
+++ b/hw/block/nvme.c
@@ -3033,6 +3033,7 @@ static uint16_t nvme_get_feature(NvmeCtrl *n, NvmeRequest *req)
     NvmeGetFeatureSelect sel = NVME_GETFEAT_SELECT(dw10);
     uint16_t iv;
     NvmeNamespace *ns;
+    int i;
 
     static const uint32_t nvme_feature_default[NVME_FID_MAX] = {
         [NVME_ARBITRATION] = NVME_ARB_AB_NOLIMIT,
@@ -3108,7 +3109,17 @@ static uint16_t nvme_get_feature(NvmeCtrl *n, NvmeRequest *req)
         result = ns->features.err_rec;
         goto out;
     case NVME_VOLATILE_WRITE_CACHE:
-        result = n->features.vwc;
+        for (i = 1; i <= n->num_namespaces; i++) {
+            ns = nvme_ns(n, i);
+            if (!ns) {
+                continue;
+            }
+
+            result = blk_enable_write_cache(ns->blkconf.blk);
+            if (!result) {
+                break;
+            }
+        }
         trace_pci_nvme_getfeat_vwcache(result ? "enabled" : "disabled");
         goto out;
     case NVME_ASYNCHRONOUS_EVENT_CONF:
@@ -3271,8 +3282,6 @@ static uint16_t nvme_set_feature(NvmeCtrl *n, NvmeRequest *req)
         ns->features.err_rec = dw11;
         break;
     case NVME_VOLATILE_WRITE_CACHE:
-        n->features.vwc = dw11 & 0x1;
-
         for (i = 1; i <= n->num_namespaces; i++) {
             ns = nvme_ns(n, i);
             if (!ns) {
diff --git a/hw/block/nvme.h b/hw/block/nvme.h
index b7fbcca39d9f..5ba83ee77841 100644
--- a/hw/block/nvme.h
+++ b/hw/block/nvme.h
@@ -117,7 +117,6 @@ typedef struct NvmeFeatureVal {
         uint16_t temp_thresh_low;
     };
     uint32_t    async_config;
-    uint32_t    vwc;
 } NvmeFeatureVal;
 
 typedef struct NvmeCtrl {
-- 
2.17.1


