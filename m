Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B460614F026
	for <lists+qemu-devel@lfdr.de>; Fri, 31 Jan 2020 16:51:53 +0100 (CET)
Received: from localhost ([::1]:55086 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ixYaG-0007YX-E8
	for lists+qemu-devel@lfdr.de; Fri, 31 Jan 2020 10:51:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40567)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <imammedo@redhat.com>) id 1ixXzM-0006TY-57
 for qemu-devel@nongnu.org; Fri, 31 Jan 2020 10:13:45 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <imammedo@redhat.com>) id 1ixXzJ-0007Mw-Kp
 for qemu-devel@nongnu.org; Fri, 31 Jan 2020 10:13:44 -0500
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:31804
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <imammedo@redhat.com>) id 1ixXzJ-0007KH-Ft
 for qemu-devel@nongnu.org; Fri, 31 Jan 2020 10:13:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1580483621;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=TBIxQoShAsGwESE9L+6A5UH+yJNVS48YSvnz14NmbTA=;
 b=D0FjFP+CizutrAN8YmonhMV4OOFEVQHAOHNQi8VcL84MQrTM1gGGNJTCEOFEgaTBgjS94i
 m6Pz1qZG72I7FKqYFYMJl183cDj4ti9mdMWtuKe0Sza3EHF10Hji+64KP81fp3DQElVQ70
 +yWQMkAc/MAjgXis+JCAf4aoVjtC5Q4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-196-R4MUTcvrMa6zSG_F9nZo6g-1; Fri, 31 Jan 2020 10:13:38 -0500
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D023313F6
 for <qemu-devel@nongnu.org>; Fri, 31 Jan 2020 15:13:37 +0000 (UTC)
Received: from dell-r430-03.lab.eng.brq.redhat.com
 (dell-r430-03.lab.eng.brq.redhat.com [10.37.153.18])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 07CF486C4B;
 Fri, 31 Jan 2020 15:13:36 +0000 (UTC)
From: Igor Mammedov <imammedo@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 77/80] hostmem: introduce "prealloc-threads" property
Date: Fri, 31 Jan 2020 16:09:47 +0100
Message-Id: <1580483390-131164-78-git-send-email-imammedo@redhat.com>
In-Reply-To: <1580483390-131164-1-git-send-email-imammedo@redhat.com>
References: <1580483390-131164-1-git-send-email-imammedo@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-MC-Unique: R4MUTcvrMa6zSG_F9nZo6g-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 205.139.110.120
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
Cc: pbonzini@redhat.com, ehabkost@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

the property will allow user to specify number of threads to use
in pre-allocation stage. It also will allow to reduce implicit
hostmem dependency on current_machine.
On object creation it will default to 1, but via machine
compat property it will be updated to MachineState::smp::cpus
to keep current behavior for hostmem and main RAM (which is
now also hostmem based).

Signed-off-by: Igor Mammedov <imammedo@redhat.com>
---
v3:
  - use object_register_sugar_prop() instead of directly hacking
    compat_props (Paolo Bonzini <pbonzini@redhat.com>)
  - fix TODO description

CC: pbonzini@redhat.com
CC: ehabkost@redhat.com
---
 include/sysemu/hostmem.h |  2 ++
 backends/hostmem.c       | 43 +++++++++++++++++++++++++++++++++++++++----
 vl.c                     | 14 ++++++++++----
 3 files changed, 51 insertions(+), 8 deletions(-)

