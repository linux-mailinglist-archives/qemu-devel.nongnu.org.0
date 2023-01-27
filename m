Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F9C267ECEA
	for <lists+qemu-devel@lfdr.de>; Fri, 27 Jan 2023 18:59:16 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pLSxD-00018Q-Br; Fri, 27 Jan 2023 12:55:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pLSwz-0000vX-Hx
 for qemu-devel@nongnu.org; Fri, 27 Jan 2023 12:55:45 -0500
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pLSwm-00064a-G2
 for qemu-devel@nongnu.org; Fri, 27 Jan 2023 12:55:45 -0500
Received: by mail-wr1-x42d.google.com with SMTP id q5so5717423wrv.0
 for <qemu-devel@nongnu.org>; Fri, 27 Jan 2023 09:55:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=UFBOebjDMNyt8lt9YQWN5ih+hGCR/56+Fkpd8Mo1kfs=;
 b=DTcVppdYuYi1dRWv9kQCj9Bq6Y31BKFuUqLlqXgByIx+L1C9uhdVmoSCDetltfSxb9
 8cs3EZhXY2iwqDDvjZhA2QLjeg9vo3M4DVr/Lq2J7e/TVD1G4k0pGrBwpLLZhngZjL5q
 zryXtGuUr6KDnLv2CL9e11len6Pw07Vm2+QMNC31e9hpkWhrOI8ok1NT5AXCLNZpPPG4
 o7pW2FK0RnetbtwEzech+zwy82/MK/fJyscC7rY+nY4Sl4hapeDgKaevvo/5WuBcyQC7
 2yoP57dSx8Z/KIDeP09gWI6MuzqqkxGNIyYldqxfSK0bKAdKSqcsomFm+bsSMcAcCBMQ
 5aRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=UFBOebjDMNyt8lt9YQWN5ih+hGCR/56+Fkpd8Mo1kfs=;
 b=qseF9t+io1XJ893Ukn/UuIIi/ETSbvHpm+WPMg+Ga3MyF+M4tJ4ta+m18IcFdwUTmw
 WKAl992FsDSMIR9AcFgkGyHlIDytKlvb3ZMV6wxgfqSj5X6UWnMeR3N7VEzar0Ud4kp/
 5oQd3zTzhrDYayzFk4bIEnvc2vEMkQD4uqXIssDj3r0WJrGV6qlMqEKDFYKdxiRcCGzy
 rcqz2fz0CWuaT/Sks8ngMWAFS4xbNiQ9LQ9FbZgPUw177oVWZ+6ClBF7rEhH1zc2ZLGn
 aOLqxC7euuBm6Q2euwzYQnUehUhak9r0XXJcV4mNUxEdSpdvG6BHi76o120JBYe7ybeh
 65kw==
X-Gm-Message-State: AO0yUKXbE1UEafcKxxe5WwvC/k8rrMcHzznXDECMDBJA6NKw47eSYPLR
 mQxP2+XdOVK2JUYYnLN7tOa/1g==
X-Google-Smtp-Source: AK7set+PvaoCsm4x+w8MqoydcM8FnSB+whIFXuX8/6rvkHmakZRraWnZp4jO3QUbBNhI3ntGL0XXMw==
X-Received: by 2002:adf:fd8f:0:b0:2bf:d1c8:6a02 with SMTP id
 d15-20020adffd8f000000b002bfd1c86a02mr2867663wrr.68.1674842131011; 
 Fri, 27 Jan 2023 09:55:31 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 l13-20020adff48d000000b002366e3f1497sm4545089wro.6.2023.01.27.09.55.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 Jan 2023 09:55:30 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 20/23] target/arm: Implement the HFGITR_EL2.ERET trap
Date: Fri, 27 Jan 2023 17:55:04 +0000
Message-Id: <20230127175507.2895013-21-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230127175507.2895013-1-peter.maydell@linaro.org>
References: <20230127175507.2895013-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Implement the HFGITR_EL2.ERET fine-grained trap.  This traps
execution from AArch64 EL1 of ERET, ERETAA and ERETAB.  The trap is
reported with a syndrome value of 0x1a.

The trap must take precedence over a possible pointer-authentication
trap for ERETAA and ERETAB.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/cpu.h           |  1 +
 target/arm/syndrome.h      | 10 ++++++++++
 target/arm/translate.h     |  2 ++
 target/arm/helper.c        |  3 +++
 target/arm/translate-a64.c | 10 ++++++++++
 5 files changed, 26 insertions(+)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index 5cc81bec9bf..ec2a7716ce7 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -3245,6 +3245,7 @@ FIELD(TBFLAG_A64, PSTATE_ZA, 23, 1)
 FIELD(TBFLAG_A64, SVL, 24, 4)
 /* Indicates that SME Streaming mode is active, and SMCR_ELx.FA64 is not. */
 FIELD(TBFLAG_A64, SME_TRAP_NONSTREAMING, 28, 1)
