Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AE07A3F7586
	for <lists+qemu-devel@lfdr.de>; Wed, 25 Aug 2021 15:04:11 +0200 (CEST)
Received: from localhost ([::1]:40586 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mIsZZ-0000Wj-KT
	for lists+qemu-devel@lfdr.de; Wed, 25 Aug 2021 09:04:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50430)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mIsXu-00068n-U7
 for qemu-devel@nongnu.org; Wed, 25 Aug 2021 09:02:22 -0400
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c]:46930)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mIsXs-0002CM-OU
 for qemu-devel@nongnu.org; Wed, 25 Aug 2021 09:02:22 -0400
Received: by mail-wr1-x42c.google.com with SMTP id f5so36293661wrm.13
 for <qemu-devel@nongnu.org>; Wed, 25 Aug 2021 06:02:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ozvFF/netK8EPevDtGVOynp+B+FU28R7NPCc/yQa1nA=;
 b=NxHrUaVBVVUyQ052hmm0+FQslu/un1A32Ei/j+4BUfM6Qjndd7UxcdRF0+hbgM1TYx
 37jvoKKdeeDb4QChaydDOap/9DHH8mp5bvOD5MMaK6pJwzx3H9L9nxECEbFf6yD1VzUe
 lFQ120TYGvw9crnDm3F1/0x3uDwLpJSbC5991kigjQkXfCvLeRggPAhDlhJxsvSdr9fv
 WQ0nkhl2cZWxcEQT6lR+RVIh1DqRcfvzce+Aj/FR0MNdf67ud46ydLGcUxwSajKyuuA4
 i5S+KTYSf9lCqj4oD/G0ehEUI5G0+uW53g7CWZEVT1KujLWQQgKsP0B8tGg95c4WGXuS
 HIzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=ozvFF/netK8EPevDtGVOynp+B+FU28R7NPCc/yQa1nA=;
 b=sWd6+hYxFLQNSOUmviC2k5xccU32wu7xAOLYYKrUinZIA3gBIwdCRiCVIt3cFJqzB+
 5UPMa2aBazvyQR1UY3Tz4PvbAeiPhxybpuWkjJsnxO/QGWlNfcwnWquZ7fmfCTw1lbe3
 SjfoEABIU7BaU/cyC00dPhLqGQTZTDRBc+UXLMbdXPvZwDcR2+GPAWegEJQ9Q/uC5DH7
 IYeFtcOoE7AWSGHZ2NygZXrpDPam0evQRzFV7LPh/DcA4LzXQO3kjJjuHKNWavLUVPxV
 6ce/ZPFTe2Dbs0q/zCpcjMdBKFixjyK+jc5bjAthMrp3hon+oWq4EQfX6Fd3b2iv++Cd
 w0Kw==
X-Gm-Message-State: AOAM533EkZ/3bl38f+D0DqB0lImFI4LBaoZq2zUuyj8ubnqv/Jive8Hd
 nom1withkzIHqq6GBz9dJYurwmcF/PQ=
X-Google-Smtp-Source: ABdhPJyMBTrz2pEqFDfUQ4ks38YWd16JJ4eH5gzJhcIi4miqd6nzFqVDeGDHH1fWbNAOmyUCd+SDmw==
X-Received: by 2002:a5d:590b:: with SMTP id v11mr20100295wrd.125.1629896538734; 
 Wed, 25 Aug 2021 06:02:18 -0700 (PDT)
Received: from x1w.. (163.red-83-52-55.dynamicip.rima-tde.net. [83.52.55.163])
 by smtp.gmail.com with ESMTPSA id
 p12sm4769102wmq.44.2021.08.25.06.02.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Aug 2021 06:02:18 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PULL 01/28] target/mips: Remove JR opcode unused arguments
Date: Wed, 25 Aug 2021 15:01:44 +0200
Message-Id: <20210825130211.1542338-2-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210825130211.1542338-1-f4bug@amsat.org>
References: <20210825130211.1542338-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42c.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
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
Cc: Aurelien Jarno <aurelien@aurel32.net>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Richard Henderson <richard.henderson@linaro.org>,
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
Message-Id: <20210730225507.2642827-1-f4bug@amsat.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
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


