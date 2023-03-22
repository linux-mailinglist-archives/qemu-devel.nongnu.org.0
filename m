Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DD9676C4CAF
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Mar 2023 15:01:00 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pez0d-0003iZ-7T; Wed, 22 Mar 2023 10:00:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sriram.yagnaraman@est.tech>)
 id 1pez0a-0003iB-Qk
 for qemu-devel@nongnu.org; Wed, 22 Mar 2023 10:00:08 -0400
Received: from mail-am7eur03on2071a.outbound.protection.outlook.com
 ([2a01:111:f400:7eaf::71a]
 helo=EUR03-AM7-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sriram.yagnaraman@est.tech>)
 id 1pez0Y-0002CS-H7
 for qemu-devel@nongnu.org; Wed, 22 Mar 2023 10:00:08 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bOLjhMJ30BxDPNcedsDuSfpcjdnLbAWzNUdOI/DuWHw0Ef0lcakKXsr53WEXvXWNCkQplKxQ/cBuCa/LNFof2SRz95TeFZJceUyIGC34P+zepQWYkHYp8cBxgx81PVvy9QThzKB3h4gJm4Hsp0NEGxHC9ha06l273U34B09r7oVvQUoMi3NDhwdlAif3pJFCB57ME4sWY/qR+xUEq2ahwXX5FvsqO/Af00+tzl6gWoAwjDCkeUMbgYtO6WYYirhDNttPEYN6JQShYZEccq5KWAB9bxE6RRlhn5ICBgKA0tQ4QrvCxovqgViT6++C754qtwP/l4O8VeNwlV6n0IAEZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MNivnladpnDhEk+MsGEfi9bkz1EZipHU4dH/rBkjDFI=;
 b=l0OO+8D5+1wvaaiYWMYhCs+iESVVrVN6RvSGUDXbofZq/UcAkWTOKdAoxh7E0CKhRS+sGAx51pcj7AuUvrbpVSrl60G/hRhZ4mRVl+9F3QIctlQGQOYdQllMZwXFdrjztrQci+Y1d61dHYdspK7yY/zvIklpggwshOD9XfvHSjIlNVWazT/tbFha7yR3Temdqqj/uI6FfxzLtwf032tPrqCoRkulcV8CuoN4o88UYABRcfHkLyY45uPaoyiog7/RIQMQt7oCFSCTH2l9Y83vlIWrJqK+Q0boE0Y9pQeHyjKz63BJ0IH2s4XNgaSJyRVb/pPWDDJdPLMIlTDyfkP1CQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=estab.onmicrosoft.com; 
 s=selector2-estab-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MNivnladpnDhEk+MsGEfi9bkz1EZipHU4dH/rBkjDFI=;
 b=Go+pksEMS/oWilWDbyWLpBELS6W3Fy6gZ/GQPzDJ+IzWemnBgsqyKrQR8ESV+pIiHzKMZs36hxPykW96P5/W2u/nA9VVWrRx3EY8gVUCYXt8qst+FowFhknQJe++9sFJ2CqfQuzmEEeMMcXhurMMYQZhUSE/3nFzIcVSUcsXZ7E=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from DBBP189MB1433.EURP189.PROD.OUTLOOK.COM (2603:10a6:10:1e7::15)
 by PRAP189MB1850.EURP189.PROD.OUTLOOK.COM (2603:10a6:102:27b::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.37; Wed, 22 Mar
 2023 14:00:02 +0000
Received: from DBBP189MB1433.EURP189.PROD.OUTLOOK.COM
 ([fe80::13ad:a312:15c6:91dc]) by DBBP189MB1433.EURP189.PROD.OUTLOOK.COM
 ([fe80::13ad:a312:15c6:91dc%9]) with mapi id 15.20.6178.037; Wed, 22 Mar 2023
 14:00:02 +0000
From: Sriram Yagnaraman <sriram.yagnaraman@est.tech>
To: 
Cc: qemu-devel@nongnu.org, Akihiko Odaki <akihiko.odaki@daynix.com>,
 Jason Wang <jasowang@redhat.com>,
 Dmitry Fleytman <dmitry.fleytman@gmail.com>,
 "Michael S . Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Sriram Yagnaraman <sriram.yagnaraman@est.tech>
Subject: [PATCH v9 3/8] igb: add ICR_RXDW
Date: Wed, 22 Mar 2023 14:04:35 +0100
Message-Id: <20230322130440.26808-4-sriram.yagnaraman@est.tech>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230322130440.26808-1-sriram.yagnaraman@est.tech>
References: <20230322130440.26808-1-sriram.yagnaraman@est.tech>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: GV3P280CA0115.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:150:8::18) To DBBP189MB1433.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:10:1e7::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DBBP189MB1433:EE_|PRAP189MB1850:EE_
X-MS-Office365-Filtering-Correlation-Id: 8cdb01d4-1a1e-4759-d98d-08db2addbb39
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: xoTc+Xh69dtKRB7q4Cnmknzg9QJdC7gK0NWvRGra/bD2UAyLkQqw2envyeW9argyaKLkBKn3djVckDfGQDe11BsGZAptuOv6QIXYOaV5JOzgNHL8ySlr7kndL5qhiaugmYNnhQQbO3F++yHPISD4k1BTjcuPgc+IOwwrtrEy/3Q+Oe0NDUizWv/1jcJrWF7FqgZkuT4pAhQ0z3GZ7uJS3hnSdjyJmTNScHDbdDXVrKbnlQSQduq8JefEcXL6u0DHp5Y+ARiQCxmR47EvC/oTk7MorCcz2buEO0DyPneavrS/FIq3Rw2Ndf8zz/JDcM+51SFy8OWcsQlQ03SbDv9m81PQeglWuf+H9JUFVJSTGPyiXc8pKzcbuTxZ+iT+asmprfZj0eOGJpXBTnjLiNzX+0q72rQa8WTiZfKXxyxf+Y5R7jeXHGAeggj77rxa2fZFi8/Aanfb1EzBW67wlQXlezpw/ukVgAvlSiNe6bXK8vm7yVztnxbvD/ZWK8jD5GQ0wQiL2e3A9d0dZkoR4Ibb1/4Su2+Xv0eEadEooPmkXkN2SzUS/bgpKYdQ1aED4Fek7RLETYW5f/6ELjcpgq5H1numTd/0eEr06lsa7n/BVy33h550s/WY2othla/AaP1EtQGzCudo5hZm+7kPdUmdQGvr+t15O1C6Fufceleqk1yJ4k7yYubXGRl2H6/EwrX4lFp0jdvd3qrlp8rGeToJOnPAGpgKBdIMaX/P8JB7Pjk=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DBBP189MB1433.EURP189.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230025)(396003)(136003)(39840400004)(376002)(346002)(109986016)(451199018)(86362001)(36756003)(83380400001)(186003)(66476007)(8676002)(316002)(4326008)(66946007)(70586007)(478600001)(2616005)(54906003)(1076003)(6506007)(26005)(6512007)(6486002)(6666004)(66556008)(38100700002)(5660300002)(44832011)(41300700001)(8936002)(2906002)(266003)(37730700002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?j3/rrP/9ye6r6K03n/uXJwmC3sI8/7eZCLa5RYagVfGL0DXvwHrjhLg297ia?=
 =?us-ascii?Q?K/8tX3fryCD9I1Tq2L20CedQqyBRM3vwR3bsv1o/3hvQLhhnezvd1RS98Dpz?=
 =?us-ascii?Q?qR0bN58mwDyhEGUmzradPtOlFcB8mHar0qDDU7KuIxB9RK10VKSiP8c5YDOl?=
 =?us-ascii?Q?TZozhQkrXRO/yQFrORD1SoJ50A0sQPr97josqG5eYNHXvy8zeAmrzMWCk6kT?=
 =?us-ascii?Q?YgQX8Yq+gAmkBcO8a75aDk6xIpHeafvjvWHx1I5r+Hu9IXov/SE10GY1EtSD?=
 =?us-ascii?Q?YwnVEC+GRIGMN8VEumVMHItQY/dQ1F3aXCynQwjm0R/ZphsRsdlddLxqlx3v?=
 =?us-ascii?Q?4sehj9BJZZMVQxEEcVLiGDpKb9YLZPItbSGWE8h3WPVKz5JBbNK+LVo20/Qe?=
 =?us-ascii?Q?P3C/HLH9pXZdiSZX6bBw3svDAL0GUy04b5QTYvizMz8nhaMR32T9PcvM96UR?=
 =?us-ascii?Q?v89bHAA3W+A2C2g/+jyAkekN6VKGZVX9i4oR6Z81NRJ8Llfj4vaspzIo/Tws?=
 =?us-ascii?Q?TCvhWB/wtR+c8EUcPa/NuL1YQSocj+oeckRyfKXE7Cu0WyOn+D2OtYE0qipr?=
 =?us-ascii?Q?BK62mlq9xogKJAf8ChILogoHPfrHZWB3ZWlvTuTeZYejazQWQ7vpzB1vDcZQ?=
 =?us-ascii?Q?4VU9j7xUrkfJYpI4V1bzxitGz2txx20PMrlE6ee8j2237ZsUzW4xKhFldLOG?=
 =?us-ascii?Q?0HS5zKQ5QoPcGtY+4rgkHiVFc6XU5G94S0MI9Mly1PsdIEHNpLn1Wo2Bg85c?=
 =?us-ascii?Q?YtlXgUx/gqO8U5lMk9WywGnxLKO+LMynn/xVJhBhY1XtmLZUrmkNkd0zV7TN?=
 =?us-ascii?Q?3pP4fJ5rrU8x8369VSTJ7b3i6U+ULorDuYmLnb83DqkmOG4jFxP99RpdOEcc?=
 =?us-ascii?Q?+aVkHjLuSjusuEQNRjhc4IenTgYR9wQ8z2PG6/Ux1Ax31ELQwHKJ0GFKNpKF?=
 =?us-ascii?Q?vFm4fzs10vtMguIA6rjBCPfw5kgYBnxKMrvL7iLqq8IFzwjHSO9iAURd1xEO?=
 =?us-ascii?Q?x8/3SUZRSNNLgTWOw3YKr0O5DDFNqCJfGd+SPtbdsbOviBdMtV8njtcb9uId?=
 =?us-ascii?Q?0kpioxJxh4UhfMrl1urIZ1OUrm6k6UVEuDEJIUOQamTazE+KV8F5d9swmojO?=
 =?us-ascii?Q?UBXQd5VTkzw0s8Z+906omGiS8ImPGZijheu6OVARr+4dApkohbe6LYRSYEPT?=
 =?us-ascii?Q?qHoRZBxn9kMb6MGwvNWhH6dru9dHXRIfcGg34CfRTLIlnQrugVSsJ0GMdzQv?=
 =?us-ascii?Q?nAC1a2DVZA2HkxQ3f6bzQeQarMJmQMmHZhICJmz6+fBlW/e/OaVw6gZxRl+O?=
 =?us-ascii?Q?My1VbciADma18bT20bYr9/p2coIm0P+sGQnk44XgaZuo8HYD3DDpiRaOlbGs?=
 =?us-ascii?Q?7pT9eta5fuUQS/f/LMpU+ZlSkjUt1vXuimc725wW8bftR6Srs1uV0zS+Tvhz?=
 =?us-ascii?Q?ng1kTRGHKPm1ycDkg030LUtwSn1i1CPma32v/hnR4CdeAU4KBt1K/c6+wGGm?=
 =?us-ascii?Q?EVaqhM6R9/NbgfQAj59hopMGwsmwOMWvLSpEI4P1c3IjDPAX+tYN5rUAAOha?=
 =?us-ascii?Q?mUizBwAdkb+pSlsVlx5U8b1eW9YxsW2nyMI1zAy/0OhaWiKrqmN2X/4BzHDm?=
 =?us-ascii?Q?9Q=3D=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: 8cdb01d4-1a1e-4759-d98d-08db2addbb39
X-MS-Exchange-CrossTenant-AuthSource: DBBP189MB1433.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Mar 2023 14:00:02.1576 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PzEI8tqZG/vjkB7zPDla1vxO4XGlRNgUE8+BlsQY6VYrKZs1vARMj63jhnL4F9qABrZKaNUq/s0BYLdD2UR6lV8MgJ0NbqH5A0MAut6h9FQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PRAP189MB1850
Received-SPF: pass client-ip=2a01:111:f400:7eaf::71a;
 envelope-from=sriram.yagnaraman@est.tech;
 helo=EUR03-AM7-obe.outbound.protection.outlook.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, SPF_HELO_PASS=-0.001,
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
index 0fde8ef854..f799f7f84a 100644
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


