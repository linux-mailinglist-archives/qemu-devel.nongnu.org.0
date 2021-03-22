Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 61898344173
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Mar 2021 13:34:19 +0100 (CET)
Received: from localhost ([::1]:52954 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lOJlC-000749-FR
	for lists+qemu-devel@lfdr.de; Mon, 22 Mar 2021 08:34:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36960)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yuri.benditovich@daynix.com>)
 id 1lOJcN-00088n-Q1
 for qemu-devel@nongnu.org; Mon, 22 Mar 2021 08:25:16 -0400
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335]:39508)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <yuri.benditovich@daynix.com>)
 id 1lOJcH-0005bY-AB
 for qemu-devel@nongnu.org; Mon, 22 Mar 2021 08:25:11 -0400
Received: by mail-wm1-x335.google.com with SMTP id
 d8-20020a1c1d080000b029010f15546281so8980877wmd.4
 for <qemu-devel@nongnu.org>; Mon, 22 Mar 2021 05:25:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=fLcpOzPll1cJxC9iX7UzZaPl9AO2DsZ8ElInXHDxMfQ=;
 b=H7GT01aT++UN079YkvDUL6zrzORUuJ/doxaaQTSG3gXGO2aGrEnejp7wm8/q+Qm8OT
 7R+uzhEPByLzg1W/b/UnvOYq22N2sVQODLd/RPxTr7QNce89xX8AHRhKyRwCobWquolK
 5/ACP+ZuYR7iZJ88IkmzqKx7VGeZwCE5nwFLWVzFLuxCOQgKYWbflgxnMckKb+4F0P3O
 AlzUgtubeV9Z9ZITHOsrNEONqiBKmlghryLgAegLa75HxJaGhlCfYXqWnnhKTyKdwumq
 ItumckKubKzKcM1GJsnuJnGHUh/UWpb7tCJRbsNP8Ica2SkcwnCpu2BJhJFKHBiUC2Tb
 /qbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=fLcpOzPll1cJxC9iX7UzZaPl9AO2DsZ8ElInXHDxMfQ=;
 b=UtsWqplPyJjMZMWBqHrTRkm+J9vK5iaUfUrYJyfDaQ6qak/oj0gfOoF7JBvoETywDz
 UciZDliC5+egWqIxIkcb1GqTjqTlZodpvrlF+ztkHqdI7KZVH2qHHurS9gKNM44hjkhw
 Bo0Unr/tK9uOYXXKBARdWgWf9WeOF9lmwa98MPr2NDS3XH5YQ7HS3Qk4rxMMtG1VNBdy
 uqij8QxKCRoQ3ZaryRxrYINGdi+J5MtAlS8JGyB+arqTvdmaweDP1eHPM7pSKzIQYpdN
 7DXvc/pdkC6XzZTuQcE7+76nQj2vT6h6yJtaxk8gPbLRZx2t+8UsvorjCpeK6EgV49Sb
 6Qhw==
X-Gm-Message-State: AOAM530JoSTduDOYP5WQfYN0sYIRmQP2x96dhpaCAkqobD8fGg+ipuLw
 3cpM0q7Xy/1mg2NjHlwx08H+uz7rf+QRtw==
X-Google-Smtp-Source: ABdhPJxkdgglDKmf9rJLHgDXR+A5ndGrUeHqmVuTyR6SPGzXwH/Bfbpp0EWtIb0xZz6CINqxFnjnJg==
X-Received: by 2002:a1c:e388:: with SMTP id
 a130mr16166166wmh.187.1616415903558; 
 Mon, 22 Mar 2021 05:25:03 -0700 (PDT)
Received: from f1.Home (bzq-79-176-30-57.red.bezeqint.net. [79.176.30.57])
 by smtp.gmail.com with ESMTPSA id w132sm16785325wmg.39.2021.03.22.05.25.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Mar 2021 05:25:02 -0700 (PDT)
From: Yuri Benditovich <yuri.benditovich@daynix.com>
To: mst@redhat.com,
	jasowang@redhat.com,
	berrange@redhat.com
Subject: [RFC PATCH v2 3/3] virtio-net: implement missing_features_migrated
 callback
