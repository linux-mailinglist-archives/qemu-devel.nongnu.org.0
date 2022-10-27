Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AC10610343
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Oct 2022 22:49:08 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oo9nG-0003RU-12; Thu, 27 Oct 2022 16:48:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1oo9n1-0003He-Sx
 for qemu-devel@nongnu.org; Thu, 27 Oct 2022 16:47:55 -0400
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1oo9my-0007VO-P2
 for qemu-devel@nongnu.org; Thu, 27 Oct 2022 16:47:47 -0400
Received: by mail-wr1-x42b.google.com with SMTP id w14so4168089wru.8
 for <qemu-devel@nongnu.org>; Thu, 27 Oct 2022 13:47:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=FideTTwLBlaM3Uj+ggSbpikD+Db2qX3oNiUh+CsQYlw=;
 b=y0anLze37SuyGnx2X0R5zVokWIq4ZWzf/8hDyAr9+NGCdErnT7jiShtfbi7ZwT3Ray
 vMbSh5FaNi0txW1TTMkpEPqP1Lh0Jd5N7QDCRWzbLrWeVQLdNGcuphBYrW5EuePdbdXQ
 qoA0d44I1mkXqHe7mXBChByiZIUD/Wckigrnbw2ICVWPEN3bJ0/dbAkJKJDVNxwXKNPb
 Ilzv6PKu9saey7uxWIpeb6gKSGGD+Yqvq4k1wKb+V0EaSbcRfOz57YvVaofQsUYBH1gr
 JrgeiyFS3Vku+FUZFlNnbcRzE6d5aQYsnqh0cuR/o7RlWwGlR4kJqZJWVpjEVBhVWAZS
 C3eA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=FideTTwLBlaM3Uj+ggSbpikD+Db2qX3oNiUh+CsQYlw=;
 b=JLgy73sI7XtkVTutIJCswZIfbWhBGZXmZre76z1jFNEkABgQ1+tT9gNNJaimOEcfvj
 Hr/UOAHFHol8lApPrFy85QC+//E2J+Z1tGP1KnXQQE+aSe53bicHpbFUEUsh8Og4CQm3
 RIQ6/TK81GLdSjA1Bv6SL+oRx5+fS06Ih8lt40ydfUGgGbCtNaZM8xR8uEJmTYSmlyT+
 uPIepkYLtrvrEYSNr4VWhbjYtiRpOwIB4t9fKq5ayPLYa3oMmMBsI2rS38ziWTDfQHYM
 nDQa0PDPL3su+Id/0zBImPVYW12THJCylQ4/25Q9OXExoM1t6y6+JizJ6aQkCf8DNsr2
 lWcA==
X-Gm-Message-State: ACrzQf2xk2O7x4ZHBaech2LqRoQBulUB0e/gbMjHt1ACY3vtSbp/jOhR
 z8h19RlMOhFM1aH+3f4eKf0ktjmZ3az4Ew1X
X-Google-Smtp-Source: AMsMyM6RLJATYlJU7lBokFPzGVLr+4AX0ngQoRjtS7y+mtqGoFT/Rtfu8Ge23WO9Zq2Dxa87QIrsgQ==
X-Received: by 2002:a5d:69c2:0:b0:236:86fc:4400 with SMTP id
 s2-20020a5d69c2000000b0023686fc4400mr8513748wrw.69.1666903663218; 
 Thu, 27 Oct 2022 13:47:43 -0700 (PDT)
Received: from localhost.localdomain ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 w7-20020adfd4c7000000b002362f6fcaf5sm1948159wrk.48.2022.10.27.13.47.42
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 27 Oct 2022 13:47:42 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org,
	Bernhard Beschow <shentey@gmail.com>
Cc: Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Aurelien Jarno <aurelien@aurel32.net>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>
Subject: [PATCH v2 3/3] hw/isa/piix4: Correct IRQRC[A:D] reset values
Date: Thu, 27 Oct 2022 22:47:20 +0200
Message-Id: <20221027204720.33611-4-philmd@linaro.org>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221027204720.33611-1-philmd@linaro.org>
References: <20221027204720.33611-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

IRQRC[A:D] registers reset value is 0x80. We were forcing
the MIPS Malta machine routing to be able to boot a Linux
kernel without any bootloader.
We now have these registers initialized in the Malta machine
write_bootloader(), so we can use the correct reset values.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/isa/piix4.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/hw/isa/piix4.c b/hw/isa/piix4.c
index 15f344dbb7..a2165c6a49 100644
--- a/hw/isa/piix4.c
+++ b/hw/isa/piix4.c
@@ -115,10 +115,10 @@ static void piix4_isa_reset(DeviceState *dev)
     pci_conf[0x4c] = 0x4d;
     pci_conf[0x4e] = 0x03;
     pci_conf[0x4f] = 0x00;
-    pci_conf[0x60] = 0x0a; // PCI A -> IRQ 10
-    pci_conf[0x61] = 0x0a; // PCI B -> IRQ 10
-    pci_conf[0x62] = 0x0b; // PCI C -> IRQ 11
-    pci_conf[0x63] = 0x0b; // PCI D -> IRQ 11
+    pci_conf[0x60] = 0x80;
+    pci_conf[0x61] = 0x80;
+    pci_conf[0x62] = 0x80;
+    pci_conf[0x63] = 0x80;
     pci_conf[0x69] = 0x02;
     pci_conf[0x70] = 0x80;
     pci_conf[0x76] = 0x0c;
-- 
2.37.3


