Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7656232FD9F
	for <lists+qemu-devel@lfdr.de>; Sat,  6 Mar 2021 22:49:37 +0100 (CET)
Received: from localhost ([::1]:36850 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lIeno-0000Zp-FR
	for lists+qemu-devel@lfdr.de; Sat, 06 Mar 2021 16:49:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56994)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lIebK-0007Gx-AW
 for qemu-devel@nongnu.org; Sat, 06 Mar 2021 16:36:42 -0500
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435]:43777)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lIebI-0002zY-8Q
 for qemu-devel@nongnu.org; Sat, 06 Mar 2021 16:36:42 -0500
Received: by mail-pf1-x435.google.com with SMTP id q204so4548479pfq.10
 for <qemu-devel@nongnu.org>; Sat, 06 Mar 2021 13:36:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=fLp7ahr6cCs+oy0rVj+29A4rlPQHlhrG1zIsiKOw/kc=;
 b=KWplDvkP5ag0K1MPMbjz7joBt+NSh3FcqhpqpZCFtFJQVAVlvdDnAViYlMuem/+DKF
 4jyinHUifZ0wcs0lBlzDZCOHlD+f/eRB2VTC74gDFCk35CTrWyfLxzI2J+2rRmIEFxS1
 wMZ3FzlAOyf3UKFzLO2yRT7eq629iDxdO4WOmm6mXlalYDISnAhBLKSRqBglkF/op/f2
 nvZ2tvRa5Qb/hapaXsE8rt7aJKxV7vCN3tqO2OMXRVCEGSUu+O+Tbw6eS5hpFndrsWO1
 vCq5hLbGwTEJlakQ03nieeE4J7aSCKm76f6HqKQiUvjRFzKW3krVU8P571nlRD+85P/w
 lvrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=fLp7ahr6cCs+oy0rVj+29A4rlPQHlhrG1zIsiKOw/kc=;
 b=qnRUPGRzmCgrpttRmnyrOu3YZQmYP/3WD9CUf8YoIyF6QfnIPhVnVdeCoO67c2Cz1t
 00b4gsGM27bxZWuv3ewtBis9eyCjZ64Y3DJQmVpXUa0bu4vOTDkO4MNxTfuqR9GaKO9a
 rHX+uuyHyvE4xx2/VWFLG2lolIawByixqlrUrazuVIrxY9pvNoKnbCAxTjBjNRQmdDsB
 jy3sgI6dVYz9aKE/f4cRA3qk/Nyj8znbsHWOU8hz0xN4B68Fd4HO/W50K0D9ES06iyF8
 U+66LSrrmWnmsIn+aEEPg6Rne+wHX4rGfT/YczewccKOvfMX899Qt4rMGVMLj1ilv6RB
 QeHQ==
X-Gm-Message-State: AOAM533oCNJZU4tU8ff7bV72bgarvcPhvw8Ww8f4yKFxOBD0dLE186ul
 bsv2H9EvYRmB8v568F9RNfr8TYNRQ7aa9w==
X-Google-Smtp-Source: ABdhPJy7t77cnwHiOdXa9KEJENv69lQwfhPtY3a4GIwqzrbXQ2TkvzB9bUuixCdG1o7IxXn1VNBcTQ==
X-Received: by 2002:a62:1ad4:0:b029:1ed:b92c:6801 with SMTP id
 a203-20020a621ad40000b02901edb92c6801mr14430103pfa.7.1615066598988; 
 Sat, 06 Mar 2021 13:36:38 -0800 (PST)
Received: from localhost.localdomain ([71.212.131.83])
 by smtp.gmail.com with ESMTPSA id r30sm6365616pgu.86.2021.03.06.13.36.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 06 Mar 2021 13:36:38 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 23/27] accel/tcg: rename tb_lookup__cpu_state and hoist state
 extraction
Date: Sat,  6 Mar 2021 13:36:09 -0800
Message-Id: <20210306213613.85168-24-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210306213613.85168-1-richard.henderson@linaro.org>
References: <20210306213613.85168-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::435;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x435.google.com
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
Cc: peter.maydell@linaro.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
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
index 9cf475bb03..c3f5d81c55 100644
--- a/include/exec/tb-lookup.h
+++ b/include/exec/tb-lookup.h
@@ -17,30 +17,28 @@
 #include "exec/tb-hash.h"
 
 /* Might cause an exception, so have a longjmp destination ready */
-static inline TranslationBlock *
-tb_lookup__cpu_state(CPUState *cpu, target_ulong *pc, target_ulong *cs_base,
-                     uint32_t *flags, uint32_t cf_mask)
+static inline TranslationBlock *tb_lookup(CPUState *cpu, target_ulong pc,
+                                          target_ulong cs_base,
+                                          uint32_t flags, uint32_t cf_mask)
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


