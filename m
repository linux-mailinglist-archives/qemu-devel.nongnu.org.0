Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BAB2765E7B8
	for <lists+qemu-devel@lfdr.de>; Thu,  5 Jan 2023 10:25:18 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pDMLk-0002Vh-Do; Thu, 05 Jan 2023 04:15:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pDMLe-0002PC-Tx
 for qemu-devel@nongnu.org; Thu, 05 Jan 2023 04:15:43 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pDMLc-0007At-Pe
 for qemu-devel@nongnu.org; Thu, 05 Jan 2023 04:15:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1672910140;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Ti5mHEuUeGoPKkCa8ZRTnHusVq2zl8pzj2H8pELjLkI=;
 b=Ry/NbDrDRXOVSWrSR6WpfGfIt4xHXfkeUtiq1vcf/OqI1qr/qOUIydUgFna1IToexYu19v
 uxXcYzWX5pT7dj15V5lw8mf6Dt9bZKWsvVhLxk+LVort5MvnRvAfyEQwSEOM1PIEVNGDFF
 j2ksJDwo7tVk53B0z6VEdVlk2dKWKYg=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-27-uzIwfN3eMKSZ1R_ISXspTw-1; Thu, 05 Jan 2023 04:15:31 -0500
X-MC-Unique: uzIwfN3eMKSZ1R_ISXspTw-1
Received: by mail-wm1-f70.google.com with SMTP id
 m38-20020a05600c3b2600b003d23f8c6ebdso1263171wms.0
 for <qemu-devel@nongnu.org>; Thu, 05 Jan 2023 01:15:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Ti5mHEuUeGoPKkCa8ZRTnHusVq2zl8pzj2H8pELjLkI=;
 b=QnTYBkljV//2EtbYjvax9bl5YXpWWNt2SFA8+/BRrnPXyFS8W6Pr4HdSCQoch9paeT
 BsxBtZLFTLTcWQZwhOk88CbRkDkonBEl2JAXpymnSGXp2X04AjVyI+gIYzEb/UGISYx7
 tTpuFHosmMxrFCJ1A51QHg0LTPGBJjfKmzAT7+UW0RoKv2hmcYvUDqiO+dXI3WgeRMj8
 ZHAURsyFIGGxwCoBobT9sYnKuds/wHtP+LB0ZhamPrCOX6EbKmCzOruHswZnfdV+tCtU
 XU6gINl7rNYscuepWBZH/6cwS4xoPoj3jGvg53bNSVatWX+dVjfeKgXC1EmfKmPfgsIe
 vxMg==
X-Gm-Message-State: AFqh2koQuDbiZecV33tTvRvVhdSDF/95jDpnjKvjVB5erQo0OBVCBsx4
 5Mw9v7De0LnBaIabBx0wSijk6aTGB9oitRAPHfS4XQiXMcYqgEaYeJXIpMERJ7NE3lLfg3rStWP
 5hXEalfGC/jq/M6FiLBVlqzc+fOvw4CrW4QSeepULY389Tehxl3UgzYzFBWT6
X-Received: by 2002:a5d:4387:0:b0:26f:2fb:7f88 with SMTP id
 i7-20020a5d4387000000b0026f02fb7f88mr32129229wrq.33.1672910129882; 
 Thu, 05 Jan 2023 01:15:29 -0800 (PST)
X-Google-Smtp-Source: AMrXdXu20t7vrACMrJxqZF0qjCNGfKc8h3Fnr5Zt0FjnbG5hk3X3U7v9Qgp25osNIrtUif2hPcX0Kw==
X-Received: by 2002:a5d:4387:0:b0:26f:2fb:7f88 with SMTP id
 i7-20020a5d4387000000b0026f02fb7f88mr32129202wrq.33.1672910129470; 
 Thu, 05 Jan 2023 01:15:29 -0800 (PST)
Received: from redhat.com ([2.52.151.85]) by smtp.gmail.com with ESMTPSA id
 n14-20020a5d484e000000b00242814c2cf0sm36160386wrs.4.2023.01.05.01.15.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Jan 2023 01:15:29 -0800 (PST)
Date: Thu, 5 Jan 2023 04:15:26 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, Cindy Lu <lulu@redhat.com>,
 Jason Wang <jasowang@redhat.com>
