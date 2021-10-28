Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C844243F194
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Oct 2021 23:24:44 +0200 (CEST)
Received: from localhost ([::1]:42008 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mgCt9-0001Nr-UT
	for lists+qemu-devel@lfdr.de; Thu, 28 Oct 2021 17:24:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35190)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mgCeI-00076S-UW
 for qemu-devel@nongnu.org; Thu, 28 Oct 2021 17:09:22 -0400
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f]:44808)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mgCeH-0004qj-7Z
 for qemu-devel@nongnu.org; Thu, 28 Oct 2021 17:09:22 -0400
Received: by mail-wr1-x42f.google.com with SMTP id d13so12444368wrf.11
 for <qemu-devel@nongnu.org>; Thu, 28 Oct 2021 14:09:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=SIs60s0fc+p1xM+8sNRwlUl7N9HesUDIt6LmbgzPTmA=;
 b=ea5rJn+P3jldjts1MJFBybJqoG5V5p61g5vq5SewXRStbUwUd+sMRiXLljE7C8GIXO
 97bWXv6be2hnxarepshcbH+7AwQgsdYzyCJMQeQo5cAo0vUGWRogxGTSukOR5ai7QqEQ
 ECv9ao4Olux45XVuSxxjReFxhxdZfB2fUmFF9snHPE8gSW8ntnWZB5sNmj+gzSB1Yck4
 IRB29oR9QfhHdBEKfeNGiI0iGfZyW7VTia85KpI/2AKt+msmfhmHoffHwRBKnRt2VX5v
 30mSiXfcGqvfjPJuVE9dP3AhDWcs074zrsm5TbmSxQOFkilxLisfTRrjt61N+shBnykW
 Bx1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=SIs60s0fc+p1xM+8sNRwlUl7N9HesUDIt6LmbgzPTmA=;
 b=RTcE8fqCDuIwuLiS0+RO2wyU10gfPYc1sUz8oVTDFs9h0N11Sr53aMJcgncSpY7Hqq
 RURM1KND2+l+BPzuMwu/36V5DhrjFUAhiw9q8lg97xfgd1KFpGXd6B2t2C4TU4xAz6cS
 X7V0LrjGc5P/inzOvOdJV7D1xWExzfwlhhAhKAgWMJvgxJijZIFgoCL4UPowKa400EL1
 mq25uxcbjozSj2Vak2o0BpcMQGYxUhvtDNoZyR13cemAGt0sB60X8XGldJP4F1HUN3u3
 pXjgHzUDBe1qwgWf4nemYiIAJ+ypom0dGpaxSsO8tyNRmrQ7wQwho3JLdMlufvyPVDED
 GHkg==
X-Gm-Message-State: AOAM533NRHeL3ZrK45AoQ/mB/B6hZ6RXMHkp/fMmXJKNa+znrhZm4h/N
 iCnQtWkP2Iq95KIVepcohX3DMJVrfJE=
X-Google-Smtp-Source: ABdhPJw1wVdnpVsD5gd0dk52nbeYiabWMLxncwtJsAjbAtyHfBxqWGQPiq2z1/WJkIoRowLC7IZ0MA==
X-Received: by 2002:adf:f210:: with SMTP id p16mr8466356wro.61.1635455359662; 
 Thu, 28 Oct 2021 14:09:19 -0700 (PDT)
Received: from x1w.redhat.com (62.red-83-57-168.dynamicip.rima-tde.net.
 [83.57.168.62])
 by smtp.gmail.com with ESMTPSA id u10sm5326753wrs.5.2021.10.28.14.09.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Oct 2021 14:09:19 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 07/32] target/mips: Rename sa16 -> sa, bz_df -> bz -> bz_v
Date: Thu, 28 Oct 2021 23:08:18 +0200
Message-Id: <20211028210843.2120802-8-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211028210843.2120802-1-f4bug@amsat.org>
References: <20211028210843.2120802-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42f.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Aurelien Jarno <aurelien@aurel32.net>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This 'shift amount' format is not always 16-bit, so name it
generically as 'sa'. This will help to unify the various
arg_msa decodetree generated structures.

Rename the @bz format -> @bz_v (specific @bz with df=3) and
@bz_df -> @bz (generic @bz).

Since we modify &msa_bz, re-align its arguments, so the other
structures added in the following commits stay visually aligned.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 target/mips/tcg/msa.decode      | 15 +++++++--------
 target/mips/tcg/msa_translate.c | 20 ++++++++++----------
 2 files changed, 17 insertions(+), 18 deletions(-)

diff --git a/target/mips/tcg/msa.decode b/target/mips/tcg/msa.decode
index 74d99f6862c..56419a24eb9 100644
--- a/target/mips/tcg/msa.decode
+++ b/target/mips/tcg/msa.decode
@@ -13,19 +13,18 @@
 
 &r                  rs rt rd sa
 
