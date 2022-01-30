Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B63C34A357A
	for <lists+qemu-devel@lfdr.de>; Sun, 30 Jan 2022 10:52:55 +0100 (CET)
Received: from localhost ([::1]:56350 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nE6tC-0001ns-Bh
	for lists+qemu-devel@lfdr.de; Sun, 30 Jan 2022 04:52:54 -0500
Received: from eggs.gnu.org ([209.51.188.92]:53248)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kevin.townsend@linaro.org>)
 id 1nE6rP-00013r-Lm
 for qemu-devel@nongnu.org; Sun, 30 Jan 2022 04:51:03 -0500
Received: from [2a00:1450:4864:20::42f] (port=47074
 helo=mail-wr1-x42f.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <kevin.townsend@linaro.org>)
 id 1nE6rK-0007Gt-GB
 for qemu-devel@nongnu.org; Sun, 30 Jan 2022 04:51:02 -0500
Received: by mail-wr1-x42f.google.com with SMTP id l25so19560983wrb.13
 for <qemu-devel@nongnu.org>; Sun, 30 Jan 2022 01:50:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=OQHgWFihWiq2r545oD3nkJXj8BtzMzn++pq9KgHAYe0=;
 b=aF/LSm9e8b3g7SDvw6RW16zTYWOVR9PsfzGpo/viE6MfZyc12lZ7bg42X7P3l9tolq
 sV+wDCj1vwHqqUVcb0SvfmCFPaIGZeNdypQcs/Spf22LC4gcfsEYpKSgXc9OPdQtREc9
 f3DtYT3UjWNq7KRf+Dk/IecEX3E/iVyICxPgNjbNNTSSsrDNJ0aqYl6CmjNvco25AxiP
 fLnCZgpn5DUMJVyHyn8TJFt5mQJj0dwR2MC682uEhyRVbC+GR+vD7awrAGTrjNijpP6H
 o7jBaRJcghESFqdqRi3sMwMCWbB3IlR6TL9N29S5RpJKvGXZ9Wui04wpB2IKScyvTVK+
 pcQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=OQHgWFihWiq2r545oD3nkJXj8BtzMzn++pq9KgHAYe0=;
 b=PjkJMqGz6WrttQgi76gqw7g0kXtXE9sq5bLj/qGLKkZKeYgtNYwI7EF1T1R1jeZep5
 5d6+ZinWwHbfPo50+uezt72E1eKUmZEzWBCAOamY9q4B/Cm4VJ/Ees9+h1k/rzLxqIGa
 DVOyLyiLw6VBm0y/ykepeQCs8Bw2pl5Ie15nlaBfLmbwwLGHgHFSBR1EgB8Dt5TUajyw
 mKftTHX667xy2gjwzBDRLMgc4ldjRMJiswzUmQhORkFwrdHzK/9XALuZjpxN/Ay05nIg
 +9+M7teKwmllfHRkmIrN91sKNH2NjYkdgrwJYjmwoUtukHiR9VAJoSiOZoorg4UYEvYO
 pl7g==
X-Gm-Message-State: AOAM533nmscmJ6G4ymtOFD4gFKnrsO70QNExKvIoXr+YOXCARgbNpBvP
 n7TWI3XfJNGMFL2bodb5+Nn7/wvG9orCBKWC
X-Google-Smtp-Source: ABdhPJz1c7RcpmD+/3TImT7Z38t/wTILjiqfueQ6ef92ICza7bS9gfZ7vRbY+GSG+9tRDsFhjHpO3w==
X-Received: by 2002:a05:6000:1b8a:: with SMTP id
 r10mr13388798wru.665.1643536254343; 
 Sun, 30 Jan 2022 01:50:54 -0800 (PST)
