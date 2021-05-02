Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C3609370DE1
	for <lists+qemu-devel@lfdr.de>; Sun,  2 May 2021 18:23:10 +0200 (CEST)
Received: from localhost ([::1]:58716 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ldEs9-0002N3-Qm
	for lists+qemu-devel@lfdr.de; Sun, 02 May 2021 12:23:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35968)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1ldEl3-00057d-Ul
 for qemu-devel@nongnu.org; Sun, 02 May 2021 12:15:50 -0400
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334]:51111)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1ldEl2-0007Ef-58
 for qemu-devel@nongnu.org; Sun, 02 May 2021 12:15:49 -0400
Received: by mail-wm1-x334.google.com with SMTP id n84so1936915wma.0
 for <qemu-devel@nongnu.org>; Sun, 02 May 2021 09:15:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Ea5zmyJlxs7XTwwtJD6w8UxqiI46mAH5yHMSAEvlRDk=;
 b=ht5k1QUxNyFxCU5RH6mBSnZql5VIl+hgc+112QBjuEYF+kjuSCB5eiA9QCw5CLBiep
 drTwzkyvM1zEiha/SbCTv1icpItZJUEBN8ufUkCQr4VuOhrnjTodIvmqL2AufWhzK4E1
 u8ldpFvepMmeHjxhoExXjiuVUcxts3aNzUWawSPhX4QkQ05L2jH121vlMY7iE7tccyOo
 WEXDIhEmJ4wuGcWlHnR/OBqZxp+HKxajJHOWDlIIuz3BqZHyWwkd+t50hKYHruTonFsY
 MOuuAq6QId1AjaU9cZOS9JtxpyBr3K4WflgMW8hNFRH3GT7FBCj4KcJIHJZESwhcJoqy
 IAQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=Ea5zmyJlxs7XTwwtJD6w8UxqiI46mAH5yHMSAEvlRDk=;
 b=gaS8auetJ+5BsRkjoAag6XD2mOXMg8UfTwwTuJoKlDdqJRS8+mrobQj5NFld2F9/dZ
 crByArMl7TNkEBjS4aNKuffbvh3LReHr3OtdjSfVSHR9NRR4gFJGfkBMWfGz6EvKvllJ
 kTuM8R959FDBjvB8VxSY+zMoUPwAYTm79vJP2zWEGIEbAD0F8fsgMSYLJew7cGnLaISC
 9nT5DlC+1Ggaz0bxNvdMFb+PIPQSlFrsxj5BrnZGSbotcGjJLaaTJkPZ0IQ2pbyUDiyK
 yrcx9Twwp6AzYdr8G/fDLl8IM47BahAz18JSDjP9Idnb5p43IqFgv2gHbxXs2U2DVlYd
 37og==
X-Gm-Message-State: AOAM531etLBm/ItdqzONZ4PAFSYJ/PiNBvZIBuN11Wr00L+ZL9DXZoh7
 CS+4mRTuAJxL/UvKqdWyLgNeqi2QZd836hhc
X-Google-Smtp-Source: ABdhPJzHuYqQQK/4jkf4sya0mMKrZ9pryU2xNMY56EyyyNbeumFdZWQEkjj6Kk9s5h2ZBu4orkDSNg==
X-Received: by 2002:a1c:65c2:: with SMTP id z185mr28152433wmb.2.1619972146514; 
 Sun, 02 May 2021 09:15:46 -0700 (PDT)
Received: from localhost.localdomain
 (anancy-651-1-208-144.w109-217.abo.wanadoo.fr. [109.217.237.144])
 by smtp.gmail.com with ESMTPSA id l14sm9466032wrv.94.2021.05.02.09.15.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 02 May 2021 09:15:45 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PULL 01/36] hw/isa/piix4: Use qdev_get_gpio_in_named() to get ISA IRQ
Date: Sun,  2 May 2021 18:15:03 +0200
Message-Id: <20210502161538.534038-2-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210502161538.534038-1-f4bug@amsat.org>
References: <20210502161538.534038-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x334.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
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
 Huacai Chen <chenhuacai@kernel.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Since commit 078778c5a55 ("piix4: Add an i8259 Interrupt Controller")
the TYPE_PIIX4_PCI_DEVICE exposes the ISA input IRQs as "isa" alias.

Use this alias to get IRQ for the power management PCI function.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20210324182902.692419-1-f4bug@amsat.org>
---
 hw/isa/piix4.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/hw/isa/piix4.c b/hw/isa/piix4.c
index b3b6a4378a3..5ae3b4984d2 100644
--- a/hw/isa/piix4.c
+++ b/hw/isa/piix4.c
@@ -268,8 +268,9 @@ DeviceState *piix4_create(PCIBus *pci_bus, ISABus **isa_bus, I2CBus **smbus)
     pci_create_simple(pci_bus, devfn + 2, "piix4-usb-uhci");
     if (smbus) {
         *smbus = piix4_pm_init(pci_bus, devfn + 3, 0x1100,
-                               isa_get_irq(NULL, 9), NULL, 0, NULL);
-   }
+                               qdev_get_gpio_in_named(dev, "isa", 9),
+                               NULL, 0, NULL);
+    }
 
     return dev;
 }
-- 
2.26.3


