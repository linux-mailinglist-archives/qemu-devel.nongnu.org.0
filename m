Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 811474C5E0F
	for <lists+qemu-devel@lfdr.de>; Sun, 27 Feb 2022 19:27:08 +0100 (CET)
Received: from localhost ([::1]:39622 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nOOGB-0005Kw-LE
	for lists+qemu-devel@lfdr.de; Sun, 27 Feb 2022 13:27:07 -0500
Received: from eggs.gnu.org ([209.51.188.92]:60800)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nOOAu-0002lm-FX
 for qemu-devel@nongnu.org; Sun, 27 Feb 2022 13:21:40 -0500
Received: from [2607:f8b0:4864:20::435] (port=43815
 helo=mail-pf1-x435.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nOOAr-0007p8-W9
 for qemu-devel@nongnu.org; Sun, 27 Feb 2022 13:21:40 -0500
Received: by mail-pf1-x435.google.com with SMTP id d187so9072957pfa.10
 for <qemu-devel@nongnu.org>; Sun, 27 Feb 2022 10:21:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=aP6IO/cT72ijPpNPOU0qAba7aGUnduFPooW5AlogQb4=;
 b=YPXmB0DuHvXBy4h/8iIYSJPibk8hI8o9xTq+Y1xsSE3yAFzlBAZMh4aJydSgxFJyDz
 pcwP2h5t0qKD/q/ymC1Iah7HifzVPVivqGuIWiOX9QceqQn/H4K0lbev1j4dHz8QUEko
 QmPJ7aeUVYcoN9D1Adn4Rj7gMxGAXE5fjtSxt7jpee2C+QId+rSCHUsEuo79flD0T7CB
 k89zv8gvONFmnq0Ux9i7JhbV0g4z9BamLOcwRTWT/FOy5olbD9/3/QUmZlLP7nx8jrPU
 tY3LL+6ojRlJMzHs58yToNngJmSpDE6Wt80r2vH1rmgv8SPnqfEepqAXnGtYf+kd4W7P
 b7Gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=aP6IO/cT72ijPpNPOU0qAba7aGUnduFPooW5AlogQb4=;
 b=zOlqXCRvkv4e22oWDJCLrRX5wndm414m8UrpSh9qtZbMfKQeHppC0f5hy6iYJ2DE54
 03Qut4FLa5Gusm1yVnQtlT6Knxb+hp9CUzrFsBFb/3jzoILKQ3nQl9+atOtwn4CZ5jyK
 VcRLrJDh/UGVhrR8Fv/H9Stj/nZGMO2Vsj8XLcyY4h0XIr3x/FZZrCPQ6lUiza9APOct
 aZgqQ0EttJLzdLGQACGlwqKxt/rkn47dks/vzikh8B5kHn7u7tQ6H/773sozheaxUaaX
 D5I9yG1jvmCIXhqWIktx9SMKM275NtqsNC102vMNQ8ALpRcDsGKUIrsQG1EeGgLoVVD7
 SEMQ==
X-Gm-Message-State: AOAM530eFEv1n3qP52uidMCdvzBDPa+OwpxQg0HF6uN5MfJaLAw7mDKx
 Un0IdgHtDnZsbMZf13HGewc2mgxuPRvCMA==
X-Google-Smtp-Source: ABdhPJwjyk/Af3QDT2KR3v9zcgQVjkbW0XgDp6HGH7e9TsSQJ38HbtnXxvVly72wXKG6Mzu7FEMl5A==
X-Received: by 2002:a05:6a00:244b:b0:4c9:319e:ecb7 with SMTP id
 d11-20020a056a00244b00b004c9319eecb7mr17748868pfj.58.1645986096656; 
 Sun, 27 Feb 2022 10:21:36 -0800 (PST)
Received: from localhost.localdomain
 (2603-800c-1201-c600-23be-43d9-7006-705a.res6.spectrum.com.
 [2603:800c:1201:c600:23be:43d9:7006:705a])
 by smtp.gmail.com with ESMTPSA id
 t41-20020a056a0013a900b004e167af0c0dsm10776252pfg.89.2022.02.27.10.21.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 27 Feb 2022 10:21:36 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 5/7] target/nios2: Split mmu_write
Date: Sun, 27 Feb 2022 08:21:23 -1000
Message-Id: <20220227182125.21809-6-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220227182125.21809-1-richard.henderson@linaro.org>
References: <20220227182125.21809-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::435
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::435;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x435.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: amir.gonnen@neuroblade.ai
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Create three separate functions for the three separate registers.
Avoid extra dispatch through op_helper.c.
Dispatch to the correct function in translation.
Clean up the ifdefs in wrctl.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/nios2/helper.h    |   4 +-
 target/nios2/mmu.c       | 180 +++++++++++++++++++--------------------
 target/nios2/op_helper.c |   5 --
 target/nios2/translate.c |  26 +++---
 4 files changed, 104 insertions(+), 111 deletions(-)

diff --git a/target/nios2/helper.h b/target/nios2/helper.h
index 6d8eec1814..21ef7f0791 100644
--- a/target/nios2/helper.h
+++ b/target/nios2/helper.h
@@ -21,6 +21,8 @@
 DEF_HELPER_FLAGS_2(raise_exception, TCG_CALL_NO_WG, noreturn, env, i32)
 
 #if !defined(CONFIG_USER_ONLY)
-DEF_HELPER_3(mmu_write, void, env, i32, i32)
+DEF_HELPER_2(mmu_write_tlbacc, void, env, i32)
+DEF_HELPER_2(mmu_write_tlbmisc, void, env, i32)
+DEF_HELPER_2(mmu_write_pteaddr, void, env, i32)
 DEF_HELPER_1(check_interrupts, void, env)
 #endif
diff --git a/target/nios2/mmu.c b/target/nios2/mmu.c
index 437fad09b7..4daab2a7ab 100644
--- a/target/nios2/mmu.c
+++ b/target/nios2/mmu.c
@@ -23,6 +23,7 @@
 #include "cpu.h"
 #include "exec/exec-all.h"
 #include "mmu.h"
+#include "exec/helper-proto.h"
 #include "trace/trace-target_nios2.h"
 
 
@@ -80,106 +81,103 @@ static void mmu_flush_pid(CPUNios2State *env, uint32_t pid)
     }
 }
 
