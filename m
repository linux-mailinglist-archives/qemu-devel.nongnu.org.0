Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ED881685E01
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Feb 2023 04:38:32 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pN3w4-0001Ac-7D; Tue, 31 Jan 2023 22:37:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1pN3w1-0000vf-QA
 for qemu-devel@nongnu.org; Tue, 31 Jan 2023 22:37:21 -0500
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1pN3w0-0000fb-11
 for qemu-devel@nongnu.org; Tue, 31 Jan 2023 22:37:21 -0500
Received: by mail-pl1-x631.google.com with SMTP id z1so9643068plg.6
 for <qemu-devel@nongnu.org>; Tue, 31 Jan 2023 19:37:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=jC2oma+4dx0vXgHNVPLx5yQddrN4Crk9daChNzOuQT8=;
 b=V4RPtpSqaO8XQG+pvyCSUwWDFuapm3YN1iDb5ARbPGChK+TmJdt81sug0pKLElKsxn
 AnK2zGLfSRnS+V67Q0IpXk4FHLvmcwR63EYsayg1dV9Sz9ZHtDdpz713ZWDCsv/N/wQy
 p2+vFayhbujVdr7h/zZvLsQc46clkVa08bb1nQePx1dwGDsYMBdlTycKtUO7xgouSm67
 g88iC6gPPr0fPBYXDFtlPOVisJqsdN7aRnis0A3rbh+vQ5/Bwol3admbP/r7ShJS4izU
 0v5EJXIa4J3BkqQmekHXM+Ou3Usboznoq6POBiViVgLickAMxgGc2UkDktZkAyvkFKLC
 qz6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=jC2oma+4dx0vXgHNVPLx5yQddrN4Crk9daChNzOuQT8=;
 b=0V4OAPBEorv6mbQfXjzf0+xJfeAhkimnpu4t106V2JO/zi3PRUryAjV76cx9dYpGXZ
 EhjUwoIZbsenibilc1MTMlmq+Y4r6h4Irlmd5J0VN8KCxIcOzVp3807uVciVMVFK3w22
 Qun7mfMRxXssAKGFIg/8WuozGOQI3SpWE6fgwf19f8YKP1l5KY3fdAWEzgbqiKpRA3T9
 Yn80ImVnDcF8e0LHokyMKIYqopNEoYWiQuzueLWYL9TODUIgsyTmP1pziW+1VS7yZbfO
 I0RRbm8VNUiJQSSqsQlMlZdC+iW6/H2BjzNFYW+RY6M8/ADHVXZOqaGfjyUCoYjBXXOX
 opWQ==
X-Gm-Message-State: AO0yUKWwAkRogUe4gtORslPEQS6KFlYREQr3RTPPjhjIdDLGCAuKux3h
 lh+ahEhXdWpAfO4AsH/fb7KbZw==
X-Google-Smtp-Source: AK7set+gpw1My7NE1FRoICA2UUFjnjqR0gT4L3UsklFrHhGOAcoYcXjQG43RZiYmPMv94rqVhcG1dA==
X-Received: by 2002:a05:6a20:a581:b0:bb:ccef:f896 with SMTP id
 bc1-20020a056a20a58100b000bbcceff896mr1074887pzb.12.1675222638704; 
 Tue, 31 Jan 2023 19:37:18 -0800 (PST)
Received: from alarm.flets-east.jp ([2400:4050:a840:1e00:4457:c267:5e09:481b])
 by smtp.gmail.com with ESMTPSA id
 x15-20020a170902ec8f00b001968b529c98sm4185557plg.128.2023.01.31.19.37.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 31 Jan 2023 19:37:18 -0800 (PST)
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
Subject: [PATCH v5 29/29] e1000e: Combine rx traces
Date: Wed,  1 Feb 2023 12:35:39 +0900
Message-Id: <20230201033539.30049-30-akihiko.odaki@daynix.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230201033539.30049-1-akihiko.odaki@daynix.com>
References: <20230201033539.30049-1-akihiko.odaki@daynix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::631;
 envelope-from=akihiko.odaki@daynix.com; helo=mail-pl1-x631.google.com
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


