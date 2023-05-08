Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A2B966FB0F0
	for <lists+qemu-devel@lfdr.de>; Mon,  8 May 2023 15:11:35 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pw0eB-00056V-Nv; Mon, 08 May 2023 09:11:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pw0dD-0003pC-Ab
 for qemu-devel@nongnu.org; Mon, 08 May 2023 09:10:26 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pw0cy-00010O-Rk
 for qemu-devel@nongnu.org; Mon, 08 May 2023 09:10:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1683551407;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=XFas+oW+J1q9+8K/q//rQzFEL7jXYXvDyd0woIcR0no=;
 b=LEBtJdPGLfuekKLZQcvHCdnY4cKWBPK5NxbdLEWBh3BofUngk8SyEXT1a17qdOLmLj7FHB
 M4i4tksM/YbKXlLtP0wNM020PIWFNIUWtRfG98TE7zVbVR5xQz2oEvReJFPGdv479Q5dhB
 dPJy0P7E6ycAt4sX2+833vtyoDJPAVY=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-170-b7wwLYGbN3eW81-3EaYM4w-1; Mon, 08 May 2023 09:10:06 -0400
X-MC-Unique: b7wwLYGbN3eW81-3EaYM4w-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 2F902100F650;
 Mon,  8 May 2023 13:10:05 +0000 (UTC)
Received: from secure.mitica (unknown [10.39.193.236])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 710DF2166B40;
 Mon,  8 May 2023 13:10:01 +0000 (UTC)
From: Juan Quintela <quintela@redhat.com>
To: qemu-devel@nongnu.org
Cc: Daniel Henrique Barboza <danielhb413@gmail.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 David Hildenbrand <david@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, qemu-block@nongnu.org,
 Eric Blake <eblake@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
 John Snow <jsnow@redhat.com>, Juan Quintela <quintela@redhat.com>,
 Halil Pasic <pasic@linux.ibm.com>, Peter Xu <peterx@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 David Gibson <david@gibson.dropbear.id.au>,
 Harsh Prateek Bora <harshpb@linux.ibm.com>,
 Eric Farman <farman@linux.ibm.com>, Greg Kurz <groug@kaod.org>,
 qemu-ppc@nongnu.org, qemu-s390x@nongnu.org, Fam Zheng <fam@euphon.net>,
 Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Leonardo Bras <leobras@redhat.com>, Ilya Leoshkevich <iii@linux.ibm.com>
Subject: [PATCH 06/21] qemu-file: Remove total from
 qemu_file_total_transferred_*()
Date: Mon,  8 May 2023 15:08:54 +0200
Message-Id: <20230508130909.65420-7-quintela@redhat.com>
In-Reply-To: <20230508130909.65420-1-quintela@redhat.com>
References: <20230508130909.65420-1-quintela@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
Received-SPF: pass client-ip=170.10.133.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 T_SCC_BODY_TEXT_LINE=-0.01,
 T_SPF_TEMPERROR=0.01 autolearn=unavailable autolearn_force=no
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

Function is already quite long.

Signed-off-by: Juan Quintela <quintela@redhat.com>
---
 migration/block.c     |  4 ++--
 migration/migration.c |  2 +-
 migration/qemu-file.c |  4 ++--
 migration/qemu-file.h | 10 +++++-----
 migration/savevm.c    |  6 +++---
 migration/vmstate.c   |  5 ++---
 6 files changed, 15 insertions(+), 16 deletions(-)

diff --git a/migration/block.c b/migration/block.c
index a37678ce95..12617b4152 100644
--- a/migration/block.c
+++ b/migration/block.c
@@ -747,7 +747,7 @@ static int block_save_setup(QEMUFile *f, void *opaque)
 static int block_save_iterate(QEMUFile *f, void *opaque)
 {
     int ret;
-    uint64_t last_bytes = qemu_file_total_transferred(f);
+    uint64_t last_bytes = qemu_file_transferred(f);
 
     trace_migration_block_save("iterate", block_mig_state.submitted,
                                block_mig_state.transferred);
@@ -799,7 +799,7 @@ static int block_save_iterate(QEMUFile *f, void *opaque)
     }
 
     qemu_put_be64(f, BLK_MIG_FLAG_EOS);
-    uint64_t delta_bytes = qemu_file_total_transferred(f) - last_bytes;
+    uint64_t delta_bytes = qemu_file_transferred(f) - last_bytes;
     return (delta_bytes > 0);
 }
 
diff --git a/migration/migration.c b/migration/migration.c
index e17a6538b4..b1cfb56523 100644
--- a/migration/migration.c
+++ b/migration/migration.c
@@ -2621,7 +2621,7 @@ static MigThrError migration_detect_error(MigrationState *s)
 /* How many bytes have we transferred since the beginning of the migration */
 static uint64_t migration_total_bytes(MigrationState *s)
 {
-    return qemu_file_total_transferred(s->to_dst_file) +
+    return qemu_file_transferred(s->to_dst_file) +
         stat64_get(&mig_stats.multifd_bytes);
 }
 
