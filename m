Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2265465316D
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Dec 2022 14:12:05 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p7ymc-00050y-7X; Wed, 21 Dec 2022 08:05:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1p7ymZ-0004uq-NP
 for qemu-devel@nongnu.org; Wed, 21 Dec 2022 08:05:15 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1p7ymY-0004Be-3H
 for qemu-devel@nongnu.org; Wed, 21 Dec 2022 08:05:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1671627913;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3YYvQuV9NjFer8IKuqn0SNpGsEGQ1A08fufUyI2v30E=;
 b=M97V6bRXhSITAZiokBNbq5YJG0nQ3FxfdCbb1ZJpkIiDbExKrWvjTcX2XnsqjW+4gjRtHB
 S2+ROlu9UYFCazg/+UDvP7XTpNbSgY0ZHZbRuyKv2pq1ZEGcbogZUcMMmO+939QdUFZDuJ
 3EjnZVnRZlAiV/gpiiu7hHY/E0UupFg=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-629-8kyMBoTiO1e0yp7woScAXg-1; Wed, 21 Dec 2022 08:05:12 -0500
X-MC-Unique: 8kyMBoTiO1e0yp7woScAXg-1
Received: by mail-wm1-f72.google.com with SMTP id
 x10-20020a05600c420a00b003cfa33f2e7cso7929947wmh.2
 for <qemu-devel@nongnu.org>; Wed, 21 Dec 2022 05:05:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=3YYvQuV9NjFer8IKuqn0SNpGsEGQ1A08fufUyI2v30E=;
 b=dkUOogn0j1RSvVea9rACLrVh4FxdneWlZ4Um/ZIh5EGawCJ+UVqcrpROWEiN8BxbVg
 KgiN7dCv4LWoxM+FHvQnz2K3Wk0yVGXAW9TfjGdYwl1yMMgjG/62AIbfIpR+JKr6K122
 kTh2f9ow4RTHymFwrkqbfUoua2xYwhkZgKV73rMXykY24Su0IVpeaXuyeZsZCtdpGsa0
 4FIxXG6t4tPXU1dN22hV9BvwUR3fvn1WSgULZjsb2YlNxmzVswZI5nSvRDTVJK00B2J7
 eQnDN9UdgW8knl3c7Uwig1Zkw7+IUTBA6d5HcHoNFNGkciqW2dJn9wgI3DgFrCUwwc1S
 R8kQ==
X-Gm-Message-State: AFqh2krij8G5YoE/TWH4M/xKb6tsV9z7sBVLTe2VLe0CTX7wKkbtZS0R
 aNL3RADru4DI1BZAZrFR9NH/6zhcnk9F0fgW2MopVPeJApJ46I6AmyP1SyMC+Ohutvfpf3A5u1f
 1Q2M42S4QmZ6Fw0is9UNmnVgP0jArjmzh/E7AeEiANLbSuTSda3KpcJy7qiXU
X-Received: by 2002:a05:600c:5c8:b0:3d1:4145:b3b with SMTP id
 p8-20020a05600c05c800b003d141450b3bmr1647064wmd.9.1671627910096; 
 Wed, 21 Dec 2022 05:05:10 -0800 (PST)
X-Google-Smtp-Source: AMrXdXv9leFMCHUpR2RHMQ/dBvG81zIek5ta9qEE3kH8oepHLnNO94PoL+pyqdemFtgsY2l1AC1XGA==
X-Received: by 2002:a05:600c:5c8:b0:3d1:4145:b3b with SMTP id
 p8-20020a05600c05c800b003d141450b3bmr1647039wmd.9.1671627909815; 
 Wed, 21 Dec 2022 05:05:09 -0800 (PST)
Received: from redhat.com ([2.52.8.61]) by smtp.gmail.com with ESMTPSA id
 f18-20020a05600c4e9200b003d35c845cbbsm2677441wmq.21.2022.12.21.05.05.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Dec 2022 05:05:09 -0800 (PST)
Date: Wed, 21 Dec 2022 08:05:07 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Eugenio =?utf-8?B?UMOpcmV6?= <eperezma@redhat.com>,
 Jason Wang <jasowang@redhat.com>
Subject: [PULL 13/41] vhost: set SVQ device call handler at SVQ start
Message-ID: <20221221130339.1234592-14-mst@redhat.com>
References: <20221221130339.1234592-1-mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20221221130339.1234592-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Eugenio Pérez <eperezma@redhat.com>

By the end of this series CVQ is shadowed as long as the features
support it.

Since we don't know at the beginning of qemu running if this is
supported, move the event notifier handler setting to the start of the
SVQ, instead of the start of qemu run. This will avoid to create them if
the device does not support SVQ.

Signed-off-by: Eugenio Pérez <eperezma@redhat.com>
Acked-by: Jason Wang <jasowang@redhat.com>
Message-Id: <20221215113144.322011-3-eperezma@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 hw/virtio/vhost-shadow-virtqueue.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/hw/virtio/vhost-shadow-virtqueue.c b/hw/virtio/vhost-shadow-virtqueue.c
index 5bd14cad96..264ddc166d 100644
--- a/hw/virtio/vhost-shadow-virtqueue.c
+++ b/hw/virtio/vhost-shadow-virtqueue.c
@@ -648,6 +648,7 @@ void vhost_svq_start(VhostShadowVirtqueue *svq, VirtIODevice *vdev,
 {
     size_t desc_size, driver_size, device_size;
 
+    event_notifier_set_handler(&svq->hdev_call, vhost_svq_handle_call);
     svq->next_guest_avail_elem = NULL;
     svq->shadow_avail_idx = 0;
     svq->shadow_used_idx = 0;
@@ -704,6 +705,7 @@ void vhost_svq_stop(VhostShadowVirtqueue *svq)
     g_free(svq->desc_state);
     qemu_vfree(svq->vring.desc);
     qemu_vfree(svq->vring.used);
+    event_notifier_set_handler(&svq->hdev_call, NULL);
 }
 
 /**
@@ -740,7 +742,6 @@ VhostShadowVirtqueue *vhost_svq_new(VhostIOVATree *iova_tree,
     }
 
     event_notifier_init_fd(&svq->svq_kick, VHOST_FILE_UNBIND);
-    event_notifier_set_handler(&svq->hdev_call, vhost_svq_handle_call);
     svq->iova_tree = iova_tree;
     svq->ops = ops;
     svq->ops_opaque = ops_opaque;
@@ -763,7 +764,6 @@ void vhost_svq_free(gpointer pvq)
     VhostShadowVirtqueue *vq = pvq;
     vhost_svq_stop(vq);
     event_notifier_cleanup(&vq->hdev_kick);
-    event_notifier_set_handler(&vq->hdev_call, NULL);
     event_notifier_cleanup(&vq->hdev_call);
     g_free(vq);
 }
-- 
MST


