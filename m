Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CB8D42CD32
	for <lists+qemu-devel@lfdr.de>; Thu, 14 Oct 2021 00:00:57 +0200 (CEST)
Received: from localhost ([::1]:39668 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mamIy-0001r3-H3
	for lists+qemu-devel@lfdr.de; Wed, 13 Oct 2021 18:00:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48534)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mamF9-0005sp-CD
 for qemu-devel@nongnu.org; Wed, 13 Oct 2021 17:56:59 -0400
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c]:34805)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mamF7-0002ws-KW
 for qemu-devel@nongnu.org; Wed, 13 Oct 2021 17:56:58 -0400
Received: by mail-wr1-x42c.google.com with SMTP id y3so13077970wrl.1
 for <qemu-devel@nongnu.org>; Wed, 13 Oct 2021 14:56:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=XvQIBSYHx12a/BVOjXjE2X8s1e9rx86Vec8AEgTlEes=;
 b=a34XM48qIBbQsneFlW369sCz1Th+UmJUYyrFopilwD4QbNwuVBYT8bX71uURjAspyu
 zW/nEz9EC5OEhvkfYvsDgDrVOMZKP967F4A2xe+rDZFu20IPiFnfdyKvPcuSVYyX9Ydv
 7LWi6kwbv8iOKWsur8fyHOhf/J7vHFU3Tgug6TYwnnPh1qMeZUvwvxbROqqj8Ydt7AFi
 2Tpv5sIOcj5Di4+LcIxKjW4kngBeQwKmjV9v+qFVo2wH8D0A0RoWNzsPbq2tpNNZiOH7
 lmqALp0QnNuF7GM3iNIp33TQZ5fJsBn/KcoVBet/6IT5/mlXgGFcBNZX054sf2+JDKjb
 gP+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=XvQIBSYHx12a/BVOjXjE2X8s1e9rx86Vec8AEgTlEes=;
 b=w+nDBdGmW5nchSbBSg6gzbCYtcgA2ByhmKP8rHVsAw9lSXuq+Vy7ngScWZQbj+XhMU
 RBa9909qEtA+Sxnb95Pv/xfKxHgFHzd1u4WlkMZpMWdUnctGhBf4yHunRcA2nESwS7lv
 6Ari4+/CigZCSfbIJrYhWZpYwH5CBXZTkupV75PGOfsaLf6yO5DWZ67dcrdIMoULbVIi
 XEqizZ0dgvJHFjZn39TlVEtHSDXXGfF6gPT79IiLrKU4UPJYUv7PPXVnL1p6aaYnCt2B
 PbYQTTQQOTSHVKoajZFv48ycnf5y4WJ/O0gqZfg2xUA+VVMHPQvea9xKbLcgdGfabw6T
 8UMw==
X-Gm-Message-State: AOAM530I20eb43JjItLCEGh/IF7a+jB/UbgzsFb/SUwtNNO8AxEci5yB
 RrXCuUV2Lc56Dh92qjgJpj1kGDWq7sU=
X-Google-Smtp-Source: ABdhPJweOEDSFq1SfQUGBUCUlkrNl8Bx4+EXGt2LDQ96RFdxD6LrLxL3BiYwsYCxin3mL9ymhjeosQ==
X-Received: by 2002:a05:600c:4f81:: with SMTP id
 n1mr15340878wmq.63.1634162214713; 
 Wed, 13 Oct 2021 14:56:54 -0700 (PDT)
Received: from x1w.redhat.com (213.red-81-36-146.dynamicip.rima-tde.net.
 [81.36.146.213])
 by smtp.gmail.com with ESMTPSA id g25sm648150wrc.88.2021.10.13.14.56.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 Oct 2021 14:56:54 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH] target/mips: Fix DEXTRV_S.H DSP opcode
Date: Wed, 13 Oct 2021 23:56:52 +0200
Message-Id: <20211013215652.1764551-1-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
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
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Jia Liu <proljc@gmail.com>, Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

While for the DEXTR_S.H opcode:

  "The shift argument is provided in the instruction."

For the DEXTRV_S.H opcode we have:

  "The five least-significant bits of register rs provide the
   shift argument, interpreted as a five-bit unsigned integer;
   the remaining bits in rs are ignored."

While 't1' contains the 'rs' register content (the shift value
for DEXTR_S.H), we need to load the value of 'rs' for DEXTRV_S.H.
We can directly use the v1_t TCG register which already contains
this shift value.

Fixes: b53371ed5d4 ("target-mips: Add ASE DSP accumulator instructions")
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 target/mips/tcg/translate.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/target/mips/tcg/translate.c b/target/mips/tcg/translate.c
index 148afec9dc0..794676d42ff 100644
--- a/target/mips/tcg/translate.c
+++ b/target/mips/tcg/translate.c
@@ -13807,8 +13807,7 @@ static void gen_mipsdsp_accinsn(DisasContext *ctx, uint32_t op1, uint32_t op2,
             break;
         case OPC_DEXTRV_S_H:
             tcg_gen_movi_tl(t0, v2);
-            tcg_gen_movi_tl(t1, v1);
-            gen_helper_dextr_s_h(cpu_gpr[ret], t0, t1, cpu_env);
+            gen_helper_dextr_s_h(cpu_gpr[ret], t0, v1_t, cpu_env);
             break;
         case OPC_DEXTRV_L:
             tcg_gen_movi_tl(t0, v2);
-- 
2.31.1


