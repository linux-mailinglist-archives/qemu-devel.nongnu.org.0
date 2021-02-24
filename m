Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E989323711
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Feb 2021 06:57:41 +0100 (CET)
Received: from localhost ([::1]:56688 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lEnB6-0005hK-AE
	for lists+qemu-devel@lfdr.de; Wed, 24 Feb 2021 00:57:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35762)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1lEn7m-0001au-5M
 for qemu-devel@nongnu.org; Wed, 24 Feb 2021 00:54:14 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:39020)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1lEn7k-0003rh-8k
 for qemu-devel@nongnu.org; Wed, 24 Feb 2021 00:54:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614146051;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=IfWm4PdhuA9QiJZbIsDcCk59KKFR9wnSNUKDqARuyJk=;
 b=hWXcr6pI1F1kvgOH9V+PqaWXf/LMaJ1ySUU3Gb9Rh9ZUCElGR48N7fWK/t6jciyeMF4sgq
 ZvVBAqaFnHtxM2I9R8n3YA7jnmeJvywarISxysf2XiTJC5v1e+dL8JGhRZca1DEFNecgl8
 LYMtmKsx+e/vik1ydL8+aYXsVzVIBzY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-423-Yq38fqbPO9uFhLBEN7HZlA-1; Wed, 24 Feb 2021 00:54:09 -0500
X-MC-Unique: Yq38fqbPO9uFhLBEN7HZlA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 667E251D9
 for <qemu-devel@nongnu.org>; Wed, 24 Feb 2021 05:54:08 +0000 (UTC)
Received: from jason-ThinkPad-X1-Carbon-6th.redhat.com
 (ovpn-13-164.pek2.redhat.com [10.72.13.164])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 0D3706061F;
 Wed, 24 Feb 2021 05:54:06 +0000 (UTC)
From: Jason Wang <jasowang@redhat.com>
To: jasowang@redhat.com,
	qemu-devel@nongnu.org
Subject: [PATCH 1/6] net: introduce qemu_receive_packet()
Date: Wed, 24 Feb 2021 13:53:56 +0800
Message-Id: <20210224055401.492407-2-jasowang@redhat.com>
In-Reply-To: <20210224055401.492407-1-jasowang@redhat.com>
References: <20210224055401.492407-1-jasowang@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: ppandit@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Some NIC supports loopback mode and this is done by calling
nc->info->receive() directly which in fact suppresses the effort of
reentrancy check that is done in qemu_net_queue_send().

Unfortunately we can use qemu_net_queue_send() here since for loop
back there's no sender as peer, so this patch introduce a
qemu_receive_packet() which is used for implementing loopback mode
for a NIC with this check.

NIC that supports loopback mode will be converted to this helper.

Signed-off-by: Jason Wang <jasowang@redhat.com>
---
 include/net/net.h   |  5 +++++
 include/net/queue.h |  8 ++++++++
 net/net.c           | 38 +++++++++++++++++++++++++++++++-------
 net/queue.c         | 22 ++++++++++++++++++++++
 4 files changed, 66 insertions(+), 7 deletions(-)

diff --git a/include/net/net.h b/include/net/net.h
index 919facaad2..65eb8a58c5 100644
--- a/include/net/net.h
+++ b/include/net/net.h
@@ -144,12 +144,17 @@ void *qemu_get_nic_opaque(NetClientState *nc);
 void qemu_del_net_client(NetClientState *nc);
 typedef void (*qemu_nic_foreach)(NICState *nic, void *opaque);
 void qemu_foreach_nic(qemu_nic_foreach func, void *opaque);
+int qemu_can_receive_packet(NetClientState *nc);
 int qemu_can_send_packet(NetClientState *nc);
 ssize_t qemu_sendv_packet(NetClientState *nc, const struct iovec *iov,
                           int iovcnt);
 ssize_t qemu_sendv_packet_async(NetClientState *nc, const struct iovec *iov,
                                 int iovcnt, NetPacketSent *sent_cb);
 ssize_t qemu_send_packet(NetClientState *nc, const uint8_t *buf, int size);
