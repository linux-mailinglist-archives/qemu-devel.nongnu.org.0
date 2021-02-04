Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C55ED30FE6B
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Feb 2021 21:34:44 +0100 (CET)
Received: from localhost ([::1]:33418 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l7lKt-0003DU-Si
	for lists+qemu-devel@lfdr.de; Thu, 04 Feb 2021 15:34:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39430)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yuri.benditovich@daynix.com>)
 id 1l7lFv-0007Jq-55
 for qemu-devel@nongnu.org; Thu, 04 Feb 2021 15:29:36 -0500
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331]:53850)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <yuri.benditovich@daynix.com>)
 id 1l7lFs-0002ep-N8
 for qemu-devel@nongnu.org; Thu, 04 Feb 2021 15:29:34 -0500
Received: by mail-wm1-x331.google.com with SMTP id j11so4243486wmi.3
 for <qemu-devel@nongnu.org>; Thu, 04 Feb 2021 12:29:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=3sq4FAI5dt7o+cZJkil0F6/H4mLfESOkV51VC98s95A=;
 b=lzszdjTru2eXBOWLP2e0XhG1jwA4IgxnJ+Eg8CtI6aWXhXW1llJ2RkFD1HtXHmztVn
 yTFW1UoMF6FR+jNHOI+5pQKIxf20U9ZsoV8tWmfI8L1ZQpbLVopSC+cFzi/bcHQVpjc3
 +tKLS9n+xu2ATLwyLDTgKMFbqeB+NdTyKktVPkTIg7zH+gpNH0OkNgXCyG3t2CwAz3XY
 DSX8Q28ybMSyQOxo9jRMiM8d9NfRJp5OaooCldb8PqelzD6TEHCAJNd28AmIwqzLueZX
 02rkNy3qaW6xfCE1ijC06gVArsFbL3fNr7ds3dJux7sIyP1wxb1ekl4Fx4t7PLUQrWj9
 K8mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=3sq4FAI5dt7o+cZJkil0F6/H4mLfESOkV51VC98s95A=;
 b=oi/B9SQT7Pe3Q+sARMrnlqeJSZWNh78qP6WSxFqQDtC9L8hf1hfUxr8p40/kfaIn6J
 jEYajrNSiE0G7fBoZ/zJ6V4Yu7DjLKbKaBvM6Q461MXfNCPt01sfKbBt99CILO1/2nCd
 7JASdIEXiKxVEMREUHH9Hjvr7v9z5NPRNZ9jq/hHqCWD3reKTP/gdotQclTYdnFp6MlG
 brZz+JawSXrR+/w/Eoov/zabIOg0tFWaOdMW9ACTS17qtP2USwnpxf4PuV+uTO0eN3Ld
 BB16+QopPIDW9ZZLZCiKVtv39AC66zvnYkA7L7TwD87Pv0VCrnCboMmybgXHnGT8pi/P
 K2yQ==
X-Gm-Message-State: AOAM532vcH5MdcRno1M4Qh3p+COFK6F5vfn0ViEYXQTtAaYwFoF7M7Gm
 STn3IHUekYYnqV9YPs4B1CO1TyjEg29y2A==
X-Google-Smtp-Source: ABdhPJyEX2UW0LppG7uTBhww97aSf51oviyMOc+L797TpcyhzstQjjErEgGKfMIUWEtXi/g+fDVF2g==
X-Received: by 2002:a1c:cc14:: with SMTP id h20mr782936wmb.180.1612470570651; 
 Thu, 04 Feb 2021 12:29:30 -0800 (PST)
Received: from f2.Home (bzq-109-64-9-177.red.bezeqint.net. [109.64.9.177])
 by smtp.gmail.com with ESMTPSA id f7sm8807834wre.78.2021.02.04.12.29.29
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Thu, 04 Feb 2021 12:29:30 -0800 (PST)
From: Yuri Benditovich <yuri.benditovich@daynix.com>
To: mst@redhat.com,
	jasowang@redhat.com,
	qemu-devel@nongnu.org
Subject: [PATCH 3/3] virtio-net: graceful fallback to vhost=off for tap netdev
Date: Thu,  4 Feb 2021 22:29:15 +0200
Message-Id: <20210204202915.15925-4-yuri.benditovich@daynix.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210204202915.15925-1-yuri.benditovich@daynix.com>
References: <20210204202915.15925-1-yuri.benditovich@daynix.com>
Received-SPF: none client-ip=2a00:1450:4864:20::331;
 envelope-from=yuri.benditovich@daynix.com; helo=mail-wm1-x331.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: yan@daynix.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Currently virtio-net silently clears features if they are
not supported by respective vhost. This may create migration
problems in future if vhost features on the source and destination
are different. Implement graceful fallback to no-vhost mode
when some acked features contradict with vhost. The decision is
taken on set_features call and the vhost will be disabled
till next reset (or migration).
Such fallback is currently enabled only for TAP netdev.

Signed-off-by: Yuri Benditovich <yuri.benditovich@daynix.com>
---
 hw/net/virtio-net.c | 58 ++++++++++++++++++++++++++++++++++++++-------
 1 file changed, 50 insertions(+), 8 deletions(-)

