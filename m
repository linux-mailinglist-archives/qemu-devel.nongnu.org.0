Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 95FB532A971
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Mar 2021 19:29:46 +0100 (CET)
Received: from localhost ([::1]:50060 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lH9mD-0007CQ-LN
	for lists+qemu-devel@lfdr.de; Tue, 02 Mar 2021 13:29:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59500)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lH9He-0003Gr-Pn
 for qemu-devel@nongnu.org; Tue, 02 Mar 2021 12:58:12 -0500
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a]:35213)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lH9Hc-0007ci-Sn
 for qemu-devel@nongnu.org; Tue, 02 Mar 2021 12:58:10 -0500
Received: by mail-pf1-x42a.google.com with SMTP id o188so7657706pfg.2
 for <qemu-devel@nongnu.org>; Tue, 02 Mar 2021 09:58:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=zRqYUHJr744xk/wD2YdfQmwhn9sj63KtxuT5dzyyfcc=;
 b=OG0zSimOSxIWE3zjRfwtXK5fzkQpJXaVmLptfTmcazyOHtHWktE7WM4pM/RY1X7k4t
 cy8WyIJHOBSs5PUcOVfwLTmWcSwBAbwYigly6hX/MfcBmxt3giBCThZnwnVEg3iWEt02
 AJBtX5bVySu4E8eGGtM8wcRN/hI07Ffym45NUZcTmu8DcVs4NcVM5IKKQ5gfXBiVRstp
 aNwu8j70W591jTwHl8W+pIZQxwcNcSXLEgT9T8z2TDUvRXiPgJI++mAurLVMHizn4WyJ
 f3D675goN5ExUyr/YMIepXQeU3gT+AgJ2xRVCgxzynuaYEJ0scW4neuT9Ko3ecVPDM6O
 UIjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=zRqYUHJr744xk/wD2YdfQmwhn9sj63KtxuT5dzyyfcc=;
 b=kLH9+PzsKNNhzDpjn7pKUQUUOgFDfwOExx4uxpmGYxZMgbA3g/ozrjC+OX0H970HQF
 pfi3gBIV/g8fRJBqn5MDsr97jbJm0xE1io3aaPU/qxbmoJZhKtwjVQcviCEbYBZtEQ5g
 /GCJ5tjrvtR9yXKnQPgJfmNhhMUeWVZ8seWq9UsdXjbFfGS7LzO8pPxcbd7GpdX/sigr
 hjaq7+FUmnMMsos01F9FO1ZYBEZ8H1rHvkU9dhU5DkdrMbKFZFocZdnyekzeELhDxnDd
 G6VZKlP2FRK01OS8gVcEW1sgWPJaoT8WbH4OZZFzPeZNJycpin8YFlH8avNhzWLFQUnr
 f2tw==
X-Gm-Message-State: AOAM532hyzbdZU6dUGYokvSf/mWCf5pMAivSh8LyGKECteKMkDVA9xKc
 Xe2YY8aP1EWwbd4ZpACzcVmJXpnHMz3khw==
X-Google-Smtp-Source: ABdhPJye79YsMErXLSBuCaqUxHox88/M1/U/o6xgm67d+K/P5cTq7f5bTe/G7snO/VGro7YoX843aQ==
X-Received: by 2002:aa7:9010:0:b029:1ee:253b:ebca with SMTP id
 m16-20020aa790100000b02901ee253bebcamr4372579pfo.53.1614707887627; 
 Tue, 02 Mar 2021 09:58:07 -0800 (PST)
Received: from localhost.localdomain (174-21-84-25.tukw.qwest.net.
 [174.21.84.25])
 by smtp.gmail.com with ESMTPSA id gf20sm4232234pjb.39.2021.03.02.09.58.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Mar 2021 09:58:07 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 23/27] accel/tcg: rename tb_lookup__cpu_state and hoist state
 extraction
Date: Tue,  2 Mar 2021 09:57:37 -0800
Message-Id: <20210302175741.1079851-24-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210302175741.1079851-1-richard.henderson@linaro.org>
References: <20210302175741.1079851-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: alex.bennee@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Alex Bennée <alex.bennee@linaro.org>

Having a function return either and valid TB and some system state
seems excessive. It will make the subsequent re-factoring easier if we
lookup the current state where we are.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20210224165811.11567-2-alex.bennee@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/exec/tb-lookup.h | 18 ++++++++----------
 accel/tcg/cpu-exec.c     | 10 ++++++++--
 accel/tcg/tcg-runtime.c  |  4 +++-
 3 files changed, 19 insertions(+), 13 deletions(-)

