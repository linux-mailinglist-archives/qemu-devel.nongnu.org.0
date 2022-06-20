Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CB5E5516B2
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Jun 2022 13:10:14 +0200 (CEST)
Received: from localhost ([::1]:54930 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o3FIK-00046a-EN
	for lists+qemu-devel@lfdr.de; Mon, 20 Jun 2022 07:10:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60364)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1o3FAo-0002yd-F7
 for qemu-devel@nongnu.org; Mon, 20 Jun 2022 07:02:26 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:46965)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1o3FAj-0007Wd-I8
 for qemu-devel@nongnu.org; Mon, 20 Jun 2022 07:02:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1655722941;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Swe1LL4OwyTP+7U3UU7hXNmYxlJ4Jvm5dnsWCbUlboU=;
 b=cWMjB5jTLbYINEDxEzf24V1WUMJX0RlMso5SA2C+4GiLq9pY94Cax8JjmZ5qi7H0cb5ZdC
 ER53pdVYlTV1kqC8+sSdbaQsO9l7I/ClCwV4m0eivQJRoqv8yAwsdxGoR8DR0AUEo4TD87
 pi2B20a2k11Ny3H6Df8uuklus6V7zDI=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-562-2lQaCKCNN_CA8k6H62yFuA-1; Mon, 20 Jun 2022 07:02:19 -0400
X-MC-Unique: 2lQaCKCNN_CA8k6H62yFuA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 8422A1C01E80;
 Mon, 20 Jun 2022 11:02:19 +0000 (UTC)
Received: from localhost.localdomain.com (unknown [10.33.36.144])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 081C0C2810D;
 Mon, 20 Jun 2022 11:02:17 +0000 (UTC)
From: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
To: qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Juan Quintela <quintela@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 Hailiang Zhang <zhang.zhanghailiang@huawei.com>,
 Fam Zheng <fam@euphon.net>, Hailiang Zhang <zhanghailiang@xfusion.com>
Subject: [PATCH v2 06/21] migration: rename qemu_ftell to
 qemu_file_total_transferred
Date: Mon, 20 Jun 2022 12:01:50 +0100
Message-Id: <20220620110205.1357829-7-berrange@redhat.com>
In-Reply-To: <20220620110205.1357829-1-berrange@redhat.com>
References: <20220620110205.1357829-1-berrange@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.8
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
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

The name 'ftell' gives the misleading impression that the QEMUFile
objects are seekable. This is not the case, as in general we just
have an opaque stream. The users of this method are only interested
in the total bytes processed. This switches to a new name that
reflects the intended usage.

Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
---
 migration/block.c     | 10 +++++-----
 migration/migration.c |  3 ++-
 migration/qemu-file.c |  4 ++--
 migration/qemu-file.h | 33 +++++++++++++++++++++++++++++++--
 migration/savevm.c    |  6 +++---
 migration/vmstate.c   |  4 ++--
 6 files changed, 45 insertions(+), 15 deletions(-)

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
index 31739b2af9..c4a9d8f20f 100644
--- a/migration/migration.c
+++ b/migration/migration.c
@@ -3544,7 +3544,8 @@ static MigThrError migration_detect_error(MigrationState *s)
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
2.36.1


