Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C94534FC4
	for <lists+qemu-devel@lfdr.de>; Tue,  4 Jun 2019 20:20:54 +0200 (CEST)
Received: from localhost ([127.0.0.1]:56252 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hYE3I-0002aq-Sh
	for lists+qemu-devel@lfdr.de; Tue, 04 Jun 2019 14:20:52 -0400
Received: from eggs.gnu.org ([209.51.188.92]:35954)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1hYDyw-00085n-SG
	for qemu-devel@nongnu.org; Tue, 04 Jun 2019 14:16:24 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1hYDyv-0002wA-2b
	for qemu-devel@nongnu.org; Tue, 04 Jun 2019 14:16:22 -0400
Received: from mx1.redhat.com ([209.132.183.28]:50324)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <armbru@redhat.com>) id 1hYDyu-0002vA-R1
	for qemu-devel@nongnu.org; Tue, 04 Jun 2019 14:16:21 -0400
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 2AE487E436
	for <qemu-devel@nongnu.org>; Tue,  4 Jun 2019 18:16:20 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-116-148.ams2.redhat.com
	[10.36.116.148])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C4E971017E2E
	for <qemu-devel@nongnu.org>; Tue,  4 Jun 2019 18:16:19 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
	id 37E9211386A3; Tue,  4 Jun 2019 20:16:18 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Date: Tue,  4 Jun 2019 20:16:15 +0200
Message-Id: <20190604181618.19980-2-armbru@redhat.com>
In-Reply-To: <20190604181618.19980-1-armbru@redhat.com>
References: <20190604181618.19980-1-armbru@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.27]);
	Tue, 04 Jun 2019 18:16:20 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PATCH 1/4] Normalize position of header guard
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is the common header guard idiom:

    /*
     * File comment
     */

    #ifndef GUARD_SYMBOL_H
    #define GUARD_SYMBOL_H

    ... actual contents ...

    #endif

A few of our headers have some #include before the guard.
target/tilegx/spr_def_64.h has #ifndef __DOXYGEN__ outside the guard.
A few more have the #define elsewhere.

Change them to match the common idiom.  For spr_def_64.h, that means
dropping #ifndef __DOXYGEN__.  While there, rename guard symbols to
make scripts/clean-header-guards.pl happy.

Signed-off-by: Markus Armbruster <armbru@redhat.com>
---
 crypto/ivgen-essiv.h              |  9 ++++-----
 crypto/ivgen-plain.h              |  5 ++---
 crypto/ivgen-plain64.h            |  9 ++++-----
 include/hw/arm/allwinner-a10.h    |  4 ++--
 include/hw/arm/omap.h             |  8 +++++---
 include/hw/arm/xlnx-zynqmp.h      |  2 +-
 include/hw/char/cadence_uart.h    |  2 +-
 include/hw/display/xlnx_dp.h      |  9 ++++-----
 include/hw/dma/xlnx-zynq-devcfg.h |  2 +-
 include/hw/net/cadence_gem.h      |  2 +-
 target/i386/whp-dispatch.h        |  7 +++----
 target/tilegx/spr_def_64.h        | 10 +++-------
 tests/io-channel-helpers.h        |  9 ++++-----
 13 files changed, 35 insertions(+), 43 deletions(-)

diff --git a/crypto/ivgen-essiv.h b/crypto/ivgen-essiv.h
index f34dbab57b..6c35c0b5ab 100644
--- a/crypto/ivgen-essiv.h
+++ b/crypto/ivgen-essiv.h
@@ -15,14 +15,13 @@
  *
  * You should have received a copy of the GNU Lesser General Public
  * License along with this library; if not, see <http://www.gnu.org/lice=
nses/>.
- *
  */
=20
+#ifndef QCRYPTO_IVGEN_ESSIV_H
+#define QCRYPTO_IVGEN_ESSIV_H
+
 #include "ivgenpriv.h"
