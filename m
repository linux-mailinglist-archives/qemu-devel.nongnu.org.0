Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D6B1236D61B
	for <lists+qemu-devel@lfdr.de>; Wed, 28 Apr 2021 13:08:15 +0200 (CEST)
Received: from localhost ([::1]:41634 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lbi3C-0002WK-TX
	for lists+qemu-devel@lfdr.de; Wed, 28 Apr 2021 07:08:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35904)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1lbhwk-0005z1-Tk
 for qemu-devel@nongnu.org; Wed, 28 Apr 2021 07:01:34 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:46604)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1lbhwi-0004w6-VT
 for qemu-devel@nongnu.org; Wed, 28 Apr 2021 07:01:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1619607692;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2jQk9VFsJNGH2Gwg1Bdemo+kfG5wOkbfp4Zlh2qght0=;
 b=CY+/0JsgTIT78OXPJhaX8+nCOJWmccD0if42owNYaAdVCtdal4cdZUwWnxnwKngC3ZeOyk
 Cr2VZI1c5SKoqCU4ylqk2b7aw3O4U8sDHqZnGWuCfrn+DDVdTPMDvjN+fRDauBhB4hGhN/
 CUAUimLRXGOswt1DQvyakv/srq7QvE0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-183-ce6zAquvM92sASuu_BGLsA-1; Wed, 28 Apr 2021 07:01:29 -0400
X-MC-Unique: ce6zAquvM92sASuu_BGLsA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B96328018A7;
 Wed, 28 Apr 2021 11:01:28 +0000 (UTC)
Received: from dgilbert-t580.localhost (ovpn-115-35.ams2.redhat.com
 [10.36.115.35])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E8C5D1001B2C;
 Wed, 28 Apr 2021 11:01:14 +0000 (UTC)
From: "Dr. David Alan Gilbert (git)" <dgilbert@redhat.com>
To: qemu-devel@nongnu.org, vgoyal@redhat.com, stefanha@redhat.com,
 groug@kaod.org
Subject: [PATCH v3 04/26] DAX: libvhost-user: Route slave message payload
Date: Wed, 28 Apr 2021 12:00:38 +0100
Message-Id: <20210428110100.27757-5-dgilbert@redhat.com>
In-Reply-To: <20210428110100.27757-1-dgilbert@redhat.com>
References: <20210428110100.27757-1-dgilbert@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.22,
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
Cc: virtio-fs@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>

Route the uint64 payload from message replies on the slave back up
through vu_process_message_reply and to the callers.

Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
---
 subprojects/libvhost-user/libvhost-user.c | 14 +++++++++++---
 1 file changed, 11 insertions(+), 3 deletions(-)

diff --git a/subprojects/libvhost-user/libvhost-user.c b/subprojects/libvhost-user/libvhost-user.c
index fab7ca17ee..937f64480d 100644
--- a/subprojects/libvhost-user/libvhost-user.c
+++ b/subprojects/libvhost-user/libvhost-user.c
@@ -403,9 +403,11 @@ vu_send_reply(VuDev *dev, int conn_fd, VhostUserMsg *vmsg)
  * Processes a reply on the slave channel.
  * Entered with slave_mutex held and releases it before exit.
  * Returns true on success.
+ * *payload is written on success
  */
 static bool
-vu_process_message_reply(VuDev *dev, const VhostUserMsg *vmsg)
+vu_process_message_reply(VuDev *dev, const VhostUserMsg *vmsg,
+                         uint64_t *payload)
 {
     VhostUserMsg msg_reply;
     bool result = false;
@@ -425,7 +427,8 @@ vu_process_message_reply(VuDev *dev, const VhostUserMsg *vmsg)
         goto out;
     }
 
-    result = msg_reply.payload.u64 == 0;
+    *payload = msg_reply.payload.u64;
+    result = true;
 
 out:
     pthread_mutex_unlock(&dev->slave_mutex);
@@ -1312,6 +1315,8 @@ bool vu_set_queue_host_notifier(VuDev *dev, VuVirtq *vq, int fd,
 {
     int qidx = vq - dev->vq;
     int fd_num = 0;
+    bool res;
+    uint64_t payload = 0;
     VhostUserMsg vmsg = {
         .request = VHOST_USER_SLAVE_VRING_HOST_NOTIFIER_MSG,
         .flags = VHOST_USER_VERSION | VHOST_USER_NEED_REPLY_MASK,
@@ -1342,7 +1347,10 @@ bool vu_set_queue_host_notifier(VuDev *dev, VuVirtq *vq, int fd,
     }
 
     /* Also unlocks the slave_mutex */
-    return vu_process_message_reply(dev, &vmsg);
+    res = vu_process_message_reply(dev, &vmsg, &payload);
+    res = res && (payload == 0);
+
+    return res;
 }
 
 static bool
-- 
2.31.1


