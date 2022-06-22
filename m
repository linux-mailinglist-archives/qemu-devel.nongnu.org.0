Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 58D7C5552B8
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Jun 2022 19:45:10 +0200 (CEST)
Received: from localhost ([::1]:34144 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o44PX-0000FV-32
	for lists+qemu-devel@lfdr.de; Wed, 22 Jun 2022 13:45:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44872)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quic_jaehyoo@quicinc.com>)
 id 1o44GS-0007FL-AI; Wed, 22 Jun 2022 13:35:40 -0400
Received: from alexa-out.qualcomm.com ([129.46.98.28]:61191)
 by eggs.gnu.org with esmtps (TLS1.2:RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <quic_jaehyoo@quicinc.com>)
 id 1o44GO-0001gD-Ry; Wed, 22 Jun 2022 13:35:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1655919336; x=1687455336;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=IvFl9J//yf5SzAKNvlMIULWdgHIZYp1JNOXuo0qnH4o=;
 b=MRlq/44WgaM4bcx0itAr6eWNHM/5OzRm8Fsjlp/k1DMeAnw261h1NGg/
 q+XjJD8eVpdzigoQ7WlJuH9T2isbBJyFOO/8ombD3COH+kMgA0+LeVH4L
 PiYWB9S/MIGrvheX72PrG3LLOL45qCREvV2mLwnz7+/8KBgYamq6QMhlN Y=;
Received: from ironmsg07-lv.qualcomm.com ([10.47.202.151])
 by alexa-out.qualcomm.com with ESMTP; 22 Jun 2022 10:29:25 -0700
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
 by ironmsg07-lv.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jun 2022 10:29:25 -0700
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Wed, 22 Jun 2022 10:29:24 -0700
Received: from maru.qualcomm.com (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.22; Wed, 22 Jun
 2022 10:29:23 -0700
From: Jae Hyun Yoo <quic_jaehyoo@quicinc.com>
To: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>, Titus Rwantare
 <titusr@google.com>, Andrew Jeffery <andrew@aj.id.au>, Joel Stanley
 <joel@jms.id.au>
CC: Graeme Gregory <quic_ggregory@quicinc.com>, Maheswara Kurapati
 <quic_mkurapat@quicinc.com>, <qemu-arm@nongnu.org>, <qemu-devel@nongnu.org>
Subject: [PATCH 6/9] hw/sensor: add Maxim MAX31785 device
Date: Wed, 22 Jun 2022 10:28:27 -0700
Message-ID: <20220622172830.101210-7-quic_jaehyoo@quicinc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220622172830.101210-1-quic_jaehyoo@quicinc.com>
References: <20220622172830.101210-1-quic_jaehyoo@quicinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
Received-SPF: pass client-ip=129.46.98.28;
 envelope-from=quic_jaehyoo@quicinc.com; helo=alexa-out.qualcomm.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Maheswara Kurapati <quic_mkurapat@quicinc.com>

MAX31785 is a PMBus compliant 6-Channel fan controller. It supports 6 fan
channels, 11 temperature sensors, and 6-Channel ADC to measure the remote
voltages. Datasheet can be found here:
https://datasheets.maximintegrated.com/en/ds/MAX31785.pdf

This initial version of the driver has skeleton and support for the
fan channels. Requests for temperature sensors, and ADC Channels the
are serviced with the default values as per the datasheet.  No additional
instrumentation is done.  NV Log feature is not supported.

Signed-off-by: Maheswara Kurapati <quic_mkurapat@quicinc.com>
---
 hw/arm/Kconfig        |   1 +
 hw/arm/aspeed.c       |   6 +-
 hw/sensor/Kconfig     |   4 +
 hw/sensor/max31785.c  | 580 ++++++++++++++++++++++++++++++++++++++++++
 hw/sensor/meson.build |   1 +
 5 files changed, 590 insertions(+), 2 deletions(-)
 create mode 100644 hw/sensor/max31785.c

diff --git a/hw/arm/Kconfig b/hw/arm/Kconfig
index 219262a8da36..77ef0fa967b2 100644
--- a/hw/arm/Kconfig
+++ b/hw/arm/Kconfig
@@ -408,6 +408,7 @@ config NPCM7XX
     select SSI
     select UNIMP
     select PCA954X
+    select MAX31785
 
 config FSL_IMX25
     bool
diff --git a/hw/arm/aspeed.c b/hw/arm/aspeed.c
index 0e6edd2be4fa..85630b497793 100644
--- a/hw/arm/aspeed.c
+++ b/hw/arm/aspeed.c
@@ -619,7 +619,6 @@ static void witherspoon_bmc_i2c_init(AspeedMachineState *bmc)
     LEDState *led;
 
     /* Bus 3: TODO bmp280@77 */
-    /* Bus 3: TODO max31785@52 */
     dev = DEVICE(i2c_slave_new(TYPE_PCA9552, 0x60));
     qdev_prop_set_string(dev, "description", "pca1");
     i2c_slave_realize_and_unref(I2C_SLAVE(dev),
@@ -635,6 +634,8 @@ static void witherspoon_bmc_i2c_init(AspeedMachineState *bmc)
                               qdev_get_gpio_in(DEVICE(led), 0));
     }
     i2c_slave_create_simple(aspeed_i2c_get_bus(&soc->i2c, 3), "dps310", 0x76);
