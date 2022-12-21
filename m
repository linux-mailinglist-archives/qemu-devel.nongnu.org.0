Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DE27165317F
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Dec 2022 14:15:40 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p7ynk-0006TQ-BU; Wed, 21 Dec 2022 08:06:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1p7ynL-0005yB-1G
 for qemu-devel@nongnu.org; Wed, 21 Dec 2022 08:06:06 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1p7ynH-0004M6-EC
 for qemu-devel@nongnu.org; Wed, 21 Dec 2022 08:06:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1671627956;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=AEExUP7Yaybul4iiosvJ0BGVJmerv5rWrbMqlh81EYg=;
 b=FCO4d2/yeAORlMmSyHjvIYtglSOdk9BkRjVsoGK8qVBH45aLTNhjiB6jOhibJ7CcOTvlZY
 zQmuwu7CgTMbTI8WdndWwLMVpfZffDkP68UKIWoeE1EagqQt5B0LbvadezQ2B2zQhM9os0
 sqBtqOhVrnG8ODzAOhHrqKTcZdZ0F0g=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-471-Zm4MCBwuO2SycUkqdbS1Cg-1; Wed, 21 Dec 2022 08:05:48 -0500
X-MC-Unique: Zm4MCBwuO2SycUkqdbS1Cg-1
Received: by mail-wm1-f71.google.com with SMTP id
 g9-20020a7bc4c9000000b003d214cffa4eso669025wmk.5
 for <qemu-devel@nongnu.org>; Wed, 21 Dec 2022 05:05:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=AEExUP7Yaybul4iiosvJ0BGVJmerv5rWrbMqlh81EYg=;
 b=Mr6iP8drpJtJAg0FpKpK1e3w5uQ2G1KGk1b+kHmo6HOQj4h3+1OL1TnElbdMtaHW4y
 PB0uNSr8aFNc+bhq/dJlTTI1IDNZSpf2U6JUEOqYjIpcHGwJF5lKZAKlqg9bKhSw1mvZ
 kTpQnNCH8PAeRro8ltWQ4QVMyIU9rCElrAgTE385f0fodoNw88FYHdCZvaoz5mb3bVKN
 /eVqoofIDwgV7yARfLbfM2YGiw0EO/BcMkA07Rom7y0/UB58k4ZITS4Kgpun3zv1oE0r
 jIVnzmVY9SKpwQNnGfvwhWE3CtF4HrgSwQD9KPnv3WaZvWdVVWwSpqeEWN+d5U0Za/sg
 H5gw==
X-Gm-Message-State: AFqh2kpj9MsZ0ZE5lI9bgiyctDh4PgAKfg46YwHPaLe9GaDlzRcp/i/4
 fthBqKK32nLcObQVUioJbkZP0fpit0P6YyZax4kxxrr5hQHWY1I+2em3x8Z1fEbQg8D4Z75NpvM
 QWKOeeZMkvyK7JyvKsvYLbSZv1A024ncKK9g160zoyq228XKjK0BwGcdEv3VB
X-Received: by 2002:a05:600c:1f18:b0:3cf:5583:8b3f with SMTP id
 bd24-20020a05600c1f1800b003cf55838b3fmr1579058wmb.20.1671627947056; 
 Wed, 21 Dec 2022 05:05:47 -0800 (PST)
X-Google-Smtp-Source: AMrXdXstFZYxXbVVMTbQsIX6EOwJMrLZuGWa/0FxYFgn8EzkU/gF4ahFLBt305+dl6UtSK3CI7Ee5A==
X-Received: by 2002:a05:600c:1f18:b0:3cf:5583:8b3f with SMTP id
 bd24-20020a05600c1f1800b003cf55838b3fmr1579045wmb.20.1671627946808; 
 Wed, 21 Dec 2022 05:05:46 -0800 (PST)
Received: from redhat.com ([2.52.8.61]) by smtp.gmail.com with ESMTPSA id
 m28-20020a05600c3b1c00b003d1e3b1624dsm2492552wms.2.2022.12.21.05.05.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Dec 2022 05:05:46 -0800 (PST)
