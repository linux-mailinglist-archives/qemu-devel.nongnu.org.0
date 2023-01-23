Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B2FE677CBC
	for <lists+qemu-devel@lfdr.de>; Mon, 23 Jan 2023 14:41:09 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pJwzy-00068t-Mz; Mon, 23 Jan 2023 08:36:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pJwzY-0005wn-Pr
 for qemu-devel@nongnu.org; Mon, 23 Jan 2023 08:36:14 -0500
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pJwzV-0002Lw-PS
 for qemu-devel@nongnu.org; Mon, 23 Jan 2023 08:36:08 -0500
Received: by mail-wm1-x32d.google.com with SMTP id
 fl11-20020a05600c0b8b00b003daf72fc844so10640101wmb.0
 for <qemu-devel@nongnu.org>; Mon, 23 Jan 2023 05:36:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=n+Z4F18ikzEKW2fIzsVDR9UWsk1P14NLzyqF4zsWzHQ=;
 b=NPIqZLfbly6385rX4/2lS2XUPTbfK14VYXP8U5W1AmUYcVz2LESbFRTdx+1rpFgY+H
 Ca8F18FXYGckAqlhBMCvlvGWDjb1TM5wxmsVxd25JG8JjYB+Ej9Zj7bUVMEEsOI67IER
 UX2+AlOHRSOpsVKSfWgEZnJ1hZ+KC+O9D4h5+saIUZCa2jf51wgMygoPdlVJmPseI/ji
 Jn0psp3rPxA+A+EfeMDyXIB7/tk1ii1LyLV9Klu+ECLG9IjIgk9H3R1Wm5tcBUit7rjW
 n2d1kiFpKln8ejrevM/I2PPxT0DnBYVDWilakQhHmpdYhzEx3+KmxqU6DuKNn08gPBDX
 hi4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=n+Z4F18ikzEKW2fIzsVDR9UWsk1P14NLzyqF4zsWzHQ=;
 b=tKAAtCH2voJisjyIe6rxgQKmOq7nPIQIKWMYW/7hrh5jx0yn/SkiatFvi/s1LM14Fz
 KZYu1oru6D5C1HqpC1yV5eZtpXWWVe5uPSkpEPvD87RZvx4wOI2BhOipyoBJrkZ/E8lZ
 lBqXczlRJ/B2gPN3vrvDGRrTu4XNQWwRZJyQ6HH9eK9Geydj5cFrWHI4Z1EsKFhfCaPg
 HhKwLGwa+vpC4vFU9x0YajsOpmrAp3q+wMsn7MinaqG/SDAMgkYutVxbW4B1RBWwn8hh
 QSYUDXNgKjI91gLZ+7cGlU1FyeP0JpqUd5AOyNfNl4SB9z9aybxOtt2RwkOM/+5V/9Yj
 wLTg==
X-Gm-Message-State: AFqh2kqDWhn03o8kS+gKMD8bw7odU4wplli0+nJLte4+/2fnCXuGjvAy
 JNUdzq7Wg+MW1W2WBlgXzxeUkTNws49gApVq
X-Google-Smtp-Source: AMrXdXttYYZLJ2mcCenKPRlW/h/VDOjutHdljVU30dr402M8JaX4wog4ShKZ71DG6Oe4DTXUS+MvLw==
X-Received: by 2002:a05:600c:1695:b0:3da:f502:83b5 with SMTP id
 k21-20020a05600c169500b003daf50283b5mr24278448wmn.2.1674480964856; 
 Mon, 23 Jan 2023 05:36:04 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 d19-20020a05600c34d300b003a6125562e1sm10817457wmq.46.2023.01.23.05.36.04
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Jan 2023 05:36:04 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 10/26] hw/i2c/versatile_i2c: Replace TYPE_VERSATILE_I2C ->
 TYPE_ARM_SBCON_I2C
Date: Mon, 23 Jan 2023 13:35:37 +0000
Message-Id: <20230123133553.2171158-11-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230123133553.2171158-1-peter.maydell@linaro.org>
References: <20230123133553.2171158-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32d.google.com
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

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20230110082508.24038-4-philmd@linaro.org
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 include/hw/i2c/arm_sbcon_i2c.h | 3 +--
 hw/arm/realview.c              | 2 +-
 hw/arm/versatilepb.c           | 2 +-
 hw/arm/vexpress.c              | 2 +-
 hw/i2c/versatile_i2c.c         | 4 ++--
 5 files changed, 6 insertions(+), 7 deletions(-)

