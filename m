Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B05072E874B
	for <lists+qemu-devel@lfdr.de>; Sat,  2 Jan 2021 13:37:06 +0100 (CET)
Received: from localhost ([::1]:36064 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kvg9Z-0002AS-74
	for lists+qemu-devel@lfdr.de; Sat, 02 Jan 2021 07:37:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45996)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <r.bolshakov@yadro.com>)
 id 1kvg88-0001es-PP
 for qemu-devel@nongnu.org; Sat, 02 Jan 2021 07:35:38 -0500
Received: from mta-02.yadro.com ([89.207.88.252]:37416 helo=mta-01.yadro.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <r.bolshakov@yadro.com>)
 id 1kvg84-0002o4-AS
 for qemu-devel@nongnu.org; Sat, 02 Jan 2021 07:35:36 -0500
Received: from localhost (unknown [127.0.0.1])
 by mta-01.yadro.com (Postfix) with ESMTP id 94C2741303;
 Sat,  2 Jan 2021 12:35:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=yadro.com; h=
 content-type:content-type:content-transfer-encoding:mime-version
 :x-mailer:message-id:date:date:subject:subject:from:from
 :received:received:received; s=mta-01; t=1609590923; x=
 1611405324; bh=cMsuux9VflfH4AEUAcSAoAWG0svv9U25j6xt+cnm75I=; b=m
 +hU73G2Uj2rvklV2dxqDy47aFdsPZ46WDKmQERWycBisUL8hw/T4260CbH7jbBPR
 Byc89qligSSj0Kil+EiW8wwAZIqcVAmFY5JWZ8rhnN+i8eZecj3hFk1FgPGBB2R5
 kOOtMHTAPnQHDvRQEuUgWbyNgzW/E3IYh9jT+rpKAw=
