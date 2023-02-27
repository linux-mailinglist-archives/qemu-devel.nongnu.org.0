Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F9306A441D
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Feb 2023 15:18:05 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pWeFM-0001Z2-F6; Mon, 27 Feb 2023 09:12:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pWeDc-0008GB-7R
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 09:11:13 -0500
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pWeDZ-000109-0X
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 09:11:07 -0500
Received: by mail-wr1-x430.google.com with SMTP id bv17so6375140wrb.5
 for <qemu-devel@nongnu.org>; Mon, 27 Feb 2023 06:11:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=9BKlSKMnDRINkghzZqZAhHYmo0aDImrj9cOx+uErDGk=;
 b=JciwVA5cxvJm3qxKhgzMTvK0pqS+IqbvGL4S+MfFcbxrW4N2HEbApjSS+YHzYPmg4P
 KrFxeSayGAH/jSfvSNB1zuJzXwUaDngPBEvIikXm8ksDEPOpCGIrcXgS/own/BpE2pUW
 9tlVja5Uyw3uY2/5a5fo0Yt3fnLk8k8xADB+w2qbcN14FhtucM/ZGz7JQ485o9m3gHSd
 Qyr5x04rMw1TxlpZp0AFFB78Ri8aeejXyL5fmaq4thI5rEnBDIlpzEzRiowNaEXG0UZu
 ci+4cuAjO6Wm9I2b8UILMe884r9s3aR+Yum7EBDEnQg+6dU7kXoSH///s8r+SvItSddO
 yrag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=9BKlSKMnDRINkghzZqZAhHYmo0aDImrj9cOx+uErDGk=;
 b=Zg7CjN7Kgh2v456FIsxck/AUvfXLZyNZByMyQifKQgiuQrWRY9B6FAE+stqKau/G0b
 gb2D1fjXHFqNn0Urwv2Pzqwb6Bocd1EAL33JqjAfsxZwGEQ0RWqmWn8iSDuhkS1cl2Ux
 mUGT3eZMaHHoRTdRTC89Q+9vwaymFILWhnj725LzXf02cc4geNunAELOb4iNNRCmTmkL
 RGDA4qIvmOn7hl0+GrIBvIxe4Zur7yIPa8qvWVjuLXqiJ6sEEN1JW/j9dAZUIfiyEazy
 G+nSRmyChQo1p/82zKCFkf9b0gVGmhR1S4j5L5hA53GgNgg/FEWjFt0xAoFDzgsr98qe
 /WhA==
X-Gm-Message-State: AO0yUKVYZFUxnX63wrBc7i5+VfTxXsjCeWKwqBwuUjHcfKsN6EfbL/vU
 wfoY9GM16ieh2RU7bNbZbrd482YFGOC/cKfz
X-Google-Smtp-Source: AK7set81Am8Tc00wastLcEVIaFQWGEIFoDGiDTJBjQ66o3etH5zuuHEKKnPRP24XUVInyikXV/BQjQ==
X-Received: by 2002:a5d:408e:0:b0:2c7:deb:c61 with SMTP id
 o14-20020a5d408e000000b002c70deb0c61mr13826040wrp.39.1677507060733; 
 Mon, 27 Feb 2023 06:11:00 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 y13-20020adfe6cd000000b002c8476dde7asm7188020wrm.114.2023.02.27.06.10.59
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 27 Feb 2023 06:11:00 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 106/126] hw/ide: Un-inline ide_set_irq()
Date: Mon, 27 Feb 2023 15:01:53 +0100
Message-Id: <20230227140213.35084-97-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230227140213.35084-1-philmd@linaro.org>
References: <20230227140213.35084-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x430.google.com
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

Only include "hw/irq.h" where appropriate.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Message-Id: <20230215112712.23110-10-philmd@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
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
index 595a96203f..08c7ae6e3c 100644
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
index 8a56ba9f98..a25e951f9d 100644
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


