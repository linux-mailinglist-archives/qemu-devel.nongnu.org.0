Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CDCA66A8C1B
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Mar 2023 23:44:48 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pXrcQ-0007Bg-G3; Thu, 02 Mar 2023 17:41:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pXrcO-00079j-6K
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 17:41:44 -0500
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pXrcL-0008SN-OR
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 17:41:43 -0500
Received: by mail-wr1-x429.google.com with SMTP id l1so570405wry.12
 for <qemu-devel@nongnu.org>; Thu, 02 Mar 2023 14:41:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1677796900;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=vZWv5g94w5/z2ukq0a5DPi6E7jJ1PV3zxu20I2knB1k=;
 b=a0ZDSzlUaRF4M94Ty2bola16cPNLoxshrxMrFJ1TVyi1dxY7NZDrJCV0dOBQLg648f
 fcecZU2AVR6QArRjpgFkZj4Cm032673VZVsEgz+UGbYn4NOU7gjcpWI1NbQn1eX9kcq0
 DmePMI8pznNPOZ4NzeFrYAVYsYJFIngEDSV5YXn5r4ZVxg5XKnz+DUwP0kdShnOi7m8h
 da9WM78d8vrBGhKVW+uIRP/iJjrLL9A3Qj8Iero0eCJKbnOuKB6MeDM61ovN49zPdMPh
 ST25gkFx1YHHazsS64+vG9Fu7ieDNIs1hsIm8mI+dVcy1gxVLLi4PTp+YAb9OMkHkqtl
 5wWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677796900;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=vZWv5g94w5/z2ukq0a5DPi6E7jJ1PV3zxu20I2knB1k=;
 b=qtEzTI9jyitrU0wfIXa/JfH1xwG9PxWfoblJlc1v+2MZiOimz/otAtHlagwtYj+HmL
 /CJTeUvQa9Y9GO5AOTrzViND1/E6l8eqxq8DnZDpta/b3HfiVzDUQLHi21ajrHspmDxI
 ednu1Nlfvqk9MjNnMREUFrqgE6VS47BCBHT/WYuZ1LobfNIP5ixhlGLoLE9h2Eq63nsO
 2WGE7c+5fb4ezFkQf5Z0ifT2445pbDGzvylxT8+nknDdkPShccWApJvLtxsqC+guAo6H
 7pmLHFJ4ebCDGjxZYw8LNeywR1tRjXSYP2WDUNLO+NSAaptv/rxwvFmpgDkK2P70CSzj
 UmWg==
X-Gm-Message-State: AO0yUKXz2NzD8Z9e4pH9g4oyPYDEJ/UrXl/8HMPdfH+G7Dy+g8rmMoxV
 Ww5I7DZR3ZUo0JG8yMR2IVxcj5s41QJAi+nW
X-Google-Smtp-Source: AK7set+0YZ/011TnW1nK9J4+AwDPwJsneU7pqGZJ6HPu/u9dBm7pQiGxCU5qJmMQnuKRm8jl01Ir9g==
X-Received: by 2002:adf:ef84:0:b0:2ca:5c9a:a548 with SMTP id
 d4-20020adfef84000000b002ca5c9aa548mr9383787wro.60.1677796900014; 
 Thu, 02 Mar 2023 14:41:40 -0800 (PST)
Received: from localhost.localdomain (43.red-95-127-39.staticip.rima-tde.net.
 [95.127.39.43]) by smtp.gmail.com with ESMTPSA id
 j14-20020a5d564e000000b002cde25fba30sm523767wrw.1.2023.03.02.14.41.37
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 02 Mar 2023 14:41:39 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org,
	Bernhard Beschow <shentey@gmail.com>
Cc: John Snow <jsnow@redhat.com>, David Woodhouse <dwmw2@infradead.org>,
 BALATON Zoltan <balaton@eik.bme.hu>,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 qemu-ppc@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-block@nongnu.org
Subject: [PATCH v3 05/18] hw/ide: Rename ISA specific ide_init_ioport ->
 ide_bus_init_ioport_isa
Date: Thu,  2 Mar 2023 23:40:45 +0100
Message-Id: <20230302224058.43315-6-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230302224058.43315-1-philmd@linaro.org>
References: <20230302224058.43315-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x429.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

Rename ide_init_ioport() as ide_bus_init_ioport_isa() to make
explicit it expects an ISA device. Move the declaration to
"hw/ide/isa.h" where it belongs.

Message-Id: <20230215161641.32663-13-philmd@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/ide/ioport.c           | 4 +++-
 hw/ide/isa.c              | 2 +-
 hw/ide/piix.c             | 5 +++--
 include/hw/ide/internal.h | 1 -
 include/hw/ide/isa.h      | 3 +++
 5 files changed, 10 insertions(+), 5 deletions(-)

