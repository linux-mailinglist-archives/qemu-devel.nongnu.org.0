Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A4A7C4DEA84
	for <lists+qemu-devel@lfdr.de>; Sat, 19 Mar 2022 20:58:55 +0100 (CET)
Received: from localhost ([::1]:48168 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nVfDy-0005HE-PZ
	for lists+qemu-devel@lfdr.de; Sat, 19 Mar 2022 15:58:54 -0400
Received: from eggs.gnu.org ([209.51.188.92]:52754)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zongyuan.li@smartx.com>)
 id 1nVeoB-0005Gs-9B
 for qemu-devel@nongnu.org; Sat, 19 Mar 2022 15:32:15 -0400
Received: from [2607:f8b0:4864:20::1041] (port=43584
 helo=mail-pj1-x1041.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <zongyuan.li@smartx.com>)
 id 1nVeo9-0005mk-Ha
 for qemu-devel@nongnu.org; Sat, 19 Mar 2022 15:32:15 -0400
Received: by mail-pj1-x1041.google.com with SMTP id
 n7-20020a17090aab8700b001c6aa871860so5080337pjq.2
 for <qemu-devel@nongnu.org>; Sat, 19 Mar 2022 12:32:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smartx-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=xYruDH4XH6J3bLFAbCk4mpmbwrtXd5m2IkLEV5S3ETI=;
 b=bNRknetJm+PCrYYb8FSBRJskWZqyeH/OrbOdkM5x0elM3mzGlnKquXPCuqY70chP/o
 nXvntv4h2pUW3XOSoinExTCyIxwGaoNEJ39s+29OTUGkogX/HXtbsdu0rCmmtXtKRw1a
 9jjdWzN0dxTW1M2N3PhkXvbKR8i9n/W7MXiTZhJDT8ALdDEjHGOFVpOZhhuSMwP6QJ/q
 eOr3Ih61VNgp5qY/DkwN4pddC86hpjHmZSdX8+iIZ48cjwRT12/mjdJ5VLM90ODo4Hdi
 amoMeN+KI4l1mpKsFu/5Te+VoxYq9+A7TxRggdZxguWnkj1uyruf2JEYLNhGbId4AFGV
 Osng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=xYruDH4XH6J3bLFAbCk4mpmbwrtXd5m2IkLEV5S3ETI=;
 b=UCBOCXa3HkzNshR/xBWBpgH89OBs1z8JuSjnfr/+EpSZujWoGXUUIza5OeS+sLR6Yp
 uc+sxj90frKeskQcjLJ6g3HjWTNl62KB9g9rHtPSVorE2JZiBQbj0F5ryhzcTe+tkbLK
 Um6Yr74nfkKR4vzpZIHQ/HnitEtfYEefcC38X2GU6Grj8J6qRlsgbq82N3/+05Cchger
 ED5aITwhu5QQP7ErxNmLYT1fGfmb+e6eGhUzTdSjOXgk+dfR+s4/8tWsAufp5xEM+xJ5
 uI3aJd8rSKHkjBLxu9IHQ8cH/4flkZNiXD37COb+GG1RYAdD+MYj9auI5fQMqYULBm0Y
 l7Ww==
X-Gm-Message-State: AOAM5337hm8nf8zGobFO+VvOY0xQlLeM/VpBtFR77K7JNTLm+vS0iEuO
 jjkqZBrhsNzpmkrzunzjBXRzt6i1V8/e1S9G
X-Google-Smtp-Source: ABdhPJz5bYc9rQADNMT2pP1Ywcpn5+WJ2XejpDvC7KErXo5ET/o0C0F0STx/DSo5+4Et/6N86D9b6w==
X-Received: by 2002:a17:90b:3b50:b0:1c2:5a5c:8cc3 with SMTP id
 ot16-20020a17090b3b5000b001c25a5c8cc3mr28399983pjb.42.1647718332201; 
 Sat, 19 Mar 2022 12:32:12 -0700 (PDT)
Received: from dev.lizongyuan.local (61-221-155-10.hinet-ip.hinet.net.
 [61.221.155.10]) by smtp.gmail.com with ESMTPSA id
 u17-20020a056a00159100b004f763ac761fsm14406865pfk.33.2022.03.19.12.32.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 19 Mar 2022 12:32:11 -0700 (PDT)
From: Zongyuan Li <zongyuan.li@smartx.com>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH v1 1/1] hw/arm/realview: replace 'qemu_split_irq' with
 'TYPE_SPLIT_IRQ'
Date: Sun, 20 Mar 2022 03:32:14 +0800
Message-Id: <20220319193214.56553-2-zongyuan.li@smartx.com>
X-Mailer: git-send-email 2.34.0
In-Reply-To: <20220319193214.56553-1-zongyuan.li@smartx.com>
References: <20220319193214.56553-1-zongyuan.li@smartx.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::1041
 (failed)
Received-SPF: none client-ip=2607:f8b0:4864:20::1041;
 envelope-from=zongyuan.li@smartx.com; helo=mail-pj1-x1041.google.com
