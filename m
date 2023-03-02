Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0667D6A8B20
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Mar 2023 22:24:13 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pXqNb-0000kf-GW; Thu, 02 Mar 2023 16:22:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1pXqNZ-0000k6-IZ
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 16:22:21 -0500
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1pXqNY-0002Q9-3X
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 16:22:21 -0500
Received: by mail-ed1-x533.google.com with SMTP id d30so2513016eda.4
 for <qemu-devel@nongnu.org>; Thu, 02 Mar 2023 13:22:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1677792138;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=TfjxTV5p/CpX88vK1zfC5uTJzTBN0+iEk1o7p5+fKhM=;
 b=hn29s9XIIW5dKi55XsGHdWib/TG8RSU/QYIerl6iRBgjVII41yA0H7DtzV5pt5xKLB
 ByiFCdYSwV/XYZUmy6fxWBANE1YYu/fssSpmVrrbQvaVDutpYMDcZpo+m1BTl+Qz6S5i
 AalIXiE7HUgMbbqxjRV2I3GHgi6JVGl41t5t6KeWPaLqiMJZ09dJWtN0VYU8Y1/pQ9Qz
 EDx9cq05U6IA7dx3sHN9P5XWOO+MpksrES4pz1nb5J1RKk1XmdLUnShv2PmvmVY3InXa
 /3tboqq+4gGqnjRublAgADyPRxGiT1Un2/7QLwPq11KrZfz6Y05PSTuxzkq6jTduh8xm
 Tt8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677792138;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=TfjxTV5p/CpX88vK1zfC5uTJzTBN0+iEk1o7p5+fKhM=;
 b=FrofKWCwmvH7LSdCugkgxeUu+xId7JXIJQV5g7E8ft3TvOseb5Kl+uqxdYQZ1d8E1f
 lGKfP6ZaJtJ152h8Jv1Spc/PbtABeRsqMF48lcYE63bzX4yDQ4qUHuifBWIA0TGx8ePG
 trXSgKk8D2eIPW+2Vouj2jMgucDmQpfHSlQkIe4xkN64rM1AqJC6QcEJuzRBmeUe6SWk
 4bgC3wahkicv4lAPVUvixgFx+cf/XNHUKZv4vh1Ud4Hn56pbEydYMz6M47fVbM5SgOv9
 97C4PsFdto7hBd5h+Mu4bM3yOVFWu4fwEjHXOw6GI0CkOLClbMDuQxcq5JAWrQMCWs/4
 uysQ==
X-Gm-Message-State: AO0yUKXpAD46cO+BeRSGOFlz+l6yioWHFeN04P05B72cko4anTZcQmQJ
 8ex5oanxh7NPbNrqdUcvxQN01JNXh2I=
X-Google-Smtp-Source: AK7set/7QK4LBk9+NncovSkQJhCF+hAMQEz600XAJzLM7RsGSaAAS7ziPHoLeS+3C0Uo6uH69qqRFQ==
X-Received: by 2002:aa7:df0b:0:b0:4bd:11d3:e86f with SMTP id
 c11-20020aa7df0b000000b004bd11d3e86fmr6135758edy.6.1677792138245; 
 Thu, 02 Mar 2023 13:22:18 -0800 (PST)
Received: from Provence.localdomain
 (dynamic-092-224-150-004.92.224.pool.telefonica.de. [92.224.150.4])
 by smtp.gmail.com with ESMTPSA id
 s4-20020a1709062ec400b008f89953b761sm145895eji.3.2023.03.02.13.22.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Mar 2023 13:22:17 -0800 (PST)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, Eduardo Habkost <eduardo@habkost.net>,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Aurelien Jarno <aurelien@aurel32.net>,
 Richard Henderson <richard.henderson@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, Bernhard Beschow <shentey@gmail.com>
Subject: [PATCH v8 08/23] hw/isa/piix3: Wire up ACPI interrupt internally
Date: Thu,  2 Mar 2023 22:21:46 +0100
Message-Id: <20230302212201.224360-9-shentey@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230302212201.224360-1-shentey@gmail.com>
References: <20230302212201.224360-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::533;
 envelope-from=shentey@gmail.com; helo=mail-ed1-x533.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Now that PIIX3 has the PIC integrated, the ACPI controller can be wired
up internally.

Signed-off-by: Bernhard Beschow <shentey@gmail.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Message-Id: <20221022150508.26830-18-shentey@gmail.com>
---
 hw/i386/pc_piix.c | 1 -
 hw/isa/piix3.c    | 1 +
 2 files changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/i386/pc_piix.c b/hw/i386/pc_piix.c
index 8456b8a758..3339793a08 100644
--- a/hw/i386/pc_piix.c
+++ b/hw/i386/pc_piix.c
@@ -328,7 +328,6 @@ static void pc_init1(MachineState *machine,
     if (piix4_pm) {
         smi_irq = qemu_allocate_irq(pc_acpi_smi_interrupt, first_cpu, 0);
 
-        qdev_connect_gpio_out(DEVICE(piix4_pm), 0, x86ms->gsi[9]);
         qdev_connect_gpio_out_named(DEVICE(piix4_pm), "smi-irq", 0, smi_irq);
         pcms->smbus = I2C_BUS(qdev_get_child_bus(DEVICE(piix4_pm), "i2c"));
         /* TODO: Populate SPD eeprom data.  */
diff --git a/hw/isa/piix3.c b/hw/isa/piix3.c
index 60ae018a55..e1d9049b3a 100644
--- a/hw/isa/piix3.c
+++ b/hw/isa/piix3.c
@@ -338,6 +338,7 @@ static void pci_piix3_realize(PCIDevice *dev, Error **errp)
         if (!qdev_realize(DEVICE(&d->pm), BUS(pci_bus), errp)) {
             return;
         }
+        qdev_connect_gpio_out(DEVICE(&d->pm), 0, d->pic[9]);
     }
 }
 
-- 
2.39.2


