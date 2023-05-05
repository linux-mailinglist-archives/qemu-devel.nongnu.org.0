Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C49716F7A2F
	for <lists+qemu-devel@lfdr.de>; Fri,  5 May 2023 02:51:09 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pujd2-0004MJ-50; Thu, 04 May 2023 20:48:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pujcz-0004Ku-Tq
 for qemu-devel@nongnu.org; Thu, 04 May 2023 20:48:53 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pujcx-0001Kw-93
 for qemu-devel@nongnu.org; Thu, 04 May 2023 20:48:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1683247730;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jFbyi6f+EalG6POKGAdgY+0P92ESpJvgeM/xst5KKos=;
 b=B87uEvcF5UO63viWySCOjNLQlEgeREg+2S6umP7kTGiI75ls4sa8oNusFwJro9HEWQl9Rz
 sKe6VbNw53ehNAolXZ4ZnOanE91o1s5GVi+C87440akEUZ7x7AQzW90DLZ/Ec4lpMasNAv
 c3A9Xr0IDATXacZm3KIYTToRo/Xy2Gk=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-211-cc7fmGLuNzuhR4VX3wmi7Q-1; Thu, 04 May 2023 20:48:47 -0400
X-MC-Unique: cc7fmGLuNzuhR4VX3wmi7Q-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 009DC1C068C1;
 Fri,  5 May 2023 00:48:47 +0000 (UTC)
Received: from secure.mitica (unknown [10.39.193.236])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 22249404B24D;
 Fri,  5 May 2023 00:48:45 +0000 (UTC)
From: Juan Quintela <quintela@redhat.com>
To: qemu-devel@nongnu.org
Cc: Eric Blake <eblake@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
 Stefan Hajnoczi <stefanha@redhat.com>, John Snow <jsnow@redhat.com>,
 Juan Quintela <quintela@redhat.com>, qemu-block@nongnu.org,
 Leonardo Bras <leobras@redhat.com>, Fam Zheng <fam@euphon.net>,
 Peter Xu <peterx@redhat.com>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>
Subject: [PULL 15/16] qemu-file: Make total_transferred an uint64_t
Date: Fri,  5 May 2023 02:48:11 +0200
Message-Id: <20230505004812.31583-16-quintela@redhat.com>
In-Reply-To: <20230505004812.31583-1-quintela@redhat.com>
References: <20230505004812.31583-1-quintela@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
Received-SPF: pass client-ip=170.10.129.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.161,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

Change all the functions that use it.  It was already passed as
uint64_t.

Signed-off-by: Juan Quintela <quintela@redhat.com>
Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
Message-Id: <20230504113841.23130-8-quintela@redhat.com>
---
 migration/block.c     | 5 ++---
 migration/qemu-file.c | 8 ++++----
 migration/qemu-file.h | 4 ++--
 migration/savevm.c    | 6 ++----
 migration/vmstate.c   | 2 +-
 5 files changed, 11 insertions(+), 14 deletions(-)

diff --git a/migration/block.c b/migration/block.c
index 3499f75e37..a37678ce95 100644
--- a/migration/block.c
+++ b/migration/block.c
@@ -747,8 +747,7 @@ static int block_save_setup(QEMUFile *f, void *opaque)
 static int block_save_iterate(QEMUFile *f, void *opaque)
 {
     int ret;
-    int64_t last_bytes = qemu_file_total_transferred(f);
-    int64_t delta_bytes;
+    uint64_t last_bytes = qemu_file_total_transferred(f);
 
     trace_migration_block_save("iterate", block_mig_state.submitted,
                                block_mig_state.transferred);
@@ -800,7 +799,7 @@ static int block_save_iterate(QEMUFile *f, void *opaque)
     }
 
     qemu_put_be64(f, BLK_MIG_FLAG_EOS);
-    delta_bytes = qemu_file_total_transferred(f) - last_bytes;
+    uint64_t delta_bytes = qemu_file_total_transferred(f) - last_bytes;
     return (delta_bytes > 0);
 }
 
