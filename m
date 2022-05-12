Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 002985241FC
	for <lists+qemu-devel@lfdr.de>; Thu, 12 May 2022 03:22:06 +0200 (CEST)
Received: from localhost ([::1]:50120 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1noxWm-00019h-H7
	for lists+qemu-devel@lfdr.de; Wed, 11 May 2022 21:22:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50708)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <irischenlj@devvm5719.atn0.facebook.com>)
 id 1noxUW-0008Jv-LW
 for qemu-devel@nongnu.org; Wed, 11 May 2022 21:19:44 -0400
Received: from 66-220-155-178.mail-mxout.facebook.com ([66.220.155.178]:40895)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1)
 (envelope-from <irischenlj@devvm5719.atn0.facebook.com>)
 id 1noxUU-0002QU-EH
 for qemu-devel@nongnu.org; Wed, 11 May 2022 21:19:44 -0400
Received: by devvm5719.atn0.facebook.com (Postfix, from userid 279525)
 id 34F9E13E1755; Wed, 11 May 2022 17:54:13 -0700 (PDT)
To: 
Cc: irischenlj@fb.com, pdel@fb.com, qemu-devel@nongnu.org, qemu-arm@nongnu.org,
 clg@kaod.org, patrick@stwcx.xyz, alistair@alistair23.me, kwolf@redhat.com,
 hreitz@redhat.com, peter.maydell@linaro.org, andrew@aj.id.au,
 joel@jms.id.au, huth@redhat.com, lvivier@redhat.com, pbonzini@redhat.com,
 qemu-block@nongnu.org
Subject: [PATCH v2] hw: m25p80: allow write_enable latch get/set
Date: Wed, 11 May 2022 17:54:11 -0700
Message-Id: <20220512005411.2503971-1-irischenlj@fb.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <irischenlj@fb.com>
References: <irischenlj@fb.com>
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

The write_enable latch property is not currently exposed.
This commit makes it a modifiable property using get/set methods.

Signed-off-by: Iris Chen <irischenlj@fb.com>
---
Ran ./scripts/checkpatch.pl on the patch and added a description. Fixed c=
omments regarding DEFINE_PROP_BOOL.

 hw/block/m25p80.c             |  2 ++
 tests/qtest/aspeed_smc-test.c | 23 +++++++++++++++++++++++
 2 files changed, 25 insertions(+)

diff --git a/hw/block/m25p80.c b/hw/block/m25p80.c
index 430d1298a8..019beb5b78 100644
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
@@ -1558,6 +1559,7 @@ static int m25p80_pre_save(void *opaque)
=20
 static Property m25p80_properties[] =3D {
     /* This is default value for Micron flash */
+    DEFINE_PROP_BOOL("write-enable", Flash, write_enable, false),
     DEFINE_PROP_UINT32("nonvolatile-cfg", Flash, nonvolatile_cfg, 0x8FFF=
),
     DEFINE_PROP_UINT8("spansion-cr1nv", Flash, spansion_cr1nv, 0x0),
     DEFINE_PROP_UINT8("spansion-cr2nv", Flash, spansion_cr2nv, 0x8),
diff --git a/tests/qtest/aspeed_smc-test.c b/tests/qtest/aspeed_smc-test.=
c
index 87b40a0ef1..fcc156bc00 100644
--- a/tests/qtest/aspeed_smc-test.c
+++ b/tests/qtest/aspeed_smc-test.c
@@ -26,6 +26,7 @@
 #include "qemu/osdep.h"
 #include "qemu/bswap.h"
 #include "libqtest-single.h"
+#include "qemu/bitops.h"
=20
 /*
  * ASPEED SPI Controller registers
@@ -40,6 +41,7 @@
 #define   CTRL_FREADMODE       0x1
 #define   CTRL_WRITEMODE       0x2
 #define   CTRL_USERMODE        0x3
+#define SR_WEL BIT(1)
=20
 #define ASPEED_FMC_BASE    0x1E620000
 #define ASPEED_FLASH_BASE  0x20000000
@@ -49,6 +51,7 @@
  */
 enum {
     JEDEC_READ =3D 0x9f,
+    RDSR =3D 0x5,
     BULK_ERASE =3D 0xc7,
     READ =3D 0x03,
     PP =3D 0x02,
@@ -348,6 +351,25 @@ static void test_write_page_mem(void)
     flash_reset();
 }
=20
+static void test_read_status_reg(void)
+{
+    uint8_t r;
+
+    qmp("{ 'execute': 'qom-set', 'arguments': "
+       "{'path': '/machine/soc/fmc/ssi.0/child[0]', 'property': 'WEL', '=
value': true}}");
+
+
+    spi_conf(CONF_ENABLE_W0);
+    spi_ctrl_start_user();
+    writeb(ASPEED_FLASH_BASE, RDSR);
+    r =3D readb(ASPEED_FLASH_BASE);
+    spi_ctrl_stop_user();
+
+    g_assert_cmphex(r & SR_WEL, =3D=3D, SR_WEL);
+
+    flash_reset();
+}
+
 static char tmp_path[] =3D "/tmp/qtest.m25p80.XXXXXX";
=20
 int main(int argc, char **argv)
@@ -373,6 +395,7 @@ int main(int argc, char **argv)
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


