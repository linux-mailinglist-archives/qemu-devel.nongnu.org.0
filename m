Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DAA0F700C36
	for <lists+qemu-devel@lfdr.de>; Fri, 12 May 2023 17:45:36 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pxUw5-0005Oh-8F; Fri, 12 May 2023 11:44:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <t.dzieciol@partner.samsung.com>)
 id 1pxUw1-0005Nh-TE
 for qemu-devel@nongnu.org; Fri, 12 May 2023 11:43:57 -0400
Received: from mailout2.w1.samsung.com ([210.118.77.12])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <t.dzieciol@partner.samsung.com>)
 id 1pxUvy-0007jV-AA
 for qemu-devel@nongnu.org; Fri, 12 May 2023 11:43:57 -0400
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
 by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id
 20230512154350euoutp0296d0511ee86ecb49b9a06d149e488627~eb8tj4hSv0258602586euoutp029
 for <qemu-devel@nongnu.org>; Fri, 12 May 2023 15:43:50 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com
 20230512154350euoutp0296d0511ee86ecb49b9a06d149e488627~eb8tj4hSv0258602586euoutp029
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1683906230;
 bh=RAdTRgkb5cVy6FP5ribk2kxIlvYd4xCVAvY0Bobfcq8=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=H3H5QjgOgA3qDFIWgSRdrFg/mWwQDhrSLMfRTVbArThyaOQZQDdRDPiT+Oym181z5
 AVCFh/J661SIErgFkPxtZ8X0tOhT0ZEcSzPzw8KOYE0Ua+Tbvhisnh6nTUXrxJU9oa
 wl8oQNOfWCgacZkToktaAexM9fuUBUjPmFrZRIug=
