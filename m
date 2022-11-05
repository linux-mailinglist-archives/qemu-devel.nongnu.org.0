Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 50AA561DC88
	for <lists+qemu-devel@lfdr.de>; Sat,  5 Nov 2022 18:36:35 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1orMrA-0001Iw-Pj; Sat, 05 Nov 2022 13:21:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1orMpM-0007rU-Dx
 for qemu-devel@nongnu.org; Sat, 05 Nov 2022 13:19:31 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1orMpK-0007rF-Pc
 for qemu-devel@nongnu.org; Sat, 05 Nov 2022 13:19:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1667668766;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=wH9In1dsmo/cnU0MTw9nPlthORSI2VXK6ZI0gdJrLTs=;
 b=Ldv1wiYIu6u4c/5RJGfvGpy9aEWdigv54YAzDdv4u6bpBWUpE5T0GBze6g+47e5kqq8CX3
 y8T4+1IoiZZbWiSMxHhb7mhRr7dhWUNyO9kqTf/vOV3dbFx50Tgd6fbqLrs7ralewPQDiD
 w2AL9htC52L6vpatyXKyTPgw/VKf0ms=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-501-KhlL6P6UMLG-SibguzVpSg-1; Sat, 05 Nov 2022 13:19:25 -0400
X-MC-Unique: KhlL6P6UMLG-SibguzVpSg-1
Received: by mail-wm1-f69.google.com with SMTP id
 1-20020a05600c028100b003cf7833293cso6008353wmk.3
 for <qemu-devel@nongnu.org>; Sat, 05 Nov 2022 10:19:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=wH9In1dsmo/cnU0MTw9nPlthORSI2VXK6ZI0gdJrLTs=;
 b=V8l4bCOKSM/aa0pIfQ4u7a2QZ3RZdPPefj/4fLpk3rJAI4PRc7WvB50hrNjnarRwVT
 1Nm7gFwi48LVZAkqOHFCvfT/DlJevtVHry5Po0wT69h+etvYC7+m8udHCERC9k1ufTSg
 kS7EzUNfRquyl0Pj255AStiLgAhqd3GtnJxfET9D2FmLkXwIMYXrFH5a9MZoYkDjAzpR
 DanYFoDZIkEkVH14Lb1rLL85wUgOJuOtPXsjjVu1i6PjLJfAgrUnQFyFnpCivSqB64Hb
 o1o9cmrxatYrrdYAqGMlnuciwNzzpiwyG2Ylg0bSCITnKTfAfbZRenKrDj/7xTf7YTbO
 /0dA==
X-Gm-Message-State: ACrzQf0SdEe7wDF88TXR2iLtr7/tjBCmmajGUv57fOXzrT7JBC2+fYFW
 5Sm2rdntQ2AuvHd1RbcDyfvxBElqSoY76wYwAQ9bez/5Q+CYugzI2FoYHCaRzzNfgMTQoAJK9Qy
 WVsqRs829u5DH0yQ5lL72tVSy7NLp5taIbC0w0neRbQ96w204y/ieRS+PUf2Z
X-Received: by 2002:a05:600c:2044:b0:3cf:570f:db5e with SMTP id
 p4-20020a05600c204400b003cf570fdb5emr33042301wmg.57.1667668763637; 
 Sat, 05 Nov 2022 10:19:23 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM6Y8TLF9y0GgJc5r6n8Tnul17c30w18uZru+WaVGNh0p4cZ7q/v4RY97NqiBEVFtaf8L0X9Mw==
X-Received: by 2002:a05:600c:2044:b0:3cf:570f:db5e with SMTP id
 p4-20020a05600c204400b003cf570fdb5emr33042275wmg.57.1667668763303; 
 Sat, 05 Nov 2022 10:19:23 -0700 (PDT)
Received: from redhat.com ([2.52.152.137]) by smtp.gmail.com with ESMTPSA id
 f11-20020a05600c4e8b00b003b435c41103sm9047262wmq.0.2022.11.05.10.19.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 05 Nov 2022 10:19:22 -0700 (PDT)
Date: Sat, 5 Nov 2022 13:19:20 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, Yajun Wu <yajunw@nvidia.com>,
 Parav Pandit <parav@nvidia.com>,
 Raphael Norwitz <raphael.norwitz@nutanix.com>,
 Kevin Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 Jason Wang <jasowang@redhat.com>, qemu-block@nongnu.org
Subject: [PULL v3 80/81] vhost: Change the sequence of device start
Message-ID: <20221105171116.432921-81-mst@redhat.com>
References: <20221105171116.432921-1-mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221105171116.432921-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.045,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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


