Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F093D6A4371
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Feb 2023 14:55:46 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pWdvo-0006eb-Uk; Mon, 27 Feb 2023 08:52:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anjo@rev.ng>) id 1pWdvd-0006ds-32
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 08:52:33 -0500
Received: from rev.ng ([5.9.113.41])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anjo@rev.ng>) id 1pWdvb-0005Ut-Cj
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 08:52:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=rev.ng;
 s=dkim; h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=KCn0DP9LFcqTdO/rtbmJiogNKZBjx4i5JUhhIgtvyls=; b=MyzxH9NW4A63UBgBk+9fSVp/W8
 GGZYaAq+Un2bHqgdV9A0Upvxl7pIT3fr4lsUoPbpyrf4cvnLdRDGQI3Woth0pOKDAF9y9s3wDvYL/
 yCi8H8tNwB0WR5JRqkPMqNRMAuKacUwSRjKwy9pr8rR+N8MdtM0yhlGHE1TwHGTEr41g=;
To: qemu-devel@nongnu.org
Cc: ale@rev.ng, richard.henderson@linaro.org, pbonzini@redhat.com,
 eduardo@habkost.net, peter.maydell@linaro.org, mrolnik@gmail.com,
 tsimpson@quicinc.com, gaosong@loongson.cn, yangxiaojuan@loongson.cn,
 edgar.iglesias@gmail.com, philmd@linaro.org, shorne@gmail.com,
 palmer@dabbelt.com, alistair.francis@wdc.com, bin.meng@windriver.com,
 ysato@users.sourceforge.jp, mark.cave-ayland@ilande.co.uk,
 atar4qemu@gmail.com, kbastian@mail.uni-paderborn.de
Subject: [PATCH v3 12/27] accel/tcg: Replace `tb_pc()` with `tb->pc`
Date: Mon, 27 Feb 2023 14:51:47 +0100
Message-Id: <20230227135202.9710-13-anjo@rev.ng>
In-Reply-To: <20230227135202.9710-1-anjo@rev.ng>
References: <20230227135202.9710-1-anjo@rev.ng>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=5.9.113.41; envelope-from=anjo@rev.ng; helo=rev.ng
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Reply-to:  Anton Johansson <anjo@rev.ng>
From:  Anton Johansson via <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Signed-off-by: Anton Johansson <anjo@rev.ng>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 accel/tcg/cpu-exec.c      | 6 +++---
 accel/tcg/internal.h      | 2 +-
 accel/tcg/tb-maint.c      | 8 ++++----
 accel/tcg/translate-all.c | 4 ++--
 4 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/accel/tcg/cpu-exec.c b/accel/tcg/cpu-exec.c
index 5efa8bf42a..9fb0fabf95 100644
--- a/accel/tcg/cpu-exec.c
+++ b/accel/tcg/cpu-exec.c
@@ -185,7 +185,7 @@ static bool tb_lookup_cmp(const void *p, const void *d)
     const TranslationBlock *tb = p;
     const struct tb_desc *desc = d;
 
