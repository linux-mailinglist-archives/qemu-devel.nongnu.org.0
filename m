Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A20D6BCF61
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Mar 2023 13:27:47 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pcmhD-000607-Nu; Thu, 16 Mar 2023 08:27:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1pcmhB-0005ze-RN
 for qemu-devel@nongnu.org; Thu, 16 Mar 2023 08:27:01 -0400
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1pcmhA-0002n3-2Y
 for qemu-devel@nongnu.org; Thu, 16 Mar 2023 08:27:01 -0400
Received: by mail-pj1-x102e.google.com with SMTP id nn12so1467717pjb.5
 for <qemu-devel@nongnu.org>; Thu, 16 Mar 2023 05:26:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20210112.gappssmtp.com; s=20210112; t=1678969618;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=nPrC4YQ9uSCz+WV5O3PwaouONcUDnlpw4YEX3MYIyy8=;
 b=FeQQCBh4u2uynbHTgBz/1k6eOxwO131LupxvfvyLLH5D6x9/4wBAFMB8lP9jVhI/cc
 mXx6vHsrFUt3cmC3wXyynGjwubJgaSPXC+NTbYlvw8+aBHyRwsmz8FLdg3sGVvOIfy+t
 lLtxGnCqaGF1ySBHqTIfObpjWhTJDNL3aTx5bEeLIQsRC6QftkuuQMXk9SGD76JybsGy
 XurvWj0wS/9X22QwWOAb8qHA7/T2/fsvFFYrNJlMC3sHTHeSQdCG7CZxWlOujdNXcS+H
 Rj43s2oIOZuuh40YTacizsem+N+gi8us8S/pjGCncQemeCH6GSMHu7GN5UlfVM0Binnk
 gkyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678969618;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=nPrC4YQ9uSCz+WV5O3PwaouONcUDnlpw4YEX3MYIyy8=;
 b=hyHzLVmzUMWr+xPh8eOOdMyYeeIJB1HL5oVw61rrgOuxbxGRkYGjTDbJpc/6Z1USp6
 wHXVXe58x7T/CHdenF5fiSSWR3mne1pUufjriPHRp1jX8EnuHdP/mpmiTV7mw5JitmQl
 hhQuGPQGH5d+k94o4ct63v5ZvitJIHnkDjX9dCohkflWhPqRB0aZ5KUciafBhhh2pfAV
 2WkryRY0ugmvxUN1iwrNQGIZOtMLbrFnUGCmKY75TXUf228bHFiYhr6mgF6R2iRtcY3g
 tnz/atbocJtHhgZh5i2T0yY/LlH3LOCo2tLdo/N/ZiPCSJI8WYeWexYzii0VBXJ16BVW
 BFTg==
X-Gm-Message-State: AO0yUKWfvOO57+5acWlrAwZlFZzploA/yA2uCBaHAPi0H0XK9EXbM/rb
 IGowQ+eHLEshwsHxjhor5QUD/2D8Qb5xVkeYE/vMBg==
X-Google-Smtp-Source: AK7set+J9qcsb2gus23OPwlfjHYKYmideLSRaCw2o8K6UiaZDl4k8jFbUgP0oU+J4/JvGXgKOHNIFA==
X-Received: by 2002:a17:90a:186:b0:23d:1bed:298e with SMTP id
 6-20020a17090a018600b0023d1bed298emr3481839pjc.45.1678969618402; 
 Thu, 16 Mar 2023 05:26:58 -0700 (PDT)
Received: from alarm.flets-east.jp ([2400:4050:a840:1e00:4457:c267:5e09:481b])
 by smtp.gmail.com with ESMTPSA id
 g15-20020a17090ace8f00b0023d143182b3sm3108549pju.41.2023.03.16.05.26.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Mar 2023 05:26:58 -0700 (PDT)
From: Akihiko Odaki <akihiko.odaki@daynix.com>
To: 
Cc: qemu-devel@nongnu.org, Jason Wang <jasowang@redhat.com>,
 Dmitry Fleytman <dmitry.fleytman@gmail.com>,
 Akihiko Odaki <akihiko.odaki@daynix.com>
Subject: [PATCH for 8.0] hw/net/net_tx_pkt: Align l3_hdr
Date: Thu, 16 Mar 2023 21:26:53 +0900
Message-Id: <20230316122653.10770-1-akihiko.odaki@daynix.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::102e;
 envelope-from=akihiko.odaki@daynix.com; helo=mail-pj1-x102e.google.com
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


