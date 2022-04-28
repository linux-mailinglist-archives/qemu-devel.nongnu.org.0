Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D7F2151378B
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Apr 2022 16:58:29 +0200 (CEST)
Received: from localhost ([::1]:49722 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nk5bA-0007V2-Vg
	for lists+qemu-devel@lfdr.de; Thu, 28 Apr 2022 10:58:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45114)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nk5Jk-0005QO-G4
 for qemu-devel@nongnu.org; Thu, 28 Apr 2022 10:40:28 -0400
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435]:45715)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nk5Ji-0006Jh-AD
 for qemu-devel@nongnu.org; Thu, 28 Apr 2022 10:40:27 -0400
Received: by mail-wr1-x435.google.com with SMTP id w4so7050418wrg.12
 for <qemu-devel@nongnu.org>; Thu, 28 Apr 2022 07:40:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=gEztapr5E2c66foY6wW5Q7WhYUpYyPfV3For5JsNlhc=;
 b=jcHuSs2ewS/SeZxvPGQENxK6FmL+NgKyeL2rCpkNg7m39tVpszBLruSfpwvHkXu0eg
 2soLgiY2wJOyiCGYGZCwlBXMswnqLBNu4B/QqyNuFmGEQARG5Uer5FyVW8pOrI4Z9wlw
 Cd+tVzX0aITnKCiuKST5Hf2xo4mI8WYIcpkB0NTJrYqynabf1Wbu8VvnfCosmY1ItBYg
 dE9l+xEoB98grddyOAGnOV/MIi2X69QgxiZXwBcS0Re0H/xluJGNHUb9aLZaHb4Gcmwk
 d/vO5LIUIquFSPwjYRurtZ3xaIfff8adkjfKDk6m/gkXkdQt7tvLd8bQR3vci/EpB0k5
 X+oQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=gEztapr5E2c66foY6wW5Q7WhYUpYyPfV3For5JsNlhc=;
 b=eiuwTfCCR1bVmGN0PvdUbRrmFCnFWYj4EQhY63Nm5rHQzPq1ZnoKiwSBJU7kdMIbxy
 OOiTmVYClzBgH0xqLq1iCDlUr6ZyLYtFeogykJdKPNeWzWYr0nKT9W7Yy3mepQyxpult
 Gslwi328uMahnj7YJ9trAHuT+7GaMr5S16n8+2C5VpjlR7hrenpuYAOrJId+T1FK0Lg5
 /ZO5usrhkoETUK4mD8WlBQcSRAWey1O/ZL5QRxxpSvvlirAz7G+PMdM3nudh5whwBBii
 GVa05VrChF44kmSVX/MmS8yRCMGYtduIgzE7mZ4LGYE4k3/U2nO2GKr1hu+nWIV77T23
 O6qQ==
X-Gm-Message-State: AOAM530mpgpyrBTiEE/QlaGclz1y/LH0Pfhhp3PyTqjEhCXzN3eKk652
 IinbSK1x2rEhWxvuX/QxcH/Hjz72v7KlgQ==
X-Google-Smtp-Source: ABdhPJxXMb7yQ/17oY3PX9sC3K3e7f19Ax/++LDcbvox80TWsqDXvACNZHeGIWKzWbEpVFKOZcAH3w==
X-Received: by 2002:adf:ee4c:0:b0:20a:e668:b939 with SMTP id
 w12-20020adfee4c000000b0020ae668b939mr10871305wro.523.1651156823586; 
 Thu, 28 Apr 2022 07:40:23 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 bh26-20020a05600c3d1a00b003928db85759sm130221wmb.15.2022.04.28.07.40.22
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Apr 2022 07:40:23 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 22/54] target/arm: Use tcg_constant for aa32 exceptions
Date: Thu, 28 Apr 2022 15:39:26 +0100
Message-Id: <20220428143958.2451229-23-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220428143958.2451229-1-peter.maydell@linaro.org>
References: <20220428143958.2451229-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x435.google.com
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
Message-id: 20220426163043.100432-23-richard.henderson@linaro.org
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/translate.c | 32 +++++++-------------------------
 1 file changed, 7 insertions(+), 25 deletions(-)

