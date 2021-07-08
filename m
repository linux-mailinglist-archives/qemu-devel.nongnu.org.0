Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 788803BF7DA
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Jul 2021 11:57:35 +0200 (CEST)
Received: from localhost ([::1]:37700 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1Qmk-0006Md-Fv
	for lists+qemu-devel@lfdr.de; Thu, 08 Jul 2021 05:57:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58542)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1m1QjN-0000Q1-T7
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 05:54:05 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:23811)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1m1QjK-0005Iz-HR
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 05:54:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1625738042;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=RCYbme4UFgQccPlQ7jM6iCudvzHrSKM3nTlgSxu0LYg=;
 b=MCoEuGl8CIPLCHFvhKLMbRHTFlX5TVLFQPt/KOkn7p8dYwxJks6e1gyeHOuhOKl6C2aEQG
 8oGJ1pKzs99/jxNxEKmOT6XAn4BzVdyW3AJ9DqMPZqiYFIWRxp5E5QSRytsnuL9Y62u/LM
 GrdDXRUf6BtOV5HO2i3uT9HWIMdS9M0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-2-qO567luNOA-XgCUSS1qkbw-1; Thu, 08 Jul 2021 05:54:00 -0400
X-MC-Unique: qO567luNOA-XgCUSS1qkbw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C022B8030B0;
 Thu,  8 Jul 2021 09:53:59 +0000 (UTC)
Received: from t480s.redhat.com (ovpn-112-130.ams2.redhat.com [10.36.112.130])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 95BE25D9DD;
 Thu,  8 Jul 2021 09:53:57 +0000 (UTC)
From: David Hildenbrand <david@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 2/2] virtio-balloon: free page hinting cleanups
Date: Thu,  8 Jul 2021 11:53:39 +0200
Message-Id: <20210708095339.20274-3-david@redhat.com>
In-Reply-To: <20210708095339.20274-1-david@redhat.com>
References: <20210708095339.20274-1-david@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.439,
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
Cc: Juan Quintela <quintela@redhat.com>, "Michael S . Tsirkin" <mst@redhat.com>,
 David Hildenbrand <david@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Alexander Duyck <alexander.duyck@gmail.com>, Wei Wang <wei.w.wang@intel.com>,
 Peter Xu <peterx@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Let's compress the code a bit to improve readability. We can drop the
vm_running check in virtio_balloon_free_page_start() as it's already
properly checked in the single caller.

Cc: Wei Wang <wei.w.wang@intel.com>
Cc: Michael S. Tsirkin <mst@redhat.com>
Cc: Philippe Mathieu-Daudé <philmd@redhat.com>
Cc: Alexander Duyck <alexander.duyck@gmail.com>
Cc: Juan Quintela <quintela@redhat.com>
Cc: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Cc: Peter Xu <peterx@redhat.com>
Signed-off-by: David Hildenbrand <david@redhat.com>
---
 hw/virtio/virtio-balloon.c | 28 ++++++++--------------------
 1 file changed, 8 insertions(+), 20 deletions(-)

diff --git a/hw/virtio/virtio-balloon.c b/hw/virtio/virtio-balloon.c
index ae7867a8db..5a69dce35d 100644
--- a/hw/virtio/virtio-balloon.c
+++ b/hw/virtio/virtio-balloon.c
@@ -534,22 +534,18 @@ static bool get_free_page_hints(VirtIOBalloon *dev)
         if (dev->free_page_hint_status == FREE_PAGE_HINT_S_REQUESTED &&
             id == dev->free_page_hint_cmd_id) {
             dev->free_page_hint_status = FREE_PAGE_HINT_S_START;
-        } else {
+        } else if (dev->free_page_hint_status == FREE_PAGE_HINT_S_START) {
             /*
              * Stop the optimization only when it has started. This
              * avoids a stale stop sign for the previous command.
              */
-            if (dev->free_page_hint_status == FREE_PAGE_HINT_S_START) {
-                dev->free_page_hint_status = FREE_PAGE_HINT_S_STOP;
-            }
+            dev->free_page_hint_status = FREE_PAGE_HINT_S_STOP;
         }
     }
 
-    if (elem->in_num) {
-        if (dev->free_page_hint_status == FREE_PAGE_HINT_S_START) {
-            qemu_guest_free_page_hint(elem->in_sg[0].iov_base,
-                                      elem->in_sg[0].iov_len);
-        }
+    if (elem->in_num && dev->free_page_hint_status == FREE_PAGE_HINT_S_START) {
+        qemu_guest_free_page_hint(elem->in_sg[0].iov_base,
+                                  elem->in_sg[0].iov_len);
     }
 
 out:
@@ -592,16 +588,10 @@ static void virtio_balloon_free_page_start(VirtIOBalloon *s)
 {
     VirtIODevice *vdev = VIRTIO_DEVICE(s);
 
-    /* For the stop and copy phase, we don't need to start the optimization */
-    if (!vdev->vm_running) {
-        return;
-    }
-
     qemu_mutex_lock(&s->free_page_lock);
 
     if (s->free_page_hint_cmd_id == UINT_MAX) {
-        s->free_page_hint_cmd_id =
-                       VIRTIO_BALLOON_FREE_PAGE_HINT_CMD_ID_MIN;
+        s->free_page_hint_cmd_id = VIRTIO_BALLOON_FREE_PAGE_HINT_CMD_ID_MIN;
     } else {
         s->free_page_hint_cmd_id++;
     }
@@ -649,8 +639,7 @@ static void virtio_balloon_free_page_done(VirtIOBalloon *s)
 static int
 virtio_balloon_free_page_hint_notify(NotifierWithReturn *n, void *data)
 {
-    VirtIOBalloon *dev = container_of(n, VirtIOBalloon,
-                                      free_page_hint_notify);
+    VirtIOBalloon *dev = container_of(n, VirtIOBalloon, free_page_hint_notify);
     VirtIODevice *vdev = VIRTIO_DEVICE(dev);
     PrecopyNotifyData *pnd = data;
 
@@ -919,8 +908,7 @@ static void virtio_balloon_device_realize(DeviceState *dev, Error **errp)
     s->dvq = virtio_add_queue(vdev, 128, virtio_balloon_handle_output);
     s->svq = virtio_add_queue(vdev, 128, virtio_balloon_receive_stats);
 
-    if (virtio_has_feature(s->host_features,
-                           VIRTIO_BALLOON_F_FREE_PAGE_HINT)) {
+    if (virtio_has_feature(s->host_features, VIRTIO_BALLOON_F_FREE_PAGE_HINT)) {
         s->free_page_vq = virtio_add_queue(vdev, VIRTQUEUE_MAX_SIZE,
                                            virtio_balloon_handle_free_page_vq);
         precopy_add_notifier(&s->free_page_hint_notify);
-- 
2.31.1


