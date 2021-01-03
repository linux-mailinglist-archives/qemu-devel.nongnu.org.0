Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F0102E8E4F
	for <lists+qemu-devel@lfdr.de>; Sun,  3 Jan 2021 22:10:49 +0100 (CET)
Received: from localhost ([::1]:32924 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kwAeG-00084Q-M3
	for lists+qemu-devel@lfdr.de; Sun, 03 Jan 2021 16:10:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37564)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kwALU-0003LM-Q4
 for qemu-devel@nongnu.org; Sun, 03 Jan 2021 15:51:25 -0500
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335]:36047)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kwALT-0005xi-A0
 for qemu-devel@nongnu.org; Sun, 03 Jan 2021 15:51:24 -0500
Received: by mail-wm1-x335.google.com with SMTP id y23so16655312wmi.1
 for <qemu-devel@nongnu.org>; Sun, 03 Jan 2021 12:51:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=RGc4PmwDJUY2QF+j34alJTh7Sm+vszH5LRr0q8NCyew=;
 b=bYJWn38kCuUHBNggzd9rpovN13G8cx52I4Xl5uD2wmFJqBwkEGEAIRLem2Za1gGiAB
 AvswtiSQOYkSBuyd7T4q1Arm+y9ALJhzHvTbC3gSw/KA41kYk5auMVH6raLjWLM0uT/g
 +2MMKrVRgYwK0nRcXb6joMoRh1UnWGklokrIzHd27vZt3Jk3pUhByJutjSlcWqWXLadt
 H7mUl6qD0Vx5lImo3jDndxTq0Yljs6OL5Il8yArP3DiPmlU8ujJycVneIgdrU00LPypA
 i2oY5r2U6U6wozW9UxA4OXYTzsuf0Gs6neZkN4ptLunBSzLDYkCZPG8LUjgF/hsoERj1
 PKXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=RGc4PmwDJUY2QF+j34alJTh7Sm+vszH5LRr0q8NCyew=;
 b=rv1PbsOak2rI+SyO14L/yOU5nz9F0amZaay890SiYW1qybY5qcq9vV1z4mZGK9ksUn
 UO8kwaF/QwptvL0gak0P+wYf0Wl6XjTFUyyjqzALni9MLbIs8q6eRUBrFsI+rgeOEn23
 N44pKmjx6baJ/eI5cRtqc7cJbsO5KPpIkJT8CKCDg4SMA58/fA63oFRYymvYwoUlkslh
 Bx5BfAeL3qu2wleXjZej5x0nG0xaMWLz7kXeNbRS3wOkljw0bdGtlWjWrPY50L9Rdb5W
 INprIJhKy+P/hl/yvomRp6fWquM+RUd1iBg2pja5XEBNg4Vv5Vj9WE/1y7/YF8O4LWGa
 lcWw==
X-Gm-Message-State: AOAM530nu9wVYLHyZVy6N+2ZdJiqI+nZmwTrwRE0w1f0ZjjGCaRpCU+j
 EXERG50SK+c1n7fZbVnD+/HFf7UMm5w=
X-Google-Smtp-Source: ABdhPJw8BPqVtZQ01ieEAc934Sjb5eHx2Q7vdYFX5kWjzOQ3nQppCGBavS9Jc8B12GlSbUidLb69Ug==
X-Received: by 2002:a1c:6856:: with SMTP id d83mr25172660wmc.119.1609707081844; 
 Sun, 03 Jan 2021 12:51:21 -0800 (PST)
Received: from localhost.localdomain
 (194.red-83-57-172.dynamicip.rima-tde.net. [83.57.172.194])
 by smtp.gmail.com with ESMTPSA id c16sm65638470wrx.51.2021.01.03.12.51.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 03 Jan 2021 12:51:21 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PULL 12/35] audio/via-ac97: Simplify code and set user_creatable to
 false
Date: Sun,  3 Jan 2021 21:49:58 +0100
Message-Id: <20210103205021.2837760-13-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210103205021.2837760-1-f4bug@amsat.org>
References: <20210103205021.2837760-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x335.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Huacai Chen <chenhuacai@kernel.org>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: BALATON Zoltan <balaton@eik.bme.hu>

Remove some unneded, empty code and set user_creatable to false
(besides being not implemented yet, so does nothing anyway) it's also
normally part of VIA south bridge chips so no need to confuse users
showing them these devices.

Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-Id: <c7a5b1ee4c02e304ff70ebfbf269544f3c1f8412.1609584216.git.balaton@eik.bme.hu>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/audio/via-ac97.c | 51 +++++++++++++++++----------------------------
 1 file changed, 19 insertions(+), 32 deletions(-)

diff --git a/hw/audio/via-ac97.c b/hw/audio/via-ac97.c
index e617416ff76..6d556f74fc9 100644
--- a/hw/audio/via-ac97.c
+++ b/hw/audio/via-ac97.c
@@ -13,27 +13,13 @@
 #include "hw/isa/vt82c686.h"
 #include "hw/pci/pci.h"
 
