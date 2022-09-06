Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DCDA85AE4E2
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Sep 2022 11:58:42 +0200 (CEST)
Received: from localhost ([::1]:51116 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oVVLt-00063W-Vk
	for lists+qemu-devel@lfdr.de; Tue, 06 Sep 2022 05:58:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51096)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oVUcN-0007VP-JI
 for qemu-devel@nongnu.org; Tue, 06 Sep 2022 05:11:40 -0400
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435]:45844)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oVUcL-0002ev-Ib
 for qemu-devel@nongnu.org; Tue, 06 Sep 2022 05:11:39 -0400
Received: by mail-wr1-x435.google.com with SMTP id bj14so1162360wrb.12
 for <qemu-devel@nongnu.org>; Tue, 06 Sep 2022 02:11:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date;
 bh=M1x+zyGC28K7Q+U3nSiQK9bIwX4RNio1iwL+SZjxtfU=;
 b=hHj2XxbSsRi0bbDaYT6GszPrwwZVQT+XCWV+1CA6WIfanPjClr5MpfstIuTGaFNEne
 60PiPoyTK1V8IquogQFCnCxjr+mNuYOccJVBTmzam53v1Fpm40oIJlqA/h7HTOjLQIKg
 MiC3x9pa8EoEKeDMi80Hy3DD0y8I+zjOZDEVKO2qhqzjy5jgRY86fYSTN8KuZu9IaTOO
 5at7ymCA3PyKp3IRe7FlNAGwVXvJYC9F2fvLvbTPeerAjLiP7sNDQSKf4OVEnH0d9m6e
 NCSz7I2ABiGaAojs93gd85Q4nMx0keL7RU9wp2TFp0K8otEIgT1RrcutYhK0d2LYKmQL
 0Mkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=M1x+zyGC28K7Q+U3nSiQK9bIwX4RNio1iwL+SZjxtfU=;
 b=pOzW9TjpRPK8iad6AnWSZmXv4e4umsF5SA0pas9ibaRUJWBfVy1Utw5/TA5dFZpRfl
 iqZ8oKObYohSI/O3qsmpXAnloEXi2kdfwj9pXVqD/+XVAxuBeHxBR+pkuigZpngYzva4
 WTa/Zq1hzu8oyTUfQ3GRYd81PstxmJn0uoeGo111vwRluUBOTvybo06Vdyf+JMQXSOKm
 Noa8nYPek/BPKUP7JzQ0tadiPsjOMA+De+rWx3VJErZpiBtrdQ0jdT2sSBnDG5YkJLYR
 Co1PHUhI6CFzAKOU0kjkXIKwcfhR12gp01rW4gNSmeTBC2QSqFjGfvZxZKGgzpkiDShk
 fgkw==
X-Gm-Message-State: ACgBeo26g5rki3dyrxMtESE5TBlaUh24gSPLw+xxAjHOal3t1tL8/O4P
 DyvQdc88YgRqn3PydLWRyPnHwm9obiEVsSIP
X-Google-Smtp-Source: AA6agR7R+J0w1K0yVP7Yvbx21g3zabzB56e7mGCMC1PngQdSzknALrhdyAUAfgLUOiLW/2JMQn7GbQ==
X-Received: by 2002:a5d:65ce:0:b0:228:d8b6:d1 with SMTP id
 e14-20020a5d65ce000000b00228d8b600d1mr1317030wrw.486.1662455495611; 
 Tue, 06 Sep 2022 02:11:35 -0700 (PDT)
Received: from localhost.localdomain
 ([2a02:8084:a5c0:5a80:ba98:3a71:8524:e0b1])
 by smtp.gmail.com with ESMTPSA id
 m64-20020a1c2643000000b003a5ee64cc98sm20094193wmm.33.2022.09.06.02.11.33
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Sep 2022 02:11:34 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 4/7] include/hw/core: Create struct CPUJumpCache
Date: Tue,  6 Sep 2022 10:11:23 +0100
Message-Id: <20220906091126.298041-5-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220906091126.298041-1-richard.henderson@linaro.org>
References: <20220906091126.298041-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=richard.henderson@linaro.org; helo=mail-wr1-x435.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

Wrap the bare TranslationBlock pointer into a structure.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/hw/core/cpu.h     | 8 ++++++--
 accel/tcg/cpu-exec.c      | 9 ++++++---
 accel/tcg/cputlb.c        | 2 +-
 accel/tcg/translate-all.c | 4 ++--
 4 files changed, 15 insertions(+), 8 deletions(-)

diff --git a/include/hw/core/cpu.h b/include/hw/core/cpu.h
index 9e47184513..ee5b75dea0 100644
--- a/include/hw/core/cpu.h
+++ b/include/hw/core/cpu.h
@@ -232,6 +232,10 @@ struct hvf_vcpu_state;
 #define TB_JMP_CACHE_BITS 12
 #define TB_JMP_CACHE_SIZE (1 << TB_JMP_CACHE_BITS)
 
