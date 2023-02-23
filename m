Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ACBF06A05F7
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Feb 2023 11:22:55 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pV8kL-0008PT-8r; Thu, 23 Feb 2023 05:22:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1pV8kI-0008Iu-Ej
 for qemu-devel@nongnu.org; Thu, 23 Feb 2023 05:22:38 -0500
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1pV8kF-0002qM-GS
 for qemu-devel@nongnu.org; Thu, 23 Feb 2023 05:22:38 -0500
Received: by mail-pj1-x102f.google.com with SMTP id
 oe18-20020a17090b395200b00236a0d55d3aso12037934pjb.3
 for <qemu-devel@nongnu.org>; Thu, 23 Feb 2023 02:22:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=FtNP8ggV9yLDfbcYSmXODh6nZac9HheatFlB5fDy0+8=;
 b=iN4UyCUlatJhl+u/q1jpeLE1jKGYhUFU8lvAfLUJ/oknUehQUAAMFB4HQFj4JvTDqx
 UmNHa+NoKqUIPkyu4FNZK6QnGAyyWwd9IVJ0qKvjXdfFArKTPeO7w/DqDKhd82vmtO+j
 DcciFoTquvkK5GLuqi3g0pluov8BpcVd5c2Vt6XFfsufVh419nXfAyJIXuiw7Uv8h8+C
 QobrH5WI9Gy2sGl9xpfEGKLOevU5C0bKIQrXaboO8map6z7d/pqqwIOxr76WF9Kgzw7o
 7qoP/PLu8E7g7upYmIKJWJuAi4y7DUY634AK06rhY5nHx07gQjBz2PwVz7+AUGAf93ko
 3Txg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=FtNP8ggV9yLDfbcYSmXODh6nZac9HheatFlB5fDy0+8=;
 b=h81xAJ+uJYL479MVXn8NiU0imB8yiAlFNr2wZzTRbM4pZ5S3RROHhdvMHRvUoPpVKA
 davMEiOEFPYDBtPPy5LiqXitqcVSbjjZCSo9ElWxLlqmSPnJOSLYKG+HB3H7Awfh114Y
 qva8YUlljov8NW0grvtozXkwZuyw6wU0HQ/NBWBF+BkOuz4HSPfJvELZ5oFiECjRuh2d
 7iaSnP0UkpVRZqimxznSPTWcjxxrjDZRPW1IOZCJP4Xc3LosgdHgzqkeF66HLRMA2707
 sZPrayFmf+AzOOYyrFxOss3hb2uWurQlK+alnTm9+rd1gIz/HPMMMyiNLrDghA5MDWLx
 6yKA==
X-Gm-Message-State: AO0yUKUP3Vz7msUybCLdowUDuKkNSenldz7IjlsXCpRgOrz3ut9K51GS
 jdj/ChMimTE5whskebkPLBibyw==
X-Google-Smtp-Source: AK7set8zZzyzOlf1UnH5tiqEGjgBaXq90d9qZ1ymNTTBPjvJN/N75+Uk4L65iH5+NXqp2uiWumGaJw==
X-Received: by 2002:a17:902:ecc4:b0:196:8292:e879 with SMTP id
 a4-20020a170902ecc400b001968292e879mr15728234plh.1.1677147754206; 
 Thu, 23 Feb 2023 02:22:34 -0800 (PST)
Received: from alarm.flets-east.jp ([2400:4050:a840:1e00:4457:c267:5e09:481b])
 by smtp.gmail.com with ESMTPSA id
 c20-20020a170902c1d400b00196217f1219sm4107734plc.70.2023.02.23.02.22.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 Feb 2023 02:22:33 -0800 (PST)
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
Subject: [PATCH v6 33/34] net/eth: Report if headers are actually present
Date: Thu, 23 Feb 2023 19:20:17 +0900
Message-Id: <20230223102018.141748-34-akihiko.odaki@daynix.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230223102018.141748-1-akihiko.odaki@daynix.com>
References: <20230223102018.141748-1-akihiko.odaki@daynix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::102f;
 envelope-from=akihiko.odaki@daynix.com; helo=mail-pj1-x102f.google.com
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

The values returned by eth_get_protocols() are used to perform RSS,
checksumming and segmentation. Even when a packet signals the use of the
protocols which these operations can be applied to, the headers for them
may not be present because of too short packet or fragmentation, for
example. In such a case, the operations cannot be applied safely.

Report the presence of headers instead of whether the use of the
protocols are indicated with eth_get_protocols(). This also makes
corresponding changes to the callers of eth_get_protocols() to match
with its new signature and to remove redundant checks for fragmentation.

Fixes: 75020a7021 ("Common definitions for VMWARE devices")
Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
---
 hw/net/e1000e_core.c | 65 +++++++++++++++----------------
 hw/net/net_rx_pkt.c  | 86 ++++++++++++++++++++---------------------
 hw/net/net_rx_pkt.h  | 12 +++---
 hw/net/trace-events  |  6 +--
 hw/net/virtio-net.c  | 32 +++++++---------
 hw/net/vmxnet3.c     | 20 +++++-----
 include/net/eth.h    |  4 +-
 net/eth.c            | 91 ++++++++++++++++++++------------------------
 8 files changed, 150 insertions(+), 166 deletions(-)

