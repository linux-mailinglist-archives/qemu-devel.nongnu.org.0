Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3831C5355EC
	for <lists+qemu-devel@lfdr.de>; Fri, 27 May 2022 00:01:55 +0200 (CEST)
Received: from localhost ([::1]:57880 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nuLYH-0002nD-Ly
	for lists+qemu-devel@lfdr.de; Thu, 26 May 2022 18:01:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53622)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1nuLCi-00023y-Kh; Thu, 26 May 2022 17:39:37 -0400
Received: from mail-oa1-x2c.google.com ([2001:4860:4864:20::2c]:38442)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1nuLCg-0008CU-TE; Thu, 26 May 2022 17:39:36 -0400
Received: by mail-oa1-x2c.google.com with SMTP id
 586e51a60fabf-e5e433d66dso3759164fac.5; 
 Thu, 26 May 2022 14:39:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=7jxNw68GgO6aC67fWTszp7U7UmO9zWSWmGkFzl21a+c=;
 b=KqxgzkJ4qJCWp4Bhre//frjy6vtivseBRcYtjYXWKCyKmSOZLhO450HIbGFwh+xpPD
 eXayWF0tn68F9OsMXhs5KPU5ZB2v7AQIblvlKOgNq0XR+B9oBfd2/ZUAYk394RhM2Ivv
 BqpvP8AGvKYUGNcRPpvtihvUlTYilTciDHodI++LwUPJTCVK2WzjcjIYPRQ1tYEHraFK
 XwDrDs0ElAQrI+bR72GUxyCvBUbBPu+XgkTWrrzdWIRyafSJQnk86uCEWYld6lkIalX4
 WYLOL7wstN8x79AAxEL4Bi4c1MM9qd4XVX70mRtbsiahrTWOGezF8JB+YLLN/4Uy7lbP
 uyfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=7jxNw68GgO6aC67fWTszp7U7UmO9zWSWmGkFzl21a+c=;
 b=oLGbHMTZW2JST0SVPMeU+2EPpO2EEXFrGBq/hwflUV/JElyhEqmpFPHv81jp6CrPnL
 NL/RRxaCbu932Zp4g2fq2ii0unHfn9Z946vbHrQlxnfUCbn5xSyQQdm/eh6W5rP6M6Z5
 Aeyr9L4iVQ048LG7hGGf8vWBVGqTOHWtqVguO3qLaaf0II5HhkoW5ZWKF2+E+Qc4/THm
 5R9ccKfH3ksuVPsECM8JWZqaLHc7OW8wDWBWygrSVxdkf1SjYwbkzlhvGL9vOUOg5mqf
 +E5ymILhbCCuyZN1E+VpG2FsqpOiKPIRbREK9dR3l6sFBgAOvjS+22w8IlZIiMThL5Y9
 WXtw==
X-Gm-Message-State: AOAM531bQh2fTr1ZSlysV5RGhb59T+d4VPIZGQnTO0sneMUlq8DgamDr
 LaMegX9QjnVo+WKuZql0fGdIHMqgymk=
X-Google-Smtp-Source: ABdhPJw1D6NcOmQAyaRVRhzjmpMgej6ZPJcGkCzsDCDLfXtfDBj/us6BNBS48XmK5EjSUrZD3ZaWjQ==
X-Received: by 2002:a05:6870:538d:b0:de:aa91:898e with SMTP id
 h13-20020a056870538d00b000deaa91898emr2380803oan.54.1653601173484; 
 Thu, 26 May 2022 14:39:33 -0700 (PDT)
Received: from balboa.COMFAST (189-46-169-45.dsl.telesp.net.br.
 [189.46.169.45]) by smtp.gmail.com with ESMTPSA id
 l43-20020a0568302b2b00b00606ad72bdcbsm1066999otv.38.2022.05.26.14.39.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 May 2022 14:39:33 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, danielhb413@gmail.com, peter.maydell@linaro.org,
 richard.henderson@linaro.org, Matheus Ferst <matheus.ferst@eldorado.org.br>
Subject: [PULL 22/34] target/ppc: declare vmsumsh[ms] helper with call flags
Date: Thu, 26 May 2022 18:38:03 -0300
Message-Id: <20220526213815.92701-23-danielhb413@gmail.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220526213815.92701-1-danielhb413@gmail.com>
References: <20220526213815.92701-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::2c;
 envelope-from=danielhb413@gmail.com; helo=mail-oa1-x2c.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Matheus Ferst <matheus.ferst@eldorado.org.br>

Move vmsumshm and vmsumshs to decodetree, declare vmsumshm helper with
TCG_CALL_NO_RWG, and drop the unused env argument.

Signed-off-by: Matheus Ferst <matheus.ferst@eldorado.org.br>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20220517123929.284511-13-matheus.ferst@eldorado.org.br>
Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 target/ppc/helper.h                 | 4 ++--
 target/ppc/insn32.decode            | 2 ++
 target/ppc/int_helper.c             | 5 ++---
 target/ppc/translate/vmx-impl.c.inc | 3 ++-
 target/ppc/translate/vmx-ops.c.inc  | 1 -
 5 files changed, 8 insertions(+), 7 deletions(-)

diff --git a/target/ppc/helper.h b/target/ppc/helper.h
index 5127851f2c..5e43920b9e 100644
--- a/target/ppc/helper.h
+++ b/target/ppc/helper.h
@@ -244,8 +244,8 @@ DEF_HELPER_5(vmhaddshs, void, env, avr, avr, avr, avr)
 DEF_HELPER_5(vmhraddshs, void, env, avr, avr, avr, avr)
 DEF_HELPER_FLAGS_4(VMSUMUHM, TCG_CALL_NO_RWG, void, avr, avr, avr, avr)
 DEF_HELPER_5(VMSUMUHS, void, env, avr, avr, avr, avr)
