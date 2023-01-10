Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B00A663C9D
	for <lists+qemu-devel@lfdr.de>; Tue, 10 Jan 2023 10:18:46 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pF9wo-0005aG-2J; Tue, 10 Jan 2023 03:25:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pF9wl-0005ZI-Sh
 for qemu-devel@nongnu.org; Tue, 10 Jan 2023 03:25:27 -0500
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pF9wk-0004ax-AL
 for qemu-devel@nongnu.org; Tue, 10 Jan 2023 03:25:27 -0500
Received: by mail-wm1-x336.google.com with SMTP id
 c4-20020a1c3504000000b003d9e2f72093so6345862wma.1
 for <qemu-devel@nongnu.org>; Tue, 10 Jan 2023 00:25:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+jh8sIE6Y37qV3H2XxaUrJ6N81p/E5fXu9XJULweaMI=;
 b=bSp65BmrBaDbtUfu6yKRggSBppxWB9O8gYVA+fbtzSdbKzxWa5lyogoMgs65O5OQnP
 0paxOFBD60ZzF+dzjUPUuvAThO+QKfCYw5yUvvup1h1VVjgPnMaDOdNnKuWGN2AiIwY4
 vsIJb2YRA+1VcNdAl0PLeXlT36Wsn7Prl9xcxR998enlfhXOV91M9a26uMbJwumMof7k
 j2upF+ZM9T2KOwi0+iQWYoB1GjT77cjDQXBQ+kV80pu7PqghPpqkK5v35+lXmju0C9XU
 opsqp4UNuX9UXwn0WuFAJD1w4Z343GNFhoaGoRDZAwvZ6rlnEtVXOrz643AId7zI9nhy
 hE+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=+jh8sIE6Y37qV3H2XxaUrJ6N81p/E5fXu9XJULweaMI=;
 b=1pm5lwVruLrT7r8SeZG2XxfCfYSSwWRtodKSk7khWUsa7J+bmcMlBK2bDYKFD7SkkW
 x8NmI2RiobTiKo6DZTsRelrjV3UfiN19zQJYJRJDsNDRVj6uXyAcOnhyaCFPV30qp98a
 UqvAfXPVH+jeYLBiZkN2pCUT83MMIvTAI7LPtVZy1Ix70KlBSdXVvwUnRqO3NEgMeS3f
 O/+EVEd8OoXL+EeC9AwuZ1G9+JY5QAO8KCT2ZvLHAISdj8hXt293I4ikLyh+8BV+/6yY
 lB18yytu/3s28I6zsRM88RIahzYIw4WVnfjc99U6RdS3+xvfYQ4qZITYYs4J28d/Dx1f
 g/WA==
X-Gm-Message-State: AFqh2koBiFvLkj/i1fIJQ7ZUon9uQB3+6lj2MHyiLlgMH7yYdYF1BOUO
 1ENeWHn7A4jqgRPWahikO3r1NM24thauNBuI
X-Google-Smtp-Source: AMrXdXvZJ/5qT3POTEYBwWg4ZDUwZxS/n/hQMK0BI8WFDyusBqG9ZHyxGWOPtCg1DoOwNWyDwjQr7Q==
X-Received: by 2002:a05:600c:3507:b0:3d9:f8a1:710d with SMTP id
 h7-20020a05600c350700b003d9f8a1710dmr1031687wmq.6.1673339124708; 
 Tue, 10 Jan 2023 00:25:24 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 m17-20020a05600c3b1100b003cfbbd54178sm1222467wms.2.2023.01.10.00.25.23
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 10 Jan 2023 00:25:24 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [PATCH v2 3/5] hw/i2c/versatile_i2c: Replace TYPE_VERSATILE_I2C ->
 TYPE_ARM_SBCON_I2C
Date: Tue, 10 Jan 2023 09:25:06 +0100
Message-Id: <20230110082508.24038-4-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230110082508.24038-1-philmd@linaro.org>
References: <20230110082508.24038-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x336.google.com
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

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 hw/arm/realview.c              | 2 +-
 hw/arm/versatilepb.c           | 2 +-
 hw/arm/vexpress.c              | 2 +-
 hw/i2c/versatile_i2c.c         | 4 ++--
 include/hw/i2c/arm_sbcon_i2c.h | 3 +--
 5 files changed, 6 insertions(+), 7 deletions(-)

diff --git a/hw/arm/realview.c b/hw/arm/realview.c
index d2dc8a8952..a5aa2f046a 100644
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
index ecc1f6cf74..e4fff668e2 100644
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
index e1d1983ae6..391199d458 100644
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
index ee095762e5..b95c70608b 100644
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
diff --git a/include/hw/i2c/arm_sbcon_i2c.h b/include/hw/i2c/arm_sbcon_i2c.h
index 0101422d9d..da9b5e8f83 100644
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
-- 
2.38.1


