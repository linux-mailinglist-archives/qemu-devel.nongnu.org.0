Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 01547513846
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Apr 2022 17:25:36 +0200 (CEST)
Received: from localhost ([::1]:33336 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nk61P-00043O-3F
	for lists+qemu-devel@lfdr.de; Thu, 28 Apr 2022 11:25:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45316)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nk5Ju-0005ZI-T7
 for qemu-devel@nongnu.org; Thu, 28 Apr 2022 10:40:40 -0400
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d]:35333)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nk5Jn-0006NL-3E
 for qemu-devel@nongnu.org; Thu, 28 Apr 2022 10:40:33 -0400
Received: by mail-wm1-x32d.google.com with SMTP id
 c190-20020a1c35c7000000b0038e37907b5bso5452177wma.0
 for <qemu-devel@nongnu.org>; Thu, 28 Apr 2022 07:40:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=dJB5qf8j3TYN3zXAT+4GWma+lC96hPhS4onKOFNO4VE=;
 b=BaI6jn2CaRdrsyUAmWFCdOVw2086PtjVUgWh9qzxkDB9m29Zc8ssC02YyljK/N2Ue7
 xA60R65okJD4xPBGAVzdxRbZpoPjHttGaoOr2JL7lYBITRt0nhjhertstj8NEZJnQbca
 zD+GGU65NAsJGGB6bCZsNURvvfZHqmddHT4D1TtN4PyV2cANeaW1GedPVKjSF8S5rtdS
 Ah3sKUyNLH2LowrjyP6tYEQQDvJ+3C4ypUqzLflbz5+J2AlDy+L+bHRx5LrmWQIYWotM
 k+5K7FFDr0TzV0U/bX1GOci4Or7KVA3rwPHUCsbiEijwK6Qx+TAdlsrbi6lm3UdBvmjg
 YPuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=dJB5qf8j3TYN3zXAT+4GWma+lC96hPhS4onKOFNO4VE=;
 b=s3bq13Emr0OTR7ExsaQrimZO+e697/AK2uq8l2pSmIQQOtUuRZmg8NCk+bNNhnV+/p
 bnWVzARH895hoGkcese5LIjvElzZEuvNfiPKqmeZoh+DFcV0GyUkhk9i9rSYm0lmNdY8
 Tc6ccnboLRn2oG6Uo4YNWcRQeA/ajtkkJvUuvp8K/Gw80w8u56uym39rPh2/tH0lHRL8
 7yNOsA0nJv+qwJ4ihbUmf3uuj1z2KLiFbjMgQbZ69RXKaWnA9vQFPVi3A9+DTIqWvB4Q
 N1Lu3ZfJzptlCkds5/qCDerT3DCy+dwi3cTik3eftBywil212fkqmjb6Js8I3uQCQCa3
 tAhg==
X-Gm-Message-State: AOAM532BAP/8qR+icPl/09TicSg4BDnJuPev6vACr+XRl5LY1qZWMNOw
 BTXtWxbGHIuTOobJmx9WEEju8CIACDFFxw==
X-Google-Smtp-Source: ABdhPJwNvNEclGXPBSiNuQpI+YlBmY56f8hnTaCrgndVoC5U501GkhYNf+eYlNofQkXgMrCEW86SAA==
X-Received: by 2002:a05:600c:512a:b0:393:f143:efd5 with SMTP id
 o42-20020a05600c512a00b00393f143efd5mr14208676wms.109.1651156826963; 
 Thu, 28 Apr 2022 07:40:26 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 bh26-20020a05600c3d1a00b003928db85759sm130221wmb.15.2022.04.28.07.40.26
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Apr 2022 07:40:26 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 26/54] target/arm: Use tcg_constant for do_coproc_insn
Date: Thu, 28 Apr 2022 15:39:30 +0100
Message-Id: <20220428143958.2451229-27-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220428143958.2451229-1-peter.maydell@linaro.org>
References: <20220428143958.2451229-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32d.google.com
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

From: Richard Henderson <richard.henderson@linaro.org>

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Message-id: 20220426163043.100432-27-richard.henderson@linaro.org
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/translate.c | 43 +++++++++++++-----------------------------
 1 file changed, 13 insertions(+), 30 deletions(-)