Received: from Kevins-MBP-2021.lan (62.83.105.172.dyn.user.ono.com.
 [62.83.105.172])
 by smtp.googlemail.com with ESMTPSA id y15sm13006017wry.36.2022.01.30.01.50.53
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Sun, 30 Jan 2022 01:50:53 -0800 (PST)
From: Kevin Townsend <kevin.townsend@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4] hw/sensor: Add lsm303dlhc magnetometer device
Date: Sun, 30 Jan 2022 10:50:32 +0100
Message-Id: <20220130095032.35392-1-kevin.townsend@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::42f
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=kevin.townsend@linaro.org; helo=mail-wr1-x42f.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Kevin Townsend <kevin.townsend@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This commit adds emulation of the magnetometer on the LSM303DLHC.
It allows the magnetometer's X, Y and Z outputs to be set via the
mag-x, mag-y and mag-z properties, as well as the 12-bit
temperature output via the temperature property. Sensor can be
enabled with 'CONFIG_LSM303DLHC_MAG=y'.

Signed-off-by: Kevin Townsend <kevin.townsend@linaro.org>
---
 hw/sensor/Kconfig                 |   4 +
 hw/sensor/lsm303dlhc_mag.c        | 556 ++++++++++++++++++++++++++++++
 hw/sensor/meson.build             |   1 +
 tests/qtest/lsm303dlhc-mag-test.c | 148 ++++++++
 tests/qtest/meson.build           |   1 +
 5 files changed, 710 insertions(+)
 create mode 100644 hw/sensor/lsm303dlhc_mag.c
 create mode 100644 tests/qtest/lsm303dlhc-mag-test.c

diff --git a/hw/sensor/Kconfig b/hw/sensor/Kconfig
index 9c8a049b06..b317f91b7b 100644
--- a/hw/sensor/Kconfig
+++ b/hw/sensor/Kconfig
@@ -21,3 +21,7 @@ config ADM1272
 config MAX34451
     bool
     depends on I2C
