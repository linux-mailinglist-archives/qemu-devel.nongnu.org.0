Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BDC2FAA769
	for <lists+qemu-devel@lfdr.de>; Thu,  5 Sep 2019 17:36:29 +0200 (CEST)
Received: from localhost ([::1]:47458 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1i5toC-0005vU-Kt
	for lists+qemu-devel@lfdr.de; Thu, 05 Sep 2019 11:36:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44750)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <thuth@redhat.com>) id 1i5tiH-0001bV-R7
 for qemu-devel@nongnu.org; Thu, 05 Sep 2019 11:30:24 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <thuth@redhat.com>) id 1i5tiE-0001am-Mf
 for qemu-devel@nongnu.org; Thu, 05 Sep 2019 11:30:21 -0400
Received: from mx1.redhat.com ([209.132.183.28]:49928)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <thuth@redhat.com>) id 1i5tiE-0001Zv-Aj
 for qemu-devel@nongnu.org; Thu, 05 Sep 2019 11:30:18 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 8117C3087958;
 Thu,  5 Sep 2019 15:30:17 +0000 (UTC)
Received: from thuth.com (ovpn-116-96.ams2.redhat.com [10.36.116.96])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 731DA614C1;
 Thu,  5 Sep 2019 15:30:16 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Date: Thu,  5 Sep 2019 17:30:10 +0200
Message-Id: <20190905153011.24010-2-thuth@redhat.com>
In-Reply-To: <20190905153011.24010-1-thuth@redhat.com>
References: <20190905153011.24010-1-thuth@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.45]); Thu, 05 Sep 2019 15:30:17 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PULL v2 6/9] tests/libqtest: Use libqtest-single.h in
 tests that require global_qtest
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Tests that require global_qtest or the related wrapper functions now
use the libqtest-single.h header that is dedicated for everything
related to global_qtest. The core libqtest.c and libqtest.h files are
now completely indepedent from global_qtest, so that the core library
is now not depending on a global state anymore.

Message-Id: <20190904130047.25808-7-thuth@redhat.com>
Reviewed-by: Eric Blake <eblake@redhat.com>
Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 tests/cpu-plug-test.c         | 2 +-
 tests/display-vga-test.c      | 2 +-
 tests/e1000e-test.c           | 2 +-
 tests/fdc-test.c              | 2 +-
 tests/i440fx-test.c           | 2 +-
 tests/i82801b11-test.c        | 2 +-
 tests/intel-hda-test.c        | 2 +-
 tests/ioh3420-test.c          | 2 +-
 tests/ipmi-kcs-test.c         | 3 +--
 tests/libqtest-single.h       | 4 ++++
 tests/libqtest.c              | 2 --
 tests/libqtest.h              | 4 ----
 tests/m25p80-test.c           | 2 +-
 tests/qos-test.c              | 2 +-
 tests/rtc-test.c              | 2 +-
 tests/rtl8139-test.c          | 2 +-
 tests/test-arm-mptimer.c      | 2 +-
 tests/test-netfilter.c        | 2 +-
 tests/test-x86-cpuid-compat.c | 2 +-
 tests/tmp105-test.c           | 2 +-
 tests/tpm-crb-test.c          | 2 +-
 tests/tpm-tests.c             | 2 +-
 tests/tpm-tis-test.c          | 2 +-
 tests/usb-hcd-ohci-test.c     | 2 +-
 tests/usb-hcd-uhci-test.c     | 2 +-
 tests/usb-hcd-xhci-test.c     | 2 +-
 tests/vhost-user-test.c       | 2 +-
 tests/virtio-9p-test.c        | 2 +-
 tests/virtio-blk-test.c       | 2 +-
 tests/virtio-ccw-test.c       | 2 +-
 tests/virtio-net-test.c       | 2 +-
 tests/virtio-scsi-test.c      | 2 +-
 tests/virtio-serial-test.c    | 2 +-
 33 files changed, 34 insertions(+), 37 deletions(-)

diff --git a/tests/cpu-plug-test.c b/tests/cpu-plug-test.c
index 3049620854..776407e1b6 100644
--- a/tests/cpu-plug-test.c
+++ b/tests/cpu-plug-test.c
@@ -10,7 +10,7 @@
 #include "qemu/osdep.h"
 
 #include "qemu-common.h"
