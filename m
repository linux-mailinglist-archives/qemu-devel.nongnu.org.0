Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B2B36168A3
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Nov 2022 17:24:44 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oqGJW-0005kn-Oz; Wed, 02 Nov 2022 12:10:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1oqGJU-0005ca-Bc
 for qemu-devel@nongnu.org; Wed, 02 Nov 2022 12:10:00 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1oqGJN-0002Yu-Mv
 for qemu-devel@nongnu.org; Wed, 02 Nov 2022 12:10:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1667405393;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=I+XhRuEe731PBRbGglnJF+ohU35hrlGZzC8ZshQ5PaU=;
 b=Xlqh6O2wiocKIjsUsQhFb63n02yf4LQVK1w2pQBev5VXvLV1dr24FeLBynvp98JI+Xx8YV
 b6DsINhClzQ1em7uKIm3IjO3ySyjk7iYMHoJzXXflxJ3+SAffWCRKpqXt5QvuSl+vBhJor
 axGx+h/3aNz/dORjeW/lZQr8b2YpaKg=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-347-bLlNCU8wOfmTeUWqCwPyxw-1; Wed, 02 Nov 2022 12:09:51 -0400
X-MC-Unique: bLlNCU8wOfmTeUWqCwPyxw-1
Received: by mail-wm1-f72.google.com with SMTP id
 v23-20020a1cf717000000b003bff630f31aso646117wmh.5
 for <qemu-devel@nongnu.org>; Wed, 02 Nov 2022 09:09:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=I+XhRuEe731PBRbGglnJF+ohU35hrlGZzC8ZshQ5PaU=;
 b=R5RTpfgucrYmeSACrES2VZoKdLyhQxzwYECX5g4xDHD2JsmhfCYSaRDN9myCIUUzaQ
 NUCqq8470fdXST4kiYjuIgB+CgX/CtLQUvJrahlnL0hlUOQx8v+v4VX4q6jiW8ryVMC2
 Iau8h4dbU6VCaDH42Xtr0l3olvtBKZKQTwj7iQwWcWZokwe62llX18QaTitZiErYStb0
 CNuiJ+hrOcjDo9WNumZoWjax61zHzrymDWMWigugy02effy8mWbM2kDGbrpF9Pa2gDO9
 E+T7j30qR9NGWvxGCOmJVEhk+FqXzrKlZO/L5y4YBbzGu+XtdfX01MeAqdIlxaagolF5
 24lA==
X-Gm-Message-State: ACrzQf3+jW+5+GAABK5O9nzxXVrbMt39YaFaT+8jD4Ucts+1iGAsVXV4
 cP2S29uA2+rZO+Z3xvhw1UQlyq6ax1tsAAHXMEvpJUgXQ2ZeDsyHGIHE5u1qgRIoiLRbFjX6zE1
 BTO2TurfQrFj9Xzv5/t3Lb52vOq3tUuFjYVF0dUkcibtWYpi3fuArvYeEys1l
X-Received: by 2002:a7b:cb87:0:b0:3cf:6af4:c509 with SMTP id
 m7-20020a7bcb87000000b003cf6af4c509mr13446004wmi.140.1667405389402; 
 Wed, 02 Nov 2022 09:09:49 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM45W8f+EnSmILfMA7zkPDp638JgMpngrKJ0Gayw6h72HJ2O1Cl7Jjn5I/WFS9aHaKQzF/7LXQ==
X-Received: by 2002:a7b:cb87:0:b0:3cf:6af4:c509 with SMTP id
 m7-20020a7bcb87000000b003cf6af4c509mr13445967wmi.140.1667405389130; 
 Wed, 02 Nov 2022 09:09:49 -0700 (PDT)
Received: from redhat.com ([2.52.15.189]) by smtp.gmail.com with ESMTPSA id
 bg36-20020a05600c3ca400b003cf774c31a0sm2791302wmb.16.2022.11.02.09.09.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Nov 2022 09:09:48 -0700 (PDT)
Date: Wed, 2 Nov 2022 12:09:46 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, Yajun Wu <yajunw@nvidia.com>,
 Parav Pandit <parav@nvidia.com>,
 Raphael Norwitz <raphael.norwitz@nutanix.com>,
 Kevin Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 Jason Wang <jasowang@redhat.com>, qemu-block@nongnu.org
Subject: [PULL v2 31/82] vhost: Change the sequence of device start
Message-ID: <20221102160336.616599-32-mst@redhat.com>
References: <20221102160336.616599-1-mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221102160336.616599-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.048,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 T_SPF_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

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
 hw/net/vhost_net.c        | 12 ++++++------
 2 files changed, 17 insertions(+), 13 deletions(-)

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
index d28f8b974b..d6924f5e57 100644
--- a/hw/net/vhost_net.c
+++ b/hw/net/vhost_net.c
@@ -387,21 +387,21 @@ int vhost_net_start(VirtIODevice *dev, NetClientState *ncs,
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
+            vhost_net_stop_one(get_vhost_net(peer), dev);
+            goto err_start;
+        }
     }
 
     return 0;
-- 
MST