diff --git a/hw/ide/ioport.c b/hw/ide/ioport.c
index e2ecc6230c..d869f8018a 100644
--- a/hw/ide/ioport.c
+++ b/hw/ide/ioport.c
@@ -25,6 +25,7 @@
 
 #include "qemu/osdep.h"
 #include "hw/isa/isa.h"
+#include "hw/ide/isa.h"
 #include "hw/ide/internal.h"
 #include "trace.h"
 
@@ -40,7 +41,8 @@ static const MemoryRegionPortio ide_portio2_list[] = {
     PORTIO_END_OF_LIST(),
 };
 
-int ide_init_ioport(IDEBus *bus, ISADevice *dev, int iobase, int iobase2)
+int ide_bus_init_ioport_isa(IDEBus *bus, ISADevice *dev,
+                            int iobase, int iobase2)
 {
     int ret;
 
diff --git a/hw/ide/isa.c b/hw/ide/isa.c
index 95053e026f..6eed16bf87 100644
--- a/hw/ide/isa.c
+++ b/hw/ide/isa.c
@@ -71,7 +71,7 @@ static void isa_ide_realizefn(DeviceState *dev, Error **errp)
     ISAIDEState *s = ISA_IDE(dev);
 
     ide_bus_init(&s->bus, sizeof(s->bus), dev, 0, 2);
-    ide_init_ioport(&s->bus, isadev, s->iobase, s->iobase2);
+    ide_bus_init_ioport_isa(&s->bus, isadev, s->iobase, s->iobase2);
     ide_bus_init_output_irq(&s->bus, isa_get_irq(isadev, s->irqnum));
     vmstate_register(VMSTATE_IF(dev), 0, &vmstate_ide_isa, s);
     ide_bus_register_restart_cb(&s->bus);
diff --git a/hw/ide/piix.c b/hw/ide/piix.c
index 7cb96ef67f..cb527553e2 100644
--- a/hw/ide/piix.c
+++ b/hw/ide/piix.c
@@ -33,6 +33,7 @@
 #include "hw/pci/pci.h"
 #include "hw/ide/piix.h"
 #include "hw/ide/pci.h"
+#include "hw/ide/isa.h"
 #include "trace.h"
 
 static uint64_t bmdma_read(void *opaque, hwaddr addr, unsigned size)
@@ -142,8 +143,8 @@ static bool pci_piix_init_bus(PCIIDEState *d, unsigned i, Error **errp)
 
     qemu_irq irq_out = d->isa_irq[i] ? : isa_get_irq(NULL, port_info[i].isairq);
     ide_bus_init(&d->bus[i], sizeof(d->bus[i]), DEVICE(d), i, 2);
-    ret = ide_init_ioport(&d->bus[i], NULL, port_info[i].iobase,
-                          port_info[i].iobase2);
+    ret = ide_bus_init_ioport_isa(&d->bus[i], NULL, port_info[i].iobase,
+                                  port_info[i].iobase2);
     if (ret) {
         error_setg_errno(errp, -ret, "Failed to realize %s port %u",
                          object_get_typename(OBJECT(d)), i);
diff --git a/include/hw/ide/internal.h b/include/hw/ide/internal.h
index d9f1f77dd5..d3b7fdc504 100644
--- a/include/hw/ide/internal.h
+++ b/include/hw/ide/internal.h
@@ -618,7 +618,6 @@ int ide_init_drive(IDEState *s, BlockBackend *blk, IDEDriveKind kind,
                    int chs_trans, Error **errp);
 void ide_exit(IDEState *s);
 void ide_bus_init_output_irq(IDEBus *bus, qemu_irq irq_out);
-int ide_init_ioport(IDEBus *bus, ISADevice *isa, int iobase, int iobase2);
 void ide_bus_set_irq(IDEBus *bus);
 void ide_bus_register_restart_cb(IDEBus *bus);
 
diff --git a/include/hw/ide/isa.h b/include/hw/ide/isa.h
index 1cd0ff1fa6..7f7a850265 100644
--- a/include/hw/ide/isa.h
+++ b/include/hw/ide/isa.h
@@ -10,11 +10,14 @@
 #define HW_IDE_ISA_H
 
 #include "qom/object.h"
+#include "hw/ide/internal.h"
 
 #define TYPE_ISA_IDE "isa-ide"
 OBJECT_DECLARE_SIMPLE_TYPE(ISAIDEState, ISA_IDE)
 
 ISADevice *isa_ide_init(ISABus *bus, int iobase, int iobase2, int irqnum,
                         DriveInfo *hd0, DriveInfo *hd1);
+int ide_bus_init_ioport_isa(IDEBus *bus, ISADevice *isa,
+                            int iobase, int iobase2);
 
 #endif
-- 
2.38.1


