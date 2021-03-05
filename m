Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 96B5432E227
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Mar 2021 07:30:43 +0100 (CET)
Received: from localhost ([::1]:50036 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lI3z0-0008L9-Jm
	for lists+qemu-devel@lfdr.de; Fri, 05 Mar 2021 01:30:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55260)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1lI3vI-0003mX-Br
 for qemu-devel@nongnu.org; Fri, 05 Mar 2021 01:26:52 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:33333)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1lI3vG-0005Sb-PK
 for qemu-devel@nongnu.org; Fri, 05 Mar 2021 01:26:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614925609;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2sI0G10hnIjudO54eObXFZvvLgyCQek739j9/46dVAI=;
 b=OU6sctJVYH7P/YTlB7ZRK2++7Q7xAZFI3jxiOPlIfZ4VO2LodpkDKOjoempnlRMzeDXAqQ
 mPvk78ACPvGCL93vU2wCUR2PmDu80Q1b3YkiZa4KuUcKO5r3arQOW3c3IAJ1iPfNygTavO
 GtIZGv1hNRFyIx0U5fDoyRnHAtlsO5k=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-464-CbyoS3BYP5a98MTMU4tGNQ-1; Fri, 05 Mar 2021 01:26:47 -0500
X-MC-Unique: CbyoS3BYP5a98MTMU4tGNQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 421181005D4E;
 Fri,  5 Mar 2021 06:26:46 +0000 (UTC)
Received: from localhost.localdomain (ovpn-12-165.pek2.redhat.com
 [10.72.12.165])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E7F9B60244;
 Fri,  5 Mar 2021 06:26:43 +0000 (UTC)
From: Jason Wang <jasowang@redhat.com>
To: qemu-devel@nongnu.org,
	qemu-security@nongnu.org
Subject: [PATCH V4 01/10] net: introduce qemu_receive_packet()
Date: Fri,  5 Mar 2021 14:26:29 +0800
Message-Id: <20210305062638.6749-2-jasowang@redhat.com>
In-Reply-To: <20210305062638.6749-1-jasowang@redhat.com>
References: <20210305062638.6749-1-jasowang@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: alxndr@bu.edu, Jason Wang <jasowang@redhat.com>, philmd@redhat.com,
 ppandit@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Some NIC supports loopback mode and this is done by calling
nc->info->receive() directly which in fact suppresses the effort of
reentrancy check that is done in qemu_net_queue_send().

Unfortunately we can't use qemu_net_queue_send() here since for
loopback there's no sender as peer, so this patch introduce a
qemu_receive_packet() which is used for implementing loopback mode
for a NIC with this check.

NIC that supports loopback mode will be converted to this helper.

This is intended to address CVE-2021-3416.

Cc: Prasad J Pandit <ppandit@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Signed-off-by: Jason Wang <jasowang@redhat.com>
---
 include/net/net.h   |  5 +++++
 include/net/queue.h |  8 ++++++++
 net/net.c           | 38 +++++++++++++++++++++++++++++++-------
 net/queue.c         | 22 ++++++++++++++++++++++
 4 files changed, 66 insertions(+), 7 deletions(-)

diff --git a/include/net/net.h b/include/net/net.h
index 919facaad2..4f56cae0fa 100644
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
+ssize_t qemu_receive_packet(NetClientState *nc, const uint8_t *buf, int size);
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
index da4aa313be..d889487c0d 100644
--- a/net/net.c
+++ b/net/net.c
@@ -530,6 +530,17 @@ int qemu_set_vnet_be(NetClientState *nc, bool is_be)
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
@@ -542,13 +553,7 @@ int qemu_can_send_packet(NetClientState *sender)
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
@@ -681,6 +686,25 @@ ssize_t qemu_send_packet(NetClientState *nc, const uint8_t *buf, int size)
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
2.24.3 (Apple Git-128)


