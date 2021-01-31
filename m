Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8265F309E3B
	for <lists+qemu-devel@lfdr.de>; Sun, 31 Jan 2021 19:49:13 +0100 (CET)
Received: from localhost ([::1]:46622 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l6Hma-000454-Jk
	for lists+qemu-devel@lfdr.de; Sun, 31 Jan 2021 13:49:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55222)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l6HiX-0001pv-LE; Sun, 31 Jan 2021 13:45:01 -0500
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d]:52985)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l6HiW-0007W5-7W; Sun, 31 Jan 2021 13:45:01 -0500
Received: by mail-wm1-x32d.google.com with SMTP id o5so1145135wmq.2;
 Sun, 31 Jan 2021 10:44:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=KjWr4TKlwB/IJcVo6npcfvEPrPb22EOYTZC5O8IwCfc=;
 b=Ar83hyG1wfqk990LmyX56lvWVmRRWSUEpVqyMnuuaaHJmSx9fQuhZTQWz5jZAwbPmj
 wp3f+NM1Dlntqul213WvJHoGbrHt/JOBCaIwLwd8mMwZqkk/a1WSyVB5yOyhQFj+ucf/
 VoYH1Lq32TXiBWgiYVXVg4QrCqnGScz9PlJr1izmus4bIu3abO/LdTnzgyReyZVhtGXL
 5XVCirWVxwIE7Vkpc5U+OmR/A4JO68UGLAkC0MCOFdIn9ESnH8jitD0Yz/Wu+eKyGuOm
 n6VosZs4M5Xa8LFs848I0PZUknvG1ILFBOKmmvfdVuhoV1XFpeGvPKKsXdroZHS/feR3
 7wMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=KjWr4TKlwB/IJcVo6npcfvEPrPb22EOYTZC5O8IwCfc=;
 b=k24sDsUaksK01Yo3Mv6hOBuJIGm+m4Af433SRdyOBCVw/6MzR0M99jEv9YQnqK1OZr
 fscWY9TVU1zONlNUqHDLkLGpb7S7X7hZxIU6wxzyB9OP1yk62kiWoRDDmmy2oIFT+YQQ
 7OsDsfLAthn9b7o6peYkxObpyOAs3i2NLsthoA+uXFxj6fROYQYKHtj8iu0ZlX12lFov
 YBOYig3/IiOEyXxybzm/ZSpQfDRVWzKcfSVzf4JYiDxdp72l7Pzqe7dB41hnhzk+YFIb
 32XIpDTOPBAfZigeDrr2UvNtPpPzvLfwBvYBKpLrZlbsNfIP/Zar7oRLYI1m4jQBwdaD
 R/4A==
X-Gm-Message-State: AOAM531P6Qf66iQuUzuL1wznTV2DYlXFXoF2VtregBTBMRKm+a8J6sEv
 7mTuup8yrYwW2rJxn4TxLzxVH1LsJgM=
X-Google-Smtp-Source: ABdhPJyYvINpxyBLy+SG1ryCF0bcAlkAQlIphE5zpao88S66RKUpceyH9ZeaGvOesvSS8l5ovJ9sPA==
X-Received: by 2002:a05:600c:268b:: with SMTP id
 11mr12117657wmt.132.1612118697963; 
 Sun, 31 Jan 2021 10:44:57 -0800 (PST)
Received: from localhost.localdomain (7.red-83-57-171.dynamicip.rima-tde.net.
 [83.57.171.7])
 by smtp.gmail.com with ESMTPSA id v4sm27450035wrw.42.2021.01.31.10.44.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 31 Jan 2021 10:44:57 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 1/6] hw/arm/stm32f405_soc: Add missing dependency on OR_IRQ
Date: Sun, 31 Jan 2021 19:44:44 +0100
Message-Id: <20210131184449.382425-2-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210131184449.382425-1-f4bug@amsat.org>
References: <20210131184449.382425-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32d.google.com
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-trivial@nongnu.org,
 Alistair Francis <alistair@alistair23.me>, Michael Tokarev <mjt@tls.msk.ru>,
 Laurent Vivier <laurent@vivier.eu>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Niek Linnenbank <nieklinnenbank@gmail.com>, qemu-arm@nongnu.org,
 Antony Pavlov <antonynpavlov@gmail.com>, Joel Stanley <joel@jms.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The STM32F405 SoC uses an OR gate on its ADC IRQs.

Fixes: 529fc5fd3e1 ("hw/arm: Add the STM32F4xx SoC")
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
Cc: alistair@alistair23.me
---
 hw/arm/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/hw/arm/Kconfig b/hw/arm/Kconfig
index 13cc42dcc84..a320a124855 100644
--- a/hw/arm/Kconfig
+++ b/hw/arm/Kconfig
@@ -336,6 +336,7 @@ config STM32F205_SOC
 config STM32F405_SOC
     bool
     select ARM_V7M
+    select OR_IRQ
     select STM32F4XX_SYSCFG
     select STM32F4XX_EXTI
 
-- 
2.26.2


