Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C15BE516BB6
	for <lists+qemu-devel@lfdr.de>; Mon,  2 May 2022 10:12:30 +0200 (CEST)
Received: from localhost ([::1]:41254 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nlRAS-0000ij-Ev
	for lists+qemu-devel@lfdr.de; Mon, 02 May 2022 04:12:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41234)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=6121c6eaaf=pdel@fb.com>)
 id 1nlR7E-0007VE-Lt
 for qemu-devel@nongnu.org; Mon, 02 May 2022 04:09:08 -0400
Received: from mx0a-00082601.pphosted.com ([67.231.145.42]:5124)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=6121c6eaaf=pdel@fb.com>)
 id 1nlR7B-00029h-Cv
 for qemu-devel@nongnu.org; Mon, 02 May 2022 04:09:08 -0400
Received: from pps.filterd (m0044012.ppops.net [127.0.0.1])
 by mx0a-00082601.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 241FsqDU029555
 for <qemu-devel@nongnu.org>; Mon, 2 May 2022 01:09:00 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com;
 h=from : to : cc : subject
 : date : message-id : content-type : content-transfer-encoding :
 mime-version; s=facebook; bh=/dKFbuJv6UUirCGfdhvLgPuuwgxXwvqnFkZ+F36HIpk=;
 b=S7SSKBzcosOFtFZUcaBq1sO4ITaXUUCEw8FNrnrKUVdry3LHYYjYCo2WebBgLXQsSxyj
 J4OZ4kQlvSEMOS2rkpCN98aexKenkr+/hOg4YDWZg9xntEJV6d1vg0WxiWmiCpg17TOd
 dFMr3/koC3cMeO94EHifuyIxdnFt9KySThY= 
Received: from mail.thefacebook.com ([163.114.132.120])
 by mx0a-00082601.pphosted.com (PPS) with ESMTPS id 3fs2tmynem-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <qemu-devel@nongnu.org>; Mon, 02 May 2022 01:09:00 -0700
Received: from twshared18213.14.prn3.facebook.com (2620:10d:c085:108::4) by
 mail.thefacebook.com (2620:10d:c085:21d::5) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Mon, 2 May 2022 01:09:00 -0700
Received: by devvm9194.prn0.facebook.com (Postfix, from userid 385188)
 id 90F934E6FBCB; Mon,  2 May 2022 01:08:47 -0700 (PDT)
From: Peter Delevoryas <pdel@fb.com>
To: 
CC: <pdel@fb.com>, <qemu-arm@nongnu.org>, <qemu-devel@nongnu.org>,
 <clg@kaod.org>, <andrew@aj.id.au>, <rashmica.g@gmail.com>
Subject: [PATCH] hw/gpio/aspeed_gpio: Fix QOM pin property
Date: Mon, 2 May 2022 01:08:27 -0700
Message-ID: <20220502080827.244815-1-pdel@fb.com>
X-Mailer: git-send-email 2.30.2
X-FB-Internal: Safe
Content-Type: text/plain
X-Proofpoint-GUID: rjL6Fi6SJRs0d4WyZiakx16UoollJ8Aa
X-Proofpoint-ORIG-GUID: rjL6Fi6SJRs0d4WyZiakx16UoollJ8Aa
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.858,Hydra:6.0.486,FMLib:17.11.64.514
 definitions=2022-05-02_02,2022-04-28_01,2022-02-23_01
Received-SPF: pass client-ip=67.231.145.42;
 envelope-from=prvs=6121c6eaaf=pdel@fb.com; helo=mx0a-00082601.pphosted.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

I was setting gpioV4-7 to "1110" using the QOM pin property handler and
noticed that lowering gpioV7 was inadvertently lowering gpioV4-6 too.

    (qemu) qom-set /machine/soc/gpio gpioV4 true
    (qemu) qom-set /machine/soc/gpio gpioV5 true
    (qemu) qom-set /machine/soc/gpio gpioV6 true
    (qemu) qom-get /machine/soc/gpio gpioV4
    true
    (qemu) qom-set /machine/soc/gpio gpioV7 false
    (qemu) qom-get /machine/soc/gpio gpioV4
    false

An expression in aspeed_gpio_set_pin_level was using a logical NOT
operator instead of a bitwise NOT operator:

    value &=3D !pin_mask;

The original author probably intended to make a bitwise NOT expression
"~", but mistakenly used a logical NOT operator "!" instead. Some
programming languages like Rust use "!" for both purposes.

