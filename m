Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E38F324467
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Feb 2021 20:08:43 +0100 (CET)
Received: from localhost ([::1]:51692 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lEzWc-0008R7-0p
	for lists+qemu-devel@lfdr.de; Wed, 24 Feb 2021 14:08:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45560)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lEzMK-00071w-HS
 for qemu-devel@nongnu.org; Wed, 24 Feb 2021 13:58:04 -0500
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335]:51287)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lEzMJ-0002uH-4p
 for qemu-devel@nongnu.org; Wed, 24 Feb 2021 13:58:04 -0500
Received: by mail-wm1-x335.google.com with SMTP id j187so2693508wmj.1
 for <qemu-devel@nongnu.org>; Wed, 24 Feb 2021 10:58:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=KUBPOuShU9WosAKj4v1xzYezj3Sf3FaFiGpD3EYrTQc=;
 b=gInBO7nOSVUd7lRBxOLMuybQZnTeve13QMrYYa3Fnkw5wjE7e84f5OQhspMzA1lJAq
 UHrbtG02+3wDuVshVMS4xYPfm/cWZEwSdP2RxXtutK0RQWsG99oAHP96BhvRJoCZuNXf
 eHMv+/r7ssrbSbjKGgp4QyLasxq6s8+R/UaopltpQ5AogT6TkcwCkfrSTOfA9SKIK62q
 OvwB/Sk8HOiQakA+voA1XmapN24euOq5fj+fz50BhQbIK6mr3K1M22VKwX1slTSJHeza
 A5/vcxmJtMDExBRJdSf8pd6Jjul5aYTulNJ7LigMQghHLqS+wOdEZ8mn6Aq4qBsMzU8q
 QtTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=KUBPOuShU9WosAKj4v1xzYezj3Sf3FaFiGpD3EYrTQc=;
 b=hxAkQ9VyzzJz/2+EODxjJ3vinrqk5p6M14mphu3peDeIjWZfdz56xTBoa4qNBbP3xG
 Q9WKK+0xMb/oFWu4RLdDK+UC86SVcd84JY3zYwHKQN98X+dmXkI4BvOxE7Ftar9Bk/Hq
 Qb5MNvVCcTZP6sOaJhyMjOUpyq+gbJ1vyBbDBNNihVs6E8x+DRAk5TZSK2obvA8QdsyV
 2/HwTvjpqKzpOW5apCCizhRPyiwVoU5NxD02XVpUmpa875/TY+xLcSTw0F3gKwS1oGdN
 nnkYYCcrSN0eNWAZF7iUNJ+Okd/9+tK6pNp70tenDLGKfwOC8A+Vpbd4wWaL3dzgzxMu
 CBcg==
X-Gm-Message-State: AOAM531jukFnFnvHBJ9Xc3RQeaaE1SQiBUYgi91R9VVqnV12hvHGGUud
 RxSf/CdBVhLE77e4jc0JRHLlQWeq8Q4=
X-Google-Smtp-Source: ABdhPJzIiM3LzqJcwuFI7YDHvFbZ0OLZDkSXv5lQOFL30uzV3U7+FKv36HhckwfolCsFT0vKernhhw==
X-Received: by 2002:a7b:ca47:: with SMTP id m7mr5234274wml.112.1614193081553; 
 Wed, 24 Feb 2021 10:58:01 -0800 (PST)
Received: from x1w.redhat.com (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id u8sm4733446wmb.36.2021.02.24.10.58.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Feb 2021 10:58:01 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 08/12] target/mips: Move MUL opcode check from decode_mxu()
 to decode_legacy()
Date: Wed, 24 Feb 2021 19:57:02 +0100
Message-Id: <20210224185706.3293058-9-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210224185706.3293058-1-f4bug@amsat.org>
References: <20210224185706.3293058-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x335.google.com
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

Move the check for MUL opcode from decode_opc_mxu() callee
to decode_opc_legacy() caller, so we can simplify the ifdef'ry
and elide the call in few commits.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 target/mips/translate.c | 19 +++++--------------
 1 file changed, 5 insertions(+), 14 deletions(-)

diff --git a/target/mips/translate.c b/target/mips/translate.c
index 2d8ddbad112..df4868ebb95 100644
--- a/target/mips/translate.c
+++ b/target/mips/translate.c
@@ -25783,19 +25783,6 @@ static void decode_opc_mxu(DisasContext *ctx, uint32_t insn)
 {
     uint32_t opcode = extract32(insn, 0, 6);
 
-    if (MASK_SPECIAL2(insn) == OPC_MUL) {
-        uint32_t  rs, rt, rd, op1;
-
-        rs = extract32(insn, 21, 5);
-        rt = extract32(insn, 16, 5);
-        rd = extract32(insn, 11, 5);
-        op1 = MASK_SPECIAL2(insn);
-
-        gen_arith(ctx, op1, rd, rs, rt);
-
-        return;
-    }
-
     if (opcode == OPC_MXU_S32M2I) {
         gen_mxu_s32m2i(ctx);
         return;
@@ -26994,7 +26981,11 @@ static bool decode_opc_legacy(CPUMIPSState *env, DisasContext *ctx)
 #endif
 #if !defined(TARGET_MIPS64)
         if (ctx->insn_flags & ASE_MXU) {
-            decode_opc_mxu(ctx, ctx->opcode);
+            if (MASK_SPECIAL2(ctx->opcode) == OPC_MUL) {
+                gen_arith(ctx, OPC_MUL, rd, rs, rt);
+            } else {
+                decode_opc_mxu(ctx, ctx->opcode);
+            }
             break;
         }
 #endif
-- 
2.26.2


