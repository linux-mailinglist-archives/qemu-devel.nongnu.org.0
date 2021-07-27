Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BEDF3D73C1
	for <lists+qemu-devel@lfdr.de>; Tue, 27 Jul 2021 12:52:45 +0200 (CEST)
Received: from localhost ([::1]:44968 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m8KhY-00010T-0p
	for lists+qemu-devel@lfdr.de; Tue, 27 Jul 2021 06:52:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50200)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m8Kd6-0001eV-JA
 for qemu-devel@nongnu.org; Tue, 27 Jul 2021 06:48:08 -0400
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434]:41977)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m8Kd4-0004sS-PX
 for qemu-devel@nongnu.org; Tue, 27 Jul 2021 06:48:08 -0400
Received: by mail-wr1-x434.google.com with SMTP id b7so14647144wri.8
 for <qemu-devel@nongnu.org>; Tue, 27 Jul 2021 03:48:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=oEkhKzd+0GiB486+INt6iAxsKVjYUueTlAuyQz+0e2w=;
 b=lZyJkaYi7Cnw4BYRTHoXQmt6Y/qhZtSHnVGMWnoRCdPEkLSod9EZbwUscUFNfpVRpO
 FQJWuX5UvF/RRSJ6vYOSbb407xrDQH5jrcvdVbXZVpoEyWDZWoRyc5atVczjoYbByf7e
 NZQ2Lz9HmNbYWzCNs21wlIOXVU71S04QjFr5IZVuY1v8uRaEw+p3VR5T7L7Ug1fKvu0P
 8XWWPMS9+Rcdpgj8MvfELUsOIJ6Q1ogJ70eylADQbl0XaRlJmkUH/j4zGH0xhiW/Lxs3
 CGMUH7jIP1DrGhz8tntru1tVkqb3TmkAfwtUfX1w4Kfzlf0FDxTMBWgN0tyYyQc26iwu
 dxlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=oEkhKzd+0GiB486+INt6iAxsKVjYUueTlAuyQz+0e2w=;
 b=pAMoPY0TkN/K5j1KOzXr3GxDvWjcyIueQoKR53Ieo4vSIYa/BOt4Em2Fx3rTdnieHQ
 aV3B2wIsTDmEeYK1s8m8UqE7vLMnvh/6eO/9lxiKRDv+Tb7nPuvv6sKsF7g0XAGcPK4Y
 ZxL6q/qUS5us366T7nRLWkK0j/kv8YC2d5Uio6tuYpKVfU0SFjbhAN5G2W3IkOLL5ts0
 NPylcqSQmWYngCnhw3vPtGOY0CtDm2k/4yHprtr6SWoe/xQ9PbQpfP/KUCQiB0//Yq6c
 0ehqPnN4fDXQG02z5G/dKiizePCCihYHUjMYN2wy1FHlxJFpJObi4FZuejAsrayP5QtD
 NdJw==
X-Gm-Message-State: AOAM531zk9pfwx8sNS14cGt7AjNDop58hdnyPAEWpabpmI4W7VuIEW7E
 U23SBHjBRcg2PiKqnV7EPbUHnuQGZ0XENQ==
X-Google-Smtp-Source: ABdhPJyloCQjgypkxRHaQI/9tU1kAjVqxQnYcQV5HtH+3I+T1c5vnCxU29qSRBTXMNypjzxdtEvLPw==
X-Received: by 2002:adf:ee4e:: with SMTP id w14mr3622286wro.15.1627382885476; 
 Tue, 27 Jul 2021 03:48:05 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id y11sm2413598wmi.33.2021.07.27.03.48.04
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Jul 2021 03:48:05 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 03/14] target/arm: Enforce that M-profile SP low 2 bits are
 always zero
Date: Tue, 27 Jul 2021 11:47:50 +0100
Message-Id: <20210727104801.29728-4-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210727104801.29728-1-peter.maydell@linaro.org>
References: <20210727104801.29728-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x434.google.com
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
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20210723162146.5167-2-peter.maydell@linaro.org
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