-void mmu_write(CPUNios2State *env, uint32_t rn, uint32_t v)
+void helper_mmu_write_tlbacc(CPUNios2State *env, uint32_t v)
 {
     CPUState *cs = env_cpu(env);
     Nios2CPU *cpu = env_archcpu(env);
 
-    switch (rn) {
-    case CR_TLBACC:
-        trace_nios2_mmu_write_tlbacc(v >> CR_TLBACC_IGN_SHIFT,
-                                     (v & CR_TLBACC_C) ? 'C' : '.',
-                                     (v & CR_TLBACC_R) ? 'R' : '.',
-                                     (v & CR_TLBACC_W) ? 'W' : '.',
-                                     (v & CR_TLBACC_X) ? 'X' : '.',
-                                     (v & CR_TLBACC_G) ? 'G' : '.',
-                                     v & CR_TLBACC_PFN_MASK);
+    trace_nios2_mmu_write_tlbacc(v >> CR_TLBACC_IGN_SHIFT,
+                                 (v & CR_TLBACC_C) ? 'C' : '.',
+                                 (v & CR_TLBACC_R) ? 'R' : '.',
+                                 (v & CR_TLBACC_W) ? 'W' : '.',
+                                 (v & CR_TLBACC_X) ? 'X' : '.',
+                                 (v & CR_TLBACC_G) ? 'G' : '.',
+                                 v & CR_TLBACC_PFN_MASK);
 
-        /* if tlbmisc.WE == 1 then trigger a TLB write on writes to TLBACC */
-        if (env->regs[CR_TLBMISC] & CR_TLBMISC_WR) {
-            int way = (env->regs[CR_TLBMISC] >> CR_TLBMISC_WAY_SHIFT);
-            int vpn = (env->mmu.pteaddr_wr & CR_PTEADDR_VPN_MASK) >> 2;
-            int pid = (env->mmu.tlbmisc_wr & CR_TLBMISC_PID_MASK) >> 4;
-            int g = (v & CR_TLBACC_G) ? 1 : 0;
-            int valid = ((vpn & CR_TLBACC_PFN_MASK) < 0xC0000) ? 1 : 0;
-            Nios2TLBEntry *entry =
-                &env->mmu.tlb[(way * cpu->tlb_num_ways) +
-                              (vpn & env->mmu.tlb_entry_mask)];
-            uint32_t newTag = (vpn << 12) | (g << 11) | (valid << 10) | pid;
-            uint32_t newData = v & (CR_TLBACC_C | CR_TLBACC_R | CR_TLBACC_W |
-                                    CR_TLBACC_X | CR_TLBACC_PFN_MASK);
+    /* if tlbmisc.WE == 1 then trigger a TLB write on writes to TLBACC */
+    if (env->regs[CR_TLBMISC] & CR_TLBMISC_WR) {
+        int way = (env->regs[CR_TLBMISC] >> CR_TLBMISC_WAY_SHIFT);
+        int vpn = (env->mmu.pteaddr_wr & CR_PTEADDR_VPN_MASK) >> 2;
+        int pid = (env->mmu.tlbmisc_wr & CR_TLBMISC_PID_MASK) >> 4;
+        int g = (v & CR_TLBACC_G) ? 1 : 0;
+        int valid = ((vpn & CR_TLBACC_PFN_MASK) < 0xC0000) ? 1 : 0;
+        Nios2TLBEntry *entry =
+            &env->mmu.tlb[(way * cpu->tlb_num_ways) +
+                          (vpn & env->mmu.tlb_entry_mask)];
+        uint32_t newTag = (vpn << 12) | (g << 11) | (valid << 10) | pid;
+        uint32_t newData = v & (CR_TLBACC_C | CR_TLBACC_R | CR_TLBACC_W |
+                                CR_TLBACC_X | CR_TLBACC_PFN_MASK);
 
-            if ((entry->tag != newTag) || (entry->data != newData)) {
-                if (entry->tag & (1 << 10)) {
-                    /* Flush existing entry */
-                    tlb_flush_page(cs, entry->tag & TARGET_PAGE_MASK);
-                }
-                entry->tag = newTag;
-                entry->data = newData;
+        if ((entry->tag != newTag) || (entry->data != newData)) {
+            if (entry->tag & (1 << 10)) {
+                /* Flush existing entry */
+                tlb_flush_page(cs, entry->tag & TARGET_PAGE_MASK);
             }
-            /* Auto-increment tlbmisc.WAY */
-            env->regs[CR_TLBMISC] =
-                (env->regs[CR_TLBMISC] & ~CR_TLBMISC_WAY_MASK) |
-                (((way + 1) & (cpu->tlb_num_ways - 1)) <<
-                 CR_TLBMISC_WAY_SHIFT);
+            entry->tag = newTag;
+            entry->data = newData;
         }
-
-        /* Writes to TLBACC don't change the read-back value */
-        env->mmu.tlbacc_wr = v;
-        break;
-
-    case CR_TLBMISC:
-        trace_nios2_mmu_write_tlbmisc(v >> CR_TLBMISC_WAY_SHIFT,
-                                      (v & CR_TLBMISC_RD) ? 'R' : '.',
-                                      (v & CR_TLBMISC_WR) ? 'W' : '.',
-                                      (v & CR_TLBMISC_DBL) ? '2' : '.',
-                                      (v & CR_TLBMISC_BAD) ? 'B' : '.',
-                                      (v & CR_TLBMISC_PERM) ? 'P' : '.',
-                                      (v & CR_TLBMISC_D) ? 'D' : '.',
-                                      (v & CR_TLBMISC_PID_MASK) >> 4);
-
-        if ((v & CR_TLBMISC_PID_MASK) !=
-            (env->mmu.tlbmisc_wr & CR_TLBMISC_PID_MASK)) {
-            mmu_flush_pid(env, (env->mmu.tlbmisc_wr & CR_TLBMISC_PID_MASK) >>
-                               CR_TLBMISC_PID_SHIFT);
-        }
-        /* if tlbmisc.RD == 1 then trigger a TLB read on writes to TLBMISC */
-        if (v & CR_TLBMISC_RD) {
-            int way = (v >> CR_TLBMISC_WAY_SHIFT);
-            int vpn = (env->mmu.pteaddr_wr & CR_PTEADDR_VPN_MASK) >> 2;
-            Nios2TLBEntry *entry =
-                &env->mmu.tlb[(way * cpu->tlb_num_ways) +
-                              (vpn & env->mmu.tlb_entry_mask)];
-
-            env->regs[CR_TLBACC] &= CR_TLBACC_IGN_MASK;
-            env->regs[CR_TLBACC] |= entry->data;
-            env->regs[CR_TLBACC] |= (entry->tag & (1 << 11)) ? CR_TLBACC_G : 0;
-            env->regs[CR_TLBMISC] =
-                (v & ~CR_TLBMISC_PID_MASK) |
-                ((entry->tag & ((1 << cpu->pid_num_bits) - 1)) <<
-                 CR_TLBMISC_PID_SHIFT);
-            env->regs[CR_PTEADDR] &= ~CR_PTEADDR_VPN_MASK;
-            env->regs[CR_PTEADDR] |= (entry->tag >> 12) << CR_PTEADDR_VPN_SHIFT;
-        } else {
-            env->regs[CR_TLBMISC] = v;
-        }
-
-        env->mmu.tlbmisc_wr = v;
-        break;
-
-    case CR_PTEADDR:
-        trace_nios2_mmu_write_pteaddr(v >> CR_PTEADDR_PTBASE_SHIFT,
-                                      (v & CR_PTEADDR_VPN_MASK) >> CR_PTEADDR_VPN_SHIFT);
-
-        /* Writes to PTEADDR don't change the read-back VPN value */
-        env->regs[CR_PTEADDR] = (v & ~CR_PTEADDR_VPN_MASK) |
-                                (env->regs[CR_PTEADDR] & CR_PTEADDR_VPN_MASK);
-        env->mmu.pteaddr_wr = v;
-        break;
-
-    default:
-        break;
+        /* Auto-increment tlbmisc.WAY */
+        env->regs[CR_TLBMISC] =
+            (env->regs[CR_TLBMISC] & ~CR_TLBMISC_WAY_MASK) |
+            (((way + 1) & (cpu->tlb_num_ways - 1)) <<
+             CR_TLBMISC_WAY_SHIFT);
     }
+
+    /* Writes to TLBACC don't change the read-back value */
+    env->mmu.tlbacc_wr = v;
+}
+
+void helper_mmu_write_tlbmisc(CPUNios2State *env, uint32_t v)
+{
+    Nios2CPU *cpu = env_archcpu(env);
+
+    trace_nios2_mmu_write_tlbmisc(v >> CR_TLBMISC_WAY_SHIFT,
+                                  (v & CR_TLBMISC_RD) ? 'R' : '.',
+                                  (v & CR_TLBMISC_WR) ? 'W' : '.',
+                                  (v & CR_TLBMISC_DBL) ? '2' : '.',
+                                  (v & CR_TLBMISC_BAD) ? 'B' : '.',
+                                  (v & CR_TLBMISC_PERM) ? 'P' : '.',
+                                  (v & CR_TLBMISC_D) ? 'D' : '.',
+                                  (v & CR_TLBMISC_PID_MASK) >> 4);
+
+    if ((v & CR_TLBMISC_PID_MASK) !=
+        (env->mmu.tlbmisc_wr & CR_TLBMISC_PID_MASK)) {
+        mmu_flush_pid(env, (env->mmu.tlbmisc_wr & CR_TLBMISC_PID_MASK) >>
+                           CR_TLBMISC_PID_SHIFT);
+    }
+    /* if tlbmisc.RD == 1 then trigger a TLB read on writes to TLBMISC */
+    if (v & CR_TLBMISC_RD) {
+        int way = (v >> CR_TLBMISC_WAY_SHIFT);
+        int vpn = (env->mmu.pteaddr_wr & CR_PTEADDR_VPN_MASK) >> 2;
+        Nios2TLBEntry *entry =
+            &env->mmu.tlb[(way * cpu->tlb_num_ways) +
+                          (vpn & env->mmu.tlb_entry_mask)];
+
+        env->regs[CR_TLBACC] &= CR_TLBACC_IGN_MASK;
+        env->regs[CR_TLBACC] |= entry->data;
+        env->regs[CR_TLBACC] |= (entry->tag & (1 << 11)) ? CR_TLBACC_G : 0;
+        env->regs[CR_TLBMISC] =
+            (v & ~CR_TLBMISC_PID_MASK) |
+            ((entry->tag & ((1 << cpu->pid_num_bits) - 1)) <<
+             CR_TLBMISC_PID_SHIFT);
+        env->regs[CR_PTEADDR] &= ~CR_PTEADDR_VPN_MASK;
+        env->regs[CR_PTEADDR] |= (entry->tag >> 12) << CR_PTEADDR_VPN_SHIFT;
+    } else {
+        env->regs[CR_TLBMISC] = v;
+    }
+
+    env->mmu.tlbmisc_wr = v;
+}
+
+void helper_mmu_write_pteaddr(CPUNios2State *env, uint32_t v)
+{
+    trace_nios2_mmu_write_pteaddr(v >> CR_PTEADDR_PTBASE_SHIFT,
+                                  (v & CR_PTEADDR_VPN_MASK) >> CR_PTEADDR_VPN_SHIFT);
+
+    /* Writes to PTEADDR don't change the read-back VPN value */
+    env->regs[CR_PTEADDR] = (v & ~CR_PTEADDR_VPN_MASK) |
+                            (env->regs[CR_PTEADDR] & CR_PTEADDR_VPN_MASK);
+    env->mmu.pteaddr_wr = v;
 }
 
 void mmu_init(CPUNios2State *env)
diff --git a/target/nios2/op_helper.c b/target/nios2/op_helper.c
index 61fc4dc903..d729379e4d 100644
--- a/target/nios2/op_helper.c
+++ b/target/nios2/op_helper.c
@@ -26,11 +26,6 @@
 #include "qemu/main-loop.h"
 
 #if !defined(CONFIG_USER_ONLY)
-void helper_mmu_write(CPUNios2State *env, uint32_t rn, uint32_t v)
-{
-    mmu_write(env, rn, v);
-}
-
 static void nios2_check_interrupts(CPUNios2State *env)
 {
     if (env->irq_pending &&
diff --git a/target/nios2/translate.c b/target/nios2/translate.c
index fa355308a9..52965ba17e 100644
--- a/target/nios2/translate.c
+++ b/target/nios2/translate.c
@@ -461,30 +461,28 @@ static void rdctl(DisasContext *dc, uint32_t code, uint32_t flags)
 /* ctlN <- rA */
 static void wrctl(DisasContext *dc, uint32_t code, uint32_t flags)
 {
-    R_TYPE(instr, code);
-
     gen_check_supervisor(dc);
 
+#ifndef CONFIG_USER_ONLY
+    R_TYPE(instr, code);
+    TCGv v = load_gpr(dc, instr.a);
+
     switch (instr.imm5 + CR_BASE) {
     case CR_PTEADDR:
-    case CR_TLBACC:
-    case CR_TLBMISC:
-    {
-#if !defined(CONFIG_USER_ONLY)
-        TCGv_i32 tmp = tcg_const_i32(instr.imm5 + CR_BASE);
-        gen_helper_mmu_write(cpu_env, tmp, load_gpr(dc, instr.a));
-        tcg_temp_free_i32(tmp);
-#endif
+        gen_helper_mmu_write_pteaddr(cpu_env, v);
+        break;
+    case CR_TLBACC:
+        gen_helper_mmu_write_tlbacc(cpu_env, v);
+        break;
+    case CR_TLBMISC:
+        gen_helper_mmu_write_tlbmisc(cpu_env, v);
         break;
-    }
-
     default:
-        tcg_gen_mov_tl(cpu_R[instr.imm5 + CR_BASE], load_gpr(dc, instr.a));
+        tcg_gen_mov_tl(cpu_R[instr.imm5 + CR_BASE], v);
         break;
     }
 
     /* If interrupts were enabled using WRCTL, trigger them. */
-#if !defined(CONFIG_USER_ONLY)
     if ((instr.imm5 + CR_BASE) == CR_STATUS) {
         if (tb_cflags(dc->base.tb) & CF_USE_ICOUNT) {
             gen_io_start();
-- 
2.25.1


