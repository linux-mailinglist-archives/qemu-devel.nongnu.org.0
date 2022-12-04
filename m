Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D80E641F34
	for <lists+qemu-devel@lfdr.de>; Sun,  4 Dec 2022 20:17:04 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p1uL6-0001zj-R0; Sun, 04 Dec 2022 14:07:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1p1uL4-0001ws-OU; Sun, 04 Dec 2022 14:07:46 -0500
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1p1uL3-0001aW-4d; Sun, 04 Dec 2022 14:07:46 -0500
Received: by mail-ed1-x531.google.com with SMTP id m19so13033597edj.8;
 Sun, 04 Dec 2022 11:07:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=vfZbHptpLAdwpD4x7eaLpLjGBIYt2o3xDAoRmJzyD2Y=;
 b=j6e28evLzvs6W5ARa3sPqr35JShrPOzX1g+tqv+DpmyZwFbhM8jBolKBqi510qwmc/
 juURdac6TYERn+nr+NFraar5RZu2wCXNDq1LhS8ft0uFc92uMVKNymBWjlBPEIc+iOmS
 lwL3Je0Isx9Spu4bKQvUK13cWrbhuDeIdErJ7ReUAXQsz8AbAtqMexqWtwIC14deXlSS
 BidOR9pHnlDWV/FS/u81styGZuuvJXU8SdPVUbTH6eIoUKpHb8gCUNFiY5GYVoPIhC1I
 ryjJ0o3P3QrY499BjDkMkwlhXVpdfH6kuIcSg6K0ynhv7K/mwUCRG44c/RIyFsf3Wj/D
 B9vA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=vfZbHptpLAdwpD4x7eaLpLjGBIYt2o3xDAoRmJzyD2Y=;
 b=xzN7gArTNUAGnExqmTAruzf2Nk0a+X1bWEY2l4Opgu123/W/5V5qOX90Hdc/04fshH
 EEYfQWis/dBYTST48rh9/ReAjI6/aAnt8fLlvOWwTr6twhcwHumIbF1RjBHA3M0mM8UP
 Fh8uh+3hPjew1eXQTLbvhkMj6reiLdNPUS5oQR2AijAuWSlbOozqaL15OhQjez6TuLLH
 xS8lfEodmeCRKhcu9oqC5NCjFj+WI2FKHIU73bYhx6T6RhiDew5NmqIcp5beZScDY/6d
 fz+i2dyFIaturW5wdo2QPvnZo/KufVYkLqn2GqmRm9lp28Ari+gIJj/o9bZCnjPSgfJN
 3XOA==
X-Gm-Message-State: ANoB5pkZGnKVUMGKRMZLtrr4Ox9K0NLjKYHPfHaymhpOzgVUEtKwurU4
 jvZNEntJHUb2+sbe+CA11HGIQpyxyoE=
X-Google-Smtp-Source: AA0mqf4KpswVtrcrmR8PEOUaXZRv976CKQ8Sq+4Ogg5fjl1A0vYnNOxJH1maDfEUVe8aSDpYGfhuOw==
X-Received: by 2002:a05:6402:4499:b0:46c:43fd:d1ab with SMTP id
 er25-20020a056402449900b0046c43fdd1abmr8420420edb.197.1670180863995; 
 Sun, 04 Dec 2022 11:07:43 -0800 (PST)
Received: from localhost.localdomain
 (dynamic-089-012-182-051.89.12.pool.telefonica.de. [89.12.182.51])
 by smtp.gmail.com with ESMTPSA id
 j10-20020a17090623ea00b00782ee6b34f2sm5359835ejg.183.2022.12.04.11.07.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 04 Dec 2022 11:07:43 -0800 (PST)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 John Snow <jsnow@redhat.com>, qemu-block@nongnu.org,
 Igor Mammedov <imammedo@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Aurelien Jarno <aurelien@aurel32.net>,
 Richard Henderson <richard.henderson@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Eduardo Habkost <eduardo@habkost.net>, Ani Sinha <ani@anisinha.ca>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Bernhard Beschow <shentey@gmail.com>
Subject: [PATCH 14/32] hw/isa/piix3: Wire up ACPI interrupt internally
Date: Sun,  4 Dec 2022 20:05:35 +0100
Message-Id: <20221204190553.3274-15-shentey@gmail.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221204190553.3274-1-shentey@gmail.com>
References: <20221204190553.3274-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::531;
 envelope-from=shentey@gmail.com; helo=mail-ed1-x531.google.com
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
Message-Id: <20221022150508.26830-18-shentey@gmail.com>
---
 hw/i386/pc_piix.c | 1 -
 hw/isa/piix3.c    | 2 ++
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/hw/i386/pc_piix.c b/hw/i386/pc_piix.c
index 19fe07a13b..dd4e89acf9 100644
--- a/hw/i386/pc_piix.c
+++ b/hw/i386/pc_piix.c
@@ -313,7 +313,6 @@ static void pc_init1(MachineState *machine,
     if (piix4_pm) {
         smi_irq = qemu_allocate_irq(pc_acpi_smi_interrupt, first_cpu, 0);
 
-        qdev_connect_gpio_out(DEVICE(piix4_pm), 0, x86ms->gsi[9]);
         qdev_connect_gpio_out_named(DEVICE(piix4_pm), "smi-irq", 0, smi_irq);
         pcms->smbus = I2C_BUS(qdev_get_child_bus(DEVICE(piix4_pm), "i2c"));
         /* TODO: Populate SPD eeprom data.  */
diff --git a/hw/isa/piix3.c b/hw/isa/piix3.c
index 3504ad16ca..0341284199 100644
--- a/hw/isa/piix3.c
+++ b/hw/isa/piix3.c
@@ -354,6 +354,8 @@ static void pci_piix3_realize(PCIDevice *dev, Error **errp)
         if (!qdev_realize(DEVICE(&d->pm), BUS(pci_bus), errp)) {
             return;
         }
+        qdev_connect_gpio_out(DEVICE(&d->pm), 0,
+                              qdev_get_gpio_in(DEVICE(&d->pic), 9));
     }
 }
 
-- 
2.38.1