diff --git a/include/exec/tb-lookup.h b/include/exec/tb-lookup.h
index 9cf475bb03..62a509535d 100644
--- a/include/exec/tb-lookup.h
+++ b/include/exec/tb-lookup.h
@@ -17,30 +17,28 @@
 #include "exec/tb-hash.h"
 
 /* Might cause an exception, so have a longjmp destination ready */
-static inline TranslationBlock *
-tb_lookup__cpu_state(CPUState *cpu, target_ulong *pc, target_ulong *cs_base,
-                     uint32_t *flags, uint32_t cf_mask)
+static inline TranslationBlock * tb_lookup(CPUState *cpu,
+                                           target_ulong pc, target_ulong cs_base,
+                                           uint32_t flags, uint32_t cf_mask)
 {
-    CPUArchState *env = (CPUArchState *)cpu->env_ptr;
     TranslationBlock *tb;
     uint32_t hash;
 
-    cpu_get_tb_cpu_state(env, pc, cs_base, flags);
-    hash = tb_jmp_cache_hash_func(*pc);
+    hash = tb_jmp_cache_hash_func(pc);
     tb = qatomic_rcu_read(&cpu->tb_jmp_cache[hash]);
 
     cf_mask &= ~CF_CLUSTER_MASK;
     cf_mask |= cpu->cluster_index << CF_CLUSTER_SHIFT;
 
     if (likely(tb &&
-               tb->pc == *pc &&
-               tb->cs_base == *cs_base &&
-               tb->flags == *flags &&
+               tb->pc == pc &&
+               tb->cs_base == cs_base &&
+               tb->flags == flags &&
                tb->trace_vcpu_dstate == *cpu->trace_dstate &&
                (tb_cflags(tb) & (CF_HASH_MASK | CF_INVALID)) == cf_mask)) {
         return tb;
     }
-    tb = tb_htable_lookup(cpu, *pc, *cs_base, *flags, cf_mask);
+    tb = tb_htable_lookup(cpu, pc, cs_base, flags, cf_mask);
     if (tb == NULL) {
         return NULL;
     }
diff --git a/accel/tcg/cpu-exec.c b/accel/tcg/cpu-exec.c
index 16e4fe3ccd..ef96b312a1 100644
--- a/accel/tcg/cpu-exec.c
+++ b/accel/tcg/cpu-exec.c
@@ -245,6 +245,7 @@ static void cpu_exec_exit(CPUState *cpu)
 
 void cpu_exec_step_atomic(CPUState *cpu)
 {
+    CPUArchState *env = (CPUArchState *)cpu->env_ptr;
     TranslationBlock *tb;
     target_ulong cs_base, pc;
     uint32_t flags;
@@ -258,7 +259,9 @@ void cpu_exec_step_atomic(CPUState *cpu)
         g_assert(!cpu->running);
         cpu->running = true;
 
-        tb = tb_lookup__cpu_state(cpu, &pc, &cs_base, &flags, cf_mask);
+        cpu_get_tb_cpu_state(env, &pc, &cs_base, &flags);
+        tb = tb_lookup(cpu, pc, cs_base, flags, cf_mask);
+
         if (tb == NULL) {
             mmap_lock();
             tb = tb_gen_code(cpu, pc, cs_base, flags, cflags);
@@ -418,11 +421,14 @@ static inline TranslationBlock *tb_find(CPUState *cpu,
                                         TranslationBlock *last_tb,
                                         int tb_exit, uint32_t cf_mask)
 {
+    CPUArchState *env = (CPUArchState *)cpu->env_ptr;
     TranslationBlock *tb;
     target_ulong cs_base, pc;
     uint32_t flags;
 
-    tb = tb_lookup__cpu_state(cpu, &pc, &cs_base, &flags, cf_mask);
+    cpu_get_tb_cpu_state(env, &pc, &cs_base, &flags);
+
+    tb = tb_lookup(cpu, pc, cs_base, flags, cf_mask);
     if (tb == NULL) {
         mmap_lock();
         tb = tb_gen_code(cpu, pc, cs_base, flags, cf_mask);
diff --git a/accel/tcg/tcg-runtime.c b/accel/tcg/tcg-runtime.c
index d736f4ff55..05e3d52c2f 100644
--- a/accel/tcg/tcg-runtime.c
+++ b/accel/tcg/tcg-runtime.c
@@ -152,7 +152,9 @@ const void *HELPER(lookup_tb_ptr)(CPUArchState *env)
     target_ulong cs_base, pc;
     uint32_t flags;
 
-    tb = tb_lookup__cpu_state(cpu, &pc, &cs_base, &flags, curr_cflags());
+    cpu_get_tb_cpu_state(env, &pc, &cs_base, &flags);
+
+    tb = tb_lookup(cpu, pc, cs_base, flags, curr_cflags());
     if (tb == NULL) {
         return tcg_code_gen_epilogue;
     }
-- 
2.25.1


