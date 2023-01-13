Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 656C3669E05
	for <lists+qemu-devel@lfdr.de>; Fri, 13 Jan 2023 17:28:45 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pGMJ0-0003UM-Iy; Fri, 13 Jan 2023 10:49:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pGMIf-0003FM-1p
 for qemu-devel@nongnu.org; Fri, 13 Jan 2023 10:49:03 -0500
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pGMIc-0006bW-TV
 for qemu-devel@nongnu.org; Fri, 13 Jan 2023 10:49:00 -0500
Received: by mail-wm1-x332.google.com with SMTP id ay40so15566197wmb.2
 for <qemu-devel@nongnu.org>; Fri, 13 Jan 2023 07:48:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=KNprIQcFwUnFv12Queibz2aRMJNapfQn9w0bpm4vXUo=;
 b=huIflwGfvkK+BOfIH5nJKHdTwBThQ5yjH0AIi8X0roNPGpFT8QOpioQH8YvurF5GGA
 R3ynrfVSTZEp8imIDkh9SjqLZlLd+Tcn5X+OCrdFaf7yUUFTeVligmCbBi161wO+vBkH
 ba8/tq+xU0d+8K6S05OakNJsA7RbGaSHeRmuJMQ32Sjd8zST4TyPVeFAmeLFViMVwR3i
 2dS9MGF0RambXGSO5AIglX9VHqVcNN7VtgB/pqfFeez1dhH3x9cZzDZ/F+TlFbSBefYv
 a6zSCRYCbcg5GLrPtJ3W8u6XlTco1UT0nOpuploPfQPAc1AmS5l+AtvCxWrgRUltlUNh
 Q2/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=KNprIQcFwUnFv12Queibz2aRMJNapfQn9w0bpm4vXUo=;
 b=L+GQh9cHHGqRgpL4O4+N38sXIWKUULjPo+Lk1/NW/cX12GnplwjHQ5H7YEuCuf48q6
 04F3Cpi4hvoa6fJzLP6K3HiFcI1Il4fZpOWZyiqezPuE1YJ3GdRpXtL6HypjZkFjV8CI
 qUMQwynSyV+ZDq2kK6hW7vlFok6OMo5+QtcsvYfFHU6PUfJqeYs1POcQDFTqguimwzqI
 7gka2Dh+7CNeWXu9K+wpJ8eS6pjtPaqfFx4IWT6Xsxz53VuCL92zf/GFMpvLG2zRcIlr
 9qb2PyMCTDjRmx/LsUUmN6uyqZa+QjzNivx2sgiiXQWanG4bWq6vvzgfSGmqrcJlvyaa
 vzHw==
X-Gm-Message-State: AFqh2kpyRfQVtvLzCUToVIrpxcWgk8LUYlVqMShX3GvEI2Kv9MKnUHFe
 My9mkf9IMvUtostHV3Yuiy83xwG/vBttUcGe
X-Google-Smtp-Source: AMrXdXu42hlR1W6jaXLgoPpeTTlB7k1bBE5Lqh5Y0za16WGPvo/YnpvW6ZBZSddf1++Ry8wiQfV0Fw==
X-Received: by 2002:a05:600c:3b99:b0:3d2:1bf6:5796 with SMTP id
 n25-20020a05600c3b9900b003d21bf65796mr100731wms.35.1673624937685; 
 Fri, 13 Jan 2023 07:48:57 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 p5-20020a1c5445000000b003b4fe03c881sm4390894wmi.48.2023.01.13.07.48.56
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 13 Jan 2023 07:48:57 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [PULL 42/46] hw/pci-host/bonito: Use 'bonito_pci' for PCI function #0
 code
Date: Fri, 13 Jan 2023 16:45:28 +0100
Message-Id: <20230113154532.49979-43-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230113154532.49979-1-philmd@linaro.org>
References: <20230113154532.49979-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x332.google.com
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
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20230105130710.49264-4-philmd@linaro.org>
---
 hw/pci-host/bonito.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/hw/pci-host/bonito.c b/hw/pci-host/bonito.c
index 5c0928ffe6..9c26aa2ad9 100644
--- a/hw/pci-host/bonito.c
+++ b/hw/pci-host/bonito.c
@@ -653,7 +653,7 @@ static void bonito_host_realize(DeviceState *dev, Error **errp)
     create_unimplemented_device("pci.io", BONITO_PCIIO_BASE, 1 * MiB);
 }
 
-static void bonito_realize(PCIDevice *dev, Error **errp)
+static void bonito_pci_realize(PCIDevice *dev, Error **errp)
 {
     PCIBonitoState *s = PCI_BONITO(dev);
     SysBusDevice *sysbus = SYS_BUS_DEVICE(s->pcihost);
@@ -763,14 +763,14 @@ PCIBus *bonito_init(qemu_irq *pic)
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


