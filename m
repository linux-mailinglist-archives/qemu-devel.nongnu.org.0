Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 976003DC154
	for <lists+qemu-devel@lfdr.de>; Sat, 31 Jul 2021 00:56:15 +0200 (CEST)
Received: from localhost ([::1]:57690 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m9bQM-00006r-4e
	for lists+qemu-devel@lfdr.de; Fri, 30 Jul 2021 18:56:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42930)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1m9bPR-0007ex-TE
 for qemu-devel@nongnu.org; Fri, 30 Jul 2021 18:55:17 -0400
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331]:55257)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1m9bPQ-0003Lv-0F
 for qemu-devel@nongnu.org; Fri, 30 Jul 2021 18:55:17 -0400
Received: by mail-wm1-x331.google.com with SMTP id b128so6862263wmb.4
 for <qemu-devel@nongnu.org>; Fri, 30 Jul 2021 15:55:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=K1Lp6dR6470DOf4IKPk+V0JlPZFU/7h3vubagA5N4f4=;
 b=TquC3Mkl7nu6P6JvACZO2deXWHrQT24YHqLgXuP4TNgrTfxXxeMa9LiGIyykpJcGbW
 pncs1eSLlRoqoeCf4IsFmU2F7zyilZQYqyniHFIYpOYaVvtdptAfb+awJ30wwCiJLP2a
 /NyVOw2eE8Alo9fS87tOsfRFRYeB3mTApmolVbMivlUngLk//11WlB0593qDipLlCkQl
 sLimvRp9KXVGL8WypJ43x/ZhQ5P5NRq9tmjUI5akSzr6Y+sYPwxYNNiGhHPRB5vUdFAB
 rsYF9ASqOvjIRZScTZ+seTjNsS51ZBQaaswdHWf/OYsoBOdoUViMpHjuhxsEz+jRTPZP
 6wsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=K1Lp6dR6470DOf4IKPk+V0JlPZFU/7h3vubagA5N4f4=;
 b=SShMSgZNHLwtHIKGMFiRsT+S2QO5jNrhf9Bs9eeTs7QaD4o776Rs2ZC1kROh4Gk8+D
 yZR8UHhjscu61JU/72jorS0L1UK/5ZtCFg4ILI6TEDdh2iptekoC7P4MIbKGifuBucV1
 j8UI5nkVilRN6c6OlfR/EkkuZSo+xEdNoZW6M4E0N+o34LUuKI3bSDHwAMBwjSWw+gnE
 M8XT96O68KDVomyo1x/StfharmBEODZoD6Gdl/kv3SswyGX2SLToj/KFDqjcFvVk+TpQ
 ohR6+YOq8FmorjXlpBb+8FwZkTKqAjso+7s/qcN4+jIKu9S26Wh1n3gCJw5/46LVEild
 MRog==
X-Gm-Message-State: AOAM532i1dz+t9cchMpnzU3+F87dZJb01gqI6n8/zQvklGZJQTTRB2tL
 AC0Lyo8lDdpyPQoJv9UwUrkADXuG+UVAWQ==
X-Google-Smtp-Source: ABdhPJwjpQi2QIjWsH4oZv2KJo8gTwBWCxTVYy3fHmcftHyywTUb8x41wq0Ln2H3aNuz+bL7zECqfw==
X-Received: by 2002:a05:600c:322a:: with SMTP id
 r42mr5706498wmp.153.1627685713094; 
 Fri, 30 Jul 2021 15:55:13 -0700 (PDT)
Received: from x1w.. (122.red-83-42-66.dynamicip.rima-tde.net. [83.42.66.122])
 by smtp.gmail.com with ESMTPSA id
 c10sm3004683wmb.40.2021.07.30.15.55.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Jul 2021 15:55:12 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH] target/mips: Remove JR opcode unused arguments
Date: Sat, 31 Jul 2021 00:55:07 +0200
Message-Id: <20210730225507.2642827-1-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x331.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
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
 Richard Henderson <richard.henderson@linaro.org>,
 Aurelien Jarno <aurelien@aurel32.net>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

JR opcode (Jump Register) only takes 1 argument, $rs.
JALR (Jump And Link Register) takes 3: $rs, $rd and $hint.

Commit 6af0bf9c7c3 added their processing into decode_opc() as:

    case 0x08 ... 0x09: /* Jumps */
        gen_compute_branch(ctx, op1 | EXT_SPECIAL, rs, rd, sa);

having both opcodes handled in the same function: gen_compute_branch.

Per JR encoding, both $rd and $hint ('sa') are decoded as zero.

Later this code got extracted to decode_opc_special(),
commit 7a387fffce5 used definitions instead of magic values:

    case OPC_JR ... OPC_JALR:
        gen_compute_branch(ctx, op1, rs, rd, sa);

Finally commit 0aefa33318b moved OPC_JR out of decode_opc_special,
to a new 'decode_opc_special_legacy' function:

  @@ -15851,6 +15851,9 @@ static void decode_opc_special_legacy(CPUMIPSState *env, DisasContext *ctx)
  +    case OPC_JR:
  +        gen_compute_branch(ctx, op1, 4, rs, rd, sa);
  +        break;

  @@ -15933,7 +15936,7 @@ static void decode_opc_special(CPUMIPSState *env, DisasContext *ctx)
  -    case OPC_JR ... OPC_JALR:
  +    case OPC_JALR:
           gen_compute_branch(ctx, op1, 4, rs, rd, sa);
           break;

Since JR is now handled individually, it is pointless to decode
and pass it unused arguments. Replace them by simple zero value
to avoid confusion with this opcode.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 target/mips/tcg/translate.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/mips/tcg/translate.c b/target/mips/tcg/translate.c
index 5b03545f099..bf71724f3f0 100644
--- a/target/mips/tcg/translate.c
+++ b/target/mips/tcg/translate.c
@@ -14203,7 +14203,7 @@ static void decode_opc_special_legacy(CPUMIPSState *env, DisasContext *ctx)
         break;
 #endif
     case OPC_JR:
-        gen_compute_branch(ctx, op1, 4, rs, rd, sa, 4);
+        gen_compute_branch(ctx, op1, 4, rs, 0, 0, 4);
         break;
     case OPC_SPIM:
 #ifdef MIPS_STRICT_STANDARD
-- 
2.31.1


