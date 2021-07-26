Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 19E063D59D0
	for <lists+qemu-devel@lfdr.de>; Mon, 26 Jul 2021 14:53:21 +0200 (CEST)
Received: from localhost ([::1]:50954 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m806i-0005Rn-5T
	for lists+qemu-devel@lfdr.de; Mon, 26 Jul 2021 08:53:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44494)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1m7zxz-0000qx-4i
 for qemu-devel@nongnu.org; Mon, 26 Jul 2021 08:44:19 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:42235)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1m7zxx-0007zh-A1
 for qemu-devel@nongnu.org; Mon, 26 Jul 2021 08:44:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1627303455;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=PZ6JDRaapgYNEwJ4xGhxp4PiAOGdf2DljZlAzOzUtgA=;
 b=hDTulML88aK83Z/I9ag25m6VXNwqN3nFLO5q4jGWl6CdBqNuy7BzSZTN4Gt51XOmBEBKSh
 7+kmxR5wy288Eg+8LLrUCdNPaqCfN8Y90SEw/YDue6GaEUCEwZ+Jf1vXTdCKXggJi0BOsh
 QraAxY2qCCxaoJhkUh7K3wem3PkTWCs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-459-49ZjlaJOMz2EPjXn_xAtNw-1; Mon, 26 Jul 2021 08:44:14 -0400
X-MC-Unique: 49ZjlaJOMz2EPjXn_xAtNw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 174F2802929;
 Mon, 26 Jul 2021 12:44:13 +0000 (UTC)
Received: from dgilbert-t580.localhost (ovpn-113-117.ams2.redhat.com
 [10.36.113.117])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 00A0A60C81;
 Mon, 26 Jul 2021 12:43:56 +0000 (UTC)
From: "Dr. David Alan Gilbert (git)" <dgilbert@redhat.com>
To: qemu-devel@nongnu.org,
	wei.w.wang@intel.com,
	peterx@redhat.com
Subject: [PULL 5/7] migration: Teach QEMUFile to be QIOChannel-aware
Date: Mon, 26 Jul 2021 13:43:29 +0100
Message-Id: <20210726124331.124710-6-dgilbert@redhat.com>
In-Reply-To: <20210726124331.124710-1-dgilbert@redhat.com>
References: <20210726124331.124710-1-dgilbert@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.717,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
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
Cc: berrange@redhat.com, leobras@redhat.com, david@redhat.com,
 quintela@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Peter Xu <peterx@redhat.com>

migration uses QIOChannel typed qemufiles.  In follow up patches, we'll need
the capability to identify this fact, so that we can get the backing QIOChannel
from a QEMUFile.

We can also define types for QEMUFile but so far since we only need to be able
to identify QIOChannel, introduce a boolean which is simpler.

Introduce another helper qemu_file_get_ioc() to return the ioc backend of a
qemufile if has_ioc is set.

No functional change.

Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
Signed-off-by: Peter Xu <peterx@redhat.com>
Message-Id: <20210722175841.938739-5-peterx@redhat.com>
Reviewed-by: Lukas Straub <lukasstraub2@web.de>
Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
---
 migration/qemu-file-channel.c |  4 ++--
 migration/qemu-file.c         | 17 ++++++++++++++++-
 migration/qemu-file.h         |  4 +++-
 migration/ram.c               |  2 +-
 migration/savevm.c            |  4 ++--
 5 files changed, 24 insertions(+), 7 deletions(-)

