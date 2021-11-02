Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8071D442FE8
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Nov 2021 15:10:27 +0100 (CET)
Received: from localhost ([::1]:53548 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mhuUc-0005Kg-Ik
	for lists+qemu-devel@lfdr.de; Tue, 02 Nov 2021 10:10:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34294)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mhu5X-00024G-I7
 for qemu-devel@nongnu.org; Tue, 02 Nov 2021 09:44:31 -0400
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e]:41532)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mhu5V-00068R-00
 for qemu-devel@nongnu.org; Tue, 02 Nov 2021 09:44:31 -0400
Received: by mail-wm1-x32e.google.com with SMTP id
 f7-20020a1c1f07000000b0032ee11917ceso2155483wmf.0
 for <qemu-devel@nongnu.org>; Tue, 02 Nov 2021 06:44:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=CV0/Pzq40wUhlGoyOS/jEmIH7yh4yuHsbpD6mx/MAR8=;
 b=G+7cHTWiJHYBI9rsoKdJEUhyaBLoYUZ7AyZZVIjxPgjeCkx7w7e1e8GxWErgZ3Hr2v
 bDkhB69gBhNTplp94rBpv6gyjQTA4483l/avJgaTm8479JnepB4JxgeW1Sd89oU+y4sT
 9aW1v505IILShg6HOJ1WIdgd3oJwZ78cukqwBaz0GLY45/mgPUYPHasXqDK+OO0UEXGR
 OXHi64tY781+5PJKpDZhIt9goPZffrUbLX7+7LB3oRexEdIRMMnPJ/At27LagQSakfOW
 SU7gMIvniCpR4vK3Uqdou7GbJrLylHe+uHJQGIJrrWJbmpmFu/ZqcwyxugRFTTe6Hs2Z
 bvwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=CV0/Pzq40wUhlGoyOS/jEmIH7yh4yuHsbpD6mx/MAR8=;
 b=KUc5Wrc9XRHQlwpR7x5fyXPxXxADgtZ6JYrneAxOod+rXtwgCFaSq+Yh93h+Gj1yOz
 YC0Dc2rpVHtKoDWy81arGh5ybhU+SYTKOmstkYwpmgd4N2CncS98eW/PFpgBQO2QsAVs
 n5Pv8h0vwguaPdfjCMwbGFQZB9jz6d80lF7F+qvahedwJ+1aghwMIxmoFcNyY7h4sVhJ
 CofarIHFS+t1SxgdtoV02kFOS9Bseep6g+aj/xARrLHjGwQvChwLGVBp9+kKElsNRwYK
 xUjkQkqocneQxRD2Vk8PA66mvNo9D5eMe9YQkIfv4mkgbYUkFvBPd3iBH07at65PoehD
 HKow==
X-Gm-Message-State: AOAM530CCq21btnbbapR9L0DjWaXoJkvGlHiYj8NYFO2HlnsknRD39l0
 JkXcGWTqS1X3lfqK6Dy18EvkJbTuaPE=
X-Google-Smtp-Source: ABdhPJw4/0d72P4hbMXJlteZECaFj/qIidNpZBvf4SygwOLvWdYNH9thICJCQ+ScEVxtdAiUy18Naw==
X-Received: by 2002:a1c:f402:: with SMTP id z2mr7258136wma.53.1635860667308;
 Tue, 02 Nov 2021 06:44:27 -0700 (PDT)
Received: from x1w.. (62.red-83-57-168.dynamicip.rima-tde.net. [83.57.168.62])
 by smtp.gmail.com with ESMTPSA id
 p188sm2658002wmp.30.2021.11.02.06.44.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Nov 2021 06:44:26 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PULL 22/41] target/mips: Convert MSA 3RF instruction format to
 decodetree (DF_WORD)
Date: Tue,  2 Nov 2021 14:42:21 +0100
Message-Id: <20211102134240.3036524-23-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211102134240.3036524-1-f4bug@amsat.org>
References: <20211102134240.3036524-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32e.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Aurelien Jarno <aurelien@aurel32.net>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Convert 3-register floating-point or fixed-point operations
to decodetree.

Reviewed-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-Id: <20211028210843.2120802-20-f4bug@amsat.org>
---
 target/mips/tcg/msa.decode      |  39 ++++++
 target/mips/tcg/msa_translate.c | 213 ++++++--------------------------
 2 files changed, 76 insertions(+), 176 deletions(-)

