Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BDADB67ECD2
	for <lists+qemu-devel@lfdr.de>; Fri, 27 Jan 2023 18:57:54 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pLSx1-0000ve-7t; Fri, 27 Jan 2023 12:55:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pLSwq-0000ol-0I
 for qemu-devel@nongnu.org; Fri, 27 Jan 2023 12:55:36 -0500
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pLSwl-00060X-Ih
 for qemu-devel@nongnu.org; Fri, 27 Jan 2023 12:55:35 -0500
Received: by mail-wr1-x42f.google.com with SMTP id m7so5672413wru.8
 for <qemu-devel@nongnu.org>; Fri, 27 Jan 2023 09:55:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=9+UNwQuCENrumPZzNIm0geUn23LF6uOzndfw36doa8Q=;
 b=co8E1m6fmDccFzipMezOvxLHE945gIT6OQZNJSeUnuZ+u8k7nMzUkUWZWG1jujA6FX
 KW8gY9zj462yMsGdsOq0mJH8k/0kKbbQWiMqXOo9Fj/dcgQZVlyv0jG8ZlkKgl5AhvEp
 qbM+YJveL3yRDR0hkpfOeWkSA6+vOAJpvj1jW2i3LqzjQ4GSFnpv6AmY/43/F9/o8bhf
 VCwInFdZLWeJ+4NXif4SiEgJtR8gYzIWLhruVCCiThvlDf8pYdqj+0qmXGqQZJHeByNH
 GaJaufmQ/kllCkhUPIlgWnE6tIwWmKNQxmFYCcPjXV6y2+6IHx2oBY9fL5yozGj1NIcb
 wEeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=9+UNwQuCENrumPZzNIm0geUn23LF6uOzndfw36doa8Q=;
 b=OVluR1Iv9RuBY/HP2r4mHhn8NvKxABZR6JW4m98S4BIE9alXTxlpzEMwRHE8uyW7FX
 Pb7UzFig7zoHFn3Zrc5j3RjDuzEGO+ygQXGjtZvufj9+rE9325BoDFBOCNwo/37pk3Jv
 X11Sez7J3PHRa6TERzvIlD36oJ4gc87JlF3I3XYQ5js9L+KkTa6tp1mmpPlWlXmZSs2M
 oAAwvp+5rcEh1AnjINZd4AKPochqtWAD7RhSKSkjDtcp2RF8ka13qOEX2kLTg3SUC0ZI
 +AnPWa/DhbJPtA9FgLTVXTInlwMGGvJpz+WdyOojZkd74wLjOdLe7kUNde5ijcJgZvoy
 6QBg==
X-Gm-Message-State: AO0yUKXPVWATQ9GJuK2InJsUyBEEx2iwddkDXjPzfco3ZxOQD3UZSH0T
 vjxBXajtBHvxTj40QPtqpHWxhvoeCjs9fLQd
X-Google-Smtp-Source: AK7set/t/L19arDnYzOFxMkKd6bfTl/3bCS0vmXCTmULRuDuXxxfn+mReeNd+tyjDx3ebnPxAwyTkw==
X-Received: by 2002:adf:d230:0:b0:2bf:ce9a:c19f with SMTP id
 k16-20020adfd230000000b002bfce9ac19fmr4448945wrh.34.1674842116690; 
 Fri, 27 Jan 2023 09:55:16 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 l13-20020adff48d000000b002366e3f1497sm4545089wro.6.2023.01.27.09.55.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 Jan 2023 09:55:16 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 06/23] target/arm: Make HSTR_EL2 traps take priority over
 UNDEF-at-EL1
Date: Fri, 27 Jan 2023 17:54:50 +0000
Message-Id: <20230127175507.2895013-7-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230127175507.2895013-1-peter.maydell@linaro.org>
References: <20230127175507.2895013-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42f.google.com
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

The semantics of HSTR_EL2 require that it traps cpreg accesses
to EL2 for:
 * EL1 accesses
 * EL0 accesses, if the access is not UNDEFINED when the
   trap bit is 0

(You can see this in the I_ZFGJP priority ordering, where HSTR_EL2
traps from EL1 to EL2 are priority 12, UNDEFs are priority 13, and
HSTR_EL2 traps from EL0 are priority 15.)

However, we don't get this right for EL1 accesses which UNDEF because
the register doesn't exist at all or because its ri->access bits
non-configurably forbid the access.  At EL1, check for the HSTR_EL2
trap early, before either of these UNDEF reasons.

