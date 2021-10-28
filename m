Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 74DF543F200
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Oct 2021 23:43:41 +0200 (CEST)
Received: from localhost ([::1]:44858 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mgDBU-0006LL-40
	for lists+qemu-devel@lfdr.de; Thu, 28 Oct 2021 17:43:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36132)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mgCft-00012Q-P0
 for qemu-devel@nongnu.org; Thu, 28 Oct 2021 17:11:02 -0400
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436]:34809)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mgCfs-0007UJ-2R
 for qemu-devel@nongnu.org; Thu, 28 Oct 2021 17:11:01 -0400
Received: by mail-wr1-x436.google.com with SMTP id d10so12535871wrb.1
 for <qemu-devel@nongnu.org>; Thu, 28 Oct 2021 14:10:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=cxguCnL06J4yBIaa4Cil82jgF62zprHyyZKGCmF+Nps=;
 b=X64Kz84/A2/MCBw5f/dH2jyet0M5oYhQKHzE8fcBbYn1ccnGWPKd4vIVNg3SJ3fiAq
 Z1G9rWd8GroyDyzbgHeSuvSya2LUPxlYdij1w4n1bvNqKBT4hZb0Vofjm3vs9IpuyYjU
 GqCBKC4MIWHZWrDBuQ7Dkj2ZkHSQwSkfvPIZpVblGgF8hVHmQjLJuNIOZFucmTJi+0tA
 pw69M6mcZN54S046a2Xe7A1oJ1Hybx0NfPvt4FV+ZXwKYiqyrI/ZBt4O3UGRvYZkhRE4
 ULunP1ydh+cLsLDBfke2/wa9YXPJ7CnDxw9VWE9STRTwsY6kDW2P+6xJts3MltWx92sA
 x1vA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=cxguCnL06J4yBIaa4Cil82jgF62zprHyyZKGCmF+Nps=;
 b=lppCZ7ShyqkaoqNWob84s5ixpwslQvgLhZivXf/JcgVTeY5Kn+uky9NXedKpgnAPsE
 myx+CJ4vVA1qSmy5V0RaZfNBN23rBRI/cpexzwCVfkCcsEVASDfsa7AxKDei+RIu3eAp
 Pl2vuMPEvlqj2U5ir5/Fvon+Ba0uaY7u39vKiX34lZaKDqBHGwAcTapJmvgkYF2QnNZq
 +l7HIPP8EkhImx5bNFeD8xH+Tz/Fw2IXN80S2kdCJwpGJIRnT1rHc8tIIgADrWA5O2Fd
 Vx73QIRdYS8x+zfQBUHjKLJhnoxeZjdheeo64A6CgHw0UwYZkLMHJu3DGpaAVGJyTqbO
 h+zQ==
X-Gm-Message-State: AOAM531n+u0GpgBiPkFz9pHeqYi88KTRooRvpALTMagwVYrYOC5r673z
 Lyy4cyMEC/JYO1xnBC0tlJda+M9aUo4=
X-Google-Smtp-Source: ABdhPJxLlJ9/ZrenWM5HBarASB8jqdQDLVQXBelhl4yElpv6guj9aHkCzFVEJyUJYm8SPrpyT8ZfQQ==
X-Received: by 2002:adf:f744:: with SMTP id z4mr8855279wrp.17.1635455457900;
 Thu, 28 Oct 2021 14:10:57 -0700 (PDT)
Received: from x1w.redhat.com (62.red-83-57-168.dynamicip.rima-tde.net.
 [83.57.168.62])
 by smtp.gmail.com with ESMTPSA id r1sm8006053wmr.36.2021.10.28.14.10.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Oct 2021 14:10:57 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 27/32] target/mips: Convert MSA MOVE.V opcode to decodetree
Date: Thu, 28 Oct 2021 23:08:38 +0200
Message-Id: <20211028210843.2120802-28-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211028210843.2120802-1-f4bug@amsat.org>
References: <20211028210843.2120802-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x436.google.com
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

Convert the MOVE.V opcode (Vector Move) to decodetree.

Reviewed-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 target/mips/tcg/msa.decode      |  7 ++++++-
 target/mips/tcg/msa_translate.c | 19 ++++++++++++++-----
 2 files changed, 20 insertions(+), 6 deletions(-)

diff --git a/target/mips/tcg/msa.decode b/target/mips/tcg/msa.decode
index 9aac6808fc5..d1b6a63b526 100644
--- a/target/mips/tcg/msa.decode
+++ b/target/mips/tcg/msa.decode
@@ -19,6 +19,7 @@
 &msa_i              df  wd ws    sa
 &msa_bit            df  wd ws       m
 &msa_elm_df         df  wd ws       n
