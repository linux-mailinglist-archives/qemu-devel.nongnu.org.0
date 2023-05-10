Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C4DCE6FD92C
	for <lists+qemu-devel@lfdr.de>; Wed, 10 May 2023 10:24:29 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pwf6Q-0005sR-LJ; Wed, 10 May 2023 04:23:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <t.dzieciol@partner.samsung.com>)
 id 1pwf6N-0005rB-D4
 for qemu-devel@nongnu.org; Wed, 10 May 2023 04:23:11 -0400
Received: from mailout1.w1.samsung.com ([210.118.77.11])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <t.dzieciol@partner.samsung.com>)
 id 1pwf6K-0007gm-DD
 for qemu-devel@nongnu.org; Wed, 10 May 2023 04:23:11 -0400
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
 by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id
 20230510082303euoutp0140003b7de12141396282aedb2505b138~dupTJpF_02095220952euoutp01p
 for <qemu-devel@nongnu.org>; Wed, 10 May 2023 08:23:03 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com
 20230510082303euoutp0140003b7de12141396282aedb2505b138~dupTJpF_02095220952euoutp01p
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1683706983;
 bh=wO5gaesISuEdjaAU2KXBboHbME+HpMIPsPuP7qC625s=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=GVrkFegl4eXrePCfnbVU4zdZVWYegG/eEsFM33J38azZ7FnprLD8LiCsJ3v+ScYs9
 5ECy5E5siHEC3fZYrheLB3urFs8HeFrGYVOdDtddjrwfWw6pqkILHbgItwY/W8DZea
 NmgZHhZjxh8DRM6DCU04PjOnjtxmT0i0swXOipJ0=
