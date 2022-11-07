Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 159B26203AA
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Nov 2022 00:21:14 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1osB0N-0005qW-Uz; Mon, 07 Nov 2022 17:54:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1osB0H-0005lP-Bc
 for qemu-devel@nongnu.org; Mon, 07 Nov 2022 17:54:05 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1osB09-0004FB-G8
 for qemu-devel@nongnu.org; Mon, 07 Nov 2022 17:54:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1667861636;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=wH9In1dsmo/cnU0MTw9nPlthORSI2VXK6ZI0gdJrLTs=;
 b=gWa3ymFFuzgOxA3iOLCqqYIFkP9oP+e4qpgiXwtu/3QZQ6cQfr0VELzQIhM8P0g+CM7FlG
 7otLa1qDIZg74MxDo8Ae7oubp8/NmYBMV+Ovq7JNlLL3eevywL1/jkU+vJKIgOUMdd+LF0
 g4jSodNaMGjucTvzQs6c9Otjml6uTyE=
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-605-X0wlfUMVMJKeCNzcKKugWQ-1; Mon, 07 Nov 2022 17:53:55 -0500
X-MC-Unique: X0wlfUMVMJKeCNzcKKugWQ-1
Received: by mail-qv1-f71.google.com with SMTP id
 b2-20020a0cfe62000000b004bbfb15297dso8593342qvv.19
 for <qemu-devel@nongnu.org>; Mon, 07 Nov 2022 14:53:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=wH9In1dsmo/cnU0MTw9nPlthORSI2VXK6ZI0gdJrLTs=;
 b=OP+1enzXGNEXaGUw7hwt7P9VvnIm0qaujmreZ/biVx3UQ31rvJa5UBP3Q0ML4DgDXC
 kuQ6GEfZ293x/QJCAB2mcfmkGYGDUZmB2Jp503I8r+3b17MsIMuJaGG3SaUuLkKyJ49R
 1WB98E6eZNIMPKaw+T50NXTAe1m6nrE+kEHr2ppxBJF03qgZBVIt76lTtO0oslXspUxF
 wjkJuzMgEY40J/xrpJeh21K1SA2WpHH2bu9E5GyWNloFe6Utx3ykQn7iL3Kf8WiUGtWM
 AGp1acLXjcNdXSiiPSAYHPnCyYOj6mUQnGXnqsQ51Cutx+S47YN5hPX6Uwmx4x9ZWwi4
 tymQ==
X-Gm-Message-State: ACrzQf0yCIGT5qUU1jtSnM9BEjSYa7xF+mL078S5coaxXmIRpHLE0/AK
 TaNudvssSKhVCoOV+YAXjdCRp1MqZiAEnX5Aw7uSHPJIK+Jv8sCF733qRJfAbNBxaiBPeY1raEN
 MJserBPtxwWTK7pf3uWoipnfnyALwxPPTFD8dRU+74fy7S0CxmQDafAofHVkQ
X-Received: by 2002:a37:53c7:0:b0:6fa:4b14:e071 with SMTP id
 h190-20020a3753c7000000b006fa4b14e071mr25893808qkb.230.1667861634809; 
 Mon, 07 Nov 2022 14:53:54 -0800 (PST)
X-Google-Smtp-Source: AMsMyM7aMeXtkN3tHIiQctKYfL5VqnCnMzZ2Tll6VvO6dknsN5+s/8/jGYSPMPhtn2lP+rxqzAVOKQ==
X-Received: by 2002:a37:53c7:0:b0:6fa:4b14:e071 with SMTP id
 h190-20020a3753c7000000b006fa4b14e071mr25893785qkb.230.1667861634492; 
 Mon, 07 Nov 2022 14:53:54 -0800 (PST)
Received: from redhat.com ([87.249.138.11]) by smtp.gmail.com with ESMTPSA id
 z10-20020ac87caa000000b003a50d92f9b4sm6992931qtv.1.2022.11.07.14.53.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Nov 2022 14:53:54 -0800 (PST)
