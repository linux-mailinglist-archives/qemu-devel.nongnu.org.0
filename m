Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B6F4A5F4A39
	for <lists+qemu-devel@lfdr.de>; Tue,  4 Oct 2022 22:20:23 +0200 (CEST)
Received: from localhost ([::1]:59802 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ofoOs-0007H2-3z
	for lists+qemu-devel@lfdr.de; Tue, 04 Oct 2022 16:20:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49326)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ofnyP-000213-PL
 for qemu-devel@nongnu.org; Tue, 04 Oct 2022 15:53:01 -0400
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034]:33661)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ofnyN-0000F3-2b
 for qemu-devel@nongnu.org; Tue, 04 Oct 2022 15:53:01 -0400
Received: by mail-pj1-x1034.google.com with SMTP id
 bu5-20020a17090aee4500b00202e9ca2182so1955081pjb.0
 for <qemu-devel@nongnu.org>; Tue, 04 Oct 2022 12:52:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=ecQCsvnTHICeRKHhQnmBF1bwYTnzG7vyEXDoUtOl6rE=;
 b=qwMuAJjaY3exlpNxJFDfY4Y8mFw8KfwUilJ5EgPS9Y9ucvFjrHIEPDMTNP11RDsWez
 g/N88w+hNeDWN9bNx8Ogi5WVw3r0wfr12ecdG7IZaKqmfJU5TJ+nkOuDCR/p6VuNc03h
 aNkiltUcS36+lKAvMrMXB1RsUWSzhDkzzXFYV33KCQbcBv6jAlfKjQUhf+PAJrS7FoVm
 am1FwK/IQLE9EsXLYMNct0seGd2h3fhUAn1I+6mxlpta93aYEqcoN2ZiZGdLYtvfE+J+
 YW0ORu8lFPiuQYLtPgrnxasnYzuq/nWixh6OF2RrB0BLomNilC7+zj1x/pTfQ8Og9ce1
 A75g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=ecQCsvnTHICeRKHhQnmBF1bwYTnzG7vyEXDoUtOl6rE=;
 b=eanTl7wcqA8MIbfEb3aroTvdShq8lnlQ4R/3yO4yGx2FerEyh5RSmWbgRBvfrvrRdw
 2yqb4fMFdo3obNnU9UGzBA0uCLGIF1ZUGJ1PbvhAbOJfJ7LpI0xN+VQXg+JwGfIUKuiu
 vLAr3z7UsTE8TOV6VS+LdfJZYJle8Nw2KQr2U5i2SudMRQI+Qc91BCeLYDj1N2P1eFeX
 YcZD38DrHxuBKn3yDetsDBX7qmkkut809FNi+1D6mbSVseZtEDoDipY9TJo32UM2BwlR
 A+3vhLk3mA62wke5QIhrAng8hE/2z9mqnZMSKJrebEVRpXTKYf7MoU15PwYxYG7g05UK
 PpBA==
X-Gm-Message-State: ACrzQf04Nle9G5dofoKScs8NRC0Yq0PTR1hT6UJuJQ31so6Bpe9nP1gX
 Ec0MG2pP0zN9XqXTyF0xgVenDXQdYIaSUQ==
X-Google-Smtp-Source: AMsMyM7TRLYUjOaHkI/pXE7SXkP+b65B+2lvDWVomZJeZmHrOZWPNiC2tKfLjqOy7bNNtA0q0ngBAg==
X-Received: by 2002:a17:902:6546:b0:17f:7888:58b with SMTP id
 d6-20020a170902654600b0017f7888058bmr2838609pln.140.1664913178197; 
 Tue, 04 Oct 2022 12:52:58 -0700 (PDT)
Received: from stoup.. ([2602:47:d49d:ec01:526e:3326:a84e:e5e3])
 by smtp.gmail.com with ESMTPSA id
 u23-20020a1709026e1700b00172973d3cd9sm9293406plk.55.2022.10.04.12.52.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Oct 2022 12:52:57 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: stefanha@redhat.com,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: [PULL 15/20] include/hw/core: Create struct CPUJumpCache
