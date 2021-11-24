Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ADA2045B820
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Nov 2021 11:13:01 +0100 (CET)
Received: from localhost ([::1]:39244 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mppGu-0001Ug-Qw
	for lists+qemu-devel@lfdr.de; Wed, 24 Nov 2021 05:13:00 -0500
Received: from eggs.gnu.org ([209.51.188.92]:41548)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1mppB3-0007tY-Il
 for qemu-devel@nongnu.org; Wed, 24 Nov 2021 05:06:57 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:60579)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1mppB1-0006qY-Cd
 for qemu-devel@nongnu.org; Wed, 24 Nov 2021 05:06:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1637748414;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=znJh4Fm0vRykGF819Wl7cMgFSEmqStKYvWRlP5dHCjc=;
 b=CojoQzjR0Nj1fvYlf7ix+GbYtEe1E58HqviQ/RijEQnW7mUg2JJrFBqxsGMMWjxoDI7ZNO
 r46W3zeiQO2rkS5s8LmQFV5qJAwMY6LKhuM3z6we1tBBiZXrj1Jta+OE1ZApcjrsz5tatq
 BXBmVEhj17nHtIq7KeVF2QcanpW36bM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-392-5SF8FXPENwKgsJ9HDhi7ZQ-1; Wed, 24 Nov 2021 05:06:53 -0500
X-MC-Unique: 5SF8FXPENwKgsJ9HDhi7ZQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1672183DD20
 for <qemu-devel@nongnu.org>; Wed, 24 Nov 2021 10:06:53 +0000 (UTC)
Received: from redhat.mitica.com (unknown [10.39.193.24])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B36C060843;
 Wed, 24 Nov 2021 10:06:37 +0000 (UTC)
From: Juan Quintela <quintela@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 11/23] multifd: Move iov from pages to params
Date: Wed, 24 Nov 2021 11:06:05 +0100
Message-Id: <20211124100617.19786-12-quintela@redhat.com>
In-Reply-To: <20211124100617.19786-1-quintela@redhat.com>
References: <20211124100617.19786-1-quintela@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=quintela@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Leonardo Bras <leobras@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, Peter Xu <peterx@redhat.com>,
 Juan Quintela <quintela@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This will allow us to reduce the number of system calls on the next patch.

Signed-off-by: Juan Quintela <quintela@redhat.com>
---
 migration/multifd.h |  8 ++++++--
 migration/multifd.c | 34 ++++++++++++++++++++++++----------
 2 files changed, 30 insertions(+), 12 deletions(-)

diff --git a/migration/multifd.h b/migration/multifd.h
index e57adc783b..c3f18af364 100644
--- a/migration/multifd.h
+++ b/migration/multifd.h
@@ -62,8 +62,6 @@ typedef struct {
     uint64_t packet_num;
     /* offset of each page */
     ram_addr_t *offset;
-    /* pointer to each page */
-    struct iovec *iov;
     RAMBlock *block;
 } MultiFDPages_t;
 
@@ -110,6 +108,10 @@ typedef struct {
     uint64_t num_pages;
     /* syncs main thread and channels */
     QemuSemaphore sem_sync;
+    /* buffers to send */
+    struct iovec *iov;
+    /* number of iovs used */
+    uint32_t iovs_num;
     /* used for compression methods */
     void *data;
 }  MultiFDSendParams;
@@ -149,6 +151,8 @@ typedef struct {
     uint64_t num_pages;
     /* syncs main thread and channels */
     QemuSemaphore sem_sync;
+    /* buffers to recv */
+    struct iovec *iov;
     /* used for de-compression methods */
     void *data;
 } MultiFDRecvParams;
diff --git a/migration/multifd.c b/migration/multifd.c
index 0533da154a..37487fd01c 100644
--- a/migration/multifd.c
+++ b/migration/multifd.c
@@ -86,7 +86,16 @@ static void nocomp_send_cleanup(MultiFDSendParams *p, Error **errp)
  */
 static int nocomp_send_prepare(MultiFDSendParams *p, Error **errp)
 {
-    p->next_packet_size = p->pages->num * qemu_target_page_size();
+    MultiFDPages_t *pages = p->pages;
+    size_t page_size = qemu_target_page_size();
+
+    for (int i = 0; i < p->pages->num; i++) {
+        p->iov[p->iovs_num].iov_base = pages->block->host + pages->offset[i];
+        p->iov[p->iovs_num].iov_len = page_size;
+        p->iovs_num++;
+    }
+
+    p->next_packet_size = p->pages->num * page_size;
     p->flags |= MULTIFD_FLAG_NOCOMP;
     return 0;
 }
