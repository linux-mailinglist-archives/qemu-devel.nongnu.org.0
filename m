Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 291704B34BF
	for <lists+qemu-devel@lfdr.de>; Sat, 12 Feb 2022 12:43:15 +0100 (CET)
Received: from localhost ([::1]:49650 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nIqo6-0004bg-83
	for lists+qemu-devel@lfdr.de; Sat, 12 Feb 2022 06:43:14 -0500
Received: from eggs.gnu.org ([209.51.188.92]:33802)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1nIqgs-0006l3-Is
 for qemu-devel@nongnu.org; Sat, 12 Feb 2022 06:35:47 -0500
Received: from [2a00:1450:4864:20::630] (port=45996
 helo=mail-ej1-x630.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1nIqgq-0005bA-Ch
 for qemu-devel@nongnu.org; Sat, 12 Feb 2022 06:35:45 -0500
Received: by mail-ej1-x630.google.com with SMTP id h22so9716812ejl.12
 for <qemu-devel@nongnu.org>; Sat, 12 Feb 2022 03:35:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=N2QjOGu2ArQZzdQJMMDMCb9JapaoTt59BGwaEZc+Ac8=;
 b=kUbslPP6+C1p5+jltnIodG2ZcZS07Pk5FUw6ReeuJjT1DfunJ+Xk3/sMCYVr47HQzI
 M2mG03sXEp9ZkFT76SLtzBu+lhasF6JfX60aNL/wk+XUxlTRRUwrmOY071cyB8VMZACj
 Yr9XXihNfR4dF5sXN/mPrauaqgV4V+CKAn4Kzgxw/My02j/wqjxhyHOQe1GfF4ay/heE
 WBBp5VdgSWJ0D0wC6W2yYN3q3VxPiaDbdhTe+muCW4nNEASoWiRI40Py++uMY4Ut12XI
 lTvu9nN2ClEP/Ap2O5NeBf+avUStx8PfHv72MGjyBMj5HFkuz4LfErdmrqosQif7JO7W
 vI4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=N2QjOGu2ArQZzdQJMMDMCb9JapaoTt59BGwaEZc+Ac8=;
 b=gLHzsdUNJMQa1Mbs4j+xIPVmkMUO388Av03R84qnJAay6su8Bp2ZnGWyYasIwwXokV
 s2A3iKyLStvRPAJ4dGVp2p28OMrJpi836iqhXJpoLlzwX1eKNQKwzpvjBDBI5AxgSCCl
 JzRrXapZ9rXYzP4zL7jqJ53XTS/Llh2OfaOqTQWX1kgRPRCLOzq5KX+hqNWW9nWS2zaO
 rUgyULVgJebxmywk8Tp5xXv3mor6ISkSOBEAesKMuLjBYZSVzBtsCB66JFrZ77sVU/rn
 RYqnS7fhWymU2XxxzCqgarEuRaQd/Z2PV3aXkOAWHU3jWn1IMQwP/7sODGMCaRSbh4rR
 ddWQ==
X-Gm-Message-State: AOAM532I2R9ZTua44hNvN7i1zqCXS2DRtLotwv+g8PqI2VNTCGvtNOaG
 yprg88bYec3NTIlaTiGqr75S/tdKeUedR5vUXog=
X-Google-Smtp-Source: ABdhPJw6UIzYtdQ3tVe9rt3+E3pcmhB8MxhMtokVjSzQYhbzYNR5fKtLqrI0eMqHJsszWIKZdS3Tyg==
X-Received: by 2002:a17:906:7383:: with SMTP id
 f3mr4530792ejl.687.1644665743051; 
 Sat, 12 Feb 2022 03:35:43 -0800 (PST)
Received: from osoxes.fritz.box (i577BC145.versanet.de. [87.123.193.69])
 by smtp.gmail.com with ESMTPSA id z14sm889288edc.62.2022.02.12.03.35.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 12 Feb 2022 03:35:42 -0800 (PST)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 3/5] isa/piix4: Resolve global variables
Date: Sat, 12 Feb 2022 12:35:17 +0100
Message-Id: <20220212113519.69527-4-shentey@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220212113519.69527-1-shentey@gmail.com>
References: <20220212113519.69527-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::630
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::630;
 envelope-from=shentey@gmail.com; helo=mail-ej1-x630.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: "Michael S. Tsirkin" <mst@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 Bernhard Beschow <shentey@gmail.com>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Now that piix4_set_irq's opaque parameter references own PIIX4State,
piix4_dev becomes redundant and pci_irq_levels can be moved into PIIX4State.

Signed-off-by: Bernhard Beschow <shentey@gmail.com>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/isa/piix4.c                | 22 +++++++++-------------
 include/hw/southbridge/piix.h |  2 --
 2 files changed, 9 insertions(+), 15 deletions(-)

diff --git a/hw/isa/piix4.c b/hw/isa/piix4.c
index a31e9714cf..964e09cf7f 100644
--- a/hw/isa/piix4.c
+++ b/hw/isa/piix4.c
@@ -39,14 +39,14 @@
 #include "sysemu/runstate.h"
 #include "qom/object.h"
 
-PCIDevice *piix4_dev;
-
 struct PIIX4State {
     PCIDevice dev;
     qemu_irq cpu_intr;
     qemu_irq *isa;
     qemu_irq i8259[ISA_NUM_IRQS];
 
+    int pci_irq_levels[PIIX_NUM_PIRQS];
+
     RTCState rtc;
     /* Reset Control Register */
     MemoryRegion rcr_mem;
@@ -55,24 +55,22 @@ struct PIIX4State {
 
 OBJECT_DECLARE_SIMPLE_TYPE(PIIX4State, PIIX4_PCI_DEVICE)
 
-static int pci_irq_levels[4];
-
 static void piix4_set_irq(void *opaque, int irq_num, int level)
 {
     int i, pic_irq, pic_level;
     PIIX4State *s = opaque;
 
-    pci_irq_levels[irq_num] = level;
+    s->pci_irq_levels[irq_num] = level;
 
     /* now we change the pic irq level according to the piix irq mappings */
     /* XXX: optimize */
-    pic_irq = piix4_dev->config[PIIX_PIRQCA + irq_num];
-    if (pic_irq < 16) {
+    pic_irq = s->dev.config[PIIX_PIRQCA + irq_num];
+    if (pic_irq < ISA_NUM_IRQS) {
         /* The pic level is the logical OR of all the PCI irqs mapped to it. */
         pic_level = 0;
-        for (i = 0; i < 4; i++) {
-            if (pic_irq == piix4_dev->config[PIIX_PIRQCA + i]) {
-                pic_level |= pci_irq_levels[i];
+        for (i = 0; i < PIIX_NUM_PIRQS; i++) {
+            if (pic_irq == s->dev.config[PIIX_PIRQCA + i]) {
+                pic_level |= s->pci_irq_levels[i];
             }
         }
         qemu_set_irq(s->i8259[pic_irq], pic_level);
@@ -223,8 +221,6 @@ static void piix4_realize(PCIDevice *dev, Error **errp)
         return;
     }
     isa_init_irq(ISA_DEVICE(&s->rtc), &s->rtc.irq, RTC_ISA_IRQ);
-
-    piix4_dev = dev;
 }
 
 static void piix4_init(Object *obj)
@@ -323,7 +319,7 @@ DeviceState *piix4_create(PCIBus *pci_bus, ISABus **isa_bus, I2CBus **smbus)
                                NULL, 0, NULL);
     }
 
-    pci_bus_irqs(pci_bus, piix4_set_irq, pci_slot_get_pirq, s, 4);
+    pci_bus_irqs(pci_bus, piix4_set_irq, pci_slot_get_pirq, s, PIIX_NUM_PIRQS);
 
     for (int i = 0; i < ISA_NUM_IRQS; i++) {
         s->i8259[i] = qdev_get_gpio_in_named(dev, "isa", i);
diff --git a/include/hw/southbridge/piix.h b/include/hw/southbridge/piix.h
index 6387f2b612..f63f83e5c6 100644
--- a/include/hw/southbridge/piix.h
+++ b/include/hw/southbridge/piix.h
@@ -70,8 +70,6 @@ typedef struct PIIXState PIIX3State;
 DECLARE_INSTANCE_CHECKER(PIIX3State, PIIX3_PCI_DEVICE,
                          TYPE_PIIX3_PCI_DEVICE)
 
-extern PCIDevice *piix4_dev;
-
 PIIX3State *piix3_create(PCIBus *pci_bus, ISABus **isa_bus);
 
 DeviceState *piix4_create(PCIBus *pci_bus, ISABus **isa_bus, I2CBus **smbus);
-- 
2.35.1


