Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C3B9648CE31
	for <lists+qemu-devel@lfdr.de>; Wed, 12 Jan 2022 23:02:31 +0100 (CET)
Received: from localhost ([::1]:47402 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n7lhO-0007xo-Uf
	for lists+qemu-devel@lfdr.de; Wed, 12 Jan 2022 17:02:30 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55806)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1n7lIm-0008SR-4E
 for qemu-devel@nongnu.org; Wed, 12 Jan 2022 16:37:05 -0500
Received: from [2a00:1450:4864:20::542] (port=35626
 helo=mail-ed1-x542.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1n7lIk-000530-JB
 for qemu-devel@nongnu.org; Wed, 12 Jan 2022 16:37:03 -0500
Received: by mail-ed1-x542.google.com with SMTP id q25so15331125edb.2
 for <qemu-devel@nongnu.org>; Wed, 12 Jan 2022 13:37:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=TBHeaQM20BsNjWMdQQxQ8d9fGD6DhnC03BwpZDT3DYU=;
 b=Sf/DBOt0D5fEPF65CRqjmwpvZJoMYv4nPeG5KfoTmyoB/t5qqs/WM9F1JFxG5/JC9J
 n2N+3rWhffXWn3LbWJTqEkZQ6iSP3J+dnWywW283/b2Mr5ZT+tEGhH+2rgcTFbKukxAK
 W7QTfdmeWjQjRoSf0dXgI29oXZipZfSdeV3R5Pa4/5vA1FWlLZYijVZm+gwuCJ9fQx4t
 THpmlDiJmP99RTqcYWPga7/PVnG969pAXcSjuSIk1UMpxq96kSW2gWg3vAQ2/NwlbW0R
 7jjjbvxaMlkV9QCXmvrtaVsLYqr43tFMNITjyizg9sO+HOm9iGoqyvpL+lhTgTo71yBK
 ib5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=TBHeaQM20BsNjWMdQQxQ8d9fGD6DhnC03BwpZDT3DYU=;
 b=O6ibvUXdZjhEKqO0uRVcOl1ncWX5dw9iYuFOcdjvzF+i8AOd7FpSks7EOvO7iqlMmB
 N4LnjtkC/3ZSyOyJWvYyPd3SDdLbvBBEgviYPiWdtaRpwW8wkLm2nPVeS7+vMOaU+3ib
 ylADbyQ+BX56zxvOxXBjla3C7RyRwdwBL3Rz8SsCwo4I6qq6ZMgq5+wPdy7v1PqfHGQ2
 CMWJVDJLgCI3an8QimaQCcpJcsmSBA0r8tdOKI+Z0XXrgZkn4By1GbBuawY0ZxDrgFow
 vBX9iwliQgQGHbsG2mFMwc3pXOJsluJ8N3ZISdqrXGPlearxU4MMrPJo+blivZaopWRw
 P2TQ==
X-Gm-Message-State: AOAM531sYlI0kxm13WFWHZn4IzLlOBVwWbJW52zCRxMMRxT+CkUuClIG
 nbiWgm+9uMN1ruSeUnjBTQnrgYVOH2kfOgQ8bXIuzw==
X-Google-Smtp-Source: ABdhPJxNqODzTm1V1E60EG2Gmu30cvNrMcLi5acxFo1wz4Qv3QJOsTrYpm8QPQlB6kQOPyGIyqOSPg==
X-Received: by 2002:aa7:c30f:: with SMTP id l15mr1384154edq.310.1642023420601; 
 Wed, 12 Jan 2022 13:37:00 -0800 (PST)
Received: from osoxes.fritz.box (mue-88-130-49-239.dsl.tropolys.de.
 [88.130.49.239])
 by smtp.gmail.com with ESMTPSA id b2sm257288ejh.221.2022.01.12.13.36.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 12 Jan 2022 13:37:00 -0800 (PST)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 3/3] isa/piix4: Resolve global variables
Date: Wed, 12 Jan 2022 22:36:28 +0100
Message-Id: <20220112213629.9126-4-shentey@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220112213629.9126-1-shentey@gmail.com>
References: <20220112213629.9126-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::542
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::542;
 envelope-from=shentey@gmail.com; helo=mail-ed1-x542.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Wed, 12 Jan 2022 16:56:18 -0500
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
2.34.1


