Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FAFF5092CF
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Apr 2022 00:28:19 +0200 (CEST)
Received: from localhost ([::1]:54768 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhIo6-00054t-4h
	for lists+qemu-devel@lfdr.de; Wed, 20 Apr 2022 18:28:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44098)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1nhIe3-0000Ze-0E; Wed, 20 Apr 2022 18:17:55 -0400
Received: from mail-oi1-x22c.google.com ([2607:f8b0:4864:20::22c]:39671)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1nhIe1-0006At-7J; Wed, 20 Apr 2022 18:17:54 -0400
Received: by mail-oi1-x22c.google.com with SMTP id z2so3668223oic.6;
 Wed, 20 Apr 2022 15:17:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=h3QS2VIun3qH1dum8qVIWXxBYz2LeEPOE4Ps5Mxvie0=;
 b=F7cW8y7VvC9IbqHa40VLPI3v5E6cFngfTepkHkudK0o16nZY1iZ87SYWs755RMcUHB
 C/de/4Gs4A7FNOV0qRUsmkNOSWqL2E7DURqgYuESpJXAJtFwUWEQ6TxJAYrJILsKzWiH
 5eTv2FgTns/C8tpE/uWSNLS3lML6vhhh154Nq9aS2NlylHO2XXqHClVCeGKO4j/4Dsmn
 8ITTTlfXLDhNJWIIGmXyLKE5IkZ3s6E9jsIJun7pGVmPwB1Nos3akwOWNjV8Bj3zep+t
 qzb8h27hs/eemozjGMjZb+ljalqdufcpZWb3BLF5TqgSr/9xoizv9Aa7PX79uGwkPVmZ
 8M6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=h3QS2VIun3qH1dum8qVIWXxBYz2LeEPOE4Ps5Mxvie0=;
 b=pd3Vk7LKpiUsf2W6ZjJz4JubR4x4O6P0b2C8kbgszD9S6fDlooCl30ELuPbCkLKBCP
 eJZLytiBBZfb/gatIXVHkwi1Ex3ngNkFtFCOs/NDTDyce9AQBblJXKD4buAu9ayN5FoK
 dfeXk3sUElPaebJYRQOz8DjJ7xy1eWfBy9v2uHSHjRsdMDACCjplU+Ky0LLwesZatGWM
 tMnesuy55aqacjPr7/kj/cxx4aye9uEzaEEYnlkb5JZDv+IBsR24FLjz5dKDufHDkiZA
 ZNWrAg2dcpuRj0I+rOWBD7dp6MDJSbN0DRiJ0c87ltVCqHp6TvLa/5NSnUb1YhWUAlu5
 BdMA==
X-Gm-Message-State: AOAM532ziMSpV5x+KYVsGyiaMXLYFknWtiYr6Ago/XSlP2+7W/jiVGoa
 lUS2G6GVTiGuBPBsbp52w62me6ZadXM=
X-Google-Smtp-Source: ABdhPJxNERQTLcbRlcP5lkqcWcpLfj2bFORsafLQikkHcDj4o+poL8jKk/Agu0VmJ7+/XMwKepj7/A==
X-Received: by 2002:a05:6808:3010:b0:2f7:3e71:88b2 with SMTP id
 ay16-20020a056808301000b002f73e7188b2mr2798221oib.102.1650493071680; 
 Wed, 20 Apr 2022 15:17:51 -0700 (PDT)
Received: from rekt.ibmuc.com ([2804:431:c7c7:486c:c4fd:c4aa:a799:60c2])
 by smtp.gmail.com with ESMTPSA id
 14-20020aca110e000000b00322847e6f53sm3876082oir.46.2022.04.20.15.17.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Apr 2022 15:17:51 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PULL 16/23] target/ppc: implement xscv[su]qqp
Date: Wed, 20 Apr 2022 19:13:22 -0300
Message-Id: <20220420221329.169755-17-danielhb413@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220420221329.169755-1-danielhb413@gmail.com>
References: <20220420221329.169755-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::22c;
 envelope-from=danielhb413@gmail.com; helo=mail-oi1-x22c.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
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
Cc: peter.maydell@linaro.org, richard.henderson@linaro.org,
 danielhb413@gmail.com, qemu-ppc@nongnu.org,
 Matheus Ferst <matheus.ferst@eldorado.org.br>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Matheus Ferst <matheus.ferst@eldorado.org.br>

Implement the following PowerISA v3.1 instructions:
xscvsqqp: VSX Scalar Convert with round Signed Quadword to
          Quad-Precision
xscvuqqp: VSX Scalar Convert with round Unsigned Quadword to
          Quad-Precision format

Signed-off-by: Matheus Ferst <matheus.ferst@eldorado.org.br>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20220330175932.6995-8-matheus.ferst@eldorado.org.br>
Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 target/ppc/fpu_helper.c             | 12 ++++++++++++
 target/ppc/helper.h                 |  2 ++
 target/ppc/insn32.decode            |  5 +++++
 target/ppc/translate/vsx-impl.c.inc | 20 ++++++++++++++++++++
 4 files changed, 39 insertions(+)

