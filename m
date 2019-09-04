Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 524D4A8340
	for <lists+qemu-devel@lfdr.de>; Wed,  4 Sep 2019 14:56:02 +0200 (CEST)
Received: from localhost ([::1]:57442 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1i5UpN-00054G-Fe
	for lists+qemu-devel@lfdr.de; Wed, 04 Sep 2019 08:56:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47844)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <damien.hedde@greensocs.con>) id 1i5Rqr-0004qp-Ez
 for qemu-devel@nongnu.org; Wed, 04 Sep 2019 05:45:23 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <damien.hedde@greensocs.con>) id 1i5Rqp-0008VX-LF
 for qemu-devel@nongnu.org; Wed, 04 Sep 2019 05:45:21 -0400
Received: from beetle.greensocs.com ([5.135.226.135]:40538)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <damien.hedde@greensocs.con>)
 id 1i5Rql-0008Mw-HZ; Wed, 04 Sep 2019 05:45:15 -0400
Received: from crumble.bar.greensocs.com (crumble.bar.greensocs.com
 [172.16.11.102])
 by beetle.greensocs.com (Postfix) with ESMTPS id 3147996F59;
 Wed,  4 Sep 2019 09:38:53 +0000 (UTC)
From: damien.hedde@greensocs.con
To: qemu-devel@nongnu.org
Date: Wed,  4 Sep 2019 11:38:39 +0200
Message-Id: <20190904093843.8765-6-damien.hedde@greensocs.con>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190904093843.8765-1-damien.hedde@greensocs.con>
References: <20190904093843.8765-1-damien.hedde@greensocs.con>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 5.135.226.135
X-Mailman-Approved-At: Wed, 04 Sep 2019 08:47:47 -0400
Subject: [Qemu-devel] [PATCH v6 5/9] qdev-clock: introduce an init array to
 ease the device construction
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

Introduce a function and macro helpers to setup several clocks
in a device from a static array description.

An element of the array describes the clock (name and direction) as
well as the related callback and an optional offset to store the
created object pointer in the device state structure.

The array must be terminated by a special element QDEV_CLOCK_END.

This is based on the original work of Frederic Konrad.

Signed-off-by: Damien Hedde <damien.hedde@greensocs.com>
Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
---
 hw/core/qdev-clock.c    | 26 ++++++++++++++++
 include/hw/qdev-clock.h | 67 +++++++++++++++++++++++++++++++++++++++++
 2 files changed, 93 insertions(+)

diff --git a/hw/core/qdev-clock.c b/hw/core/qdev-clock.c
index bebdd8fa15..32ad45c061 100644
--- a/hw/core/qdev-clock.c
+++ b/hw/core/qdev-clock.c
@@ -153,3 +153,29 @@ void qdev_connect_clock_out(DeviceState *dev, const =
char *name, ClockIn *clk,
=20
     clock_connect(clk, clkout);
 }
+
+void qdev_init_clocks(DeviceState *dev, const ClockPortInitArray clocks)
+{
+    const struct ClockPortInitElem *elem;
+
+    assert(dev);
+    assert(clocks);
+
+    for (elem =3D &clocks[0]; elem->name !=3D NULL; elem++) {
+        /* offset cannot be inside the DeviceState part */
+        assert(elem->offset =3D=3D 0 || elem->offset > sizeof(DeviceStat=
e));
+        if (elem->is_output) {
+            ClockOut *clk;
+            clk =3D qdev_init_clock_out(dev, elem->name);
+            if (elem->offset) {
+                *(ClockOut **)(((void *) dev) + elem->offset) =3D clk;
+            }
+        } else {
+            ClockIn *clk;
+            clk =3D qdev_init_clock_in(dev, elem->name, elem->callback, =
dev);
+            if (elem->offset) {
+                *(ClockIn **)(((void *) dev) + elem->offset) =3D clk;
+            }
+        }
+    }
+}
diff --git a/include/hw/qdev-clock.h b/include/hw/qdev-clock.h
index c4ea912fdc..b6edb9421b 100644
--- a/include/hw/qdev-clock.h
+++ b/include/hw/qdev-clock.h
@@ -64,4 +64,71 @@ void qdev_connect_clock_out(DeviceState *dev, const ch=
ar *name, ClockIn *clk,
 void qdev_pass_clock(DeviceState *dev, const char *name,
                      DeviceState *container, const char *cont_name);
=20
+/**
+ * ClockInitElem:
+ * @name: name of the clock (can't be NULL)
+ * @is_output: indicates whether the clock is input or output
+ * @callback: for inputs, optional callback to be called on clock's upda=
te
+ * with device as opaque
+ * @offset: optional offset to store the ClockIn or ClockOut pointer in =
device
+ * state structure (0 means unused)
+ */
+struct ClockPortInitElem {
+    const char *name;
+    bool is_output;
+    ClockCallback *callback;
+    size_t offset;
+};
+
+#define clock_offset_value(_type, _devstate, _field) \
+    (offsetof(_devstate, _field) + \
+     type_check(_type *, typeof_field(_devstate, _field)))
+
+#define QDEV_CLOCK(_is_output, _type, _devstate, _field, _callback) { \
+    .name =3D (stringify(_field)), \
+    .is_output =3D _is_output, \
+    .callback =3D _callback, \
+    .offset =3D clock_offset_value(_type, _devstate, _field), \
+}
+
+/**
+ * QDEV_CLOCK_(IN|OUT):
+ * @_devstate: structure type. @dev argument of qdev_init_clocks below m=
ust be
+ * a pointer to that same type.
+ * @_field: a field in @_devstate (must be ClockIn* or ClockOut*)
+ * @_callback: (for input only) callback (or NULL) to be called with the=
 device
+ * state as argument
+ *
+ * The name of the clock will be derived from @_field
+ */
+#define QDEV_CLOCK_IN(_devstate, _field, _callback) \
+    QDEV_CLOCK(false, ClockIn, _devstate, _field, _callback)
+
+#define QDEV_CLOCK_OUT(_devstate, _field) \
+    QDEV_CLOCK(true, ClockOut, _devstate, _field, NULL)
+
+/**
+ * QDEV_CLOCK_IN_NOFIELD:
+ * @_name: name of the clock
+ * @_callback: callback (or NULL) to be called with the device state as =
argument
+ */
+#define QDEV_CLOCK_IN_NOFIELD(_name, _callback) { \
+    .name =3D _name, \
+    .is_output =3D false, \
+    .callback =3D _callback, \
+    .offset =3D 0, \
+}
+
+#define QDEV_CLOCK_END { .name =3D NULL }
+
+typedef struct ClockPortInitElem ClockPortInitArray[];
+
+/**
+ * qdev_init_clocks:
+ * @dev: the device to add clocks
+ * @clocks: a QDEV_CLOCK_END-terminated array which contains the
+ * clocks information.
+ */
+void qdev_init_clocks(DeviceState *dev, const ClockPortInitArray clocks)=
;
+
 #endif /* QDEV_CLOCK_H */
--=20
2.22.0


