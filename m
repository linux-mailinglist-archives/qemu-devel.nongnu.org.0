Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E9639146737
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Jan 2020 12:49:12 +0100 (CET)
Received: from localhost ([::1]:55322 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iuaz1-0004qT-3h
	for lists+qemu-devel@lfdr.de; Thu, 23 Jan 2020 06:49:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34798)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <imammedo@redhat.com>) id 1iuarL-00051c-MK
 for qemu-devel@nongnu.org; Thu, 23 Jan 2020 06:41:17 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <imammedo@redhat.com>) id 1iuarK-0003rH-Eb
 for qemu-devel@nongnu.org; Thu, 23 Jan 2020 06:41:15 -0500
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:39690
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <imammedo@redhat.com>) id 1iuarK-0003rB-BH
 for qemu-devel@nongnu.org; Thu, 23 Jan 2020 06:41:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1579779674;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=KII+DyHT1mIXFS/kQkCnRcezJtqgb6yrJZzuOp/qnVk=;
 b=R4WK94BwJ5hHZ1dlKQBsH/jm3lqXlWPc7bspuMIannIy45qNJ8IPqcL8ZCMWDIzRNlWQCl
 j2isMgeUCcgsaNju7KkkvQlEbK0cqaD35+fWYqiUjSEm8Q6X+wSBgAE/f3vRRIlcU926Pk
 ahgtrmvwSIAirOdV+VCzM5tX0cRicAc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-311-asARf87GPfGVGijXStAgpw-1; Thu, 23 Jan 2020 06:41:12 -0500
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 623191005510
 for <qemu-devel@nongnu.org>; Thu, 23 Jan 2020 11:41:11 +0000 (UTC)
Received: from dell-r430-03.lab.eng.brq.redhat.com
 (dell-r430-03.lab.eng.brq.redhat.com [10.37.153.18])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 10AD71001B05;
 Thu, 23 Jan 2020 11:41:07 +0000 (UTC)
From: Igor Mammedov <imammedo@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH REPOST v3 03/80] machine: alias -mem-path and -mem-prealloc
 into memory-foo backend
Date: Thu, 23 Jan 2020 12:37:28 +0100
Message-Id: <1579779525-20065-4-git-send-email-imammedo@redhat.com>
In-Reply-To: <1579779525-20065-1-git-send-email-imammedo@redhat.com>
References: <1579779525-20065-1-git-send-email-imammedo@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-MC-Unique: asARf87GPfGVGijXStAgpw-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 207.211.31.120
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
Cc: pbonzini@redhat.com, philmd@redhat.com, ehabkost@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Allow machine to opt in for hostmem backend based initial RAM
even if user uses old -mem-path/prealloc options by providing
  MachineClass::default_ram_id
Follow up patches will incrementally convert machines to new API,
by dropping memory_region_allocate_system_memory() and setting
default_ram_id that board used to use before conversion to keep
migration stream the same.

Signed-off-by: Igor Mammedov <imammedo@redhat.com>
---
v3:
   * rename "ram-memdev" property to "memory-backend"
     (Paolo Bonzini <pbonzini@redhat.com>)

CC: ehabkost@redhat.com
CC: pbonzini@redhat.com
CC: philmd@redhat.com
---
 include/hw/boards.h      |  5 +++++
 include/sysemu/hostmem.h | 16 ++++++++++++++++
 backends/hostmem-file.c  |  7 -------
 backends/hostmem-ram.c   |  2 --
 vl.c                     | 25 +++++++++++++++++++++++++
 5 files changed, 46 insertions(+), 9 deletions(-)

