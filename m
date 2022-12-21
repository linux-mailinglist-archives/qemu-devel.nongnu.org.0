Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D8C06534AF
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Dec 2022 18:11:56 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p82UI-00042X-BK; Wed, 21 Dec 2022 12:02:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1p82Su-0002sy-73; Wed, 21 Dec 2022 12:01:13 -0500
Received: from mail-ed1-x52b.google.com ([2a00:1450:4864:20::52b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1p82Ss-0008FS-Cx; Wed, 21 Dec 2022 12:01:11 -0500
Received: by mail-ed1-x52b.google.com with SMTP id i9so22890392edj.4;
 Wed, 21 Dec 2022 09:01:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=sSe7J/X+cUlqVCHI1YPVT6KMQDPnJC78K96/qM1vwVM=;
 b=Cy/vwIlvPRa2Tfeuk2SNmEKaDEQUm/YfrAH2EwmyZL7gs3z1z5pgc3vtXB1nQ8MS3g
 +Mr11JNpDjDlGB8TvIJayfg6AixfBDBFKoIn0b/AiljABsd7Q1wpxfwx0Pn0nn0R2Dqu
 mYsL8BpmGcCueat/SOqIumqZD5snpc5MCLHwPp9r8+fB6Zx8fpx+St9Mqo7vn/LevdFT
 RfcpzXf3OQEAzJ+cCLJgYg5Q4BG0VJv1Qaq0FFi4dTdMOTenHF0dTgyiRvG7282BAu+k
 tsxOcGripmSDYu2VrMi3pduDukcn4iQZDuZki71ECYK77tk/lwkUSKDLWJItXnw0flS/
 kbxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=sSe7J/X+cUlqVCHI1YPVT6KMQDPnJC78K96/qM1vwVM=;
 b=zelYKCMoZDxa8iBSRcm9TH7Kb7IFUfKpizi7+7IetftkMuSpCmiS/TVHunsEY00EBV
 4eEdQ6HHcczavFRF0gdYPP0pq4voe0iy1XDVc8hBPkWLzOJ7K6RA7+tmCp8f26aCIm71
 Qkb3DpK31TEd/UYhd+RWcK3usUiiU0zbt+PMEZo8x6XSX0MkPGEQ7hXK/meOpy0aTGTz
 HOrQookRJ9w41bssl38EswDCm2evQ0klex+/impm/FxNECj2wou1TXFQncuBu204IgxA
 a0s6yDeYG4i3RF2Z8uknSN4PLkM6UVD7AKmNz7Csieqywis92EiUJEqPGwogUqUzexrq
 D4Dw==
X-Gm-Message-State: AFqh2kqhvwUCXbd2N98kRQbT9u9tLoN+bTywLV5L7vAYRSrymdoU8yB7
 ZqSeBFFhCsQFoIozj3/cpPXdnxkcq+Q=
X-Google-Smtp-Source: AMrXdXvaGCjq8eQfHCoFWbcz0+IRw+d3sRMTUNgv8/wwqN8+NgTl/IwmbeFkdFySb9LNlfXYxSk2SQ==
X-Received: by 2002:a05:6402:2026:b0:46c:43ff:697b with SMTP id
 ay6-20020a056402202600b0046c43ff697bmr2218260edb.3.1671642064272; 
 Wed, 21 Dec 2022 09:01:04 -0800 (PST)
Received: from localhost.localdomain
 (dynamic-092-224-051-061.92.224.pool.telefonica.de. [92.224.51.61])
 by smtp.gmail.com with ESMTPSA id
 n14-20020aa7db4e000000b0047466e46662sm7204019edt.39.2022.12.21.09.01.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Dec 2022 09:01:03 -0800 (PST)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Igor Mammedov <imammedo@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-block@nongnu.org,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Ani Sinha <ani@anisinha.ca>,
 John Snow <jsnow@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Bernhard Beschow <shentey@gmail.com>
Subject: [PATCH v4 15/30] hw/isa/piix3: Wire up ACPI interrupt internally
Date: Wed, 21 Dec 2022 17:59:48 +0100
Message-Id: <20221221170003.2929-16-shentey@gmail.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20221221170003.2929-1-shentey@gmail.com>
References: <20221221170003.2929-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52b;
 envelope-from=shentey@gmail.com; helo=mail-ed1-x52b.google.com
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
 hw/isa/piix3.c    | 2 ++
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/hw/i386/pc_piix.c b/hw/i386/pc_piix.c
index 8c3d3698eb..3ff84209fe 100644
--- a/hw/i386/pc_piix.c
+++ b/hw/i386/pc_piix.c
@@ -329,7 +329,6 @@ static void pc_init1(MachineState *machine,
     if (piix4_pm) {
         smi_irq = qemu_allocate_irq(pc_acpi_smi_interrupt, first_cpu, 0);
 
-        qdev_connect_gpio_out(DEVICE(piix4_pm), 0, x86ms->gsi[9]);
         qdev_connect_gpio_out_named(DEVICE(piix4_pm), "smi-irq", 0, smi_irq);
         pcms->smbus = I2C_BUS(qdev_get_child_bus(DEVICE(piix4_pm), "i2c"));
         /* TODO: Populate SPD eeprom data.  */
diff --git a/hw/isa/piix3.c b/hw/isa/piix3.c
index d6d36db01e..c33a3faa2f 100644
--- a/hw/isa/piix3.c
+++ b/hw/isa/piix3.c
@@ -343,6 +343,8 @@ static void pci_piix3_realize(PCIDevice *dev, Error **errp)
         if (!qdev_realize(DEVICE(&d->pm), BUS(pci_bus), errp)) {
             return;
         }
+        qdev_connect_gpio_out(DEVICE(&d->pm), 0,
+                              qdev_get_gpio_in(DEVICE(&d->pic), 9));
     }
 }
 
-- 
2.39.0


