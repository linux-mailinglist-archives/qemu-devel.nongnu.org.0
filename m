Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B2FD233AE7C
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Mar 2021 10:19:37 +0100 (CET)
Received: from localhost ([::1]:36470 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lLjNr-0003xp-L1
	for lists+qemu-devel@lfdr.de; Mon, 15 Mar 2021 05:19:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35198)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1lLjJX-0007od-Ro
 for qemu-devel@nongnu.org; Mon, 15 Mar 2021 05:15:03 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:35517)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1lLjJV-0007iT-Dy
 for qemu-devel@nongnu.org; Mon, 15 Mar 2021 05:15:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615799700;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wztnDkp2Vgs1w2guSSyW35cz9bp2eArQYIOdjsh3M24=;
 b=Ut/mXP4DN0zON3g1OmRPQPDJjiLvuk9GC3vuIHTJWej3+zPyctL+rWcjXNJamv2+T9qWSM
 C/YZWv4bNwNgmQ4e+vfZJFDRCFv6NIydFeCQ/gFZtDtMwAHLLFeg2Vr+ClWzyFhXoRtU2C
 kM3u6e5o5yRYSVCvBrSH8KBXyuT873A=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-446-qshcxG8OPUOEdcMw0d8jrw-1; Mon, 15 Mar 2021 05:14:58 -0400
X-MC-Unique: qshcxG8OPUOEdcMw0d8jrw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CFDBD107465E;
 Mon, 15 Mar 2021 09:14:57 +0000 (UTC)
Received: from jason-ThinkPad-T430s.redhat.com (ovpn-13-105.pek2.redhat.com
 [10.72.13.105])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E06671007625;
 Mon, 15 Mar 2021 09:14:55 +0000 (UTC)
From: Jason Wang <jasowang@redhat.com>
To: peter.maydell@linaro.org
Subject: [PULL V2 05/20] net: introduce qemu_receive_packet()
Date: Mon, 15 Mar 2021 17:14:18 +0800
Message-Id: <1615799673-31549-6-git-send-email-jasowang@redhat.com>
In-Reply-To: <1615799673-31549-1-git-send-email-jasowang@redhat.com>
References: <1615799673-31549-1-git-send-email-jasowang@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.25,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
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
index 77b35ea..edf9b95 100644
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


