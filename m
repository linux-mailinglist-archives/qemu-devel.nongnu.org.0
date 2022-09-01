Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 26D645A9625
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Sep 2022 14:01:02 +0200 (CEST)
Received: from localhost ([::1]:39382 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oTisX-0003fT-0q
	for lists+qemu-devel@lfdr.de; Thu, 01 Sep 2022 08:01:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41872)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1oTiaQ-0005gv-D1; Thu, 01 Sep 2022 07:42:27 -0400
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632]:33532)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1oTiaE-0000EB-4e; Thu, 01 Sep 2022 07:42:18 -0400
Received: by mail-ej1-x632.google.com with SMTP id cu2so34163396ejb.0;
 Thu, 01 Sep 2022 04:42:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=7oW9e9CQAQ6fs7n+6iH6aAQcJgkK+/GOKyNQf68VL6Q=;
 b=dFPUi+pN4qPKkRxbtPdmj6e7eDiqi5Aw+4bgKxJu2uZ8I2ktwmYjFsxZEWjQc5NKNS
 +Jcin0ZJPjeUM/6/ND/H/0+KX4yGTn2ZfDVxmQJXbTh07OzSpD6jcZSFBVgxCp2pEdTo
 ckE+aJSTgTbrOLD6rHYXCu1neseYQpjxK5fgmP7OI2IczcUy5ivJdSJBbaPPEc7HD0IW
 ZEyETNEt6tMRzbL3feupNXDGL/k99A5eMftEvUeFYQwJ9I/EY90gS3lnDpQS8NWb2YCL
 8RGpjGu9uV0TTSBPkjmQLDen/gde9s1oO6vRWGPSNuGOzsrJrWhaaVTmy/H6lnnX2HUe
 fyGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=7oW9e9CQAQ6fs7n+6iH6aAQcJgkK+/GOKyNQf68VL6Q=;
 b=TpLDFZ20EaZVcTkeA/0r1eLS9VlTvino0iYVxjTK7iVlKKvVEMcI5ge9TV0ZAzTadp
 B6u/EENIM44n/Eb3NVKZMtvoKNaMzxWUR3DhxB6RjyjJ8gjKetGqGvLQQ2P+7HZI18pi
 HJfG8BvfEAZs3C2BM9nI9/Occ93cJIzonqYO1aycDtWLaCdD94n70fmP8oqSLjTkh4rQ
 VcwQV2NBdEB8ALacvoMOzFHXpt43icnDeIOYHZ5MtzKSXb1PyLOJeWta0s68s7bK4xdf
 UD3eGGF8+vqIDIVwx5+oG+9Cg+VRa0X0EnvMW+IhPiwI1+5UgSG7cfdTNAgnX3Wuhokf
 0W6w==
X-Gm-Message-State: ACgBeo3I/Ra8XVuGZHbLj2tSCGl3IBkRGLlqRfcCu00ZWShvRSXZgaTv
 /Qc4jjm0BJR27CsTKJYwKt+/dCee9JA=
X-Google-Smtp-Source: AA6agR5VLCrCvH1kAKB3UcMJdoDMIZg6h+kaJ/DzeSq4kPzlPUAwbnzAmh9F0KvQ8WRQZav43atkfw==
X-Received: by 2002:a17:906:4fd2:b0:742:133b:3522 with SMTP id
 i18-20020a1709064fd200b00742133b3522mr9636573ejw.21.1662032521791; 
 Thu, 01 Sep 2022 04:42:01 -0700 (PDT)
Received: from osoxes.fritz.box
 (p200300faaf0bb2009c4947838afc41b6.dip0.t-ipconnect.de.
 [2003:fa:af0b:b200:9c49:4783:8afc:41b6])
 by smtp.gmail.com with ESMTPSA id
 f12-20020a17090660cc00b0073ddb2eff27sm8387455ejk.167.2022.09.01.04.42.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 01 Sep 2022 04:42:01 -0700 (PDT)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, John Snow <jsnow@redhat.com>,
 Huacai Chen <chenhuacai@kernel.org>, Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, qemu-block@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 BALATON Zoltan <balaton@eik.bme.hu>, Bernhard Beschow <shentey@gmail.com>
