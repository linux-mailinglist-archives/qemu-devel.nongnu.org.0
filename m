Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 39CF4678F5A
	for <lists+qemu-devel@lfdr.de>; Tue, 24 Jan 2023 05:37:59 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pKAzW-00034i-4V; Mon, 23 Jan 2023 23:33:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1pKAzU-000341-Cn
 for qemu-devel@nongnu.org; Mon, 23 Jan 2023 23:33:00 -0500
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1pKAzS-0002Ws-Iz
 for qemu-devel@nongnu.org; Mon, 23 Jan 2023 23:33:00 -0500
Received: by mail-pl1-x62f.google.com with SMTP id jl3so13572812plb.8
 for <qemu-devel@nongnu.org>; Mon, 23 Jan 2023 20:32:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=TjvUSqMTfO2wV26xg5K6Oe2+KYUhWxBAs71v1THgt1g=;
 b=bmgtxzm5A8drFzo6WWktGy0e0hdvsbqvyY6sPo9t2YPbI14yf7/sTdOMiy2Y2YCNTE
 9jiveC2oxylja51KClJFXs2OB1ioLq9E0UnYG53ya5QYFj4983YK6msSM58SaRjVGNCd
 EMQuKBcRkseQFQR8TEko+nR9rWmEG7Oj1h2iGT/axcabqCD/cltoHESdMu2S1qcf6Vvt
 t940dZrOi2OjEqHd+VAoNJAfkFWRgIQ5ob9/vGKqd6JncPP7JVSwaEKAy9Ploi2SkAB0
 YmshbR+RLyJIKOCJ7S4jo6rR9cg9lU8II/NnGoHeUJYe7qbAfbt+Z/bdj4oKdN88CZsN
 ttgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=TjvUSqMTfO2wV26xg5K6Oe2+KYUhWxBAs71v1THgt1g=;
 b=qc7IOMQJpx3twZC6P/0kxzihXPAHYKKBbkaMlF3imf5aVRSahOTfVyPcGkeFcQry5Y
 54v2k0EvFQ2MRnzLsZdtoPpbNkzrie9MYdYRUypQ87pEKA6ohu5NhpxbZMDMMBVtAAqG
 iC59AZn2Nyrxo+IfJ2FHYGlFTab5QqsAZUhOu0f5ClzkBFgufnGXXNgkl6x81ka4ZtuT
 25gtJyBGTnDX9ccbqt+BFiLee86Z0zb5Nbv8ULhaWX+TogDMv9YxSxKQWp4eTCtRnQpv
 PK3KXfInZC1P9MHrm9sW7253HPMRCkzbWS/Mxvp6E8l3akW3gU+d9MMRBqeCdAuOZGAp
 yVvQ==
X-Gm-Message-State: AFqh2kpHF3p1xpT1rRpjI1OdgCjcDs0cYmqYrcAL4XtpE6MIvpHj+sED
 /GJIyE0dcemBtwZrstg6uLBQxw==
X-Google-Smtp-Source: AMrXdXuXu1K6nnUVSDyE0g2cRPxkWSqpDkip5dDRHDb6D+isJjNDIjNMJRjYugPIXl5LP2gd1kgh3w==
X-Received: by 2002:a05:6a21:3987:b0:af:be2a:208f with SMTP id
 ad7-20020a056a21398700b000afbe2a208fmr27845265pzc.33.1674534777219; 
 Mon, 23 Jan 2023 20:32:57 -0800 (PST)
Received: from alarm.flets-east.jp ([2400:4050:a840:1e00:4457:c267:5e09:481b])
 by smtp.gmail.com with ESMTPSA id
 z5-20020a170902708500b00196030312ccsm548033plk.78.2023.01.23.20.32.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Jan 2023 20:32:56 -0800 (PST)
