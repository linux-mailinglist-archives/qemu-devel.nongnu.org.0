Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [IPv6:2001:470:142::17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A4941CAE9D
	for <lists+qemu-devel@lfdr.de>; Fri,  8 May 2020 15:11:43 +0200 (CEST)
Received: from localhost ([::1]:34428 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jX2n0-0003bO-8V
	for lists+qemu-devel@lfdr.de; Fri, 08 May 2020 09:11:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54830)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yuri.benditovich@daynix.com>)
 id 1jX2bS-0000uh-N8
 for qemu-devel@nongnu.org; Fri, 08 May 2020 08:59:46 -0400
Received: from mail-wr1-x443.google.com ([2a00:1450:4864:20::443]:33822)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <yuri.benditovich@daynix.com>)
 id 1jX2bR-0006cR-Fl
 for qemu-devel@nongnu.org; Fri, 08 May 2020 08:59:46 -0400
Received: by mail-wr1-x443.google.com with SMTP id y3so1751877wrt.1
 for <qemu-devel@nongnu.org>; Fri, 08 May 2020 05:59:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=YwIUCQPxUR46SYWuzxeD5H60YNMikGD4Q4AYC6QYvnQ=;
 b=PqjaCd11G/XUp7oSl7SGHHpVp3pWEBgJ+4UB5b2sPAnjvDTqB2e6w4hys0rSBUmT1A
 w5ERzPm64efU9JsqJhLHB5B3BBu7OEtWlLV0PQQuQkhWB5mUU+S0TrXHwoVl9VizEaBZ
 SX5vVFKyu4jExaQVRnouKsZ9PCv1TFE0eszEHLq8tt78BojGljAVdX1weRlJTEEs1PwH
 UKHZBRzuGsjNhz9wnwfc8URR88hoDjbKKADZwCJyPGxVf+JGAUF4sLFPV2d3Xcd3olud
 EuEx1vvX/wUrLNg+ac3JkaXfNVXkfWBqtyPFZKygXUr/oqJHMSp1ZuvWwn1aWT5QxOK+
 u+dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=YwIUCQPxUR46SYWuzxeD5H60YNMikGD4Q4AYC6QYvnQ=;
 b=Kl13jtnkiHDX87/j0EZjP2MpSTlAWPQ9sfbMYc5nqQntp3MAbZRAeodhdVTubywCFT
 8QB8lk1LqbSgimoDbEGH9Zwwl6yKl6pCOSpxNbywYOfp+KmO3jAA+0MWwpAnEMA8SGRB
 B6ytwBwIKHWpGgxgkplaQW015vPKLj52PnachC7xSHtFPlSlm82/pEgvYBLxM0q3uWJO
 6tKi9ypvu21gFG2/OvRNmdx8KnNsB8jMckOMjd/yvi9IbXxMGFTJB1RXONOCnvTO1seA
 XifQiokFWWwX+PmW4AHjfVB+6uASiAWIGqs65j0FrxU2+J1eZ9U4tkPmKntOKjnzXfz7
 Wjpg==
X-Gm-Message-State: AGi0PubFFYevZj7+780+0PRKqf7iWtXYPrPQI3KZoDcj4jXKK+zIPDQ+
 U83KtsPCh0Tc/ZGfWBgxjWrZYiJKTrj2AA==
X-Google-Smtp-Source: APiQypL+Aj7/8IxrYScUbHe0dvJfaLdvznzrstDCfttmWye47cX4J+nh0lBNxOsGyXpHbQJQHnh1Tw==
X-Received: by 2002:a05:6000:189:: with SMTP id
 p9mr780314wrx.187.1588942783645; 
 Fri, 08 May 2020 05:59:43 -0700 (PDT)
Received: from f2.redhat.com (bzq-79-183-19-16.red.bezeqint.net.
 [79.183.19.16])
 by smtp.gmail.com with ESMTPSA id g6sm2915974wrw.34.2020.05.08.05.59.42
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Fri, 08 May 2020 05:59:43 -0700 (PDT)
From: Yuri Benditovich <yuri.benditovich@daynix.com>
To: qemu-devel@nongnu.org, mst@redhat.com, jasowang@redhat.com,
 quintela@redhat.com, dgilbert@redhat.com
Subject: [PATCH v8 1/7] virtio-net: implement RSS configuration command
Date: Fri,  8 May 2020 15:59:28 +0300
Message-Id: <20200508125934.7861-2-yuri.benditovich@daynix.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200508125934.7861-1-yuri.benditovich@daynix.com>
References: <20200508125934.7861-1-yuri.benditovich@daynix.com>
Received-SPF: none client-ip=2a00:1450:4864:20::443;
 envelope-from=yuri.benditovich@daynix.com; helo=mail-wr1-x443.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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

