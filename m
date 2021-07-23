Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B4083D3D84
	for <lists+qemu-devel@lfdr.de>; Fri, 23 Jul 2021 18:24:45 +0200 (CEST)
Received: from localhost ([::1]:49398 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m6xye-0003ls-Le
	for lists+qemu-devel@lfdr.de; Fri, 23 Jul 2021 12:24:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49348)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m6xvt-0008QX-DS
 for qemu-devel@nongnu.org; Fri, 23 Jul 2021 12:21:53 -0400
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430]:33329)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m6xvr-0000kp-Dt
 for qemu-devel@nongnu.org; Fri, 23 Jul 2021 12:21:53 -0400
Received: by mail-wr1-x430.google.com with SMTP id q3so3038867wrx.0
 for <qemu-devel@nongnu.org>; Fri, 23 Jul 2021 09:21:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=6bcSsnl6u82JYa+g2MBv9GVvdo5DY+x1DAHdRtbYsP0=;
 b=H6dZBnzoqjJDX0KwISIefbEulJ+2575Ex/SNWD2GZw3VU+DRfn66XFWLBFyviC07Wp
 9rqtcANTpIqSaGZhQNBGEHK/I3k+eIs4aPEQrgcahzyEuJjIJrREjhW6HwY8vVVfw6mI
 CnVRlXQJT3pkxO5bO6VEb+luJV4Jfx7CnR/JDxOJFhI/P1TBqROdcQZ8Li2dreCljxzw
 SAROfw4mXaVtrsTHgijweLG9D7GEz+a+7Pc1KZiLnK555YavSLRRiO+WF2+doDLj9zTz
 i9aCfwLhfUAEyJ4GutqdZM7GOiYFfcGm/ojAdIup2IFprvHCtSmtYn0ku9f8im39RIao
 ooaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=6bcSsnl6u82JYa+g2MBv9GVvdo5DY+x1DAHdRtbYsP0=;
 b=ZoPYmh7L55cyZ5/GG9QX1CFR1+6RcRFtkOFxOtUC8lL8B7ZAFlRw5Bgtat5oufeyW6
 Z51S62NAPWtTfRFo9UIhrj/kwTIbJkmPqtvhvnr4prmae/lhJU1pY6w8gd2VoxPLc8hw
 MwEGbnXRSAN+KomutRqKponK9AoOhzNCHHKU81ZrZd5E5tYNrkDl5LwTnxVLoQRKUbnt
 V8bSGfSsb3wT3BB+SRxkc4eiYgcJUYQTSy8KE1lIm3uOZhvkuUOSueGGQMJXEieI5WfI
 Z5GqLtd1pRVfq5JJkQOJOovVEkigh75aCNyvLHnciYU7Xf530+IwTR0+03ZpAIihifzC
 h2vQ==
X-Gm-Message-State: AOAM533mwAlPozPRzx6Z+JbSbpTT8O88eCZODAB/R2t7wfQdUDYXWKd5
 f1diYPV3eNrg98HG8HKLTr5AkBx2SNfdiA==
X-Google-Smtp-Source: ABdhPJxUATm+Q1J61YDeZF2AL8KvQj3g5hrmc3V2ZqcS/9bjzctOJOep08cRQ5GbiSaLR7Hbnk8ZOg==
X-Received: by 2002:adf:dfcb:: with SMTP id q11mr864529wrn.16.1627057309409;
 Fri, 23 Jul 2021 09:21:49 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id y11sm5721416wmi.33.2021.07.23.09.21.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 23 Jul 2021 09:21:49 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH for-6.1 1/6] target/arm: Enforce that M-profile SP low 2 bits
 are always zero
