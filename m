Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C5E96553F9B
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Jun 2022 02:37:30 +0200 (CEST)
Received: from localhost ([::1]:45938 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o3oN7-0001iT-Qt
	for lists+qemu-devel@lfdr.de; Tue, 21 Jun 2022 20:37:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56296)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1o3oCI-0002xe-A6
 for qemu-devel@nongnu.org; Tue, 21 Jun 2022 20:26:18 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:41940)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1o3oCD-00067C-W1
 for qemu-devel@nongnu.org; Tue, 21 Jun 2022 20:26:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1655857573;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Xmd1ImPDx092hOYqoxlvuLfz6j3en1eFIou/U1Z29kI=;
 b=O0Qi0De0MY1XRqs4OJXWOUZvGe/U678dbHT6FiGA29wFc3XA964V6HyirB73sHN97a2ui8
 UD4yO2YfMCEXlxdxV+Nx2KDngAh61z4T3j9LA/u71BZjpCye6p0H08eQ1u97D7UEJqmGsO
 0bqc+QkTMtLIoogshQ3NmZK91VvJJww=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-17-bsiLcCt6NS2PmJkviKbIig-1; Tue, 21 Jun 2022 20:26:12 -0400
X-MC-Unique: bsiLcCt6NS2PmJkviKbIig-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C7E8F101E165;
 Wed, 22 Jun 2022 00:26:11 +0000 (UTC)
Received: from secure.mitica (unknown [10.39.192.22])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 1BB3F141510D;
 Wed, 22 Jun 2022 00:26:09 +0000 (UTC)
From: Juan Quintela <quintela@redhat.com>
To: qemu-devel@nongnu.org
Cc: Hailiang Zhang <zhanghailiang@xfusion.com>, Eric Blake <eblake@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Fam Zheng <fam@euphon.net>, "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Juan Quintela <quintela@redhat.com>, qemu-block@nongnu.org,
 Stefan Hajnoczi <stefanha@redhat.com>,
 Markus Armbruster <armbru@redhat.com>
Subject: [PULL 10/25] migration: rename qemu_ftell to
 qemu_file_total_transferred
Date: Wed, 22 Jun 2022 02:25:32 +0200
Message-Id: <20220622002547.64784-11-quintela@redhat.com>
In-Reply-To: <20220622002547.64784-1-quintela@redhat.com>
References: <20220622002547.64784-1-quintela@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.7
Received-SPF: pass client-ip=170.10.129.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Daniel P. Berrangé <berrange@redhat.com>

The name 'ftell' gives the misleading impression that the QEMUFile
objects are seekable. This is not the case, as in general we just
have an opaque stream. The users of this method are only interested
in the total bytes processed. This switches to a new name that
reflects the intended usage.

Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
Reviewed-by: Juan Quintela <quintela@redhat.com>
Signed-off-by: Juan Quintela <quintela@redhat.com>
---
 migration/qemu-file.h | 33 +++++++++++++++++++++++++++++++--
 migration/block.c     | 10 +++++-----
 migration/migration.c |  3 ++-
 migration/qemu-file.c |  4 ++--
 migration/savevm.c    |  6 +++---
 migration/vmstate.c   |  4 ++--
 6 files changed, 45 insertions(+), 15 deletions(-)

diff --git a/migration/qemu-file.h b/migration/qemu-file.h
index 3f36d4dc8c..05f6aef903 100644
--- a/migration/qemu-file.h
+++ b/migration/qemu-file.h
@@ -124,8 +124,37 @@ QEMUFile *qemu_fopen_ops(void *opaque, const QEMUFileOps *ops, bool has_ioc);
 void qemu_file_set_hooks(QEMUFile *f, const QEMUFileHooks *hooks);
 int qemu_get_fd(QEMUFile *f);
 int qemu_fclose(QEMUFile *f);
