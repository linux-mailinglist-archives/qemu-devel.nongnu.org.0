Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 11B9A65E82E
	for <lists+qemu-devel@lfdr.de>; Thu,  5 Jan 2023 10:48:41 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pDMLA-0001mh-EZ; Thu, 05 Jan 2023 04:15:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pDML8-0001mX-MI
 for qemu-devel@nongnu.org; Thu, 05 Jan 2023 04:15:10 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pDML7-00071N-0M
 for qemu-devel@nongnu.org; Thu, 05 Jan 2023 04:15:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1672910108;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=eN1yqTd4dHMXJ+HTH4aU//xomIGR26HS+IfKzCf9oxk=;
 b=MsiAFZ/A2K1MbtE33o2+6IGmNKLL8LSKYMKubzEraue/MfBWHqsb54pQ+1OYD/YL/CaShq
 VtZa/yvvYUorHD+Pq32L13XP34xBrs8D3FUuSC4I5eb3FbCbwaPjHBjzJFkhUzPcEKVqjK
 OYubP+HVWV1lBVrG5XtdhbKtC2JVb24=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-55-2eBfqXVWMka35tE-RvyABA-1; Thu, 05 Jan 2023 04:15:07 -0500
X-MC-Unique: 2eBfqXVWMka35tE-RvyABA-1
Received: by mail-wr1-f71.google.com with SMTP id
 u15-20020adfa18f000000b002b129dc55bfso174888wru.11
 for <qemu-devel@nongnu.org>; Thu, 05 Jan 2023 01:15:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=eN1yqTd4dHMXJ+HTH4aU//xomIGR26HS+IfKzCf9oxk=;
 b=cOlwYyBFs6yTa/dO3/MFIj9RkA/dV6HR4JwjcuyHKtv5qef/gvhFcs8ubKXkFIieUm
 WINKcMELUgqKXgZ9ZlOA/mk2BwhHjYuFOj6S/yRPH9AmhmLBkGUYZPUpdHS0BTgUT98o
 kYik5YCxe88R5xKcF1eG775vBL0b+wr5o+iWX1hIbll2udDq1TKBDjYjnt4xaif8IaW9
 HjxyjY4Lv4EooykEDz+QYiBsxW0laBZ9n1twr4ZWZK+3539HN7N1W1+K816Ewl1IA5Rb
 RTt2RB/n1an+fRgopnVmRooAq/cBqybRzWn/QsUCYJn8y1IybWK6quKXQHc+/HOIShcV
 Ok/Q==
X-Gm-Message-State: AFqh2kqTLTGyA/L35CiAEoQI/GIBnd8NpFWXkPiybpoNWl2y9etD4Hyj
 72OpbzriqcjOWXnpqUFlq+ThPKiPqhkCoFtuS0hXNeiE72Ypz0JvjulH3oL2v60QLn1vZ2pQQqi
 FBrkrk8bv7zrH0XM3zQubqYc1AyY13Vxg+0sLQ9qPQKCm8ankJrN3bTGZe17E
X-Received: by 2002:a05:600c:3acc:b0:3d9:a145:91a with SMTP id
 d12-20020a05600c3acc00b003d9a145091amr14730690wms.28.1672910105461; 
 Thu, 05 Jan 2023 01:15:05 -0800 (PST)
X-Google-Smtp-Source: AMrXdXuCVvbZ2xPqVMxoKk6pvxhLXIysQdOFXtDZBcmxs+C84dGVhQWlOhGboVBvcLd7Iq8Q5oB7sQ==
X-Received: by 2002:a05:600c:3acc:b0:3d9:a145:91a with SMTP id
 d12-20020a05600c3acc00b003d9a145091amr14730667wms.28.1672910105130; 
 Thu, 05 Jan 2023 01:15:05 -0800 (PST)
Received: from redhat.com ([2.52.151.85]) by smtp.gmail.com with ESMTPSA id
 n14-20020a05600c3b8e00b003b49bd61b19sm1845253wms.15.2023.01.05.01.15.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Jan 2023 01:15:04 -0800 (PST)
Date: Thu, 5 Jan 2023 04:15:02 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Hyman =?utf-8?B?SHVhbmco6buE5YuHKQ==?= <huangy81@chinatelecom.cn>,
 Guoyi Tu <tugy@chinatelecom.cn>, Liuxiangdong <liuxiangdong5@huawei.com>,
 Jason Wang <jasowang@redhat.com>
