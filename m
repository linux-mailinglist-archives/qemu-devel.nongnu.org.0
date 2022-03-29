Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CBAD4EB516
	for <lists+qemu-devel@lfdr.de>; Tue, 29 Mar 2022 23:14:49 +0200 (CEST)
Received: from localhost ([::1]:46900 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nZJAu-0008J3-HL
	for lists+qemu-devel@lfdr.de; Tue, 29 Mar 2022 17:14:48 -0400
Received: from eggs.gnu.org ([209.51.188.92]:42424)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <v.sementsov-og@mail.ru>)
 id 1nZIfp-0004wk-Fs; Tue, 29 Mar 2022 16:42:42 -0400
Received: from smtp48.i.mail.ru ([94.100.177.108]:51692)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <v.sementsov-og@mail.ru>)
 id 1nZIfl-0006lU-Ti; Tue, 29 Mar 2022 16:42:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mail.ru;
 s=mail4; 
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:From:Subject:Content-Type:Content-Transfer-Encoding:To:Cc;
 bh=vfo65cQXjPOs/RZn95jWJXvOeBmjn1rRWFO/mONRJbw=; 
 t=1648586557;x=1649191957; 
 b=S5FH5lpQ5BrOQ+wBmPaE4NHpDDSEwgyRbYZQUQDeUaG5DVxcesLCQC86zDGDCwuFkAR1pFqO4brKEzglBr6rSnWfQJ9JFm83hbl7lLEbgJRQAHsaaJQDZol09wlaOQJIEX9vKEZ8A2OSH2KZXHj9ocZN/X+zpqkv19EpiSilpOcve9hb6qj1mQutqvNKwkbxFurSwkfbh8VrIIujfM/PN6TRDpwibAcYudc7LYaTGE29P7/VEDPMRGkou/LACYmnBaOP5ZiqXgu75/WbOrUbKKM/elmQPP1N8H0nh65RSAyzOYhX7KTKg5xeyzY8O1HEEVEqAkkWYW5Wj2nymHJ5jw==;
Received: by smtp48.i.mail.ru with esmtpa (envelope-from
 <v.sementsov-og@mail.ru>)
 id 1nZIfP-000374-NY; Tue, 29 Mar 2022 23:42:16 +0300
From: Vladimir Sementsov-Ogievskiy <v.sementsov-og@mail.ru>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, kwolf@redhat.com, hreitz@redhat.com,
 v.sementsov-og@mail.ru
Subject: [PATCH v4 19/45] block: refactor bdrv_list_refresh_perms to allow any
 list of nodes
Date: Tue, 29 Mar 2022 23:40:41 +0300
Message-Id: <20220329204107.411011-20-v.sementsov-og@mail.ru>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220329204107.411011-1-v.sementsov-og@mail.ru>
References: <20220329204107.411011-1-v.sementsov-og@mail.ru>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Authentication-Results: smtp48.i.mail.ru;
 auth=pass smtp.auth=v.sementsov-og@mail.ru
 smtp.mailfrom=v.sementsov-og@mail.ru
X-7564579A: 78E4E2B564C1792B
X-77F55803: 4F1203BC0FB41BD92B0439D57C14BB61E5A01BA52239DE31EE46BC6EE1AF181600894C459B0CD1B9E506CC672124996E99545126BB36E1F7C206EF2094F4D7345872F0C4753F95D2
X-7FA49CB5: FF5795518A3D127A4AD6D5ED66289B5278DA827A17800CE70043D879A87EF1BCEA1F7E6F0F101C67BD4B6F7A4D31EC0BCC500DACC3FED6E28638F802B75D45FF8AA50765F7900637C1CDCB5E4A85220F8638F802B75D45FF36EB9D2243A4F8B5A6FCA7DBDB1FC311F39EFFDF887939037866D6147AF826D81112F8F694D889A9806E0E6D52A8A36C6F9789CCF6C18C3F8528715B7D10C86878DA827A17800CE778FCF50C7EAF9C588941B15DA834481FA18204E546F3947C1D471462564A2E19F6B57BC7E64490618DEB871D839B7333395957E7521B51C2DFABB839C843B9C08941B15DA834481F8AA50765F7900637D0FEED2715E18529389733CBF5DBD5E9B5C8C57E37DE458BD9DD9810294C998ED8FC6C240DEA76428AA50765F790063734032FEA597FA516D81D268191BDAD3DBD4B6F7A4D31EC0BEA7A3FFF5B025636D81D268191BDAD3D78DA827A17800CE770EE682517BB4314EC76A7562686271EEC990983EF5C03292E808ACE2090B5E14AD6D5ED66289B5259CC434672EE63711DD303D21008E298D5E8D9A59859A8B6B372FE9A2E580EFC725E5C173C3A84C3DCFFF3C24604B22B35872C767BF85DA2F004C90652538430E4A6367B16DE6309
X-8FC586DF: 6EFBBC1D9D64D975
X-B7AD71C0: 1B70FBA5C9BEEE72C9761FC34675ADEB871C96603B655635EE9D5CB6078CC77C19EA085B9B23A668146EF582D857B11F
X-C1DE0DAB: C20DE7B7AB408E4181F030C43753B8183A4AFAF3EA6BDC44C234C8B12C006B7A09B9BA260DCCDBF0B9A62B358E4896BC79394663583BE6C1B1881A6453793CE9C32612AADDFBE061C61BE10805914D3804EBA3D8E7E5B87ABF8C51168CD8EBDBF77088377309FF52A71A35648BE338CE9510FB958DCE06DB58C12E6D310A6D5333F7A9E5587C79A693EDB24507CE13387DFF0A840B692CF8
X-C8649E89: 4E36BF7865823D7055A7F0CF078B5EC49A30900B95165D3454CC76E5F54B410CE8A77D15867CD660C9E52B2F621A7C79AD28F4B847D3C2B5BF2D0A2E6532BAB51D7E09C32AA3244C022099FF07F76E47A8D27C7C456F03969CA7333006C390A083B48618A63566E0
X-D57D3AED: 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu530nj6fImhcD4MUrOEAnl0W826KZ9Q+tr5ycPtXkTV4k65bRjmOUUP8cvGozZ33TWg5HZplvhhXbhDGzqmQDTd6OAevLeAnq3Ra9uf7zvY2zzsIhlcp/Y7m53TZgf2aB4JOg4gkr2biojX92LdC94eGZBSE+hF5popQ==
X-Mailru-Sender: 6C3E74F07C41AE94618A7CFF02C4D1FE9A37DFE606991DEFE5CDBF58A453EF3944E8413A487B2B1AE6462B2528CDCABCE234FDC7CE4030BEBA6D275AA6409EB3BDC3C9FB484E02823A35ECB215E68A28E3F6503ABEB32C155FEEDEB644C299C0ED14614B50AE0675
X-Mras: Ok
Received-SPF: pass client-ip=94.100.177.108;
 envelope-from=v.sementsov-og@mail.ru; helo=smtp48.i.mail.ru
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_BL=0.001, RCVD_IN_MSPIKE_L3=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
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

