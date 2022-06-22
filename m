Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 25F48553FA9
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Jun 2022 02:50:33 +0200 (CEST)
Received: from localhost ([::1]:43326 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o3oZk-0002af-7U
	for lists+qemu-devel@lfdr.de; Tue, 21 Jun 2022 20:50:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56714)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1o3oCi-0003zb-LW
 for qemu-devel@nongnu.org; Tue, 21 Jun 2022 20:26:44 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:28111)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1o3oCg-0006D9-R7
 for qemu-devel@nongnu.org; Tue, 21 Jun 2022 20:26:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1655857602;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6js0qAaHxmu3dXcYfctx/iwpn1Ev8c7g31iO7EcPnCI=;
 b=YHZyyQ9wWeRca4x3dc74Hb5U7GVpr711d7qWnTaH3lK9yOlwtYmyNSCr9QC1UNOEZ6AJVs
 9K2lCz+r28HJSEhQrYPE5TGd7+XG/DUYX9+XaCsaBAx303+GhBv+2zDXBRzx2UgS7ccQVk
 0Kl9ir/EPjWC+sEA/hKbQUAKXKfqyzs=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-611-0QDHq750MxCzUTjdY8Bl7g-1; Tue, 21 Jun 2022 20:26:38 -0400
X-MC-Unique: 0QDHq750MxCzUTjdY8Bl7g-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 90A6B1C08962;
 Wed, 22 Jun 2022 00:26:38 +0000 (UTC)
Received: from secure.mitica (unknown [10.39.192.22])
 by smtp.corp.redhat.com (Postfix) with ESMTP id DA078141510D;
 Wed, 22 Jun 2022 00:26:36 +0000 (UTC)
From: Juan Quintela <quintela@redhat.com>
To: qemu-devel@nongnu.org
Cc: Hailiang Zhang <zhanghailiang@xfusion.com>, Eric Blake <eblake@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Fam Zheng <fam@euphon.net>, "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Juan Quintela <quintela@redhat.com>, qemu-block@nongnu.org,
 Stefan Hajnoczi <stefanha@redhat.com>,
 Markus Armbruster <armbru@redhat.com>
Subject: [PULL 23/25] migration: remove the QEMUFileOps 'writev_buffer'
 callback
Date: Wed, 22 Jun 2022 02:25:45 +0200
Message-Id: <20220622002547.64784-24-quintela@redhat.com>
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Daniel P. Berrangé <berrange@redhat.com>

This directly implements the writev_buffer logic using QIOChannel APIs.

Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
Reviewed-by: Juan Quintela <quintela@redhat.com>
Signed-off-by: Juan Quintela <quintela@redhat.com>
---
 migration/qemu-file.h         |  9 --------
 migration/qemu-file-channel.c | 43 -----------------------------------
 migration/qemu-file.c         | 24 +++++++------------
 3 files changed, 8 insertions(+), 68 deletions(-)

diff --git a/migration/qemu-file.h b/migration/qemu-file.h
index f7ed568894..de3f066014 100644
--- a/migration/qemu-file.h
+++ b/migration/qemu-file.h
@@ -29,14 +29,6 @@
 #include "exec/cpu-common.h"
 #include "io/channel.h"
 