From: Akihiko Odaki <akihiko.odaki@daynix.com>
To: 
Cc: Jason Wang <jasowang@redhat.com>,
 Dmitry Fleytman <dmitry.fleytman@gmail.com>,
 Thomas Huth <thuth@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org,
 qemu-ppc@nongnu.org, "Michael S. Tsirkin" <mst@redhat.com>,
 Yan Vugenfirer <yvugenfi@redhat.com>,
 Yuri Benditovich <yuri.benditovich@daynix.com>,
 Sriram Yagnaraman <sriram.yagnaraman@est.tech>,
 Akihiko Odaki <akihiko.odaki@daynix.com>
Subject: [PATCH v2 21/26] hw/net/net_tx_pkt: Automatically determine if
 virtio-net header is used
Date: Tue, 24 Jan 2023 13:31:38 +0900
Message-Id: <20230124043143.5515-22-akihiko.odaki@daynix.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230124043143.5515-1-akihiko.odaki@daynix.com>
References: <20230124043143.5515-1-akihiko.odaki@daynix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::62f;
 envelope-from=akihiko.odaki@daynix.com; helo=mail-pl1-x62f.google.com
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

The new function qemu_get_using_vnet_hdr() allows to automatically
determine if virtio-net header is used.

Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
---
 hw/net/e1000e_core.c |  3 +--
 hw/net/net_tx_pkt.c  | 19 ++++++++++---------
 hw/net/net_tx_pkt.h  |  3 +--
 hw/net/vmxnet3.c     |  6 ++----
 4 files changed, 14 insertions(+), 17 deletions(-)

