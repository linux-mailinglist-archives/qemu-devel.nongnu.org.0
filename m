Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B16F680F6A
	for <lists+qemu-devel@lfdr.de>; Mon, 30 Jan 2023 14:53:23 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pMUWv-0005A8-3R; Mon, 30 Jan 2023 08:49:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1pMUWV-0004ho-4W
 for qemu-devel@nongnu.org; Mon, 30 Jan 2023 08:48:42 -0500
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1pMUWS-0003qL-2B
 for qemu-devel@nongnu.org; Mon, 30 Jan 2023 08:48:37 -0500
Received: by mail-pl1-x631.google.com with SMTP id z1so4126228plg.6
 for <qemu-devel@nongnu.org>; Mon, 30 Jan 2023 05:48:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=7I3zAPfeFojTupunid/+QowtllUnj9+g6fk7fhj7MBo=;
 b=QwKmP1ZRO5J9s3Zspl4rGsQW8TPN2diPVm/EwWx5ckBnD+CNhDRRVtuVuDx0tcyDOb
 hss+sBwuGmwInrX8O/TahXAgdn1daP/7oZhGvi5YI8QrAtu4r6//9ycV9IJfpv633Au3
 bSs2K/JvUOS3SkMJML/pjnxCpOhTxUM+ozkaUQvZFY1Xpa9eTZO/WuxLAdPjx1uUyzOm
 iFNYRcuMpgl4ujs9YiHv6viYX4ih96keGwim4wo0n96yeDartGf668T9eDaVK9A45BtS
 CsG0tVbPxCbyLtDHPIbOAUzBNp043u0wvBzberIVb+/v3OOTXZh/osZrSEaiQCK+pex3
 KGpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=7I3zAPfeFojTupunid/+QowtllUnj9+g6fk7fhj7MBo=;
 b=TXgW5MyBUursjkClJJ3RQuJbfOxjQ6BIQl0tl8s5v29ce4XJgeCIGKPxUsYdpISphJ
 gAbd63K+aNulb9s9RQbsS9IgSJszcmuGEsIeMFS4pWA+aUC/A4COJa6TxHh4cGYNy9fJ
 NFvVaAyLgdCle8KO/5RXjgccyvdFEw1VSnDramcXLq4maUXLGAqJI+v7n3NlBML3Ci+F
 cbd1xFHPdStDImqZ/GnIBxfA6ByGAwOgySxny31ubf0Bvtb3IQ1nAw2mqokE1IsURHoN
 7gHxjClRtjx55msyDF4mMn0BhCj3e+hqhkgE3kvWLq6cvCgaLQqM8XRYsK2EaGblqdq0
 +I1g==
X-Gm-Message-State: AO0yUKUszxkMOBr9d2ZkeSvSQ/x0RWTZicde3skGpEIk+lmnjBZ31wNU
 7z1zAfZwuTaT2Ziv/kb+leC9mw==
X-Google-Smtp-Source: AK7set9AcfO+Ax7Wv1BzkqCiDVJvGGw1QZUwzVa+gKsPw7X/ZhS9BH5bRSodqfP65dIeUgj4cJf/+A==
X-Received: by 2002:a17:902:e74d:b0:196:7103:259f with SMTP id
 p13-20020a170902e74d00b001967103259fmr8469622plf.7.1675086514692; 
 Mon, 30 Jan 2023 05:48:34 -0800 (PST)
Received: from alarm.flets-east.jp ([2400:4050:a840:1e00:4457:c267:5e09:481b])
 by smtp.gmail.com with ESMTPSA id
 l13-20020a170902d34d00b0018bc4493005sm7815573plk.269.2023.01.30.05.48.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 Jan 2023 05:48:34 -0800 (PST)
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
Subject: [PATCH v4 22/28] hw/net/net_rx_pkt: Remove net_rx_pkt_has_virt_hdr
Date: Mon, 30 Jan 2023 22:47:09 +0900
Message-Id: <20230130134715.76604-23-akihiko.odaki@daynix.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230130134715.76604-1-akihiko.odaki@daynix.com>
References: <20230130134715.76604-1-akihiko.odaki@daynix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::631;
 envelope-from=akihiko.odaki@daynix.com; helo=mail-pl1-x631.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=unavailable autolearn_force=no
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
index 8c3f5d6e14..f0ded333aa 100644
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


