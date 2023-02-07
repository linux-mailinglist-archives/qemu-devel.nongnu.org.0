Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 040E568CBAD
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Feb 2023 02:04:27 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pPCJH-0003gC-BV; Mon, 06 Feb 2023 19:58:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pPCJF-0003d3-7c
 for qemu-devel@nongnu.org; Mon, 06 Feb 2023 19:58:09 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pPCJD-0003kf-Fn
 for qemu-devel@nongnu.org; Mon, 06 Feb 2023 19:58:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675731486;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=XNMcu/nOPKMigMVPfZvKyLlihBT8/C5Yazboh+qWDkU=;
 b=g4/eBN6gyiFllf54N0nfsB9fzT0VxtCkBYUsjZAByS6TpqrTTa/VRJcvg41RXpjCi1GW/C
 x9EWJ21Z1pfPia/K/+OzTjlO5HxOfKGpsO2yuUqEqn6Uj1z8Co5PI08EVFZaJkOGdr8yxx
 zcqpnrKZ7udSUxwaE+biY1brkActZnk=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-149-DbZrM0DIOgCFgksgAvN1Mg-1; Mon, 06 Feb 2023 19:58:03 -0500
X-MC-Unique: DbZrM0DIOgCFgksgAvN1Mg-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E1874885627;
 Tue,  7 Feb 2023 00:58:02 +0000 (UTC)
Received: from secure.mitica (unknown [10.39.192.29])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 24A22492C3C;
 Tue,  7 Feb 2023 00:57:58 +0000 (UTC)
From: Juan Quintela <quintela@redhat.com>
To: qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, Stefan Berger <stefanb@linux.vnet.ibm.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Halil Pasic <pasic@linux.ibm.com>,
 John Snow <jsnow@redhat.com>, David Hildenbrand <david@redhat.com>,
 Fam Zheng <fam@euphon.net>, Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
 qemu-s390x@nongnu.org, Christian Borntraeger <borntraeger@linux.ibm.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Juan Quintela <quintela@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Coiby Xu <Coiby.Xu@gmail.com>, Ilya Leoshkevich <iii@linux.ibm.com>,
 Eduardo Habkost <eduardo@habkost.net>, Yanan Wang <wangyanan55@huawei.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Markus Armbruster <armbru@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Eric Blake <eblake@redhat.com>, Eric Farman <farman@linux.ibm.com>,
 Peter Xu <peterx@redhat.com>
Subject: [PULL 13/30] migration/savevm: Prepare vmdesc json writer in
 qemu_savevm_state_setup()
Date: Tue,  7 Feb 2023 01:56:33 +0100
Message-Id: <20230207005650.1810-14-quintela@redhat.com>
In-Reply-To: <20230207005650.1810-1-quintela@redhat.com>
References: <20230207005650.1810-1-quintela@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
Received-SPF: pass client-ip=170.10.129.124; envelope-from=quintela@redhat.com;
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

From: David Hildenbrand <david@redhat.com>

... and store it in the migration state. This is a preparation for
storing selected vmds's already in qemu_savevm_state_setup().

Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
Reviewed-by: Peter Xu <peterx@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Reviewed-by: Juan Quintela <quintela@redhat.com>
Signed-off-by: David Hildenbrand <david@redhat.com>
Signed-off-by: Juan Quintela <quintela@redhat.com>
---
 migration/migration.h |  4 ++++
 migration/migration.c |  2 ++
 migration/savevm.c    | 18 ++++++++++++------
 3 files changed, 18 insertions(+), 6 deletions(-)

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
diff --git a/migration/migration.c b/migration/migration.c
index 6d4cd8083b..c3ad4cd670 100644
--- a/migration/migration.c
+++ b/migration/migration.c
@@ -1933,6 +1933,8 @@ static void migrate_fd_cleanup(MigrationState *s)
 
     g_free(s->hostname);
     s->hostname = NULL;
+    json_writer_free(s->vmdesc);
+    s->vmdesc = NULL;
 
     qemu_savevm_state_cleanup();
 
diff --git a/migration/savevm.c b/migration/savevm.c
index 3e3631652e..28f88b5521 100644
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
@@ -1190,10 +1189,16 @@ bool qemu_savevm_state_guest_unplug_pending(void)
 
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
@@ -1391,15 +1396,12 @@ int qemu_savevm_state_complete_precopy_non_iterable(QEMUFile *f,
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
@@ -1434,6 +1436,10 @@ int qemu_savevm_state_complete_precopy_non_iterable(QEMUFile *f,
         qemu_put_buffer(f, (uint8_t *)json_writer_get(vmdesc), vmdesc_len);
     }
 
+    /* Free it now to detect any inconsistencies. */
+    json_writer_free(vmdesc);
+    ms->vmdesc = NULL;
+
     return 0;
 }
 
-- 
2.39.1


