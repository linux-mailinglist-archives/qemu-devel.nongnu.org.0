Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 169504ED01C
	for <lists+qemu-devel@lfdr.de>; Thu, 31 Mar 2022 01:30:03 +0200 (CEST)
Received: from localhost ([::1]:51024 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nZhlK-0003of-2O
	for lists+qemu-devel@lfdr.de; Wed, 30 Mar 2022 19:30:02 -0400
Received: from eggs.gnu.org ([209.51.188.92]:34812)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <vladimir.sementsov-ogievskiy@openvz.org>)
 id 1nZfsu-000823-OH
 for qemu-devel@nongnu.org; Wed, 30 Mar 2022 17:29:44 -0400
Received: from [2a00:1450:4864:20::234] (port=45607
 helo=mail-lj1-x234.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1)
 (envelope-from <vladimir.sementsov-ogievskiy@openvz.org>)
 id 1nZfsr-0003DS-PK
 for qemu-devel@nongnu.org; Wed, 30 Mar 2022 17:29:44 -0400
Received: by mail-lj1-x234.google.com with SMTP id q14so29438128ljc.12
 for <qemu-devel@nongnu.org>; Wed, 30 Mar 2022 14:29:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=openvz-org.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=0BsZDlG5/Je7DCELDZn+xW6JtHGolaaxAhVN99vmYhA=;
 b=3G/Ljtv7JRbX4rsKOxUo4Z5I7mGhBX1LTz420qAk3nSOTWeIO3xN2WUlm5wMhQlm9C
 VjqzQjdhTwfRx7h2OjZua8fR5BMH8teY/jKGxyld7fd4r5F4VkWOHkPh/DGStmz6MUbi
 mt4VygQwNIyDUmNIgT8mHrhSN6HWNeBvUn8ehsftQ7j5DWcuDrJsHDbu/QzBUrvpUZS8
 k41nsw92w30y4U2d7g+Jp54F9400oPoUIJnmh6LDCvcJZVxIAPRWt4SMZDCPV1Lz7IAc
 vqmH4QQxNxewA0pxlgP5tMEZJBhcabMfH6vhmfb+ocCa77dWqNKOk1KV9CIxn17fEeP6
 r8FQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=0BsZDlG5/Je7DCELDZn+xW6JtHGolaaxAhVN99vmYhA=;
 b=Qtfn0mZQYpIDFVCCPLiF79KFEqFga6ztc8UNpIaiDVg3EJ3FG52CUgC1eYFhpYto55
 GXBQWJEQl7B0JFAuBO1SWicHvt0jyFi104gGa56qj2/wMiku6tfck04X9uHrx6AXzvIM
 sFtNOUJNH8hYznnuK9wOv9YTPl9MreuYU2etWm+DIZdQRCiiJwWwRlNz/BCvBINaFrWq
 PRpLjtWbNxTAKEX8t541QcPxiJyxLa1qDO2oL/SDcGxG5ctZ1pmaAZytOtS4YPhnSkJ8
 IxKpnUPaF6JURifVtyJzVUydr69OCQix3ytLRjqEPtRk6fln0JATQGI3Mi+TXOffKlLn
 46mw==
X-Gm-Message-State: AOAM53031UtzJiJi8fvoibCmsvi0wru3cj/JxVRRWjk6NecLMDq+x+ct
 WHozwvtSlAEB/aLhUJra/zcmww==
X-Google-Smtp-Source: ABdhPJzOBsLxBoE7rWAuYk1Dzll8CDYOdFWbQRyUzhggnadaTMeyxNEIG+p2fJeuMEtuSbyzC27F9A==
X-Received: by 2002:a05:651c:210d:b0:24a:cd05:921c with SMTP id
 a13-20020a05651c210d00b0024acd05921cmr8485228ljq.522.1648675780078; 
 Wed, 30 Mar 2022 14:29:40 -0700 (PDT)
Received: from fedora.. ([185.215.60.153]) by smtp.gmail.com with ESMTPSA id
 y3-20020a056512044300b0044a9bda3242sm1057573lfk.90.2022.03.30.14.29.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 30 Mar 2022 14:29:39 -0700 (PDT)
From: Vladimir Sementsov-Ogievskiy <vladimir.sementsov-ogievskiy@openvz.org>
X-Google-Original-From: Vladimir Sementsov-Ogievskiy <vsementsov@openvz.org>
To: qemu-block@nongnu.org
Subject: [PATCH v5 14/45] block/snapshot: drop indirection around
 bdrv_snapshot_fallback_ptr
Date: Thu, 31 Mar 2022 00:28:31 +0300
Message-Id: <20220330212902.590099-15-vsementsov@openvz.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220330212902.590099-1-vsementsov@openvz.org>
References: <20220330212902.590099-1-vsementsov@openvz.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::234
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::234;
 envelope-from=vladimir.sementsov-ogievskiy@openvz.org;
 helo=mail-lj1-x234.google.com
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