-&msa_bz             df wt s16
+&msa_bz             df        wt sa
 
 @lsa                ...... rs:5 rt:5 rd:5 ... sa:2 ......   &r
-@bz                 ...... ... ..   wt:5 s16:16             &msa_bz df=3
-@bz_df              ...... ... df:2 wt:5 s16:16             &msa_bz
+@bz_v               ...... ... ..    wt:5 sa:16             &msa_bz df=3
+@bz                 ...... ...  df:2 wt:5 sa:16             &msa_bz
 
 LSA                 000000 ..... ..... ..... 000 .. 000101  @lsa
 DLSA                000000 ..... ..... ..... 000 .. 010101  @lsa
 
-BZ_V                010001 01011  ..... ................    @bz
-BNZ_V               010001 01111  ..... ................    @bz
-
-BZ_x                010001 110 .. ..... ................    @bz_df
-BNZ_x               010001 111 .. ..... ................    @bz_df
+BZ_V                010001 01011  ..... ................    @bz_v
+BNZ_V               010001 01111  ..... ................    @bz_v
+BZ                  010001 110 .. ..... ................    @bz
+BNZ                 010001 111 .. ..... ................    @bz
 
 MSA                 011110 --------------------------
diff --git a/target/mips/tcg/msa_translate.c b/target/mips/tcg/msa_translate.c
index e4bf42530fc..e1d90fbde25 100644
--- a/target/mips/tcg/msa_translate.c
+++ b/target/mips/tcg/msa_translate.c
@@ -338,7 +338,7 @@ static void gen_check_zero_element(TCGv tresult, uint8_t df, uint8_t wt,
     tcg_temp_free_i64(t1);
 }
 
-static bool gen_msa_BxZ_V(DisasContext *ctx, int wt, int s16, TCGCond cond)
+static bool gen_msa_BxZ_V(DisasContext *ctx, int wt, int sa, TCGCond cond)
 {
     TCGv_i64 t0;
 
@@ -356,7 +356,7 @@ static bool gen_msa_BxZ_V(DisasContext *ctx, int wt, int s16, TCGCond cond)
     tcg_gen_trunc_i64_tl(bcond, t0);
     tcg_temp_free_i64(t0);
 
-    ctx->btarget = ctx->base.pc_next + (s16 << 2) + 4;
+    ctx->btarget = ctx->base.pc_next + (sa << 2) + 4;
 
     ctx->hflags |= MIPS_HFLAG_BC;
     ctx->hflags |= MIPS_HFLAG_BDS32;
@@ -366,15 +366,15 @@ static bool gen_msa_BxZ_V(DisasContext *ctx, int wt, int s16, TCGCond cond)
 
 static bool trans_BZ_V(DisasContext *ctx, arg_msa_bz *a)
 {
-    return gen_msa_BxZ_V(ctx, a->wt, a->s16, TCG_COND_EQ);
+    return gen_msa_BxZ_V(ctx, a->wt, a->sa, TCG_COND_EQ);
 }
 
 static bool trans_BNZ_V(DisasContext *ctx, arg_msa_bz *a)
 {
-    return gen_msa_BxZ_V(ctx, a->wt, a->s16, TCG_COND_NE);
+    return gen_msa_BxZ_V(ctx, a->wt, a->sa, TCG_COND_NE);
 }
 
-static bool gen_msa_BxZ(DisasContext *ctx, int df, int wt, int s16, bool if_not)
+static bool gen_msa_BxZ(DisasContext *ctx, int df, int wt, int sa, bool if_not)
 {
     if (!check_msa_enabled(ctx)) {
         return true;
@@ -387,21 +387,21 @@ static bool gen_msa_BxZ(DisasContext *ctx, int df, int wt, int s16, bool if_not)
 
     gen_check_zero_element(bcond, df, wt, if_not ? TCG_COND_EQ : TCG_COND_NE);
 
-    ctx->btarget = ctx->base.pc_next + (s16 << 2) + 4;
+    ctx->btarget = ctx->base.pc_next + (sa << 2) + 4;
     ctx->hflags |= MIPS_HFLAG_BC;
     ctx->hflags |= MIPS_HFLAG_BDS32;
 
     return true;
 }
 
-static bool trans_BZ_x(DisasContext *ctx, arg_msa_bz *a)
+static bool trans_BZ(DisasContext *ctx, arg_msa_bz *a)
 {
-    return gen_msa_BxZ(ctx, a->df, a->wt, a->s16, false);
+    return gen_msa_BxZ(ctx, a->df, a->wt, a->sa, false);
 }
 
-static bool trans_BNZ_x(DisasContext *ctx, arg_msa_bz *a)
+static bool trans_BNZ(DisasContext *ctx, arg_msa_bz *a)
 {
-    return gen_msa_BxZ(ctx, a->df, a->wt, a->s16, true);
+    return gen_msa_BxZ(ctx, a->df, a->wt, a->sa, true);
 }
 
 static void gen_msa_i8(DisasContext *ctx)
-- 
2.31.1


