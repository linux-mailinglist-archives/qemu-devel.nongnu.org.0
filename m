Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 79ED559CBC8
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Aug 2022 00:54:05 +0200 (CEST)
Received: from localhost ([::1]:43994 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oQGJ2-0000Ey-L1
	for lists+qemu-devel@lfdr.de; Mon, 22 Aug 2022 18:54:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47210)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1oQGAC-00043a-HP; Mon, 22 Aug 2022 18:44:56 -0400
Received: from mail-ed1-x52b.google.com ([2a00:1450:4864:20::52b]:35398)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1oQGA9-0007z4-Ql; Mon, 22 Aug 2022 18:44:56 -0400
Received: by mail-ed1-x52b.google.com with SMTP id 2so7779434edx.2;
 Mon, 22 Aug 2022 15:44:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=3CwPRKRBiYaIQMewUt9MEfE1GS4VKjXvIS7/bxfYq48=;
 b=gHDEvC3FUfqyFFajq84kfEoqgv1tlh6/2yU6f8e8E1AgPU7S+7Gf/CnHuly66rBWov
 rwt46wdtNCsznsfYKSt+TWEm3sImsHf4DlSjDNPK2NwHawJyezt6orDi/long2OJweNT
 jGfIkjAGR/Jtk4Rhg7097ASs2HFYkpOfEDJB3+lpiwQjzjttOElLNW6SLuutB0W/oofT
 P9EY+n5pidIVRk734yU20TZld8XodC+v70kj/NQVZQ0MZDxbOIsZ4N9niWbnINUcNFqR
 kQ/fPGThI2Jcrf/L0zU0nZL5KbxoW5aezApPNkQgKRGyPGEJxLDejzGPuSfBlM0eS98K
 fvbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=3CwPRKRBiYaIQMewUt9MEfE1GS4VKjXvIS7/bxfYq48=;
 b=tYKlvqw2sPjm3V5QDdcqB4ElRLyz4pbgCYOWhPcgwU0CZEEr0NTxYYpfGUNqyooeW6
 hJL0OqPosAgt1uvAXfdvdqzwb6wwkz6t1s/GggIKLSWc0YYzSQQd3vm00YrzhmwMlRtj
 NrqHx5CQro/gPTK82zt83MRR7d6Qzf1N5V+zd9mUURxxqQfVmZM/AxX6oAIjGhqYUTOA
 UpdL4vley56f69+FPimM+0BzPTEDbQMz0+nJGQHS5Gr7wkNdzx0FvGGKQ8ie4LyY/Oua
 taD8sMnAL2UnyDILyGfqVHgpDcotUCMmEqCdlkA+wwUgQSr784ythfzy/qrruYGJ1u6x
 X+/g==
X-Gm-Message-State: ACgBeo3fJD+tOOvnOIcFE0OSAplo1rKWPylQnmXB13XQWomDHjfLnK08
 OfVrMwcGDmYeHJp93zTmEELqF/A5SnE=
X-Google-Smtp-Source: AA6agR4NwpelRSMUu2LL4fbBqZPHa0O2rFtc/oLVDISC3LjUKqDw47anVKxuCDI+SYjtT6CvHCVXzg==
X-Received: by 2002:a05:6402:554:b0:446:1013:c898 with SMTP id
 i20-20020a056402055400b004461013c898mr1054135edx.269.1661208291820; 
 Mon, 22 Aug 2022 15:44:51 -0700 (PDT)
Received: from localhost.localdomain
 (dynamic-077-183-070-107.77.183.pool.telefonica.de. [77.183.70.107])
 by smtp.gmail.com with ESMTPSA id
 o4-20020a170906768400b0073d7b876621sm2455758ejm.205.2022.08.22.15.44.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Aug 2022 15:44:51 -0700 (PDT)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Cc: Jiaxun Yang <jiaxun.yang@flygoat.com>, BALATON Zoltan <balaton@eik.bme.hu>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Huacai Chen <chenhuacai@kernel.org>, qemu-ppc@nongnu.org,
 Bernhard Beschow <shentey@gmail.com>
Subject: [PATCH 7/9] hw/isa/vt82c686: QOM'ify ac97 and mc97 creation
Date: Tue, 23 Aug 2022 00:43:53 +0200
Message-Id: <20220822224355.11753-8-shentey@gmail.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20220822224355.11753-1-shentey@gmail.com>
References: <20220822224355.11753-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52b;
 envelope-from=shentey@gmail.com; helo=mail-ed1-x52b.google.com
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

