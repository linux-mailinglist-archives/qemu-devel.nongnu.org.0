Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 44AD2302983
	for <lists+qemu-devel@lfdr.de>; Mon, 25 Jan 2021 19:05:57 +0100 (CET)
Received: from localhost ([::1]:42334 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l46FP-0003Gp-R5
	for lists+qemu-devel@lfdr.de; Mon, 25 Jan 2021 13:05:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45186)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vgoyal@redhat.com>) id 1l46Bc-0001OV-0R
 for qemu-devel@nongnu.org; Mon, 25 Jan 2021 13:02:00 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:57761)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <vgoyal@redhat.com>) id 1l46BY-0006km-Up
 for qemu-devel@nongnu.org; Mon, 25 Jan 2021 13:01:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611597714;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Go5qmUqyPVhLjJ+A7W/OFRJFVNMBRxbvYLjmjXBhUUo=;
 b=dDt9MElGp4Nvy1J3SOUFgxbUKmOc/pAIJ3gBVpXubRQnOGTSInz6SgAERUYSDxFXO9KdmU
 qjMzdOLpci/7QuVsZY9sSaFck1K/uXbky8+35i3HdJWrCsAuKnFfGv14qSrLmMY2vkXUuU
 Ae9Fzmcs2kEvOCTkgWSkTPjNpK+WCsA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-532-EsoIWbSdO1K3EDcob8FgWQ-1; Mon, 25 Jan 2021 13:01:52 -0500
X-MC-Unique: EsoIWbSdO1K3EDcob8FgWQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C1C80100C606
 for <qemu-devel@nongnu.org>; Mon, 25 Jan 2021 18:01:51 +0000 (UTC)
Received: from horse.redhat.com (ovpn-116-119.rdu2.redhat.com [10.10.116.119])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A16D26F983;
 Mon, 25 Jan 2021 18:01:38 +0000 (UTC)
Received: by horse.redhat.com (Postfix, from userid 10451)
 id 39C61223D99; Mon, 25 Jan 2021 13:01:38 -0500 (EST)
From: Vivek Goyal <vgoyal@redhat.com>
To: qemu-devel@nongnu.org,
	virtio-fs@redhat.com
Subject: [PATCH 2/6] libvhost-user: Use slave_mutex in all slave messages
Date: Mon, 25 Jan 2021 13:01:11 -0500
Message-Id: <20210125180115.22936-3-vgoyal@redhat.com>
In-Reply-To: <20210125180115.22936-1-vgoyal@redhat.com>
References: <20210125180115.22936-1-vgoyal@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=vgoyal@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=vgoyal@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.255,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: marcandre.lureau@redhat.com, stefanha@redhat.com, dgilbert@redhat.com,
 vgoyal@redhat.com, mst@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

dev->slave_mutex needs to be taken when sending messages on slave_fd.
Currently _vu_queue_notify() does not do that.

Introduce a helper vu_message_slave_send_receive() which sends as well
as receive response. Use this helper in all the paths which send
message on slave_fd channel.

Signed-off-by: Vivek Goyal <vgoyal@redhat.com>
---
 subprojects/libvhost-user/libvhost-user.c | 50 ++++++++++++-----------
 1 file changed, 27 insertions(+), 23 deletions(-)

diff --git a/subprojects/libvhost-user/libvhost-user.c b/subprojects/libvhost-user/libvhost-user.c
index 4cf4aef63d..7a56c56dc8 100644
--- a/subprojects/libvhost-user/libvhost-user.c
+++ b/subprojects/libvhost-user/libvhost-user.c
@@ -403,7 +403,7 @@ vu_send_reply(VuDev *dev, int conn_fd, VhostUserMsg *vmsg)
  * Processes a reply on the slave channel.
  * Entered with slave_mutex held and releases it before exit.
  * Returns true on success.
- * *payload is written on success
+ * *payload is written on success, if payload is not NULL.
  */
 static bool
 vu_process_message_reply(VuDev *dev, const VhostUserMsg *vmsg,
@@ -427,7 +427,9 @@ vu_process_message_reply(VuDev *dev, const VhostUserMsg *vmsg,
         goto out;
     }
 
-    *payload = msg_reply.payload.u64;
+    if (payload) {
+        *payload = msg_reply.payload.u64;
+    }
     result = true;
 
 out:
@@ -435,6 +437,25 @@ out:
     return result;
 }
 
+/* Returns true on success, false otherwise */
+static bool
+vu_message_slave_send_receive(VuDev *dev, VhostUserMsg *vmsg, uint64_t *payload)
+{
+    pthread_mutex_lock(&dev->slave_mutex);
+    if (!vu_message_write(dev, dev->slave_fd, vmsg)) {
+        pthread_mutex_unlock(&dev->slave_mutex);
+        return false;
+    }
+
+    if ((vmsg->flags & VHOST_USER_NEED_REPLY_MASK) == 0) {
+        pthread_mutex_unlock(&dev->slave_mutex);
+        return true;
+    }
+
+    /* Also unlocks the slave_mutex */
+    return vu_process_message_reply(dev, vmsg, payload);
+}
+
 /* Kick the log_call_fd if required. */
 static void
 vu_log_kick(VuDev *dev)
@@ -1340,16 +1361,8 @@ bool vu_set_queue_host_notifier(VuDev *dev, VuVirtq *vq, int fd,
         return false;
     }
 
-    pthread_mutex_lock(&dev->slave_mutex);
-    if (!vu_message_write(dev, dev->slave_fd, &vmsg)) {
-        pthread_mutex_unlock(&dev->slave_mutex);
-        return false;
-    }
-
-    /* Also unlocks the slave_mutex */
-    res = vu_process_message_reply(dev, &vmsg, &payload);
+    res = vu_message_slave_send_receive(dev, &vmsg, &payload);
     res = res && (payload == 0);
-
     return res;
 }
 
@@ -2395,10 +2408,7 @@ static void _vu_queue_notify(VuDev *dev, VuVirtq *vq, bool sync)
             vmsg.flags |= VHOST_USER_NEED_REPLY_MASK;
         }
 
-        vu_message_write(dev, dev->slave_fd, &vmsg);
-        if (ack) {
-            vu_message_read_default(dev, dev->slave_fd, &vmsg);
-        }
+        vu_message_slave_send_receive(dev, &vmsg, NULL);
         return;
     }
 
@@ -2942,17 +2952,11 @@ int64_t vu_fs_cache_request(VuDev *dev, VhostUserSlaveRequest req, int fd,
         return -EINVAL;
     }
 
-    pthread_mutex_lock(&dev->slave_mutex);
-    if (!vu_message_write(dev, dev->slave_fd, &vmsg)) {
-        pthread_mutex_unlock(&dev->slave_mutex);
-        return -EIO;
-    }
-
-    /* Also unlocks the slave_mutex */
-    res = vu_process_message_reply(dev, &vmsg, &payload);
+    res = vu_message_slave_send_receive(dev, &vmsg, &payload);
     if (!res) {
         return -EIO;
     }
+
     /*
      * Payload is delivered as uint64_t but is actually signed for
      * errors.
-- 
2.25.4


