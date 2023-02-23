Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 704196A0613
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Feb 2023 11:25:22 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pV8k0-0007Pn-Tt; Thu, 23 Feb 2023 05:22:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1pV8jl-0007Ib-6U
 for qemu-devel@nongnu.org; Thu, 23 Feb 2023 05:22:06 -0500
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1pV8ji-0002k1-4l
 for qemu-devel@nongnu.org; Thu, 23 Feb 2023 05:22:04 -0500
Received: by mail-pl1-x62d.google.com with SMTP id ky4so13412765plb.3
 for <qemu-devel@nongnu.org>; Thu, 23 Feb 2023 02:22:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=OCOzJ5B4Ai3joFX+VOMVNyOV5edsr/6Pvwl3joO9snE=;
 b=vZhNRyB3uv4QIiXI+ihf15uE7IgLo6juv3XWrGH2yPPH5qvrSHgMi8yzUvs+UMYVnd
 LMaVSlE41eV0UNmFDATl1g3F9M66O/gNpSZeD5K6dTA57JB1jw01rwvpi3X9oZ5xoREm
 Srw1O6UrEebo5xdKkaK2BSPTZu7zI9PMDjjNcz/IiOS0TQkI7Txr6n3sl/mzmeJLYRox
 A9n5UwkBVQhUT4CV92kymDJytMlpy4QTV2iGhpnqEtKf28xz48YIkuctnZE4lrDBYKt9
 XUG5w4S+7PnLIdRSM3lYtxepraQbe9VAtIiA+5lmHShuZjVmy9ezq+1QoV1Y1qpCvDNY
 rwZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=OCOzJ5B4Ai3joFX+VOMVNyOV5edsr/6Pvwl3joO9snE=;
 b=dGoHOngFzUSFPXCUPC6hnLn/CpRtYBKVyy8x4RvaRnayO/xkBhusFM/ryd+VaSkPzg
 tCkeRnsVD5FiV/rVqlTU9I9A7W8S6/1zgiPNHOLxCJc3cjGmJo6vHNfQ40E/yxOBZeNT
 7TwkmuS9bOe7h4D0inkujTv5wGF9wA+Q3ILViuugCMJKIlwV3AB2xJgXg10xavpHkviL
 N4fDxGNA04XlKCo5mmAgq8INMhcz3gQFmH8HxgP+1/pEIJ1l049CevIxhcvUIyk3CBdc
 lxNYnxEJbGTNxVoXC1fM2mOFX44CzCKTyJQtRC80JSntgzl0eTQMkkZCPcuCOEBFt/py
 YUmQ==
X-Gm-Message-State: AO0yUKVkpSRcV8ICJ2/n82JvwiwFi+p3Wrf2Z+LIBcNH7A0S2GgywlsE
 zd1+MhBPEN+bjkHr6YOQ83Eraw==
X-Google-Smtp-Source: AK7set+0K0KEVXbALDLHzw+vUvVhQYB918hOVJQCWYe4KFsNXIHLsR7Tyn5OaioIxpCtKdxDPT1NTg==
X-Received: by 2002:a17:903:28c4:b0:19b:5e:327f with SMTP id
 kv4-20020a17090328c400b0019b005e327fmr9519328plb.33.1677147720968; 
 Thu, 23 Feb 2023 02:22:00 -0800 (PST)
Received: from alarm.flets-east.jp ([2400:4050:a840:1e00:4457:c267:5e09:481b])
 by smtp.gmail.com with ESMTPSA id
 c20-20020a170902c1d400b00196217f1219sm4107734plc.70.2023.02.23.02.21.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 Feb 2023 02:22:00 -0800 (PST)
From: Akihiko Odaki <akihiko.odaki@daynix.com>
To: 
Cc: Jason Wang <jasowang@redhat.com>,
 Dmitry Fleytman <dmitry.fleytman@gmail.com>,
 Thomas Huth <thuth@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org,
 qemu-ppc@nongnu.org, "Michael S . Tsirkin" <mst@redhat.com>,
 Yan Vugenfirer <yvugenfi@redhat.com>,
 Yuri Benditovich <yuri.benditovich@daynix.com>,
 Sriram Yagnaraman <sriram.yagnaraman@est.tech>,
 Alexander Bulekov <alxndr@bu.edu>, Akihiko Odaki <akihiko.odaki@daynix.com>
Subject: [PATCH v6 23/34] hw/net/net_rx_pkt: Remove net_rx_pkt_has_virt_hdr
Date: Thu, 23 Feb 2023 19:20:07 +0900
Message-Id: <20230223102018.141748-24-akihiko.odaki@daynix.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230223102018.141748-1-akihiko.odaki@daynix.com>
References: <20230223102018.141748-1-akihiko.odaki@daynix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::62d;
 envelope-from=akihiko.odaki@daynix.com; helo=mail-pl1-x62d.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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

