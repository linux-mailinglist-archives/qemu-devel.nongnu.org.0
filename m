Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C4E34ECFFF
	for <lists+qemu-devel@lfdr.de>; Thu, 31 Mar 2022 01:24:22 +0200 (CEST)
Received: from localhost ([::1]:33072 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nZhfo-0007bf-5p
	for lists+qemu-devel@lfdr.de; Wed, 30 Mar 2022 19:24:21 -0400
Received: from eggs.gnu.org ([209.51.188.92]:34716)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <vladimir.sementsov-ogievskiy@openvz.org>)
 id 1nZfss-0007zD-Vp
 for qemu-devel@nongnu.org; Wed, 30 Mar 2022 17:29:42 -0400
Received: from [2a00:1450:4864:20::244] (port=43569
 helo=mail-lj1-x244.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1)
 (envelope-from <vladimir.sementsov-ogievskiy@openvz.org>)
 id 1nZfsq-0003CI-EJ
 for qemu-devel@nongnu.org; Wed, 30 Mar 2022 17:29:42 -0400
Received: by mail-lj1-x244.google.com with SMTP id b43so24945603ljr.10
 for <qemu-devel@nongnu.org>; Wed, 30 Mar 2022 14:29:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=openvz-org.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Hgrx+O10M+cObYmv20+rJvbc8HXQCyD07lyL4PLsOa8=;
 b=gVGHINeE08F3BGot97mQM+Z7uWmdUJVTuQbNCqMcwcljFiOeAjKXJBigAXRfyq6jvA
 BNZup13daldSpPhLwHK6jP/2Od8N6FZgcCox0YNEEnOJsPxlZr3lEdJxL8soxpEefxKt
 J9DBoOt/gCL5hQKxK4t1ETBIxhEjIbu/a1P/5y1EN7aO5HYm1kMjdUpVu+Cxo47gXf2o
 Mx2mB1a8068iUusNw2tiXvG5cBEmErfrcK727eScKTDq9xiC5DbJdLT2h7MF2o5lgTIQ
 No4SNHJniPqeMunFQAIonM6W5drPhZSzzz1UuZP0y6qZPXq3XPZEkeoyy6tOsyghKcDJ
 i/4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Hgrx+O10M+cObYmv20+rJvbc8HXQCyD07lyL4PLsOa8=;
 b=bBLmeTij8AgVIh2I8MCNErQLM1gxPQ6l5Vo1kWmOCw2LFZgAOz4RRaTnTBBqoPO6yI
 yE3mGJMAF48em1SfRmtTSTFcRQ5Uw+p/bwDQoszxozBGXv7HCP/bvlkUwgiRiLBIpOKx
 qXKXJihFNRO7Ta7WlRxsKGqf0n1wXeQRmJgjA9cs6Y36fQjz0lhzC4bXc2ddn2zsl6Yk
 ew6Tbc2ga16tqLhdj9a7+VpVUBXDv8VL6ASD19IekDDGETxa1D3+nzq/VSgyRhgMn5Qu
 P91f4oqie+iC16plZAf5L3+27zUQwKzPvNaMPDID3F3ekj83O80uwppHax3uuxGpDRp8
 N/kg==
X-Gm-Message-State: AOAM5330MdcHYQ+YLvyEQ0xrSyUKQfqoee+u853X+/8HFn9u9BylK2uF
 ZtHaiaKF+scJ9MD4FXoYU2iiCw==
X-Google-Smtp-Source: ABdhPJzP5TK8DKLYIYDFTW/cH+q1IaO+Q3IYrVRpgcCvihs9LWe+cPRyPmHfa1y6b8oaMrA+BjubZA==
X-Received: by 2002:a2e:9e95:0:b0:249:76e0:e86 with SMTP id
 f21-20020a2e9e95000000b0024976e00e86mr8341516ljk.232.1648675778839; 
 Wed, 30 Mar 2022 14:29:38 -0700 (PDT)
Received: from fedora.. ([185.215.60.153]) by smtp.gmail.com with ESMTPSA id
 y3-20020a056512044300b0044a9bda3242sm1057573lfk.90.2022.03.30.14.29.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 30 Mar 2022 14:29:38 -0700 (PDT)
From: Vladimir Sementsov-Ogievskiy <vladimir.sementsov-ogievskiy@openvz.org>
X-Google-Original-From: Vladimir Sementsov-Ogievskiy <vsementsov@openvz.org>
To: qemu-block@nongnu.org
Subject: [PATCH v5 12/45] Revert "block: Pass BdrvChild ** to
 replace_child_noperm"
