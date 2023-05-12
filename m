Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8744C700C30
	for <lists+qemu-devel@lfdr.de>; Fri, 12 May 2023 17:44:58 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pxUw5-0005Oj-7h; Fri, 12 May 2023 11:44:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <t.dzieciol@partner.samsung.com>)
 id 1pxUw3-0005OI-7k
 for qemu-devel@nongnu.org; Fri, 12 May 2023 11:43:59 -0400
Received: from mailout1.w1.samsung.com ([210.118.77.11])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <t.dzieciol@partner.samsung.com>)
 id 1pxUw0-0007jo-8I
 for qemu-devel@nongnu.org; Fri, 12 May 2023 11:43:58 -0400
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
 by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id
 20230512154352euoutp01d655bb884ac049a249af5ced0c96d818~eb8vqxvs30546205462euoutp01O
 for <qemu-devel@nongnu.org>; Fri, 12 May 2023 15:43:52 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com
 20230512154352euoutp01d655bb884ac049a249af5ced0c96d818~eb8vqxvs30546205462euoutp01O
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1683906232;
 bh=wO5gaesISuEdjaAU2KXBboHbME+HpMIPsPuP7qC625s=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=o6EOSWlwYnqe093J7gZq5zrT7SlG7jgRQtPKS7OhVPnREQog+fqOGFtviQxxOca0w
 msHKZcEmZYwoF6B7iy7A5o5G2kw7Hh+lO5hTF0Mn9zazvFbDb3GwJke8MXR0m56ZWQ
 C/UK4N4w6mun2lLtCeZ4SHSwFugCUfAqOVNkqHX0=
