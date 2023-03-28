Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CE12E6CB5F5
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Mar 2023 07:22:36 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ph1kJ-0005VM-W8; Tue, 28 Mar 2023 01:19:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1ph1kA-0005TP-GZ
 for qemu-devel@nongnu.org; Tue, 28 Mar 2023 01:19:42 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1ph1k8-0007QE-SW
 for qemu-devel@nongnu.org; Tue, 28 Mar 2023 01:19:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1679980776;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=BkoPWs25bsh5hXVonD+BSgrCpc/1c5rf1JL1xfQ3sBw=;
 b=GgqD39AKIFGXPNt++/e01mN7W5YTSsS9Z1tOaeL1C48MGnqX3wp1JobPAZNE9GbBRlR4N3
 M38QMck1gOzr6Y4YvZTBADaMAzFFUoG6qqwF4UNjbE8eQk6ti1s8tIhTzwUIC1YfoZi1FA
 VPsnRbIORPmF1h1QVT6Al74bCpNbVG8=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-593-22RCIeYhNEGmYhrroycOOA-1; Tue, 28 Mar 2023 01:19:34 -0400
X-MC-Unique: 22RCIeYhNEGmYhrroycOOA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B021485A5A3;
 Tue, 28 Mar 2023 05:19:33 +0000 (UTC)
Received: from localhost.localdomain (ovpn-13-204.pek2.redhat.com
 [10.72.13.204])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D9E0C202701E;
 Tue, 28 Mar 2023 05:19:31 +0000 (UTC)
From: Jason Wang <jasowang@redhat.com>
To: qemu-devel@nongnu.org
Cc: Akihiko Odaki <akihiko.odaki@daynix.com>, Jason Wang <jasowang@redhat.com>
Subject: [PULL 04/12] hw/net/net_tx_pkt: Align l3_hdr
Date: Tue, 28 Mar 2023 13:19:09 +0800
Message-Id: <20230328051917.18006-5-jasowang@redhat.com>
In-Reply-To: <20230328051917.18006-1-jasowang@redhat.com>
References: <20230328051917.18006-1-jasowang@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
Received-SPF: pass client-ip=170.10.129.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

From: Akihiko Odaki <akihiko.odaki@daynix.com>

Align the l3_hdr member of NetTxPkt by defining it as a union of
ip_header, ip6_header, and an array of octets.

Fixes: e263cd49c7 ("Packet abstraction for VMWARE network devices")
Resolves: https://gitlab.com/qemu-project/qemu/-/issues/1544
Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
Signed-off-by: Jason Wang <jasowang@redhat.com>
---
 hw/net/net_tx_pkt.c | 21 +++++++++++----------
 1 file changed, 11 insertions(+), 10 deletions(-)

diff --git a/hw/net/net_tx_pkt.c b/hw/net/net_tx_pkt.c
index efe80b1..8dc8568 100644
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
2.7.4


