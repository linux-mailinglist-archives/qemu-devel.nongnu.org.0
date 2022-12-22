Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E049B653EBD
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Dec 2022 12:10:15 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p8JLJ-0007jz-Hz; Thu, 22 Dec 2022 06:02:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1p8JLF-0007iW-UD
 for qemu-devel@nongnu.org; Thu, 22 Dec 2022 06:02:26 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1p8JLD-0000Zc-Tx
 for qemu-devel@nongnu.org; Thu, 22 Dec 2022 06:02:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1671706943;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9YeoZfOmebuFOKj2y+CCMHbm9gRcfJ0Mk1FsetvIqDA=;
 b=GO9XjqdmdZo5WSQZquZ9xZWUS70TquA+D7infrA8BjJlfMadoUFF6FrpXCp7FYXPidDgt8
 xB27BnmAELgPh9rO/Ay26U7Mh9VautOoXcWP6dW7dkpvi5kVldL8/BwvqLwpqVPWRuM8XY
 Thjs755WwI7ntPdWn6h3BES/LyQFU0Q=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-467-ETklx0iwOSi-oAqGx17GjQ-1; Thu, 22 Dec 2022 06:02:21 -0500
X-MC-Unique: ETklx0iwOSi-oAqGx17GjQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 2BB89857A85
 for <qemu-devel@nongnu.org>; Thu, 22 Dec 2022 11:02:21 +0000 (UTC)
Received: from t480s.fritz.box (unknown [10.39.193.53])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 30E4414152F4;
 Thu, 22 Dec 2022 11:02:19 +0000 (UTC)
From: David Hildenbrand <david@redhat.com>
To: qemu-devel@nongnu.org
Cc: David Hildenbrand <david@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Juan Quintela <quintela@redhat.com>, Peter Xu <peterx@redhat.com>,
 "Michael S . Tsirkin" <mst@redhat.com>,
 Michal Privoznik <mprivozn@redhat.com>
Subject: [PATCH v3 1/6] migration: Allow immutable device state to be migrated
 early (i.e., before RAM)
Date: Thu, 22 Dec 2022 12:02:10 +0100
Message-Id: <20221222110215.130392-2-david@redhat.com>
In-Reply-To: <20221222110215.130392-1-david@redhat.com>
References: <20221222110215.130392-1-david@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
Received-SPF: pass client-ip=170.10.129.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

For virtio-mem, we want to have the plugged/unplugged state of memory
blocks available before migrating any actual RAM content. This
information is immutable on the migration source while migration is active,

For example, we want to use this information for proper preallocation
support with migration: currently, we don't preallocate memory on the
migration target, and especially with hugetlb, we can easily run out of
hugetlb pages during RAM migration and will crash (SIGBUS) instead of
catching this gracefully via preallocation.

Migrating device state before we start iterating is currently impossible.
Introduce and use qemu_savevm_state_start_precopy(), and use
a new special migration priority -- MIG_PRI_POST_SETUP -- to decide whether
state will be saved in qemu_savevm_state_start_precopy() or in
qemu_savevm_state_complete_precopy_*().

We have to take care of properly including the early device state in the
vmdesc. Relying on migrate_get_current() to temporarily store the vmdesc is
a bit sub-optimal, but we use that explicitly or implicitly all over the
place already, so this barely matters in practice.

Note that only very selected devices (i.e., ones seriously messing with
RAM setup) are supposed to make use of that.

Signed-off-by: David Hildenbrand <david@redhat.com>
---
 include/migration/vmstate.h |   7 +++
 migration/migration.c       |  13 +++++
 migration/migration.h       |   4 ++
 migration/savevm.c          | 104 +++++++++++++++++++++++++++---------
 migration/savevm.h          |   1 +
 5 files changed, 104 insertions(+), 25 deletions(-)

diff --git a/include/migration/vmstate.h b/include/migration/vmstate.h
index ad24aa1934..79eb2409a2 100644
--- a/include/migration/vmstate.h
+++ b/include/migration/vmstate.h
@@ -156,6 +156,13 @@ typedef enum {
     MIG_PRI_VIRTIO_MEM,         /* Must happen before IOMMU */
     MIG_PRI_GICV3_ITS,          /* Must happen before PCI devices */
     MIG_PRI_GICV3,              /* Must happen before the ITS */
+    /*
+     * Must happen before all other devices (iterable and non-iterable),
+     * especiall, before migrating RAM content. Such device state must be
+     * guaranteed to be immutable on the migration source until migration
+     * ends and must not depend on the CPU state to be synchronized.
+     */
+    MIG_PRI_POST_SETUP,
     MIG_PRI_MAX,
 } MigrationPriority;
 
