Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E615CD3E6B
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Oct 2019 13:26:45 +0200 (CEST)
Received: from localhost ([::1]:48650 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iIt4G-0004UR-HL
	for lists+qemu-devel@lfdr.de; Fri, 11 Oct 2019 07:26:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43613)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <jfreimann@redhat.com>) id 1iIszF-0007IL-D5
 for qemu-devel@nongnu.org; Fri, 11 Oct 2019 07:21:34 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <jfreimann@redhat.com>) id 1iIszC-00028b-SS
 for qemu-devel@nongnu.org; Fri, 11 Oct 2019 07:21:33 -0400
Received: from mx1.redhat.com ([209.132.183.28]:44938)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <jfreimann@redhat.com>)
 id 1iIszC-00027r-KB
 for qemu-devel@nongnu.org; Fri, 11 Oct 2019 07:21:30 -0400
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id D7C1630860C3;
 Fri, 11 Oct 2019 11:21:29 +0000 (UTC)
Received: from localhost (dhcp-192-238.str.redhat.com [10.33.192.238])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id C23265C1B2;
 Fri, 11 Oct 2019 11:21:21 +0000 (UTC)
From: Jens Freimann <jfreimann@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 07/10] migration: add new migration state wait-unplug
Date: Fri, 11 Oct 2019 13:20:12 +0200
Message-Id: <20191011112015.11785-8-jfreimann@redhat.com>
In-Reply-To: <20191011112015.11785-1-jfreimann@redhat.com>
References: <20191011112015.11785-1-jfreimann@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.44]); Fri, 11 Oct 2019 11:21:29 +0000 (UTC)
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
Cc: parav@mellanox.com, mst@redhat.com, aadam@redhat.com, dgilbert@redhat.com,
 alex.williamson@redhat.com, laine@redhat.com, ailan@redhat.com,
 ehabkost@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This patch adds a new migration state called wait-unplug.  It is entered
after the SETUP state and will transition into ACTIVE once all devices
were succesfully unplugged from the guest.

So if a guest doesn't respond or takes long to honor the unplug request
the user will see the migration state 'wait-unplug'.

In the migration thread we query failover devices if they're are still
pending the guest unplug. When all are unplugged the migration
continues. We give it a defined number of iterations including small
waiting periods before we proceed.

Signed-off-by: Jens Freimann <jfreimann@redhat.com>
---
 include/migration/vmstate.h |  2 ++
 migration/migration.c       | 34 ++++++++++++++++++++++++++++++++++
 migration/migration.h       |  3 +++
 migration/savevm.c          | 36 ++++++++++++++++++++++++++++++++++++
 migration/savevm.h          |  1 +
 qapi/migration.json         |  5 ++++-
 6 files changed, 80 insertions(+), 1 deletion(-)

diff --git a/include/migration/vmstate.h b/include/migration/vmstate.h
index 1fbfd099dd..39ef125225 100644
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
index 5f7e4d15e9..a17d9fb990 100644
--- a/migration/migration.c
+++ b/migration/migration.c
@@ -52,9 +52,14 @@
 #include "hw/qdev-properties.h"
 #include "monitor/monitor.h"
 #include "net/announce.h"
+#include "qemu/queue.h"
=20
 #define MAX_THROTTLE  (32 << 20)      /* Migration transfer speed thrott=
ling */
=20
+/* Time in milliseconds to wait for guest OS to unplug PCI device */
+#define FAILOVER_GUEST_UNPLUG_WAIT 10000
+#define FAILOVER_UNPLUG_RETRIES 5
+
 /* Amount of time to allocate to each "chunk" of bandwidth-throttled
  * data. */
 #define BUFFER_DELAY     100
@@ -954,6 +959,9 @@ static void fill_source_migration_info(MigrationInfo =
*info)
     case MIGRATION_STATUS_CANCELLED:
         info->has_status =3D true;
         break;
+    case MIGRATION_STATUS_WAIT_UNPLUG:
+        info->has_status =3D true;
+        break;
     }
     info->status =3D s->state;
 }
@@ -1695,6 +1703,7 @@ bool migration_is_idle(void)
     case MIGRATION_STATUS_COLO:
     case MIGRATION_STATUS_PRE_SWITCHOVER:
     case MIGRATION_STATUS_DEVICE:
+    case MIGRATION_STATUS_WAIT_UNPLUG:
         return false;
     case MIGRATION_STATUS__MAX:
         g_assert_not_reached();
@@ -3224,6 +3233,8 @@ static void *migration_thread(void *opaque)
     int64_t setup_start =3D qemu_clock_get_ms(QEMU_CLOCK_HOST);
     MigThrError thr_error;
     bool urgent =3D false;