Signed-off-by: Vladimir Sementsov-Ogievskiy <v.sementsov-og@mail.ru>
---
 block.c | 51 ++++++++++++++++++++++++++++++++-------------------
 1 file changed, 32 insertions(+), 19 deletions(-)

diff --git a/block.c b/block.c
index f2b70b81cf..54f1182f10 100644
--- a/block.c
+++ b/block.c
@@ -2406,8 +2406,12 @@ static int bdrv_node_refresh_perm(BlockDriverState *bs, BlockReopenQueue *q,
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
@@ -2428,6 +2432,24 @@ static int bdrv_list_refresh_perms(GSList *list, BlockReopenQueue *q,
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
@@ -2485,7 +2507,7 @@ static int bdrv_refresh_perms(BlockDriverState *bs, Transaction *tran,
         tran = local_tran = tran_new();
     }
 
-    ret = bdrv_list_refresh_perms(list, NULL, tran, errp);
+    ret = bdrv_do_refresh_perms(list, NULL, tran, errp);
 
     if (local_tran) {
         tran_finalize(local_tran, ret);
@@ -4213,7 +4235,6 @@ int bdrv_reopen_multiple(BlockReopenQueue *bs_queue, Error **errp)
     BlockReopenQueueEntry *bs_entry, *next;
     AioContext *ctx;
     Transaction *tran = tran_new();
-    g_autoptr(GHashTable) found = NULL;
     g_autoptr(GSList) refresh_list = NULL;
 
     assert(qemu_get_current_aio_context() == qemu_get_aio_context());
@@ -4242,18 +4263,15 @@ int bdrv_reopen_multiple(BlockReopenQueue *bs_queue, Error **errp)
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
 
@@ -4959,7 +4977,6 @@ static int bdrv_replace_node_common(BlockDriverState *from,
                                     Error **errp)
 {
     Transaction *tran = tran_new();
-    g_autoptr(GHashTable) found = NULL;
     g_autoptr(GSList) refresh_list = NULL;
     BlockDriverState *to_cow_parent = NULL;
     int ret;
@@ -4998,10 +5015,8 @@ static int bdrv_replace_node_common(BlockDriverState *from,
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
@@ -5078,7 +5093,6 @@ int bdrv_replace_child_bs(BdrvChild *child, BlockDriverState *new_bs,
 {
     int ret;
     Transaction *tran = tran_new();
-    g_autoptr(GHashTable) found = NULL;
     g_autoptr(GSList) refresh_list = NULL;
     BlockDriverState *old_bs = child->bs;
 
@@ -5088,9 +5102,8 @@ int bdrv_replace_child_bs(BdrvChild *child, BlockDriverState *new_bs,
 
     bdrv_replace_child_tran(child, new_bs, tran);
 
-    found = g_hash_table_new(NULL, NULL);
-    refresh_list = bdrv_topological_dfs(refresh_list, found, old_bs);
-    refresh_list = bdrv_topological_dfs(refresh_list, found, new_bs);
+    refresh_list = g_slist_prepend(refresh_list, old_bs);
+    refresh_list = g_slist_prepend(refresh_list, new_bs);
 
     ret = bdrv_list_refresh_perms(refresh_list, NULL, tran, errp);
 
-- 
2.35.1


