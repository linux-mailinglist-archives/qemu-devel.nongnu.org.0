Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 86C926EBCE1
	for <lists+qemu-devel@lfdr.de>; Sun, 23 Apr 2023 06:22:31 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pqRBw-0001r3-0z; Sun, 23 Apr 2023 00:19:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1pqRBt-0001qg-JC
 for qemu-devel@nongnu.org; Sun, 23 Apr 2023 00:19:09 -0400
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1pqRBr-0000k4-Ls
 for qemu-devel@nongnu.org; Sun, 23 Apr 2023 00:19:09 -0400
Received: by mail-pl1-x634.google.com with SMTP id
 d9443c01a7336-1a66b9bd7dfso38220275ad.2
 for <qemu-devel@nongnu.org>; Sat, 22 Apr 2023 21:19:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20221208.gappssmtp.com; s=20221208; t=1682223547; x=1684815547;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=XbX0kk3EzojZbFg8WaqmfhGqaNouPuKvplrb+Gup2Js=;
 b=2hswt8Ea66AzgNT28j9L8H1Ce+UNl3oNrXx+TS75vaO9WsV1AJthJ29gzL3nuGR6Jo
 64yXL1ReRGSJ0d1DGtFtj0bzZ3dwfdog/TaChw+CkR6DyekkrTZXb7p3Mur/7C3qPAh+
 udSHZ2RcAUWyM4A0Yd1eIqUnuxZO+jsm98IqkB4qCrMRYdYlht1VOu5grifkzCg24CqW
 KiQGDO5Rg5quRcLVrEhjsHl12AcLk/bG6pfPC9uGRpt2KXmA9cbRoMUZIoal2bIdVmjo
 01qTFU72Antlk6ccy4Ps+r/szdpCIyLqa79SC6nF2IAMSyU9JxjHXmqXln+znPWKe1IC
 FgWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682223547; x=1684815547;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=XbX0kk3EzojZbFg8WaqmfhGqaNouPuKvplrb+Gup2Js=;
 b=fY6epA2Rc2VBcvZkPmPE/J8fSiBU+oSxaYr+9ZONW3jOrFdcXpiUDIJ5LgoGFKOFEa
 lqWNI18twjwwxCfnqyubaqrw+QIMt6DeIWhKFzUPVfmF/3AP3bJn6HSok+y2d8hHxga/
 oFRlXiVqdfd66L3y2XM3Zgizzd7HUdlQ7k6VYQrmm9e9Bo5vMzy1X8aK9EKo3Ivhyx2Z
 ZHvsqowFTrdMwm7gSjk3361ADaxA079fxitsjwGUpeJH+cW1C5JqianfnB7Mb8JxDTOS
 FBlWGjguHSXN70rtqlf0w+dtO0w/wF+A9oJlz9K0Mx13vqIupWTqAKhaDgWaTbtu7tgA
 AXMg==
X-Gm-Message-State: AAQBX9cxIusOrtiYrnnf9rVGby06QecEueslFt++rF5QfHNIbkwUV2ov
 kZyzk4PO9gMKNo08XqbUgaSHMw==
X-Google-Smtp-Source: AKy350aO0ZLTeVAcY6uJ11f2e+ya8gygUjkWTwnWwKmEaKNezGUO6l0yxtg7I2N1buU8cSmQuQtY2Q==
X-Received: by 2002:a17:902:e883:b0:1a6:bb7b:7a68 with SMTP id
 w3-20020a170902e88300b001a6bb7b7a68mr13697723plg.37.1682223546977; 
 Sat, 22 Apr 2023 21:19:06 -0700 (PDT)
Received: from alarm.flets-east.jp ([2400:4050:a840:1e00:4457:c267:5e09:481b])
 by smtp.gmail.com with ESMTPSA id
 f1-20020a170902ff0100b001a5059861adsm4596996plj.224.2023.04.22.21.19.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 22 Apr 2023 21:19:06 -0700 (PDT)
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
Subject: [PATCH v3 07/47] net/net_rx_pkt: Use iovec for
 net_rx_pkt_set_protocols()
