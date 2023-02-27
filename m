Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E172E6A43C6
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Feb 2023 15:08:53 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pWe57-00023u-Vh; Mon, 27 Feb 2023 09:02:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pWe4G-0000iC-7U
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 09:01:33 -0500
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pWe4E-0007WR-D8
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 09:01:27 -0500
Received: by mail-wr1-x42c.google.com with SMTP id r7so6330594wrz.6
 for <qemu-devel@nongnu.org>; Mon, 27 Feb 2023 06:01:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=jYGZU16lCx9TTfWKSjti8JTz2r03DCjlL5gG1/zGeXY=;
 b=R3h+lMfQ++CYNsE0UU2FacFfDQFkk6Rwy2Mvjm4/MsZ1OkaezdHPQeRfE0UXeQsxDv
 MXb6n4TSc6HtKm21fIASYdW9kiMHzNOuvz/fYE81wraOguwmWtqE/u7cun3QFbH+2Zi1
 x2b/GMMX/BwHDiamJSCZcKdJLB1sOUDKzgdl9LQCPADjST572yGkLgw+uKQwFzaN0DoN
 jEMhlj0r8UtlulQzLwgWBL0t09Zq6aK9TeuEoC66n2ViLvAvtOt7efW+oBPLoNcJLEi/
 RmzPyvuiIrWdnGYOGdoXFRV5JVpxYR8Mr4BPLPZPWrsbzgs7IH+GCwOkxKBP0/CppXJd
 VDZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=jYGZU16lCx9TTfWKSjti8JTz2r03DCjlL5gG1/zGeXY=;
 b=u2T3FbMkPmQJtZmlvo/+sZEHWCtmflnXyklymNxcKlQ1A7RMW/+52yrvGZS+J5mg1S
 OjcR9UzwzbX6KFJsyrrKqp18Ksyo0rv4Ju+Veh/Pbt2bIirOzEFAjriEr18tKMXK4Ytk
 HA0Wxhga1sRzKVaZKjtIWqhKZWEJY+9UT7NiMBRNQ0Y/wn8I2qrN79StrIJb3Iq2z/i5
 K5dcN2dd2SXHA1b5qAZObkjBytzrnsTB23S32rqfcKFNcuSnPwkd0gzuoRuBBYMncHUN
 s/TZYNgohBuEIX/jeyz2VfVC3ePP1mGa5w+Exr8nwbhnn8s7y+kuTP8MWOV4PjpdOYk+
 bRnw==
X-Gm-Message-State: AO0yUKWKLN9hZ/ewtmBIL5padcP0lRkNGoT6kKnraW7bndB3fvSFIEhb
 MWRvXnBfKFkyVbpXzdvA342YKLhtcLjaowBv
X-Google-Smtp-Source: AK7set81STUvXGSkFwZ5YKqvEw+c4ELrTeq2QoOOOoWwi0BAOMlaRi4GK5H1cLf4jmzEZZKxTaJV9A==
X-Received: by 2002:adf:f5cb:0:b0:2cc:be:be0 with SMTP id
 k11-20020adff5cb000000b002cc00be0be0mr1846159wrp.41.1677506484575; 
 Mon, 27 Feb 2023 06:01:24 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 s9-20020a5d4249000000b002c5598c14acsm7158514wrr.6.2023.02.27.06.01.23
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Feb 2023 06:01:23 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 14/25] hw/char/pl011: Un-inline pl011_create()
Date: Mon, 27 Feb 2023 14:00:51 +0000
Message-Id: <20230227140102.3712344-15-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230227140102.3712344-1-peter.maydell@linaro.org>
References: <20230227140102.3712344-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42c.google.com
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

From: Philippe Mathieu-Daudé <philmd@linaro.org>

pl011_create() is only used in DeviceRealize handlers,
not a hot-path. Inlining is not justified.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20230220115114.25237-3-philmd@linaro.org
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 include/hw/char/pl011.h | 19 +------------------
 hw/char/pl011.c         | 17 +++++++++++++++++
 2 files changed, 18 insertions(+), 18 deletions(-)

diff --git a/include/hw/char/pl011.h b/include/hw/char/pl011.h
index 926322e242d..d82870c0069 100644
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
diff --git a/hw/char/pl011.c b/hw/char/pl011.c
index c15cb7af20b..77bbc2a982b 100644
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
 
-- 
2.34.1