+    i2c_slave_create_simple(aspeed_i2c_get_bus(&soc->i2c, 3), "max31785",
+                            0x52);
     i2c_slave_create_simple(aspeed_i2c_get_bus(&soc->i2c, 4), "tmp423", 0x4c);
     i2c_slave_create_simple(aspeed_i2c_get_bus(&soc->i2c, 5), "tmp423", 0x4c);
 
@@ -779,13 +780,14 @@ static void rainier_bmc_i2c_init(AspeedMachineState *bmc)
     create_pca9552(soc, 7, 0x31);
     create_pca9552(soc, 7, 0x32);
     create_pca9552(soc, 7, 0x33);
-    /* Bus 7: TODO max31785@52 */
     create_pca9552(soc, 7, 0x60);
     create_pca9552(soc, 7, 0x61);
     i2c_slave_create_simple(aspeed_i2c_get_bus(&soc->i2c, 7), "dps310", 0x76);
     /* Bus 7: TODO si7021-a20@20 */
     i2c_slave_create_simple(aspeed_i2c_get_bus(&soc->i2c, 7), TYPE_TMP105,
                      0x48);
+    i2c_slave_create_simple(aspeed_i2c_get_bus(&soc->i2c, 7), "max31785",
+                     0x52);
     aspeed_eeprom_init(aspeed_i2c_get_bus(&soc->i2c, 7), 0x50, 64 * KiB);
     aspeed_eeprom_init(aspeed_i2c_get_bus(&soc->i2c, 7), 0x51, 64 * KiB);
 
diff --git a/hw/sensor/Kconfig b/hw/sensor/Kconfig
index df392e786904..e03bd09b50e8 100644
--- a/hw/sensor/Kconfig
+++ b/hw/sensor/Kconfig
@@ -34,3 +34,7 @@ config LSM303DLHC_MAG
 config ISL_PMBUS_VR
     bool
     depends on PMBUS
