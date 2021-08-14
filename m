Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C2A93EC5BE
	for <lists+qemu-devel@lfdr.de>; Sun, 15 Aug 2021 00:06:02 +0200 (CEST)
Received: from localhost ([::1]:60812 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mF1my-0006k0-MH
	for lists+qemu-devel@lfdr.de; Sat, 14 Aug 2021 18:06:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44498)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kevin.townsend@linaro.org>)
 id 1mF1lU-00060v-4A
 for qemu-devel@nongnu.org; Sat, 14 Aug 2021 18:04:28 -0400
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d]:38830)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <kevin.townsend@linaro.org>)
 id 1mF1lP-0000zL-N7
 for qemu-devel@nongnu.org; Sat, 14 Aug 2021 18:04:27 -0400
Received: by mail-wr1-x42d.google.com with SMTP id u16so1054018wrn.5
 for <qemu-devel@nongnu.org>; Sat, 14 Aug 2021 15:04:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=6+qF23TMKWx1Cgh1Dh0bPgQVjqQVCn8CFAlsyFvDlRg=;
 b=BGKIZM/2ADoQ1whg9UPKNEKhPs981PNYjERmCPMtkuNg1VczYUjAlrDsL9PSotXgtI
 lGRgryOz2Gh36DVdg9ZRl55LyILGeT2ZvVRozsf+90FQsTA5xOdpc0kOLyQmJY1ka600
 ZHzBflxe7K19wBlIOqi8mzvTX0KbMbFYnxk5aGKlPoZnAWkcu1sowPXp1dejdnZDmd+z
 Vb9M04N1R6yBvW1gCN3IfNQT5XG2/WfNncRSQMuGyrPum6v2CCnMGNmMYDwKuno1TQCt
 DODwPgi2BNTtHjth95sVHP0vNnhFppqIOZX42jvQVFS/n4FsvLyqm+GFhGa57q3a2qWq
 myyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=6+qF23TMKWx1Cgh1Dh0bPgQVjqQVCn8CFAlsyFvDlRg=;
 b=hwK1uvzFgib/2vtyGt0FDtMXGbXqYpKT+gHEA4QLqLKXUP+Qd7ALzzVMUOvJE9dyyV
 8cGwTLvz3Uu08pLRmIB1j/z52lf85PyRfckyabdJ1pnGumW6L22oKfeGDitjLa9pm6jp
 inEqNEWgNrMwHrTVLH0XwtTi7eduGipSj4iKREnrXGSoMrEHkAJvkh7izLqv3vomgFhL
 Kv4HoS2nIgabiArjeuoLmLtVwZsBVcQdGV1NXJ+0nx78ygU3SYUPS5tMwauT7xlUTdv1
 At5LArI8UqY7V3FVzby8DaqLgw5ktFT91ZI04Xk3rvX7oXSOTIM9DhymxqZ0k/ra6EQ9
 nA8Q==
X-Gm-Message-State: AOAM530BpLR4lIxzUXqaFpQUE1khjuzuZMB3wOVSQsRiWxD3w/bUdr0t
 LbrKSAU1b9mKPf7xcmdg4NLoqgtxqNtYQA==
X-Google-Smtp-Source: ABdhPJzQo/knttcs7HAxdF68rOi3NW4CbdUjP+FlT2cIX9teqKh4L57ZwBKgOAE4dKrCok+kzieB6g==
X-Received: by 2002:a05:6000:1864:: with SMTP id
 d4mr10592982wri.250.1628978660815; 
 Sat, 14 Aug 2021 15:04:20 -0700 (PDT)
Received: from Kevins-MBP-2.lan ([37.222.182.64])
 by smtp.gmail.com with ESMTPSA id b13sm5968630wrf.86.2021.08.14.15.04.20
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Sat, 14 Aug 2021 15:04:20 -0700 (PDT)
From: Kevin Townsend <kevin.townsend@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH] hw/sensor: Add lsm303dlhc magnetometer device
Date: Sun, 15 Aug 2021 00:02:37 +0200
Message-Id: <20210814220237.33529-1-kevin.townsend@linaro.org>
X-Mailer: git-send-email 2.30.1 (Apple Git-130)
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=kevin.townsend@linaro.org; helo=mail-wr1-x42d.google.com
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
magn_x, magn_y and magn_z properties, as well as the 12-bit
temperature output via the temperature property.

