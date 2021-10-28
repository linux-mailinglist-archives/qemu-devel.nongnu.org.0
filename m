Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E8B7A43F1A7
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Oct 2021 23:28:35 +0200 (CEST)
Received: from localhost ([::1]:50668 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mgCws-0007ek-Ue
	for lists+qemu-devel@lfdr.de; Thu, 28 Oct 2021 17:28:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35542)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mgCev-0000OU-VE
 for qemu-devel@nongnu.org; Thu, 28 Oct 2021 17:10:01 -0400
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431]:34796)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mgCeu-00062z-BJ
 for qemu-devel@nongnu.org; Thu, 28 Oct 2021 17:10:01 -0400
Received: by mail-wr1-x431.google.com with SMTP id d10so12532429wrb.1
 for <qemu-devel@nongnu.org>; Thu, 28 Oct 2021 14:09:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ZAIpHoJdAawcnmVPcM6L7lEuzZ63YrrIUTS4dAbgBuM=;
 b=PrTKlmuJarIpUC9Zg1muRo9kLTplWo4hrYDLjTobheI1gbl5FOwn0hV/NI2k6Fd2XV
 T+TIc8GtQtax8LQPrPf7sFbg3AFekaT4h/FQNF0Mqc6NuvcSKnIJ83wroHDwjNt5dM+i
 9EAjHgUpk6R5EBclFsANKS6lTk02kvzyVIjU0lsI2Y5pwysJQNHhHJXe96u4OtQ95Pvy
 35qn4xqkSo/JTpRCscaObOQfSwSfYvXjyhCjnCPl6aaggg9ynmAI34RfKucruadsKHH9
 gbMy3osiZhtF17UAvovfXCePwFk4k4vOxQ0TxwyYEenLjlrpHSspj16ocngdIuLaYpVM
 L3JQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=ZAIpHoJdAawcnmVPcM6L7lEuzZ63YrrIUTS4dAbgBuM=;
 b=xg72znE32D4uGdl2qyAIKQ4Fu2Tzslp2dFHoUchnm2XpvhmB9v27yu3PTOw9unSzpE
 rqJyOAwsYFEbqcAz8VlCQB5SexnmyPowtkglP/UOAm3QuY6BE0suHdQ3ZJB9em1TS4BY
 oXWxOoSm1+1mR7fgGpGxCimvmGrotSCsyr5ta0Wkpak3r+/chom8kJ3CrQ4Uhb/Tz5Un
 qG7b4Y9YSFog7C8Y82ANBR9Ws7riylKL0DPk5iIXnRl5dz8cS6baYy/Pr6grUMzcUvnK
 tfnF3EWjvjoAuXfhgZV7wrqTw3XsCHx5dEGEtQ3lssymgqjsveSTNqkQtAJuLRnNG1JA
 dAFA==
X-Gm-Message-State: AOAM532xY/epj3xuDnE3xxRDDB/vIfWS4Vywrt+fYvIHCTWl/wdFeFU+
 2x3LHgq5IKZw6B4QO9Yd95YgtQ2JFk8=
X-Google-Smtp-Source: ABdhPJwd25s/Ou5t+2JXSfvYZgtHHI8Xjfiu6rqk0wMrc6UMtC4a91jTyzaGxElS8sSzyKKkvFxq2w==
X-Received: by 2002:adf:bd91:: with SMTP id l17mr8889359wrh.261.1635455398830; 
 Thu, 28 Oct 2021 14:09:58 -0700 (PDT)
Received: from x1w.redhat.com (62.red-83-57-168.dynamicip.rima-tde.net.
 [83.57.168.62])
 by smtp.gmail.com with ESMTPSA id i13sm3972363wmq.41.2021.10.28.14.09.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Oct 2021 14:09:58 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 15/32] target/mips: Convert MSA FILL opcode to decodetree
