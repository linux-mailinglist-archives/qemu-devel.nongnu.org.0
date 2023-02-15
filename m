Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B9DF0697AB1
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Feb 2023 12:28:59 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pSFxG-00011c-Js; Wed, 15 Feb 2023 06:28:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pSFxB-0000kr-Ba
 for qemu-devel@nongnu.org; Wed, 15 Feb 2023 06:28:01 -0500
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pSFx9-0003Pq-80
 for qemu-devel@nongnu.org; Wed, 15 Feb 2023 06:28:00 -0500
Received: by mail-wr1-x42e.google.com with SMTP id y1so18805465wru.2
 for <qemu-devel@nongnu.org>; Wed, 15 Feb 2023 03:27:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=lRBJt3/a5AQkWk6sGB4CY5cBjybxjq8f9nxbechh2uk=;
 b=m0H56OuK3Ozxw3g8voFeSzoZVdKBd1uACvb2WRFiVbyQuLugAQJJ8lSv3+B6bgM5ea
 7u6quTfrZd9r4QJFR4vlcFZpnL1P2+t/6XRQF5b1ifP0DjWimP34FSm3TuHzumyDQpoK
 u82DF7GsKCuW5oskiBaH6JD9bqsvYdxM7ih599vX+NXlCivyYiUWQnkNlks5QztEHu1x
 nu4Ut3uWZ0C4DBHdtx6M8DiGPGLHo2euvoy/TxY7Od3uE4lKkDpaE+JZIN44/Ha33jvE
 MN09QIrquQQaSnJLXJ3du5o48RzmJpX6gJOcTnWozpNkTiEsm+mW7SNXzxbm3EajS5F1
 rVkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=lRBJt3/a5AQkWk6sGB4CY5cBjybxjq8f9nxbechh2uk=;
 b=tXc8vI2QbWEIph62b+gbJH0KPpvA7cLajfGqvLtH6jV/yG7knXUE+u/8hT2vwVAS+x
 q7ztyIHw5AimZE2+HHk5W+dHEp6HPiwdAxkfeuMOQDizCeO3P9p2qu+LJNPzNUCwl74v
 L1vfaVWD7wrRyyH6g9y2ZM1NI5ssr8j0nvTvEIP6xdg+2SYvYcPgIeKVUE6D+LBKNvV2
 P+sV9rTRZ5eYixdzF9dsXtvscQUUt/DvoglrVgHFQHnJjF7T1NFgkp0v7UHbHTQcV75S
 szGZasR7Zecti4ZckyGFJgrnY2Po9Q4sQV3RNH8aB+ds2H1i/J/dbuel1O3owKPGFxhP
 e3FA==
X-Gm-Message-State: AO0yUKXkZbJWuM0W2jDg2nRSUvdm9C882ABTxddiCR1FpCqRmTl57wKd
 A+DrdEu+KHcsFOS0wkeqaONeSCgJN46rTcuA
X-Google-Smtp-Source: AK7set/rYaYRdhjultEfICVQ9EfL+6rDDnVXFrvvex81mglNid8+kUz0/UNWDh23zCspHT4LQ1LdiQ==
X-Received: by 2002:adf:ecc3:0:b0:2c5:4bcf:c62a with SMTP id
 s3-20020adfecc3000000b002c54bcfc62amr1195934wro.29.1676460478190; 
 Wed, 15 Feb 2023 03:27:58 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 v12-20020a5d610c000000b002c56a991971sm2407905wrt.76.2023.02.15.03.27.57
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 15 Feb 2023 03:27:57 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, Eduardo Habkost <eduardo@habkost.net>,
 John Snow <jsnow@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Artyom Tarasenko <atar4qemu@gmail.com>, qemu-ppc@nongnu.org
Subject: [PATCH 09/20] hw/ide: Un-inline ide_set_irq()
Date: Wed, 15 Feb 2023 12:27:01 +0100
Message-Id: <20230215112712.23110-10-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230215112712.23110-1-philmd@linaro.org>
References: <20230215112712.23110-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42e.google.com
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

Only include "hw/irq.h" where appropriate.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/ide/ahci.c             | 1 +
 hw/ide/core.c             | 8 ++++++++
 hw/ide/ich.c              | 1 +
 hw/ide/macio.c            | 1 +
 hw/ide/microdrive.c       | 1 +
 hw/ide/pci.c              | 1 +
 hw/misc/macio/gpio.c      | 1 +
 hw/sparc64/sun4u.c        | 1 +
 include/hw/ide/internal.h | 9 +--------
 9 files changed, 16 insertions(+), 8 deletions(-)

diff --git a/hw/ide/ahci.c b/hw/ide/ahci.c
index 7ce001cacd..3e21f607fe 100644
--- a/hw/ide/ahci.c
+++ b/hw/ide/ahci.c
@@ -22,6 +22,7 @@
  */
 
 #include "qemu/osdep.h"
+#include "hw/irq.h"
 #include "hw/pci/msi.h"
 #include "hw/pci/pci.h"
 #include "hw/qdev-properties.h"