Date: Sun, 23 Apr 2023 13:17:53 +0900
Message-Id: <20230423041833.5302-8-akihiko.odaki@daynix.com>
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

igb does not properly ensure the buffer passed to
net_rx_pkt_set_protocols() is contiguous for the entire L2/L3/L4 header.
Allow it to pass scattered data to net_rx_pkt_set_protocols().

Fixes: 3a977deebe ("Intrdocue igb device emulation")
Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
Reviewed-by: Sriram Yagnaraman <sriram.yagnaraman@est.tech>
---
 hw/net/net_rx_pkt.h | 10 ++++++----
 include/net/eth.h   |  6 +++---
 hw/net/igb_core.c   |  2 +-
 hw/net/net_rx_pkt.c | 14 +++++---------
 hw/net/virtio-net.c |  7 +++++--
 hw/net/vmxnet3.c    |  7 ++++++-
 net/eth.c           | 18 ++++++++----------
 7 files changed, 34 insertions(+), 30 deletions(-)

diff --git a/hw/net/net_rx_pkt.h b/hw/net/net_rx_pkt.h
index d00b484900..a06f5c2675 100644
--- a/hw/net/net_rx_pkt.h
+++ b/hw/net/net_rx_pkt.h
@@ -55,12 +55,14 @@ size_t net_rx_pkt_get_total_len(struct NetRxPkt *pkt);
  * parse and set packet analysis results
  *
  * @pkt:            packet
- * @data:           pointer to the data buffer to be parsed
- * @len:            data length
+ * @iov:            received data scatter-gather list
+ * @iovcnt:         number of elements in iov
+ * @iovoff:         data start offset in the iov
  *
  */
