Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A72816C8075
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Mar 2023 15:55:47 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pfe9k-0005I6-9F; Fri, 24 Mar 2023 05:56:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1pfe9h-0005Hj-LN
 for qemu-devel@nongnu.org; Fri, 24 Mar 2023 05:56:17 -0400
Received: from mail-pj1-f53.google.com ([209.85.216.53])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1pfe9H-0003RN-QW
 for qemu-devel@nongnu.org; Fri, 24 Mar 2023 05:56:17 -0400
Received: by mail-pj1-f53.google.com with SMTP id a16so1059302pjs.4
 for <qemu-devel@nongnu.org>; Fri, 24 Mar 2023 02:55:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20210112.gappssmtp.com; s=20210112; t=1679651711;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=nPrC4YQ9uSCz+WV5O3PwaouONcUDnlpw4YEX3MYIyy8=;
 b=Tnq6U9ZLZUtGwWK6O7g9blXcFscXaSV/deNUfbj/yCu/eb145rQ1qiNwg8qLuRVWEB
 zMPsyLPP5GagHScO2Qj8AO7rRhy6822dx/PxTeN3ee/x1bYjpA0UqgTB1Osbxdmv3xdY
 6rSCgDA5fyltEPNp0xZ1ZPT1I/yut1b+Wez6zvP61XRcpZDIZi8DyNFCC/WtPl4b4V3h
 rDKZZxbV7Oly8v9p3MJbjLp/jJWvPaq76Boyrr/ipH3AxpL9HX/wHu+uevG5P6MhcqCB
 IOtEGVod1r/1BbMvm6N1rq1qIvMaIeIEohn60WfIOjVre0h+16LYUPenKycQvfs8EBKK
 YjVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679651711;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=nPrC4YQ9uSCz+WV5O3PwaouONcUDnlpw4YEX3MYIyy8=;
 b=jrVLomvz0YxYfJllHeaTahPgjEJHSD1jk4OqBgKOSPOzxOrC9czcoUT7eiV+bPjYRR
 KONqWuVsJzkmtmQ+BkIuK9niirBNBTi576RNen7MpciE5D0Kpq08gtEx+GGsJIE/9r8D
 rlXralxyCb7MzPSbh+xoYDeSMckEznS34nEhyfdrwvkUWYpth6f2yJnq6+drkkpbR+ma
 TnNLF/S/cGavmGk6feU2y96j4JZlit3UZaWGVZp4k7q6i+hy7TnBPjkOp8RmHSqqg7EF
 XE+jrjw00e5apCMfLewl1bForM68Sf4Cs/nUiDK3GZhcJYkds+iCCCeJt4IvBmjFVX5R
 q2Nw==
X-Gm-Message-State: AAQBX9dz5shMpBF0w33Pb5yW5lFbcMOlLoteCvHIoHJnHGzhe2V1NjUe
 2WCTRCghWVRI4W/jMrnKpMP6GI66BjFKpCriraLgVg==
X-Google-Smtp-Source: AKy350YuuiC6/3W4vhLDAqwgDlDbfsfl17Hv2KFEKXieZetxy/rGqz+MekEij/uqugtTJRwRcT7P6w==
X-Received: by 2002:a17:902:e545:b0:1a1:bede:5e4a with SMTP id
 n5-20020a170902e54500b001a1bede5e4amr2749243plf.49.1679651707057; 
 Fri, 24 Mar 2023 02:55:07 -0700 (PDT)
Received: from alarm.flets-east.jp ([2400:4050:a840:1e00:4457:c267:5e09:481b])
 by smtp.gmail.com with ESMTPSA id
 h5-20020a170902748500b001963bc7bdb8sm13785614pll.274.2023.03.24.02.55.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Mar 2023 02:55:06 -0700 (PDT)
From: Akihiko Odaki <akihiko.odaki@daynix.com>
To: 
Cc: qemu-devel@nongnu.org, Dmitry Fleytman <dmitry.fleytman@gmail.com>,
 Sriram Yagnaraman <sriram.yagnaraman@est.tech>,
 Jason Wang <jasowang@redhat.com>, Akihiko Odaki <akihiko.odaki@daynix.com>
