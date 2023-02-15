Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F3BB697AAF
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Feb 2023 12:28:33 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pSFwp-00005G-Lh; Wed, 15 Feb 2023 06:27:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pSFwo-00004s-9c
 for qemu-devel@nongnu.org; Wed, 15 Feb 2023 06:27:38 -0500
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pSFwl-0003TX-6a
 for qemu-devel@nongnu.org; Wed, 15 Feb 2023 06:27:38 -0500
Received: by mail-wr1-x429.google.com with SMTP id bu23so18771081wrb.8
 for <qemu-devel@nongnu.org>; Wed, 15 Feb 2023 03:27:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=8xKvZhVnGK46sZaCWWOj4E0Pe48nX53AIxJFLus3xXA=;
 b=NugSdeMVxhOGx7UOJzRhCE0f2UuKuazwNJGytt7dH+tl/g8GHFglXKIhe95WwwVOVk
 rRj5LblhWC9gJaCxvhOqxXHXLdEEI7QR6kg/cNJmFuDinEu8n93EW6G33+mgiLT5njwu
 Jjwb24/EIMIHGwLhsNSsTK/hONHSWZcQ9H7M2m3+zC1q4ZZhQzYEavK8Hj1rQKVImEiv
 MPNljNzmKn+1ocu/PgaByyPn9ValTsbSVlt6T0f72EjfaZxs96Ja8GVrNt323fACfeIZ
 YvTygmafxTErbQFwyh/SWH8Sjc5lSHUnHOXQJ+hvRhkyRniU56+T+6aG1vf6LxQDXyHS
 ABog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=8xKvZhVnGK46sZaCWWOj4E0Pe48nX53AIxJFLus3xXA=;
 b=GdeJ9LpjiRzHil36X0iHCBfqe44hd3kviB7s5xHTC8Jf+rIjzs/Anf0vJPaGPyEh+R
 YLDgNJzV7NEUEw6367hRyPW9JSFZtQaUycpog8rIEu0VfwomKgVQKoJN6IpdFhabJUw2
 drRtvzD4/ilKkymX8xEF1QY5tfnl0s29OOqYiBb/O23+Vx2sT2vZmiNVq0QZ8eK8SivD
 2tbUefqJcmO1gzEmTVpPKJ3EPx7LNmAnVTiSoy7vQONuMutwQDFBQeMPGWZfye5vSViZ
 StadBuKdbvBpbLK2aTn4j+ycKRySU53UH5iFRh7SqD3XBzbUkXgbxhCVSvZqv5SIwE/t
 HYpQ==
X-Gm-Message-State: AO0yUKUSmnAZQfq0dF027j8u3xQPzBMtUwnzI9NmEdzPwoTz/iIq5YE2
 hThiQqfvbOcDZ/XIoepheRmDC0fCA2GmRXaO
X-Google-Smtp-Source: AK7set8lLn65hY7bsTG5YtvMTnUD/SaPeBTaG5YGusbHku8tOWcv98GGWTut90HPphlZOs16Tvtd1w==
X-Received: by 2002:adf:f40b:0:b0:2c5:5ff8:93e5 with SMTP id
 g11-20020adff40b000000b002c55ff893e5mr1209167wro.44.1676460453690; 
 Wed, 15 Feb 2023 03:27:33 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 n27-20020a05600c3b9b00b003e206cc7237sm29089wms.24.2023.02.15.03.27.32
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 15 Feb 2023 03:27:33 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, Eduardo Habkost <eduardo@habkost.net>,
 John Snow <jsnow@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
Subject: [PATCH 04/20] hw/ide/isa: Extract TYPE_ISA_IDE declarations to
 'hw/ide/isa.h'
Date: Wed, 15 Feb 2023 12:26:56 +0100
Message-Id: <20230215112712.23110-5-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230215112712.23110-1-philmd@linaro.org>
References: <20230215112712.23110-1-philmd@linaro.org>
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

"hw/ide.h" is a mixed bag of lost IDE declarations.

Extract isa_ide_init() and the TYPE_ISA_IDE QOM declarations
to a new "hw/ide/isa.h" header.

Rename ISAIDEState::isairq as 'irqnum' to emphasize this is
not a qemu_irq object but the number (index) of an ISA IRQ.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/i386/pc_piix.c    |  1 +
 hw/ide/isa.c         | 14 ++++++--------
 include/hw/ide.h     |  5 -----
 include/hw/ide/isa.h | 20 ++++++++++++++++++++
 4 files changed, 27 insertions(+), 13 deletions(-)
 create mode 100644 include/hw/ide/isa.h

diff --git a/hw/i386/pc_piix.c b/hw/i386/pc_piix.c
index df64dd8dcc..7085b4bc58 100644
--- a/hw/i386/pc_piix.c
+++ b/hw/i386/pc_piix.c
@@ -39,6 +39,7 @@
 #include "hw/pci/pci_ids.h"
 #include "hw/usb.h"
 #include "net/net.h"