diff --git a/target/mips/tcg/msa.decode b/target/mips/tcg/msa.decode
index f90b2d21c92..1d6ada4c142 100644
--- a/target/mips/tcg/msa.decode
+++ b/target/mips/tcg/msa.decode
@@ -23,6 +23,7 @@
 %bit_m              16:7 !function=bit_m
 %2r_df_w            16:1 !function=plus_2
 %3r_df_h            21:1 !function=plus_1
+%3r_df_w            21:1 !function=plus_2
 
 @lsa                ...... rs:5 rt:5 rd:5 ... sa:2 ......   &r
 @ldst               ...... sa:s10 ws:5 wd:5 .... df:2       &msa_i
@@ -32,6 +33,7 @@
 @2r                 ...... ........  df:2 ws:5 wd:5 ......  &msa_r wt=0
 @2rf                ...... ......... .    ws:5 wd:5 ......  &msa_r wt=0 df=%2r_df_w
 @3rf_h              ...... .... .    wt:5 ws:5 wd:5 ......  &msa_r df=%3r_df_h
+@3rf_w              ...... .... .    wt:5 ws:5 wd:5 ......  &msa_r df=%3r_df_w
 @u5                 ...... ... df:2 sa:5  ws:5 wd:5 ......  &msa_i
 @s5                 ...... ... df:2 sa:s5 ws:5 wd:5 ......  &msa_i
 @i8_df              ......     df:2 sa:s8 ws:5 wd:5 ......  &msa_i
@@ -86,9 +88,46 @@ BNZ                 010001 111 .. ..... ................    @bz
   SRARI             011110 010 ....... ..... .....  001010  @bit
   SRLRI             011110 011 ....... ..... .....  001010  @bit
 
+  FCAF              011110 0000 . ..... ..... ..... 011010  @3rf_w
+  FCUN              011110 0001 . ..... ..... ..... 011010  @3rf_w
+  FCEQ              011110 0010 . ..... ..... ..... 011010  @3rf_w
+  FCUEQ             011110 0011 . ..... ..... ..... 011010  @3rf_w
+  FCLT              011110 0100 . ..... ..... ..... 011010  @3rf_w
+  FCULT             011110 0101 . ..... ..... ..... 011010  @3rf_w
+  FCLE              011110 0110 . ..... ..... ..... 011010  @3rf_w
+  FCULE             011110 0111 . ..... ..... ..... 011010  @3rf_w
+  FSAF              011110 1000 . ..... ..... ..... 011010  @3rf_w
+  FSUN              011110 1001 . ..... ..... ..... 011010  @3rf_w
+  FSEQ              011110 1010 . ..... ..... ..... 011010  @3rf_w
+  FSUEQ             011110 1011 . ..... ..... ..... 011010  @3rf_w
+  FSLT              011110 1100 . ..... ..... ..... 011010  @3rf_w
+  FSULT             011110 1101 . ..... ..... ..... 011010  @3rf_w
+  FSLE              011110 1110 . ..... ..... ..... 011010  @3rf_w
+  FSULE             011110 1111 . ..... ..... ..... 011010  @3rf_w
+
+  FADD              011110 0000 . ..... ..... ..... 011011  @3rf_w
+  FSUB              011110 0001 . ..... ..... ..... 011011  @3rf_w
+  FMUL              011110 0010 . ..... ..... ..... 011011  @3rf_w
+  FDIV              011110 0011 . ..... ..... ..... 011011  @3rf_w
+  FMADD             011110 0100 . ..... ..... ..... 011011  @3rf_w
+  FMSUB             011110 0101 . ..... ..... ..... 011011  @3rf_w
+  FEXP2             011110 0111 . ..... ..... ..... 011011  @3rf_w
+  FEXDO             011110 1000 . ..... ..... ..... 011011  @3rf_w
+  FTQ               011110 1010 . ..... ..... ..... 011011  @3rf_w
+  FMIN              011110 1100 . ..... ..... ..... 011011  @3rf_w
+  FMIN_A            011110 1101 . ..... ..... ..... 011011  @3rf_w
+  FMAX              011110 1110 . ..... ..... ..... 011011  @3rf_w
+  FMAX_A            011110 1111 . ..... ..... ..... 011011  @3rf_w
+
+  FCOR              011110 0001 . ..... ..... ..... 011100  @3rf_w
+  FCUNE             011110 0010 . ..... ..... ..... 011100  @3rf_w
+  FCNE              011110 0011 . ..... ..... ..... 011100  @3rf_w
   MUL_Q             011110 0100 . ..... ..... ..... 011100  @3rf_h
   MADD_Q            011110 0101 . ..... ..... ..... 011100  @3rf_h
   MSUB_Q            011110 0110 . ..... ..... ..... 011100  @3rf_h
