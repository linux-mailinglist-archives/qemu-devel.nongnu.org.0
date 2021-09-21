Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C3774130CE
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Sep 2021 11:40:27 +0200 (CEST)
Received: from localhost ([::1]:41642 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mScGI-0000DA-7H
	for lists+qemu-devel@lfdr.de; Tue, 21 Sep 2021 05:40:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52634)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kevin.townsend@linaro.org>)
 id 1mSc8v-0003lf-M0
 for qemu-devel@nongnu.org; Tue, 21 Sep 2021 05:32:49 -0400
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c]:36549)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <kevin.townsend@linaro.org>)
 id 1mSc8s-0003oo-O1
 for qemu-devel@nongnu.org; Tue, 21 Sep 2021 05:32:49 -0400
Received: by mail-wr1-x42c.google.com with SMTP id g16so37202071wrb.3
 for <qemu-devel@nongnu.org>; Tue, 21 Sep 2021 02:32:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=eSgTpPSe/PNIygUTbkxM4xsGNYV4mD+g8Dr8KGorX0w=;
 b=ytdoUnAMAwlmG4vc8EWDfMw5MMGM7XeQq15DEnQxr5SPPgpFCgaeYK0AvVLArc/dq2
 iSHwLqouQgYJz2i5E9PSH4UjU/cwlgBt4npargg6YOHXQLd90TUP3W70ZAs6JSYjWl09
 2phxM0WNhBBdm3WnFO5HjsIrlUDQbVk7PxZAYduosz1h1bp8bIP2IY6pWX/Ue4UBrWPl
 E/oN3XcD5wn1Tlqh1rbMqlRXlmZNJZBa6q0/7STYaWTSQWIymbdT8vpt3YeGzRMLmMrU
 wFiwM92olfGk95O/b6XMz3RW7TApob4rvoegz5k6gNfS1bCoDXp5Z3RfRcA958NP++s7
 iABA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=eSgTpPSe/PNIygUTbkxM4xsGNYV4mD+g8Dr8KGorX0w=;
 b=vEd40sTSt+rIQmsdoy+ziP1R3/PclJ30BSwfEA1Wb3PHilhU6VPGKvzjJGqqFebTkH
 ZcqXlT65kaoMo+Gi+my0XksA4CxqwP9LgsGGYKkUksRk69+ZYXo2BeJqP0Yjv2eN3XNh
 qKqcTwgBVtf5k1elRy4YvAsZCTRRzM/HKc1TtbbBMj8kc/4jHY1daUK4S/2nL+LccUft
 dhzq7kJGnzvz/1F6ihiaUIlUish96BT+sj5+wFEzpbIXsteZ06h/At4aBkH9QfPLN/OX
 tUJkqX/UvIxnWSGECVSMIQMd8bswOG7tmJmxbL0Cu9byeRznt5hLwbWq5+OfgQLxGWT6
 YIIw==
X-Gm-Message-State: AOAM530S4vG+rfoYCejXnTrxvhp4qhL8wgOXvnaJMWRZqYT7adHh5qF6
 0YD2KIXi3wA9gL0v+6jTg3CGsTZmr7BqGQ==
X-Google-Smtp-Source: ABdhPJyLC63EXVcFS8MbSqsFTdW/wvd4S7d5K4jIk019ZnJMcCMyWhrzmjKwyWwHXh9pQ+LgUFQk9w==
X-Received: by 2002:a1c:2785:: with SMTP id n127mr3342792wmn.155.1632216764847; 
 Tue, 21 Sep 2021 02:32:44 -0700 (PDT)
Received: from Kevins-MBP-2.lan (89.141.149.152.dyn.user.ono.com.
 [89.141.149.152])
 by smtp.gmail.com with ESMTPSA id w5sm18721099wra.87.2021.09.21.02.32.43
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 21 Sep 2021 02:32:44 -0700 (PDT)
From: Kevin Townsend <kevin.townsend@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3] hw/sensor: Add lsm303dlhc magnetometer device
Date: Tue, 21 Sep 2021 11:32:27 +0200
Message-Id: <20210921093227.18592-1-kevin.townsend@linaro.org>
X-Mailer: git-send-email 2.30.1 (Apple Git-130)
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=kevin.townsend@linaro.org; helo=mail-wr1-x42c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Kevin Townsend <kevin.townsend@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This commit adds emulation of the magnetometer on the LSM303DLHC.
It allows the magnetometer's X, Y and Z outputs to be set via the
mag-x, mag-y and mag-z properties, as well as the 12-bit
temperature output via the temperature property.