diff --git a/target/arm/translate.c b/target/arm/translate.c
index 9539d2e8ca2..e4f3db26f66 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -4689,8 +4689,6 @@ static void do_coproc_insn(DisasContext *s, int cpnum, int is64,
              * Note that on XScale all cp0..c13 registers do an access check
              * call in order to handle c15_cpar.
              */
-            TCGv_ptr tmpptr;
-            TCGv_i32 tcg_syn, tcg_isread;
             uint32_t syndrome;
 
             /* Note that since we are an implementation which takes an
@@ -4733,14 +4731,10 @@ static void do_coproc_insn(DisasContext *s, int cpnum, int is64,
 
             gen_set_condexec(s);
             gen_set_pc_im(s, s->pc_curr);
-            tmpptr = tcg_const_ptr(ri);
-            tcg_syn = tcg_const_i32(syndrome);
-            tcg_isread = tcg_const_i32(isread);
-            gen_helper_access_check_cp_reg(cpu_env, tmpptr, tcg_syn,
-                                           tcg_isread);
-            tcg_temp_free_ptr(tmpptr);
-            tcg_temp_free_i32(tcg_syn);
-            tcg_temp_free_i32(tcg_isread);
+            gen_helper_access_check_cp_reg(cpu_env,
+                                           tcg_constant_ptr(ri),
+                                           tcg_constant_i32(syndrome),
+                                           tcg_constant_i32(isread));
         } else if (ri->type & ARM_CP_RAISES_EXC) {
             /*
              * The readfn or writefn might raise an exception;
@@ -4776,13 +4770,11 @@ static void do_coproc_insn(DisasContext *s, int cpnum, int is64,
                 TCGv_i64 tmp64;
                 TCGv_i32 tmp;
                 if (ri->type & ARM_CP_CONST) {
-                    tmp64 = tcg_const_i64(ri->resetvalue);
+                    tmp64 = tcg_constant_i64(ri->resetvalue);
                 } else if (ri->readfn) {
-                    TCGv_ptr tmpptr;
                     tmp64 = tcg_temp_new_i64();
-                    tmpptr = tcg_const_ptr(ri);
-                    gen_helper_get_cp_reg64(tmp64, cpu_env, tmpptr);
-                    tcg_temp_free_ptr(tmpptr);
+                    gen_helper_get_cp_reg64(tmp64, cpu_env,
+                                            tcg_constant_ptr(ri));
                 } else {
                     tmp64 = tcg_temp_new_i64();
                     tcg_gen_ld_i64(tmp64, cpu_env, ri->fieldoffset);
@@ -4797,13 +4789,10 @@ static void do_coproc_insn(DisasContext *s, int cpnum, int is64,
             } else {
                 TCGv_i32 tmp;
                 if (ri->type & ARM_CP_CONST) {
-                    tmp = tcg_const_i32(ri->resetvalue);
+                    tmp = tcg_constant_i32(ri->resetvalue);
                 } else if (ri->readfn) {
-                    TCGv_ptr tmpptr;
                     tmp = tcg_temp_new_i32();
-                    tmpptr = tcg_const_ptr(ri);
-                    gen_helper_get_cp_reg(tmp, cpu_env, tmpptr);
-                    tcg_temp_free_ptr(tmpptr);
+                    gen_helper_get_cp_reg(tmp, cpu_env, tcg_constant_ptr(ri));
                 } else {
                     tmp = load_cpu_offset(ri->fieldoffset);
                 }
@@ -4833,24 +4822,18 @@ static void do_coproc_insn(DisasContext *s, int cpnum, int is64,
                 tcg_temp_free_i32(tmplo);
                 tcg_temp_free_i32(tmphi);
                 if (ri->writefn) {
-                    TCGv_ptr tmpptr = tcg_const_ptr(ri);
-                    gen_helper_set_cp_reg64(cpu_env, tmpptr, tmp64);
-                    tcg_temp_free_ptr(tmpptr);
+                    gen_helper_set_cp_reg64(cpu_env, tcg_constant_ptr(ri),
+                                            tmp64);
                 } else {
                     tcg_gen_st_i64(tmp64, cpu_env, ri->fieldoffset);
                 }
                 tcg_temp_free_i64(tmp64);
             } else {
+                TCGv_i32 tmp = load_reg(s, rt);
                 if (ri->writefn) {
-                    TCGv_i32 tmp;
-                    TCGv_ptr tmpptr;
-                    tmp = load_reg(s, rt);
-                    tmpptr = tcg_const_ptr(ri);
-                    gen_helper_set_cp_reg(cpu_env, tmpptr, tmp);
-                    tcg_temp_free_ptr(tmpptr);
+                    gen_helper_set_cp_reg(cpu_env, tcg_constant_ptr(ri), tmp);
                     tcg_temp_free_i32(tmp);
                 } else {
-                    TCGv_i32 tmp = load_reg(s, rt);
                     store_cpu_offset(tmp, ri->fieldoffset, 4);
                 }
             }
-- 
2.25.1