Subject: [PULL 22/51] virtio-net: add support for configure interrupt
Message-ID: <20230105091310.263867-23-mst@redhat.com>
References: <20230105091310.263867-1-mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230105091310.263867-1-mst@redhat.com>
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

From: Cindy Lu <lulu@redhat.com>

Add functions to support configure interrupt in virtio_net
Add the functions to support vhost_net_config_pending
and vhost_net_config_mask.

Signed-off-by: Cindy Lu <lulu@redhat.com>
Message-Id: <20221222070451.936503-9-lulu@redhat.com>
Acked-by: Jason Wang <jasowang@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 include/net/vhost_net.h | 2 ++
 hw/net/vhost_net-stub.c | 9 +++++++++
 hw/net/vhost_net.c      | 9 +++++++++
 hw/net/virtio-net.c     | 4 ++--
 4 files changed, 22 insertions(+), 2 deletions(-)

diff --git a/include/net/vhost_net.h b/include/net/vhost_net.h
index dfb13756cd..c37aba35e6 100644
--- a/include/net/vhost_net.h
+++ b/include/net/vhost_net.h
@@ -39,6 +39,8 @@ int vhost_net_set_config(struct vhost_net *net, const uint8_t *data,
 bool vhost_net_virtqueue_pending(VHostNetState *net, int n);
 void vhost_net_virtqueue_mask(VHostNetState *net, VirtIODevice *dev,
                               int idx, bool mask);
+bool vhost_net_config_pending(VHostNetState *net);
+void vhost_net_config_mask(VHostNetState *net, VirtIODevice *dev, bool mask);
 int vhost_net_notify_migration_done(VHostNetState *net, char* mac_addr);
 VHostNetState *get_vhost_net(NetClientState *nc);
 
diff --git a/hw/net/vhost_net-stub.c b/hw/net/vhost_net-stub.c
index 66ed5f0b98..72df6d757e 100644
--- a/hw/net/vhost_net-stub.c
+++ b/hw/net/vhost_net-stub.c
@@ -82,6 +82,15 @@ void vhost_net_virtqueue_mask(VHostNetState *net, VirtIODevice *dev,
 {
 }
 
+bool vhost_net_config_pending(VHostNetState *net)
+{
+    return false;
+}
+
+void vhost_net_config_mask(VHostNetState *net, VirtIODevice *dev, bool mask)
+{
+}
+
 int vhost_net_notify_migration_done(struct vhost_net *net, char* mac_addr)
 {
     return -1;
diff --git a/hw/net/vhost_net.c b/hw/net/vhost_net.c
index 984b130e8f..c4eecc6f36 100644
--- a/hw/net/vhost_net.c
+++ b/hw/net/vhost_net.c
@@ -487,6 +487,15 @@ void vhost_net_virtqueue_mask(VHostNetState *net, VirtIODevice *dev,
     vhost_virtqueue_mask(&net->dev, dev, idx, mask);
 }
 
+bool vhost_net_config_pending(VHostNetState *net)
+{
+    return vhost_config_pending(&net->dev);
+}
+
+void vhost_net_config_mask(VHostNetState *net, VirtIODevice *dev, bool mask)
+{
+    vhost_config_mask(&net->dev, dev, mask);
+}
 VHostNetState *get_vhost_net(NetClientState *nc)
 {
     VHostNetState *vhost_net = 0;
diff --git a/hw/net/virtio-net.c b/hw/net/virtio-net.c
index 0bfe454c23..f191e3037f 100644
--- a/hw/net/virtio-net.c
+++ b/hw/net/virtio-net.c
@@ -3332,7 +3332,7 @@ static bool virtio_net_guest_notifier_pending(VirtIODevice *vdev, int idx)
      */
 
     if (idx == VIRTIO_CONFIG_IRQ_IDX) {
-        return false;
+        return vhost_net_config_pending(get_vhost_net(nc->peer));
     }
     return vhost_net_virtqueue_pending(get_vhost_net(nc->peer), idx);
 }
@@ -3364,9 +3364,9 @@ static void virtio_net_guest_notifier_mask(VirtIODevice *vdev, int idx,
      */
 
     if (idx == VIRTIO_CONFIG_IRQ_IDX) {
+        vhost_net_config_mask(get_vhost_net(nc->peer), vdev, mask);
         return;
     }
-
     vhost_net_virtqueue_mask(get_vhost_net(nc->peer), vdev, idx, mask);
 }
 
-- 
MST