diff --git a/migration/qemu-file-channel.c b/migration/qemu-file-channel.c
index 867a5ed0c3..2f8b1fcd46 100644
--- a/migration/qemu-file-channel.c
+++ b/migration/qemu-file-channel.c
@@ -187,11 +187,11 @@ static const QEMUFileOps channel_output_ops = {
 QEMUFile *qemu_fopen_channel_input(QIOChannel *ioc)
 {
     object_ref(OBJECT(ioc));
-    return qemu_fopen_ops(ioc, &channel_input_ops);
+    return qemu_fopen_ops(ioc, &channel_input_ops, true);
 }
 
 QEMUFile *qemu_fopen_channel_output(QIOChannel *ioc)
 {
     object_ref(OBJECT(ioc));
-    return qemu_fopen_ops(ioc, &channel_output_ops);
+    return qemu_fopen_ops(ioc, &channel_output_ops, true);
 }
diff --git a/migration/qemu-file.c b/migration/qemu-file.c
index 1eacf9e831..6338d8e2ff 100644
--- a/migration/qemu-file.c
+++ b/migration/qemu-file.c
@@ -55,6 +55,8 @@ struct QEMUFile {
     Error *last_error_obj;
     /* has the file has been shutdown */
     bool shutdown;
+    /* Whether opaque points to a QIOChannel */
+    bool has_ioc;
 };
 
 /*
@@ -101,7 +103,7 @@ bool qemu_file_mode_is_not_valid(const char *mode)
     return false;
 }
 
-QEMUFile *qemu_fopen_ops(void *opaque, const QEMUFileOps *ops)
+QEMUFile *qemu_fopen_ops(void *opaque, const QEMUFileOps *ops, bool has_ioc)
 {
     QEMUFile *f;
 
@@ -109,6 +111,7 @@ QEMUFile *qemu_fopen_ops(void *opaque, const QEMUFileOps *ops)
 
     f->opaque = opaque;
     f->ops = ops;
+    f->has_ioc = has_ioc;
     return f;
 }
 
@@ -851,3 +854,15 @@ void qemu_file_set_blocking(QEMUFile *f, bool block)
         f->ops->set_blocking(f->opaque, block, NULL);
     }
 }
+
+/*
+ * Return the ioc object if it's a migration channel.  Note: it can return NULL
+ * for callers passing in a non-migration qemufile.  E.g. see qemu_fopen_bdrv()
+ * and its usage in e.g. load_snapshot().  So we need to check against NULL
+ * before using it.  If without the check, migration_incoming_state_destroy()
+ * could fail for load_snapshot().
+ */
+QIOChannel *qemu_file_get_ioc(QEMUFile *file)
+{
+    return file->has_ioc ? QIO_CHANNEL(file->opaque) : NULL;
+}
diff --git a/migration/qemu-file.h b/migration/qemu-file.h
index a9b6d6ccb7..3f36d4dc8c 100644
--- a/migration/qemu-file.h
+++ b/migration/qemu-file.h
@@ -27,6 +27,7 @@
 
 #include <zlib.h>
 #include "exec/cpu-common.h"
+#include "io/channel.h"
 
 /* Read a chunk of data from a file at the given position.  The pos argument
  * can be ignored if the file is only be used for streaming.  The number of
@@ -119,7 +120,7 @@ typedef struct QEMUFileHooks {
     QEMURamSaveFunc *save_page;
 } QEMUFileHooks;
 
-QEMUFile *qemu_fopen_ops(void *opaque, const QEMUFileOps *ops);
+QEMUFile *qemu_fopen_ops(void *opaque, const QEMUFileOps *ops, bool has_ioc);
 void qemu_file_set_hooks(QEMUFile *f, const QEMUFileHooks *hooks);
 int qemu_get_fd(QEMUFile *f);
 int qemu_fclose(QEMUFile *f);
@@ -179,5 +180,6 @@ void ram_control_load_hook(QEMUFile *f, uint64_t flags, void *data);
 size_t ram_control_save_page(QEMUFile *f, ram_addr_t block_offset,
                              ram_addr_t offset, size_t size,
                              uint64_t *bytes_sent);
+QIOChannel *qemu_file_get_ioc(QEMUFile *file);
 
 #endif
diff --git a/migration/ram.c b/migration/ram.c
index f728f5072f..08b3cb7a4a 100644
--- a/migration/ram.c
+++ b/migration/ram.c
@@ -550,7 +550,7 @@ static int compress_threads_save_setup(void)
         /* comp_param[i].file is just used as a dummy buffer to save data,
          * set its ops to empty.
          */
-        comp_param[i].file = qemu_fopen_ops(NULL, &empty_ops);
+        comp_param[i].file = qemu_fopen_ops(NULL, &empty_ops, false);
         comp_param[i].done = true;
         comp_param[i].quit = false;
         qemu_mutex_init(&comp_param[i].mutex);
diff --git a/migration/savevm.c b/migration/savevm.c
index 72848b946c..96b5e5d639 100644
--- a/migration/savevm.c
+++ b/migration/savevm.c
@@ -168,9 +168,9 @@ static const QEMUFileOps bdrv_write_ops = {
 static QEMUFile *qemu_fopen_bdrv(BlockDriverState *bs, int is_writable)
 {
     if (is_writable) {
-        return qemu_fopen_ops(bs, &bdrv_write_ops);
+        return qemu_fopen_ops(bs, &bdrv_write_ops, false);
     }
-    return qemu_fopen_ops(bs, &bdrv_read_ops);
+    return qemu_fopen_ops(bs, &bdrv_read_ops, false);
 }
 
 
-- 
2.31.1