Received: from eusmges1new.samsung.com (unknown [203.254.199.242]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTP id
 20230512154349eucas1p12a88176100f189bbd12857c623a34893~eb8tCUB0Q2346923469eucas1p10;
 Fri, 12 May 2023 15:43:49 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
 eusmges1new.samsung.com (EUCPMTA) with SMTP id 91.2C.42423.5BE5E546; Fri, 12
 May 2023 16:43:49 +0100 (BST)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
 20230512154349eucas1p2b961793fa75c52b820fee1c61db66111~eb8ssfbe_2923429234eucas1p2i;
 Fri, 12 May 2023 15:43:49 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
 eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20230512154349eusmtrp1a482b3e80698b473c02c4f9f796bc1ca~eb8sr7svT1998019980eusmtrp1y;
 Fri, 12 May 2023 15:43:49 +0000 (GMT)
X-AuditID: cbfec7f2-a51ff7000002a5b7-9a-645e5eb5a5f8
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
 eusmgms1.samsung.com (EUCPMTA) with SMTP id F0.73.10549.4BE5E546; Fri, 12
 May 2023 16:43:49 +0100 (BST)
Received: from AMDN5139.EU.corp.samsungelectronics.net (unknown
 [106.210.135.112]) by eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20230512154348eusmtip11860268d80fdc4c7caf97d5c3872648d~eb8sL-pjJ2547425474eusmtip1M;
 Fri, 12 May 2023 15:43:48 +0000 (GMT)
From: Tomasz Dzieciol <t.dzieciol@partner.samsung.com>
To: qemu-devel@nongnu.org, akihiko.odaki@daynix.com
Cc: sriram.yagnaraman@est.tech, jasowang@redhat.com, k.kwiecien@samsung.com,
 m.sochacki@samsung.com
Subject: [PATCH v6 1/7] igb: remove TCP ACK detection
Date: Fri, 12 May 2023 17:43:29 +0200
Message-Id: <20230512154335.2536-2-t.dzieciol@partner.samsung.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230512154335.2536-1-t.dzieciol@partner.samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFupkleLIzCtJLcpLzFFi42LZduznOd2tcXEpBhtei1h8PrWW3WLZpc9M
 Fo3z57BabL36g93ieO8OFoveTS+YHNg8Trw9yOpx4dE5Zo8n1zYzebzfd5XNo2/LKsYA1igu
 m5TUnMyy1CJ9uwSujG+vNrEU3GateHflIlMD4x6WLkZODgkBE4m7jTuAbC4OIYEVjBKNsxcz
 QjhfGCXOP+1mhXA+M0os2DsHyOEAa/m1JQ0ivpxR4vSKlVBF7UwSN94cYwOZyyZgJvHoyzyw
 BhEBY4mP7eIgYWaBVImjfw6CrRYWMJVoO3uOHcRmEVCVOHt7IyuIzSvgJNH49QHUefISMy99
 ZwcZwyngLDFvhRBEiaDEyZlPWCBGyks0b53NDHKChMAWDoll+44zQfS6SLz/+4YRwhaWeHV8
 CzuELSNxenIP1PxyiZ9nt7FDNLcwSuyZOhmqyFri0tafYPczC2hKrN+lD/G7o8SLtlIIk0/i
 xltBiBP4JCZtm84MEeaV6GgTgpihI/Ft00w2iLCUxMIbdRBhD4nWFfcYJzAqzkLyyywkv8xC
 2LqAkXkVo3hqaXFuemqxYV5quV5xYm5xaV66XnJ+7iZGYGo5/e/4px2Mc1991DvEyMTBeIhR
 goNZSYT37ZLoFCHelMTKqtSi/Pii0pzU4kOM0hwsSuK82rYnk4UE0hNLUrNTUwtSi2CyTByc
 Ug1Mdqu9IgtCP1ess19yYZ79zWa5uOm7mBnf9rPsDPS8vj3+ZkHDuv7pte7MWUIJj3YlsPUZ
 efu9VvcUf8hlJHg/8NRJtcWCOcpON7MtKib/sFd++GFbVUCZ4dtZJtdMVENWPFxxe1dW+1qh
 ghAJU4u/8b5LObn5DpUdCKoPu+BbnrvY79l17zd3f73atfRRyUH1VMaomKmXZZb+izb4d/ak
 zIHje77cP9fM4SVWZ1GUsyyv7MUBlkXv2j2VorSUvb0rcqoWnp7f/WKm7IVtBluflOqsKau7
 Z7Jk5gdt+y+r9KfbXvep4Wq8ZaZrO+O+zvHjb/1OiC6NWsu3wDnPKGN+2N/g2n8/g5Jsvlh9
 v3BYiaU4I9FQi7moOBEAc9H0k5wDAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFvrJLMWRmVeSWpSXmKPExsVy+t/xu7pb4+JSDHb1Mll8PrWW3WLZpc9M
 Fo3z57BabL36g93ieO8OFoveTS+YHNg8Trw9yOpx4dE5Zo8n1zYzebzfd5XNo2/LKsYA1ig9
 m6L80pJUhYz84hJbpWhDCyM9Q0sLPSMTSz1DY/NYKyNTJX07m5TUnMyy1CJ9uwS9jG+vNrEU
 3GateHflIlMD4x6WLkYODgkBE4lfW9K6GLk4hASWMkosOfCOrYuREyguJbGv5z87hC0s8eda
 FxtEUSuTxKYN68ESbAJmEo++zGMFGSQiYCrxbK8kSJhZIFPi9Kt9YHOEgcJtZ8+BlbMIqEqc
 vb2RFcTmFXCSaPz6gAVivrzEzEvf2UHGcAo4S8xbIQQSFgIqudm3gAmiXFDi5MwnLBDj5SWa
 t85mnsAoMAtJahaS1AJGplWMIqmlxbnpucWGesWJucWleel6yfm5mxiBcbDt2M/NOxjnvfqo
 d4iRiYPxEKMEB7OSCO/bJdEpQrwpiZVVqUX58UWlOanFhxhNgc6eyCwlmpwPjMS8knhDMwNT
 QxMzSwNTSzNjJXFez4KORCGB9MSS1OzU1ILUIpg+Jg5OqQYmVqbV3htT9q9amv5x77/zk044
 KSwSz5+c86F1qTifV8Ab9kCb50V+fOdS2H5/OfDAfRbj8/PsT9n7il6/LfOX+DLdp6U08J+Q
 Uu0iqWD15Nc+C9e+ONTxq32ewvVrfhbhZtUsdZxP7mQvz21fd1W8X9Tt/uSgY9O4+5dMCzj2
 rurII+mEmvvLqrbLWU/YOedAsJOPRtfTmaUh1qcnvLPQYdqYNZ9B5EWlwNn7V2Y8nvj8Zles
 z7e1069fN7vt3Bhm9kl+Q+zS0wtEjaVM9FPNNFOv/FXWdRE0ZOE/vbK7Ml3T2cHx0ekf2bou
 ptkrytqtRDSmFEhMtI7WnHyOS/zn2b1Hfzv3+Ptedl9tcPyMEktxRqKhFnNRcSIAwgWbTgwD
 AAA=
X-CMS-MailID: 20230512154349eucas1p2b961793fa75c52b820fee1c61db66111
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20230512154349eucas1p2b961793fa75c52b820fee1c61db66111
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20230512154349eucas1p2b961793fa75c52b820fee1c61db66111
References: <20230512154335.2536-1-t.dzieciol@partner.samsung.com>
 <CGME20230512154349eucas1p2b961793fa75c52b820fee1c61db66111@eucas1p2.samsung.com>
Received-SPF: none client-ip=210.118.77.12;
 envelope-from=t.dzieciol@partner.samsung.com; helo=mailout2.w1.samsung.com
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


