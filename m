Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A5BA85104F3
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Apr 2022 19:10:32 +0200 (CEST)
Received: from localhost ([::1]:45880 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1njOhr-00083X-Nt
	for lists+qemu-devel@lfdr.de; Tue, 26 Apr 2022 13:10:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45842)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1njO5v-00036M-76
 for qemu-devel@nongnu.org; Tue, 26 Apr 2022 12:31:23 -0400
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a]:41659)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1njO5m-0003tA-RX
 for qemu-devel@nongnu.org; Tue, 26 Apr 2022 12:31:18 -0400
Received: by mail-pj1-x102a.google.com with SMTP id
 z5-20020a17090a468500b001d2bc2743c4so3041375pjf.0
 for <qemu-devel@nongnu.org>; Tue, 26 Apr 2022 09:31:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=uvLyVQbuChfsfEoCGl+dZ58evyiN/bZiVeu1vrYZOeg=;
 b=dOYKC2ztJCmDPEVmIQl03djyFF6hrcJw3Rw+KDtxYsJuJ+PjTIyiCfGQZOn5MXv6Ba
 HPMCaD+l+d50Wa7N17F/ok0h4/RwCdLOjeVZ3AQOlkzwa+ns9HXJZZKnY5g+XOILPO8M
 cPx++gjlwPdjnkX67mnwmZwm5YepjXfwoX5ocrESlCz6yZtvhercVtKZI6rwCijwEjik
 +hN7LkMfdL3MLDU7acw9SpcYXmRxsYKpD13MM0zDNYLRg7jiLHz8SCFJv/qTxkan2aEr
 cZbXtbGepaos92LBixShTixt1TbuJn4HLAIXo/pTiNEw4wMlNZ9uqrNCkP4O9+Qny7yI
 /9jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=uvLyVQbuChfsfEoCGl+dZ58evyiN/bZiVeu1vrYZOeg=;
 b=5CAC2Rwv8cYBzCCqPOOHP4VBbvKo1BA5zMMJTiG+smAoSn2XUtv2Mk1S0bN4ypTFpi
 tyPVAp71ecn9u37sX+MikxRza/YanSnY5iy2Kq9Vi5mj0PwRgl+TUKvlyucsgoFkY7dS
 UOz/geEn56bijYCH3SKqfffETOb981MMIWVumg3yZiXWY0W3RARWrRbwPTSJnUT/padw
 CppTFhtsgPJwJSYakeUecATRS06alO49OJCYSK/2rruWrH/DmBdNdMXq/VEqT8IB5CHq
 IFQuT5cj3T7RWQUEtKokEBh6BoYlYSZ03whr9iKXD3aIj1WVLf7rRa46J/iAFcFcUUyW
 dzsg==
X-Gm-Message-State: AOAM531IU8BHtdQi2Po6ypWJo9RhGgX+fsKnoYFD+AGzvteH9JJD4aN8
 KcOmHiQTQMMstp0OGiBvFLo2E+L0wxxMHw==
X-Google-Smtp-Source: ABdhPJz4ZuJttyKQc8QszUHSkLU0g/+aL/Im+18s5PaZxXxUZSxOEYT644ZOB77Q3c0Ok8D6/3Z/MQ==
X-Received: by 2002:a17:90b:3ec3:b0:1c7:24c4:e28f with SMTP id
 rm3-20020a17090b3ec300b001c724c4e28fmr39195181pjb.191.1650990669357; 
 Tue, 26 Apr 2022 09:31:09 -0700 (PDT)
Received: from stoup.. (174-21-142-130.tukw.qwest.net. [174.21.142.130])
 by smtp.gmail.com with ESMTPSA id
 y131-20020a626489000000b00505a8f36965sm15655813pfb.184.2022.04.26.09.31.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Apr 2022 09:31:08 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 26/47] target/arm: Use tcg_constant for do_coproc_insn
Date: Tue, 26 Apr 2022 09:30:22 -0700
Message-Id: <20220426163043.100432-27-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220426163043.100432-1-richard.henderson@linaro.org>
References: <20220426163043.100432-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Cc: qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate.c | 43 +++++++++++++-----------------------------
 1 file changed, 13 insertions(+), 30 deletions(-)

diff --git a/target/arm/translate.c b/target/arm/translate.c
index 9539d2e8ca..e4f3db26f6 100644
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
2.34.1


