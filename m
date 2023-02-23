Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DB53D6A060C
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Feb 2023 11:23:57 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pV8k1-0007aa-Su; Thu, 23 Feb 2023 05:22:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1pV8jq-0007LX-IR
 for qemu-devel@nongnu.org; Thu, 23 Feb 2023 05:22:11 -0500
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1pV8jo-0002Vw-A0
 for qemu-devel@nongnu.org; Thu, 23 Feb 2023 05:22:10 -0500
Received: by mail-pj1-x1031.google.com with SMTP id
 nw10-20020a17090b254a00b00233d7314c1cso12327793pjb.5
 for <qemu-devel@nongnu.org>; Thu, 23 Feb 2023 02:22:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=jv/afEJcthyHIvIcMbqTIPEoZmHEVzJWfRny7dTpMv8=;
 b=NudaUypXc0OPHY1wmcmEg7zUdLV1lzyLtV5oZ3fZ45Gf4+VbMmo1xq1V1apKPOQCNN
 6X66jptVR9IyD0u3gMzHitop9bsy3kZesXCk1cCPLqksUMvAYi0nvTNaPSGgPPyWoa3c
 qnlS+qazKO8DX7KISxkvYOnNMYvMl0DWyLnmMoLJurJVn4+XJyHChG9sy21Qypt7+UWM
 nx/5I6oGzI4YM/IzRRqYx32a19Z+BNlc2IpvZNXWERm20iYwMiHYpuJoO2dTtUhMmwMz
 1AEFWCWMBPNpiiKeYULm4s9HO0oBQVyrvOvn/tf7+Q5c/tnrR0qA3P0wF92oR/+hB0Ap
 8+LA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=jv/afEJcthyHIvIcMbqTIPEoZmHEVzJWfRny7dTpMv8=;
 b=ID2Ik1zN5lmKX/4NAhh435BGnF4+CaqpwCekVY6lAHmge868483lxbWP+UgsJandr4
 ysQmIq2actcQqToW8+3aN9X63nEDwV2wlvGs75qOjJM7PLf+YWOLfEP3NDtzo8mKijUW
 7tVhxLVDy2iy9/giGeU03NIVV/sRzUhVekKzIf4YRujZS8tH6H6NywSN17C/oKLU5wz9
 0cFiP1zdFf8aOYp5yWhZCkSIRrMEOo/n6ai4KVfsM/cbClsvOSc9eGCoF54zsN3N10e+
 B17Tcz6D0Oa3exH7LeBxUO/MZrLQV+z8yx43IzmLlPhfXNikLqkXHwXZkWtFDk9ht6im
 HcPw==
X-Gm-Message-State: AO0yUKWGoxJcPLOPf8GGCHuJZ2p2p4F4tnf5mCyhE3toplwTXBysDgqQ
 U9ozXLQai1BlL0RLyoViUOPaUQ==
X-Google-Smtp-Source: AK7set+dpn8toQCR0qAVCTtDC4usUY578BmRPp4lFKFhfx6YMQ5dOkb5jax8Cv1UngK8NbnpSrKJXA==
X-Received: by 2002:a17:902:ecc4:b0:19a:9945:a7aa with SMTP id
 a4-20020a170902ecc400b0019a9945a7aamr16600553plh.20.1677147727614; 
 Thu, 23 Feb 2023 02:22:07 -0800 (PST)
Received: from alarm.flets-east.jp ([2400:4050:a840:1e00:4457:c267:5e09:481b])
 by smtp.gmail.com with ESMTPSA id
 c20-20020a170902c1d400b00196217f1219sm4107734plc.70.2023.02.23.02.22.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 Feb 2023 02:22:07 -0800 (PST)
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
Subject: [PATCH v6 25/34] hw/net/net_tx_pkt: Implement TCP segmentation
Date: Thu, 23 Feb 2023 19:20:09 +0900
Message-Id: <20230223102018.141748-26-akihiko.odaki@daynix.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230223102018.141748-1-akihiko.odaki@daynix.com>
References: <20230223102018.141748-1-akihiko.odaki@daynix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::1031;
 envelope-from=akihiko.odaki@daynix.com; helo=mail-pj1-x1031.google.com
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