diff --git a/include/sysemu/hostmem.h b/include/sysemu/hostmem.h
index 5db0d66..bdf8666 100644
--- a/include/sysemu/hostmem.h
+++ b/include/sysemu/hostmem.h
@@ -61,6 +61,7 @@ struct HostMemoryBackendClass {
  * @parent: opaque parent object container
  * @size: amount of memory backend provides
  * @mr: MemoryRegion representing host memory belonging to backend
+ * @prealloc_threads: number of threads to be used for preallocatining RAM
  */
 struct HostMemoryBackend {
     /* private */
@@ -70,6 +71,7 @@ struct HostMemoryBackend {
     uint64_t size;
     bool merge, dump, use_canonical_path;
     bool prealloc, force_prealloc, is_mapped, share;
+    uint32_t prealloc_threads;
     DECLARE_BITMAP(host_nodes, MAX_NODES + 1);
     HostMemPolicy policy;
=20
diff --git a/backends/hostmem.c b/backends/hostmem.c
index e773bdf..0988986 100644
--- a/backends/hostmem.c
+++ b/backends/hostmem.c
@@ -223,7 +223,6 @@ static void host_memory_backend_set_prealloc(Object *ob=
j, bool value,
 {
     Error *local_err =3D NULL;
     HostMemoryBackend *backend =3D MEMORY_BACKEND(obj);
-    MachineState *ms =3D MACHINE(qdev_get_machine());
=20
     if (backend->force_prealloc) {
         if (value) {
@@ -243,7 +242,7 @@ static void host_memory_backend_set_prealloc(Object *ob=
j, bool value,
         void *ptr =3D memory_region_get_ram_ptr(&backend->mr);
         uint64_t sz =3D memory_region_size(&backend->mr);
=20
-        os_mem_prealloc(fd, ptr, sz, ms->smp.cpus, &local_err);
+        os_mem_prealloc(fd, ptr, sz, backend->prealloc_threads, &local_err=
);
         if (local_err) {
             error_propagate(errp, local_err);
             return;
@@ -252,14 +251,45 @@ static void host_memory_backend_set_prealloc(Object *=
obj, bool value,
     }
 }
=20
+static void host_memory_backend_get_prealloc_threads(Object *obj, Visitor =
*v,
+    const char *name, void *opaque, Error **errp)
+{
+    HostMemoryBackend *backend =3D MEMORY_BACKEND(obj);
+    visit_type_uint32(v, name, &backend->prealloc_threads, errp);
+}
+
+static void host_memory_backend_set_prealloc_threads(Object *obj, Visitor =
*v,
+    const char *name, void *opaque, Error **errp)
+{
+    HostMemoryBackend *backend =3D MEMORY_BACKEND(obj);
+    Error *local_err =3D NULL;
+    uint32_t value;
+
+    visit_type_uint32(v, name, &value, &local_err);
+    if (local_err) {
+        goto out;
+    }
+    if (value <=3D 0) {
+        error_setg(&local_err,
+                   "property '%s' of %s doesn't take value '%d'",
+                   name, object_get_typename(obj), value);
+        goto out;
+    }
+    backend->prealloc_threads =3D value;
+out:
+    error_propagate(errp, local_err);
+}
+
 static void host_memory_backend_init(Object *obj)
 {
     HostMemoryBackend *backend =3D MEMORY_BACKEND(obj);
     MachineState *machine =3D MACHINE(qdev_get_machine());
=20
+    /* TODO: convert access to globals to compat properties */
     backend->merge =3D machine_mem_merge(machine);
     backend->dump =3D machine_dump_guest_core(machine);
     backend->prealloc =3D mem_prealloc;
+    backend->prealloc_threads =3D 1;
 }
=20
 static void host_memory_backend_post_init(Object *obj)
@@ -313,7 +343,6 @@ host_memory_backend_memory_complete(UserCreatable *uc, =
Error **errp)
 {
     HostMemoryBackend *backend =3D MEMORY_BACKEND(uc);
     HostMemoryBackendClass *bc =3D MEMORY_BACKEND_GET_CLASS(uc);
-    MachineState *ms =3D MACHINE(qdev_get_machine());
     Error *local_err =3D NULL;
     void *ptr;
     uint64_t sz;
@@ -378,7 +407,7 @@ host_memory_backend_memory_complete(UserCreatable *uc, =
Error **errp)
          */
         if (backend->prealloc) {
             os_mem_prealloc(memory_region_get_fd(&backend->mr), ptr, sz,
-                            ms->smp.cpus, &local_err);
+                            backend->prealloc_threads, &local_err);
             if (local_err) {
                 goto out;
             }
@@ -456,6 +485,12 @@ host_memory_backend_class_init(ObjectClass *oc, void *=
data)
         host_memory_backend_set_prealloc, &error_abort);
     object_class_property_set_description(oc, "prealloc",
         "Preallocate memory", &error_abort);
+    object_class_property_add(oc, "prealloc-threads", "int",
+        host_memory_backend_get_prealloc_threads,
+        host_memory_backend_set_prealloc_threads,
+        NULL, NULL, &error_abort);
+    object_class_property_set_description(oc, "prealloc-threads",
+        "Number of CPU threads to use for prealloc", &error_abort);
     object_class_property_add(oc, "size", "int",
         host_memory_backend_get_size,
         host_memory_backend_set_size,
diff --git a/vl.c b/vl.c
index 7f12666..9a63487 100644
--- a/vl.c
+++ b/vl.c
@@ -2862,8 +2862,7 @@ static void configure_accelerators(const char *progna=
me)
     }
 }
=20
-static void create_default_memdev(MachineState *ms, const char *path,
-                                  bool prealloc)
+static void create_default_memdev(MachineState *ms, const char *path)
 {
     Object *obj;
     MachineClass *mc =3D MACHINE_GET_CLASS(ms);
@@ -2872,7 +2871,6 @@ static void create_default_memdev(MachineState *ms, c=
onst char *path,
     if (path) {
         object_property_set_str(obj, path, "mem-path", &error_fatal);
     }
-    object_property_set_bool(obj, prealloc, "prealloc", &error_fatal);
     object_property_set_int(obj, ms->ram_size, "size", &error_fatal);
     object_property_add_child(object_get_objects_root(), mc->default_ram_i=
d,
                               obj, &error_fatal);
@@ -4014,6 +4012,14 @@ int main(int argc, char **argv, char **envp)
         exit(1);
     }
=20
+    if (mem_prealloc) {
+        char *val;
+
+        val =3D g_strdup_printf("%d", current_machine->smp.cpus);
+        object_register_sugar_prop("memory-backend", "prealloc-threads", v=
al);
+        g_free(val);
+    }
+
     /*
      * Get the default machine options from the machine if it is not alrea=
dy
      * specified either by the configuration file or by the command line.
@@ -4341,7 +4347,7 @@ int main(int argc, char **argv, char **envp)
=20
     if (machine_class->default_ram_id && current_machine->ram_size &&
         numa_uses_legacy_mem() && !current_machine->ram_memdev_id) {
-        create_default_memdev(current_machine, mem_path, mem_prealloc);
+        create_default_memdev(current_machine, mem_path);
     }
     /* do monitor/qmp handling at preconfig state if requested */
     main_loop();
--=20
2.7.4


