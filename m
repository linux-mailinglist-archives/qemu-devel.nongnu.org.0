Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BE33943D10A
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Oct 2021 20:47:24 +0200 (CEST)
Received: from localhost ([::1]:40204 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mfnxL-0003eb-Qq
	for lists+qemu-devel@lfdr.de; Wed, 27 Oct 2021 14:47:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52776)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mfnMw-0006GU-PK
 for qemu-devel@nongnu.org; Wed, 27 Oct 2021 14:09:46 -0400
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436]:37486)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mfnMv-0004rm-9c
 for qemu-devel@nongnu.org; Wed, 27 Oct 2021 14:09:46 -0400
Received: by mail-wr1-x436.google.com with SMTP id b12so1166133wrh.4
 for <qemu-devel@nongnu.org>; Wed, 27 Oct 2021 11:09:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=le9K2gTaO/69jgiE6RLCRjCBK6edwyJiYRZxLJ7NX+w=;
 b=mHexwxLg9qzpTPX07AlpBnC3ToUBf1UVK7u2IjCpjsPWfVU7zU/Lv1FHQTPn72wPgm
 Br4MFzWpHys8SXuW+tvAV1omziRZBNuw2y8VaxpP63Bx1VCPLX92DX47p/hfm96LUMXL
 djwvOwPjgJ2YzX8qvEoSRSwvXj7g8g/JOXWR8QdUiGX0+XQr2O2ZTStGHk6ZwNkEwRDv
 P7anMpIYb/X4v+51oqXE6uClfITXPbRLWbVJ1IeVyj4iE4007b4ExNcz16NXFBoM9e2Q
 pxoupk7WUVhVouuBM/aFgykDR8VOSrCAOJFeBUu4l2+mTDNa8TMJ9XDDhOnKRltVxLu3
 u3QA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=le9K2gTaO/69jgiE6RLCRjCBK6edwyJiYRZxLJ7NX+w=;
 b=YNOapi1azhiWTdRqgOn1IhC4k42GZJFEFR75dou3crI4UZW+Valgkd19cg+wB7VXyo
 NMxfEHF9mzg4/D87U+7vOMHzb8d631j55u2KGtoxqnaJo/11bviqNkswFbrWbQDn5ZJ4
 teQjB+sN+uazhS5X6HTY9DYH24e9D6xbGdo34R++7L0XHiQc7bIH6+oUVd6ajR9n1Lkr
 ScwKXAX+TtEtaJLkvwMOG1PpUxmB1+FCffPelYBd9QR3/dWwgMAGaL5sTdnSObTC38dG
 Y2AZDjcO+zzh6c84ufXXE2FWFZ90eiKV2XK74ftnRotVg7IXmXVvLNV2A1U7PHTfzHRq
 3CZQ==
X-Gm-Message-State: AOAM531CHsShOzKFoHeRW74OJBbrwd5DFqy5sWmizd/4F8PWhdG7Tm8Z
 Y2ZHnJpCoZdtaoy+krF5wbn8UtgrPcA=
X-Google-Smtp-Source: ABdhPJyBpqdn7lcvlGOL1SXf7xuqkDtX93wJkdLvm/6OTrLhB1Upj3UUwxzsh1gDft1NPAFVrOj//Q==
X-Received: by 2002:a5d:4a46:: with SMTP id v6mr41442313wrs.262.1635358183554; 
 Wed, 27 Oct 2021 11:09:43 -0700 (PDT)
Received: from x1w.redhat.com (62.red-83-57-168.dynamicip.rima-tde.net.
 [83.57.168.62])
 by smtp.gmail.com with ESMTPSA id p11sm4687723wmi.0.2021.10.27.11.09.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 27 Oct 2021 11:09:43 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 28/32] target/mips: Convert CFCMSA opcode to decodetree
Date: Wed, 27 Oct 2021 20:07:26 +0200
Message-Id: <20211027180730.1551932-29-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211027180730.1551932-1-f4bug@amsat.org>
References: <20211027180730.1551932-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x436.google.com
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
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Convert the CFCMSA (Copy From Control MSA register) opcode
to decodetree. Since it overlaps with the SPLATI opcode,
use a decodetree overlap group.