Optionally report RSS feature.
Handle RSS configuration command and keep RSS parameters
in virtio-net device context.

Signed-off-by: Yuri Benditovich <yuri.benditovich@daynix.com>
---
 hw/net/trace-events            |   3 +
 hw/net/virtio-net.c            | 167 +++++++++++++++++++++++++++++++--
 include/hw/virtio/virtio-net.h |  13 +++
 3 files changed, 174 insertions(+), 9 deletions(-)

diff --git a/hw/net/trace-events b/hw/net/trace-events
index e18f883cfd..a00ef6dc1c 100644
--- a/hw/net/trace-events
+++ b/hw/net/trace-events
@@ -381,6 +381,9 @@ virtio_net_announce_notify(void) ""
 virtio_net_announce_timer(int round) "%d"
 virtio_net_handle_announce(int round) "%d"
 virtio_net_post_load_device(void)
+virtio_net_rss_disable(void)
+virtio_net_rss_error(const char *msg, uint32_t value) "%s, value 0x%08x"
+virtio_net_rss_enable(uint32_t p1, uint16_t p2, uint8_t p3) "hashes 0x%x, table of %d, key of %d"
 
 # tulip.c
 tulip_reg_write(uint64_t addr, const char *name, int size, uint64_t val) "addr 0x%02"PRIx64" (%s) size %d value 0x%08"PRIx64
diff --git a/hw/net/virtio-net.c b/hw/net/virtio-net.c
index 3301869d4f..75e9769f79 100644
--- a/hw/net/virtio-net.c
+++ b/hw/net/virtio-net.c
@@ -77,6 +77,16 @@
    tso/gso/gro 'off'. */
 #define VIRTIO_NET_RSC_DEFAULT_INTERVAL 300000
 
+#define VIRTIO_NET_RSS_SUPPORTED_HASHES (VIRTIO_NET_RSS_HASH_TYPE_IPv4 | \
+                                         VIRTIO_NET_RSS_HASH_TYPE_TCPv4 | \
+                                         VIRTIO_NET_RSS_HASH_TYPE_UDPv4 | \
+                                         VIRTIO_NET_RSS_HASH_TYPE_IPv6 | \
+                                         VIRTIO_NET_RSS_HASH_TYPE_TCPv6 | \
+                                         VIRTIO_NET_RSS_HASH_TYPE_UDPv6 | \
+                                         VIRTIO_NET_RSS_HASH_TYPE_IP_EX | \
+                                         VIRTIO_NET_RSS_HASH_TYPE_TCP_EX | \
+                                         VIRTIO_NET_RSS_HASH_TYPE_UDP_EX)
+
 /* temporary until standard header include it */
 #if !defined(VIRTIO_NET_HDR_F_RSC_INFO)
 
@@ -108,6 +118,8 @@ static VirtIOFeature feature_sizes[] = {
      .end = endof(struct virtio_net_config, mtu)},
     {.flags = 1ULL << VIRTIO_NET_F_SPEED_DUPLEX,
      .end = endof(struct virtio_net_config, duplex)},
+    {.flags = 1ULL << VIRTIO_NET_F_RSS,
+     .end = endof(struct virtio_net_config, supported_hash_types)},
     {}
 };
 
@@ -138,6 +150,11 @@ static void virtio_net_get_config(VirtIODevice *vdev, uint8_t *config)
     memcpy(netcfg.mac, n->mac, ETH_ALEN);
     virtio_stl_p(vdev, &netcfg.speed, n->net_conf.speed);
     netcfg.duplex = n->net_conf.duplex;
+    netcfg.rss_max_key_size = VIRTIO_NET_RSS_MAX_KEY_SIZE;
+    virtio_stw_p(vdev, &netcfg.rss_max_indirection_table_length,
+                 VIRTIO_NET_RSS_MAX_TABLE_LEN);
+    virtio_stl_p(vdev, &netcfg.supported_hash_types,
+                 VIRTIO_NET_RSS_SUPPORTED_HASHES);
     memcpy(config, &netcfg, n->config_size);
 }
 
@@ -701,6 +718,7 @@ static uint64_t virtio_net_get_features(VirtIODevice *vdev, uint64_t features,
         return features;
     }
 
+    virtio_clear_feature(&features, VIRTIO_NET_F_RSS);
     features = vhost_net_get_features(get_vhost_net(nc->peer), features);
     vdev->backend_features = features;
 
@@ -860,6 +878,7 @@ static void virtio_net_set_features(VirtIODevice *vdev, uint64_t features)
     }
 
     virtio_net_set_multiqueue(n,
+                              virtio_has_feature(features, VIRTIO_NET_F_RSS) ||
                               virtio_has_feature(features, VIRTIO_NET_F_MQ));
 
     virtio_net_set_mrg_rx_bufs(n,
@@ -1136,25 +1155,152 @@ static int virtio_net_handle_announce(VirtIONet *n, uint8_t cmd,
     }
 }
 
