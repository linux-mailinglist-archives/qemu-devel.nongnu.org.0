Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 26DC755BEB1
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Jun 2022 08:17:41 +0200 (CEST)
Received: from localhost ([::1]:41746 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o64Xc-0003G8-7T
	for lists+qemu-devel@lfdr.de; Tue, 28 Jun 2022 02:17:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43438)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o63Fk-0003IS-7e
 for qemu-devel@nongnu.org; Tue, 28 Jun 2022 00:55:08 -0400
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433]:41844)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o63Fh-0008MN-7B
 for qemu-devel@nongnu.org; Tue, 28 Jun 2022 00:55:07 -0400
Received: by mail-pf1-x433.google.com with SMTP id i64so10930283pfc.8
 for <qemu-devel@nongnu.org>; Mon, 27 Jun 2022 21:55:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Lkal5KDK4537KjIiM5DwOIkXPoQZ/flNccQ9lkg/eXQ=;
 b=N9DoaUCiXErs7MF3E7SpMzgtl2eyhVKm5dFsrkV+kACpDJ+lXFXFWs1dX0wlF3/kKu
 mYY+bJDGyVeGhpy5APu/J7iHPPyO2ply8VWqu7PI+al/kTEbnrJMLlK7KOeyAJiZY1aG
 c2Izsxj+OxnLt56m+EiJllTAzmfWBoP4j3YhyodELyW227C7g1p0EqI07VPMExKxBeOl
 VMEMSy0oTyA6O5qRAdcV//+eSPyOv16h4xVaV5iqUD9VAGUW4tIGdOTDIwFEFbdXqjgs
 mXu2bgBeuZkAy5009qPw/emWTU3AfdpuBGbWrnSzBFC0xelU0zT31xdyA6Tscd0Hsi7y
 e8wQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Lkal5KDK4537KjIiM5DwOIkXPoQZ/flNccQ9lkg/eXQ=;
 b=fGwGJ2W4qOOV5YPwY5QBfAZkgPO9DgbsarQGWryWy/3q5jcxk71Dsn/kXD3TTujRk1
 uU4IXV5v9j3D2PQqgezgzJly30Sxq5wXSln06EihHM1zyXMJ/4dycCZqeeZ6f0Ymxwm6
 Z7K2zhZqKxr4y5SMIkBzY8xbelYkGPkupwKVFdCojGSRmfP0iRZ5APSxT5Iustt/kqvG
 M9Tz0rbYtKqVYtf8RX2slfZkRovKY/r81Usa77WazmYzF7bxBIoYTgkBuwHKP6CDvsVu
 PAWr+i75J+uJFps2gNblsNWRjFzt/ir7rjkmL+89tXqrLmZv8DUmFxPZxSvLvwyOOfju
 TvoA==
X-Gm-Message-State: AJIora/rm8eRg4QkP0be2haIN1mEF6APv+utdARb/rIrFKpkvufQv9cV
 EPI52N2Y7Ot/utuTKqxJmAL5IfNakMPWBA==
X-Google-Smtp-Source: AGRyM1v7B4mbbjI7zQ6wjEzikDYT0hjXhyFxKVO5UnpDplecTp/7z6oQ1BJJ7/9GHsS7ysJlfeGaWA==
X-Received: by 2002:a63:1613:0:b0:411:51f0:eaf8 with SMTP id
 w19-20020a631613000000b0041151f0eaf8mr3186813pgl.62.1656392103637; 
 Mon, 27 Jun 2022 21:55:03 -0700 (PDT)
Received: from stoup.. ([122.255.60.245]) by smtp.gmail.com with ESMTPSA id
 w8-20020a1709026f0800b00168c523032fsm8073735plk.269.2022.06.27.21.55.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Jun 2022 21:55:03 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: Alistair Francis <alistair.francis@wdc.com>
Subject: [PULL 23/60] semihosting: Split out common_semi_has_synccache
Date: Tue, 28 Jun 2022 10:23:26 +0530
Message-Id: <20220628045403.508716-24-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220628045403.508716-1-richard.henderson@linaro.org>
References: <20220628045403.508716-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::433;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x433.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We already have some larger ifdef blocks for ARM and RISCV;
split out a boolean test for SYS_SYNCCACHE.

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 semihosting/arm-compat-semi.c | 20 +++++++++++++-------
 1 file changed, 13 insertions(+), 7 deletions(-)

diff --git a/semihosting/arm-compat-semi.c b/semihosting/arm-compat-semi.c
index 7550dce622..50f40a2a1a 100644
--- a/semihosting/arm-compat-semi.c
+++ b/semihosting/arm-compat-semi.c
@@ -224,6 +224,12 @@ static inline target_ulong common_semi_stack_bottom(CPUState *cs)
     CPUARMState *env = &cpu->env;
     return is_a64(env) ? env->xregs[31] : env->regs[13];
 }
+
+static inline bool common_semi_has_synccache(CPUArchState *env)
+{
+    /* Ok for A64, invalid for A32/T32. */
+    return is_a64(env);
+}
 #endif /* TARGET_ARM */
 
 #ifdef TARGET_RISCV
@@ -260,6 +266,11 @@ static inline target_ulong common_semi_stack_bottom(CPUState *cs)
     CPURISCVState *env = &cpu->env;
     return env->gpr[xSP];
 }
+
+static inline bool common_semi_has_synccache(CPUArchState *env)
+{
+    return true;
+}
 #endif
 
 /*
@@ -1102,16 +1113,11 @@ void do_common_semihosting(CPUState *cs)
          * virtual address range. This is a nop for us since we don't
          * implement caches. This is only present on A64.
          */
-#ifdef TARGET_ARM
-        if (is_a64(cs->env_ptr)) {
+        if (common_semi_has_synccache(env)) {
             common_semi_set_ret(cs, 0);
             break;
         }
-#endif
-#ifdef TARGET_RISCV
-        common_semi_set_ret(cs, 0);
-#endif
-        /* fall through -- invalid for A32/T32 */
+        /* fall through */
     default:
         fprintf(stderr, "qemu: Unsupported SemiHosting SWI 0x%02x\n", nr);
         cpu_dump_state(cs, stderr, 0);
-- 
2.34.1