Subject: [PATCH v5 05/13] hw/isa/vt82c686: Introduce TYPE_VIA_IDE define
Date: Thu,  1 Sep 2022 13:41:19 +0200
Message-Id: <20220901114127.53914-6-shentey@gmail.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220901114127.53914-1-shentey@gmail.com>
References: <20220901114127.53914-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::632;
 envelope-from=shentey@gmail.com; helo=mail-ej1-x632.google.com
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

Establishes consistency with other (VIA) devices.

Signed-off-by: Bernhard Beschow <shentey@gmail.com>
---
 hw/ide/via.c              | 2 +-
 hw/mips/fuloong2e.c       | 2 +-
 hw/ppc/pegasos2.c         | 2 +-
 include/hw/isa/vt82c686.h | 1 +
 4 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/hw/ide/via.c b/hw/ide/via.c
index 82def819c4..e1a429405d 100644
--- a/hw/ide/via.c
+++ b/hw/ide/via.c
@@ -230,7 +230,7 @@ static void via_ide_class_init(ObjectClass *klass, void *data)
 }
 
 static const TypeInfo via_ide_info = {
-    .name          = "via-ide",
+    .name          = TYPE_VIA_IDE,
     .parent        = TYPE_PCI_IDE,
     .class_init    = via_ide_class_init,
 };
diff --git a/hw/mips/fuloong2e.c b/hw/mips/fuloong2e.c
index 5ee546f5f6..44225fbe33 100644
--- a/hw/mips/fuloong2e.c
+++ b/hw/mips/fuloong2e.c
@@ -205,7 +205,7 @@ static void vt82c686b_southbridge_init(PCIBus *pci_bus, int slot, qemu_irq intc,
                                           TYPE_VT82C686B_ISA);
     qdev_connect_gpio_out(DEVICE(dev), 0, intc);
 
-    dev = pci_create_simple(pci_bus, PCI_DEVFN(slot, 1), "via-ide");
+    dev = pci_create_simple(pci_bus, PCI_DEVFN(slot, 1), TYPE_VIA_IDE);
     pci_ide_create_devs(dev);
 
     pci_create_simple(pci_bus, PCI_DEVFN(slot, 2), "vt82c686b-usb-uhci");
diff --git a/hw/ppc/pegasos2.c b/hw/ppc/pegasos2.c
index 61f4263953..8039775f80 100644
--- a/hw/ppc/pegasos2.c
+++ b/hw/ppc/pegasos2.c
@@ -166,7 +166,7 @@ static void pegasos2_init(MachineState *machine)
                           qdev_get_gpio_in_named(pm->mv, "gpp", 31));
 
     /* VT8231 function 1: IDE Controller */
-    dev = pci_create_simple(pci_bus, PCI_DEVFN(12, 1), "via-ide");
+    dev = pci_create_simple(pci_bus, PCI_DEVFN(12, 1), TYPE_VIA_IDE);
     pci_ide_create_devs(dev);
 
     /* VT8231 function 2-3: USB Ports */
diff --git a/include/hw/isa/vt82c686.h b/include/hw/isa/vt82c686.h
index 56ac141be3..87aca3e5bb 100644
--- a/include/hw/isa/vt82c686.h
+++ b/include/hw/isa/vt82c686.h
@@ -8,6 +8,7 @@
 #define TYPE_VT8231_ISA "vt8231-isa"
 #define TYPE_VT8231_PM "vt8231-pm"
 #define TYPE_VIA_AC97 "via-ac97"
+#define TYPE_VIA_IDE "via-ide"
 #define TYPE_VIA_MC97 "via-mc97"
 
 void via_isa_set_irq(PCIDevice *d, int n, int level);
-- 
2.37.3