Now the indirection is not actually used, we can safely reduce it to
simple pointer.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@openvz.org>
---
 block/snapshot.c | 39 +++++++++++++++++----------------------
 1 file changed, 17 insertions(+), 22 deletions(-)

diff --git a/block/snapshot.c b/block/snapshot.c
index 02a880911f..4eb9258de6 100644
--- a/block/snapshot.c
+++ b/block/snapshot.c
@@ -151,34 +151,29 @@ bool bdrv_snapshot_find_by_id_and_name(BlockDriverState *bs,
 }
 
 /**
- * Return a pointer to the child BDS pointer to which we can fall
+ * Return a pointer to child of given BDS to which we can fall
  * back if the given BDS does not support snapshots.
  * Return NULL if there is no BDS to (safely) fall back to.
- *
- * We need to return an indirect pointer because bdrv_snapshot_goto()
- * has to modify the BdrvChild pointer.
  */
-static BdrvChild **bdrv_snapshot_fallback_ptr(BlockDriverState *bs)
+static BdrvChild *bdrv_snapshot_fallback_ptr(BlockDriverState *bs)
 {
-    BdrvChild **fallback;
-    BdrvChild *child = bdrv_primary_child(bs);
+    BdrvChild *fallback = bdrv_primary_child(bs);
+    BdrvChild *child;
 
     /* We allow fallback only to primary child */
-    if (!child) {
+    if (!fallback) {
         return NULL;
     }
-    fallback = (child == bs->file ? &bs->file : &bs->backing);
-    assert(*fallback == child);
 
     /*
      * Check that there are no other children that would need to be
      * snapshotted.  If there are, it is not safe to fall back to
-     * *fallback.
+     * fallback.
      */
     QLIST_FOREACH(child, &bs->children, next) {
         if (child->role & (BDRV_CHILD_DATA | BDRV_CHILD_METADATA |
                            BDRV_CHILD_FILTERED) &&
-            child != *fallback)
+            child != fallback)
         {
             return NULL;
         }
@@ -189,8 +184,8 @@ static BdrvChild **bdrv_snapshot_fallback_ptr(BlockDriverState *bs)
 
 static BlockDriverState *bdrv_snapshot_fallback(BlockDriverState *bs)
 {
-    BdrvChild **child_ptr = bdrv_snapshot_fallback_ptr(bs);
-    return child_ptr ? (*child_ptr)->bs : NULL;
+    BdrvChild *child_ptr = bdrv_snapshot_fallback_ptr(bs);
+    return child_ptr ? child_ptr->bs : NULL;
 }
 
 int bdrv_can_snapshot(BlockDriverState *bs)
@@ -237,7 +232,7 @@ int bdrv_snapshot_goto(BlockDriverState *bs,
                        Error **errp)
 {
     BlockDriver *drv = bs->drv;
-    BdrvChild **fallback_ptr;
+    BdrvChild *fallback;
     int ret, open_ret;
 
     GLOBAL_STATE_CODE();
@@ -260,13 +255,13 @@ int bdrv_snapshot_goto(BlockDriverState *bs,
         return ret;
     }
 
-    fallback_ptr = bdrv_snapshot_fallback_ptr(bs);
-    if (fallback_ptr) {
+    fallback = bdrv_snapshot_fallback_ptr(bs);
+    if (fallback) {
         QDict *options;
         QDict *file_options;
         Error *local_err = NULL;
-        BlockDriverState *fallback_bs = (*fallback_ptr)->bs;
-        char *subqdict_prefix = g_strdup_printf("%s.", (*fallback_ptr)->name);
+        BlockDriverState *fallback_bs = fallback->bs;
+        char *subqdict_prefix = g_strdup_printf("%s.", fallback->name);
 
         options = qdict_clone_shallow(bs->options);
 
@@ -277,8 +272,8 @@ int bdrv_snapshot_goto(BlockDriverState *bs,
         qobject_unref(file_options);
         g_free(subqdict_prefix);
 
-        /* Force .bdrv_open() below to re-attach fallback_bs on *fallback_ptr */
-        qdict_put_str(options, (*fallback_ptr)->name,
+        /* Force .bdrv_open() below to re-attach fallback_bs on fallback */
+        qdict_put_str(options, fallback->name,
                       bdrv_get_node_name(fallback_bs));
 
         /* Now close bs, apply the snapshot on fallback_bs, and re-open bs */
@@ -287,7 +282,7 @@ int bdrv_snapshot_goto(BlockDriverState *bs,
         }
 
         /* .bdrv_open() will re-attach it */
-        bdrv_unref_child(bs, *fallback_ptr);
+        bdrv_unref_child(bs, fallback);
 
         ret = bdrv_snapshot_goto(fallback_bs, snapshot_id, errp);
         open_ret = drv->bdrv_open(bs, options, bs->open_flags, &local_err);
-- 
2.35.1


