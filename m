Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C18F56A44CF
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Feb 2023 15:40:08 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pWeFV-0002tE-1e; Mon, 27 Feb 2023 09:13:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pWeF1-0000Vz-7J
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 09:12:35 -0500
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pWeEU-0001I8-NY
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 09:12:04 -0500
Received: by mail-wr1-x432.google.com with SMTP id r7so6371715wrz.6
 for <qemu-devel@nongnu.org>; Mon, 27 Feb 2023 06:12:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=yM9TeJs0ek6ciQN9256F7MMNBJln7mQ/1ROtgdvo/kY=;
 b=m+uuNfutLciGYHLbb/CtvunYE+zgbtbWYuJjlN85BgLTXHibADkK1IUzYV3ul4Uash
 tFAEPwJ7btFEVJ67o8Zbytw6zbs6S1ooELJ3p9HRXY5WzlOPM3QYdxuqlBS7S3UqWBIv
 q9xsy3vK1acjAPmGl566I1WZcu0Y9BVyV9MdFZsHtPmIIUPlNhEP9NiZCGkBStVLLoCf
 OLmFlWRc3mJAKN5EWAKQDqneFYkR2zlhzbv/seoYrkiflesN4JZu5MI6T6SXU1mNM+4d
 kmOYVuasDjQMk0bLO3OiJSDl7VNJYfh2UmIQ+Ipre0dU005cBpg8cNia+/uUWZy6qbtw
 /I6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=yM9TeJs0ek6ciQN9256F7MMNBJln7mQ/1ROtgdvo/kY=;
 b=V4yXj2JBEZlKtfSS7Toj4l0WuOVEDHMhANvSeAI5379IKfu/+BlK0kfOq8ifdv8lXU
 rHtFS3OVEsCaxze+QP4nSFVWBe2ObbXltxOlsojeno1sMUsV0Y0PW7U1TqmDAOFl8O+M
 z29ETMBjt1odIl9IKat+0AJeedx8a5nnyrGvkWNdmHtftvewfIhNf35rfEKkw3CXRNSP
 EjRG38Wguav5ptSarSUrVRKdrXvPqzjP7ssmJbXu5qbz8iZRvIe0rYzep3cl0i43GKj6
 r7bKxuZ+A0PFrntIj2H0qYfxyhAWaDDDUQPJi/tSc2sJ2gBYD1UIIRUvPYyKQP8B+bd3
 NMIA==
X-Gm-Message-State: AO0yUKWVOwDidSX7E0Tk6W+g4w0yzK2SaLUB4P9LMyHFFPmcjbiU+5u3
 a3zo6Kg/6CQNxvRg33JxZS92ESsQDfk7bOk2
X-Google-Smtp-Source: AK7set/9hNjGfVRkf0iX9aitVu3DO2wAqKRmSkvcXDB571IwIcczSvfg0Ahgxoc65bjIyyS0pUXUkw==
X-Received: by 2002:a5d:4207:0:b0:2c7:11a5:d7bc with SMTP id
 n7-20020a5d4207000000b002c711a5d7bcmr11671700wrq.43.1677507119725; 
 Mon, 27 Feb 2023 06:11:59 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 y13-20020adfe6cd000000b002c8476dde7asm7190300wrm.114.2023.02.27.06.11.58
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 27 Feb 2023 06:11:59 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 117/126] hw/ide/piix: Pass Error* to pci_piix_init_ports() for
 better error msg
Date: Mon, 27 Feb 2023 15:02:04 +0100
Message-Id: <20230227140213.35084-108-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230227140213.35084-1-philmd@linaro.org>
References: <20230227140213.35084-1-philmd@linaro.org>
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

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Message-Id: <20230215112712.23110-20-philmd@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 hw/ide/piix.c | 15 +++++++--------
 1 file changed, 7 insertions(+), 8 deletions(-)

diff --git a/hw/ide/piix.c b/hw/ide/piix.c
index 6354ae740b..f10bdf39ff 100644
--- a/hw/ide/piix.c
+++ b/hw/ide/piix.c
@@ -121,7 +121,7 @@ static void piix_ide_reset(DeviceState *dev)
     pci_set_byte(pci_conf + 0x20, 0x01);  /* BMIBA: 20-23h */
 }
 
-static int pci_piix_init_ports(PCIIDEState *d)
+static bool pci_piix_init_ports(PCIIDEState *d, Error **errp)
 {
     static const struct {
         int iobase;
@@ -138,7 +138,9 @@ static int pci_piix_init_ports(PCIIDEState *d)
         ret = ide_init_ioport(&d->bus[i], NULL, port_info[i].iobase,
                               port_info[i].iobase2);
         if (ret) {
-            return ret;
+            error_setg_errno(errp, -ret, "Failed to realize %s port %u",
+                             object_get_typename(OBJECT(d)), i);
+            return false;
         }
         ide_bus_init_output_irq(&d->bus[i],
                                 isa_get_irq(NULL, port_info[i].isairq));
@@ -148,14 +150,13 @@ static int pci_piix_init_ports(PCIIDEState *d)
         ide_bus_register_restart_cb(&d->bus[i]);
     }
 
-    return 0;
+    return true;
 }
 
 static void pci_piix_ide_realize(PCIDevice *dev, Error **errp)
 {
     PCIIDEState *d = PCI_IDE(dev);
     uint8_t *pci_conf = dev->config;
-    int rc;
 
     pci_conf[PCI_CLASS_PROG] = 0x80; // legacy ATA mode
 
@@ -164,10 +165,8 @@ static void pci_piix_ide_realize(PCIDevice *dev, Error **errp)
 
     vmstate_register(VMSTATE_IF(dev), 0, &vmstate_ide_pci, d);
 
-    rc = pci_piix_init_ports(d);
-    if (rc) {
-        error_setg_errno(errp, -rc, "Failed to realize %s",
-                         object_get_typename(OBJECT(dev)));
+    if (!pci_piix_init_ports(d, errp)) {
+        return;
     }
 }
 
-- 
2.38.1


