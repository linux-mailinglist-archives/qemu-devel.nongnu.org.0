Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5641869C77A
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Feb 2023 10:16:38 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pU2GB-0006H7-RR; Mon, 20 Feb 2023 04:14:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pU2G7-0006Ae-PG
 for qemu-devel@nongnu.org; Mon, 20 Feb 2023 04:14:56 -0500
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pU2G4-0003oX-Nj
 for qemu-devel@nongnu.org; Mon, 20 Feb 2023 04:14:55 -0500
Received: by mail-wr1-x431.google.com with SMTP id v3so256351wrp.2
 for <qemu-devel@nongnu.org>; Mon, 20 Feb 2023 01:14:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=FOmXyBanz6S+n204WlJsn+lUZrrI5EryewBPrff6Ww8=;
 b=SZMmpFIE3LLMs9Dvfftvm+3Jf52QEbVRb0i6UzQFwK5X0xVraceBByvQj0Ig2WgnFY
 ymMghBACAjtBddhQwAxY+RmHxAicvK/YlufuXNKzPW9G6ONIw40nOdXnWXCjLF8C7NOb
 geFxFvS4hbBSBYhRCHLnS2IGKT7uQNGkmr0ti1GLEOUJmBjycyhVe0IMpT2v9yDkwR8b
 ePuwR5KCJCB12NEh95nfDasa3/VcWuKow5Vztf1RHuiIL4F8LSTGO+QjJcgsTWSd9wye
 Im/8RZrD8p6pyUVpyG8/Oqk0ivjehufZ7Ryss8wx7atMLKLi7SVZkGRP/vwXctxpCkJO
 M4PQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=FOmXyBanz6S+n204WlJsn+lUZrrI5EryewBPrff6Ww8=;
 b=vvb9s/uAhnDeV41+r6OVHys2lOILMolXX9Raa1+HBpXeO7wZNO8Lh3CyLbdT5he1xh
 0N/YlcTG+DpGHVntjkctPThx39t3Cw/+AbVvRSVgUXcqXMLpr9f1wtIWNKMtnSbMQ1Ba
 cyXaonzU+wXYIrw6xhaVZKoE1qlOlcMUy+fw7NI7jX4XVcfHx7U/M0GIoP+NfjYhl4EO
 rAOZuRD6KnqDWOfxU0qIpoICTBcLD5R4N45a1kT5QQGz+7o0ktDnm3TyB3yLfMiUFeEt
 UFB8+2M5TVOyMQGf5JbC4Aeu/iWIyRvhlS9LuWuQL4HUz30970NI1dDZ1a08PJW60Oy6
 ER2g==
X-Gm-Message-State: AO0yUKW5YGtIx2UmjRCHiMVVw70Z7APAoiczhvYxWPI6chhXSOkZm0Wu
 cMGdBrmXu6afHrWEKgmIglCCv+ZFdQlMED3i
X-Google-Smtp-Source: AK7set/+a1RO8UvjsEjZ3VN0III+r3aQqKWNzFC6jOtBhn4oYv2lTGd4gNGuU3AygZb4WtZ1BcpMOw==
X-Received: by 2002:a05:6000:14e:b0:2bf:dcdc:afb8 with SMTP id
 r14-20020a056000014e00b002bfdcdcafb8mr1032450wrx.64.1676884491518; 
 Mon, 20 Feb 2023 01:14:51 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 k22-20020a05600c0b5600b003e21ba8684dsm11808758wmr.26.2023.02.20.01.14.50
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 20 Feb 2023 01:14:51 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, John Snow <jsnow@redhat.com>, qemu-block@nongnu.org,
 qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Artyom Tarasenko <atar4qemu@gmail.com>
Subject: [PATCH v2 10/24] hw/ide: Un-inline ide_set_irq()
Date: Mon, 20 Feb 2023 10:13:44 +0100
Message-Id: <20230220091358.17038-11-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230220091358.17038-1-philmd@linaro.org>
References: <20230220091358.17038-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x431.google.com
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


