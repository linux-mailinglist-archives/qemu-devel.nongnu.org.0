Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C1753400D24
	for <lists+qemu-devel@lfdr.de>; Sat,  4 Sep 2021 23:42:40 +0200 (CEST)
Received: from localhost ([::1]:53546 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mMdQt-0002VG-RA
	for lists+qemu-devel@lfdr.de; Sat, 04 Sep 2021 17:42:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35334)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1mMdL6-0005Cg-63
 for qemu-devel@nongnu.org; Sat, 04 Sep 2021 17:36:40 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:45118)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1mMdL4-000157-EH
 for qemu-devel@nongnu.org; Sat, 04 Sep 2021 17:36:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1630791397;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Xp1Zu6Ykn24pneBxs9zUAOW4U4cc/WjH89YFNE8EmiI=;
 b=EW8pYQjhiagqksS701D8z35sewigxjmAKJLR9eDBDX8uZkuDyjVacP50wMxd64qCnyxRtd
 jRz75porEK73XAybpWZrMozGgBiWsThFdwwghcXMxF9XYPsCSmBB/2SzJGuZd9DLETRUd8
 7SUrcE9Xv56Jpbc4BpvyrhInXFHXfLk=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-311-Y44P2hx0N-SFTb6WqbQCqA-1; Sat, 04 Sep 2021 17:36:35 -0400
X-MC-Unique: Y44P2hx0N-SFTb6WqbQCqA-1
Received: by mail-ed1-f70.google.com with SMTP id
 a23-20020aa7cf17000000b003caffcef4beso1502811edy.5
 for <qemu-devel@nongnu.org>; Sat, 04 Sep 2021 14:36:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=Xp1Zu6Ykn24pneBxs9zUAOW4U4cc/WjH89YFNE8EmiI=;
 b=tFjlKMbZnvrfkCaRGvZWK5zwrc06d3IfAokl89glbYAXJKMsEe+hm50UZPt9KMMf1S
 Q0pEYEhobFbygCLxOiftdfyhNKHs3WGd3c+E9abt+zRt8AqDPykfbOlsD32Lmg0IUq0R
 1H2a7l2vS6G29RiLGGquSh7CR/zffeiq5AwbyOZXPAZvyzDKi8w/nSpf6whheF0/urFf
 Z/kbr7V71oIvnlXtOXHKXtdK5xUuXNcekIDbtmFwEdZvWvlq5jc8CKmBaxO21JJsyFlH
 +7YRV6/3Vm0k51Kz3DyzQjRJAl+Z63qh9A3uBcqLfAqvpXXKPsZg5qF2M23RK0YmTlhL
 c98Q==
X-Gm-Message-State: AOAM531eFJx65B+5VqHHiJ07EVAP5mAeA98VfTN0JEVeexZh83G5Mbp2
 628mJRR+TWJPX0uOk5kKGPmRVusdmv1Cl3FFo4GZHtJSBYhlzWQGyZHKtyoF+lOsOBSF71BpE+V
 prTvCOYWnCpqcc3y+ihloIqR0EL52KvWP4dB7DBLX9l6IpvMDD1dgHO6aOp7o
X-Received: by 2002:a17:907:266f:: with SMTP id
 ci15mr5789105ejc.509.1630791394357; 
 Sat, 04 Sep 2021 14:36:34 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyDK1up5IQH+vgHPGaIqqveQmJFwVk6e4xhdwTLnEKYM+VGsV5OqddvZgi73Na4adNUzzDYgA==
X-Received: by 2002:a17:907:266f:: with SMTP id
 ci15mr5789083ejc.509.1630791394157; 
 Sat, 04 Sep 2021 14:36:34 -0700 (PDT)
Received: from redhat.com ([2.55.150.176])
 by smtp.gmail.com with ESMTPSA id am3sm1520345ejc.74.2021.09.04.14.36.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 04 Sep 2021 14:36:33 -0700 (PDT)
Date: Sat, 4 Sep 2021 17:36:31 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 12/35] virtio-balloon: free page hinting cleanups
Message-ID: <20210904213506.486886-13-mst@redhat.com>
References: <20210904213506.486886-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210904213506.486886-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.391,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Juan Quintela <quintela@redhat.com>, David Hildenbrand <david@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Alexander Duyck <alexander.duyck@gmail.com>, Wei Wang <wei.w.wang@intel.com>,
 Peter Xu <peterx@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: David Hildenbrand <david@redhat.com>

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
Message-Id: <20210708095339.20274-3-david@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
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
MST


