Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 21E8B48691D
	for <lists+qemu-devel@lfdr.de>; Thu,  6 Jan 2022 18:49:06 +0100 (CET)
Received: from localhost ([::1]:49096 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n5Wsq-0005G5-MJ
	for lists+qemu-devel@lfdr.de; Thu, 06 Jan 2022 12:49:04 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51126)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3CinXYQcKCs0Ex6CDAxz77z4x.v759x5D-wxEx4676z6D.7Az@flex--venture.bounces.google.com>)
 id 1n5Wnc-0001hk-7u
 for qemu-devel@nongnu.org; Thu, 06 Jan 2022 12:43:40 -0500
Received: from [2607:f8b0:4864:20::b4a] (port=43620
 helo=mail-yb1-xb4a.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3CinXYQcKCs0Ex6CDAxz77z4x.v759x5D-wxEx4676z6D.7Az@flex--venture.bounces.google.com>)
 id 1n5WnT-0006pd-15
 for qemu-devel@nongnu.org; Thu, 06 Jan 2022 12:43:33 -0500
Received: by mail-yb1-xb4a.google.com with SMTP id
 66-20020a251245000000b0060d05da9c4eso6252917ybs.10
 for <qemu-devel@nongnu.org>; Thu, 06 Jan 2022 09:43:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=date:message-id:mime-version:subject:from:to:cc;
 bh=WtSFX+ktM8sOR4JoroSKrO/7dLHndbwnIyityhKTkG8=;
 b=FVY3YpKkvT/I5N154Hd4J+LupmmCudJ7Ieo2vkDOkcNWp9M7xfRNwyPOac17GoqyeG
 VRffjWk+m4uFdttAMJAVJpjuFgXKWhdDkowlWxC4RLSt/Bj5CwIJsHjJNgaesuzpW3Fb
 tgaugqgFCx590JM5b4aXesl6Ab+OICo0VZrgzJmzSwchQXlD3Tqlcf0ONIIQxVda1q2x
 RDgXc7fVzIqwCtG/vtMKw+KBZvy/ZGeGGkvUPBTQLSd/irkWzlvDtEYAgDQvaG4+F6K7
 3QF8hzcyj9ey9/QcybZ0Td6TB3Cg2KCx1NbypMw7r2qPdGYw4GcL9I42l/qPcX53EYgV
 NOnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
 bh=WtSFX+ktM8sOR4JoroSKrO/7dLHndbwnIyityhKTkG8=;
 b=LqzdUq94VzAS40j1COfZKWMureNfcs4BWamdF+k3ozWZkInG/NQPtesM+dHg6OuUHJ
 bJ+N7qEXJWPQZSr+HDG8Qq8HqivqDbHcvwFRzxAbFM/YrX2MojMj1kDxnQ6SmfjLjB4R
 9P+hDaqEPQE8ZcoqK6gsa9pY5DFOQz/AZeyAEeUDW6BdJIS2ZbhbmHQTLJyQHfORHZ+n
 BuwNyBdnez55zHgZk2To1glfAJR5EXkKAvOsLpmutd87CF1PC6NfRvMwtEnJKpvmTjF5
 8KtKPnTwilfAggmoX3cSmEoKumhQXREgSgO8BFMdDWg2pHjae93cKQgOgvpG1VcIDtjE
 d0kA==
X-Gm-Message-State: AOAM533lhUdefOl6nI4S35b4amP5WcREWM6CW/eZNMDIvywE2OVJX7ix
 CHQrAnuHXCkAwTm29xKZftC1WCVylxPc
X-Google-Smtp-Source: ABdhPJzr3scMl1jxeLvWF1t54ZvW3tHkYMErenTPS9M1CYvJxdDYNzTYW12iMQomNDEh7k5Hmdyl48+c+KPK
X-Received: from venture.svl.corp.google.com
 ([2620:15c:2a3:200:9986:338a:477f:1df7])
 (user=venture job=sendgmr) by 2002:a25:361d:: with SMTP id
 d29mr74378923yba.270.1641490698008; Thu, 06 Jan 2022 09:38:18 -0800 (PST)
Date: Thu,  6 Jan 2022 09:38:14 -0800
Message-Id: <20220106173814.3580141-1-venture@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.34.1.448.ga2b2bfdf31-goog
Subject: [PATCH] hw/sensor: enable setting adm1272 temperature with qmp
From: Patrick Venture <venture@google.com>
To: thuth@redhat.com, lvivier@redhat.com, pbonzini@redhat.com, 
 cminyard@mvista.com