Date: Fri, 23 Jul 2021 17:21:41 +0100
Message-Id: <20210723162146.5167-2-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210723162146.5167-1-peter.maydell@linaro.org>
References: <20210723162146.5167-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x430.google.com
X-Spam_score_int: -1
X-Spam_score: -0.2
X-Spam_bar: /
X-Spam_report: (-0.2 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

For M-profile, unlike A-profile, the low 2 bits of SP are defined to be
RES0H, which is to say that they must be hardwired to zero so that
guest attempts to write non-zero values to them are ignored.

Implement this behaviour by masking out the low bits:
 * for writes to r13 by the gdbstub
 * for writes to any of the various flavours of SP via MSR
 * for writes to r13 via store_reg() in generated code

Note that all the direct uses of cpu_R[] in translate.c are in places
where the register is definitely not r13 (usually because that has
been checked for as an UNDEFINED or UNPREDICTABLE case and handled as
UNDEF).

All the other writes to regs[13] in C code are either:
 * A-profile only code
 * writes of values we can guarantee to be aligned, such as
   - writes of previous-SP-value plus or minus a 4-aligned constant
   - writes of the value in an SP limit register (which we already
     enforce to be aligned)

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
This is one of those changes where the code changed is clearly OK
and the review is more "did we miss anything?". Optimization of cases
in generated code where we know the value is already aligned would
obviously be possible (eg "ADD SP, SP, #8") but I haven't looked at
that; after all, it's only one extra AND insn.
---
 target/arm/gdbstub.c   |  4 ++++
 target/arm/m_helper.c  | 14 ++++++++------
 target/arm/translate.c |  3 +++
 3 files changed, 15 insertions(+), 6 deletions(-)

diff --git a/target/arm/gdbstub.c b/target/arm/gdbstub.c
index a8fff2a3d09..826601b3415 100644
--- a/target/arm/gdbstub.c
+++ b/target/arm/gdbstub.c
@@ -84,6 +84,10 @@ int arm_cpu_gdb_write_register(CPUState *cs, uint8_t *mem_buf, int n)
 
     if (n < 16) {
         /* Core integer register.  */
+        if (n == 13 && arm_feature(env, ARM_FEATURE_M)) {
+            /* M profile SP low bits are always 0 */
+            tmp &= ~3;
+        }
         env->regs[n] = tmp;
         return 4;
     }
diff --git a/target/arm/m_helper.c b/target/arm/m_helper.c
index 7a1e35ab5b6..f9a9cb466c9 100644
--- a/target/arm/m_helper.c
+++ b/target/arm/m_helper.c
@@ -2563,13 +2563,13 @@ void HELPER(v7m_msr)(CPUARMState *env, uint32_t maskreg, uint32_t val)
             if (!env->v7m.secure) {
                 return;
             }
-            env->v7m.other_ss_msp = val;
+            env->v7m.other_ss_msp = val & ~3;
             return;
         case 0x89: /* PSP_NS */
             if (!env->v7m.secure) {
                 return;
             }
-            env->v7m.other_ss_psp = val;
+            env->v7m.other_ss_psp = val & ~3;
             return;
         case 0x8a: /* MSPLIM_NS */
             if (!env->v7m.secure) {
@@ -2638,6 +2638,8 @@ void HELPER(v7m_msr)(CPUARMState *env, uint32_t maskreg, uint32_t val)
 
             limit = is_psp ? env->v7m.psplim[false] : env->v7m.msplim[false];
 
+            val &= ~0x3;
+
             if (val < limit) {
                 raise_exception_ra(env, EXCP_STKOF, 0, 1, GETPC());
             }
@@ -2660,16 +2662,16 @@ void HELPER(v7m_msr)(CPUARMState *env, uint32_t maskreg, uint32_t val)
         break;
     case 8: /* MSP */
         if (v7m_using_psp(env)) {
-            env->v7m.other_sp = val;
+            env->v7m.other_sp = val & ~3;
         } else {
-            env->regs[13] = val;
+            env->regs[13] = val & ~3;
         }
         break;
     case 9: /* PSP */
         if (v7m_using_psp(env)) {
-            env->regs[13] = val;
+            env->regs[13] = val & ~3;
         } else {
-            env->v7m.other_sp = val;
+            env->v7m.other_sp = val & ~3;
         }
         break;
     case 10: /* MSPLIM */
diff --git a/target/arm/translate.c b/target/arm/translate.c
index 351afa43a29..80c282669f0 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -291,6 +291,9 @@ void store_reg(DisasContext *s, int reg, TCGv_i32 var)
          */
         tcg_gen_andi_i32(var, var, s->thumb ? ~1 : ~3);
         s->base.is_jmp = DISAS_JUMP;
+    } else if (reg == 13 && arm_dc_feature(s, ARM_FEATURE_M)) {
+        /* For M-profile SP bits [1:0] are always zero */
+        tcg_gen_andi_i32(var, var, ~3);
     }
     tcg_gen_mov_i32(cpu_R[reg], var);
     tcg_temp_free_i32(var);
-- 
2.20.1