+#include "hw/ide/isa.h"
 #include "hw/ide/pci.h"
 #include "hw/ide/piix.h"
 #include "hw/irq.h"
diff --git a/hw/ide/isa.c b/hw/ide/isa.c
index 8bedbd13f1..5c3e83a0fc 100644
--- a/hw/ide/isa.c
+++ b/hw/ide/isa.c
@@ -31,22 +31,20 @@
 #include "qemu/module.h"
 #include "sysemu/dma.h"
 
+#include "hw/ide/isa.h"
 #include "hw/ide/internal.h"
 #include "qom/object.h"
 
 /***********************************************************/
 /* ISA IDE definitions */
 
-#define TYPE_ISA_IDE "isa-ide"
-OBJECT_DECLARE_SIMPLE_TYPE(ISAIDEState, ISA_IDE)
-
 struct ISAIDEState {
     ISADevice parent_obj;
 
     IDEBus    bus;
     uint32_t  iobase;
     uint32_t  iobase2;
-    uint32_t  isairq;
+    uint32_t  irqnum;
     qemu_irq  irq;
 };
 
@@ -75,13 +73,13 @@ static void isa_ide_realizefn(DeviceState *dev, Error **errp)
 
     ide_bus_init(&s->bus, sizeof(s->bus), dev, 0, 2);
     ide_init_ioport(&s->bus, isadev, s->iobase, s->iobase2);
-    s->irq = isa_get_irq(isadev, s->isairq);
+    s->irq = isa_get_irq(isadev, s->irqnum);
     ide_init2(&s->bus, s->irq);
     vmstate_register(VMSTATE_IF(dev), 0, &vmstate_ide_isa, s);
     ide_register_restart_cb(&s->bus);
 }
 
-ISADevice *isa_ide_init(ISABus *bus, int iobase, int iobase2, int isairq,
+ISADevice *isa_ide_init(ISABus *bus, int iobase, int iobase2, int irqnum,
                         DriveInfo *hd0, DriveInfo *hd1)
 {
     DeviceState *dev;
@@ -92,7 +90,7 @@ ISADevice *isa_ide_init(ISABus *bus, int iobase, int iobase2, int isairq,
     dev = DEVICE(isadev);
     qdev_prop_set_uint32(dev, "iobase",  iobase);
     qdev_prop_set_uint32(dev, "iobase2", iobase2);
-    qdev_prop_set_uint32(dev, "irq",     isairq);
+    qdev_prop_set_uint32(dev, "irq",     irqnum);
     isa_realize_and_unref(isadev, bus, &error_fatal);
 
     s = ISA_IDE(dev);
@@ -108,7 +106,7 @@ ISADevice *isa_ide_init(ISABus *bus, int iobase, int iobase2, int isairq,
 static Property isa_ide_properties[] = {
     DEFINE_PROP_UINT32("iobase",  ISAIDEState, iobase,  0x1f0),
     DEFINE_PROP_UINT32("iobase2", ISAIDEState, iobase2, 0x3f6),
-    DEFINE_PROP_UINT32("irq",    ISAIDEState, isairq,  14),
+    DEFINE_PROP_UINT32("irq",     ISAIDEState, irqnum,  14),
     DEFINE_PROP_END_OF_LIST(),
 };
 
diff --git a/include/hw/ide.h b/include/hw/ide.h
index 5f8c36b2aa..24a7aa2925 100644
--- a/include/hw/ide.h
+++ b/include/hw/ide.h
@@ -1,13 +1,8 @@
 #ifndef HW_IDE_H
 #define HW_IDE_H
 
-#include "hw/isa/isa.h"
 #include "exec/memory.h"
 
-/* ide-isa.c */
-ISADevice *isa_ide_init(ISABus *bus, int iobase, int iobase2, int isairq,
-                        DriveInfo *hd0, DriveInfo *hd1);
-
 int ide_get_geometry(BusState *bus, int unit,
                      int16_t *cyls, int8_t *heads, int8_t *secs);
 int ide_get_bios_chs_trans(BusState *bus, int unit);
diff --git a/include/hw/ide/isa.h b/include/hw/ide/isa.h
new file mode 100644
index 0000000000..1cd0ff1fa6
--- /dev/null
+++ b/include/hw/ide/isa.h
@@ -0,0 +1,20 @@
+/*
+ * QEMU IDE Emulation: ISA Bus support.
+ *
+ * Copyright (c) 2003 Fabrice Bellard
+ * Copyright (c) 2006 Openedhand Ltd.
+ *
+ * SPDX-License-Identifier: MIT
+ */
+#ifndef HW_IDE_ISA_H
+#define HW_IDE_ISA_H
+
+#include "qom/object.h"
+
+#define TYPE_ISA_IDE "isa-ide"
+OBJECT_DECLARE_SIMPLE_TYPE(ISAIDEState, ISA_IDE)
+
+ISADevice *isa_ide_init(ISABus *bus, int iobase, int iobase2, int irqnum,
+                        DriveInfo *hd0, DriveInfo *hd1);
+
+#endif
-- 
2.38.1