diff --git a/migration/qemu-file.c b/migration/qemu-file.c
index f3cb0cd94f..6ebc2bd3ec 100644
--- a/migration/qemu-file.c
+++ b/migration/qemu-file.c
@@ -709,7 +709,7 @@ int coroutine_mixed_fn qemu_get_byte(QEMUFile *f)
     return result;
 }
 
-uint64_t qemu_file_total_transferred_fast(QEMUFile *f)
+uint64_t qemu_file_transferred_fast(QEMUFile *f)
 {
     uint64_t ret = f->total_transferred;
     int i;
@@ -721,7 +721,7 @@ uint64_t qemu_file_total_transferred_fast(QEMUFile *f)
     return ret;
 }
 
-uint64_t qemu_file_total_transferred(QEMUFile *f)
+uint64_t qemu_file_transferred(QEMUFile *f)
 {
     qemu_fflush(f);
     return f->total_transferred;
diff --git a/migration/qemu-file.h b/migration/qemu-file.h
index d758e7f10b..ab164a58d0 100644
--- a/migration/qemu-file.h
+++ b/migration/qemu-file.h
@@ -68,7 +68,7 @@ void qemu_file_set_hooks(QEMUFile *f, const QEMUFileHooks *hooks);
 int qemu_fclose(QEMUFile *f);
 
 /*
- * qemu_file_total_transferred:
+ * qemu_file_transferred:
  *
  * Report the total number of bytes transferred with
  * this file.
@@ -83,19 +83,19 @@ int qemu_fclose(QEMUFile *f);
  *
  * Returns: the total bytes transferred
  */
-uint64_t qemu_file_total_transferred(QEMUFile *f);
+uint64_t qemu_file_transferred(QEMUFile *f);
 
 /*
- * qemu_file_total_transferred_fast:
+ * qemu_file_transferred_fast:
  *
- * As qemu_file_total_transferred except for writable
+ * As qemu_file_transferred except for writable
  * files, where no flush is performed and the reported
  * amount will include the size of any queued buffers,
  * on top of the amount actually transferred.
  *
  * Returns: the total bytes transferred and queued
  */
-uint64_t qemu_file_total_transferred_fast(QEMUFile *f);
+uint64_t qemu_file_transferred_fast(QEMUFile *f);
 
 /*
  * put_buffer without copying the buffer.
diff --git a/migration/savevm.c b/migration/savevm.c
index 032044b1d5..e33788343a 100644
--- a/migration/savevm.c
+++ b/migration/savevm.c
@@ -927,9 +927,9 @@ static int vmstate_load(QEMUFile *f, SaveStateEntry *se)
 static void vmstate_save_old_style(QEMUFile *f, SaveStateEntry *se,
                                    JSONWriter *vmdesc)
 {
-    uint64_t old_offset = qemu_file_total_transferred_fast(f);
+    uint64_t old_offset = qemu_file_transferred_fast(f);
     se->ops->save_state(f, se->opaque);
-    uint64_t size = qemu_file_total_transferred_fast(f) - old_offset;
+    uint64_t size = qemu_file_transferred_fast(f) - old_offset;
 
     if (vmdesc) {
         json_writer_int64(vmdesc, "size", size);
@@ -2956,7 +2956,7 @@ bool save_snapshot(const char *name, bool overwrite, const char *vmstate,
         goto the_end;
     }
     ret = qemu_savevm_state(f, errp);
-    vm_state_size = qemu_file_total_transferred(f);
+    vm_state_size = qemu_file_transferred(f);
     ret2 = qemu_fclose(f);
     if (ret < 0) {
         goto the_end;
diff --git a/migration/vmstate.c b/migration/vmstate.c
index 351f56104e..af01d54b6f 100644
--- a/migration/vmstate.c
+++ b/migration/vmstate.c
@@ -361,7 +361,7 @@ int vmstate_save_state_v(QEMUFile *f, const VMStateDescription *vmsd,
                 void *curr_elem = first_elem + size * i;
 
                 vmsd_desc_field_start(vmsd, vmdesc_loop, field, i, n_elems);
-                old_offset = qemu_file_total_transferred_fast(f);
+                old_offset = qemu_file_transferred_fast(f);
                 if (field->flags & VMS_ARRAY_OF_POINTER) {
                     assert(curr_elem);
                     curr_elem = *(void **)curr_elem;
@@ -391,8 +391,7 @@ int vmstate_save_state_v(QEMUFile *f, const VMStateDescription *vmsd,
                     return ret;
                 }
 
-                written_bytes = qemu_file_total_transferred_fast(f) -
-                                    old_offset;
+                written_bytes = qemu_file_transferred_fast(f) - old_offset;
                 vmsd_desc_field_end(vmsd, vmdesc_loop, field, written_bytes, i);
 
                 /* Compressed arrays only care about the first element */
-- 
2.40.0


