Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 036FE35A2BE
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Apr 2021 18:13:52 +0200 (CEST)
Received: from localhost ([::1]:44248 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lUtlX-0003Yc-1I
	for lists+qemu-devel@lfdr.de; Fri, 09 Apr 2021 12:13:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46512)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1lUtbp-00016o-Vw
 for qemu-devel@nongnu.org; Fri, 09 Apr 2021 12:03:50 -0400
Received: from us-smtp-delivery-44.mimecast.com ([207.211.30.44]:48020)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1lUtbn-00067t-Np
 for qemu-devel@nongnu.org; Fri, 09 Apr 2021 12:03:49 -0400
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-365-scuoCa7SPy2w_W_xKIio8w-1; Fri, 09 Apr 2021 12:03:44 -0400
X-MC-Unique: scuoCa7SPy2w_W_xKIio8w-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9D933107ACE8;
 Fri,  9 Apr 2021 16:03:43 +0000 (UTC)
Received: from bahia.redhat.com (ovpn-114-173.ams2.redhat.com [10.36.114.173])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 0787B5C230;
 Fri,  9 Apr 2021 16:03:41 +0000 (UTC)
From: Greg Kurz <groug@kaod.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 1/2] qdev: Separate implementations of qdev_get_machine() for
 user and system
Date: Fri,  9 Apr 2021 18:03:38 +0200
Message-Id: <20210409160339.500167-2-groug@kaod.org>
In-Reply-To: <20210409160339.500167-1-groug@kaod.org>
References: <20210409160339.500167-1-groug@kaod.org>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: kaod.org
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=WINDOWS-1252
Received-SPF: softfail client-ip=207.211.30.44; envelope-from=groug@kaod.org;
 helo=us-smtp-delivery-44.mimecast.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_LOW=-0.7,
 SPF_HELO_NONE=0.001, SPF_SOFTFAIL=0.665 autolearn=no autolearn_force=no
X-Spam_action: no action
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
Cc: Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Greg Kurz <groug@kaod.org>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Despite its simple name and common usage of "getting a pointer to
the machine" in system-mode emulation, qdev_get_machine() has some
subtilities.

First, it can be called when running user-mode emulation : this is
because user-mode partly relies on qdev to instantiate its CPU
model.

Second, but not least, it has a side-effect : if it cannot find an
object at "/machine" in the QOM tree, it creates a dummy "container"
object and put it there. A simple check on the type returned by
qdev_get_machine() allows user-mode to run the common qdev code,
skipping the parts that only make sense for system-mode.

This side-effect turns out to complicate the use of qdev_get_machine()
for the system-mode case though. Most notably, qdev_get_machine() must
not be called before the machine object is added to the QOM tree by
qemu_create_machine(), otherwise the existing dummy "container" object
would cause qemu_create_machine() to fail with something like :

Unexpected error in object_property_try_add() at ../../qom/object.c:1223:
qemu-system-ppc64: attempt to add duplicate property 'machine' to
 object (type 'container')
Aborted (core dumped)

This situation doesn't exist in the current code base, mostly because
of preventive fixing of some "latent bugs" in QEMU 4.0 (see 1a3ec8c1564
and e2fb3fbbf9c for details).

A new kind of breakage was spotted very recently though :

$ ./qemu-system-ppc64 -device power8_v2.0-spapr-cpu-core,help
/home/thuth/devel/qemu/include/hw/boards.h:24:
 MACHINE: Object 0x5635bd53af10 is not an instance of type machine
Aborted (core dumped)

This comes from the change 3df261b6676b in QEMU 5.0. It unwillingly
added a new condition for qdev_get_machine() to be called too early,
breaking MACHINE(qdev_get_machine()) in generic cpu-core code this
time.

In order to avoid further subtle breakages like this, change the
implentation of qdev_get_machine() to:
- keep the existing behaviour of creating the dummy "container"
  object for the user-mode case only ;