=20
-#ifndef QCRYPTO_IVGEN_ESSIV_H__
-#define QCRYPTO_IVGEN_ESSIV_H__
-
 extern struct QCryptoIVGenDriver qcrypto_ivgen_essiv;
=20
-#endif /* QCRYPTO_IVGEN_ESSIV_H__ */
+#endif /* QCRYPTO_IVGEN_ESSIV_H */
diff --git a/crypto/ivgen-plain.h b/crypto/ivgen-plain.h
index 16e1ae5b27..395501f693 100644
--- a/crypto/ivgen-plain.h
+++ b/crypto/ivgen-plain.h
@@ -15,14 +15,13 @@
  *
  * You should have received a copy of the GNU Lesser General Public
  * License along with this library; if not, see <http://www.gnu.org/lice=
nses/>.
- *
  */
=20
-#include "ivgenpriv.h"
-
 #ifndef QCRYPTO_IVGEN_PLAIN_H__
 #define QCRYPTO_IVGEN_PLAIN_H__
=20
+#include "ivgenpriv.h"
+
 extern struct QCryptoIVGenDriver qcrypto_ivgen_plain;
=20
 #endif /* QCRYPTO_IVGEN_PLAIN_H__ */
diff --git a/crypto/ivgen-plain64.h b/crypto/ivgen-plain64.h
index f8611bd705..0a20fd1fd8 100644
--- a/crypto/ivgen-plain64.h
+++ b/crypto/ivgen-plain64.h
@@ -15,14 +15,13 @@
  *
  * You should have received a copy of the GNU Lesser General Public
  * License along with this library; if not, see <http://www.gnu.org/lice=
nses/>.
- *
  */
=20
+#ifndef QCRYPTO_IVGEN_PLAIN64_H
+#define QCRYPTO_IVGEN_PLAIN64_H
+
 #include "ivgenpriv.h"
=20
-#ifndef QCRYPTO_IVGEN_PLAIN64_H__
-#define QCRYPTO_IVGEN_PLAIN64_H__
-
 extern struct QCryptoIVGenDriver qcrypto_ivgen_plain64;
=20
-#endif /* QCRYPTO_IVGEN_PLAIN64_H__ */
+#endif /* QCRYPTO_IVGEN_PLAIN64_H */
diff --git a/include/hw/arm/allwinner-a10.h b/include/hw/arm/allwinner-a1=
0.h
index 6305b9c586..2c728efe07 100644
--- a/include/hw/arm/allwinner-a10.h
+++ b/include/hw/arm/allwinner-a10.h
@@ -1,4 +1,5 @@
-#ifndef ALLWINNER_H_
+#ifndef HW_ARM_ALLWINNER_A10_H
+#define HW_ARM_ALLWINNER_A10_H
=20
 #include "qemu-common.h"
 #include "qemu/error-report.h"
@@ -38,5 +39,4 @@ typedef struct AwA10State {
     MemoryRegion sram_a;
 } AwA10State;
=20
-#define ALLWINNER_H_
 #endif
diff --git a/include/hw/arm/omap.h b/include/hw/arm/omap.h
index 9de867daa4..d21e418242 100644
--- a/include/hw/arm/omap.h
+++ b/include/hw/arm/omap.h
@@ -16,9 +16,11 @@
  * You should have received a copy of the GNU General Public License alo=
ng
  * with this program; if not, see <http://www.gnu.org/licenses/>.
  */
-#ifndef hw_omap_h
+
+#ifndef HW_ARM_OMAP_H
+#define HW_ARM_OMAP_H
+
 #include "exec/memory.h"
-# define hw_omap_h		"omap.h"
 #include "hw/irq.h"
 #include "hw/input/tsc2xxx.h"
 #include "target/arm/cpu-qom.h"
