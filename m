Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AADD85A9D42
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Sep 2022 18:40:25 +0200 (CEST)
Received: from localhost ([::1]:48894 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oTnEu-0002wf-Bm
	for lists+qemu-devel@lfdr.de; Thu, 01 Sep 2022 12:40:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53520)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1oTn1w-0001kL-E0
 for qemu-devel@nongnu.org; Thu, 01 Sep 2022 12:27:00 -0400
Received: from mail-ej1-x634.google.com ([2a00:1450:4864:20::634]:45620)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1oTn1u-0001Uy-Ox
 for qemu-devel@nongnu.org; Thu, 01 Sep 2022 12:27:00 -0400
Received: by mail-ej1-x634.google.com with SMTP id lx1so35788108ejb.12
 for <qemu-devel@nongnu.org>; Thu, 01 Sep 2022 09:26:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=fruwrErec85F0eBr5XAV5Xp/8fLsJqYHjQccjJZvfwk=;
 b=DRjlBEOqqhR9EXDx1nkvxdNzfCq2jp+cwV/rkzWGyQMsmb0QlAPKuHSXC2ROnJdc+Z
 mr3DU+wWPVlR7Xs+8NAHZ0IURIHhwsqd0JE4soHnx+5ts4RL2dfteap8YDa12+ki6TLw
 l4LxjBpZRQvcMz6bk8J6ig6SoL83eAc44taslzICCFgB5Hce3McAajlRgWOCaqkxpixQ
 lfSOhaT7ndqhTn/7gWpBxdowNN/VEYy58hIwbDPniWFN9t4pQPmKsyr234benxaLRawL
 PVrWmqMFrKQqIpC4Wa6A2ZzSBZJT4hk4QYxnT1sUt3BTGc69FzawNB7NFjKmyqD/AQ9T
 4YlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=fruwrErec85F0eBr5XAV5Xp/8fLsJqYHjQccjJZvfwk=;
 b=l0mWbYypGLv9n9u8sHgO706xcGf2hNRiCPemhPcESKt7RX38QaX+X6boTOs5P6QqAP
 V4YCH5AB/emOnA5dCxmDvrb03SnpRWcXxCtD2EMq06TUS2fYbJhtwkYm5Tf7Z8dPQv8j
 SK+uRilVdvGjc3Q8uUegoE6nJT3Rad8bjbPncLECmh5DvR140YwmcNkVahBeZq170SYX
 g2KU0Fh2PlJDMbD+IMhm6xJ9O1r+F0C3nEXZ4hnfvFG/lXG7kgo4WBw8yo2eutNFHosz
 Ysui7gYmph3GL0xNSycPCDYFOj9lh4wm7pBysValCUiBZ5n8Z3UoIjafTDoQd3i5lycg
 +xSQ==
X-Gm-Message-State: ACgBeo37dHiLszY5cYdIJWP/Y12tdNx3sK+tLj2PW9+fZbkNytwQqCll
 k+Z9G8UrYxsx1PYPD3sgFe673Pgh+p0=
X-Google-Smtp-Source: AA6agR4YRkl5h4nqdhnGzgzspoFW5ewX247cvwDaRvxfsne0LXyL6+cT/s9gcpFxw2wlJzZcQmf75g==
X-Received: by 2002:a17:906:847c:b0:73f:d7cf:bf2d with SMTP id
 hx28-20020a170906847c00b0073fd7cfbf2dmr20585546ejc.327.1662049617285; 
 Thu, 01 Sep 2022 09:26:57 -0700 (PDT)
Received: from osoxes.fritz.box
 (p200300faaf0bb2009c4947838afc41b6.dip0.t-ipconnect.de.
 [2003:fa:af0b:b200:9c49:4783:8afc:41b6])
 by smtp.gmail.com with ESMTPSA id
 p6-20020aa7d306000000b00447c0dcbb99sm1587672edq.83.2022.09.01.09.26.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 01 Sep 2022 09:26:56 -0700 (PDT)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 Aurelien Jarno <aurelien@aurel32.net>, Paolo Bonzini <pbonzini@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>,
 Richard Henderson <richard.henderson@linaro.org>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Ani Sinha <ani@anisinha.ca>,
 Igor Mammedov <imammedo@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Bernhard Beschow <shentey@gmail.com>
Subject: [PATCH 10/42] hw/isa/piix3: Wire up ACPI interrupt internally
Date: Thu,  1 Sep 2022 18:25:41 +0200
Message-Id: <20220901162613.6939-11-shentey@gmail.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220901162613.6939-1-shentey@gmail.com>
References: <20220901162613.6939-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::634;
 envelope-from=shentey@gmail.com; helo=mail-ej1-x634.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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

Now that PIIX3 has the PIC integrated, the ACPI controller can be wired
up internally.

Signed-off-by: Bernhard Beschow <shentey@gmail.com>
---
 hw/i386/pc_piix.c | 1 -
 hw/isa/piix3.c    | 2 ++
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/hw/i386/pc_piix.c b/hw/i386/pc_piix.c
index c76afbc7e3..907cf865b8 100644
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
index 0e86a9a3cb..e85dec3200 100644
--- a/hw/isa/piix3.c
+++ b/hw/isa/piix3.c
@@ -353,6 +353,8 @@ static void pci_piix3_realize(PCIDevice *dev, Error **errp)
         if (!qdev_realize(DEVICE(&d->pm), BUS(pci_bus), errp)) {
             return;
         }
+        qdev_connect_gpio_out(DEVICE(&d->pm), 0,
+                              qdev_get_gpio_in(DEVICE(&d->pic), 9));
     }
 }
 
-- 
2.37.3


