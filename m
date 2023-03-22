Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FCAA6C4657
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Mar 2023 10:28:36 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1peukp-0007Oe-Gm; Wed, 22 Mar 2023 05:27:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sriram.yagnaraman@est.tech>)
 id 1peukj-0007N8-06
 for qemu-devel@nongnu.org; Wed, 22 Mar 2023 05:27:29 -0400
Received: from mail-dbaeur03on20727.outbound.protection.outlook.com
 ([2a01:111:f400:fe1a::727]
 helo=EUR03-DBA-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sriram.yagnaraman@est.tech>)
 id 1peukh-0003Dq-Ib
 for qemu-devel@nongnu.org; Wed, 22 Mar 2023 05:27:28 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=X2J6cqK0nuzuzNFNwlO9wyU3DmRY5ef196g5DwmtMeLruBTGqGltQKA0QlgM53W/UwAbzZ1XaSKGHh9ESql5L9+7gBU4e4quJ9p6OXebDv8+CvNRcJrRzw1E67uVjPXomwxObd2TvzCWDOIB65eCX7AXPPxX1xtXDVJXdGuVJHnIxB3dz52mm9bljFK/FzUf19z1lUwRvLq49FOXpGydQ1KeBujJPRy6PPpy5NV8kQ+LBOYiiyoZNo9rrnFc+YNSQ0kczrVVIyOR8N0JBGFGbxQy3zjty2Y25AUpR3xmXie2P+FxLBsztB0fhHiK0NQrHpA1oL+kARyOZyxWhfyXTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Pk+4SATIBsNss0RnIFTV9MloWHOqSx7VC+/3EQBIa1Q=;
 b=TJsMVaEVDLdmiYz1Cc6wCOWyDvdV0eGKjozen2pi6OJkSxHWAdSBiEs8T0sNGEA4tsZJ3OXNeBZ3sOXM9q3nnmpRFgLYJkCxB18j9k5LCSSsiGYEx1HuDcJ3F+a+xU8qlozC92AqCXJTkflfr9fIrUbPP62Z81kzL1u20LNF0e60TGbJ9SKnj6N8W9Njvaz60GRlD89EKtLFTWebyhPRGzyYj7VQyQvTxlgtfFlr8lss/GbgaVZqJetwg9mhzZAFxrsEDfRn1sLwJnYOtNiT4BXDHouKuI2gaXax5MrEO9t88hfR6cUvuLFgoUtn4eRKVxn9QHIleDY1QMTLocn8WA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=estab.onmicrosoft.com; 
 s=selector2-estab-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Pk+4SATIBsNss0RnIFTV9MloWHOqSx7VC+/3EQBIa1Q=;
 b=f0w81QlYdLEydZrPD2jlMFevOvP1UtRS5yX6B8qbW4vx9Fy+YwDe1uB/ETfCL8otvqIoSchRzOpSf/jtMhMudl4BvugvZVQ5PUzcRKZu2mssk/dFCUekRpDtulkRx6/KtAWFuWNASUu1bxF65w7Me3QELRzGcOL6gjr0OUsikmk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from DBBP189MB1433.EURP189.PROD.OUTLOOK.COM (2603:10a6:10:1e7::15)
 by DU0P189MB2201.EURP189.PROD.OUTLOOK.COM (2603:10a6:10:3ee::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.37; Wed, 22 Mar
 2023 09:27:12 +0000
Received: from DBBP189MB1433.EURP189.PROD.OUTLOOK.COM
 ([fe80::13ad:a312:15c6:91dc]) by DBBP189MB1433.EURP189.PROD.OUTLOOK.COM
 ([fe80::13ad:a312:15c6:91dc%9]) with mapi id 15.20.6178.037; Wed, 22 Mar 2023
 09:27:12 +0000
From: Sriram Yagnaraman <sriram.yagnaraman@est.tech>
To: 
Cc: qemu-devel@nongnu.org, Akihiko Odaki <akihiko.odaki@daynix.com>,
 Jason Wang <jasowang@redhat.com>,
 Dmitry Fleytman <dmitry.fleytman@gmail.com>,
 "Michael S . Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Sriram Yagnaraman <sriram.yagnaraman@est.tech>
Subject: [PATCH v8 3/8] igb: add ICR_RXDW
Date: Wed, 22 Mar 2023 10:26:59 +0100
Message-Id: <20230322092704.22776-4-sriram.yagnaraman@est.tech>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230322092704.22776-1-sriram.yagnaraman@est.tech>
References: <20230322092704.22776-1-sriram.yagnaraman@est.tech>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: OS6P279CA0141.NORP279.PROD.OUTLOOK.COM
 (2603:10a6:e10:3a::17) To DBBP189MB1433.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:10:1e7::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DBBP189MB1433:EE_|DU0P189MB2201:EE_
X-MS-Office365-Filtering-Correlation-Id: 44979a83-4181-4dbc-b758-08db2ab79da9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: yuPx9L32mZG+PDnrMG4AmXz0RbdSjumBF2EDAvtz5VSmQKrdPAq5ah5TaWp8jXOgtVD7W/UAXXquggYkWIB4kqr8Gm1HSsLBwgbFKX/OXRJBIw/nGZRyczDnossFfpewneWtEQdRyaYqUTuR/E8bNj/RPFiFTzYt9OjhfAF07jaC9mSL6IOcPMBueNrHfR9Z1KHbg4Rp2H/7/BXj2DEK1Op+x/dywWHUswRD2Bopy0IGCr6QsTupsrNmzb54RuFi1/vm4GYDEzdWSitAqrCggvRpPdDsC9jnhRabHg9RiehPOBVIZ3rbkCX/o02AdgFgO4BcbA+SuVGuf2AQbzEEI5XJt8NlaATmF5zA1v4hnfVuALzRpAhs/YWARxqL3khlA0AmgRG+8w38cNLmS5ZSiSlLMqfrnsRow2nSNE1f2Zxw3hkyWNwQEQODfcpXoQZo4JylcBPQP0g3/hMyXEFWojp0zs+NulDuEWe2RBt1ToK794OBgKqt8ZXQHC6tgaCqhktlXvQromvPhX+LwiC0vaZQcErC99yzgTLPQbw0YKqWmRyMHr93Xt0IGLkcCsnhrlVtTa0Q04a1pqXaYuG5afwuGQtw7TJ7yLGKGJ2oYy5X5FLbWwVOa3JO8pvwejuglk7W9wrPb7BobCBBhKPcTJ0qj4fxEuTljP7aB8+7h8nhoiyaU5z803tyNYkLY5wHI5LcRpManpyNKf6HzvJRoZO/+mSvUcFHs/ig9JbDZxw=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DBBP189MB1433.EURP189.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230025)(396003)(376002)(136003)(39840400004)(346002)(109986016)(451199018)(36756003)(44832011)(8936002)(5660300002)(41300700001)(83380400001)(2906002)(2616005)(316002)(478600001)(6486002)(54906003)(86362001)(38100700002)(1076003)(6512007)(26005)(8676002)(70586007)(6506007)(66476007)(66556008)(66946007)(4326008)(186003)(6666004)(266003)(37730700002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?/uUPCstRACcrzL/ACG/bBI07fnpauQC+dwV4kOVrzI/39Xu715Lm/EmAU07V?=
 =?us-ascii?Q?yzXo7qu5jDy+eegRD22VIrV3GyvrFYezieLoghBcyTIaUBJRvOtLIZd0brVD?=
 =?us-ascii?Q?SrFFuG7GhjkYusgExyGKdMPwGGt9zF4rEYLovtj1YQxyhpU68OGrJC69mF7+?=
 =?us-ascii?Q?0jVfJwHyePr51MahHKaSPV9yr8/dWkCwSc3Q7tnlu8NjV7mTqBG5qI4xZbHf?=
 =?us-ascii?Q?duV7gD2bIOHI4lb6DLuzbWAc5CwR1bJFCkDE51ObKylurpHDwZNSt1M0POL/?=
 =?us-ascii?Q?xXw93ziUpYEDHh23z7bEkUmBXl7SY1NALYsLXI9hIc5tWgBGsmkCUfhgdS42?=
 =?us-ascii?Q?FE21s+622AULN+cNlV/M0eRdiP2Vy1oLyGqjD66rXHQzKoho3Q3fx0fcrIJX?=
 =?us-ascii?Q?z3xy2iFkY+4Bq5nkXSSuhf0NSvIA0cSZvE4HQUyswnixglnzJgo/hWOKB3KN?=
 =?us-ascii?Q?zbWpIVYKCkKhPJvSBVaY+8pEZrEESI5MykJlT3Qyq+leBuZYS+idEdeooyIf?=
 =?us-ascii?Q?rokJ8sjNxbOYFe9VwcbGNY6KmAmECEVNgLU59wtHxlzLzIRsCJCTU33DM00r?=
 =?us-ascii?Q?fqgu9AU92lpH0eOwiFNziQM/2pshFExbXbr8CKjgJ/sBTlUpWPwpxvXU0xoP?=
 =?us-ascii?Q?OLIu2lX4mfn1NvGFMN7HbWmf4MCoo5LOkxU+/NIH+Tld1k97q0Gib+LrRh5I?=
 =?us-ascii?Q?aq4DsnS9K38D6baqZYt8K7crSMWkfkY1k0O2JarMDHJQcN1pU+EksAZxzcS/?=
 =?us-ascii?Q?6+gS2r/X4hukugUgUouVNE00bb/ZtDPHtOoQF5+rWU931PKGU53h0t+axihd?=
 =?us-ascii?Q?Bfyib5vwoCPg5RlR7WlIvc1av4fvC1wk6Biytm6RT9ljQ9PaNNrEXELvFSpN?=
 =?us-ascii?Q?fVdWCgAb8VnzM8qSdKcds1qfstHYWzXew+JC2DgA+N51CvYmFJ/k8C20BOi/?=
 =?us-ascii?Q?kGamhuxDut1j6b30mEiEC9fqbl6djVFcs5NqsYRVR9eVP6Lw49Mjnx4y0GS2?=
 =?us-ascii?Q?0iCAO4fZ3oU7Zb/TaVBjQwfDaPhBuudEwMDluvSA5dRSE4APqYyB/ggVdkPl?=
 =?us-ascii?Q?8fZYQsVMYCJ8CMsIHCDU5MSRVC/96wIgzLtwj5GajdOWXuX/gtwHr4o3erRf?=
 =?us-ascii?Q?Ner361sbw6q0EqXBmHOfx9w72QW9Ix15VcrCVLVMUsWcWWNOf2fIOAigiBAN?=
 =?us-ascii?Q?16D8vx8iLvQxwFxabRKylfYIizZMFE3E5OGyAML+4m30Z4AwHaTs8WW5BpIG?=
 =?us-ascii?Q?hyG8PgkGyx/1AbeNc/BGJz5WP02SkVXriTJa0eYaBjgFaFHSVw7C9wgqa1cB?=
 =?us-ascii?Q?F+3/lsf3tp35pzGuD0GUUCNqA1Y63keLCUvqDnDbXrlDdouPk1uzpdNdNbJw?=
 =?us-ascii?Q?yWUNl3P5HXqY7pCr5Ii00I+4GPMlu1zMKm4oUVWrKXUMARWuljHFprh+h3Dt?=
 =?us-ascii?Q?vgvqEyrT5/Coi89i+B8Qa/P0r1tsO8BrBziLDyfov26JjTLh0YPnu/MUntnp?=
 =?us-ascii?Q?sowayd0YSccYjOsJqWN2s/bxrXN/+hXyY2VzWRZAGB5cKCLRYLMSGbC/8CcO?=
 =?us-ascii?Q?q7YCl3+KeaAoWNVG0n2p9P/IaBLDHqcNt4GDkSSe7Dn48G8W0FGsBtDs5ZhJ?=
 =?us-ascii?Q?pw=3D=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: 44979a83-4181-4dbc-b758-08db2ab79da9
X-MS-Exchange-CrossTenant-AuthSource: DBBP189MB1433.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Mar 2023 09:27:11.6989 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bfd3YopMH30VZEESZIuIyuIStVx0KBaiDgd6d9kG6FthdYF+HGUOm4IdXDKSQUzIlHInpFrysD40TAsptfwTABU6WRCAJ+YeboGw6+cU7hw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0P189MB2201
Received-SPF: pass client-ip=2a01:111:f400:fe1a::727;
 envelope-from=sriram.yagnaraman@est.tech;
 helo=EUR03-DBA-obe.outbound.protection.outlook.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
 hw/net/e1000x_regs.h | 4 ++++
 hw/net/igb_core.c    | 2 +-
 2 files changed, 5 insertions(+), 1 deletion(-)

diff --git a/hw/net/e1000x_regs.h b/hw/net/e1000x_regs.h
index c0832fa23d..6d3c4c6d3a 100644
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
index fe6c7518e9..c575d4a615 100644
--- a/hw/net/igb_core.c
+++ b/hw/net/igb_core.c
@@ -1580,7 +1580,7 @@ igb_receive_internal(IGBCore *core, const struct iovec *iov, int iovcnt,
             continue;
         }
 
-        n |= E1000_ICR_RXT0;
+        n |= E1000_ICR_RXDW;
 
         igb_rx_fix_l4_csum(core, core->rx_pkt);
         igb_write_packet_to_guest(core, core->rx_pkt, &rxr, &rss_info);
-- 
2.34.1


