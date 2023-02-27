Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 146456A435D
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Feb 2023 14:53:28 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pWdvp-0006nG-DZ; Mon, 27 Feb 2023 08:52:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anjo@rev.ng>) id 1pWdvc-0006dq-Dt
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 08:52:33 -0500
Received: from rev.ng ([5.9.113.41])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anjo@rev.ng>) id 1pWdva-0005Uh-Cw
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 08:52:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=rev.ng;
 s=dkim; h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=/u3FgMygsWd0vUlU2d/GekzCv9Q6hjVxri4Ia8zuJKc=; b=TPjhia1kb62CeGZfLe4YzaWLaX
 atdCo2NXVo4cr2vDJBKisTB6c5JOwWYdPxvrBeYK7DFasTN4TfaRVRiZvQLrMcKJ/lw7GiQt3vuX7
 eqZEknSq0WD+ITG40/hPBQHI2XVlqF6E5grOOXY+7mhh29pM/NUIqI+79FbcqKn8G8DE=;
To: qemu-devel@nongnu.org
Cc: ale@rev.ng, richard.henderson@linaro.org, pbonzini@redhat.com,
 eduardo@habkost.net, peter.maydell@linaro.org, mrolnik@gmail.com,
 tsimpson@quicinc.com, gaosong@loongson.cn, yangxiaojuan@loongson.cn,
 edgar.iglesias@gmail.com, philmd@linaro.org, shorne@gmail.com,
 palmer@dabbelt.com, alistair.francis@wdc.com, bin.meng@windriver.com,
 ysato@users.sourceforge.jp, mark.cave-ayland@ilande.co.uk,
 atar4qemu@gmail.com, kbastian@mail.uni-paderborn.de
Subject: [PATCH v3 11/27] accel/tcg: Move jmp-cache `CF_PCREL` checks to caller
Date: Mon, 27 Feb 2023 14:51:46 +0100
Message-Id: <20230227135202.9710-12-anjo@rev.ng>
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

tb-jmp-cache.h contains a few small functions that only exist to hide a
CF_PCREL check, however the caller often already performs such a check.

This patch moves CF_PCREL checks from the callee to the caller, and also
removes these functions which now only hide an access of the jmp-cache.

Signed-off-by: Anton Johansson <anjo@rev.ng>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 accel/tcg/cpu-exec.c     | 56 +++++++++++++++++++++++++++++-----------
 accel/tcg/tb-jmp-cache.h | 36 --------------------------
 2 files changed, 41 insertions(+), 51 deletions(-)

diff --git a/accel/tcg/cpu-exec.c b/accel/tcg/cpu-exec.c
index 92b833adcf..5efa8bf42a 100644
--- a/accel/tcg/cpu-exec.c
+++ b/accel/tcg/cpu-exec.c
@@ -256,21 +256,46 @@ static inline TranslationBlock *tb_lookup(CPUState *cpu, target_ulong pc,
 
     hash = tb_jmp_cache_hash_func(pc);
     jc = cpu->tb_jmp_cache;
-    tb = tb_jmp_cache_get_tb(jc, cflags, hash);
-
-    if (likely(tb &&
-               tb_jmp_cache_get_pc(jc, hash, tb) == pc &&
-               tb->cs_base == cs_base &&
-               tb->flags == flags &&
-               tb->trace_vcpu_dstate == *cpu->trace_dstate &&
-               tb_cflags(tb) == cflags)) {
-        return tb;
-    }
-    tb = tb_htable_lookup(cpu, pc, cs_base, flags, cflags);
-    if (tb == NULL) {
-        return NULL;
+
+    if (cflags & CF_PCREL) {
+        /* Use acquire to ensure current load of pc from jc. */
+        tb =  qatomic_load_acquire(&jc->array[hash].tb);
+
+        if (likely(tb &&
+                   jc->array[hash].pc == pc &&
+                   tb->cs_base == cs_base &&
+                   tb->flags == flags &&
+                   tb->trace_vcpu_dstate == *cpu->trace_dstate &&
+                   tb_cflags(tb) == cflags)) {
+            return tb;
+        }
+        tb = tb_htable_lookup(cpu, pc, cs_base, flags, cflags);
+        if (tb == NULL) {
+            return NULL;
+        }
+        jc->array[hash].pc = pc;
+        /* Use store_release on tb to ensure pc is written first. */
+        qatomic_store_release(&jc->array[hash].tb, tb);
+    } else {
+        /* Use rcu_read to ensure current load of pc from *tb. */
+        tb = qatomic_rcu_read(&jc->array[hash].tb);
+
+        if (likely(tb &&
+                   tb_pc(tb) == pc &&
+                   tb->cs_base == cs_base &&
+                   tb->flags == flags &&
+                   tb->trace_vcpu_dstate == *cpu->trace_dstate &&
+                   tb_cflags(tb) == cflags)) {
+            return tb;
+        }
+        tb = tb_htable_lookup(cpu, pc, cs_base, flags, cflags);
+        if (tb == NULL) {
+            return NULL;
+        }
+        /* Use the pc value already stored in tb->pc. */
+        qatomic_set(&jc->array[hash].tb, tb);
     }
-    tb_jmp_cache_set(jc, hash, tb, pc);
+
     return tb;
 }
 
@@ -959,7 +984,8 @@ cpu_exec_loop(CPUState *cpu, SyncClocks *sc)
                  * for the fast lookup
                  */
                 h = tb_jmp_cache_hash_func(pc);
-                tb_jmp_cache_set(cpu->tb_jmp_cache, h, tb, pc);
+                /* Use the pc value already stored in tb->pc. */
+                qatomic_set(&cpu->tb_jmp_cache->array[h].tb, tb);
             }
 
 #ifndef CONFIG_USER_ONLY
diff --git a/accel/tcg/tb-jmp-cache.h b/accel/tcg/tb-jmp-cache.h
index 083939b302..bee87eb840 100644
--- a/accel/tcg/tb-jmp-cache.h
+++ b/accel/tcg/tb-jmp-cache.h
@@ -25,40 +25,4 @@ struct CPUJumpCache {
     } array[TB_JMP_CACHE_SIZE];
 };
 
-static inline TranslationBlock *
-tb_jmp_cache_get_tb(CPUJumpCache *jc, uint32_t cflags, uint32_t hash)
-{
-    if (cflags & CF_PCREL) {
-        /* Use acquire to ensure current load of pc from jc. */
-        return qatomic_load_acquire(&jc->array[hash].tb);
-    } else {
-        /* Use rcu_read to ensure current load of pc from *tb. */
-        return qatomic_rcu_read(&jc->array[hash].tb);
-    }
-}
-
-static inline target_ulong
-tb_jmp_cache_get_pc(CPUJumpCache *jc, uint32_t hash, TranslationBlock *tb)
-{
-    if (tb_cflags(tb) & CF_PCREL) {
-        return jc->array[hash].pc;
-    } else {
-        return tb_pc(tb);
-    }
-}
-
-static inline void
-tb_jmp_cache_set(CPUJumpCache *jc, uint32_t hash,
-                 TranslationBlock *tb, target_ulong pc)
-{
-    if (tb_cflags(tb) & CF_PCREL) {
-        jc->array[hash].pc = pc;
-        /* Use store_release on tb to ensure pc is written first. */
-        qatomic_store_release(&jc->array[hash].tb, tb);
-    } else{
-        /* Use the pc value already stored in tb->pc. */
-        qatomic_set(&jc->array[hash].tb, tb);
-    }
-}
-
 #endif /* ACCEL_TCG_TB_JMP_CACHE_H */
-- 
2.39.1