diff --git a/migration/migration.c b/migration/migration.c
index 52b5d39244..78b6bb8765 100644
--- a/migration/migration.c
+++ b/migration/migration.c
@@ -2170,6 +2170,9 @@ void migrate_init(MigrationState *s)
     s->vm_was_running = false;
     s->iteration_initial_bytes = 0;
     s->threshold_size = 0;
+
+    json_writer_free(s->vmdesc);
+    s->vmdesc = NULL;
 }
 
 int migrate_add_blocker_internal(Error *reason, Error **errp)
@@ -3997,6 +4000,9 @@ static void *migration_thread(void *opaque)
 
     trace_migration_thread_setup_complete();
 
+    /* Process early data that has to get migrated before iterating. */
+    qemu_savevm_state_start_precopy(s->to_dst_file);
+
     while (migration_is_active(s)) {
         if (urgent || !qemu_file_rate_limit(s->to_dst_file)) {
             MigIterateState iter_state = migration_iteration_run(s);
@@ -4125,6 +4131,12 @@ static void *bg_migration_thread(void *opaque)
     if (vm_stop_force_state(RUN_STATE_PAUSED)) {
         goto fail;
     }
+
+    /* Migrate early data that would usually get migrated before iterating. */
+    if (qemu_savevm_state_start_precopy(fb)) {
+        goto fail;
+    }
+
     /*
      * Put vCPUs in sync with shadow context structures, then
      * save their state to channel-buffer along with devices.
@@ -4445,6 +4457,7 @@ static void migration_instance_finalize(Object *obj)
     qemu_sem_destroy(&ms->rp_state.rp_sem);
     qemu_sem_destroy(&ms->postcopy_qemufile_src_sem);
     error_free(ms->error);
+    json_writer_free(ms->vmdesc);
 }
 
 static void migration_instance_init(Object *obj)
diff --git a/migration/migration.h b/migration/migration.h
index ae4ffd3454..66511ce532 100644
--- a/migration/migration.h
+++ b/migration/migration.h
@@ -17,6 +17,7 @@
 #include "exec/cpu-common.h"
 #include "hw/qdev-core.h"
 #include "qapi/qapi-types-migration.h"
+#include "qapi/qmp/json-writer.h"
 #include "qemu/thread.h"
 #include "qemu/coroutine_int.h"
 #include "io/channel.h"
@@ -366,6 +367,9 @@ struct MigrationState {
      * This save hostname when out-going migration starts
      */
     char *hostname;
+
+    /* QEMU_VM_VMDESCRIPTION content filled for all non-iterable devices. */
+    JSONWriter *vmdesc;
 };
 
 void migrate_set_state(int *state, int old_state, int new_state);
diff --git a/migration/savevm.c b/migration/savevm.c
index a0cdb714f7..b810409574 100644
--- a/migration/savevm.c
+++ b/migration/savevm.c
@@ -42,7 +42,6 @@
 #include "postcopy-ram.h"
 #include "qapi/error.h"
 #include "qapi/qapi-commands-migration.h"
-#include "qapi/qmp/json-writer.h"
 #include "qapi/clone-visitor.h"
 #include "qapi/qapi-builtin-visit.h"
 #include "qapi/qmp/qerror.h"
@@ -1325,6 +1324,71 @@ void qemu_savevm_state_complete_postcopy(QEMUFile *f)
     qemu_fflush(f);
 }
 