Date: Tue,  4 Oct 2022 12:52:36 -0700
Message-Id: <20221004195241.46491-16-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221004195241.46491-1-richard.henderson@linaro.org>
References: <20221004195241.46491-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1034;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1034.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Wrap the bare TranslationBlock pointer into a structure.

Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 accel/tcg/tb-hash.h       |  1 +
 accel/tcg/tb-jmp-cache.h  | 24 ++++++++++++++++++++++++
 include/exec/cpu-common.h |  1 +
 include/hw/core/cpu.h     | 15 +--------------
 include/qemu/typedefs.h   |  1 +
 accel/stubs/tcg-stub.c    |  4 ++++
 accel/tcg/cpu-exec.c      | 10 +++++++---
 accel/tcg/cputlb.c        |  9 +++++----
 accel/tcg/translate-all.c | 28 +++++++++++++++++++++++++---
 hw/core/cpu-common.c      |  3 +--
 plugins/core.c            |  2 +-
 trace/control-target.c    |  2 +-
 12 files changed, 72 insertions(+), 28 deletions(-)
 create mode 100644 accel/tcg/tb-jmp-cache.h

diff --git a/accel/tcg/tb-hash.h b/accel/tcg/tb-hash.h
index 0a273d9605..83dc610e4c 100644
--- a/accel/tcg/tb-hash.h
+++ b/accel/tcg/tb-hash.h
@@ -23,6 +23,7 @@
 #include "exec/cpu-defs.h"
 #include "exec/exec-all.h"
 #include "qemu/xxhash.h"
+#include "tb-jmp-cache.h"
 
 #ifdef CONFIG_SOFTMMU
 
diff --git a/accel/tcg/tb-jmp-cache.h b/accel/tcg/tb-jmp-cache.h
new file mode 100644
index 0000000000..2d8fbb1bfe
--- /dev/null
+++ b/accel/tcg/tb-jmp-cache.h
@@ -0,0 +1,24 @@
+/*
+ * The per-CPU TranslationBlock jump cache.
+ *
+ *  Copyright (c) 2003 Fabrice Bellard
+ *
+ * SPDX-License-Identifier: GPL-2.0-or-later
+ */
+
+#ifndef ACCEL_TCG_TB_JMP_CACHE_H
+#define ACCEL_TCG_TB_JMP_CACHE_H
+
+#define TB_JMP_CACHE_BITS 12
+#define TB_JMP_CACHE_SIZE (1 << TB_JMP_CACHE_BITS)
+
+/*
+ * Accessed in parallel; all accesses to 'tb' must be atomic.
+ */
+struct CPUJumpCache {
+    struct {
+        TranslationBlock *tb;
+    } array[TB_JMP_CACHE_SIZE];
+};
+
+#endif /* ACCEL_TCG_TB_JMP_CACHE_H */
diff --git a/include/exec/cpu-common.h b/include/exec/cpu-common.h
index d909429427..c493510ee9 100644
--- a/include/exec/cpu-common.h
+++ b/include/exec/cpu-common.h
@@ -38,6 +38,7 @@ void cpu_list_unlock(void);
 unsigned int cpu_list_generation_id_get(void);
 
 void tcg_flush_softmmu_tlb(CPUState *cs);
+void tcg_flush_jmp_cache(CPUState *cs);
 
 void tcg_iommu_init_notifier_list(CPUState *cpu);
 void tcg_iommu_free_notifier_list(CPUState *cpu);
diff --git a/include/hw/core/cpu.h b/include/hw/core/cpu.h
index 009dc0d336..18ca701b44 100644
--- a/include/hw/core/cpu.h
+++ b/include/hw/core/cpu.h
@@ -236,9 +236,6 @@ struct kvm_run;
 struct hax_vcpu_state;
 struct hvf_vcpu_state;
 
