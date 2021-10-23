Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 053BE4385A0
	for <lists+qemu-devel@lfdr.de>; Sat, 23 Oct 2021 23:56:48 +0200 (CEST)
Received: from localhost ([::1]:36636 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1meP0R-0007wJ-2Q
	for lists+qemu-devel@lfdr.de; Sat, 23 Oct 2021 17:56:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40728)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1meOsS-0003rT-Us
 for qemu-devel@nongnu.org; Sat, 23 Oct 2021 17:48:32 -0400
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433]:36692)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1meOsR-0005Do-DL
 for qemu-devel@nongnu.org; Sat, 23 Oct 2021 17:48:32 -0400
Received: by mail-wr1-x433.google.com with SMTP id w15so1134532wra.3
 for <qemu-devel@nongnu.org>; Sat, 23 Oct 2021 14:48:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=qpC85BtT3RgnbykCXVzDyO1CuhDm3xChbP8VfA4crRw=;
 b=HOGkbCqehWu0/fWcBYvuPsDx0nzee8arZGA1+R3W7hRZs70OFMuJmaG61va9C0hitT
 9hRCZckvDEGkgDkwSMxs79pJQ5v95Iu9M9kSoSGIx1sZ6eHhS1NehFJtGav1eFwd2SEn
 GN7yjNwCeI1Pf588p2H/7j+w+DL9Roc+Xz9VRUy2AzYa9Ts2yOIl4mwb1WbVVs8xjhCK
 znTj4Psjk3WWeWUBeWpEUQ6t7hwaJiRfPyplVrFHLBjFObAPIoApo+2KdXzCGZRtXALz
 tG4+qxICGNwOfawEF3xheMyfJcZU0FkLIiGHDchEG8JeL/T3c63s9UPRQM91/MpKSwvd
 N69g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=qpC85BtT3RgnbykCXVzDyO1CuhDm3xChbP8VfA4crRw=;
 b=nkiMzK3AU3copwOkJurgEZMZ9hQa77i1K657yepsmXMWNnWrlmuyHXLPQzb4X/jeLZ
 Uby0VKKRWJ667mamwna/0nnSVHmMwiIoYrt81pewDYN7DqG05kDhHWQP7L+aVhZ7kol1
 nJDSmQQaD4oTd69WviUsioW6YF8hcjhBkyV4RMp8sT9RCFDJhURGA2Ne0WsWIylqvLH0
 ABV9XS5BPPrk+Oxa1tUO1zJWqtl9josuB3Z/hHIabn6+YR04pUeKqbYIrMUb+3WUn+V+
 jPPo/UiOLx6DgFuMv30PLT+OZPRDJZjWFpFGrEvhZaZ3MhbfjBYSSCELHpxofcwcl48E
 mTKw==
X-Gm-Message-State: AOAM531vG3qUA/3afR6fE+zrPJK0uH2SzSGNKHIGBnya1BAFO5VnyU5z
 UbB/9qMHTDSB5EelTaY2rCoY6x9aoVo=
X-Google-Smtp-Source: ABdhPJxG3BQNeXCzCm6iEuG7LbOJOHJ7uaI1f+fA4opBvNGvuA8GJ78yeyoZ5JGoMI1szs2KrMExew==
X-Received: by 2002:adf:fd8a:: with SMTP id d10mr10407145wrr.213.1635025709911; 
 Sat, 23 Oct 2021 14:48:29 -0700 (PDT)
Received: from x1w.. (62.red-83-57-168.dynamicip.rima-tde.net. [83.57.168.62])
 by smtp.gmail.com with ESMTPSA id
 o10sm12996960wmq.46.2021.10.23.14.48.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 23 Oct 2021 14:48:29 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 05/33] target/mips: Have check_msa_access() return a boolean
Date: Sat, 23 Oct 2021 23:47:35 +0200
Message-Id: <20211023214803.522078-6-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211023214803.522078-1-f4bug@amsat.org>
References: <20211023214803.522078-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x433.google.com
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
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Luis Pires <luis.pires@eldorado.org.br>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Have check_msa_access() return a boolean value so we can
return early if MSA is not enabled.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 target/mips/tcg/msa_translate.c | 20 +++++++++++++-------
 1 file changed, 13 insertions(+), 7 deletions(-)

diff --git a/target/mips/tcg/msa_translate.c b/target/mips/tcg/msa_translate.c
index 3ef912da6b8..9e0a08fe335 100644
--- a/target/mips/tcg/msa_translate.c
+++ b/target/mips/tcg/msa_translate.c
@@ -293,19 +293,19 @@ void msa_translate_init(void)
     }
 }
 
-static inline int check_msa_access(DisasContext *ctx)
+static inline bool check_msa_access(DisasContext *ctx)
 {
     if (unlikely((ctx->hflags & MIPS_HFLAG_FPU) &&
                  !(ctx->hflags & MIPS_HFLAG_F64))) {
         gen_reserved_instruction(ctx);
-        return 0;
+        return false;
     }
 
     if (unlikely(!(ctx->hflags & MIPS_HFLAG_MSA))) {
         generate_exception_end(ctx, EXCP_MSADIS);
-        return 0;
+        return false;
     }
-    return 1;
+    return true;
 }
 
 static void gen_check_zero_element(TCGv tresult, uint8_t df, uint8_t wt,
@@ -354,7 +354,9 @@ static bool gen_msa_BxZ_V(DisasContext *ctx, int wt, int s16, TCGCond cond)
 {
     TCGv_i64 t0;
 
-    check_msa_access(ctx);
+    if (!check_msa_access(ctx)) {
+        return false;
+    }
 
     if (ctx->hflags & MIPS_HFLAG_BMASK) {
         gen_reserved_instruction(ctx);
@@ -386,7 +388,9 @@ static bool trans_BNZ_V(DisasContext *ctx, arg_msa_bz *a)
 
 static bool gen_msa_BxZ(DisasContext *ctx, int df, int wt, int s16, bool if_not)
 {
-    check_msa_access(ctx);
+    if (!check_msa_access(ctx)) {
+        return false;
+    }
 
     if (ctx->hflags & MIPS_HFLAG_BMASK) {
         gen_reserved_instruction(ctx);
@@ -2158,7 +2162,9 @@ static bool trans_MSA(DisasContext *ctx, arg_MSA *a)
 {
     uint32_t opcode = ctx->opcode;
 
-    check_msa_access(ctx);
+    if (!check_msa_access(ctx)) {
+        return false;
+    }
 
     switch (MASK_MSA_MINOR(opcode)) {
     case OPC_MSA_I8_00:
-- 
2.31.1


