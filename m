Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9004C43F16D
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Oct 2021 23:17:08 +0200 (CEST)
Received: from localhost ([::1]:53598 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mgCln-0006iG-JX
	for lists+qemu-devel@lfdr.de; Thu, 28 Oct 2021 17:17:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35078)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mgCe9-0006kj-Js
 for qemu-devel@nongnu.org; Thu, 28 Oct 2021 17:09:13 -0400
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436]:35474)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mgCe7-0004Wi-NC
 for qemu-devel@nongnu.org; Thu, 28 Oct 2021 17:09:13 -0400
Received: by mail-wr1-x436.google.com with SMTP id i5so4794432wrb.2
 for <qemu-devel@nongnu.org>; Thu, 28 Oct 2021 14:09:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=YAKg+J+/v36lzQhjd3D8tkZ+FOwUKvRjy9noDtRnWEA=;
 b=XwQQx1TDvgMuRglgi7abeLDaVeCCMmlk0jccUvA8TSnmm9FHvBzosstCUHpFYfFNR3
 1MTDlHpKywGVCtwmlHvmlReJpnITFPHqRhXs2XA/prczRP1luVYYcLgcwQvtwjfPY8sj
 eawORhqhpFoLpa8XYc6br9tITBg7SIgt0OjFEHGkkAExaAcA6aOfPOEKXN1WfeYes/KI
 j7Z0OMyt0FiP3ZJ+pQX2gC9Q/SEzx2v4ABn6djmzQG42Ls9GVEuCGErxmX7yjL6qUiYo
 U9PPbfUT4kvSQlYYH4o/W/XdeIsvMS0gEn6xziGgNBMjw/IUO5DJr3iLxvyPsSsuL8nO
 ocww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=YAKg+J+/v36lzQhjd3D8tkZ+FOwUKvRjy9noDtRnWEA=;
 b=UI3Dt53h2jdpCUWbJ+esFVcmCUYZOA+fv40m4Rs2y9Poy6c9y7vxPpf/pg79sHMxgc
 8JRZXaByb5fXf5q1hnKV62r5Qg6KmaKnm9eq9q/Cled5iiNfbfIoRdqQOy28b58H4FeU
 vF+Li+8JlZa2Kl2HqaEdv101qWvebYQ4xXFT3QzDae6dh3cVlE2VLWH3UKOPyMy+8QJu
 1QiDxDdhckAHCqbzbrQFjg4UFgFmgZe5bJnPepopYNAO5Lu7o5fPvG4NkzGJXQZZfisH
 aarObvq35vlA+n2jDinKNJyGrxBbFCbdCMFEjkSX1cPi0gxVjtj1gcZmaam2TL1345hJ
 Dewg==
X-Gm-Message-State: AOAM532qnrr95/JSnknlFe9NEbZRqZnCTT9l8A3DJbENjDvqfgx7yCel
 egWihyclAEBYzS+SE0Rv2EzIug7AvQw=
X-Google-Smtp-Source: ABdhPJz61yIdg0/AD5SLpJIUYcyyh6VsisNtGN2A4x8hzDmpgrnwUHz+oubSIIUXAmZuTKkChkw5hw==
X-Received: by 2002:a5d:6d0a:: with SMTP id e10mr8631741wrq.348.1635455350281; 
 Thu, 28 Oct 2021 14:09:10 -0700 (PDT)
Received: from x1w.redhat.com (62.red-83-57-168.dynamicip.rima-tde.net.
 [83.57.168.62])
 by smtp.gmail.com with ESMTPSA id k63sm7300090wme.22.2021.10.28.14.09.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Oct 2021 14:09:09 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 05/32] target/mips: Have check_msa_access() return a boolean
Date: Thu, 28 Oct 2021 23:08:16 +0200
Message-Id: <20211028210843.2120802-6-f4bug@amsat.org>
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

Have check_msa_access() return a boolean value so we can
return early if MSA is not enabled (the instruction got
decoded properly, but we raised an exception).

Reviewed-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-Id: <20211027180730.1551932-6-f4bug@amsat.org>
---
 target/mips/tcg/msa_translate.c | 25 ++++++++++++++++++-------
 1 file changed, 18 insertions(+), 7 deletions(-)

diff --git a/target/mips/tcg/msa_translate.c b/target/mips/tcg/msa_translate.c
index 6fefb06da7c..242d6ccf669 100644
--- a/target/mips/tcg/msa_translate.c
+++ b/target/mips/tcg/msa_translate.c
@@ -293,19 +293,24 @@ void msa_translate_init(void)
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
@@ -337,7 +342,9 @@ static bool gen_msa_BxZ_V(DisasContext *ctx, int wt, int s16, TCGCond cond)
 {
     TCGv_i64 t0;
 
-    check_msa_access(ctx);
+    if (!check_msa_enabled(ctx)) {
+        return true;
+    }
 
     if (ctx->hflags & MIPS_HFLAG_BMASK) {
         gen_reserved_instruction(ctx);
@@ -369,7 +376,9 @@ static bool trans_BNZ_V(DisasContext *ctx, arg_msa_bz *a)
 
 static bool gen_msa_BxZ(DisasContext *ctx, int df, int wt, int s16, bool if_not)
 {
-    check_msa_access(ctx);
+    if (!check_msa_enabled(ctx)) {
+        return true;
+    }
 
     if (ctx->hflags & MIPS_HFLAG_BMASK) {
         gen_reserved_instruction(ctx);
@@ -2141,7 +2150,9 @@ static bool trans_MSA(DisasContext *ctx, arg_MSA *a)
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