+FIELD(TBFLAG_A64, FGT_ERET, 29, 1)
 
 /*
  * Helpers for using the above.
diff --git a/target/arm/syndrome.h b/target/arm/syndrome.h
index 73df5e37938..d27d1bc31f0 100644
--- a/target/arm/syndrome.h
+++ b/target/arm/syndrome.h
@@ -48,6 +48,7 @@ enum arm_exception_class {
     EC_AA64_SMC               = 0x17,
     EC_SYSTEMREGISTERTRAP     = 0x18,
     EC_SVEACCESSTRAP          = 0x19,
+    EC_ERETTRAP               = 0x1a,
     EC_SMETRAP                = 0x1d,
     EC_INSNABORT              = 0x20,
     EC_INSNABORT_SAME_EL      = 0x21,
@@ -215,6 +216,15 @@ static inline uint32_t syn_sve_access_trap(void)
     return EC_SVEACCESSTRAP << ARM_EL_EC_SHIFT;
 }
 
+/*
+ * eret_op is bits [1:0] of the ERET instruction, so:
+ * 0 for ERET, 2 for ERETAA, 3 for ERETAB.
+ */
+static inline uint32_t syn_erettrap(int eret_op)
+{
+    return (EC_ERETTRAP << ARM_EL_EC_SHIFT) | ARM_EL_IL | eret_op;
+}
+
 static inline uint32_t syn_smetrap(SMEExceptionType etype, bool is_16bit)
 {
     return (EC_SMETRAP << ARM_EL_EC_SHIFT)
diff --git a/target/arm/translate.h b/target/arm/translate.h
index 599902016dc..62a7706eabd 100644
--- a/target/arm/translate.h
+++ b/target/arm/translate.h
@@ -132,6 +132,8 @@ typedef struct DisasContext {
     bool mve_no_pred;
     /* True if fine-grained traps are active */
     bool fgt_active;
+    /* True if fine-grained trap on ERET is enabled */
+    bool fgt_eret;
     /*
      * >= 0, a copy of PSTATE.BTYPE, which will be 0 without v8.5-BTI.
      *  < 0, set by the current instruction.
diff --git a/target/arm/helper.c b/target/arm/helper.c
index c0403aadae2..6151c775053 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -12065,6 +12065,9 @@ static CPUARMTBFlags rebuild_hflags_a64(CPUARMState *env, int el, int fp_el,
 
     if (arm_fgt_active(env, el)) {
         DP_TBFLAG_ANY(flags, FGT_ACTIVE, 1);
+        if (FIELD_EX64(env->cp15.fgt_exec[FGTREG_HFGITR], HFGITR_EL2, ERET)) {
+            DP_TBFLAG_A64(flags, FGT_ERET, 1);
+        }
     }
 
     if (cpu_isar_feature(aa64_mte, env_archcpu(env))) {
diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
index a47dab4f1dd..11bfa3f717a 100644
--- a/target/arm/translate-a64.c
+++ b/target/arm/translate-a64.c
@@ -2385,6 +2385,10 @@ static void disas_uncond_b_reg(DisasContext *s, uint32_t insn)
             if (op4 != 0) {
                 goto do_unallocated;
             }
+            if (s->fgt_eret) {
+                gen_exception_insn_el(s, 0, EXCP_UDEF, syn_erettrap(op3), 2);
+                return;
+            }
             dst = tcg_temp_new_i64();
             tcg_gen_ld_i64(dst, cpu_env,
                            offsetof(CPUARMState, elr_el[s->current_el]));
@@ -2398,6 +2402,11 @@ static void disas_uncond_b_reg(DisasContext *s, uint32_t insn)
             if (rn != 0x1f || op4 != 0x1f) {
                 goto do_unallocated;
             }
+            /* The FGT trap takes precedence over an auth trap. */
+            if (s->fgt_eret) {
+                gen_exception_insn_el(s, 0, EXCP_UDEF, syn_erettrap(op3), 2);
+                return;
+            }
             dst = tcg_temp_new_i64();
             tcg_gen_ld_i64(dst, cpu_env,
                            offsetof(CPUARMState, elr_el[s->current_el]));
@@ -14742,6 +14751,7 @@ static void aarch64_tr_init_disas_context(DisasContextBase *dcbase,
     dc->align_mem = EX_TBFLAG_ANY(tb_flags, ALIGN_MEM);
     dc->pstate_il = EX_TBFLAG_ANY(tb_flags, PSTATE__IL);
     dc->fgt_active = EX_TBFLAG_ANY(tb_flags, FGT_ACTIVE);
+    dc->fgt_eret = EX_TBFLAG_A64(tb_flags, FGT_ERET);
     dc->sve_excp_el = EX_TBFLAG_A64(tb_flags, SVEEXC_EL);
     dc->sme_excp_el = EX_TBFLAG_A64(tb_flags, SMEEXC_EL);
     dc->vl = (EX_TBFLAG_A64(tb_flags, VL) + 1) * 16;
-- 
2.34.1