-DEF_HELPER_5(vmsumshm, void, env, avr, avr, avr, avr)
-DEF_HELPER_5(vmsumshs, void, env, avr, avr, avr, avr)
+DEF_HELPER_FLAGS_4(VMSUMSHM, TCG_CALL_NO_RWG, void, avr, avr, avr, avr)
+DEF_HELPER_5(VMSUMSHS, void, env, avr, avr, avr, avr)
 DEF_HELPER_FLAGS_4(vmladduhm, TCG_CALL_NO_RWG, void, avr, avr, avr, avr)
 DEF_HELPER_FLAGS_2(mtvscr, TCG_CALL_NO_RWG, void, env, i32)
 DEF_HELPER_FLAGS_1(mfvscr, TCG_CALL_NO_RWG, i32, env)
diff --git a/target/ppc/insn32.decode b/target/ppc/insn32.decode
index 43ea03c3e7..f001c02a8c 100644
--- a/target/ppc/insn32.decode
+++ b/target/ppc/insn32.decode
@@ -601,6 +601,8 @@ VMULLD          000100 ..... ..... ..... 00111001001    @VX
 
 VMSUMUBM        000100 ..... ..... ..... ..... 100100   @VA
 VMSUMMBM        000100 ..... ..... ..... ..... 100101   @VA
+VMSUMSHM        000100 ..... ..... ..... ..... 101000   @VA
+VMSUMSHS        000100 ..... ..... ..... ..... 101001   @VA
 VMSUMUHM        000100 ..... ..... ..... ..... 100110   @VA
 VMSUMUHS        000100 ..... ..... ..... ..... 100111   @VA
 
diff --git a/target/ppc/int_helper.c b/target/ppc/int_helper.c
index 9285a1c2a1..b9dd15d607 100644
--- a/target/ppc/int_helper.c
+++ b/target/ppc/int_helper.c
@@ -890,8 +890,7 @@ void helper_VMSUMMBM(ppc_avr_t *r, ppc_avr_t *a, ppc_avr_t *b, ppc_avr_t *c)
     }
 }
 
-void helper_vmsumshm(CPUPPCState *env, ppc_avr_t *r, ppc_avr_t *a,
-                     ppc_avr_t *b, ppc_avr_t *c)
+void helper_VMSUMSHM(ppc_avr_t *r, ppc_avr_t *a, ppc_avr_t *b, ppc_avr_t *c)
 {
     int32_t prod[8];
     int i;
@@ -905,7 +904,7 @@ void helper_vmsumshm(CPUPPCState *env, ppc_avr_t *r, ppc_avr_t *a,
     }
 }
 
-void helper_vmsumshs(CPUPPCState *env, ppc_avr_t *r, ppc_avr_t *a,
+void helper_VMSUMSHS(CPUPPCState *env, ppc_avr_t *r, ppc_avr_t *a,
                      ppc_avr_t *b, ppc_avr_t *c)
 {
     int32_t prod[8];
diff --git a/target/ppc/translate/vmx-impl.c.inc b/target/ppc/translate/vmx-impl.c.inc
index da81296b96..d7524c3204 100644
--- a/target/ppc/translate/vmx-impl.c.inc
+++ b/target/ppc/translate/vmx-impl.c.inc
@@ -2587,9 +2587,9 @@ static bool trans_VSEL(DisasContext *ctx, arg_VA *a)
     return true;
 }
 
-GEN_VAFORM_PAIRED(vmsumshm, vmsumshs, 20)
 TRANS_FLAGS(ALTIVEC, VMSUMUBM, do_va_helper, gen_helper_VMSUMUBM)
 TRANS_FLAGS(ALTIVEC, VMSUMMBM, do_va_helper, gen_helper_VMSUMMBM)
+TRANS_FLAGS(ALTIVEC, VMSUMSHM, do_va_helper, gen_helper_VMSUMSHM)
 TRANS_FLAGS(ALTIVEC, VMSUMUHM, do_va_helper, gen_helper_VMSUMUHM)
 
 static bool do_va_env_helper(DisasContext *ctx, arg_VA *a,
@@ -2612,6 +2612,7 @@ static bool do_va_env_helper(DisasContext *ctx, arg_VA *a,
 }
 
 TRANS_FLAGS(ALTIVEC, VMSUMUHS, do_va_env_helper, gen_helper_VMSUMUHS)
+TRANS_FLAGS(ALTIVEC, VMSUMSHS, do_va_env_helper, gen_helper_VMSUMSHS)
 
 GEN_VAFORM_PAIRED(vmaddfp, vnmsubfp, 23)
 
diff --git a/target/ppc/translate/vmx-ops.c.inc b/target/ppc/translate/vmx-ops.c.inc
index 15b3e06410..d7cc57868e 100644
--- a/target/ppc/translate/vmx-ops.c.inc
+++ b/target/ppc/translate/vmx-ops.c.inc
@@ -224,7 +224,6 @@ GEN_VXFORM_UIMM(vctsxs, 5, 15),
 #define GEN_VAFORM_PAIRED(name0, name1, opc2)                           \
     GEN_HANDLER(name0##_##name1, 0x04, opc2, 0xFF, 0x00000000, PPC_ALTIVEC)
 GEN_VAFORM_PAIRED(vmhaddshs, vmhraddshs, 16),
-GEN_VAFORM_PAIRED(vmsumshm, vmsumshs, 20),
 GEN_VAFORM_PAIRED(vmaddfp, vnmsubfp, 23),
 
 GEN_VXFORM_DUAL(vclzb, vpopcntb, 1, 28, PPC_NONE, PPC2_ALTIVEC_207),
-- 
2.36.1


