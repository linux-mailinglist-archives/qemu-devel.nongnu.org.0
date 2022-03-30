Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DF32E4ED033
	for <lists+qemu-devel@lfdr.de>; Thu, 31 Mar 2022 01:33:24 +0200 (CEST)
Received: from localhost ([::1]:59556 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nZhoZ-0001Cb-Vn
	for lists+qemu-devel@lfdr.de; Wed, 30 Mar 2022 19:33:24 -0400
Received: from eggs.gnu.org ([209.51.188.92]:34854)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <vladimir.sementsov-ogievskiy@openvz.org>)
 id 1nZfsv-00083K-GP
 for qemu-devel@nongnu.org; Wed, 30 Mar 2022 17:29:45 -0400
Received: from [2a00:1450:4864:20::22e] (port=41629
 helo=mail-lj1-x22e.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1)
 (envelope-from <vladimir.sementsov-ogievskiy@openvz.org>)
 id 1nZfss-0003Dq-BS
 for qemu-devel@nongnu.org; Wed, 30 Mar 2022 17:29:45 -0400
Received: by mail-lj1-x22e.google.com with SMTP id 17so29456221ljw.8
 for <qemu-devel@nongnu.org>; Wed, 30 Mar 2022 14:29:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=openvz-org.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=w/XPFB50s2E7QmKXWVgr4ZxiBQcgFd5eEk1tVhq6TfI=;
 b=WMmknK1s9W5MJLo3aWzjUCx4mMDVQQgoJwAKuXA2jD1NRppiWLuE04VUOB8F19EApV
 5rK4H4i9V8lULTzOijXh2cVc6138rgHZTGE886CVwLSqvjcCN6B7g2sD12g15a2I/vjn
 Y1zWvKFjSVmjlusMHNq+ryWagRGwCJRviRDrHcw22R8ERmLBcC/UKgHPWSu8+blp+XGi
 4jsBqB1GxwMctxwXGMmJHD7LRGbueHbNSM7E41QqYpiVZKshCBIEgDgQ1u9Zkm3A/HzK
 w2CxvIZtVnPptTIW7hPAH2a9c081YFNFBKvDZc65QtS3BW/8RTN6hudOiPykYTOiYF86
 ZmIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=w/XPFB50s2E7QmKXWVgr4ZxiBQcgFd5eEk1tVhq6TfI=;
 b=XC4qAbTS0p6eRXt0lXlO9pxp5lVFF1dxhmEzrXdkyDvZpQer+gA22cA482J4jlqGb+
 E4xpdAuBolUuvoTxeIpdrgRuk2WqaZmRzUL6zTyM3ggRLbdHQFwzOIs//ufECbDliyxH
 Y5gvl5ulvCE86LkbaWO2oLh2iAyJ2iKR1+mGIlIOELWg0EN+QE1Ljo3AQxp0nId4iXIP
 eSlZrO+J/F496cPZ/h5zfkW1YfSH2TGu8Qd0m/rtlV1u6gVVmOI7TNMfr1I3Z0SWzGu3
 u/Qu19BvKR9aREMlujhRODwsjmGf0yC1GXJD/5GLB/PXnRkNX317W/ZOlYiV3VekbvP7
 YnWA==
X-Gm-Message-State: AOAM533RvGJu/H/H8Ft5pOpAWgyAfUAeGDR+zm/W0czlXi9YuT8AiRh6
 MThJ3ux1aB0FdRz4wjOG/a0iiw==
X-Google-Smtp-Source: ABdhPJwwKJsuHeaWMxgIjhd1HoIfkfUGoXtBLpPmpT5Yaq+dfSiVetIFP9KfPcfWZ70USXLd0yOHdw==
X-Received: by 2002:a2e:9ad6:0:b0:248:a4ed:cff4 with SMTP id
 p22-20020a2e9ad6000000b00248a4edcff4mr8199143ljj.156.1648675780758; 
 Wed, 30 Mar 2022 14:29:40 -0700 (PDT)
Received: from fedora.. ([185.215.60.153]) by smtp.gmail.com with ESMTPSA id
 y3-20020a056512044300b0044a9bda3242sm1057573lfk.90.2022.03.30.14.29.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 30 Mar 2022 14:29:40 -0700 (PDT)