diff --git a/target/arm/translate.c b/target/arm/translate.c
index d09692c125b..9bd1b46a520 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -346,9 +346,7 @@ static void store_sp_checked(DisasContext *s, TCGv_i32 var)
 
 void gen_set_cpsr(TCGv_i32 var, uint32_t mask)
 {
-    TCGv_i32 tmp_mask = tcg_const_i32(mask);
-    gen_helper_cpsr_write(cpu_env, var, tmp_mask);
-    tcg_temp_free_i32(tmp_mask);
+    gen_helper_cpsr_write(cpu_env, var, tcg_constant_i32(mask));
 }
 
 static void gen_rebuild_hflags(DisasContext *s, bool new_el)
@@ -373,11 +371,8 @@ static void gen_rebuild_hflags(DisasContext *s, bool new_el)
 
 static void gen_exception_internal(int excp)
 {
-    TCGv_i32 tcg_excp = tcg_const_i32(excp);
-
     assert(excp_is_internal(excp));
-    gen_helper_exception_internal(cpu_env, tcg_excp);
-    tcg_temp_free_i32(tcg_excp);
+    gen_helper_exception_internal(cpu_env, tcg_constant_i32(excp));
 }
 
 static void gen_singlestep_exception(DisasContext *s)
@@ -1078,12 +1073,8 @@ static inline void gen_smc(DisasContext *s)
     /* As with HVC, we may take an exception either before or after
      * the insn executes.
      */
-    TCGv_i32 tmp;
-
     gen_set_pc_im(s, s->pc_curr);
-    tmp = tcg_const_i32(syn_aa32_smc());
-    gen_helper_pre_smc(cpu_env, tmp);
-    tcg_temp_free_i32(tmp);
+    gen_helper_pre_smc(cpu_env, tcg_constant_i32(syn_aa32_smc()));
     gen_set_pc_im(s, s->base.pc_next);
     s->base.is_jmp = DISAS_SMC;
 }
@@ -1111,13 +1102,9 @@ void gen_exception_insn(DisasContext *s, uint64_t pc, int excp,
 
 static void gen_exception_bkpt_insn(DisasContext *s, uint32_t syn)
 {
-    TCGv_i32 tcg_syn;
-
     gen_set_condexec(s);
     gen_set_pc_im(s, s->pc_curr);
-    tcg_syn = tcg_const_i32(syn);
-    gen_helper_exception_bkpt_insn(cpu_env, tcg_syn);
-    tcg_temp_free_i32(tcg_syn);
+    gen_helper_exception_bkpt_insn(cpu_env, tcg_constant_i32(syn));
     s->base.is_jmp = DISAS_NORETURN;
 }
 
@@ -1131,16 +1118,11 @@ void unallocated_encoding(DisasContext *s)
 static void gen_exception_el(DisasContext *s, int excp, uint32_t syn,
                              TCGv_i32 tcg_el)
 {
-    TCGv_i32 tcg_excp;
-    TCGv_i32 tcg_syn;
-
     gen_set_condexec(s);
     gen_set_pc_im(s, s->pc_curr);
-    tcg_excp = tcg_const_i32(excp);
-    tcg_syn = tcg_const_i32(syn);
-    gen_helper_exception_with_syndrome(cpu_env, tcg_excp, tcg_syn, tcg_el);
-    tcg_temp_free_i32(tcg_syn);
-    tcg_temp_free_i32(tcg_excp);
+    gen_helper_exception_with_syndrome(cpu_env,
+                                       tcg_constant_i32(excp),
+                                       tcg_constant_i32(syn), tcg_el);
     s->base.is_jmp = DISAS_NORETURN;
 }
 
-- 
2.25.1