X-Spam_score_int: -4
X-Spam_score: -0.5
X-Spam_bar: /
X-Spam_report: (-0.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001, SPF_NONE=0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Sat, 19 Mar 2022 15:56:40 -0400
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 "open list:Real View" <qemu-arm@nongnu.org>,
 Zongyuan Li <zongyuan.li@smartx.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Zongyuan Li <zongyuan.li@smartx.com>
Resolves: https://gitlab.com/qemu-project/qemu/-/issues/811
---
 hw/arm/realview.c | 52 +++++++++++++++++++++++++++++++++++++++--------
 1 file changed, 44 insertions(+), 8 deletions(-)

diff --git a/hw/arm/realview.c b/hw/arm/realview.c
index 7b424e94a5..741ed5c2c7 100644
--- a/hw/arm/realview.c
+++ b/hw/arm/realview.c
@@ -7,16 +7,19 @@
  * This code is licensed under the GPL.
  */
 
+#include "hw/qdev-core.h"
 #include "qemu/osdep.h"
 #include "qapi/error.h"
 #include "cpu.h"
 #include "hw/sysbus.h"
 #include "hw/arm/boot.h"
 #include "hw/arm/primecell.h"
+#include "hw/core/split-irq.h"
 #include "hw/net/lan9118.h"
 #include "hw/net/smc91c111.h"
 #include "hw/pci/pci.h"
 #include "net/net.h"
+#include "qom/object.h"
 #include "sysemu/sysemu.h"
 #include "hw/boards.h"
 #include "hw/i2c/i2c.h"
@@ -27,6 +30,7 @@
 #include "hw/irq.h"
 #include "hw/i2c/arm_sbcon_i2c.h"
 #include "hw/sd/sd.h"
+#include <stdarg.h>
 
 #define SMP_BOOT_ADDR 0xe0000000
 #define SMP_BOOTREG_ADDR 0x10000030
@@ -53,6 +57,30 @@ static const int realview_board_id[] = {
     0x76d
 };
 
+static bool split_to_irq_varargs(Object *obj, int nums_of_output, ...) {
+    int i;
+    va_list va;
+    qemu_irq output;
+    Object *src_irq= object_new(TYPE_SPLIT_IRQ);
+
+    if (!object_property_set_int(src_irq, "num-lines", nums_of_output, &error_fatal)) {
+        return false;
+    }
+
+    if (!qdev_realize(DEVICE(src_irq), NULL, &error_fatal)) {
+        return false;
+    }
+
+    va_start(va, nums_of_output);
+    for (i = 0; i < nums_of_output; i++) {
+        output = va_arg(va, qemu_irq);
+        qdev_connect_gpio_out(DEVICE(src_irq), i, output);
+    }
+	va_end(va);
+
+    return true;
+}
+
 static void realview_init(MachineState *machine,
                           enum realview_board_type board_type)
 {
@@ -67,6 +95,8 @@ static void realview_init(MachineState *machine,
     SysBusDevice *busdev;
     qemu_irq pic[64];
     qemu_irq mmc_irq[2];
+    Object *mmc_irq_for_ro = object_new(TYPE_SPLIT_IRQ);
+    Object *mmc_irq_for_cardin = object_new(TYPE_SPLIT_IRQ);
     PCIBus *pci_bus = NULL;
     NICInfo *nd;
     DriveInfo *dinfo;
@@ -229,14 +259,20 @@ static void realview_init(MachineState *machine,
      * and the PL061 has them the other way about. Also the card
      * detect line is inverted.
      */
-    mmc_irq[0] = qemu_irq_split(
-        qdev_get_gpio_in(sysctl, ARM_SYSCTL_GPIO_MMC_WPROT),
-        qdev_get_gpio_in(gpio2, 1));
-    mmc_irq[1] = qemu_irq_split(
-        qdev_get_gpio_in(sysctl, ARM_SYSCTL_GPIO_MMC_CARDIN),
-        qemu_irq_invert(qdev_get_gpio_in(gpio2, 0)));
-    qdev_connect_gpio_out_named(dev, "card-read-only", 0, mmc_irq[0]);
-    qdev_connect_gpio_out_named(dev, "card-inserted", 0, mmc_irq[1]);
+    if (!split_to_irq_varargs(mmc_irq_for_ro, 2,
+                              qdev_get_gpio_in(sysctl, ARM_SYSCTL_GPIO_MMC_WPROT),
+                              qdev_get_gpio_in(gpio2, 1))) {
+        return;
+    }
+    qdev_connect_gpio_out_named(dev, "card-read-only", 0, DEVICE(mmc_irq_for_ro));
+
+    if (!split_to_irq_varargs(mmc_irq_for_cardin, 2,
+                              qdev_get_gpio_in(sysctl, ARM_SYSCTL_GPIO_MMC_CARDIN),
+                              qemu_irq_invert(qdev_get_gpio_in(gpio2, 0)))) {
+        return;
+    }
+    qdev_connect_gpio_out_named(dev, "card-inserted", 0, DEVICE(mmc_irq_for_cardin));
+
     dinfo = drive_get(IF_SD, 0, 0);
     if (dinfo) {
         DeviceState *card;
-- 
2.34.0


