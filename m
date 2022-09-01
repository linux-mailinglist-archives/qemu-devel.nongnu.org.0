Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BB945A9668
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Sep 2022 14:11:37 +0200 (CEST)
Received: from localhost ([::1]:58896 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oTj2h-0005rp-Dw
	for lists+qemu-devel@lfdr.de; Thu, 01 Sep 2022 08:11:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41888)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1oTiaS-0005h7-Vq; Thu, 01 Sep 2022 07:42:28 -0400
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636]:41671)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1oTiaJ-0000Fb-3R; Thu, 01 Sep 2022 07:42:20 -0400
Received: by mail-ej1-x636.google.com with SMTP id se27so26337976ejb.8;
 Thu, 01 Sep 2022 04:42:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=40swXTyiHxDICK6kn8HQbJdfXNShBC0eprLZoGOzeQU=;
 b=cUznDKbzAB9PaAfIFm40euE3X1BuRrxx+7dGJNilbtV1enzyTg0vZ4pMQfl1k2HimJ
 Pxod2VqPqImKPm5blDj1jdWMYfVGvWeqqs+X4PWfxVBEEhL6WvpTVMf877o1xMue5ZuZ
 XeYi550zIcw0+Rn/RUvPcJzmeEbG1uaa/Kk0nJ+0dcW1jrpa6Uma7/EKToex1nayrtmA
 2QX0KTrZ7aCYjMeN5M9OKj/TKKXwjFeopx2iVWCi42W79koDxE6VThe5QmT6PPkRuwlE
 kKqitplRS88pdOQSRtt57xc+JliNqFdPCqBKzILazY88WLUJcWuMPy5UvMyLnxT5JxcB
 0c8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=40swXTyiHxDICK6kn8HQbJdfXNShBC0eprLZoGOzeQU=;
 b=VaWGOyjvVHZbbttIWxMEhe7WqVycXE2MxfhmSnF5jm7g21MGWS8azwEX3Kl18jbhct
 Rl9+5pfFEQ+mLG2DKaofqflAzeZgJb/o+Vsjq3KKJnMJS+54pxyoOHhYBcVo+X8sI1+K
 ihLWZi4Mj7F6sg+UeoFzANTB1yTevSMI7w45cEZsYySxFD7R1MfG2dLIqLYwegCTtkzn
 2O3mn3MfbVRVIgCy8A65eAUxu5zsj8CjaBneyvEJJ17jC4qTm7ExsoIfrtTs7vFoegvq
 CXNl7ZNhXL4VUkWfjCI3amYdGhPGa/PwHnIh9X9Y2owEjhi9ABR7LGvK6CRUNKifOkxZ
 CPzQ==
X-Gm-Message-State: ACgBeo2L3fk+UvbldW+QjMxo91KAJh6DB0kc+D+VVK05Va6akIGjvcCc
 1PQ9iuJ8+NvjXdm2srzudj32xhaAWzg=
X-Google-Smtp-Source: AA6agR4KX8BQYoh79EOsaWn2FjTXrMRMEp3Vd+iEDpCgxTqqavMzfrekOA4m07yQy5EvLkvM9z01Nw==
X-Received: by 2002:a17:907:7fa5:b0:730:5d54:4c24 with SMTP id
 qk37-20020a1709077fa500b007305d544c24mr23646440ejc.641.1662032528073; 
 Thu, 01 Sep 2022 04:42:08 -0700 (PDT)
Received: from osoxes.fritz.box
 (p200300faaf0bb2009c4947838afc41b6.dip0.t-ipconnect.de.
 [2003:fa:af0b:b200:9c49:4783:8afc:41b6])
 by smtp.gmail.com with ESMTPSA id
 f12-20020a17090660cc00b0073ddb2eff27sm8387455ejk.167.2022.09.01.04.42.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 01 Sep 2022 04:42:07 -0700 (PDT)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, John Snow <jsnow@redhat.com>,
 Huacai Chen <chenhuacai@kernel.org>, Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, qemu-block@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 BALATON Zoltan <balaton@eik.bme.hu>, Bernhard Beschow <shentey@gmail.com>
Subject: [PATCH v5 11/13] hw/mips/fuloong2e: Inline
 vt82c686b_southbridge_init() and remove it
Date: Thu,  1 Sep 2022 13:41:25 +0200
Message-Id: <20220901114127.53914-12-shentey@gmail.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220901114127.53914-1-shentey@gmail.com>
References: <20220901114127.53914-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::636;
 envelope-from=shentey@gmail.com; helo=mail-ej1-x636.google.com
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

The previous patches moved most of this function into the via-isa device
model such that it has become fairly trivial. So inline it for
simplicity.

Suggested-by: BALATON Zoltan <balaton@eik.bme.hu>
Signed-off-by: Bernhard Beschow <shentey@gmail.com>
---
 hw/mips/fuloong2e.c | 28 ++++++++++------------------
 1 file changed, 10 insertions(+), 18 deletions(-)

diff --git a/hw/mips/fuloong2e.c b/hw/mips/fuloong2e.c
index 2d8723ab74..3c46215616 100644
--- a/hw/mips/fuloong2e.c
+++ b/hw/mips/fuloong2e.c
@@ -196,22 +196,6 @@ static void main_cpu_reset(void *opaque)
     }
 }
 
-static void vt82c686b_southbridge_init(PCIBus *pci_bus, int slot, qemu_irq intc,
-                                       I2CBus **i2c_bus)
-{
-    PCIDevice *dev, *via;
-
-    via = pci_create_simple_multifunction(pci_bus, PCI_DEVFN(slot, 0), true,
-                                          TYPE_VT82C686B_ISA);
-    qdev_connect_gpio_out(DEVICE(via), 0, intc);
-
-    dev = PCI_DEVICE(object_resolve_path_component(OBJECT(via), "ide"));
-    pci_ide_create_devs(dev);
-
-    dev = PCI_DEVICE(object_resolve_path_component(OBJECT(via), "pm"));
-    *i2c_bus = I2C_BUS(qdev_get_child_bus(DEVICE(dev), "i2c"));
-}
-
 /* Network support */
 static void network_init(PCIBus *pci_bus)
 {
@@ -308,8 +292,16 @@ static void mips_fuloong2e_init(MachineState *machine)
     pci_bus = bonito_init((qemu_irq *)&(env->irq[2]));
 
     /* South bridge -> IP5 */
-    vt82c686b_southbridge_init(pci_bus, FULOONG2E_VIA_SLOT, env->irq[5],
-                               &smbus);
+    pci_dev = pci_create_simple_multifunction(pci_bus,
+                                              PCI_DEVFN(FULOONG2E_VIA_SLOT, 0),
+                                              true, TYPE_VT82C686B_ISA);
+    qdev_connect_gpio_out(DEVICE(pci_dev), 0, env->irq[5]);
+
+    dev = DEVICE(object_resolve_path_component(OBJECT(pci_dev), "ide"));
+    pci_ide_create_devs(PCI_DEVICE(dev));
+
+    dev = DEVICE(object_resolve_path_component(OBJECT(pci_dev), "pm"));
+    smbus = I2C_BUS(qdev_get_child_bus(dev, "i2c"));
 
     /* GPU */
     if (vga_interface_type != VGA_NONE) {
-- 
2.37.3


