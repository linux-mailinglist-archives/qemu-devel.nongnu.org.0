Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B4D005092DE
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Apr 2022 00:33:13 +0200 (CEST)
Received: from localhost ([::1]:41096 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhIsq-0006we-IA
	for lists+qemu-devel@lfdr.de; Wed, 20 Apr 2022 18:33:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44116)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1nhIe5-0000gT-B1; Wed, 20 Apr 2022 18:17:57 -0400
Received: from mail-ot1-x330.google.com ([2607:f8b0:4864:20::330]:36656)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1nhIe3-0006BL-Fh; Wed, 20 Apr 2022 18:17:57 -0400
Received: by mail-ot1-x330.google.com with SMTP id
 c11-20020a9d684b000000b00603307cef05so2062160oto.3; 
 Wed, 20 Apr 2022 15:17:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=gRKmgg7ICAKqGf6fLEof4G7plcsgVcgfOs+t4TT0Sz4=;
 b=bcc7YojglVDFcMa1hZtGB3n+I14kvgGIZnG566tflYJj+z56G42hiGivCC7qwNVEB4
 LBIxgoxM1kog4SLdtleR0ZFjJrUhYklIU/ChXLusVTXVdZrxczGjiZM8aSEVbTzOtWGZ
 FfsfsQHuXE+rV0ZAImZfYniETSlGAb5CoJJHh1DlrQV+NhbcZtQKeM8yTZc3rk9FaBq+
 CW/1r9xmRHl5SLOHMLIokHN4XUziZ298oAajRBFa3V/hq7htTUr1/T9vAL6nYumvFtJD
 m2G1605ppH63Iui6kU9RxqlzU3FgATIB7c/Gzn2cQ6NhbHNT9nJzgUWPL9xd8BEx3Kvf
 xtOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=gRKmgg7ICAKqGf6fLEof4G7plcsgVcgfOs+t4TT0Sz4=;
 b=yDAOQ1Fk/Gl4um1ARP4ZmBy2Kn1nc8V5fUnoqCAS6rWtjWfa8XUQBUPdSpZa3HhOg2
 ntNljUlhpDJdKyE9emB4EHRPPFB0jpcamVtbrUAKowAaaKG7rrQe+D2h4+yTB7pSboOZ
 6TAPcY+DnQHoE6wZNfjzXsk8WNLXPaGGHFf2zr0vTkf76mH42+nFLh+npacliDs/D6jd
 O5wwLoGZo8c+mJrRtiZCDe6q/Nx162mgJWTv6V9EtjPwtKjzy6n25yqbsc7yCMp9sSpa
 dX1FhjVEyPdmUzOzuB3yMv4Z7rf11qDjEyt20PZLdEjArz3jKzznD2xU+JT8BCfjOuLn
 8vpA==
X-Gm-Message-State: AOAM532ztGCVRpjv9eIkyIYH7lwh9aF3rFgoyfuJNUJt0DsQ5zqkFOMo
 yAVb4q4d+sFihmjcZplQCTCjGiiNsHU=
X-Google-Smtp-Source: ABdhPJx4NH+/gV5wgBBZTst7+n+kQJ56HIleS/s6YRDA29u0uTcu9aKWutqtdnwX029Rdac7w6e2kA==
X-Received: by 2002:a9d:7f07:0:b0:605:6d56:99bf with SMTP id
 j7-20020a9d7f07000000b006056d5699bfmr1132820otq.42.1650493074041; 
 Wed, 20 Apr 2022 15:17:54 -0700 (PDT)
Received: from rekt.ibmuc.com ([2804:431:c7c7:486c:c4fd:c4aa:a799:60c2])
 by smtp.gmail.com with ESMTPSA id
 14-20020aca110e000000b00322847e6f53sm3876082oir.46.2022.04.20.15.17.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Apr 2022 15:17:53 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PULL 17/23] target/ppc: implement xscvqp[su]qz
Date: Wed, 20 Apr 2022 19:13:23 -0300
Message-Id: <20220420221329.169755-18-danielhb413@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220420221329.169755-1-danielhb413@gmail.com>
References: <20220420221329.169755-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::330;
 envelope-from=danielhb413@gmail.com; helo=mail-ot1-x330.google.com
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
xscvqpsqz: VSX Scalar Convert with round to zero Quad-Precision to
           Signed Quadword
xscvqpuqz: VSX Scalar Convert with round to zero Quad-Precision to
           Unsigned Quadword

Signed-off-by: Matheus Ferst <matheus.ferst@eldorado.org.br>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20220330175932.6995-9-matheus.ferst@eldorado.org.br>
Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 target/ppc/fpu_helper.c             | 21 +++++++++++++++++++++
 target/ppc/helper.h                 |  2 ++
 target/ppc/insn32.decode            |  2 ++
 target/ppc/translate/vsx-impl.c.inc |  2 ++
 4 files changed, 27 insertions(+)

