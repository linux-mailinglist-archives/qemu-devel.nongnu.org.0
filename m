Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 603BE48AE75
	for <lists+qemu-devel@lfdr.de>; Tue, 11 Jan 2022 14:31:04 +0100 (CET)
Received: from localhost ([::1]:53582 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n7HEt-0004wD-C3
	for lists+qemu-devel@lfdr.de; Tue, 11 Jan 2022 08:31:03 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51496)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1n7Gm7-00052U-60
 for qemu-devel@nongnu.org; Tue, 11 Jan 2022 08:01:19 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:56731)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1n7Gm1-0005k2-H3
 for qemu-devel@nongnu.org; Tue, 11 Jan 2022 08:01:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1641906073;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0CZMF9+tpdeRtWvtbyvdKiZL5iLIO8LIWlWaxsgFtQI=;
 b=XFGTczYEpFJpRtXRYM6buQQJytSou6DmVx+MzF5THkNP3cIjQsfMb79E6ei/Juk2o/1K/v
 hnnfxa9vVDWlz6un4IS0SNWCdgZlX7zdR+5eFz7vAr7BokhjRKP/ovqw5xTt8nV98Z1wB7
 yl3pDUmrcBVdlU/ISFmGngw+XRoU5qo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-468-clSlUaF_NNaLHst73itzNQ-1; Tue, 11 Jan 2022 08:01:11 -0500
X-MC-Unique: clSlUaF_NNaLHst73itzNQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6CBB01923B80;
 Tue, 11 Jan 2022 13:01:10 +0000 (UTC)
Received: from secure.mitica (unknown [10.39.194.176])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 836951059179;
 Tue, 11 Jan 2022 13:01:08 +0000 (UTC)
From: Juan Quintela <quintela@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 12/23] multifd: Use a single writev on the send side
Date: Tue, 11 Jan 2022 14:00:13 +0100
Message-Id: <20220111130024.5392-13-quintela@redhat.com>
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

Until now, we wrote the packet header with write(), and the rest of the
pages with writev().  Just increase the size of the iovec and do a
single writev().

Signed-off-by: Juan Quintela <quintela@redhat.com>
Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
---
 migration/multifd.c | 20 ++++++++------------
 1 file changed, 8 insertions(+), 12 deletions(-)

diff --git a/migration/multifd.c b/migration/multifd.c
index 96b9cc0d8b..1d4885e1a0 100644
--- a/migration/multifd.c
+++ b/migration/multifd.c
@@ -646,7 +646,7 @@ static void *multifd_send_thread(void *opaque)
             uint32_t used = p->pages->num;
             uint64_t packet_num = p->packet_num;
             uint32_t flags = p->flags;
-            p->iovs_num = 0;
+            p->iovs_num = 1;
 
             if (used) {
                 ret = multifd_send_state->ops->send_prepare(p, &local_err);
@@ -666,20 +666,15 @@ static void *multifd_send_thread(void *opaque)
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
@@ -916,7 +911,8 @@ int multifd_save_setup(Error **errp)
         p->packet->version = cpu_to_be32(MULTIFD_VERSION);
         p->name = g_strdup_printf("multifdsend_%d", i);
         p->tls_hostname = g_strdup(s->hostname);
-        p->iov = g_new0(struct iovec, page_count);
+        /* We need one extra place for the packet header */
+        p->iov = g_new0(struct iovec, page_count + 1);
         socket_send_channel_create(multifd_new_send_channel_async, p);
     }
 
-- 
2.34.1


