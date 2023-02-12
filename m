Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D5EE369375B
	for <lists+qemu-devel@lfdr.de>; Sun, 12 Feb 2023 13:42:30 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pRBg2-0000ue-QU; Sun, 12 Feb 2023 07:42:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1pRBdB-0007ad-SM; Sun, 12 Feb 2023 07:38:58 -0500
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1pRBd6-0001LO-6R; Sun, 12 Feb 2023 07:38:57 -0500
Received: by mail-ej1-x629.google.com with SMTP id hx15so25806482ejc.11;
 Sun, 12 Feb 2023 04:38:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=cP/K5sLA1hp4AeBOvxkSNSI4bFZU4lnmLtjY8V1zBfw=;
 b=MFcoMdXUyTZYIxQrOCghikqQA+ZttkQe22yzKpbxzIOqL6lU/VCNCfxwxgSbDFoOdv
 NxGbHnbvQeimrTjNZvrJ6Zy4gldudyQndZALRs0ZV5Euv0k+Xr9PgTRFWs/GuJBrN0sv
 v/EFSUgu/wkTviPsNc5lZ5VDVH5Yy7LsLqS6Vfnq0InSPDasGApIJAQEqpmHzirfRaSs
 UZEomiwdxIUOOCUc6c6LwJCYNxzIc3yKY/oulz11nDEElxGFDC9LbhRslhFC7eKT45Cp
 opxdSkq/5fF86HH4KvRqjCwWwG296FCaiOeBWLCXYU89OsPAwNVDEsoCSYf5dsIxtcxI
 3dJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=cP/K5sLA1hp4AeBOvxkSNSI4bFZU4lnmLtjY8V1zBfw=;
 b=y580Zakuul2owviqoU5DFsn/lVr7EIPoYdAI3DMO8c24T4ieMv+NrwMCsyeTB9WYui
 x1rLNhjyaFNkjeEuLhnhBe6xHbFiXpf0azwQNy19tra6Z7A9uQh7iqDbrd+GMQboQXTT
 z1+VDrca/BOInPB3kME4UIWhh2+k9M6u10JrGyX18neG17dnpC3sxrj7FHYiIVLP2wXM
 merF7K8aVsIHjBfX5EtCq3FdqrdVVWjV1dTQwjdYyytC4S/FcSankhnIbF7V2/7r3TmQ
 btmoG7DR5fIXEmhzOASDq2pcDNZeiPqEd+W/u5jleuR/sdKB3qCQVle4giK+3sSD2/ys
 2s9Q==
X-Gm-Message-State: AO0yUKVntaAqyOCjAl0x21yGzWHmP8zMIT8DoNO3B8qkigTF69nQytbd
 2A++O7a5tTOvgbbnhTLo2JZfjA7OUUQ=
X-Google-Smtp-Source: AK7set8XtPphII799YOVmha4vyZ0kXRbQg8hc8CbNqiyMkFiD2VyLBiGPVAwZokyedjJYDH3uzLRUA==
X-Received: by 2002:a17:907:1b29:b0:8b1:7fa:ba22 with SMTP id
 mp41-20020a1709071b2900b008b107faba22mr1595574ejc.27.1676205528818; 
 Sun, 12 Feb 2023 04:38:48 -0800 (PST)
Received: from localhost.localdomain
 (dynamic-077-011-172-153.77.11.pool.telefonica.de. [77.11.172.153])
 by smtp.gmail.com with ESMTPSA id
 qw14-20020a170906fcae00b008af1f1bee79sm5233164ejb.9.2023.02.12.04.38.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 12 Feb 2023 04:38:48 -0800 (PST)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 qemu-arm@nongnu.org, Elena Ufimtseva <elena.ufimtseva@oracle.com>,
 qemu-block@nongnu.org, Richard Henderson <richard.henderson@linaro.org>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Gerd Hoffmann <kraxel@redhat.com>, Ani Sinha <ani@anisinha.ca>,
 John Snow <jsnow@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Aurelien Jarno <aurelien@aurel32.net>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Jagannathan Raman <jag.raman@oracle.com>, qemu-ppc@nongnu.org,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Igor Mammedov <imammedo@redhat.com>,
 John G Johnson <john.g.johnson@oracle.com>,
 Bernhard Beschow <shentey@gmail.com>
Subject: [PATCH v7 08/23] hw/isa/piix3: Wire up ACPI interrupt internally
Date: Sun, 12 Feb 2023 13:37:50 +0100
Message-Id: <20230212123805.30799-9-shentey@gmail.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230212123805.30799-1-shentey@gmail.com>
References: <20230212123805.30799-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::629;
 envelope-from=shentey@gmail.com; helo=mail-ej1-x629.google.com
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
index bd66a5682b..8af4d5aa1b 100644
--- a/hw/i386/pc_piix.c
+++ b/hw/i386/pc_piix.c
@@ -327,7 +327,6 @@ static void pc_init1(MachineState *machine,
     if (piix4_pm) {
         smi_irq = qemu_allocate_irq(pc_acpi_smi_interrupt, first_cpu, 0);
 
-        qdev_connect_gpio_out(DEVICE(piix4_pm), 0, x86ms->gsi[9]);
         qdev_connect_gpio_out_named(DEVICE(piix4_pm), "smi-irq", 0, smi_irq);
         pcms->smbus = I2C_BUS(qdev_get_child_bus(DEVICE(piix4_pm), "i2c"));
         /* TODO: Populate SPD eeprom data.  */
diff --git a/hw/isa/piix3.c b/hw/isa/piix3.c
index dd8b712085..dfdae27daf 100644
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
2.39.1


