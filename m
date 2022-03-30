Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 40F754ED02A
	for <lists+qemu-devel@lfdr.de>; Thu, 31 Mar 2022 01:31:03 +0200 (CEST)
Received: from localhost ([::1]:52780 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nZhmI-0004zx-Ar
	for lists+qemu-devel@lfdr.de; Wed, 30 Mar 2022 19:31:02 -0400
Received: from eggs.gnu.org ([209.51.188.92]:34958)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <vladimir.sementsov-ogievskiy@openvz.org>)
 id 1nZfsx-00086D-Es
 for qemu-devel@nongnu.org; Wed, 30 Mar 2022 17:29:47 -0400
Received: from [2a00:1450:4864:20::135] (port=39804
 helo=mail-lf1-x135.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1)
 (envelope-from <vladimir.sementsov-ogievskiy@openvz.org>)
 id 1nZfsu-0003G4-Pv
 for qemu-devel@nongnu.org; Wed, 30 Mar 2022 17:29:47 -0400
Received: by mail-lf1-x135.google.com with SMTP id w7so38087793lfd.6
 for <qemu-devel@nongnu.org>; Wed, 30 Mar 2022 14:29:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=openvz-org.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=4ytAks2jG8KKwVV8IC6XjHE92QZLs2fSb+2ALIrCXvU=;
 b=kmGmIeB8ZrHPWmz6AgT0lNEKGntW5g6PEmMmO+iOCVnrfFjmIzGs2D9uEM5xF6GAYn
 bN6jwwEcYxK9gcXqhbzimzDFTt96cG4ZwiaszmEVtftnjjevv9mSU3FKH/row1Cb0UrL
 Vm8tT/ArvOJoVlHBT2qwCFKZFTiN56GMqg0IzdnJyPhOLZn2NDeJX3HbsLGEA5nLnoZl
 Js96eVfHu2JMELLRq6WZdX0cT7AtUCCRlREooQCpmidETXsEVL0gdW3ZdDs21Jb7ENR/
 M5qiqKqCMLmqOZv0lkB1y8aTsoZpT2xJVjNdVI96IJSXsPcHFXHv277bqoUUtSgqfydE
 9bXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=4ytAks2jG8KKwVV8IC6XjHE92QZLs2fSb+2ALIrCXvU=;
 b=fXMKcjQph6Rx/9k7Ep5XH4F692WhBx54xlGuF7AX0+7UqLXEKkS4Brt3C3UbfJpRoi
 PYaxWhVjg6gY68Iv2jb9KUYpak5qiBQT4VFuHjvPcw6PxuZK2aKphZbj6IC5GB5WcbOQ
 yQm1Xd9uhUs3fBeXEEkZcFJfW1367X8OyVd0PqAG8ISeG+jhGB6E7T2QEeix6r31/Snw
 uznLOtmYVxR8D6DAqFWFKNsNKibAqhfKJ4GZHLezLjPzpBSfc/pYoJsQSN3Gm3tk74+9
 6a3WD26QoNShAsVuVD0miB69R0Qrj07boxjvuBZB7Zwf2mrmGPZTRU23mGBc1D5+Dtw7
 wHig==
X-Gm-Message-State: AOAM532Ws9qtoNZSpXtIlrgiTB/xCLoBlcxbtirrwEX3wvY7tJpnMYQe
 UAZSGPJjZ0iPlAApP4vCe/3iJw==
X-Google-Smtp-Source: ABdhPJwP+o7ZudLLEWosAoWQPakQyrhde941B5Hb61Rib2Jx/YEr5zlEfOUmKgZcfCBKqSGx2LiDmA==
X-Received: by 2002:a05:6512:31d5:b0:44a:7a30:d83 with SMTP id
 j21-20020a05651231d500b0044a7a300d83mr8096362lfe.330.1648675783140; 
 Wed, 30 Mar 2022 14:29:43 -0700 (PDT)
Received: from fedora.. ([185.215.60.153]) by smtp.gmail.com with ESMTPSA id
 y3-20020a056512044300b0044a9bda3242sm1057573lfk.90.2022.03.30.14.29.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 30 Mar 2022 14:29:42 -0700 (PDT)
From: Vladimir Sementsov-Ogievskiy <vladimir.sementsov-ogievskiy@openvz.org>
X-Google-Original-From: Vladimir Sementsov-Ogievskiy <vsementsov@openvz.org>
To: qemu-block@nongnu.org
Subject: [PATCH v5 19/45] block: refactor bdrv_list_refresh_perms to allow any
 list of nodes
Date: Thu, 31 Mar 2022 00:28:36 +0300
Message-Id: <20220330212902.590099-20-vsementsov@openvz.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220330212902.590099-1-vsementsov@openvz.org>
References: <20220330212902.590099-1-vsementsov@openvz.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::135
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::135;
 envelope-from=vladimir.sementsov-ogievskiy@openvz.org;
 helo=mail-lf1-x135.google.com
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

We are going to increase usage of collecting nodes in a list to then
update, and calling bdrv_topological_dfs() each time is not convenient,
and not correct as we are going to interleave graph modifying with
filling the node list.

So, let's switch to a function that takes any list of nodes, adds all
their subtrees and do topological sort. And finally, refresh
permissions.

While being here, make the function public, as we'll want to use it
from blockdev.c in near future.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@openvz.org>
---
 block.c | 51 ++++++++++++++++++++++++++++++++-------------------
 1 file changed, 32 insertions(+), 19 deletions(-)

