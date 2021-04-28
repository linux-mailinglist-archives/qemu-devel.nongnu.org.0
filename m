Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 185FE36DD9C
	for <lists+qemu-devel@lfdr.de>; Wed, 28 Apr 2021 18:55:00 +0200 (CEST)
Received: from localhost ([::1]:46336 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lbnSl-0000nM-65
	for lists+qemu-devel@lfdr.de; Wed, 28 Apr 2021 12:54:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34248)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andrew@daynix.com>) id 1lbnLs-00047C-OK
 for qemu-devel@nongnu.org; Wed, 28 Apr 2021 12:47:52 -0400
Received: from mail-lj1-x22a.google.com ([2a00:1450:4864:20::22a]:46048)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <andrew@daynix.com>) id 1lbnLp-0006iP-Fp
 for qemu-devel@nongnu.org; Wed, 28 Apr 2021 12:47:52 -0400
Received: by mail-lj1-x22a.google.com with SMTP id d15so21771707ljo.12
 for <qemu-devel@nongnu.org>; Wed, 28 Apr 2021 09:47:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=28vcjtc0sMzz6EGIBq940N/hHM/i4U12RPvttL1RPpQ=;
 b=pZOIJFzj3wsBgTlmY+J83B3cRm20cSLhG53WoN5Jm0G8rbRx4O6ZqH60SaiSUnXI/5
 bbwedKIyn3JITno33d9y6i1OxQaBeTH7rP6NM2jIDPkyJjWEN8+ma0PQWmjySXvLoUtI
 gTIlC48aUCG9bOVfLvqz6jLKvutGqMih2sU6UTe+TvDi27eZNiiW2ergrOPCDaIm9fee
 RKjry8GJLySIrinoqfUN9fZ+Os8DKqW5mPfboK+SAxX9yQWcxQhdWInpWGot0oQmwIOZ
 J+hSQhZ8Ww7VoH4LItzj7SWnCz0KfAVehC+sig5DKz4vZwdk3r4Wc4GrwEF7/O3rOqk6
 tl0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=28vcjtc0sMzz6EGIBq940N/hHM/i4U12RPvttL1RPpQ=;
 b=cpCOequ3kJMaw7Yq7g+xgsCkBRv2LjD0jT+t11fbJUZZN4tBr95yhBdi1A9JY3el/s
 Tf9072Z5jzVC5QPL5DkXKp8w78qFkiXEmDX1oO+uXHSSqiUGhwKIQcK9lpv6B8J4wdUR
 zMdAQ5pAoqYlrF7GOY/aEfqi1ED7IvI/oR4nLexN+dnZrsPgCjE7/+LLS2lbi2ss0Tdr
 3wua3nsYUHtaRGH0pjNQCw1HWqUV2Hi43UN/hxIq40X5PVcSzotRmMjZNSF8Zx+Bk5K9
 sJc8V4oN1+hAFhvKTWBhujOlLKEyoMwsNjwAddmHvdWHWWliNhDO5qUD40IOX9HXC8dF
 4Vbw==
X-Gm-Message-State: AOAM532ENTdV5F1+HdDc5OMlaKfyvQE+h1tIy57yNxwAhuBfjdHz8gvO
 bjRJTYE6hloKNmTZwsujAa4vsg4K9d5SWBX8
X-Google-Smtp-Source: ABdhPJx0yQ6lRUFuk6ymMhD8U2fYldSiCNDWl2ocX0s/ebs2PUxD29mu7/oA62ZiMww3jyRvjp1yzA==
X-Received: by 2002:a2e:8118:: with SMTP id d24mr21736897ljg.122.1619628467889; 
 Wed, 28 Apr 2021 09:47:47 -0700 (PDT)
Received: from navi.cosmonova.net.ua ([95.67.24.131])
 by smtp.gmail.com with ESMTPSA id v24sm86302lfp.195.2021.04.28.09.47.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Apr 2021 09:47:47 -0700 (PDT)