Cc: qemu-devel@nongnu.org, Titus Rwantare <titusr@google.com>, 
 Patrick Venture <venture@google.com>, Chris Rauer <crauer@google.com>,
 Hao Wu <wuhaotsh@google.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::b4a
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::b4a;
 envelope-from=3CinXYQcKCs0Ex6CDAxz77z4x.v759x5D-wxEx4676z6D.7Az@flex--venture.bounces.google.com;
 helo=mail-yb1-xb4a.google.com
X-Spam_score_int: -87
X-Spam_score: -8.8
X-Spam_bar: --------
X-Spam_report: (-8.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, USER_IN_DEF_DKIM_WL=-7.5 autolearn=no autolearn_force=no
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

From: Titus Rwantare <titusr@google.com>

Reviewed-by: Patrick Venture <venture@google.com>
Reviewed-by: Chris Rauer <crauer@google.com>
Reviewed-by: Hao Wu <wuhaotsh@google.com>
Signed-off-by: Titus Rwantare <titusr@google.com>
---
 hw/sensor/adm1272.c        | 27 ++++++++++++++++++++++++++-
 tests/qtest/adm1272-test.c | 28 +++++++++++++++++++++++++++-
 2 files changed, 53 insertions(+), 2 deletions(-)

diff --git a/hw/sensor/adm1272.c b/hw/sensor/adm1272.c
index 7310c769be..77a3d8eccf 100644
--- a/hw/sensor/adm1272.c
+++ b/hw/sensor/adm1272.c
@@ -66,6 +66,7 @@
 #define ADM1272_VOLTAGE_COEFF_DEFAULT   1
 #define ADM1272_CURRENT_COEFF_DEFAULT   3
 #define ADM1272_PWR_COEFF_DEFAULT       7
+#define ADM1272_TEMP_COEFF_DEFAULT      8
 #define ADM1272_IOUT_OFFSET             0x5000
 #define ADM1272_IOUT_OFFSET             0x5000
 
@@ -186,6 +187,22 @@ static uint32_t adm1272_direct_to_watts(uint16_t value)
     return pmbus_direct_mode2data(c, value);
 }
 
+static uint16_t adm1272_millidegrees_to_direct(uint32_t value)
+{
+    PMBusCoefficients c = adm1272_coefficients[ADM1272_TEMP_COEFF_DEFAULT];
+    c.b = c.b * 1000;
+    c.R = c.R - 3;
+    return pmbus_data2direct_mode(c, value);
+}
+
+static uint32_t adm1272_direct_to_millidegrees(uint16_t value)
+{
+    PMBusCoefficients c = adm1272_coefficients[ADM1272_TEMP_COEFF_DEFAULT];
+    c.b = c.b * 1000;
+    c.R = c.R - 3;
+    return pmbus_direct_mode2data(c, value);
+}
+
 static void adm1272_exit_reset(Object *obj)
 {
     ADM1272State *s = ADM1272(obj);
@@ -220,7 +237,7 @@ static void adm1272_exit_reset(Object *obj)
         = adm1272_millivolts_to_direct(ADM1272_VOLT_DEFAULT);
     pmdev->pages[0].read_iout
         = adm1272_milliamps_to_direct(ADM1272_IOUT_DEFAULT);
-    pmdev->pages[0].read_temperature_1 = 0;
+    pmdev->pages[0].read_temperature_1 = adm1272_millidegrees_to_direct(30000);
     pmdev->pages[0].read_pin = adm1272_watts_to_direct(ADM1272_PWR_DEFAULT);
     pmdev->pages[0].revision = ADM1272_PMBUS_REVISION_DEFAULT;
     pmdev->pages[0].mfr_id = ADM1272_MFR_ID_DEFAULT;
@@ -423,6 +440,8 @@ static void adm1272_get(Object *obj, Visitor *v, const char *name, void *opaque,
         value = adm1272_direct_to_milliamps(*(uint16_t *)opaque);
     } else if (strcmp(name, "pin") == 0) {
         value = adm1272_direct_to_watts(*(uint16_t *)opaque);
+    } else if (strcmp(name, "temperature") == 0) {
+        value = adm1272_direct_to_millidegrees(*(uint16_t *)opaque);
     } else {
         value = *(uint16_t *)opaque;
     }
@@ -447,6 +466,8 @@ static void adm1272_set(Object *obj, Visitor *v, const char *name, void *opaque,
         *internal = adm1272_milliamps_to_direct(value);
     } else if (strcmp(name, "pin") == 0) {
         *internal = adm1272_watts_to_direct(value);
+    } else if (strcmp(name, "temperature") == 0) {
+        *internal = adm1272_millidegrees_to_direct(value);
     } else {
         *internal = value;
     }
@@ -510,6 +531,10 @@ static void adm1272_init(Object *obj)
                         adm1272_get,
                         adm1272_set, NULL, &pmdev->pages[0].read_pin);
 