Reviewed-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 target/mips/tcg/msa.decode      |  5 ++++-
 target/mips/tcg/msa_translate.c | 27 +++++++++++++++++++--------
 2 files changed, 23 insertions(+), 9 deletions(-)

diff --git a/target/mips/tcg/msa.decode b/target/mips/tcg/msa.decode
index cfa5fa5d688..12358e7a6ba 100644
--- a/target/mips/tcg/msa.decode
+++ b/target/mips/tcg/msa.decode
@@ -166,7 +166,10 @@ BNZ                 010001 111 .. ..... ................    @bz
   HSUB_U            011110 111.. ..... ..... .....  010101  @3r
 
   SLDI              011110 0000 ...... ..... .....  011001  @elm_df
-  SPLATI            011110 0001 ...... ..... .....  011001  @elm_df
+  {
+    CFCMSA          011110 0001111110  ..... .....  011001  @elm
+    SPLATI          011110 0001 ...... ..... .....  011001  @elm_df
+  }
   {
     MOVE_V          011110 0010111110  ..... .....  011001  @elm
     COPY_S          011110 0010 ...... ..... .....  011001  @elm_df
diff --git a/target/mips/tcg/msa_translate.c b/target/mips/tcg/msa_translate.c
index 0655b61801b..56db02f73e7 100644
--- a/target/mips/tcg/msa_translate.c
+++ b/target/mips/tcg/msa_translate.c
@@ -35,7 +35,6 @@ enum {
 enum {
     /* ELM instructions df(bits 21..16) = _b, _h, _w, _d */
     OPC_CTCMSA      = (0x0 << 22) | (0x3E << 16) | OPC_MSA_ELM,
-    OPC_CFCMSA      = (0x1 << 22) | (0x3E << 16) | OPC_MSA_ELM,
 };
 
 static const char msaregnames[][6] = {
@@ -528,7 +527,6 @@ static void gen_msa_elm_3e(DisasContext *ctx)
     uint8_t source = (ctx->opcode >> 11) & 0x1f;
     uint8_t dest = (ctx->opcode >> 6) & 0x1f;
     TCGv telm = tcg_temp_new();
-    TCGv_i32 tsr = tcg_const_i32(source);
     TCGv_i32 tdt = tcg_const_i32(dest);
 
     switch (MASK_MSA_ELM_DF3E(ctx->opcode)) {
@@ -536,10 +534,6 @@ static void gen_msa_elm_3e(DisasContext *ctx)
         gen_load_gpr(telm, source);
         gen_helper_msa_ctcmsa(cpu_env, telm, tdt);
         break;
-    case OPC_CFCMSA:
-        gen_helper_msa_cfcmsa(telm, cpu_env, tsr);
-        gen_store_gpr(telm, dest);
-        break;
     default:
         MIPS_INVAL("MSA instruction");
         gen_reserved_instruction(ctx);
@@ -548,7 +542,24 @@ static void gen_msa_elm_3e(DisasContext *ctx)
 
     tcg_temp_free(telm);
     tcg_temp_free_i32(tdt);
-    tcg_temp_free_i32(tsr);
+}
+
+static bool trans_CFCMSA(DisasContext *ctx, arg_msa_elm *a)
+{
+    TCGv telm;
+
+    if (!check_msa_enabled(ctx)) {
+        return true;
+    }
+
+    telm = tcg_temp_new();
+
+    gen_helper_msa_cfcmsa(telm, cpu_env, tcg_constant_i32(a->ws));
+    gen_store_gpr(telm, a->wd);
+
+    tcg_temp_free(telm);
+
+    return true;
 }
 
 static bool trans_msa_elm_df(DisasContext *ctx, arg_msa_elm_df *a,
@@ -636,7 +647,7 @@ static void gen_msa_elm(DisasContext *ctx)
     uint8_t dfn = (ctx->opcode >> 16) & 0x3f;
 
     if (dfn == 0x3E) {
-        /* CTCMSA, CFCMSA */
+        /* CTCMSA */
         gen_msa_elm_3e(ctx);
         return;
     } else {
-- 
2.31.1


