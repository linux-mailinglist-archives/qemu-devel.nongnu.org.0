Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 09A71E87A4
	for <lists+qemu-devel@lfdr.de>; Tue, 29 Oct 2019 13:00:41 +0100 (CET)
Received: from localhost ([::1]:55414 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iPQAx-0007tk-Ds
	for lists+qemu-devel@lfdr.de; Tue, 29 Oct 2019 08:00:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40706)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <jfreimann@redhat.com>) id 1iPQ1j-00066e-1Z
 for qemu-devel@nongnu.org; Tue, 29 Oct 2019 07:51:08 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <jfreimann@redhat.com>) id 1iPQ1h-0002iG-Iw
 for qemu-devel@nongnu.org; Tue, 29 Oct 2019 07:51:06 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:44312
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <jfreimann@redhat.com>)
 id 1iPQ1h-0002hS-DT
 for qemu-devel@nongnu.org; Tue, 29 Oct 2019 07:51:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1572349864;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=UBXtK0jsAuaSDEbLnNtwiyQ7IL8PXJUChq1Umjl7Kco=;
 b=bryOM5vBFgGOBGXYXCsNoR69WuAG8y5biJ1yxMDpkNFW8EzyYYjyEGAwd05prqh3qPnu4G
 AfRusMuH0IFzKQmiiA5LmMnt1sjujrh6ewhcOSpL7bcwGflt4awput41ZWUk+fHxC76Jd8
 lOP1N8ipUHZ7jw8QtiAdEUfWLrFwLA8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-201-vJJVZN3LPLypO-gqK_vFCQ-1; Tue, 29 Oct 2019 07:51:03 -0400
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DC32A1005509;
 Tue, 29 Oct 2019 11:51:01 +0000 (UTC)
Received: from localhost (ovpn-116-231.ams2.redhat.com [10.36.116.231])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id C181926E67;
 Tue, 29 Oct 2019 11:50:49 +0000 (UTC)
From: Jens Freimann <jfreimann@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v7 08/11] migration: add new migration state wait-unplug
Date: Tue, 29 Oct 2019 12:49:02 +0100
Message-Id: <20191029114905.6856-9-jfreimann@redhat.com>
In-Reply-To: <20191029114905.6856-1-jfreimann@redhat.com>
References: <20191029114905.6856-1-jfreimann@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-MC-Unique: vJJVZN3LPLypO-gqK_vFCQ-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=WINDOWS-1252
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
Cc: berrange@redhat.com, ehabkost@redhat.com, mst@redhat.com, aadam@redhat.com,
 jasowang@redhat.com, quintela@redhat.com, dgilbert@redhat.com,
 armbru@redhat.com, alex.williamson@redhat.com, laine@redhat.com,
 pbonzini@redhat.com, ailan@redhat.com, parav@mellanox.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This patch adds a new migration state called wait-unplug.  It is entered
after the SETUP state if failover devices are present. It will transition
into ACTIVE once all devices were succesfully unplugged from the guest.

So if a guest doesn't respond or takes long to honor the unplug request
the user will see the migration state 'wait-unplug'.

In the migration thread we query failover devices if they're are still
pending the guest unplug. When all are unplugged the migration
continues. If one device won't unplug migration will stay in wait_unplug
state.

Signed-off-by: Jens Freimann <jfreimann@redhat.com>
Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
---
 include/migration/vmstate.h |  2 ++
 migration/migration.c       | 21 +++++++++++++++++++++
 migration/migration.h       |  3 +++
 migration/savevm.c          | 31 +++++++++++++++++++++++++++++++
 migration/savevm.h          |  2 ++
 qapi/migration.json         |  5 ++++-
 6 files changed, 63 insertions(+), 1 deletion(-)

diff --git a/include/migration/vmstate.h b/include/migration/vmstate.h
index b9ee563aa4..ac4f46a67d 100644
--- a/include/migration/vmstate.h
+++ b/include/migration/vmstate.h
@@ -186,6 +186,8 @@ struct VMStateDescription {
     int (*pre_save)(void *opaque);
     int (*post_save)(void *opaque);
     bool (*needed)(void *opaque);
+    bool (*dev_unplug_pending)(void *opaque);
+
     const VMStateField *fields;
     const VMStateDescription **subsections;
 };
diff --git a/migration/migration.c b/migration/migration.c
index 4133ed2684..354ad072fa 100644
--- a/migration/migration.c
+++ b/migration/migration.c
@@ -52,6 +52,7 @@
 #include "hw/qdev-properties.h"
 #include "monitor/monitor.h"
 #include "net/announce.h"
+#include "qemu/queue.h"
=20
 #define MAX_THROTTLE  (32 << 20)      /* Migration transfer speed throttli=
ng */
=20
@@ -819,6 +820,7 @@ bool migration_is_setup_or_active(int state)
     case MIGRATION_STATUS_SETUP:
     case MIGRATION_STATUS_PRE_SWITCHOVER:
     case MIGRATION_STATUS_DEVICE:
+    case MIGRATION_STATUS_WAIT_UNPLUG:
         return true;
=20
     default:
@@ -954,6 +956,9 @@ static void fill_source_migration_info(MigrationInfo *i=
nfo)
     case MIGRATION_STATUS_CANCELLED:
         info->has_status =3D true;
         break;
+    case MIGRATION_STATUS_WAIT_UNPLUG:
+        info->has_status =3D true;
+        break;
     }
     info->status =3D s->state;
 }
@@ -1694,6 +1699,7 @@ bool migration_is_idle(void)
     case MIGRATION_STATUS_COLO:
     case MIGRATION_STATUS_PRE_SWITCHOVER:
     case MIGRATION_STATUS_DEVICE:
+    case MIGRATION_STATUS_WAIT_UNPLUG:
         return false;
     case MIGRATION_STATUS__MAX:
         g_assert_not_reached();
@@ -3264,6 +3270,19 @@ static void *migration_thread(void *opaque)
=20
     qemu_savevm_state_setup(s->to_dst_file);
=20
+    if (qemu_savevm_nr_failover_devices()) {
+        migrate_set_state(&s->state, MIGRATION_STATUS_SETUP,
+                          MIGRATION_STATUS_WAIT_UNPLUG);
+
+        while (s->state =3D=3D MIGRATION_STATUS_WAIT_UNPLUG &&
+               qemu_savevm_state_guest_unplug_pending()) {
+            qemu_sem_timedwait(&s->wait_unplug_sem, 250);
+        }
+
+        migrate_set_state(&s->state, MIGRATION_STATUS_WAIT_UNPLUG,
+                MIGRATION_STATUS_ACTIVE);
+    }
+
     s->setup_time =3D qemu_clock_get_ms(QEMU_CLOCK_HOST) - setup_start;
     migrate_set_state(&s->state, MIGRATION_STATUS_SETUP,
                       MIGRATION_STATUS_ACTIVE);
@@ -3511,6 +3530,7 @@ static void migration_instance_finalize(Object *obj)
     qemu_mutex_destroy(&ms->qemu_file_lock);
     g_free(params->tls_hostname);
     g_free(params->tls_creds);
+    qemu_sem_destroy(&ms->wait_unplug_sem);
     qemu_sem_destroy(&ms->rate_limit_sem);
     qemu_sem_destroy(&ms->pause_sem);
     qemu_sem_destroy(&ms->postcopy_pause_sem);
@@ -3556,6 +3576,7 @@ static void migration_instance_init(Object *obj)
     qemu_sem_init(&ms->postcopy_pause_rp_sem, 0);
     qemu_sem_init(&ms->rp_state.rp_sem, 0);
     qemu_sem_init(&ms->rate_limit_sem, 0);
+    qemu_sem_init(&ms->wait_unplug_sem, 0);
     qemu_mutex_init(&ms->qemu_file_lock);
 }
=20
diff --git a/migration/migration.h b/migration/migration.h
index 4f2fe193dc..79b3dda146 100644
--- a/migration/migration.h
+++ b/migration/migration.h
@@ -206,6 +206,9 @@ struct MigrationState
     /* Flag set once the migration thread called bdrv_inactivate_all */
     bool block_inactive;
=20
+    /* Migration is waiting for guest to unplug device */
+    QemuSemaphore wait_unplug_sem;
+
     /* Migration is paused due to pause-before-switchover */
     QemuSemaphore pause_sem;
=20
diff --git a/migration/savevm.c b/migration/savevm.c
index 8d95e261f6..966a9c3bdb 100644
--- a/migration/savevm.c
+++ b/migration/savevm.c
@@ -1113,6 +1113,37 @@ void qemu_savevm_state_header(QEMUFile *f)
     }
 }
=20
+int qemu_savevm_nr_failover_devices(void)
+{
+    SaveStateEntry *se;
+    int n =3D 0;
+
+    QTAILQ_FOREACH(se, &savevm_state.handlers, entry) {
+        if (se->vmsd && se->vmsd->dev_unplug_pending) {
+            n++;
+        }
+    }
+
+    return n;
+}
+
+bool qemu_savevm_state_guest_unplug_pending(void)
+{
+    SaveStateEntry *se;
+    int n =3D 0;
+
+    QTAILQ_FOREACH(se, &savevm_state.handlers, entry) {
+        if (!se->vmsd || !se->vmsd->dev_unplug_pending) {
+            continue;
+        }
+        if (se->vmsd->dev_unplug_pending(se->opaque)) {
+            n++;
+        }
+    }
+
+    return n > 0;
+}
+
 void qemu_savevm_state_setup(QEMUFile *f)
 {
     SaveStateEntry *se;
diff --git a/migration/savevm.h b/migration/savevm.h
index 51a4b9caa8..c42b9c80ee 100644
--- a/migration/savevm.h
+++ b/migration/savevm.h
@@ -31,6 +31,8 @@
=20
 bool qemu_savevm_state_blocked(Error **errp);
 void qemu_savevm_state_setup(QEMUFile *f);
+int qemu_savevm_nr_failover_devices(void);
+bool qemu_savevm_state_guest_unplug_pending(void);
 int qemu_savevm_state_resume_prepare(MigrationState *s);
 void qemu_savevm_state_header(QEMUFile *f);
 int qemu_savevm_state_iterate(QEMUFile *f, bool postcopy);
diff --git a/qapi/migration.json b/qapi/migration.json
index e9e7a97c03..b7348d0c8b 100644
--- a/qapi/migration.json
+++ b/qapi/migration.json
@@ -133,6 +133,9 @@
 # @device: During device serialisation when pause-before-switchover is ena=
bled
 #        (since 2.11)
 #
+# @wait-unplug: wait for device unplug request by guest OS to be completed=
.
+#               (since 4.2)
+#
 # Since: 2.3
 #
 ##
@@ -140,7 +143,7 @@
   'data': [ 'none', 'setup', 'cancelling', 'cancelled',
             'active', 'postcopy-active', 'postcopy-paused',
             'postcopy-recover', 'completed', 'failed', 'colo',
-            'pre-switchover', 'device' ] }
+            'pre-switchover', 'device', 'wait-unplug' ] }
=20
 ##
 # @MigrationInfo:
--=20
2.21.0


