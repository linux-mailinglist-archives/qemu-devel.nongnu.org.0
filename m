Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B853B6AD808
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Mar 2023 08:12:22 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZRTE-0003JK-Pn; Tue, 07 Mar 2023 02:10:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1pZRSr-00039u-G9
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 02:10:27 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1pZRSp-0005lY-OS
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 02:10:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1678173023;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=BJWHCyiybHqubAP9hRuV8tlgsc9B0KlA+MAALiuykj4=;
 b=MnDXtyFf7B4+dqa5cW/CLI9gdDI/81gVHylX1iAzQlyczJM+gYHyjyGCdBsBzTqcST3wXw
 VPN2/tsKtXJDkfi4AFuY/z75xwjxRN8++CCNpFKxAQxkzTUngYMLO+D6NqXk1f/uxkZ4Xn
 hytgSAiCHg173u4oBHxjRgRyLpw91t8=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-28-kQFC0YGMPTmV-FOF-aGthg-1; Tue, 07 Mar 2023 02:10:19 -0500
X-MC-Unique: kQFC0YGMPTmV-FOF-aGthg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 8B02F3C10C60;
 Tue,  7 Mar 2023 07:10:19 +0000 (UTC)
Received: from localhost.localdomain (ovpn-12-78.pek2.redhat.com [10.72.12.78])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A605B4014D1B;
 Tue,  7 Mar 2023 07:10:17 +0000 (UTC)
From: Jason Wang <jasowang@redhat.com>
To: qemu-devel@nongnu.org,
	peter.maydell@linaro.org
Cc: Akihiko Odaki <akihiko.odaki@daynix.com>, Jason Wang <jasowang@redhat.com>
Subject: [PULL 30/51] e1000e: Combine rx traces
Date: Tue,  7 Mar 2023 15:07:55 +0800
Message-Id: <20230307070816.34833-31-jasowang@redhat.com>
In-Reply-To: <20230307070816.34833-1-jasowang@redhat.com>
References: <20230307070816.34833-1-jasowang@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jasowang@redhat.com;
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

Whether a packet will be written back to the guest depends on the
remaining space of the queue. Therefore, e1000e_rx_written_to_guest and
e1000e_rx_not_written_to_guest should log the index of the queue instead
of generated interrupts. This also removes the need of
e1000e_rx_rss_dispatched_to_queue, which logs the queue index.

Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
Signed-off-by: Jason Wang <jasowang@redhat.com>
---
 hw/net/e1000e_core.c | 6 ++----
 hw/net/trace-events  | 5 ++---
 2 files changed, 4 insertions(+), 7 deletions(-)

diff --git a/hw/net/e1000e_core.c b/hw/net/e1000e_core.c
index 76c7814..4fec6df 100644
--- a/hw/net/e1000e_core.c
+++ b/hw/net/e1000e_core.c
@@ -1759,8 +1759,6 @@ e1000e_receive_internal(E1000ECore *core, const struct iovec *iov, int iovcnt,
     e1000e_rss_parse_packet(core, core->rx_pkt, &rss_info);
     e1000e_rx_ring_init(core, &rxr, rss_info.queue);
 
-    trace_e1000e_rx_rss_dispatched_to_queue(rxr.i->idx);
-
     total_size = net_rx_pkt_get_total_len(core->rx_pkt) +
         e1000x_fcs_len(core->mac);
 
@@ -1786,12 +1784,12 @@ e1000e_receive_internal(E1000ECore *core, const struct iovec *iov, int iovcnt,
         rdmts_hit = e1000e_rx_descr_threshold_hit(core, rxr.i);
         n |= e1000e_rx_wb_interrupt_cause(core, rxr.i->idx, rdmts_hit);
 
-        trace_e1000e_rx_written_to_guest(n);
+        trace_e1000e_rx_written_to_guest(rxr.i->idx);
     } else {
         n |= E1000_ICS_RXO;
         retval = 0;
 
-        trace_e1000e_rx_not_written_to_guest(n);
+        trace_e1000e_rx_not_written_to_guest(rxr.i->idx);
     }
 
     if (!e1000e_intrmgr_delay_rx_causes(core, &n)) {
diff --git a/hw/net/trace-events b/hw/net/trace-events
index f7257a0..d24ba94 100644
--- a/hw/net/trace-events
+++ b/hw/net/trace-events
@@ -165,8 +165,8 @@ e1000e_rx_descr(int ridx, uint64_t base, uint8_t len) "Next RX descriptor: ring
 e1000e_rx_set_rctl(uint32_t rctl) "RCTL = 0x%x"
 e1000e_rx_receive_iov(int iovcnt) "Received vector of %d fragments"
 e1000e_rx_flt_dropped(void) "Received packet dropped by RX filter"
-e1000e_rx_written_to_guest(uint32_t causes) "Received packet written to guest (ICR causes %u)"
-e1000e_rx_not_written_to_guest(uint32_t causes) "Received packet NOT written to guest (ICR causes %u)"
+e1000e_rx_written_to_guest(int queue_idx) "Received packet written to guest (queue %d)"
+e1000e_rx_not_written_to_guest(int queue_idx) "Received packet NOT written to guest (queue %d)"
 e1000e_rx_interrupt_set(uint32_t causes) "Receive interrupt set (ICR causes %u)"
 e1000e_rx_interrupt_delayed(uint32_t causes) "Receive interrupt delayed (ICR causes %u)"
 e1000e_rx_set_cso(int cso_state) "RX CSO state set to %d"
@@ -180,7 +180,6 @@ e1000e_rx_rss_type(uint32_t type) "RSS type is %u"
 e1000e_rx_rss_ip4(bool isfragment, bool istcp, uint32_t mrqc, bool tcpipv4_enabled, bool ipv4_enabled) "RSS IPv4: fragment %d, tcp %d, mrqc 0x%X, tcpipv4 enabled %d, ipv4 enabled %d"
 e1000e_rx_rss_ip6_rfctl(uint32_t rfctl) "RSS IPv6: rfctl 0x%X"
 e1000e_rx_rss_ip6(bool ex_dis, bool new_ex_dis, bool istcp, bool has_ext_headers, bool ex_dst_valid, bool ex_src_valid, uint32_t mrqc, bool tcpipv6_enabled, bool ipv6ex_enabled, bool ipv6_enabled) "RSS IPv6: ex_dis: %d, new_ex_dis: %d, tcp %d, has_ext_headers %d, ex_dst_valid %d, ex_src_valid %d, mrqc 0x%X, tcpipv6 enabled %d, ipv6ex enabled %d, ipv6 enabled %d"
-e1000e_rx_rss_dispatched_to_queue(int queue_idx) "Packet being dispatched to queue %d"
 
 e1000e_rx_metadata_protocols(bool isip4, bool isip6, bool isudp, bool istcp) "protocols: ip4: %d, ip6: %d, udp: %d, tcp: %d"
 e1000e_rx_metadata_vlan(uint16_t vlan_tag) "VLAN tag is 0x%X"
-- 
2.7.4