Resolves duplicate code in the boards.

Signed-off-by: Bernhard Beschow <shentey@gmail.com>
---
 hw/isa/vt82c686.c   | 16 ++++++++++++++++
 hw/mips/fuloong2e.c |  4 ----
 hw/ppc/pegasos2.c   |  4 ----
 3 files changed, 16 insertions(+), 8 deletions(-)

diff --git a/hw/isa/vt82c686.c b/hw/isa/vt82c686.c
index b964d1a760..47f2fd2669 100644
--- a/hw/isa/vt82c686.c
+++ b/hw/isa/vt82c686.c
@@ -549,6 +549,8 @@ struct ViaISAState {
     PCIIDEState ide;
     UHCIState uhci[2];
     ViaPMState pm;
+    PCIDevice ac97;
+    PCIDevice mc97;
 };
 
 static const VMStateDescription vmstate_via = {
@@ -568,6 +570,8 @@ static void via_isa_init(Object *obj)
     object_initialize_child(obj, "ide", &s->ide, "via-ide");
     object_initialize_child(obj, "uhci1", &s->uhci[0], "vt82c686b-usb-uhci");
     object_initialize_child(obj, "uhci2", &s->uhci[1], "vt82c686b-usb-uhci");
+    object_initialize_child(obj, "ac97", &s->ac97, TYPE_VIA_AC97);
+    object_initialize_child(obj, "mc97", &s->mc97, TYPE_VIA_MC97);
 }
 
 static const TypeInfo via_isa_info = {
@@ -644,6 +648,18 @@ static void via_isa_realize(PCIDevice *d, Error **errp)
     if (!qdev_realize(DEVICE(&s->pm), BUS(pci_bus), errp)) {
         return;
     }
+
+    /* Function 5: AC97 Audio */
+    qdev_prop_set_int32(DEVICE(&s->ac97), "addr", d->devfn + 5);
+    if (!qdev_realize(DEVICE(&s->ac97), BUS(pci_bus), errp)) {
+        return;
+    }
+
+    /* Function 6: AC97 Modem */
+    qdev_prop_set_int32(DEVICE(&s->mc97), "addr", d->devfn + 6);
+    if (!qdev_realize(DEVICE(&s->mc97), BUS(pci_bus), errp)) {
+        return;
+    }
 }
 
 /* TYPE_VT82C686B_ISA */
diff --git a/hw/mips/fuloong2e.c b/hw/mips/fuloong2e.c
index f05474348f..ea1aef3049 100644
--- a/hw/mips/fuloong2e.c
+++ b/hw/mips/fuloong2e.c
@@ -207,10 +207,6 @@ static void vt82c686b_southbridge_init(PCIBus *pci_bus, int slot, qemu_irq intc,
 
     dev = PCI_DEVICE(object_resolve_path_component(OBJECT(dev), "pm"));
     *i2c_bus = I2C_BUS(qdev_get_child_bus(DEVICE(dev), "i2c"));
-
-    /* Audio support */
-    pci_create_simple(pci_bus, PCI_DEVFN(slot, 5), TYPE_VIA_AC97);
-    pci_create_simple(pci_bus, PCI_DEVFN(slot, 6), TYPE_VIA_MC97);
 }
 
 /* Network support */
diff --git a/hw/ppc/pegasos2.c b/hw/ppc/pegasos2.c
index 4e29e42fba..89ef4aed8b 100644
--- a/hw/ppc/pegasos2.c
+++ b/hw/ppc/pegasos2.c
@@ -171,10 +171,6 @@ static void pegasos2_init(MachineState *machine)
     spd_data = spd_data_generate(DDR, machine->ram_size);
     smbus_eeprom_init_one(i2c_bus, 0x57, spd_data);
 
-    /* VT8231 function 5-6: AC97 Audio & Modem */
-    pci_create_simple(pci_bus, PCI_DEVFN(12, 5), TYPE_VIA_AC97);
-    pci_create_simple(pci_bus, PCI_DEVFN(12, 6), TYPE_VIA_MC97);
-
     /* other PC hardware */
     pci_vga_init(pci_bus);
 
-- 
2.37.2