Date: Mon, 7 Nov 2022 17:53:49 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, Yajun Wu <yajunw@nvidia.com>,
 Parav Pandit <parav@nvidia.com>,
 Raphael Norwitz <raphael.norwitz@nutanix.com>,
 Kevin Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 Jason Wang <jasowang@redhat.com>, qemu-block@nongnu.org
Subject: [PULL v4 75/83] vhost: Change the sequence of device start
Message-ID: <20221107224600.934080-76-mst@redhat.com>
References: <20221107224600.934080-1-mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221107224600.934080-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_PASS=-0.001,
 T_SPF_HELO_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Yajun Wu <yajunw@nvidia.com>

This patch is part of adding vhost-user vhost_dev_start support. The
motivation is to improve backend configuration speed and reduce live
migration VM downtime.

Moving the device start routines after finishing all the necessary device
and VQ configuration, further aligning to the virtio specification for
"device initialization sequence".

Following patch will add vhost-user vhost_dev_start support.

Signed-off-by: Yajun Wu <yajunw@nvidia.com>
Acked-by: Parav Pandit <parav@nvidia.com>

Message-Id: <20221017064452.1226514-2-yajunw@nvidia.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 hw/block/vhost-user-blk.c | 18 +++++++++++-------
 hw/net/vhost_net.c        | 11 +++++------
 2 files changed, 16 insertions(+), 13 deletions(-)

diff --git a/hw/block/vhost-user-blk.c b/hw/block/vhost-user-blk.c
index 13bf5cc47a..28409c90f7 100644
--- a/hw/block/vhost-user-blk.c
+++ b/hw/block/vhost-user-blk.c
@@ -168,13 +168,6 @@ static int vhost_user_blk_start(VirtIODevice *vdev, Error **errp)
         goto err_guest_notifiers;
     }
 
-    ret = vhost_dev_start(&s->dev, vdev);
-    if (ret < 0) {
-        error_setg_errno(errp, -ret, "Error starting vhost");
-        goto err_guest_notifiers;
-    }
-    s->started_vu = true;
-
     /* guest_notifier_mask/pending not used yet, so just unmask
      * everything here. virtio-pci will do the right thing by
      * enabling/disabling irqfd.
@@ -183,9 +176,20 @@ static int vhost_user_blk_start(VirtIODevice *vdev, Error **errp)
         vhost_virtqueue_mask(&s->dev, vdev, i, false);
     }
 
+    s->dev.vq_index_end = s->dev.nvqs;
+    ret = vhost_dev_start(&s->dev, vdev);
+    if (ret < 0) {
+        error_setg_errno(errp, -ret, "Error starting vhost");
+        goto err_guest_notifiers;
+    }
+    s->started_vu = true;
+
     return ret;
 
 err_guest_notifiers:
+    for (i = 0; i < s->dev.nvqs; i++) {
+        vhost_virtqueue_mask(&s->dev, vdev, i, true);
+    }
     k->set_guest_notifiers(qbus->parent, s->dev.nvqs, false);
 err_host_notifiers:
     vhost_dev_disable_notifiers(&s->dev, vdev);
diff --git a/hw/net/vhost_net.c b/hw/net/vhost_net.c
index 53b2fac4f6..feda448878 100644
--- a/hw/net/vhost_net.c
+++ b/hw/net/vhost_net.c
@@ -389,21 +389,20 @@ int vhost_net_start(VirtIODevice *dev, NetClientState *ncs,
         } else {
             peer = qemu_get_peer(ncs, n->max_queue_pairs);
         }
-        r = vhost_net_start_one(get_vhost_net(peer), dev);
-
-        if (r < 0) {
-            goto err_start;
-        }
 
         if (peer->vring_enable) {
             /* restore vring enable state */
             r = vhost_set_vring_enable(peer, peer->vring_enable);
 
             if (r < 0) {
-                vhost_net_stop_one(get_vhost_net(peer), dev);
                 goto err_start;
             }
         }
+
+        r = vhost_net_start_one(get_vhost_net(peer), dev);
+        if (r < 0) {
+            goto err_start;
+        }
     }
 
     return 0;
-- 
MST