-#define TB_JMP_CACHE_BITS 12
-#define TB_JMP_CACHE_SIZE (1 << TB_JMP_CACHE_BITS)
-
 /* work queue */
 
 /* The union type allows passing of 64 bit target pointers on 32 bit
@@ -369,8 +366,7 @@ struct CPUState {
     CPUArchState *env_ptr;
     IcountDecr *icount_decr_ptr;
 
-    /* Accessed in parallel; all accesses must be atomic */
-    TranslationBlock *tb_jmp_cache[TB_JMP_CACHE_SIZE];
+    CPUJumpCache *tb_jmp_cache;
 
     struct GDBRegisterState *gdb_regs;
     int gdb_num_regs;
@@ -456,15 +452,6 @@ extern CPUTailQ cpus;
 
 extern __thread CPUState *current_cpu;
 
-static inline void cpu_tb_jmp_cache_clear(CPUState *cpu)
-{
-    unsigned int i;
-
-    for (i = 0; i < TB_JMP_CACHE_SIZE; i++) {
-        qatomic_set(&cpu->tb_jmp_cache[i], NULL);
-    }
-}
-
 /**
  * qemu_tcg_mttcg_enabled:
  * Check whether we are running MultiThread TCG or not.
diff --git a/include/qemu/typedefs.h b/include/qemu/typedefs.h
index a4aee238c7..5f95169827 100644
--- a/include/qemu/typedefs.h
+++ b/include/qemu/typedefs.h
@@ -41,6 +41,7 @@ typedef struct CoMutex CoMutex;
 typedef struct ConfidentialGuestSupport ConfidentialGuestSupport;
 typedef struct CPUAddressSpace CPUAddressSpace;
 typedef struct CPUArchState CPUArchState;
+typedef struct CPUJumpCache CPUJumpCache;
 typedef struct CPUState CPUState;
 typedef struct CPUTLBEntryFull CPUTLBEntryFull;
 typedef struct DeviceListener DeviceListener;
diff --git a/accel/stubs/tcg-stub.c b/accel/stubs/tcg-stub.c
index 6ce8a34228..c1b05767c0 100644
--- a/accel/stubs/tcg-stub.c
+++ b/accel/stubs/tcg-stub.c
@@ -21,6 +21,10 @@ void tlb_set_dirty(CPUState *cpu, target_ulong vaddr)
 {
 }
 
+void tcg_flush_jmp_cache(CPUState *cpu)
+{
+}
+
 int probe_access_flags(CPUArchState *env, target_ulong addr,
                        MMUAccessType access_type, int mmu_idx,
                        bool nonfault, void **phost, uintptr_t retaddr)
diff --git a/accel/tcg/cpu-exec.c b/accel/tcg/cpu-exec.c
index dd58a144a8..2d7e610ee2 100644
--- a/accel/tcg/cpu-exec.c
+++ b/accel/tcg/cpu-exec.c
@@ -42,6 +42,7 @@
 #include "sysemu/replay.h"
 #include "sysemu/tcg.h"
 #include "exec/helper-proto.h"
+#include "tb-jmp-cache.h"
 #include "tb-hash.h"
 #include "tb-context.h"
 #include "internal.h"
@@ -252,7 +253,7 @@ static inline TranslationBlock *tb_lookup(CPUState *cpu, target_ulong pc,
     tcg_debug_assert(!(cflags & CF_INVALID));
 
     hash = tb_jmp_cache_hash_func(pc);
-    tb = qatomic_rcu_read(&cpu->tb_jmp_cache[hash]);
+    tb = qatomic_rcu_read(&cpu->tb_jmp_cache->array[hash].tb);
 
     if (likely(tb &&
                tb->pc == pc &&
@@ -266,7 +267,7 @@ static inline TranslationBlock *tb_lookup(CPUState *cpu, target_ulong pc,
     if (tb == NULL) {
         return NULL;
     }
-    qatomic_set(&cpu->tb_jmp_cache[hash], tb);
+    qatomic_set(&cpu->tb_jmp_cache->array[hash].tb, tb);
     return tb;
 }
 
@@ -987,6 +988,8 @@ int cpu_exec(CPUState *cpu)
 
             tb = tb_lookup(cpu, pc, cs_base, flags, cflags);
             if (tb == NULL) {
+                uint32_t h;
+
                 mmap_lock();
                 tb = tb_gen_code(cpu, pc, cs_base, flags, cflags);
                 mmap_unlock();
@@ -994,7 +997,8 @@ int cpu_exec(CPUState *cpu)
                  * We add the TB in the virtual pc hash table
                  * for the fast lookup
                  */
