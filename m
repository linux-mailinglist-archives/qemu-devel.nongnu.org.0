Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B12CF563EC1
	for <lists+qemu-devel@lfdr.de>; Sat,  2 Jul 2022 08:08:59 +0200 (CEST)
Received: from localhost ([::1]:37508 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o7WJO-0000iP-Rq
	for lists+qemu-devel@lfdr.de; Sat, 02 Jul 2022 02:08:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34652)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o7WDM-0002vg-DR
 for qemu-devel@nongnu.org; Sat, 02 Jul 2022 02:02:44 -0400
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431]:43569)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o7WDJ-0004rd-M5
 for qemu-devel@nongnu.org; Sat, 02 Jul 2022 02:02:44 -0400
Received: by mail-pf1-x431.google.com with SMTP id 136so4278044pfy.10
 for <qemu-devel@nongnu.org>; Fri, 01 Jul 2022 23:02:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Vr0uT7qqfwuP7HuZnNZDuuWBaqMj6lUxoak84Ik4zME=;
 b=hGmD0bohoC0VPo05P9u4ltrv9bFX/2yzR7lgsy3Cx/rfF1EnpblQ6OCtXA8bkQ+1Jb
 cmaV9tAW+yYXZfwPjjG3PER12WJ80DgSxD9IX5Jhab7aYkj9/QbRXaH7JWqIjZWoZsuk
 FOakitBVCE8H6ecr0uOsItQb9gMH4GF3rzfcFoaeR2qNkxaKdFc0DUgQP1fC5qPpg31l
 dUeNGcwLEBfl7ScxywsNzOmGgWPDsYUOO2JPxd/TJKXfGZEg4M9pjmw8pnu2beumwzb/
 /vKUMRmTdSen9saUOyTBOtOfTRH5CRQvWZAccd3sJYGQ7sLsNBUDzxjfuIU7BCOwWGl9
 Fxlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Vr0uT7qqfwuP7HuZnNZDuuWBaqMj6lUxoak84Ik4zME=;
 b=PH7hgiqGWLOefaC0sRrCVCZSxbjVGhenJJBFYQCGGxY1iGcEyldioK5gk69ySkUK6v
 O+0yN+3enn6oD2+XTVQNO3OEDAcJ4X1ITzLzb4i3YzNv+miIIQt6Beuxflu60XTANcBZ
 btmNM1AaGDRy8x+bh4BDvwsdsOXuxAOKP7sd8Pg1i7NhbEol1+APJQaIEoWZCw9O4bec
 keu5lbf/iLBBdMVm66H31CDsZtT0PkoVOufBG7yi+noRos3uSWLz5dSBP/hTkFkQwfQn
 FehiW9P8Gv5Hoq7qvJkoVRp9kCP3DbOvcoWLz4GT7AekcPI5Fe+4f8ViwKvyy2ywj5co
 qQVw==
X-Gm-Message-State: AJIora/sKjWOv2ZV7jW089IN0Q3NJoA6tCxmx7ZB97diw9uy2g0ZKr7L
 QDL46mu0/vqnxDloOwuEiuhzRryEkneM/GNR
X-Google-Smtp-Source: AGRyM1sJFB9MfUSs8eeROtE5rPi1i9uvR3Otkr999Zb5+Kn3RVb6lxF3BB7KRj/DhAuHH/LsvXzSNw==
X-Received: by 2002:a63:d751:0:b0:401:9f40:3fcb with SMTP id
 w17-20020a63d751000000b004019f403fcbmr15373268pgi.311.1656741760085; 
 Fri, 01 Jul 2022 23:02:40 -0700 (PDT)
Received: from stoup.. ([122.255.60.245]) by smtp.gmail.com with ESMTPSA id
 z2-20020a17090a66c200b001ece55b938asm5232178pjl.32.2022.07.01.23.02.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 01 Jul 2022 23:02:39 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: svens@linux.ibm.com,
	qemu-s390x@nongnu.org
Subject: [PATCH v2 2/4] target/s390x: Remove DISAS_PC_STALE
Date: Sat,  2 Jul 2022 11:32:26 +0530
Message-Id: <20220702060228.420454-3-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220702060228.420454-1-richard.henderson@linaro.org>
References: <20220702060228.420454-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::431;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x431.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

There is nothing to distinguish this from DISAS_TOO_MANY.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/s390x/tcg/translate.c | 13 ++++---------
 1 file changed, 4 insertions(+), 9 deletions(-)

diff --git a/target/s390x/tcg/translate.c b/target/s390x/tcg/translate.c
index e38ae9ce09..a3422c0eb0 100644
--- a/target/s390x/tcg/translate.c
+++ b/target/s390x/tcg/translate.c
@@ -1126,10 +1126,6 @@ typedef struct {
 /* We have updated the PC and CC values.  */
 #define DISAS_PC_CC_UPDATED     DISAS_TARGET_2
 
-/* We are exiting the TB, but have neither emitted a goto_tb, nor
-   updated the PC for the next instruction to be executed.  */
-#define DISAS_PC_STALE          DISAS_TARGET_3
-
 /* We are exiting the TB to the main loop.  */
 #define DISAS_PC_STALE_NOCHAIN  DISAS_TARGET_4
 
@@ -3993,7 +3989,7 @@ static DisasJumpType op_sacf(DisasContext *s, DisasOps *o)
 {
     gen_helper_sacf(cpu_env, o->in2);
     /* Addressing mode has changed, so end the block.  */
-    return DISAS_PC_STALE;
+    return DISAS_TOO_MANY;
 }
 #endif
 
@@ -4029,7 +4025,7 @@ static DisasJumpType op_sam(DisasContext *s, DisasOps *o)
     tcg_temp_free_i64(tsam);
 
     /* Always exit the TB, since we (may have) changed execution mode.  */
-    return DISAS_PC_STALE;
+    return DISAS_TOO_MANY;
 }
 
 static DisasJumpType op_sar(DisasContext *s, DisasOps *o)
@@ -6562,13 +6558,13 @@ static DisasJumpType translate_one(CPUS390XState *env, DisasContext *s)
 
     /* io should be the last instruction in tb when icount is enabled */
     if (unlikely(icount && ret == DISAS_NEXT)) {
-        ret = DISAS_PC_STALE;
+        ret = DISAS_TOO_MANY;
     }
 
 #ifndef CONFIG_USER_ONLY
     if (s->base.tb->flags & FLAG_MASK_PER) {
         /* An exception might be triggered, save PSW if not already done.  */
-        if (ret == DISAS_NEXT || ret == DISAS_PC_STALE) {
+        if (ret == DISAS_NEXT || ret == DISAS_TOO_MANY) {
             tcg_gen_movi_i64(psw_addr, s->pc_tmp);
         }
 
@@ -6634,7 +6630,6 @@ static void s390x_tr_tb_stop(DisasContextBase *dcbase, CPUState *cs)
     case DISAS_NORETURN:
         break;
     case DISAS_TOO_MANY:
-    case DISAS_PC_STALE:
     case DISAS_PC_STALE_NOCHAIN:
         update_psw_addr(dc);
         /* FALLTHRU */
-- 
2.34.1


