Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E4DF4ED074
	for <lists+qemu-devel@lfdr.de>; Thu, 31 Mar 2022 01:55:25 +0200 (CEST)
Received: from localhost ([::1]:47186 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nZi9s-0005uK-CC
	for lists+qemu-devel@lfdr.de; Wed, 30 Mar 2022 19:55:24 -0400
Received: from eggs.gnu.org ([209.51.188.92]:35508)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <vladimir.sementsov-ogievskiy@openvz.org>)
 id 1nZft8-0008IG-Ti
 for qemu-devel@nongnu.org; Wed, 30 Mar 2022 17:30:00 -0400
Received: from [2a00:1450:4864:20::12d] (port=37758
 helo=mail-lf1-x12d.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1)
 (envelope-from <vladimir.sementsov-ogievskiy@openvz.org>)
 id 1nZft6-0003P9-KE
 for qemu-devel@nongnu.org; Wed, 30 Mar 2022 17:29:58 -0400
Received: by mail-lf1-x12d.google.com with SMTP id k21so38085605lfe.4
 for <qemu-devel@nongnu.org>; Wed, 30 Mar 2022 14:29:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=openvz-org.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=3kgbncAbR+L+SPnsiq1IjgIb9WpA6vR5yyOkbJ3O8uw=;
 b=jJB7IR1dOegD5PkhLlG0lAJyobd9YPLfTnfN1XRjWwMmiks26rjRdbD5DKbwtu6x33
 kb1dHm3waTQR7I46vYRBPX4EqoRP1eMgFo+MLPFODPVCHG118bAXDHAR8nn9LZb1+Hew
 EUsxOhA1bFKldplAGoU+SlMf4BS4RqqHxIWau2jB6okqBLihmDxuBd5MqdRHPwvqDa2u
 wMqSs3pMpzRw1tbs5RjKsRPToWZuRgPxb3+iFdT9PKSQd9iIFM/UgSdbnaOxs7Duu8Sh
 UI012bZPI0Fr+A991WbiEqbZDaxQ3x9oF5zM8iW7HePM4V+VcWc8OoKNIdfydeiMejTA
 Sa8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=3kgbncAbR+L+SPnsiq1IjgIb9WpA6vR5yyOkbJ3O8uw=;
 b=rJXwI4yTYFPpedKaRxnyRrewbob92gZgNGykr9P9inMFVi6L4cJUYPf1X0i1sjXN7Y
 4+kECWWKnLg9Ql+XS5MErmVZ2gHqlWf2t8yY07fdR2pJ5ub1MiHyEiOA2ZR2MHHKrZpN
 Vc36+SRZtrWPE216IlfN8xqIYAn6J0Ggpp1daAOa6WbBhfVWTPg+NOOcywfehv5Kl/z4
 BCrkQ4HR22DzS9/22q1rWIjjr/+0p7UmxYobY8TlsFVRBSOnNDiuHCGuLEqTy791BPfk
 deWriUhbjq8rd/IkD930+A3Dnz5cjZ9GSJHQ1WqvCWaJ5S40R7SoE8W668q49sVjtfpX
 dvXw==
X-Gm-Message-State: AOAM532iSGE1x1ubi09BoZMI0V3rLPl0rnordOk52E6gmEOS2ieMIBoi
 Ql56EF3rMOz9fSkPeWW8UR6etg==
X-Google-Smtp-Source: ABdhPJzKTYwp6AnEt/k1KYQkHMowAbeesrjFjeT2FnaZVrGjWxlWXVSLIJ/S7Oi0uRYrIFCQd14zjQ==
X-Received: by 2002:a05:6512:1383:b0:44a:69a9:d336 with SMTP id
 p3-20020a056512138300b0044a69a9d336mr8226428lfa.493.1648675793867; 
 Wed, 30 Mar 2022 14:29:53 -0700 (PDT)
Received: from fedora.. ([185.215.60.153]) by smtp.gmail.com with ESMTPSA id
 y3-20020a056512044300b0044a9bda3242sm1057573lfk.90.2022.03.30.14.29.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 30 Mar 2022 14:29:53 -0700 (PDT)
From: Vladimir Sementsov-Ogievskiy <vladimir.sementsov-ogievskiy@openvz.org>
X-Google-Original-From: Vladimir Sementsov-Ogievskiy <vsementsov@openvz.org>
To: qemu-block@nongnu.org
Subject: [PATCH v5 36/45] block: bdrv_replace_child_bs(): move to external
 transaction