diff --git a/include/hw/i2c/arm_sbcon_i2c.h b/include/hw/i2c/arm_sbcon_i2c.h
index 0101422d9dc..da9b5e8f83b 100644
--- a/include/hw/i2c/arm_sbcon_i2c.h
+++ b/include/hw/i2c/arm_sbcon_i2c.h
@@ -17,8 +17,7 @@
 #include "hw/i2c/bitbang_i2c.h"
 #include "qom/object.h"
 
-#define TYPE_VERSATILE_I2C "versatile_i2c"
-#define TYPE_ARM_SBCON_I2C TYPE_VERSATILE_I2C
+#define TYPE_ARM_SBCON_I2C "versatile_i2c"
 
 typedef struct ArmSbconI2CState ArmSbconI2CState;
 DECLARE_INSTANCE_CHECKER(ArmSbconI2CState, ARM_SBCON_I2C, TYPE_ARM_SBCON_I2C)
diff --git a/hw/arm/realview.c b/hw/arm/realview.c
index d2dc8a89525..a5aa2f046ae 100644
--- a/hw/arm/realview.c
+++ b/hw/arm/realview.c
@@ -309,7 +309,7 @@ static void realview_init(MachineState *machine,
         }
     }
 
-    dev = sysbus_create_simple(TYPE_VERSATILE_I2C, 0x10002000, NULL);
+    dev = sysbus_create_simple(TYPE_ARM_SBCON_I2C, 0x10002000, NULL);
     i2c = (I2CBus *)qdev_get_child_bus(dev, "i2c");
     i2c_slave_create_simple(i2c, "ds1338", 0x68);
 
diff --git a/hw/arm/versatilepb.c b/hw/arm/versatilepb.c
index 43172d72ea4..05b9462a5b7 100644
--- a/hw/arm/versatilepb.c
+++ b/hw/arm/versatilepb.c
@@ -336,7 +336,7 @@ static void versatile_init(MachineState *machine, int board_id)
     /* Add PL031 Real Time Clock. */
     sysbus_create_simple("pl031", 0x101e8000, pic[10]);
 
-    dev = sysbus_create_simple(TYPE_VERSATILE_I2C, 0x10002000, NULL);
+    dev = sysbus_create_simple(TYPE_ARM_SBCON_I2C, 0x10002000, NULL);
     i2c = (I2CBus *)qdev_get_child_bus(dev, "i2c");
     i2c_slave_create_simple(i2c, "ds1338", 0x68);
 
diff --git a/hw/arm/vexpress.c b/hw/arm/vexpress.c
index 757236767b0..34b012b528b 100644
--- a/hw/arm/vexpress.c
+++ b/hw/arm/vexpress.c
@@ -646,7 +646,7 @@ static void vexpress_common_init(MachineState *machine)
     sysbus_create_simple("sp804", map[VE_TIMER01], pic[2]);
     sysbus_create_simple("sp804", map[VE_TIMER23], pic[3]);
 
-    dev = sysbus_create_simple(TYPE_VERSATILE_I2C, map[VE_SERIALDVI], NULL);
+    dev = sysbus_create_simple(TYPE_ARM_SBCON_I2C, map[VE_SERIALDVI], NULL);
     i2c = (I2CBus *)qdev_get_child_bus(dev, "i2c");
     i2c_slave_create_simple(i2c, "sii9022", 0x39);
 
diff --git a/hw/i2c/versatile_i2c.c b/hw/i2c/versatile_i2c.c
index ee095762e57..b95c70608b2 100644
--- a/hw/i2c/versatile_i2c.c
+++ b/hw/i2c/versatile_i2c.c
@@ -31,7 +31,7 @@
 
 typedef ArmSbconI2CState VersatileI2CState;
 DECLARE_INSTANCE_CHECKER(ArmSbconI2CState, VERSATILE_I2C,
-                         TYPE_VERSATILE_I2C)
+                         TYPE_ARM_SBCON_I2C)
 
 
 
@@ -98,7 +98,7 @@ static void versatile_i2c_init(Object *obj)
 }
 
 static const TypeInfo versatile_i2c_info = {
-    .name          = TYPE_VERSATILE_I2C,
+    .name          = TYPE_ARM_SBCON_I2C,
     .parent        = TYPE_SYS_BUS_DEVICE,
     .instance_size = sizeof(ArmSbconI2CState),
     .instance_init = versatile_i2c_init,
-- 
2.34.1


