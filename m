Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BAC3914289B
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Jan 2020 11:56:25 +0100 (CET)
Received: from localhost ([::1]:33992 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1itUjI-0007aP-Fs
	for lists+qemu-devel@lfdr.de; Mon, 20 Jan 2020 05:56:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38002)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <quintela@redhat.com>) id 1itUQI-0006up-0r
 for qemu-devel@nongnu.org; Mon, 20 Jan 2020 05:36:50 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <quintela@redhat.com>) id 1itUQD-0002st-UN
 for qemu-devel@nongnu.org; Mon, 20 Jan 2020 05:36:45 -0500
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:46492
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <quintela@redhat.com>) id 1itUQD-0002se-QT
 for qemu-devel@nongnu.org; Mon, 20 Jan 2020 05:36:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1579516601;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Yr1WVaAouDj40R39IdfVYwIhtLx/Le0jqD+NYulh5As=;
 b=S6dA80JPHaRmIUWKt+z20laCQNKwLbP8MVHDLFnQPxBBxZl/EqLqumU4qHGPzRFto1PTjc
 hhtc09kHP12XWv7aO+QysjFMVLszupGMEpyFlQgele79iKBAbA/b02TfB2PuZC/VsHpn+y
 Uunu8zKr0hNE8DuXQV9aFsj90fCBTvA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-226-yL0risH0Mqivszhl5q07qw-1; Mon, 20 Jan 2020 05:36:38 -0500
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4A2F9190D37F;
 Mon, 20 Jan 2020 10:36:36 +0000 (UTC)
Received: from secure.mitica (ovpn-116-207.ams2.redhat.com [10.36.116.207])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C81711BC6D;
 Mon, 20 Jan 2020 10:36:31 +0000 (UTC)
From: Juan Quintela <quintela@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 19/29] migration/postcopy: enable compress during postcopy
Date: Mon, 20 Jan 2020 11:33:30 +0100
Message-Id: <20200120103340.25118-20-quintela@redhat.com>
In-Reply-To: <20200120103340.25118-1-quintela@redhat.com>
References: <20200120103340.25118-1-quintela@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-MC-Unique: yL0risH0Mqivszhl5q07qw-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
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
Cc: Laurent Vivier <lvivier@redhat.com>, Corey Minyard <cminyard@mvista.com>,
 Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, Stefan Weil <sw@weilnetz.de>,
 Jason Wang <jasowang@redhat.com>, Juan Quintela <quintela@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, qemu-arm@nongnu.org,
 qemu-ppc@nongnu.org, Wei Yang <richardw.yang@linux.intel.com>,
 David Gibson <david@gibson.dropbear.id.au>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Richard Henderson <rth@twiddle.net>, Stefan Berger <stefanb@linux.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Wei Yang <richardw.yang@linux.intel.com>

postcopy requires to place a whole host page, while migration thread
migrate memory in target page size. This makes postcopy need to collect
all target pages in one host page before placing via userfaultfd.

To enable compress during postcopy, there are two problems to solve:

    1. Random order for target page arrival
    2. Target pages in one host page arrives without interrupt by target
       page from other host page

The first one is handled by previous cleanup patch.

This patch handles the second one by:

    1. Flush compress thread for each host page
    2. Wait for decompress thread for before placing host page

Signed-off-by: Wei Yang <richardw.yang@linux.intel.com>
Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
Reviewed-by: Juan Quintela <quintela@redhat.com>
Signed-off-by: Juan Quintela <quintela@redhat.com>
---
 migration/migration.c | 11 -----------
 migration/ram.c       | 28 +++++++++++++++++++++++++++-
 2 files changed, 27 insertions(+), 12 deletions(-)

diff --git a/migration/migration.c b/migration/migration.c
index e55edee606..990bff00c0 100644
--- a/migration/migration.c
+++ b/migration/migration.c
@@ -1005,17 +1005,6 @@ static bool migrate_caps_check(bool *cap_list,
 #endif
=20
     if (cap_list[MIGRATION_CAPABILITY_POSTCOPY_RAM]) {
-        if (cap_list[MIGRATION_CAPABILITY_COMPRESS]) {
-            /* The decompression threads asynchronously write into RAM
-             * rather than use the atomic copies needed to avoid
-             * userfaulting.  It should be possible to fix the decompressi=
on
-             * threads for compatibility in future.
-             */
-            error_setg(errp, "Postcopy is not currently compatible "
-                       "with compression");
-            return false;
-        }
-
         /* This check is reasonably expensive, so only when it's being
          * set the first time, also it's only the destination that needs
          * special support.
diff --git a/migration/ram.c b/migration/ram.c
index a7414170e5..5f20c3d15d 100644
--- a/migration/ram.c
+++ b/migration/ram.c
@@ -3469,6 +3469,14 @@ static int ram_save_iterate(QEMUFile *f, void *opaqu=
e)
=20
             rs->target_page_count +=3D pages;
=20
+            /*
+             * During postcopy, it is necessary to make sure one whole hos=
t
+             * page is sent in one chunk.
+             */
+            if (migrate_postcopy_ram()) {
+                flush_compressed_data(rs);
+            }
+
             /*
              * we want to check in the 1st loop, just in case it was the 1=
st
              * time and we had to sync the dirty bitmap.
@@ -4061,6 +4069,7 @@ static int ram_load_postcopy(QEMUFile *f)
         void *place_source =3D NULL;
         RAMBlock *block =3D NULL;
         uint8_t ch;
+        int len;
=20
         addr =3D qemu_get_be64(f);
=20
@@ -4078,7 +4087,8 @@ static int ram_load_postcopy(QEMUFile *f)
=20
         trace_ram_load_postcopy_loop((uint64_t)addr, flags);
         place_needed =3D false;
-        if (flags & (RAM_SAVE_FLAG_ZERO | RAM_SAVE_FLAG_PAGE)) {
+        if (flags & (RAM_SAVE_FLAG_ZERO | RAM_SAVE_FLAG_PAGE |
+                     RAM_SAVE_FLAG_COMPRESS_PAGE)) {
             block =3D ram_block_from_stream(f, flags);
=20
             host =3D host_from_ram_block_offset(block, addr);
@@ -4161,6 +4171,17 @@ static int ram_load_postcopy(QEMUFile *f)
                                          TARGET_PAGE_SIZE);
             }
             break;
+        case RAM_SAVE_FLAG_COMPRESS_PAGE:
+            all_zero =3D false;
+            len =3D qemu_get_be32(f);
+            if (len < 0 || len > compressBound(TARGET_PAGE_SIZE)) {
+                error_report("Invalid compressed data length: %d", len);
+                ret =3D -EINVAL;
+                break;
+            }
+            decompress_data_with_multi_threads(f, page_buffer, len);
+            break;
+
         case RAM_SAVE_FLAG_EOS:
             /* normal exit */
             multifd_recv_sync_main();
@@ -4172,6 +4193,11 @@ static int ram_load_postcopy(QEMUFile *f)
             break;
         }
=20
+        /* Got the whole host page, wait for decompress before placing. */
+        if (place_needed) {
+            ret |=3D wait_for_decompress_done();
+        }
+
         /* Detect for any possible file errors */
         if (!ret && qemu_file_get_error(f)) {
             ret =3D qemu_file_get_error(f);
--=20
2.24.1


