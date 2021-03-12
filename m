Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C7773385B7
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Mar 2021 07:22:57 +0100 (CET)
Received: from localhost ([::1]:35914 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lKbCK-0000SB-Ak
	for lists+qemu-devel@lfdr.de; Fri, 12 Mar 2021 01:22:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60422)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1lKb6P-00008a-Ex
 for qemu-devel@nongnu.org; Fri, 12 Mar 2021 01:16:49 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:50228)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1lKb6N-0005kM-KI
 for qemu-devel@nongnu.org; Fri, 12 Mar 2021 01:16:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615529806;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=r+Uv3kkGtVymYT1ILAvg4wzrflsAJV2HM3FIlxV2xI8=;
 b=SA7bGIDe2fubrlSaw1XGIJ1+4z1VrHR020GQULyQxns74cZfYewfXq387GUNIrxWJKD4y4
 HLKQ/yH6zHPCYfnAH9D/F0hzCe+R+H798UW0C7FRFRgBdgoh3mxO1jHTmwDzOuibXMEajC
 Dlp/woT9w5x/WGNHCbSEPxu18mjam7w=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-497-fkD9BrfKP_eG25IRwW9ecw-1; Fri, 12 Mar 2021 01:16:45 -0500
X-MC-Unique: fkD9BrfKP_eG25IRwW9ecw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id EE15A1005E71;
 Fri, 12 Mar 2021 06:16:43 +0000 (UTC)
Received: from jason-ThinkPad-T430s.redhat.com (ovpn-12-126.pek2.redhat.com
 [10.72.12.126])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 08F281037E80;
 Fri, 12 Mar 2021 06:16:41 +0000 (UTC)
From: Jason Wang <jasowang@redhat.com>
To: peter.maydell@linaro.org
Subject: [PULL 06/16] net: introduce qemu_receive_packet()
Date: Fri, 12 Mar 2021 14:16:16 +0800
Message-Id: <1615529786-30763-7-git-send-email-jasowang@redhat.com>
In-Reply-To: <1615529786-30763-1-git-send-email-jasowang@redhat.com>
References: <1615529786-30763-1-git-send-email-jasowang@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.25,
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
Cc: Jason Wang <jasowang@redhat.com>, qemu-stable@nongnu.org,
 qemu-devel@nongnu.org, Prasad J Pandit <ppandit@redhat.com>
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
Cc: qemu-stable@nongnu.org
Signed-off-by: Jason Wang <jasowang@redhat.com>
---
 include/net/net.h   |  5 +++++
 include/net/queue.h |  8 ++++++++
 net/net.c           | 38 +++++++++++++++++++++++++++++++-------
 net/queue.c         | 22 ++++++++++++++++++++++
 4 files changed, 66 insertions(+), 7 deletions(-)

diff --git a/include/net/net.h b/include/net/net.h
index 919faca..4f56cae 100644
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
index c0269bb..9f2f289 100644
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
index 254b42f..6e61053 100644
--- a/net/net.c
+++ b/net/net.c
@@ -529,6 +529,17 @@ int qemu_set_vnet_be(NetClientState *nc, bool is_be)
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
@@ -541,13 +552,7 @@ int qemu_can_send_packet(NetClientState *sender)
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
@@ -680,6 +685,25 @@ ssize_t qemu_send_packet(NetClientState *nc, const uint8_t *buf, int size)
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
index 19e32c8..c872d51 100644
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
2.7.4