X-Virus-Scanned: amavisd-new at yadro.com
Received: from mta-01.yadro.com ([127.0.0.1])
 by localhost (mta-01.yadro.com [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id E2Q33hnsZlLE; Sat,  2 Jan 2021 15:35:23 +0300 (MSK)
Received: from T-EXCH-03.corp.yadro.com (t-exch-03.corp.yadro.com
 [172.17.100.103])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by mta-01.yadro.com (Postfix) with ESMTPS id 72B0B412DB;
 Sat,  2 Jan 2021 15:35:23 +0300 (MSK)
Received: from localhost (172.17.204.212) by T-EXCH-03.corp.yadro.com
 (172.17.100.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id 15.1.669.32; Sat, 2 Jan
 2021 15:35:23 +0300
From: Roman Bolshakov <r.bolshakov@yadro.com>
To: <qemu-devel@nongnu.org>
Subject: [PATCH] tcg: Fix execution on Apple Silicon
Date: Sat, 2 Jan 2021 15:21:02 +0300
Message-ID: <20210102122101.39617-1-r.bolshakov@yadro.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [172.17.204.212]
X-ClientProxiedBy: T-EXCH-01.corp.yadro.com (172.17.10.101) To
 T-EXCH-03.corp.yadro.com (172.17.100.103)
Received-SPF: pass client-ip=89.207.88.252; envelope-from=r.bolshakov@yadro.com;
 helo=mta-01.yadro.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
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
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Roman Bolshakov <r.bolshakov@yadro.com>, Alexander Graf <agraf@csgraf.de>,
 Joelle van Dyne <j@getutm.app>, Stefan Hajnoczi <stefanha@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Pages can't be both write and executable at the same time on Apple
Silicon. macOS provides public API to switch write protection [1] for
JIT applications, like TCG.

1. https://developer.apple.com/documentation/apple_silicon/porting_just-in-time_compilers_to_apple_silicon

Signed-off-by: Roman Bolshakov <r.bolshakov@yadro.com>
---

Happy holidays, everyone.

This is somewhat similar to https://patchwork.kernel.org/project/qemu-devel/patch/20201108232425.1705-7-j@getutm.app/
but I couldn't apply the series so I started from scratch.

The primary difference from the patch above is that public API is used.
Other differences:
  * TB pages are mostly kept write-locked except around tcg_qemu_tb_exec()
  * x86_64 macOS doesn't use MAP_JIT and W^X switches

Regards,
Roman

 accel/tcg/cpu-exec.c      | 10 ++++++++++
 accel/tcg/translate-all.c | 26 ++++++++++++++++++++++++++
 include/exec/exec-all.h   |  2 ++
 tcg/tcg.c                 |  1 +
 4 files changed, 39 insertions(+)

diff --git a/accel/tcg/cpu-exec.c b/accel/tcg/cpu-exec.c
index 8689c54499..0042fc9f2b 100644
--- a/accel/tcg/cpu-exec.c
+++ b/accel/tcg/cpu-exec.c
@@ -175,7 +175,9 @@ static inline tcg_target_ulong cpu_tb_exec(CPUState *cpu, TranslationBlock *itb)
     }
 #endif /* DEBUG_DISAS */
 
+    tb_write_lock();
     ret = tcg_qemu_tb_exec(env, tb_ptr);
+    tb_write_unlock();
     cpu->can_do_io = 1;
     last_tb = (TranslationBlock *)(ret & ~TB_EXIT_MASK);
     tb_exit = ret & TB_EXIT_MASK;
@@ -220,9 +222,11 @@ static void cpu_exec_nocache(CPUState *cpu, int max_cycles,
     cflags |= MIN(max_cycles, CF_COUNT_MASK);
 
     mmap_lock();
+    tb_write_unlock();
     tb = tb_gen_code(cpu, orig_tb->pc, orig_tb->cs_base,
                      orig_tb->flags, cflags);
     tb->orig_tb = orig_tb;
+    tb_write_lock();
     mmap_unlock();
 
     /* execute the generated code */
@@ -268,7 +272,9 @@ void cpu_exec_step_atomic(CPUState *cpu)
         tb = tb_lookup__cpu_state(cpu, &pc, &cs_base, &flags, cf_mask);
         if (tb == NULL) {
             mmap_lock();
+            tb_write_unlock();
             tb = tb_gen_code(cpu, pc, cs_base, flags, cflags);
+            tb_write_lock();
             mmap_unlock();
         }
 
@@ -428,7 +434,9 @@ static inline TranslationBlock *tb_find(CPUState *cpu,
     tb = tb_lookup__cpu_state(cpu, &pc, &cs_base, &flags, cf_mask);
     if (tb == NULL) {
         mmap_lock();
+        tb_write_unlock();
         tb = tb_gen_code(cpu, pc, cs_base, flags, cf_mask);
+        tb_write_lock();
         mmap_unlock();
         /* We add the TB in the virtual pc hash table for the fast lookup */
         qatomic_set(&cpu->tb_jmp_cache[tb_jmp_cache_hash_func(pc)], tb);
@@ -444,7 +452,9 @@ static inline TranslationBlock *tb_find(CPUState *cpu,
 #endif
     /* See if we can patch the calling TB. */
     if (last_tb) {
+        tb_write_unlock();
         tb_add_jump(last_tb, tb_exit, tb);
+        tb_write_lock();
     }
     return tb;
 }
diff --git a/accel/tcg/translate-all.c b/accel/tcg/translate-all.c
index b7d50a73d4..1562076ffb 100644
--- a/accel/tcg/translate-all.c
+++ b/accel/tcg/translate-all.c
@@ -1072,6 +1072,9 @@ static inline void *alloc_code_gen_buffer(void)
     size_t size = tcg_ctx->code_gen_buffer_size;
     void *buf;
 
+#if defined(__APPLE__) && defined(__aarch64__)
+    flags |= MAP_JIT;
+#endif
     buf = mmap(NULL, size, prot, flags, -1, 0);
     if (buf == MAP_FAILED) {
         return NULL;
@@ -1485,7 +1488,9 @@ static void do_tb_phys_invalidate(TranslationBlock *tb, bool rm_from_page_list)
 
 static void tb_phys_invalidate__locked(TranslationBlock *tb)
 {
+    tb_write_unlock();
     do_tb_phys_invalidate(tb, true);
+    tb_write_lock();
 }
 
 /* invalidate one TB
@@ -2722,3 +2727,24 @@ void tcg_flush_softmmu_tlb(CPUState *cs)
     tlb_flush(cs);
 #endif
 }
+
+#if defined(__APPLE__) && defined(__aarch64__)
+static void tb_write_protect(bool locked)
+{
+    if (pthread_jit_write_protect_supported_np()){
+        pthread_jit_write_protect_np(locked);
+    }
+}
+#else
+static void tb_write_protect(bool locked) {}
+#endif
+
+void tb_write_lock(void)
+{
+    tb_write_protect(true);
+}
+
+void tb_write_unlock(void)
+{
+    tb_write_protect(false);
+}
diff --git a/include/exec/exec-all.h b/include/exec/exec-all.h
index fab573da06..962dca0975 100644
--- a/include/exec/exec-all.h
+++ b/include/exec/exec-all.h
@@ -549,6 +549,8 @@ TranslationBlock *tb_htable_lookup(CPUState *cpu, target_ulong pc,
                                    target_ulong cs_base, uint32_t flags,
                                    uint32_t cf_mask);
 void tb_set_jmp_target(TranslationBlock *tb, int n, uintptr_t addr);
+void tb_write_lock(void);
+void tb_write_unlock(void);
 
 /* GETPC is the true target of the return instruction that we'll execute.  */
 #if defined(CONFIG_TCG_INTERPRETER)
diff --git a/tcg/tcg.c b/tcg/tcg.c
index 43c6cf8f52..303bb436bd 100644
--- a/tcg/tcg.c
+++ b/tcg/tcg.c
@@ -1065,6 +1065,7 @@ void tcg_prologue_init(TCGContext *s)
     s->pool_labels = NULL;
 #endif
 
+    tb_write_unlock();
     /* Generate the prologue.  */
     tcg_target_qemu_prologue(s);
 
-- 
2.29.2


