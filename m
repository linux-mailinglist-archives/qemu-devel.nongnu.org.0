Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 28389697AAD
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Feb 2023 12:27:44 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pSFwk-0008Lv-Jn; Wed, 15 Feb 2023 06:27:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pSFwi-0008Jh-43
 for qemu-devel@nongnu.org; Wed, 15 Feb 2023 06:27:32 -0500
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pSFwg-0003SW-Fk
 for qemu-devel@nongnu.org; Wed, 15 Feb 2023 06:27:31 -0500
Received: by mail-wr1-x42d.google.com with SMTP id m14so18767070wrg.13
 for <qemu-devel@nongnu.org>; Wed, 15 Feb 2023 03:27:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=pcrpa0k2mjPFukLVl7InavLwINVAMgzkQbQIjjMzSco=;
 b=kkYM04WefneLGecV8N0yC6T/4+FE+sx95nO+tVIfg5M3mv9i/uhehUV2aNPHWC7utr
 /uxkkuPORN2LClCbG19ADd/nSH4mGeTpPLG0p2eUQB3oG0WYYAYyHN+HfZ+KavUEzlyL
 aOypXRWPMA+8EPmGOa13ag8MHPEmq2hRwFNKgq1PZVeWCEfGzFgClK6U0cXSyD/wdYTJ
 kBjT+Rgaqajy4Fu6tN7U7ddA9ot6npnDEqI7zbBxZjV/A54vDE0h31//EEuPfx0owj8O
 O0+O4B7S4mg6TnK6s2Bc6udsEoDc440HIpSyrKsZPm/kftmAFYrTQ+K32TiiC8BwkE5b
 Pddg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=pcrpa0k2mjPFukLVl7InavLwINVAMgzkQbQIjjMzSco=;
 b=fYfqqypyucBknoQ3wIBhy6wNURdo/QznzJDt+vLhHldp3Ahkjn/L7IHrKT9cxrBOJP
 m88G9qhdVLZXaPRvuTFtM4OpvA7BioRnFeZRHA7Am6e1Qto6ArMQ7ih2l4MAW0HfhhzH
 GHalW/TjLjQ51i2u0WJNY5XwHXc0VETrKBQHQlU5nT0MrgZbE3T2m1bYEEGv6vSWGsoQ
 L716/yuQJRNVMwxHbm9Eykq7hAFg4uayvQp+4wQZti2HIweraVI/Oxy8dT7HInDIWK+i
 8d3J/sX/dNI7NuxZdh0Miax1DQfAcswcOyQ2Ry38ZLG9nfqFFNJHMSSCFYpTLwnmxVpW
 L82g==
X-Gm-Message-State: AO0yUKVf8daZuabwHLIiJjrftZYcczJqd2KJJ59OaWDc8QCQTJ7SnZOH
 BX8lC13DUzI10sovj0lK5EjRNtGqutw84XF2
X-Google-Smtp-Source: AK7set9Vylf0n8W2Iy9ybJ8wuWaRzy2ef3r2ryvboxVYCcIieQezbVB4oxLOpBSU/ie+CXsg0/NXrA==
X-Received: by 2002:adf:fec1:0:b0:2c5:6336:4bad with SMTP id
 q1-20020adffec1000000b002c563364badmr1214200wrs.15.1676460448740; 
 Wed, 15 Feb 2023 03:27:28 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 y16-20020adff6d0000000b002c55521903bsm8458306wrp.51.2023.02.15.03.27.27
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 15 Feb 2023 03:27:28 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, Eduardo Habkost <eduardo@habkost.net>,
 John Snow <jsnow@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Magnus Damm <magnus.damm@gmail.com>
Subject: [PATCH 03/20] hw/ide/mmio: Extract TYPE_MMIO_IDE declarations to
 'hw/ide/mmio.h'
Date: Wed, 15 Feb 2023 12:26:55 +0100
Message-Id: <20230215112712.23110-4-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230215112712.23110-1-philmd@linaro.org>
References: <20230215112712.23110-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42d.google.com
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

