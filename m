Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E2241773E8
	for <lists+qemu-devel@lfdr.de>; Tue,  3 Mar 2020 11:21:15 +0100 (CET)
Received: from localhost ([::1]:44844 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j94fq-0003pW-Kb
	for lists+qemu-devel@lfdr.de; Tue, 03 Mar 2020 05:21:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52705)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <jasowang@redhat.com>) id 1j94WN-0008Jl-42
 for qemu-devel@nongnu.org; Tue, 03 Mar 2020 05:11:28 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <jasowang@redhat.com>) id 1j94WL-0006Gy-Gl
 for qemu-devel@nongnu.org; Tue, 03 Mar 2020 05:11:27 -0500
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:58115
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <jasowang@redhat.com>) id 1j94WL-0006Gi-DA
 for qemu-devel@nongnu.org; Tue, 03 Mar 2020 05:11:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1583230284;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=M/7mhrmkDMgWbya6uQPhNZ02yGNhHjKbCLFNhsQU/Mo=;
 b=JlMqyJ2qYsk5owf0qilwpXIYtbgotKgr1iVc69yXRBXSFRDDx7sYPuE+7Im8nCiCTanKTf
 HoOlniUMPLQLvhkIil5FZxaRT7MGkRqpembrrEssXvv8e7LciyOz6GOdY1X8TRcOp83cdx
 fMz1mjQxp9WRuC0n8EAvADufky1VF/w=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-19-61Ixa9i_ODG3rJfomLpD_w-1; Tue, 03 Mar 2020 05:11:22 -0500
X-MC-Unique: 61Ixa9i_ODG3rJfomLpD_w-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id AAB9F189F765;
 Tue,  3 Mar 2020 10:11:21 +0000 (UTC)
Received: from jason-ThinkPad-T430s.redhat.com (ovpn-12-98.pek2.redhat.com
 [10.72.12.98])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 13C988B745;
 Tue,  3 Mar 2020 10:11:19 +0000 (UTC)
From: Jason Wang <jasowang@redhat.com>
To: peter.maydell@linaro.org
Subject: [PULL V2 16/23] NetRxPkt: Introduce support for additional hash types
Date: Tue,  3 Mar 2020 18:10:35 +0800
Message-Id: <1583230242-14597-17-git-send-email-jasowang@redhat.com>
In-Reply-To: <1583230242-14597-1-git-send-email-jasowang@redhat.com>
References: <1583230242-14597-1-git-send-email-jasowang@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.81
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Yuri Benditovich <yuri.benditovich@daynix.com>,
 Jason Wang <jasowang@redhat.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Yuri Benditovich <yuri.benditovich@daynix.com>

Add support for following hash types:
IPV6 TCP with extension headers
IPV4 UDP
IPV6 UDP
IPV6 UDP with extension headers

Signed-off-by: Yuri Benditovich <yuri.benditovich@daynix.com>
Acked-by: Dmitry Fleytman <dmitry.fleytman@gmail.com>
Signed-off-by: Jason Wang <jasowang@redhat.com>
---
 hw/net/net_rx_pkt.c | 42 ++++++++++++++++++++++++++++++++++++++++++
 hw/net/net_rx_pkt.h |  6 +++++-
 hw/net/trace-events |  4 ++++
 3 files changed, 51 insertions(+), 1 deletion(-)

diff --git a/hw/net/net_rx_pkt.c b/hw/net/net_rx_pkt.c
index 98a5030..b2a06bd 100644
--- a/hw/net/net_rx_pkt.c
+++ b/hw/net/net_rx_pkt.c
@@ -307,6 +307,20 @@ _net_rx_rss_prepare_tcp(uint8_t *rss_input,
                           &tcphdr->th_dport, sizeof(uint16_t));
 }