@@ -991,4 +993,4 @@ enum {
=20
 # define OMAP_MPUI_REG_MASK		0x000007ff
=20
-#endif /* hw_omap_h */
+#endif
diff --git a/include/hw/arm/xlnx-zynqmp.h b/include/hw/arm/xlnx-zynqmp.h
index cd90b04310..604aabfdc6 100644
--- a/include/hw/arm/xlnx-zynqmp.h
+++ b/include/hw/arm/xlnx-zynqmp.h
@@ -16,6 +16,7 @@
  */
=20
 #ifndef XLNX_ZYNQMP_H
+#define XLNX_ZYNQMP_H
=20
 #include "qemu-common.h"
 #include "hw/arm/boot.h"
@@ -114,5 +115,4 @@ typedef struct XlnxZynqMPState {
     bool has_rpu;
 }  XlnxZynqMPState;
=20
-#define XLNX_ZYNQMP_H
 #endif
diff --git a/include/hw/char/cadence_uart.h b/include/hw/char/cadence_uar=
t.h
index 118e3f10de..e1cf33e94c 100644
--- a/include/hw/char/cadence_uart.h
+++ b/include/hw/char/cadence_uart.h
@@ -17,6 +17,7 @@
  */
=20
 #ifndef CADENCE_UART_H
+#define CADENCE_UART_H
=20
 #include "hw/sysbus.h"
 #include "chardev/char-fe.h"
@@ -66,5 +67,4 @@ static inline DeviceState *cadence_uart_create(hwaddr a=
ddr,
     return dev;
 }
=20
-#define CADENCE_UART_H
 #endif
diff --git a/include/hw/display/xlnx_dp.h b/include/hw/display/xlnx_dp.h
index 45a805033a..ab0dd250cc 100644
--- a/include/hw/display/xlnx_dp.h
+++ b/include/hw/display/xlnx_dp.h
@@ -19,9 +19,11 @@
  *
  * You should have received a copy of the GNU General Public License alo=
ng
  * with this program; if not, see <http://www.gnu.org/licenses/>.
- *
  */
=20
+#ifndef XLNX_DP_H
+#define XLNX_DP_H
+
 #include "hw/sysbus.h"
 #include "ui/console.h"
 #include "hw/misc/auxbus.h"
@@ -33,9 +35,6 @@
 #include "hw/dma/xlnx_dpdma.h"
 #include "audio/audio.h"
=20
-#ifndef XLNX_DP_H
-#define XLNX_DP_H
-
 #define AUD_CHBUF_MAX_DEPTH                 (32 * KiB)
 #define MAX_QEMU_BUFFER_SIZE                (4 * KiB)
=20
@@ -107,4 +106,4 @@ typedef struct XlnxDPState {
 #define TYPE_XLNX_DP "xlnx.v-dp"
 #define XLNX_DP(obj) OBJECT_CHECK(XlnxDPState, (obj), TYPE_XLNX_DP)
=20
-#endif /* !XLNX_DP_H */
+#endif
diff --git a/include/hw/dma/xlnx-zynq-devcfg.h b/include/hw/dma/xlnx-zynq=
-devcfg.h
index 9f5119a89a..1d3969d91f 100644
--- a/include/hw/dma/xlnx-zynq-devcfg.h
+++ b/include/hw/dma/xlnx-zynq-devcfg.h
@@ -25,6 +25,7 @@
  */
=20
 #ifndef XLNX_ZYNQ_DEVCFG_H
+#define XLNX_ZYNQ_DEVCFG_H
=20
 #include "hw/register.h"
 #include "hw/sysbus.h"
@@ -58,5 +59,4 @@ typedef struct XlnxZynqDevcfg {
     RegisterInfo regs_info[XLNX_ZYNQ_DEVCFG_R_MAX];
 } XlnxZynqDevcfg;
=20
-#define XLNX_ZYNQ_DEVCFG_H
 #endif
diff --git a/include/hw/net/cadence_gem.h b/include/hw/net/cadence_gem.h
index 5426961d91..5c83036ade 100644
--- a/include/hw/net/cadence_gem.h
+++ b/include/hw/net/cadence_gem.h
@@ -23,6 +23,7 @@
  */
=20
 #ifndef CADENCE_GEM_H
+#define CADENCE_GEM_H
=20
 #define TYPE_CADENCE_GEM "cadence_gem"
 #define CADENCE_GEM(obj) OBJECT_CHECK(CadenceGEMState, (obj), TYPE_CADEN=
CE_GEM)
@@ -84,5 +85,4 @@ typedef struct CadenceGEMState {
     bool sar_active[4];
 } CadenceGEMState;
=20
-#define CADENCE_GEM_H
 #endif
diff --git a/target/i386/whp-dispatch.h b/target/i386/whp-dispatch.h
index a23fb33a29..23791fbb47 100644
--- a/target/i386/whp-dispatch.h
+++ b/target/i386/whp-dispatch.h
@@ -1,12 +1,11 @@
+#ifndef WHP_DISPATCH_H
+#define WHP_DISPATCH_H
+
 #include <windows.h>
=20
 #include <WinHvPlatform.h>
 #include <WinHvEmulation.h>
=20
-#ifndef WHP_DISPATCH_H
-#define WHP_DISPATCH_H
-
-
 #define LIST_WINHVPLATFORM_FUNCTIONS(X) \
   X(HRESULT, WHvGetCapability, (WHV_CAPABILITY_CODE CapabilityCode, VOID=
* CapabilityBuffer, UINT32 CapabilityBufferSizeInBytes, UINT32* WrittenSi=
zeInBytes)) \
   X(HRESULT, WHvCreatePartition, (WHV_PARTITION_HANDLE* Partition)) \
diff --git a/target/tilegx/spr_def_64.h b/target/tilegx/spr_def_64.h
index 67a6c1751e..d3c0cc26d8 100644
--- a/target/tilegx/spr_def_64.h
+++ b/target/tilegx/spr_def_64.h
@@ -12,10 +12,8 @@
  *   more details.
  */
=20
-#ifndef __DOXYGEN__
-
-#ifndef __ARCH_SPR_DEF_64_H__
-#define __ARCH_SPR_DEF_64_H__
+#ifndef ARCH_SPR_DEF_64_H
+#define ARCH_SPR_DEF_64_H
=20
 #define SPR_AUX_PERF_COUNT_0 0x2105
 #define SPR_AUX_PERF_COUNT_1 0x2106
@@ -211,6 +209,4 @@
 #define SPR_WATCH_MASK 0x200a
 #define SPR_WATCH_VAL 0x200b
=20
-#endif /* !defined(__ARCH_SPR_DEF_64_H__) */
-
-#endif /* !defined(__DOXYGEN__) */
+#endif
diff --git a/tests/io-channel-helpers.h b/tests/io-channel-helpers.h
index fedc64fd5a..bb2de6fbb9 100644
--- a/tests/io-channel-helpers.h
+++ b/tests/io-channel-helpers.h
@@ -15,14 +15,13 @@
  *
  * You should have received a copy of the GNU Lesser General Public
  * License along with this library; if not, see <http://www.gnu.org/lice=
nses/>.
- *
  */
=20
+#ifndef TEST_IO_CHANNEL_HELPERS_H
+#define TEST_IO_CHANNEL_HELPERS_H
+
 #include "io/channel.h"
=20
-#ifndef TEST_IO_CHANNEL_HELPERS
-#define TEST_IO_CHANNEL_HELPERS
-
 typedef struct QIOChannelTest QIOChannelTest;
=20
 QIOChannelTest *qio_channel_test_new(void);
@@ -39,4 +38,4 @@ void qio_channel_test_run_reader(QIOChannelTest *test,
=20
 void qio_channel_test_validate(QIOChannelTest *test);
=20
-#endif /* TEST_IO_CHANNEL_HELPERS */
+#endif /* TEST_IO_CHANNEL_HELPERS_H */
--=20
2.21.0


