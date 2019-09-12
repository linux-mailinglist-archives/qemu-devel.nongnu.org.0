Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AE8C3B08AA
	for <lists+qemu-devel@lfdr.de>; Thu, 12 Sep 2019 08:10:18 +0200 (CEST)
Received: from localhost ([::1]:58356 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1i8IJ7-0004lP-7n
	for lists+qemu-devel@lfdr.de; Thu, 12 Sep 2019 02:10:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36933)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <ysato@users.sourceforge.jp>) id 1i8IGB-0002Ly-7J
 for qemu-devel@nongnu.org; Thu, 12 Sep 2019 02:07:16 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <ysato@users.sourceforge.jp>) id 1i8IG8-00088v-JQ
 for qemu-devel@nongnu.org; Thu, 12 Sep 2019 02:07:15 -0400
Received: from mail03.asahi-net.or.jp ([202.224.55.15]:44443)
 by eggs.gnu.org with esmtp (Exim 4.71)
 (envelope-from <ysato@users.sourceforge.jp>) id 1i8IG8-00087R-8S
 for qemu-devel@nongnu.org; Thu, 12 Sep 2019 02:07:12 -0400
Received: from h61-195-96-97.vps.ablenet.jp (h61-195-96-97.ablenetvps.ne.jp
 [61.195.96.97]) (Authenticated sender: PQ4Y-STU)
 by mail03.asahi-net.or.jp (Postfix) with ESMTPA id 9013768318;
 Thu, 12 Sep 2019 15:07:11 +0900 (JST)
Received: from yo-satoh-debian.localdomain
 (ae227063.dynamic.ppp.asahi-net.or.jp [14.3.227.63])
 by h61-195-96-97.vps.ablenet.jp (Postfix) with ESMTPSA id 48996240085;
 Thu, 12 Sep 2019 15:07:11 +0900 (JST)
From: Yoshinori Sato <ysato@users.sourceforge.jp>
To: qemu-devel@nongnu.org
Date: Thu, 12 Sep 2019 15:06:57 +0900
Message-Id: <20190912060701.4642-19-ysato@users.sourceforge.jp>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190912060701.4642-1-ysato@users.sourceforge.jp>
References: <20190912060701.4642-1-ysato@users.sourceforge.jp>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 202.224.55.15
Subject: [Qemu-devel] [PATCH v24 18/22] hw/rx: Honor -accel qtest
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
Cc: peter.maydell@linaro.org, imammedo@redhat.com,
 Richard Henderson <richard.henderson@linaro.org>,
 Yoshinori Sato <ysato@users.sourceforge.jp>, philmd@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Richard Henderson <richard.henderson@linaro.org>

Issue an error if no kernel, no bios, and not qtest'ing.
Fixes make check-qtest-rx: test/qom-test.

Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
Signed-off-by: Yoshinori Sato <ysato@users.sourceforge.jp>
Message-Id: <20190607091116.49044-16-ysato@users.sourceforge.jp>
Tested-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
We could squash this with the previous patch
---
 hw/rx/rx62n.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/hw/rx/rx62n.c b/hw/rx/rx62n.c
index ac47f2a397..a0986fd15e 100644
--- a/hw/rx/rx62n.c
+++ b/hw/rx/rx62n.c
@@ -21,12 +21,14 @@
=20
 #include "qemu/osdep.h"
 #include "qapi/error.h"
+#include "qemu/error-report.h"
 #include "hw/hw.h"
 #include "hw/rx/rx62n.h"
 #include "hw/loader.h"
 #include "hw/sysbus.h"
 #include "hw/qdev-properties.h"
 #include "sysemu/sysemu.h"
+#include "sysemu/qtest.h"
 #include "cpu.h"
=20
 /*
@@ -191,8 +193,14 @@ static void rx62n_realize(DeviceState *dev, Error **=
errp)
     memory_region_init_rom(&s->c_flash, NULL, "codeflash",
                            RX62N_CFLASH_SIZE, errp);
     memory_region_add_subregion(s->sysmem, RX62N_CFLASH_BASE, &s->c_flas=
h);
+
     if (!s->kernel) {
-        rom_add_file_fixed(bios_name, RX62N_CFLASH_BASE, 0);
+        if (bios_name) {
+            rom_add_file_fixed(bios_name, RX62N_CFLASH_BASE, 0);
+        }  else if (!qtest_enabled()) {
+            error_report("No bios or kernel specified");
+            exit(1);
+        }
     }
=20
     /* Initialize CPU */
--=20
2.20.1


