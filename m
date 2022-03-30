Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A1BEE4ED005
	for <lists+qemu-devel@lfdr.de>; Thu, 31 Mar 2022 01:29:00 +0200 (CEST)
Received: from localhost ([::1]:47714 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nZhkJ-0001TR-Ni
	for lists+qemu-devel@lfdr.de; Wed, 30 Mar 2022 19:28:59 -0400
Received: from eggs.gnu.org ([209.51.188.92]:34530)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <vladimir.sementsov-ogievskiy@openvz.org>)
 id 1nZfsp-0007u2-8K
 for qemu-devel@nongnu.org; Wed, 30 Mar 2022 17:29:39 -0400
Received: from [2a00:1450:4864:20::22f] (port=43580
 helo=mail-lj1-x22f.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1)
 (envelope-from <vladimir.sementsov-ogievskiy@openvz.org>)
 id 1nZfsm-0003A3-T7
 for qemu-devel@nongnu.org; Wed, 30 Mar 2022 17:29:38 -0400
Received: by mail-lj1-x22f.google.com with SMTP id b43so24945424ljr.10
 for <qemu-devel@nongnu.org>; Wed, 30 Mar 2022 14:29:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=openvz-org.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=SJBZlblYQ0uvGPZOGYGUOIC4FWi1YI6/gm26RCeaZU0=;
 b=Qgk8lMGsLIM9rfjNNU+S3U0iDRtCdT93nWaHkYK6BL+odYfLlPFEK6Wtsr4H0mQqRR
 jhrMpD3CLp91vJWin04CN94Gva6EhJ09aRSG7MWA8I2+Cjw4IlmHMO5l7CRkx9afBiQZ
 poD/Fml3fFyHPWFkCouRe6Ah+Ux2JyuA4uCk4r1RbCM7IYKH5xfFqujcZdF3scsscy3x
 InPbDF86ACjip3GsH3J1Ilxamr1E03fIPZbX9+M6Rkjf2FkGVVxTlEOwc1z0pRMp2HV3
 AvoLhsAWNERSgxpHzjnzF9zN5nhz6INrKNNVkx7y9T785zFmdpolntmtpcn+EL1AMveZ
 Q4rQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=SJBZlblYQ0uvGPZOGYGUOIC4FWi1YI6/gm26RCeaZU0=;
 b=UNm8yPDkd2VFhDavRoHbyA5tteJt1hKTHdtWZlJRsOssmYXDQir0Rv794fNJ5Q32OT
 m3Dm6E3y7XLylr3qDEbwe/gBSKZplsiUk1Pc3Cm9Z3BYc8diV5A6ODCkj3GeT7lsi3EW
 nFXQrPkXGqlf1BHksz7giY9lX9Z7GFkEZfAGh5Wn2BPYhuGHGO+vBg0b/yLEJCxLkU23
 vr9KfhLvr+J1zscUvgzZ/5vEw2t6ayHSsTbjwp/rNcMqsVW6YFuIFxAgYy4T+FItSHq6
 tH5wJAp+Vx9+NTuya3iK/WL8ahBRCXDvYW61yJ9hPxekl05/WxvQESUBaV2S8SY9hvvX
 bm2g==
X-Gm-Message-State: AOAM531uTxBXLKUGtUkVsjHSo6BmTnAY7jaDlEkgXJ6ob89tQfdLs8ZR
 848GLmlWZqKUpZvZ2EF2NrtkQg==
X-Google-Smtp-Source: ABdhPJzR78iH1ZHG0UQNJI/IVAo5RscB4SuhTrzI2sTt7Do+dv95LXBBI5WZChn3DgeSk/zSySb4Uw==
X-Received: by 2002:a2e:7d18:0:b0:247:f205:96fa with SMTP id
 y24-20020a2e7d18000000b00247f20596famr8685795ljc.269.1648675775249; 
 Wed, 30 Mar 2022 14:29:35 -0700 (PDT)
Received: from fedora.. ([185.215.60.153]) by smtp.gmail.com with ESMTPSA id
 y3-20020a056512044300b0044a9bda3242sm1057573lfk.90.2022.03.30.14.29.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 30 Mar 2022 14:29:35 -0700 (PDT)
From: Vladimir Sementsov-Ogievskiy <vladimir.sementsov-ogievskiy@openvz.org>
X-Google-Original-From: Vladimir Sementsov-Ogievskiy <vsementsov@openvz.org>
To: qemu-block@nongnu.org
Subject: [PATCH v5 06/45] test-bdrv-graph-mod: fix filters to be filters
Date: Thu, 31 Mar 2022 00:28:23 +0300
Message-Id: <20220330212902.590099-7-vsementsov@openvz.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220330212902.590099-1-vsementsov@openvz.org>
References: <20220330212902.590099-1-vsementsov@openvz.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::22f
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::22f;
 envelope-from=vladimir.sementsov-ogievskiy@openvz.org;
 helo=mail-lj1-x22f.google.com