Date: Thu, 31 Mar 2022 00:28:53 +0300
Message-Id: <20220330212902.590099-37-vsementsov@openvz.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220330212902.590099-1-vsementsov@openvz.org>
References: <20220330212902.590099-1-vsementsov@openvz.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::12d
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::12d;
 envelope-from=vladimir.sementsov-ogievskiy@openvz.org;
 helo=mail-lf1-x12d.google.com
X-Spam_score_int: -4
X-Spam_score: -0.5
X-Spam_bar: /
X-Spam_report: (-0.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Wed, 30 Mar 2022 19:17:26 -0400
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

We'll need this functionality as part of external transaction, so make
the whole function to be transaction action. For this we need to
introduce a transaction action helper: bdrv_drained(), which calls
bdrv_drained_begin() and postpone bdrv_drained_end() to .clean() phase.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@openvz.org>
---
 block.c                            | 42 +++++++++++++++++++-----------
 block/block-backend.c              |  9 ++++++-
 include/block/block-global-state.h |  2 +-
 3 files changed, 36 insertions(+), 17 deletions(-)

diff --git a/block.c b/block.c
index 9e1be402e2..4b5b7d8794 100644
--- a/block.c
+++ b/block.c
@@ -5341,32 +5341,44 @@ out:
     return ret;
 }
 
+static void bdrv_drained_clean(void *opaque)
+{
+    BlockDriverState *bs = opaque;
+
+    bdrv_drained_end(bs);
+    bdrv_unref(bs);
+}
+
+TransactionActionDrv bdrv_drained_drv = {
+    .clean = bdrv_drained_clean,
+};
+
+/*
+ * Start drained section on @bs, and finish it in .clean action.
+ * Reference to @bs is kept, so @bs can't be removed during transaction.
+ */
+static void bdrv_drained(BlockDriverState *bs, Transaction *tran)
+{
+    bdrv_ref(bs);
+    bdrv_drained_begin(bs);
+    tran_add(tran, &bdrv_drained_drv, bs);
+}
+
 /* Not for empty child */
 int bdrv_replace_child_bs(BdrvChild *child, BlockDriverState *new_bs,
-                          Error **errp)
+                          Transaction *tran, Error **errp)
 {
-    int ret;
-    Transaction *tran = tran_new();
     g_autoptr(GSList) refresh_list = NULL;
     BlockDriverState *old_bs = child->bs;
 
     GLOBAL_STATE_CODE();
 
-    bdrv_ref(old_bs);
-    bdrv_drained_begin(old_bs);
-    bdrv_drained_begin(new_bs);
+    bdrv_drained(old_bs, tran);
+    bdrv_drained(new_bs, tran);
 
     bdrv_replace_child_tran(child, new_bs, &refresh_list, tran);
 
-    ret = bdrv_list_refresh_perms(refresh_list, NULL, tran, errp);
-
-    tran_finalize(tran, ret);
-
-    bdrv_drained_end(old_bs);
-    bdrv_drained_end(new_bs);
-    bdrv_unref(old_bs);
-
-    return ret;
+    return bdrv_list_refresh_perms(refresh_list, NULL, tran, errp);
 }
 
 static void bdrv_delete(BlockDriverState *bs)
diff --git a/block/block-backend.c b/block/block-backend.c
index f5476bb9fc..fa1d810da2 100644
--- a/block/block-backend.c
+++ b/block/block-backend.c
@@ -929,8 +929,15 @@ int blk_insert_bs(BlockBackend *blk, BlockDriverState *bs, Error **errp)
  */
 int blk_replace_bs(BlockBackend *blk, BlockDriverState *new_bs, Error **errp)
 {
+    int ret;
+    Transaction *tran = tran_new();
+
     GLOBAL_STATE_CODE();
-    return bdrv_replace_child_bs(blk->root, new_bs, errp);
+
+    ret = bdrv_replace_child_bs(blk->root, new_bs, tran, errp);
+    tran_finalize(tran, ret);
+
+    return ret;
 }
 
 /*
diff --git a/include/block/block-global-state.h b/include/block/block-global-state.h
index 8527bcad28..fa5f698228 100644
--- a/include/block/block-global-state.h
+++ b/include/block/block-global-state.h
@@ -65,7 +65,7 @@ int bdrv_append(BlockDriverState *bs_new, BlockDriverState *bs_top,
 int bdrv_replace_node(BlockDriverState *from, BlockDriverState *to,
                       Error **errp);
 int bdrv_replace_child_bs(BdrvChild *child, BlockDriverState *new_bs,
-                          Error **errp);
+                          Transaction *tran, Error **errp);
 BlockDriverState *bdrv_insert_node(BlockDriverState *bs, QDict *node_options,
                                    int flags, Error **errp);
 int bdrv_drop_filter(BlockDriverState *bs, Error **errp);
-- 
2.35.1


