Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D3AC048AE3A
	for <lists+qemu-devel@lfdr.de>; Tue, 11 Jan 2022 14:14:23 +0100 (CET)
Received: from localhost ([::1]:55604 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n7Gyk-0001s5-UN
	for lists+qemu-devel@lfdr.de; Tue, 11 Jan 2022 08:14:22 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51454)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1n7Gm1-0004yU-0q
 for qemu-devel@nongnu.org; Tue, 11 Jan 2022 08:01:13 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:58567)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1n7Gly-0005je-Vq
 for qemu-devel@nongnu.org; Tue, 11 Jan 2022 08:01:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1641906070;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=h9YJv31dxGjV2CbwV49aRtAQEd8scjaS0F5lPdGsk+k=;
 b=UMKPpdgAIVS+oA6lbZP5s5PnvlXJj5VYNI9hkYTmkiGKZISIsV1fSkWaiYKKUEGe8eMthX
 cI11yKZcb+czQwfd4TiNBMFRqNktpWtiFeS2HLXGS0+tLLfxpt0plFuU8RjpVebrsQZYI8
 UF+yIMR3B3v3niByS3fUPn8hioA7ycc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-484-hkV8sdaXMn6mMrEGuXFcNg-1; Tue, 11 Jan 2022 08:01:09 -0500
X-MC-Unique: hkV8sdaXMn6mMrEGuXFcNg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 299E38042EA;
 Tue, 11 Jan 2022 13:01:08 +0000 (UTC)
Received: from secure.mitica (unknown [10.39.194.176])
 by smtp.corp.redhat.com (Postfix) with ESMTP id DEC1B1059179;
 Tue, 11 Jan 2022 13:01:05 +0000 (UTC)
From: Juan Quintela <quintela@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 11/23] multifd: Remove send_write() method
Date: Tue, 11 Jan 2022 14:00:12 +0100
Message-Id: <20220111130024.5392-12-quintela@redhat.com>
In-Reply-To: <20220111130024.5392-1-quintela@redhat.com>
References: <20220111130024.5392-1-quintela@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=quintela@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.595,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Eduardo Habkost <eduardo@habkost.net>, Juan Quintela <quintela@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, Peter Xu <peterx@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Yanan Wang <wangyanan55@huawei.com>, Leonardo Bras <leobras@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Everything use now iov's.

Signed-off-by: Juan Quintela <quintela@redhat.com>
---
 migration/multifd.h      |  2 --
 migration/multifd-zlib.c | 17 -----------------
 migration/multifd-zstd.c | 17 -----------------
 migration/multifd.c      | 20 ++------------------
 4 files changed, 2 insertions(+), 54 deletions(-)

diff --git a/migration/multifd.h b/migration/multifd.h
index c3f18af364..7496f951a7 100644
--- a/migration/multifd.h
+++ b/migration/multifd.h
@@ -164,8 +164,6 @@ typedef struct {
     void (*send_cleanup)(MultiFDSendParams *p, Error **errp);
     /* Prepare the send packet */
     int (*send_prepare)(MultiFDSendParams *p, Error **errp);
-    /* Write the send packet */
-    int (*send_write)(MultiFDSendParams *p, uint32_t used, Error **errp);
     /* Setup for receiving side */
     int (*recv_setup)(MultiFDRecvParams *p, Error **errp);
     /* Cleanup for receiving side */
diff --git a/migration/multifd-zlib.c b/migration/multifd-zlib.c
index 71480c82bb..ba90f1aaf4 100644
--- a/migration/multifd-zlib.c
+++ b/migration/multifd-zlib.c
@@ -152,22 +152,6 @@ static int zlib_send_prepare(MultiFDSendParams *p, Error **errp)
     return 0;
 }
 
