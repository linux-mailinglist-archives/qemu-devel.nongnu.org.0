Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A30F86A05F4
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Feb 2023 11:22:52 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pV8k9-00083U-4u; Thu, 23 Feb 2023 05:22:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1pV8k7-0007xi-1j
 for qemu-devel@nongnu.org; Thu, 23 Feb 2023 05:22:27 -0500
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1pV8k5-0002lt-DC
 for qemu-devel@nongnu.org; Thu, 23 Feb 2023 05:22:26 -0500
Received: by mail-pj1-x102e.google.com with SMTP id u10so12330276pjc.5
 for <qemu-devel@nongnu.org>; Thu, 23 Feb 2023 02:22:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=jC2oma+4dx0vXgHNVPLx5yQddrN4Crk9daChNzOuQT8=;
 b=nwLlTwjT0N8Vd/Yz6Z02OXyXSlycLTtKNnXzFGxV26E++Owy9MOCYMOAEexoliW3R4
 LLdZCyiFCntyuWjVaSL0kkjopqRB1P69ac31ClXtFlworHXR8ay6G4WvSGz9ZyOv+DbM
 VrBKipbANg8nc0MVVyxhEomNv5o67tNllZDQWNM74b3MlSxjRdAMjGA2VLm9dRvV2rKY
 0QdYdFIwGPyL4+cYz27cbRl/hQtvowtfW3N4UNvqCJrlJFZQY+KSrVq7yFtu/I9TvdfG
 /JYPFl1cTrPFKjNA+ArhaLGLxR3KWqhRCBlLig5bsMU/2aCMg1d+GtznxA6ckSo5aQ71
 dREA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=jC2oma+4dx0vXgHNVPLx5yQddrN4Crk9daChNzOuQT8=;
 b=z7Yc3+4Nk/3GfnwOMWwFRS9QXgDbFXmf2AO2iiC+HYsxGiUO23G7aeYcwxZGqSjM5H
 jyAywjHE2rz1Jm2j9U9fkkN/eXZjeudZ/b35PaOTNThmLgB7hM60sSw2PmuxcSDM3eh9
 5+T0xKf7NMJlM3TVlfdmvJ2qdy7Lp2R5M5hdIdKGiyMTLPbjANtPlli8MU+dzm79K0sL
 ySNrBNvjZfPcy96raxz+33VrdXngHbVSedgajxqjrYglEakST/4ugO4oTVCyMV2BzA1C
 3Yz3ADBMMw2oDHHzEx7/21sDsR22D/oow7XStGFBlTBXMcMJizUxRPaoGFZ2D1C+/rW0
 GrlA==
X-Gm-Message-State: AO0yUKXK95P9smQ+tTpRYnBJ9jH9Mq6mf1I2Hs0+2DEnQO4KHA4gfgQD
 PyvfSOMGteBsxEZmAvC3GAhWcQ==
X-Google-Smtp-Source: AK7set/vP1V0oEtadVPsvEG+RGyi7aGVNWH8mcplYsekRYPJ+XQBDurICyB9XcfNS9JqUXYxJ/3wyA==
X-Received: by 2002:a17:902:c941:b0:19a:7882:c1a9 with SMTP id
 i1-20020a170902c94100b0019a7882c1a9mr14293836pla.63.1677147744727; 
 Thu, 23 Feb 2023 02:22:24 -0800 (PST)
Received: from alarm.flets-east.jp ([2400:4050:a840:1e00:4457:c267:5e09:481b])
 by smtp.gmail.com with ESMTPSA id
 c20-20020a170902c1d400b00196217f1219sm4107734plc.70.2023.02.23.02.22.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 Feb 2023 02:22:24 -0800 (PST)
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
Subject: [PATCH v6 30/34] e1000e: Combine rx traces
Date: Thu, 23 Feb 2023 19:20:14 +0900
Message-Id: <20230223102018.141748-31-akihiko.odaki@daynix.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230223102018.141748-1-akihiko.odaki@daynix.com>
References: <20230223102018.141748-1-akihiko.odaki@daynix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::102e;
 envelope-from=akihiko.odaki@daynix.com; helo=mail-pj1-x102e.google.com
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

Whether a packet will be written back to the guest depends on the
remaining space of the queue. Therefore, e1000e_rx_written_to_guest and
e1000e_rx_not_written_to_guest should log the index of the queue instead
of generated interrupts. This also removes the need of
e1000e_rx_rss_dispatched_to_queue, which logs the queue index.

Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
---
 hw/net/e1000e_core.c | 6 ++----
 hw/net/trace-events  | 5 ++---
 2 files changed, 4 insertions(+), 7 deletions(-)

diff --git a/hw/net/e1000e_core.c b/hw/net/e1000e_core.c
index 76c7814cb8..4fec6dfe7e 100644
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
index f7257a0693..d24ba945dc 100644
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
2.39.1


