Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A0755442FC9
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Nov 2021 15:06:57 +0100 (CET)
Received: from localhost ([::1]:41148 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mhuRE-0004da-EZ
	for lists+qemu-devel@lfdr.de; Tue, 02 Nov 2021 10:06:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34738)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mhu6A-00044g-4u
 for qemu-devel@nongnu.org; Tue, 02 Nov 2021 09:45:10 -0400
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330]:51847)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mhu67-0006Ic-Sg
 for qemu-devel@nongnu.org; Tue, 02 Nov 2021 09:45:09 -0400
Received: by mail-wm1-x330.google.com with SMTP id z200so14808935wmc.1
 for <qemu-devel@nongnu.org>; Tue, 02 Nov 2021 06:45:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=GUGgh2ZiJsyEFdQJYG8F4ULR7JtEFx+5xt/bY9ZTqpU=;
 b=d9rL1/+E6ljvYmBJGePgDy6gZN+WUK9uCPEELKAWoN5IbjdWkjGhH101/zrol5hB0D
 +rmxHIxcWd6Fgb40S1wLt/NOH3Kch7FAqFdpJwdsRSkKJXu01ftGfNpvCErI5TmXxaHs
 oSKnWK9KLjT/rnoV9Ly8ok36R0XihHp8mTBx775vT2sLGpyIahgf5cXqKCKJjQctEsmO
 7Oc4L6uEXTNGINxQR2ROqv8TrSe/x2SZnYA2IWyRk5AfSyz9ljoXOWJfjc8Ago5l3H2V
 7nAgXsvUJz3Zif7JqhsTa6XDEv/R8RveMg4pnLV/A1VDhCezYBM6C2AstohSu65Xqfyy
 BcoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=GUGgh2ZiJsyEFdQJYG8F4ULR7JtEFx+5xt/bY9ZTqpU=;
 b=V5+lds3hDgXzQ2WiID7fjPOb5doe2DqI2FiCcpUCRXM2sKSh8XI1EkedJEsb1KYzbI
 fqBCZHc1Oe6iDG+KsSk07c4DsiP1/TMOBepJD3G7Z1pDwfFfZ3VczB0jZUNszCZZ4O8p
 xBwoRUMNgmoJh6228HuYKs4kthKfMMCjLWtk36Vq8p0II7fNQJy5ZgsezxqEvISPxQE4
 ad+cBHhRrvWpfHtsso4VHLTyF228PcTVXBZhtBdmnB3GykQxANq5El6XgGBoE/PN/yUl
 XKnPnSAdYR2Pc08mogMGXJNj4hEAasmMbejth/T1wne8ojIhPmKvo4DmCPqaO/s7zCAQ
 L9iw==
X-Gm-Message-State: AOAM533FnFnzKZ1Ycq0iBChI8D2wK1+aY6Bo2RAys86hjX8cGZZmtkJZ
 vXRRG1AyMWKrwYLZ3w1f1LVjEGTCZH8=
X-Google-Smtp-Source: ABdhPJzzv5q/MpCKoEuD1HAdFi30Eyg3bjXaKS8LukJDuxWyCju+icXK7j2OVkjORCbIEjW/OGe1hA==
X-Received: by 2002:a05:600c:24d:: with SMTP id
 13mr6752647wmj.156.1635860706389; 
 Tue, 02 Nov 2021 06:45:06 -0700 (PDT)
Received: from x1w.. (62.red-83-57-168.dynamicip.rima-tde.net. [83.57.168.62])
 by smtp.gmail.com with ESMTPSA id
 h14sm2878687wmq.34.2021.11.02.06.45.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Nov 2021 06:45:05 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PULL 30/41] target/mips: Convert MSA MOVE.V opcode to decodetree
Date: Tue,  2 Nov 2021 14:42:29 +0100
Message-Id: <20211102134240.3036524-31-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211102134240.3036524-1-f4bug@amsat.org>
References: <20211102134240.3036524-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x330.google.com
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

Convert the MOVE.V opcode (Vector Move) to decodetree.

Reviewed-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-Id: <20211028210843.2120802-28-f4bug@amsat.org>
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
index 6a034831efd..ea572413ed6 100644
--- a/target/mips/tcg/msa_translate.c
+++ b/target/mips/tcg/msa_translate.c
@@ -46,7 +46,6 @@ enum {
     /* ELM instructions df(bits 21..16) = _b, _h, _w, _d */
     OPC_CTCMSA      = (0x0 << 22) | (0x3E << 16) | OPC_MSA_ELM,
     OPC_CFCMSA      = (0x1 << 22) | (0x3E << 16) | OPC_MSA_ELM,
-    OPC_MOVE_V      = (0x2 << 22) | (0x3E << 16) | OPC_MSA_ELM,
 };
 
 static const char msaregnames[][6] = {
@@ -533,6 +532,19 @@ TRANS_DF_iii_b(HADD_U,  trans_msa_3r,   gen_helper_msa_hadd_u);
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
@@ -551,9 +563,6 @@ static void gen_msa_elm_3e(DisasContext *ctx)
         gen_helper_msa_cfcmsa(telm, cpu_env, tsr);
         gen_store_gpr(telm, dest);
         break;
-    case OPC_MOVE_V:
-        gen_helper_msa_move_v(cpu_env, tdt, tsr);
-        break;
     default:
         MIPS_INVAL("MSA instruction");
         gen_reserved_instruction(ctx);
@@ -654,7 +663,7 @@ static void gen_msa_elm(DisasContext *ctx)
     uint8_t dfn = (ctx->opcode >> 16) & 0x3f;
 
     if (dfn == 0x3E) {
-        /* CTCMSA, CFCMSA, MOVE.V */
+        /* CTCMSA, CFCMSA */
         gen_msa_elm_3e(ctx);
         return;
     } else {
-- 
2.31.1


