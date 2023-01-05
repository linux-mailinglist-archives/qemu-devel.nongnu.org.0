Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E6CB665EC60
	for <lists+qemu-devel@lfdr.de>; Thu,  5 Jan 2023 14:09:02 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pDPy1-0004KW-Tn; Thu, 05 Jan 2023 08:07:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pDPxy-0004FQ-Ls
 for qemu-devel@nongnu.org; Thu, 05 Jan 2023 08:07:30 -0500
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pDPxw-0004Gb-Q0
 for qemu-devel@nongnu.org; Thu, 05 Jan 2023 08:07:30 -0500
Received: by mail-wr1-x432.google.com with SMTP id bs20so33960038wrb.3
 for <qemu-devel@nongnu.org>; Thu, 05 Jan 2023 05:07:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=tCZjTrjK3GXyfOZTeSp83EZ0svOoUH+ua/AMM4VRkZ0=;
 b=BkFp411HDvBFYgI5Jw+qZ7OG9s+xWYLHxdEQnm371vCC87kndx3bAcbjPwWrW//d0E
 A5fBJs+A+K3xQlTPLKuEc3ylx1EGyjH1/N+aFggZdth1omQ7tsV4JqJzVunYlwLJhnKl
 ivgsZrJZfrHreIAWIrfDR1pHrk0yQeexumjHtU4YqrWj6xMUl+4B4YRQRwTQrfNdjN9W
 14UUCP/31kFSgf3lodYQvPtAa452v61k1+Mvs3pqcFGVd8RLvKRYBQDJOpYkh74ZnMzF
 A4Yu1RjanMfME3mQDnDTJd68MZJMKcccWbqtbnouedPPh4wo5aUmJRTZJcDzBKdpd3zF
 TKZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=tCZjTrjK3GXyfOZTeSp83EZ0svOoUH+ua/AMM4VRkZ0=;
 b=Zt0EMcaUDVpez0zIgG1HfiZ3no5tDAIcqNbRDoVIzFQs/OqB92uN9QErsqyWgElLpA
 i2YdKeZvLkXOc5gINmAIdTbxgQucBS/SOnlrU2/EbIuqAGB7dfikWwtmTnId29rpbg9U
 LlZsy2rFWTgTjYC5TjvH8sLh6i0tQ8kgkzGQLtb5P1VZX1M7dV0QK8XPCW8DAUO51BXg
 JjGlhy4ION+0NpqRkM+AtBaLRJuJ6vyEnoI76JCMha82USHUMGBze4Cbyv5Pc9+yyecS
 bZpOJjul5OtNaIXR+eMd2+GtTZr9rrvQVYIw0OD23p6tOpFVgyW0Hp7OusE7au51QrCZ
 8VeA==
X-Gm-Message-State: AFqh2koeXRkK9O1KdcoxksjbdAM5H5HadpURrQ580nBbgWIyKxAvahBB
 zmRsm6ZdLtU8NInqC+HMrEelyTDVxxSIanzl
X-Google-Smtp-Source: AMrXdXs0MQngbw9IihUoOzHQRNrF40hRr/8IM752SI+6Qa6slzL4SKAsiueGXjTKS/6FoNTc6dZEzw==
X-Received: by 2002:a5d:5a19:0:b0:242:1ef7:9ad5 with SMTP id
 bq25-20020a5d5a19000000b002421ef79ad5mr35280183wrb.68.1672924047021; 
 Thu, 05 Jan 2023 05:07:27 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 cc15-20020a5d5c0f000000b00298d87b6309sm11823514wrb.78.2023.01.05.05.07.26
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 05 Jan 2023 05:07:26 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Huacai Chen <chenhuacai@kernel.org>, Bernhard Beschow <shentey@gmail.com>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>
Subject: [PATCH 3/8] hw/pci-host/bonito: Use 'bonito_pci' for PCI function #0
 code
Date: Thu,  5 Jan 2023 14:07:05 +0100
Message-Id: <20230105130710.49264-4-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230105130710.49264-1-philmd@linaro.org>
References: <20230105130710.49264-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x432.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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

To make it easier to differentiate between the Host Bridge
object and its PCI function #0, rename bonito* as bonito_pci*.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/pci-host/bonito.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/hw/pci-host/bonito.c b/hw/pci-host/bonito.c
index a804731f49..80ec424f86 100644
--- a/hw/pci-host/bonito.c
+++ b/hw/pci-host/bonito.c
@@ -617,7 +617,7 @@ static void bonito_reset_hold(Object *obj)
     s->regs[BONITO_PCIMAP] = 0x6140;
 }
 
-static const VMStateDescription vmstate_bonito = {
+static const VMStateDescription vmstate_bonito_pci = {
     .name = "Bonito",
     .version_id = 1,
     .minimum_version_id = 1,
@@ -653,7 +653,7 @@ static void bonito_host_realize(DeviceState *dev, Error **errp)
     create_unimplemented_device("pci.io", BONITO_PCIIO_BASE, 1 * MiB);
 }
 
-static void bonito_realize(PCIDevice *dev, Error **errp)
+static void bonito_pci_realize(PCIDevice *dev, Error **errp)
 {
     PCIBonitoState *s = PCI_BONITO(dev);
     SysBusDevice *sysbus = SYS_BUS_DEVICE(s->pcihost);
@@ -763,20 +763,20 @@ PCIBus *bonito_init(qemu_irq *pic)
     return phb->bus;
 }
 
-static void bonito_class_init(ObjectClass *klass, void *data)
+static void bonito_pci_class_init(ObjectClass *klass, void *data)
 {
     DeviceClass *dc = DEVICE_CLASS(klass);
     PCIDeviceClass *k = PCI_DEVICE_CLASS(klass);
     ResettableClass *rc = RESETTABLE_CLASS(klass);
 
     rc->phases.hold = bonito_reset_hold;
-    k->realize = bonito_realize;
+    k->realize = bonito_pci_realize;
     k->vendor_id = 0xdf53;
     k->device_id = 0x00d5;
     k->revision = 0x01;
     k->class_id = PCI_CLASS_BRIDGE_HOST;
     dc->desc = "Host bridge";
-    dc->vmsd = &vmstate_bonito;
+    dc->vmsd = &vmstate_bonito_pci;
     /*
      * PCI-facing part of the host bridge, not usable without the
      * host-facing part, which can't be device_add'ed, yet.
@@ -784,11 +784,11 @@ static void bonito_class_init(ObjectClass *klass, void *data)
     dc->user_creatable = false;
 }
 
-static const TypeInfo bonito_info = {
+static const TypeInfo bonito_pci_info = {
     .name          = TYPE_PCI_BONITO,
     .parent        = TYPE_PCI_DEVICE,
     .instance_size = sizeof(PCIBonitoState),
-    .class_init    = bonito_class_init,
+    .class_init    = bonito_pci_class_init,
     .interfaces = (InterfaceInfo[]) {
         { INTERFACE_CONVENTIONAL_PCI_DEVICE },
         { },
@@ -812,7 +812,7 @@ static const TypeInfo bonito_host_info = {
 static void bonito_register_types(void)
 {
     type_register_static(&bonito_host_info);
-    type_register_static(&bonito_info);
+    type_register_static(&bonito_pci_info);
 }
 
 type_init(bonito_register_types)
-- 
2.38.1