+    bool all_unplugged =3D true;
+    int i =3D 0;
=20
     rcu_register_thread();
=20
@@ -3260,6 +3271,27 @@ static void *migration_thread(void *opaque)
=20
     qemu_savevm_state_setup(s->to_dst_file);
=20
+    migrate_set_state(&s->state, MIGRATION_STATUS_SETUP,
+                      MIGRATION_STATUS_WAIT_UNPLUG);
+
+    while (i < FAILOVER_UNPLUG_RETRIES &&
+           s->state =3D=3D MIGRATION_STATUS_WAIT_UNPLUG) {
+        i++;
+        qemu_sem_timedwait(&s->wait_unplug_sem, FAILOVER_GUEST_UNPLUG_WA=
IT);
+        all_unplugged =3D qemu_savevm_state_guest_unplug_pending();
+        if (all_unplugged) {
+            break;
+        }
+    }
+
+    if (all_unplugged) {
+        migrate_set_state(&s->state, MIGRATION_STATUS_WAIT_UNPLUG,
+                MIGRATION_STATUS_ACTIVE);
+    } else {
+        migrate_set_state(&s->state, MIGRATION_STATUS_WAIT_UNPLUG,
+                          MIGRATION_STATUS_CANCELLING);
+    }
+
     s->setup_time =3D qemu_clock_get_ms(QEMU_CLOCK_HOST) - setup_start;
     migrate_set_state(&s->state, MIGRATION_STATUS_SETUP,
                       MIGRATION_STATUS_ACTIVE);
@@ -3508,6 +3540,7 @@ static void migration_instance_finalize(Object *obj=
)
     qemu_mutex_destroy(&ms->qemu_file_lock);
     g_free(params->tls_hostname);
     g_free(params->tls_creds);
+    qemu_sem_destroy(&ms->wait_unplug_sem);
     qemu_sem_destroy(&ms->rate_limit_sem);
     qemu_sem_destroy(&ms->pause_sem);
     qemu_sem_destroy(&ms->postcopy_pause_sem);
@@ -3553,6 +3586,7 @@ static void migration_instance_init(Object *obj)
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
index bb9462a54d..26e5bde687 100644
--- a/migration/savevm.c
+++ b/migration/savevm.c
@@ -942,6 +942,20 @@ static void qemu_savevm_command_send(QEMUFile *f,
     qemu_fflush(f);
 }
=20
+static int qemu_savevm_nr_failover_devices(void)
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
 void qemu_savevm_send_colo_enable(QEMUFile *f)
 {
     trace_savevm_send_colo_enable();
@@ -1113,6 +1127,28 @@ void qemu_savevm_state_header(QEMUFile *f)
     }
 }
=20
+bool qemu_savevm_state_guest_unplug_pending(void)
+{
+    int nr_failover_devs;
+    SaveStateEntry *se;
+    bool ret =3D false;
+    int n =3D 0;
+
+    nr_failover_devs =3D qemu_savevm_nr_failover_devices();
+
+    QTAILQ_FOREACH(se, &savevm_state.handlers, entry) {
+        if (!se->vmsd || !se->vmsd->dev_unplug_pending) {
+            continue;
+        }
+        ret =3D se->vmsd->dev_unplug_pending(se->opaque);
+        if (!ret) {
+            n++;
+        }
+    }
+
+    return n =3D=3D nr_failover_devs;
+}
+
 void qemu_savevm_state_setup(QEMUFile *f)
 {
     SaveStateEntry *se;
diff --git a/migration/savevm.h b/migration/savevm.h
index 51a4b9caa8..ba64a7e271 100644
--- a/migration/savevm.h
+++ b/migration/savevm.h
@@ -31,6 +31,7 @@
=20
 bool qemu_savevm_state_blocked(Error **errp);
 void qemu_savevm_state_setup(QEMUFile *f);
+bool qemu_savevm_state_guest_unplug_pending(void);
 int qemu_savevm_state_resume_prepare(MigrationState *s);
 void qemu_savevm_state_header(QEMUFile *f);
 int qemu_savevm_state_iterate(QEMUFile *f, bool postcopy);
diff --git a/qapi/migration.json b/qapi/migration.json
index 52e69e2868..5a06cd489f 100644
--- a/qapi/migration.json
+++ b/qapi/migration.json
@@ -133,6 +133,9 @@
 # @device: During device serialisation when pause-before-switchover is e=
nabled
 #        (since 2.11)
 #
+# @wait-unplug: wait for device unplug request by guest OS to be complet=
ed.
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


