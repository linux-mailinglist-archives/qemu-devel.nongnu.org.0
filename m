Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A2E64756FF
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Dec 2021 11:57:00 +0100 (CET)
Received: from localhost ([::1]:60086 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mxRxz-0008W1-Cr
	for lists+qemu-devel@lfdr.de; Wed, 15 Dec 2021 05:56:59 -0500
Received: from eggs.gnu.org ([209.51.188.92]:38922)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1mxRah-0003BD-5d
 for qemu-devel@nongnu.org; Wed, 15 Dec 2021 05:32:55 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:31712)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1mxRae-0007Lg-Jb
 for qemu-devel@nongnu.org; Wed, 15 Dec 2021 05:32:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1639564371;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=M0pW74mhSgrbVnTUskeNXsbBjcf0KjB6mo8YwJBethg=;
 b=bJBOWHNHUxydGYALOwrGK85DNQ68H+IWgYKpH8B3iAbQFMN9FgJY4qYfRJ+r+kw9dSxA5w
 KZlQW7ksa1IpDoAiB8v8LJGmOk/V4lfUC8aTYsYQYsCRjkRCBWTKCJkWziQOGY5kFn12jw
 vCsC6htJgyd9e8K1WY4hqzP2IW+2dEg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-472-yRO-aamSOUaESOGMZ4wccA-1; Wed, 15 Dec 2021 05:32:50 -0500
X-MC-Unique: yRO-aamSOUaESOGMZ4wccA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8018610B746C;
 Wed, 15 Dec 2021 10:32:49 +0000 (UTC)
Received: from secure.mitica (unknown [10.39.192.37])
 by smtp.corp.redhat.com (Postfix) with ESMTP id DFF0175C3A;
 Wed, 15 Dec 2021 10:32:47 +0000 (UTC)
From: Juan Quintela <quintela@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 12/18] multifd: remove used parameter from send_prepare() method
Date: Wed, 15 Dec 2021 11:32:12 +0100
Message-Id: <20211215103218.17527-13-quintela@redhat.com>
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
Received-SPF: pass client-ip=170.10.133.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.719,
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
 migration/multifd-zlib.c | 7 +++----
 migration/multifd-zstd.c | 7 +++----
 migration/multifd.c      | 9 +++------
 4 files changed, 10 insertions(+), 15 deletions(-)

diff --git a/migration/multifd.h b/migration/multifd.h
index 86820dd028..7968cc5c20 100644
--- a/migration/multifd.h
+++ b/migration/multifd.h
@@ -159,7 +159,7 @@ typedef struct {
     /* Cleanup for sending side */
     void (*send_cleanup)(MultiFDSendParams *p, Error **errp);
     /* Prepare the send packet */
-    int (*send_prepare)(MultiFDSendParams *p, uint32_t used, Error **errp);
+    int (*send_prepare)(MultiFDSendParams *p, Error **errp);
     /* Write the send packet */
     int (*send_write)(MultiFDSendParams *p, uint32_t used, Error **errp);
     /* Setup for receiving side */
diff --git a/migration/multifd-zlib.c b/migration/multifd-zlib.c
index d0437cce2a..28f0ed933b 100644
--- a/migration/multifd-zlib.c
+++ b/migration/multifd-zlib.c
@@ -94,10 +94,9 @@ static void zlib_send_cleanup(MultiFDSendParams *p, Error **errp)
  * Returns 0 for success or -1 for error
  *
  * @p: Params for the channel that we are using
- * @used: number of pages used
  * @errp: pointer to an error
  */
-static int zlib_send_prepare(MultiFDSendParams *p, uint32_t used, Error **errp)
+static int zlib_send_prepare(MultiFDSendParams *p, Error **errp)
 {
     struct iovec *iov = p->pages->iov;
     struct zlib_data *z = p->data;
@@ -106,11 +105,11 @@ static int zlib_send_prepare(MultiFDSendParams *p, uint32_t used, Error **errp)
     int ret;
     uint32_t i;
 
-    for (i = 0; i < used; i++) {
+    for (i = 0; i < p->pages->num; i++) {
         uint32_t available = z->zbuff_len - out_size;
         int flush = Z_NO_FLUSH;
 
-        if (i == used - 1) {
+        if (i == p->pages->num - 1) {
             flush = Z_SYNC_FLUSH;
         }
 
diff --git a/migration/multifd-zstd.c b/migration/multifd-zstd.c
index 09ae1cf91a..4a71e96e06 100644
--- a/migration/multifd-zstd.c
+++ b/migration/multifd-zstd.c
@@ -107,10 +107,9 @@ static void zstd_send_cleanup(MultiFDSendParams *p, Error **errp)
  * Returns 0 for success or -1 for error
  *
  * @p: Params for the channel that we are using
- * @used: number of pages used
  * @errp: pointer to an error
  */
-static int zstd_send_prepare(MultiFDSendParams *p, uint32_t used, Error **errp)
+static int zstd_send_prepare(MultiFDSendParams *p, Error **errp)
 {
     struct iovec *iov = p->pages->iov;
     struct zstd_data *z = p->data;
@@ -121,10 +120,10 @@ static int zstd_send_prepare(MultiFDSendParams *p, uint32_t used, Error **errp)
     z->out.size = z->zbuff_len;
     z->out.pos = 0;
 
-    for (i = 0; i < used; i++) {
+    for (i = 0; i < p->pages->num; i++) {
         ZSTD_EndDirective flush = ZSTD_e_continue;
 
-        if (i == used - 1) {
+        if (i == p->pages->num - 1) {
             flush = ZSTD_e_flush;
         }
         z->in.src = iov[i].iov_base;
diff --git a/migration/multifd.c b/migration/multifd.c
index ce7101cf9d..098ef8842c 100644
--- a/migration/multifd.c
+++ b/migration/multifd.c
@@ -82,13 +82,11 @@ static void nocomp_send_cleanup(MultiFDSendParams *p, Error **errp)
  * Returns 0 for success or -1 for error
  *
  * @p: Params for the channel that we are using
- * @used: number of pages used
  * @errp: pointer to an error
  */
-static int nocomp_send_prepare(MultiFDSendParams *p, uint32_t used,
-                               Error **errp)
+static int nocomp_send_prepare(MultiFDSendParams *p, Error **errp)
 {
-    p->next_packet_size = used * qemu_target_page_size();
+    p->next_packet_size = p->pages->num * qemu_target_page_size();
     p->flags |= MULTIFD_FLAG_NOCOMP;
     return 0;
 }
@@ -654,8 +652,7 @@ static void *multifd_send_thread(void *opaque)
             uint32_t flags = p->flags;
 
             if (used) {
-                ret = multifd_send_state->ops->send_prepare(p, used,
-                                                            &local_err);
+                ret = multifd_send_state->ops->send_prepare(p, &local_err);
                 if (ret != 0) {
                     qemu_mutex_unlock(&p->mutex);
                     break;
-- 
2.33.1