diff --git a/target/ppc/fpu_helper.c b/target/ppc/fpu_helper.c
index 97892afa95..99281cc37a 100644
--- a/target/ppc/fpu_helper.c
+++ b/target/ppc/fpu_helper.c
@@ -2925,6 +2925,27 @@ VSX_CVT_FP_TO_INT(xvcvspsxws, 4, float32, int32, VsrW(i), VsrW(i), 0x80000000U)
 VSX_CVT_FP_TO_INT(xvcvspuxds, 2, float32, uint64, VsrW(2 * i), VsrD(i), 0ULL)
 VSX_CVT_FP_TO_INT(xvcvspuxws, 4, float32, uint32, VsrW(i), VsrW(i), 0U)
 
+#define VSX_CVT_FP_TO_INT128(op, tp, rnan)                                     \
+void helper_##op(CPUPPCState *env, ppc_vsr_t *xt, ppc_vsr_t *xb)               \
+{                                                                              \
+    ppc_vsr_t t;                                                               \
+    int flags;                                                                 \
+                                                                               \
+    helper_reset_fpstatus(env);                                                \
+    t.s128 = float128_to_##tp##_round_to_zero(xb->f128, &env->fp_status);      \
+    flags = get_float_exception_flags(&env->fp_status);                        \
+    if (unlikely(flags & float_flag_invalid)) {                                \
+        t.VsrD(0) = float_invalid_cvt(env, flags, t.VsrD(0), rnan, 0, GETPC());\
+        t.VsrD(1) = -(t.VsrD(0) & 1);                                          \
+    }                                                                          \
+                                                                               \
+    *xt = t;                                                                   \
+    do_float_check_status(env, GETPC());                                       \
+}
+
+VSX_CVT_FP_TO_INT128(XSCVQPUQZ, uint128, 0)
+VSX_CVT_FP_TO_INT128(XSCVQPSQZ, int128, 0x8000000000000000ULL);
+
 /*
  * Likewise, except that the result is duplicated into both subwords.
  * Power ISA v3.1 has Programming Notes for these insns:
diff --git a/target/ppc/helper.h b/target/ppc/helper.h
index 7df0c01819..aa6773c4a5 100644
--- a/target/ppc/helper.h
+++ b/target/ppc/helper.h
@@ -388,6 +388,8 @@ DEF_HELPER_4(xscvqpsdz, void, env, i32, vsr, vsr)
 DEF_HELPER_4(xscvqpswz, void, env, i32, vsr, vsr)
 DEF_HELPER_4(xscvqpudz, void, env, i32, vsr, vsr)
 DEF_HELPER_4(xscvqpuwz, void, env, i32, vsr, vsr)
+DEF_HELPER_3(XSCVQPUQZ, void, env, vsr, vsr)
+DEF_HELPER_3(XSCVQPSQZ, void, env, vsr, vsr)
 DEF_HELPER_3(XSCVUQQP, void, env, vsr, vsr)
 DEF_HELPER_3(XSCVSQQP, void, env, vsr, vsr)
 DEF_HELPER_3(xscvhpdp, void, env, vsr, vsr)
diff --git a/target/ppc/insn32.decode b/target/ppc/insn32.decode
index 6fb568c1fe..39372fe673 100644
--- a/target/ppc/insn32.decode
+++ b/target/ppc/insn32.decode
@@ -695,6 +695,8 @@ XSCMPGTQP       111111 ..... ..... ..... 0011100100 -   @X
 ## VSX Binary Floating-Point Convert Instructions
 
 XSCVQPDP        111111 ..... 10100 ..... 1101000100 .   @X_tb_rc
+XSCVQPUQZ       111111 ..... 00000 ..... 1101000100 -   @X_tb
+XSCVQPSQZ       111111 ..... 01000 ..... 1101000100 -   @X_tb
 XSCVUQQP        111111 ..... 00011 ..... 1101000100 -   @X_tb
 XSCVSQQP        111111 ..... 01011 ..... 1101000100 -   @X_tb
 XVCVBF16SPN     111100 ..... 10000 ..... 111011011 ..   @XX2
diff --git a/target/ppc/translate/vsx-impl.c.inc b/target/ppc/translate/vsx-impl.c.inc
index bda681e65c..3692740736 100644
--- a/target/ppc/translate/vsx-impl.c.inc
+++ b/target/ppc/translate/vsx-impl.c.inc
@@ -857,6 +857,8 @@ static bool do_helper_env_X_tb(DisasContext *ctx, arg_X_tb *a,
 
 TRANS(XSCVUQQP, do_helper_env_X_tb, gen_helper_XSCVUQQP)
 TRANS(XSCVSQQP, do_helper_env_X_tb, gen_helper_XSCVSQQP)
+TRANS(XSCVQPUQZ, do_helper_env_X_tb, gen_helper_XSCVQPUQZ)
+TRANS(XSCVQPSQZ, do_helper_env_X_tb, gen_helper_XSCVQPSQZ)
 
 #define GEN_VSX_HELPER_2(name, op1, op2, inval, type)                         \
 static void gen_##name(DisasContext *ctx)                                     \
-- 
2.35.1


