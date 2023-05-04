Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 729F96F7101
	for <lists+qemu-devel@lfdr.de>; Thu,  4 May 2023 19:36:24 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pucpI-0008JM-MA; Thu, 04 May 2023 13:33:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <t.dzieciol@partner.samsung.com>)
 id 1puYjt-0003pV-7J
 for qemu-devel@nongnu.org; Thu, 04 May 2023 09:11:17 -0400
Received: from mailout1.w1.samsung.com ([210.118.77.11])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <t.dzieciol@partner.samsung.com>)
 id 1puYjn-0002u4-46
 for qemu-devel@nongnu.org; Thu, 04 May 2023 09:11:15 -0400
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
 by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id
 20230504131106euoutp01500a0eddf5c6ed1f122320d5cafba519~b8tFIZcQe1983119831euoutp01C
 for <qemu-devel@nongnu.org>; Thu,  4 May 2023 13:11:06 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com
 20230504131106euoutp01500a0eddf5c6ed1f122320d5cafba519~b8tFIZcQe1983119831euoutp01C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1683205866;
 bh=RAdTRgkb5cVy6FP5ribk2kxIlvYd4xCVAvY0Bobfcq8=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=pkjOgTESPPf2eS4kGaxxfGAoL+ySObXfkh3RI/uX6UPbPWePCzETdlVTifCDVxtkq
 5HkMs51+cbBp26XgvXkZXpBsvCtIFEPTj/4LgNqt2ZQoMk005j4K45S+H2+V+04C6s
 767fVrpUrOz/WNF3TB91oebkuppMJDLvyFGM8Cak=