diff --git a/migration/qemu-file.c b/migration/qemu-file.c
index 11b510aa29..ccbefc347e 100644
--- a/migration/qemu-file.c
+++ b/migration/qemu-file.c
@@ -51,7 +51,7 @@ struct QEMUFile {
     int64_t rate_limit_used;
 
     /* The sum of bytes transferred on the wire */
-    int64_t total_transferred;
+    uint64_t total_transferred;
 
     int buf_index;
     int buf_size; /* 0 when writing */
@@ -708,9 +708,9 @@ int coroutine_mixed_fn qemu_get_byte(QEMUFile *f)
     return result;
 }
 
-int64_t qemu_file_total_transferred_fast(QEMUFile *f)
+uint64_t qemu_file_total_transferred_fast(QEMUFile *f)
 {
-    int64_t ret = f->total_transferred;
+    uint64_t ret = f->total_transferred;
     int i;
 
     for (i = 0; i < f->iovcnt; i++) {
@@ -720,7 +720,7 @@ int64_t qemu_file_total_transferred_fast(QEMUFile *f)
     return ret;
 }
 
-int64_t qemu_file_total_transferred(QEMUFile *f)
+uint64_t qemu_file_total_transferred(QEMUFile *f)
 {
     qemu_fflush(f);
     return f->total_transferred;
diff --git a/migration/qemu-file.h b/migration/qemu-file.h
index d16cd50448..4f26bf6961 100644
--- a/migration/qemu-file.h
+++ b/migration/qemu-file.h
@@ -83,7 +83,7 @@ int qemu_fclose(QEMUFile *f);
  *
  * Returns: the total bytes transferred
  */
-int64_t qemu_file_total_transferred(QEMUFile *f);
+uint64_t qemu_file_total_transferred(QEMUFile *f);
 
 /*
  * qemu_file_total_transferred_fast:
@@ -95,7 +95,7 @@ int64_t qemu_file_total_transferred(QEMUFile *f);
  *
  * Returns: the total bytes transferred and queued
  */
-int64_t qemu_file_total_transferred_fast(QEMUFile *f);
+uint64_t qemu_file_total_transferred_fast(QEMUFile *f);
 
 /*
  * put_buffer without copying the buffer.
diff --git a/migration/savevm.c b/migration/savevm.c
index a9d0a88e62..032044b1d5 100644
--- a/migration/savevm.c
+++ b/migration/savevm.c
@@ -927,11 +927,9 @@ static int vmstate_load(QEMUFile *f, SaveStateEntry *se)
 static void vmstate_save_old_style(QEMUFile *f, SaveStateEntry *se,
                                    JSONWriter *vmdesc)
 {
-    int64_t old_offset, size;
-
-    old_offset = qemu_file_total_transferred_fast(f);
+    uint64_t old_offset = qemu_file_total_transferred_fast(f);
     se->ops->save_state(f, se->opaque);
-    size = qemu_file_total_transferred_fast(f) - old_offset;
+    uint64_t size = qemu_file_total_transferred_fast(f) - old_offset;
 
     if (vmdesc) {
         json_writer_int64(vmdesc, "size", size);
diff --git a/migration/vmstate.c b/migration/vmstate.c
index 83ca4c7d3e..351f56104e 100644
--- a/migration/vmstate.c
+++ b/migration/vmstate.c
@@ -349,7 +349,7 @@ int vmstate_save_state_v(QEMUFile *f, const VMStateDescription *vmsd,
             void *first_elem = opaque + field->offset;
             int i, n_elems = vmstate_n_elems(opaque, field);
             int size = vmstate_size(opaque, field);
-            int64_t old_offset, written_bytes;
+            uint64_t old_offset, written_bytes;
             JSONWriter *vmdesc_loop = vmdesc;
 
             trace_vmstate_save_state_loop(vmsd->name, field->name, n_elems);
-- 
2.40.0


