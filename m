Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D1835516CC
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Jun 2022 13:10:36 +0200 (CEST)
Received: from localhost ([::1]:55076 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o3FIf-0004DC-KZ
	for lists+qemu-devel@lfdr.de; Mon, 20 Jun 2022 07:10:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60426)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1o3FAr-00034O-EA
 for qemu-devel@nongnu.org; Mon, 20 Jun 2022 07:02:29 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:31558)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1o3FAj-0007Wl-Px
 for qemu-devel@nongnu.org; Mon, 20 Jun 2022 07:02:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1655722941;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=f0CisK0zdZk9c6Etsb683nKE65AlAvNvuR7oFPZ/+D8=;
 b=ExRgI+wJLT/+KNKYQX1u8Wik0QvlmQChuDsNM/8ED7wWd6Wly0VZbeRwsmDUG4X8dS9TZK
 PSqMk2iJWEhV9mvCD09EJvjHrMasyKQW6A11abqWoT5RnvD7HCWn+fuctPq4aC+yNzXrfk
 73d81qbbT204jcrUPpyguDqyfkpTTCY=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-554-JQca2qHqM2aq-jX-qnWj9g-1; Mon, 20 Jun 2022 07:02:18 -0400
X-MC-Unique: JQca2qHqM2aq-jX-qnWj9g-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C12B5384F801;
 Mon, 20 Jun 2022 11:02:17 +0000 (UTC)
Received: from localhost.localdomain.com (unknown [10.33.36.144])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 6564FC2810D;
 Mon, 20 Jun 2022 11:02:16 +0000 (UTC)
From: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
To: qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Juan Quintela <quintela@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 Hailiang Zhang <zhang.zhanghailiang@huawei.com>,
 Fam Zheng <fam@euphon.net>, Hailiang Zhang <zhanghailiang@xfusion.com>
Subject: [PATCH v2 05/21] migration: rename 'pos' field in QEMUFile to
 'bytes_processed'
Date: Mon, 20 Jun 2022 12:01:49 +0100
Message-Id: <20220620110205.1357829-6-berrange@redhat.com>
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
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, T_SCC_BODY_TEXT_LINE=-0.01,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The field name 'pos' gives the misleading impression that the QEMUFile
objects are seekable. This is not the case, as in general we just
have an opaque stream. The users of this method are only interested
in the total bytes processed. This switches to a new name that
reflects the intended usage.

Every QIOChannel backed impl of QEMUFile is currently ignoring the
'pos' field.

The only QEMUFile impl using 'pos' as an offset for I/O is the block
device vmstate. A later patch is introducing a QIOChannel impl for the
vmstate, and to handle this it is tracking a file offset itself
internally to the QIOChannel impl. So when we later eliminate the
QEMUFileOps callbacks later, the 'pos' field will no longer be used
from any I/O read/write methods.

Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
---
 migration/qemu-file.c | 19 ++++++++++---------
 1 file changed, 10 insertions(+), 9 deletions(-)

diff --git a/migration/qemu-file.c b/migration/qemu-file.c
index 03f0b13a55..b21da4c5bf 100644
--- a/migration/qemu-file.c
+++ b/migration/qemu-file.c
@@ -50,8 +50,9 @@ struct QEMUFile {
      */
     int64_t rate_limit_used;
 
-    int64_t pos; /* start of buffer when writing, end of buffer
-                    when reading */
+    /* The sum of bytes transferred on the wire */
+    int64_t total_transferred;
+
     int buf_index;
     int buf_size; /* 0 when writing */
     uint8_t buf[IO_BUF_SIZE];
@@ -241,14 +242,14 @@ void qemu_fflush(QEMUFile *f)
     }
     if (f->iovcnt > 0) {
         expect = iov_size(f->iov, f->iovcnt);
-        ret = f->ops->writev_buffer(f->opaque, f->iov, f->iovcnt, f->pos,
+        ret = f->ops->writev_buffer(f->opaque, f->iov, f->iovcnt, f->total_transferred,
                                     &local_error);
 
         qemu_iovec_release_ram(f);
     }
 
     if (ret >= 0) {
-        f->pos += ret;
+        f->total_transferred += ret;
     }
     /* We expect the QEMUFile write impl to send the full
      * data set we requested, so sanity check that.
@@ -357,11 +358,11 @@ static ssize_t qemu_fill_buffer(QEMUFile *f)
         return 0;
     }
 
-    len = f->ops->get_buffer(f->opaque, f->buf + pending, f->pos,
+    len = f->ops->get_buffer(f->opaque, f->buf + pending, f->total_transferred,
                              IO_BUF_SIZE - pending, &local_error);
     if (len > 0) {
         f->buf_size += len;
-        f->pos += len;
+        f->total_transferred += len;
     } else if (len == 0) {
         qemu_file_set_error_obj(f, -EIO, local_error);
     } else if (len != -EAGAIN) {
@@ -375,7 +376,7 @@ static ssize_t qemu_fill_buffer(QEMUFile *f)
 
 void qemu_update_position(QEMUFile *f, size_t size)
 {
-    f->pos += size;
+    f->total_transferred += size;
 }
 
 /** Closes the file
@@ -658,7 +659,7 @@ int qemu_get_byte(QEMUFile *f)
 
 int64_t qemu_ftell_fast(QEMUFile *f)
 {
-    int64_t ret = f->pos;
+    int64_t ret = f->total_transferred;
     int i;
 
     for (i = 0; i < f->iovcnt; i++) {
@@ -671,7 +672,7 @@ int64_t qemu_ftell_fast(QEMUFile *f)
 int64_t qemu_ftell(QEMUFile *f)
 {
     qemu_fflush(f);
-    return f->pos;
+    return f->total_transferred;
 }
 
 int qemu_file_rate_limit(QEMUFile *f)
-- 
2.36.1