+ssize_t qemu_receive_packet(NetClientState *nc, const uint8_t *buf,int size);
+ssize_t qemu_receive_packet_iov(NetClientState *nc,
+                                const struct iovec *iov,
+                                int iovcnt);
 ssize_t qemu_send_packet_raw(NetClientState *nc, const uint8_t *buf, int size);
 ssize_t qemu_send_packet_async(NetClientState *nc, const uint8_t *buf,
                                int size, NetPacketSent *sent_cb);
diff --git a/include/net/queue.h b/include/net/queue.h
index c0269bb1dc..9f2f289d77 100644
--- a/include/net/queue.h
+++ b/include/net/queue.h
@@ -55,6 +55,14 @@ void qemu_net_queue_append_iov(NetQueue *queue,
 
 void qemu_del_net_queue(NetQueue *queue);
 
+ssize_t qemu_net_queue_receive(NetQueue *queue,
+                               const uint8_t *data,
+                               size_t size);
+
+ssize_t qemu_net_queue_receive_iov(NetQueue *queue,
+                                   const struct iovec *iov,
+                                   int iovcnt);
+
 ssize_t qemu_net_queue_send(NetQueue *queue,
                             NetClientState *sender,
                             unsigned flags,
diff --git a/net/net.c b/net/net.c
index e1035f21d1..6e470133ad 100644
--- a/net/net.c
+++ b/net/net.c
@@ -528,6 +528,17 @@ int qemu_set_vnet_be(NetClientState *nc, bool is_be)
 #endif
 }
 
+int qemu_can_receive_packet(NetClientState *nc)
+{
+    if (nc->receive_disabled) {
+        return 0;
+    } else if (nc->info->can_receive &&
+               !nc->info->can_receive(nc)) {
+        return 0;
+    }
+    return 1;
+}
+
 int qemu_can_send_packet(NetClientState *sender)
 {
     int vm_running = runstate_is_running();
@@ -540,13 +551,7 @@ int qemu_can_send_packet(NetClientState *sender)
         return 1;
     }
 
-    if (sender->peer->receive_disabled) {
-        return 0;
-    } else if (sender->peer->info->can_receive &&
-               !sender->peer->info->can_receive(sender->peer)) {
-        return 0;
-    }
-    return 1;
+    return qemu_can_receive_packet(sender->peer);
 }
 
 static ssize_t filter_receive_iov(NetClientState *nc,
@@ -679,6 +684,25 @@ ssize_t qemu_send_packet(NetClientState *nc, const uint8_t *buf, int size)
     return qemu_send_packet_async(nc, buf, size, NULL);
 }
 
+ssize_t qemu_receive_packet(NetClientState *nc, const uint8_t *buf, int size)
+{
+    if (!qemu_can_receive_packet(nc)) {
+        return 0;
+    }
+
+    return qemu_net_queue_receive(nc->incoming_queue, buf, size);
+}
+
+ssize_t qemu_receive_packet_iov(NetClientState *nc, const struct iovec *iov,
+                                int iovcnt)
+{
+    if (!qemu_can_receive_packet(nc)) {
+        return 0;
+    }
+
+    return qemu_net_queue_receive_iov(nc->incoming_queue, iov, iovcnt);
+}
+
 ssize_t qemu_send_packet_raw(NetClientState *nc, const uint8_t *buf, int size)
 {
     return qemu_send_packet_async_with_flags(nc, QEMU_NET_PACKET_FLAG_RAW,
diff --git a/net/queue.c b/net/queue.c
index 19e32c80fd..c872d51df8 100644
--- a/net/queue.c
+++ b/net/queue.c
@@ -182,6 +182,28 @@ static ssize_t qemu_net_queue_deliver_iov(NetQueue *queue,
     return ret;
 }
 
+ssize_t qemu_net_queue_receive(NetQueue *queue,
+                               const uint8_t *data,
+                               size_t size)
+{
+    if (queue->delivering) {
+        return 0;
+    }
+
+    return qemu_net_queue_deliver(queue, NULL, 0, data, size);
+}
+
+ssize_t qemu_net_queue_receive_iov(NetQueue *queue,
+                                   const struct iovec *iov,
+                                   int iovcnt)
+{
+    if (queue->delivering) {
+        return 0;
+    }
+
+    return qemu_net_queue_deliver_iov(queue, NULL, 0, iov, iovcnt);
+}
+
 ssize_t qemu_net_queue_send(NetQueue *queue,
                             NetClientState *sender,
                             unsigned flags,
-- 
2.25.1