Fixes: 4b7f956862dc ("hw/gpio: Add basic Aspeed GPIO model for AST2400 and
AST2500")
Signed-off-by: Peter Delevoryas <pdel@fb.com>
---
 hw/gpio/aspeed_gpio.c          |  2 +-
 tests/qtest/aspeed_gpio-test.c | 87 ++++++++++++++++++++++++++++++++++
 tests/qtest/meson.build        |  3 +-
 3 files changed, 90 insertions(+), 2 deletions(-)
 create mode 100644 tests/qtest/aspeed_gpio-test.c

diff --git a/hw/gpio/aspeed_gpio.c b/hw/gpio/aspeed_gpio.c
index c63634d3d3..9b736e7a9f 100644
--- a/hw/gpio/aspeed_gpio.c
+++ b/hw/gpio/aspeed_gpio.c
@@ -312,7 +312,7 @@ static void aspeed_gpio_set_pin_level(AspeedGPIOState *=
s, uint32_t set_idx,
     if (level) {
         value |=3D pin_mask;
     } else {
-        value &=3D !pin_mask;
+        value &=3D ~pin_mask;
     }
=20
     aspeed_gpio_update(s, &s->sets[set_idx], value);
diff --git a/tests/qtest/aspeed_gpio-test.c b/tests/qtest/aspeed_gpio-test.c
new file mode 100644
index 0000000000..c1003f2d1b
--- /dev/null
+++ b/tests/qtest/aspeed_gpio-test.c
@@ -0,0 +1,87 @@
+/*
+ * QTest testcase for the Aspeed GPIO Controller.
+ *
+ * Copyright (c) Meta Platforms, Inc. and affiliates. (http://www.meta.com)
+ *
+ * Permission is hereby granted, free of charge, to any person obtaining a=
 copy
+ * of this software and associated documentation files (the "Software"), t=
o deal
+ * in the Software without restriction, including without limitation the r=
ights
+ * to use, copy, modify, merge, publish, distribute, sublicense, and/or se=
ll
+ * copies of the Software, and to permit persons to whom the Software is
+ * furnished to do so, subject to the following conditions:
+ *
+ * The above copyright notice and this permission notice shall be included=
 in
+ * all copies or substantial portions of the Software.
+ *
+ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS=
 OR
+ * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
+ * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL
+ * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OT=
HER
+ * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING=
 FROM,
+ * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS =
IN
+ * THE SOFTWARE.
+ */
+
+#include "qemu/osdep.h"
+#include "qemu/bitops.h"
+#include "qemu/timer.h"
+#include "qapi/qmp/qdict.h"
+#include "libqtest-single.h"
+
+static bool qom_get_bool(QTestState *s, const char *path, const char *prop=
erty)
+{
+    QDict *r;
+    bool b;
+
+    r =3D qtest_qmp(s, "{ 'execute': 'qom-get', 'arguments': "
+                     "{ 'path': %s, 'property': %s } }", path, property);
+    b =3D qdict_get_bool(r, "return");
+    qobject_unref(r);
+
+    return b;
+}
+
+static void qom_set_bool(QTestState *s, const char *path, const char *prop=
erty,
+                         bool value)
+{
+    QDict *r;
+
+    r =3D qtest_qmp(s, "{ 'execute': 'qom-set', 'arguments': "
+                     "{ 'path': %s, 'property': %s, 'value': %i } }",
+                     path, property, value);
+    qobject_unref(r);
+}
+
+static void test_set_colocated_pins(const void *data)
+{
+    QTestState *s =3D (QTestState *)data;
+
+    /*
+     * gpioV4-7 occupy bits within a single 32-bit value, so we want to ma=
ke
+     * sure that modifying one doesn't affect the other.
+     */
+    qom_set_bool(s, "/machine/soc/gpio", "gpioV4", true);
+    qom_set_bool(s, "/machine/soc/gpio", "gpioV5", false);
+    qom_set_bool(s, "/machine/soc/gpio", "gpioV6", true);
+    qom_set_bool(s, "/machine/soc/gpio", "gpioV7", false);
+    g_assert(qom_get_bool(s, "/machine/soc/gpio", "gpioV4"));
+    g_assert(!qom_get_bool(s, "/machine/soc/gpio", "gpioV5"));
+    g_assert(qom_get_bool(s, "/machine/soc/gpio", "gpioV6"));
+    g_assert(!qom_get_bool(s, "/machine/soc/gpio", "gpioV7"));
+}
+
+int main(int argc, char **argv)
+{
+    QTestState *s;
+    int r;
+
+    g_test_init(&argc, &argv, NULL);
+
+    s =3D qtest_init("-machine ast2600-evb");
+    qtest_add_data_func("/ast2600/gpio/set_colocated_pins", s,
+                        test_set_colocated_pins);
+    r =3D g_test_run();
+    qtest_quit(s);
+
+    return r;
+}
diff --git a/tests/qtest/meson.build b/tests/qtest/meson.build
index 6b9807c183..32fb8cf755 100644
--- a/tests/qtest/meson.build
+++ b/tests/qtest/meson.build
@@ -189,7 +189,8 @@ qtests_npcm7xx =3D \
    (slirp.found() ? ['npcm7xx_emc-test'] : [])
 qtests_aspeed =3D \
   ['aspeed_hace-test',
-   'aspeed_smc-test']
+   'aspeed_smc-test',
+   'aspeed_gpio-test']
 qtests_arm =3D \
   (config_all_devices.has_key('CONFIG_MPS2') ? ['sse-timer-test'] : []) + \
   (config_all_devices.has_key('CONFIG_CMSDK_APB_DUALTIMER') ? ['cmsdk-apb-=
dualtimer-test'] : []) + \
--=20
2.30.2


