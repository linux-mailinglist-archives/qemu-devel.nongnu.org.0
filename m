Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 17CDE3D172C
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Jul 2021 21:39:53 +0200 (CEST)
Received: from localhost ([::1]:52230 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m6I4O-0001Lx-55
	for lists+qemu-devel@lfdr.de; Wed, 21 Jul 2021 15:39:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:32864)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1m6Hz6-0000pw-7Q
 for qemu-devel@nongnu.org; Wed, 21 Jul 2021 15:34:24 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:60968)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1m6Hz4-000558-GI
 for qemu-devel@nongnu.org; Wed, 21 Jul 2021 15:34:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626896061;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=DWPj3h23PENZST3rJ31jnS0NnnoQ2JOXMtDihViJ7dA=;
 b=G2JYtLP6vXK6E3i9NaiorHX5Jrena92lBxiYJeiNAeDwd2/t52IW1tSBhsneRDyqfl0UME
 /IMdakOXoKLflGhvvpAFfq+D60OAVAdAUDS5kpcm2t/MpHkVEnLmzol8ZWsNFjZQDBIJGH
 DYSjnKFH1ZxkQS7lEURTXQ6fRi1Op5M=
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-59-bwilF7TUPY6UhyxIvAyRPA-1; Wed, 21 Jul 2021 15:34:20 -0400
X-MC-Unique: bwilF7TUPY6UhyxIvAyRPA-1
Received: by mail-qv1-f72.google.com with SMTP id
 d10-20020a0ce44a0000b02902c99dfad03fso2239727qvm.8
 for <qemu-devel@nongnu.org>; Wed, 21 Jul 2021 12:34:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=DWPj3h23PENZST3rJ31jnS0NnnoQ2JOXMtDihViJ7dA=;
 b=QSycmee7TlAWCOj7tleUTW8FRu+rbDB0WwPRJrx2X34GKHurnhVjX6FPJKGO268chS
 jZDa8echJ1+70EMvxhUizD42TaZb4LJZp6XyaDaBqEUHT3LbiYB+i4H1P/Y2eqCXgDe3
 zvdOdlchK2nQv40XCv8HyIWbZP5yTikDJmLlDJEfJIt157tHoKKmHwyBGkf+Dee6oORy
 lJhb8t1N9KW+m8yZ6Qjw1Yp6iWtVEYPS8/pZLS+gmWDwRvyL69LqyRZoRmRyUXkvrjOy
 TEjaVwrHmWaRom02KqBsAo0ePOOya6Cxdzchl1lxSBymhK8hFpdbuGwG4tYSoEoJxNq9
 3mjA==
X-Gm-Message-State: AOAM5334OTSf2FX/Vdb0dtUncicnlkLy8V334gy1Sq5Nh4a3m1h3FnAo
 zBvpQltpb1t6w0UCW84CINGwKfgoRyymlPLDgIRxq/v/82FiwKE0LNPDipLadyeVRkYSU809V1H
 gKue2hfUaahqul4WJBAH0TCLnIOAD84u6QH9dybof9PLosXXABk5ggYJIQylftIFP
X-Received: by 2002:a37:a78d:: with SMTP id
 q135mr22530102qke.192.1626896059828; 
 Wed, 21 Jul 2021 12:34:19 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzazIna7Ps9PUA9qKAJpNUiGKx8VvhmVCIML107ULOVrql4ouDoGpKUHxbp6xfjfu+Xe8qAnA==
X-Received: by 2002:a37:a78d:: with SMTP id
 q135mr22530074qke.192.1626896059506; 
 Wed, 21 Jul 2021 12:34:19 -0700 (PDT)
Received: from localhost.localdomain
 (bras-base-toroon474qw-grc-65-184-144-111-238.dsl.bell.ca. [184.144.111.238])
 by smtp.gmail.com with ESMTPSA id 8sm10755867qkb.105.2021.07.21.12.34.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Jul 2021 12:34:19 -0700 (PDT)
From: Peter Xu <peterx@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 4/5] migration: Teach QEMUFile to be QIOChannel-aware
Date: Wed, 21 Jul 2021 15:34:08 -0400
Message-Id: <20210721193409.910462-5-peterx@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210721193409.910462-1-peterx@redhat.com>
References: <20210721193409.910462-1-peterx@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=peterx@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.459,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Lukas Straub <lukasstraub2@web.de>,
 "Daniel P . Berrange" <berrange@redhat.com>,
 Juan Quintela <quintela@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>, peterx@redhat.com,
 Leonardo Bras Soares Passos <lsoaresp@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

migration uses QIOChannel typed qemufiles.  In follow up patches, we'll need
the capability to identify this fact, so that we can get the backing QIOChannel
from a QEMUFile.

We can also define types for QEMUFile but so far since we only need to be able
to identify QIOChannel, introduce a boolean which is simpler.

Introduce another helper qemu_file_get_ioc() to return the ioc backend of a
qemufile if has_ioc is set.

No functional change.

Signed-off-by: Peter Xu <peterx@redhat.com>
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


