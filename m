Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CCC06515E0E
	for <lists+qemu-devel@lfdr.de>; Sat, 30 Apr 2022 16:12:40 +0200 (CEST)
Received: from localhost ([::1]:53020 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nknpv-0005cR-V3
	for lists+qemu-devel@lfdr.de; Sat, 30 Apr 2022 10:12:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56220)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nknAr-000548-GY
 for qemu-devel@nongnu.org; Sat, 30 Apr 2022 09:30:15 -0400
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634]:41881)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nknAp-0006XA-OX
 for qemu-devel@nongnu.org; Sat, 30 Apr 2022 09:30:13 -0400
Received: by mail-pl1-x634.google.com with SMTP id s14so9299393plk.8
 for <qemu-devel@nongnu.org>; Sat, 30 Apr 2022 06:30:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=becak9z+s8Wl/AMp2phsDYooGn27jELaYNop0f5bhwc=;
 b=RpHe61vtkA1xkVBzhXpYkzaFRXSzHKmu2dNXbIONQtdCRoO36oT1lclOFv6Zj3elLX
 bD5v6Gsf64YCDo7vnt64KUoeXH4rtV8V0zqVMws462+X5agVanHGRFlj6XNFLq/ZpSn0
 pJ3YHq8zDd/HFkQ5XB4ovmBUIZ5segco8Vj9rh9Hzlq1sTsSrnf9loDa6AyZmktW2Lnw
 wGyaMXBXiD/obLoA6CgfJeg3D/PNMjKnPNnuvby/5EqxPPaOAiUs0xROg1KUTQ+Q7qqF
 GIdZT1uvuo/kZbxeYZCOTdzKMKXgHmLppiasNnXgp8Pwc61ueQSE1nmyFWcRubBY6qBC
 dPtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=becak9z+s8Wl/AMp2phsDYooGn27jELaYNop0f5bhwc=;
 b=DI6TyPUg0CeILw3Bv9PLl+qinRZMDIxiTf2GGfxd5teragFbOzU/ZTU2ClA7z+ChqO
 brgBiDHKJkETdebfPUW670zx6tPnkhaWI4JkXnICbfR9/HQCRB4USog4wdQsF1FBzAi5
 0WTNGqLfQN6p8dDR7PeWsdmbJxtZKIhpZVA78vA16+yVVEMqe3FYHsSk97DFrVgO/FwM
 2jTwlggRA8xk5SbR6sYFSe44uHc7O9PV//GtGbbxYeEXGfOVEXqDL5BxKWXF2RQzOYqe
 xYCHxCf2KysfhJBvHn1fUMeOjLBQe3WiVWC0dRiZWtFOiC6txOCgUbidIkWVcXMJZYLW
 8AMw==
X-Gm-Message-State: AOAM530rfuAmE+agYLn5rzT6IKsBcJ1cojlF7WjEVETzqlSnG6NTadBQ
 w+QramE4eSkZTQ4twMnjpi5p4viygiPL5A==
X-Google-Smtp-Source: ABdhPJxcTb1BH0bqSi6S8uzF5eFhJJcUNAAjcTxD6G9qDrE2oD9wEvMPi8fP20wIF5cPsejHj2vTOw==
X-Received: by 2002:a17:90b:124c:b0:1bc:369b:7db5 with SMTP id
 gx12-20020a17090b124c00b001bc369b7db5mr9012706pjb.179.1651325410474; 
 Sat, 30 Apr 2022 06:30:10 -0700 (PDT)
Received: from stoup.. ([71.212.142.129]) by smtp.gmail.com with ESMTPSA id
 x5-20020aa793a5000000b0050dc7628201sm1522606pff.219.2022.04.30.06.30.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 30 Apr 2022 06:30:10 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 37/43] target/m68k: Do semihosting call as a normal helper
Date: Sat, 30 Apr 2022 06:29:26 -0700
Message-Id: <20220430132932.324018-38-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220430132932.324018-1-richard.henderson@linaro.org>
References: <20220430132932.324018-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::634;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x634.google.com
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
Cc: crwulff@gmail.com, alex.bennee@linaro.org, f4bug@amsat.org,
 laurent@vivier.eu
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

There's no need to raise an exception; just call the
helper function directly.  The test for the required
surrounding insns is easier as well.

Move the load of nr inside the helper.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/m68k/cpu.h       |  2 --
 target/m68k/helper.h    |  1 +
 target/m68k/m68k-semi.c |  6 ++++--
 target/m68k/op_helper.c | 10 ----------
 target/m68k/translate.c | 26 +++++++++++++++++++++++++-
 5 files changed, 30 insertions(+), 15 deletions(-)

