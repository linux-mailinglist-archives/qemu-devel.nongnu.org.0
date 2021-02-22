Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EA4B532224D
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Feb 2021 23:44:31 +0100 (CET)
Received: from localhost ([::1]:57196 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lEJwM-00065S-Vv
	for lists+qemu-devel@lfdr.de; Mon, 22 Feb 2021 17:44:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45312)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lEJrU-000120-Db
 for qemu-devel@nongnu.org; Mon, 22 Feb 2021 17:39:28 -0500
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529]:34303)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lEJrT-0005TV-2D
 for qemu-devel@nongnu.org; Mon, 22 Feb 2021 17:39:28 -0500
Received: by mail-ed1-x529.google.com with SMTP id j9so23972759edp.1
 for <qemu-devel@nongnu.org>; Mon, 22 Feb 2021 14:39:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=xZ1YSX9ym8FOAoKObo8vcKmeS2B4Q8FgYrw++zm+/vQ=;
 b=qc1kVVUOf5dviUdeMihuPMM9PcIC/x2aPbe8ybOT54CTKwjHs9g+Wq1jL801s+xLKL
 K4u/xvZIzQ2LoAngG/r1onlHtRxrDwlG7Twghd3vZZiC6QLIzBZPKwaevIdvrohngWdT
 74BGR5y5GbaEEHT+8mg/pXiDUOJK0njo0NoqbTwGl4LihWpVT6FYDVx0MOtC/4nW8qQJ
 1C28aZEKfZtBUc+vj3WOhz8pEwFzU8T+aNByDTbbt0TzY3PIEl+ii0vw0Olsn8ym8VSe
 yep7cvvTuGhxOTIU10grEdD+h6WzrEVfty8+s3fxJP6jIPcQCZjrq8zwJbIgXNwDhlO3
 RGVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=xZ1YSX9ym8FOAoKObo8vcKmeS2B4Q8FgYrw++zm+/vQ=;
 b=DqIMcufvr1dLCDxyeofJTCQEmAJCbrcLtQMgfXt9prkljnRqTfDG61Z+e1Z7NlzMu+
 sCdPqG2QS7mzc0t4kA3LZgsyMwH4EMPN763HsWHa183U+/OXiFRAwyjIVbyWJ5MCGft/
 /Pl0mznKwNfajmGvYbBe9rjRpT96Bk+drwh1HcpwN5FvRXXxOo7OQA/IaXCxgPZDWd3j
 dn4g8SbCyrTXjA5cMMNBWPPVilqI2ycKLVAyWGOqPREjQxSEDwT8NswL9ypHEsGAEN15
 bcuem8BfuI72cEAcMDmgyaAXIWbkIformjphGuCxnE2rnV5EEdonWd4EbJSwfKMA9TZX
 XITA==
X-Gm-Message-State: AOAM532ARg9F1CvuzgPKLROcgJt0xFirKtK/EUPRaQqH0tcoqpV5KE45
 oi79upizzomlqjRuJVk90+yWNntPvpw=
X-Google-Smtp-Source: ABdhPJyEfLuNf8OcS9Ls0PC4rSG3qmRxMtlXDJxfVoPCU1A9MDKMJctDuXitzmv/QGJ13H+InbqZWA==
X-Received: by 2002:aa7:c9c9:: with SMTP id i9mr24540265edt.160.1614033565561; 
 Mon, 22 Feb 2021 14:39:25 -0800 (PST)
Received: from x1w.redhat.com (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id r23sm380098eds.76.2021.02.22.14.39.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Feb 2021 14:39:25 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 04/10] target/mips: Pass instruction opcode to
 decode_opc_mxu()
Date: Mon, 22 Feb 2021 23:38:55 +0100
Message-Id: <20210222223901.2792336-5-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210222223901.2792336-1-f4bug@amsat.org>
References: <20210222223901.2792336-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::529;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-ed1-x529.google.com
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
 Richard Henderson <richard.henderson@linaro.org>,
 Aurelien Jarno <aurelien@aurel32.net>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

In the next commit we'll make decode_opc_mxu() match decodetree
prototype by returning a boolean. First pass ctx->opcode as an
argument.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 target/mips/translate.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/target/mips/translate.c b/target/mips/translate.c
index 6f5ccd667da..9e875fa4a25 100644
--- a/target/mips/translate.c
+++ b/target/mips/translate.c
@@ -25780,17 +25780,17 @@ static void decode_opc_mxu__pool19(DisasContext *ctx)
 /*
  * Main MXU decoding function
  */
-static void decode_opc_mxu(DisasContext *ctx)
+static void decode_opc_mxu(DisasContext *ctx, uint32_t insn)
 {
-    uint32_t opcode = extract32(ctx->opcode, 0, 6);
+    uint32_t opcode = extract32(insn, 0, 6);
 
     if (opcode == OPC__MXU_MUL) {
         uint32_t  rs, rt, rd, op1;
 
-        rs = extract32(ctx->opcode, 21, 5);
-        rt = extract32(ctx->opcode, 16, 5);
-        rd = extract32(ctx->opcode, 11, 5);
-        op1 = MASK_SPECIAL2(ctx->opcode);
+        rs = extract32(insn, 21, 5);
+        rt = extract32(insn, 16, 5);
+        rd = extract32(insn, 11, 5);
+        op1 = MASK_SPECIAL2(insn);
 
         gen_arith(ctx, op1, rd, rs, rt);
 
@@ -26995,7 +26995,7 @@ static bool decode_opc_legacy(CPUMIPSState *env, DisasContext *ctx)
 #endif
 #if !defined(TARGET_MIPS64)
         if (ctx->insn_flags & ASE_MXU) {
-            decode_opc_mxu(ctx);
+            decode_opc_mxu(ctx, ctx->opcode);
             break;
         }
 #endif
-- 
2.26.2


