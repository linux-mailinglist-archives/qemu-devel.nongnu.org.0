Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CD9656EBD00
	for <lists+qemu-devel@lfdr.de>; Sun, 23 Apr 2023 06:27:04 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pqRCO-0001x1-78; Sun, 23 Apr 2023 00:19:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1pqRCK-0001wG-Pd
 for qemu-devel@nongnu.org; Sun, 23 Apr 2023 00:19:37 -0400
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1pqRCI-0000k4-PA
 for qemu-devel@nongnu.org; Sun, 23 Apr 2023 00:19:36 -0400
Received: by mail-pl1-x634.google.com with SMTP id
 d9443c01a7336-1a66b9bd7dfso38222775ad.2
 for <qemu-devel@nongnu.org>; Sat, 22 Apr 2023 21:19:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20221208.gappssmtp.com; s=20221208; t=1682223574; x=1684815574;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=91gJjiXM4elMDcz93op4FGE4XiMUzkApzoe6zA52fdE=;
 b=2um7pzx3M7A4wa2VDb9A/EqQ3+qYvpanjDx6T+AwWgMZgDQyzvvYTTPurZ61GNCPBM
 wEXMcM+C9f8O4lFzNCKpeV25BOJRg3dRJnCco5Pt/xRjabV1Ec6E8PKgRyd3JHqRsyhi
 vV+DaAzyaWxhmwnSEE6VvomcZE6jdbIodEdwGwg+xzJmqTdJiGEtg/0egPbO8u4dMn8w
 blOXBOx0wb9bxoDqKOsfOdYdbPabE2Fj9Sy6hesPTkHfSu1CwgU4G78PFx6gAUUnguHF
 9HegcMt4lSH3ZGZyL9kuhhPlMA9Au4oCJpOrZOhs+3ve6nSIO75fRbs2Q9+eL/+IxXxb
 8YiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682223574; x=1684815574;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=91gJjiXM4elMDcz93op4FGE4XiMUzkApzoe6zA52fdE=;
 b=EoxPzyxzrTR4kle0s9tf9vsrrLf4BtOGPMaeM56T4Y8mZqDYP/m+1a7WVkqqoXjXZK
 epTFORkWDfdh0IAf3dbFlNMfGZrxnEA/JwQGPSmxOZlI2bVvb8krKM755hu/4jGVoPhq
 6AfZY5C/jUbu129I55MfbBI1TdypZeWeSzZ3O+e3GLcktYBAQ3QvJjOTXmShTYFBTqYJ
 yOJJrGoAuCW/Jjw1TOa6AsMeO73YmL2/S1KmHKBY1lgga+ONAnqPSDtQ6LI/K7Skroui
 ikbjA88TnoP5GSp9zf+Vsl5//uH1GcJVoxidHJTPVLKO5gxM9c1UR80GhQh/+457tb3N
 zM7A==
X-Gm-Message-State: AAQBX9eeuTX7auB8r/6f1iOfXI7Yw/kN7Oei4yio+WAjyjXTvgQ3mqTz
 dwQEvYBVFwB2/6EEgCu8vA51eMeGYv3TXZZAp4E=
X-Google-Smtp-Source: AKy350acXqAPqqeUidSyGZJ0Z0ZD1wk1kEwneMzFKeMeek2q1LOqUG0WRPxDbMCwVWs+Jd3QFGIwIA==
X-Received: by 2002:a17:902:e5d1:b0:1a1:e237:5f0 with SMTP id
 u17-20020a170902e5d100b001a1e23705f0mr12491144plf.58.1682223574077; 
 Sat, 22 Apr 2023 21:19:34 -0700 (PDT)
Received: from alarm.flets-east.jp ([2400:4050:a840:1e00:4457:c267:5e09:481b])
 by smtp.gmail.com with ESMTPSA id
 f1-20020a170902ff0100b001a5059861adsm4596996plj.224.2023.04.22.21.19.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 22 Apr 2023 21:19:33 -0700 (PDT)
From: Akihiko Odaki <akihiko.odaki@daynix.com>
To: 
Cc: Sriram Yagnaraman <sriram.yagnaraman@est.tech>,
 Jason Wang <jasowang@redhat.com>,
 Dmitry Fleytman <dmitry.fleytman@gmail.com>,
 "Michael S . Tsirkin" <mst@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Thomas Huth <thuth@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 qemu-devel@nongnu.org, Tomasz Dzieciol <t.dzieciol@partner.samsung.com>,
 Akihiko Odaki <akihiko.odaki@daynix.com>