From: Andrew Melnychenko <andrew@daynix.com>
To: jasowang@redhat.com,
	mst@redhat.com
Subject: [PATCH v7 5/7] virtio-net: Added eBPF RSS to virtio-net.
Date: Wed, 28 Apr 2021 19:47:31 +0300
Message-Id: <20210428164733.56547-6-andrew@daynix.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210428164733.56547-1-andrew@daynix.com>
References: <20210428164733.56547-1-andrew@daynix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2a00:1450:4864:20::22a;
 envelope-from=andrew@daynix.com; helo=mail-lj1-x22a.google.com
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
Cc: yan@daynix.com, yuri.benditovich@daynix.com, berrange@redhat.com,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

When RSS is enabled the device tries to load the eBPF program
to select RX virtqueue in the TUN. If eBPF can be loaded
the RSS will function also with vhost (works with kernel 5.8 and later).
Software RSS is used as a fallback with vhost=off when eBPF can't be loaded
or when hash population requested by the guest.

Signed-off-by: Yuri Benditovich <yuri.benditovich@daynix.com>
Signed-off-by: Andrew Melnychenko <andrew@daynix.com>
---
 hw/net/vhost_net.c             |   3 +
 hw/net/virtio-net.c            | 115 ++++++++++++++++++++++++++++++++-
 include/hw/virtio/virtio-net.h |   4 ++
 net/vhost-vdpa.c               |   2 +
 4 files changed, 121 insertions(+), 3 deletions(-)

diff --git a/hw/net/vhost_net.c b/hw/net/vhost_net.c
index 24d555e764..44c1ed92dc 100644
--- a/hw/net/vhost_net.c
+++ b/hw/net/vhost_net.c
@@ -45,6 +45,7 @@ static const int kernel_feature_bits[] = {
     VIRTIO_NET_F_MTU,
     VIRTIO_F_IOMMU_PLATFORM,
     VIRTIO_F_RING_PACKED,
+    VIRTIO_NET_F_HASH_REPORT,
     VHOST_INVALID_FEATURE_BIT
 };
 
@@ -71,6 +72,8 @@ static const int user_feature_bits[] = {
     VIRTIO_NET_F_MTU,
     VIRTIO_F_IOMMU_PLATFORM,
     VIRTIO_F_RING_PACKED,
+    VIRTIO_NET_F_RSS,
+    VIRTIO_NET_F_HASH_REPORT,
 
     /* This bit implies RARP isn't sent by QEMU out of band */
     VIRTIO_NET_F_GUEST_ANNOUNCE,
diff --git a/hw/net/virtio-net.c b/hw/net/virtio-net.c
index 66b9ff4511..7ed11a303b 100644
--- a/hw/net/virtio-net.c
+++ b/hw/net/virtio-net.c
@@ -737,8 +737,9 @@ static uint64_t virtio_net_get_features(VirtIODevice *vdev, uint64_t features,
         return features;
     }
 
-    virtio_clear_feature(&features, VIRTIO_NET_F_RSS);
-    virtio_clear_feature(&features, VIRTIO_NET_F_HASH_REPORT);
+    if (!ebpf_rss_is_loaded(&n->ebpf_rss)) {
+        virtio_clear_feature(&features, VIRTIO_NET_F_RSS);
+    }
     features = vhost_net_get_features(get_vhost_net(nc->peer), features);
     vdev->backend_features = features;
 
@@ -1163,12 +1164,79 @@ static int virtio_net_handle_announce(VirtIONet *n, uint8_t cmd,
     }
 }
 