diff --git a/block.c b/block.c
index f3ed351360..9009f73534 100644
--- a/block.c
+++ b/block.c
@@ -2487,8 +2487,12 @@ static int bdrv_node_refresh_perm(BlockDriverState *bs, BlockReopenQueue *q,
     return 0;
 }
 
-static int bdrv_list_refresh_perms(GSList *list, BlockReopenQueue *q,
-                                   Transaction *tran, Error **errp)
+/*
+ * @list is a product of bdrv_topological_dfs() (may be called several times) -
+ * a topologically sorted subgraph.
+ */
+static int bdrv_do_refresh_perms(GSList *list, BlockReopenQueue *q,
+                                 Transaction *tran, Error **errp)
 {
     int ret;
     BlockDriverState *bs;
@@ -2510,6 +2514,24 @@ static int bdrv_list_refresh_perms(GSList *list, BlockReopenQueue *q,
     return 0;
 }
 
+/*
+ * @list is any list of nodes. List is completed by all subtreees and
+ * topologically sorted. It's not a problem if some node occurs in the @list
+ * several times.
+ */
+static int bdrv_list_refresh_perms(GSList *list, BlockReopenQueue *q,
+                                   Transaction *tran, Error **errp)
+{
+    g_autoptr(GHashTable) found = g_hash_table_new(NULL, NULL);
+    g_autoptr(GSList) refresh_list = NULL;
+
+    for ( ; list; list = list->next) {
+        refresh_list = bdrv_topological_dfs(refresh_list, found, list->data);
+    }
+
+    return bdrv_do_refresh_perms(refresh_list, q, tran, errp);
+}
+
 void bdrv_get_cumulative_perm(BlockDriverState *bs, uint64_t *perm,
                               uint64_t *shared_perm)
 {
@@ -2570,7 +2592,7 @@ static int bdrv_refresh_perms(BlockDriverState *bs, Transaction *tran,
         tran = local_tran = tran_new();
     }
 
-    ret = bdrv_list_refresh_perms(list, NULL, tran, errp);
+    ret = bdrv_do_refresh_perms(list, NULL, tran, errp);
 
     if (local_tran) {
         tran_finalize(local_tran, ret);
@@ -4339,7 +4361,6 @@ int bdrv_reopen_multiple(BlockReopenQueue *bs_queue, Error **errp)
     BlockReopenQueueEntry *bs_entry, *next;
     AioContext *ctx;
     Transaction *tran = tran_new();
-    g_autoptr(GHashTable) found = NULL;
     g_autoptr(GSList) refresh_list = NULL;
 
     assert(qemu_get_current_aio_context() == qemu_get_aio_context());
@@ -4369,18 +4390,15 @@ int bdrv_reopen_multiple(BlockReopenQueue *bs_queue, Error **errp)
         bs_entry->prepared = true;
     }
 
-    found = g_hash_table_new(NULL, NULL);
     QTAILQ_FOREACH(bs_entry, bs_queue, entry) {
         BDRVReopenState *state = &bs_entry->state;
 
-        refresh_list = bdrv_topological_dfs(refresh_list, found, state->bs);
+        refresh_list = g_slist_prepend(refresh_list, state->bs);
         if (state->old_backing_bs) {
-            refresh_list = bdrv_topological_dfs(refresh_list, found,
-                                                state->old_backing_bs);
+            refresh_list = g_slist_prepend(refresh_list, state->old_backing_bs);
         }
         if (state->old_file_bs) {
-            refresh_list = bdrv_topological_dfs(refresh_list, found,
-                                                state->old_file_bs);
+            refresh_list = g_slist_prepend(refresh_list, state->old_file_bs);
         }
     }
 
@@ -5100,7 +5118,6 @@ static int bdrv_replace_node_common(BlockDriverState *from,
                                     Error **errp)
 {
     Transaction *tran = tran_new();
-    g_autoptr(GHashTable) found = NULL;
     g_autoptr(GSList) refresh_list = NULL;
     BlockDriverState *to_cow_parent = NULL;
     int ret;
@@ -5141,10 +5158,8 @@ static int bdrv_replace_node_common(BlockDriverState *from,
         bdrv_remove_child(bdrv_filter_or_cow_child(to_cow_parent), tran);
     }
 
-    found = g_hash_table_new(NULL, NULL);
-
-    refresh_list = bdrv_topological_dfs(refresh_list, found, to);
-    refresh_list = bdrv_topological_dfs(refresh_list, found, from);
+    refresh_list = g_slist_prepend(refresh_list, to);
+    refresh_list = g_slist_prepend(refresh_list, from);
 
     ret = bdrv_list_refresh_perms(refresh_list, NULL, tran, errp);
     if (ret < 0) {
@@ -5227,7 +5242,6 @@ int bdrv_replace_child_bs(BdrvChild *child, BlockDriverState *new_bs,
 {
     int ret;
     Transaction *tran = tran_new();
-    g_autoptr(GHashTable) found = NULL;
     g_autoptr(GSList) refresh_list = NULL;
     BlockDriverState *old_bs = child->bs;
 
@@ -5239,9 +5253,8 @@ int bdrv_replace_child_bs(BdrvChild *child, BlockDriverState *new_bs,
 
     bdrv_replace_child_tran(child, new_bs, tran);
 
-    found = g_hash_table_new(NULL, NULL);
-    refresh_list = bdrv_topological_dfs(refresh_list, found, old_bs);
-    refresh_list = bdrv_topological_dfs(refresh_list, found, new_bs);
+    refresh_list = g_slist_prepend(refresh_list, old_bs);
+    refresh_list = g_slist_prepend(refresh_list, new_bs);
 
     ret = bdrv_list_refresh_perms(refresh_list, NULL, tran, errp);
 
-- 
2.35.1