When virtio-net header is not set, net_rx_pkt_get_vhdr() returns
zero-filled virtio_net_hdr, which is actually valid. In fact, tap device
uses zero-filled virtio_net_hdr when virtio-net header is not provided
by the peer. Therefore, we can just remove net_rx_pkt_has_virt_hdr() and
always assume NetTxPkt has a valid virtio-net header.

Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
---
 hw/net/e1000e_core.c | 16 ++++------------
 hw/net/net_rx_pkt.c  | 11 +----------
 hw/net/net_rx_pkt.h  | 12 +-----------
 hw/net/trace-events  |  1 -
 hw/net/virtio-net.c  |  2 +-
 hw/net/vmxnet3.c     | 12 ++----------
 6 files changed, 9 insertions(+), 45 deletions(-)

diff --git a/hw/net/e1000e_core.c b/hw/net/e1000e_core.c
index 954a007151..95245c42f5 100644
--- a/hw/net/e1000e_core.c
+++ b/hw/net/e1000e_core.c
@@ -1240,12 +1240,6 @@ e1000e_build_rx_metadata(E1000ECore *core,
         goto func_exit;
     }
 
-    if (!net_rx_pkt_has_virt_hdr(pkt)) {
-        trace_e1000e_rx_metadata_no_virthdr();
-        e1000e_verify_csum_in_sw(core, pkt, status_flags, istcp, isudp);
-        goto func_exit;
-    }
-
     vhdr = net_rx_pkt_get_vhdr(pkt);
 
     if (!(vhdr->flags & VIRTIO_NET_HDR_F_DATA_VALID) &&
@@ -1671,12 +1665,10 @@ e1000e_write_packet_to_guest(E1000ECore *core, struct NetRxPkt *pkt,
 static inline void
 e1000e_rx_fix_l4_csum(E1000ECore *core, struct NetRxPkt *pkt)
 {
-    if (net_rx_pkt_has_virt_hdr(pkt)) {
-        struct virtio_net_hdr *vhdr = net_rx_pkt_get_vhdr(pkt);
+    struct virtio_net_hdr *vhdr = net_rx_pkt_get_vhdr(pkt);
 
-        if (vhdr->flags & VIRTIO_NET_HDR_F_NEEDS_CSUM) {
-            net_rx_pkt_fix_l4_csum(pkt);
-        }
+    if (vhdr->flags & VIRTIO_NET_HDR_F_NEEDS_CSUM) {
+        net_rx_pkt_fix_l4_csum(pkt);
     }
 }
 
@@ -3379,7 +3371,7 @@ e1000e_core_pci_realize(E1000ECore     *core,
         net_tx_pkt_init(&core->tx[i].tx_pkt, core->owner, E1000E_MAX_TX_FRAGS);
     }
 
-    net_rx_pkt_init(&core->rx_pkt, core->has_vnet);
+    net_rx_pkt_init(&core->rx_pkt);
 
     e1000x_core_prepare_eeprom(core->eeprom,
                                eeprom_templ,
diff --git a/hw/net/net_rx_pkt.c b/hw/net/net_rx_pkt.c
index 1e1c504e42..b309c2f476 100644
--- a/hw/net/net_rx_pkt.c
+++ b/hw/net/net_rx_pkt.c
@@ -30,7 +30,6 @@ struct NetRxPkt {
     uint32_t tot_len;
     uint16_t tci;
     size_t ehdr_buf_len;
-    bool has_virt_hdr;
     eth_pkt_types_e packet_type;
 
     /* Analysis results */
@@ -48,10 +47,9 @@ struct NetRxPkt {
     eth_l4_hdr_info  l4hdr_info;
 };
 
-void net_rx_pkt_init(struct NetRxPkt **pkt, bool has_virt_hdr)
+void net_rx_pkt_init(struct NetRxPkt **pkt)
 {
     struct NetRxPkt *p = g_malloc0(sizeof *p);
-    p->has_virt_hdr = has_virt_hdr;
     p->vec = NULL;
     p->vec_len_total = 0;
     *pkt = p;
@@ -472,13 +470,6 @@ bool net_rx_pkt_is_vlan_stripped(struct NetRxPkt *pkt)
     return pkt->ehdr_buf_len ? true : false;
 }
 
-bool net_rx_pkt_has_virt_hdr(struct NetRxPkt *pkt)
-{
-    assert(pkt);
-
-    return pkt->has_virt_hdr;
-}
-
 uint16_t net_rx_pkt_get_vlan_tag(struct NetRxPkt *pkt)
 {
     assert(pkt);
diff --git a/hw/net/net_rx_pkt.h b/hw/net/net_rx_pkt.h
index 048e3461f0..7277907a22 100644
--- a/hw/net/net_rx_pkt.h
+++ b/hw/net/net_rx_pkt.h
@@ -37,10 +37,9 @@ void net_rx_pkt_uninit(struct NetRxPkt *pkt);
  * Init function for rx packet functionality
  *
  * @pkt:            packet pointer
- * @has_virt_hdr:   device uses virtio header
  *
  */
-void net_rx_pkt_init(struct NetRxPkt **pkt, bool has_virt_hdr);
+void net_rx_pkt_init(struct NetRxPkt **pkt);
 
 /**
  * returns total length of data attached to rx context
@@ -214,15 +213,6 @@ uint16_t net_rx_pkt_get_vlan_tag(struct NetRxPkt *pkt);
  */
 bool net_rx_pkt_is_vlan_stripped(struct NetRxPkt *pkt);
 
-/**
- * notifies caller if the packet has virtio header
- *
- * @pkt:            packet
- * @ret:            true if packet has virtio header, false otherwize
- *
- */
-bool net_rx_pkt_has_virt_hdr(struct NetRxPkt *pkt);
-
 /**
 * attach scatter-gather data to rx packet
 *
diff --git a/hw/net/trace-events b/hw/net/trace-events
index c98ad12537..f7257a0693 100644
--- a/hw/net/trace-events
+++ b/hw/net/trace-events
@@ -188,7 +188,6 @@ e1000e_rx_metadata_rss(uint32_t rss, uint32_t mrq) "RSS data: rss: 0x%X, mrq: 0x
 e1000e_rx_metadata_ip_id(uint16_t ip_id) "the IPv4 ID is 0x%X"
 e1000e_rx_metadata_ack(void) "the packet is TCP ACK"
 e1000e_rx_metadata_pkt_type(uint32_t pkt_type) "the packet type is %u"
-e1000e_rx_metadata_no_virthdr(void) "the packet has no virt-header"
 e1000e_rx_metadata_virthdr_no_csum_info(void) "virt-header does not contain checksum info"
 e1000e_rx_metadata_l3_cso_disabled(void) "IP4 CSO is disabled"
 e1000e_rx_metadata_l4_cso_disabled(void) "TCP/UDP CSO is disabled"
diff --git a/hw/net/virtio-net.c b/hw/net/virtio-net.c
index 3ae909041a..1795e1aa7d 100644
--- a/hw/net/virtio-net.c
+++ b/hw/net/virtio-net.c
@@ -3703,7 +3703,7 @@ static void virtio_net_device_realize(DeviceState *dev, Error **errp)
     QTAILQ_INIT(&n->rsc_chains);
     n->qdev = dev;
 
-    net_rx_pkt_init(&n->rx_pkt, false);
+    net_rx_pkt_init(&n->rx_pkt);
 
     if (virtio_has_feature(n->host_features, VIRTIO_NET_F_RSS)) {
         virtio_net_load_ebpf(n);
diff --git a/hw/net/vmxnet3.c b/hw/net/vmxnet3.c
index eab8fa4d0b..6c6bb2ac37 100644
--- a/hw/net/vmxnet3.c
+++ b/hw/net/vmxnet3.c
@@ -851,10 +851,6 @@ static void vmxnet3_rx_need_csum_calculate(struct NetRxPkt *pkt,
     uint8_t *data;
     int len;
 
-    if (!net_rx_pkt_has_virt_hdr(pkt)) {
-        return;
-    }
-
     vhdr = net_rx_pkt_get_vhdr(pkt);
     if (!VMXNET_FLAG_IS_SET(vhdr->flags, VIRTIO_NET_HDR_F_NEEDS_CSUM)) {
         return;
@@ -898,10 +894,6 @@ static void vmxnet3_rx_update_descr(struct NetRxPkt *pkt,
         rxcd->tci = net_rx_pkt_get_vlan_tag(pkt);
     }
 
-    if (!net_rx_pkt_has_virt_hdr(pkt)) {
-        goto nocsum;
-    }
-
     vhdr = net_rx_pkt_get_vhdr(pkt);
     /*
      * Checksum is valid when lower level tell so or when lower level
@@ -1522,7 +1514,7 @@ static void vmxnet3_activate_device(VMXNET3State *s)
     /* Preallocate TX packet wrapper */
     VMW_CFPRN("Max TX fragments is %u", s->max_tx_frags);
     net_tx_pkt_init(&s->tx_pkt, PCI_DEVICE(s), s->max_tx_frags);
-    net_rx_pkt_init(&s->rx_pkt, s->peer_has_vhdr);
+    net_rx_pkt_init(&s->rx_pkt);
 
     /* Read rings memory locations for RX queues */
     for (i = 0; i < s->rxq_num; i++) {
@@ -2402,7 +2394,7 @@ static int vmxnet3_post_load(void *opaque, int version_id)
     VMXNET3State *s = opaque;
 
     net_tx_pkt_init(&s->tx_pkt, PCI_DEVICE(s), s->max_tx_frags);
-    net_rx_pkt_init(&s->rx_pkt, s->peer_has_vhdr);
+    net_rx_pkt_init(&s->rx_pkt);
 
     if (s->msix_used) {
         vmxnet3_use_msix_vectors(s, VMXNET3_MAX_INTRS);
-- 
2.39.1