-int64_t qemu_ftell(QEMUFile *f);
-int64_t qemu_ftell_fast(QEMUFile *f);
+
+/*
+ * qemu_file_total_transferred:
+ *
+ * Report the total number of bytes transferred with
+ * this file.
+ *
+ * For writable files, any pending buffers will be
+ * flushed, so the reported value will be equal to
+ * the number of bytes transferred on the wire.
+ *
+ * For readable files, the reported value will be
+ * equal to the number of bytes transferred on the
+ * wire.
+ *
+ * Returns: the total bytes transferred
+ */
+int64_t qemu_file_total_transferred(QEMUFile *f);
+
+/*
+ * qemu_file_total_transferred_fast:
+ *
+ * As qemu_file_total_transferred except for writable
+ * files, where no flush is performed and the reported
+ * amount will include the size of any queued buffers,
+ * on top of the amount actually transferred.
+ *
+ * Returns: the total bytes transferred and queued
+ */
+int64_t qemu_file_total_transferred_fast(QEMUFile *f);
+
 /*
  * put_buffer without copying the buffer.
  * The buffer should be available till it is sent asynchronously.
diff --git a/migration/block.c b/migration/block.c
index 077a413325..823453c977 100644
--- a/migration/block.c
+++ b/migration/block.c
@@ -756,8 +756,8 @@ static int block_save_setup(QEMUFile *f, void *opaque)
 static int block_save_iterate(QEMUFile *f, void *opaque)
 {
     int ret;
-    int64_t last_ftell = qemu_ftell(f);
-    int64_t delta_ftell;
+    int64_t last_bytes = qemu_file_total_transferred(f);
+    int64_t delta_bytes;
 
     trace_migration_block_save("iterate", block_mig_state.submitted,
                                block_mig_state.transferred);
@@ -809,10 +809,10 @@ static int block_save_iterate(QEMUFile *f, void *opaque)
     }
 
     qemu_put_be64(f, BLK_MIG_FLAG_EOS);
-    delta_ftell = qemu_ftell(f) - last_ftell;
-    if (delta_ftell > 0) {
+    delta_bytes = qemu_file_total_transferred(f) - last_bytes;
+    if (delta_bytes > 0) {
         return 1;
-    } else if (delta_ftell < 0) {
+    } else if (delta_bytes < 0) {
         return -1;
     } else {
         return 0;
diff --git a/migration/migration.c b/migration/migration.c
index cc253d66e3..e07d9359c6 100644
--- a/migration/migration.c
+++ b/migration/migration.c
@@ -3533,7 +3533,8 @@ static MigThrError migration_detect_error(MigrationState *s)
 /* How many bytes have we transferred since the beginning of the migration */
 static uint64_t migration_total_bytes(MigrationState *s)
 {
-    return qemu_ftell(s->to_dst_file) + ram_counters.multifd_bytes;
+    return qemu_file_total_transferred(s->to_dst_file) +
+        ram_counters.multifd_bytes;
 }
 
 static void migration_calculate_complete(MigrationState *s)
diff --git a/migration/qemu-file.c b/migration/qemu-file.c
index b21da4c5bf..664ac77067 100644
--- a/migration/qemu-file.c
+++ b/migration/qemu-file.c
@@ -657,7 +657,7 @@ int qemu_get_byte(QEMUFile *f)
     return result;
 }
 
-int64_t qemu_ftell_fast(QEMUFile *f)
+int64_t qemu_file_total_transferred_fast(QEMUFile *f)
 {
     int64_t ret = f->total_transferred;
     int i;
@@ -669,7 +669,7 @@ int64_t qemu_ftell_fast(QEMUFile *f)
     return ret;
 }
 
-int64_t qemu_ftell(QEMUFile *f)
+int64_t qemu_file_total_transferred(QEMUFile *f)
 {
     qemu_fflush(f);
     return f->total_transferred;
diff --git a/migration/savevm.c b/migration/savevm.c
index d9076897b8..75d05f1a84 100644
--- a/migration/savevm.c
+++ b/migration/savevm.c
@@ -916,9 +916,9 @@ static void vmstate_save_old_style(QEMUFile *f, SaveStateEntry *se,
 {
     int64_t old_offset, size;
 
-    old_offset = qemu_ftell_fast(f);
+    old_offset = qemu_file_total_transferred_fast(f);
     se->ops->save_state(f, se->opaque);
-    size = qemu_ftell_fast(f) - old_offset;
+    size = qemu_file_total_transferred_fast(f) - old_offset;
 
     if (vmdesc) {
         json_writer_int64(vmdesc, "size", size);
@@ -2887,7 +2887,7 @@ bool save_snapshot(const char *name, bool overwrite, const char *vmstate,
         goto the_end;
     }
     ret = qemu_savevm_state(f, errp);
-    vm_state_size = qemu_ftell(f);
+    vm_state_size = qemu_file_total_transferred(f);
     ret2 = qemu_fclose(f);
     if (ret < 0) {
         goto the_end;
diff --git a/migration/vmstate.c b/migration/vmstate.c
index 36ae8b9e19..b0551e82c6 100644
--- a/migration/vmstate.c
+++ b/migration/vmstate.c
@@ -360,7 +360,7 @@ int vmstate_save_state_v(QEMUFile *f, const VMStateDescription *vmsd,
                 void *curr_elem = first_elem + size * i;
 
                 vmsd_desc_field_start(vmsd, vmdesc_loop, field, i, n_elems);
-                old_offset = qemu_ftell_fast(f);
+                old_offset = qemu_file_total_transferred_fast(f);
                 if (field->flags & VMS_ARRAY_OF_POINTER) {
                     assert(curr_elem);
                     curr_elem = *(void **)curr_elem;
@@ -390,7 +390,7 @@ int vmstate_save_state_v(QEMUFile *f, const VMStateDescription *vmsd,
                     return ret;
                 }
 
-                written_bytes = qemu_ftell_fast(f) - old_offset;
+                written_bytes = qemu_file_total_transferred_fast(f) - old_offset;
                 vmsd_desc_field_end(vmsd, vmdesc_loop, field, written_bytes, i);
 
                 /* Compressed arrays only care about the first element */
-- 
2.35.3