Date: Thu, 31 Mar 2022 00:28:29 +0300
Message-Id: <20220330212902.590099-13-vsementsov@openvz.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220330212902.590099-1-vsementsov@openvz.org>
References: <20220330212902.590099-1-vsementsov@openvz.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::244
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::244;
 envelope-from=vladimir.sementsov-ogievskiy@openvz.org;
 helo=mail-lj1-x244.google.com
X-Spam_score_int: -4
X-Spam_score: -0.5
X-Spam_bar: /
X-Spam_report: (-0.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Wed, 30 Mar 2022 19:17:23 -0400
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: kwolf@redhat.com, hreitz@redhat.com, vsementsov@openvz.org,
 v.sementsov-og@mail.ru, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

That's a preparation to previously reverted
"block: Let replace_child_noperm free children". Drop it too, we don't
need it for a new approach.

This reverts commit be64bbb0149748f3999c49b13976aafb8330ea86.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@openvz.org>
---
 block.c | 23 +++++++++++------------
 1 file changed, 11 insertions(+), 12 deletions(-)

diff --git a/block.c b/block.c
index 34eee40d48..8e8ed639fe 100644
--- a/block.c
+++ b/block.c
@@ -90,7 +90,7 @@ static BlockDriverState *bdrv_open_inherit(const char *filename,
 static bool bdrv_recurse_has_child(BlockDriverState *bs,
                                    BlockDriverState *child);
 
-static void bdrv_replace_child_noperm(BdrvChild **child,
+static void bdrv_replace_child_noperm(BdrvChild *child,
                                       BlockDriverState *new_bs);
 static void bdrv_remove_file_or_backing_child(BlockDriverState *bs,
                                               BdrvChild *child,
@@ -2352,7 +2352,7 @@ static void bdrv_replace_child_abort(void *opaque)
 
     GLOBAL_STATE_CODE();
     /* old_bs reference is transparently moved from @s to @s->child */
-    bdrv_replace_child_noperm(&s->child, s->old_bs);
+    bdrv_replace_child_noperm(s->child, s->old_bs);
     bdrv_unref(new_bs);
 }
 
@@ -2382,7 +2382,7 @@ static void bdrv_replace_child_tran(BdrvChild *child, BlockDriverState *new_bs,
     if (new_bs) {
         bdrv_ref(new_bs);
     }
-    bdrv_replace_child_noperm(&child, new_bs);
+    bdrv_replace_child_noperm(child, new_bs);
     /* old_bs reference is transparently moved from @child to @s */
 }
 
@@ -2764,10 +2764,9 @@ uint64_t bdrv_qapi_perm_to_blk_perm(BlockPermission qapi_perm)
     return permissions[qapi_perm];
 }
 
-static void bdrv_replace_child_noperm(BdrvChild **childp,
+static void bdrv_replace_child_noperm(BdrvChild *child,
                                       BlockDriverState *new_bs)
 {
-    BdrvChild *child = *childp;
     BlockDriverState *old_bs = child->bs;
     int new_bs_quiesce_counter;
     int drain_saldo;
@@ -2865,7 +2864,7 @@ static void bdrv_attach_child_common_abort(void *opaque)
     BlockDriverState *bs = child->bs;
 
     GLOBAL_STATE_CODE();
-    bdrv_replace_child_noperm(s->child, NULL);
+    bdrv_replace_child_noperm(child, NULL);
 
     if (bdrv_get_aio_context(bs) != s->old_child_ctx) {
         bdrv_try_set_aio_context(bs, s->old_child_ctx, &error_abort);
@@ -2966,7 +2965,7 @@ static int bdrv_attach_child_common(BlockDriverState *child_bs,
     }
 
     bdrv_ref(child_bs);
-    bdrv_replace_child_noperm(&new_child, child_bs);
+    bdrv_replace_child_noperm(new_child, child_bs);
 
     *child = new_child;
 
@@ -3022,13 +3021,13 @@ static int bdrv_attach_child_noperm(BlockDriverState *parent_bs,
     return 0;
 }
 
-static void bdrv_detach_child(BdrvChild **childp)
+static void bdrv_detach_child(BdrvChild *child)
 {
-    BlockDriverState *old_bs = (*childp)->bs;
+    BlockDriverState *old_bs = child->bs;
 
     GLOBAL_STATE_CODE();
-    bdrv_replace_child_noperm(childp, NULL);
-    bdrv_child_free(*childp);
+    bdrv_replace_child_noperm(child, NULL);
+    bdrv_child_free(child);
 
     if (old_bs) {
         /*
@@ -3140,7 +3139,7 @@ void bdrv_root_unref_child(BdrvChild *child)
     GLOBAL_STATE_CODE();
 
     child_bs = child->bs;
-    bdrv_detach_child(&child);
+    bdrv_detach_child(child);
     bdrv_unref(child_bs);
 }
 
-- 
2.35.1


