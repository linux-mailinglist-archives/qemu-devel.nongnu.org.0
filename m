Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D2C857856A
	for <lists+qemu-devel@lfdr.de>; Mon, 18 Jul 2022 16:30:10 +0200 (CEST)
Received: from localhost ([::1]:47678 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oDRlB-0003iX-Hp
	for lists+qemu-devel@lfdr.de; Mon, 18 Jul 2022 10:30:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51812)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oDRHe-00029O-1f
 for qemu-devel@nongnu.org; Mon, 18 Jul 2022 09:59:38 -0400
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333]:46667)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oDRHa-0003BG-4i
 for qemu-devel@nongnu.org; Mon, 18 Jul 2022 09:59:35 -0400
Received: by mail-wm1-x333.google.com with SMTP id
 h14-20020a1ccc0e000000b0039eff745c53so7383709wmb.5
 for <qemu-devel@nongnu.org>; Mon, 18 Jul 2022 06:59:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=bsiTbIieXoyZzsovMov20+PKkWbaKl/whztxxrpGPA0=;
 b=GCEzTYqeKffBnW/GtsNltJaAMM6uleTxXJs5y6kuPq+VMCQE71MiYLhzowM7/7CLm7
 FIjSbn3Dni0jIP2lWaIZsYlvTjsblvqV5oCmVw6pBqrNiM1W2sp/eEGPhjgPwyaRyHQG
 b0VK7NfeOuETFxHxH9CO4FS+L85pgypOgvu/OeBinQEFIEUfis0Ta8kPl2ufna7ZqL0g
 OTgqLBayHTXgE1dCfbFodrmvSjNlEuWULPV/HMptYp2zRMcnIRkpMxVlhGODyS8UFI82
 RjxEUGjAeHkZFaQv1lNTygVnTyuxuSW1qE/laj4glAlA00V/ws6oKRZ3RZIL6zaY8zzl
 b+NQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=bsiTbIieXoyZzsovMov20+PKkWbaKl/whztxxrpGPA0=;
 b=OU8E9BbFNLzVFU5GOu9QjfBzzAFUA/LI5SawX4uVgQsviAxXWm23F+Uex548DLavYU
 0aqRyTiGwt1FBfK9dZqcW8hSegsCirG4WPXhiA5gZPG3Wh9kGn8cTqXGYZp83sxmNM8t
 tcWlJChX2WtppmMOhtu4M3n6drUdnnp2SK/gvYX3R7Tvf4V6VIJ8oWLfks2t2LCGPZSY
 CyI2Ok64kg9X/tYaObnY/2Cs5F59yn9Gp5Tq/FBSluIU/kdg+FD3HhECswiVzVLWufR0
 IDntF5Ql0lL+1lW2gZxFClJ0cyn0r4ckdCVvfGx+Ehv0q9C2Sb4NBl3LS4wdXFuEwY1f
 2lQg==
X-Gm-Message-State: AJIora9UxO7kZxeAt6iPAz09pFegMW2m/BgQFsMzHF1/ByiOURhHSGTT
 dNtL47exoe/1A6iiNPmMermUKCMh9OlykQ==
X-Google-Smtp-Source: AGRyM1v5Xzcym4YnAD79hL0bh2oy6ae6OswhI3kx+ciXW89Oq79USuQPw9A2J/Gc13D7W+I6/EmxGg==
X-Received: by 2002:a05:600c:4f05:b0:3a3:18ed:6cda with SMTP id
 l5-20020a05600c4f0500b003a318ed6cdamr6609474wmq.34.1658152772811; 
 Mon, 18 Jul 2022 06:59:32 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 id15-20020a05600ca18f00b003a31f1edfa7sm1805798wmb.41.2022.07.18.06.59.32
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Jul 2022 06:59:32 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 12/15] hw/adc: Fix CONV bit in NPCM7XX ADC CON register
Date: Mon, 18 Jul 2022 14:59:17 +0100
Message-Id: <20220718135920.13667-13-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220718135920.13667-1-peter.maydell@linaro.org>
References: <20220718135920.13667-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x333.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Hao Wu <wuhaotsh@google.com>

The correct bit for the CONV bit in NPCM7XX ADC is bit 13. This patch
fixes that in the module, and also lower the IRQ when the guest
is done handling an interrupt event from the ADC module.

Signed-off-by: Hao Wu <wuhaotsh@google.com>
Reviewed-by: Patrick Venture<venture@google.com>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Message-id: 20220714182836.89602-4-wuhaotsh@google.com
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/adc/npcm7xx_adc.c           | 2 +-
 tests/qtest/npcm7xx_adc-test.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/hw/adc/npcm7xx_adc.c b/hw/adc/npcm7xx_adc.c
index 0f0a9f63e20..47fb9e5f74c 100644
--- a/hw/adc/npcm7xx_adc.c
+++ b/hw/adc/npcm7xx_adc.c
@@ -36,7 +36,7 @@ REG32(NPCM7XX_ADC_DATA, 0x4)
 #define NPCM7XX_ADC_CON_INT     BIT(18)
 #define NPCM7XX_ADC_CON_EN      BIT(17)
 #define NPCM7XX_ADC_CON_RST     BIT(16)
-#define NPCM7XX_ADC_CON_CONV    BIT(14)
+#define NPCM7XX_ADC_CON_CONV    BIT(13)
 #define NPCM7XX_ADC_CON_DIV(rv) extract32(rv, 1, 8)
 
 #define NPCM7XX_ADC_MAX_RESULT      1023
diff --git a/tests/qtest/npcm7xx_adc-test.c b/tests/qtest/npcm7xx_adc-test.c
index 3fa6d9ece0b..8048044d281 100644
--- a/tests/qtest/npcm7xx_adc-test.c
+++ b/tests/qtest/npcm7xx_adc-test.c
@@ -50,7 +50,7 @@
 #define CON_INT     BIT(18)
 #define CON_EN      BIT(17)
 #define CON_RST     BIT(16)
-#define CON_CONV    BIT(14)
+#define CON_CONV    BIT(13)
 #define CON_DIV(rv) extract32(rv, 1, 8)
 
 #define FST_RDST    BIT(1)
-- 
2.25.1