Date: Mon, 22 Mar 2021 14:24:52 +0200
Message-Id: <20210322122452.369750-4-yuri.benditovich@daynix.com>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210322122452.369750-1-yuri.benditovich@daynix.com>
References: <20210322122452.369750-1-yuri.benditovich@daynix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2a00:1450:4864:20::335;
 envelope-from=yuri.benditovich@daynix.com; helo=mail-wm1-x335.google.com
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
Cc: yan@daynix.com, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Graceful drop to userspace virtio in case selected features
are missing on the destination system. Currently used for
3 features that might be supported by the vhost kernel on
the source machine and not supported on the destination machine:
rss, hash reporting, packed ring.

Signed-off-by: Yuri Benditovich <yuri.benditovich@daynix.com>
---
 hw/net/virtio-net.c | 51 +++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 51 insertions(+)

diff --git a/hw/net/virtio-net.c b/hw/net/virtio-net.c
index 96a3cc8357..97afca34e7 100644
--- a/hw/net/virtio-net.c
+++ b/hw/net/virtio-net.c
@@ -527,6 +527,15 @@ static RxFilterInfo *virtio_net_query_rxfilter(NetClientState *nc)
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
@@ -564,6 +573,7 @@ static void virtio_net_reset(VirtIODevice *vdev)
             assert(!virtio_net_get_subqueue(nc)->async_tx.elem);
         }
     }
+    virtio_net_allow_vhost(n, true);
 }
 
 static void peer_test_vnet_hdr(VirtIONet *n)
@@ -701,6 +711,27 @@ static void virtio_net_set_queues(VirtIONet *n)
     }
 }
 
+static bool can_disable_vhost(VirtIONet *n)
+{
+    NetClientState *peer = qemu_get_queue(n->nic)->peer;
+    NetdevInfo *ndi;
+    if (!get_vhost_net(peer)) {
+        return false;
+    }
+    if (!peer) {
+        return true;
+    }
+    if (peer->info->type != NET_CLIENT_DRIVER_TAP) {
+        return false;
+    }
+    ndi = peer->stored_config;
+    if (ndi && ndi->u.tap.has_vhostforce && ndi->u.tap.vhostforce) {
+        printf("vhost forced, can't drop it\n");
+        return false;
+    }
+    return true;
+}
+
 static void virtio_net_set_multiqueue(VirtIONet *n, int multiqueue);
 
 static uint64_t virtio_net_get_features(VirtIODevice *vdev, uint64_t features,
@@ -3433,6 +3464,25 @@ static bool dev_unplug_pending(void *opaque)
     return vdc->primary_unplug_pending(dev);
 }
 
+static bool virtio_net_missing_features_migrated(VirtIODevice *vdev,
+                                                 uint64_t missing)
+{
+    VirtIONet *n = VIRTIO_NET(vdev);
+    bool disable_vhost = false;
+    if (virtio_has_feature(missing, VIRTIO_NET_F_HASH_REPORT) ||
+        virtio_has_feature(missing, VIRTIO_NET_F_RSS) ||
+        virtio_has_feature(missing, VIRTIO_F_RING_PACKED)) {
+        disable_vhost = true;
+    }
+    disable_vhost = disable_vhost && can_disable_vhost(n);
+    if (disable_vhost) {
+        warn_report("falling back to userspace virtio due to missing"
+                    " features %lx", missing);
+        virtio_net_allow_vhost(n, false);
+    }
+    return disable_vhost;
+}
+
 static const VMStateDescription vmstate_virtio_net = {
     .name = "virtio-net",
     .minimum_version_id = VIRTIO_NET_VM_VERSION,
@@ -3527,6 +3577,7 @@ static void virtio_net_class_init(ObjectClass *klass, void *data)
     vdc->get_features = virtio_net_get_features;
     vdc->set_features = virtio_net_set_features;
     vdc->bad_features = virtio_net_bad_features;
+    vdc->missing_features_migrated = virtio_net_missing_features_migrated;
     vdc->reset = virtio_net_reset;
     vdc->set_status = virtio_net_set_status;
     vdc->guest_notifier_mask = virtio_net_guest_notifier_mask;
-- 
2.26.2