-#include "libqtest.h"
+#include "libqtest-single.h"
 #include "qapi/qmp/qdict.h"
 
 struct PlugTestData {
diff --git a/tests/display-vga-test.c b/tests/display-vga-test.c
index bd176dcf3a..ace3bb28e0 100644
--- a/tests/display-vga-test.c
+++ b/tests/display-vga-test.c
@@ -8,7 +8,7 @@
  */
 
 #include "qemu/osdep.h"
-#include "libqtest.h"
+#include "libqtest-single.h"
 
 static void pci_cirrus(void)
 {
diff --git a/tests/e1000e-test.c b/tests/e1000e-test.c
index 93628c588d..1a232a663a 100644
--- a/tests/e1000e-test.c
+++ b/tests/e1000e-test.c
@@ -26,7 +26,7 @@
 
 #include "qemu/osdep.h"
 #include "qemu-common.h"
-#include "libqtest.h"
+#include "libqtest-single.h"
 #include "qemu-common.h"
 #include "libqos/pci-pc.h"
 #include "qemu/sockets.h"
diff --git a/tests/fdc-test.c b/tests/fdc-test.c
index 31cd3295c1..26b69f7c5c 100644
--- a/tests/fdc-test.c
+++ b/tests/fdc-test.c
@@ -25,7 +25,7 @@
 #include "qemu/osdep.h"
 
 
-#include "libqtest.h"
+#include "libqtest-single.h"
 #include "qapi/qmp/qdict.h"
 #include "qemu-common.h"
 
diff --git a/tests/i440fx-test.c b/tests/i440fx-test.c
index 69205b58a8..1f57d9684b 100644
--- a/tests/i440fx-test.c
+++ b/tests/i440fx-test.c
@@ -14,7 +14,7 @@
 
 #include "qemu/osdep.h"
 
-#include "libqtest.h"
+#include "libqtest-single.h"
 #include "libqos/pci.h"
 #include "libqos/pci-pc.h"
 #include "hw/pci/pci_regs.h"
diff --git a/tests/i82801b11-test.c b/tests/i82801b11-test.c
index a6e31594c9..4345da338b 100644
--- a/tests/i82801b11-test.c
+++ b/tests/i82801b11-test.c
@@ -8,7 +8,7 @@
  */
 
 #include "qemu/osdep.h"
-#include "libqtest.h"
+#include "libqtest-single.h"
 
 /* Tests only initialization so far. TODO: Replace with functional tests */
 static void nop(void)
diff --git a/tests/intel-hda-test.c b/tests/intel-hda-test.c
index b782b2e944..fc25ccc33c 100644
--- a/tests/intel-hda-test.c
+++ b/tests/intel-hda-test.c
@@ -8,7 +8,7 @@
  */
 
 #include "qemu/osdep.h"
-#include "libqtest.h"
+#include "libqtest-single.h"
 
 #define HDA_ID "hda0"
 #define CODEC_DEVICES " -device hda-output,bus=" HDA_ID ".0" \
diff --git a/tests/ioh3420-test.c b/tests/ioh3420-test.c
index b54c4b9f11..f6ca43cca7 100644
--- a/tests/ioh3420-test.c
+++ b/tests/ioh3420-test.c
@@ -8,7 +8,7 @@
  */
 
 #include "qemu/osdep.h"
-#include "libqtest.h"
+#include "libqtest-single.h"
 
 /* Tests only initialization so far. TODO: Replace with functional tests */
 static void nop(void)
diff --git a/tests/ipmi-kcs-test.c b/tests/ipmi-kcs-test.c
index a2354c10c7..693a6aacb5 100644
--- a/tests/ipmi-kcs-test.c
+++ b/tests/ipmi-kcs-test.c
@@ -24,8 +24,7 @@
 
 #include "qemu/osdep.h"
 
-
-#include "libqtest.h"
+#include "libqtest-single.h"
 
 #define IPMI_IRQ        5
 
diff --git a/tests/libqtest-single.h b/tests/libqtest-single.h
index 49259558a5..6f1bb1331c 100644
--- a/tests/libqtest-single.h
+++ b/tests/libqtest-single.h
@@ -11,6 +11,10 @@
 #ifndef LIBQTEST_SINGLE_H
 #define LIBQTEST_SINGLE_H
 
+#include "libqtest.h"
+
+QTestState *global_qtest __attribute__((common, weak));
+
 /**
  * qtest_start:
  * @args: other arguments to pass to QEMU
diff --git a/tests/libqtest.c b/tests/libqtest.c
index e5101d9d3a..0a6b91737e 100644
--- a/tests/libqtest.c
+++ b/tests/libqtest.c
@@ -35,8 +35,6 @@
 #define SOCKET_TIMEOUT 50
 #define SOCKET_MAX_FDS 16
 
-QTestState *global_qtest;
-
 struct QTestState
 {
     int fd;
diff --git a/tests/libqtest.h b/tests/libqtest.h
index 6a7d7e41ad..c8cffe5d68 100644
--- a/tests/libqtest.h
+++ b/tests/libqtest.h
@@ -22,8 +22,6 @@
 
 typedef struct QTestState QTestState;
 
-extern QTestState *global_qtest;
-
 /**
  * qtest_initf:
  * @fmt...: Format for creating other arguments to pass to QEMU, formatted
@@ -641,8 +639,6 @@ void qtest_add_abrt_handler(GHookFunc fn, const void *data);
 void qtest_qmp_assert_success(QTestState *qts, const char *fmt, ...)
     GCC_FMT_ATTR(2, 3);
 
-#include "libqtest-single.h"
-
 QDict *qmp_fd_receive(int fd);
 void qmp_fd_vsend_fds(int fd, int *fds, size_t fds_num,
                       const char *fmt, va_list ap) GCC_FMT_ATTR(4, 0);
diff --git a/tests/m25p80-test.c b/tests/m25p80-test.c
index 055f7246a8..50c6b79fb3 100644
--- a/tests/m25p80-test.c
+++ b/tests/m25p80-test.c
@@ -25,7 +25,7 @@
 
 #include "qemu/osdep.h"
 #include "qemu/bswap.h"
-#include "libqtest.h"
+#include "libqtest-single.h"
 
 /*
  * ASPEED SPI Controller registers
diff --git a/tests/qos-test.c b/tests/qos-test.c
index 3c0071b3b7..fd70d73ea5 100644
--- a/tests/qos-test.c
+++ b/tests/qos-test.c
@@ -18,7 +18,7 @@
 
 #include "qemu/osdep.h"
 #include <getopt.h>
-#include "libqtest.h"
+#include "libqtest-single.h"
 #include "qapi/qmp/qdict.h"
 #include "qapi/qmp/qbool.h"
 #include "qapi/qmp/qstring.h"
diff --git a/tests/rtc-test.c b/tests/rtc-test.c
index 509be707e3..6309b0ef6c 100644
--- a/tests/rtc-test.c
+++ b/tests/rtc-test.c
@@ -13,7 +13,7 @@
 
 #include "qemu/osdep.h"
 
-#include "libqtest.h"
+#include "libqtest-single.h"
 #include "qemu/timer.h"
 #include "hw/timer/mc146818rtc_regs.h"
 
diff --git a/tests/rtl8139-test.c b/tests/rtl8139-test.c
index d6d0c24909..4506049264 100644
--- a/tests/rtl8139-test.c
+++ b/tests/rtl8139-test.c
@@ -8,7 +8,7 @@
  */
 
 #include "qemu/osdep.h"
-#include "libqtest.h"
+#include "libqtest-single.h"
 #include "libqos/pci-pc.h"
 #include "qemu/timer.h"
 #include "qemu-common.h"
diff --git a/tests/test-arm-mptimer.c b/tests/test-arm-mptimer.c
index 156a39f50d..7a56d56da9 100644
--- a/tests/test-arm-mptimer.c
+++ b/tests/test-arm-mptimer.c
@@ -9,7 +9,7 @@
 
 #include "qemu/osdep.h"
 #include "qemu/timer.h"
-#include "libqtest.h"
+#include "libqtest-single.h"
 
 #define TIMER_BLOCK_SCALE(s)    ((((s) & 0xff) + 1) * 10)
 
diff --git a/tests/test-netfilter.c b/tests/test-netfilter.c
index e47075dd06..22927ee6ab 100644
--- a/tests/test-netfilter.c
+++ b/tests/test-netfilter.c
@@ -9,7 +9,7 @@
  */
 
 #include "qemu/osdep.h"
-#include "libqtest.h"
+#include "libqtest-single.h"
 #include "qapi/qmp/qdict.h"
 
 /* add a netfilter to a netdev and then remove it */
diff --git a/tests/test-x86-cpuid-compat.c b/tests/test-x86-cpuid-compat.c
index e75b959950..772287bdb4 100644
--- a/tests/test-x86-cpuid-compat.c
+++ b/tests/test-x86-cpuid-compat.c
@@ -4,7 +4,7 @@
 #include "qapi/qmp/qlist.h"
 #include "qapi/qmp/qnum.h"
 #include "qapi/qmp/qbool.h"
-#include "libqtest.h"
+#include "libqtest-single.h"
 
 static char *get_cpu0_qom_path(void)
 {
diff --git a/tests/tmp105-test.c b/tests/tmp105-test.c
index f599309a4a..f930a96b83 100644
--- a/tests/tmp105-test.c
+++ b/tests/tmp105-test.c
@@ -9,7 +9,7 @@
 
 #include "qemu/osdep.h"
 
-#include "libqtest.h"
+#include "libqtest-single.h"
 #include "libqos/qgraph.h"
 #include "libqos/i2c.h"
 #include "qapi/qmp/qdict.h"
diff --git a/tests/tpm-crb-test.c b/tests/tpm-crb-test.c
index a139caa51d..632fb7fbd8 100644
--- a/tests/tpm-crb-test.c
+++ b/tests/tpm-crb-test.c
@@ -15,7 +15,7 @@
 
 #include "hw/acpi/tpm.h"
 #include "io/channel-socket.h"
-#include "libqtest.h"
+#include "libqtest-single.h"
 #include "qemu/module.h"
 #include "tpm-emu.h"
 
diff --git a/tests/tpm-tests.c b/tests/tpm-tests.c
index e640777aa9..6e45a0ba85 100644
--- a/tests/tpm-tests.c
+++ b/tests/tpm-tests.c
@@ -15,7 +15,7 @@
 #include "qemu/osdep.h"
 #include <glib/gstdio.h>
 
-#include "libqtest.h"
+#include "libqtest-single.h"
 #include "tpm-tests.h"
 
 static bool
diff --git a/tests/tpm-tis-test.c b/tests/tpm-tis-test.c
index 92a7e95aad..dcf30e05b7 100644
--- a/tests/tpm-tis-test.c
+++ b/tests/tpm-tis-test.c
@@ -17,7 +17,7 @@
 
 #include "hw/acpi/tpm.h"
 #include "io/channel-socket.h"
-#include "libqtest.h"
+#include "libqtest-single.h"
 #include "qemu/module.h"
 #include "tpm-emu.h"
 
diff --git a/tests/usb-hcd-ohci-test.c b/tests/usb-hcd-ohci-test.c
index 0cd73b7363..19d760f3fb 100644
--- a/tests/usb-hcd-ohci-test.c
+++ b/tests/usb-hcd-ohci-test.c
@@ -8,7 +8,7 @@
  */
 
 #include "qemu/osdep.h"
-#include "libqtest.h"
+#include "libqtest-single.h"
 #include "qemu/module.h"
 #include "libqos/usb.h"
 #include "libqos/qgraph.h"
diff --git a/tests/usb-hcd-uhci-test.c b/tests/usb-hcd-uhci-test.c
index 2eef8e3d1c..7a117b64d9 100644
--- a/tests/usb-hcd-uhci-test.c
+++ b/tests/usb-hcd-uhci-test.c
@@ -8,7 +8,7 @@
  */
 
 #include "qemu/osdep.h"
-#include "libqtest.h"
+#include "libqtest-single.h"
 #include "libqos/libqos.h"
 #include "libqos/usb.h"
 #include "libqos/libqos-pc.h"
diff --git a/tests/usb-hcd-xhci-test.c b/tests/usb-hcd-xhci-test.c
index 01845371f9..10ef9d2a91 100644
--- a/tests/usb-hcd-xhci-test.c
+++ b/tests/usb-hcd-xhci-test.c
@@ -8,7 +8,7 @@
  */
 
 #include "qemu/osdep.h"
-#include "libqtest.h"
+#include "libqtest-single.h"
 #include "libqos/usb.h"
 
 
diff --git a/tests/vhost-user-test.c b/tests/vhost-user-test.c
index 6ae8a23688..91ea373ba5 100644
--- a/tests/vhost-user-test.c
+++ b/tests/vhost-user-test.c
@@ -10,7 +10,7 @@
 
 #include "qemu/osdep.h"
 
-#include "libqtest.h"
+#include "libqtest-single.h"
 #include "qapi/error.h"
 #include "qapi/qmp/qdict.h"
 #include "qemu/config-file.h"
diff --git a/tests/virtio-9p-test.c b/tests/virtio-9p-test.c
index 30e6cf3e63..e7b58e3a0c 100644
--- a/tests/virtio-9p-test.c
+++ b/tests/virtio-9p-test.c
@@ -8,7 +8,7 @@
  */
 
 #include "qemu/osdep.h"
-#include "libqtest.h"
+#include "libqtest-single.h"
 #include "qemu/module.h"
 #include "hw/9pfs/9p.h"
 #include "hw/9pfs/9p-synth.h"
diff --git a/tests/virtio-blk-test.c b/tests/virtio-blk-test.c
index 45375dc4ff..ed13167392 100644
--- a/tests/virtio-blk-test.c
+++ b/tests/virtio-blk-test.c
@@ -9,7 +9,7 @@
  */
 
 #include "qemu/osdep.h"
-#include "libqtest.h"
+#include "libqtest-single.h"
 #include "qemu/bswap.h"
 #include "qemu/module.h"
 #include "standard-headers/linux/virtio_blk.h"
diff --git a/tests/virtio-ccw-test.c b/tests/virtio-ccw-test.c
index 9f445ef4ad..d05236407b 100644
--- a/tests/virtio-ccw-test.c
+++ b/tests/virtio-ccw-test.c
@@ -14,7 +14,7 @@
  */
 
 #include "qemu/osdep.h"
-#include "libqtest.h"
+#include "libqtest-single.h"
 #include "libqos/virtio.h"
 
 static void virtio_balloon_nop(void)
diff --git a/tests/virtio-net-test.c b/tests/virtio-net-test.c
index 840875aaae..a08e2ffe12 100644
--- a/tests/virtio-net-test.c
+++ b/tests/virtio-net-test.c
@@ -9,7 +9,7 @@
 
 #include "qemu/osdep.h"
 #include "qemu-common.h"
-#include "libqtest.h"
+#include "libqtest-single.h"
 #include "qemu/iov.h"
 #include "qemu/module.h"
 #include "qapi/qmp/qdict.h"
diff --git a/tests/virtio-scsi-test.c b/tests/virtio-scsi-test.c
index 09348765d7..7c8f9b27f8 100644
--- a/tests/virtio-scsi-test.c
+++ b/tests/virtio-scsi-test.c
@@ -9,7 +9,7 @@
  */
 
 #include "qemu/osdep.h"
-#include "libqtest.h"
+#include "libqtest-single.h"
 #include "qemu/module.h"
 #include "scsi/constants.h"
 #include "libqos/libqos-pc.h"
diff --git a/tests/virtio-serial-test.c b/tests/virtio-serial-test.c
index e584ad76e8..2541034822 100644
--- a/tests/virtio-serial-test.c
+++ b/tests/virtio-serial-test.c
@@ -8,7 +8,7 @@
  */
 
 #include "qemu/osdep.h"
-#include "libqtest.h"
+#include "libqtest-single.h"
 #include "qemu/module.h"
 #include "libqos/virtio-serial.h"
 
-- 
2.18.1