Signed-off-by: Kevin Townsend <kevin.townsend@linaro.org>
---
 hw/sensor/Kconfig          |   4 +
 hw/sensor/lsm303dlhc_mag.c | 754 +++++++++++++++++++++++++++++++++++++
 hw/sensor/meson.build      |   1 +
 3 files changed, 759 insertions(+)
 create mode 100644 hw/sensor/lsm303dlhc_mag.c

diff --git a/hw/sensor/Kconfig b/hw/sensor/Kconfig
index a2b55a4fdb..1684e9bb3d 100644
--- a/hw/sensor/Kconfig
+++ b/hw/sensor/Kconfig
@@ -17,3 +17,7 @@ config ADM1272
 config MAX34451
     bool
     depends on I2C
+
+config LSM303DLHC_MAG
+    bool
+    depends on I2C
diff --git a/hw/sensor/lsm303dlhc_mag.c b/hw/sensor/lsm303dlhc_mag.c
new file mode 100644
index 0000000000..4e3846b24a
--- /dev/null
+++ b/hw/sensor/lsm303dlhc_mag.c
@@ -0,0 +1,754 @@
+/*
+ * LSM303DLHC I2C magnetometer.
+ *
+ * Copyright (C) 2021 Linaro Ltd.
+ * Written by Kevin Townsend <kevin.townsend@linaro.org>
+ *
+ * Based on: https://www.st.com/resource/en/datasheet/lsm303dlhc.pdf
+ * 
+ * SPDX-License-Identifier: GPL-2.0-or-later
+ */
+
+/*
+ * The I2C address associated with this device is set on the command-line when
+ * initialising the machine, but the following address is standard: 0x1E.
+ * 
+ * Get and set functions for 'mag-x', 'mag-y' and 'mag-z' assume that
+ * 1 = 0.001 uT. (NOTE the 1 gauss = 100 uT, so setting a value of 100,000
+ * would be equal to 1 gauss or 100 uT.)
+ * 
+ * Get and set functions for 'temperature' assume that 1 = 0.001 C, so 23.6 C
+ * would be equal to 23600.
+ */
+
+#include "qemu/osdep.h"
+#include "hw/i2c/i2c.h"
+#include "migration/vmstate.h"
+#include "qapi/error.h"
+#include "qapi/visitor.h"
+#include "qemu/module.h"
+#include "qemu/log.h"
+#include "qemu/bswap.h"
+
+enum LSM303DLHCMagReg {
+    LSM303DLHC_MAG_REG_CRA          = 0x00,
+    LSM303DLHC_MAG_REG_CRB          = 0x01,
+    LSM303DLHC_MAG_REG_MR           = 0x02,
+    LSM303DLHC_MAG_REG_OUT_X_H      = 0x03,
+    LSM303DLHC_MAG_REG_OUT_X_L      = 0x04,
+    LSM303DLHC_MAG_REG_OUT_Z_H      = 0x05,
+    LSM303DLHC_MAG_REG_OUT_Z_L      = 0x06,
+    LSM303DLHC_MAG_REG_OUT_Y_H      = 0x07,
+    LSM303DLHC_MAG_REG_OUT_Y_L      = 0x08,
+    LSM303DLHC_MAG_REG_SR           = 0x09,
+    LSM303DLHC_MAG_REG_IRA          = 0x0A,
+    LSM303DLHC_MAG_REG_IRB          = 0x0B,
+    LSM303DLHC_MAG_REG_IRC          = 0x0C,
+    LSM303DLHC_MAG_REG_TEMP_OUT_H   = 0x31,
+    LSM303DLHC_MAG_REG_TEMP_OUT_L   = 0x32
+};
+
+typedef struct LSM303DLHCMagState {
+    I2CSlave parent_obj;
+    uint8_t cra;
+    uint8_t crb;
+    uint8_t mr;
+    int16_t x;
+    int16_t z;
+    int16_t y;
+    uint8_t sr;
+    uint8_t ira;
+    uint8_t irb;
+    uint8_t irc;
+    int16_t temperature;
+    uint8_t len;
+    uint8_t buf[6];
+    uint8_t pointer;
+} LSM303DLHCMagState;
+
+#define TYPE_LSM303DLHC_MAG "lsm303dlhc_mag"
+OBJECT_DECLARE_SIMPLE_TYPE(LSM303DLHCMagState, LSM303DLHC_MAG)
+
+static void lsm303dlhc_mag_get_x(Object *obj, Visitor *v, const char *name,
+                                 void *opaque, Error **errp)
+{
+    LSM303DLHCMagState *s = LSM303DLHC_MAG(obj);
+    int64_t value = s->x;
+
+    /* Convert to uT where 1000 = 1 uT. Conversion factor depends on gain. */
+    value *= 1000000;
+    switch (s->crb >> 5) {
+        case 1:
+            /* 11 lsb per uT. */
+            value /= 11000;
+            break;
+        case 2:
+            /* 8.55 lsb per uT. */
+            value /= 8550;
+            break;
+        case 3:
+            /* 6.70 lsb per uT. */
+            value /= 6700;
+            break;
+        case 4:
+            /* 4.50 lsb per uT. */
+            value /= 4500;
+            break;
+        case 5:
+            /* 4.00 lsb per uT. */
+            value /= 4000;
+            break;
+        case 6:
+            /* 3.30 lsb per uT. */
+            value /= 3300;
+            break;
+        case 7:
+            /* 2.30 lsb per uT. */
+            value /= 2300;
+            break;
+        default:
+            break;
+    }
+
+    visit_type_int(v, name, &value, errp);
+}
+
+static void lsm303dlhc_mag_get_y(Object *obj, Visitor *v, const char *name,
+                                 void *opaque, Error **errp)
+{
+    LSM303DLHCMagState *s = LSM303DLHC_MAG(obj);
+    int64_t value = s->y;
+
+    /* Convert to uT where 1000 = 1 uT. Conversion factor depends on gain. */
+    value *= 1000000;
+    switch (s->crb >> 5) {
+        case 1:
+            /* 11 lsb per uT. */
+            value /= 11000;
+            break;
+        case 2:
+            /* 8.55 lsb per uT. */
+            value /= 8550;
+            break;
+        case 3:
+            /* 6.70 lsb per uT. */
+            value /= 6700;
+            break;
+        case 4:
+            /* 4.50 lsb per uT. */
+            value /= 4500;
+            break;
+        case 5:
+            /* 4.00 lsb per uT. */
+            value /= 4000;
+            break;
+        case 6:
+            /* 3.30 lsb per uT. */
+            value /= 3300;
+            break;
+        case 7:
+            /* 2.30 lsb per uT. */
+            value /= 2300;
+            break;
+        default:
+            break;
+    }
+
+    visit_type_int(v, name, &value, errp);
+}
+
+static void lsm303dlhc_mag_get_z(Object *obj, Visitor *v, const char *name,
+                                 void *opaque, Error **errp)
+{
+    LSM303DLHCMagState *s = LSM303DLHC_MAG(obj);
+    int64_t value = s->z;
+
+    /* Convert to uT where 1000 = 1 uT. Conversion factor depends on gain. */
+    value *= 1000000;
+    switch (s->crb >> 5) {
+        case 1:
+            /* 9.8 lsb per uT. */
+            value /= 9800;
+            break;
+        case 2:
+            /* 7.6 lsb per uT. */
+            value /= 7600;
+            break;
+        case 3:
+            /* 6.0 lsb per uT. */
+            value /= 6000;
+            break;
+        case 4:
+            /* 4.0 lsb per uT. */
+            value /= 4000;
+            break;
+        case 5:
+            /* 3.55 lsb per uT. */
+            value /= 3550;
+            break;
+        case 6:
+            /* 2.95 lsb per uT. */
+            value /= 2950;
+            break;
+        case 7:
+            /* 2.05 lsb per uT. */
+            value /= 2050;
+            break;
+        default:
+            break;
+    }
+
+    visit_type_int(v, name, &value, errp);
+}
+
+static void lsm303dlhc_mag_set_x(Object *obj, Visitor *v, const char *name,
+                                 void *opaque, Error **errp)
+{
+    LSM303DLHCMagState *s = LSM303DLHC_MAG(obj);
+    int64_t value;
+    int64_t reg;
+
+    if (!visit_type_int(v, name, &value, errp)) {
+        return;
+    }
+
+    /* Avoid divide by zero errors on valid zero value. */
+    if (value == 0) {
+        s->x = 0;
+        return;
+    }
+
+    /* Convert input from uT, accounting for current gain settings. */
+    switch (s->crb >> 5) {
+        case 1:
+            /* 11 lsb per uT = 0.0909090909 uT per lsb. */
+            reg = value * 1000 / 90909;
+            break;
+        case 2:
+            /* 8.55 lsb per uT = 0.1169590643 uT per lsb. */
+            reg = value * 1000 / 116959;
+            break;
+        case 3:
+            /* 6.7 lsb per uT = 0.1492537313 uT per lsb. */
+            reg = value * 1000 / 149253;
+            break;
+        case 4:
+            /* 4.5 lsb per uT = 0.2222222222 uT per lsb */
+            reg = value * 1000 / 222222;
+            break;
+        case 5:
+            /* 4.0 lsb per uT = 0.25 uT per lsb. */
+            reg = value * 1000 / 250000;
+            break;
+        case 6:
+            /* 3.3 lsb per uT = 0.303030303 uT per lsb */
+            reg = value * 1000 / 303030;
+            break;
+        case 7:
+            /* 2.3 lsb per uT = 0.4347826087 uT per lsb */
+            reg = value * 1000 / 434782;
+            break;
+        default:
+            error_setg(errp, "invalid gain in crb: 0x%02X", s->crb);
+            return;
+    }
+
+    /* Make sure we are within a 12-bit limit. */
+    if (reg > 2047 || reg < -2048) {
+        error_setg(errp, "value %lld out of register's range", value);
+        return;
+    }
+
+    s->x = (int16_t)reg;
+}
+
+static void lsm303dlhc_mag_set_y(Object *obj, Visitor *v, const char *name,
+                                 void *opaque, Error **errp)
+{
+    LSM303DLHCMagState *s = LSM303DLHC_MAG(obj);
+    int64_t value;
+    int64_t reg;
+
+    if (!visit_type_int(v, name, &value, errp)) {
+        return;
+    }
+
+    /* Avoid divide by zero errors on valid zero value. */
+    if (value == 0) {
+        s->y = 0;
+        return;
+    }
+
+    /* Convert input to Gauss, accounting for current gain settings. */
+    switch (s->crb >> 5) {
+        case 1:
+            /* 11 lsb per uT = 0.0909090909 uT per lsb. */
+            reg = value * 1000 / 90909;
+            break;
+        case 2:
+            /* 8.55 lsb per uT = 0.1169590643 uT per lsb. */
+            reg = value * 1000 / 116959;
+            break;
+        case 3:
+            /* 6.7 lsb per uT = 0.1492537313 uT per lsb. */
+            reg = value * 1000 / 149253;
+            break;
+        case 4:
+            /* 4.5 lsb per uT = 0.2222222222 uT per lsb */
+            reg = value * 1000 / 222222;
+            break;
+        case 5:
+            /* 4.0 lsb per uT = 0.25 uT per lsb. */
+            reg = value * 1000 / 250000;
+            break;
+        case 6:
+            /* 3.3 lsb per uT = 0.303030303 uT per lsb */
+            reg = value * 1000 / 303030;
+            break;
+        case 7:
+            /* 2.3 lsb per uT = 0.4347826087 uT per lsb */
+            reg = value * 1000 / 434782;
+            break;
+        default:
+            error_setg(errp, "invalid gain in crb: 0x%02X", s->crb);
+            return;
+    }
+
+    /* Make sure we are within a 12-bit limit. */
+    if (reg > 2047 || reg < -2048) {
+        error_setg(errp, "value %lld out of register's range", value);
+        return;
+    }
+
+    s->y = (int16_t)reg;
+}
+static void lsm303dlhc_mag_set_z(Object *obj, Visitor *v, const char *name,
+                                 void *opaque, Error **errp)
+{
+    LSM303DLHCMagState *s = LSM303DLHC_MAG(obj);
+    int64_t value;
+    int64_t reg;
+
+    if (!visit_type_int(v, name, &value, errp)) {
+        return;
+    }
+
+    /* Avoid divide by zero errors on valid zero value. */
+    if (value == 0) {
+        s->z = 0;
+        return;
+    }
+
+    /* Convert input to Gauss, accounting for current gain settings. */
+    switch (s->crb >> 5) {
+        case 1:
+            /* 9.8 lsb per uT = 0.1020408163 uT per lsb. */
+            reg = value * 1000 / 102040;
+            break;
+        case 2:
+            /* 7.6 lsb per uT = 0.1315789474 uT per lsb. */
+            reg = value * 1000 / 131578;
+            break;
+        case 3:
+            /* 6.0 lsb per uT = 0.1666666667 uT per lsb. */
+            reg = value * 1000 / 166666;
+            break;
+        case 4:
+            /* 4.0 lsb per uT = 0.25 uT per lsb */
+            reg = value * 1000 / 250000;
+            break;
+        case 5:
+            /* 3.55 lsb per uT = 0.2816901408 uT per lsb. */
+            reg = value * 1000 / 281690;
+            break;
+        case 6:
+            /* 2.95 lsb per uT = 0.3389830508 uT per lsb */
+            reg = value * 1000 / 338983;
+            break;
+        case 7:
+            /* 2.05 lsb per uT = 0.487804878 uT per lsb */
+            reg = value * 1000 / 487804;
+            break;
+        default:
+            error_setg(errp, "invalid gain in crb: 0x%02X", s->crb);
+            return;
+    }
+
+    /* Make sure we are within a 12-bit limit. */
+    if (reg > 2047 || reg < -2048) {
+        error_setg(errp, "value %lld out of register's range", value);
+        return;
+    }
+
+    s->z = (int16_t)reg;
+}
+
+/*
+ * Get handler for the temperature property.
+ */
+static void lsm303dlhc_mag_get_temperature(Object *obj, Visitor *v,
+                                           const char *name, void *opaque,
+                                           Error **errp)
+{
+    LSM303DLHCMagState *s = LSM303DLHC_MAG(obj);
+    int64_t value;
+
+    /* Convert to 1 lsb = 0.125 C to 1 = 0.001 C for 'temperature' property. */
+    value = s->temperature * 125;
+
+    visit_type_int(v, name, &value, errp);
+}
+
+/*
+ * Set handler for the temperature property.
+ */
+static void lsm303dlhc_mag_set_temperature(Object *obj, Visitor *v,
+                                           const char *name, void *opaque,
+                                           Error **errp)
+{
+    LSM303DLHCMagState *s = LSM303DLHC_MAG(obj);
+    int64_t value;
+
+    if (!visit_type_int(v, name, &value, errp)) {
+        return;
+    }
+
+    /* Input temperature is in 0.001 C units. Convert to 1 lsb = 0.125 C. */
+    value /= 125;
+
+    if (value > 2047 || value < -2048) {
+        error_setg(errp, "value %lld lsb is out of range", value);
+        return;
+    }
+
+    s->temperature = (int16_t)value;
+}
+
+/*
+ * Callback handler whenever a 'I2C_START_RECV' (read) event is received.
+ */
+static void lsm303dlhc_mag_read(LSM303DLHCMagState *s)
+{
+    s->len = 0;
+
+    /*
+     * The address pointer on the LSM303DLHC auto-increments whenever a byte
+     * is read, without the master device having to request the next address.
+     *
+     * The auto-increment process has the following logic:
+     *
+     *   - if (s->pointer == 8) then s->pointer = 3
+     *   - else: if (s->pointer >= 12) then s->pointer = 0
+     *   - else: s->pointer += 1
+     *
+     * Reading an invalid address return 0.
+     *
+     * The auto-increment logic is only taken into account in this driver
+     * for the LSM303DLHC_MAG_REG_OUT_* and LSM303DLHC_MAG_REG_TEMP_OUT_*
+     * registers, which are the two common uses cases for it. Accessing either
+     * of these register sets will also populate the rest of the related
+     * dataset.
+     */
+
+    switch (s->pointer) {
+    case LSM303DLHC_MAG_REG_CRA:
+        s->buf[s->len++] = s->cra;
+        break;
+    case LSM303DLHC_MAG_REG_CRB:
+        s->buf[s->len++] = s->crb;
+        break;
+    case LSM303DLHC_MAG_REG_MR:
+        s->buf[s->len++] = s->mr;
+        break;
+    case LSM303DLHC_MAG_REG_OUT_X_H:
+        stw_be_p(s->buf, s->x);
+        s->len += sizeof(s->x);
+        stw_be_p(s->buf + 2, s->z);
+        s->len += sizeof(s->z);
+        stw_be_p(s->buf + 4, s->y);
+        s->len += sizeof(s->y);
+        break;
+    case LSM303DLHC_MAG_REG_OUT_X_L:
+        s->buf[s->len++] = (uint8_t)(s->x);
+        stw_be_p(s->buf + 1, s->z);
+        s->len += sizeof(s->z);
+        stw_be_p(s->buf + 3, s->y);
+        s->len += sizeof(s->y);
+        s->buf[s->len++] = (uint8_t)(s->x >> 8);
+        break;
+    case LSM303DLHC_MAG_REG_OUT_Z_H:
+        stw_be_p(s->buf, s->z);
+        s->len += sizeof(s->z);
+        stw_be_p(s->buf + 2, s->y);
+        s->len += sizeof(s->y);
+        stw_be_p(s->buf + 4, s->x);
+        s->len += sizeof(s->x);
+        break;
+    case LSM303DLHC_MAG_REG_OUT_Z_L:
+        s->buf[s->len++] = (uint8_t)(s->z);
+        stw_be_p(s->buf + 1, s->y);
+        s->len += sizeof(s->y);
+        stw_be_p(s->buf + 3, s->x);
+        s->len += sizeof(s->x);
+        s->buf[s->len++] = (uint8_t)(s->z >> 8);
+        break;
+    case LSM303DLHC_MAG_REG_OUT_Y_H:
+        stw_be_p(s->buf, s->y);
+        s->len += sizeof(s->y);
+        stw_be_p(s->buf + 2, s->x);
+        s->len += sizeof(s->x);
+        stw_be_p(s->buf + 4, s->z);
+        s->len += sizeof(s->z);
+        break;
+    case LSM303DLHC_MAG_REG_OUT_Y_L:
+        s->buf[s->len++] = (uint8_t)(s->y);
+        stw_be_p(s->buf + 1, s->x);
+        s->len += sizeof(s->x);
+        stw_be_p(s->buf + 3, s->z);
+        s->len += sizeof(s->z);
+        s->buf[s->len++] = (uint8_t)(s->y >> 8);
+        break;
+    case LSM303DLHC_MAG_REG_SR:
+        s->buf[s->len++] = s->sr;
+        break;
+    case LSM303DLHC_MAG_REG_IRA:
+        s->buf[s->len++] = s->ira;
+        break;
+    case LSM303DLHC_MAG_REG_IRB:
+        s->buf[s->len++] = s->irb;
+        break;
+    case LSM303DLHC_MAG_REG_IRC:
+        s->buf[s->len++] = s->irc;
+        break;
+    case LSM303DLHC_MAG_REG_TEMP_OUT_H:
+        /* Check if the temperature sensor is enabled or not (CRA & 0x80). */
+        if (s->cra & 0x80) {
+            s->buf[s->len++] = (uint8_t)(s->temperature >> 8);
+            s->buf[s->len++] = (uint8_t)(s->temperature & 0xf0);
+        } else {
+            s->buf[s->len++] = 0;
+            s->buf[s->len++] = 0;
+        }
+        break;
+    case LSM303DLHC_MAG_REG_TEMP_OUT_L:
+        if (s->cra & 0x80) {
+            s->buf[s->len++] = (uint8_t)(s->temperature & 0xf0);
+        } else {
+            s->buf[s->len++] = 0;
+        }
+        break;
+    default:
+        s->buf[s->len++] = 0;
+        break;
+    }
+}
+
+/*
+ * Callback handler when a device attempts to write to a register.
+ */
+static void lsm303dlhc_mag_write(LSM303DLHCMagState *s)
+{
+    switch (s->pointer) {
+    case LSM303DLHC_MAG_REG_CRA:
+        s->cra = s->buf[0];
+        break;
+    case LSM303DLHC_MAG_REG_CRB:
+        /* Make sure gain is at least 1, falling back to 1 on an error. */
+        if (s->buf[0] >> 5 == 0) {
+            s->buf[0] = 1 << 5;
+        }
+        s->crb = s->buf[0];
+        break;
+    case LSM303DLHC_MAG_REG_MR:
+        s->mr = s->buf[0];
+        break;
+    case LSM303DLHC_MAG_REG_SR:
+        s->sr = s->buf[0];
+        break;
+    case LSM303DLHC_MAG_REG_IRA:
+        s->ira = s->buf[0];
+        break;
+    case LSM303DLHC_MAG_REG_IRB:
+        s->irb = s->buf[0];
+        break;
+    case LSM303DLHC_MAG_REG_IRC:
+        s->irc = s->buf[0];
+        break;
+    default:
+        qemu_log_mask(LOG_GUEST_ERROR, "reg is read-only: 0x%02X", s->buf[0]);
+        break;
+    }
+}
+
+/*
+ * Low-level slave-to-master transaction handler.
+ */
+static uint8_t lsm303dlhc_mag_recv(I2CSlave *i2c)
+{
+    LSM303DLHCMagState *s = LSM303DLHC_MAG(i2c);
+
+    if (s->len < 6) {
+        return s->buf[s->len++];
+    } else {
+        return 0xff;
+    }
+}
+
+/*
+ * Low-level master-to-slave transaction handler.
+ */
+static int lsm303dlhc_mag_send(I2CSlave *i2c, uint8_t data)
+{
+    LSM303DLHCMagState *s = LSM303DLHC_MAG(i2c);
+
+    if (s->len == 0) {
+        /* First byte is the reg pointer */
+        s->pointer = data;
+        s->len++;
+    } else if (s->len == 1) {
+        /* Second byte is the new register value. */
+        s->buf[0] = data;
+        lsm303dlhc_mag_write(s);
+    } else {
+        g_assert_not_reached();
+    }
+
+    return 0;
+}
+
+/*
+ * Bus state change handler.
+ */
+static int lsm303dlhc_mag_event(I2CSlave *i2c, enum i2c_event event)
+{
+    LSM303DLHCMagState *s = LSM303DLHC_MAG(i2c);
+
+    switch (event) {
+    case I2C_START_SEND:
+        break;
+    case I2C_START_RECV:
+        lsm303dlhc_mag_read(s);
+        break;
+    case I2C_FINISH:
+        break;
+    case I2C_NACK:
+        break;
+    }
+
+    s->len = 0;
+    return 0;
+}
+
+/*
+ * Device data description using VMSTATE macros.
+ */
+static const VMStateDescription vmstate_lsm303dlhc_mag = {
+    .name = "LSM303DLHC_MAG",
+    .version_id = 0,
+    .minimum_version_id = 0,
+    .fields = (VMStateField[]) {
+
+        VMSTATE_I2C_SLAVE(parent_obj, LSM303DLHCMagState),
+        VMSTATE_UINT8(len, LSM303DLHCMagState),
+        VMSTATE_UINT8_ARRAY(buf, LSM303DLHCMagState, 6),
+        VMSTATE_UINT8(pointer, LSM303DLHCMagState),
+        VMSTATE_UINT8(cra, LSM303DLHCMagState),
+        VMSTATE_UINT8(crb, LSM303DLHCMagState),
+        VMSTATE_UINT8(mr, LSM303DLHCMagState),
+        VMSTATE_INT16(x, LSM303DLHCMagState),
+        VMSTATE_INT16(z, LSM303DLHCMagState),
+        VMSTATE_INT16(y, LSM303DLHCMagState),
+        VMSTATE_UINT8(sr, LSM303DLHCMagState),
+        VMSTATE_UINT8(ira, LSM303DLHCMagState),
+        VMSTATE_UINT8(irb, LSM303DLHCMagState),
+        VMSTATE_UINT8(irc, LSM303DLHCMagState),
+        VMSTATE_INT16(temperature, LSM303DLHCMagState),
+        VMSTATE_END_OF_LIST()
+    }
+};
+
+/*
+ * Put the device into post-reset default state.
+ */
+static void lsm303dlhc_mag_default_cfg(LSM303DLHCMagState *s)
+{
+    /* Set the device into is default reset state. */
+    s->len = 0;
+    s->pointer = 0;         /* Current register. */
+    memset(s->buf, 0, sizeof(s->buf));
+    s->cra = 0x10;          /* Temp Enabled = 0, Data Rate = 15.0 Hz. */
+    s->crb = 0x20;          /* Gain = +/- 1.3 Gauss. */
+    s->mr = 0x3;            /* Operating Mode = Sleep. */
+    s->x = 0;
+    s->z = 0;
+    s->y = 0;
+    s->sr = 0x1;            /* DRDY = 1. */
+    s->ira = 0x48;
+    s->irb = 0x34;
+    s->irc = 0x33;
+    s->temperature = 0;     /* Default to 0 degrees C (0/8 lsb = 0 C). */
+}
+
+/*
+ * Callback handler when DeviceState 'reset' is set to true.
+ */
+static void lsm303dlhc_mag_reset(DeviceState *dev)
+{
+    I2CSlave *i2c = I2C_SLAVE(dev);
+    LSM303DLHCMagState *s = LSM303DLHC_MAG(i2c);
+
+    /* Set the device into its default reset state. */
+    lsm303dlhc_mag_default_cfg(s);
+}
+
+/*
+ * Initialisation of any public properties.
+ */
+static void lsm303dlhc_mag_initfn(Object *obj)
+{
+    object_property_add(obj, "mag-x", "int",
+                lsm303dlhc_mag_get_x,
+                lsm303dlhc_mag_set_x, NULL, NULL);
+
+    object_property_add(obj, "mag-y", "int",
+                lsm303dlhc_mag_get_y,
+                lsm303dlhc_mag_set_y, NULL, NULL);
+
+    object_property_add(obj, "mag-z", "int",
+                lsm303dlhc_mag_get_z,
+                lsm303dlhc_mag_set_z, NULL, NULL);
+
+    object_property_add(obj, "temperature", "int",
+                lsm303dlhc_mag_get_temperature,
+                lsm303dlhc_mag_set_temperature, NULL, NULL);
+}
+
+/*
+ * Set the virtual method pointers (bus state change, tx/rx, etc.).
+ */
+static void lsm303dlhc_mag_class_init(ObjectClass *klass, void *data)
+{
+    DeviceClass *dc = DEVICE_CLASS(klass);
+    I2CSlaveClass *k = I2C_SLAVE_CLASS(klass);
+
+    dc->reset = lsm303dlhc_mag_reset;
+    dc->vmsd = &vmstate_lsm303dlhc_mag;
+    k->event = lsm303dlhc_mag_event;
+    k->recv = lsm303dlhc_mag_recv;
+    k->send = lsm303dlhc_mag_send;
+}
+
+static const TypeInfo lsm303dlhc_mag_info = {
+    .name = TYPE_LSM303DLHC_MAG,
+    .parent = TYPE_I2C_SLAVE,
+    .instance_size = sizeof(LSM303DLHCMagState),
+    .instance_init = lsm303dlhc_mag_initfn,
+    .class_init = lsm303dlhc_mag_class_init,
+};
+
+static void lsm303dlhc_mag_register_types(void)
+{
+    type_register_static(&lsm303dlhc_mag_info);
+}
+
+type_init(lsm303dlhc_mag_register_types)
diff --git a/hw/sensor/meson.build b/hw/sensor/meson.build
index 034e3e0207..95406abd24 100644
--- a/hw/sensor/meson.build
+++ b/hw/sensor/meson.build
@@ -3,3 +3,4 @@ softmmu_ss.add(when: 'CONFIG_TMP421', if_true: files('tmp421.c'))
 softmmu_ss.add(when: 'CONFIG_EMC141X', if_true: files('emc141x.c'))
 softmmu_ss.add(when: 'CONFIG_ADM1272', if_true: files('adm1272.c'))
 softmmu_ss.add(when: 'CONFIG_MAX34451', if_true: files('max34451.c'))
+softmmu_ss.add(when: 'CONFIG_LSM303DLHC_MAG', if_true: files('lsm303dlhc_mag.c'))
-- 
2.30.1 (Apple Git-130)


