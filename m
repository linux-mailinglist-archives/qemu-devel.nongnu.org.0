Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3265E689BD8
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Feb 2023 15:33:13 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pNx5V-0000Ds-Vv; Fri, 03 Feb 2023 09:30:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pNx4h-0006t4-BQ
 for qemu-devel@nongnu.org; Fri, 03 Feb 2023 09:29:59 -0500
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pNx4f-000598-J3
 for qemu-devel@nongnu.org; Fri, 03 Feb 2023 09:29:59 -0500
Received: by mail-wm1-x334.google.com with SMTP id
 l37-20020a05600c1d2500b003dfe46a9801so2509867wms.0
 for <qemu-devel@nongnu.org>; Fri, 03 Feb 2023 06:29:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=UAP+fyEZ6YJZ2unHEOswKIVrra1c/Fd0zQr/S3C4us4=;
 b=aKil9Sh1GkE65ytO0w6SNI8F27YJZstpRQKd1TZf4cGLTdNirsw3U2xIILuyFdwCId
 v1bGk9bRdv43eiuBpn8qEscGHTqGRy6Ry2RkJMZam9D+0ei7QT+mvTdM1QtT+acxjGrD
 vzdrttUy1YuMiAocC+WdQ82ww4AR4lmQu0iDYDQwNj5OmwHlVOdy+Mj9879KfF4B/p8r
 u+FN4ViqvclnCQRoYZ8Bu2yeGTfn7dvOygOo8mIw1/kSADZsIgXK+fHmlNs9fsyZ3opl
 YIwQHE8BrG9JcLKYIN9MomGE0/UN+VTpYaOHVO1A/miBxOg43Vm/xUgOJ6+ihzGcmoH0
 JIzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=UAP+fyEZ6YJZ2unHEOswKIVrra1c/Fd0zQr/S3C4us4=;
 b=XX8rE8FeBrQU8uvBZfgDxcwvFUk8/FsnynZYHrf/bjeJeovydUbqFv1MOjpf8T2q1E
 HMibXbLcfl8kWQGMHYjoOB01HN6Eo9R9keOhVeWGX273Bbkzh+/V4RxmM1nRlY19waw7
 393bPYrPiqb3gPiKbfqRhy2bxWWmPosIy9TTDwJ9VJDkGPXDXg09f+Wt0SNK+PKVCgyU
 ed3PRBVFNAMD+ZrVZkfk+Bn7j91qbkz+9HzrHGExFPcYkrUBHCkmHjgfiMF5OjUN220+
 rZeuYfaCYP/qR0ZpobmuQmSc9hLoBeaWK9ZXy82EZG82QSYOg1kHDO3F5NmUtkL5h5VA
 2mLQ==
X-Gm-Message-State: AO0yUKX4S1yTXLJLrb+kFn/iErbzVtBBMFlDsqZAkZFOQOL4pJ81XBPK
 3vU2Wa331O0H4VJSWLWUqQL89g68IdbuN5kY
X-Google-Smtp-Source: AK7set+yK4ipRJPauiQsEi7ZWIwD4rlKT7BHwwCqa9Mmgmv52UlUB2PiLmhnVAcbDn0L08WDyeiqdw==
X-Received: by 2002:a05:600c:a0d:b0:3dc:4f2c:c856 with SMTP id
 z13-20020a05600c0a0d00b003dc4f2cc856mr10468469wmp.32.1675434594556; 
 Fri, 03 Feb 2023 06:29:54 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 j14-20020a05600c130e00b003df241f52e8sm2578492wmf.42.2023.02.03.06.29.53
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Feb 2023 06:29:53 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 30/33] target/arm: Implement the HFGITR_EL2.ERET trap
Date: Fri,  3 Feb 2023 14:29:24 +0000
Message-Id: <20230203142927.834793-31-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230203142927.834793-1-peter.maydell@linaro.org>
References: <20230203142927.834793-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x334.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Tested-by: Fuad Tabba <tabba@google.com>
Message-id: 20230130182459.3309057-21-peter.maydell@linaro.org
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