We have to retain the HSTR_EL2 check in access_check_cp_reg(),
because at EL0 any kind of UNDEF-to-EL1 (including "no such
register", "bad ri->access" and "ri->accessfn returns 'trap to EL1'")
takes precedence over the trap to EL2.  But we only need to do that
check for EL0 now.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/helper.h    |  1 +
 target/arm/op_helper.c | 13 ++++++++++++-
 target/arm/translate.c | 37 ++++++++++++++++++++++++++++++++-----
 3 files changed, 45 insertions(+), 6 deletions(-)

diff --git a/target/arm/helper.h b/target/arm/helper.h
index 018b00ea75b..17634b3e7b6 100644
--- a/target/arm/helper.h
+++ b/target/arm/helper.h
@@ -81,6 +81,7 @@ DEF_HELPER_FLAGS_2(check_bxj_trap, TCG_CALL_NO_WG, void, env, i32)
 
 DEF_HELPER_4(access_check_cp_reg, cptr, env, i32, i32, i32)
 DEF_HELPER_FLAGS_2(lookup_cp_reg, TCG_CALL_NO_RWG_SE, cptr, env, i32)
+DEF_HELPER_3(hstr_trap_check, void, env, i32, i32)
 DEF_HELPER_3(set_cp_reg, void, env, cptr, i32)
 DEF_HELPER_2(get_cp_reg, i32, env, cptr)
 DEF_HELPER_3(set_cp_reg64, void, env, cptr, i64)
diff --git a/target/arm/op_helper.c b/target/arm/op_helper.c
index 660dae696dd..8ac176e0742 100644
--- a/target/arm/op_helper.c
+++ b/target/arm/op_helper.c
@@ -624,6 +624,13 @@ uint32_t HELPER(mrs_banked)(CPUARMState *env, uint32_t tgtmode, uint32_t regno)
     }
 }
 
+void HELPER(hstr_trap_check)(CPUARMState *env, uint32_t mask, uint32_t syndrome)
+{
+    if (env->cp15.hstr_el2 & mask) {
+        raise_exception(env, EXCP_UDEF, syndrome, 2);
+    }
+}
+
 const void *HELPER(access_check_cp_reg)(CPUARMState *env, uint32_t key,
                                         uint32_t syndrome, uint32_t isread)
 {
@@ -658,7 +665,11 @@ const void *HELPER(access_check_cp_reg)(CPUARMState *env, uint32_t key,
         goto fail;
     }
 
-    if (!is_a64(env) && arm_current_el(env) < 2 && ri->cp == 15 &&
+    /*
+     * HSTR_EL2 traps from EL1 are checked earlier, via hstr_trap_check;
+     * we only need to check here for traps from EL0.
+     */
+    if (!is_a64(env) && arm_current_el(env) == 0 && ri->cp == 15 &&
         (arm_hcr_el2_eff(env) & (HCR_E2H | HCR_TGE)) != (HCR_E2H | HCR_TGE)) {
         uint32_t mask = 1 << ri->crn;
 
diff --git a/target/arm/translate.c b/target/arm/translate.c
index 9252a464a12..ec1f2288ff8 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -4719,6 +4719,7 @@ static void do_coproc_insn(DisasContext *s, int cpnum, int is64,
     TCGv_ptr tcg_ri = NULL;
     bool need_exit_tb;
     uint32_t syndrome;
+    bool emitted_update_pc = false;
 
     /*
      * Note that since we are an implementation which takes an
@@ -4760,6 +4761,28 @@ static void do_coproc_insn(DisasContext *s, int cpnum, int is64,
         break;
     }
 
+    if (s->hstr_active && cpnum == 15 && s->current_el == 1) {
+        /*
+         * At EL1, check for a HSTR_EL2 trap, which must take precedence
+         * over the UNDEF for "no such register" or the UNDEF for "access
+         * permissions forbid this EL1 access". HSTR_EL2 traps from EL0
+         * only happen if the cpreg doesn't UNDEF at EL0, so we do those in
+         * access_check_cp_reg(), after the checks for whether the access
+         * configurably trapped to EL1.
+         */
+        uint32_t maskbit = is64 ? crm : crn;
+
+        if (maskbit != 4 && maskbit != 14) {
+            /* T4 and T14 are RES0 so never cause traps */
+            gen_set_condexec(s);
+            gen_update_pc(s, 0);
+            emitted_update_pc = true;
+            gen_helper_hstr_trap_check(cpu_env,
+                                       tcg_constant_i32(1 << maskbit),
+                                       tcg_constant_i32(syndrome));
+        }
+    }
+
     if (!ri) {
         /*
          * Unknown register; this might be a guest error or a QEMU
@@ -4788,7 +4811,7 @@ static void do_coproc_insn(DisasContext *s, int cpnum, int is64,
         return;
     }
 
-    if (s->hstr_active || ri->accessfn ||
+    if ((s->hstr_active && s->current_el == 0) || ri->accessfn ||
         (arm_dc_feature(s, ARM_FEATURE_XSCALE) && cpnum < 14)) {
         /*
          * Emit code to perform further access permissions checks at
@@ -4796,8 +4819,10 @@ static void do_coproc_insn(DisasContext *s, int cpnum, int is64,
          * Note that on XScale all cp0..c13 registers do an access check
          * call in order to handle c15_cpar.
          */
-        gen_set_condexec(s);
-        gen_update_pc(s, 0);
+        if (!emitted_update_pc) {
+            gen_set_condexec(s);
+            gen_update_pc(s, 0);
+        }
         tcg_ri = tcg_temp_new_ptr();
         gen_helper_access_check_cp_reg(tcg_ri, cpu_env,
                                        tcg_constant_i32(key),
@@ -4808,8 +4833,10 @@ static void do_coproc_insn(DisasContext *s, int cpnum, int is64,
          * The readfn or writefn might raise an exception;
          * synchronize the CPU state in case it does.
          */
-        gen_set_condexec(s);
-        gen_update_pc(s, 0);
+        if (!emitted_update_pc) {
+            gen_set_condexec(s);
+            gen_update_pc(s, 0);
+        }
     }
 
     /* Handle special cases first */
-- 
2.34.1


