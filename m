Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CF3E69C7A0
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Feb 2023 10:25:25 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pU2Fc-0005g5-Be; Mon, 20 Feb 2023 04:14:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pU2FX-0005ab-QR
 for qemu-devel@nongnu.org; Mon, 20 Feb 2023 04:14:20 -0500
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pU2FV-0003ly-8l
 for qemu-devel@nongnu.org; Mon, 20 Feb 2023 04:14:19 -0500
Received: by mail-wr1-x42c.google.com with SMTP id t13so254682wrv.13
 for <qemu-devel@nongnu.org>; Mon, 20 Feb 2023 01:14:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=qK71KEeZ1dXO+J7OSOV435FopVrvh5A+el2kM0w8yiE=;
 b=E4kzdFZElZdBHc1j5MrlE89N7qaa4yexo/AxhYkWB593YndVBY+dsR0H0jYdvViQOA
 SROuqjlQY/pHYRp7d954cKLIl7KF/qBOvzSWb5cvo2De2gUcFDt4c9aRLaUp4ZozpNkP
 KZaStCdzw2+9LqrQuuH8fOk6AlTsk1PH+/8h2Z3Aom6PA2oJQkxnN/rhqThOe46jMce8
 pqxEAp/6ruXfFnL01b21RBvMTfKwYS7IFdFrxBBWaflDKgf/oO8Ifj6uoMJK/+0FT0Ui
 5OgRWucFcEzSolEtoyszDecoq90jAJIbVAllf77SWPvMRYUY4q2Dr881f0BZYaZ7yuZk
 weIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=qK71KEeZ1dXO+J7OSOV435FopVrvh5A+el2kM0w8yiE=;
 b=llgDR1QoL3hcHNWoK27TOMuRRJVXeTP86L9MK6mI7olJflPNvnh4PqpPh1x/UpDUfH
 O9W3zPqtjEDPeb9SDbZ93NuzCsyyumoJNz1GMI7Va9v3mjnJWkQwuzwArUvBjXq4cd5q
 S4ZdWSWoADLL3p/ygOCiMKSpDoV0wYayOotjhAQyyAZGrwpp9g/ELH/HEVAOJtJFvkwX
 rPiN7X3S9jHY4014OpjjDYoG/SpsFXISb2GiCXfomUZplJmddgbDGi+7ENSrmlivTTH/
 S2Trfbnau3dn+/LgK+kYG6tSWce3efcr/lQn0i2WUyPWiAf7L0/YQCmP9tw3EtOKGcdw
 goVA==
X-Gm-Message-State: AO0yUKUnWNTgLU2CQXlzGZpqavFYuwxK5OWT1E+Cf96GUm1TpH8T4EEI
 hTJlkFF9ttOPam5UbkX3PlbRB7NDSC/W4f8J
X-Google-Smtp-Source: AK7set/tmrcSRyxp53OiIqFH0gWMA28qGaCvciLvxUnS99dokxSCCh1iO4+PJzJsj9i/PwZeHlrNMA==
X-Received: by 2002:a5d:4e49:0:b0:2c3:e4f5:18c with SMTP id
 r9-20020a5d4e49000000b002c3e4f5018cmr302337wrt.30.1676884455709; 
 Mon, 20 Feb 2023 01:14:15 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 b11-20020adfe30b000000b002c573a6216fsm11911601wrj.37.2023.02.20.01.14.14
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 20 Feb 2023 01:14:15 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, John Snow <jsnow@redhat.com>, qemu-block@nongnu.org,
 qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Magnus Damm <magnus.damm@gmail.com>
Subject: [PATCH v2 03/24] hw/ide/mmio: Extract TYPE_MMIO_IDE declarations to
 'hw/ide/mmio.h'
Date: Mon, 20 Feb 2023 10:13:37 +0100
Message-Id: <20230220091358.17038-4-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230220091358.17038-1-philmd@linaro.org>
References: <20230220091358.17038-1-philmd@linaro.org>
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

Message-Id: <20230215112712.23110-4-philmd@linaro.org>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/ide/mmio.c         |  5 +----
 hw/sh4/r2d.c          |  4 ++--
 include/hw/ide.h      |  3 ---
 include/hw/ide/mmio.h | 26 ++++++++++++++++++++++++++
 4 files changed, 29 insertions(+), 9 deletions(-)
 create mode 100644 include/hw/ide/mmio.h

diff --git a/hw/ide/mmio.c b/hw/ide/mmio.c
index c33d42437f..8b2ba604c5 100644
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
-OBJECT_DECLARE_SIMPLE_TYPE(MmioIdeState, MMIO_IDE)
-
 struct MmioIdeState {
     /*< private >*/
     SysBusDevice parent_obj;
diff --git a/hw/sh4/r2d.c b/hw/sh4/r2d.c
index 39fc4f19d9..7aaa11b748 100644
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
@@ -283,7 +283,7 @@ static void r2d_init(MachineState *machine)
 
     /* onboard CF (True IDE mode, Master only). */
     dinfo = drive_get(IF_IDE, 0, 0);
-    dev = qdev_new("mmio-ide");
+    dev = qdev_new(TYPE_MMIO_IDE);
     busdev = SYS_BUS_DEVICE(dev);
     sysbus_connect_irq(busdev, 0, irq[CF_IDE]);
     qdev_prop_set_uint32(dev, "shift", 1);
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
index 0000000000..fccfd17c79
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
+OBJECT_DECLARE_SIMPLE_TYPE(MmioIdeState, MMIO_IDE)
+
+void mmio_ide_init_drives(DeviceState *dev, DriveInfo *hd0, DriveInfo *hd1);
+
+#endif
-- 
2.38.1