There was no proper implementation of TCP segmentation before this
change, and net_tx_pkt relied solely on IPv4 fragmentation. Not only
this is not aligned with the specification, but it also resulted in
corrupted IPv6 packets.

This is particularly problematic for the igb, a new proposed device
implementation; igb provides loopback feature for VMDq and the feature
relies on software segmentation.

Implement proper TCP segmentation in net_tx_pkt to fix such a scenario.

Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
---
 hw/net/net_tx_pkt.c | 248 ++++++++++++++++++++++++++++++++++++--------
 include/net/eth.h   |   5 -
 net/eth.c           |  27 -----
 3 files changed, 206 insertions(+), 74 deletions(-)

diff --git a/hw/net/net_tx_pkt.c b/hw/net/net_tx_pkt.c
index 6afd3f6693..4a35e8429d 100644
--- a/hw/net/net_tx_pkt.c
+++ b/hw/net/net_tx_pkt.c
@@ -326,7 +326,8 @@ bool net_tx_pkt_build_vheader(struct NetTxPkt *pkt, bool tso_enable,
     case VIRTIO_NET_HDR_GSO_TCPV6:
         bytes_read = iov_to_buf(&pkt->vec[NET_TX_PKT_PL_START_FRAG],
                                 pkt->payload_frags, 0, &l4hdr, sizeof(l4hdr));
-        if (bytes_read < sizeof(l4hdr)) {
+        if (bytes_read < sizeof(l4hdr) ||
+            l4hdr.th_off * sizeof(uint32_t) < sizeof(l4hdr)) {
             return false;
         }
 
@@ -466,15 +467,14 @@ void net_tx_pkt_reset(struct NetTxPkt *pkt)
     pkt->l4proto = 0;
 }
 
-static void net_tx_pkt_do_sw_csum(struct NetTxPkt *pkt)
+static void net_tx_pkt_do_sw_csum(struct NetTxPkt *pkt,
+                                  struct iovec *iov, uint32_t iov_len,
+                                  uint16_t csl)
 {
-    struct iovec *iov = &pkt->vec[NET_TX_PKT_L2HDR_FRAG];
     uint32_t csum_cntr;
     uint16_t csum = 0;
     uint32_t cso;
     /* num of iovec without vhdr */
-    uint32_t iov_len = pkt->payload_frags + NET_TX_PKT_PL_START_FRAG - 1;
-    uint16_t csl;
     size_t csum_offset = pkt->virt_hdr.csum_start + pkt->virt_hdr.csum_offset;
     uint16_t l3_proto = eth_get_l3_proto(iov, 1, iov->iov_len);
 
@@ -482,8 +482,6 @@ static void net_tx_pkt_do_sw_csum(struct NetTxPkt *pkt)
     iov_from_buf(iov, iov_len, csum_offset, &csum, sizeof csum);
 
     /* Calculate L4 TCP/UDP checksum */
-    csl = pkt->payload_len;
-
     csum_cntr = 0;
     cso = 0;
     /* add pseudo header to csum */
@@ -509,14 +507,13 @@ static void net_tx_pkt_do_sw_csum(struct NetTxPkt *pkt)
 #define NET_MAX_FRAG_SG_LIST (64)
 
 static size_t net_tx_pkt_fetch_fragment(struct NetTxPkt *pkt,
-    int *src_idx, size_t *src_offset, struct iovec *dst, int *dst_idx)
+    int *src_idx, size_t *src_offset, size_t src_len,
+    struct iovec *dst, int *dst_idx)
 {
     size_t fetched = 0;
     struct iovec *src = pkt->vec;
 
-    *dst_idx = NET_TX_PKT_PL_START_FRAG;
-
-    while (fetched < IP_FRAG_ALIGN_SIZE(pkt->virt_hdr.gso_size)) {
+    while (fetched < src_len) {
 
         /* no more place in fragment iov */
         if (*dst_idx == NET_MAX_FRAG_SG_LIST) {
@@ -531,7 +528,7 @@ static size_t net_tx_pkt_fetch_fragment(struct NetTxPkt *pkt,
 
         dst[*dst_idx].iov_base = src[*src_idx].iov_base + *src_offset;
         dst[*dst_idx].iov_len = MIN(src[*src_idx].iov_len - *src_offset,
-            IP_FRAG_ALIGN_SIZE(pkt->virt_hdr.gso_size) - fetched);
+            src_len - fetched);
 
         *src_offset += dst[*dst_idx].iov_len;
         fetched += dst[*dst_idx].iov_len;
@@ -560,58 +557,223 @@ static void net_tx_pkt_sendv(
     }
 }
 
+static bool net_tx_pkt_tcp_fragment_init(struct NetTxPkt *pkt,
+                                         struct iovec *fragment,
+                                         int *pl_idx,
+                                         size_t *l4hdr_len,
+                                         int *src_idx,
+                                         size_t *src_offset,
+                                         size_t *src_len)
+{
+    struct iovec *l4 = fragment + NET_TX_PKT_PL_START_FRAG;
+    size_t bytes_read = 0;
+    struct tcp_hdr *th;
+
+    if (!pkt->payload_frags) {
+        return false;
+    }
+
+    l4->iov_len = pkt->virt_hdr.hdr_len - pkt->hdr_len;
+    l4->iov_base = g_malloc(l4->iov_len);
+
+    *src_idx = NET_TX_PKT_PL_START_FRAG;
+    while (pkt->vec[*src_idx].iov_len < l4->iov_len - bytes_read) {
+        memcpy((char *)l4->iov_base + bytes_read, pkt->vec[*src_idx].iov_base,
+               pkt->vec[*src_idx].iov_len);
+
+        bytes_read += pkt->vec[*src_idx].iov_len;
+
+        (*src_idx)++;
+        if (*src_idx >= pkt->payload_frags + NET_TX_PKT_PL_START_FRAG) {
+            g_free(l4->iov_base);
+            return false;
+        }
+    }
+
+    *src_offset = l4->iov_len - bytes_read;
+    memcpy((char *)l4->iov_base + bytes_read, pkt->vec[*src_idx].iov_base,
+           *src_offset);
+
+    th = l4->iov_base;
+    th->th_flags &= ~(TH_FIN | TH_PUSH);
+
+    *pl_idx = NET_TX_PKT_PL_START_FRAG + 1;
+    *l4hdr_len = l4->iov_len;
+    *src_len = pkt->virt_hdr.gso_size;
+
+    return true;
+}
+
+static void net_tx_pkt_tcp_fragment_deinit(struct iovec *fragment)
+{
+    g_free(fragment[NET_TX_PKT_PL_START_FRAG].iov_base);
+}
+
+static void net_tx_pkt_tcp_fragment_fix(struct NetTxPkt *pkt,
+                                        struct iovec *fragment,
+                                        size_t fragment_len,
+                                        uint8_t gso_type)
+{
+    struct iovec *l3hdr = fragment + NET_TX_PKT_L3HDR_FRAG;
+    struct iovec *l4hdr = fragment + NET_TX_PKT_PL_START_FRAG;
+    struct ip_header *ip = l3hdr->iov_base;
+    struct ip6_header *ip6 = l3hdr->iov_base;
+    size_t len = l3hdr->iov_len + l4hdr->iov_len + fragment_len;
+
+    switch (gso_type) {
+    case VIRTIO_NET_HDR_GSO_TCPV4:
+        ip->ip_len = cpu_to_be16(len);
+        eth_fix_ip4_checksum(l3hdr->iov_base, l3hdr->iov_len);
+        break;
+
+    case VIRTIO_NET_HDR_GSO_TCPV6:
+        len -= sizeof(struct ip6_header);
+        ip6->ip6_ctlun.ip6_un1.ip6_un1_plen = cpu_to_be16(len);
+        break;
+    }
+}
+
+static void net_tx_pkt_tcp_fragment_advance(struct NetTxPkt *pkt,
+                                            struct iovec *fragment,
+                                            size_t fragment_len,
+                                            uint8_t gso_type)
+{
+    struct iovec *l3hdr = fragment + NET_TX_PKT_L3HDR_FRAG;
+    struct iovec *l4hdr = fragment + NET_TX_PKT_PL_START_FRAG;
+    struct ip_header *ip = l3hdr->iov_base;
+    struct tcp_hdr *th = l4hdr->iov_base;
+
+    if (gso_type == VIRTIO_NET_HDR_GSO_TCPV4) {
+        ip->ip_id = cpu_to_be16(be16_to_cpu(ip->ip_id) + 1);
+    }
+
+    th->th_seq = cpu_to_be32(be32_to_cpu(th->th_seq) + fragment_len);
+    th->th_flags &= ~TH_CWR;
+}
+
+static void net_tx_pkt_udp_fragment_init(struct NetTxPkt *pkt,
+                                         int *pl_idx,
+                                         size_t *l4hdr_len,
+                                         int *src_idx, size_t *src_offset,
+                                         size_t *src_len)
+{
+    *pl_idx = NET_TX_PKT_PL_START_FRAG;
+    *l4hdr_len = 0;
+    *src_idx = NET_TX_PKT_PL_START_FRAG;
+    *src_offset = 0;
+    *src_len = IP_FRAG_ALIGN_SIZE(pkt->virt_hdr.gso_size);
+}
+
+static void net_tx_pkt_udp_fragment_fix(struct NetTxPkt *pkt,
+                                        struct iovec *fragment,
+                                        size_t fragment_offset,
+                                        size_t fragment_len)
+{
+    bool more_frags = fragment_offset + fragment_len < pkt->payload_len;
+    uint16_t orig_flags;
+    struct iovec *l3hdr = fragment + NET_TX_PKT_L3HDR_FRAG;
+    struct ip_header *ip = l3hdr->iov_base;
+    uint16_t frag_off_units = fragment_offset / IP_FRAG_UNIT_SIZE;
+    uint16_t new_ip_off;
+
+    assert(fragment_offset % IP_FRAG_UNIT_SIZE == 0);
+    assert((frag_off_units & ~IP_OFFMASK) == 0);
+
+    orig_flags = be16_to_cpu(ip->ip_off) & ~(IP_OFFMASK | IP_MF);
+    new_ip_off = frag_off_units | orig_flags | (more_frags ? IP_MF : 0);
+    ip->ip_off = cpu_to_be16(new_ip_off);
+    ip->ip_len = cpu_to_be16(l3hdr->iov_len + fragment_len);
+
+    eth_fix_ip4_checksum(l3hdr->iov_base, l3hdr->iov_len);
+}
+
 static bool net_tx_pkt_do_sw_fragmentation(struct NetTxPkt *pkt,
                                            NetTxPktCallback callback,
                                            void *context)
 {
+    uint8_t gso_type = pkt->virt_hdr.gso_type & ~VIRTIO_NET_HDR_GSO_ECN;
+
     struct iovec fragment[NET_MAX_FRAG_SG_LIST];
-    size_t fragment_len = 0;
-    bool more_frags = false;
-
-    /* some pointers for shorter code */
-    void *l2_iov_base, *l3_iov_base;
-    size_t l2_iov_len, l3_iov_len;
-    int src_idx =  NET_TX_PKT_PL_START_FRAG, dst_idx;
-    size_t src_offset = 0;
+    size_t fragment_len;
+    size_t l4hdr_len;
+    size_t src_len;
+
+    int src_idx, dst_idx, pl_idx;
+    size_t src_offset;
     size_t fragment_offset = 0;
     struct virtio_net_hdr virt_hdr = {
         .flags = pkt->virt_hdr.flags & VIRTIO_NET_HDR_F_NEEDS_CSUM ?
                  VIRTIO_NET_HDR_F_DATA_VALID : 0
     };
 
-    l2_iov_base = pkt->vec[NET_TX_PKT_L2HDR_FRAG].iov_base;
-    l2_iov_len = pkt->vec[NET_TX_PKT_L2HDR_FRAG].iov_len;
-    l3_iov_base = pkt->vec[NET_TX_PKT_L3HDR_FRAG].iov_base;
-    l3_iov_len = pkt->vec[NET_TX_PKT_L3HDR_FRAG].iov_len;
-
     /* Copy headers */
     fragment[NET_TX_PKT_VHDR_FRAG].iov_base = &virt_hdr;
     fragment[NET_TX_PKT_VHDR_FRAG].iov_len = sizeof(virt_hdr);
-    fragment[NET_TX_PKT_L2HDR_FRAG].iov_base = l2_iov_base;
-    fragment[NET_TX_PKT_L2HDR_FRAG].iov_len = l2_iov_len;
-    fragment[NET_TX_PKT_L3HDR_FRAG].iov_base = l3_iov_base;
-    fragment[NET_TX_PKT_L3HDR_FRAG].iov_len = l3_iov_len;
+    fragment[NET_TX_PKT_L2HDR_FRAG] = pkt->vec[NET_TX_PKT_L2HDR_FRAG];
+    fragment[NET_TX_PKT_L3HDR_FRAG] = pkt->vec[NET_TX_PKT_L3HDR_FRAG];
 
+    switch (gso_type) {
+    case VIRTIO_NET_HDR_GSO_TCPV4:
+    case VIRTIO_NET_HDR_GSO_TCPV6:
+        if (!net_tx_pkt_tcp_fragment_init(pkt, fragment, &pl_idx, &l4hdr_len,
+                                          &src_idx, &src_offset, &src_len)) {
+            return false;
+        }
+        break;
 
-    /* Put as much data as possible and send */
-    do {
-        fragment_len = net_tx_pkt_fetch_fragment(pkt, &src_idx, &src_offset,
-            fragment, &dst_idx);
+    case VIRTIO_NET_HDR_GSO_UDP:
+        net_tx_pkt_do_sw_csum(pkt, &pkt->vec[NET_TX_PKT_L2HDR_FRAG],
+                              pkt->payload_frags + NET_TX_PKT_PL_START_FRAG - 1,
+                              pkt->payload_len);
+        net_tx_pkt_udp_fragment_init(pkt, &pl_idx, &l4hdr_len,
+                                     &src_idx, &src_offset, &src_len);
+        break;
 
-        more_frags = (fragment_offset + fragment_len < pkt->payload_len);
+    default:
+        abort();
+    }
 
-        eth_setup_ip4_fragmentation(l2_iov_base, l2_iov_len, l3_iov_base,
-            l3_iov_len, fragment_len, fragment_offset, more_frags);
+    /* Put as much data as possible and send */
+    while (true) {
+        dst_idx = pl_idx;
+        fragment_len = net_tx_pkt_fetch_fragment(pkt,
+            &src_idx, &src_offset, src_len, fragment, &dst_idx);
+        if (!fragment_len) {
+            break;
+        }
 
-        eth_fix_ip4_checksum(l3_iov_base, l3_iov_len);
+        switch (gso_type) {
+        case VIRTIO_NET_HDR_GSO_TCPV4:
+        case VIRTIO_NET_HDR_GSO_TCPV6:
+            net_tx_pkt_tcp_fragment_fix(pkt, fragment, fragment_len, gso_type);
+            net_tx_pkt_do_sw_csum(pkt, fragment + NET_TX_PKT_L2HDR_FRAG,
+                                  dst_idx - NET_TX_PKT_L2HDR_FRAG,
+                                  l4hdr_len + fragment_len);
+            break;
+
+        case VIRTIO_NET_HDR_GSO_UDP:
+            net_tx_pkt_udp_fragment_fix(pkt, fragment, fragment_offset,
+                                        fragment_len);
+            break;
+        }
 
         callback(context,
                  fragment + NET_TX_PKT_L2HDR_FRAG, dst_idx - NET_TX_PKT_L2HDR_FRAG,
                  fragment + NET_TX_PKT_VHDR_FRAG, dst_idx - NET_TX_PKT_VHDR_FRAG);
 
+        if (gso_type == VIRTIO_NET_HDR_GSO_TCPV4 ||
+            gso_type == VIRTIO_NET_HDR_GSO_TCPV6) {
+            net_tx_pkt_tcp_fragment_advance(pkt, fragment, fragment_len,
+                                            gso_type);
+        }
+
         fragment_offset += fragment_len;
+    }
 
-    } while (fragment_len && more_frags);
+    if (gso_type == VIRTIO_NET_HDR_GSO_TCPV4 ||
+        gso_type == VIRTIO_NET_HDR_GSO_TCPV6) {
+        net_tx_pkt_tcp_fragment_deinit(fragment);
+    }
 
     return true;
 }
@@ -627,10 +789,6 @@ bool net_tx_pkt_send_custom(struct NetTxPkt *pkt, bool offload,
 {
     assert(pkt);
 
-    if (!offload && pkt->virt_hdr.flags & VIRTIO_NET_HDR_F_NEEDS_CSUM) {
-        net_tx_pkt_do_sw_csum(pkt);
-    }
-
     /*
      * Since underlying infrastructure does not support IP datagrams longer
      * than 64K we should drop such packets and don't even try to send
@@ -644,6 +802,12 @@ bool net_tx_pkt_send_custom(struct NetTxPkt *pkt, bool offload,
     }
 
     if (offload || pkt->virt_hdr.gso_type == VIRTIO_NET_HDR_GSO_NONE) {
+        if (!offload && pkt->virt_hdr.flags & VIRTIO_NET_HDR_F_NEEDS_CSUM) {
+            net_tx_pkt_do_sw_csum(pkt, &pkt->vec[NET_TX_PKT_L2HDR_FRAG],
+                                  pkt->payload_frags + NET_TX_PKT_PL_START_FRAG - 1,
+                                  pkt->payload_len);
+        }
+
         net_tx_pkt_fix_ip6_payload_len(pkt);
         callback(context, pkt->vec + NET_TX_PKT_L2HDR_FRAG,
                  pkt->payload_frags + NET_TX_PKT_PL_START_FRAG - NET_TX_PKT_L2HDR_FRAG,
diff --git a/include/net/eth.h b/include/net/eth.h
index 6e699b0d7a..2b4374fae4 100644
--- a/include/net/eth.h
+++ b/include/net/eth.h
@@ -400,11 +400,6 @@ void eth_get_protocols(const struct iovec *iov, int iovcnt,
                        eth_ip4_hdr_info *ip4hdr_info,
                        eth_l4_hdr_info  *l4hdr_info);
 
-void eth_setup_ip4_fragmentation(const void *l2hdr, size_t l2hdr_len,
-                                 void *l3hdr, size_t l3hdr_len,
-                                 size_t l3payload_len,
-                                 size_t frag_offset, bool more_frags);
-
 void
 eth_fix_ip4_checksum(void *l3hdr, size_t l3hdr_len);
 
diff --git a/net/eth.c b/net/eth.c
index f074b2f9f3..36d39b4357 100644
--- a/net/eth.c
+++ b/net/eth.c
@@ -314,33 +314,6 @@ eth_strip_vlan_ex(const struct iovec *iov, int iovcnt, size_t iovoff,
     return 0;
 }
 
-void
-eth_setup_ip4_fragmentation(const void *l2hdr, size_t l2hdr_len,
-                            void *l3hdr, size_t l3hdr_len,
-                            size_t l3payload_len,
-                            size_t frag_offset, bool more_frags)
-{
-    const struct iovec l2vec = {
-        .iov_base = (void *) l2hdr,
-        .iov_len = l2hdr_len
-    };
-
-    if (eth_get_l3_proto(&l2vec, 1, l2hdr_len) == ETH_P_IP) {
-        uint16_t orig_flags;
-        struct ip_header *iphdr = (struct ip_header *) l3hdr;
-        uint16_t frag_off_units = frag_offset / IP_FRAG_UNIT_SIZE;
-        uint16_t new_ip_off;
-
-        assert(frag_offset % IP_FRAG_UNIT_SIZE == 0);
-        assert((frag_off_units & ~IP_OFFMASK) == 0);
-
-        orig_flags = be16_to_cpu(iphdr->ip_off) & ~(IP_OFFMASK|IP_MF);
-        new_ip_off = frag_off_units | orig_flags  | (more_frags ? IP_MF : 0);
-        iphdr->ip_off = cpu_to_be16(new_ip_off);
-        iphdr->ip_len = cpu_to_be16(l3payload_len + l3hdr_len);
-    }
-}
-
 void
 eth_fix_ip4_checksum(void *l3hdr, size_t l3hdr_len)
 {
-- 
2.39.1


