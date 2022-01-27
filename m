Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D8B4D49E64D
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Jan 2022 16:40:22 +0100 (CET)
Received: from localhost ([::1]:59418 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nD6sn-0003kX-VP
	for lists+qemu-devel@lfdr.de; Thu, 27 Jan 2022 10:40:21 -0500
Received: from eggs.gnu.org ([209.51.188.92]:38710)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1nD6R4-0003jz-91
 for qemu-devel@nongnu.org; Thu, 27 Jan 2022 10:11:42 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:57453)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1nD6R1-0002NK-5L
 for qemu-devel@nongnu.org; Thu, 27 Jan 2022 10:11:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1643296298;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0CZMF9+tpdeRtWvtbyvdKiZL5iLIO8LIWlWaxsgFtQI=;
 b=O7nDfFXoIPzE+AXOAJfY47hO8GzRaQgi4zV7nEcw3ObFWcYKT/c4plTFetc8iL7R7rwRvm
 fx3Hcw9+brLtUzV7GUOP18qVxGzZUTLDqnuZw6vBsQUPmSOLixWrpoDkAR128RX4pZQlja
 PW00mVwV9OBsGm4UKxLo9Tg04PkOZMw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-663-Kxg5lExnO-2zgLkhh6300A-1; Thu, 27 Jan 2022 10:11:35 -0500
X-MC-Unique: Kxg5lExnO-2zgLkhh6300A-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 19FD986A060;
 Thu, 27 Jan 2022 15:11:32 +0000 (UTC)
Received: from secure.mitica (unknown [10.39.194.185])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 3D84070D49;
 Thu, 27 Jan 2022 15:11:06 +0000 (UTC)
From: Juan Quintela <quintela@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 12/38] multifd: Use a single writev on the send side
Date: Thu, 27 Jan 2022 16:05:22 +0100
Message-Id: <20220127150548.20595-13-quintela@redhat.com>
In-Reply-To: <20220127150548.20595-1-quintela@redhat.com>
References: <20220127150548.20595-1-quintela@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=quintela@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.159,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Fam Zheng <fam@euphon.net>, Peter Maydell <peter.maydell@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, Peter Xu <peterx@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Gerd Hoffmann <kraxel@redhat.com>, Ani Sinha <ani@anisinha.ca>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, Eric Blake <eblake@redhat.com>,
 Hannes Reinecke <hare@suse.com>, Vikram Garhwal <fnu.vikram@xilinx.com>,
 qemu-block@nongnu.org, Juan Quintela <quintela@redhat.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Markus Armbruster <armbru@redhat.com>, Artyom Tarasenko <atar4qemu@gmail.com>,
 Pavel Pisa <pisa@cmp.felk.cvut.cz>, Alistair Francis <alistair@alistair23.me>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, Greg Kurz <groug@kaod.org>,
 qemu-arm@nongnu.org, =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Stafford Horne <shorne@gmail.com>,
 David Gibson <david@gibson.dropbear.id.au>, Laurent Vivier <laurent@vivier.eu>,
 Andrew Baumann <Andrew.Baumann@microsoft.com>, qemu-ppc@nongnu.org,
 Igor Mammedov <imammedo@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>
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


