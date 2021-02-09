Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 52516315692
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Feb 2021 20:14:41 +0100 (CET)
Received: from localhost ([::1]:35606 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9YTA-00029h-9O
	for lists+qemu-devel@lfdr.de; Tue, 09 Feb 2021 14:14:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51346)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1l9YHp-0001mQ-BP
 for qemu-devel@nongnu.org; Tue, 09 Feb 2021 14:02:57 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:22998)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1l9YHn-0001cK-O1
 for qemu-devel@nongnu.org; Tue, 09 Feb 2021 14:02:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612897375;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=QNlair57xLZNrH0eP3P8pdNTju7RHayYUY0OubI3yAo=;
 b=GUTB+DJYZ/MelbHPh6HG/IYfus+H4a8m2FlN1+MVtU/IEkTMwaDhfQCuQCSU2FoG1lN6k/
 jnh2Rc2fn/CbM8IxO63s79d/bsY9t6ek/+bKxgbirmtfWvMOSpxjEnmI/R+/R3I+1nOElt
 dPPm2PhjoeX0GrbbICkJPdcx6V9FN8c=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-502-OQrZAUutMTmZNaklyrXwEQ-1; Tue, 09 Feb 2021 14:02:53 -0500
X-MC-Unique: OQrZAUutMTmZNaklyrXwEQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 73931107ACE3
 for <qemu-devel@nongnu.org>; Tue,  9 Feb 2021 19:02:52 +0000 (UTC)
Received: from dgilbert-t580.localhost (ovpn-112-66.ams2.redhat.com
 [10.36.112.66])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 0D96E60C04;
 Tue,  9 Feb 2021 19:02:44 +0000 (UTC)
From: "Dr. David Alan Gilbert (git)" <dgilbert@redhat.com>
To: qemu-devel@nongnu.org, vgoyal@redhat.com, stefanha@redhat.com,
 virtio-fs@redhat.com, marcandre.lureau@redhat.com, mst@redhat.com
Subject: [PATCH 02/24] DAX: libvhost-user: Route slave message payload
Date: Tue,  9 Feb 2021 19:02:02 +0000
Message-Id: <20210209190224.62827-3-dgilbert@redhat.com>
In-Reply-To: <20210209190224.62827-1-dgilbert@redhat.com>
References: <20210209190224.62827-1-dgilbert@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.57,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>

Route the uint64 payload from message replies on the slave back up
through vu_process_message_reply and to the callers.

Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
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
2.29.2