+static void virtio_net_disable_rss(VirtIONet *n)
+{
+    if (n->rss_data.enabled) {
+        trace_virtio_net_rss_disable();
+    }
+    n->rss_data.enabled = false;
+}
+
+static uint16_t virtio_net_handle_rss(VirtIONet *n,
+                                      struct iovec *iov, unsigned int iov_cnt)
+{
+    VirtIODevice *vdev = VIRTIO_DEVICE(n);
+    struct virtio_net_rss_config cfg;
+    size_t s, offset = 0, size_get;
+    uint16_t queues, i;
+    struct {
+        uint16_t us;
+        uint8_t b;
+    } QEMU_PACKED temp;
+    const char *err_msg = "";
+    uint32_t err_value = 0;
+
+    if (!virtio_vdev_has_feature(vdev, VIRTIO_NET_F_RSS)) {
+        err_msg = "RSS is not negotiated";
+        goto error;
+    }
+    size_get = offsetof(struct virtio_net_rss_config, indirection_table);
+    s = iov_to_buf(iov, iov_cnt, offset, &cfg, size_get);
+    if (s != size_get) {
+        err_msg = "Short command buffer";
+        err_value = (uint32_t)s;
+        goto error;
+    }
+    n->rss_data.hash_types = virtio_ldl_p(vdev, &cfg.hash_types);
+    n->rss_data.indirections_len =
+        virtio_lduw_p(vdev, &cfg.indirection_table_mask);
+    n->rss_data.indirections_len++;
+    if (!is_power_of_2(n->rss_data.indirections_len)) {
+        err_msg = "Invalid size of indirection table";
+        err_value = n->rss_data.indirections_len;
+        goto error;
+    }
+    if (n->rss_data.indirections_len > VIRTIO_NET_RSS_MAX_TABLE_LEN) {
+        err_msg = "Too large indirection table";
+        err_value = n->rss_data.indirections_len;
+        goto error;
+    }
+    n->rss_data.default_queue =
+        virtio_lduw_p(vdev, &cfg.unclassified_queue);
+    if (n->rss_data.default_queue >= n->max_queues) {
+        err_msg = "Invalid default queue";
+        err_value = n->rss_data.default_queue;
+        goto error;
+    }
+    offset += size_get;
+    size_get = sizeof(uint16_t) * n->rss_data.indirections_len;
+    g_free(n->rss_data.indirections_table);
+    n->rss_data.indirections_table = g_malloc(size_get);
+    if (!n->rss_data.indirections_table) {
+        err_msg = "Can't allocate indirections table";
+        err_value = n->rss_data.indirections_len;
+        goto error;
+    }
+    s = iov_to_buf(iov, iov_cnt, offset,
+                   n->rss_data.indirections_table, size_get);
+    if (s != size_get) {
+        err_msg = "Short indirection table buffer";
+        err_value = (uint32_t)s;
+        goto error;
+    }
+    for (i = 0; i < n->rss_data.indirections_len; ++i) {
+        uint16_t val = n->rss_data.indirections_table[i];
+        n->rss_data.indirections_table[i] = virtio_lduw_p(vdev, &val);
+    }
+    offset += size_get;
+    size_get = sizeof(temp);
+    s = iov_to_buf(iov, iov_cnt, offset, &temp, size_get);
+    if (s != size_get) {
+        err_msg = "Can't get queues";
+        err_value = (uint32_t)s;
+        goto error;
+    }
+    queues = virtio_lduw_p(vdev, &temp.us);
+    if (queues == 0 || queues > n->max_queues) {
+        err_msg = "Invalid number of queues";
+        err_value = queues;
+        goto error;
+    }
+    if (temp.b > VIRTIO_NET_RSS_MAX_KEY_SIZE) {
+        err_msg = "Invalid key size";
+        err_value = temp.b;
+        goto error;
+    }
+    if (!temp.b && n->rss_data.hash_types) {
+        err_msg = "No key provided";
+        err_value = 0;
+        goto error;
+    }
+    if (!temp.b && !n->rss_data.hash_types) {
+        virtio_net_disable_rss(n);
+        return queues;
+    }
+    offset += size_get;
+    size_get = temp.b;
+    s = iov_to_buf(iov, iov_cnt, offset, n->rss_data.key, size_get);
+    if (s != size_get) {
+        err_msg = "Can get key buffer";
+        err_value = (uint32_t)s;
+        goto error;
+    }
+    n->rss_data.enabled = true;
+    trace_virtio_net_rss_enable(n->rss_data.hash_types,
+                                n->rss_data.indirections_len,
+                                temp.b);
+    return queues;
+error:
+    trace_virtio_net_rss_error(err_msg, err_value);
+    virtio_net_disable_rss(n);
+    return 0;
+}
+
 static int virtio_net_handle_mq(VirtIONet *n, uint8_t cmd,
                                 struct iovec *iov, unsigned int iov_cnt)
 {
     VirtIODevice *vdev = VIRTIO_DEVICE(n);
-    struct virtio_net_ctrl_mq mq;
-    size_t s;
     uint16_t queues;
 
-    s = iov_to_buf(iov, iov_cnt, 0, &mq, sizeof(mq));
-    if (s != sizeof(mq)) {
-        return VIRTIO_NET_ERR;
-    }
+    virtio_net_disable_rss(n);
+    if (cmd == VIRTIO_NET_CTRL_MQ_RSS_CONFIG) {
+        queues = virtio_net_handle_rss(n, iov, iov_cnt);
+    } else if (cmd == VIRTIO_NET_CTRL_MQ_VQ_PAIRS_SET) {
+        struct virtio_net_ctrl_mq mq;
+        size_t s;
+        if (!virtio_vdev_has_feature(vdev, VIRTIO_NET_F_MQ)) {
+            return VIRTIO_NET_ERR;
+        }
+        s = iov_to_buf(iov, iov_cnt, 0, &mq, sizeof(mq));
+        if (s != sizeof(mq)) {
+            return VIRTIO_NET_ERR;
+        }
+        queues = virtio_lduw_p(vdev, &mq.virtqueue_pairs);
 
-    if (cmd != VIRTIO_NET_CTRL_MQ_VQ_PAIRS_SET) {
+    } else {
         return VIRTIO_NET_ERR;
     }
 
-    queues = virtio_lduw_p(vdev, &mq.virtqueue_pairs);
-
     if (queues < VIRTIO_NET_CTRL_MQ_VQ_PAIRS_MIN ||
         queues > VIRTIO_NET_CTRL_MQ_VQ_PAIRS_MAX ||
         queues > n->max_queues ||
@@ -3111,6 +3257,7 @@ static void virtio_net_device_unrealize(DeviceState *dev, Error **errp)
     g_free(n->vqs);
     qemu_del_nic(n->nic);
     virtio_net_rsc_cleanup(n);
+    g_free(n->rss_data.indirections_table);
     virtio_cleanup(vdev);
 }
 
@@ -3212,6 +3359,8 @@ static Property virtio_net_properties[] = {
     DEFINE_PROP_BIT64("ctrl_guest_offloads", VirtIONet, host_features,
                     VIRTIO_NET_F_CTRL_GUEST_OFFLOADS, true),
     DEFINE_PROP_BIT64("mq", VirtIONet, host_features, VIRTIO_NET_F_MQ, false),
+    DEFINE_PROP_BIT64("rss", VirtIONet, host_features,
+                    VIRTIO_NET_F_RSS, false),
     DEFINE_PROP_BIT64("guest_rsc_ext", VirtIONet, host_features,
                     VIRTIO_NET_F_RSC_EXT, false),
     DEFINE_PROP_UINT32("rsc_interval", VirtIONet, rsc_timeout,
diff --git a/include/hw/virtio/virtio-net.h b/include/hw/virtio/virtio-net.h
index 96c68d4a92..d3fad7c8f3 100644
--- a/include/hw/virtio/virtio-net.h
+++ b/include/hw/virtio/virtio-net.h
@@ -126,6 +126,18 @@ typedef struct VirtioNetRscChain {
 /* Maximum packet size we can receive from tap device: header + 64k */
 #define VIRTIO_NET_MAX_BUFSIZE (sizeof(struct virtio_net_hdr) + (64 * KiB))
 
+#define VIRTIO_NET_RSS_MAX_KEY_SIZE     40
+#define VIRTIO_NET_RSS_MAX_TABLE_LEN    128
+
+typedef struct VirtioNetRssData {
+    bool    enabled;
+    uint32_t hash_types;
+    uint8_t key[VIRTIO_NET_RSS_MAX_KEY_SIZE];
+    uint16_t indirections_len;
+    uint16_t *indirections_table;
+    uint16_t default_queue;
+} VirtioNetRssData;
+
 typedef struct VirtIONetQueue {
     VirtQueue *rx_vq;
     VirtQueue *tx_vq;
@@ -199,6 +211,7 @@ struct VirtIONet {
     bool failover;
     DeviceListener primary_listener;
     Notifier migration_state;
+    VirtioNetRssData rss_data;
 };
 
 void virtio_net_set_netclient_name(VirtIONet *n, const char *name,
-- 
2.17.1


