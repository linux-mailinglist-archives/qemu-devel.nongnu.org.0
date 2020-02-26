Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F3D4170393
	for <lists+qemu-devel@lfdr.de>; Wed, 26 Feb 2020 16:59:10 +0100 (CET)
Received: from localhost ([::1]:46272 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j6z5Z-0002hH-HM
	for lists+qemu-devel@lfdr.de; Wed, 26 Feb 2020 10:59:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34074)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <david@redhat.com>) id 1j6z0c-0003CW-6b
 for qemu-devel@nongnu.org; Wed, 26 Feb 2020 10:54:03 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <david@redhat.com>) id 1j6z0X-00032o-CD
 for qemu-devel@nongnu.org; Wed, 26 Feb 2020 10:54:02 -0500
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:55378
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <david@redhat.com>) id 1j6z0X-00032Z-7j
 for qemu-devel@nongnu.org; Wed, 26 Feb 2020 10:53:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1582732436;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4lo7TzPtbse+6KrfKG4j+3yQgCIcw9GUEJgSgD8BmtU=;
 b=EYvEC+Z88nbbkijQUhEESYWgnsixWPGIcNwoetQLkZA0ivCUhdVgVeq62x5uqzgIzD7LEQ
 DGDxRDHuon2cSUTbPZNkqPxfy3FJo4JX27AsoQL1fyBKsQPLMNXZKMzt2B6K7i6t6pWAy+
 FNlgXBlb2osjlwAApgMKHWuMJ/qHZdw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-216-jpc_k4mTOaKbu1eb7lozXQ-1; Wed, 26 Feb 2020 10:53:55 -0500
X-MC-Unique: jpc_k4mTOaKbu1eb7lozXQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 318AE102C88C;
 Wed, 26 Feb 2020 15:53:54 +0000 (UTC)
Received: from t480s.redhat.com (ovpn-117-196.ams2.redhat.com [10.36.117.196])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 702C4100E7E3;
 Wed, 26 Feb 2020 15:53:52 +0000 (UTC)
From: David Hildenbrand <david@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 08/13] migration/ram: Simplify host page handling in
 ram_load_postcopy()
Date: Wed, 26 Feb 2020 16:52:59 +0100
Message-Id: <20200226155304.60219-9-david@redhat.com>
In-Reply-To: <20200226155304.60219-1-david@redhat.com>
References: <20200226155304.60219-1-david@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
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
Cc: Eduardo Habkost <ehabkost@redhat.com>, Juan Quintela <quintela@redhat.com>,
 David Hildenbrand <david@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>, Peter Xu <peterx@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Add two new helper functions. This will in come handy once we want to
handle ram block resizes while postcopy is active.

Cc: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Cc: Juan Quintela <quintela@redhat.com>
Cc: Peter Xu <peterx@redhat.com>
Signed-off-by: David Hildenbrand <david@redhat.com>
---
 migration/ram.c | 54 ++++++++++++++++++++++++++++---------------------
 1 file changed, 31 insertions(+), 23 deletions(-)

diff --git a/migration/ram.c b/migration/ram.c
index d5a4d69e1c..f815f4e532 100644
--- a/migration/ram.c
+++ b/migration/ram.c
@@ -2734,6 +2734,20 @@ static inline void *host_from_ram_block_offset(RAMBl=
ock *block,
     return block->host + offset;
 }
=20
+static void *host_page_from_ram_block_offset(RAMBlock *block,
+                                             ram_addr_t offset)
+{
+    /* Note: Explicitly no check against offset_in_ramblock(). */
+    return (void *)QEMU_ALIGN_DOWN((uintptr_t)block->host + offset,
+                                   block->page_size);
+}
+
+static ram_addr_t host_page_offset_from_ram_block_offset(RAMBlock *block,
+                                                         ram_addr_t offset=
)
+{
+    return ((uintptr_t)block->host + offset) & (block->page_size - 1);
+}
+
 static inline void *colo_cache_from_block_offset(RAMBlock *block,
                                                  ram_addr_t offset)
 {
@@ -3111,13 +3125,12 @@ static int ram_load_postcopy(QEMUFile *f)
     MigrationIncomingState *mis =3D migration_incoming_get_current();
     /* Temporary page that is later 'placed' */
     void *postcopy_host_page =3D mis->postcopy_tmp_page;
-    void *this_host =3D NULL;
+    void *host_page =3D NULL;
     bool all_zero =3D false;
     int target_pages =3D 0;
=20
     while (!ret && !(flags & RAM_SAVE_FLAG_EOS)) {
         ram_addr_t addr;
-        void *host =3D NULL;
         void *page_buffer =3D NULL;
         void *place_source =3D NULL;
         RAMBlock *block =3D NULL;
@@ -3143,9 +3156,12 @@ static int ram_load_postcopy(QEMUFile *f)
         if (flags & (RAM_SAVE_FLAG_ZERO | RAM_SAVE_FLAG_PAGE |
                      RAM_SAVE_FLAG_COMPRESS_PAGE)) {
             block =3D ram_block_from_stream(f, flags);
+            if (!block) {
+                ret =3D -EINVAL;
+                break;
+            }
=20
-            host =3D host_from_ram_block_offset(block, addr);
-            if (!host) {
+            if (!offset_in_ramblock(block, addr)) {
                 error_report("Illegal RAM offset " RAM_ADDR_FMT, addr);
                 ret =3D -EINVAL;
                 break;
@@ -3163,21 +3179,18 @@ static int ram_load_postcopy(QEMUFile *f)
              * of a host page in one chunk.
              */
             page_buffer =3D postcopy_host_page +
-                          ((uintptr_t)host & (block->page_size - 1));
+                          host_page_offset_from_ram_block_offset(block, ad=
dr);
             /* If all TP are zero then we can optimise the place */
             if (target_pages =3D=3D 1) {
                 all_zero =3D true;
-                this_host =3D (void *)QEMU_ALIGN_DOWN((uintptr_t)host,
-                                                    block->page_size);
-            } else {
+                host_page =3D host_page_from_ram_block_offset(block, addr)=
;
+            } else if (host_page !=3D host_page_from_ram_block_offset(bloc=
k,
+                                                                    addr))=
 {
                 /* not the 1st TP within the HP */
-                if (QEMU_ALIGN_DOWN((uintptr_t)host, block->page_size) !=
=3D
-                    (uintptr_t)this_host) {
-                    error_report("Non-same host page %p/%p",
-                                  host, this_host);
-                    ret =3D -EINVAL;
-                    break;
-                }
+                error_report("Non-same host page %p/%p", host_page,
+                             host_page_from_ram_block_offset(block, addr))=
;
+                ret =3D -EINVAL;
+                break;
             }
=20
             /*
@@ -3257,16 +3270,11 @@ static int ram_load_postcopy(QEMUFile *f)
         }
=20
         if (!ret && place_needed) {
-            /* This gets called at the last target page in the host page *=
/
-            void *place_dest =3D (void *)QEMU_ALIGN_DOWN((uintptr_t)host,
-                                                       block->page_size);
-
             if (all_zero) {
-                ret =3D postcopy_place_page_zero(mis, place_dest,
-                                               block);
+                ret =3D postcopy_place_page_zero(mis, host_page, block);
             } else {
-                ret =3D postcopy_place_page(mis, place_dest,
-                                          place_source, block);
+                ret =3D postcopy_place_page(mis, host_page, place_source,
+                                          block);
             }
         }
     }
--=20
2.24.1