+    object_property_add(obj, "temperature", "uint16",
+                        adm1272_get,
+                        adm1272_set, NULL, &pmdev->pages[0].read_temperature_1);
+
 }
 
 static void adm1272_class_init(ObjectClass *klass, void *data)
diff --git a/tests/qtest/adm1272-test.c b/tests/qtest/adm1272-test.c
index 63f8514801..98134aabd2 100644
--- a/tests/qtest/adm1272-test.c
+++ b/tests/qtest/adm1272-test.c
@@ -65,6 +65,7 @@
 #define ADM1272_VOLTAGE_COEFF_DEFAULT   1
 #define ADM1272_CURRENT_COEFF_DEFAULT   3
 #define ADM1272_PWR_COEFF_DEFAULT       7
+#define ADM1272_TEMP_COEFF_DEFAULT      8
 #define ADM1272_IOUT_OFFSET             0x5000
 #define ADM1272_IOUT_OFFSET             0x5000
 
@@ -144,6 +145,22 @@ static uint32_t adm1272_direct_to_watts(uint16_t value)
     return pmbus_direct_mode2data(c, value);
 }
 
+static uint16_t adm1272_millidegrees_to_direct(uint32_t value)
+{
+    PMBusCoefficients c = adm1272_coefficients[ADM1272_TEMP_COEFF_DEFAULT];
+    c.b = c.b * 1000;
+    c.R = c.R - 3;
+    return pmbus_data2direct_mode(c, value);
+}
+
+static uint32_t adm1272_direct_to_millidegrees(uint16_t value)
+{
+    PMBusCoefficients c = adm1272_coefficients[ADM1272_TEMP_COEFF_DEFAULT];
+    c.b = c.b * 1000;
+    c.R = c.R - 3;
+    return pmbus_direct_mode2data(c, value);
+}
+
 static uint16_t qmp_adm1272_get(const char *id, const char *property)
 {
     QDict *response;
@@ -248,7 +265,7 @@ static void test_defaults(void *obj, void *data, QGuestAllocator *alloc)
 /* test qmp access */
 static void test_tx_rx(void *obj, void *data, QGuestAllocator *alloc)
 {
-    uint16_t i2c_value, value, i2c_voltage, i2c_pwr, lossy_value;
+    uint16_t i2c_value, value, i2c_voltage, i2c_pwr, i2c_temp, lossy_value;
     QI2CDevice *i2cdev = (QI2CDevice *)obj;
 
     /* converting to direct mode is lossy - we generate the same loss here */
@@ -287,6 +304,15 @@ static void test_tx_rx(void *obj, void *data, QGuestAllocator *alloc)
     i2c_pwr = adm1272_direct_to_watts(i2c_value);
     g_assert_cmphex(value, ==, i2c_pwr);
     g_assert_cmphex(i2c_pwr, ==, lossy_value);
+
+    lossy_value =
+        adm1272_direct_to_millidegrees(adm1272_millidegrees_to_direct(25000));
+    qmp_adm1272_set(TEST_ID, "temperature", 25000);
+    value = qmp_adm1272_get(TEST_ID, "temperature");
+    i2c_value = adm1272_i2c_get16(i2cdev, PMBUS_READ_TEMPERATURE_1);
+    i2c_temp = adm1272_direct_to_millidegrees(i2c_value);
+    g_assert_cmphex(value, ==, i2c_temp);
+    g_assert_cmphex(i2c_temp, ==, lossy_value);
 }
 
 /* test r/w registers */
-- 
2.34.1.448.ga2b2bfdf31-goog