Subject: [PULL 14/51] vhost-user: Fix the virtio features negotiation flaw
Message-ID: <20230105091310.263867-15-mst@redhat.com>
References: <20230105091310.263867-1-mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
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

From: Hyman Huang(黄勇) <huangy81@chinatelecom.cn>

This patch aims to fix unexpected negotiation features for
vhost-user netdev interface.

When openvswitch reconnect Qemu after an unexpected disconnection
and Qemu therefore start the vhost_dev, acked_features field in
vhost_dev is initialized with value fetched from acked_features
field in NetVhostUserState, which should be up-to-date at that
moment but Qemu could not make it actually during the time window
of virtio features negotiation.

So we save the acked_features right after being configured by
guest virtio driver so it can be used to restore acked_features
field in vhost_dev correctly.

Signed-off-by: Hyman Huang(黄勇) <huangy81@chinatelecom.cn>
Signed-off-by: Guoyi Tu <tugy@chinatelecom.cn>
Signed-off-by: Liuxiangdong <liuxiangdong5@huawei.com>
Message-Id: <b9f8cf5561a79ea65ea38960e5a5e6d3707eef0a.1671627406.git.huangy81@chinatelecom.cn>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 include/net/vhost_net.h | 2 ++
 hw/net/vhost_net-stub.c | 5 +++++
 hw/net/vhost_net.c      | 9 +++++++++
 hw/net/virtio-net.c     | 6 ++++++
 4 files changed, 22 insertions(+)

diff --git a/include/net/vhost_net.h b/include/net/vhost_net.h
index 40b9a40074..dfb13756cd 100644
--- a/include/net/vhost_net.h
+++ b/include/net/vhost_net.h
@@ -52,4 +52,6 @@ void vhost_net_virtqueue_reset(VirtIODevice *vdev, NetClientState *nc,
                                int vq_index);
 int vhost_net_virtqueue_restart(VirtIODevice *vdev, NetClientState *nc,
                                 int vq_index);
+
+void vhost_net_save_acked_features(NetClientState *nc);
 #endif
diff --git a/hw/net/vhost_net-stub.c b/hw/net/vhost_net-stub.c
index 9f7daae99c..66ed5f0b98 100644
--- a/hw/net/vhost_net-stub.c
+++ b/hw/net/vhost_net-stub.c
@@ -113,3 +113,8 @@ int vhost_net_virtqueue_restart(VirtIODevice *vdev, NetClientState *nc,
 {
     return 0;
 }
+
+void vhost_net_save_acked_features(NetClientState *nc)
+{
+
+}
diff --git a/hw/net/vhost_net.c b/hw/net/vhost_net.c
index 043058ff43..984b130e8f 100644
--- a/hw/net/vhost_net.c
+++ b/hw/net/vhost_net.c
@@ -144,6 +144,15 @@ uint64_t vhost_net_get_acked_features(VHostNetState *net)
     return net->dev.acked_features;
 }
 
+void vhost_net_save_acked_features(NetClientState *nc)
+{
+#ifdef CONFIG_VHOST_NET_USER
+    if (nc->info->type == NET_CLIENT_DRIVER_VHOST_USER) {
+        vhost_user_save_acked_features(nc);
+    }
+#endif
+}
+
 static int vhost_net_get_fd(NetClientState *backend)
 {
     switch (backend->info->type) {
diff --git a/hw/net/virtio-net.c b/hw/net/virtio-net.c
index 122eac25ee..b342d66160 100644
--- a/hw/net/virtio-net.c
+++ b/hw/net/virtio-net.c
@@ -984,6 +984,12 @@ static void virtio_net_set_features(VirtIODevice *vdev, uint64_t features)
             continue;
         }
         vhost_net_ack_features(get_vhost_net(nc->peer), features);
+
+        /*
+         * keep acked_features in NetVhostUserState up-to-date so it
+         * can't miss any features configured by guest virtio driver.
+         */
+        vhost_net_save_acked_features(nc->peer);
     }
 
     if (virtio_has_feature(features, VIRTIO_NET_F_CTRL_VLAN)) {
-- 
MST