+typedef struct {
+    TranslationBlock *tb;
+} CPUJumpCache;
+
 /* work queue */
 
 /* The union type allows passing of 64 bit target pointers on 32 bit
@@ -361,7 +365,7 @@ struct CPUState {
     IcountDecr *icount_decr_ptr;
 
     /* Accessed in parallel; all accesses must be atomic */
-    TranslationBlock *tb_jmp_cache[TB_JMP_CACHE_SIZE];
+    CPUJumpCache tb_jmp_cache[TB_JMP_CACHE_SIZE];
 
     struct GDBRegisterState *gdb_regs;
     int gdb_num_regs;
@@ -452,7 +456,7 @@ static inline void cpu_tb_jmp_cache_clear(CPUState *cpu)
     unsigned int i;
 
     for (i = 0; i < TB_JMP_CACHE_SIZE; i++) {
-        qatomic_set(&cpu->tb_jmp_cache[i], NULL);
+        qatomic_set(&cpu->tb_jmp_cache[i].tb, NULL);
     }
 }
 
diff --git a/accel/tcg/cpu-exec.c b/accel/tcg/cpu-exec.c
index dd58a144a8..c6283d5798 100644
--- a/accel/tcg/cpu-exec.c
+++ b/accel/tcg/cpu-exec.c
@@ -252,7 +252,7 @@ static inline TranslationBlock *tb_lookup(CPUState *cpu, target_ulong pc,
     tcg_debug_assert(!(cflags & CF_INVALID));
 
     hash = tb_jmp_cache_hash_func(pc);
-    tb = qatomic_rcu_read(&cpu->tb_jmp_cache[hash]);
+    tb = qatomic_rcu_read(&cpu->tb_jmp_cache[hash].tb);
 
     if (likely(tb &&
                tb->pc == pc &&
@@ -266,7 +266,7 @@ static inline TranslationBlock *tb_lookup(CPUState *cpu, target_ulong pc,
     if (tb == NULL) {
         return NULL;
     }
-    qatomic_set(&cpu->tb_jmp_cache[hash], tb);
+    qatomic_set(&cpu->tb_jmp_cache[hash].tb, tb);
     return tb;
 }
 
@@ -987,6 +987,8 @@ int cpu_exec(CPUState *cpu)
 
             tb = tb_lookup(cpu, pc, cs_base, flags, cflags);
             if (tb == NULL) {
+                uint32_t h;
+
                 mmap_lock();
                 tb = tb_gen_code(cpu, pc, cs_base, flags, cflags);
                 mmap_unlock();
@@ -994,7 +996,8 @@ int cpu_exec(CPUState *cpu)
                  * We add the TB in the virtual pc hash table
                  * for the fast lookup
                  */
-                qatomic_set(&cpu->tb_jmp_cache[tb_jmp_cache_hash_func(pc)], tb);
+                h = tb_jmp_cache_hash_func(pc);
+                qatomic_set(&cpu->tb_jmp_cache[h].tb, tb);
             }
 
 #ifndef CONFIG_USER_ONLY
diff --git a/accel/tcg/cputlb.c b/accel/tcg/cputlb.c
index ac4442ee8d..371d7f1440 100644
--- a/accel/tcg/cputlb.c
+++ b/accel/tcg/cputlb.c
@@ -103,7 +103,7 @@ static void tb_jmp_cache_clear_page(CPUState *cpu, target_ulong page_addr)
     unsigned int i, i0 = tb_jmp_cache_hash_page(page_addr);
 
     for (i = 0; i < TB_JMP_PAGE_SIZE; i++) {
-        qatomic_set(&cpu->tb_jmp_cache[i0 + i], NULL);
+        qatomic_set(&cpu->tb_jmp_cache[i0 + i].tb, NULL);
     }
 }
 
diff --git a/accel/tcg/translate-all.c b/accel/tcg/translate-all.c
index d1f478d836..324a71317c 100644
--- a/accel/tcg/translate-all.c
+++ b/accel/tcg/translate-all.c
@@ -1208,8 +1208,8 @@ static void do_tb_phys_invalidate(TranslationBlock *tb, bool rm_from_page_list)
     /* remove the TB from the hash list */
     h = tb_jmp_cache_hash_func(tb->pc);
     CPU_FOREACH(cpu) {
-        if (qatomic_read(&cpu->tb_jmp_cache[h]) == tb) {
-            qatomic_set(&cpu->tb_jmp_cache[h], NULL);
+        if (qatomic_read(&cpu->tb_jmp_cache[h].tb) == tb) {
+            qatomic_set(&cpu->tb_jmp_cache[h].tb, NULL);
         }
     }
 
-- 
2.34.1