+
+config LSM303DLHC_MAG
+    bool
+    depends on I2C
diff --git a/hw/sensor/lsm303dlhc_mag.c b/hw/sensor/lsm303dlhc_mag.c
new file mode 100644
index 0000000000..4c98ddbf20
--- /dev/null
+++ b/hw/sensor/lsm303dlhc_mag.c
@@ -0,0 +1,556 @@
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
+    int16_t x_lock;
+    int16_t z_lock;
+    int16_t y_lock;
+    uint8_t sr;
+    uint8_t ira;
+    uint8_t irb;
+    uint8_t irc;
+    int16_t temperature;
+    int16_t temperature_lock;
+    uint8_t len;
+    uint8_t buf;
+    uint8_t pointer;
+} LSM303DLHCMagState;
+
+#define TYPE_LSM303DLHC_MAG "lsm303dlhc_mag"
+OBJECT_DECLARE_SIMPLE_TYPE(LSM303DLHCMagState, LSM303DLHC_MAG)
+
+/*
+ * Conversion factor from Gauss to sensor values for each GN gain setting,
+ * in units "lsb per Gauss" (see data sheet table 3). There is no documented
+ * behaviour if the GN setting in CRB is incorrectly set to 0b000;
+ * we arbitrarily make it the same as 0b001.
+ */
+uint32_t xy_gain[] = { 1100, 1100, 855, 670, 450, 400, 330, 230 };
+uint32_t z_gain[] = { 980, 980, 760, 600, 400, 355, 295, 205 };
+
+static void lsm303dlhc_mag_get_x(Object *obj, Visitor *v, const char *name,
+                                 void *opaque, Error **errp)
+{
+    LSM303DLHCMagState *s = LSM303DLHC_MAG(obj);
+    int gm = extract32(s->crb, 5, 3);
+
+    /* Convert to uT where 1000 = 1 uT. Conversion factor depends on gain. */
+    int64_t value = muldiv64(s->x, 100000, xy_gain[gm]);
+    visit_type_int(v, name, &value, errp);
+}
+
+static void lsm303dlhc_mag_get_y(Object *obj, Visitor *v, const char *name,
+                                 void *opaque, Error **errp)
+{
+    LSM303DLHCMagState *s = LSM303DLHC_MAG(obj);
+    int gm = extract32(s->crb, 5, 3);
+
+    /* Convert to uT where 1000 = 1 uT. Conversion factor depends on gain. */
+    int64_t value = muldiv64(s->y, 100000, xy_gain[gm]);
+    visit_type_int(v, name, &value, errp);
+}
+
+static void lsm303dlhc_mag_get_z(Object *obj, Visitor *v, const char *name,
+                                 void *opaque, Error **errp)
+{
+    LSM303DLHCMagState *s = LSM303DLHC_MAG(obj);
+    int gm = extract32(s->crb, 5, 3);
+
+    /* Convert to uT where 1000 = 1 uT. Conversion factor depends on gain. */
+    int64_t value = muldiv64(s->z, 100000, z_gain[gm]);
+    visit_type_int(v, name, &value, errp);
+}
+
+static void lsm303dlhc_mag_set_x(Object *obj, Visitor *v, const char *name,
+                                 void *opaque, Error **errp)
+{
+    LSM303DLHCMagState *s = LSM303DLHC_MAG(obj);
+    int64_t value;
+    int64_t reg;
+    int gm = extract32(s->crb, 5, 3);
+
+    if (!visit_type_int(v, name, &value, errp)) {
+        return;
+    }
+
+    reg = muldiv64(value, xy_gain[gm], 100000);
+
+    /* Make sure we are within a 12-bit limit. */
+    if (reg > 2047 || reg < -2048) {
+        error_setg(errp, "value %" PRId64 " out of register's range", value);
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
+    int gm = extract32(s->crb, 5, 3);
+
+    if (!visit_type_int(v, name, &value, errp)) {
+        return;
+    }
+
+    reg = muldiv64(value, xy_gain[gm], 100000);
+
+    /* Make sure we are within a 12-bit limit. */
+    if (reg > 2047 || reg < -2048) {
+        error_setg(errp, "value %" PRId64 " out of register's range", value);
+        return;
+    }
+
+    s->y = (int16_t)reg;
+}
+
+static void lsm303dlhc_mag_set_z(Object *obj, Visitor *v, const char *name,
+                                 void *opaque, Error **errp)
+{
+    LSM303DLHCMagState *s = LSM303DLHC_MAG(obj);
+    int64_t value;
+    int64_t reg;
+    int gm = extract32(s->crb, 5, 3);
+
+    if (!visit_type_int(v, name, &value, errp)) {
+        return;
+    }
+
+    reg = muldiv64(value, z_gain[gm], 100000);
+
+    /* Make sure we are within a 12-bit limit. */
+    if (reg > 2047 || reg < -2048) {
+        error_setg(errp, "value %" PRId64 " out of register's range", value);
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
+        error_setg(errp, "value %" PRId64 " lsb is out of range", value);
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
+    /*
+     * Set the LOCK bit whenever a new read attempt is made. This will be
+     * cleared in I2C_FINISH. Note that DRDY is always set to 1 in this driver.
+     */
+    s->sr = 0x3;
+
+    /*
+     * Copy the current X/Y/Z and temp. values into the locked registers so
+     * that 'mag-x', 'mag-y', 'mag-z' and 'temperature' can continue to be
+     * updated via QOM, etc., without corrupting the current read event.
+     */
+    s->x_lock = s->x;
+    s->z_lock = s->z;
+    s->y_lock = s->y;
+    s->temperature_lock = s->temperature;
+}
+
+/*
+ * Callback handler whenever a 'I2C_FINISH' event is received.
+ */
+static void lsm303dlhc_mag_finish(LSM303DLHCMagState *s)
+{
+    /*
+     * Clear the LOCK bit when the read attempt terminates.
+     * This bit is initially set in the I2C_START_RECV handler.
+     */
+    s->sr = 0x1;
+}
+
+/*
+ * Callback handler when a device attempts to write to a register.
+ */
+static void lsm303dlhc_mag_write(LSM303DLHCMagState *s)
+{
+    switch (s->pointer) {
+    case LSM303DLHC_MAG_REG_CRA:
+        s->cra = s->buf;
+        break;
+    case LSM303DLHC_MAG_REG_CRB:
+        /* Make sure gain is at least 1, falling back to 1 on an error. */
+        if (s->buf >> 5 == 0) {
+            s->buf = 1 << 5;
+        }
+        s->crb = s->buf;
+        break;
+    case LSM303DLHC_MAG_REG_MR:
+        s->mr = s->buf;
+        break;
+    case LSM303DLHC_MAG_REG_SR:
+        s->sr = s->buf;
+        break;
+    case LSM303DLHC_MAG_REG_IRA:
+        s->ira = s->buf;
+        break;
+    case LSM303DLHC_MAG_REG_IRB:
+        s->irb = s->buf;
+        break;
+    case LSM303DLHC_MAG_REG_IRC:
+        s->irc = s->buf;
+        break;
+    default:
+        qemu_log_mask(LOG_GUEST_ERROR, "reg is read-only: 0x%02X", s->buf);
+        break;
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
+        s->buf = data;
+        lsm303dlhc_mag_write(s);
+    } else {
+        g_assert_not_reached();
+    }
+
+    return 0;
+}
+
+/*
+ * Low-level slave-to-master transaction handler (read attempts).
+ */
+static uint8_t lsm303dlhc_mag_recv(I2CSlave *i2c)
+{
+    LSM303DLHCMagState *s = LSM303DLHC_MAG(i2c);
+    uint8_t resp;
+
+    switch (s->pointer) {
+    case LSM303DLHC_MAG_REG_CRA:
+        resp = s->cra;
+        break;
+    case LSM303DLHC_MAG_REG_CRB:
+        resp = s->crb;
+        break;
+    case LSM303DLHC_MAG_REG_MR:
+        resp = s->mr;
+        break;
+    case LSM303DLHC_MAG_REG_OUT_X_H:
+        resp = (uint8_t)(s->x_lock >> 8);
+        break;
+    case LSM303DLHC_MAG_REG_OUT_X_L:
+        resp = (uint8_t)(s->x_lock);
+        break;
+    case LSM303DLHC_MAG_REG_OUT_Z_H:
+        resp = (uint8_t)(s->z_lock >> 8);
+        break;
+    case LSM303DLHC_MAG_REG_OUT_Z_L:
+        resp = (uint8_t)(s->z_lock);
+        break;
+    case LSM303DLHC_MAG_REG_OUT_Y_H:
+        resp = (uint8_t)(s->y_lock >> 8);
+        break;
+    case LSM303DLHC_MAG_REG_OUT_Y_L:
+        resp = (uint8_t)(s->y_lock);
+        break;
+    case LSM303DLHC_MAG_REG_SR:
+        resp = s->sr;
+        break;
+    case LSM303DLHC_MAG_REG_IRA:
+        resp = s->ira;
+        break;
+    case LSM303DLHC_MAG_REG_IRB:
+        resp = s->irb;
+        break;
+    case LSM303DLHC_MAG_REG_IRC:
+        resp = s->irc;
+        break;
+    case LSM303DLHC_MAG_REG_TEMP_OUT_H:
+        /* Check if the temperature sensor is enabled or not (CRA & 0x80). */
+        if (s->cra & 0x80) {
+            resp = (uint8_t)(s->temperature_lock >> 8);
+        } else {
+            resp = 0;
+        }
+        break;
+    case LSM303DLHC_MAG_REG_TEMP_OUT_L:
+        if (s->cra & 0x80) {
+            resp = (uint8_t)(s->temperature_lock & 0xff);
+        } else {
+            resp = 0;
+        }
+        break;
+    default:
+        resp = 0;
+        break;
+    }
+
+    /*
+     * The address pointer on the LSM303DLHC auto-increments whenever a byte
+     * is read, without the master device having to request the next address.
+     *
+     * The auto-increment process has the following logic:
+     *
+     *   - if (s->pointer == 8) then s->pointer = 3
+     *   - else: if (s->pointer == 12) then s->pointer = 0
+     *   - else: s->pointer += 1
+     *
+     * Reading an invalid address return 0.
+     */
+    if (s->pointer == LSM303DLHC_MAG_REG_OUT_Y_L) {
+        s->pointer = LSM303DLHC_MAG_REG_OUT_X_H;
+    } else if (s->pointer == LSM303DLHC_MAG_REG_IRC) {
+        s->pointer = LSM303DLHC_MAG_REG_CRA;
+    } else {
+        s->pointer++;
+    }
+
+    return resp;
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
+        lsm303dlhc_mag_finish(s);
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
+        VMSTATE_UINT8(buf, LSM303DLHCMagState),
+        VMSTATE_UINT8(pointer, LSM303DLHCMagState),
+        VMSTATE_UINT8(cra, LSM303DLHCMagState),
+        VMSTATE_UINT8(crb, LSM303DLHCMagState),
+        VMSTATE_UINT8(mr, LSM303DLHCMagState),
+        VMSTATE_INT16(x, LSM303DLHCMagState),
+        VMSTATE_INT16(z, LSM303DLHCMagState),
+        VMSTATE_INT16(y, LSM303DLHCMagState),
+        VMSTATE_INT16(x_lock, LSM303DLHCMagState),
+        VMSTATE_INT16(z_lock, LSM303DLHCMagState),
+        VMSTATE_INT16(y_lock, LSM303DLHCMagState),
+        VMSTATE_UINT8(sr, LSM303DLHCMagState),
+        VMSTATE_UINT8(ira, LSM303DLHCMagState),
+        VMSTATE_UINT8(irb, LSM303DLHCMagState),
+        VMSTATE_UINT8(irc, LSM303DLHCMagState),
+        VMSTATE_INT16(temperature, LSM303DLHCMagState),
+        VMSTATE_INT16(temperature_lock, LSM303DLHCMagState),
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
+    s->buf = 0;             /* Shared buffer. */
+    s->cra = 0x10;          /* Temp Enabled = 0, Data Rate = 15.0 Hz. */
+    s->crb = 0x20;          /* Gain = +/- 1.3 Gauss. */
+    s->mr = 0x3;            /* Operating Mode = Sleep. */
+    s->x = 0;
+    s->z = 0;
+    s->y = 0;
+    s->x_lock = 0;
+    s->z_lock = 0;
+    s->y_lock = 0;
+    s->sr = 0x1;            /* DRDY = 1. */
+    s->ira = 0x48;
+    s->irb = 0x34;
+    s->irc = 0x33;
+    s->temperature = 0;     /* Default to 0 degrees C (0/8 lsb = 0 C). */
+    s->temperature_lock = 0;
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
index 059c4ca935..d1bba290da 100644
--- a/hw/sensor/meson.build
+++ b/hw/sensor/meson.build
@@ -4,3 +4,4 @@ softmmu_ss.add(when: 'CONFIG_DPS310', if_true: files('dps310.c'))
 softmmu_ss.add(when: 'CONFIG_EMC141X', if_true: files('emc141x.c'))
 softmmu_ss.add(when: 'CONFIG_ADM1272', if_true: files('adm1272.c'))
 softmmu_ss.add(when: 'CONFIG_MAX34451', if_true: files('max34451.c'))
+softmmu_ss.add(when: 'CONFIG_LSM303DLHC_MAG', if_true: files('lsm303dlhc_mag.c'))
diff --git a/tests/qtest/lsm303dlhc-mag-test.c b/tests/qtest/lsm303dlhc-mag-test.c
new file mode 100644
index 0000000000..0f64e7fc67
--- /dev/null
+++ b/tests/qtest/lsm303dlhc-mag-test.c
@@ -0,0 +1,148 @@
+/*
+ * QTest testcase for the LSM303DLHC I2C magnetometer
+ *
+ * Copyright (C) 2021 Linaro Ltd.
+ * Written by Kevin Townsend <kevin.townsend@linaro.org>
+ *
+ * Based on: https://www.st.com/resource/en/datasheet/lsm303dlhc.pdf
+ *
+ * SPDX-License-Identifier: GPL-2.0-or-later
+ */
+
+#include "qemu/osdep.h"
+#include "libqtest-single.h"
+#include "libqos/qgraph.h"
+#include "libqos/i2c.h"
+#include "qapi/qmp/qdict.h"
+
+#define LSM303DLHC_MAG_TEST_ID        "lsm303dlhc_mag-test"
+#define LSM303DLHC_MAG_REG_CRA        0x00
+#define LSM303DLHC_MAG_REG_CRB        0x01
+#define LSM303DLHC_MAG_REG_OUT_X_H    0x03
+#define LSM303DLHC_MAG_REG_OUT_Z_H    0x05
+#define LSM303DLHC_MAG_REG_OUT_Y_H    0x07
+#define LSM303DLHC_MAG_REG_IRC        0x0C
+#define LSM303DLHC_MAG_REG_TEMP_OUT_H 0x31
+
+static int qmp_lsm303dlhc_mag_get_property(const char *id, const char *prop)
+{
+    QDict *response;
+    int ret;
+
+    response = qmp("{ 'execute': 'qom-get', 'arguments': { 'path': %s, "
+                   "'property': %s } }", id, prop);
+    g_assert(qdict_haskey(response, "return"));
+    ret = qdict_get_int(response, "return");
+    qobject_unref(response);
+    return ret;
+}
+
+static void qmp_lsm303dlhc_mag_set_property(const char *id, const char *prop,
+                                            int value)
+{
+    QDict *response;
+
+    response = qmp("{ 'execute': 'qom-set', 'arguments': { 'path': %s, "
+                   "'property': %s, 'value': %d } }", id, prop, value);
+    g_assert(qdict_haskey(response, "return"));
+    qobject_unref(response);
+}
+
+static void send_and_receive(void *obj, void *data, QGuestAllocator *alloc)
+{
+    int64_t value;
+    QI2CDevice *i2cdev = (QI2CDevice *)obj;
+
+    /* Check default value for CRB */
+    g_assert_cmphex(i2c_get8(i2cdev, LSM303DLHC_MAG_REG_CRB), ==, 0x20);
+
+    /* Set x to 1.0 gauss and verify the value */
+    qmp_lsm303dlhc_mag_set_property(LSM303DLHC_MAG_TEST_ID, "mag-x", 100000);
+    value = qmp_lsm303dlhc_mag_get_property(
+        LSM303DLHC_MAG_TEST_ID, "mag-x");
+    g_assert_cmpint(value, ==, 100000);
+
+    /* Set y to 1.5 gauss and verify the value */
+    qmp_lsm303dlhc_mag_set_property(LSM303DLHC_MAG_TEST_ID, "mag-y", 150000);
+    value = qmp_lsm303dlhc_mag_get_property(
+        LSM303DLHC_MAG_TEST_ID, "mag-y");
+    g_assert_cmpint(value, ==, 150000);
+
+    /* Set z to 0.5 gauss and verify the value */
+    qmp_lsm303dlhc_mag_set_property(LSM303DLHC_MAG_TEST_ID, "mag-z", 50000);
+    value = qmp_lsm303dlhc_mag_get_property(
+        LSM303DLHC_MAG_TEST_ID, "mag-z");
+    g_assert_cmpint(value, ==, 50000);
+
+    /* Set temperature to 23.6 C and verify the value */
+    qmp_lsm303dlhc_mag_set_property(LSM303DLHC_MAG_TEST_ID,
+        "temperature", 23600);
+    value = qmp_lsm303dlhc_mag_get_property(
+        LSM303DLHC_MAG_TEST_ID, "temperature");
+    /* Should return 23.5 C due to 0.125°C steps. */
+    g_assert_cmpint(value, ==, 23500);
+
+    /* Read raw x axis registers (1 gauss = 1100 at +/-1.3 g gain) */
+    value = i2c_get16(i2cdev, LSM303DLHC_MAG_REG_OUT_X_H);
+    g_assert_cmphex(value, ==, 1100);
+
+    /* Read raw y axis registers (1.5 gauss = 1650 at +/- 1.3 g gain = ) */
+    value = i2c_get16(i2cdev, LSM303DLHC_MAG_REG_OUT_Y_H);
+    g_assert_cmphex(value, ==, 1650);
+
+    /* Read raw z axis registers (0.5 gauss = 490 at +/- 1.3 g gain = ) */
+    value = i2c_get16(i2cdev, LSM303DLHC_MAG_REG_OUT_Z_H);
+    g_assert_cmphex(value, ==, 490);
+
+    /* Read raw temperature registers with temp disabled (CRA = 0x10) */
+    value = i2c_get16(i2cdev, LSM303DLHC_MAG_REG_TEMP_OUT_H);
+    g_assert_cmphex(value, ==, 0);
+
+    /* Enable temperature reads (CRA = 0x90) */
+    i2c_set8(i2cdev, LSM303DLHC_MAG_REG_CRA, 0x90);
+
+    /* Read raw temp registers (23.5 C = 188 at 1 lsb = 0.125 C) */
+    value = i2c_get16(i2cdev, LSM303DLHC_MAG_REG_TEMP_OUT_H);
+    g_assert_cmphex(value, ==, 188);
+}
+
+static void reg_wraparound(void *obj, void *data, QGuestAllocator *alloc)
+{
+    uint8_t value[4];
+    QI2CDevice *i2cdev = (QI2CDevice *)obj;
+
+    /* Set x to 1.0 gauss, and y to 1.5 gauss for known test values */
+    qmp_lsm303dlhc_mag_set_property(LSM303DLHC_MAG_TEST_ID, "mag-x", 100000);
+    qmp_lsm303dlhc_mag_set_property(LSM303DLHC_MAG_TEST_ID, "mag-y", 150000);
+
+    /* Check that requesting 4 bytes starting at Y_H wraps around to X_L */
+    i2c_read_block(i2cdev, LSM303DLHC_MAG_REG_OUT_Y_H, value, 4);
+    /* 1.5 gauss = 1650 lsb = 0x672 */
+    g_assert_cmphex(value[0], ==, 0x06);
+    g_assert_cmphex(value[1], ==, 0x72);
+    /* 1.0 gauss = 1100 lsb = 0x44C */
+    g_assert_cmphex(value[2], ==, 0x04);
+    g_assert_cmphex(value[3], ==, 0x4C);
+
+    /* Check that requesting LSM303DLHC_MAG_REG_IRC wraps around to CRA */
+    i2c_read_block(i2cdev, LSM303DLHC_MAG_REG_IRC, value, 2);
+    /* Default value for IRC = 0x33 */
+    g_assert_cmphex(value[0], ==, 0x33);
+    /* Default value for CRA = 0x10 */
+    g_assert_cmphex(value[1], ==, 0x10);
+}
+
+static void lsm303dlhc_mag_register_nodes(void)
+{
+    QOSGraphEdgeOptions opts = {
+        .extra_device_opts = "id=" LSM303DLHC_MAG_TEST_ID ",address=0x1e"
+    };
+    add_qi2c_address(&opts, &(QI2CAddress) { 0x1E });
+
+    qos_node_create_driver("lsm303dlhc_mag", i2c_device_create);
+    qos_node_consumes("lsm303dlhc_mag", "i2c-bus", &opts);
+
+    qos_add_test("tx-rx", "lsm303dlhc_mag", send_and_receive, NULL);
+    qos_add_test("regwrap", "lsm303dlhc_mag", reg_wraparound, NULL);
+}
+libqos_init(lsm303dlhc_mag_register_nodes);
diff --git a/tests/qtest/meson.build b/tests/qtest/meson.build
index 26937deb6d..bf39cf043f 100644
--- a/tests/qtest/meson.build
+++ b/tests/qtest/meson.build
@@ -242,6 +242,7 @@ qos_test_ss.add(
   'eepro100-test.c',
   'es1370-test.c',
   'ipoctal232-test.c',
+  'lsm303dlhc-mag-test.c',
   'max34451-test.c',
   'megasas-test.c',
   'ne2000-test.c',
-- 
2.34.1


