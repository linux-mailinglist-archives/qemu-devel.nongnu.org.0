Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D6A0960252
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Jul 2019 10:39:41 +0200 (CEST)
Received: from localhost ([::1]:50560 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hjJkr-0004Gt-2L
	for lists+qemu-devel@lfdr.de; Fri, 05 Jul 2019 04:39:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56976)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <ysato@users.sourceforge.jp>) id 1hjJdi-0003Kx-OU
 for qemu-devel@nongnu.org; Fri, 05 Jul 2019 04:32:20 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <ysato@users.sourceforge.jp>) id 1hjJdf-00062k-SJ
 for qemu-devel@nongnu.org; Fri, 05 Jul 2019 04:32:18 -0400
Received: from mail02.asahi-net.or.jp ([202.224.55.14]:37221)
 by eggs.gnu.org with esmtp (Exim 4.71)
 (envelope-from <ysato@users.sourceforge.jp>) id 1hjJdf-0005ou-GB
 for qemu-devel@nongnu.org; Fri, 05 Jul 2019 04:32:15 -0400
Received: from h61-195-96-97.vps.ablenet.jp (h61-195-96-97.ablenetvps.ne.jp
 [61.195.96.97]) (Authenticated sender: PQ4Y-STU)
 by mail02.asahi-net.or.jp (Postfix) with ESMTPA id A5C6B49AAC;
 Fri,  5 Jul 2019 17:32:06 +0900 (JST)
Received: from yo-satoh-debian.localdomain (ZM005235.ppp.dion.ne.jp
 [222.8.5.235])
 by h61-195-96-97.vps.ablenet.jp (Postfix) with ESMTPSA id 5042A240086;
 Fri,  5 Jul 2019 17:32:06 +0900 (JST)
From: Yoshinori Sato <ysato@users.sourceforge.jp>
To: qemu-devel@nongnu.org
Date: Fri,  5 Jul 2019 17:31:37 +0900
Message-Id: <20190705083141.106254-19-ysato@users.sourceforge.jp>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20190705083141.106254-1-ysato@users.sourceforge.jp>
References: <20190705083141.106254-1-ysato@users.sourceforge.jp>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 202.224.55.14
Subject: [Qemu-devel] [PATCH v22 18/22] hw/rx: Honor -accel qtest
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

Signed-off-by: Yoshinori Sato <ysato@users.sourceforge.jp>
---
 hw/rx/rx62n.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/hw/rx/rx62n.c b/hw/rx/rx62n.c
index 74d2fd0ee3..05d82d0b8f 100644
--- a/hw/rx/rx62n.c
+++ b/hw/rx/rx62n.c
@@ -21,11 +21,13 @@
=20
 #include "qemu/osdep.h"
 #include "qapi/error.h"
+#include "qemu/error-report.h"
 #include "hw/hw.h"
 #include "hw/rx/rx62n.h"
 #include "hw/loader.h"
 #include "hw/sysbus.h"
 #include "sysemu/sysemu.h"
+#include "sysemu/qtest.h"
 #include "cpu.h"
=20
 /*
@@ -190,8 +192,14 @@ static void rx62n_realize(DeviceState *dev, Error **=
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
2.11.0