+
+config MAX31785
+    bool
+    depends on PMBUS
diff --git a/hw/sensor/max31785.c b/hw/sensor/max31785.c
new file mode 100644
index 000000000000..11bf9977b6fd
--- /dev/null
+++ b/hw/sensor/max31785.c
@@ -0,0 +1,580 @@
+/*
+ * Maxim MAX31785 PMBus 6-Channel Fan Controller
+ *
+ * Datasheet:
+ * https://datasheets.maximintegrated.com/en/ds/MAX31785.pdf
+ *
+ * Copyright(c) 2022 Qualcomm Innovative Center, Inc. All rights reserved.
+ *
+ * SPDX-License-Identifier: GPL-2.0-or-later
+ */
+
+#include "qemu/osdep.h"
+#include "hw/i2c/pmbus_device.h"
+#include "hw/irq.h"
+#include "migration/vmstate.h"
+#include "qapi/error.h"
+#include "qapi/visitor.h"
+#include "qemu/log.h"
+#include "qemu/module.h"
+
+#define TYPE_MAX31785   "max31785"
+#define MAX31785(obj) OBJECT_CHECK(MAX31785State, (obj), TYPE_MAX31785)
+
+/*
+ * MAX31785 mfr specific PMBus commands
+ */
+#define MAX31785_MFR_MODE               0xD1
+#define MAX31785_MFR_PSEN_CONFIG        0xD2
+#define MAX31785_MFR_VOUT_PEAK          0xD4
+#define MAX31785_MFR_TEMPERATURE_PEAK   0xD6
+#define MAX31785_MFR_VOUT_MIN           0xD7
+#define MAX31785_MFR_FAULT_RESPONSE     0xD9
+#define MAX31785_MFR_NV_FAULT_LOG       0xDC
+#define MAX31785_MFR_TIME_COUNT         0xDD
+#define MAX31785_MFR_TEMP_SENSOR_CONFIG 0xF0
+#define MAX31785_MFR_FAN_CONFIG         0xF1
+#define MAX31785_MFR_FAN_LUT            0xF2
+#define MAX31785_MFR_READ_FAN_PWM       0xF3
+#define MAX31785_MFR_FAN_FAULT_LIMIT    0xF5
+#define MAX31785_MFR_FAN_WARN_LIMIT     0xF6
+#define MAX31785_MFR_FAN_RUN_TIME       0xF7
+#define MAX31785_MFR_FAN_PWM_AVG        0xF8
+#define MAX31785_MFR_FAN_PWM2RPM        0xF9
+
+/*
+ * defaults as per the data sheet
+ */
+#define MAX31785_DEFAULT_CAPABILITY         0x10
+#define MAX31785_DEFAULT_VOUT_MODE          0x40
+#define MAX31785_DEFAULT_VOUT_SCALE_MONITOR 0x7FFF
+#define MAX31785_DEFAULT_FAN_COMMAND_1      0x7FFF
+#define MAX31785_DEFAULT_OV_FAULT_LIMIT     0x7FFF
+#define MAX31785_DEFAULT_OV_WARN_LIMIT      0x7FFF
+#define MAX31785_DEFAULT_OT_FAULT_LIMIT     0x7FFF
+#define MAX31785_DEFAULT_OT_WARN_LIMIT      0x7FFF
+#define MAX31785_DEFAULT_PMBUS_REVISION     0x11
+#define MAX31785_DEFAULT_MFR_ID             0x4D
+#define MAX31785_DEFAULT_MFR_MODEL          0x53
+#define MAX31785_DEFAULT_MFR_REVISION       0x3030
+#define MAX31785A_DEFAULT_MFR_REVISION      0x3040
+#define MAX31785B_DEFAULT_MFR_REVISION      0x3061
+#define MAX31785B_DEFAULT_MFR_TEMPERATURE_PEAK   0x8000
+#define MAX31785B_DEFAULT_MFR_VOUT_MIN      0x7FFF
+#define MAX31785_DEFAULT_TEXT               0x3130313031303130
+
+/* MAX31785 pages */
+#define MAX31785_TOTAL_NUM_PAGES    23
+#define MAX31785_FAN_PAGES          6
+#define MAX31785_MIN_FAN_PAGE       0
+#define MAX31785_MAX_FAN_PAGE       5
+#define MAX31785_MIN_TEMP_PAGE      6
+#define MAX31785_MAX_TEMP_PAGE      16
+#define MAX31785_MIN_ADC_VOLTAGE_PAGE   17
+#define MAX31785_MAX_ADC_VOLTAGE_PAGE   22
+
+/* FAN_CONFIG_1_2 */
+#define MAX31785_MFR_FAN_CONFIG         0xF1
+#define MAX31785_FAN_CONFIG_ENABLE         BIT(7)
+#define MAX31785_FAN_CONFIG_RPM_PWM        BIT(6)
+#define MAX31785_FAN_CONFIG_PULSE(pulse)   (pulse << 4)
+#define MAX31785_DEFAULT_FAN_CONFIG_1_2(pulse) (MAX31785_FAN_CONFIG_ENABLE |\
+MAX31785_FAN_CONFIG_PULSE(pulse))
+#define MAX31785_DEFAULT_MFR_FAN_CONFIG     0x0000
+
+/* fan speed in RPM */
+#define MAX31785_DEFAULT_FAN_SPEED          0x7fff
+#define MAX31785_DEFAULT_FAN_STATUS         0x00
+
+#define MAX31785_DEFAULT_FAN_MAX_PWM        0x2710
+
+/*
+ * MAX31785State:
+ * @code: The command code received
+ * @page: Each page corresponds to a device monitored by the Max 31785
+ * The page register determines the available commands depending on device
+___________________________________________________________________________
+|   0   |  Fan Connected to PWM0                                            |
+|_______|___________________________________________________________________|
+|   1   |  Fan Connected to PWM1                                            |
+|_______|___________________________________________________________________|
+|   2   |  Fan Connected to PWM2                                            |
+|_______|___________________________________________________________________|
+|   3   |  Fan Connected to PWM3                                            |
+|_______|___________________________________________________________________|
+|   4   |  Fan Connected to PWM4                                            |
+|_______|___________________________________________________________________|
+|   5   |  Fan Connected to PWM5                                            |
+|_______|___________________________________________________________________|
+|   6   |  Remote Thermal Diode Connected to ADC 0                          |
+|_______|___________________________________________________________________|
+|   7   |  Remote Thermal Diode Connected to ADC 1                          |
+|_______|___________________________________________________________________|
+|   8   |  Remote Thermal Diode Connected to ADC 2                          |
+|_______|___________________________________________________________________|
+|   9   |  Remote Thermal Diode Connected to ADC 3                          |
+|_______|___________________________________________________________________|
+|  10   |  Remote Thermal Diode Connected to ADC 4                          |
+|_______|___________________________________________________________________|
+|  11   |  Remote Thermal Diode Connected to ADC 5                          |
+|_______|___________________________________________________________________|
+|  12   |  Internal Temperature Sensor                                      |
+|_______|___________________________________________________________________|
+|  13   |  Remote I2C Temperature Sensor with Address 0                     |
+|_______|___________________________________________________________________|
+|  14   |  Remote I2C Temperature Sensor with Address 1                     |
+|_______|___________________________________________________________________|
+|  15   |  Remote I2C Temperature Sensor with Address 2                     |
+|_______|___________________________________________________________________|
+|  16   |  Remote I2C Temperature Sensor with Address 3                     |
+|_______|___________________________________________________________________|
+|  17   |  Remote I2C Temperature Sensor with Address 4                     |
+|_______|___________________________________________________________________|
+|  17   |  Remote Voltage Connected to ADC0                                 |
+|_______|___________________________________________________________________|
+|  18   |  Remote Voltage Connected to ADC1                                 |
+|_______|___________________________________________________________________|
+|  19   |  Remote Voltage Connected to ADC2                                 |
+|_______|___________________________________________________________________|
+|  20   |  Remote Voltage Connected to ADC3                                 |
+|_______|___________________________________________________________________|
+|  21   |  Remote Voltage Connected to ADC4                                 |
+|_______|___________________________________________________________________|
+|  22   |  Remote Voltage Connected to ADC5                                 |
+|_______|___________________________________________________________________|
+|23-254 |  Reserved                                                         |
+|_______|___________________________________________________________________|
+|  255  |  Applies to all pages                                             |
+|_______|___________________________________________________________________|
+*/
+
+/*
+ * Place holder to save the max31785 mfr specific registers
+ */
+typedef struct MAX31785State {
+    PMBusDevice parent;
+    uint16_t mfr_mode[MAX31785_TOTAL_NUM_PAGES];
+    uint16_t vout_peak[MAX31785_TOTAL_NUM_PAGES];
+    uint16_t temperature_peak[MAX31785_TOTAL_NUM_PAGES];
+    uint16_t vout_min[MAX31785_TOTAL_NUM_PAGES];
+    uint8_t  fault_response[MAX31785_TOTAL_NUM_PAGES];
+    uint32_t time_count[MAX31785_TOTAL_NUM_PAGES];
+    uint16_t temp_sensor_config[MAX31785_TOTAL_NUM_PAGES];
+    uint16_t fan_config[MAX31785_TOTAL_NUM_PAGES];
+    uint16_t read_fan_pwm[MAX31785_TOTAL_NUM_PAGES];
+    uint16_t fan_fault_limit[MAX31785_TOTAL_NUM_PAGES];
+    uint16_t fan_warn_limit[MAX31785_TOTAL_NUM_PAGES];
+    uint16_t fan_run_time[MAX31785_TOTAL_NUM_PAGES];
+    uint16_t fan_pwm_avg[MAX31785_TOTAL_NUM_PAGES];
+    uint64_t fan_pwm2rpm[MAX31785_TOTAL_NUM_PAGES];
+    uint64_t mfr_location;
+    uint64_t mfr_date;
+    uint64_t mfr_serial;
+    uint16_t mfr_revision;
+} MAX31785State;
+
+static uint8_t max31785_read_byte(PMBusDevice *pmdev)
+{
+    MAX31785State *s = MAX31785(pmdev);
+    switch (pmdev->code) {
+
+    case PMBUS_FAN_CONFIG_1_2:
+        if (pmdev->page <= MAX31785_MAX_FAN_PAGE) {
+            pmbus_send8(pmdev, pmdev->pages[pmdev->page].fan_config_1_2);
+        }
+        break;
+
+    case PMBUS_FAN_COMMAND_1:
+        if (pmdev->page <= MAX31785_MAX_FAN_PAGE) {
+            pmbus_send16(pmdev, pmdev->pages[pmdev->page].fan_command_1);
+        }
+        break;
+
+    case PMBUS_READ_FAN_SPEED_1:
+        if (pmdev->page <= MAX31785_MAX_FAN_PAGE) {
+            pmbus_send16(pmdev, pmdev->pages[pmdev->page].read_fan_speed_1);
+        }
+        break;
+
+    case PMBUS_STATUS_FANS_1_2:
+        if (pmdev->page <= MAX31785_MAX_FAN_PAGE) {
+            pmbus_send16(pmdev, pmdev->pages[pmdev->page].status_fans_1_2);
+        }
+        break;
+
+    case PMBUS_MFR_REVISION:
+        pmbus_send16(pmdev, MAX31785_DEFAULT_MFR_REVISION);
+        break;
+
+    case PMBUS_MFR_ID:
+        pmbus_send8(pmdev, 0x4d); /* Maxim */
+        break;
+
+    case PMBUS_MFR_MODEL:
+        pmbus_send8(pmdev, 0x53);
+        break;
+
+    case PMBUS_MFR_LOCATION:
+        pmbus_send64(pmdev, s->mfr_location);
+        break;
+
+    case PMBUS_MFR_DATE:
+        pmbus_send64(pmdev, s->mfr_date);
+        break;
+
+    case PMBUS_MFR_SERIAL:
+        pmbus_send64(pmdev, s->mfr_serial);
+        break;
+
+    case MAX31785_MFR_MODE:
+        pmbus_send16(pmdev, s->mfr_mode[pmdev->page]);
+        break;
+
+    case MAX31785_MFR_VOUT_PEAK:
+        if ((pmdev->page >= MAX31785_MIN_ADC_VOLTAGE_PAGE) &&
+            (pmdev->page <= MAX31785_MAX_ADC_VOLTAGE_PAGE)) {
+            pmbus_send16(pmdev, s->vout_peak[pmdev->page]);
+        }
+        break;
+
+    case MAX31785_MFR_TEMPERATURE_PEAK:
+        if ((pmdev->page >= MAX31785_MIN_TEMP_PAGE) &&
+            (pmdev->page <= MAX31785_MAX_TEMP_PAGE)) {
+            pmbus_send16(pmdev, s->temperature_peak[pmdev->page]);
+        }
+        break;
+
+    case MAX31785_MFR_VOUT_MIN:
+        if ((pmdev->page >= MAX31785_MIN_ADC_VOLTAGE_PAGE) &&
+            (pmdev->page <= MAX31785_MAX_ADC_VOLTAGE_PAGE)) {
+            pmbus_send16(pmdev, s->vout_min[pmdev->page]);
+        }
+        break;
+
+    case MAX31785_MFR_FAULT_RESPONSE:
+        pmbus_send8(pmdev, s->fault_response[pmdev->page]);
+        break;
+
+    case MAX31785_MFR_TIME_COUNT: /* R/W 32 */
+        pmbus_send32(pmdev, s->time_count[pmdev->page]);
+        break;
+
+    case MAX31785_MFR_TEMP_SENSOR_CONFIG: /* R/W 16 */
+        if ((pmdev->page >= MAX31785_MIN_TEMP_PAGE) &&
+            (pmdev->page <= MAX31785_MAX_TEMP_PAGE)) {
+            pmbus_send16(pmdev, s->temp_sensor_config[pmdev->page]);
+        }
+        break;
+
+    case MAX31785_MFR_FAN_CONFIG: /* R/W 16 */
+        if (pmdev->page <= MAX31785_MAX_FAN_PAGE) {
+            pmbus_send16(pmdev, s->fan_config[pmdev->page]);
+        }
+        break;
+
+    case MAX31785_MFR_READ_FAN_PWM: /* R/W 16 */
+        if (pmdev->page <= MAX31785_MAX_FAN_PAGE) {
+            pmbus_send16(pmdev, s->read_fan_pwm[pmdev->page]);
+        }
+        break;
+
+    case MAX31785_MFR_FAN_FAULT_LIMIT: /* R/W 16 */
+        if (pmdev->page <= MAX31785_MAX_FAN_PAGE) {
+            pmbus_send16(pmdev, s->fan_fault_limit[pmdev->page]);
+        }
+        break;
+
+    case MAX31785_MFR_FAN_WARN_LIMIT: /* R/W 16 */
+        if (pmdev->page <= MAX31785_MAX_FAN_PAGE) {
+            pmbus_send16(pmdev, s->fan_warn_limit[pmdev->page]);
+        }
+        break;
+
+    case MAX31785_MFR_FAN_RUN_TIME: /* R/W 16 */
+        if (pmdev->page <= MAX31785_MAX_FAN_PAGE) {
+            pmbus_send16(pmdev, s->fan_run_time[pmdev->page]);
+        }
+        break;
+
+    case MAX31785_MFR_FAN_PWM_AVG: /* R/W 16 */
+        if (pmdev->page <= MAX31785_MAX_FAN_PAGE) {
+            pmbus_send16(pmdev, s->fan_pwm_avg[pmdev->page]);
+        }
+        break;
+
+    case MAX31785_MFR_FAN_PWM2RPM: /* R/W 64 */
+        if (pmdev->page <= MAX31785_MAX_FAN_PAGE) {
+            pmbus_send64(pmdev, s->fan_pwm2rpm[pmdev->page]);
+        }
+        break;
+
+    default:
+        qemu_log_mask(LOG_GUEST_ERROR,
+        "%s: reading from unsupported register: 0x%02x\n",
+        __func__, pmdev->code);
+        break;
+    }
+    return 0xFF;
+}
+
+static int max31785_write_data(PMBusDevice *pmdev, const uint8_t *buf,
+                                uint8_t len)
+{
+    MAX31785State *s = MAX31785(pmdev);
+    if (len == 0) {
+        qemu_log_mask(LOG_GUEST_ERROR, "%s: writing empty data\n", __func__);
+        return -1;
+    }
+
+    pmdev->code = buf[0]; /* PMBus command code */
+
+    if (len == 1) {
+        return 0;
+    }
+
+    /* Exclude command code from buffer */
+    buf++;
+    len--;
+
+    switch (pmdev->code) {
+
+    case PMBUS_FAN_CONFIG_1_2:
+        if (pmdev->page <= MAX31785_MAX_FAN_PAGE) {
+            pmdev->pages[pmdev->page].fan_config_1_2 = pmbus_receive8(pmdev);
+        }
+        break;
+
+    case PMBUS_FAN_COMMAND_1:
+        if (pmdev->page <= MAX31785_MAX_FAN_PAGE) {
+            pmdev->pages[pmdev->page].fan_command_1 = pmbus_receive16(pmdev);
+            pmdev->pages[pmdev->page].read_fan_speed_1 =
+                ((MAX31785_DEFAULT_FAN_SPEED / MAX31785_DEFAULT_FAN_MAX_PWM) *
+                pmdev->pages[pmdev->page].fan_command_1);
+        }
+        break;
+
+    case PMBUS_MFR_LOCATION: /* R/W 64 */
+        s->mfr_location = pmbus_receive64(pmdev);
+        break;
+
+    case PMBUS_MFR_DATE: /* R/W 64 */
+        s->mfr_date = pmbus_receive64(pmdev);
+        break;
+
+    case PMBUS_MFR_SERIAL: /* R/W 64 */
+        s->mfr_serial = pmbus_receive64(pmdev);
+        break;
+
+    case MAX31785_MFR_MODE: /* R/W word */
+        s->mfr_mode[pmdev->page] = pmbus_receive16(pmdev);
+        break;
+
+    case MAX31785_MFR_VOUT_PEAK: /* R/W word */
+        if ((pmdev->page >= MAX31785_MIN_ADC_VOLTAGE_PAGE) &&
+            (pmdev->page <= MAX31785_MAX_ADC_VOLTAGE_PAGE)) {
+            s->vout_peak[pmdev->page] = pmbus_receive16(pmdev);
+        }
+        break;
+
+    case MAX31785_MFR_TEMPERATURE_PEAK: /* R/W word */
+        if ((pmdev->page >= 6) && (pmdev->page <= 16)) {
+            s->temperature_peak[pmdev->page] = pmbus_receive16(pmdev);
+        }
+        break;
+
+    case MAX31785_MFR_VOUT_MIN: /* R/W word */
+        if ((pmdev->page >= MAX31785_MIN_ADC_VOLTAGE_PAGE) &&
+            (pmdev->page <= MAX31785_MAX_ADC_VOLTAGE_PAGE)) {
+            s->vout_min[pmdev->page] = pmbus_receive16(pmdev);
+        }
+        break;
+
+    case MAX31785_MFR_FAULT_RESPONSE: /* R/W 8 */
+        s->fault_response[pmdev->page] = pmbus_receive8(pmdev);
+        break;
+
+    case MAX31785_MFR_TIME_COUNT: /* R/W 32 */
+        s->time_count[pmdev->page] = pmbus_receive32(pmdev);
+        break;
+
+    case MAX31785_MFR_TEMP_SENSOR_CONFIG: /* R/W 16 */
+        if ((pmdev->page >= MAX31785_MIN_TEMP_PAGE) &&
+            (pmdev->page <= MAX31785_MAX_TEMP_PAGE)) {
+            s->temp_sensor_config[pmdev->page] = pmbus_receive16(pmdev);
+        }
+        break;
+
+    case MAX31785_MFR_FAN_CONFIG: /* R/W 16 */
+        if (pmdev->page <= MAX31785_MAX_FAN_PAGE) {
+            s->fan_config[pmdev->page] = pmbus_receive16(pmdev);
+        }
+        break;
+
+    case MAX31785_MFR_FAN_FAULT_LIMIT: /* R/W 16 */
+        if (pmdev->page <= MAX31785_MAX_FAN_PAGE) {
+            s->fan_fault_limit[pmdev->page] = pmbus_receive16(pmdev);
+        }
+        break;
+
+    case MAX31785_MFR_FAN_WARN_LIMIT: /* R/W 16 */
+        if (pmdev->page <= MAX31785_MAX_FAN_PAGE) {
+            s->fan_warn_limit[pmdev->page] = pmbus_receive16(pmdev);
+        }
+        break;
+
+    case MAX31785_MFR_FAN_RUN_TIME: /* R/W 16 */
+        if (pmdev->page <= MAX31785_MAX_FAN_PAGE) {
+            s->fan_run_time[pmdev->page] = pmbus_receive16(pmdev);
+        }
+        break;
+
+    case MAX31785_MFR_FAN_PWM_AVG: /* R/W 16 */
+        if (pmdev->page <= MAX31785_MAX_FAN_PAGE) {
+            s->fan_pwm_avg[pmdev->page] = pmbus_receive16(pmdev);
+        }
+        break;
+
+    case MAX31785_MFR_FAN_PWM2RPM: /* R/W 64 */
+        if (pmdev->page <= MAX31785_MAX_FAN_PAGE) {
+            s->fan_pwm2rpm[pmdev->page] = pmbus_receive64(pmdev);
+        }
+        break;
+
+    default:
+        qemu_log_mask(LOG_GUEST_ERROR,
+                      "%s: writing to unsupported register: 0x%02x\n",
+                      __func__, pmdev->code);
+        break;
+    }
+    return 0;
+}
+
+static void max31785_exit_reset(Object *obj)
+{
+    PMBusDevice *pmdev = PMBUS_DEVICE(obj);
+    MAX31785State *s = MAX31785(obj);
+
+    pmdev->capability = MAX31785_DEFAULT_CAPABILITY;
+
+    for (int i = MAX31785_MIN_FAN_PAGE; i <= MAX31785_MAX_FAN_PAGE; i++) {
+        pmdev->pages[i].vout_mode = MAX31785_DEFAULT_VOUT_MODE;
+        pmdev->pages[i].fan_command_1 = MAX31785_DEFAULT_FAN_COMMAND_1;
+        pmdev->pages[i].revision = MAX31785_DEFAULT_PMBUS_REVISION;
+        pmdev->pages[i].fan_config_1_2 = MAX31785_DEFAULT_FAN_CONFIG_1_2(0);
+        pmdev->pages[i].read_fan_speed_1 = MAX31785_DEFAULT_FAN_SPEED;
+        pmdev->pages[i].status_fans_1_2 = MAX31785_DEFAULT_FAN_STATUS;
+    }
+
+    for (int i = MAX31785_MIN_TEMP_PAGE; i <= MAX31785_MAX_TEMP_PAGE; i++) {
+        pmdev->pages[i].vout_mode = MAX31785_DEFAULT_VOUT_MODE;
+        pmdev->pages[i].revision = MAX31785_DEFAULT_PMBUS_REVISION;
+        pmdev->pages[i].ot_fault_limit = MAX31785_DEFAULT_OT_FAULT_LIMIT;
+        pmdev->pages[i].ot_warn_limit = MAX31785_DEFAULT_OT_WARN_LIMIT;
+    }
+
+    for (int i = MAX31785_MIN_ADC_VOLTAGE_PAGE;
+         i <= MAX31785_MAX_ADC_VOLTAGE_PAGE;
+         i++) {
+        pmdev->pages[i].vout_mode = MAX31785_DEFAULT_VOUT_MODE;
+        pmdev->pages[i].revision = MAX31785_DEFAULT_PMBUS_REVISION;
+        pmdev->pages[i].vout_scale_monitor =
+        MAX31785_DEFAULT_VOUT_SCALE_MONITOR;
+        pmdev->pages[i].vout_ov_fault_limit =
+        MAX31785_DEFAULT_OV_FAULT_LIMIT;
+        pmdev->pages[i].vout_ov_warn_limit =
+        MAX31785_DEFAULT_OV_WARN_LIMIT;
+    }
+
+    s->mfr_location = MAX31785_DEFAULT_TEXT;
+    s->mfr_date = MAX31785_DEFAULT_TEXT;
+    s->mfr_serial = MAX31785_DEFAULT_TEXT;
+}
+
+static const VMStateDescription vmstate_max31785 = {
+    .name = TYPE_MAX31785,
+    .version_id = 0,
+    .minimum_version_id = 0,
+    .fields = (VMStateField[]){
+        VMSTATE_PMBUS_DEVICE(parent, MAX31785State),
+        VMSTATE_UINT16_ARRAY(mfr_mode, MAX31785State,
+        MAX31785_TOTAL_NUM_PAGES),
+        VMSTATE_UINT16_ARRAY(vout_peak, MAX31785State,
+        MAX31785_TOTAL_NUM_PAGES),
+        VMSTATE_UINT16_ARRAY(temperature_peak, MAX31785State,
+        MAX31785_TOTAL_NUM_PAGES),
+        VMSTATE_UINT16_ARRAY(vout_min, MAX31785State,
+        MAX31785_TOTAL_NUM_PAGES),
+        VMSTATE_UINT8_ARRAY(fault_response, MAX31785State,
+        MAX31785_TOTAL_NUM_PAGES),
+        VMSTATE_UINT32_ARRAY(time_count, MAX31785State,
+        MAX31785_TOTAL_NUM_PAGES),
+        VMSTATE_UINT16_ARRAY(temp_sensor_config, MAX31785State,
+        MAX31785_TOTAL_NUM_PAGES),
+        VMSTATE_UINT16_ARRAY(fan_config, MAX31785State,
+        MAX31785_TOTAL_NUM_PAGES),
+        VMSTATE_UINT16_ARRAY(read_fan_pwm, MAX31785State,
+        MAX31785_TOTAL_NUM_PAGES),
+        VMSTATE_UINT16_ARRAY(fan_fault_limit, MAX31785State,
+        MAX31785_TOTAL_NUM_PAGES),
+        VMSTATE_UINT16_ARRAY(fan_warn_limit, MAX31785State,
+        MAX31785_TOTAL_NUM_PAGES),
+        VMSTATE_UINT16_ARRAY(fan_run_time, MAX31785State,
+        MAX31785_TOTAL_NUM_PAGES),
+        VMSTATE_UINT16_ARRAY(fan_pwm_avg, MAX31785State,
+        MAX31785_TOTAL_NUM_PAGES),
+        VMSTATE_UINT64_ARRAY(fan_pwm2rpm, MAX31785State,
+        MAX31785_TOTAL_NUM_PAGES),
+        VMSTATE_UINT64(mfr_location, MAX31785State),
+        VMSTATE_UINT64(mfr_date, MAX31785State),
+        VMSTATE_UINT64(mfr_serial, MAX31785State),
+        VMSTATE_END_OF_LIST()
+    }
+};
+
+static void max31785_init(Object *obj)
+{
+    PMBusDevice *pmdev = PMBUS_DEVICE(obj);
+
+    for (int i = MAX31785_MIN_FAN_PAGE; i <= MAX31785_MAX_FAN_PAGE; i++) {
+        pmbus_page_config(pmdev, i, PB_HAS_VOUT_MODE);
+    }
+
+    for (int i = MAX31785_MIN_TEMP_PAGE; i <= MAX31785_MAX_TEMP_PAGE; i++) {
+        pmbus_page_config(pmdev, i, PB_HAS_VOUT_MODE | PB_HAS_TEMPERATURE);
+    }
+
+    for (int i = MAX31785_MIN_ADC_VOLTAGE_PAGE;
+        i <= MAX31785_MAX_ADC_VOLTAGE_PAGE;
+        i++) {
+        pmbus_page_config(pmdev, i, PB_HAS_VOUT_MODE | PB_HAS_VOUT |
+                                    PB_HAS_VOUT_RATING);
+    }
+}
+
+static void max31785_class_init(ObjectClass *klass, void *data)
+{
+    ResettableClass *rc = RESETTABLE_CLASS(klass);
+    DeviceClass *dc = DEVICE_CLASS(klass);
+    PMBusDeviceClass *k = PMBUS_DEVICE_CLASS(klass);
+    dc->desc = "Maxim MAX31785 6-Channel Fan Controller";
+    dc->vmsd = &vmstate_max31785;
+    k->write_data = max31785_write_data;
+    k->receive_byte = max31785_read_byte;
+    k->device_num_pages = MAX31785_TOTAL_NUM_PAGES;
+    rc->phases.exit = max31785_exit_reset;
+}
+
+static const TypeInfo max31785_info = {
+    .name = TYPE_MAX31785,
+    .parent = TYPE_PMBUS_DEVICE,
+    .instance_size = sizeof(MAX31785State),
+    .instance_init = max31785_init,
+    .class_init = max31785_class_init,
+};
+
+static void max31785_register_types(void)
+{
+    type_register_static(&max31785_info);
+}
+
+type_init(max31785_register_types)
diff --git a/hw/sensor/meson.build b/hw/sensor/meson.build
index 12b6992bc845..9e9be602c349 100644
--- a/hw/sensor/meson.build
+++ b/hw/sensor/meson.build
@@ -6,3 +6,4 @@ softmmu_ss.add(when: 'CONFIG_ADM1272', if_true: files('adm1272.c'))
 softmmu_ss.add(when: 'CONFIG_MAX34451', if_true: files('max34451.c'))
 softmmu_ss.add(when: 'CONFIG_LSM303DLHC_MAG', if_true: files('lsm303dlhc_mag.c'))
 softmmu_ss.add(when: 'CONFIG_ISL_PMBUS_VR', if_true: files('isl_pmbus_vr.c'))
+softmmu_ss.add(when: 'CONFIG_MAX31785', if_true: files('max31785.c'))
-- 
2.25.1


