Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CDB2BD4859
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Oct 2019 21:21:11 +0200 (CEST)
Received: from localhost ([::1]:56172 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iJ0TO-00048b-CW
	for lists+qemu-devel@lfdr.de; Fri, 11 Oct 2019 15:21:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37520)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <dgilbert@redhat.com>) id 1iJ0PW-0000GR-4b
 for qemu-devel@nongnu.org; Fri, 11 Oct 2019 15:17:11 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <dgilbert@redhat.com>) id 1iJ0PU-0003oR-Ur
 for qemu-devel@nongnu.org; Fri, 11 Oct 2019 15:17:10 -0400
Received: from mx1.redhat.com ([209.132.183.28]:37872)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <dgilbert@redhat.com>) id 1iJ0PU-0003nW-LF
 for qemu-devel@nongnu.org; Fri, 11 Oct 2019 15:17:08 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 829CE18CB8F0;
 Fri, 11 Oct 2019 19:17:07 +0000 (UTC)
Received: from dgilbert-t580.localhost (ovpn-117-210.ams2.redhat.com
 [10.36.117.210])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 58E7C5D784;
 Fri, 11 Oct 2019 19:17:06 +0000 (UTC)
From: "Dr. David Alan Gilbert (git)" <dgilbert@redhat.com>
To: qemu-devel@nongnu.org, quintela@redhat.com, eric.auger@redhat.com,
 richardw.yang@linux.intel.com
Subject: [PULL 08/21] migration/postcopy: allocate tmp_page in setup stage
Date: Fri, 11 Oct 2019 20:16:33 +0100
Message-Id: <20191011191646.226814-9-dgilbert@redhat.com>
In-Reply-To: <20191011191646.226814-1-dgilbert@redhat.com>
References: <20191011191646.226814-1-dgilbert@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2
 (mx1.redhat.com [10.5.110.63]); Fri, 11 Oct 2019 19:17:07 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.132.183.28
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
Cc: peterx@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Wei Yang <richardw.yang@linux.intel.com>

During migration, a tmp page is allocated so that we could place a whole
host page during postcopy.

Currently the page is allocated during load stage, this is a little bit
late. And more important, if we failed to allocate it, the error is not
checked properly. Even it is NULL, we would still use it.

This patch moves the allocation to setup stage and if failed error
message would be printed and caller would notice it.

Signed-off-by: Wei Yang <richardw.yang@linux.intel.com>
Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
---
 migration/postcopy-ram.c | 40 ++++++++++------------------------------
 migration/postcopy-ram.h |  7 -------
 migration/ram.c          |  2 +-
 3 files changed, 11 insertions(+), 38 deletions(-)

diff --git a/migration/postcopy-ram.c b/migration/postcopy-ram.c
index 1f63e65ed7..9a16f52a79 100644
--- a/migration/postcopy-ram.c
+++ b/migration/postcopy-ram.c
@@ -1134,6 +1134,16 @@ int postcopy_ram_enable_notify(MigrationIncomingSt=
ate *mis)
         return -1;
     }
=20
+    mis->postcopy_tmp_page =3D mmap(NULL, mis->largest_page_size,
+                                  PROT_READ | PROT_WRITE, MAP_PRIVATE |
+                                  MAP_ANONYMOUS, -1, 0);
+    if (mis->postcopy_tmp_page =3D=3D MAP_FAILED) {
+        mis->postcopy_tmp_page =3D NULL;
+        error_report("%s: Failed to map postcopy_tmp_page %s",
+                     __func__, strerror(errno));
+        return -1;
+    }
+
     /*
      * Ballooning can mark pages as absent while we're postcopying
      * that would cause false userfaults.
@@ -1260,30 +1270,6 @@ int postcopy_place_page_zero(MigrationIncomingStat=
e *mis, void *host,
     }
 }
=20
-/*
- * Returns a target page of memory that can be mapped at a later point i=
n time
- * using postcopy_place_page
- * The same address is used repeatedly, postcopy_place_page just takes t=
he
- * backing page away.
- * Returns: Pointer to allocated page
- *
- */
-void *postcopy_get_tmp_page(MigrationIncomingState *mis)
-{
-    if (!mis->postcopy_tmp_page) {
-        mis->postcopy_tmp_page =3D mmap(NULL, mis->largest_page_size,
-                             PROT_READ | PROT_WRITE, MAP_PRIVATE |
-                             MAP_ANONYMOUS, -1, 0);
-        if (mis->postcopy_tmp_page =3D=3D MAP_FAILED) {
-            mis->postcopy_tmp_page =3D NULL;
-            error_report("%s: %s", __func__, strerror(errno));
-            return NULL;
-        }
-    }
-
-    return mis->postcopy_tmp_page;
-}
-
 #else
 /* No target OS support, stubs just fail */
 void fill_destination_postcopy_migration_info(MigrationInfo *info)
@@ -1341,12 +1327,6 @@ int postcopy_place_page_zero(MigrationIncomingStat=
e *mis, void *host,
     return -1;
 }
=20
-void *postcopy_get_tmp_page(MigrationIncomingState *mis)
-{
-    assert(0);
-    return NULL;
-}
-
 int postcopy_wake_shared(struct PostCopyFD *pcfd,
                          uint64_t client_addr,
                          RAMBlock *rb)
diff --git a/migration/postcopy-ram.h b/migration/postcopy-ram.h
index 9c8bd2bae0..fb4cd11d28 100644
--- a/migration/postcopy-ram.h
+++ b/migration/postcopy-ram.h
@@ -100,13 +100,6 @@ typedef enum {
     POSTCOPY_INCOMING_END
 } PostcopyState;
=20
-/*
- * Allocate a page of memory that can be mapped at a later point in time
- * using postcopy_place_page
- * Returns: Pointer to allocated page
- */
-void *postcopy_get_tmp_page(MigrationIncomingState *mis);
-
 PostcopyState postcopy_state_get(void);
 /* Set the state and return the old state */
 PostcopyState postcopy_state_set(PostcopyState new_state);
diff --git a/migration/ram.c b/migration/ram.c
index e29c8b3408..071687ef37 100644
--- a/migration/ram.c
+++ b/migration/ram.c
@@ -4032,7 +4032,7 @@ static int ram_load_postcopy(QEMUFile *f)
     bool matches_target_page_size =3D false;
     MigrationIncomingState *mis =3D migration_incoming_get_current();
     /* Temporary page that is later 'placed' */
-    void *postcopy_host_page =3D postcopy_get_tmp_page(mis);
+    void *postcopy_host_page =3D mis->postcopy_tmp_page;
     void *last_host =3D NULL;
     bool all_zero =3D false;
=20
--=20
2.23.0