-struct VIAAC97State {
-    PCIDevice dev;
-};
-
-struct VIAMC97State {
-    PCIDevice dev;
-};
-
-OBJECT_DECLARE_SIMPLE_TYPE(VIAAC97State, VIA_AC97)
-OBJECT_DECLARE_SIMPLE_TYPE(VIAMC97State, VIA_MC97)
-
-static void via_ac97_realize(PCIDevice *dev, Error **errp)
+static void via_ac97_realize(PCIDevice *pci_dev, Error **errp)
 {
-    VIAAC97State *s = VIA_AC97(dev);
-    uint8_t *pci_conf = s->dev.config;
-
-    pci_set_word(pci_conf + PCI_COMMAND, PCI_COMMAND_INVALIDATE |
-                 PCI_COMMAND_PARITY);
-    pci_set_word(pci_conf + PCI_STATUS, PCI_STATUS_CAP_LIST |
-                 PCI_STATUS_DEVSEL_MEDIUM);
-    pci_set_long(pci_conf + PCI_INTERRUPT_PIN, 0x03);
+    pci_set_word(pci_dev->config + PCI_COMMAND,
+                 PCI_COMMAND_INVALIDATE | PCI_COMMAND_PARITY);
+    pci_set_word(pci_dev->config + PCI_STATUS,
+                 PCI_STATUS_CAP_LIST | PCI_STATUS_DEVSEL_MEDIUM);
+    pci_set_long(pci_dev->config + PCI_INTERRUPT_PIN, 0x03);
 }
 
 static void via_ac97_class_init(ObjectClass *klass, void *data)
@@ -47,13 +33,15 @@ static void via_ac97_class_init(ObjectClass *klass, void *data)
     k->revision = 0x50;
     k->class_id = PCI_CLASS_MULTIMEDIA_AUDIO;
     set_bit(DEVICE_CATEGORY_SOUND, dc->categories);
-    dc->desc = "AC97";
+    dc->desc = "VIA AC97";
+    /* Reason: Part of a south bridge chip */
+    dc->user_creatable = false;
 }
 
 static const TypeInfo via_ac97_info = {
     .name          = TYPE_VIA_AC97,
     .parent        = TYPE_PCI_DEVICE,
-    .instance_size = sizeof(VIAAC97State),
+    .instance_size = sizeof(PCIDevice),
     .class_init    = via_ac97_class_init,
     .interfaces = (InterfaceInfo[]) {
         { INTERFACE_CONVENTIONAL_PCI_DEVICE },
@@ -61,15 +49,12 @@ static const TypeInfo via_ac97_info = {
     },
 };
 
-static void via_mc97_realize(PCIDevice *dev, Error **errp)
+static void via_mc97_realize(PCIDevice *pci_dev, Error **errp)
 {
-    VIAMC97State *s = VIA_MC97(dev);
-    uint8_t *pci_conf = s->dev.config;
-
-    pci_set_word(pci_conf + PCI_COMMAND, PCI_COMMAND_INVALIDATE |
-                 PCI_COMMAND_VGA_PALETTE);
-    pci_set_word(pci_conf + PCI_STATUS, PCI_STATUS_DEVSEL_MEDIUM);
-    pci_set_long(pci_conf + PCI_INTERRUPT_PIN, 0x03);
+    pci_set_word(pci_dev->config + PCI_COMMAND,
+                 PCI_COMMAND_INVALIDATE | PCI_COMMAND_VGA_PALETTE);
+    pci_set_word(pci_dev->config + PCI_STATUS, PCI_STATUS_DEVSEL_MEDIUM);
+    pci_set_long(pci_dev->config + PCI_INTERRUPT_PIN, 0x03);
 }
 
 static void via_mc97_class_init(ObjectClass *klass, void *data)
@@ -83,13 +68,15 @@ static void via_mc97_class_init(ObjectClass *klass, void *data)
     k->class_id = PCI_CLASS_COMMUNICATION_OTHER;
     k->revision = 0x30;
     set_bit(DEVICE_CATEGORY_NETWORK, dc->categories);
-    dc->desc = "MC97";
+    dc->desc = "VIA MC97";
+    /* Reason: Part of a south bridge chip */
+    dc->user_creatable = false;
 }
 
 static const TypeInfo via_mc97_info = {
     .name          = TYPE_VIA_MC97,
     .parent        = TYPE_PCI_DEVICE,
-    .instance_size = sizeof(VIAMC97State),
+    .instance_size = sizeof(PCIDevice),
     .class_init    = via_mc97_class_init,
     .interfaces = (InterfaceInfo[]) {
         { INTERFACE_CONVENTIONAL_PCI_DEVICE },
-- 
2.26.2


