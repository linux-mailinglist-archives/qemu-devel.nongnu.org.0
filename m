Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 86E073808F4
	for <lists+qemu-devel@lfdr.de>; Fri, 14 May 2021 13:53:39 +0200 (CEST)
Received: from localhost ([::1]:48976 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lhWNu-0002UE-K1
	for lists+qemu-devel@lfdr.de; Fri, 14 May 2021 07:53:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50860)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andrew@daynix.com>) id 1lhWJQ-0002PF-Qy
 for qemu-devel@nongnu.org; Fri, 14 May 2021 07:49:00 -0400
Received: from mail-lf1-x136.google.com ([2a00:1450:4864:20::136]:37420)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <andrew@daynix.com>) id 1lhWJK-0004pP-Vc
 for qemu-devel@nongnu.org; Fri, 14 May 2021 07:49:00 -0400
Received: by mail-lf1-x136.google.com with SMTP id 2so42691428lft.4
 for <qemu-devel@nongnu.org>; Fri, 14 May 2021 04:48:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=cAvXGfs+9FBYLlmsFdt//GKH4proWXPY4/jqkDmFHz4=;
 b=LwHuZoVm+rZ6C4/PeEXU4DVClI9d1MKxl5tgRKZClaPRo+GIL8WdC5ZRA3irt5JqHo
 CgLX3hpkz19Xo7QvI6WcCI9InkUG2AagKQ71uwzInKtidA2ZvId2PxdFOZzwXDGWmqS4
 h0UlO9YWe3aUM3tlLSwSzWVWnEONQEaSmaxIXl/fwrFbejuN7Jv26a7SPv+gze6Y3GIa
 3+pr2mTmRJNyrCyxJmXtFRm2SJRlu8j0qfvacXu7sbRWxVTG3F8RtMtJ71RkqI9Za9G3
 RlovcuWnG66HjqhZx509DKfwhyZ14Rs9nt2ybvlonXOsSAUs6ctpuNz24qAjtZfoxy2m
 EG7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=cAvXGfs+9FBYLlmsFdt//GKH4proWXPY4/jqkDmFHz4=;
 b=pT7EwdS98brv3tUBADfKEd7pLLzKHK0YJObUG2rTv5WJRGqDWQlCGZ2YYYwrVomkgB
 NXmieb51LLBr3XkPw0r2lAxPrK/aeTFBcfK+pzVW9cqOH+fdmxwcFhofUyVshEgofNP6
 6UdxY30z7y4SusHXNIRI7M8n8rLX7Bf11e6wgLKr0wW28jPWFST6T779PX8uqUJtuDpb
 IxHJGd4FovghjzPSfR8PBIZFJIMMe2Iw+OYvyJoyON6sW+XrWkJhKpZlBKfEZvdn1MeK
 trIO46LJI633eU+Mbp5p1DaWxk4YvbfapJLg7yhxuU1sLwOkIITKklKr9mfd/LS35tlS
 kctQ==
X-Gm-Message-State: AOAM531V/qoRc0lq9U2xxp2XySoLsEP6ML1neSK+WrT+O66Zsyccd34B
 HgSMInZ8ZoGho3pkDUElOBOMcg==
X-Google-Smtp-Source: ABdhPJxQSjRPHAZO7nVAtixBPILrgYFR8udjWbOPZfLAbT+KlZhk9lF17YrV4qyG/r2yHORM/4x/xw==
X-Received: by 2002:a05:6512:3b0f:: with SMTP id
 f15mr32238292lfv.384.1620992933512; 
 Fri, 14 May 2021 04:48:53 -0700 (PDT)
Received: from navi.cosmonova.net.ua ([95.67.24.131])
 by smtp.gmail.com with ESMTPSA id t13sm583421lfc.57.2021.05.14.04.48.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 14 May 2021 04:48:53 -0700 (PDT)
From: Andrew Melnychenko <andrew@daynix.com>
To: jasowang@redhat.com,
	mst@redhat.com
Subject: [PATCH v8 5/7] virtio-net: Added eBPF RSS to virtio-net.
Date: Fri, 14 May 2021 14:48:33 +0300
Message-Id: <20210514114835.267316-6-andrew@daynix.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210514114835.267316-1-andrew@daynix.com>
References: <20210514114835.267316-1-andrew@daynix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2a00:1450:4864:20::136;
 envelope-from=andrew@daynix.com; helo=mail-lf1-x136.google.com
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
 hw/net/virtio-net.c            | 116 ++++++++++++++++++++++++++++++++-
 include/hw/virtio/virtio-net.h |   4 ++
 net/vhost-vdpa.c               |   2 +
 4 files changed, 122 insertions(+), 3 deletions(-)

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
index 66b9ff4511..88287caf73 100644
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
@@ -2772,6 +2859,19 @@ static int virtio_net_post_load_device(void *opaque, int version_id)
     }
 
     if (n->rss_data.enabled) {
+        n->rss_data.enabled_software_rss = n->rss_data.populate_hash;
+        if (!n->rss_data.populate_hash) {
+            if (!virtio_net_attach_epbf_rss(n)) {
+                if (get_vhost_net(qemu_get_queue(n->nic)->peer)) {
+                    warn_report("Can't post-load eBPF RSS for vhost");
+                } else {
+                    warn_report("Can't post-load eBPF RSS - "
+                                "fallback to software RSS");
+                    n->rss_data.enabled_software_rss = true;
+                }
+            }
+        }
+
         trace_virtio_net_rss_enable(n->rss_data.hash_types,
                                     n->rss_data.indirections_len,
                                     sizeof(n->rss_data.key));
@@ -3352,6 +3452,10 @@ static void virtio_net_device_realize(DeviceState *dev, Error **errp)
     n->qdev = dev;
 
     net_rx_pkt_init(&n->rx_pkt, false);
+
+    if (virtio_has_feature(n->host_features, VIRTIO_NET_F_RSS)) {
+        virtio_net_load_ebpf(n);
+    }
 }
 
 static void virtio_net_device_unrealize(DeviceState *dev)
@@ -3360,6 +3464,10 @@ static void virtio_net_device_unrealize(DeviceState *dev)
     VirtIONet *n = VIRTIO_NET(dev);
     int i, max_queues;
 
+    if (virtio_has_feature(n->host_features, VIRTIO_NET_F_RSS)) {
+        virtio_net_unload_ebpf(n);
+    }
+
     /* This will stop vhost backend if appropriate. */
     virtio_net_set_status(vdev, 0);
 
@@ -3402,6 +3510,8 @@ static void virtio_net_instance_init(Object *obj)
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