+static void virtio_net_detach_epbf_rss(VirtIONet *n);
+
 static void virtio_net_disable_rss(VirtIONet *n)
 {
     if (n->rss_data.enabled) {
         trace_virtio_net_rss_disable();
     }
     n->rss_data.enabled = false;
+
+    virtio_net_detach_epbf_rss(n);
+}
+
+static bool virtio_net_attach_ebpf_to_backend(NICState *nic, int prog_fd)
+{
+    NetClientState *nc = qemu_get_peer(qemu_get_queue(nic), 0);
+    if (nc == NULL || nc->info->set_steering_ebpf == NULL) {
+        return false;
+    }
+
+    return nc->info->set_steering_ebpf(nc, prog_fd);
+}
+
+static void rss_data_to_rss_config(struct VirtioNetRssData *data,
+                                   struct EBPFRSSConfig *config)
+{
+    config->redirect = data->redirect;
+    config->populate_hash = data->populate_hash;
+    config->hash_types = data->hash_types;
+    config->indirections_len = data->indirections_len;
+    config->default_queue = data->default_queue;
+}
+
+static bool virtio_net_attach_epbf_rss(VirtIONet *n)
+{
+    struct EBPFRSSConfig config = {};
+
+    if (!ebpf_rss_is_loaded(&n->ebpf_rss)) {
+        return false;
+    }
+
+    rss_data_to_rss_config(&n->rss_data, &config);
+
+    if (!ebpf_rss_set_all(&n->ebpf_rss, &config,
+                          n->rss_data.indirections_table, n->rss_data.key)) {
+        return false;
+    }
+
+    if (!virtio_net_attach_ebpf_to_backend(n->nic, n->ebpf_rss.program_fd)) {
+        return false;
+    }
+
+    return true;
+}
+
+static void virtio_net_detach_epbf_rss(VirtIONet *n)
+{
+    virtio_net_attach_ebpf_to_backend(n->nic, -1);
+}
+
+static bool virtio_net_load_ebpf(VirtIONet *n)
+{
+    if (!virtio_net_attach_ebpf_to_backend(n->nic, -1)) {
+        /* backend does't support steering ebpf */
+        return false;
+    }
+
+    return ebpf_rss_load(&n->ebpf_rss);
+}
+
+static void virtio_net_unload_ebpf(VirtIONet *n)
+{
+    virtio_net_attach_ebpf_to_backend(n->nic, -1);
+    ebpf_rss_unload(&n->ebpf_rss);
 }
 
 static uint16_t virtio_net_handle_rss(VirtIONet *n,
@@ -1283,6 +1351,25 @@ static uint16_t virtio_net_handle_rss(VirtIONet *n,
         goto error;
     }
     n->rss_data.enabled = true;
+
+    if (!n->rss_data.populate_hash) {
+        if (!virtio_net_attach_epbf_rss(n)) {
+            /* EBPF must be loaded for vhost */
+            if (get_vhost_net(qemu_get_queue(n->nic)->peer)) {
+                warn_report("Can't load eBPF RSS for vhost");
+                goto error;
+            }
+            /* fallback to software RSS */
+            warn_report("Can't load eBPF RSS - fallback to software RSS");
+            n->rss_data.enabled_software_rss = true;
+        }
+    } else {
+        /* use software RSS for hash populating */
+        /* and detach eBPF if was loaded before */
+        virtio_net_detach_epbf_rss(n);
+        n->rss_data.enabled_software_rss = true;
+    }
+
     trace_virtio_net_rss_enable(n->rss_data.hash_types,
                                 n->rss_data.indirections_len,
                                 temp.b);
@@ -1668,7 +1755,7 @@ static ssize_t virtio_net_receive_rcu(NetClientState *nc, const uint8_t *buf,
         return -1;
     }
 
-    if (!no_rss && n->rss_data.enabled) {
+    if (!no_rss && n->rss_data.enabled && n->rss_data.enabled_software_rss) {
         int index = virtio_net_process_rss(nc, buf, size);
         if (index >= 0) {
             NetClientState *nc2 = qemu_get_subqueue(n->nic, index);
@@ -2772,6 +2859,18 @@ static int virtio_net_post_load_device(void *opaque, int version_id)
     }
 
     if (n->rss_data.enabled) {
+        n->rss_data.enabled_software_rss = n->rss_data.populate_hash;
+        if (!n->rss_data.populate_hash) {
+            if (!virtio_net_attach_epbf_rss(n)) {
+                if (get_vhost_net(qemu_get_queue(n->nic)->peer)) {
+                    warn_report("Can't post-load eBPF RSS for vhost");
+                } else {
+                    warn_report("Can't post-load eBPF RSS - fallback to software RSS");
+                    n->rss_data.enabled_software_rss = true;
+                }
+            }
+        }
+
         trace_virtio_net_rss_enable(n->rss_data.hash_types,
                                     n->rss_data.indirections_len,
                                     sizeof(n->rss_data.key));
@@ -3352,6 +3451,10 @@ static void virtio_net_device_realize(DeviceState *dev, Error **errp)
     n->qdev = dev;
 
     net_rx_pkt_init(&n->rx_pkt, false);
+
+    if (virtio_has_feature(n->host_features, VIRTIO_NET_F_RSS)) {
+        virtio_net_load_ebpf(n);
+    }
 }
 
 static void virtio_net_device_unrealize(DeviceState *dev)
@@ -3360,6 +3463,10 @@ static void virtio_net_device_unrealize(DeviceState *dev)
     VirtIONet *n = VIRTIO_NET(dev);
     int i, max_queues;
 
+    if (virtio_has_feature(n->host_features, VIRTIO_NET_F_RSS)) {
+        virtio_net_unload_ebpf(n);
+    }
+
     /* This will stop vhost backend if appropriate. */
     virtio_net_set_status(vdev, 0);
 
@@ -3402,6 +3509,8 @@ static void virtio_net_instance_init(Object *obj)
     device_add_bootindex_property(obj, &n->nic_conf.bootindex,
                                   "bootindex", "/ethernet-phy@0",
                                   DEVICE(n));
+
+    ebpf_rss_init(&n->ebpf_rss);
 }
 
 static int virtio_net_pre_save(void *opaque)
diff --git a/include/hw/virtio/virtio-net.h b/include/hw/virtio/virtio-net.h
index 7e96d193aa..824a69c23f 100644
--- a/include/hw/virtio/virtio-net.h
+++ b/include/hw/virtio/virtio-net.h
@@ -21,6 +21,8 @@
 #include "qemu/option_int.h"
 #include "qom/object.h"
 
+#include "ebpf/ebpf_rss.h"
+
 #define TYPE_VIRTIO_NET "virtio-net-device"
 OBJECT_DECLARE_SIMPLE_TYPE(VirtIONet, VIRTIO_NET)
 
@@ -130,6 +132,7 @@ typedef struct VirtioNetRscChain {
 
 typedef struct VirtioNetRssData {
     bool    enabled;
+    bool    enabled_software_rss;
     bool    redirect;
     bool    populate_hash;
     uint32_t hash_types;
@@ -209,6 +212,7 @@ struct VirtIONet {
     Notifier migration_state;
     VirtioNetRssData rss_data;
     struct NetRxPkt *rx_pkt;
+    struct EBPFRSSContext ebpf_rss;
 };
 
 void virtio_net_set_netclient_name(VirtIONet *n, const char *name,
diff --git a/net/vhost-vdpa.c b/net/vhost-vdpa.c
index fe659ec9e2..8b14215549 100644
--- a/net/vhost-vdpa.c
+++ b/net/vhost-vdpa.c
@@ -54,6 +54,8 @@ const int vdpa_feature_bits[] = {
     VIRTIO_NET_F_MTU,
     VIRTIO_F_IOMMU_PLATFORM,
     VIRTIO_F_RING_PACKED,
+    VIRTIO_NET_F_RSS,
+    VIRTIO_NET_F_HASH_REPORT,
     VIRTIO_NET_F_GUEST_ANNOUNCE,
     VIRTIO_NET_F_STATUS,
     VHOST_INVALID_FEATURE_BIT
-- 
2.31.1