diff --git a/include/hw/boards.h b/include/hw/boards.h
index 6aa01b8..2a4e804 100644
--- a/include/hw/boards.h
+++ b/include/hw/boards.h
@@ -170,6 +170,10 @@ typedef struct {
  *    false is returned, an error must be set to show the reason of
  *    the rejection.  If the hook is not provided, all hotplug will be
  *    allowed.
+ * @default_ram_id:
+ *    Specifies inital RAM MemoryRegion name to be used for default backen=
d
+ *    creation if user explicitly hasn't specified backend with "memory-ba=
ckend"
+ *    property.
  */
 struct MachineClass {
     /*< private >*/
@@ -226,6 +230,7 @@ struct MachineClass {
     bool nvdimm_supported;
     bool numa_mem_supported;
     bool auto_enable_numa;
+    const char *default_ram_id;
=20
     HotplugHandler *(*get_hotplug_handler)(MachineState *machine,
                                            DeviceState *dev);
diff --git a/include/sysemu/hostmem.h b/include/sysemu/hostmem.h
index 4dbdadd..5db0d66 100644
--- a/include/sysemu/hostmem.h
+++ b/include/sysemu/hostmem.h
@@ -27,6 +27,22 @@
 #define MEMORY_BACKEND_CLASS(klass) \
     OBJECT_CLASS_CHECK(HostMemoryBackendClass, (klass), TYPE_MEMORY_BACKEN=
D)
=20
+/* hostmem-ram.c */
+/**
+ * @TYPE_MEMORY_BACKEND_RAM:
+ * name of backend that uses mmap on the anonymous RAM
+ */
+
+#define TYPE_MEMORY_BACKEND_RAM "memory-backend-ram"
+
+/* hostmem-file.c */
+/**
+ * @TYPE_MEMORY_BACKEND_FILE:
+ * name of backend that uses mmap on a file descriptor
+ */
+#define TYPE_MEMORY_BACKEND_FILE "memory-backend-file"
+
+typedef struct HostMemoryBackend HostMemoryBackend;
 typedef struct HostMemoryBackendClass HostMemoryBackendClass;
=20
 /**
diff --git a/backends/hostmem-file.c b/backends/hostmem-file.c
index be64020..cb319a9 100644
--- a/backends/hostmem-file.c
+++ b/backends/hostmem-file.c
@@ -18,13 +18,6 @@
 #include "sysemu/sysemu.h"
 #include "qom/object_interfaces.h"
=20
-/* hostmem-file.c */
-/**
- * @TYPE_MEMORY_BACKEND_FILE:
- * name of backend that uses mmap on a file descriptor
- */
-#define TYPE_MEMORY_BACKEND_FILE "memory-backend-file"
-
 #define MEMORY_BACKEND_FILE(obj) \
     OBJECT_CHECK(HostMemoryBackendFile, (obj), TYPE_MEMORY_BACKEND_FILE)
=20
diff --git a/backends/hostmem-ram.c b/backends/hostmem-ram.c
index 6aab8d3..5cc53e7 100644
--- a/backends/hostmem-ram.c
+++ b/backends/hostmem-ram.c
@@ -16,8 +16,6 @@
 #include "qemu/module.h"
 #include "qom/object_interfaces.h"
=20
-#define TYPE_MEMORY_BACKEND_RAM "memory-backend-ram"
-
 static void
 ram_backend_memory_alloc(HostMemoryBackend *backend, Error **errp)
 {
diff --git a/vl.c b/vl.c
index 71d3e7e..9f97cb6 100644
--- a/vl.c
+++ b/vl.c
@@ -75,6 +75,7 @@ int main(int argc, char **argv)
 #include "ui/input.h"
 #include "sysemu/sysemu.h"
 #include "sysemu/numa.h"
+#include "sysemu/hostmem.h"
 #include "exec/gdbstub.h"
 #include "qemu/timer.h"
 #include "chardev/char.h"
@@ -2822,6 +2823,25 @@ static void configure_accelerators(const char *progn=
ame)
     }
 }
=20
+static void create_default_memdev(MachineState *ms, const char *path,
+                                  bool prealloc)
+{
+    Object *obj;
+    MachineClass *mc =3D MACHINE_GET_CLASS(ms);
+
+    obj =3D object_new(path ? TYPE_MEMORY_BACKEND_FILE : TYPE_MEMORY_BACKE=
ND_RAM);
+    if (path) {
+        object_property_set_str(obj, path, "mem-path", &error_fatal);
+    }
+    object_property_set_bool(obj, prealloc, "prealloc", &error_fatal);
+    object_property_set_int(obj, ms->ram_size, "size", &error_fatal);
+    object_property_add_child(object_get_objects_root(), mc->default_ram_i=
d,
+                              obj, &error_fatal);
+    user_creatable_complete(USER_CREATABLE(obj), &error_fatal);
+    object_unref(obj);
+    object_property_set_link(OBJECT(ms), obj, "memory-backend", &error_fat=
al);
+}
+
 int main(int argc, char **argv, char **envp)
 {
     int i;
@@ -4285,6 +4305,11 @@ int main(int argc, char **argv, char **envp)
     }
     parse_numa_opts(current_machine);
=20
+    if (!current_machine->ram_memdev &&
+         machine_class->default_ram_size &&
+         machine_class->default_ram_id) {
+        create_default_memdev(current_machine, mem_path, mem_prealloc);
+    }
     /* do monitor/qmp handling at preconfig state if requested */
     main_loop();
=20
--=20
2.7.4


