Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CB5C820CB46
	for <lists+qemu-devel@lfdr.de>; Mon, 29 Jun 2020 02:50:51 +0200 (CEST)
Received: from localhost ([::1]:37730 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jpi0Y-0005bg-3u
	for lists+qemu-devel@lfdr.de; Sun, 28 Jun 2020 20:50:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60130)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andrew@daynix.com>) id 1jphyv-0004m3-Qk
 for qemu-devel@nongnu.org; Sun, 28 Jun 2020 20:49:10 -0400
Received: from mail-lj1-x242.google.com ([2a00:1450:4864:20::242]:34910)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <andrew@daynix.com>) id 1jphyu-0007FE-2q
 for qemu-devel@nongnu.org; Sun, 28 Jun 2020 20:49:09 -0400
Received: by mail-lj1-x242.google.com with SMTP id f8so3881318ljc.2
 for <qemu-devel@nongnu.org>; Sun, 28 Jun 2020 17:49:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=UucnVOUlq0fl3DLGeQWYN/9uiYLLRhCSlX0V+99wPYc=;
 b=DZK6yLJbVJnpvwLcSrgR6oCNW5uD58CdShn+N4yWDGEE+a8e9pRyxwG1XXwr0CFaeR
 5Lc+v520tcKBo9v2Snvj6Esrabk4iF0rSppmvC8bWxGzZpCCIS+bR5pdVVD9/g6ba9EI
 oJL18PZv9EX0alfig/0Z+n2GT0ZJIRJWvOIvFTlFGtEBIT3wUa3wHCKTlkgUw9uq/xNk
 uynaUsPawNr4bjatarA59Srnq9kqMrWDBAWUCeDx5BtM4azJ6sCj1nzTkHHbcHPYRxPI
 gEuiI921MBzB9Rjwy3RfiiJ+J6yY5iQ14bJB79PSeH5cslHsKCKar+W19OwMG4u2tPfP
 1wmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=UucnVOUlq0fl3DLGeQWYN/9uiYLLRhCSlX0V+99wPYc=;
 b=SkvNW8oZfiCxuz8Lmmn4gwZqxpXW7Ur8o6HIQi4cBVJykvxmwFX5rEa0aM0qn1V6DI
 B2B72EYbpWPSM2ByUDkr6TAAo8+MExwi0/dzE+XA+2oJtHBBY6IdCW0xZ4BAJjomMo4F
 xYLU+x9m8mNqBKM9aSYwbVVRz2CnMEcfC9qLKpXhANlgbV0F5ct0g0qkC6UfRphb0wZa
 xDaUXeo34JpwPJa03Dr3uznbDjIcLQRf7vMg8abQqjj7YHVn7muTUSbks5QebbwMgoGO
 thgovFRZ2fkfIe9hB9FNZhS5YZHGAlXx+apjl6nJlT+Q5PW2LI3GpMo63Ck4JDh9Umf5
 fZoQ==
X-Gm-Message-State: AOAM533CSCIxAUTOpU8x0+MimbpcM34YyGwRA2BoZGDiMfhNA6Jp+PoW
 m/803W/Z+ZwWqTD8RiG757Jqr5DtgzyK4g==
X-Google-Smtp-Source: ABdhPJx28o/UCFEHPvh7ufO5PkbWsmfDZAtDvPR+HUAhDH2mKkIbPpvdoOvJS/TMLZoCMJgKTDxe4g==
X-Received: by 2002:a2e:4812:: with SMTP id v18mr6981795lja.353.1593391745378; 
 Sun, 28 Jun 2020 17:49:05 -0700 (PDT)
Received: from navi.cosmonova.net.ua ([95.67.24.131])
 by smtp.gmail.com with ESMTPSA id i197sm5096429lfi.58.2020.06.28.17.49.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 28 Jun 2020 17:49:04 -0700 (PDT)
From: andrew@daynix.com
To: qemu-devel@nongnu.org
Subject: [PATCH v2 1/2] hw/net: Added CSO for IPv6
Date: Mon, 29 Jun 2020 04:17:59 +0300
Message-Id: <20200629011800.374914-1-andrew@daynix.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2a00:1450:4864:20::242;
 envelope-from=andrew@daynix.com; helo=mail-lj1-x242.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=_AUTOLEARN
X-Spam_action: no action
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

From: Andrew <andrew@daynix.com>

Added fix for checksum offload for IPv6 if a backend doesn't
have a virtual header.
This patch is a part of IPv6 fragmentation.

Signed-off-by: Andrew Melnychenko <andrew@daynix.com>
---
 hw/net/net_tx_pkt.c | 15 ++++++++++++---
 1 file changed, 12 insertions(+), 3 deletions(-)

diff --git a/hw/net/net_tx_pkt.c b/hw/net/net_tx_pkt.c
index 162f802dd7..331c73cfc0 100644
--- a/hw/net/net_tx_pkt.c
+++ b/hw/net/net_tx_pkt.c
@@ -468,8 +468,8 @@ static void net_tx_pkt_do_sw_csum(struct NetTxPkt *pkt)
     /* num of iovec without vhdr */
     uint32_t iov_len = pkt->payload_frags + NET_TX_PKT_PL_START_FRAG - 1;
     uint16_t csl;
-    struct ip_header *iphdr;
     size_t csum_offset = pkt->virt_hdr.csum_start + pkt->virt_hdr.csum_offset;
+    uint16_t l3_proto = eth_get_l3_proto(iov, 1, iov->iov_len);
 
     /* Put zero to checksum field */
     iov_from_buf(iov, iov_len, csum_offset, &csum, sizeof csum);
@@ -477,9 +477,18 @@ static void net_tx_pkt_do_sw_csum(struct NetTxPkt *pkt)
     /* Calculate L4 TCP/UDP checksum */
     csl = pkt->payload_len;
 
+    csum_cntr = 0;
+    cso = 0;
     /* add pseudo header to csum */
-    iphdr = pkt->vec[NET_TX_PKT_L3HDR_FRAG].iov_base;
-    csum_cntr = eth_calc_ip4_pseudo_hdr_csum(iphdr, csl, &cso);
+    if (l3_proto == ETH_P_IP) {
+        csum_cntr = eth_calc_ip4_pseudo_hdr_csum(
+                pkt->vec[NET_TX_PKT_L3HDR_FRAG].iov_base,
+                csl, &cso);
+    } else if (l3_proto == ETH_P_IPV6) {
+        csum_cntr = eth_calc_ip6_pseudo_hdr_csum(
+                pkt->vec[NET_TX_PKT_L3HDR_FRAG].iov_base,
+                csl, pkt->l4proto, &cso);
+    }
 
     /* data checksum */
     csum_cntr +=
-- 
2.27.0