Received: from eusmges1new.samsung.com (unknown [203.254.199.242]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTP id
 20230510082303eucas1p10e9c31daafa5367a757676cf0f7d26e4~dupSz-9M70155501555eucas1p1s;
 Wed, 10 May 2023 08:23:03 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
 eusmges1new.samsung.com (EUCPMTA) with SMTP id 7A.B3.42423.7645B546; Wed, 10
 May 2023 09:23:03 +0100 (BST)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
 20230510082303eucas1p139f531b811cf1547da84f23ce743b1fb~dupSUb7MJ0620406204eucas1p1T;
 Wed, 10 May 2023 08:23:03 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
 eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20230510082302eusmtrp14f3f2dd2c238d65edd12a2ab88996a27~dupSOtGFc0702607026eusmtrp1Y;
 Wed, 10 May 2023 08:23:02 +0000 (GMT)
X-AuditID: cbfec7f2-a51ff7000002a5b7-60-645b546737b2
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
 eusmgms1.samsung.com (EUCPMTA) with SMTP id 2D.01.10549.6645B546; Wed, 10
 May 2023 09:23:02 +0100 (BST)
Received: from AMDN5139.EU.corp.samsungelectronics.net (unknown
 [106.210.135.112]) by eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20230510082302eusmtip1907c2c1119392d85b24b6338baec4e37~dupRpt-Km2222822228eusmtip1L;
 Wed, 10 May 2023 08:23:02 +0000 (GMT)
From: Tomasz Dzieciol <t.dzieciol@partner.samsung.com>
To: qemu-devel@nongnu.org, akihiko.odaki@daynix.com
Cc: sriram.yagnaraman@est.tech, jasowang@redhat.com, k.kwiecien@samsung.com,
 m.sochacki@samsung.com
Subject: [PATCH v5 5/6] igb: add IPv6 extended headers traffic detection
Date: Wed, 10 May 2023 10:22:53 +0200
Message-Id: <20230510082254.1036-6-t.dzieciol@partner.samsung.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230510082254.1036-1-t.dzieciol@partner.samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFupileLIzCtJLcpLzFFi42LZduzned30kOgUg3VT5Cw+n1rLbrHs0mcm
 i8b5c1gttl79wW5xvHcHi0XvphdMDmweJ94eZPW48Ogcs8eTa5uZPN7vu8rm0bdlFWMAaxSX
 TUpqTmZZapG+XQJXRv/G62wFO7gqZp+VbGBcydHFyMkhIWAiMXXeOvYuRi4OIYEVjBKzX7Yw
 QzhfGCWan/xmhXA+M0p8u7SbCaalbfZmqJbljBIb579jgXDamSQuzzrNDFLFJmAm8ejLPKB2
 Dg4RAWOJj+3iIGFmgVSJo38OsoDYwgIeEsvePWIHKWERUJVY1KkGEuYVcJK4e+AnG8QueYmZ
 l76zg9icAs4Se+e0skLUCEqcnPmEBWKkvETz1tlgV0sIbOGQWLZkPiNEs4vE4RsPoAYJS7w6
 voUdwpaROD25hwXCLpf4eXYbO0RzC6PEnqmToYqsJS5t/Ql2P7OApsT6XfoQYUeJ9vZTjCBh
 CQE+iRtvBSFu4JOYtG06M0SYV6KjTQiiWkfi26aZbBBhKYmFN+ogwh4Si44eYJzAqDgLyTOz
 kDwzC2HtAkbmVYziqaXFuempxYZ5qeV6xYm5xaV56XrJ+bmbGIHJ5fS/4592MM599VHvECMT
 B+MhRgkOZiURXu/QqBQh3pTEyqrUovz4otKc1OJDjNIcLErivNq2J5OFBNITS1KzU1MLUotg
 skwcnFINTAuMzrT9fyitpb8kvVRcdVpQ03PTONkHLPm+Bzc4saV4/bst7uKcy1KYKzWL9+Up
 tVbRhfybn/ltCVXN0o1TskiaJBK9a9bvLT0LzH7WeXZ/TWtJL+1TKlYqNjbdrLIl++O50ttz
 H/ze7HTjx84JgafWxfN9+3JVNmU6y8U9Hx9eF3kf8DJhEsu0flPpxQYr+o4Z2B/7IG6u5/ni
 ZKK76VPBOlUr9uhvz113K1RH8c5KYK1xUZG//epEvu5l0zyun9d+zj3Kc1rhRRxf9kOLa12H
 oy5fnn7Xcm7Vm+VnfDm/n/kvVRwzzXfVuuo9e3/5mjXsnyygV6X0w+1Xh3XYvpagsNCCXe1P
 ZAUmyfgzKLEUZyQaajEXFScCAKWCq/OdAwAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFvrJLMWRmVeSWpSXmKPExsVy+t/xu7ppIdEpBrvfGlh8PrWW3WLZpc9M
 Fo3z57BabL36g93ieO8OFoveTS+YHNg8Trw9yOpx4dE5Zo8n1zYzebzfd5XNo2/LKsYA1ig9
 m6L80pJUhYz84hJbpWhDCyM9Q0sLPSMTSz1DY/NYKyNTJX07m5TUnMyy1CJ9uwS9jP6N19kK
 dnBVzD4r2cC4kqOLkZNDQsBEom32ZvYuRi4OIYGljBJPbs1lgUhISezr+c8OYQtL/LnWxQZR
 1MokMW/hY1aQBJuAmcSjL/OAbA4OEQFTiWd7JUHCzAKZEqdf7WMDsYUFPCSWvXvEDlLCIqAq
 sahTDSTMK+AkcffATzaI8fISMy99B1vFKeAssXdOK9h0IaCaWSvWMEPUC0qcnPmEBWK8vETz
 1tnMExgFZiFJzUKSWsDItIpRJLW0ODc9t9hQrzgxt7g0L10vOT93EyMwDrYd+7l5B+O8Vx/1
 DjEycTAeYpTgYFYS4fUOjUoR4k1JrKxKLcqPLyrNSS0+xGgKdPZEZinR5HxgJOaVxBuaGZga
 mphZGphamhkrifN6FnQkCgmkJ5akZqemFqQWwfQxcXBKNTB5FJzcVnoh/rDzCYk79TvkSoxT
 Hz3iUHl3YdqXON8n7StuNny/NfuOj1/mGt0ZR1M6DppEv2HM1uqREmcvfzGnX3Or+/GZu45I
 lLf9fLGDf5WMBZ9R2hypCtV1b8+YFqftMpyTdk3l0jH7/PVcVyujWZm2hLzbsCYg98qjifZ7
 70Waf3xuPPPHc0vFD/e4k4O0e0p+bmRsOeo9/W0ZB3tjsL9x09fDWrGa0S0na8pMtF8r9jfH
 LV/VllDJwKubJrvQ5YDdgWWrP/49Zn38/LTC34t41Z7LK8tZZi8Me6YbJDmzs/xjS9ipHc+N
 Xcr+pGSEfPd+vuzvm6VWhwO/u711OshpxtjCzRrTGjZdUE6JpTgj0VCLuag4EQA7Gh84DAMA
 AA==
X-CMS-MailID: 20230510082303eucas1p139f531b811cf1547da84f23ce743b1fb
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20230510082303eucas1p139f531b811cf1547da84f23ce743b1fb
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20230510082303eucas1p139f531b811cf1547da84f23ce743b1fb
References: <20230510082254.1036-1-t.dzieciol@partner.samsung.com>
 <CGME20230510082303eucas1p139f531b811cf1547da84f23ce743b1fb@eucas1p1.samsung.com>
Received-SPF: none client-ip=210.118.77.11;
 envelope-from=t.dzieciol@partner.samsung.com; helo=mailout1.w1.samsung.com
X-Spam_score_int: -69
X-Spam_score: -7.0
X-Spam_bar: -------
X-Spam_report: (-7.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_HI=-5,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_PASS=-0.001,
 SPF_NONE=0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

Signed-off-by: Tomasz Dzieciol <t.dzieciol@partner.samsung.com>
---
 hw/net/igb_core.c | 4 +++-
 hw/net/igb_regs.h | 1 +
 2 files changed, 4 insertions(+), 1 deletion(-)

diff --git a/hw/net/igb_core.c b/hw/net/igb_core.c
index 0eabe7106e..6d95cccea3 100644
--- a/hw/net/igb_core.c
+++ b/hw/net/igb_core.c
@@ -1415,7 +1415,9 @@ igb_rx_desc_get_packet_type(IGBCore *core, struct NetRxPkt *pkt, uint16_t etqf)
     net_rx_pkt_get_protocols(pkt, &hasip4, &hasip6, &l4hdr_proto);
 
     if (hasip6 && !(core->mac[RFCTL] & E1000_RFCTL_IPV6_DIS)) {
-        pkt_type |= E1000_ADVRXD_PKT_IP6;
+        eth_ip6_hdr_info *ip6hdr_info  = net_rx_pkt_get_ip6_info(pkt);
+        pkt_type |= ip6hdr_info->has_ext_hdrs ? E1000_ADVRXD_PKT_IP6E :
+                                                E1000_ADVRXD_PKT_IP6;
     } else if (hasip4) {
         pkt_type = E1000_ADVRXD_PKT_IP4;
     }
diff --git a/hw/net/igb_regs.h b/hw/net/igb_regs.h
index 71a8833229..36763f2ff7 100644
--- a/hw/net/igb_regs.h
+++ b/hw/net/igb_regs.h
@@ -694,6 +694,7 @@ union e1000_adv_rx_desc {
 
 #define E1000_ADVRXD_PKT_IP4  BIT(0)
 #define E1000_ADVRXD_PKT_IP6  BIT(2)
+#define E1000_ADVRXD_PKT_IP6E BIT(3)
 #define E1000_ADVRXD_PKT_TCP  BIT(4)
 #define E1000_ADVRXD_PKT_UDP  BIT(5)
 #define E1000_ADVRXD_PKT_SCTP BIT(6)
-- 
2.25.1