-                qatomic_set(&cpu->tb_jmp_cache[tb_jmp_cache_hash_func(pc)], tb);
+                h = tb_jmp_cache_hash_func(pc);
+                qatomic_set(&cpu->tb_jmp_cache->array[h].tb, tb);
             }
 
 #ifndef CONFIG_USER_ONLY
diff --git a/accel/tcg/cputlb.c b/accel/tcg/cputlb.c
index c7909fb619..6f1c00682b 100644
--- a/accel/tcg/cputlb.c
+++ b/accel/tcg/cputlb.c
@@ -100,10 +100,11 @@ static void tlb_window_reset(CPUTLBDesc *desc, int64_t ns,
 
 static void tb_jmp_cache_clear_page(CPUState *cpu, target_ulong page_addr)
 {
-    unsigned int i, i0 = tb_jmp_cache_hash_page(page_addr);
+    int i, i0 = tb_jmp_cache_hash_page(page_addr);
+    CPUJumpCache *jc = cpu->tb_jmp_cache;
 
     for (i = 0; i < TB_JMP_PAGE_SIZE; i++) {
-        qatomic_set(&cpu->tb_jmp_cache[i0 + i], NULL);
+        qatomic_set(&jc->array[i0 + i].tb, NULL);
     }
 }
 
@@ -356,7 +357,7 @@ static void tlb_flush_by_mmuidx_async_work(CPUState *cpu, run_on_cpu_data data)
 
     qemu_spin_unlock(&env_tlb(env)->c.lock);
 
-    cpu_tb_jmp_cache_clear(cpu);
+    tcg_flush_jmp_cache(cpu);
 
     if (to_clean == ALL_MMUIDX_BITS) {
         qatomic_set(&env_tlb(env)->c.full_flush_count,
@@ -785,7 +786,7 @@ static void tlb_flush_range_by_mmuidx_async_0(CPUState *cpu,
      * longer to clear each entry individually than it will to clear it all.
      */
     if (d.len >= (TARGET_PAGE_SIZE * TB_JMP_CACHE_SIZE)) {
-        cpu_tb_jmp_cache_clear(cpu);
+        tcg_flush_jmp_cache(cpu);
         return;
     }
 
diff --git a/accel/tcg/translate-all.c b/accel/tcg/translate-all.c
index 3a63113c41..63ecc15236 100644
--- a/accel/tcg/translate-all.c
+++ b/accel/tcg/translate-all.c
@@ -58,6 +58,7 @@
 #include "sysemu/tcg.h"
 #include "qapi/error.h"
 #include "hw/core/tcg-cpu-ops.h"
+#include "tb-jmp-cache.h"
 #include "tb-hash.h"
 #include "tb-context.h"
 #include "internal.h"
@@ -967,7 +968,7 @@ static void do_tb_flush(CPUState *cpu, run_on_cpu_data tb_flush_count)
     }
 
     CPU_FOREACH(cpu) {
-        cpu_tb_jmp_cache_clear(cpu);
+        tcg_flush_jmp_cache(cpu);
     }
 
     qht_reset_size(&tb_ctx.htable, CODE_GEN_HTABLE_SIZE);
@@ -1187,8 +1188,9 @@ static void do_tb_phys_invalidate(TranslationBlock *tb, bool rm_from_page_list)
     /* remove the TB from the hash list */
     h = tb_jmp_cache_hash_func(tb->pc);
     CPU_FOREACH(cpu) {
-        if (qatomic_read(&cpu->tb_jmp_cache[h]) == tb) {
-            qatomic_set(&cpu->tb_jmp_cache[h], NULL);
+        CPUJumpCache *jc = cpu->tb_jmp_cache;
+        if (qatomic_read(&jc->array[h].tb) == tb) {
+            qatomic_set(&jc->array[h].tb, NULL);
         }
     }
 
@@ -2443,6 +2445,26 @@ int page_unprotect(target_ulong address, uintptr_t pc)
 }
 #endif /* CONFIG_USER_ONLY */
 
+/*
+ * Called by generic code at e.g. cpu reset after cpu creation,
+ * therefore we must be prepared to allocate the jump cache.
+ */
+void tcg_flush_jmp_cache(CPUState *cpu)
+{
+    CPUJumpCache *jc = cpu->tb_jmp_cache;
+
+    if (likely(jc)) {
+        for (int i = 0; i < TB_JMP_CACHE_SIZE; i++) {
+            qatomic_set(&jc->array[i].tb, NULL);
+        }
+    } else {
+        /* This should happen once during realize, and thus never race. */
+        jc = g_new0(CPUJumpCache, 1);
+        jc = qatomic_xchg(&cpu->tb_jmp_cache, jc);
+        assert(jc == NULL);
+    }
+}
+
 /* This is a wrapper for common code that can not use CONFIG_SOFTMMU */
 void tcg_flush_softmmu_tlb(CPUState *cs)
 {
diff --git a/hw/core/cpu-common.c b/hw/core/cpu-common.c
index 9e3241b430..f9fdd46b9d 100644
--- a/hw/core/cpu-common.c
+++ b/hw/core/cpu-common.c
@@ -137,8 +137,7 @@ static void cpu_common_reset(DeviceState *dev)
     cpu->cflags_next_tb = -1;
 
     if (tcg_enabled()) {
-        cpu_tb_jmp_cache_clear(cpu);
-
+        tcg_flush_jmp_cache(cpu);
         tcg_flush_softmmu_tlb(cpu);
     }
 }
diff --git a/plugins/core.c b/plugins/core.c
index 792262da08..c3ae284994 100644
--- a/plugins/core.c
+++ b/plugins/core.c
@@ -56,7 +56,7 @@ struct qemu_plugin_ctx *plugin_id_to_ctx_locked(qemu_plugin_id_t id)
 static void plugin_cpu_update__async(CPUState *cpu, run_on_cpu_data data)
 {
     bitmap_copy(cpu->plugin_mask, &data.host_ulong, QEMU_PLUGIN_EV_MAX);
-    cpu_tb_jmp_cache_clear(cpu);
+    tcg_flush_jmp_cache(cpu);
 }
 
 static void plugin_cpu_update__locked(gpointer k, gpointer v, gpointer udata)
diff --git a/trace/control-target.c b/trace/control-target.c
index 8418673c18..232c97a4a1 100644
--- a/trace/control-target.c
+++ b/trace/control-target.c
@@ -65,7 +65,7 @@ static void trace_event_synchronize_vcpu_state_dynamic(
 {
     bitmap_copy(vcpu->trace_dstate, vcpu->trace_dstate_delayed,
                 CPU_TRACE_DSTATE_MAX_EVENTS);
-    cpu_tb_jmp_cache_clear(vcpu);
+    tcg_flush_jmp_cache(vcpu);
 }
 
 void trace_event_set_vcpu_state_dynamic(CPUState *vcpu,
-- 
2.34.1


