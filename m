Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E3396A833C
	for <lists+qemu-devel@lfdr.de>; Wed,  4 Sep 2019 14:53:04 +0200 (CEST)
Received: from localhost ([::1]:57414 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1i5UmV-00027N-EU
	for lists+qemu-devel@lfdr.de; Wed, 04 Sep 2019 08:53:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47849)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <damien.hedde@greensocs.con>) id 1i5Rqr-0004r1-PC
 for qemu-devel@nongnu.org; Wed, 04 Sep 2019 05:45:23 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <damien.hedde@greensocs.con>) id 1i5Rqq-00004y-6m
 for qemu-devel@nongnu.org; Wed, 04 Sep 2019 05:45:21 -0400
Received: from beetle.greensocs.com ([5.135.226.135]:40562)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <damien.hedde@greensocs.con>)
 id 1i5Rqm-0008Pn-Pr; Wed, 04 Sep 2019 05:45:16 -0400
Received: from crumble.bar.greensocs.com (crumble.bar.greensocs.com
 [172.16.11.102])
 by beetle.greensocs.com (Postfix) with ESMTPS id 8837596F57;
 Wed,  4 Sep 2019 09:38:52 +0000 (UTC)
From: damien.hedde@greensocs.con
To: qemu-devel@nongnu.org
Date: Wed,  4 Sep 2019 11:38:38 +0200
Message-Id: <20190904093843.8765-5-damien.hedde@greensocs.con>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190904093843.8765-1-damien.hedde@greensocs.con>
References: <20190904093843.8765-1-damien.hedde@greensocs.con>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 5.135.226.135
X-Mailman-Approved-At: Wed, 04 Sep 2019 08:47:47 -0400
Subject: [Qemu-devel] [PATCH v6 4/9] qdev-monitor: print the device's clock
 with info qtree
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
Cc: Damien Hedde <damien.hedde@greensocs.com>, peter.maydell@linaro.org,
 berrange@redhat.com, ehabkost@redhat.com, alistair@alistair23.me,
 mark.burton@greensocs.com, pbonzini@redhat.com, qemu-arm@nongnu.org,
 marcandre.lureau@redhat.com, edgar.iglesias@gmail.com, philmd@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Damien Hedde <damien.hedde@greensocs.com>

This prints the clocks attached to a DeviceState when using "info qtree" =
monitor
command. For every clock, it displays the direction, the name and if the
clock is forwarded. For input clock, it displays also the frequency.

This is based on the original work of Frederic Konrad.

Signed-off-by: Damien Hedde <damien.hedde@greensocs.com>
Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
Tested-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
---
 qdev-monitor.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/qdev-monitor.c b/qdev-monitor.c
index a0003bf2a9..d5b8be956b 100644
--- a/qdev-monitor.c
+++ b/qdev-monitor.c
@@ -19,6 +19,7 @@
=20
 #include "qemu/osdep.h"
 #include "hw/sysbus.h"
+#include "hw/clock.h"
 #include "monitor/monitor.h"
 #include "monitor/qdev.h"
 #include "sysemu/arch_init.h"
@@ -689,6 +690,7 @@ static void qdev_print(Monitor *mon, DeviceState *dev=
, int indent)
     ObjectClass *class;
     BusState *child;
     NamedGPIOList *ngl;
+    NamedClockList *clk;
=20
     qdev_printf("dev: %s, id \"%s\"\n", object_get_typename(OBJECT(dev))=
,
                 dev->id ? dev->id : "");
@@ -703,6 +705,17 @@ static void qdev_print(Monitor *mon, DeviceState *de=
v, int indent)
                         ngl->num_out);
         }
     }
+    QLIST_FOREACH(clk, &dev->clocks, node) {
+        if (clk->out) {
+            qdev_printf("clock-out%s \"%s\"\n",
+                        clk->forward ? " (fw)" : "",
+                        clk->name);
+        } else {
+            qdev_printf("clock-in%s \"%s\" freq_hz=3D%" PRIu64"\n",
+                        clk->forward ? " (fw)" : "",
+                        clk->name, clock_get_frequency(clk->in));
+        }
+    }
     class =3D object_get_class(OBJECT(dev));
     do {
         qdev_print_props(mon, dev, DEVICE_CLASS(class)->props, indent);
--=20
2.22.0


