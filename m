Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D877F14C989
	for <lists+qemu-devel@lfdr.de>; Wed, 29 Jan 2020 12:24:35 +0100 (CET)
Received: from localhost ([::1]:44548 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iwlST-0006Ue-AE
	for lists+qemu-devel@lfdr.de; Wed, 29 Jan 2020 06:24:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60250)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <quintela@redhat.com>) id 1iwlKt-0002Sn-Ak
 for qemu-devel@nongnu.org; Wed, 29 Jan 2020 06:16:44 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <quintela@redhat.com>) id 1iwlKs-0006ei-6g
 for qemu-devel@nongnu.org; Wed, 29 Jan 2020 06:16:43 -0500
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:21066
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <quintela@redhat.com>) id 1iwlKs-0006eP-2O
 for qemu-devel@nongnu.org; Wed, 29 Jan 2020 06:16:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1580296601;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=gJIadrTNkzEmMqCAUdGwvBZO5d00l8VMeCgOqcs5A8I=;
 b=eO1HNy8jHi/GNsg+Ul7GCp+F0PzlYH06mqb+Xv8hRqCIpy3K3beJSHvoEc7tGM8qZN5Mpq
 dOHmH03WPQ3e7agZMiwjYZDFE8+QrXkzPwrnCnVXuJJcPMT6E0Gb3XTDFz6z5qx8YB4Qfg
 vWLT3dPqU5B3u341UvAybjRoA6a17l8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-395-wGr03NNDM82lfznCrFxdig-1; Wed, 29 Jan 2020 06:16:38 -0500
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6B86263AD8
 for <qemu-devel@nongnu.org>; Wed, 29 Jan 2020 11:16:37 +0000 (UTC)
Received: from secure.mitica (ovpn-116-64.ams2.redhat.com [10.36.116.64])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 5F11889D2E;
 Wed, 29 Jan 2020 11:16:33 +0000 (UTC)
From: Juan Quintela <quintela@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 17/18] migration: Simplify get_qlist
Date: Wed, 29 Jan 2020 12:15:35 +0100
Message-Id: <20200129111536.9497-18-quintela@redhat.com>
In-Reply-To: <20200129111536.9497-1-quintela@redhat.com>
References: <20200129111536.9497-1-quintela@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-MC-Unique: wGr03NNDM82lfznCrFxdig-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
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
Cc: Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Juan Quintela <quintela@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Eric Auger <eric.auger@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Eric Auger <eric.auger@redhat.com>

Instead of inserting read elements at the head and
then reversing the list, it is simpler to add
each element after the previous one. Introduce
QLIST_RAW_INSERT_AFTER helper and use it in
get_qlist().

Signed-off-by: Eric Auger <eric.auger@redhat.com>
Suggested-by: Juan Quintela <quintela@redhat.com>
Reviewed-by: Juan Quintela <quintela@redhat.com>
Signed-off-by: Juan Quintela <quintela@redhat.com>
---
 include/qemu/queue.h      | 19 ++++++-------------
 migration/vmstate-types.c | 10 +++++++---
 2 files changed, 13 insertions(+), 16 deletions(-)

diff --git a/include/qemu/queue.h b/include/qemu/queue.h
index 4d4554a7ce..19425f973f 100644
--- a/include/qemu/queue.h
+++ b/include/qemu/queue.h
@@ -515,6 +515,12 @@ union {                                               =
                  \
              (elm);                                                       =
     \
              (elm) =3D *QLIST_RAW_NEXT(elm, entry))
=20
+#define QLIST_RAW_INSERT_AFTER(head, prev, elem, entry) do {              =
     \
+        *QLIST_RAW_NEXT(prev, entry) =3D elem;                            =
       \
+        *QLIST_RAW_PREVIOUS(elem, entry) =3D QLIST_RAW_NEXT(prev, entry); =
       \
+        *QLIST_RAW_NEXT(elem, entry) =3D NULL;                            =
       \
+} while (0)
+
 #define QLIST_RAW_INSERT_HEAD(head, elm, entry) do {                      =
     \
         void *first =3D *QLIST_RAW_FIRST(head);                           =
       \
         *QLIST_RAW_FIRST(head) =3D elm;                                   =
       \
@@ -527,17 +533,4 @@ union {                                               =
                  \
         }                                                                 =
     \
 } while (0)
=20
-#define QLIST_RAW_REVERSE(head, elm, entry) do {                          =
     \
-        void *iter =3D *QLIST_RAW_FIRST(head), *prev =3D NULL, *next;     =
         \
-        while (iter) {                                                    =
     \
-            next =3D *QLIST_RAW_NEXT(iter, entry);                        =
       \
-            *QLIST_RAW_PREVIOUS(iter, entry) =3D QLIST_RAW_NEXT(next, entr=
y);    \
-            *QLIST_RAW_NEXT(iter, entry) =3D prev;                        =
       \
-            prev =3D iter;                                                =
       \
-            iter =3D next;                                                =
       \
-        }                                                                 =
     \
-        *QLIST_RAW_FIRST(head) =3D prev;                                  =
       \
-        *QLIST_RAW_PREVIOUS(prev, entry) =3D QLIST_RAW_FIRST(head);       =
       \
-} while (0)
-
 #endif /* QEMU_SYS_QUEUE_H */
diff --git a/migration/vmstate-types.c b/migration/vmstate-types.c
index 1eee36773a..35e784c9d9 100644
--- a/migration/vmstate-types.c
+++ b/migration/vmstate-types.c
@@ -879,7 +879,7 @@ static int get_qlist(QEMUFile *f, void *pv, size_t unus=
ed_size,
     /* offset of the QLIST entry in a QLIST element */
     size_t entry_offset =3D field->start;
     int version_id =3D field->version_id;
-    void *elm;
+    void *elm, *prev =3D NULL;
=20
     trace_get_qlist(field->name, vmsd->name, vmsd->version_id);
     if (version_id > vmsd->version_id) {
@@ -900,9 +900,13 @@ static int get_qlist(QEMUFile *f, void *pv, size_t unu=
sed_size,
             g_free(elm);
             return ret;
         }
-        QLIST_RAW_INSERT_HEAD(pv, elm, entry_offset);
+        if (!prev) {
+            QLIST_RAW_INSERT_HEAD(pv, elm, entry_offset);
+        } else {
+            QLIST_RAW_INSERT_AFTER(pv, prev, elm, entry_offset);
+        }
+        prev =3D elm;
     }
-    QLIST_RAW_REVERSE(pv, elm, entry_offset);
     trace_get_qlist_end(field->name, vmsd->name);
=20
     return ret;
--=20
2.24.1


