Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 68700714A0
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Jul 2019 11:08:13 +0200 (CEST)
Received: from localhost ([::1]:40452 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hpqmK-00053v-54
	for lists+qemu-devel@lfdr.de; Tue, 23 Jul 2019 05:08:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41545)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <sgarzare@redhat.com>) id 1hpqll-0003Su-3M
 for qemu-devel@nongnu.org; Tue, 23 Jul 2019 05:07:38 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <sgarzare@redhat.com>) id 1hpqlj-00024X-2s
 for qemu-devel@nongnu.org; Tue, 23 Jul 2019 05:07:36 -0400
Received: from mx1.redhat.com ([209.132.183.28]:28182)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <sgarzare@redhat.com>) id 1hpqlh-00021g-2C
 for qemu-devel@nongnu.org; Tue, 23 Jul 2019 05:07:34 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 918D23084242;
 Tue, 23 Jul 2019 09:07:30 +0000 (UTC)
Received: from steredhat.redhat.com (unknown [10.36.118.55])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D0F2B5D9C5;
 Tue, 23 Jul 2019 09:07:26 +0000 (UTC)
From: Stefano Garzarella <sgarzare@redhat.com>
To: qemu-devel@nongnu.org
Date: Tue, 23 Jul 2019 11:07:17 +0200
Message-Id: <20190723090718.14590-2-sgarzare@redhat.com>
In-Reply-To: <20190723090718.14590-1-sgarzare@redhat.com>
References: <20190723090718.14590-1-sgarzare@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.40]); Tue, 23 Jul 2019 09:07:30 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PATCH 1/2] elf-ops.h: Map into memory the ELF to load
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
Cc: Eduardo Habkost <ehabkost@redhat.com>, Sergio Lopez <slp@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Julio Montes <julio.montes@intel.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

In order to reduce the memory footprint we map into memory
the ELF to load using g_mapped_file_new_from_fd() instead of
reading each sections. In this way we can share the ELF pages
between multiple instances of QEMU.

Suggested-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
Suggested-by: Paolo Bonzini <pbonzini@redhat.com>
Signed-off-by: Stefano Garzarella <sgarzare@redhat.com>
---
 include/hw/elf_ops.h | 59 ++++++++++++++++++++++----------------------
 1 file changed, 30 insertions(+), 29 deletions(-)

diff --git a/include/hw/elf_ops.h b/include/hw/elf_ops.h
index 690f9238c8..69ce8dea74 100644
--- a/include/hw/elf_ops.h
+++ b/include/hw/elf_ops.h
@@ -323,8 +323,9 @@ static int glue(load_elf, SZ)(const char *name, int f=
d,
     struct elfhdr ehdr;
     struct elf_phdr *phdr =3D NULL, *ph;
     int size, i, total_size;
-    elf_word mem_size, file_size;
+    elf_word mem_size, file_size, data_offset;
     uint64_t addr, low =3D (uint64_t)-1, high =3D 0;
+    GMappedFile *gmf =3D NULL;
     uint8_t *data =3D NULL;
     char label[128];
     int ret =3D ELF_LOAD_FAILED;
@@ -409,22 +410,26 @@ static int glue(load_elf, SZ)(const char *name, int=
 fd,
         }
     }
=20
+    gmf =3D g_mapped_file_new_from_fd(fd, false, NULL);
+    if (!gmf) {
+        goto fail;
+    }
+
     total_size =3D 0;
     for(i =3D 0; i < ehdr.e_phnum; i++) {
         ph =3D &phdr[i];
         if (ph->p_type =3D=3D PT_LOAD) {
             mem_size =3D ph->p_memsz; /* Size of the ROM */
             file_size =3D ph->p_filesz; /* Size of the allocated data */
-            data =3D g_malloc0(file_size);
-            if (ph->p_filesz > 0) {
-                if (lseek(fd, ph->p_offset, SEEK_SET) < 0) {
-                    goto fail;
-                }
-                if (read(fd, data, file_size) !=3D file_size) {
-                    goto fail;
-                }
+            data_offset =3D ph->p_offset; /* Offset where the data is lo=
cated */
+
+            if (g_mapped_file_get_length(gmf) < file_size + data_offset)=
 {
+                goto fail;
             }
=20
+            data =3D (uint8_t *)g_mapped_file_get_contents(gmf);
+            data +=3D data_offset;
+
             /* The ELF spec is somewhat vague about the purpose of the
              * physical address field. One common use in the embedded wo=
rld
              * is that physical address field specifies the load address
@@ -513,17 +518,16 @@ static int glue(load_elf, SZ)(const char *name, int=
 fd,
                 *pentry =3D ehdr.e_entry - ph->p_vaddr + ph->p_paddr;
             }
=20
-            if (mem_size =3D=3D 0) {
-                /* Some ELF files really do have segments of zero size;
-                 * just ignore them rather than trying to create empty
-                 * ROM blobs, because the zero-length blob can falsely
-                 * trigger the overlapping-ROM-blobs check.
-                 */
-                g_free(data);
-            } else {
+            /* Some ELF files really do have segments of zero size;
+             * just ignore them rather than trying to create empty
+             * ROM blobs, because the zero-length blob can falsely
+             * trigger the overlapping-ROM-blobs check.
+             */
+            if (mem_size !=3D 0) {
                 if (load_rom) {
                     snprintf(label, sizeof(label), "phdr #%d: %s", i, na=
me);
-
+                    /* Increments the reference count to avoid the unmap=
 */
+                    g_mapped_file_ref(gmf);
                     /* rom_add_elf_program() seize the ownership of 'dat=
a' */
                     rom_add_elf_program(label, data, file_size, mem_size=
,
                                         addr, as);
@@ -531,7 +535,6 @@ static int glue(load_elf, SZ)(const char *name, int f=
d,
                     address_space_write(as ? as : &address_space_memory,
                                         addr, MEMTXATTRS_UNSPECIFIED,
                                         data, file_size);
-                    g_free(data);
                 }
             }
=20
@@ -547,16 +550,15 @@ static int glue(load_elf, SZ)(const char *name, int=
 fd,
             struct elf_note *nhdr =3D NULL;
=20
             file_size =3D ph->p_filesz; /* Size of the range of ELF note=
s */
-            data =3D g_malloc0(file_size);
-            if (ph->p_filesz > 0) {
-                if (lseek(fd, ph->p_offset, SEEK_SET) < 0) {
-                    goto fail;
-                }
-                if (read(fd, data, file_size) !=3D file_size) {
-                    goto fail;
-                }
+            data_offset =3D ph->p_offset; /* Offset where the notes are =
located */
+
+            if (g_mapped_file_get_length(gmf) < file_size + data_offset)=
 {
+                goto fail;
             }
=20
+            data =3D (uint8_t *)g_mapped_file_get_contents(gmf);
+            data +=3D data_offset;
+
             /*
              * Search the ELF notes to find one with a type matching the
              * value passed in via 'translate_opaque'
@@ -570,7 +572,6 @@ static int glue(load_elf, SZ)(const char *name, int f=
d,
                     sizeof(struct elf_note) =3D=3D sizeof(struct elf64_n=
ote);
                 elf_note_fn((void *)nhdr, (void *)&ph->p_align, is64);
             }
-            g_free(data);
             data =3D NULL;
         }
     }
@@ -582,7 +583,7 @@ static int glue(load_elf, SZ)(const char *name, int f=
d,
         *highaddr =3D (uint64_t)(elf_sword)high;
     return total_size;
  fail:
-    g_free(data);
+    g_mapped_file_unref(gmf);
     g_free(phdr);
     return ret;
 }
--=20
2.20.1