+  FSOR              011110 1001 . ..... ..... ..... 011100  @3rf_w
+  FSUNE             011110 1010 . ..... ..... ..... 011100  @3rf_w
+  FSNE              011110 1011 . ..... ..... ..... 011100  @3rf_w
   MULR_Q            011110 1100 . ..... ..... ..... 011100  @3rf_h
   MADDR_Q           011110 1101 . ..... ..... ..... 011100  @3rf_h
   MSUBR_Q           011110 1110 . ..... ..... ..... 011100  @3rf_h
diff --git a/target/mips/tcg/msa_translate.c b/target/mips/tcg/msa_translate.c
index 65e56b23171..26d05a87c89 100644
--- a/target/mips/tcg/msa_translate.c
+++ b/target/mips/tcg/msa_translate.c
@@ -47,9 +47,6 @@ enum {
     OPC_MSA_3R_14   = 0x14 | OPC_MSA,
     OPC_MSA_3R_15   = 0x15 | OPC_MSA,
     OPC_MSA_ELM     = 0x19 | OPC_MSA,
-    OPC_MSA_3RF_1A  = 0x1A | OPC_MSA,
-    OPC_MSA_3RF_1B  = 0x1B | OPC_MSA,
-    OPC_MSA_3RF_1C  = 0x1C | OPC_MSA,
 };
 
 enum {
@@ -128,43 +125,6 @@ enum {
     OPC_COPY_U_df   = (0x3 << 22) | (0x00 << 16) | OPC_MSA_ELM,
     OPC_INSERT_df   = (0x4 << 22) | (0x00 << 16) | OPC_MSA_ELM,
     OPC_INSVE_df    = (0x5 << 22) | (0x00 << 16) | OPC_MSA_ELM,
-
-    /* 3RF instruction _df(bit 21) = _w, _d */
-    OPC_FCAF_df     = (0x0 << 22) | OPC_MSA_3RF_1A,
-    OPC_FADD_df     = (0x0 << 22) | OPC_MSA_3RF_1B,
-    OPC_FCUN_df     = (0x1 << 22) | OPC_MSA_3RF_1A,
-    OPC_FSUB_df     = (0x1 << 22) | OPC_MSA_3RF_1B,
-    OPC_FCOR_df     = (0x1 << 22) | OPC_MSA_3RF_1C,
-    OPC_FCEQ_df     = (0x2 << 22) | OPC_MSA_3RF_1A,
-    OPC_FMUL_df     = (0x2 << 22) | OPC_MSA_3RF_1B,
-    OPC_FCUNE_df    = (0x2 << 22) | OPC_MSA_3RF_1C,
-    OPC_FCUEQ_df    = (0x3 << 22) | OPC_MSA_3RF_1A,
-    OPC_FDIV_df     = (0x3 << 22) | OPC_MSA_3RF_1B,
-    OPC_FCNE_df     = (0x3 << 22) | OPC_MSA_3RF_1C,
-    OPC_FCLT_df     = (0x4 << 22) | OPC_MSA_3RF_1A,
-    OPC_FMADD_df    = (0x4 << 22) | OPC_MSA_3RF_1B,
-    OPC_FCULT_df    = (0x5 << 22) | OPC_MSA_3RF_1A,
-    OPC_FMSUB_df    = (0x5 << 22) | OPC_MSA_3RF_1B,
-    OPC_FCLE_df     = (0x6 << 22) | OPC_MSA_3RF_1A,
-    OPC_FCULE_df    = (0x7 << 22) | OPC_MSA_3RF_1A,
-    OPC_FEXP2_df    = (0x7 << 22) | OPC_MSA_3RF_1B,
-    OPC_FSAF_df     = (0x8 << 22) | OPC_MSA_3RF_1A,
-    OPC_FEXDO_df    = (0x8 << 22) | OPC_MSA_3RF_1B,
-    OPC_FSUN_df     = (0x9 << 22) | OPC_MSA_3RF_1A,
-    OPC_FSOR_df     = (0x9 << 22) | OPC_MSA_3RF_1C,
-    OPC_FSEQ_df     = (0xA << 22) | OPC_MSA_3RF_1A,
-    OPC_FTQ_df      = (0xA << 22) | OPC_MSA_3RF_1B,
-    OPC_FSUNE_df    = (0xA << 22) | OPC_MSA_3RF_1C,
-    OPC_FSUEQ_df    = (0xB << 22) | OPC_MSA_3RF_1A,
-    OPC_FSNE_df     = (0xB << 22) | OPC_MSA_3RF_1C,
-    OPC_FSLT_df     = (0xC << 22) | OPC_MSA_3RF_1A,
-    OPC_FMIN_df     = (0xC << 22) | OPC_MSA_3RF_1B,
-    OPC_FSULT_df    = (0xD << 22) | OPC_MSA_3RF_1A,
-    OPC_FMIN_A_df   = (0xD << 22) | OPC_MSA_3RF_1B,
-    OPC_FSLE_df     = (0xE << 22) | OPC_MSA_3RF_1A,
-    OPC_FMAX_df     = (0xE << 22) | OPC_MSA_3RF_1B,
-    OPC_FSULE_df    = (0xF << 22) | OPC_MSA_3RF_1A,
-    OPC_FMAX_A_df   = (0xF << 22) | OPC_MSA_3RF_1B,
 };
 
 static const char msaregnames[][6] = {
@@ -1697,144 +1657,50 @@ static void gen_msa_elm(DisasContext *ctx)
     gen_msa_elm_df(ctx, df, n);
 }
 
+TRANS(FCAF,     trans_msa_3rf, gen_helper_msa_fcaf_df);
+TRANS(FCUN,     trans_msa_3rf, gen_helper_msa_fcun_df);
+TRANS(FCEQ,     trans_msa_3rf, gen_helper_msa_fceq_df);
+TRANS(FCUEQ,    trans_msa_3rf, gen_helper_msa_fcueq_df);
+TRANS(FCLT,     trans_msa_3rf, gen_helper_msa_fclt_df);
+TRANS(FCULT,    trans_msa_3rf, gen_helper_msa_fcult_df);
+TRANS(FCLE,     trans_msa_3rf, gen_helper_msa_fcle_df);
+TRANS(FCULE,    trans_msa_3rf, gen_helper_msa_fcule_df);
+TRANS(FSAF,     trans_msa_3rf, gen_helper_msa_fsaf_df);
+TRANS(FSUN,     trans_msa_3rf, gen_helper_msa_fsun_df);
+TRANS(FSEQ,     trans_msa_3rf, gen_helper_msa_fseq_df);
+TRANS(FSUEQ,    trans_msa_3rf, gen_helper_msa_fsueq_df);
+TRANS(FSLT,     trans_msa_3rf, gen_helper_msa_fslt_df);
+TRANS(FSULT,    trans_msa_3rf, gen_helper_msa_fsult_df);
+TRANS(FSLE,     trans_msa_3rf, gen_helper_msa_fsle_df);
+TRANS(FSULE,    trans_msa_3rf, gen_helper_msa_fsule_df);
+
+TRANS(FADD,     trans_msa_3rf, gen_helper_msa_fadd_df);
+TRANS(FSUB,     trans_msa_3rf, gen_helper_msa_fsub_df);
+TRANS(FMUL,     trans_msa_3rf, gen_helper_msa_fmul_df);
+TRANS(FDIV,     trans_msa_3rf, gen_helper_msa_fdiv_df);
+TRANS(FMADD,    trans_msa_3rf, gen_helper_msa_fmadd_df);
+TRANS(FMSUB,    trans_msa_3rf, gen_helper_msa_fmsub_df);
+TRANS(FEXP2,    trans_msa_3rf, gen_helper_msa_fexp2_df);
+TRANS(FEXDO,    trans_msa_3rf, gen_helper_msa_fexdo_df);
+TRANS(FTQ,      trans_msa_3rf, gen_helper_msa_ftq_df);
+TRANS(FMIN,     trans_msa_3rf, gen_helper_msa_fmin_df);
+TRANS(FMIN_A,   trans_msa_3rf, gen_helper_msa_fmin_a_df);
+TRANS(FMAX,     trans_msa_3rf, gen_helper_msa_fmax_df);
+TRANS(FMAX_A,   trans_msa_3rf, gen_helper_msa_fmax_a_df);
+
+TRANS(FCOR,     trans_msa_3rf, gen_helper_msa_fcor_df);
+TRANS(FCUNE,    trans_msa_3rf, gen_helper_msa_fcune_df);
+TRANS(FCNE,     trans_msa_3rf, gen_helper_msa_fcne_df);
 TRANS(MUL_Q,    trans_msa_3rf, gen_helper_msa_mul_q_df);
 TRANS(MADD_Q,   trans_msa_3rf, gen_helper_msa_madd_q_df);
 TRANS(MSUB_Q,   trans_msa_3rf, gen_helper_msa_msub_q_df);
+TRANS(FSOR,     trans_msa_3rf, gen_helper_msa_fsor_df);
+TRANS(FSUNE,    trans_msa_3rf, gen_helper_msa_fsune_df);
+TRANS(FSNE,     trans_msa_3rf, gen_helper_msa_fsne_df);
 TRANS(MULR_Q,   trans_msa_3rf, gen_helper_msa_mulr_q_df);
 TRANS(MADDR_Q,  trans_msa_3rf, gen_helper_msa_maddr_q_df);
 TRANS(MSUBR_Q,  trans_msa_3rf, gen_helper_msa_msubr_q_df);
 
-static void gen_msa_3rf(DisasContext *ctx)
-{
-#define MASK_MSA_3RF(op)    (MASK_MSA_MINOR(op) | (op & (0xf << 22)))
-    uint8_t df = (ctx->opcode >> 21) & 0x1;
-    uint8_t wt = (ctx->opcode >> 16) & 0x1f;
-    uint8_t ws = (ctx->opcode >> 11) & 0x1f;
-    uint8_t wd = (ctx->opcode >> 6) & 0x1f;
-
-    TCGv_i32 twd = tcg_const_i32(wd);
-    TCGv_i32 tws = tcg_const_i32(ws);
-    TCGv_i32 twt = tcg_const_i32(wt);
-    /* adjust df value for floating-point instruction */
-    TCGv_i32 tdf = tcg_constant_i32(DF_WORD + df);
-
-    switch (MASK_MSA_3RF(ctx->opcode)) {
-    case OPC_FCAF_df:
-        gen_helper_msa_fcaf_df(cpu_env, tdf, twd, tws, twt);
-        break;
-    case OPC_FADD_df:
-        gen_helper_msa_fadd_df(cpu_env, tdf, twd, tws, twt);
-        break;
-    case OPC_FCUN_df:
-        gen_helper_msa_fcun_df(cpu_env, tdf, twd, tws, twt);
-        break;
-    case OPC_FSUB_df:
-        gen_helper_msa_fsub_df(cpu_env, tdf, twd, tws, twt);
-        break;
-    case OPC_FCOR_df:
-        gen_helper_msa_fcor_df(cpu_env, tdf, twd, tws, twt);
-        break;
-    case OPC_FCEQ_df:
-        gen_helper_msa_fceq_df(cpu_env, tdf, twd, tws, twt);
-        break;
-    case OPC_FMUL_df:
-        gen_helper_msa_fmul_df(cpu_env, tdf, twd, tws, twt);
-        break;
-    case OPC_FCUNE_df:
-        gen_helper_msa_fcune_df(cpu_env, tdf, twd, tws, twt);
-        break;
-    case OPC_FCUEQ_df:
-        gen_helper_msa_fcueq_df(cpu_env, tdf, twd, tws, twt);
-        break;
-    case OPC_FDIV_df:
-        gen_helper_msa_fdiv_df(cpu_env, tdf, twd, tws, twt);
-        break;
-    case OPC_FCNE_df:
-        gen_helper_msa_fcne_df(cpu_env, tdf, twd, tws, twt);
-        break;
-    case OPC_FCLT_df:
-        gen_helper_msa_fclt_df(cpu_env, tdf, twd, tws, twt);
-        break;
-    case OPC_FMADD_df:
-        gen_helper_msa_fmadd_df(cpu_env, tdf, twd, tws, twt);
-        break;
-    case OPC_FCULT_df:
-        gen_helper_msa_fcult_df(cpu_env, tdf, twd, tws, twt);
-        break;
-    case OPC_FMSUB_df:
-        gen_helper_msa_fmsub_df(cpu_env, tdf, twd, tws, twt);
-        break;
-    case OPC_FCLE_df:
-        gen_helper_msa_fcle_df(cpu_env, tdf, twd, tws, twt);
-        break;
-    case OPC_FCULE_df:
-        gen_helper_msa_fcule_df(cpu_env, tdf, twd, tws, twt);
-        break;
-    case OPC_FEXP2_df:
-        gen_helper_msa_fexp2_df(cpu_env, tdf, twd, tws, twt);
-        break;
-    case OPC_FSAF_df:
-        gen_helper_msa_fsaf_df(cpu_env, tdf, twd, tws, twt);
-        break;
-    case OPC_FEXDO_df:
-        gen_helper_msa_fexdo_df(cpu_env, tdf, twd, tws, twt);
-        break;
-    case OPC_FSUN_df:
-        gen_helper_msa_fsun_df(cpu_env, tdf, twd, tws, twt);
-        break;
-    case OPC_FSOR_df:
-        gen_helper_msa_fsor_df(cpu_env, tdf, twd, tws, twt);
-        break;
-    case OPC_FSEQ_df:
-        gen_helper_msa_fseq_df(cpu_env, tdf, twd, tws, twt);
-        break;
-    case OPC_FTQ_df:
-        gen_helper_msa_ftq_df(cpu_env, tdf, twd, tws, twt);
-        break;
-    case OPC_FSUNE_df:
-        gen_helper_msa_fsune_df(cpu_env, tdf, twd, tws, twt);
-        break;
-    case OPC_FSUEQ_df:
-        gen_helper_msa_fsueq_df(cpu_env, tdf, twd, tws, twt);
-        break;
-    case OPC_FSNE_df:
-        gen_helper_msa_fsne_df(cpu_env, tdf, twd, tws, twt);
-        break;
-    case OPC_FSLT_df:
-        gen_helper_msa_fslt_df(cpu_env, tdf, twd, tws, twt);
-        break;
-    case OPC_FMIN_df:
-        gen_helper_msa_fmin_df(cpu_env, tdf, twd, tws, twt);
-        break;
-    case OPC_FSULT_df:
-        gen_helper_msa_fsult_df(cpu_env, tdf, twd, tws, twt);
-        break;
-    case OPC_FMIN_A_df:
-        gen_helper_msa_fmin_a_df(cpu_env, tdf, twd, tws, twt);
-        break;
-    case OPC_FSLE_df:
-        gen_helper_msa_fsle_df(cpu_env, tdf, twd, tws, twt);
-        break;
-    case OPC_FMAX_df:
-        gen_helper_msa_fmax_df(cpu_env, tdf, twd, tws, twt);
-        break;
-    case OPC_FSULE_df:
-        gen_helper_msa_fsule_df(cpu_env, tdf, twd, tws, twt);
-        break;
-    case OPC_FMAX_A_df:
-        gen_helper_msa_fmax_a_df(cpu_env, tdf, twd, tws, twt);
-        break;
-    default:
-        MIPS_INVAL("MSA instruction");
-        gen_reserved_instruction(ctx);
-        break;
-    }
-
-    tcg_temp_free_i32(twd);
-    tcg_temp_free_i32(tws);
-    tcg_temp_free_i32(twt);
-}
-
 static bool trans_msa_2r(DisasContext *ctx, arg_msa_r *a,
                          gen_helper_pii *gen_msa_2r)
 {
@@ -1925,11 +1791,6 @@ static bool trans_MSA(DisasContext *ctx, arg_MSA *a)
     case OPC_MSA_ELM:
         gen_msa_elm(ctx);
         break;
-    case OPC_MSA_3RF_1A:
-    case OPC_MSA_3RF_1B:
-    case OPC_MSA_3RF_1C:
-        gen_msa_3rf(ctx);
-        break;
     default:
         MIPS_INVAL("MSA instruction");
         gen_reserved_instruction(ctx);
-- 
2.31.1


