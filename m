Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5893419ED71
	for <lists+qemu-devel@lfdr.de>; Sun,  5 Apr 2020 20:52:14 +0200 (CEST)
Received: from localhost ([::1]:50884 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jLANR-00057I-0T
	for lists+qemu-devel@lfdr.de; Sun, 05 Apr 2020 14:52:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35694)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <andrew@daynix.com>) id 1jLAMW-0004Ju-8x
 for qemu-devel@nongnu.org; Sun, 05 Apr 2020 14:51:17 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <andrew@daynix.com>) id 1jLAMV-0005TP-1s
 for qemu-devel@nongnu.org; Sun, 05 Apr 2020 14:51:16 -0400
Received: from mail-lj1-x241.google.com ([2a00:1450:4864:20::241]:42548)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <andrew@daynix.com>) id 1jLAMU-0005S1-M6
 for qemu-devel@nongnu.org; Sun, 05 Apr 2020 14:51:15 -0400
Received: by mail-lj1-x241.google.com with SMTP id q19so12246458ljp.9
 for <qemu-devel@nongnu.org>; Sun, 05 Apr 2020 11:51:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=3sA8pH7seALF2QzJV8GVxLt5pHkKdiNBdLQFXUpSj3k=;
 b=A1pQTC6cUMFc5AC7ii9O+kKgzqIxUGWxTH8s+3V+2F9mj3F/4aPN7uHBkz6g/gpZsK
 9AcUT/kwe4KSwjOlJzhh8SmQ3bH/J0+48IJBaIjC0SXj/1PFRut/262GZikAT/Ddm8z3
 KLRS6RCrnonC7px77NKRnnkB3PSOF1Zn7VH3Z/IKunPgsuB5L6ZD6xtqEwkMNZGRtS//
 BcpxqbyQvElFJ/4Twqjodr6RS3bIYbwaG7PYVBXFTZLZslH2Hsl1oya7fubThHZ7yWbX
 GTgX+OVbs/HUML+Kcz+LRYGGTH9c4Mm23XnyNXAoYiZQd/hRli/jVxktshLKiL6v5XYN
 XWsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=3sA8pH7seALF2QzJV8GVxLt5pHkKdiNBdLQFXUpSj3k=;
 b=tjj2yYr/OGYKVI3+SId/0oyV8Iz5KqdjsvSLkvfFpw8j/dYvVXWrjEpAuN9NpN0gFK
 MrcVIu57dkVwwRljHRr1Plu1S2AZ704ZLOhdNlyVxaH0FmDeQGtNevxbzrXroaDcSyMC
 zemxZk8tqzUDjVq9L6vOdSsyGLlBAGUZyXLIk+5VAtITh4lQHgHk/b0DKIePMHVl73up
 12yHB1aYUjeECRnL88lWhlS9jX4K2YgcFecKK/J1/1D6DTK2K2r8H9fgTm2xvEYC1m6m
 IbMnUInG2WU8d2qEn9G//lgTGBAg2b5sfqt8TOVTZ723ApHX53o4zRnQuWePcKiqjU6t
 bJdA==
X-Gm-Message-State: AGi0PuZmcId4pmeIlQH3MgOBboVL2Mj7SmnYGzYOgPj48DuXTuEszrIF
 bPCyjYRMTcziOWDHH5MUCc1N7nP+2SE=
X-Google-Smtp-Source: APiQypJq4eL2VdAFEmbXJ3GuO1k22Cf7FwjlUSfFWzHhVzcNtQnFEPjAnCyJMpeb8tx7se2+NjNO5w==
X-Received: by 2002:a2e:81cc:: with SMTP id s12mr10321055ljg.90.1586112672449; 
 Sun, 05 Apr 2020 11:51:12 -0700 (PDT)
Received: from navi.cosmonova.net.ua ([95.67.24.131])
 by smtp.gmail.com with ESMTPSA id w24sm7689873lfe.58.2020.04.05.11.51.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 05 Apr 2020 11:51:11 -0700 (PDT)
From: andrew@daynix.com
To: qemu-devel@nongnu.org
Subject: [PATCH] Fixed IPv6 payload lenght without jumbo option
Date: Sun,  5 Apr 2020 22:18:10 +0300
Message-Id: <20200405191810.864017-1-andrew@daynix.com>
X-Mailer: git-send-email 2.24.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::241
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
Cc: jasowang@redhat.com, dmitry.fleytman@gmail.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Andrew Melnychenko <andrew@daynix.com>