From: Vladimir Sementsov-Ogievskiy <vladimir.sementsov-ogievskiy@openvz.org>
X-Google-Original-From: Vladimir Sementsov-Ogievskiy <vsementsov@openvz.org>
To: qemu-block@nongnu.org
Subject: [PATCH v5 15/45] block: refactor bdrv_remove_file_or_backing_child to
 bdrv_remove_child
Date: Thu, 31 Mar 2022 00:28:32 +0300
Message-Id: <20220330212902.590099-16-vsementsov@openvz.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220330212902.590099-1-vsementsov@openvz.org>
References: <20220330212902.590099-1-vsementsov@openvz.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::22e
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::22e;
 envelope-from=vladimir.sementsov-ogievskiy@openvz.org;
 helo=mail-lj1-x22e.google.com
X-Spam_score_int: -4
X-Spam_score: -0.5
X-Spam_bar: /
X-Spam_report: (-0.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Wed, 30 Mar 2022 19:17:24 -0400
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

Now the function can remove any child, so give it more common name.
Drop assertions and drop bs argument which becomes unused. Function
would be reused in a further commit.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@openvz.org>
---
 block.c | 22 ++++++++--------------
 1 file changed, 8 insertions(+), 14 deletions(-)

diff --git a/block.c b/block.c
index 6b43e101a1..ea5687edc8 100644
--- a/block.c
+++ b/block.c
@@ -92,9 +92,7 @@ static bool bdrv_recurse_has_child(BlockDriverState *bs,
 
 static void bdrv_replace_child_noperm(BdrvChild *child,
                                       BlockDriverState *new_bs);
-static void bdrv_remove_file_or_backing_child(BlockDriverState *bs,
-                                              BdrvChild *child,
-                                              Transaction *tran);
+static void bdrv_remove_child(BdrvChild *child, Transaction *tran);
 static void bdrv_remove_filter_or_cow_child(BlockDriverState *bs,
                                             Transaction *tran);
 
@@ -3347,7 +3345,7 @@ static int bdrv_set_file_or_backing_noperm(BlockDriverState *parent_bs,
 
     if (child) {
         bdrv_unset_inherits_from(parent_bs, child, tran);
-        bdrv_remove_file_or_backing_child(parent_bs, child, tran);
+        bdrv_remove_child(child, tran);
     }
 
     if (!child_bs) {
@@ -5031,26 +5029,22 @@ static bool should_update_child(BdrvChild *c, BlockDriverState *to)
     return ret;
 }
 
-static void bdrv_remove_filter_or_cow_child_commit(void *opaque)
+static void bdrv_remove_child_commit(void *opaque)
 {
     GLOBAL_STATE_CODE();
     bdrv_child_free(opaque);
 }
 
-static TransactionActionDrv bdrv_remove_filter_or_cow_child_drv = {
-    .commit = bdrv_remove_filter_or_cow_child_commit,
+static TransactionActionDrv bdrv_remove_child_drv = {
+    .commit = bdrv_remove_child_commit,
 };
 
 /*
  * A function to remove backing or file child of @bs.
  * Function doesn't update permissions, caller is responsible for this.
  */
-static void bdrv_remove_file_or_backing_child(BlockDriverState *bs,
-                                              BdrvChild *child,
-                                              Transaction *tran)
+static void bdrv_remove_child(BdrvChild *child, Transaction *tran)
 {
-    assert(child == bs->backing || child == bs->file);
-
     if (!child) {
         return;
     }
@@ -5059,7 +5053,7 @@ static void bdrv_remove_file_or_backing_child(BlockDriverState *bs,
         bdrv_replace_child_tran(child, NULL, tran);
     }
 
-    tran_add(tran, &bdrv_remove_filter_or_cow_child_drv, child);
+    tran_add(tran, &bdrv_remove_child_drv, child);
 }
 
 /*
@@ -5070,7 +5064,7 @@ static void bdrv_remove_file_or_backing_child(BlockDriverState *bs,
 static void bdrv_remove_filter_or_cow_child(BlockDriverState *bs,
                                             Transaction *tran)
 {
-    bdrv_remove_file_or_backing_child(bs, bdrv_filter_or_cow_child(bs), tran);
+    bdrv_remove_child(bdrv_filter_or_cow_child(bs), tran);
 }
 
 static int bdrv_replace_node_noperm(BlockDriverState *from,
-- 
2.35.1