Subject: [PATCH for 8.0 4/4] hw/net/net_tx_pkt: Align l3_hdr
Date: Fri, 24 Mar 2023 18:54:34 +0900
Message-Id: <20230324095434.44973-5-akihiko.odaki@daynix.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230324095434.44973-1-akihiko.odaki@daynix.com>
References: <20230324095434.44973-1-akihiko.odaki@daynix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=209.85.216.53;
 envelope-from=akihiko.odaki@daynix.com; helo=mail-pj1-f53.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=-0.01,
 RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_NONE=0.001,
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

Align the l3_hdr member of NetTxPkt by defining it as a union of
ip_header, ip6_header, and an array of octets.

Fixes: e263cd49c7 ("Packet abstraction for VMWARE network devices")
Resolves: https://gitlab.com/qemu-project/qemu/-/issues/1544
Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
---
 hw/net/net_tx_pkt.c | 21 +++++++++++----------
 1 file changed, 11 insertions(+), 10 deletions(-)

diff --git a/hw/net/net_tx_pkt.c b/hw/net/net_tx_pkt.c
index efe80b1a80..8dc8568ba2 100644
--- a/hw/net/net_tx_pkt.c
+++ b/hw/net/net_tx_pkt.c
@@ -43,7 +43,11 @@ struct NetTxPkt {
     struct iovec *vec;
 
     uint8_t l2_hdr[ETH_MAX_L2_HDR_LEN];
-    uint8_t l3_hdr[ETH_MAX_IP_DGRAM_LEN];
+    union {
+        struct ip_header ip;
+        struct ip6_header ip6;
+        uint8_t octets[ETH_MAX_IP_DGRAM_LEN];
+    } l3_hdr;
 
     uint32_t payload_len;
 
@@ -89,16 +93,14 @@ void net_tx_pkt_update_ip_hdr_checksum(struct NetTxPkt *pkt)
 {
     uint16_t csum;
     assert(pkt);
-    struct ip_header *ip_hdr;
-    ip_hdr = pkt->vec[NET_TX_PKT_L3HDR_FRAG].iov_base;
 
-    ip_hdr->ip_len = cpu_to_be16(pkt->payload_len +
+    pkt->l3_hdr.ip.ip_len = cpu_to_be16(pkt->payload_len +
         pkt->vec[NET_TX_PKT_L3HDR_FRAG].iov_len);
 
-    ip_hdr->ip_sum = 0;
-    csum = net_raw_checksum((uint8_t *)ip_hdr,
+    pkt->l3_hdr.ip.ip_sum = 0;
+    csum = net_raw_checksum(pkt->l3_hdr.octets,
         pkt->vec[NET_TX_PKT_L3HDR_FRAG].iov_len);
-    ip_hdr->ip_sum = cpu_to_be16(csum);
+    pkt->l3_hdr.ip.ip_sum = cpu_to_be16(csum);
 }
 
 void net_tx_pkt_update_ip_checksums(struct NetTxPkt *pkt)
@@ -832,15 +834,14 @@ void net_tx_pkt_fix_ip6_payload_len(struct NetTxPkt *pkt)
 {
     struct iovec *l2 = &pkt->vec[NET_TX_PKT_L2HDR_FRAG];
     if (eth_get_l3_proto(l2, 1, l2->iov_len) == ETH_P_IPV6) {
-        struct ip6_header *ip6 = (struct ip6_header *) pkt->l3_hdr;
         /*
          * TODO: if qemu would support >64K packets - add jumbo option check
          * something like that:
          * 'if (ip6->ip6_plen == 0 && !has_jumbo_option(ip6)) {'
          */
-        if (ip6->ip6_plen == 0) {
+        if (pkt->l3_hdr.ip6.ip6_plen == 0) {
             if (pkt->payload_len <= ETH_MAX_IP_DGRAM_LEN) {
-                ip6->ip6_plen = htons(pkt->payload_len);
+                pkt->l3_hdr.ip6.ip6_plen = htons(pkt->payload_len);
             }
             /*
              * TODO: if qemu would support >64K packets
-- 
2.39.2


