Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 52B87523E04
	for <lists+qemu-devel@lfdr.de>; Wed, 11 May 2022 21:53:02 +0200 (CEST)
Received: from localhost ([::1]:43736 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nosOL-0004Jn-FF
	for lists+qemu-devel@lfdr.de; Wed, 11 May 2022 15:53:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40638)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <irischenlj@devvm5719.atn0.facebook.com>)
 id 1norBS-0000fe-EH
 for qemu-devel@nongnu.org; Wed, 11 May 2022 14:35:39 -0400
Received: from 66-220-155-178.mail-mxout.facebook.com ([66.220.155.178]:47793)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1)
 (envelope-from <irischenlj@devvm5719.atn0.facebook.com>)
 id 1norBQ-0002EG-Mp
 for qemu-devel@nongnu.org; Wed, 11 May 2022 14:35:38 -0400
Received: by devvm5719.atn0.facebook.com (Postfix, from userid 279525)
 id 55F1B13ABF94; Wed, 11 May 2022 11:10:26 -0700 (PDT)
To: 
Cc: irischenlj@fb.com, pdel@fb.com, qemu-devel@nongnu.org, qemu-arm@nongnu.org,
 clg@kaod.org, patrick@stwcx.xyz
Subject: [PATCH 1/1] hw: allow write_enable latch get/set
Date: Wed, 11 May 2022 11:10:24 -0700
Message-Id: <20220511181024.969263-2-irischenlj@fb.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220511181024.969263-1-irischenlj@fb.com>
References: <irischenlj@fb.com>
 <20220511181024.969263-1-irischenlj@fb.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: none client-ip=66.220.155.178;
 envelope-from=irischenlj@devvm5719.atn0.facebook.com;
 helo=66-220-155-178.mail-mxout.facebook.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, NO_DNS_FOR_FROM=0.001, RDNS_DYNAMIC=0.982,
 SPF_HELO_PASS=-0.001, SPF_NONE=0.001, TVD_RCVD_IP=0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Wed, 11 May 2022 15:50:19 -0400
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
Reply-to:  Iris Chen <irischenlj@fb.com>
From:  Iris Chen via <qemu-devel@nongnu.org>

---
 hw/block/m25p80.c             | 30 ++++++++++++++++++++++++++++++
 tests/qtest/aspeed_smc-test.c | 20 ++++++++++++++++++++
 2 files changed, 50 insertions(+)

diff --git a/hw/block/m25p80.c b/hw/block/m25p80.c
index 430d1298a8..fb72704e5a 100644
--- a/hw/block/m25p80.c
+++ b/hw/block/m25p80.c
@@ -35,6 +35,7 @@
 #include "qapi/error.h"
 #include "trace.h"
 #include "qom/object.h"
+#include "qapi/visitor.h"
=20
 /* Fields for FlashPartInfo->flags */
=20
@@ -1646,6 +1647,31 @@ static const VMStateDescription vmstate_m25p80 =3D=
 {
     }
 };
=20
+static void m25p80_get_wel(Object *obj, Visitor *v, const char *name,
+                            void *opaque, Error **errp)
+{
+    Flash *s =3D M25P80(obj);
+
+    assert(strcmp(name, "WEL") =3D=3D 0);
+
+    visit_type_bool(v, name, &s->write_enable, errp);
+}
+
+static void m25p80_set_wel(Object *obj, Visitor *v, const char *name,
+                            void *opaque, Error **errp)
+{
+    Flash *s =3D M25P80(obj);
+    bool value;
+
+    assert(strcmp(name, "WEL") =3D=3D 0);
+
+    if (!visit_type_bool(v, name, &value, errp)) {
+        return;
+    }
+
+    s->write_enable =3D value;
+}
+
 static void m25p80_class_init(ObjectClass *klass, void *data)
 {
     DeviceClass *dc =3D DEVICE_CLASS(klass);
@@ -1660,6 +1686,10 @@ static void m25p80_class_init(ObjectClass *klass, =
void *data)
     device_class_set_props(dc, m25p80_properties);
     dc->reset =3D m25p80_reset;
     mc->pi =3D data;
+
+    object_class_property_add(klass, "WEL", "bool",
+                            m25p80_get_wel,
+                            m25p80_set_wel, NULL, NULL);
 }
=20
 static const TypeInfo m25p80_info =3D {
diff --git a/tests/qtest/aspeed_smc-test.c b/tests/qtest/aspeed_smc-test.=
c
index 87b40a0ef1..af885a9c9d 100644
--- a/tests/qtest/aspeed_smc-test.c
+++ b/tests/qtest/aspeed_smc-test.c
@@ -49,6 +49,7 @@
  */
 enum {
     JEDEC_READ =3D 0x9f,
+    RDSR =3D 0x5,
     BULK_ERASE =3D 0xc7,
     READ =3D 0x03,
     PP =3D 0x02,
@@ -348,6 +349,24 @@ static void test_write_page_mem(void)
     flash_reset();
 }
=20
+static void test_read_status_reg(void)
+{
+    uint8_t r;
+
+	qmp("{ 'execute': 'qom-set', 'arguments': "
+       "{'path': '/machine/soc/fmc/ssi.0/child[0]', 'property': 'WEL', '=
value': true}}");
+
+    spi_conf(CONF_ENABLE_W0);
+	spi_ctrl_start_user();
+	writeb(ASPEED_FLASH_BASE, RDSR);
+	r =3D readb(ASPEED_FLASH_BASE);
+	spi_ctrl_stop_user();
+
+	g_assert_cmphex(r, =3D=3D, 0x2);
+
+	flash_reset();
+}
+
 static char tmp_path[] =3D "/tmp/qtest.m25p80.XXXXXX";
=20
 int main(int argc, char **argv)
@@ -373,6 +392,7 @@ int main(int argc, char **argv)
     qtest_add_func("/ast2400/smc/write_page", test_write_page);
     qtest_add_func("/ast2400/smc/read_page_mem", test_read_page_mem);
     qtest_add_func("/ast2400/smc/write_page_mem", test_write_page_mem);
+    qtest_add_func("/ast2400/smc/read_status_reg", test_read_status_reg)=
;
=20
     ret =3D g_test_run();
=20
--=20
2.30.2