diff --git a/target/ppc/fpu_helper.c b/target/ppc/fpu_helper.c
index 7e8be99cc0..97892afa95 100644
--- a/target/ppc/fpu_helper.c
+++ b/target/ppc/fpu_helper.c
@@ -3058,6 +3058,18 @@ void helper_##op(CPUPPCState *env, ppc_vsr_t *xt, ppc_vsr_t *xb)        \
 VSX_CVT_INT_TO_FP2(xvcvsxdsp, int64, float32)
 VSX_CVT_INT_TO_FP2(xvcvuxdsp, uint64, float32)
 
+#define VSX_CVT_INT128_TO_FP(op, tp)                            \
+void helper_##op(CPUPPCState *env, ppc_vsr_t *xt, ppc_vsr_t *xb)\
+{                                                               \
+    helper_reset_fpstatus(env);                                 \
+    xt->f128 = tp##_to_float128(xb->s128, &env->fp_status);     \
+    helper_compute_fprf_float128(env, xt->f128);                \
+    do_float_check_status(env, GETPC());                        \
+}
+
+VSX_CVT_INT128_TO_FP(XSCVUQQP, uint128);
+VSX_CVT_INT128_TO_FP(XSCVSQQP, int128);
+
 /*
  * VSX_CVT_INT_TO_FP_VECTOR - VSX integer to floating point conversion
  *   op    - instruction mnemonic
diff --git a/target/ppc/helper.h b/target/ppc/helper.h
index 57da11c77e..7df0c01819 100644
--- a/target/ppc/helper.h
+++ b/target/ppc/helper.h
@@ -388,6 +388,8 @@ DEF_HELPER_4(xscvqpsdz, void, env, i32, vsr, vsr)
 DEF_HELPER_4(xscvqpswz, void, env, i32, vsr, vsr)
 DEF_HELPER_4(xscvqpudz, void, env, i32, vsr, vsr)
 DEF_HELPER_4(xscvqpuwz, void, env, i32, vsr, vsr)
+DEF_HELPER_3(XSCVUQQP, void, env, vsr, vsr)
+DEF_HELPER_3(XSCVSQQP, void, env, vsr, vsr)
 DEF_HELPER_3(xscvhpdp, void, env, vsr, vsr)
 DEF_HELPER_4(xscvsdqp, void, env, i32, vsr, vsr)
 DEF_HELPER_3(xscvspdp, void, env, vsr, vsr)
diff --git a/target/ppc/insn32.decode b/target/ppc/insn32.decode
index ac2d3da9a7..6fb568c1fe 100644
--- a/target/ppc/insn32.decode
+++ b/target/ppc/insn32.decode
@@ -91,6 +91,9 @@
 
 @X_tp_a_bp_rc   ...... ....0 ra:5 ....0 .......... rc:1         &X_rc rt=%x_frtp rb=%x_frbp
 
+&X_tb           rt rb
+@X_tb           ...... rt:5 ..... rb:5 .......... .             &X_tb
+
 &X_tb_rc        rt rb rc:bool
 @X_tb_rc        ...... rt:5 ..... rb:5 .......... rc:1          &X_tb_rc
 
@@ -692,6 +695,8 @@ XSCMPGTQP       111111 ..... ..... ..... 0011100100 -   @X
 ## VSX Binary Floating-Point Convert Instructions
 
 XSCVQPDP        111111 ..... 10100 ..... 1101000100 .   @X_tb_rc
+XSCVUQQP        111111 ..... 00011 ..... 1101000100 -   @X_tb
+XSCVSQQP        111111 ..... 01011 ..... 1101000100 -   @X_tb
 XVCVBF16SPN     111100 ..... 10000 ..... 111011011 ..   @XX2
 XVCVSPBF16      111100 ..... 10001 ..... 111011011 ..   @XX2
 
diff --git a/target/ppc/translate/vsx-impl.c.inc b/target/ppc/translate/vsx-impl.c.inc
index 7181a672d8..bda681e65c 100644
--- a/target/ppc/translate/vsx-impl.c.inc
+++ b/target/ppc/translate/vsx-impl.c.inc
@@ -838,6 +838,26 @@ static bool trans_XSCVQPDP(DisasContext *ctx, arg_X_tb_rc *a)
     return true;
 }
 
+static bool do_helper_env_X_tb(DisasContext *ctx, arg_X_tb *a,
+                               void (*gen_helper)(TCGv_ptr, TCGv_ptr, TCGv_ptr))
+{
+    TCGv_ptr xt, xb;
+
+    REQUIRE_INSNS_FLAGS2(ctx, ISA310);
+    REQUIRE_VSX(ctx);
+
+    xt = gen_avr_ptr(a->rt);
+    xb = gen_avr_ptr(a->rb);
+    gen_helper(cpu_env, xt, xb);
+    tcg_temp_free_ptr(xt);
+    tcg_temp_free_ptr(xb);
+
+    return true;
+}
+
+TRANS(XSCVUQQP, do_helper_env_X_tb, gen_helper_XSCVUQQP)
+TRANS(XSCVSQQP, do_helper_env_X_tb, gen_helper_XSCVSQQP)
+
 #define GEN_VSX_HELPER_2(name, op1, op2, inval, type)                         \
 static void gen_##name(DisasContext *ctx)                                     \
 {                                                                             \
-- 
2.35.1