Date: Wed, 21 Dec 2022 08:05:44 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Eugenio =?utf-8?B?UMOpcmV6?= <eperezma@redhat.com>,
 Jason Wang <jasowang@redhat.com>
Subject: [PULL 23/41] vdpa: always start CVQ in SVQ mode if possible
Message-ID: <20221221130339.1234592-24-mst@redhat.com>
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

Isolate control virtqueue in its own group, allowing to intercept control
commands but letting dataplane run totally passthrough to the guest.

Signed-off-by: Eugenio Pérez <eperezma@redhat.com>
Message-Id: <20221215113144.322011-13-eperezma@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
Acked-by: Jason Wang <jasowang@redhat.com>
---
 hw/virtio/vhost-vdpa.c |   3 +-
 net/vhost-vdpa.c       | 110 ++++++++++++++++++++++++++++++++++++++++-
 2 files changed, 111 insertions(+), 2 deletions(-)

diff --git a/hw/virtio/vhost-vdpa.c b/hw/virtio/vhost-vdpa.c
index 20d9575e4f..fd0c33b0e1 100644
--- a/hw/virtio/vhost-vdpa.c
+++ b/hw/virtio/vhost-vdpa.c
@@ -638,7 +638,8 @@ static int vhost_vdpa_set_backend_cap(struct vhost_dev *dev)
 {
     uint64_t features;
     uint64_t f = 0x1ULL << VHOST_BACKEND_F_IOTLB_MSG_V2 |
-        0x1ULL << VHOST_BACKEND_F_IOTLB_BATCH;
+        0x1ULL << VHOST_BACKEND_F_IOTLB_BATCH |
+        0x1ULL << VHOST_BACKEND_F_IOTLB_ASID;
     int r;
 
     if (vhost_vdpa_call(dev, VHOST_GET_BACKEND_FEATURES, &features)) {
diff --git a/net/vhost-vdpa.c b/net/vhost-vdpa.c
index 710c5efe96..d36664f33a 100644
--- a/net/vhost-vdpa.c
+++ b/net/vhost-vdpa.c
@@ -102,6 +102,8 @@ static const uint64_t vdpa_svq_device_features =
     BIT_ULL(VIRTIO_NET_F_RSC_EXT) |
     BIT_ULL(VIRTIO_NET_F_STANDBY);
 
+#define VHOST_VDPA_NET_CVQ_ASID 1
+
 VHostNetState *vhost_vdpa_get_vhost_net(NetClientState *nc)
 {
     VhostVDPAState *s = DO_UPCAST(VhostVDPAState, nc, nc);
@@ -243,6 +245,40 @@ static NetClientInfo net_vhost_vdpa_info = {
         .check_peer_type = vhost_vdpa_check_peer_type,
 };
 
+static int64_t vhost_vdpa_get_vring_group(int device_fd, unsigned vq_index)
+{
+    struct vhost_vring_state state = {
+        .index = vq_index,
+    };
+    int r = ioctl(device_fd, VHOST_VDPA_GET_VRING_GROUP, &state);
+
+    if (unlikely(r < 0)) {
+        error_report("Cannot get VQ %u group: %s", vq_index,
+                     g_strerror(errno));
+        return r;
+    }
+
+    return state.num;
+}
+
+static int vhost_vdpa_set_address_space_id(struct vhost_vdpa *v,
+                                           unsigned vq_group,
+                                           unsigned asid_num)
+{
+    struct vhost_vring_state asid = {
+        .index = vq_group,
+        .num = asid_num,
+    };
+    int r;
+
+    r = ioctl(v->device_fd, VHOST_VDPA_SET_GROUP_ASID, &asid);
+    if (unlikely(r < 0)) {
+        error_report("Can't set vq group %u asid %u, errno=%d (%s)",
+                     asid.index, asid.num, errno, g_strerror(errno));
+    }
+    return r;
+}
+
 static void vhost_vdpa_cvq_unmap_buf(struct vhost_vdpa *v, void *addr)
 {
     VhostIOVATree *tree = v->iova_tree;
@@ -317,11 +353,75 @@ dma_map_err:
 static int vhost_vdpa_net_cvq_start(NetClientState *nc)
 {
     VhostVDPAState *s;
-    int r;
+    struct vhost_vdpa *v;
+    uint64_t backend_features;
+    int64_t cvq_group;
+    int cvq_index, r;
 
     assert(nc->info->type == NET_CLIENT_DRIVER_VHOST_VDPA);
 
     s = DO_UPCAST(VhostVDPAState, nc, nc);
+    v = &s->vhost_vdpa;
+
+    v->shadow_data = s->always_svq;
+    v->shadow_vqs_enabled = s->always_svq;
+    s->vhost_vdpa.address_space_id = VHOST_VDPA_GUEST_PA_ASID;
+
+    if (s->always_svq) {
+        /* SVQ is already configured for all virtqueues */
+        goto out;
+    }
+
+    /*
+     * If we early return in these cases SVQ will not be enabled. The migration
+     * will be blocked as long as vhost-vdpa backends will not offer _F_LOG.
+     *
+     * Calling VHOST_GET_BACKEND_FEATURES as they are not available in v->dev
+     * yet.
+     */
+    r = ioctl(v->device_fd, VHOST_GET_BACKEND_FEATURES, &backend_features);
+    if (unlikely(r < 0)) {
+        error_report("Cannot get vdpa backend_features: %s(%d)",
+            g_strerror(errno), errno);
+        return -1;
+    }
+    if (!(backend_features & VHOST_BACKEND_F_IOTLB_ASID) ||
+        !vhost_vdpa_net_valid_svq_features(v->dev->features, NULL)) {
+        return 0;
+    }
+
+    /*
+     * Check if all the virtqueues of the virtio device are in a different vq
+     * than the last vq. VQ group of last group passed in cvq_group.
+     */
+    cvq_index = v->dev->vq_index_end - 1;
+    cvq_group = vhost_vdpa_get_vring_group(v->device_fd, cvq_index);
+    if (unlikely(cvq_group < 0)) {
+        return cvq_group;
+    }
+    for (int i = 0; i < cvq_index; ++i) {
+        int64_t group = vhost_vdpa_get_vring_group(v->device_fd, i);
+
+        if (unlikely(group < 0)) {
+            return group;
+        }
+
+        if (group == cvq_group) {
+            return 0;
+        }
+    }
+
+    r = vhost_vdpa_set_address_space_id(v, cvq_group, VHOST_VDPA_NET_CVQ_ASID);
+    if (unlikely(r < 0)) {
+        return r;
+    }
+
+    v->iova_tree = vhost_iova_tree_new(v->iova_range.first,
+                                       v->iova_range.last);
+    v->shadow_vqs_enabled = true;
+    s->vhost_vdpa.address_space_id = VHOST_VDPA_NET_CVQ_ASID;
+
+out:
     if (!s->vhost_vdpa.shadow_vqs_enabled) {
         return 0;
     }
@@ -350,6 +450,14 @@ static void vhost_vdpa_net_cvq_stop(NetClientState *nc)
     if (s->vhost_vdpa.shadow_vqs_enabled) {
         vhost_vdpa_cvq_unmap_buf(&s->vhost_vdpa, s->cvq_cmd_out_buffer);
         vhost_vdpa_cvq_unmap_buf(&s->vhost_vdpa, s->status);
+        if (!s->always_svq) {
+            /*
+             * If only the CVQ is shadowed we can delete this safely.
+             * If all the VQs are shadows this will be needed by the time the
+             * device is started again to register SVQ vrings and similar.
+             */
+            g_clear_pointer(&s->vhost_vdpa.iova_tree, vhost_iova_tree_delete);
+        }
     }
 }
 
-- 
MST


