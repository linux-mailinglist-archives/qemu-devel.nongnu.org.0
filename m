Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 20F6E45B849
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Nov 2021 11:21:56 +0100 (CET)
Received: from localhost ([::1]:36198 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mppPX-00025l-8P
	for lists+qemu-devel@lfdr.de; Wed, 24 Nov 2021 05:21:55 -0500
Received: from eggs.gnu.org ([209.51.188.92]:41828)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1mppBc-00017l-FW
 for qemu-devel@nongnu.org; Wed, 24 Nov 2021 05:07:32 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:28270)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1mppBa-0006wX-Bo
 for qemu-devel@nongnu.org; Wed, 24 Nov 2021 05:07:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1637748449;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wc/hHgbIzi02f5RiowHdBt1n+v0t3deScK2+D5kW6JI=;
 b=cqbUVDPyH9DnCO7htOrK8m/T33mrzio1GP5z12cH4k4rrHPkXmJhWDY/IsCRl9MhIIbWpX
 KGlKNQ/Mt3wu7Ao+g0ed46PPuEA8PoofPEQueJ8herJ2hN4+3XKfOhULxM6STK3aDMDyd1
 2hu2uYvFZzRPKcL5vkGLlgGk7F5Vbnk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-274-1iKeyWvuNwqmfoHD8ecZNg-1; Wed, 24 Nov 2021 05:07:28 -0500
X-MC-Unique: 1iKeyWvuNwqmfoHD8ecZNg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D3D961006AA0
 for <qemu-devel@nongnu.org>; Wed, 24 Nov 2021 10:07:27 +0000 (UTC)
Received: from redhat.mitica.com (unknown [10.39.193.24])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 8857460843;
 Wed, 24 Nov 2021 10:07:26 +0000 (UTC)
From: Juan Quintela <quintela@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 15/23] multifd: Use a single writev on the send side
Date: Wed, 24 Nov 2021 11:06:09 +0100
Message-Id: <20211124100617.19786-16-quintela@redhat.com>
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

Until now, we wrote the packet header with write(), and the rest of the
pages with writev().  Just increase the size of the iovec and do a
single writev().

Signed-off-by: Juan Quintela <quintela@redhat.com>
---
 migration/multifd.c | 20 ++++++++------------
 1 file changed, 8 insertions(+), 12 deletions(-)

diff --git a/migration/multifd.c b/migration/multifd.c
index 71bdef068e..65676d56fd 100644
--- a/migration/multifd.c
+++ b/migration/multifd.c
@@ -643,7 +643,7 @@ static void *multifd_send_thread(void *opaque)
             uint32_t used = p->pages->num;
             uint64_t packet_num = p->packet_num;
             uint32_t flags = p->flags;
-            p->iovs_num = 0;
+            p->iovs_num = 1;
 
             if (used) {
                 ret = multifd_send_state->ops->send_prepare(p, &local_err);
@@ -663,20 +663,15 @@ static void *multifd_send_thread(void *opaque)
             trace_multifd_send(p->id, packet_num, used, flags,
                                p->next_packet_size);
 
-            ret = qio_channel_write_all(p->c, (void *)p->packet,
-                                        p->packet_len, &local_err);
+            p->iov[0].iov_len = p->packet_len;
+            p->iov[0].iov_base = p->packet;
+
+            ret = qio_channel_writev_all(p->c, p->iov, p->iovs_num,
+                                         &local_err);
             if (ret != 0) {
                 break;
             }
 
-            if (used) {
-                ret = qio_channel_writev_all(p->c, p->iov, p->iovs_num,
-                                             &local_err);
-                if (ret != 0) {
-                    break;
-                }
-            }
-
             qemu_mutex_lock(&p->mutex);
             p->pending_job--;
             qemu_mutex_unlock(&p->mutex);
@@ -913,7 +908,8 @@ int multifd_save_setup(Error **errp)
         p->packet->version = cpu_to_be32(MULTIFD_VERSION);
         p->name = g_strdup_printf("multifdsend_%d", i);
         p->tls_hostname = g_strdup(s->hostname);
-        p->iov = g_new0(struct iovec, page_count);
+        /* We need one extra place for the packet header */
+        p->iov = g_new0(struct iovec, page_count + 1);
         socket_send_channel_create(multifd_new_send_channel_async, p);
     }
 
-- 
2.33.1