diff --git a/target/m68k/cpu.h b/target/m68k/cpu.h
index 9b3bf7a448..60f88e6bc9 100644
--- a/target/m68k/cpu.h
+++ b/target/m68k/cpu.h
@@ -456,8 +456,6 @@ typedef enum {
 void m68k_set_irq_level(M68kCPU *cpu, int level, uint8_t vector);
 void m68k_switch_sp(CPUM68KState *env);
 
-void do_m68k_semihosting(CPUM68KState *env, int nr);
-
 /*
  * The 68000 family is defined in six main CPU classes, the 680[012346]0.
  * Generally each successive CPU adds enhanced data/stack/instructions.
diff --git a/target/m68k/helper.h b/target/m68k/helper.h
index 0a6b4146f6..0e27c27810 100644
--- a/target/m68k/helper.h
+++ b/target/m68k/helper.h
@@ -128,4 +128,5 @@ DEF_HELPER_4(chk2, void, env, s32, s32, s32)
 DEF_HELPER_3(ptest, void, env, i32, i32)
 DEF_HELPER_3(pflush, void, env, i32, i32)
 DEF_HELPER_FLAGS_1(reset, TCG_CALL_NO_RWG, void, env)
+DEF_HELPER_1(semihosting, void, env)
 #endif
diff --git a/target/m68k/m68k-semi.c b/target/m68k/m68k-semi.c
index 71f9d42e6c..1a36c1158d 100644
--- a/target/m68k/m68k-semi.c
+++ b/target/m68k/m68k-semi.c
@@ -25,6 +25,7 @@
 #include "semihosting/softmmu-uaccess.h"
 #include "hw/boards.h"
 #include "qemu/log.h"
+#include "exec/helper-proto.h"
 
 #define HOSTED_EXIT  0
 #define HOSTED_INIT_SIM 1
@@ -84,12 +85,13 @@ static void m68k_semi_u64_cb(CPUState *cs, uint64_t ret, int err)
     }                                                   \
 } while (0)
 
-void do_m68k_semihosting(CPUM68KState *env, int nr)
+void HELPER(semihosting)(CPUM68KState *env)
 {
     CPUState *cs = env_cpu(env);
-    uint32_t args;
+    uint32_t args, nr;
     target_ulong arg0, arg1, arg2, arg3;
 
+    nr = env->dregs[0];
     args = env->dregs[1];
     switch (nr) {
     case HOSTED_EXIT:
diff --git a/target/m68k/op_helper.c b/target/m68k/op_helper.c
index 8decc61240..a345245612 100644
--- a/target/m68k/op_helper.c
+++ b/target/m68k/op_helper.c
@@ -22,7 +22,6 @@
 #include "exec/helper-proto.h"
 #include "exec/exec-all.h"
 #include "exec/cpu_ldst.h"
-#include "semihosting/semihost.h"
 
 #if !defined(CONFIG_USER_ONLY)
 
@@ -203,15 +202,6 @@ static void cf_interrupt_all(CPUM68KState *env, int is_hw)
             cf_rte(env);
             return;
         case EXCP_HALT_INSN:
-            if (semihosting_enabled()
-                    && (env->sr & SR_S) != 0
-                    && (env->pc & 3) == 0
-                    && cpu_lduw_code(env, env->pc - 4) == 0x4e71
-                    && cpu_ldl_code(env, env->pc) == 0x4e7bf000) {
-                env->pc += 4;
-                do_m68k_semihosting(env, env->dregs[0]);
-                return;
-            }
             cs->halted = 1;
             cs->exception_index = EXCP_HLT;
             cpu_loop_exit(cs);
diff --git a/target/m68k/translate.c b/target/m68k/translate.c
index 4026572ed8..b7adc8f53d 100644
--- a/target/m68k/translate.c
+++ b/target/m68k/translate.c
@@ -33,6 +33,9 @@
 
 #include "exec/log.h"
 #include "fpu/softfloat.h"
+#ifndef CONFIG_USER_ONLY
+#include "semihosting/semihost.h"
+#endif
 
 
 //#define DEBUG_DISPATCH 1
@@ -313,6 +316,25 @@ static inline void gen_addr_fault(DisasContext *s)
     gen_exception(s, s->base.pc_next, EXCP_ADDRESS);
 }
 
+#ifndef CONFIG_USER_ONLY
+static bool maybe_semihosting(DisasContext *s)
+{
+    /*
+     * The semihosting insn (halt or bkpt) is preceeded by an aligned NOP
+     * and followed by an invalid sentinel insn (movec %sp,0).
+     */
+    if (semihosting_enabled()
+        && (s->pc & 3) == 2
+        && cpu_lduw_code(s->env, s->pc - 2) == 0x4e71
+        && cpu_ldl_code(s->env, s->pc + 4) == 0x4e7bf000) {
+        gen_helper_semihosting(cpu_env);
+        s->pc += 4;
+        return true;
+    }
+    return false;
+}
+#endif
+
 /*
  * Generate a load from the specified address.  Narrow values are
  *  sign extended to full register width.
@@ -4702,7 +4724,9 @@ DISAS_INSN(halt)
         gen_exception(s, s->base.pc_next, EXCP_PRIVILEGE);
         return;
     }
-
+    if (maybe_semihosting(s)) {
+        return;
+    }
     gen_exception(s, s->pc, EXCP_HALT_INSN);
 }
 
-- 
2.34.1


