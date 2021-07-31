Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DAFA3DC65A
	for <lists+qemu-devel@lfdr.de>; Sat, 31 Jul 2021 16:43:11 +0200 (CEST)
Received: from localhost ([::1]:48420 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m9qCj-0006ey-NT
	for lists+qemu-devel@lfdr.de; Sat, 31 Jul 2021 10:43:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44336)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1m9qBg-0005zr-Qy
 for qemu-devel@nongnu.org; Sat, 31 Jul 2021 10:42:04 -0400
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434]:36847)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1m9qBf-0007Ny-9F
 for qemu-devel@nongnu.org; Sat, 31 Jul 2021 10:42:04 -0400
Received: by mail-wr1-x434.google.com with SMTP id b13so4450642wrs.3
 for <qemu-devel@nongnu.org>; Sat, 31 Jul 2021 07:42:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=v4M5nPwC1MTWjOUzg3TV9gA1jM3JQZR5Hp8aA3e0qkM=;
 b=MOb7D4zswzP8zwKLIX9VREgM/GWW0afVTbFNMv7P5qy3leT5sXk600B/2UyKdZlSVF
 PS2yEXu5QF2Q/6va/T+8Q2E1IuDFUGkjk7tlj3qQuOEAODCo9/wPae1I35V+QNDUL60Z
 NhN4cpuNE0u6xKDNdYKAlsyyeZ/XB0dOS9UPELrusYctvohAcNvijFJwxPakyE3GAiNw
 LaKy3cwnQdACuC1nLOcIysPN0YHDBdOQpYi+z36ekXsMjyRhIyOPkmaVyjbvh9gBqW5z
 QhPVhp9CgueW7cmNH729OD81mxOlZGHM5PC5kLTCRtrPThp9KpmqqeDkDSEOA6yUp2La
 naNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=v4M5nPwC1MTWjOUzg3TV9gA1jM3JQZR5Hp8aA3e0qkM=;
 b=fomwJbufiR3GQbwFnem0mda682k7Kpm51N0ZHvaLyObbYlBo6NQutDElxRNSmeUsUZ
 sHw96zzIVRCw2+1TEURAhH4BUhlwIn4fTq1AMF/jW1vKBlLuCM8oogaf/HELdTNj1Jbl
 RTy6kegp4xYyOuLkU4st0PWzNSm64Rh+KZVZFvRQW4dDGYn8e+hR0VU4BaUjdmW6Edq9
 EzXAaN/avox9teQ2xbwKfXKzb7X42X9R7rgD7bdpQ/vpZWraNzPWxIwbpEo2ExkDPi9C
 ORDYl4FVHw3pijqQfOlCKrmpj1AmxnEp9s0FoHK57sFeXko6+Gj2l9T0PyG8RuxG9GmN
 wezw==
X-Gm-Message-State: AOAM533BVzZVSRdXbFh1QYdXupaMupSa6J3ZiziEAzgEFHZQc7p5wUOe
 ZeUNJyBjYLAybXjzkhRgwQF8cHL16WfovQ==
X-Google-Smtp-Source: ABdhPJxWoZB56KxN3F/YKiNWuew5Gj+IP7ofs2bWSb9hx6H3E/DQkZqurs+jKLadMH4HBALSJuzxeA==
X-Received: by 2002:adf:9d88:: with SMTP id p8mr8811204wre.409.1627742521410; 
 Sat, 31 Jul 2021 07:42:01 -0700 (PDT)
Received: from x1w.. (122.red-83-42-66.dynamicip.rima-tde.net. [83.42.66.122])
 by smtp.gmail.com with ESMTPSA id
 s1sm4957066wmj.8.2021.07.31.07.41.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 31 Jul 2021 07:42:00 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH-for-6.1?] target/mips: Remove MOVZ/MOVN opcodes from Loongson
 2E
Date: Sat, 31 Jul 2021 16:41:55 +0200
Message-Id: <20210731144155.2738493-1-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x434.google.com
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
 Huacai Chen <chenhuacai@kernel.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Per the "Godson-2E User Manual v0.6", the Loongson 2E processor
does not implement the MOVZ/MOVN instructions

However it's enhanced version, the STLS2F01 processor, does.
See STLS2F01 User Manual (rev 1), chapter 13.1 "The compliance
overview":

  The STLS2F01 processor implements several special MIPS IV
  instructions as the supplement to the MIPS III instructions.
  These instructions include two MIPS IV instructions (i.e. MOVZ
  and MOVNZ) ...

Fixes: aa8f40090ab ("target-mips: enable movn/movz on loongson 2E & 2F")
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 target/mips/tcg/translate.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/target/mips/tcg/translate.c b/target/mips/tcg/translate.c
index bf71724f3f0..34a96159d15 100644
--- a/target/mips/tcg/translate.c
+++ b/target/mips/tcg/translate.c
@@ -14156,8 +14156,7 @@ static void decode_opc_special_legacy(CPUMIPSState *env, DisasContext *ctx)
     switch (op1) {
     case OPC_MOVN:         /* Conditional move */
     case OPC_MOVZ:
-        check_insn(ctx, ISA_MIPS4 | ISA_MIPS_R1 |
-                   INSN_LOONGSON2E | INSN_LOONGSON2F);
+        check_insn(ctx, ISA_MIPS4 | ISA_MIPS_R1 | INSN_LOONGSON2F);
         gen_cond_move(ctx, op1, rd, rs, rt);
         break;
     case OPC_MFHI:          /* Move from HI/LO */
-- 
2.31.1


