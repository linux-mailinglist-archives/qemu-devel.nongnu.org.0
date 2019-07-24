Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D281731B2
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Jul 2019 16:31:59 +0200 (CEST)
Received: from localhost ([::1]:52164 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hqIJC-0004Ur-PP
	for lists+qemu-devel@lfdr.de; Wed, 24 Jul 2019 10:31:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58733)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <sgarzare@redhat.com>) id 1hqIIa-0002SG-St
 for qemu-devel@nongnu.org; Wed, 24 Jul 2019 10:31:22 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <sgarzare@redhat.com>) id 1hqIIZ-00055X-LM
 for qemu-devel@nongnu.org; Wed, 24 Jul 2019 10:31:20 -0400
Received: from mx1.redhat.com ([209.132.183.28]:55322)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <sgarzare@redhat.com>) id 1hqIIZ-00053d-DU
 for qemu-devel@nongnu.org; Wed, 24 Jul 2019 10:31:19 -0400
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 1EA6DC057F2E;
 Wed, 24 Jul 2019 14:31:17 +0000 (UTC)
Received: from steredhat.redhat.com (ovpn-117-46.ams2.redhat.com
 [10.36.117.46])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9C89F60BEC;
 Wed, 24 Jul 2019 14:31:14 +0000 (UTC)
From: Stefano Garzarella <sgarzare@redhat.com>
To: qemu-devel@nongnu.org
Date: Wed, 24 Jul 2019 16:31:03 +0200
Message-Id: <20190724143105.307042-2-sgarzare@redhat.com>
In-Reply-To: <20190724143105.307042-1-sgarzare@redhat.com>
References: <20190724143105.307042-1-sgarzare@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.32]); Wed, 24 Jul 2019 14:31:17 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PATCH v4 1/3] loader: Handle memory-mapped ELFs
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Eduardo Habkost <ehabkost@redhat.com>, Sergio Lopez <slp@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Julio Montes <julio.montes@intel.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This patch allows handling an ELF memory-mapped, taking care
the reference count of the GMappedFile* passed through
rom_add_elf_program().
In this case, the 'data' pointer is not heap-allocated, so
we cannot free it.

Suggested-by: Paolo Bonzini <pbonzini@redhat.com>
Signed-off-by: Stefano Garzarella <sgarzare@redhat.com>
---
v4:
  - fix the rom_add_elf_program() comment [Paolo]
---
 hw/core/loader.c     | 38 ++++++++++++++++++++++++++++++--------
 include/hw/elf_ops.h |  2 +-
 include/hw/loader.h  |  5 +++--
 3 files changed, 34 insertions(+), 11 deletions(-)

diff --git a/hw/core/loader.c b/hw/core/loader.c
index 425bf69a99..9fb93a6541 100644
--- a/hw/core/loader.c
+++ b/hw/core/loader.c
@@ -836,6 +836,7 @@ struct Rom {
     int isrom;
     char *fw_dir;
     char *fw_file;
+    GMappedFile *mapped_file;
=20
     bool committed;
=20
@@ -846,10 +847,25 @@ struct Rom {
 static FWCfgState *fw_cfg;
 static QTAILQ_HEAD(, Rom) roms =3D QTAILQ_HEAD_INITIALIZER(roms);
=20
-/* rom->data must be heap-allocated (do not use with rom_add_elf_program=
()) */
+/*
+ * rom->data can be heap-allocated or memory-mapped (e.g. when added wit=
h
+ * rom_add_elf_program())
+ */
+static void rom_free_data(Rom *rom)
+{
+    if (rom->mapped_file) {
+        g_mapped_file_unref(rom->mapped_file);
+        rom->mapped_file =3D NULL;
+    } else {
+        g_free(rom->data);
+    }
+
+    rom->data =3D NULL;
+}
+
 static void rom_free(Rom *rom)
 {
-    g_free(rom->data);
+    rom_free_data(rom);
     g_free(rom->path);
     g_free(rom->name);
     g_free(rom->fw_dir);
@@ -1056,11 +1072,12 @@ MemoryRegion *rom_add_blob(const char *name, cons=
t void *blob, size_t len,
=20
 /* This function is specific for elf program because we don't need to al=
locate
  * all the rom. We just allocate the first part and the rest is just zer=
os. This
- * is why romsize and datasize are different. Also, this function seize =
the
- * memory ownership of "data", so we don't have to allocate and copy the=
 buffer.
+ * is why romsize and datasize are different. Also, this function takes =
its own
+ * reference to "mapped_file", so we don't have to allocate and copy the=
 buffer.
  */
-int rom_add_elf_program(const char *name, void *data, size_t datasize,
-                        size_t romsize, hwaddr addr, AddressSpace *as)
+int rom_add_elf_program(const char *name, GMappedFile *mapped_file, void=
 *data,
+                        size_t datasize, size_t romsize, hwaddr addr,
+                        AddressSpace *as)
 {
     Rom *rom;
=20
@@ -1071,6 +1088,12 @@ int rom_add_elf_program(const char *name, void *da=
ta, size_t datasize,
     rom->romsize  =3D romsize;
     rom->data     =3D data;
     rom->as       =3D as;
+
+    if (mapped_file && data) {
+        g_mapped_file_ref(mapped_file);
+        rom->mapped_file =3D mapped_file;
+    }
+
     rom_insert(rom);
     return 0;
 }
@@ -1105,8 +1128,7 @@ static void rom_reset(void *unused)
         }
         if (rom->isrom) {
             /* rom needs to be written only once */
-            g_free(rom->data);
-            rom->data =3D NULL;
+            rom_free_data(rom);
         }
         /*
          * The rom loader is really on the same level as firmware in the=
 guest
diff --git a/include/hw/elf_ops.h b/include/hw/elf_ops.h
index 690f9238c8..fede37ee9c 100644
--- a/include/hw/elf_ops.h
+++ b/include/hw/elf_ops.h
@@ -525,7 +525,7 @@ static int glue(load_elf, SZ)(const char *name, int f=
d,
                     snprintf(label, sizeof(label), "phdr #%d: %s", i, na=
me);
=20
                     /* rom_add_elf_program() seize the ownership of 'dat=
a' */
-                    rom_add_elf_program(label, data, file_size, mem_size=
,
+                    rom_add_elf_program(label, NULL, data, file_size, me=
m_size,
                                         addr, as);
                 } else {
                     address_space_write(as ? as : &address_space_memory,
diff --git a/include/hw/loader.h b/include/hw/loader.h
index 3e1b3a4566..07fd9286e7 100644
--- a/include/hw/loader.h
+++ b/include/hw/loader.h
@@ -258,8 +258,9 @@ MemoryRegion *rom_add_blob(const char *name, const vo=
id *blob, size_t len,
                            FWCfgCallback fw_callback,
                            void *callback_opaque, AddressSpace *as,
                            bool read_only);
-int rom_add_elf_program(const char *name, void *data, size_t datasize,
-                        size_t romsize, hwaddr addr, AddressSpace *as);
+int rom_add_elf_program(const char *name, GMappedFile *mapped_file, void=
 *data,
+                        size_t datasize, size_t romsize, hwaddr addr,
+                        AddressSpace *as);
 int rom_check_and_register_reset(void);
 void rom_set_fw(FWCfgState *f);
 void rom_set_order_override(int order);
--=20
2.20.1