Date: Thu, 28 Oct 2021 23:08:26 +0200
Message-Id: <20211028210843.2120802-16-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211028210843.2120802-1-f4bug@amsat.org>
References: <20211028210843.2120802-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x431.google.com
X-Spam_score_int: 4
X-Spam_score: 0.4
X-Spam_bar: /
X-Spam_report: (0.4 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=0.25, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

Convert the FILL opcode (Vector Fill from GPR) to decodetree.

Reviewed-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
v3:
- Return false if BITS != 64 && DF_DOUBLE instead of raising exception
---
 target/mips/tcg/msa.decode      |  2 ++
 target/mips/tcg/msa_translate.c | 31 +++++++++++++++++++------------
 2 files changed, 21 insertions(+), 12 deletions(-)

diff --git a/target/mips/tcg/msa.decode b/target/mips/tcg/msa.decode
index 33288b50355..bcbc573deec 100644
--- a/target/mips/tcg/msa.decode
+++ b/target/mips/tcg/msa.decode
@@ -27,6 +27,7 @@
 @ldst               ...... sa:s10 ws:5 wd:5 .... df:2       &msa_i
 @bz_v               ...... ... ..    wt:5 sa:16             &msa_bz df=3
 @bz                 ...... ...  df:2 wt:5 sa:16             &msa_bz
+@2r                 ...... ........  df:2 ws:5 wd:5 ......  &msa_r wt=0
 @2rf                ...... ......... .    ws:5 wd:5 ......  &msa_r wt=0 df=%2r_df_w
 @u5                 ...... ... df:2 sa:5  ws:5 wd:5 ......  &msa_i
 @s5                 ...... ... df:2 sa:s5 ws:5 wd:5 ......  &msa_i
@@ -82,6 +83,7 @@ BNZ                 010001 111 .. ..... ................    @bz
   SRARI             011110 010 ....... ..... .....  001010  @bit
   SRLRI             011110 011 ....... ..... .....  001010  @bit
 
+  FILL              011110 11000000 .. ..... .....  011110  @2r
   FCLASS            011110 110010000 . ..... .....  011110  @2rf
   FTRUNC_S          011110 110010001 . ..... .....  011110  @2rf
   FTRUNC_U          011110 110010010 . ..... .....  011110  @2rf
diff --git a/target/mips/tcg/msa_translate.c b/target/mips/tcg/msa_translate.c
index 477eba49ac4..1894d779196 100644
--- a/target/mips/tcg/msa_translate.c
+++ b/target/mips/tcg/msa_translate.c
@@ -61,7 +61,6 @@ enum {
     OPC_MSA_2R      = (0x18 << 21) | OPC_MSA_VEC,
 
     /* 2R instruction df(bits 17..16) = _b, _h, _w, _d */
-    OPC_FILL_df     = (0x00 << 18) | OPC_MSA_2R,
     OPC_PCNT_df     = (0x01 << 18) | OPC_MSA_2R,
     OPC_NLOC_df     = (0x02 << 18) | OPC_MSA_2R,
     OPC_NLZC_df     = (0x03 << 18) | OPC_MSA_2R,
@@ -1845,17 +1844,6 @@ static void gen_msa_2r(DisasContext *ctx)
     TCGv_i32 tws = tcg_const_i32(ws);
 
     switch (MASK_MSA_2R(ctx->opcode)) {
-    case OPC_FILL_df:
-#if !defined(TARGET_MIPS64)
-        /* Double format valid only for MIPS64 */
-        if (df == DF_DOUBLE) {
-            gen_reserved_instruction(ctx);
-            break;
-        }
-#endif
-        gen_helper_msa_fill_df(cpu_env, tcg_constant_i32(df),
-                               twd, tws); /* trs */
-        break;
     case OPC_NLOC_df:
         switch (df) {
         case DF_BYTE:
@@ -1914,6 +1902,25 @@ static void gen_msa_2r(DisasContext *ctx)
     tcg_temp_free_i32(tws);
 }
 
+static bool trans_FILL(DisasContext *ctx, arg_msa_r *a)
+{
+    if (TARGET_LONG_BITS != 64 && a->df == DF_DOUBLE) {
+        /* Double format valid only for MIPS64 */
+        return false;
+    }
+
+    if (!check_msa_enabled(ctx)) {
+        return true;
+    }
+
+    gen_helper_msa_fill_df(cpu_env,
+                           tcg_constant_i32(a->df),
+                           tcg_constant_i32(a->wd),
+                           tcg_constant_i32(a->ws));
+
+    return true;
+}
+
 static bool trans_msa_2rf(DisasContext *ctx, arg_msa_r *a,
                           gen_helper_piii *gen_msa_2rf)
 {
-- 
2.31.1


