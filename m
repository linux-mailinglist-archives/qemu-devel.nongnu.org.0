Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F0E613AA06
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Jan 2020 14:03:46 +0100 (CET)
Received: from localhost ([::1]:38984 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1irLrE-0003I4-PN
	for lists+qemu-devel@lfdr.de; Tue, 14 Jan 2020 08:03:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41137)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <quintela@redhat.com>) id 1irLix-0002oh-2S
 for qemu-devel@nongnu.org; Tue, 14 Jan 2020 07:55:12 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <quintela@redhat.com>) id 1irLit-0001m3-4j
 for qemu-devel@nongnu.org; Tue, 14 Jan 2020 07:55:10 -0500
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:54178
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <quintela@redhat.com>) id 1irLit-0001le-0s
 for qemu-devel@nongnu.org; Tue, 14 Jan 2020 07:55:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1579006506;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=52j2mgmiA4z5vA2yqyRSfUxDIXdlaCqV+gsG8XIQ6+k=;
 b=aXzdqvVb+mZjpSr0IZXAGDFku0iYOyUee1IxQcVGfmU6f8ZrmO+BPdjBDggUBmC+ji75Qq
 yQ7B1tOb9pKTWBI/KS+AVg85Z0am1VMmp3Oy9JS5LKI01X8JEWKKrhk6wU+WWN8/+hwleM
 prZzNK+p5QS72tS8dTg7umtp0mlqgjI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-170-qWwRMI4uPa20JK2lf4T8_Q-1; Tue, 14 Jan 2020 07:55:04 -0500
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E60FB800D50;
 Tue, 14 Jan 2020 12:55:02 +0000 (UTC)
Received: from secure.mitica (ovpn-116-207.ams2.redhat.com [10.36.116.207])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 0260D5D9E5;
 Tue, 14 Jan 2020 12:54:55 +0000 (UTC)
From: Juan Quintela <quintela@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 14/30] migration: savevm_state_handler_insert: constant-time
 element insertion
Date: Tue, 14 Jan 2020 13:52:38 +0100
Message-Id: <20200114125254.4515-15-quintela@redhat.com>
In-Reply-To: <20200114125254.4515-1-quintela@redhat.com>
References: <20200114125254.4515-1-quintela@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-MC-Unique: qWwRMI4uPa20JK2lf4T8_Q-1
X-Mimecast-Spam-Score: 0
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
Cc: Laurent Vivier <lvivier@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 Corey Minyard <cminyard@mvista.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Juan Quintela <quintela@redhat.com>,
 Stefan Weil <sw@weilnetz.de>, Jason Wang <jasowang@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Stefan Berger <stefanb@linux.ibm.com>, qemu-arm@nongnu.org,
 qemu-ppc@nongnu.org, Scott Cheloha <cheloha@linux.vnet.ibm.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Richard Henderson <rth@twiddle.net>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Scott Cheloha <cheloha@linux.vnet.ibm.com>

savevm_state's SaveStateEntry TAILQ is a priority queue.  Priority
sorting is maintained by searching from head to tail for a suitable
insertion spot.  Insertion is thus an O(n) operation.

If we instead keep track of the head of each priority's subqueue
within that larger queue we can reduce this operation to O(1) time.

savevm_state_handler_remove() becomes slightly more complex to
accomodate these gains: we need to replace the head of a priority's
subqueue when removing it.

With O(1) insertion, booting VMs with many SaveStateEntry objects is
more plausible.  For example, a ppc64 VM with maxmem=3D8T has 40000 such
objects to insert.

Signed-off-by: Scott Cheloha <cheloha@linux.vnet.ibm.com>
Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
Reviewed-by: Juan Quintela <quintela@redhat.com>
Signed-off-by: Juan Quintela <quintela@redhat.com>
---
 migration/savevm.c | 26 +++++++++++++++++++++++---
 1 file changed, 23 insertions(+), 3 deletions(-)

diff --git a/migration/savevm.c b/migration/savevm.c
index 30d980caa2..e57686bca7 100644
--- a/migration/savevm.c
+++ b/migration/savevm.c
@@ -250,6 +250,7 @@ typedef struct SaveStateEntry {
=20
 typedef struct SaveState {
     QTAILQ_HEAD(, SaveStateEntry) handlers;
+    SaveStateEntry *handler_pri_head[MIG_PRI_MAX + 1];
     int global_section_id;
     uint32_t len;
     const char *name;
@@ -261,6 +262,7 @@ typedef struct SaveState {
=20
 static SaveState savevm_state =3D {
     .handlers =3D QTAILQ_HEAD_INITIALIZER(savevm_state.handlers),
+    .handler_pri_head =3D { [MIG_PRI_DEFAULT ... MIG_PRI_MAX] =3D NULL },
     .global_section_id =3D 0,
 };
=20
@@ -709,24 +711,42 @@ static void savevm_state_handler_insert(SaveStateEntr=
y *nse)
 {
     MigrationPriority priority =3D save_state_priority(nse);
     SaveStateEntry *se;
+    int i;
=20
     assert(priority <=3D MIG_PRI_MAX);
=20
-    QTAILQ_FOREACH(se, &savevm_state.handlers, entry) {
-        if (save_state_priority(se) < priority) {
+    for (i =3D priority - 1; i >=3D 0; i--) {
+        se =3D savevm_state.handler_pri_head[i];
+        if (se !=3D NULL) {
+            assert(save_state_priority(se) < priority);
             break;
         }
     }
=20
-    if (se) {
+    if (i >=3D 0) {
         QTAILQ_INSERT_BEFORE(se, nse, entry);
     } else {
         QTAILQ_INSERT_TAIL(&savevm_state.handlers, nse, entry);
     }
+
+    if (savevm_state.handler_pri_head[priority] =3D=3D NULL) {
+        savevm_state.handler_pri_head[priority] =3D nse;
+    }
 }
=20
 static void savevm_state_handler_remove(SaveStateEntry *se)
 {
+    SaveStateEntry *next;
+    MigrationPriority priority =3D save_state_priority(se);
+
+    if (se =3D=3D savevm_state.handler_pri_head[priority]) {
+        next =3D QTAILQ_NEXT(se, entry);
+        if (next !=3D NULL && save_state_priority(next) =3D=3D priority) {
+            savevm_state.handler_pri_head[priority] =3D next;
+        } else {
+            savevm_state.handler_pri_head[priority] =3D NULL;
+        }
+    }
     QTAILQ_REMOVE(&savevm_state.handlers, se, entry);
 }
=20
--=20
2.24.1