X-Spam_score_int: -4
X-Spam_score: -0.5
X-Spam_bar: /
X-Spam_report: (-0.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Wed, 30 Mar 2022 19:17:14 -0400
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

bdrv_pass_through is used as filter, even all node variables has
corresponding names. We want to append it, so it should be
backing-child-based filter like mirror_top.
So, in test_update_perm_tree, first child should be DATA, as we don't
want filters with two filtered children.

bdrv_exclusive_writer is used as a filter once. So it should be filter
anyway. We want to append it, so it should be backing-child-based
fitler too.

Make all FILTERED children to be PRIMARY as well. We are going to force
this rule by assertion soon.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@openvz.org>
---
 include/block/block_int-common.h |  5 +++--
 tests/unit/test-bdrv-graph-mod.c | 24 +++++++++++++++++-------
 2 files changed, 20 insertions(+), 9 deletions(-)

diff --git a/include/block/block_int-common.h b/include/block/block_int-common.h
index 9d91ccbcbf..d68adc6ff3 100644
--- a/include/block/block_int-common.h
+++ b/include/block/block_int-common.h
@@ -122,8 +122,9 @@ struct BlockDriver {
     /*
      * Only make sense for filter drivers, for others must be false.
      * If true, filtered child is bs->backing. Otherwise it's bs->file.
-     * Only two internal filters use bs->backing as filtered child and has this
-     * field set to true: mirror_top and commit_top.
+     * Two internal filters use bs->backing as filtered child and has this
+     * field set to true: mirror_top and commit_top. There also two such test
+     * filters in tests/unit/test-bdrv-graph-mod.c.
      *
      * Never create any more such filters!
      *
diff --git a/tests/unit/test-bdrv-graph-mod.c b/tests/unit/test-bdrv-graph-mod.c
index 40795d3c04..7265971013 100644
--- a/tests/unit/test-bdrv-graph-mod.c
+++ b/tests/unit/test-bdrv-graph-mod.c
@@ -26,6 +26,8 @@
 
 static BlockDriver bdrv_pass_through = {
     .format_name = "pass-through",
+    .is_filter = true,
+    .filtered_child_is_backing = true,
     .bdrv_child_perm = bdrv_default_perms,
 };
 
@@ -57,6 +59,8 @@ static void exclusive_write_perms(BlockDriverState *bs, BdrvChild *c,
 
 static BlockDriver bdrv_exclusive_writer = {
     .format_name = "exclusive-writer",
+    .is_filter = true,
+    .filtered_child_is_backing = true,
     .bdrv_child_perm = exclusive_write_perms,
 };
 
@@ -134,7 +138,7 @@ static void test_update_perm_tree(void)
     blk_insert_bs(root, bs, &error_abort);
 
     bdrv_attach_child(filter, bs, "child", &child_of_bds,
-                      BDRV_CHILD_FILTERED | BDRV_CHILD_PRIMARY, &error_abort);
+                      BDRV_CHILD_DATA, &error_abort);
 
     ret = bdrv_append(filter, bs, NULL);
     g_assert_cmpint(ret, <, 0);
@@ -228,11 +232,14 @@ static void test_parallel_exclusive_write(void)
      */
     bdrv_ref(base);
 
-    bdrv_attach_child(top, fl1, "backing", &child_of_bds, BDRV_CHILD_DATA,
+    bdrv_attach_child(top, fl1, "backing", &child_of_bds,
+                      BDRV_CHILD_FILTERED | BDRV_CHILD_PRIMARY,
                       &error_abort);
-    bdrv_attach_child(fl1, base, "backing", &child_of_bds, BDRV_CHILD_FILTERED,
+    bdrv_attach_child(fl1, base, "backing", &child_of_bds,
+                      BDRV_CHILD_FILTERED | BDRV_CHILD_PRIMARY,
                       &error_abort);
-    bdrv_attach_child(fl2, base, "backing", &child_of_bds, BDRV_CHILD_FILTERED,
+    bdrv_attach_child(fl2, base, "backing", &child_of_bds,
+                      BDRV_CHILD_FILTERED | BDRV_CHILD_PRIMARY,
                       &error_abort);
 
     bdrv_replace_node(fl1, fl2, &error_abort);
@@ -344,9 +351,11 @@ static void test_parallel_perm_update(void)
                               BDRV_CHILD_DATA, &error_abort);
     c_fl2 = bdrv_attach_child(ws, fl2, "second", &child_of_bds,
                               BDRV_CHILD_DATA, &error_abort);
-    bdrv_attach_child(fl1, base, "backing", &child_of_bds, BDRV_CHILD_FILTERED,
+    bdrv_attach_child(fl1, base, "backing", &child_of_bds,
+                      BDRV_CHILD_FILTERED | BDRV_CHILD_PRIMARY,
                       &error_abort);
-    bdrv_attach_child(fl2, base, "backing", &child_of_bds, BDRV_CHILD_FILTERED,
+    bdrv_attach_child(fl2, base, "backing", &child_of_bds,
+                      BDRV_CHILD_FILTERED | BDRV_CHILD_PRIMARY,
                       &error_abort);
 
     /* Select fl1 as first child to be active */
@@ -397,7 +406,8 @@ static void test_append_greedy_filter(void)
     BlockDriverState *base = no_perm_node("base");
     BlockDriverState *fl = exclusive_writer_node("fl1");
 
-    bdrv_attach_child(top, base, "backing", &child_of_bds, BDRV_CHILD_COW,
+    bdrv_attach_child(top, base, "backing", &child_of_bds,
+                      BDRV_CHILD_FILTERED | BDRV_CHILD_PRIMARY,
                       &error_abort);
 
     bdrv_append(fl, base, &error_abort);
-- 
2.35.1


