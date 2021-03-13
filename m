Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FA4833A0E7
	for <lists+qemu-devel@lfdr.de>; Sat, 13 Mar 2021 21:08:41 +0100 (CET)
Received: from localhost ([::1]:59864 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lLAYy-0005VH-Fn
	for lists+qemu-devel@lfdr.de; Sat, 13 Mar 2021 15:08:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57272)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lLAGW-0007sG-Br
 for qemu-devel@nongnu.org; Sat, 13 Mar 2021 14:49:36 -0500
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d]:33484)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lLAGU-0007BN-Bh
 for qemu-devel@nongnu.org; Sat, 13 Mar 2021 14:49:35 -0500
Received: by mail-wr1-x42d.google.com with SMTP id o16so3607871wrn.0
 for <qemu-devel@nongnu.org>; Sat, 13 Mar 2021 11:49:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=OaH7pKdhqoFCV1aTXDa0qp3I1qn/JzU2ueenlLqzFCY=;
 b=EJ1CUFRQlz4+J0g2ReOci1DtoJ1OWpsYHYcrZiKraacJmLLiCwos6xRn3evp8+07s2
 pImiwaVrRdHchteDkqTg2LMm0wuPC2VVvoiTgtPfgDhDYWPQjthJNdY1bXHudpdpTuf6
 03RB4SOsHClRtEnv2SteQCANbZYze/1WNngetxdu6wJA8AKzUveiOWIssg4UvKrw/961
 FS/xtSNgGi+UkmjDpNooAVmTMO54u+6qTbnzmLsSXnI9xohRIV+HbQNTGtOa7pCJ2bIt
 tLECwdUQCZZelzVUCCti/9kRObATVNOzHER9GhdafvCPSWf/bKQZISindot5LDfvkMOC
 YAXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=OaH7pKdhqoFCV1aTXDa0qp3I1qn/JzU2ueenlLqzFCY=;
 b=OMPTeZR8hSdV4iO8wZJ7US++x2ShfBezRfqM9SbQJzgsdEAmJMBEPLPdptl+69PFCj
 Uyc8kebc8HJj411DZ68jJzVA5tK+YSiVDpivr2+tHXC6TgLMHIigN19eDwkNsO1heXiK
 lGbwguC9fDTJeHObvV1/hukzI5oROCPHzv0/43ve8CP8xOAqpptIUMSu3rS3D07AO2Ak
 n1Ga5So92+8CEpwMt6dR4AH9v17+dDGO9h8YPrI5wbQeGSDlhE2y7M92JL/Wp2wdhs3Z
 lLlRKS9QbNl//hSrwX6yLrC2JJppijYop4czORAE/9pC2tAjTcVbH94GCu/yP00CDGMK
 IgyQ==
X-Gm-Message-State: AOAM531/akPMOBibvhIO6Jx7iVzh2C+5GyV46lNCs/DSePvQXsjXcBD/
 lZnWbi+Nun6Hp+i2jI8zd24KnetKVAWy+w==
X-Google-Smtp-Source: ABdhPJxNiSCfuPPVqXdTaKvR+Tw42z2NUNFvwHgcjrXINBNTMVHKGFi4rkIjib/sGlr/SwNVOT2TIw==
X-Received: by 2002:a5d:4286:: with SMTP id k6mr19692221wrq.278.1615664971757; 
 Sat, 13 Mar 2021 11:49:31 -0800 (PST)
Received: from localhost.localdomain (17.red-88-21-201.staticip.rima-tde.net.
 [88.21.201.17])
 by smtp.gmail.com with ESMTPSA id a3sm12857254wrt.68.2021.03.13.11.49.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 13 Mar 2021 11:49:31 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PULL 12/27] target/mips: Use OPC_MUL instead of OPC__MXU_MUL
Date: Sat, 13 Mar 2021 20:48:14 +0100
Message-Id: <20210313194829.2193621-13-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210313194829.2193621-1-f4bug@amsat.org>
References: <20210313194829.2193621-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42d.google.com
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
 Richard Henderson <richard.henderson@linaro.org>,
 Aurelien Jarno <aurelien@aurel32.net>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We already have a macro and definition to extract / check
the Special2 MUL opcode. Use it instead of the unnecessary
OPC__MXU_MUL macro.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 target/mips/translate.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/target/mips/translate.c b/target/mips/translate.c
index 8ab0a96a340..ad09321de84 100644
--- a/target/mips/translate.c
+++ b/target/mips/translate.c
@@ -1464,7 +1464,6 @@ enum {
  */
 
 enum {
-    OPC__MXU_MUL     = 0x02,
     OPC_MXU__POOL00  = 0x03,
     OPC_MXU_D16MUL   = 0x08,
     OPC_MXU_D16MAC   = 0x0A,
@@ -25784,7 +25783,7 @@ static void decode_opc_mxu(DisasContext *ctx, uint32_t insn)
 {
     uint32_t opcode = extract32(insn, 0, 6);
 
-    if (opcode == OPC__MXU_MUL) {
+    if (MASK_SPECIAL2(insn) == OPC_MUL) {
         uint32_t  rs, rt, rd, op1;
 
         rs = extract32(insn, 21, 5);
-- 
2.26.2