+&msa_elm                wd ws
 
 %elm_df             16:6 !function=elm_df
 %elm_n              16:6 !function=elm_n
@@ -33,6 +34,7 @@
 @bz_v               ...... ... ..    wt:5 sa:16             &msa_bz df=3
 @bz                 ...... ...  df:2 wt:5 sa:16             &msa_bz
 @elm_df             ...... .... ......    ws:5 wd:5 ......  &msa_elm_df df=%elm_df n=%elm_n
+@elm                ...... ..........     ws:5 wd:5 ......  &msa_elm
 @vec                ...... .....     wt:5 ws:5 wd:5 ......  &msa_r df=0
 @2r                 ...... ........  df:2 ws:5 wd:5 ......  &msa_r wt=0
 @2rf                ...... ......... .    ws:5 wd:5 ......  &msa_r wt=0 df=%2r_df_w
@@ -167,7 +169,10 @@ BNZ                 010001 111 .. ..... ................    @bz
 
   SLDI              011110 0000 ...... ..... .....  011001  @elm_df
   SPLATI            011110 0001 ...... ..... .....  011001  @elm_df
-  COPY_S            011110 0010 ...... ..... .....  011001  @elm_df
+  {
+    MOVE_V          011110 0010111110  ..... .....  011001  @elm
+    COPY_S          011110 0010 ...... ..... .....  011001  @elm_df
+  }
   COPY_U            011110 0011 ...... ..... .....  011001  @elm_df
   INSERT            011110 0100 ...... ..... .....  011001  @elm_df
   INSVE             011110 0101 ...... ..... .....  011001  @elm_df
diff --git a/target/mips/tcg/msa_translate.c b/target/mips/tcg/msa_translate.c
index e10dd5e6ef8..1cc9cd8afa5 100644
--- a/target/mips/tcg/msa_translate.c
+++ b/target/mips/tcg/msa_translate.c
@@ -46,7 +46,6 @@ enum {
     /* ELM instructions df(bits 21..16) = _b, _h, _w, _d */
     OPC_CTCMSA      = (0x0 << 22) | (0x3E << 16) | OPC_MSA_ELM,
     OPC_CFCMSA      = (0x1 << 22) | (0x3E << 16) | OPC_MSA_ELM,
-    OPC_MOVE_V      = (0x2 << 22) | (0x3E << 16) | OPC_MSA_ELM,
 };
 
 static const char msaregnames[][6] = {
@@ -531,6 +530,19 @@ TRANS_DF_iii_b(HADD_U,  trans_msa_3r,   gen_helper_msa_hadd_u);
 TRANS_DF_iii_b(HSUB_S,  trans_msa_3r,   gen_helper_msa_hsub_s);
 TRANS_DF_iii_b(HSUB_U,  trans_msa_3r,   gen_helper_msa_hsub_u);
 
+static bool trans_MOVE_V(DisasContext *ctx, arg_msa_elm *a)
+{
+    if (!check_msa_enabled(ctx)) {
+        return true;
+    }
+
+    gen_helper_msa_move_v(cpu_env,
+                          tcg_constant_i32(a->wd),
+                          tcg_constant_i32(a->ws));
+
+    return true;
+}
+
 static void gen_msa_elm_3e(DisasContext *ctx)
 {
 #define MASK_MSA_ELM_DF3E(op)   (MASK_MSA_MINOR(op) | (op & (0x3FF << 16)))
@@ -549,9 +561,6 @@ static void gen_msa_elm_3e(DisasContext *ctx)
         gen_helper_msa_cfcmsa(telm, cpu_env, tsr);
         gen_store_gpr(telm, dest);
         break;
-    case OPC_MOVE_V:
-        gen_helper_msa_move_v(cpu_env, tdt, tsr);
-        break;
     default:
         MIPS_INVAL("MSA instruction");
         gen_reserved_instruction(ctx);
@@ -652,7 +661,7 @@ static void gen_msa_elm(DisasContext *ctx)
     uint8_t dfn = (ctx->opcode >> 16) & 0x3f;
 
     if (dfn == 0x3E) {
-        /* CTCMSA, CFCMSA, MOVE.V */
+        /* CTCMSA, CFCMSA */
         gen_msa_elm_3e(ctx);
         return;
     } else {
-- 
2.31.1


