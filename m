Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 18DB955BC55
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Jun 2022 00:37:17 +0200 (CEST)
Received: from localhost ([::1]:45082 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o5xM3-0005co-JY
	for lists+qemu-devel@lfdr.de; Mon, 27 Jun 2022 18:37:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44232)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=71779173e5=pdel@fb.com>)
 id 1o5xHR-0003Is-CP
 for qemu-devel@nongnu.org; Mon, 27 Jun 2022 18:32:31 -0400
Received: from mx0b-00082601.pphosted.com ([67.231.153.30]:18502
 helo=mx0a-00082601.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=71779173e5=pdel@fb.com>)
 id 1o5xHD-0006TX-GX
 for qemu-devel@nongnu.org; Mon, 27 Jun 2022 18:32:27 -0400
Received: from pps.filterd (m0001303.ppops.net [127.0.0.1])
 by m0001303.ppops.net (8.17.1.5/8.17.1.5) with ESMTP id 25RJ1QEL018645
 for <qemu-devel@nongnu.org>; Mon, 27 Jun 2022 15:32:10 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : content-type :
 content-transfer-encoding : mime-version; s=facebook;
 bh=gccUFSTo96dsG615Bu1uuwt3K7S8tUa8Hwp9OxZ4RAo=;
 b=SLkSs64EuL7iTJdVwan4K8HJkfIE0vFa4SmBpNlRDunQJ+FmP/ZWJ2gPKkbOjm3WejNe
 IuzDEO99FeMrSY0FHErfKv0+z+dFv/1HpV1ZMcXTtoNBz8k2vfrjCUi5T1cxtlU2stKL
 +UdGqSuJFOLxlEQWMdNvpVmjwudLzuVfU0E= 
Received: from mail.thefacebook.com ([163.114.132.120])
 by m0001303.ppops.net (PPS) with ESMTPS id 3gwx1v64jp-2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <qemu-devel@nongnu.org>; Mon, 27 Jun 2022 15:32:10 -0700
Received: from twshared18443.03.prn6.facebook.com (2620:10d:c085:208::f) by
 mail.thefacebook.com (2620:10d:c085:11d::7) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.28; Mon, 27 Jun 2022 15:32:08 -0700
Received: by devvm9194.prn0.facebook.com (Postfix, from userid 385188)
 id 9DD3A8D319B8; Mon, 27 Jun 2022 15:32:04 -0700 (PDT)
From: Peter Delevoryas <pdel@fb.com>
To: 
CC: <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>, Peter Delevoryas
 <pdel@fb.com>
Subject: [PATCH 12/14] hw/misc: Add intel-me
Date: Mon, 27 Jun 2022 15:27:35 -0700
Message-ID: <20220627222737.1011989-1-pdel@fb.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220627195506.403715-1-pdel@fb.com>
References: <20220627195506.403715-1-pdel@fb.com>
X-FB-Internal: Safe
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: 2m-w1EHh3A50TZjjuerLx96b2w2ISbTC
X-Proofpoint-GUID: 2m-w1EHh3A50TZjjuerLx96b2w2ISbTC
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-06-27_06,2022-06-24_01,2022-06-22_01
Received-SPF: pass client-ip=67.231.153.30;
 envelope-from=prvs=71779173e5=pdel@fb.com; helo=mx0a-00082601.pphosted.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

Signed-off-by: Peter Delevoryas <pdel@fb.com>
---
 hw/arm/aspeed.c     |   1 +
 hw/misc/intel_me.c  | 176 ++++++++++++++++++++++++++++++++++++++++++++
 hw/misc/meson.build |   3 +-
 3 files changed, 179 insertions(+), 1 deletion(-)
 create mode 100644 hw/misc/intel_me.c

diff --git a/hw/arm/aspeed.c b/hw/arm/aspeed.c
index 2b9c1600c6..88e9a47dc2 100644
--- a/hw/arm/aspeed.c
+++ b/hw/arm/aspeed.c
@@ -1447,6 +1447,7 @@ static void oby35_cl_i2c_init(AspeedMachineState *bmc)
     i2c_slave_create_simple(i2c[1], "tmp105", 0x4a);
     i2c_slave_create_simple(i2c[1], "adm1272", 0x40);
     i2c_slave_create_simple(i2c[1], "tmp421", 0x4c);
+    i2c_slave_create_simple(i2c[2], "intel-me", 0x16);
     i2c_slave_create_simple(i2c[4], "isl69259", 0x76);
     i2c_slave_create_simple(i2c[4], "isl69259", 0x62);
     i2c_slave_create_simple(i2c[4], "isl69259", 0x60);
