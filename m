Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6140369CA44
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Feb 2023 12:52:26 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pU4hg-0001gh-MV; Mon, 20 Feb 2023 06:51:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pU4hd-0001fk-SH
 for qemu-devel@nongnu.org; Mon, 20 Feb 2023 06:51:29 -0500
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pU4hc-00055z-Aa
 for qemu-devel@nongnu.org; Mon, 20 Feb 2023 06:51:29 -0500
Received: by mail-wr1-x433.google.com with SMTP id 6so461987wrb.11
 for <qemu-devel@nongnu.org>; Mon, 20 Feb 2023 03:51:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=6NhaLGNCVQPhv/J8sWGZUAAWnfpTLonyUi96ru8QtrA=;
 b=AVPi6Wx60NvkshlJ17yAiwwDjq5+mjehWJFkHA+HyJ6PS9IgNocQMHNfphzPx+wA6L
 yT284zu9GpMltWIhe9fB3r4uD39QYXCmkNZ3EU61n3KsfxHhkuXCtaEq3VKkXWDwOEK3
 b93EeLDrKLSTCKIPzm5NCy8LJMNsPWCWd6vT+hZ0Nt19xW5P4cTYUWw1DJyAhAnDyhz3
 rjjDlb+7Zgqs0VAk2bom6HZv836OrxzEq0xQt8UmOr+zROPx1YhhUg9bmunSU35VMPRS
 G7FCOFCAXsIxbUOvN58uYqfLJYKmdBhc7RIt5jUVNQdlC3lzV10EDApXnRcsmYlOz2J1
 0IEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=6NhaLGNCVQPhv/J8sWGZUAAWnfpTLonyUi96ru8QtrA=;
 b=1S78xsBrVSG39JVDXi39pSnOitWigBjyvyxwinQ52sWiWORpRexdzMrqQwl3wDQI5U
 2Yj18N/C0Abiu0Bg/IfnaEvXEIGXSuvUuRLw1YNva0STFCwktssmj/q+UNgtad1bIB3B
 srfJ9jVXcB2dsYhFqeTG7Dw5dptEWtLWUIDou65tMG9n5toKf1ZP1rvbmEaFDknTQ9Zk
 jXGCyHhXhiYHfKJLNGqbxT7agkVuk55CoTQL26UPUu9J1xuoE1n7K8PLlgbpWkBiEn+s
 od0kCMZeU9J/QOfOrZzwUY/jPja2cg0HxGHyLcH+p0k9oRH4z5aMqKiAXMUO282lhERk
 9MJg==
X-Gm-Message-State: AO0yUKVILAjw1oJb19S/8knNKQMU/Gw0eVJE0DjWact2peMkM03x2vae
 +3r+HG28cM0MTKaUaLIyW88g57Bc6y0BK7Bo
X-Google-Smtp-Source: AK7set8gZo3/QIC8OzQNE6joWhrIzm62VWNRYBrAobvJ2GDDbZHWQNWf97p6BiC/efFr2x5phbZw8A==
X-Received: by 2002:a05:6000:18b:b0:2c5:4f35:1b2b with SMTP id
 p11-20020a056000018b00b002c54f351b2bmr639360wrx.28.1676893886786; 
 Mon, 20 Feb 2023 03:51:26 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 e28-20020a5d595c000000b002c54a2037d1sm2407842wri.75.2023.02.20.03.51.25
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 20 Feb 2023 03:51:26 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 Markus Armbruster <armbru@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Alistair Francis <alistair@alistair23.me>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 2/8] hw/char/pl011: Un-inline pl011_create()
Date: Mon, 20 Feb 2023 12:51:08 +0100
Message-Id: <20230220115114.25237-3-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230220115114.25237-1-philmd@linaro.org>
References: <20230220115114.25237-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x433.google.com
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

pl011_create() is only used in DeviceRealize handlers,
not a hot-path. Inlining is not justified.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/char/pl011.c         | 17 +++++++++++++++++
 include/hw/char/pl011.h | 19 +------------------
 2 files changed, 18 insertions(+), 18 deletions(-)

diff --git a/hw/char/pl011.c b/hw/char/pl011.c
index c15cb7af20..77bbc2a982 100644
--- a/hw/char/pl011.c
+++ b/hw/char/pl011.c
@@ -19,10 +19,12 @@
  */
 
 #include "qemu/osdep.h"
+#include "qapi/error.h"
 #include "hw/char/pl011.h"
 #include "hw/irq.h"
 #include "hw/sysbus.h"
 #include "hw/qdev-clock.h"
+#include "hw/qdev-properties.h"
 #include "hw/qdev-properties-system.h"
 #include "migration/vmstate.h"
 #include "chardev/char-fe.h"
@@ -31,6 +33,21 @@
 #include "qemu/module.h"
 #include "trace.h"
 
+DeviceState *pl011_create(hwaddr addr, qemu_irq irq, Chardev *chr)
+{
+    DeviceState *dev;
+    SysBusDevice *s;
+
+    dev = qdev_new("pl011");
+    s = SYS_BUS_DEVICE(dev);
+    qdev_prop_set_chr(dev, "chardev", chr);
+    sysbus_realize_and_unref(s, &error_fatal);
+    sysbus_mmio_map(s, 0, addr);
+    sysbus_connect_irq(s, 0, irq);
+
+    return dev;
+}
+
 #define PL011_INT_TX 0x20
 #define PL011_INT_RX 0x10
 
diff --git a/include/hw/char/pl011.h b/include/hw/char/pl011.h
index 926322e242..d82870c006 100644
--- a/include/hw/char/pl011.h
+++ b/include/hw/char/pl011.h
@@ -15,10 +15,8 @@
 #ifndef HW_PL011_H
 #define HW_PL011_H
 
-#include "hw/qdev-properties.h"
 #include "hw/sysbus.h"
 #include "chardev/char-fe.h"
-#include "qapi/error.h"
 #include "qom/object.h"
 
 #define TYPE_PL011 "pl011"
@@ -57,22 +55,7 @@ struct PL011State {
     const unsigned char *id;
 };
 
-static inline DeviceState *pl011_create(hwaddr addr,
-                                        qemu_irq irq,
-                                        Chardev *chr)
-{
-    DeviceState *dev;
-    SysBusDevice *s;
-
-    dev = qdev_new("pl011");
-    s = SYS_BUS_DEVICE(dev);
-    qdev_prop_set_chr(dev, "chardev", chr);
-    sysbus_realize_and_unref(s, &error_fatal);
-    sysbus_mmio_map(s, 0, addr);
-    sysbus_connect_irq(s, 0, irq);
-
-    return dev;
-}
+DeviceState *pl011_create(hwaddr addr, qemu_irq irq, Chardev *chr);
 
 static inline DeviceState *pl011_luminary_create(hwaddr addr,
                                                  qemu_irq irq,
-- 
2.38.1