@@ -104,7 +113,7 @@ static int nocomp_send_prepare(MultiFDSendParams *p, Error **errp)
  */
 static int nocomp_send_write(MultiFDSendParams *p, uint32_t used, Error **errp)
 {
-    return qio_channel_writev_all(p->c, p->pages->iov, used, errp);
+    return qio_channel_writev_all(p->c, p->iov, p->iovs_num, errp);
 }
 
 /**
@@ -146,13 +155,18 @@ static void nocomp_recv_cleanup(MultiFDRecvParams *p)
 static int nocomp_recv_pages(MultiFDRecvParams *p, Error **errp)
 {
     uint32_t flags = p->flags & MULTIFD_FLAG_COMPRESSION_MASK;
+    size_t page_size = qemu_target_page_size();
 
     if (flags != MULTIFD_FLAG_NOCOMP) {
         error_setg(errp, "multifd %d: flags received %x flags expected %x",
                    p->id, flags, MULTIFD_FLAG_NOCOMP);
         return -1;
     }
-    return qio_channel_readv_all(p->c, p->pages->iov, p->pages->num, errp);
+    for (int i = 0; i < p->pages->num; i++) {
+        p->iov[i].iov_base = p->pages->block->host + p->pages->offset[i];
+        p->iov[i].iov_len = page_size;
+    }
+    return qio_channel_readv_all(p->c, p->iov, p->pages->num, errp);
 }
 
 static MultiFDMethods multifd_nocomp_ops = {
@@ -242,7 +256,6 @@ static MultiFDPages_t *multifd_pages_init(size_t size)
     MultiFDPages_t *pages = g_new0(MultiFDPages_t, 1);
 
     pages->allocated = size;
-    pages->iov = g_new0(struct iovec, size);
     pages->offset = g_new0(ram_addr_t, size);
 
     return pages;
@@ -254,8 +267,6 @@ static void multifd_pages_clear(MultiFDPages_t *pages)
     pages->allocated = 0;
     pages->packet_num = 0;
     pages->block = NULL;
-    g_free(pages->iov);
-    pages->iov = NULL;
     g_free(pages->offset);
     pages->offset = NULL;
     g_free(pages);
@@ -365,8 +376,6 @@ static int multifd_recv_unfill_packet(MultiFDRecvParams *p, Error **errp)
             return -1;
         }
         p->pages->offset[i] = offset;
-        p->pages->iov[i].iov_base = block->host + offset;
-        p->pages->iov[i].iov_len = page_size;
     }
 
     return 0;
@@ -470,8 +479,6 @@ int multifd_queue_page(QEMUFile *f, RAMBlock *block, ram_addr_t offset)
 
     if (pages->block == block) {
         pages->offset[pages->num] = offset;
-        pages->iov[pages->num].iov_base = block->host + offset;
-        pages->iov[pages->num].iov_len = qemu_target_page_size();
         pages->num++;
 
         if (pages->num < pages->allocated) {
@@ -564,6 +571,8 @@ void multifd_save_cleanup(void)
         p->packet_len = 0;
         g_free(p->packet);
         p->packet = NULL;
+        g_free(p->iov);
+        p->iov = NULL;
         multifd_send_state->ops->send_cleanup(p, &local_err);
         if (local_err) {
             migrate_set_error(migrate_get_current(), local_err);
@@ -651,6 +660,7 @@ static void *multifd_send_thread(void *opaque)
             uint32_t used = p->pages->num;
             uint64_t packet_num = p->packet_num;
             uint32_t flags = p->flags;
+            p->iovs_num = 0;
 
             if (used) {
                 ret = multifd_send_state->ops->send_prepare(p, &local_err);
@@ -919,6 +929,7 @@ int multifd_save_setup(Error **errp)
         p->packet->version = cpu_to_be32(MULTIFD_VERSION);
         p->name = g_strdup_printf("multifdsend_%d", i);
         p->tls_hostname = g_strdup(s->hostname);
+        p->iov = g_new0(struct iovec, page_count);
         socket_send_channel_create(multifd_new_send_channel_async, p);
     }
 
@@ -1018,6 +1029,8 @@ int multifd_load_cleanup(Error **errp)
         p->packet_len = 0;
         g_free(p->packet);
         p->packet = NULL;
+        g_free(p->iov);
+        p->iov = NULL;
         multifd_recv_state->ops->recv_cleanup(p);
     }
     qemu_sem_destroy(&multifd_recv_state->sem_sync);
@@ -1158,6 +1171,7 @@ int multifd_load_setup(Error **errp)
                       + sizeof(uint64_t) * page_count;
         p->packet = g_malloc0(p->packet_len);
         p->name = g_strdup_printf("multifdrecv_%d", i);
+        p->iov = g_new0(struct iovec, page_count);
     }
 
     for (i = 0; i < thread_count; i++) {
-- 
2.33.1


