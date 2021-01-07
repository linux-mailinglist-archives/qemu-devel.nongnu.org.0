Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 430902EE95F
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Jan 2021 23:58:21 +0100 (CET)
Received: from localhost ([::1]:51348 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kxeEW-0007Rt-8y
	for lists+qemu-devel@lfdr.de; Thu, 07 Jan 2021 17:58:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47742)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kxdlD-0005KU-G8
 for qemu-devel@nongnu.org; Thu, 07 Jan 2021 17:28:03 -0500
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332]:33293)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kxdlB-0006ZO-Sr
 for qemu-devel@nongnu.org; Thu, 07 Jan 2021 17:28:03 -0500
Received: by mail-wm1-x332.google.com with SMTP id n16so5685638wmc.0
 for <qemu-devel@nongnu.org>; Thu, 07 Jan 2021 14:28:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=85d5cVtyUsTX7S7LbQY+InlQNjjtHltMndZsoNBoSL4=;
 b=nraN2mOVUcgRgNgyVYJJSc9AtepJctiYv3inK3boLA2ZJ5R3teD2lWbDuOhqftYs4K
 aljUHeg2H14Qv7vammJ9Idv6h05/oXhGAm9OtTOebDKiVNp+B+A8FEb5pABUCP7izrju
 g62dDfEKVKuTYpF0OhcN8edwK9PN3DtdyB3deImtoW60QwcUhY3+EiSnGamg8NL7rBhW
 Z/YmYr8RylFv1/efu4dPwZB07/1+dwV/0nrqEhqgSBMPpzKtxAdEZSXBSsOYeWXBjPrS
 WEh7NaVbWnHCmc3TwNp0JOMoM45wcZ9HK4/r1MqlKEvMueeHNT7Ln9Ln6y89nhQdsMmg
 766Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=85d5cVtyUsTX7S7LbQY+InlQNjjtHltMndZsoNBoSL4=;
 b=QfiJsipcX32rnk3UGtM95EjWVsyPWOg0PlAcgxH7/4FTgG9PF7KGp8LDwZAvgNYYUR
 ft7sOWmwkixL6GhILzuYWW1uZ0jnzWZtgwHo/U2cqitghnFif0YwIgtR2uybuQBEPPbg
 +A/oFNp26reVoEm8nfvBDX61OjZKriO1V4Ouhveyl2H3wdcGpgIhpP0xdkZtQpPfzujE
 beyFJ2ENDjgoTQufAsQt6F+XB2kssFx7ew6ST3AT6lYt6T4ave3xIX63Wec5Ewnrz5wk
 4W8XVp/sfop4vcyGPS0HYl4ealpeQTpdmF3IZgyBej+1DnJXG0xt/+6m7zxWy40VLFXm
 BeYA==
X-Gm-Message-State: AOAM533+76p2mKNxUVU7Wrcn+d6IPIxHpnqj+34ggvVIa1ETNXf8yjO7
 v5/XSD+/1n6a3e7VdZ3rA1OV1wC2sZA=
X-Google-Smtp-Source: ABdhPJy7r2Dm8szonCZjGKKtJ+ouK1+WaygeHI3YzUMw65d3dheae2KjeyNpEeIr7uKkwkIWUfRTXA==
X-Received: by 2002:a1c:1fc2:: with SMTP id f185mr533619wmf.134.1610058480374; 
 Thu, 07 Jan 2021 14:28:00 -0800 (PST)
Received: from x1w.redhat.com (241.red-88-10-103.dynamicip.rima-tde.net.
 [88.10.103.241])
 by smtp.gmail.com with ESMTPSA id z6sm9175402wmi.15.2021.01.07.14.27.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Jan 2021 14:27:59 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PULL 59/66] target/mips: Convert Rel6 COP1X opcode to decodetree
Date: Thu,  7 Jan 2021 23:22:46 +0100
Message-Id: <20210107222253.20382-60-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210107222253.20382-1-f4bug@amsat.org>
References: <20210107222253.20382-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x332.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248,
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
 Paul Burton <paulburton@kernel.org>, kvm@vger.kernel.org,
 libvir-list@redhat.com, Huacai Chen <chenhuacai@kernel.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

COP1x opcode has been removed from the Release 6.

Add a single decodetree entry for it, triggering
Reserved Instruction if ever used.

Remove unreachable check_insn_opc_removed() call.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20201208203704.243704-8-f4bug@amsat.org>
---
 target/mips/mips32r6.decode | 2 ++
 target/mips/translate.c     | 1 -
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/target/mips/mips32r6.decode b/target/mips/mips32r6.decode
index 259bac612ab..7b12a1bff25 100644
--- a/target/mips/mips32r6.decode
+++ b/target/mips/mips32r6.decode
@@ -16,4 +16,6 @@
 
 LSA                 000000 ..... ..... ..... 000 .. 000101  @lsa
 
+REMOVED             010011 ----- ----- ----- ----- ------   # COP1X (COP3)
+
 REMOVED             011100 ----- ----- ----- ----- ------   # SPECIAL2
diff --git a/target/mips/translate.c b/target/mips/translate.c
index 01c1ee546e2..52397bce84b 100644
--- a/target/mips/translate.c
+++ b/target/mips/translate.c
@@ -28827,7 +28827,6 @@ static bool decode_opc_legacy(CPUMIPSState *env, DisasContext *ctx)
         break;
 
     case OPC_CP3:
-        check_insn_opc_removed(ctx, ISA_MIPS_R6);
         if (ctx->CP0_Config1 & (1 << CP0C1_FP)) {
             check_cp1_enabled(ctx);
             op1 = MASK_CP3(ctx->opcode);
-- 
2.26.2