-void net_rx_pkt_set_protocols(struct NetRxPkt *pkt, const void *data,
-                              size_t len);
+void net_rx_pkt_set_protocols(struct NetRxPkt *pkt,
+                              const struct iovec *iov, size_t iovcnt,
+                              size_t iovoff);
 
 /**
  * fetches packet analysis results
diff --git a/include/net/eth.h b/include/net/eth.h
index c5ae4493b4..9f19c3a695 100644
--- a/include/net/eth.h
+++ b/include/net/eth.h
@@ -312,10 +312,10 @@ eth_get_l2_hdr_length(const void *p)
 }
 
 static inline uint32_t
-eth_get_l2_hdr_length_iov(const struct iovec *iov, int iovcnt)
+eth_get_l2_hdr_length_iov(const struct iovec *iov, size_t iovcnt, size_t iovoff)
 {
     uint8_t p[sizeof(struct eth_header) + sizeof(struct vlan_header)];
-    size_t copied = iov_to_buf(iov, iovcnt, 0, p, ARRAY_SIZE(p));
+    size_t copied = iov_to_buf(iov, iovcnt, iovoff, p, ARRAY_SIZE(p));
 
     if (copied < ARRAY_SIZE(p)) {
         return copied;
@@ -397,7 +397,7 @@ typedef struct eth_l4_hdr_info_st {
     bool has_tcp_data;
 } eth_l4_hdr_info;
 
-void eth_get_protocols(const struct iovec *iov, int iovcnt,
+void eth_get_protocols(const struct iovec *iov, size_t iovcnt, size_t iovoff,
                        bool *hasip4, bool *hasip6,
                        size_t *l3hdr_off,
                        size_t *l4hdr_off,
diff --git a/hw/net/igb_core.c b/hw/net/igb_core.c
index eaca5bd2b6..21a8d9ada4 100644
--- a/hw/net/igb_core.c
+++ b/hw/net/igb_core.c
@@ -1650,7 +1650,7 @@ igb_receive_internal(IGBCore *core, const struct iovec *iov, int iovcnt,
 
     ehdr = PKT_GET_ETH_HDR(filter_buf);
     net_rx_pkt_set_packet_type(core->rx_pkt, get_eth_packet_type(ehdr));
-    net_rx_pkt_set_protocols(core->rx_pkt, filter_buf, size);
+    net_rx_pkt_set_protocols(core->rx_pkt, iov, iovcnt, iov_ofs);
 
     queues = igb_receive_assign(core, ehdr, size, &rss_info, external_tx);
     if (!queues) {
diff --git a/hw/net/net_rx_pkt.c b/hw/net/net_rx_pkt.c
index 39cdea06de..63be6e05ad 100644
--- a/hw/net/net_rx_pkt.c
+++ b/hw/net/net_rx_pkt.c
@@ -103,7 +103,7 @@ net_rx_pkt_pull_data(struct NetRxPkt *pkt,
                                 iov, iovcnt, ploff, pkt->tot_len);
     }
 
-    eth_get_protocols(pkt->vec, pkt->vec_len, &pkt->hasip4, &pkt->hasip6,
+    eth_get_protocols(pkt->vec, pkt->vec_len, 0, &pkt->hasip4, &pkt->hasip6,
                       &pkt->l3hdr_off, &pkt->l4hdr_off, &pkt->l5hdr_off,
                       &pkt->ip6hdr_info, &pkt->ip4hdr_info, &pkt->l4hdr_info);
 
@@ -186,17 +186,13 @@ size_t net_rx_pkt_get_total_len(struct NetRxPkt *pkt)
     return pkt->tot_len;
 }
 
-void net_rx_pkt_set_protocols(struct NetRxPkt *pkt, const void *data,
-                              size_t len)
+void net_rx_pkt_set_protocols(struct NetRxPkt *pkt,
+                              const struct iovec *iov, size_t iovcnt,
+                              size_t iovoff)
 {
-    const struct iovec iov = {
-        .iov_base = (void *)data,
-        .iov_len = len
-    };
-
     assert(pkt);
 
-    eth_get_protocols(&iov, 1, &pkt->hasip4, &pkt->hasip6,
+    eth_get_protocols(iov, iovcnt, iovoff, &pkt->hasip4, &pkt->hasip6,
                       &pkt->l3hdr_off, &pkt->l4hdr_off, &pkt->l5hdr_off,
                       &pkt->ip6hdr_info, &pkt->ip4hdr_info, &pkt->l4hdr_info);
 }
diff --git a/hw/net/virtio-net.c b/hw/net/virtio-net.c
index 53e1c32643..37551fd854 100644
--- a/hw/net/virtio-net.c
+++ b/hw/net/virtio-net.c
@@ -1835,9 +1835,12 @@ static int virtio_net_process_rss(NetClientState *nc, const uint8_t *buf,
         VIRTIO_NET_HASH_REPORT_UDPv6,
         VIRTIO_NET_HASH_REPORT_UDPv6_EX
     };
+    struct iovec iov = {
+        .iov_base = (void *)buf,
+        .iov_len = size
+    };
 
-    net_rx_pkt_set_protocols(pkt, buf + n->host_hdr_len,
-                             size - n->host_hdr_len);
+    net_rx_pkt_set_protocols(pkt, &iov, 1, n->host_hdr_len);
     net_rx_pkt_get_protocols(pkt, &hasip4, &hasip6, &l4hdr_proto);
     net_hash_type = virtio_net_get_hash_type(hasip4, hasip6, l4hdr_proto,
                                              n->rss_data.hash_types);
diff --git a/hw/net/vmxnet3.c b/hw/net/vmxnet3.c
index 9acff310e7..05f41b6dfa 100644
--- a/hw/net/vmxnet3.c
+++ b/hw/net/vmxnet3.c
@@ -2001,7 +2001,12 @@ vmxnet3_receive(NetClientState *nc, const uint8_t *buf, size_t size)
         get_eth_packet_type(PKT_GET_ETH_HDR(buf)));
 
     if (vmxnet3_rx_filter_may_indicate(s, buf, size)) {
-        net_rx_pkt_set_protocols(s->rx_pkt, buf, size);
+        struct iovec iov = {
+            .iov_base = (void *)buf,
+            .iov_len = size
+        };
+
+        net_rx_pkt_set_protocols(s->rx_pkt, &iov, 1, 0);
         vmxnet3_rx_need_csum_calculate(s->rx_pkt, buf, size);
         net_rx_pkt_attach_data(s->rx_pkt, buf, size, s->rx_vlan_stripping);
         bytes_indicated = vmxnet3_indicate_packet(s) ? size : -1;
diff --git a/net/eth.c b/net/eth.c
index 70bcd8e355..d7b30df79f 100644
--- a/net/eth.c
+++ b/net/eth.c
@@ -136,7 +136,7 @@ _eth_tcp_has_data(bool is_ip4,
     return l4len > TCP_HEADER_DATA_OFFSET(tcp);
 }
 
-void eth_get_protocols(const struct iovec *iov, int iovcnt,
+void eth_get_protocols(const struct iovec *iov, size_t iovcnt, size_t iovoff,
                        bool *hasip4, bool *hasip6,
                        size_t *l3hdr_off,
                        size_t *l4hdr_off,
@@ -147,26 +147,24 @@ void eth_get_protocols(const struct iovec *iov, int iovcnt,
 {
     int proto;
     bool fragment = false;
-    size_t l2hdr_len = eth_get_l2_hdr_length_iov(iov, iovcnt);
     size_t input_size = iov_size(iov, iovcnt);
     size_t copied;
     uint8_t ip_p;
 
     *hasip4 = *hasip6 = false;
+    *l3hdr_off = iovoff + eth_get_l2_hdr_length_iov(iov, iovcnt, iovoff);
     l4hdr_info->proto = ETH_L4_HDR_PROTO_INVALID;
 
-    proto = eth_get_l3_proto(iov, iovcnt, l2hdr_len);
-
-    *l3hdr_off = l2hdr_len;
+    proto = eth_get_l3_proto(iov, iovcnt, *l3hdr_off);
 
     if (proto == ETH_P_IP) {
         struct ip_header *iphdr = &ip4hdr_info->ip4_hdr;
 
-        if (input_size < l2hdr_len) {
+        if (input_size < *l3hdr_off) {
             return;
         }
 
-        copied = iov_to_buf(iov, iovcnt, l2hdr_len, iphdr, sizeof(*iphdr));
+        copied = iov_to_buf(iov, iovcnt, *l3hdr_off, iphdr, sizeof(*iphdr));
         if (copied < sizeof(*iphdr) ||
             IP_HEADER_VERSION(iphdr) != IP_HEADER_VERSION_4) {
             return;
@@ -175,17 +173,17 @@ void eth_get_protocols(const struct iovec *iov, int iovcnt,
         *hasip4 = true;
         ip_p = iphdr->ip_p;
         ip4hdr_info->fragment = IP4_IS_FRAGMENT(iphdr);
-        *l4hdr_off = l2hdr_len + IP_HDR_GET_LEN(iphdr);
+        *l4hdr_off = *l3hdr_off + IP_HDR_GET_LEN(iphdr);
 
         fragment = ip4hdr_info->fragment;
     } else if (proto == ETH_P_IPV6) {
-        if (!eth_parse_ipv6_hdr(iov, iovcnt, l2hdr_len, ip6hdr_info)) {
+        if (!eth_parse_ipv6_hdr(iov, iovcnt, *l3hdr_off, ip6hdr_info)) {
             return;
         }
 
         *hasip6 = true;
         ip_p = ip6hdr_info->l4proto;
-        *l4hdr_off = l2hdr_len + ip6hdr_info->full_hdr_len;
+        *l4hdr_off = *l3hdr_off + ip6hdr_info->full_hdr_len;
         fragment = ip6hdr_info->fragment;
     } else {
         return;
-- 
2.40.0