Received: from eusmges3new.samsung.com (unknown [203.254.199.245]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTP id
 20230512154351eucas1p1152f5f1fa53dfa36719cc00287337ad7~eb8vLLALT2945829458eucas1p1L;
 Fri, 12 May 2023 15:43:51 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
 eusmges3new.samsung.com (EUCPMTA) with SMTP id AC.B0.37758.7BE5E546; Fri, 12
 May 2023 16:43:51 +0100 (BST)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
 20230512154351eucas1p1d6dab09b1b9812534360a617a8d1d79c~eb8un5tek2356123561eucas1p1w;
 Fri, 12 May 2023 15:43:51 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
 eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20230512154351eusmtrp1982611221f138e69d13c1f8774cbf19c~eb8unIbY-1971719717eusmtrp1K;
 Fri, 12 May 2023 15:43:51 +0000 (GMT)
X-AuditID: cbfec7f5-815ff7000002937e-f7-645e5eb723f0
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
 eusmgms2.samsung.com (EUCPMTA) with SMTP id 24.B6.14344.7BE5E546; Fri, 12
 May 2023 16:43:51 +0100 (BST)
Received: from AMDN5139.EU.corp.samsungelectronics.net (unknown
 [106.210.135.112]) by eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20230512154350eusmtip1ecb602f442e9b82553c3525042b36d10~eb8uGCK9q2215522155eusmtip10;
 Fri, 12 May 2023 15:43:50 +0000 (GMT)
From: Tomasz Dzieciol <t.dzieciol@partner.samsung.com>
To: qemu-devel@nongnu.org, akihiko.odaki@daynix.com
Cc: sriram.yagnaraman@est.tech, jasowang@redhat.com, k.kwiecien@samsung.com,
 m.sochacki@samsung.com
Subject: [PATCH v6 5/7] igb: add IPv6 extended headers traffic detection
Date: Fri, 12 May 2023 17:43:33 +0200
Message-Id: <20230512154335.2536-6-t.dzieciol@partner.samsung.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230512154335.2536-1-t.dzieciol@partner.samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFupgleLIzCtJLcpLzFFi42LZduzned3tcXEpBvt3qll8PrWW3WLZpc9M
 Fo3z57BabL36g93ieO8OFoveTS+YHNg8Trw9yOpx4dE5Zo8n1zYzebzfd5XNo2/LKsYA1igu
 m5TUnMyy1CJ9uwSujP6N19kKdnBVzD4r2cC4kqOLkZNDQsBEomPPdcYuRi4OIYEVjBKv969i
 B0kICXxhlFh7JR0i8ZlR4tuZ10wwHe3tzWwQRcsZJa79YYUoameS+LXyJFg3m4CZxKMv84AS
 HBwiAsYSH9vFQcLMAqkSR/8cZAGxhQU8JHpX9IHNZBFQlWjtnMEMYvMKOEksPHUOape8xMxL
 39lBxnAKOEvMWyEEUSIocXLmExaIkfISzVtnM4OcICGwhUNi/tZL7BC9LhLnjz9mhrCFJV4d
 3wIVl5E4PbmHBcIul/h5dhs7RHMLo8SeqZOhiqwlLm39CXY/s4CmxPpd+hBhR4nZjTPYQMIS
 AnwSN94KQtzAJzFp23RmiDCvREebEES1jsS3TTOhqqUkFt6ogwh7SOx8N4dlAqPiLCTPzELy
 zCyEtQsYmVcxiqeWFuempxYb56WW6xUn5haX5qXrJefnbmIEJpbT/45/3cG44tVHvUOMTByM
 hxglOJiVRHjfLolOEeJNSaysSi3Kjy8qzUktPsQozcGiJM6rbXsyWUggPbEkNTs1tSC1CCbL
 xMEp1cCk+ePrROu+uS1mjfK1Cqzaq5SPrbV55PD91qQ1yz845OyLXS1cp/XOJ7lzoVDhlD92
 f4uvsJ09eMTE23SGT7a+1MRnWgopxZe6w8wyC4uYFs5vVt470TK1jVkvUWLWhWz541WvHRxr
 XXTUyzUmbmp+NaHHoqpRZtGb56/dQ39zX1o1K1234VShqM+M3YZnlqxl8rtzOmB75c1m28lb
 rN7uiOTQ8nZ6mRacY/aUw/mdeu473a4ztyOFTlmIfRWclK8vqLR7mu19x5KJBXw3TmxdnbTe
 TZZ5QedqDeumgrVLf/3UsbA1ebK3USQiWqWqyXnli1lJHRoaD4KPu/x9p9Ykt/vNpLKdrCeU
 /rKc9VJiKc5INNRiLipOBADA1U2BmwMAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFvrJLMWRmVeSWpSXmKPExsVy+t/xu7rb4+JSDNqaWS0+n1rLbrHs0mcm
 i8b5c1gttl79wW5xvHcHi0XvphdMDmweJ94eZPW48Ogcs8eTa5uZPN7vu8rm0bdlFWMAa5Se
 TVF+aUmqQkZ+cYmtUrShhZGeoaWFnpGJpZ6hsXmslZGpkr6dTUpqTmZZapG+XYJeRv/G62wF
 O7gqZp+VbGBcydHFyMkhIWAi0d7ezNbFyMUhJLCUUWL/sR3MEAkpiX09/9khbGGJP9e6oIpa
 mSTm77rABJJgEzCTePRlHmsXIweHiICpxLO9kiBhZoFMidOv9rGB2MICHhK9K/rAylkEVCVa
 O2eAzecVcJJYeOocE8R8eYmZl76zg4zhFHCWmLdCCCQsBFRys28BE0S5oMTJmU9YIMbLSzRv
 nc08gVFgFpLULCSpBYxMqxhFUkuLc9Nzi430ihNzi0vz0vWS83M3MQLjYNuxn1t2MK589VHv
 ECMTB+MhRgkOZiUR3rdLolOEeFMSK6tSi/Lji0pzUosPMZoCnT2RWUo0OR8YiXkl8YZmBqaG
 JmaWBqaWZsZK4ryeBR2JQgLpiSWp2ampBalFMH1MHJxSDUy2Id4LLz3aqHPF+pdmWYW5+Epv
 /UohtnubH8i1mM73vvzKw85tsteG3a+Dv+qpr1i94KCr+urmFZtfVejd6XjwZe48jRTPDW/3
 iiU4Lj4UMnt1/Uu/3mXVFuHy19cFz/wRnTzz4tz32S//9B5wEPu5eC7rf9GOw6Y+HFqX33z6
 c/T+3pAa4+CvfeK/Ddq2RHgc9fGyPsRlEcQWEd0RUu3z63fww+PCVxp4C44rFZ5JkTL7PXWi
 SBxbbLbt0+sc+WUcenIfm32/nGLrlZJ8sY9lRWZGUf7jxfrX9Tu7fIOkd06cf4LLIuPPZcev
 e7tne3b7uf+cEJr88KPSoVuPD/CcD9CXXX7j2qvvK8M7g48psRRnJBpqMRcVJwIATqR5AwwD
 AAA=
X-CMS-MailID: 20230512154351eucas1p1d6dab09b1b9812534360a617a8d1d79c
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20230512154351eucas1p1d6dab09b1b9812534360a617a8d1d79c
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20230512154351eucas1p1d6dab09b1b9812534360a617a8d1d79c
References: <20230512154335.2536-1-t.dzieciol@partner.samsung.com>
 <CGME20230512154351eucas1p1d6dab09b1b9812534360a617a8d1d79c@eucas1p1.samsung.com>
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


