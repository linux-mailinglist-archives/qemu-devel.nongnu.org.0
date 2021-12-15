Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8241C475714
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Dec 2021 11:59:22 +0100 (CET)
Received: from localhost ([::1]:40490 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mxS0H-00061X-KV
	for lists+qemu-devel@lfdr.de; Wed, 15 Dec 2021 05:59:21 -0500
Received: from eggs.gnu.org ([209.51.188.92]:38952)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1mxRai-0003H8-Pb
 for qemu-devel@nongnu.org; Wed, 15 Dec 2021 05:32:56 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:29323)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1mxRag-0007M5-C7
 for qemu-devel@nongnu.org; Wed, 15 Dec 2021 05:32:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1639564373;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=10+DysgOrKDZbsbOgXRalWWGqN4Ng+02P1nZlvqavF4=;
 b=NTq4dIzVYC+iGxQMmrfhIGef27BxGdSsQhkRogIzr7ZJKrySXJoC4s9SMXG07tzaLwWRHz
 /ndVUTIVcA7IqeBD483CwORKahwYtUQAKwM4dgqHIQS45ORZUCJcbNh8tNJrgwW4W/hwlM
 dM7NHYrMDXAOkjHofSlf5qi83EkaRUk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-177-6WmZi4SEOzqi3r5CrQqj5Q-1; Wed, 15 Dec 2021 05:32:52 -0500
X-MC-Unique: 6WmZi4SEOzqi3r5CrQqj5Q-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 52300801AAB;
 Wed, 15 Dec 2021 10:32:51 +0000 (UTC)
Received: from secure.mitica (unknown [10.39.192.37])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E91616E978;
 Wed, 15 Dec 2021 10:32:49 +0000 (UTC)
From: Juan Quintela <quintela@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 13/18] multifd: remove used parameter from send_recv_pages()
 method
Date: Wed, 15 Dec 2021 11:32:13 +0100
Message-Id: <20211215103218.17527-14-quintela@redhat.com>
In-Reply-To: <20211215103218.17527-1-quintela@redhat.com>
References: <20211215103218.17527-1-quintela@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=quintela@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.719,
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
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Hailiang Zhang <zhang.zhanghailiang@huawei.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Juan Quintela <quintela@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

It is already there as p->pages->num.

Signed-off-by: Juan Quintela <quintela@redhat.com>
Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
---
 migration/multifd.h      | 2 +-
 migration/multifd-zlib.c | 9 ++++-----
 migration/multifd-zstd.c | 7 +++----
 migration/multifd.c      | 7 +++----
 4 files changed, 11 insertions(+), 14 deletions(-)

diff --git a/migration/multifd.h b/migration/multifd.h
index 7968cc5c20..e57adc783b 100644
--- a/migration/multifd.h
+++ b/migration/multifd.h
@@ -167,7 +167,7 @@ typedef struct {
     /* Cleanup for receiving side */
     void (*recv_cleanup)(MultiFDRecvParams *p);
     /* Read all pages */
-    int (*recv_pages)(MultiFDRecvParams *p, uint32_t used, Error **errp);
+    int (*recv_pages)(MultiFDRecvParams *p, Error **errp);
 } MultiFDMethods;
 
 void multifd_register_ops(int method, MultiFDMethods *ops);
diff --git a/migration/multifd-zlib.c b/migration/multifd-zlib.c
index 28f0ed933b..e85ef8824d 100644
--- a/migration/multifd-zlib.c
+++ b/migration/multifd-zlib.c
@@ -230,17 +230,16 @@ static void zlib_recv_cleanup(MultiFDRecvParams *p)
  * Returns 0 for success or -1 for error
  *
  * @p: Params for the channel that we are using
- * @used: number of pages used
  * @errp: pointer to an error
  */