Received: from eusmges1new.samsung.com (unknown [203.254.199.242]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTP id
 20230504131106eucas1p2a58728dc16bbdc677e1c44e8819dc0bc~b8tE6-AwO2682926829eucas1p2z;
 Thu,  4 May 2023 13:11:06 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
 eusmges1new.samsung.com (EUCPMTA) with SMTP id B4.24.42423.AEEA3546; Thu,  4
 May 2023 14:11:06 +0100 (BST)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
 20230504131105eucas1p2610f7bcc7c4fabba29cd198c52ac30f2~b8tElJWeF1553515535eucas1p20;
 Thu,  4 May 2023 13:11:05 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
 eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
 20230504131105eusmtrp29c197aec74226c6da8fb857fd2671fa9~b8tEkdqov1716517165eusmtrp2L;
 Thu,  4 May 2023 13:11:05 +0000 (GMT)
X-AuditID: cbfec7f2-a3bff7000002a5b7-a8-6453aeea6d7d
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
 eusmgms1.samsung.com (EUCPMTA) with SMTP id D3.7E.10549.9EEA3546; Thu,  4
 May 2023 14:11:05 +0100 (BST)
Received: from AMDN5139.EU.corp.samsungelectronics.net (unknown
 [106.210.135.112]) by eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20230504131105eusmtip12f23fce83ee0d59f4720d86f9e3172a5~b8tEEZuPw1970019700eusmtip1w;
 Thu,  4 May 2023 13:11:05 +0000 (GMT)
From: Tomasz Dzieciol <t.dzieciol@partner.samsung.com>
To: qemu-devel@nongnu.org, akihiko.odaki@daynix.com
Cc: sriram.yagnaraman@est.tech, jasowang@redhat.com, k.kwiecien@samsung.com,
 m.sochacki@samsung.com
Subject: [PATCH v4 1/5] igb: remove TCP ACK detection
Date: Thu,  4 May 2023 15:10:51 +0200
Message-Id: <20230504131055.11767-2-t.dzieciol@partner.samsung.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230504131055.11767-1-t.dzieciol@partner.samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFupmleLIzCtJLcpLzFFi42LZduzned1X64JTDI495bT4fGotu8WyS5+Z
 LBrnz2G12Hr1B7vF8d4dLBa9m14wObB5nHh7kNXjwqNzzB5Prm1m8ni/7yqbR9+WVYwBrFFc
 NimpOZllqUX6dglcGd9ebWIpuM1a8e7KRaYGxj0sXYycHBICJhJ3Trazg9hCAisYJRrbK7sY
 uYDsL4wS/9a9YIVwPjNKtB2bzQzTcXj9DkaIxHJGiekP+5khnHYmiRUHJrOCVLEJmEk8+jIP
 yObgEBEwlvjYLg4SZhZIlTj65yDYamEBU4mWle+YQGwWAVWJjy2LweK8As4Sx/t3sUEsk5eY
 eek72HmcAi4SW6ZNYIWoEZQ4OfMJC8RMeYnmrbPBbpAQ2MIh8anzKRNEs4vExrl/GCFsYYlX
 x7ewQ9gyEv93zoeqKZf4eXYbO0RzC6PEnqmToYqsJS5t/Qn2ALOApsT6XfoQYUeJWZe7wMIS
 AnwSN94KQtzAJzFp23RmiDCvREebEES1jsS3TTPZIMJSEgtv1EGEPSTmPd/HPoFRcRaSZ2Yh
 eWYWwtoFjMyrGMVTS4tz01OLDfNSy/WKE3OLS/PS9ZLzczcxAtPL6X/HP+1gnPvqo94hRiYO
 xkOMEhzMSiK8Hwr9UoR4UxIrq1KL8uOLSnNSiw8xSnOwKInzatueTBYSSE8sSc1OTS1ILYLJ
 MnFwSjUwud5fzdF9t/npzoptaYv7Pgk43VdTVCq3Cwm85BjyeE7Ux22egZOKWgUyV/d0rTzW
 6iGx+uSdwNfVUafjWaI+5cxpsb6kmGC2oEjkyaH8kJsPxDz3igonL5urv1/c6IissdlUtTDl
 PUf96z38WLrCd/zMT51SFb/w5T/9pF1s33sfmz2rad7xfVK9YNBUuZUNv6WftW9Wdlga8GzL
 U332G1P2Mf98eKH99r5q0Y6+aRNlmRsuiorJt9tebu/SesQda23M+zBXwJbpWbFLUrqGUVC1
 8b4JujflAvJWdj7nSGqV6nzhE/JAperNm4cb5i85n+NUue11TdrU4+0MbP2a6/ee3j1ju939
 ao9jG7iVWIozEg21mIuKEwHAsV6rngMAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFvrNLMWRmVeSWpSXmKPExsVy+t/xu7ov1wWnGHQd1bf4fGotu8WyS5+Z
 LBrnz2G12Hr1B7vF8d4dLBa9m14wObB5nHh7kNXjwqNzzB5Prm1m8ni/7yqbR9+WVYwBrFF6
 NkX5pSWpChn5xSW2StGGFkZ6hpYWekYmlnqGxuaxVkamSvp2NimpOZllqUX6dgl6Gd9ebWIp
 uM1a8e7KRaYGxj0sXYycHBICJhKH1+9g7GLk4hASWMoose5xLztEQkpiX89/KFtY4s+1LjaI
 olYmiY+/nrOBJNgEzCQefZnH2sXIwSEiYCrxbK8kSJhZIFPi9Kt9YCXCQOGWle+YQGwWAVWJ
 jy2LwRbzCjhLHO/fxQYxX15i5qXvYLs4BVwktkybwApiCwHVnDj+gw2iXlDi5MwnLBDz5SWa
 t85mnsAoMAtJahaS1AJGplWMIqmlxbnpucWGesWJucWleel6yfm5mxiBsbDt2M/NOxjnvfqo
 d4iRiYPxEKMEB7OSCO+HQr8UId6UxMqq1KL8+KLSnNTiQ4ymQHdPZJYSTc4HRmNeSbyhmYGp
 oYmZpYGppZmxkjivZ0FHopBAemJJanZqakFqEUwfEwenVAPTgrbCmU8Ozt8mZy75z0Hgfb1H
 tl2m0bt/tXEem+5kHZs9cbec5bz5dTI8AocexRToXLpw/fyMqw96/ieF/8ma3M+lNXe61Fmh
 5vkxP/aruImz5PoLpRwLDnG6zftIcbWHb+DVT7HqqTuO5CW38KuKMxoqPRKYeSq/S1WLvfFx
 1jXxzS4rrJgzZ9x7uC3/wJ60BV3Zjf5chxq1DZv/3pI7zFL1TGLeHp6lNb4VnQ3Kf90meQT8
 +1hfu9uGedKJ6DO9nw892ffBX5FnxrvPr4/EJOat1XFK7p2boKjT99bi/fUfVQdjPxg+U5vw
 RH/zfnPjA+11y+en/j5jyXrK6U946hnun8+1jc8Hcj2XydqvxFKckWioxVxUnAgAR1OnuQ4D
 AAA=
X-CMS-MailID: 20230504131105eucas1p2610f7bcc7c4fabba29cd198c52ac30f2
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20230504131105eucas1p2610f7bcc7c4fabba29cd198c52ac30f2
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20230504131105eucas1p2610f7bcc7c4fabba29cd198c52ac30f2
References: <20230504131055.11767-1-t.dzieciol@partner.samsung.com>
 <CGME20230504131105eucas1p2610f7bcc7c4fabba29cd198c52ac30f2@eucas1p2.samsung.com>
Received-SPF: none client-ip=210.118.77.11;
 envelope-from=t.dzieciol@partner.samsung.com; helo=mailout1.w1.samsung.com
X-Spam_score_int: -71
X-Spam_score: -7.2
X-Spam_bar: -------
X-Spam_report: (-7.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.161,
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

TCP ACK detection is no longer present in igb.

Signed-off-by: Tomasz Dzieciol <t.dzieciol@partner.samsung.com>
---
 hw/net/igb_core.c | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/hw/net/igb_core.c b/hw/net/igb_core.c
index 96b7335b31..012eb1e1b9 100644
--- a/hw/net/igb_core.c
+++ b/hw/net/igb_core.c
@@ -1327,11 +1327,6 @@ igb_build_rx_metadata(IGBCore *core,
             trace_e1000e_rx_metadata_ip_id(*ip_id);
     }
 
-    if (l4hdr_proto == ETH_L4_HDR_PROTO_TCP && net_rx_pkt_is_tcp_ack(pkt)) {
-        *status_flags |= E1000_RXD_STAT_ACK;
-        trace_e1000e_rx_metadata_ack();
-    }
-
     if (pkt_info) {
         *pkt_info = rss_info->enabled ? rss_info->type : 0;
 
-- 
2.25.1