diff --git a/hw/net/e1000e_core.c b/hw/net/e1000e_core.c
index 326b9a166d..a2974631ef 100644
--- a/hw/net/e1000e_core.c
+++ b/hw/net/e1000e_core.c
@@ -497,27 +497,25 @@ typedef struct E1000E_RSSInfo_st {
 static uint32_t
 e1000e_rss_get_hash_type(E1000ECore *core, struct NetRxPkt *pkt)
 {
-    bool isip4, isip6, isudp, istcp;
+    bool hasip4, hasip6, hasudp, hastcp;
 
     assert(e1000e_rss_enabled(core));
 
-    net_rx_pkt_get_protocols(pkt, &isip4, &isip6, &isudp, &istcp);
+    net_rx_pkt_get_protocols(pkt, &hasip4, &hasip6, &hasudp, &hastcp);
 
-    if (isip4) {
-        bool fragment = net_rx_pkt_get_ip4_info(pkt)->fragment;
-
-        trace_e1000e_rx_rss_ip4(fragment, istcp, core->mac[MRQC],
+    if (hasip4) {
+        trace_e1000e_rx_rss_ip4(hastcp, core->mac[MRQC],
                                 E1000_MRQC_EN_TCPIPV4(core->mac[MRQC]),
                                 E1000_MRQC_EN_IPV4(core->mac[MRQC]));
 
-        if (!fragment && istcp && E1000_MRQC_EN_TCPIPV4(core->mac[MRQC])) {
+        if (hastcp && E1000_MRQC_EN_TCPIPV4(core->mac[MRQC])) {
             return E1000_MRQ_RSS_TYPE_IPV4TCP;
         }
 
         if (E1000_MRQC_EN_IPV4(core->mac[MRQC])) {
             return E1000_MRQ_RSS_TYPE_IPV4;
         }
-    } else if (isip6) {
+    } else if (hasip6) {
         eth_ip6_hdr_info *ip6info = net_rx_pkt_get_ip6_info(pkt);
 
         bool ex_dis = core->mac[RFCTL] & E1000_RFCTL_IPV6_EX_DIS;
@@ -531,7 +529,7 @@ e1000e_rss_get_hash_type(E1000ECore *core, struct NetRxPkt *pkt)
          * backends like these.
          */
         trace_e1000e_rx_rss_ip6_rfctl(core->mac[RFCTL]);
-        trace_e1000e_rx_rss_ip6(ex_dis, new_ex_dis, istcp,
+        trace_e1000e_rx_rss_ip6(ex_dis, new_ex_dis, hastcp,
                                 ip6info->has_ext_hdrs,
                                 ip6info->rss_ex_dst_valid,
                                 ip6info->rss_ex_src_valid,
@@ -544,8 +542,7 @@ e1000e_rss_get_hash_type(E1000ECore *core, struct NetRxPkt *pkt)
             (!new_ex_dis || !(ip6info->rss_ex_dst_valid ||
                               ip6info->rss_ex_src_valid))) {
 
-            if (istcp && !ip6info->fragment &&
-                E1000_MRQC_EN_TCPIPV6(core->mac[MRQC])) {
+            if (hastcp && E1000_MRQC_EN_TCPIPV6(core->mac[MRQC])) {
                 return E1000_MRQ_RSS_TYPE_IPV6TCP;
             }
 
@@ -1127,7 +1124,7 @@ static void
 e1000e_verify_csum_in_sw(E1000ECore *core,
                          struct NetRxPkt *pkt,
                          uint32_t *status_flags,
-                         bool istcp, bool isudp)
+                         bool hastcp, bool hasudp)
 {
     bool csum_valid;
     uint32_t csum_error;
@@ -1155,10 +1152,10 @@ e1000e_verify_csum_in_sw(E1000ECore *core,
 
     csum_error = csum_valid ? 0 : E1000_RXDEXT_STATERR_TCPE;
 
-    if (istcp) {
+    if (hastcp) {
         *status_flags |= E1000_RXD_STAT_TCPCS |
                          csum_error;
-    } else if (isudp) {
+    } else if (hasudp) {
         *status_flags |= E1000_RXD_STAT_TCPCS |
                          E1000_RXD_STAT_UDPCS |
                          csum_error;
@@ -1190,7 +1187,7 @@ e1000e_build_rx_metadata(E1000ECore *core,
                          uint16_t *vlan_tag)
 {
     struct virtio_net_hdr *vhdr;
-    bool isip4, isip6, istcp, isudp;
+    bool hasip4, hasip6, hastcp, hasudp;
     uint32_t pkt_type;
 
     *status_flags = E1000_RXD_STAT_DD;
@@ -1202,8 +1199,8 @@ e1000e_build_rx_metadata(E1000ECore *core,
 
     *status_flags |= E1000_RXD_STAT_EOP;
 
-    net_rx_pkt_get_protocols(pkt, &isip4, &isip6, &isudp, &istcp);
-    trace_e1000e_rx_metadata_protocols(isip4, isip6, isudp, istcp);
+    net_rx_pkt_get_protocols(pkt, &hasip4, &hasip6, &hasudp, &hastcp);
+    trace_e1000e_rx_metadata_protocols(hasip4, hasip6, hasudp, hastcp);
 
     /* VLAN state */
     if (net_rx_pkt_is_vlan_stripped(pkt)) {
@@ -1219,24 +1216,24 @@ e1000e_build_rx_metadata(E1000ECore *core,
             *mrq = cpu_to_le32(rss_info->type | (rss_info->queue << 8));
             trace_e1000e_rx_metadata_rss(*rss, *mrq);
         }
-    } else if (isip4) {
+    } else if (hasip4) {
             *status_flags |= E1000_RXD_STAT_IPIDV;
             *ip_id = cpu_to_le16(net_rx_pkt_get_ip_id(pkt));
             trace_e1000e_rx_metadata_ip_id(*ip_id);
     }
 
-    if (istcp && e1000e_is_tcp_ack(core, pkt)) {
+    if (hastcp && e1000e_is_tcp_ack(core, pkt)) {
         *status_flags |= E1000_RXD_STAT_ACK;
         trace_e1000e_rx_metadata_ack();
     }
 
-    if (isip6 && (core->mac[RFCTL] & E1000_RFCTL_IPV6_DIS)) {
+    if (hasip6 && (core->mac[RFCTL] & E1000_RFCTL_IPV6_DIS)) {
         trace_e1000e_rx_metadata_ipv6_filtering_disabled();
         pkt_type = E1000_RXD_PKT_MAC;
-    } else if (istcp || isudp) {
-        pkt_type = isip4 ? E1000_RXD_PKT_IP4_XDP : E1000_RXD_PKT_IP6_XDP;
-    } else if (isip4 || isip6) {
-        pkt_type = isip4 ? E1000_RXD_PKT_IP4 : E1000_RXD_PKT_IP6;
+    } else if (hastcp || hasudp) {
+        pkt_type = hasip4 ? E1000_RXD_PKT_IP4_XDP : E1000_RXD_PKT_IP6_XDP;
+    } else if (hasip4 || hasip6) {
+        pkt_type = hasip4 ? E1000_RXD_PKT_IP4 : E1000_RXD_PKT_IP6;
     } else {
         pkt_type = E1000_RXD_PKT_MAC;
     }
@@ -1245,7 +1242,7 @@ e1000e_build_rx_metadata(E1000ECore *core,
     trace_e1000e_rx_metadata_pkt_type(pkt_type);
 
     /* RX CSO information */
-    if (isip6 && (core->mac[RFCTL] & E1000_RFCTL_IPV6_XSUM_DIS)) {
+    if (hasip6 && (core->mac[RFCTL] & E1000_RFCTL_IPV6_XSUM_DIS)) {
         trace_e1000e_rx_metadata_ipv6_sum_disabled();
         goto func_exit;
     }
@@ -1255,20 +1252,20 @@ e1000e_build_rx_metadata(E1000ECore *core,
     if (!(vhdr->flags & VIRTIO_NET_HDR_F_DATA_VALID) &&
         !(vhdr->flags & VIRTIO_NET_HDR_F_NEEDS_CSUM)) {
         trace_e1000e_rx_metadata_virthdr_no_csum_info();
-        e1000e_verify_csum_in_sw(core, pkt, status_flags, istcp, isudp);
+        e1000e_verify_csum_in_sw(core, pkt, status_flags, hastcp, hasudp);
         goto func_exit;
     }
 
     if (e1000e_rx_l3_cso_enabled(core)) {
-        *status_flags |= isip4 ? E1000_RXD_STAT_IPCS : 0;
+        *status_flags |= hasip4 ? E1000_RXD_STAT_IPCS : 0;
     } else {
         trace_e1000e_rx_metadata_l3_cso_disabled();
     }
 
     if (e1000e_rx_l4_cso_enabled(core)) {
-        if (istcp) {
+        if (hastcp) {
             *status_flags |= E1000_RXD_STAT_TCPCS;
-        } else if (isudp) {
+        } else if (hasudp) {
             *status_flags |= E1000_RXD_STAT_TCPCS | E1000_RXD_STAT_UDPCS;
         }
     } else {
@@ -1512,18 +1509,18 @@ e1000e_rx_descr_threshold_hit(E1000ECore *core, const E1000E_RingInfo *rxi)
 static bool
 e1000e_do_ps(E1000ECore *core, struct NetRxPkt *pkt, size_t *hdr_len)
 {
-    bool isip4, isip6, isudp, istcp;
+    bool hasip4, hasip6, hasudp, hastcp;
     bool fragment;
 
     if (!e1000e_rx_use_ps_descriptor(core)) {
         return false;
     }
 
-    net_rx_pkt_get_protocols(pkt, &isip4, &isip6, &isudp, &istcp);
+    net_rx_pkt_get_protocols(pkt, &hasip4, &hasip6, &hasudp, &hastcp);
 
-    if (isip4) {
+    if (hasip4) {
         fragment = net_rx_pkt_get_ip4_info(pkt)->fragment;
-    } else if (isip6) {
+    } else if (hasip6) {
         fragment = net_rx_pkt_get_ip6_info(pkt)->fragment;
     } else {
         return false;
@@ -1533,7 +1530,7 @@ e1000e_do_ps(E1000ECore *core, struct NetRxPkt *pkt, size_t *hdr_len)
         return false;
     }
 
-    if (!fragment && (isudp || istcp)) {
+    if (hasudp || hastcp) {
         *hdr_len = net_rx_pkt_get_l5_hdr_offset(pkt);
     } else {
         *hdr_len = net_rx_pkt_get_l4_hdr_offset(pkt);
diff --git a/hw/net/net_rx_pkt.c b/hw/net/net_rx_pkt.c
index a53e7561c5..0bbe662eb2 100644
--- a/hw/net/net_rx_pkt.c
+++ b/hw/net/net_rx_pkt.c
@@ -33,10 +33,10 @@ struct NetRxPkt {
     eth_pkt_types_e packet_type;
 
     /* Analysis results */
-    bool isip4;
-    bool isip6;
-    bool isudp;
-    bool istcp;
+    bool hasip4;
+    bool hasip6;
+    bool hasudp;
+    bool hastcp;
 
     size_t l3hdr_off;
     size_t l4hdr_off;
@@ -105,12 +105,12 @@ net_rx_pkt_pull_data(struct NetRxPkt *pkt,
                                 iov, iovcnt, ploff, pkt->tot_len);
     }
 
-    eth_get_protocols(pkt->vec, pkt->vec_len, &pkt->isip4, &pkt->isip6,
-                      &pkt->isudp, &pkt->istcp,
+    eth_get_protocols(pkt->vec, pkt->vec_len, &pkt->hasip4, &pkt->hasip6,
+                      &pkt->hasudp, &pkt->hastcp,
                       &pkt->l3hdr_off, &pkt->l4hdr_off, &pkt->l5hdr_off,
                       &pkt->ip6hdr_info, &pkt->ip4hdr_info, &pkt->l4hdr_info);
 
-    trace_net_rx_pkt_parsed(pkt->isip4, pkt->isip6, pkt->isudp, pkt->istcp,
+    trace_net_rx_pkt_parsed(pkt->hasip4, pkt->hasip6, pkt->hasudp, pkt->hastcp,
                             pkt->l3hdr_off, pkt->l4hdr_off, pkt->l5hdr_off);
 }
 
@@ -199,22 +199,22 @@ void net_rx_pkt_set_protocols(struct NetRxPkt *pkt, const void *data,
 
     assert(pkt);
 
-    eth_get_protocols(&iov, 1, &pkt->isip4, &pkt->isip6,
-                      &pkt->isudp, &pkt->istcp,
+    eth_get_protocols(&iov, 1, &pkt->hasip4, &pkt->hasip6,
+                      &pkt->hasudp, &pkt->hastcp,
                       &pkt->l3hdr_off, &pkt->l4hdr_off, &pkt->l5hdr_off,
                       &pkt->ip6hdr_info, &pkt->ip4hdr_info, &pkt->l4hdr_info);
 }
 
 void net_rx_pkt_get_protocols(struct NetRxPkt *pkt,
-                              bool *isip4, bool *isip6,
-                              bool *isudp, bool *istcp)
+                              bool *hasip4, bool *hasip6,
+                              bool *hasudp, bool *hastcp)
 {
     assert(pkt);
 
-    *isip4 = pkt->isip4;
-    *isip6 = pkt->isip6;
-    *isudp = pkt->isudp;
-    *istcp = pkt->istcp;
+    *hasip4 = pkt->hasip4;
+    *hasip6 = pkt->hasip6;
+    *hasudp = pkt->hasudp;
+    *hastcp = pkt->hastcp;
 }
 
 size_t net_rx_pkt_get_l3_hdr_offset(struct NetRxPkt *pkt)
@@ -331,58 +331,58 @@ net_rx_pkt_calc_rss_hash(struct NetRxPkt *pkt,
 
     switch (type) {
     case NetPktRssIpV4:
-        assert(pkt->isip4);
+        assert(pkt->hasip4);
         trace_net_rx_pkt_rss_ip4();
         _net_rx_rss_prepare_ip4(&rss_input[0], pkt, &rss_length);
         break;
     case NetPktRssIpV4Tcp:
-        assert(pkt->isip4);
-        assert(pkt->istcp);
+        assert(pkt->hasip4);
+        assert(pkt->hastcp);
         trace_net_rx_pkt_rss_ip4_tcp();
         _net_rx_rss_prepare_ip4(&rss_input[0], pkt, &rss_length);
         _net_rx_rss_prepare_tcp(&rss_input[0], pkt, &rss_length);
         break;
     case NetPktRssIpV6Tcp:
-        assert(pkt->isip6);
-        assert(pkt->istcp);
+        assert(pkt->hasip6);
+        assert(pkt->hastcp);
         trace_net_rx_pkt_rss_ip6_tcp();
         _net_rx_rss_prepare_ip6(&rss_input[0], pkt, false, &rss_length);
         _net_rx_rss_prepare_tcp(&rss_input[0], pkt, &rss_length);
         break;
     case NetPktRssIpV6:
-        assert(pkt->isip6);
+        assert(pkt->hasip6);
         trace_net_rx_pkt_rss_ip6();
         _net_rx_rss_prepare_ip6(&rss_input[0], pkt, false, &rss_length);
         break;
     case NetPktRssIpV6Ex:
-        assert(pkt->isip6);
+        assert(pkt->hasip6);
         trace_net_rx_pkt_rss_ip6_ex();
         _net_rx_rss_prepare_ip6(&rss_input[0], pkt, true, &rss_length);
         break;
     case NetPktRssIpV6TcpEx:
-        assert(pkt->isip6);
-        assert(pkt->istcp);
+        assert(pkt->hasip6);
+        assert(pkt->hastcp);
         trace_net_rx_pkt_rss_ip6_ex_tcp();
         _net_rx_rss_prepare_ip6(&rss_input[0], pkt, true, &rss_length);
         _net_rx_rss_prepare_tcp(&rss_input[0], pkt, &rss_length);
         break;
     case NetPktRssIpV4Udp:
-        assert(pkt->isip4);
-        assert(pkt->isudp);
+        assert(pkt->hasip4);
+        assert(pkt->hasudp);
         trace_net_rx_pkt_rss_ip4_udp();
         _net_rx_rss_prepare_ip4(&rss_input[0], pkt, &rss_length);
         _net_rx_rss_prepare_udp(&rss_input[0], pkt, &rss_length);
         break;
     case NetPktRssIpV6Udp:
-        assert(pkt->isip6);
-        assert(pkt->isudp);
+        assert(pkt->hasip6);
+        assert(pkt->hasudp);
         trace_net_rx_pkt_rss_ip6_udp();
         _net_rx_rss_prepare_ip6(&rss_input[0], pkt, false, &rss_length);
         _net_rx_rss_prepare_udp(&rss_input[0], pkt, &rss_length);
         break;
     case NetPktRssIpV6UdpEx:
-        assert(pkt->isip6);
-        assert(pkt->isudp);
+        assert(pkt->hasip6);
+        assert(pkt->hasudp);
         trace_net_rx_pkt_rss_ip6_ex_udp();
         _net_rx_rss_prepare_ip6(&rss_input[0], pkt, true, &rss_length);
         _net_rx_rss_prepare_udp(&rss_input[0], pkt, &rss_length);
@@ -404,7 +404,7 @@ uint16_t net_rx_pkt_get_ip_id(struct NetRxPkt *pkt)
 {
     assert(pkt);
 
-    if (pkt->isip4) {
+    if (pkt->hasip4) {
         return be16_to_cpu(pkt->ip4hdr_info.ip4_hdr.ip_id);
     }
 
@@ -415,7 +415,7 @@ bool net_rx_pkt_is_tcp_ack(struct NetRxPkt *pkt)
 {
     assert(pkt);
 
-    if (pkt->istcp) {
+    if (pkt->hastcp) {
         return TCP_HEADER_FLAGS(&pkt->l4hdr_info.hdr.tcp) & TCP_FLAG_ACK;
     }
 
@@ -426,7 +426,7 @@ bool net_rx_pkt_has_tcp_data(struct NetRxPkt *pkt)
 {
     assert(pkt);
 
-    if (pkt->istcp) {
+    if (pkt->hastcp) {
         return pkt->l4hdr_info.has_tcp_data;
     }
 
@@ -492,7 +492,7 @@ bool net_rx_pkt_validate_l3_csum(struct NetRxPkt *pkt, bool *csum_valid)
 
     trace_net_rx_pkt_l3_csum_validate_entry();
 
-    if (!pkt->isip4) {
+    if (!pkt->hasip4) {
         trace_net_rx_pkt_l3_csum_validate_not_ip4();
         return false;
     }
@@ -523,8 +523,8 @@ _net_rx_pkt_calc_l4_csum(struct NetRxPkt *pkt)
 
     trace_net_rx_pkt_l4_csum_calc_entry();
 
-    if (pkt->isip4) {
-        if (pkt->isudp) {
+    if (pkt->hasip4) {
+        if (pkt->hasudp) {
             csl = be16_to_cpu(pkt->l4hdr_info.hdr.udp.uh_ulen);
             trace_net_rx_pkt_l4_csum_calc_ip4_udp();
         } else {
@@ -537,7 +537,7 @@ _net_rx_pkt_calc_l4_csum(struct NetRxPkt *pkt)
                                             csl, &cso);
         trace_net_rx_pkt_l4_csum_calc_ph_csum(cntr, csl);
     } else {
-        if (pkt->isudp) {
+        if (pkt->hasudp) {
             csl = be16_to_cpu(pkt->l4hdr_info.hdr.udp.uh_ulen);
             trace_net_rx_pkt_l4_csum_calc_ip6_udp();
         } else {
@@ -571,17 +571,17 @@ bool net_rx_pkt_validate_l4_csum(struct NetRxPkt *pkt, bool *csum_valid)
 
     trace_net_rx_pkt_l4_csum_validate_entry();
 
-    if (!pkt->istcp && !pkt->isudp) {
+    if (!pkt->hastcp && !pkt->hasudp) {
         trace_net_rx_pkt_l4_csum_validate_not_xxp();
         return false;
     }
 
-    if (pkt->isudp && (pkt->l4hdr_info.hdr.udp.uh_sum == 0)) {
+    if (pkt->hasudp && (pkt->l4hdr_info.hdr.udp.uh_sum == 0)) {
         trace_net_rx_pkt_l4_csum_validate_udp_with_no_checksum();
         return false;
     }
 
-    if (pkt->isip4 && pkt->ip4hdr_info.fragment) {
+    if (pkt->hasip4 && pkt->ip4hdr_info.fragment) {
         trace_net_rx_pkt_l4_csum_validate_ip4_fragment();
         return false;
     }
@@ -602,10 +602,10 @@ bool net_rx_pkt_fix_l4_csum(struct NetRxPkt *pkt)
 
     trace_net_rx_pkt_l4_csum_fix_entry();
 
-    if (pkt->istcp) {
+    if (pkt->hastcp) {
         l4_cso = offsetof(struct tcp_header, th_sum);
         trace_net_rx_pkt_l4_csum_fix_tcp(l4_cso);
-    } else if (pkt->isudp) {
+    } else if (pkt->hasudp) {
         if (pkt->l4hdr_info.hdr.udp.uh_sum == 0) {
             trace_net_rx_pkt_l4_csum_fix_udp_with_no_checksum();
             return false;
@@ -617,7 +617,7 @@ bool net_rx_pkt_fix_l4_csum(struct NetRxPkt *pkt)
         return false;
     }
 
-    if (pkt->isip4 && pkt->ip4hdr_info.fragment) {
+    if (pkt->hasip4 && pkt->ip4hdr_info.fragment) {
             trace_net_rx_pkt_l4_csum_fix_ip4_fragment();
             return false;
     }
diff --git a/hw/net/net_rx_pkt.h b/hw/net/net_rx_pkt.h
index 8b69ddb2da..cf9bb790f2 100644
--- a/hw/net/net_rx_pkt.h
+++ b/hw/net/net_rx_pkt.h
@@ -66,15 +66,15 @@ void net_rx_pkt_set_protocols(struct NetRxPkt *pkt, const void *data,
  * fetches packet analysis results
  *
  * @pkt:            packet
- * @isip4:          whether the packet given is IPv4
- * @isip6:          whether the packet given is IPv6
- * @isudp:          whether the packet given is UDP
- * @istcp:          whether the packet given is TCP
+ * @hasip4:          whether the packet has an IPv4 header
+ * @hasip6:          whether the packet has an IPv6 header
+ * @hasudp:          whether the packet has a UDP header
+ * @hastcp:          whether the packet has a TCP header
  *
  */
 void net_rx_pkt_get_protocols(struct NetRxPkt *pkt,
-                                 bool *isip4, bool *isip6,
-                                 bool *isudp, bool *istcp);
+                                 bool *hasip4, bool *hasip6,
+                                 bool *hasudp, bool *hastcp);
 
 /**
 * fetches L3 header offset
diff --git a/hw/net/trace-events b/hw/net/trace-events
index d24ba945dc..9fb0544d72 100644
--- a/hw/net/trace-events
+++ b/hw/net/trace-events
@@ -177,11 +177,11 @@ e1000e_rx_start_recv(void)
 e1000e_rx_rss_started(void) "Starting RSS processing"
 e1000e_rx_rss_disabled(void) "RSS is disabled"
 e1000e_rx_rss_type(uint32_t type) "RSS type is %u"
-e1000e_rx_rss_ip4(bool isfragment, bool istcp, uint32_t mrqc, bool tcpipv4_enabled, bool ipv4_enabled) "RSS IPv4: fragment %d, tcp %d, mrqc 0x%X, tcpipv4 enabled %d, ipv4 enabled %d"
+e1000e_rx_rss_ip4(bool hastcp, uint32_t mrqc, bool tcpipv4_enabled, bool ipv4_enabled) "RSS IPv4: tcp %d, mrqc 0x%X, tcpipv4 enabled %d, ipv4 enabled %d"
 e1000e_rx_rss_ip6_rfctl(uint32_t rfctl) "RSS IPv6: rfctl 0x%X"
-e1000e_rx_rss_ip6(bool ex_dis, bool new_ex_dis, bool istcp, bool has_ext_headers, bool ex_dst_valid, bool ex_src_valid, uint32_t mrqc, bool tcpipv6_enabled, bool ipv6ex_enabled, bool ipv6_enabled) "RSS IPv6: ex_dis: %d, new_ex_dis: %d, tcp %d, has_ext_headers %d, ex_dst_valid %d, ex_src_valid %d, mrqc 0x%X, tcpipv6 enabled %d, ipv6ex enabled %d, ipv6 enabled %d"
+e1000e_rx_rss_ip6(bool ex_dis, bool new_ex_dis, bool hastcp, bool has_ext_headers, bool ex_dst_valid, bool ex_src_valid, uint32_t mrqc, bool tcpipv6_enabled, bool ipv6ex_enabled, bool ipv6_enabled) "RSS IPv6: ex_dis: %d, new_ex_dis: %d, tcp %d, has_ext_headers %d, ex_dst_valid %d, ex_src_valid %d, mrqc 0x%X, tcpipv6 enabled %d, ipv6ex enabled %d, ipv6 enabled %d"
 
-e1000e_rx_metadata_protocols(bool isip4, bool isip6, bool isudp, bool istcp) "protocols: ip4: %d, ip6: %d, udp: %d, tcp: %d"
+e1000e_rx_metadata_protocols(bool hasip4, bool hasip6, bool hasudp, bool hastcp) "protocols: ip4: %d, ip6: %d, udp: %d, tcp: %d"
 e1000e_rx_metadata_vlan(uint16_t vlan_tag) "VLAN tag is 0x%X"
 e1000e_rx_metadata_rss(uint32_t rss, uint32_t mrq) "RSS data: rss: 0x%X, mrq: 0x%X"
 e1000e_rx_metadata_ip_id(uint16_t ip_id) "the IPv4 ID is 0x%X"
diff --git a/hw/net/virtio-net.c b/hw/net/virtio-net.c
index 1795e1aa7d..e6067df343 100644
--- a/hw/net/virtio-net.c
+++ b/hw/net/virtio-net.c
@@ -1731,32 +1731,32 @@ static int receive_filter(VirtIONet *n, const uint8_t *buf, int size)
     return 0;
 }
 
-static uint8_t virtio_net_get_hash_type(bool isip4,
-                                        bool isip6,
-                                        bool isudp,
-                                        bool istcp,
+static uint8_t virtio_net_get_hash_type(bool hasip4,
+                                        bool hasip6,
+                                        bool hasudp,
+                                        bool hastcp,
                                         uint32_t types)
 {
-    if (isip4) {
-        if (istcp && (types & VIRTIO_NET_RSS_HASH_TYPE_TCPv4)) {
+    if (hasip4) {
+        if (hastcp && (types & VIRTIO_NET_RSS_HASH_TYPE_TCPv4)) {
             return NetPktRssIpV4Tcp;
         }
-        if (isudp && (types & VIRTIO_NET_RSS_HASH_TYPE_UDPv4)) {
+        if (hasudp && (types & VIRTIO_NET_RSS_HASH_TYPE_UDPv4)) {
             return NetPktRssIpV4Udp;
         }
         if (types & VIRTIO_NET_RSS_HASH_TYPE_IPv4) {
             return NetPktRssIpV4;
         }
-    } else if (isip6) {
+    } else if (hasip6) {
         uint32_t mask = VIRTIO_NET_RSS_HASH_TYPE_TCP_EX |
                         VIRTIO_NET_RSS_HASH_TYPE_TCPv6;
 
-        if (istcp && (types & mask)) {
+        if (hastcp && (types & mask)) {
             return (types & VIRTIO_NET_RSS_HASH_TYPE_TCP_EX) ?
                 NetPktRssIpV6TcpEx : NetPktRssIpV6Tcp;
         }
         mask = VIRTIO_NET_RSS_HASH_TYPE_UDP_EX | VIRTIO_NET_RSS_HASH_TYPE_UDPv6;
-        if (isudp && (types & mask)) {
+        if (hasudp && (types & mask)) {
             return (types & VIRTIO_NET_RSS_HASH_TYPE_UDP_EX) ?
                 NetPktRssIpV6UdpEx : NetPktRssIpV6Udp;
         }
@@ -1785,7 +1785,7 @@ static int virtio_net_process_rss(NetClientState *nc, const uint8_t *buf,
     struct NetRxPkt *pkt = n->rx_pkt;
     uint8_t net_hash_type;
     uint32_t hash;
-    bool isip4, isip6, isudp, istcp;
+    bool hasip4, hasip6, hasudp, hastcp;
     static const uint8_t reports[NetPktRssIpV6UdpEx + 1] = {
         VIRTIO_NET_HASH_REPORT_IPv4,
         VIRTIO_NET_HASH_REPORT_TCPv4,
@@ -1800,14 +1800,8 @@ static int virtio_net_process_rss(NetClientState *nc, const uint8_t *buf,
 
     net_rx_pkt_set_protocols(pkt, buf + n->host_hdr_len,
                              size - n->host_hdr_len);
-    net_rx_pkt_get_protocols(pkt, &isip4, &isip6, &isudp, &istcp);
-    if (isip4 && (net_rx_pkt_get_ip4_info(pkt)->fragment)) {
-        istcp = isudp = false;
-    }
-    if (isip6 && (net_rx_pkt_get_ip6_info(pkt)->fragment)) {
-        istcp = isudp = false;
-    }
-    net_hash_type = virtio_net_get_hash_type(isip4, isip6, isudp, istcp,
+    net_rx_pkt_get_protocols(pkt, &hasip4, &hasip6, &hasudp, &hastcp);
+    net_hash_type = virtio_net_get_hash_type(hasip4, hasip6, hasudp, hastcp,
                                              n->rss_data.hash_types);
     if (net_hash_type > NetPktRssIpV6UdpEx) {
         if (n->rss_data.populate_hash) {
diff --git a/hw/net/vmxnet3.c b/hw/net/vmxnet3.c
index 6c6bb2ac37..4d65327732 100644
--- a/hw/net/vmxnet3.c
+++ b/hw/net/vmxnet3.c
@@ -847,7 +847,7 @@ static void vmxnet3_rx_need_csum_calculate(struct NetRxPkt *pkt,
                                            size_t pkt_len)
 {
     struct virtio_net_hdr *vhdr;
-    bool isip4, isip6, istcp, isudp;
+    bool hasip4, hasip6, hastcp, hasudp;
     uint8_t *data;
     int len;
 
@@ -856,8 +856,8 @@ static void vmxnet3_rx_need_csum_calculate(struct NetRxPkt *pkt,
         return;
     }
 
-    net_rx_pkt_get_protocols(pkt, &isip4, &isip6, &isudp, &istcp);
-    if (!(isip4 || isip6) || !(istcp || isudp)) {
+    net_rx_pkt_get_protocols(pkt, &hasip4, &hasip6, &hasudp, &hastcp);
+    if (!(hasip4 || hasip6) || !(hastcp || hasudp)) {
         return;
     }
 
@@ -885,7 +885,7 @@ static void vmxnet3_rx_update_descr(struct NetRxPkt *pkt,
     struct Vmxnet3_RxCompDesc *rxcd)
 {
     int csum_ok, is_gso;
-    bool isip4, isip6, istcp, isudp;
+    bool hasip4, hasip6, hastcp, hasudp;
     struct virtio_net_hdr *vhdr;
     uint8_t offload_type;
 
@@ -911,16 +911,16 @@ static void vmxnet3_rx_update_descr(struct NetRxPkt *pkt,
         goto nocsum;
     }
 
-    net_rx_pkt_get_protocols(pkt, &isip4, &isip6, &isudp, &istcp);
-    if ((!istcp && !isudp) || (!isip4 && !isip6)) {
+    net_rx_pkt_get_protocols(pkt, &hasip4, &hasip6, &hasudp, &hastcp);
+    if ((!hastcp && !hasudp) || (!hasip4 && !hasip6)) {
         goto nocsum;
     }
 
     rxcd->cnc = 0;
-    rxcd->v4 = isip4 ? 1 : 0;
-    rxcd->v6 = isip6 ? 1 : 0;
-    rxcd->tcp = istcp ? 1 : 0;
-    rxcd->udp = isudp ? 1 : 0;
+    rxcd->v4 = hasip4 ? 1 : 0;
+    rxcd->v6 = hasip6 ? 1 : 0;
+    rxcd->tcp = hastcp ? 1 : 0;
+    rxcd->udp = hasudp ? 1 : 0;
     rxcd->fcs = rxcd->tuc = rxcd->ipc = 1;
     return;
 
diff --git a/include/net/eth.h b/include/net/eth.h
index 2b4374fae4..fbac30cf60 100644
--- a/include/net/eth.h
+++ b/include/net/eth.h
@@ -391,8 +391,8 @@ typedef struct eth_l4_hdr_info_st {
 } eth_l4_hdr_info;
 
 void eth_get_protocols(const struct iovec *iov, int iovcnt,
-                       bool *isip4, bool *isip6,
-                       bool *isudp, bool *istcp,
+                       bool *hasip4, bool *hasip6,
+                       bool *hasudp, bool *hastcp,
                        size_t *l3hdr_off,
                        size_t *l4hdr_off,
                        size_t *l5hdr_off,
diff --git a/net/eth.c b/net/eth.c
index 36d39b4357..c1c14cf6b9 100644
--- a/net/eth.c
+++ b/net/eth.c
@@ -137,8 +137,8 @@ _eth_tcp_has_data(bool is_ip4,
 }
 
 void eth_get_protocols(const struct iovec *iov, int iovcnt,
-                       bool *isip4, bool *isip6,
-                       bool *isudp, bool *istcp,
+                       bool *hasip4, bool *hasip6,
+                       bool *hasudp, bool *hastcp,
                        size_t *l3hdr_off,
                        size_t *l4hdr_off,
                        size_t *l5hdr_off,
@@ -151,8 +151,9 @@ void eth_get_protocols(const struct iovec *iov, int iovcnt,
     size_t l2hdr_len = eth_get_l2_hdr_length_iov(iov, iovcnt);
     size_t input_size = iov_size(iov, iovcnt);
     size_t copied;
+    uint8_t ip_p;
 
-    *isip4 = *isip6 = *isudp = *istcp = false;
+    *hasip4 = *hasip6 = *hasudp = *hastcp = false;
 
     proto = eth_get_l3_proto(iov, iovcnt, l2hdr_len);
 
@@ -166,68 +167,60 @@ void eth_get_protocols(const struct iovec *iov, int iovcnt,
         }
 
         copied = iov_to_buf(iov, iovcnt, l2hdr_len, iphdr, sizeof(*iphdr));
-
-        *isip4 = true;
-
-        if (copied < sizeof(*iphdr)) {
+        if (copied < sizeof(*iphdr) ||
+            IP_HEADER_VERSION(iphdr) != IP_HEADER_VERSION_4) {
             return;
         }
 
-        if (IP_HEADER_VERSION(iphdr) == IP_HEADER_VERSION_4) {
-            if (iphdr->ip_p == IP_PROTO_TCP) {
-                *istcp = true;
-            } else if (iphdr->ip_p == IP_PROTO_UDP) {
-                *isudp = true;
-            }
-        }
-
+        *hasip4 = true;
+        ip_p = iphdr->ip_p;
         ip4hdr_info->fragment = IP4_IS_FRAGMENT(iphdr);
         *l4hdr_off = l2hdr_len + IP_HDR_GET_LEN(iphdr);
 
         fragment = ip4hdr_info->fragment;
     } else if (proto == ETH_P_IPV6) {
-
-        *isip6 = true;
-        if (eth_parse_ipv6_hdr(iov, iovcnt, l2hdr_len,
-                               ip6hdr_info)) {
-            if (ip6hdr_info->l4proto == IP_PROTO_TCP) {
-                *istcp = true;
-            } else if (ip6hdr_info->l4proto == IP_PROTO_UDP) {
-                *isudp = true;
-            }
-        } else {
+        if (!eth_parse_ipv6_hdr(iov, iovcnt, l2hdr_len, ip6hdr_info)) {
             return;
         }
 
+        *hasip6 = true;
+        ip_p = ip6hdr_info->l4proto;
         *l4hdr_off = l2hdr_len + ip6hdr_info->full_hdr_len;
         fragment = ip6hdr_info->fragment;
+    } else {
+        return;
     }
 
-    if (!fragment) {
-        if (*istcp) {
-            *istcp = _eth_copy_chunk(input_size,
-                                     iov, iovcnt,
-                                     *l4hdr_off, sizeof(l4hdr_info->hdr.tcp),
-                                     &l4hdr_info->hdr.tcp);
-
-            if (*istcp) {
-                *l5hdr_off = *l4hdr_off +
-                    TCP_HEADER_DATA_OFFSET(&l4hdr_info->hdr.tcp);
-
-                l4hdr_info->has_tcp_data =
-                    _eth_tcp_has_data(proto == ETH_P_IP,
-                                      &ip4hdr_info->ip4_hdr,
-                                      &ip6hdr_info->ip6_hdr,
-                                      *l4hdr_off - *l3hdr_off,
-                                      &l4hdr_info->hdr.tcp);
-            }
-        } else if (*isudp) {
-            *isudp = _eth_copy_chunk(input_size,
-                                     iov, iovcnt,
-                                     *l4hdr_off, sizeof(l4hdr_info->hdr.udp),
-                                     &l4hdr_info->hdr.udp);
-            *l5hdr_off = *l4hdr_off + sizeof(l4hdr_info->hdr.udp);
+    if (fragment) {
+        return;
+    }
+
+    switch (ip_p) {
+    case IP_PROTO_TCP:
+        *hastcp = _eth_copy_chunk(input_size,
+                                  iov, iovcnt,
+                                  *l4hdr_off, sizeof(l4hdr_info->hdr.tcp),
+                                  &l4hdr_info->hdr.tcp);
+        if (*hastcp) {
+            *l5hdr_off = *l4hdr_off +
+                TCP_HEADER_DATA_OFFSET(&l4hdr_info->hdr.tcp);
+
+            l4hdr_info->has_tcp_data =
+                _eth_tcp_has_data(proto == ETH_P_IP,
+                                  &ip4hdr_info->ip4_hdr,
+                                  &ip6hdr_info->ip6_hdr,
+                                  *l4hdr_off - *l3hdr_off,
+                                  &l4hdr_info->hdr.tcp);
         }
+        break;
+
+    case IP_PROTO_UDP:
+        *hasudp = _eth_copy_chunk(input_size,
+                                  iov, iovcnt,
+                                  *l4hdr_off, sizeof(l4hdr_info->hdr.udp),
+                                  &l4hdr_info->hdr.udp);
+        *l5hdr_off = *l4hdr_off + sizeof(l4hdr_info->hdr.udp);
+        break;
     }
 }
 
-- 
2.39.1


