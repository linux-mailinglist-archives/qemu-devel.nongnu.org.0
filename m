Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C6816667BD0
	for <lists+qemu-devel@lfdr.de>; Thu, 12 Jan 2023 17:47:19 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pG0ge-0004FJ-Sg; Thu, 12 Jan 2023 11:44:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1pG0ga-0004Cd-2T
 for qemu-devel@nongnu.org; Thu, 12 Jan 2023 11:44:16 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1pG0gX-0000dS-CQ
 for qemu-devel@nongnu.org; Thu, 12 Jan 2023 11:44:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1673541852;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=in2t5r/y8I6GAT2Myo61i75/xnCu58xNANQ1MspLwLI=;
 b=L3QxOK4CsHDhVl+LDSzc7C0c7EhLZzMoFeHetR0v+pILvOY+mqhMfNke5RJDI2sAbe7avD
 0RvKPpcHCd4M8YWj5uVJExsR+YKdBYI0dpImgURpNvtTRIAHm3NGp50f0GSjrBS5ZDF2ff
 nTFZNEWuwTnCGt0MZbrBCEOUWYwFVh4=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-446-4mNAv2I1OFK5my1FBTfhyw-1; Thu, 12 Jan 2023 11:44:11 -0500
X-MC-Unique: 4mNAv2I1OFK5my1FBTfhyw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E2305882821
 for <qemu-devel@nongnu.org>; Thu, 12 Jan 2023 16:44:10 +0000 (UTC)
Received: from t480s.fritz.box (unknown [10.39.193.30])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D61FC4078903;
 Thu, 12 Jan 2023 16:44:08 +0000 (UTC)
From: David Hildenbrand <david@redhat.com>
To: qemu-devel@nongnu.org
Cc: David Hildenbrand <david@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Juan Quintela <quintela@redhat.com>, Peter Xu <peterx@redhat.com>,
 "Michael S . Tsirkin" <mst@redhat.com>,
 Michal Privoznik <mprivozn@redhat.com>
Subject: [PATCH v3 2/8] migration/savevm: Prepare vmdesc json writer in
 qemu_savevm_state_setup()
Date: Thu, 12 Jan 2023 17:43:57 +0100
Message-Id: <20230112164403.105085-3-david@redhat.com>
In-Reply-To: <20230112164403.105085-1-david@redhat.com>
References: <20230112164403.105085-1-david@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
Received-SPF: pass client-ip=170.10.133.124; envelope-from=david@redhat.com;
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

... and store it in the migration state. This is a preparation for
storing selected vmds's already in qemu_savevm_state_setup().

Signed-off-by: David Hildenbrand <david@redhat.com>
---
 migration/migration.c |  4 ++++
 migration/migration.h |  4 ++++
 migration/savevm.c    | 18 ++++++++++++------
 3 files changed, 20 insertions(+), 6 deletions(-)

diff --git a/migration/migration.c b/migration/migration.c
index 52b5d39244..1d33a7efa0 100644
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
@@ -4445,6 +4448,7 @@ static void migration_instance_finalize(Object *obj)
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
index d8830297e4..ff2b8d0064 100644
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
@@ -1189,10 +1188,16 @@ bool qemu_savevm_state_guest_unplug_pending(void)
 
 void qemu_savevm_state_setup(QEMUFile *f)
 {
+    MigrationState *ms = migrate_get_current();
     SaveStateEntry *se;
     Error *local_err = NULL;
     int ret;
 
+    ms->vmdesc = json_writer_new(false);
+    json_writer_start_object(ms->vmdesc, NULL);
+    json_writer_int64(ms->vmdesc, "page_size", qemu_target_page_size());
+    json_writer_start_array(ms->vmdesc, "devices");
+
     trace_savevm_state_setup();
     QTAILQ_FOREACH(se, &savevm_state.handlers, entry) {
         if (!se->ops || !se->ops->save_setup) {
@@ -1390,15 +1395,12 @@ int qemu_savevm_state_complete_precopy_non_iterable(QEMUFile *f,
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
     QTAILQ_FOREACH(se, &savevm_state.handlers, entry) {
         ret = vmstate_save(f, se, vmdesc);
         if (ret) {
@@ -1433,6 +1435,10 @@ int qemu_savevm_state_complete_precopy_non_iterable(QEMUFile *f,
         qemu_put_buffer(f, (uint8_t *)json_writer_get(vmdesc), vmdesc_len);
     }
 
+    /* Free it now to detect any inconsistencies. */
+    json_writer_free(vmdesc);
+    ms->vmdesc = NULL;
+
     return 0;
 }
 
-- 
2.39.0