-    if ((tb_cflags(tb) & CF_PCREL || tb_pc(tb) == desc->pc) &&
+    if ((tb_cflags(tb) & CF_PCREL || tb->pc == desc->pc) &&
         tb_page_addr0(tb) == desc->page_addr0 &&
         tb->cs_base == desc->cs_base &&
         tb->flags == desc->flags &&
@@ -281,7 +281,7 @@ static inline TranslationBlock *tb_lookup(CPUState *cpu, target_ulong pc,
         tb = qatomic_rcu_read(&jc->array[hash].tb);
 
         if (likely(tb &&
-                   tb_pc(tb) == pc &&
+                   tb->pc == pc &&
                    tb->cs_base == cs_base &&
                    tb->flags == flags &&
                    tb->trace_vcpu_dstate == *cpu->trace_dstate &&
@@ -486,7 +486,7 @@ cpu_tb_exec(CPUState *cpu, TranslationBlock *itb, int *tb_exit)
         } else {
             tcg_debug_assert(!(tb_cflags(last_tb) & CF_PCREL));
             assert(cc->set_pc);
-            cc->set_pc(cpu, tb_pc(last_tb));
+            cc->set_pc(cpu, last_tb->pc);
         }
         if (qemu_loglevel_mask(CPU_LOG_EXEC)) {
             target_ulong pc = log_pc(cpu, last_tb);
diff --git a/accel/tcg/internal.h b/accel/tcg/internal.h
index 261924e7fa..17b52ecdb7 100644
--- a/accel/tcg/internal.h
+++ b/accel/tcg/internal.h
@@ -60,7 +60,7 @@ static inline target_ulong log_pc(CPUState *cpu, const TranslationBlock *tb)
     if (tb_cflags(tb) & CF_PCREL) {
         return cpu->cc->get_pc(cpu);
     } else {
-        return tb_pc(tb);
+        return tb->pc;
     }
 }
 
diff --git a/accel/tcg/tb-maint.c b/accel/tcg/tb-maint.c
index 2dbc2ce172..efefa08ee1 100644
--- a/accel/tcg/tb-maint.c
+++ b/accel/tcg/tb-maint.c
@@ -44,7 +44,7 @@ static bool tb_cmp(const void *ap, const void *bp)
     const TranslationBlock *a = ap;
     const TranslationBlock *b = bp;
 
-    return ((tb_cflags(a) & CF_PCREL || tb_pc(a) == tb_pc(b)) &&
+    return ((tb_cflags(a) & CF_PCREL || a->pc == b->pc) &&
             a->cs_base == b->cs_base &&
             a->flags == b->flags &&
             (tb_cflags(a) & ~CF_INVALID) == (tb_cflags(b) & ~CF_INVALID) &&
@@ -853,7 +853,7 @@ static void tb_jmp_cache_inval_tb(TranslationBlock *tb)
             tcg_flush_jmp_cache(cpu);
         }
     } else {
-        uint32_t h = tb_jmp_cache_hash_func(tb_pc(tb));
+        uint32_t h = tb_jmp_cache_hash_func(tb->pc);
 
         CPU_FOREACH(cpu) {
             CPUJumpCache *jc = cpu->tb_jmp_cache;
@@ -885,7 +885,7 @@ static void do_tb_phys_invalidate(TranslationBlock *tb, bool rm_from_page_list)
 
     /* remove the TB from the hash list */
     phys_pc = tb_page_addr0(tb);
-    h = tb_hash_func(phys_pc, (orig_cflags & CF_PCREL ? 0 : tb_pc(tb)),
+    h = tb_hash_func(phys_pc, (orig_cflags & CF_PCREL ? 0 : tb->pc),
                      tb->flags, orig_cflags, tb->trace_vcpu_dstate);
     if (!qht_remove(&tb_ctx.htable, tb, h)) {
         return;
@@ -966,7 +966,7 @@ TranslationBlock *tb_link_page(TranslationBlock *tb, tb_page_addr_t phys_pc,
     tb_record(tb, p, p2);
 
     /* add in the hash table */
-    h = tb_hash_func(phys_pc, (tb->cflags & CF_PCREL ? 0 : tb_pc(tb)),
+    h = tb_hash_func(phys_pc, (tb->cflags & CF_PCREL ? 0 : tb->pc),
                      tb->flags, tb->cflags, tb->trace_vcpu_dstate);
     qht_insert(&tb_ctx.htable, tb, h, &existing_tb);
 
diff --git a/accel/tcg/translate-all.c b/accel/tcg/translate-all.c
index 6ae3cc9d71..389d0a940b 100644
--- a/accel/tcg/translate-all.c
+++ b/accel/tcg/translate-all.c
@@ -135,7 +135,7 @@ static int encode_search(TranslationBlock *tb, uint8_t *block)
 
         for (j = 0; j < TARGET_INSN_START_WORDS; ++j) {
             if (i == 0) {
-                prev = (!(tb_cflags(tb) & CF_PCREL) && j == 0 ? tb_pc(tb) : 0);
+                prev = (!(tb_cflags(tb) & CF_PCREL) && j == 0 ? tb->pc : 0);
             } else {
                 prev = tcg_ctx->gen_insn_data[i - 1][j];
             }
@@ -171,7 +171,7 @@ static int cpu_unwind_data_from_tb(TranslationBlock *tb, uintptr_t host_pc,
 
     memset(data, 0, sizeof(uint64_t) * TARGET_INSN_START_WORDS);
     if (!(tb_cflags(tb) & CF_PCREL)) {
-        data[0] = tb_pc(tb);
+        data[0] = tb->pc;
     }
 
     /*
-- 
2.39.1