Buglink: https://bugzilla.redhat.com/show_bug.cgi?id=1708065
e1000e driver doesn't sets 'plen' field for IPv6 for big packets
if TSO is enabled. Jumbo option isn't added yet, until
qemu supports packets greater than 64K.

Signed-off-by: Andrew Melnychenko <andrew@daynix.com>
---
 hw/net/e1000e_core.c |  1 +
 hw/net/net_tx_pkt.c  | 31 +++++++++++++++++++++++++++++++
 hw/net/net_tx_pkt.h  |  7 +++++++
 include/net/eth.h    |  1 +
 4 files changed, 40 insertions(+)

diff --git a/hw/net/e1000e_core.c b/hw/net/e1000e_core.c
index d5676871fa..a1ec55598b 100644
--- a/hw/net/e1000e_core.c
+++ b/hw/net/e1000e_core.c
@@ -656,6 +656,7 @@ e1000e_tx_pkt_send(E1000ECore *core, struct e1000e_tx *tx, int queue_index)
     NetClientState *queue = qemu_get_subqueue(core->owner_nic, target_queue);
 
     e1000e_setup_tx_offloads(core, tx);
+    net_tx_pkt_fix_ip6_payload_len(tx->tx_pkt);
 
     net_tx_pkt_dump(tx->tx_pkt);
 
diff --git a/hw/net/net_tx_pkt.c b/hw/net/net_tx_pkt.c
index 162f802dd7..b05d554ac3 100644
--- a/hw/net/net_tx_pkt.c
+++ b/hw/net/net_tx_pkt.c
@@ -635,3 +635,34 @@ bool net_tx_pkt_send_loopback(struct NetTxPkt *pkt, NetClientState *nc)
 
     return res;
 }
+
+void net_tx_pkt_fix_ip6_payload_len(struct NetTxPkt *pkt)
+{
+    /*
+     * If ipv6 payload length field is 0 - then there should be Hop-by-Hop
+     * option for packets greater than 65,535.
+     * For packets with payload less than 65,535: fix 'plen' field.
+     * For now, qemu drops every packet with size greater 64K
+     * (see net_tx_pkt_send()) so, there is no reason to add jumbo option to ip6
+     * hop-by-hop extension if it's missed
+     */
+
+    struct iovec *l2 = &pkt->vec[NET_TX_PKT_L2HDR_FRAG];
+    if (eth_get_l3_proto(l2, 1, l2->iov_len) == ETH_P_IPV6) {
+        struct ip6_header *ip6 = (struct ip6_header *) pkt->l3_hdr;
+        /*
+         * TODO: if qemu would support >64K packets - add jumbo option check
+         * something like that:
+         * 'if (ip6->ip6_plen == 0 && !has_jumbo_option(ip6)) {'
+         */
+        if (ip6->ip6_plen == 0) {
+            if (pkt->payload_len <= ETH_MAX_IP_DGRAM_LEN) {
+                ip6->ip6_plen = htons(pkt->payload_len);
+            }
+            /*
+             * TODO: if qemu would support >64K packets
+             * add jumbo option for packets greater then 65,535 bytes
+             */
+        }
+    }
+}
diff --git a/hw/net/net_tx_pkt.h b/hw/net/net_tx_pkt.h
index 212ecc62fc..912d56ef13 100644
--- a/hw/net/net_tx_pkt.h
+++ b/hw/net/net_tx_pkt.h
@@ -187,4 +187,11 @@ bool net_tx_pkt_parse(struct NetTxPkt *pkt);
 */
 bool net_tx_pkt_has_fragments(struct NetTxPkt *pkt);
 
+/**
+ * Fix IPv6 'plen' field.
+ *
+ * @pkt            packet
+ */
+void net_tx_pkt_fix_ip6_payload_len(struct NetTxPkt *pkt);
+
 #endif
diff --git a/include/net/eth.h b/include/net/eth.h
index 7f45c678e7..0671be6916 100644
--- a/include/net/eth.h
+++ b/include/net/eth.h
@@ -186,6 +186,7 @@ struct tcp_hdr {
 
 #define ip6_nxt      ip6_ctlun.ip6_un1.ip6_un1_nxt
 #define ip6_ecn_acc  ip6_ctlun.ip6_un3.ip6_un3_ecn
+#define ip6_plen     ip6_ctlun.ip6_un1.ip6_un1_plen
 
 #define PKT_GET_ETH_HDR(p)        \
     ((struct eth_header *)(p))
-- 
2.24.1