diff --git a/hw/ide/core.c b/hw/ide/core.c
index 5d1039378f..1473b6057f 100644
--- a/hw/ide/core.c
+++ b/hw/ide/core.c
@@ -24,6 +24,7 @@
  */
 
 #include "qemu/osdep.h"
+#include "hw/irq.h"
 #include "hw/isa/isa.h"
 #include "migration/vmstate.h"
 #include "qemu/error-report.h"
@@ -2782,6 +2783,13 @@ void ide_init2(IDEBus *bus, qemu_irq irq)
     bus->dma = &ide_dma_nop;
 }
 
+void ide_set_irq(IDEBus *bus)
+{
+    if (!(bus->cmd & IDE_CTRL_DISABLE_IRQ)) {
+        qemu_irq_raise(bus->irq);
+    }
+}
+
 void ide_exit(IDEState *s)
 {
     timer_free(s->sector_write_timer);
diff --git a/hw/ide/ich.c b/hw/ide/ich.c
index 1007a51fcb..d61faab532 100644
--- a/hw/ide/ich.c
+++ b/hw/ide/ich.c
@@ -61,6 +61,7 @@
  */
 
 #include "qemu/osdep.h"
+#include "hw/irq.h"
 #include "hw/pci/msi.h"
 #include "hw/pci/pci.h"
 #include "migration/vmstate.h"
diff --git a/hw/ide/macio.c b/hw/ide/macio.c
index e604466acb..15fd934831 100644
--- a/hw/ide/macio.c
+++ b/hw/ide/macio.c
@@ -24,6 +24,7 @@
  */
 
 #include "qemu/osdep.h"
+#include "hw/irq.h"
 #include "hw/ppc/mac_dbdma.h"
 #include "hw/qdev-properties.h"
 #include "migration/vmstate.h"
diff --git a/hw/ide/microdrive.c b/hw/ide/microdrive.c
index 56c5be3655..b9822b939b 100644
--- a/hw/ide/microdrive.c
+++ b/hw/ide/microdrive.c
@@ -29,6 +29,7 @@
 #include "qapi/error.h"
 #include "qemu/module.h"
 #include "sysemu/dma.h"
+#include "hw/irq.h"
 
 #include "hw/ide/internal.h"
 #include "qom/object.h"
diff --git a/hw/ide/pci.c b/hw/ide/pci.c
index 84ba733548..ae638dee0d 100644
--- a/hw/ide/pci.c
+++ b/hw/ide/pci.c
@@ -24,6 +24,7 @@
  */
 
 #include "qemu/osdep.h"
+#include "hw/irq.h"
 #include "hw/pci/pci.h"
 #include "migration/vmstate.h"
 #include "sysemu/dma.h"
diff --git a/hw/misc/macio/gpio.c b/hw/misc/macio/gpio.c
index c8ac5633b2..4deb330471 100644
--- a/hw/misc/macio/gpio.c
+++ b/hw/misc/macio/gpio.c
@@ -28,6 +28,7 @@
 #include "migration/vmstate.h"
 #include "hw/misc/macio/macio.h"
 #include "hw/misc/macio/gpio.h"
+#include "hw/irq.h"
 #include "hw/nmi.h"
 #include "qemu/log.h"
 #include "qemu/module.h"
diff --git a/hw/sparc64/sun4u.c b/hw/sparc64/sun4u.c
index 387181ff77..cb2d0fbbe7 100644
--- a/hw/sparc64/sun4u.c
+++ b/hw/sparc64/sun4u.c
@@ -28,6 +28,7 @@
 #include "qapi/error.h"
 #include "qemu/datadir.h"
 #include "cpu.h"
+#include "hw/irq.h"
 #include "hw/pci/pci.h"
 #include "hw/pci/pci_bridge.h"
 #include "hw/pci/pci_bus.h"
diff --git a/include/hw/ide/internal.h b/include/hw/ide/internal.h
index 84d3722d67..57a6278327 100644
--- a/include/hw/ide/internal.h
+++ b/include/hw/ide/internal.h
@@ -8,7 +8,6 @@
  */
 
 #include "hw/ide.h"
-#include "hw/irq.h"
 #include "sysemu/dma.h"
 #include "hw/block/block.h"
 #include "exec/ioport.h"
@@ -572,13 +571,6 @@ static inline IDEState *idebus_active_if(IDEBus *bus)
     return bus->ifs + bus->unit;
 }
 
-static inline void ide_set_irq(IDEBus *bus)
-{
-    if (!(bus->cmd & IDE_CTRL_DISABLE_IRQ)) {
-        qemu_irq_raise(bus->irq);
-    }
-}
-
 /* hw/ide/core.c */
 extern const VMStateDescription vmstate_ide_bus;
 
@@ -627,6 +619,7 @@ int ide_init_drive(IDEState *s, BlockBackend *blk, IDEDriveKind kind,
 void ide_init2(IDEBus *bus, qemu_irq irq);
 void ide_exit(IDEState *s);
 int ide_init_ioport(IDEBus *bus, ISADevice *isa, int iobase, int iobase2);
+void ide_set_irq(IDEBus *bus);
 void ide_register_restart_cb(IDEBus *bus);
 
 void ide_exec_cmd(IDEBus *bus, uint32_t val);
-- 
2.38.1


