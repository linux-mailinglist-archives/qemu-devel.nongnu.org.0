Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 286CA55BBED
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Jun 2022 22:16:14 +0200 (CEST)
Received: from localhost ([::1]:51952 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o5v9Y-0003H1-Td
	for lists+qemu-devel@lfdr.de; Mon, 27 Jun 2022 16:16:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43098)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=71779173e5=pdel@fb.com>)
 id 1o5upc-0004ie-Gr
 for qemu-devel@nongnu.org; Mon, 27 Jun 2022 15:55:36 -0400
Received: from mx0a-00082601.pphosted.com ([67.231.145.42]:52158)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <prvs=71779173e5=pdel@fb.com>)
 id 1o5upZ-0000f2-89
 for qemu-devel@nongnu.org; Mon, 27 Jun 2022 15:55:36 -0400
Received: from pps.filterd (m0148461.ppops.net [127.0.0.1])
 by mx0a-00082601.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 25RJ1OWm024611
 for <qemu-devel@nongnu.org>; Mon, 27 Jun 2022 12:55:31 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : content-type :
 content-transfer-encoding : mime-version; s=facebook;
 bh=1PTlbZpuAKYSU9En23GCHSs/qdfYUF9vK66/8eWmBQo=;
 b=SzjyBY07bRKi4uTeLY9zAqnRQQ5WGLMpDHRjPRHCF4trEFPVQNs2fxoiQ9vUr8WzR2TV
 k2+AKIFoIcF4pvjUf2I0fR5iJmCAXLPr1yzacedvGXwjKQ+Ivsio6EG+XxY0cm2DZS6a
 Sb9BUJV/XdSG/oWpwQaQIRepXO+JxfgRO5w= 
Received: from mail.thefacebook.com ([163.114.132.120])
 by mx0a-00082601.pphosted.com (PPS) with ESMTPS id 3gwyfsdax5-2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <qemu-devel@nongnu.org>; Mon, 27 Jun 2022 12:55:30 -0700
Received: from twshared13579.04.prn5.facebook.com (2620:10d:c085:208::f) by
 mail.thefacebook.com (2620:10d:c085:21d::6) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.28; Mon, 27 Jun 2022 12:55:29 -0700
Received: by devvm9194.prn0.facebook.com (Postfix, from userid 385188)
 id E39E88D206EF; Mon, 27 Jun 2022 12:55:07 -0700 (PDT)
From: Peter Delevoryas <pdel@fb.com>
To: 
CC: <pdel@fb.com>, <zhdaniel@fb.com>, <clg@kaod.org>, <qemu-devel@nongnu.org>, 
 <qemu-arm@nongnu.org>, <komlodi@google.com>, <titusr@google.com>,
 <andrew@aj.id.au>, <joel@jms.id.au>
Subject: [PATCH 08/14] hw/misc: Add fby35-cpld
Date: Mon, 27 Jun 2022 12:55:00 -0700
Message-ID: <20220627195506.403715-9-pdel@fb.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220627195506.403715-1-pdel@fb.com>
References: <20220627195506.403715-1-pdel@fb.com>
X-FB-Internal: Safe
Content-Type: text/plain
X-Proofpoint-GUID: 9-XRJtC9KzC_mqUyHE7o65BtXkMNFoPV
X-Proofpoint-ORIG-GUID: 9-XRJtC9KzC_mqUyHE7o65BtXkMNFoPV
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-06-27_06,2022-06-24_01,2022-06-22_01
Received-SPF: pass client-ip=67.231.145.42;
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
 hw/misc/fby35_cpld.c | 137 +++++++++++++++++++++++++++++++++++++++++++
 hw/misc/meson.build  |   3 +-
 2 files changed, 139 insertions(+), 1 deletion(-)
 create mode 100644 hw/misc/fby35_cpld.c