Subject: [PATCH v3 15/47] e1000x: Share more Rx filtering logic
Date: Sun, 23 Apr 2023 13:18:01 +0900
Message-Id: <20230423041833.5302-16-akihiko.odaki@daynix.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230423041833.5302-1-akihiko.odaki@daynix.com>
References: <20230423041833.5302-1-akihiko.odaki@daynix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::634;
 envelope-from=akihiko.odaki@daynix.com; helo=mail-pl1-x634.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

This saves some code and enables tracepoint for e1000's VLAN filtering.

Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
Reviewed-by: Sriram Yagnaraman <sriram.yagnaraman@est.tech>
---
 hw/net/e1000x_common.h |  4 +++-
 hw/net/e1000.c         | 35 +++++--------------------------
 hw/net/e1000e_core.c   | 47 +++++-------------------------------------
 hw/net/e1000x_common.c | 44 +++++++++++++++++++++++++++++++++------
 hw/net/igb_core.c      | 41 +++---------------------------------
 hw/net/trace-events    |  4 ++--
 6 files changed, 56 insertions(+), 119 deletions(-)

diff --git a/hw/net/e1000x_common.h b/hw/net/e1000x_common.h
index 0298e06283..be291684de 100644
--- a/hw/net/e1000x_common.h
+++ b/hw/net/e1000x_common.h
@@ -107,7 +107,9 @@ bool e1000x_rx_ready(PCIDevice *d, uint32_t *mac);
 
 bool e1000x_is_vlan_packet(const void *buf, uint16_t vet);
 
-bool e1000x_rx_group_filter(uint32_t *mac, const uint8_t *buf);
+bool e1000x_rx_vlan_filter(uint32_t *mac, const struct vlan_header *vhdr);
+
+bool e1000x_rx_group_filter(uint32_t *mac, const struct eth_header *ehdr);
 
 bool e1000x_hw_rx_enabled(uint32_t *mac);
 
diff --git a/hw/net/e1000.c b/hw/net/e1000.c
index 18eb6d8876..aae5f0bdc0 100644
--- a/hw/net/e1000.c
+++ b/hw/net/e1000.c
@@ -804,36 +804,11 @@ start_xmit(E1000State *s)
 }
 
 static int
-receive_filter(E1000State *s, const uint8_t *buf, int size)
+receive_filter(E1000State *s, const void *buf)
 {
-    uint32_t rctl = s->mac_reg[RCTL];
-    int isbcast = is_broadcast_ether_addr(buf);
-    int ismcast = is_multicast_ether_addr(buf);
-
-    if (e1000x_is_vlan_packet(buf, le16_to_cpu(s->mac_reg[VET])) &&
-        e1000x_vlan_rx_filter_enabled(s->mac_reg)) {
-        uint16_t vid = lduw_be_p(&PKT_GET_VLAN_HDR(buf)->h_tci);
-        uint32_t vfta =
-            ldl_le_p((uint32_t *)(s->mac_reg + VFTA) +
-                     ((vid >> E1000_VFTA_ENTRY_SHIFT) & E1000_VFTA_ENTRY_MASK));
-        if ((vfta & (1 << (vid & E1000_VFTA_ENTRY_BIT_SHIFT_MASK))) == 0) {
-            return 0;
-        }
-    }
-
-    if (!isbcast && !ismcast && (rctl & E1000_RCTL_UPE)) { /* promiscuous ucast */
-        return 1;
-    }
-
-    if (ismcast && (rctl & E1000_RCTL_MPE)) {          /* promiscuous mcast */
-        return 1;
-    }
-
-    if (isbcast && (rctl & E1000_RCTL_BAM)) {          /* broadcast enabled */
-        return 1;
-    }
-
-    return e1000x_rx_group_filter(s->mac_reg, buf);
+    return (!e1000x_is_vlan_packet(buf, s->mac_reg[VET]) ||
+            e1000x_rx_vlan_filter(s->mac_reg, PKT_GET_VLAN_HDR(buf))) &&
+           e1000x_rx_group_filter(s->mac_reg, buf);
 }
 
 static void