Extract mmio_ide_init_drives() and the TYPE_MMIO_IDE QOM
declarations to a new "hw/ide/mmio.h" header.

Document the SysBus interface.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/ide/mmio.c         |  5 +----
 hw/sh4/r2d.c          |  2 +-
 include/hw/ide.h      |  3 ---
 include/hw/ide/mmio.h | 26 ++++++++++++++++++++++++++
 4 files changed, 28 insertions(+), 8 deletions(-)
 create mode 100644 include/hw/ide/mmio.h

diff --git a/hw/ide/mmio.c b/hw/ide/mmio.c
index f1c6e1479b..5153d19ac6 100644
--- a/hw/ide/mmio.c
+++ b/hw/ide/mmio.c
@@ -29,9 +29,9 @@
 #include "qemu/module.h"
 #include "sysemu/dma.h"
 
+#include "hw/ide/mmio.h"
 #include "hw/ide/internal.h"
 #include "hw/qdev-properties.h"
-#include "qom/object.h"
 
 /***********************************************************/
 /* MMIO based ide port
@@ -39,9 +39,6 @@
  * dedicated ide controller, which is often seen on embedded boards.
  */
 
-#define TYPE_MMIO_IDE "mmio-ide"
-OBJECT_DECLARE_SIMPLE_TYPE(MMIOIDEState, MMIO_IDE)
-
 struct MMIOIDEState {
     /*< private >*/
     SysBusDevice parent_obj;
diff --git a/hw/sh4/r2d.c b/hw/sh4/r2d.c
index 39fc4f19d9..b96c6a939a 100644
--- a/hw/sh4/r2d.c
+++ b/hw/sh4/r2d.c
@@ -38,7 +38,7 @@
 #include "hw/qdev-properties.h"
 #include "net/net.h"
 #include "sh7750_regs.h"
-#include "hw/ide.h"
+#include "hw/ide/mmio.h"
 #include "hw/irq.h"
 #include "hw/loader.h"
 #include "hw/usb.h"
diff --git a/include/hw/ide.h b/include/hw/ide.h
index 60f1f4f714..5f8c36b2aa 100644
--- a/include/hw/ide.h
+++ b/include/hw/ide.h
@@ -8,9 +8,6 @@
 ISADevice *isa_ide_init(ISABus *bus, int iobase, int iobase2, int isairq,
                         DriveInfo *hd0, DriveInfo *hd1);
 
-/* ide-mmio.c */
-void mmio_ide_init_drives(DeviceState *dev, DriveInfo *hd0, DriveInfo *hd1);
-
 int ide_get_geometry(BusState *bus, int unit,
                      int16_t *cyls, int8_t *heads, int8_t *secs);
 int ide_get_bios_chs_trans(BusState *bus, int unit);
diff --git a/include/hw/ide/mmio.h b/include/hw/ide/mmio.h
new file mode 100644
index 0000000000..d726a49848
--- /dev/null
+++ b/include/hw/ide/mmio.h
@@ -0,0 +1,26 @@
+/*
+ * QEMU IDE Emulation: mmio support (for embedded).
+ *
+ * Copyright (c) 2003 Fabrice Bellard
+ * Copyright (c) 2006 Openedhand Ltd.
+ *
+ * SPDX-License-Identifier: MIT
+ */
+
+#ifndef HW_IDE_MMIO_H
+#define HW_IDE_MMIO_H
+
+#include "qom/object.h"
+
+/*
+ * QEMU interface:
+ *  + sysbus IRQ 0: asserted by the IDE channel
+ *  + sysbus MMIO region 0: data registers
+ *  + sysbus MMIO region 1: status & control registers
+ */
+#define TYPE_MMIO_IDE "mmio-ide"
+OBJECT_DECLARE_SIMPLE_TYPE(MMIOIDEState, MMIO_IDE)
+
+void mmio_ide_init_drives(DeviceState *dev, DriveInfo *hd0, DriveInfo *hd1);
+
+#endif
-- 
2.38.1