- abort() if the machine doesn't exist yet in the QOM tree for
  the system-mode case. This gives a precise hint to developpers
  that calling qdev_get_machine() too early is a programming bug.

This is achieved with a new do_qdev_get_machine() function called
from qdev_get_machine(), with different implementations for system
and user mode.

$ ./qemu-system-ppc64 -device power8_v2.0-spapr-cpu-core,help
qemu-system-ppc64: ../../hw/core/machine.c:1290:
 qdev_get_machine: Assertion `machine !=3D NULL' failed.
Aborted (core dumped)

Reported-by: Thomas Huth <thuth@redhat.com>
Signed-off-by: Greg Kurz <groug@kaod.org>
---
 hw/core/machine.c        | 14 ++++++++++++++
 hw/core/qdev.c           |  2 +-
 include/hw/qdev-core.h   |  1 +
 stubs/meson.build        |  1 +
 stubs/qdev-get-machine.c | 11 +++++++++++
 5 files changed, 28 insertions(+), 1 deletion(-)
 create mode 100644 stubs/qdev-get-machine.c

diff --git a/hw/core/machine.c b/hw/core/machine.c
index 40def78183a7..fecca4023105 100644
--- a/hw/core/machine.c
+++ b/hw/core/machine.c
@@ -1293,6 +1293,20 @@ void qdev_machine_creation_done(void)
     register_global_state();
 }
=20
+Object *do_qdev_get_machine(void)
+{
+    Object *machine;
+
+    machine =3D object_resolve_path_component(object_get_root(), "machine"=
);
+    /*
+     * qdev_get_machine() shouldn't be called before qemu_create_machine()
+     * has created the "/machine" path.
+     */
+    assert(machine !=3D NULL);
+
+    return machine;
+}
+
 static const TypeInfo machine_info =3D {
     .name =3D TYPE_MACHINE,
     .parent =3D TYPE_OBJECT,
diff --git a/hw/core/qdev.c b/hw/core/qdev.c
index cefc5eaa0a92..1122721b2bf0 100644
--- a/hw/core/qdev.c
+++ b/hw/core/qdev.c
@@ -1131,7 +1131,7 @@ Object *qdev_get_machine(void)
     static Object *dev;
=20
     if (dev =3D=3D NULL) {
-        dev =3D container_get(object_get_root(), "/machine");
+        dev =3D do_qdev_get_machine();
     }
=20
     return dev;
diff --git a/include/hw/qdev-core.h b/include/hw/qdev-core.h
index bafc311bfa1b..90e295e0bc1a 100644
--- a/include/hw/qdev-core.h
+++ b/include/hw/qdev-core.h
@@ -782,6 +782,7 @@ const char *qdev_fw_name(DeviceState *dev);
=20
 void qdev_assert_realized_properly(void);
 Object *qdev_get_machine(void);
+Object *do_qdev_get_machine(void);
=20
 /* FIXME: make this a link<> */
 bool qdev_set_parent_bus(DeviceState *dev, BusState *bus, Error **errp);
diff --git a/stubs/meson.build b/stubs/meson.build
index be6f6d609e58..b99ee2b33e94 100644
--- a/stubs/meson.build
+++ b/stubs/meson.build
@@ -54,3 +54,4 @@ if have_system
 else
   stub_ss.add(files('qdev.c'))
 endif
+stub_ss.add(files('qdev-get-machine.c'))
diff --git a/stubs/qdev-get-machine.c b/stubs/qdev-get-machine.c
new file mode 100644
index 000000000000..ed4cdaa01900
--- /dev/null
+++ b/stubs/qdev-get-machine.c
@@ -0,0 +1,11 @@
+#include "qemu/osdep.h"
+#include "hw/qdev-core.h"
+
+Object *do_qdev_get_machine(void)
+{
+    /*
+     * This will create a "container" and add it to the QOM tree, if there
+     * isn't one already.
+     */
+    return container_get(object_get_root(), "/machine");
+}
--=20
2.26.3