-/*
- * This function writes an iovec to file. The handler must write all
- * of the data or return a negative errno value.
- */
-typedef ssize_t (QEMUFileWritevBufferFunc)(void *opaque, struct iovec *iov,
-                                           int iovcnt, int64_t pos,
-                                           Error **errp);
-
 /*
  * This function provides hooks around different
  * stages of RAM migration.
@@ -69,7 +61,6 @@ typedef size_t (QEMURamSaveFunc)(QEMUFile *f,
 typedef QEMUFile *(QEMURetPathFunc)(void *opaque);
 
 typedef struct QEMUFileOps {
-    QEMUFileWritevBufferFunc *writev_buffer;
     QEMURetPathFunc *get_return_path;
 } QEMUFileOps;
 
diff --git a/migration/qemu-file-channel.c b/migration/qemu-file-channel.c
index 7b32831752..2e139f7bcd 100644
--- a/migration/qemu-file-channel.c
+++ b/migration/qemu-file-channel.c
@@ -32,48 +32,6 @@
 #include "yank_functions.h"
 
 
-static ssize_t channel_writev_buffer(void *opaque,
-                                     struct iovec *iov,
-                                     int iovcnt,
-                                     int64_t pos,
-                                     Error **errp)
-{
-    QIOChannel *ioc = QIO_CHANNEL(opaque);
-    ssize_t done = 0;
-    struct iovec *local_iov = g_new(struct iovec, iovcnt);
-    struct iovec *local_iov_head = local_iov;
-    unsigned int nlocal_iov = iovcnt;
-
-    nlocal_iov = iov_copy(local_iov, nlocal_iov,
-                          iov, iovcnt,
-                          0, iov_size(iov, iovcnt));
-
-    while (nlocal_iov > 0) {
-        ssize_t len;
-        len = qio_channel_writev(ioc, local_iov, nlocal_iov, errp);
-        if (len == QIO_CHANNEL_ERR_BLOCK) {
-            if (qemu_in_coroutine()) {
-                qio_channel_yield(ioc, G_IO_OUT);
-            } else {
-                qio_channel_wait(ioc, G_IO_OUT);
-            }
-            continue;
-        }
-        if (len < 0) {
-            done = -EIO;
-            goto cleanup;
-        }
-
-        iov_discard_front(&local_iov, &nlocal_iov, len);
-        done += len;
-    }
-
- cleanup:
-    g_free(local_iov_head);
-    return done;
-}
-
-
 static QEMUFile *channel_get_input_return_path(void *opaque)
 {
     QIOChannel *ioc = QIO_CHANNEL(opaque);
@@ -94,7 +52,6 @@ static const QEMUFileOps channel_input_ops = {
 
 
 static const QEMUFileOps channel_output_ops = {
-    .writev_buffer = channel_writev_buffer,
     .get_return_path = channel_get_output_return_path,
 };
 
diff --git a/migration/qemu-file.c b/migration/qemu-file.c
index df438724cd..b787dabff7 100644
--- a/migration/qemu-file.c
+++ b/migration/qemu-file.c
@@ -248,10 +248,6 @@ static void qemu_iovec_release_ram(QEMUFile *f)
  */
 void qemu_fflush(QEMUFile *f)
 {
-    ssize_t ret = 0;
-    ssize_t expect = 0;
-    Error *local_error = NULL;
-
     if (!qemu_file_is_writable(f)) {
         return;
     }
@@ -260,22 +256,18 @@ void qemu_fflush(QEMUFile *f)
         return;
     }
     if (f->iovcnt > 0) {
-        expect = iov_size(f->iov, f->iovcnt);
-        ret = f->ops->writev_buffer(f->ioc, f->iov, f->iovcnt, f->total_transferred,
-                                    &local_error);
+        Error *local_error = NULL;
+        if (qio_channel_writev_all(f->ioc,
+                                   f->iov, f->iovcnt,
+                                   &local_error) < 0) {
+            qemu_file_set_error_obj(f, -EIO, local_error);
+        } else {
+            f->total_transferred += iov_size(f->iov, f->iovcnt);
+        }
 
         qemu_iovec_release_ram(f);
     }
 
-    if (ret >= 0) {
-        f->total_transferred += ret;
-    }
-    /* We expect the QEMUFile write impl to send the full
-     * data set we requested, so sanity check that.
-     */
-    if (ret != expect) {
-        qemu_file_set_error_obj(f, ret < 0 ? ret : -EIO, local_error);
-    }
     f->buf_index = 0;
     f->iovcnt = 0;
 }
-- 
2.35.3