+static int qemu_savevm_state_precopy_one_non_iterable(SaveStateEntry *se,
+                                                      QEMUFile *f,
+                                                      JSONWriter *vmdesc)
+{
+    int ret;
+
+    if ((!se->ops || !se->ops->save_state) && !se->vmsd) {
+        return 0;
+    }
+    if (se->vmsd && !vmstate_save_needed(se->vmsd, se->opaque)) {
+        trace_savevm_section_skip(se->idstr, se->section_id);
+        return 0;
+    }
+
+    trace_savevm_section_start(se->idstr, se->section_id);
+
+    json_writer_start_object(vmdesc, NULL);
+    json_writer_str(vmdesc, "name", se->idstr);
+    json_writer_int64(vmdesc, "instance_id", se->instance_id);
+
+    save_section_header(f, se, QEMU_VM_SECTION_FULL);
+    ret = vmstate_save(f, se, vmdesc);
+    if (ret) {
+        qemu_file_set_error(f, ret);
+        return ret;
+    }
+    trace_savevm_section_end(se->idstr, se->section_id, 0);
+    save_section_footer(f, se);
+
+    json_writer_end_object(vmdesc);
+    return 0;
+}
+
+int qemu_savevm_state_start_precopy(QEMUFile *f)
+{
+    MigrationState *ms = migrate_get_current();
+    JSONWriter *vmdesc;
+    SaveStateEntry *se;
+    int ret;
+
+    assert(!ms->vmdesc);
+    ms->vmdesc = vmdesc = json_writer_new(false);
+    json_writer_start_object(vmdesc, NULL);
+    json_writer_int64(vmdesc, "page_size", qemu_target_page_size());
+    json_writer_start_array(vmdesc, "devices");
+
+    /*
+     * Only immutable non-iterable device state is expected to be saved this
+     * early. All remaining (ordinary) non-iterable device state will be saved
+     * in qemu_savevm_state_complete_precopy_non_iterable().
+     */
+    QTAILQ_FOREACH(se, &savevm_state.handlers, entry) {
+        if (save_state_priority(se) < MIG_PRI_POST_SETUP) {
+            continue;
+        }
+
+        ret = qemu_savevm_state_precopy_one_non_iterable(se, f, vmdesc);
+        if (ret) {
+            return ret;
+        }
+    }
+
+    return 0;
+}
+
 static
 int qemu_savevm_state_complete_precopy_iterable(QEMUFile *f, bool in_postcopy)
 {
@@ -1364,41 +1428,24 @@ int qemu_savevm_state_complete_precopy_non_iterable(QEMUFile *f,
                                                     bool in_postcopy,
                                                     bool inactivate_disks)
 {
-    g_autoptr(JSONWriter) vmdesc = NULL;
+    MigrationState *ms = migrate_get_current();
+    JSONWriter *vmdesc = ms->vmdesc;
     int vmdesc_len;
     SaveStateEntry *se;
     int ret;
 
-    vmdesc = json_writer_new(false);
-    json_writer_start_object(vmdesc, NULL);
-    json_writer_int64(vmdesc, "page_size", qemu_target_page_size());
-    json_writer_start_array(vmdesc, "devices");
-    QTAILQ_FOREACH(se, &savevm_state.handlers, entry) {
+    /* qemu_savevm_state_start_precopy() is expected to be called first. */
+    assert(vmdesc);
 
-        if ((!se->ops || !se->ops->save_state) && !se->vmsd) {
-            continue;
-        }
-        if (se->vmsd && !vmstate_save_needed(se->vmsd, se->opaque)) {
-            trace_savevm_section_skip(se->idstr, se->section_id);
+    QTAILQ_FOREACH(se, &savevm_state.handlers, entry) {
+        if (save_state_priority(se) >= MIG_PRI_POST_SETUP) {
             continue;
         }
 
-        trace_savevm_section_start(se->idstr, se->section_id);
-
-        json_writer_start_object(vmdesc, NULL);
-        json_writer_str(vmdesc, "name", se->idstr);
-        json_writer_int64(vmdesc, "instance_id", se->instance_id);
-
-        save_section_header(f, se, QEMU_VM_SECTION_FULL);
-        ret = vmstate_save(f, se, vmdesc);
+        ret = qemu_savevm_state_precopy_one_non_iterable(se, f, vmdesc);
         if (ret) {
-            qemu_file_set_error(f, ret);
             return ret;
         }
-        trace_savevm_section_end(se->idstr, se->section_id, 0);
-        save_section_footer(f, se);
-
-        json_writer_end_object(vmdesc);
     }
 
     if (inactivate_disks) {
@@ -1427,6 +1474,10 @@ int qemu_savevm_state_complete_precopy_non_iterable(QEMUFile *f,
         qemu_put_buffer(f, (uint8_t *)json_writer_get(vmdesc), vmdesc_len);
     }
 
+    /* Free it now to detect any inconsistencies. */
+    g_free(vmdesc);
+    ms->vmdesc = NULL;
+
     return 0;
 }
 
@@ -1541,6 +1592,9 @@ static int qemu_savevm_state(QEMUFile *f, Error **errp)
     qemu_savevm_state_setup(f);
     qemu_mutex_lock_iothread();
 
+    /* Process early data that has to get migrated before iterating. */
+    qemu_savevm_state_start_precopy(f);
+
     while (qemu_file_get_error(f) == 0) {
         if (qemu_savevm_state_iterate(f, false) > 0) {
             break;
diff --git a/migration/savevm.h b/migration/savevm.h
index 6461342cb4..323bd5ab3b 100644
--- a/migration/savevm.h
+++ b/migration/savevm.h
@@ -38,6 +38,7 @@ void qemu_savevm_state_header(QEMUFile *f);
 int qemu_savevm_state_iterate(QEMUFile *f, bool postcopy);
 void qemu_savevm_state_cleanup(void);
 void qemu_savevm_state_complete_postcopy(QEMUFile *f);
+int qemu_savevm_state_start_precopy(QEMUFile *f);
 int qemu_savevm_state_complete_precopy(QEMUFile *f, bool iterable_only,
                                        bool inactivate_disks);
 void qemu_savevm_state_pending(QEMUFile *f, uint64_t max_size,
-- 
2.38.1