Signed-off-by: Kevin Townsend <kevin.townsend@linaro.org>
---
 hw/sensor/Kconfig          |   4 +
 hw/sensor/lsm303dlhc_mag.c | 499 +++++++++++++++++++++++++++++++++++++
 hw/sensor/meson.build      |   1 +
 3 files changed, 504 insertions(+)
 create mode 100644 hw/sensor/lsm303dlhc_mag.c

diff --git a/hw/sensor/Kconfig b/hw/sensor/Kconfig
index a2b55a4fdb..f9d0177433 100644
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
\ No newline at end of file
diff --git a/hw/sensor/lsm303dlhc_mag.c b/hw/sensor/lsm303dlhc_mag.c
new file mode 100644
index 0000000000..20629b1c79
--- /dev/null
+++ b/hw/sensor/lsm303dlhc_mag.c
@@ -0,0 +1,499 @@
+/*
+ * LSM303DLHC I2C magnetometer.
+ *
+ * Copyright (C) 2021 Linaro Ltd.
+ * Written by Kevin Townsend <kevin.townsend@linaro.org>
+ *
+ * SPDX-License-Identifier: GPL-2.0-or-later
+ */
+
+/*
+ * The I2C address associated with this device is set on the command-line when
+ * initialising the machine, but the following address is standard: 0x1E.
+ */
+
+#include "qemu/osdep.h"
+#include "hw/i2c/i2c.h"
+#include "migration/vmstate.h"
+#include "qapi/error.h"
+#include "qapi/visitor.h"
+#include "qemu/module.h"
+
+/* #define DEBUG_LSM303DLHC_MAG */
+
+#ifdef DEBUG_LSM303DLHC_MAG
+#define DPRINTK(FMT, ...) printf(TYPE_LSM303DLHC_MAG " : " FMT, ## __VA_ARGS__)
+#else
+#define DPRINTK(FMT, ...) do {} while (0)
+#endif
+
+/* Property Names */
+#define LSM303DLHC_MSG_PROP_MAGX ("mag_x")
+#define LSM303DLHC_MSG_PROP_MAGY ("mag_y")
+#define LSM303DLHC_MSG_PROP_MAGZ ("mag_z")
+#define LSM303DLHC_MSG_PROP_TEMP ("temperature")
+
+enum LSM303DLHC_Mag_Reg {
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
+typedef struct LSM303DLHC_Mag_State {
+    I2CSlave parent_obj;
+
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
+
+    uint8_t len;
+    uint8_t buf[6];
+    uint8_t pointer;
+} LSM303DLHC_Mag_State;
+
+/* 'TYPE_xxx' define is required by OBJECT_DECLARE_SIMPLE_TYPE. */
+#define TYPE_LSM303DLHC_MAG "lsm303dlhc_mag"
+OBJECT_DECLARE_SIMPLE_TYPE(LSM303DLHC_Mag_State, LSM303DLHC_MAG)
+
+/**
+ * @brief Get handler for the mag_* property. This will be called
+ *        whenever the public 'mag_*' property is read, such as via
+ *        qom-get in the QEMU monitor.
+ */
+static void lsm303dlhc_mag_get_xyz(Object *obj, Visitor *v,
+                 const char *name, void *opaque, Error **errp)
+{
+    LSM303DLHC_Mag_State *s = LSM303DLHC_MAG(obj);
+    int64_t value;
+
+    if (strcmp(name, LSM303DLHC_MSG_PROP_MAGX) == 0) {
+        value = s->x;
+    } else if (strcmp(name, LSM303DLHC_MSG_PROP_MAGY) == 0) {
+        value = s->y;
+    } else if (strcmp(name, LSM303DLHC_MSG_PROP_MAGZ) == 0) {
+        value = s->z;
+    } else {
+        error_setg(errp, "unknown property: %s", name);
+        return;
+    }
+
+    visit_type_int(v, name, &value, errp);
+}
+
+/**
+ * @brief Set handler for the mag_* property. This will be called
+ *        whenever the public 'mag_*' property is set, such as via
+ *        qom-set in the QEMU monitor.
+ */
+static void lsm303dlhc_mag_set_xyz(Object *obj, Visitor *v,
+                 const char *name, void *opaque, Error **errp)
+{
+    LSM303DLHC_Mag_State *s = LSM303DLHC_MAG(obj);
+    int64_t temp;
+
+    if (!visit_type_int(v, name, &temp, errp)) {
+        return;
+    }
+
+    if (temp > 2047 || temp < -2048) {
+        error_setg(errp, "value %d lsb is out of range", temp);
+        return;
+    }
+
+    if (strcmp(name, LSM303DLHC_MSG_PROP_MAGX) == 0) {
+        s->x = (int16_t)temp;
+    } else if (strcmp(name, LSM303DLHC_MSG_PROP_MAGY) == 0) {
+        s->y = (int16_t)temp;
+    } else if (strcmp(name, LSM303DLHC_MSG_PROP_MAGZ) == 0) {
+        s->z = (int16_t)temp;
+    } else {
+        error_setg(errp, "unknown property: %s", name);
+        return;
+    }
+}
+
+/**
+ * @brief Get handler for the temperature property. This will be called
+ *        whenever the public 'temperature' property is read, such as via
+ *        qom-get in the QEMU monitor.
+ */
+static void lsm303dlhc_mag_get_temperature(Object *obj, Visitor *v,
+                       const char *name, void *opaque, Error **errp)
+{
+    LSM303DLHC_Mag_State *s = LSM303DLHC_MAG(obj);
+    int64_t value;
+
+    value = s->temperature;
+
+    visit_type_int(v, name, &value, errp);
+}
+
+/**
+ * @brief Set handler for the temperature property. This will be called
+ *        whenever the public 'temperature' property is set, such as via
+ *        qom-set in the QEMU monitor.
+ */
+static void lsm303dlhc_mag_set_temperature(Object *obj, Visitor *v,
+                       const char *name, void *opaque, Error **errp)
+{
+    LSM303DLHC_Mag_State *s = LSM303DLHC_MAG(obj);
+    int64_t temp;
+
+    if (!visit_type_int(v, name, &temp, errp)) {
+        return;
+    }
+
+    if (temp > 2047 || temp < -2048) {
+        error_setg(errp, "value %d lsb is out of range (1 C = 8 lsb)", temp);
+        return;
+    }
+
+    s->temperature = (int16_t)temp;
+}
+
+/**
+ * @brief Callback handler whenever a 'I2C_START_RECV' (read) event is received.
+ */
+static void lsm303dlhc_mag_read(LSM303DLHC_Mag_State *s)
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
+     * for the LSM303DLHC_MAG_REG_OUT_X_H and LSM303DLHC_MAG_REG_TEMP_OUT_H
+     * registers, which are the two common uses cases for it. Accessing either
+     * of these registers will also populate the rest of the related dataset.
+     */
+
+    DPRINTK("Read: register = 0x%02x\n", s->pointer);
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
+        s->buf[s->len++] = (uint8_t)(s->x >> 8);
+        s->buf[s->len++] = (uint8_t)(s->x);
+        s->buf[s->len++] = (uint8_t)(s->z >> 8);
+        s->buf[s->len++] = (uint8_t)(s->z);
+        s->buf[s->len++] = (uint8_t)(s->y >> 8);
+        s->buf[s->len++] = (uint8_t)(s->y);
+        break;
+    case LSM303DLHC_MAG_REG_OUT_X_L:
+        s->buf[s->len++] = (uint8_t)(s->x);
+        break;
+    case LSM303DLHC_MAG_REG_OUT_Z_H:
+        s->buf[s->len++] = (uint8_t)(s->z >> 8);
+        break;
+    case LSM303DLHC_MAG_REG_OUT_Z_L:
+        s->buf[s->len++] = (uint8_t)(s->z);
+        break;
+    case LSM303DLHC_MAG_REG_OUT_Y_H:
+        s->buf[s->len++] = (uint8_t)(s->y >> 8);
+        break;
+    case LSM303DLHC_MAG_REG_OUT_Y_L:
+        s->buf[s->len++] = (uint8_t)(s->y);
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
+/**
+ * @brief Callback handler when a device attempts to write to a register.
+ */
+static void lsm303dlhc_mag_write(LSM303DLHC_Mag_State *s)
+{
+    DPRINTK("Write: register = 0x%02x, value = 0x%02x\n",
+        s->pointer, s->buf[0]);
+
+    switch (s->pointer) {
+    case LSM303DLHC_MAG_REG_CRA:
+        s->cra = s->buf[0];
+        break;
+    case LSM303DLHC_MAG_REG_CRB:
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
+    }
+}
+
+/**
+ * @brief Low-level slave-to-master transaction handler.
+ */
+static uint8_t lsm303dlhc_mag_recv(I2CSlave *i2c)
+{
+    LSM303DLHC_Mag_State *s = LSM303DLHC_MAG(i2c);
+
+    DPRINTK("M<-S: 0x%02x (byte = %d)\n", s->buf[s->len], s->len);
+
+    if (s->len < 6) {
+        return s->buf[s->len++];
+    } else {
+        return 0xff;
+    }
+}
+
+/**
+ * @brief Low-level master-to-slave transaction handler.
+ */
+static int lsm303dlhc_mag_send(I2CSlave *i2c, uint8_t data)
+{
+    LSM303DLHC_Mag_State *s = LSM303DLHC_MAG(i2c);
+
+    if (s->len == 0) {
+        /* First byte is the reg pointer */
+        DPRINTK("M->S: Setting reg pointer to 0x%02x\n", data);
+        s->pointer = data;
+        s->len++;
+    } else if (s->len == 1) {
+        /* Second byte is the new register value. */
+        DPRINTK("M->S: Setting reg 0x%02x to 0x%02x\n", s->pointer, data);
+        s->buf[0] = data;
+        lsm303dlhc_mag_write(s);
+    }
+
+    return 0;
+}
+
+/**
+ * @brief Bus state change handler.
+ */
+static int lsm303dlhc_mag_event(I2CSlave *i2c, enum i2c_event event)
+{
+    LSM303DLHC_Mag_State *s = LSM303DLHC_MAG(i2c);
+
+    switch (event) {
+    case I2C_START_SEND:
+        DPRINTK("Event: START_SEND\n");
+        break;
+    case I2C_START_RECV:
+        DPRINTK("Event: START_RECV\n");
+        lsm303dlhc_mag_read(s);
+        break;
+    case I2C_FINISH:
+        DPRINTK("Event: FINISH\n");
+        break;
+    case I2C_NACK:
+        DPRINTK("Event: NACK\n");
+        break;
+    }
+
+    s->len = 0;
+    return 0;
+}
+
+/**
+ * @brief Device data description using VMSTATE macros.
+ */
+static const VMStateDescription vmstate_lsm303dlhc_mag = {
+    .name = "LSM303DLHC_MAG",
+    .version_id = 0,
+    .minimum_version_id = 0,
+    .fields = (VMStateField[]) {
+
+        VMSTATE_I2C_SLAVE(parent_obj, LSM303DLHC_Mag_State),
+        VMSTATE_UINT8(len, LSM303DLHC_Mag_State),
+        VMSTATE_UINT8_ARRAY(buf, LSM303DLHC_Mag_State, 6),
+        VMSTATE_UINT8(pointer, LSM303DLHC_Mag_State),
+        VMSTATE_UINT8(cra, LSM303DLHC_Mag_State),
+        VMSTATE_UINT8(crb, LSM303DLHC_Mag_State),
+        VMSTATE_UINT8(mr, LSM303DLHC_Mag_State),
+        VMSTATE_INT16(x, LSM303DLHC_Mag_State),
+        VMSTATE_INT16(z, LSM303DLHC_Mag_State),
+        VMSTATE_INT16(y, LSM303DLHC_Mag_State),
+        VMSTATE_UINT8(sr, LSM303DLHC_Mag_State),
+        VMSTATE_UINT8(ira, LSM303DLHC_Mag_State),
+        VMSTATE_UINT8(irb, LSM303DLHC_Mag_State),
+        VMSTATE_UINT8(irc, LSM303DLHC_Mag_State),
+        VMSTATE_INT16(temperature, LSM303DLHC_Mag_State),
+        VMSTATE_END_OF_LIST()
+    }
+};
+
+/**
+ * @brief Put the device into post-reset default state.
+ */
+static void lsm303dlhc_mag_reset(I2CSlave *i2c)
+{
+    LSM303DLHC_Mag_State *s = LSM303DLHC_MAG(i2c);
+
+    s->len = 0;
+    s->pointer = 0;         /* Current register. */
+    s->buf[0] = 0;
+    s->buf[1] = 0;
+    s->buf[2] = 0;
+    s->buf[3] = 0;
+    s->buf[4] = 0;
+    s->buf[5] = 0;
+
+    s->cra = 0x08;          /* Temp Enabled = 0, Data Rate = 3.0 Hz. */
+    s->crb = 0x20;          /* Gain = +/- 1.3 Guas. */
+    s->mr = 0x1;            /* Operating Mode = Single conversion. */
+    s->x = 0;
+    s->z = 0;
+    s->y = 0;
+    s->sr = 0x1;            /* DRDY = 1. */
+    s->ira = 0x48;
+    s->irb = 0x34;
+    s->irc = 0x33;
+    s->temperature = 0;
+}
+
+/**
+ * @brief Callback handler when DeviceState 'realized' is set to true.
+ */
+static void lsm303dlhc_mag_realize(DeviceState *dev, Error **errp)
+{
+    I2CSlave *i2c = I2C_SLAVE(dev);
+    LSM303DLHC_Mag_State *s = LSM303DLHC_MAG(i2c);
+
+    /* Set the device into is default reset state. */
+    lsm303dlhc_mag_reset(&s->parent_obj);
+}
+
+/**
+ * @brief Initialisation of any public properties.
+ *
+ * @note Properties are an object's external interface, and are set before the
+ *       object is started. The 'temperature' property here enables the
+ *       temperature registers to be set by the host OS, for example, or via
+ *       the QEMU monitor interface using commands like 'qom-set' and 'qom-get'.
+ */
+static void lsm303dlhc_mag_initfn(Object *obj)
+{
+    object_property_add(obj, LSM303DLHC_MSG_PROP_MAGX, "int",
+                lsm303dlhc_mag_get_xyz,
+                lsm303dlhc_mag_set_xyz, NULL, NULL);
+
+    object_property_add(obj, LSM303DLHC_MSG_PROP_MAGY, "int",
+                lsm303dlhc_mag_get_xyz,
+                lsm303dlhc_mag_set_xyz, NULL, NULL);
+
+    object_property_add(obj, LSM303DLHC_MSG_PROP_MAGZ, "int",
+                lsm303dlhc_mag_get_xyz,
+                lsm303dlhc_mag_set_xyz, NULL, NULL);
+
+    object_property_add(obj, LSM303DLHC_MSG_PROP_TEMP, "int",
+                lsm303dlhc_mag_get_temperature,
+                lsm303dlhc_mag_set_temperature, NULL, NULL);
+}
+
+/**
+ * @brief Set the virtual method pointers (bus state change, tx/rx, etc.).
+ */
+static void lsm303dlhc_mag_class_init(ObjectClass *klass, void *data)
+{
+    DeviceClass *dc = DEVICE_CLASS(klass);
+    I2CSlaveClass *k = I2C_SLAVE_CLASS(klass);
+
+    /* DeviceState 'realized' handler. */
+    dc->realize = lsm303dlhc_mag_realize;
+
+    /* VM State description (device data). */
+    dc->vmsd = &vmstate_lsm303dlhc_mag;
+
+    /* Bus state change handler. */
+    k->event = lsm303dlhc_mag_event;
+
+    /* Slave to master handler. */
+    k->recv = lsm303dlhc_mag_recv;
+
+    /* Master to slave handler. */
+    k->send = lsm303dlhc_mag_send;
+}
+
+static const TypeInfo lsm303dlhc_mag_info = {
+    .name = TYPE_LSM303DLHC_MAG,
+    .parent = TYPE_I2C_SLAVE,
+    .instance_size = sizeof(LSM303DLHC_Mag_State),
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