diff --git a/hw/misc/intel_me.c b/hw/misc/intel_me.c
new file mode 100644
index 0000000000..fdc9180c26
--- /dev/null
+++ b/hw/misc/intel_me.c
@@ -0,0 +1,176 @@
+/*
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
+#include "qemu/main-loop.h"
+#include "hw/i2c/i2c.h"
+
+#define TYPE_INTEL_ME "intel-me"
+OBJECT_DECLARE_SIMPLE_TYPE(IntelMEState, INTEL_ME);
+
+#define printf(...)
+
+struct IntelMEState {
+    I2CSlave parent_obj;
+
+    I2CBus *bus;
+    QEMUBH *bh;
+    int rx_len;
+    int tx_len;
+    int tx_pos;
+    uint8_t rx_buf[512];
+    uint8_t tx_buf[512];
+};
+
+static void intel_me_bh(void *opaque)
+{
+    IntelMEState *s =3D opaque;
+
+    assert(s->bus->bh =3D=3D s->bh);
+
+    if (s->tx_pos =3D=3D 0) {
+        if (i2c_start_send_async(s->bus, s->tx_buf[s->tx_pos++]) !=3D 0) {
+            goto done;
+        }
+        return;
+    }
+
+    if (s->tx_pos < s->tx_len) {
+        if (i2c_send_async(s->bus, s->tx_buf[s->tx_pos++]) !=3D 0) {
+            goto done;
+        }
+        return;
+    }
+
+done:
+    i2c_end_transfer(s->bus);
+    i2c_bus_release(s->bus);
+    s->tx_len =3D 0;
+    s->tx_pos =3D 0;
+    memset(s->tx_buf, 0, sizeof(s->tx_buf));
+}
+
+static void intel_me_realize(DeviceState *dev, Error **errp)
+{
+    IntelMEState *s =3D INTEL_ME(dev);
+
+    s->bus =3D I2C_BUS(qdev_get_parent_bus(dev));
+    s->bh =3D qemu_bh_new(intel_me_bh, s);
+    s->rx_len =3D 0;
+    s->tx_len =3D 0;
+    s->tx_pos =3D 0;
+    memset(s->rx_buf, 0, sizeof(s->rx_buf));
+    memset(s->tx_buf, 0, sizeof(s->tx_buf));
+}
+
+static uint8_t checksum(const uint8_t *ptr, int len)
+{
+    int sum =3D 0;
+
+    for (int i =3D 0; i < len; i++) {
+        sum +=3D ptr[i];
+    }
+
+    return 256 - sum;
+}
+
+static int intel_me_i2c_event(I2CSlave *i2c, enum i2c_event event)
+{
+    IntelMEState *s =3D INTEL_ME(i2c);
+
+    switch (event) {
+    case I2C_START_RECV:
+        break;
+    case I2C_START_SEND:
+        s->rx_len =3D 0;
+        memset(s->rx_buf, 0, sizeof(s->rx_buf));
+        break;
+    case I2C_START_SEND_ASYNC:
+        break;
+    case I2C_FINISH:
+        printf("IntelME rx: [");
+        for (int i =3D 0; i < s->rx_len; i++) {
+            if (i) {
+                printf(", ");
+            }
+            printf("0x%02x", s->rx_buf[i]);
+        }
+        printf("]\n");
+
+        s->tx_len =3D 10;
+        s->tx_pos =3D 0;
+        s->tx_buf[0] =3D s->rx_buf[2];
+        s->tx_buf[1] =3D ((s->rx_buf[0] >> 2) + 1) << 2;
+        s->tx_buf[2] =3D 256 - s->tx_buf[0] - s->tx_buf[1];
+        s->tx_buf[3] =3D i2c->address; // rsSA response Slave Address
+        s->tx_buf[4] =3D (s->rx_buf[3] >> 2) << 2; // sequence number
+        s->tx_buf[5] =3D s->rx_buf[4]; // Same command code
+        s->tx_buf[6] =3D 0x00; // OK
+        s->tx_buf[7] =3D 0x55; // NO_ERROR
+        s->tx_buf[8] =3D 0x00;
+        s->tx_buf[9] =3D checksum(s->tx_buf, s->tx_len - 1);
+        s->tx_buf[0] >>=3D 1;
+        i2c_bus_master(s->bus, s->bh);
+        break;
+    case I2C_NACK:
+        break;
+    }
+
+    return 0;
+}
+
+static uint8_t intel_me_i2c_recv(I2CSlave *i2c)
+{
+    return 0xff;
+}
+
+static int intel_me_i2c_send(I2CSlave *i2c, uint8_t data)
+{
+    IntelMEState *s =3D INTEL_ME(i2c);
+
+    assert(s->rx_len < sizeof(s->rx_buf));
+    s->rx_buf[s->rx_len++] =3D data;
+
+    return 0;
+}
+
+static void intel_me_class_init(ObjectClass *oc, void *data)
+{
+    DeviceClass *dc =3D DEVICE_CLASS(oc);
+    I2CSlaveClass *i2c =3D I2C_SLAVE_CLASS(oc);
+
+    dc->realize =3D intel_me_realize;
+    i2c->event =3D intel_me_i2c_event;
+    i2c->recv =3D intel_me_i2c_recv;
+    i2c->send =3D intel_me_i2c_send;
+}
+
+static const TypeInfo types[] =3D {
+    {
+        .name =3D TYPE_INTEL_ME,
+        .parent =3D TYPE_I2C_SLAVE,
+        .instance_size =3D sizeof(IntelMEState),
+        .class_init =3D intel_me_class_init,
+    },
+};
+
+DEFINE_TYPES(types);
diff --git a/hw/misc/meson.build b/hw/misc/meson.build
index 1edad44b6b..a2c75894a3 100644
--- a/hw/misc/meson.build
+++ b/hw/misc/meson.build
@@ -118,7 +118,8 @@ softmmu_ss.add(when: 'CONFIG_ASPEED_SOC', if_true: file=
s(
   'aspeed_sdmc.c',
   'aspeed_xdma.c',
   'aspeed_peci.c',
-  'fby35_cpld.c'))
+  'fby35_cpld.c',
+  'intel_me.c'))
=20
 softmmu_ss.add(when: 'CONFIG_MSF2', if_true: files('msf2-sysreg.c'))
 softmmu_ss.add(when: 'CONFIG_NRF51_SOC', if_true: files('nrf51_rng.c'))
--=20
2.30.2