@@ -949,7 +924,7 @@ e1000_receive_iov(NetClientState *nc, const struct iovec *iov, int iovcnt)
         return size;
     }
 
-    if (!receive_filter(s, filter_buf, size)) {
+    if (!receive_filter(s, filter_buf)) {
         return size;
     }
 
diff --git a/hw/net/e1000e_core.c b/hw/net/e1000e_core.c
index f3335194d8..743b36ddfb 100644
--- a/hw/net/e1000e_core.c
+++ b/hw/net/e1000e_core.c
@@ -1034,48 +1034,11 @@ e1000e_rx_l4_cso_enabled(E1000ECore *core)
 }
 
 static bool
-e1000e_receive_filter(E1000ECore *core, const uint8_t *buf, int size)
+e1000e_receive_filter(E1000ECore *core, const void *buf)
 {
-    uint32_t rctl = core->mac[RCTL];
-
-    if (e1000x_is_vlan_packet(buf, core->mac[VET]) &&
-        e1000x_vlan_rx_filter_enabled(core->mac)) {
-        uint16_t vid = lduw_be_p(&PKT_GET_VLAN_HDR(buf)->h_tci);
-        uint32_t vfta =
-            ldl_le_p((uint32_t *)(core->mac + VFTA) +
-                     ((vid >> E1000_VFTA_ENTRY_SHIFT) & E1000_VFTA_ENTRY_MASK));
-        if ((vfta & (1 << (vid & E1000_VFTA_ENTRY_BIT_SHIFT_MASK))) == 0) {
-            trace_e1000e_rx_flt_vlan_mismatch(vid);
-            return false;
-        } else {
-            trace_e1000e_rx_flt_vlan_match(vid);
-        }
-    }
-
-    switch (net_rx_pkt_get_packet_type(core->rx_pkt)) {
-    case ETH_PKT_UCAST:
-        if (rctl & E1000_RCTL_UPE) {
-            return true; /* promiscuous ucast */
-        }
-        break;
-
-    case ETH_PKT_BCAST:
-        if (rctl & E1000_RCTL_BAM) {
-            return true; /* broadcast enabled */
-        }
-        break;
-
-    case ETH_PKT_MCAST:
-        if (rctl & E1000_RCTL_MPE) {
-            return true; /* promiscuous mcast */
-        }
-        break;
-
-    default:
-        g_assert_not_reached();
-    }
-
-    return e1000x_rx_group_filter(core->mac, buf);
+    return (!e1000x_is_vlan_packet(buf, core->mac[VET]) ||
+            e1000x_rx_vlan_filter(core->mac, PKT_GET_VLAN_HDR(buf))) &&
+           e1000x_rx_group_filter(core->mac, buf);
 }
 
 static inline void
