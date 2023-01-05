Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FC3A65EEFE
	for <lists+qemu-devel@lfdr.de>; Thu,  5 Jan 2023 15:42:12 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pDRJL-0002v6-IQ; Thu, 05 Jan 2023 09:33:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1pDRJ9-0002mu-3k; Thu, 05 Jan 2023 09:33:27 -0500
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1pDRJ7-0006tZ-6C; Thu, 05 Jan 2023 09:33:26 -0500
Received: by mail-wr1-x42a.google.com with SMTP id s9so4302032wru.13;
 Thu, 05 Jan 2023 06:33:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/bpLpaNXFNCOqMhVUmSB3BwAsWhMZztqdMJYCfiAm1E=;
 b=HMWuCU4X4QDxLHncp0WwXakG5luN0lQQfFKd0tRNxVjpY6fCQk/g5lUYWd7flHDNfH
 0bsNsifKGu592j/uRcYM2OhxfLt88q4NoiVivVyC+Ue1RXs7m9uOuyzaRNe3tDLjC5iE
 YGxVjdVqK6BGVzELJ7RZ+l/P1xFPh2Nxle4BG04R5GrsOzqNSuyHn+c9it/s/dSgFslf
 cLkUdGN6ftEIOSkvHEP7qhHZhMhvBO88KJlMvX+ibVPa8R/REcoaAFwM2hojPmo0ke4N
 zuySecoiftm725dtg7kDjbhu6m2dhBY2Z5sjfrYxx6NxvKGyIRk3lU7IDNgdeE3C3K7Q
 6d2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=/bpLpaNXFNCOqMhVUmSB3BwAsWhMZztqdMJYCfiAm1E=;
 b=yz2t+nWMYunUpU/7W2AqN2ZkECf8MV0xFGwgZhd42OX+M1t6Cxk8/aHiv+dXd7wtnZ
 OiIFMt1DqqZdMtrx71bgPHQ9IlaJp+wwEn5pRSPpFPRB9FOBxnOeYAFOkury8PYBMdBu
 TX/UJFPyhjY8Z7PRfaxI2Ua6eshIzM7/vVg/ZWKF1hCsxXpYap6qFXGhRy8JgXFAdPtL
 nTRfMg0oBm/Ea812OldWnm2OAPA2SVAst2B2YxX5kJZ7FmAMg7+gxIYOAwsfgZ9fFCO7
 +Pw6yDd4H2S59IoEC0YqDsEF33N1qZBeGiLkkcAqUTUzQmi6t2XpCl9JHSImfS5VmXM4
 O5dA==
X-Gm-Message-State: AFqh2kon+s9D9+tqZcOAMbAWwMc5DbbRvyjXjIcHoLU5aYR2O7A9KKOC
 jnWZFT8yPLE7RVoMAzbhZ+tv6RVq0h8LLg==
X-Google-Smtp-Source: AMrXdXuORBW13dQ3KC3nMkyBONsiFnGqVI+x4f1XGhCjP+mcpm+mq3Bdmllybk91Skjk9HhTXVB4UA==
X-Received: by 2002:adf:f1c9:0:b0:242:1d69:1ba1 with SMTP id
 z9-20020adff1c9000000b002421d691ba1mr38981231wro.44.1672929203695; 
 Thu, 05 Jan 2023 06:33:23 -0800 (PST)
Received: from osoxes.fritz.box
 (p200300faaf0bb2009c4947838afc41b6.dip0.t-ipconnect.de.
 [2003:fa:af0b:b200:9c49:4783:8afc:41b6])
 by smtp.gmail.com with ESMTPSA id
 bt15-20020a056000080f00b00297dcfdc90fsm12260447wrb.24.2023.01.05.06.33.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Jan 2023 06:33:23 -0800 (PST)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Cc: Eduardo Habkost <eduardo@habkost.net>, qemu-block@nongnu.org,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 Ani Sinha <ani@anisinha.ca>,
 Richard Henderson <richard.henderson@linaro.org>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Aurelien Jarno <aurelien@aurel32.net>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 John Snow <jsnow@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Bernhard Beschow <shentey@gmail.com>
Subject: [PATCH v5 16/31] hw/isa/piix3: Wire up ACPI interrupt internally
Date: Thu,  5 Jan 2023 15:32:13 +0100
Message-Id: <20230105143228.244965-17-shentey@gmail.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230105143228.244965-1-shentey@gmail.com>
References: <20230105143228.244965-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=shentey@gmail.com; helo=mail-wr1-x42a.google.com
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
index f92fa34d76..aacdb72b7c 100644
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
index a549b1a8a5..6d2ffd449c 100644
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


