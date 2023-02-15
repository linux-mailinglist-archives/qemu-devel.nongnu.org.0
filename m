Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FEC7697AC2
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Feb 2023 12:30:10 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pSFy5-0003OO-8S; Wed, 15 Feb 2023 06:28:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pSFxx-000329-JS
 for qemu-devel@nongnu.org; Wed, 15 Feb 2023 06:28:51 -0500
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pSFxw-0003X4-0P
 for qemu-devel@nongnu.org; Wed, 15 Feb 2023 06:28:49 -0500
Received: by mail-wr1-x42c.google.com with SMTP id m10so9872497wrn.4
 for <qemu-devel@nongnu.org>; Wed, 15 Feb 2023 03:28:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=4pZvcBz/M9JVspsVPGj8tHQKwKplW2O7nq3QqDRzxpo=;
 b=uqi7ArIRN+gum6G0JqTGsQg1HVX4upXCd/85Zz4mP7KzK9YTe0RPy+qgTnU4OM8kPr
 ITbyUPh8AUzBv1Hs+X0aMMZijvhbd8Vrb0L2zG8eFhwp3fr6zn/zmzcbecSEecs3SSeV
 oldXRGwRMerjzGvIQQJ04XBzburldMIiUgdb1DwDhHMa3NGExZpekQ9OuOsV5vZ6jFmN
 EgNcOxJqxX9D6/OPfb/4Z8sN7WDT99G4mm7Vm1uMzROHfeIub0e4ZU1B5stxVkYmB/O7
 E7equB1Cd7sW43552waeul2qpcxfQ6RfNwopo25fYINylxULYyMNsuB8ElaXhprwE+O4
 Wgvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=4pZvcBz/M9JVspsVPGj8tHQKwKplW2O7nq3QqDRzxpo=;
 b=I0l26ufSsJy+yPl7ZgeQz+vhH7c5OxjOsD9K5cAZJqVe/2DteficEv9qc/3f00LEIk
 1CSPuH8sLCTPIAL0+/D5ZRUo/IrqnVq/729gjBsJzQe1OCDJKpH5OulGoW8abMjMvtwF
 5vaYOJn8ILM0mdBOJ0RVS3r3n+wXZYg/iOVz2+DjCzF9c47+8l7oMfpy9fsvDeqzEvbk
 9ro7WhqXVpxeH9WzUnD78EmG5eR4tHPbS348OcRe2NzczPRu7AaTTvDHtuUzvKc3tfZ2
 7MBTQ9rITcIGGmAgzf6bhW1RIXStWUlPm4SJuYASPho4bhHue1zpOFgUFnWSYEDIKA3J
 t0dA==
X-Gm-Message-State: AO0yUKWSfXjAuhzkVxpXt0hOnWUpxib+L93qgZoR05iGBHMVDxlR5bOE
 w8Db+KYBwO81ReJIx0bGcDUHP6LcY4aq3T5N
X-Google-Smtp-Source: AK7set8177pmYmaHd0twvUO3zNRm1RxM9FzWcogS6irKhTqwnqMozYiUVFO1i0fcyLyOUe9Q14AgPQ==
X-Received: by 2002:adf:ce83:0:b0:2c3:e16a:aa33 with SMTP id
 r3-20020adfce83000000b002c3e16aaa33mr1181323wrn.36.1676460527150; 
 Wed, 15 Feb 2023 03:28:47 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 z17-20020a5d4d11000000b002c56a7872f4sm2482148wrt.82.2023.02.15.03.28.46
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 15 Feb 2023 03:28:46 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, Eduardo Habkost <eduardo@habkost.net>,
 John Snow <jsnow@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 19/20] hw/ide/piix: Pass Error* to pci_piix_init_ports() for
 better error msg
Date: Wed, 15 Feb 2023 12:27:11 +0100
Message-Id: <20230215112712.23110-20-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230215112712.23110-1-philmd@linaro.org>
References: <20230215112712.23110-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42c.google.com
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


