Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D72A4CC75C
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Mar 2022 21:52:29 +0100 (CET)
Received: from localhost ([::1]:40592 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nPsR1-0003dR-K7
	for lists+qemu-devel@lfdr.de; Thu, 03 Mar 2022 15:52:28 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54996)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nPsLb-0001bY-5F
 for qemu-devel@nongnu.org; Thu, 03 Mar 2022 15:46:51 -0500
Received: from [2607:f8b0:4864:20::630] (port=37501
 helo=mail-pl1-x630.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nPsLX-0000zM-VM
 for qemu-devel@nongnu.org; Thu, 03 Mar 2022 15:46:50 -0500
Received: by mail-pl1-x630.google.com with SMTP id n15so5844764plf.4
 for <qemu-devel@nongnu.org>; Thu, 03 Mar 2022 12:46:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=VYs8n9ySlRa4OB2uec0koEx8EcehzROHnTlgvRTS7Ns=;
 b=uKGGJeYAK/7++g9fXja1hI5KGhD4EGUhQjphOvwcb45BQFz5IwCu3ScOifFHNZUjGD
 dlHSktefqjO+jQaB+hI5eBdYRcARF6CeDZ8J87YXOMETj/sgLfLwUBuKbipx6xhuAaSf
 UkM2dAZIKaMhYJkZOr0JmMgDEGd+DId7g2ltrcF+/LGWq9BnNMswnOz4eMUJy0ZTWXaI
 BGfn0MjhApj7gGPIbTWh4XjhpRFVig2jq0mbd469PtIlu8+zf1I5sPzquMuZBgPa8et6
 6fC44roCI9ard0xG6onkk5awA2cbC1+UGZjEk2/AJDvx5e/RxYY9Q0e4rWcR1gXOZ73A
 a8tA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=VYs8n9ySlRa4OB2uec0koEx8EcehzROHnTlgvRTS7Ns=;
 b=yAmzNgyj5WJ3xE0xRTY1AyI5vC34D/mZu6+kjEXuUG4haOi1rYiQpdgffgMBhC/ffJ
 HgZiWc1NxvgEfMHdZGCc8CkEfZ4JWIFmUwuf0ytTrZ0NRG7wLCcX7QQQcOZVer+PVxVx
 Epoch7GDjwGWo39d8oWRzU5v5ime0jzOjZm1fYyfjefxuQdM03AtrAB9/9QQLiQeufQT
 uiJEFeh84trp3+VtB8lsY28qVpAf9s9EqeW2oZy+glw1mYxh53386U02P7ms4BGJgMvG
 7x+pKNQGKnFAtZniV7Cn67ZDQUwz9j7dbXFVRNoVYr1cACqdymdo5p6IEj3TybxrFoLX
 3usQ==
X-Gm-Message-State: AOAM533eS+v78R/HrKK1sl+J7sxeYH2YsPyWSQKXH7Tce/dQ22FYyTVG
 mhY3+mg6/de7iixwEjzlrw2v/bYDXwvdDA==
X-Google-Smtp-Source: ABdhPJx2vP+wsxjevUJCZ4mFcm2QdtRkKgBcFx3RUPxNHfzouzAG7G8eL4tMS74X76ZRnHIcvSRIuQ==
X-Received: by 2002:a17:90b:3887:b0:1bf:2409:c834 with SMTP id
 mu7-20020a17090b388700b001bf2409c834mr922845pjb.49.1646340394601; 
 Thu, 03 Mar 2022 12:46:34 -0800 (PST)
Received: from localhost.localdomain
 (2603-800c-1201-c600-119c-490c-a4ee-08e8.res6.spectrum.com.
 [2603:800c:1201:c600:119c:490c:a4ee:8e8])
 by smtp.gmail.com with ESMTPSA id
 d16-20020a17090ad99000b001bcbc4247a0sm2901211pjv.57.2022.03.03.12.46.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Mar 2022 12:46:34 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 5/7] target/nios2: Split mmu_write
Date: Thu,  3 Mar 2022 10:46:22 -1000
Message-Id: <20220303204624.468786-6-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220303204624.468786-1-richard.henderson@linaro.org>
References: <20220303204624.468786-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::630
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::630;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x630.google.com
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
Cc: peter.maydell@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Create three separate functions for the three separate registers.
Avoid extra dispatch through op_helper.c.
Dispatch to the correct function in translation.
Clean up the ifdefs in wrctl.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
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


