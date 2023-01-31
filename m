Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CC63D682961
	for <lists+qemu-devel@lfdr.de>; Tue, 31 Jan 2023 10:45:58 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pMnAR-0002Ek-9K; Tue, 31 Jan 2023 04:43:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sriram.yagnaraman@est.tech>)
 id 1pMnA7-0002BW-Ph
 for qemu-devel@nongnu.org; Tue, 31 Jan 2023 04:42:55 -0500
Received: from mail-he1eur04on2115.outbound.protection.outlook.com
 ([40.107.7.115] helo=EUR04-HE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sriram.yagnaraman@est.tech>)
 id 1pMnA6-0001hD-3M
 for qemu-devel@nongnu.org; Tue, 31 Jan 2023 04:42:47 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DqSaFQZv1YiKA0VHYv6eoxplVejPY6RLSzLo5nfeKpVJACJlHnov0I0tOIxw/IfdCZLF+W7zXL45C3jP5Nmnrtdm/oSkms+m6OnjPopd+u3w7z5o7tB4KKwCI38ppb08uK3sHbE0gj+4Qs4w8QSyzzKrhEnLu7DrVQyXnt6SmMNZl8+gMcQhj4luBvblEl+nF9C6kA4AGkjfHwZb0GPuZUBZTZ4aER6b6EsOA3NIqyreIADKASyyDovYF7Y0fMA3tzaDzusLCn6CPP+K+T89R2ww13/4JS1CatboIqSkO3sXfmxgeLu8pAuBzw44ilVwv5GmMnTnv/k1d/N+6ghVAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=38+PuS+YvS4S8G7iW5SUsCExFjU20Z4sjGPQIxr/fbs=;
 b=DEip9/8vskgJNAYOw5bOk4qyjK4rT81xLs8nilgOMRjrELKJRHM84S4zANn5t19qT8uYDaotw84Q0a5IbU4BJGi81oezscrhsdm7h7i5zgprZzMpo5mxeJUzPT0b7hy86oPG9wTEG4IXMGVE4kzQS7AHkBSjOfdNpk04ZfXHtryhtAISAieeOT6q8M2OoMjcnS9WCap1OfuBrGBPESt7EX1ia4jfY8PoF2xr+DI+9ZITBkuDdl+OBsZnzEMvs+WA/rveBLFNIo1fojrs7wll5sAR2P9UQY22Iu0xlSdU7AM1ip9wz+LTvhj9ZPRB1OkWD0aYUXvzkLDKeXJNSS0k4Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=estab.onmicrosoft.com; 
 s=selector2-estab-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=38+PuS+YvS4S8G7iW5SUsCExFjU20Z4sjGPQIxr/fbs=;
 b=S5SkhfvFIb8C8x1vaFN0/BfpfC11Qi15r/Upjd3BGL1jrcXMpiLl300yoQrEoc+1qY/1dl5z+Pur7uAcUDoG44/Mc+lkYKTTQ76y8puhOdahQ7avp2ObFNWa+12hK6/bHfFeGeSJTno1Gptq6dz9SiXuqeyrLm/0xQu7Q3cfDGs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from DBBP189MB1433.EURP189.PROD.OUTLOOK.COM (2603:10a6:10:1e7::15)
 by VI1P18901MB0733.EURP189.PROD.OUTLOOK.COM (2603:10a6:800:127::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6043.38; Tue, 31 Jan
 2023 09:42:38 +0000
Received: from DBBP189MB1433.EURP189.PROD.OUTLOOK.COM
 ([fe80::8f70:435b:ab64:9420]) by DBBP189MB1433.EURP189.PROD.OUTLOOK.COM
 ([fe80::8f70:435b:ab64:9420%8]) with mapi id 15.20.6043.038; Tue, 31 Jan 2023
 09:42:38 +0000
From: Sriram Yagnaraman <sriram.yagnaraman@est.tech>
To: 
Cc: qemu-devel@nongnu.org, Akihiko Odaki <akihiko.odaki@daynix.com>,
 Jason Wang <jasowang@redhat.com>,
 Dmitry Fleytman <dmitry.fleytman@gmail.com>,
 "Michael S . Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Sriram Yagnaraman <sriram.yagnaraman@est.tech>
Subject: [PATCH v3 3/9] igb: add ICR_RXDW
Date: Tue, 31 Jan 2023 10:42:26 +0100
Message-Id: <20230131094232.28863-4-sriram.yagnaraman@est.tech>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230131094232.28863-1-sriram.yagnaraman@est.tech>
References: <20230131094232.28863-1-sriram.yagnaraman@est.tech>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: GV3P280CA0041.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:150:9::19) To DBBP189MB1433.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:10:1e7::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DBBP189MB1433:EE_|VI1P18901MB0733:EE_
X-MS-Office365-Filtering-Correlation-Id: 9d2dab2b-a9fb-4a61-971d-08db036f7cb1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Ja5o6izVPJPogE5xbrNKgQWolp/exy3bF9EDmRYDF+TvK9Fzx4fMq98jOioh3uw07tPKgDT84ITqhO7/hNkeTDwgdNOFEd9N4lWKjUVnqL3pPbMHAisx5yXmIzdDLWpOmzYg2SfPqz+Ru3dHwHWnckFvzq91CdcUUeJ3BpaSXvOBsiMZnGUf9AVMAU7QgL2DXPtOeA0HROiEamFmki6C2VsALMImgcpM59fY1b3WDYui4UqDAD3DI4RfqjYlrsAWMswwvRhqFKpHh7kgqAATPSxh69+iSnbGy2HA+Jy/2MYAKOAcwa5uH2ZEVHnoob56Ro1ohUHD+Uc+OJnpqAdRUuxvwa4wTWjGF5jgba19480uRTP1kzUFKfTxY27ZG3HOw/H0ceQ038UXCE7z2Wx9X0ZPx63AbTBenhf4iWcE0vyLsyv3+myywXuR5o1vxqi0NYboLX7rwZeppdIlKaDak3jaTWVkeQU5bVK00xwJY6tRrYsBY1lThkPzpb3JWht2++NmJyjuK5Yl0Mt9cOKkaeXYdoiT5ALsHJbQsh8FkYfRdmzeSk70A7C2O6VoTiHcG6fe3lSwk3B9Oy2o3kUmmicpdJRYnom3ZbpXe7Kxo2+ZznfaqhclnGq3m+pAWZKNfghE4Cy3MpbaQfve9ZXp5zdy3p0keKSW3lwRawF2RtC986rCsWPzHgkFzRuw1TL1SR1UUxuNql1j3lEuEk3fWKlC+qPXoh/pGXvXIWI6f1I=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DBBP189MB1433.EURP189.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230025)(39840400004)(396003)(346002)(376002)(136003)(451199018)(109986016)(316002)(66946007)(70586007)(66556008)(83380400001)(86362001)(38100700002)(54906003)(36756003)(6512007)(26005)(186003)(2616005)(478600001)(6486002)(6506007)(6666004)(1076003)(5660300002)(44832011)(8936002)(2906002)(41300700001)(66476007)(4326008)(8676002)(266003)(37730700002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Jn25yQR4CSH7hpvzzjH2ae6nWQwS3obqOcPJtEHIExdMkMR4mx5yLV0P9d01?=
 =?us-ascii?Q?HcxHHcYW5wR27il3oez+MBtsFX4jwg/jWUFneshb7eJQ9oBx/uHxMd0w5EPk?=
 =?us-ascii?Q?t5iHX61nmGDq7sn9l74HhLqbU48OkO24eN128eMIxrxQ0VMb6oekFTBs2cCq?=
 =?us-ascii?Q?LVJ3BN0hW8ajbU+f6akmamH9v2iR6F0t0xx5yHnmBcVmzwSqV3EeSF+alDV9?=
 =?us-ascii?Q?jds9bBwuD1e9fWXR78NQdzQSuiqB9c8tNO0poQ0TDMHgdhkida9+n53f4Zk9?=
 =?us-ascii?Q?mGtOLRcnvey7sNR2EWoqMvKcn5qqizCdvDh7RK3ojy5COTnYBKmvtmSzFJol?=
 =?us-ascii?Q?kV9+iLpIO6w9dwFwiQCH7G03+tWAqKU42bhlWJJoObz5Ll0mBVFGyPyFnC/i?=
 =?us-ascii?Q?1sJic+cgkDm6cQ2KQjS6Dg79EmDCPmC1mNwmBJJ1+2xFR5OUqHmClaviYmsz?=
 =?us-ascii?Q?p2iyD+5n+/WdkIVAYfUzJqfIyp5GNp70bwSDDFasVdp6Iat5R1iECyV8Dji8?=
 =?us-ascii?Q?BHcCWCth5M5QChpkDLKc9MxBtSQvzw5Y+TETZ/5gTmEptMdsBE2etuVCZUqF?=
 =?us-ascii?Q?5GrSNcMh8jO6ovnUkxCmT5PDw3ktp3ZJ25xkgNtwuDsRX4rPS+UYh3R0o9qp?=
 =?us-ascii?Q?f4aPBs4dYGo6XvtUK98mEqOXRGQS3eCmDurEJeWz4eJhhqa8eethGzi6Kvh4?=
 =?us-ascii?Q?KgHEYuHN9DaGFECVEwObnpwy+UgXqfHwvgXwa9elveKQvgxAetdjeQlex+ET?=
 =?us-ascii?Q?2LfgROawFYSskq/w0uJnoahPU4ejPj02lSD7z4ci8oGTyr8iSceyWlv6O/4W?=
 =?us-ascii?Q?vlQf25TRxUC8ygbkOlRn7N6c/cigd9NWhvBwF0vjEIszulGvL0VxH1dtZv0V?=
 =?us-ascii?Q?CL+dG6TRNA2tfhO2nBo6US0/vab7lf2ziBH/ahowdDfmMedddB9uxj4flf6G?=
 =?us-ascii?Q?nB7EIDVd2tQt+gg6F6y+s+eZfkRy6jFv2Knt4LqjmNP/1EWZLEfZLnK5BJGC?=
 =?us-ascii?Q?MFfEQrca20ZZcHPJD/+fyr7FTr0baWsq/5hjdvNoC/DnuKYUUAik4MQCM/5x?=
 =?us-ascii?Q?DcM4UQ2Y9UHeSY9QGrwAywA54kLdBi4W9Fb6MAX46IYcF4JPy8dh+u0a6/ou?=
 =?us-ascii?Q?TkXnQmp8vRsDOfqQr1XwYqL82rTVVBXeWZ2WdMo85ayMDFWidhO/lI5pSJ4Z?=
 =?us-ascii?Q?oN9WTm/EgEvC4b6ALwk4WjArHUe2wKVDOL4YL1rWtj9YSS7w1npyQy16PYi3?=
 =?us-ascii?Q?QivIjSZhvLiNrkBZPmxIpKD6J+0VtRg6K9ChfxqF6bwNc80ZkPktQL5K0sbN?=
 =?us-ascii?Q?HX4B9oEn0wMV4J0NrByRFysj2IB3d0jh9yGDEgbYgKWI6n7VJcHy/ipLKL38?=
 =?us-ascii?Q?Qvr3Lj+Q+NUZl1ToeeyHS16xmZq9+zTYZqTEkV7VgTdVidDXnGvPo7npm92k?=
 =?us-ascii?Q?iaUlCHHBkCT950M0BvDVc2cdgtZ6OJkXrruh02lfSfhPBEoSSjgaBN6+XiMW?=
 =?us-ascii?Q?DOCeS4F7Yc84ibwc3hp94USYFwQLx/+erAq0JMwD+WaLqx8oHMmc0P9/o+9B?=
 =?us-ascii?Q?Fu1wvsiQ01Kd2Ti3sExF0kMqAInSDU/nWdh8uQHnnc72d8k3IvM/P3B1Q7el?=
 =?us-ascii?Q?bg=3D=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: 9d2dab2b-a9fb-4a61-971d-08db036f7cb1
X-MS-Exchange-CrossTenant-AuthSource: DBBP189MB1433.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jan 2023 09:42:37.2417 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qqVjNCttAK00NhHVheR6pzU2hCnt4fU049em5c8gvyIYtJpFAWnU1mwk9PNsEw3XN2sCGkT1+3P8LMLv2MP+D3f23xrp66k4D57Z0Pw7gic=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1P18901MB0733
Received-SPF: pass client-ip=40.107.7.115;
 envelope-from=sriram.yagnaraman@est.tech;
 helo=EUR04-HE1-obe.outbound.protection.outlook.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

IGB uses RXDW ICR bit to indicate that rx descriptor has been written
back. This is the same as RXT0 bit in older HW.

Signed-off-by: Sriram Yagnaraman <sriram.yagnaraman@est.tech>
---
 hw/net/e1000x_regs.h |  4 ++++
 hw/net/igb_core.c    | 46 +++++++++++++++++---------------------------
 2 files changed, 22 insertions(+), 28 deletions(-)

diff --git a/hw/net/e1000x_regs.h b/hw/net/e1000x_regs.h
index fb5b861135..f509db73a7 100644
--- a/hw/net/e1000x_regs.h
+++ b/hw/net/e1000x_regs.h
@@ -335,6 +335,7 @@
 #define E1000_ICR_RXDMT0        0x00000010 /* rx desc min. threshold (0) */
 #define E1000_ICR_RXO           0x00000040 /* rx overrun */
 #define E1000_ICR_RXT0          0x00000080 /* rx timer intr (ring 0) */
+#define E1000_ICR_RXDW          0x00000080 /* rx desc written back */
 #define E1000_ICR_MDAC          0x00000200 /* MDIO access complete */
 #define E1000_ICR_RXCFG         0x00000400 /* RX /c/ ordered set */
 #define E1000_ICR_GPI_EN0       0x00000800 /* GP Int 0 */
@@ -378,6 +379,7 @@
 #define E1000_ICS_RXDMT0    E1000_ICR_RXDMT0    /* rx desc min. threshold */
 #define E1000_ICS_RXO       E1000_ICR_RXO       /* rx overrun */
 #define E1000_ICS_RXT0      E1000_ICR_RXT0      /* rx timer intr */
+#define E1000_ICS_RXDW      E1000_ICR_RXDW      /* rx desc written back */
 #define E1000_ICS_MDAC      E1000_ICR_MDAC      /* MDIO access complete */
 #define E1000_ICS_RXCFG     E1000_ICR_RXCFG     /* RX /c/ ordered set */
 #define E1000_ICS_GPI_EN0   E1000_ICR_GPI_EN0   /* GP Int 0 */
@@ -407,6 +409,7 @@
 #define E1000_IMS_RXDMT0    E1000_ICR_RXDMT0    /* rx desc min. threshold */
 #define E1000_IMS_RXO       E1000_ICR_RXO       /* rx overrun */
 #define E1000_IMS_RXT0      E1000_ICR_RXT0      /* rx timer intr */
+#define E1000_IMS_RXDW      E1000_ICR_RXDW      /* rx desc written back */
 #define E1000_IMS_MDAC      E1000_ICR_MDAC      /* MDIO access complete */
 #define E1000_IMS_RXCFG     E1000_ICR_RXCFG     /* RX /c/ ordered set */
 #define E1000_IMS_GPI_EN0   E1000_ICR_GPI_EN0   /* GP Int 0 */
@@ -441,6 +444,7 @@
 #define E1000_IMC_RXDMT0    E1000_ICR_RXDMT0    /* rx desc min. threshold */
 #define E1000_IMC_RXO       E1000_ICR_RXO       /* rx overrun */
 #define E1000_IMC_RXT0      E1000_ICR_RXT0      /* rx timer intr */
+#define E1000_IMC_RXDW      E1000_ICR_RXDW      /* rx desc written back */
 #define E1000_IMC_MDAC      E1000_ICR_MDAC      /* MDIO access complete */
 #define E1000_IMC_RXCFG     E1000_ICR_RXCFG     /* RX /c/ ordered set */
 #define E1000_IMC_GPI_EN0   E1000_ICR_GPI_EN0   /* GP Int 0 */
diff --git a/hw/net/igb_core.c b/hw/net/igb_core.c
index 9c32ad5e36..e78bc3611a 100644
--- a/hw/net/igb_core.c
+++ b/hw/net/igb_core.c
@@ -1488,7 +1488,7 @@ igb_receive_internal(IGBCore *core, const struct iovec *iov, int iovcnt,
     static const int maximum_ethernet_hdr_len = (ETH_HLEN + 4);
 
     uint16_t queues = 0;
-    uint32_t n;
+    uint32_t icr_bits = 0;
     uint8_t min_buf[ETH_ZLEN];
     struct iovec min_iov;
     struct eth_header *ehdr;
@@ -1561,6 +1561,7 @@ igb_receive_internal(IGBCore *core, const struct iovec *iov, int iovcnt,
         e1000x_fcs_len(core->mac);
 
     retval = orig_size;
+    igb_rx_fix_l4_csum(core, core->rx_pkt);
 
     for (i = 0; i < IGB_NUM_QUEUES; i++) {
         if (!(queues & BIT(i))) {
@@ -1569,43 +1570,32 @@ igb_receive_internal(IGBCore *core, const struct iovec *iov, int iovcnt,
 
         igb_rx_ring_init(core, &rxr, i);
 
-        trace_e1000e_rx_rss_dispatched_to_queue(rxr.i->idx);
-
         if (!igb_has_rxbufs(core, rxr.i, total_size)) {
-            retval = 0;
+            icr_bits |= E1000_ICS_RXO;
+            continue;
         }
-    }
 
-    if (retval) {
-        n = E1000_ICR_RXT0;
-
-        igb_rx_fix_l4_csum(core, core->rx_pkt);
-
-        for (i = 0; i < IGB_NUM_QUEUES; i++) {
-            if (!(queues & BIT(i))) {
-                continue;
-            }
-
-            igb_rx_ring_init(core, &rxr, i);
+        trace_e1000e_rx_rss_dispatched_to_queue(rxr.i->idx);
+        igb_write_packet_to_guest(core, core->rx_pkt, &rxr, &rss_info);
 
-            igb_write_packet_to_guest(core, core->rx_pkt, &rxr, &rss_info);
+        /* Check if receive descriptor minimum threshold hit */
+        if (igb_rx_descr_threshold_hit(core, rxr.i)) {
+            icr_bits |= E1000_ICS_RXDMT0;
+        }
 
-            /* Check if receive descriptor minimum threshold hit */
-            if (igb_rx_descr_threshold_hit(core, rxr.i)) {
-                n |= E1000_ICS_RXDMT0;
-            }
+        core->mac[EICR] |= igb_rx_wb_eic(core, rxr.i->idx);
 
-            core->mac[EICR] |= igb_rx_wb_eic(core, rxr.i->idx);
-        }
+        icr_bits |= E1000_ICR_RXDW;
+    }
 
-        trace_e1000e_rx_written_to_guest(n);
+    if (icr_bits & E1000_ICR_RXDW) {
+        trace_e1000e_rx_written_to_guest(icr_bits);
     } else {
-        n = E1000_ICS_RXO;
-        trace_e1000e_rx_not_written_to_guest(n);
+        trace_e1000e_rx_not_written_to_guest(icr_bits);
     }
 
-    trace_e1000e_rx_interrupt_set(n);
-    igb_set_interrupt_cause(core, n);
+    trace_e1000e_rx_interrupt_set(icr_bits);
+    igb_set_interrupt_cause(core, icr_bits);
 
     return retval;
 }
-- 
2.34.1


