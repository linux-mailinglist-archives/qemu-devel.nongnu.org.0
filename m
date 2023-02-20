Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A606169D040
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Feb 2023 16:06:18 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pU7jh-0001ka-4d; Mon, 20 Feb 2023 10:05:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pU7je-0001fL-Dw
 for qemu-devel@nongnu.org; Mon, 20 Feb 2023 10:05:47 -0500
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pU7jc-0008Re-4x
 for qemu-devel@nongnu.org; Mon, 20 Feb 2023 10:05:46 -0500
Received: by mail-wm1-x32f.google.com with SMTP id
 az11-20020a05600c600b00b003dc4fd6e61dso1341371wmb.5
 for <qemu-devel@nongnu.org>; Mon, 20 Feb 2023 07:05:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=HSfxvXTslGwoUF9ppy8jNQv5yhLKiCPbveanE20/VQs=;
 b=H5DJbPwlSHr0wxelY67ABoyZ5fFi2vxf492DyO97aoWKec/4XhNG7oNSHr3YbGemn0
 d5PjctjHVY/FMvnoYgOlqNi1CbCsFAiZIQuADtA2cNbAZR54t1zWzZzYbjXNh2Dy7+1b
 /3fAgH7PMlMB9HPKYufAkyI1hrdVnyJN6BpN7LSIjgd7jpJgJm4cxb7lTkGBDMPGUteo
 NZe+2mBePix6VGKDQ5rYRp6ctdHZzlx0JZJG1XVdXpv2PXI44mgP2V1+3DGpM639bS7p
 FPc5+ZrBqHPiQ81g/yr0ki+2LDcXxng9R5qKrZutdIJdRz5iiVogXqGDxe2HQCWcq/wu
 CvOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=HSfxvXTslGwoUF9ppy8jNQv5yhLKiCPbveanE20/VQs=;
 b=CS9foG5n4wSEWGxhNrMQEfhQQ2igXU5+x5W5VGUrDtb0FEiYfamhuFlcinCHR4kK8W
 LkfoodEBFMIdPoOPigaspkM2ZyeFK2lE1/DixU67KLpTODIa6nqxSBFokdAhgTSyzM+v
 dL/1uC4+2MLW7jG0PDE0ZFRzZCqDZ+jzGB66pD0K6Mh/akfb/7Y5I07bLmNwUOP6/CwZ
 lYKu0fS5WNjwebwsX6zclAVSjmuBltIWcgQlUS/c4sqFJOl3TmOV2lvH3BRgzgQgkwpc
 dTtEg6lgoJFKb/D/03W+7iLme1eGbdfaErxqkgKBdP5NhQD4jirtDoQRJorwLduYX6yA
 z3Fw==
X-Gm-Message-State: AO0yUKWgIrmEBz/Jh7+zdEu9HccG/vyqxWGBaZG5lMTz6i18BqTJeh/W
 1zJBDzaRcxsGJu9W7FaqAa9XflRQpPwGnJi7
X-Google-Smtp-Source: AK7set+6A+Q790Cz/ezfBwA3kZRIfVW0Jg9iHiYM4XQ8fOg2o+7MMfNUvKoyYcWsv/arfdBFwmhVcw==
X-Received: by 2002:a05:600c:331f:b0:3dc:19d1:3c13 with SMTP id
 q31-20020a05600c331f00b003dc19d13c13mr375070wmp.12.1676905542630; 
 Mon, 20 Feb 2023 07:05:42 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 o6-20020a05600c4fc600b003dd8feea827sm11410074wmq.4.2023.02.20.07.05.41
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 20 Feb 2023 07:05:42 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Gerd Hoffmann <kraxel@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 5/9] hw/usb/hcd-uhci: Replace container_of() by
 UHCI_GET_CLASS() QOM macro
Date: Mon, 20 Feb 2023 16:05:11 +0100
Message-Id: <20230220150515.32549-6-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230220150515.32549-1-philmd@linaro.org>
References: <20230220150515.32549-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32f.google.com
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

By using the QOM UHCI_GET_CLASS() cast macro we don't to
use the intermediate PCIDeviceClass variable.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/usb/hcd-uhci.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/hw/usb/hcd-uhci.c b/hw/usb/hcd-uhci.c
index f77ffda69a..8ac1175ad2 100644
--- a/hw/usb/hcd-uhci.c
+++ b/hw/usb/hcd-uhci.c
@@ -1159,8 +1159,7 @@ static USBBusOps uhci_bus_ops = {
 void usb_uhci_common_realize(PCIDevice *dev, Error **errp)
 {
     Error *err = NULL;
-    PCIDeviceClass *pc = PCI_DEVICE_GET_CLASS(dev);
-    UHCIPCIDeviceClass *u = container_of(pc, UHCIPCIDeviceClass, parent_class);
+    UHCIPCIDeviceClass *u = UHCI_GET_CLASS(dev);
     UHCIState *s = UHCI(dev);
     uint8_t *pci_conf = s->dev.config;
     int i;
@@ -1267,7 +1266,7 @@ void uhci_data_class_init(ObjectClass *klass, void *data)
 {
     PCIDeviceClass *k = PCI_DEVICE_CLASS(klass);
     DeviceClass *dc = DEVICE_CLASS(klass);
-    UHCIPCIDeviceClass *u = container_of(k, UHCIPCIDeviceClass, parent_class);
+    UHCIPCIDeviceClass *u = UHCI_CLASS(klass);
     UHCIInfo *info = data;
 
     k->realize = info->realize ? info->realize : usb_uhci_common_realize;
-- 
2.38.1