diff --git a/hw/misc/fby35_cpld.c b/hw/misc/fby35_cpld.c
new file mode 100644
index 0000000000..a783a0a2c8
--- /dev/null
+++ b/hw/misc/fby35_cpld.c
@@ -0,0 +1,137 @@
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
+#include "hw/i2c/i2c.h"
+#include "hw/registerfields.h"
+
+#define BOARD_ID_CLASS1 0b0000
+#define BOARD_ID_CLASS2 0b0001
+
+#define TYPE_FBY35_CPLD "fby35-cpld"
+OBJECT_DECLARE_SIMPLE_TYPE(Fby35CpldState, FBY35_CPLD);
+
+REG8(CLASS_TYPE, 0x5);
+    FIELD(CLASS_TYPE, RESERVED, 0, 2);
+    FIELD(CLASS_TYPE, 1OU_EXPANSION_NOT_PRESENT, 2, 1);
+    FIELD(CLASS_TYPE, 2OU_EXPANSION_NOT_PRESENT, 3, 1);
+    FIELD(CLASS_TYPE, BOARD_ID, 4, 4);
+REG8(BOARD_REVISION, 0x8);
+    FIELD(BOARD_REVISION, VALUE, 0, 4);
+    FIELD(BOARD_REVISION, RESERVED, 4, 4);
+
+struct Fby35CpldState {
+    I2CSlave parent_obj;
+
+    uint8_t target_reg;
+    uint32_t regs[10];
+};
+
+static void fby35_cpld_realize(DeviceState *dev, Error **errp)
+{
+    Fby35CpldState *s =3D FBY35_CPLD(dev);
+
+    memset(s->regs, 0, sizeof(s->regs));
+    s->target_reg =3D 0;
+
+    ARRAY_FIELD_DP32(s->regs, CLASS_TYPE, BOARD_ID, 0b0000);
+    ARRAY_FIELD_DP32(s->regs, CLASS_TYPE, 1OU_EXPANSION_NOT_PRESENT, 1);
+    ARRAY_FIELD_DP32(s->regs, CLASS_TYPE, 2OU_EXPANSION_NOT_PRESENT, 1);
+    ARRAY_FIELD_DP32(s->regs, BOARD_REVISION, VALUE, 0x1);
+}
+
+static int fby35_cpld_i2c_event(I2CSlave *i2c, enum i2c_event event)
+{
+    Fby35CpldState *s =3D FBY35_CPLD(i2c);
+
+    switch (event) {
+    case I2C_START_RECV:
+        break;
+    case I2C_START_SEND:
+        s->target_reg =3D 0;
+        break;
+    case I2C_START_SEND_ASYNC:
+    case I2C_FINISH:
+    case I2C_NACK:
+        break;
+    }
+
+    return 0;
+}
+
+static uint8_t fby35_cpld_i2c_recv(I2CSlave *i2c)
+{
+    Fby35CpldState *s =3D FBY35_CPLD(i2c);
+
+    switch (s->target_reg) {
+    case R_CLASS_TYPE:
+    case R_BOARD_REVISION:
+        return s->regs[s->target_reg];
+    default:
+        printf("%s: unexpected register read 0x%02x\n", __func__, s->targe=
t_reg);
+        return 0xff;
+    }
+}
+
+static int fby35_cpld_i2c_send(I2CSlave *i2c, uint8_t data)
+{
+    Fby35CpldState *s =3D FBY35_CPLD(i2c);
+
+    if (s->target_reg =3D=3D 0) {
+        s->target_reg =3D data;
+        return 0;
+    }
+
+    switch (s->target_reg) {
+    case R_CLASS_TYPE:
+    case R_BOARD_REVISION:
+        s->regs[s->target_reg] =3D data;
+        break;
+    default:
+        printf("%s: unexpected register write 0x%02x 0x%02x\n", __func__, =
s->target_reg, data);
+        break;
+    }
+
+    return 0;
+}
+
+static void fby35_cpld_class_init(ObjectClass *oc, void *data)
+{
+    DeviceClass *dc =3D DEVICE_CLASS(oc);
+    I2CSlaveClass *i2c =3D I2C_SLAVE_CLASS(oc);
+
+    dc->realize =3D fby35_cpld_realize;
+    i2c->event =3D fby35_cpld_i2c_event;
+    i2c->recv =3D fby35_cpld_i2c_recv;
+    i2c->send =3D fby35_cpld_i2c_send;
+}
+
+static const TypeInfo types[] =3D {
+    {
+        .name =3D TYPE_FBY35_CPLD,
+        .parent =3D TYPE_I2C_SLAVE,
+        .instance_size =3D sizeof(Fby35CpldState),
+        .class_init =3D fby35_cpld_class_init,
+    },
+};
+
+DEFINE_TYPES(types);
diff --git a/hw/misc/meson.build b/hw/misc/meson.build
index 95268eddc0..1edad44b6b 100644
--- a/hw/misc/meson.build
+++ b/hw/misc/meson.build
@@ -117,7 +117,8 @@ softmmu_ss.add(when: 'CONFIG_ASPEED_SOC', if_true: file=
s(
   'aspeed_sbc.c',
   'aspeed_sdmc.c',
   'aspeed_xdma.c',
-  'aspeed_peci.c'))
+  'aspeed_peci.c',
+  'fby35_cpld.c'))
=20
 softmmu_ss.add(when: 'CONFIG_MSF2', if_true: files('msf2-sysreg.c'))
 softmmu_ss.add(when: 'CONFIG_NRF51_SOC', if_true: files('nrf51_rng.c'))
--=20
2.30.2