diff --git a/hw/net/virtio-net.c b/hw/net/virtio-net.c
index 5150f295e8..b353060e63 100644
--- a/hw/net/virtio-net.c
+++ b/hw/net/virtio-net.c
@@ -515,6 +515,15 @@ static RxFilterInfo *virtio_net_query_rxfilter(NetClientState *nc)
     return info;
 }
 
+static void virtio_net_allow_vhost(VirtIONet *n, bool allow)
+{
+    int i;
+    for (i = 0; i < n->max_queues; i++) {
+        NetClientState *nc = qemu_get_subqueue(n->nic, i)->peer;
+        nc->vhost_net_disabled = !allow;
+    }
+}
+
 static void virtio_net_reset(VirtIODevice *vdev)
 {
     VirtIONet *n = VIRTIO_NET(vdev);
@@ -552,6 +561,7 @@ static void virtio_net_reset(VirtIODevice *vdev)
             assert(!virtio_net_get_subqueue(nc)->async_tx.elem);
         }
     }
+    virtio_net_allow_vhost(n, true);
 }
 
 static void peer_test_vnet_hdr(VirtIONet *n)
@@ -689,6 +699,15 @@ static void virtio_net_set_queues(VirtIONet *n)
     }
 }
 
+static bool can_disable_vhost(VirtIONet *n)
+{
+    NetClientState *peer = qemu_get_queue(n->nic)->peer;
+    if (!get_vhost_net(peer)) {
+        return false;
+    }
+    return !peer || peer->info->type == NET_CLIENT_DRIVER_TAP;
+}
+
 static void virtio_net_set_multiqueue(VirtIONet *n, int multiqueue);
 
 static uint64_t virtio_net_get_features(VirtIODevice *vdev, uint64_t features,
@@ -725,14 +744,14 @@ static uint64_t virtio_net_get_features(VirtIODevice *vdev, uint64_t features,
         return features;
     }
 
-    virtio_clear_feature(&features, VIRTIO_NET_F_RSS);
-    virtio_clear_feature(&features, VIRTIO_NET_F_HASH_REPORT);
-    features = vhost_net_get_features(get_vhost_net(nc->peer), features);
-    vdev->backend_features = features;
+    vdev->backend_features = vhost_net_get_features(get_vhost_net(nc->peer), features);
 
-    if (n->mtu_bypass_backend &&
-            (n->host_features & 1ULL << VIRTIO_NET_F_MTU)) {
-        features |= (1ULL << VIRTIO_NET_F_MTU);
+    if (!can_disable_vhost(n)) {
+        features = vdev->backend_features;
+        if (n->mtu_bypass_backend &&
+                (n->host_features & 1ULL << VIRTIO_NET_F_MTU)) {
+            features |= (1ULL << VIRTIO_NET_F_MTU);
+        }
     }
 
     return features;
@@ -872,10 +891,25 @@ static void failover_add_primary(VirtIONet *n, Error **errp)
     error_propagate(errp, err);
 }
 
+static bool check_vhost_features(VirtIONet *n, uint64_t features)
+{
+    NetClientState *nc = qemu_get_queue(n->nic);
+    uint64_t filtered;
+    if (n->rss_data.redirect) {
+        return false;
+    }
+    filtered = vhost_net_get_features(get_vhost_net(nc->peer), features);
+    if (filtered != features) {
+        return false;
+    }
+    return true;
+}
+
 static void virtio_net_set_features(VirtIODevice *vdev, uint64_t features)
 {
     VirtIONet *n = VIRTIO_NET(vdev);
     Error *err = NULL;
+    bool disable_vhost = false;
     int i;
 
     if (n->mtu_bypass_backend &&
@@ -894,13 +928,21 @@ static void virtio_net_set_features(VirtIODevice *vdev, uint64_t features)
                                                   VIRTIO_F_VERSION_1),
                                virtio_has_feature(features,
                                                   VIRTIO_NET_F_HASH_REPORT));
-
     n->rsc4_enabled = virtio_has_feature(features, VIRTIO_NET_F_RSC_EXT) &&
         virtio_has_feature(features, VIRTIO_NET_F_GUEST_TSO4);
     n->rsc6_enabled = virtio_has_feature(features, VIRTIO_NET_F_RSC_EXT) &&
         virtio_has_feature(features, VIRTIO_NET_F_GUEST_TSO6);
     n->rss_data.redirect = virtio_has_feature(features, VIRTIO_NET_F_RSS);
 
+    if (can_disable_vhost(n)) {
+        disable_vhost = !check_vhost_features(n, features);
+    }
+    if (disable_vhost) {
+        warn_report("Some of requested features aren't supported by vhost, "
+                    "vhost is turned off till next reset");
+        virtio_net_allow_vhost(n, false);
+    }
+
     if (n->has_vnet_hdr) {
         n->curr_guest_offloads =
             virtio_net_guest_offloads_by_features(features);
-- 
2.17.1