diff --git a/hw/net/e1000e_core.c b/hw/net/e1000e_core.c
index 38d374fba3..954a007151 100644
--- a/hw/net/e1000e_core.c
+++ b/hw/net/e1000e_core.c
@@ -3376,8 +3376,7 @@ e1000e_core_pci_realize(E1000ECore     *core,
         qemu_add_vm_change_state_handler(e1000e_vm_state_change, core);
 
     for (i = 0; i < E1000E_NUM_QUEUES; i++) {
-        net_tx_pkt_init(&core->tx[i].tx_pkt, core->owner,
-                        E1000E_MAX_TX_FRAGS, core->has_vnet);
+        net_tx_pkt_init(&core->tx[i].tx_pkt, core->owner, E1000E_MAX_TX_FRAGS);
     }
 
     net_rx_pkt_init(&core->rx_pkt, core->has_vnet);
diff --git a/hw/net/net_tx_pkt.c b/hw/net/net_tx_pkt.c
index 8a23899a4d..cf46c8457f 100644
--- a/hw/net/net_tx_pkt.c
+++ b/hw/net/net_tx_pkt.c
@@ -35,7 +35,6 @@ struct NetTxPkt {
     PCIDevice *pci_dev;
 
     struct virtio_net_hdr virt_hdr;
-    bool has_virt_hdr;
 
     struct iovec *raw;
     uint32_t raw_frags;
@@ -59,7 +58,7 @@ struct NetTxPkt {
 };
 
 void net_tx_pkt_init(struct NetTxPkt **pkt, PCIDevice *pci_dev,
-    uint32_t max_frags, bool has_virt_hdr)
+    uint32_t max_frags)
 {
     struct NetTxPkt *p = g_malloc0(sizeof *p);
 
@@ -71,10 +70,8 @@ void net_tx_pkt_init(struct NetTxPkt **pkt, PCIDevice *pci_dev,
 
     p->max_payload_frags = max_frags;
     p->max_raw_frags = max_frags;
-    p->has_virt_hdr = has_virt_hdr;
     p->vec[NET_TX_PKT_VHDR_FRAG].iov_base = &p->virt_hdr;
-    p->vec[NET_TX_PKT_VHDR_FRAG].iov_len =
-        p->has_virt_hdr ? sizeof p->virt_hdr : 0;
+    p->vec[NET_TX_PKT_VHDR_FRAG].iov_len = sizeof p->virt_hdr;
     p->vec[NET_TX_PKT_L2HDR_FRAG].iov_base = &p->l2_hdr;
     p->vec[NET_TX_PKT_L3HDR_FRAG].iov_base = &p->l3_hdr;
 
@@ -617,9 +614,11 @@ static bool net_tx_pkt_do_sw_fragmentation(struct NetTxPkt *pkt,
 
 bool net_tx_pkt_send(struct NetTxPkt *pkt, NetClientState *nc)
 {
+    bool using_vnet_hdr = qemu_get_using_vnet_hdr(nc->peer);
+
     assert(pkt);
 
-    if (!pkt->has_virt_hdr &&
+    if (!using_vnet_hdr &&
         pkt->virt_hdr.flags & VIRTIO_NET_HDR_F_NEEDS_CSUM) {
         net_tx_pkt_do_sw_csum(pkt);
     }
@@ -636,11 +635,13 @@ bool net_tx_pkt_send(struct NetTxPkt *pkt, NetClientState *nc)
         }
     }
 
-    if (pkt->has_virt_hdr ||
+    if (using_vnet_hdr ||
         pkt->virt_hdr.gso_type == VIRTIO_NET_HDR_GSO_NONE) {
+        int index = using_vnet_hdr ?
+                    NET_TX_PKT_VHDR_FRAG : NET_TX_PKT_L2HDR_FRAG;
         net_tx_pkt_fix_ip6_payload_len(pkt);
-        net_tx_pkt_sendv(pkt, nc, pkt->vec,
-            pkt->payload_frags + NET_TX_PKT_PL_START_FRAG);
+        net_tx_pkt_sendv(pkt, nc, pkt->vec + index,
+            pkt->payload_frags + NET_TX_PKT_PL_START_FRAG - index);
         return true;
     }
 
diff --git a/hw/net/net_tx_pkt.h b/hw/net/net_tx_pkt.h
index 2e38a5fa69..8d3faa42fb 100644
--- a/hw/net/net_tx_pkt.h
+++ b/hw/net/net_tx_pkt.h
@@ -32,10 +32,9 @@ struct NetTxPkt;
  * @pkt:            packet pointer
  * @pci_dev:        PCI device processing this packet
  * @max_frags:      max tx ip fragments
- * @has_virt_hdr:   device uses virtio header.
  */
 void net_tx_pkt_init(struct NetTxPkt **pkt, PCIDevice *pci_dev,
-    uint32_t max_frags, bool has_virt_hdr);
+    uint32_t max_frags);
 
 /**
  * Clean all tx packet resources.
diff --git a/hw/net/vmxnet3.c b/hw/net/vmxnet3.c
index c63bbb59bd..8c3f5d6e14 100644
--- a/hw/net/vmxnet3.c
+++ b/hw/net/vmxnet3.c
@@ -1521,8 +1521,7 @@ static void vmxnet3_activate_device(VMXNET3State *s)
 
     /* Preallocate TX packet wrapper */
     VMW_CFPRN("Max TX fragments is %u", s->max_tx_frags);
-    net_tx_pkt_init(&s->tx_pkt, PCI_DEVICE(s),
-                    s->max_tx_frags, s->peer_has_vhdr);
+    net_tx_pkt_init(&s->tx_pkt, PCI_DEVICE(s), s->max_tx_frags);
     net_rx_pkt_init(&s->rx_pkt, s->peer_has_vhdr);
 
     /* Read rings memory locations for RX queues */
@@ -2402,8 +2401,7 @@ static int vmxnet3_post_load(void *opaque, int version_id)
 {
     VMXNET3State *s = opaque;
 
-    net_tx_pkt_init(&s->tx_pkt, PCI_DEVICE(s),
-                    s->max_tx_frags, s->peer_has_vhdr);
+    net_tx_pkt_init(&s->tx_pkt, PCI_DEVICE(s), s->max_tx_frags);
     net_rx_pkt_init(&s->rx_pkt, s->peer_has_vhdr);
 
     if (s->msix_used) {
-- 
2.39.0


