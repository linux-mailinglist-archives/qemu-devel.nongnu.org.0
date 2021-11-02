Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FCE5442F8C
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Nov 2021 14:57:06 +0100 (CET)
Received: from localhost ([::1]:41686 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mhuHh-0001OC-Go
	for lists+qemu-devel@lfdr.de; Tue, 02 Nov 2021 09:57:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33898)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mhu4U-0000A2-EG
 for qemu-devel@nongnu.org; Tue, 02 Nov 2021 09:43:27 -0400
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335]:35490)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mhu4Q-00060t-Py
 for qemu-devel@nongnu.org; Tue, 02 Nov 2021 09:43:25 -0400
Received: by mail-wm1-x335.google.com with SMTP id
 77-20020a1c0450000000b0033123de3425so2008411wme.0
 for <qemu-devel@nongnu.org>; Tue, 02 Nov 2021 06:43:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=vrlE266b7OXg2/V52v1brIFbPFZKEknGt9V0I3M5muc=;
 b=NO1AUGGw7Md3Y3jN74ibN+c+Zz5HwY+s/ahJRo2a+QNKtshx3l8jbekZcwmX8nmzMA
 4JPyjt8nbYvgHlfuq03LS0sVGav8DbAMasFwEoctBOXYNFYf1+lz9E1V19iDXMhoBC4+
 yo1vjz6o16sHlHMR98zovtIgoKyQ0uX6sETUSKJM6HSMUrKG9pGQM2Y1GujKyOXvbOSO
 gm1VoWjorxCWP1rSAgoJCdBuPq8HAA+pZZY//qua/ey8APtJpcS+HRSl5OwztpeXn/yC
 fI3e/B07PUTLNR5ny/PJBIJs4jaY7mX3CQj4cRDnKyWTdMKi/0QDAeyOlwrN7VzE7Ml4
 HKPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=vrlE266b7OXg2/V52v1brIFbPFZKEknGt9V0I3M5muc=;
 b=vWWIv+VTScoQ9m6xnfDOmaVPzsXRpoPq+4hNV9v7LcQBeRD4OygGnM1D/8z4iwfVW+
 PDz+ZDfhKOkSfWznfMn15Br8wLWdYClvyL1znjejn2CTqfB6aZq3E+xy46Bc5QQ5Vz//
 n3rQaoTpNZQg3FUufUV18S3werjIBXbFberwJLYHhcIH3WH6hNWBNs9AZz3iXA9RcTq9
 ZaFHTdj9kMEb+ezNNX+ekdzfof3YUMYSdJZaUbyWy8s2HJdg4Pm+yynUxntNLP0o0DqZ
 cs98FGI516cQov3kglDStq49m9LrAqSl38Deqjvtq3RosSGYBmCubZ9pyjKHBgzScDbo
 L/jA==
X-Gm-Message-State: AOAM532vZcBzbgk6JGD5D2Sm6cIO+XLfkM7MbgSlbewDofmumB4R6sOb
 Vz6tTzTUBHD0z6fKYHKUBeqtCOhPAbs=
X-Google-Smtp-Source: ABdhPJxBYpLiFOjYIfks7nyUBYUI+fo1UwPsKDQ95alpb5e9bNDYn3LjLJDdVkaPUwrsRyfpqQ1ULw==
X-Received: by 2002:a05:600c:4fd4:: with SMTP id
 o20mr6956863wmq.175.1635860601287; 
 Tue, 02 Nov 2021 06:43:21 -0700 (PDT)
Received: from x1w.. (62.red-83-57-168.dynamicip.rima-tde.net. [83.57.168.62])
 by smtp.gmail.com with ESMTPSA id
 p12sm5997845wrr.10.2021.11.02.06.43.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Nov 2021 06:43:20 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PULL 08/41] target/mips: Have check_msa_access() return a boolean
Date: Tue,  2 Nov 2021 14:42:07 +0100
Message-Id: <20211102134240.3036524-9-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211102134240.3036524-1-f4bug@amsat.org>
References: <20211102134240.3036524-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x335.google.com
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

Have check_msa_access() return a boolean value so we can
return early if MSA is not enabled (the instruction got
decoded properly, but we raised an exception).

Reviewed-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-Id: <20211028210843.2120802-6-f4bug@amsat.org>
---
 target/mips/tcg/msa_translate.c | 25 ++++++++++++++++++-------
 1 file changed, 18 insertions(+), 7 deletions(-)

diff --git a/target/mips/tcg/msa_translate.c b/target/mips/tcg/msa_translate.c
index b135c58fd4f..e0ccd8c1cb8 100644
--- a/target/mips/tcg/msa_translate.c
+++ b/target/mips/tcg/msa_translate.c
@@ -295,19 +295,24 @@ void msa_translate_init(void)
     }
 }
 
-static inline int check_msa_access(DisasContext *ctx)
+/*
+ * Check if MSA is enabled.
+ * This function is always called with MSA available.
+ * If MSA is disabled, raise an exception.
+ */
+static inline bool check_msa_enabled(DisasContext *ctx)
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
@@ -339,7 +344,9 @@ static bool gen_msa_BxZ_V(DisasContext *ctx, int wt, int s16, TCGCond cond)
 {
     TCGv_i64 t0;
 
-    check_msa_access(ctx);
+    if (!check_msa_enabled(ctx)) {
+        return true;
+    }
 
     if (ctx->hflags & MIPS_HFLAG_BMASK) {
         gen_reserved_instruction(ctx);
@@ -371,7 +378,9 @@ static bool trans_BNZ_V(DisasContext *ctx, arg_msa_bz *a)
 
 static bool gen_msa_BxZ(DisasContext *ctx, int df, int wt, int s16, bool if_not)
 {
-    check_msa_access(ctx);
+    if (!check_msa_enabled(ctx)) {
+        return true;
+    }
 
     if (ctx->hflags & MIPS_HFLAG_BMASK) {
         gen_reserved_instruction(ctx);
@@ -2143,7 +2152,9 @@ static bool trans_MSA(DisasContext *ctx, arg_MSA *a)
 {
     uint32_t opcode = ctx->opcode;
 
-    check_msa_access(ctx);
+    if (!check_msa_enabled(ctx)) {
+        return true;
+    }
 
     switch (MASK_MSA_MINOR(opcode)) {
     case OPC_MSA_I8_00:
-- 
2.31.1