=20
+static inline void
+_net_rx_rss_prepare_udp(uint8_t *rss_input,
+                        struct NetRxPkt *pkt,
+                        size_t *bytes_written)
+{
+    struct udp_header *udphdr =3D &pkt->l4hdr_info.hdr.udp;
+
+    _net_rx_rss_add_chunk(rss_input, bytes_written,
+                          &udphdr->uh_sport, sizeof(uint16_t));
+
+    _net_rx_rss_add_chunk(rss_input, bytes_written,
+                          &udphdr->uh_dport, sizeof(uint16_t));
+}
+
 uint32_t
 net_rx_pkt_calc_rss_hash(struct NetRxPkt *pkt,
                          NetRxPktRssType type,
@@ -347,6 +361,34 @@ net_rx_pkt_calc_rss_hash(struct NetRxPkt *pkt,
         trace_net_rx_pkt_rss_ip6_ex();
         _net_rx_rss_prepare_ip6(&rss_input[0], pkt, true, &rss_length);
         break;
+    case NetPktRssIpV6TcpEx:
+        assert(pkt->isip6);
+        assert(pkt->istcp);
+        trace_net_rx_pkt_rss_ip6_ex_tcp();
+        _net_rx_rss_prepare_ip6(&rss_input[0], pkt, true, &rss_length);
+        _net_rx_rss_prepare_tcp(&rss_input[0], pkt, &rss_length);
+        break;
+    case NetPktRssIpV4Udp:
+        assert(pkt->isip4);
+        assert(pkt->isudp);
+        trace_net_rx_pkt_rss_ip4_udp();
+        _net_rx_rss_prepare_ip4(&rss_input[0], pkt, &rss_length);
+        _net_rx_rss_prepare_udp(&rss_input[0], pkt, &rss_length);
+        break;
+    case NetPktRssIpV6Udp:
+        assert(pkt->isip6);
+        assert(pkt->isudp);
+        trace_net_rx_pkt_rss_ip6_udp();
+        _net_rx_rss_prepare_ip6(&rss_input[0], pkt, false, &rss_length);
+        _net_rx_rss_prepare_udp(&rss_input[0], pkt, &rss_length);
+        break;
+    case NetPktRssIpV6UdpEx:
+        assert(pkt->isip6);
+        assert(pkt->isudp);
+        trace_net_rx_pkt_rss_ip6_ex_udp();
+        _net_rx_rss_prepare_ip6(&rss_input[0], pkt, true, &rss_length);
+        _net_rx_rss_prepare_udp(&rss_input[0], pkt, &rss_length);
+        break;
     default:
         assert(false);
         break;
diff --git a/hw/net/net_rx_pkt.h b/hw/net/net_rx_pkt.h
index 7adf0fa..048e346 100644
--- a/hw/net/net_rx_pkt.h
+++ b/hw/net/net_rx_pkt.h
@@ -133,7 +133,11 @@ typedef enum {
     NetPktRssIpV4Tcp,
     NetPktRssIpV6Tcp,
     NetPktRssIpV6,
-    NetPktRssIpV6Ex
+    NetPktRssIpV6Ex,
+    NetPktRssIpV6TcpEx,
+    NetPktRssIpV4Udp,
+    NetPktRssIpV6Udp,
+    NetPktRssIpV6UdpEx,
 } NetRxPktRssType;
=20
 /**
diff --git a/hw/net/trace-events b/hw/net/trace-events
index 42066fc..a1da98a 100644
--- a/hw/net/trace-events
+++ b/hw/net/trace-events
@@ -92,9 +92,13 @@ net_rx_pkt_l3_csum_validate_csum(size_t l3hdr_off, uint3=
2_t csl, uint32_t cntr,
=20
 net_rx_pkt_rss_ip4(void) "Calculating IPv4 RSS  hash"
 net_rx_pkt_rss_ip4_tcp(void) "Calculating IPv4/TCP RSS  hash"
+net_rx_pkt_rss_ip4_udp(void) "Calculating IPv4/UDP RSS  hash"
 net_rx_pkt_rss_ip6_tcp(void) "Calculating IPv6/TCP RSS  hash"
+net_rx_pkt_rss_ip6_udp(void) "Calculating IPv6/UDP RSS  hash"
 net_rx_pkt_rss_ip6(void) "Calculating IPv6 RSS  hash"
 net_rx_pkt_rss_ip6_ex(void) "Calculating IPv6/EX RSS  hash"
+net_rx_pkt_rss_ip6_ex_tcp(void) "Calculating IPv6/EX/TCP RSS  hash"
+net_rx_pkt_rss_ip6_ex_udp(void) "Calculating IPv6/EX/UDP RSS  hash"
 net_rx_pkt_rss_hash(size_t rss_length, uint32_t rss_hash) "RSS hash for %z=
u bytes: 0x%X"
 net_rx_pkt_rss_add_chunk(void* ptr, size_t size, size_t input_offset) "Add=
 RSS chunk %p, %zu bytes, RSS input offset %zu bytes"
=20
--=20
2.5.0


