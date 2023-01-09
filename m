Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5857D662D86
	for <lists+qemu-devel@lfdr.de>; Mon,  9 Jan 2023 18:49:15 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pEvuN-0003X1-G6; Mon, 09 Jan 2023 12:26:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1pEvtu-0002w2-DT; Mon, 09 Jan 2023 12:25:37 -0500
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1pEvts-0001Jo-LN; Mon, 09 Jan 2023 12:25:34 -0500
Received: by mail-ej1-x62b.google.com with SMTP id fc4so21872557ejc.12;
 Mon, 09 Jan 2023 09:25:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=zuCBNECzW2xUKqTH2aggcsIdi9V+87vm/4qa1pOYyVQ=;
 b=ZoLolVcgGw323H8+V1sEuLb9qyh1sfKNdJrSkBXpTOuQJsSIoPBlqaH3xQRt7LymYC
 Lb9wBnNswqlwS6EjTg7vq5AnRYq+RSpKrbeuE+pZoMlQe2SF7qcYD2r7SvUQmiJ5UQPl
 T4YK3kikc2bVQyMT3hLgpYuzsA74fTigVPHsANe0q4Tb7NWNOs6OXnnRVqcjGCxzwZST
 nzS5Y/15j/p3Ja3bacXWcmef38sTi1v+e6BzhfanYFz5O1AXq7Pn4CPtXNbfRgMZSEFJ
 Kld9qZN6TjNn/AAmLDrgw9RXnRhaD9DWyLNaLGiYre61LB9DgPElcQBQWS1s1GreTId+
 XCrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=zuCBNECzW2xUKqTH2aggcsIdi9V+87vm/4qa1pOYyVQ=;
 b=W1PgUwQz+z/vIWkGmQ5xubLJ8aQMrC4wc4r/MztUKhazJaZI7Ywn44Zp1pYWzgFdbP
 /mxWYuUw1XDlxPyJqFR57FPPbpT4IW8gIIUH8qZeIx2txMJP9UPbGMv2IOIC2f3ZyyJm
 e0O2WLdYiLXJ5YscVpSRWJmMDp2WlXD4hYxOhnTmuPZ+//KVTgC24MDKNWmmCh5lva+c
 39tKC9r29I5VW39T49JpXD9jHVaBM2e610JxNA/OQcrS/VNn3AxsxWJ2hU82ioYlpu3c
 AvtNvBIeysWm4EQX1Zqfj5WjGrH5FbdOfEMNj0OMyxg72F+1C+mraoTqlJGcLm2nu6k4
 kyyg==
X-Gm-Message-State: AFqh2kpvl6/sGHix7Rq6S8ioKTSQnK6LopJ7hGxuUNBP/2yxRHedY18E
 84ZkhoOdyx6un8RLAI6ZftyqHnAzKFQ4kQ==
X-Google-Smtp-Source: AMrXdXu6ysgnsIvkTrWca6JoWv/pJkirL+qUlJD7fixxur4/DZeGWSdCwFsaptDWWB7/dHrC8+54vw==
X-Received: by 2002:a17:907:6e05:b0:7c1:235d:2a2b with SMTP id
 sd5-20020a1709076e0500b007c1235d2a2bmr72194168ejc.24.1673285130569; 
 Mon, 09 Jan 2023 09:25:30 -0800 (PST)
Received: from osoxes.fritz.box
 (p200300faaf0bb2009c4947838afc41b6.dip0.t-ipconnect.de.
 [2003:fa:af0b:b200:9c49:4783:8afc:41b6])
 by smtp.gmail.com with ESMTPSA id
 18-20020a170906201200b00846734faa9asm3925625ejo.164.2023.01.09.09.25.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Jan 2023 09:25:29 -0800 (PST)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Cc: John G Johnson <john.g.johnson@oracle.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Igor Mammedov <imammedo@redhat.com>,
 Elena Ufimtseva <elena.ufimtseva@oracle.com>, Ani Sinha <ani@anisinha.ca>,
 Eduardo Habkost <eduardo@habkost.net>, Gerd Hoffmann <kraxel@redhat.com>,
 Jagannathan Raman <jag.raman@oracle.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 John Snow <jsnow@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>,
 qemu-ppc@nongnu.org, Jiaxun Yang <jiaxun.yang@flygoat.com>,
 qemu-block@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, qemu-arm@nongnu.org,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 Bernhard Beschow <shentey@gmail.com>
Subject: [PATCH v6 32/33] hw/isa/piix: Consolidate IRQ triggering
Date: Mon,  9 Jan 2023 18:23:45 +0100
Message-Id: <20230109172347.1830-33-shentey@gmail.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230109172347.1830-1-shentey@gmail.com>
References: <20230109172347.1830-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62b;
 envelope-from=shentey@gmail.com; helo=mail-ej1-x62b.google.com
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
index 33ea5275ec..f125a6175f 100644
--- a/hw/isa/piix.c
+++ b/hw/isa/piix.c
@@ -83,27 +83,6 @@ static void piix_set_irq(void *opaque, int pirq, int level)
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
-        qemu_set_irq(s->pic.in_irqs[pic_irq], pic_level);
-    }
-}
-
 static PCIINTxRoute piix3_route_intx_pin_to_irq(void *opaque, int pin)
 {
     PIIXState *piix3 = opaque;
@@ -239,7 +218,7 @@ static int piix4_post_load(void *opaque, int version_id)
         s->rcr = 0;
     }
 
-    return 0;
+    return piix3_post_load(opaque, version_id);
 }
 
 static int piix3_pre_save(void *opaque)
@@ -554,7 +533,7 @@ static void piix4_realize(PCIDevice *dev, Error **errp)
     /* RTC */
     s->rtc.irq = qdev_get_gpio_in(DEVICE(&s->pic), s->rtc.isairq);
 
-    pci_bus_irqs(pci_bus, piix4_set_irq, s, PIIX_NUM_PIRQS);
+    pci_bus_irqs(pci_bus, piix_set_irq, s, PIIX_NUM_PIRQS);
 }
 
 static void piix4_init(Object *obj)
@@ -571,6 +550,7 @@ static void piix4_class_init(ObjectClass *klass, void *data)
     DeviceClass *dc = DEVICE_CLASS(klass);
     PCIDeviceClass *k = PCI_DEVICE_CLASS(klass);
 
+    k->config_write = piix_write_config;
     k->realize = piix4_realize;
     k->vendor_id = PCI_VENDOR_ID_INTEL;
     k->device_id = PCI_DEVICE_ID_INTEL_82371AB_0;
-- 
2.39.0


