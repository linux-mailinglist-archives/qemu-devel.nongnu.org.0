Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D18AC693769
	for <lists+qemu-devel@lfdr.de>; Sun, 12 Feb 2023 13:46:38 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pRBie-0005v8-Je; Sun, 12 Feb 2023 07:44:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1pRBdT-0007pf-26; Sun, 12 Feb 2023 07:39:15 -0500
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1pRBdR-0001J7-9B; Sun, 12 Feb 2023 07:39:14 -0500
Received: by mail-ej1-x62c.google.com with SMTP id sb24so1914567ejb.8;
 Sun, 12 Feb 2023 04:39:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ECP1xJGw+ML8nlc+nEH9J61DzQpYD4Zur4gJJXT+GUw=;
 b=G8EkRwSj1Y1Wkz/VzIx/FjyZhvJJuTNH0wJbcJ/wcG2V0hPMuXiEzUfUHgLTaADCvq
 LaLqJ2OBJIy0/1Dj3IJIbN6pN1CYb48uNU5vl21KQCnJOKHUB/1ohKRh8PvQsVc3j73w
 Lepv9dyj4iJ/BkYjIDUi3gGLy5kLMuORb2g3wo1hK3n+Q4HA2Iwl4vMd7X4lDfqOmHBp
 /tVkA3SAOgG7n+Dnu7l8ujLdMV2YKSH1+wBLd278O8i4I///UbRfRXnKcyUnGl6xAlO0
 JbcEQkc/MURrfA3ifo7sTu7iTtGxplU63BoalpFV4hKpcOt1KO3qogsHZFuO6Eg7mfvB
 +8qA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ECP1xJGw+ML8nlc+nEH9J61DzQpYD4Zur4gJJXT+GUw=;
 b=clbpVj6DYpXsZUEDfwaCzojB5Gla325bc9MlCsiqoklFQo9H0aW2mvBL3Hk/XLJXcP
 RKUDSm6X8vDnQ1AnnbO81BKZTPbyeX1wnzyOttdu6HKeU8O7PBX+d2XrWfvYajntbh0e
 foH3zsiDh1mGfr6EMSWg16bHdvasteVNYF2sD9g2AD7oTgA8BkLd0um+ILxNsk/uy/0U
 T2iWfsDLzopFrDN2n4uH4szuuVsxNcdERME2srjP0NZgIBg6C2w5j+kkcFoVkbB3xtPq
 hE3V3qQtZbJugRwix/VsWYLBz9PTb0HUHs6XN+bYckXm8ieyrS+XGzQXLaT8UtlBUExh
 QwFw==
X-Gm-Message-State: AO0yUKUgLj1FozikVH4dySx0GfAdjrUnNEVjS39CYzB8klwd9qkiP2DB
 13/TRYXAtBqhd1+7KkpOXrXTcYiRjxM=
X-Google-Smtp-Source: AK7set8CHknwFZQ78YvJFaDW1zkiTkaTtSJu8c2houRDIGHYgnfz6GXil4TC2BhNH7OXdrZmO/XAwg==
X-Received: by 2002:a17:907:1707:b0:877:5dbc:da84 with SMTP id
 le7-20020a170907170700b008775dbcda84mr22586681ejc.72.1676205551336; 
 Sun, 12 Feb 2023 04:39:11 -0800 (PST)
Received: from localhost.localdomain
 (dynamic-077-011-172-153.77.11.pool.telefonica.de. [77.11.172.153])
 by smtp.gmail.com with ESMTPSA id
 qw14-20020a170906fcae00b008af1f1bee79sm5233164ejb.9.2023.02.12.04.39.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 12 Feb 2023 04:39:10 -0800 (PST)
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
Subject: [PATCH v7 22/23] hw/isa/piix: Consolidate IRQ triggering
Date: Sun, 12 Feb 2023 13:38:04 +0100
Message-Id: <20230212123805.30799-23-shentey@gmail.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230212123805.30799-1-shentey@gmail.com>
References: <20230212123805.30799-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62c;
 envelope-from=shentey@gmail.com; helo=mail-ej1-x62c.google.com
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

Speeds up PIIX4 which resolves an old TODO.

Signed-off-by: Bernhard Beschow <shentey@gmail.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Message-Id: <20221022150508.26830-41-shentey@gmail.com>
---
 hw/isa/piix.c | 26 +++-----------------------
 1 file changed, 3 insertions(+), 23 deletions(-)

diff --git a/hw/isa/piix.c b/hw/isa/piix.c
index b0f0b42dae..0c644dc6e6 100644
--- a/hw/isa/piix.c
+++ b/hw/isa/piix.c
@@ -84,27 +84,6 @@ static void piix_set_irq(void *opaque, int pirq, int level)
     piix_set_irq_level(piix, pirq, level);
 }
 
-static void piix4_set_irq(void *opaque, int irq_num, int level)
-{
-    int i, pic_irq, pic_level;
-    PIIXState *s = opaque;
-    PCIBus *bus = pci_get_bus(&s->dev);
-
-    /* now we change the pic irq level according to the piix irq mappings */
-    /* XXX: optimize */
-    pic_irq = s->dev.config[PIIX_PIRQCA + irq_num];
-    if (pic_irq < ISA_NUM_IRQS) {
-        /* The pic level is the logical OR of all the PCI irqs mapped to it. */
-        pic_level = 0;
-        for (i = 0; i < PIIX_NUM_PIRQS; i++) {
-            if (pic_irq == s->dev.config[PIIX_PIRQCA + i]) {
-                pic_level |= pci_bus_get_irq_level(bus, i);
-            }
-        }
-        qemu_set_irq(s->pic[pic_irq], pic_level);
-    }
-}
-
 static PCIINTxRoute piix3_route_intx_pin_to_irq(void *opaque, int pin)
 {
     PIIXState *piix3 = opaque;
@@ -240,7 +219,7 @@ static int piix4_post_load(void *opaque, int version_id)
         s->rcr = 0;
     }
 
-    return 0;
+    return piix3_post_load(opaque, version_id);
 }
 
 static int piix3_pre_save(void *opaque)
@@ -567,7 +546,7 @@ static void piix4_realize(PCIDevice *dev, Error **errp)
     /* RTC */
     s->rtc.irq = s->pic[s->rtc.isairq];
 
-    pci_bus_irqs(pci_bus, piix4_set_irq, s, PIIX_NUM_PIRQS);
+    pci_bus_irqs(pci_bus, piix_set_irq, s, PIIX_NUM_PIRQS);
 }
 
 static void piix4_init(Object *obj)
@@ -585,6 +564,7 @@ static void piix4_class_init(ObjectClass *klass, void *data)
     DeviceClass *dc = DEVICE_CLASS(klass);
     PCIDeviceClass *k = PCI_DEVICE_CLASS(klass);
 
+    k->config_write = piix_write_config;
     k->realize = piix4_realize;
     k->vendor_id = PCI_VENDOR_ID_INTEL;
     k->device_id = PCI_DEVICE_ID_INTEL_82371AB_0;
-- 
2.39.1


