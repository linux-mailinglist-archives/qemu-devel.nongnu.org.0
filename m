Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AE653CA7F
	for <lists+qemu-devel@lfdr.de>; Tue, 11 Jun 2019 13:56:37 +0200 (CEST)
Received: from localhost ([::1]:56722 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hafOG-0004ut-8o
	for lists+qemu-devel@lfdr.de; Tue, 11 Jun 2019 07:56:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52421)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <philmd@redhat.com>) id 1hafA8-00071Q-Pc
 for qemu-devel@nongnu.org; Tue, 11 Jun 2019 07:42:02 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1haf6w-0000wv-9H
 for qemu-devel@nongnu.org; Tue, 11 Jun 2019 07:38:43 -0400
Received: from mx1.redhat.com ([209.132.183.28]:59852)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1haf6w-0000m1-2q
 for qemu-devel@nongnu.org; Tue, 11 Jun 2019 07:38:42 -0400
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 8358C30F1BDC;
 Tue, 11 Jun 2019 11:38:29 +0000 (UTC)
Received: from x1w.redhat.com (unknown [10.40.205.167])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id A0C8560BF1;
 Tue, 11 Jun 2019 11:38:27 +0000 (UTC)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org,
	Igor Mammedov <imammedo@redhat.com>
Date: Tue, 11 Jun 2019 13:37:25 +0200
Message-Id: <20190611113731.16940-16-philmd@redhat.com>
In-Reply-To: <20190611113731.16940-1-philmd@redhat.com>
References: <20190611113731.16940-1-philmd@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.43]); Tue, 11 Jun 2019 11:38:29 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PATCH v19 15/21] hw/rx: Honor -accel qtest
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
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
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
2.20.1


