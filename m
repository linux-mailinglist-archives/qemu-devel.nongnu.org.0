Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ED93D3BAD6D
	for <lists+qemu-devel@lfdr.de>; Sun,  4 Jul 2021 16:33:07 +0200 (CEST)
Received: from localhost ([::1]:38946 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m03BD-00066j-13
	for lists+qemu-devel@lfdr.de; Sun, 04 Jul 2021 10:33:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39008)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lrwei@bupt.edu.cn>) id 1m039z-0004jK-I3
 for qemu-devel@nongnu.org; Sun, 04 Jul 2021 10:31:51 -0400
Received: from smtpbg501.qq.com ([203.205.250.101]:51185)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lrwei@bupt.edu.cn>) id 1m039u-0007wN-OB
 for qemu-devel@nongnu.org; Sun, 04 Jul 2021 10:31:51 -0400
X-QQ-mid: bizesmtp54t1625409093t92jabvk
Received: from Wei.localdomain (unknown [223.72.88.167])
 by esmtp6.qq.com (ESMTP) with 
 id ; Sun, 04 Jul 2021 22:31:32 +0800 (CST)
X-QQ-SSF: 0140000000200080X000000B0000000
X-QQ-FEAT: XIEqvPtYnoGcaq8NZPcWIxqtaNsepyhiy3cxxd0rKvKSPUWdTTOWK4IWpZaWN
 E1+1URnBPZHB3dXaVH7jgtafKPqnopOb+SZIVRiXJwk6yd1FdQs0T0jZCvEbCEgxJL2kvxi
 Pob11GWSOlDBGFN/OfxPq44kqEhIZHaZkXKSjnZXO3juR+NR6rK5tYQcu1kmKTN+X7+AlYf
 Lj/S66w1fRRxFIstTUWK1LseNwYEk0NN7Yy3kjYhwPW5lR83km6VpzJ/n0M4XdjlWXTEs2a
 gODVBjhWlG/q53ydp3XXJoHU7rxaKhw9JwAQlS0b6xpyjkCjZq8SrypaOEQpe9MR5z2LL4C
 0PXiK5KhznNCw77MHjnGGGPVN54fRowtkU4UHcs1SDnqwH09x4=
X-QQ-GoodBg: 2
From: Liren Wei <lrwei@bupt.edu.cn>
To: qemu-devel@nongnu.org
Subject: [PATCH 2/2] tcg: Bake tb_destroy() into tcg_region_tree
Date: Sun,  4 Jul 2021 22:31:27 +0800
Message-Id: <8dc352f08d038c4e7a1f5f56962398cdc700c3aa.1625404483.git.lrwei@bupt.edu.cn>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <cover.1625404483.git.lrwei@bupt.edu.cn>
References: <cover.1625404483.git.lrwei@bupt.edu.cn>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:bupt.edu.cn:qybgforeign:qybgforeign6
X-QQ-Bgrelay: 1
Received-SPF: pass client-ip=203.205.250.101; envelope-from=lrwei@bupt.edu.cn;
 helo=smtpbg501.qq.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: pbonzini@redhat.com, richard.henderson@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The function is called only at tcg_gen_code() when duplicated TBs
are translated by different threads, and when the tcg_region_tree
is reset. Bake it into the underlying GTree as its value destroy
function to unite these situations.
Also remove tcg_region_tree_traverse() which now becomes useless.

Signed-off-by: Liren Wei <lrwei@bupt.edu.cn>
---
 accel/tcg/translate-all.c |  6 ------
 include/tcg/tcg.h         |  1 -
 tcg/region.c              | 18 +++++++-----------
 3 files changed, 7 insertions(+), 18 deletions(-)

diff --git a/accel/tcg/translate-all.c b/accel/tcg/translate-all.c
index 75e4d06557..57455d8639 100644
--- a/accel/tcg/translate-all.c
+++ b/accel/tcg/translate-all.c
@@ -378,11 +378,6 @@ static int cpu_restore_state_from_tb(CPUState *cpu, TranslationBlock *tb,
     return 0;
 }
 
-void tb_destroy(TranslationBlock *tb)
-{
-    qemu_spin_destroy(&tb->jmp_lock);
-}
-
 bool cpu_restore_state(CPUState *cpu, uintptr_t host_pc, bool will_exit)
 {
     /*
@@ -1681,7 +1676,6 @@ TranslationBlock *tb_gen_code(CPUState *cpu,
 
         orig_aligned -= ROUND_UP(sizeof(*tb), qemu_icache_linesize);
         qatomic_set(&tcg_ctx->code_gen_ptr, (void *)orig_aligned);
-        tb_destroy(tb);
         tcg_tb_remove(tb);
         return existing_tb;
     }
diff --git a/include/tcg/tcg.h b/include/tcg/tcg.h
index 899493701c..dedb86939a 100644
--- a/include/tcg/tcg.h
+++ b/include/tcg/tcg.h
@@ -808,7 +808,6 @@ void *tcg_malloc_internal(TCGContext *s, int size);
 void tcg_pool_reset(TCGContext *s);
 TranslationBlock *tcg_tb_alloc(TCGContext *s);
 
-void tb_destroy(TranslationBlock *tb);
 void tcg_region_reset_all(void);
 
 size_t tcg_code_size(void);
diff --git a/tcg/region.c b/tcg/region.c
index 00b0c3b091..956a5ae483 100644
--- a/tcg/region.c
+++ b/tcg/region.c
@@ -112,7 +112,7 @@ static int ptr_cmp_tb_tc(const void *ptr, const struct tb_tc *s)
     return 0;
 }
 
-static gint tb_tc_cmp(gconstpointer ap, gconstpointer bp)
+static gint tb_tc_cmp(gconstpointer ap, gconstpointer bp, gpointer _)
 {
     const struct tb_tc *a = ap;
     const struct tb_tc *b = bp;
@@ -143,6 +143,11 @@ static gint tb_tc_cmp(gconstpointer ap, gconstpointer bp)
     return ptr_cmp_tb_tc(b->ptr, a);
 }
 
+static void tb_destroy(gpointer tb)
+{
+    qemu_spin_destroy(&((TranslationBlock *) tb)->jmp_lock);
+}
+
 static void tcg_region_trees_init(void)
 {
     size_t i;
@@ -153,7 +158,7 @@ static void tcg_region_trees_init(void)
         struct tcg_region_tree *rt = region_trees + i * tree_size;
 
         qemu_mutex_init(&rt->lock);
-        rt->tree = g_tree_new(tb_tc_cmp);
+        rt->tree = g_tree_new_full(tb_tc_cmp, NULL, NULL, tb_destroy);
     }
 }
 
@@ -277,14 +282,6 @@ size_t tcg_nb_tbs(void)
     return nb_tbs;
 }
 
-static gboolean tcg_region_tree_traverse(gpointer k, gpointer v, gpointer data)
-{
-    TranslationBlock *tb = v;
-
-    tb_destroy(tb);
-    return FALSE;
-}
-
 static void tcg_region_tree_reset_all(void)
 {
     size_t i;
@@ -293,7 +290,6 @@ static void tcg_region_tree_reset_all(void)
     for (i = 0; i < region.n; i++) {
         struct tcg_region_tree *rt = region_trees + i * tree_size;
 
-        g_tree_foreach(rt->tree, tcg_region_tree_traverse, NULL);
         /* Increment the refcount first so that destroy acts as a reset */
         g_tree_ref(rt->tree);
         g_tree_destroy(rt->tree);
-- 
2.32.0