-static int zlib_recv_pages(MultiFDRecvParams *p, uint32_t used, Error **errp)
+static int zlib_recv_pages(MultiFDRecvParams *p, Error **errp)
 {
     struct zlib_data *z = p->data;
     z_stream *zs = &z->zs;
     uint32_t in_size = p->next_packet_size;
     /* we measure the change of total_out */
     uint32_t out_size = zs->total_out;
-    uint32_t expected_size = used * qemu_target_page_size();
+    uint32_t expected_size = p->pages->num * qemu_target_page_size();
     uint32_t flags = p->flags & MULTIFD_FLAG_COMPRESSION_MASK;
     int ret;
     int i;
@@ -259,12 +258,12 @@ static int zlib_recv_pages(MultiFDRecvParams *p, uint32_t used, Error **errp)
     zs->avail_in = in_size;
     zs->next_in = z->zbuff;
 
-    for (i = 0; i < used; i++) {
+    for (i = 0; i < p->pages->num; i++) {
         struct iovec *iov = &p->pages->iov[i];
         int flush = Z_NO_FLUSH;
         unsigned long start = zs->total_out;
 
-        if (i == used - 1) {
+        if (i == p->pages->num - 1) {
             flush = Z_SYNC_FLUSH;
         }
 
diff --git a/migration/multifd-zstd.c b/migration/multifd-zstd.c
index 4a71e96e06..a8b104f4ee 100644
--- a/migration/multifd-zstd.c
+++ b/migration/multifd-zstd.c
@@ -250,14 +250,13 @@ static void zstd_recv_cleanup(MultiFDRecvParams *p)
  * Returns 0 for success or -1 for error
  *
  * @p: Params for the channel that we are using
- * @used: number of pages used
  * @errp: pointer to an error
  */
-static int zstd_recv_pages(MultiFDRecvParams *p, uint32_t used, Error **errp)
+static int zstd_recv_pages(MultiFDRecvParams *p, Error **errp)
 {
     uint32_t in_size = p->next_packet_size;
     uint32_t out_size = 0;
-    uint32_t expected_size = used * qemu_target_page_size();
+    uint32_t expected_size = p->pages->num * qemu_target_page_size();
     uint32_t flags = p->flags & MULTIFD_FLAG_COMPRESSION_MASK;
     struct zstd_data *z = p->data;
     int ret;
@@ -278,7 +277,7 @@ static int zstd_recv_pages(MultiFDRecvParams *p, uint32_t used, Error **errp)
     z->in.size = in_size;
     z->in.pos = 0;
 
-    for (i = 0; i < used; i++) {
+    for (i = 0; i < p->pages->num; i++) {
         struct iovec *iov = &p->pages->iov[i];
 
         z->out.dst = iov->iov_base;
diff --git a/migration/multifd.c b/migration/multifd.c
index 098ef8842c..55d99a8232 100644
--- a/migration/multifd.c
+++ b/migration/multifd.c
@@ -141,10 +141,9 @@ static void nocomp_recv_cleanup(MultiFDRecvParams *p)
  * Returns 0 for success or -1 for error
  *
  * @p: Params for the channel that we are using
- * @used: number of pages used
  * @errp: pointer to an error
  */
-static int nocomp_recv_pages(MultiFDRecvParams *p, uint32_t used, Error **errp)
+static int nocomp_recv_pages(MultiFDRecvParams *p, Error **errp)
 {
     uint32_t flags = p->flags & MULTIFD_FLAG_COMPRESSION_MASK;
 
@@ -153,7 +152,7 @@ static int nocomp_recv_pages(MultiFDRecvParams *p, uint32_t used, Error **errp)
                    p->id, flags, MULTIFD_FLAG_NOCOMP);
         return -1;
     }
-    return qio_channel_readv_all(p->c, p->pages->iov, used, errp);
+    return qio_channel_readv_all(p->c, p->pages->iov, p->pages->num, errp);
 }
 
 static MultiFDMethods multifd_nocomp_ops = {
@@ -1099,7 +1098,7 @@ static void *multifd_recv_thread(void *opaque)
         qemu_mutex_unlock(&p->mutex);
 
         if (used) {
-            ret = multifd_recv_state->ops->recv_pages(p, used, &local_err);
+            ret = multifd_recv_state->ops->recv_pages(p, &local_err);
             if (ret != 0) {
                 break;
             }
-- 
2.33.1


