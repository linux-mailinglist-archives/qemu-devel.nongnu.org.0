Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C26553672E4
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Apr 2021 20:52:37 +0200 (CEST)
Received: from localhost ([::1]:37096 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lZHxk-0007pW-BH
	for lists+qemu-devel@lfdr.de; Wed, 21 Apr 2021 14:52:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36848)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lZHvR-0007BX-V9
 for qemu-devel@nongnu.org; Wed, 21 Apr 2021 14:50:13 -0400
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a]:35716)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lZHvQ-00038p-6y
 for qemu-devel@nongnu.org; Wed, 21 Apr 2021 14:50:13 -0400
Received: by mail-ej1-x62a.google.com with SMTP id u17so65049328ejk.2
 for <qemu-devel@nongnu.org>; Wed, 21 Apr 2021 11:50:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=KsuNpGcMdRgZ+Nb2tQgwHbXzzWivj+2kGx5K/nxQ84o=;
 b=cv23VLJlAFeAsUWSowk6gOKDeN+ffRQxU0953JanQlnyzKRZgfTFhigA5ZFX0pHHME
 a4g1rgqDbu8e3em3wMmRkbnnvPc5vO1RQFdOkDQLuTPnSA1enmvcSKchMeVjEHoXZSsI
 Tug9Wa4xeYEE1e+HhTSyR5TQNamYIPBqc9l0tV5PK8Yvy73voxLjoON0wULKyFbJL/mx
 sIbuTEk03xkUgrwvlg+PtUzW848Jzs8mLcwojqUqqhFxYNA3Z7otWgy9arzB5XW4nIH5
 GahJoIkldalSfKNTumpeTdtcvMEQ1MACuWMdAONamxrUcIswHL1miDMymYSWDPCQ71l0
 RVOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=KsuNpGcMdRgZ+Nb2tQgwHbXzzWivj+2kGx5K/nxQ84o=;
 b=C3Hp70OwPZ20qkamB/H0LdxXZVPMZkLvWs4vjIF+1F9cDeCClnmjbqgGJNJXA+zp3P
 xUkNbLbr3non5GQMo1eO/n/AhHz3iygLZ50z1yZBdBoDpFMOMdAEti4AaP+fXgRFHjZx
 9xFCWy9TDf3mEGZ1KCpyWAsly9F8L4U8txDCdfN6Fy38I/AR5N1bmTkiINPiwiDzokYp
 BgVEm6B4PG91s65gmhjoPUCS8AC5/pylAaHWDYVRFfU0Xt14QT/6idQRkrck46DB2AI3
 Q+j+TWLRemu4zlRclmb5AXke2hWhavG+8b+5wXqPPQbPeq1Yh68DmnryuGlRz7+ybSiO
 CPMA==
X-Gm-Message-State: AOAM531TEKDWUVXOg1+wjGWuSvtu6Y94gEBld6O5BwNVhJTnip2k5wGi
 ncKVKHtoArTx79yqSy1/Ba66pzKnZimZ2A==
X-Google-Smtp-Source: ABdhPJx8Y5tQpTNa+Cquz8SjDYIaEGfuhkuM81QgHdUIx24H9SQMJnhBYlpKBT1Hd2j9swAZo8otBA==
X-Received: by 2002:a17:906:68da:: with SMTP id
 y26mr34891366ejr.442.1619031009749; 
 Wed, 21 Apr 2021 11:50:09 -0700 (PDT)
Received: from x1w.redhat.com (39.red-81-40-121.staticip.rima-tde.net.
 [81.40.121.39])
 by smtp.gmail.com with ESMTPSA id dc24sm221498ejb.123.2021.04.21.11.50.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Apr 2021 11:50:08 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH] target/mips: Add missing CP0 check to nanoMIPS RDPGPR /
 WRPGPR opcodes
Date: Wed, 21 Apr 2021 20:50:07 +0200
Message-Id: <20210421185007.2231855-1-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.3
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62a;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-ej1-x62a.google.com
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
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Petar Jovanovic <petar.jovanovic@syrmia.com>,
 Filip Vidojevic <Filip.Vidojevic@Syrmia.com>,
 Aurelien Jarno <aurelien@aurel32.net>,
 Vince Del Vecchio <Vince.DelVecchio@mediatek.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Per the nanoMIPS32 Instruction Set Technical Reference Manual,
Revision 01.01, Chapter 3. "Instruction Definitions":

The Read/Write Previous GPR opcodes "require CP0 privilege".

Add the missing CP0 checks.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 target/mips/translate.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/target/mips/translate.c b/target/mips/translate.c
index 5dad75cdf37..8a0a2197426 100644
--- a/target/mips/translate.c
+++ b/target/mips/translate.c
@@ -18969,9 +18969,11 @@ static void gen_pool32axf_nanomips_insn(CPUMIPSState *env, DisasContext *ctx)
             }
             break;
         case NM_RDPGPR:
+            check_cp0_enabled(ctx);
             gen_load_srsgpr(rs, rt);
             break;
         case NM_WRPGPR:
+            check_cp0_enabled(ctx);
             gen_store_srsgpr(rs, rt);
             break;
         case NM_WAIT:
-- 
2.26.3