@@ -1736,7 +1699,7 @@ e1000e_receive_internal(E1000ECore *core, const struct iovec *iov, int iovcnt,
     net_rx_pkt_set_packet_type(core->rx_pkt,
         get_eth_packet_type(PKT_GET_ETH_HDR(min_buf)));
 
-    if (!e1000e_receive_filter(core, min_buf, size)) {
+    if (!e1000e_receive_filter(core, min_buf)) {
         trace_e1000e_rx_flt_dropped();
         return orig_size;
     }
diff --git a/hw/net/e1000x_common.c b/hw/net/e1000x_common.c
index 7694673bcc..6cc23138a8 100644
--- a/hw/net/e1000x_common.c
+++ b/hw/net/e1000x_common.c
@@ -58,32 +58,64 @@ bool e1000x_is_vlan_packet(const void *buf, uint16_t vet)
     return res;
 }
 
-bool e1000x_rx_group_filter(uint32_t *mac, const uint8_t *buf)
+bool e1000x_rx_vlan_filter(uint32_t *mac, const struct vlan_header *vhdr)
+{
+    if (e1000x_vlan_rx_filter_enabled(mac)) {
+        uint16_t vid = lduw_be_p(&vhdr->h_tci);
+        uint32_t vfta =
+            ldl_le_p((uint32_t *)(mac + VFTA) +
+                     ((vid >> E1000_VFTA_ENTRY_SHIFT) & E1000_VFTA_ENTRY_MASK));
+        if ((vfta & (1 << (vid & E1000_VFTA_ENTRY_BIT_SHIFT_MASK))) == 0) {
+            trace_e1000x_rx_flt_vlan_mismatch(vid);
+            return false;
+        }
+
+        trace_e1000x_rx_flt_vlan_match(vid);
+    }
+
+    return true;
+}
+
+bool e1000x_rx_group_filter(uint32_t *mac, const struct eth_header *ehdr)
 {
     static const int mta_shift[] = { 4, 3, 2, 0 };
     uint32_t f, ra[2], *rp, rctl = mac[RCTL];
 
+    if (is_broadcast_ether_addr(ehdr->h_dest)) {
+        if (rctl & E1000_RCTL_BAM) {
+            return true;
+        }
+    } else if (is_multicast_ether_addr(ehdr->h_dest)) {
+        if (rctl & E1000_RCTL_MPE) {
+            return true;
+        }
+    } else {
+        if (rctl & E1000_RCTL_UPE) {
+            return true;
+        }
+    }
+
     for (rp = mac + RA; rp < mac + RA + 32; rp += 2) {
         if (!(rp[1] & E1000_RAH_AV)) {
             continue;
         }
         ra[0] = cpu_to_le32(rp[0]);
         ra[1] = cpu_to_le32(rp[1]);
-        if (!memcmp(buf, (uint8_t *)ra, ETH_ALEN)) {
+        if (!memcmp(ehdr->h_dest, (uint8_t *)ra, ETH_ALEN)) {
             trace_e1000x_rx_flt_ucast_match((int)(rp - mac - RA) / 2,
-                                            MAC_ARG(buf));
+                                            MAC_ARG(ehdr->h_dest));
             return true;
         }
     }
-    trace_e1000x_rx_flt_ucast_mismatch(MAC_ARG(buf));
+    trace_e1000x_rx_flt_ucast_mismatch(MAC_ARG(ehdr->h_dest));
 
     f = mta_shift[(rctl >> E1000_RCTL_MO_SHIFT) & 3];
-    f = (((buf[5] << 8) | buf[4]) >> f) & 0xfff;
+    f = (((ehdr->h_dest[5] << 8) | ehdr->h_dest[4]) >> f) & 0xfff;
     if (mac[MTA + (f >> 5)] & (1 << (f & 0x1f))) {
         return true;
     }
 
-    trace_e1000x_rx_flt_inexact_mismatch(MAC_ARG(buf),
+    trace_e1000x_rx_flt_inexact_mismatch(MAC_ARG(ehdr->h_dest),
                                          (rctl >> E1000_RCTL_MO_SHIFT) & 3,
                                          f >> 5,
                                          mac[MTA + (f >> 5)]);
diff --git a/hw/net/igb_core.c b/hw/net/igb_core.c
index 1d7f913e5a..d8fd0e1813 100644
--- a/hw/net/igb_core.c
+++ b/hw/net/igb_core.c
@@ -976,7 +976,6 @@ static uint16_t igb_receive_assign(IGBCore *core, const L2Header *l2_header,
     uint16_t queues = 0;
     uint16_t oversized = 0;
     uint16_t vid = be16_to_cpu(l2_header->vlan.h_tci) & VLAN_VID_MASK;
-    bool accepted = false;
     int i;
 
     memset(rss_info, 0, sizeof(E1000E_RSSInfo));
@@ -986,16 +985,8 @@ static uint16_t igb_receive_assign(IGBCore *core, const L2Header *l2_header,
     }
 
     if (e1000x_is_vlan_packet(ehdr, core->mac[VET] & 0xffff) &&
-        e1000x_vlan_rx_filter_enabled(core->mac)) {
-        uint32_t vfta =
-            ldl_le_p((uint32_t *)(core->mac + VFTA) +
-                     ((vid >> E1000_VFTA_ENTRY_SHIFT) & E1000_VFTA_ENTRY_MASK));
-        if ((vfta & (1 << (vid & E1000_VFTA_ENTRY_BIT_SHIFT_MASK))) == 0) {
-            trace_e1000e_rx_flt_vlan_mismatch(vid);
-            return queues;
-        } else {
-            trace_e1000e_rx_flt_vlan_match(vid);
-        }
+        !e1000x_rx_vlan_filter(core->mac, PKT_GET_VLAN_HDR(ehdr))) {
+        return queues;
     }
 
     if (core->mac[MRQC] & 1) {
@@ -1103,33 +1094,7 @@ static uint16_t igb_receive_assign(IGBCore *core, const L2Header *l2_header,
             }
         }
     } else {
-        switch (net_rx_pkt_get_packet_type(core->rx_pkt)) {
-        case ETH_PKT_UCAST:
-            if (rctl & E1000_RCTL_UPE) {
-                accepted = true; /* promiscuous ucast */
-            }
-            break;
-
-        case ETH_PKT_BCAST:
-            if (rctl & E1000_RCTL_BAM) {
-                accepted = true; /* broadcast enabled */
-            }
-            break;
-
-        case ETH_PKT_MCAST:
-            if (rctl & E1000_RCTL_MPE) {
-                accepted = true; /* promiscuous mcast */
-            }
-            break;
-
-        default:
-            g_assert_not_reached();
-        }
-
-        if (!accepted) {
-            accepted = e1000x_rx_group_filter(core->mac, ehdr->h_dest);
-        }
-
+        bool accepted = e1000x_rx_group_filter(core->mac, ehdr);
         if (!accepted) {
             for (macp = core->mac + RA2; macp < core->mac + RA2 + 16; macp += 2) {
                 if (!(macp[1] & E1000_RAH_AV)) {
diff --git a/hw/net/trace-events b/hw/net/trace-events
index d35554fce8..a34d196ff7 100644
--- a/hw/net/trace-events
+++ b/hw/net/trace-events
@@ -106,6 +106,8 @@ e1000_receiver_overrun(size_t s, uint32_t rdh, uint32_t rdt) "Receiver overrun:
 # e1000x_common.c
 e1000x_rx_can_recv_disabled(bool link_up, bool rx_enabled, bool pci_master) "link_up: %d, rx_enabled %d, pci_master %d"
 e1000x_vlan_is_vlan_pkt(bool is_vlan_pkt, uint16_t eth_proto, uint16_t vet) "Is VLAN packet: %d, ETH proto: 0x%X, VET: 0x%X"
+e1000x_rx_flt_vlan_mismatch(uint16_t vid) "VID mismatch: 0x%X"
+e1000x_rx_flt_vlan_match(uint16_t vid) "VID match: 0x%X"
 e1000x_rx_flt_ucast_match(uint32_t idx, uint8_t b0, uint8_t b1, uint8_t b2, uint8_t b3, uint8_t b4, uint8_t b5) "unicast match[%d]: %02x:%02x:%02x:%02x:%02x:%02x"
 e1000x_rx_flt_ucast_mismatch(uint8_t b0, uint8_t b1, uint8_t b2, uint8_t b3, uint8_t b4, uint8_t b5) "unicast mismatch: %02x:%02x:%02x:%02x:%02x:%02x"
 e1000x_rx_flt_inexact_mismatch(uint8_t b0, uint8_t b1, uint8_t b2, uint8_t b3, uint8_t b4, uint8_t b5, uint32_t mo, uint32_t mta, uint32_t mta_val) "inexact mismatch: %02x:%02x:%02x:%02x:%02x:%02x MO %d MTA[%d] 0x%x"
@@ -154,8 +156,6 @@ e1000e_rx_can_recv_rings_full(void) "Cannot receive: all rings are full"
 e1000e_rx_can_recv(void) "Can receive"
 e1000e_rx_has_buffers(int ridx, uint32_t free_desc, size_t total_size, uint32_t desc_buf_size) "ring #%d: free descr: %u, packet size %zu, descr buffer size %u"
 e1000e_rx_null_descriptor(void) "Null RX descriptor!!"
-e1000e_rx_flt_vlan_mismatch(uint16_t vid) "VID mismatch: 0x%X"
-e1000e_rx_flt_vlan_match(uint16_t vid) "VID match: 0x%X"
 e1000e_rx_desc_ps_read(uint64_t a0, uint64_t a1, uint64_t a2, uint64_t a3) "buffers: [0x%"PRIx64", 0x%"PRIx64", 0x%"PRIx64", 0x%"PRIx64"]"
 e1000e_rx_desc_ps_write(uint16_t a0, uint16_t a1, uint16_t a2, uint16_t a3) "bytes written: [%u, %u, %u, %u]"
 e1000e_rx_desc_buff_sizes(uint32_t b0, uint32_t b1, uint32_t b2, uint32_t b3) "buffer sizes: [%u, %u, %u, %u]"
-- 
2.40.0


