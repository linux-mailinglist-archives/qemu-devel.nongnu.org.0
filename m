Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E756324434
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Feb 2021 19:59:41 +0100 (CET)
Received: from localhost ([::1]:60694 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lEzNs-0008LH-5K
	for lists+qemu-devel@lfdr.de; Wed, 24 Feb 2021 13:59:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45480)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lEzMA-0006g7-8h
 for qemu-devel@nongnu.org; Wed, 24 Feb 2021 13:57:54 -0500
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332]:54546)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lEzM8-0002q5-QF
 for qemu-devel@nongnu.org; Wed, 24 Feb 2021 13:57:53 -0500
Received: by mail-wm1-x332.google.com with SMTP id u187so768141wmg.4
 for <qemu-devel@nongnu.org>; Wed, 24 Feb 2021 10:57:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=3wgVFWl1ooSOtrFHyjc6vBbkl1t0wg7aCFfvYF/8BTs=;
 b=n0pfoac3jhd1Eg9gbHd1mY14EfdI4Jd3eX8unnWoKg6rs9RYvzQCnG4EShgftX0KEQ
 pShWMmrO6NqAw3CBlAw+Yic0Z9sckfXuTw81msET/dZySpFj94SBs1f/QEh4EDc9EruB
 f3lHh2cALbeV3pLMfO/rtMaCY/Qqnqsflmxvv0b6+ImjL6rpNdI3/BQu/G8WEsQxZrUI
 NySYcTcDF0h7tc4rNLXMisP74ZJmOSFPOXqseP6bGXqacNo88uJmv7oXcq6M+7MZR60z
 S5WgOoRQls1no/JI/csUXPLzsCOJXR/pzdYKBmkutjhmgnu0eBq0qYYJ8zD/XCsdatpT
 XVng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=3wgVFWl1ooSOtrFHyjc6vBbkl1t0wg7aCFfvYF/8BTs=;
 b=Mj4HBwVfoFRrg9bm35OSZTTo2KhbUXDcApyLBTM6nGm6WqC+uO+yrX+RPexScwphED
 ++08A9eDVP9SIguEFwyW5xdr5oxnV9b8Ucaf/xUypf0j9qBDe9cYqIDiKV9TsDkNXMAk
 JTE/YyeE6DPXRvp4uu3RYXKDuonc7H/dwY2kq5hM8tj/EfuHcBQT5N1SntpSZqNA89NN
 067SbOsdce+pn2LHbHIvHqtxqQAt3iTrv2smx9CzRzK0gBcCpiojYUxE4GmUMm8ptdMr
 pt+eM/2puLp4zwxjYEAVbywOhvTZMTl3SN65cdCh5REoQrhbf978Gjp0MC+27P5w/UcM
 a/Gg==
X-Gm-Message-State: AOAM53324johbE9+tayzeyuo55x46P0/OAZGS9c0yFz7Ur47ygYqdfx/
 6Sm1SIlNRE1GVGtvtIWwvYsXjSDYtTM=
X-Google-Smtp-Source: ABdhPJwpMR7nagoOry6ZjipA1XQPe/awsiedqf+Z13FhYzClm6XhqOcB+u+3TApFJDVu4BxN2DNb2w==
X-Received: by 2002:a1c:b604:: with SMTP id g4mr4929090wmf.145.1614193071318; 
 Wed, 24 Feb 2021 10:57:51 -0800 (PST)
Received: from x1w.redhat.com (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id 7sm5047264wmi.27.2021.02.24.10.57.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Feb 2021 10:57:50 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 06/12] target/mips: Pass instruction opcode to
 decode_opc_mxu()
Date: Wed, 24 Feb 2021 19:57:00 +0100
Message-Id: <20210224185706.3293058-7-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210224185706.3293058-1-f4bug@amsat.org>
References: <20210224185706.3293058-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x332.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
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
 Craig Janeczek <jancraig@amazon.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

In the next commit we'll make decode_opc_mxu() match decodetree
prototype by returning a boolean. First pass ctx->opcode as an
argument.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
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