-/**
- * zlib_send_write: do the actual write of the data
- *
- * Do the actual write of the comprresed buffer.
- *
- * Returns 0 for success or -1 for error
- *
- * @p: Params for the channel that we are using
- * @used: number of pages used
- * @errp: pointer to an error
- */
-static int zlib_send_write(MultiFDSendParams *p, uint32_t used, Error **errp)
-{
-    return qio_channel_writev_all(p->c, p->iov, p->iovs_num, errp);
-}
-
 /**
  * zlib_recv_setup: setup receive side
  *
@@ -307,7 +291,6 @@ static MultiFDMethods multifd_zlib_ops = {
     .send_setup = zlib_send_setup,
     .send_cleanup = zlib_send_cleanup,
     .send_prepare = zlib_send_prepare,
-    .send_write = zlib_send_write,
     .recv_setup = zlib_recv_setup,
     .recv_cleanup = zlib_recv_cleanup,
     .recv_pages = zlib_recv_pages
diff --git a/migration/multifd-zstd.c b/migration/multifd-zstd.c
index bd393aee0d..757434d1ee 100644
--- a/migration/multifd-zstd.c
+++ b/migration/multifd-zstd.c
@@ -163,22 +163,6 @@ static int zstd_send_prepare(MultiFDSendParams *p, Error **errp)
     return 0;
 }
 
-/**
- * zstd_send_write: do the actual write of the data
- *
- * Do the actual write of the comprresed buffer.
- *
- * Returns 0 for success or -1 for error
- *
- * @p: Params for the channel that we are using
- * @used: number of pages used
- * @errp: pointer to an error
- */
-static int zstd_send_write(MultiFDSendParams *p, uint32_t used, Error **errp)
-{
-    return qio_channel_writev_all(p->c, p->iov, p->iovs_num, errp);
-}
-
 /**
  * zstd_recv_setup: setup receive side
  *
@@ -320,7 +304,6 @@ static MultiFDMethods multifd_zstd_ops = {
     .send_setup = zstd_send_setup,
     .send_cleanup = zstd_send_cleanup,
     .send_prepare = zstd_send_prepare,
-    .send_write = zstd_send_write,
     .recv_setup = zstd_recv_setup,
     .recv_cleanup = zstd_recv_cleanup,
     .recv_pages = zstd_recv_pages
diff --git a/migration/multifd.c b/migration/multifd.c
index f75bd3c188..96b9cc0d8b 100644
--- a/migration/multifd.c
+++ b/migration/multifd.c
@@ -100,22 +100,6 @@ static int nocomp_send_prepare(MultiFDSendParams *p, Error **errp)
     return 0;
 }
 
-/**
- * nocomp_send_write: do the actual write of the data
- *
- * For no compression we just have to write the data.
- *
- * Returns 0 for success or -1 for error
- *
- * @p: Params for the channel that we are using
- * @used: number of pages used
- * @errp: pointer to an error
- */
-static int nocomp_send_write(MultiFDSendParams *p, uint32_t used, Error **errp)
-{
-    return qio_channel_writev_all(p->c, p->iov, p->iovs_num, errp);
-}
-
 /**
  * nocomp_recv_setup: setup receive side
  *
@@ -173,7 +157,6 @@ static MultiFDMethods multifd_nocomp_ops = {
     .send_setup = nocomp_send_setup,
     .send_cleanup = nocomp_send_cleanup,
     .send_prepare = nocomp_send_prepare,
-    .send_write = nocomp_send_write,
     .recv_setup = nocomp_recv_setup,
     .recv_cleanup = nocomp_recv_cleanup,
     .recv_pages = nocomp_recv_pages
@@ -690,7 +673,8 @@ static void *multifd_send_thread(void *opaque)
             }
 
             if (used) {
-                ret = multifd_send_state->ops->send_write(p, used, &local_err);
+                ret = qio_channel_writev_all(p->c, p->iov, p->iovs_num,
+                                             &local_err);
                 if (ret != 0) {
                     break;
                 }
-- 
2.34.1


