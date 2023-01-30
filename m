Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 37FE9681907
	for <lists+qemu-devel@lfdr.de>; Mon, 30 Jan 2023 19:26:52 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pMYqR-0001DL-GF; Mon, 30 Jan 2023 13:25:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pMYqO-0001B6-3F
 for qemu-devel@nongnu.org; Mon, 30 Jan 2023 13:25:28 -0500
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pMYqI-0008NL-A8
 for qemu-devel@nongnu.org; Mon, 30 Jan 2023 13:25:27 -0500
Received: by mail-wr1-x435.google.com with SMTP id t18so12011066wro.1
 for <qemu-devel@nongnu.org>; Mon, 30 Jan 2023 10:25:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=dwXHqLhKo35zy7gR+OyfjbB1+IphkLeWns/fzBcm5MU=;
 b=El+QkQeS8W7ibSQtZja1vdZAB5LOAD1ZUhJyaXTyyIWGtkb8PHijLGIZjyKqGpqNxg
 PGQrR6nLG058D4gkMxTfc4+c666W+fLCZgECo8LEzo7A7cq0AONks1SwMwPQat5/mq4I
 6lMl9lHZEGNkhYGFVPspSaDFL0z18SK8stqKDMO7YPdXpBQklMqZYztwUX2jqi5imKvv
 nZSiL6uRw+HPK5Xo8mS2eaS/evfCzdCTeoonvuETedDxj92MYrkL0k3EukZpnt+M5X8m
 eIlWG7sozfziuhRRRU7Ca+y4N4CGPyrcUVNaYnUGzZkgFm2NTZeFb6WLnxnVLwKCpTb6
 wpOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=dwXHqLhKo35zy7gR+OyfjbB1+IphkLeWns/fzBcm5MU=;
 b=VRRfPF8coxHKM9O2qa6/YGSePGLD0IJ+iVVKRyYLh6zSLp4Iip+jpL88gRgjpLbRyU
 /JG+a7BChG90+wmy+pqAGwzjKmsXxK0rbInvJqsXSgQk0OrijmoJJU4tmqcMh9sbdk2+
 LcXdCvZa3IH1798gAocr+S1b+q2SqkClUwIISZNrvr1VxSvvzXT5qm+EQLhfGYtNQAiJ
 C9BBYxm/BZx8eblaREZJWhs1k3muqJV6CFCStLrL13Y2yg09bWU+Ae64Ykk59asM/AFb
 HWpr/PeWSjKSjkjCuhqmt2S3NfJP8mHr7WjXGQhWV4kp1whzbB8KVJ6/XPJYEwjuPYWI
 ja6Q==
X-Gm-Message-State: AO0yUKVnS2dEBgfp2dML7ZOgidvKlYwDT28jBezK8P/uAfzxq3HfqRQg
 WiVOD9m6qbeFsMgR9sL+YEcWL4EPz44U54WX
X-Google-Smtp-Source: AK7set9tNvBnEkCfIs53YM9Ztnyz9SbOAdBVO3ImlaAWn+83IWouRZktOmkILBySZEZ02XCJ587Bwg==
X-Received: by 2002:a05:6000:1f91:b0:2bf:d1a1:ff5d with SMTP id
 bw17-20020a0560001f9100b002bfd1a1ff5dmr10615471wrb.32.1675103121461; 
 Mon, 30 Jan 2023 10:25:21 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 l16-20020adffe90000000b002b8fe58d6desm12245202wrr.62.2023.01.30.10.25.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 Jan 2023 10:25:20 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH v2 20/23] target/arm: Implement the HFGITR_EL2.ERET trap
Date: Mon, 30 Jan 2023 18:24:56 +0000
Message-Id: <20230130182459.3309057-21-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230130182459.3309057-1-peter.maydell@linaro.org>
References: <20230130182459.3309057-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x435.google.com
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
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20230127175507.2895013-21-peter.maydell@linaro.org
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


