Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 991C1693761
	for <lists+qemu-devel@lfdr.de>; Sun, 12 Feb 2023 13:44:45 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pRBfC-0008VZ-9Z; Sun, 12 Feb 2023 07:41:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1pRBd6-0007Zh-0F; Sun, 12 Feb 2023 07:38:52 -0500
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1pRBd2-0001Kl-JD; Sun, 12 Feb 2023 07:38:50 -0500
Received: by mail-ed1-x52a.google.com with SMTP id p12so2400462edc.0;
 Sun, 12 Feb 2023 04:38:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=4cCYvgAYZDiGLGMaV0jRmu03b2WKitHGfTVXENYcFGA=;
 b=XyIKbq7ExxkQ8SHNLxFd771QGFU1BHmMmS2mbBYB1/X3JSMyRK3KBt3eM02NFhVWxC
 J+KqPtziLFHGYnKJcwEacG+CWRw0xk97X51K4+Eoig8oJIZsNyIICJ3A36Em+uCizOig
 jM2zUs9h3W1yNczKijDB1M9YmZGcXGauFoISCchw71pmiZNTzJymDzvx2ewljHqNs5HQ
 X9hhFKR4ZZpmpapAcJqKfgmi3yhmuilKnEQRQSo3OgZyWnXHuSdtnYr6aAXIAQn8giI2
 I4yyOCOFWZ+yH3fiTQIGPJBKubwoLgINXF37LVfvDR8WpxUSfOch//srJZuV/s42X//f
 lIpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=4cCYvgAYZDiGLGMaV0jRmu03b2WKitHGfTVXENYcFGA=;
 b=sfurpgy6QIAiuJ+pIwru2V3zVySDX1JolFr72kZ7/wpzUHVRohKdSVINPCUdv/mWk8
 TA1JWgXyotD/e4KTbL5XGgIiQxyeaMdrWI7fIvAi6gbvDW6l+iQerRjzEF4aGFOkN+qv
 jcr4gzFv/ZUU+gOM6+VWLZQmdyf+zCqnQAaucD485wkvOe798VgODwBILMuWq8pRj5fz
 DsgU/32Vc8yJdEu6xW1rXeacDEauW6Mlsd1FtZXEnkrtG5/VaCRfaUcxH0T7NAYaP7Ep
 +demxXeJAC5ZSja2R5zwFFxsICJbaAl5p3b3iHDnp/tmuiu8VU5ksX4WitISb4ABWRfM
 bcsw==
X-Gm-Message-State: AO0yUKWF3iy6lN09iDzNdFWRpVx/LdKG7/GtIcAWYl8wYXjZfhLzCZzN
 N5iuiW94yVq0KggZjLQn4cQF26tKD6g=
X-Google-Smtp-Source: AK7set/qarAUzccE2wUJhCbhH8Gp4TV0A1Sl36tA/yCsglBpJdjmR8KOFjmZVeRwbJXYMtapFyL/2w==
X-Received: by 2002:a05:6402:d51:b0:4aa:b228:eb72 with SMTP id
 ec17-20020a0564020d5100b004aab228eb72mr3568835edb.17.1676205525832; 
 Sun, 12 Feb 2023 04:38:45 -0800 (PST)
Received: from localhost.localdomain
 (dynamic-077-011-172-153.77.11.pool.telefonica.de. [77.11.172.153])
 by smtp.gmail.com with ESMTPSA id
 qw14-20020a170906fcae00b008af1f1bee79sm5233164ejb.9.2023.02.12.04.38.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 12 Feb 2023 04:38:45 -0800 (PST)
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
Subject: [PATCH v7 06/23] hw/isa/piix3: Move ISA bus IRQ assignments into host
 device
Date: Sun, 12 Feb 2023 13:37:48 +0100
Message-Id: <20230212123805.30799-7-shentey@gmail.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230212123805.30799-1-shentey@gmail.com>
References: <20230212123805.30799-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52a;
 envelope-from=shentey@gmail.com; helo=mail-ed1-x52a.google.com
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

Having the south bridge assign the ISA interrupts to the ISA bus itself
makes the south bridge more self contained. Furthermore, it allows ISA
interrupt wiring in pci_piix3_realize() which will be used in subsequent
patches.

Signed-off-by: Bernhard Beschow <shentey@gmail.com>
---
 hw/i386/pc_piix.c | 6 +++---
 hw/isa/piix3.c    | 2 ++
 2 files changed, 5 insertions(+), 3 deletions(-)

diff --git a/hw/i386/pc_piix.c b/hw/i386/pc_piix.c
index 5ea8d4a585..dbddc3d060 100644
--- a/hw/i386/pc_piix.c
+++ b/hw/i386/pc_piix.c
@@ -245,10 +245,10 @@ static void pc_init1(MachineState *machine,
         object_property_set_bool(OBJECT(pci_dev), "smm-enabled",
                                  x86_machine_is_smm_enabled(x86ms),
                                  &error_abort);
-        pci_realize_and_unref(pci_dev, pci_bus, &error_fatal);
-
         piix3 = PIIX3_PCI_DEVICE(pci_dev);
         piix3->pic = x86ms->gsi;
+        pci_realize_and_unref(pci_dev, pci_bus, &error_fatal);
+
         piix3_devfn = piix3->dev.devfn;
         isa_bus = ISA_BUS(qdev_get_child_bus(DEVICE(piix3), "isa.0"));
         rtc_state = ISA_DEVICE(object_resolve_path_component(OBJECT(pci_dev),
@@ -259,6 +259,7 @@ static void pc_init1(MachineState *machine,
         piix4_pm = NULL;
         isa_bus = isa_bus_new(NULL, get_system_memory(), system_io,
                               &error_abort);
+        isa_bus_irqs(isa_bus, x86ms->gsi);
 
         rtc_state = isa_new(TYPE_MC146818_RTC);
         qdev_prop_set_int32(DEVICE(rtc_state), "base_year", 2000);
@@ -267,7 +268,6 @@ static void pc_init1(MachineState *machine,
         i8257_dma_init(isa_bus, 0);
         pcms->hpet_enabled = false;
     }
-    isa_bus_irqs(isa_bus, x86ms->gsi);
 
     if (x86ms->pic == ON_OFF_AUTO_ON || x86ms->pic == ON_OFF_AUTO_AUTO) {
         pc_i8259_create(isa_bus, gsi_state->i8259_irq);
diff --git a/hw/isa/piix3.c b/hw/isa/piix3.c
index 27bd4dbf65..007225a96e 100644
--- a/hw/isa/piix3.c
+++ b/hw/isa/piix3.c
@@ -302,6 +302,8 @@ static void pci_piix3_realize(PCIDevice *dev, Error **errp)
     memory_region_add_subregion_overlap(pci_address_space_io(dev),
                                         PIIX_RCR_IOPORT, &d->rcr_mem, 1);
 
+    isa_bus_irqs(isa_bus, d->pic);
+
     i8257_dma_init(isa_bus, 0);
 
     /* RTC */
-- 
2.39.1


