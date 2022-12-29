Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 733FE6590D0
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Dec 2022 20:18:31 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pAyHL-0006md-IW; Thu, 29 Dec 2022 14:09:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sriram.yagnaraman@est.tech>)
 id 1pAyHJ-0006jr-7G
 for qemu-devel@nongnu.org; Thu, 29 Dec 2022 14:09:21 -0500
Received: from mail-db3eur04on2132.outbound.protection.outlook.com
 ([40.107.6.132] helo=EUR04-DB3-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sriram.yagnaraman@est.tech>)
 id 1pAyHF-00075d-Tl
 for qemu-devel@nongnu.org; Thu, 29 Dec 2022 14:09:20 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VEDEiFxHg+VcCg2T5L3ggm3GPaWJMVZ10/I+rcCJAwJ731XT73cBSUPpGPC/Ds21UvcZtnOkbL/KT9qecSXubCadEV3d9/+ZbDlKG7F5C7rLkXxwzh/qy6O1UzZNQDSWScUgaT2eT2GXBIjITmKfb6kwROWx424AKXZKyRywODZNxS0l/oX4G39KMzaKLk8EAjfbqeyrTBlGpBIX4r/5HfeUtuEZwnct8pDfFDJ3ujMeWNN/iBhT2ymsGVdusdu3BfmiP14vFy/JnMJgQAxkXY1hTetQYGq6UL6HYJURQmGo++3fUxOwOoNpqr/vwBo/3lZLpfmXBHW1ZFMyQCMDUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xEiQFfASTRYzpu3mUGgY/uB9ne8dQs3BTxk/dEStPB8=;
 b=QrNSbITU8yF2VZeDJtMsHTVdplOdAH7J1BldBP6J+E32+JD0FYkjyPkDxggkw5ecVej87UHGf/nUPjnZl56wITn/HBgaTShB829B1mQ6ut9s+VxABspuULtyxasqCoslUcBNLasN7EYiYKR3l5BJ75dfMXAylxvmWakeCngLZmiXVumfbMKEjRyepgmdjcxNTUZ2opsRBLySzQrP7azkuVmJeFjjRadZBxljSlLLJ8AKRbYGS001Uou5VvKEaJdpVsx+33GN4thywM7XDQsm8gO68r1QxeTSq+3txvx2HCD3FHi1JsCHotZer2QYlvxqhN/vyk1sDIsg1U38cyT9xA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=estab.onmicrosoft.com; 
 s=selector2-estab-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xEiQFfASTRYzpu3mUGgY/uB9ne8dQs3BTxk/dEStPB8=;
 b=OzdlsuILbt/IBWoNzGCANn38Su4S/m9EDrDyZwpuSLf4jk3H64+lI1VB9O1zAeMRMKjpzDcqWdHfDCXvZJ01hVJ3mdbcwdnykdCMImIGiEHTr4e591Bnyq3RQn4sSK9HdChFP9u5qvdAICBEBxaMHZm61zktbQgGdd6tWnTZ50Q=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from DBBP189MB1433.EURP189.PROD.OUTLOOK.COM (2603:10a6:10:1e7::15)
 by PR3P189MB1049.EURP189.PROD.OUTLOOK.COM (2603:10a6:102:4f::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5966.17; Thu, 29 Dec
 2022 19:08:39 +0000
Received: from DBBP189MB1433.EURP189.PROD.OUTLOOK.COM
 ([fe80::8f70:435b:ab64:9420]) by DBBP189MB1433.EURP189.PROD.OUTLOOK.COM
 ([fe80::8f70:435b:ab64:9420%4]) with mapi id 15.20.5966.017; Thu, 29 Dec 2022
 19:08:39 +0000
From: Sriram Yagnaraman <sriram.yagnaraman@est.tech>
To: qemu-devel@nongnu.org, Dmitry Fleytman <dmitry.fleytman@gmail.com>,
 Jason Wang <jasowang@redhat.com>, "Michael S . Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
Cc: Sriram Yagnaraman <sriram.yagnaraman@est.tech>
Subject: [PATCH v2 3/6] hw/net/igb: register definitions
Date: Thu, 29 Dec 2022 20:08:14 +0100
Message-Id: <20221229190817.25500-4-sriram.yagnaraman@est.tech>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221229190817.25500-1-sriram.yagnaraman@est.tech>
References: <20221229190817.25500-1-sriram.yagnaraman@est.tech>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: GV3P280CA0082.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:150:a::10) To DBBP189MB1433.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:10:1e7::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DBBP189MB1433:EE_|PR3P189MB1049:EE_
X-MS-Office365-Filtering-Correlation-Id: f1594483-9cef-4352-9752-08dae9d017fc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: I8wYpU1FKuvR36CG5jvd59ikjCGbsXc/Zfyl4AeBRzp1Ng6peFJ7NfTplWIGG8BBqddEHWzfCdIdGrDn5mZHchge2MP9EtPXAhHXwM/UOh6wQDX67kSHhgk/NkPNKUcIA/l1s8dmqOKo/964B84mdiKbi420JVMckxlhaFubS5HhGVGrZvK5wZHGSyt9zydLgg1Std3AF1LZoQmviyb3KDe/V2FnoYqiaY5+0c/EOfmK8jicSivpDd/Ou/n5clwGJ15jjdPlYOUk7c4fMN/71VVWmb62cGqMuVbfjTO4e0nT79RU+LVLV92/z6jo3BEiLt5W89akDfC6hJ253C8utKP4X9GD/w18oDeemtgujykvupomxhx76kUWNJe2QO34+DM0HKVeYRItjgkb5S7gnzDD3Mpg8WVikE7U20N9Fwtgj6gzNt19BQHhPfvryE9O8hcZGwyayZf0dr/bKMVMofWbZ4rK2xIL7kI3RVYxxm/f6XT+U0+xw5yOJpwL7Gq8iZ8k4xYoFTZbpoel1ak0Fhe3KWQkEdHBubnNu9KNXZVvZtzgRdulPUguAua6OYuJfvd0Zas78GQH26F8kBe9abkxgiw3UjcdL1jVbOj5ehLViAhhLBdigLhFl3OqkFp982LD1ghqSjtiQyqYUVC+36ct3vey86gmsJ+xAATfHYQG9l8SUcl0rXCAyfGn0R0W
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DBBP189MB1433.EURP189.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230022)(39830400003)(346002)(376002)(396003)(136003)(451199015)(6512007)(36756003)(186003)(110136005)(26005)(316002)(66476007)(5660300002)(44832011)(30864003)(83380400001)(2616005)(70586007)(66946007)(66556008)(38100700002)(4326008)(1076003)(8676002)(2906002)(6486002)(8936002)(86362001)(478600001)(41300700001)(6666004)(6506007)(37730700002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?p0fg/Di1YQ+CihOYFmgoRVYg6CMN9aCnwdd6nor5TaOHM093xf52V5g/3Fuf?=
 =?us-ascii?Q?Oy0oUTu5AUeWL7ahYOsGp5R8xTPBwzQ0S1TP+7dfKgSO0PAQnPJqEoD2ihI0?=
 =?us-ascii?Q?bp7zxYLZkSOej7mja2wCMi8oLACXmgOgylr8owPFgCrH1O1sfhVQmbnxFeqH?=
 =?us-ascii?Q?FSZqSkaSzvZtp8hM9JoEu/HuQC+ZHwXZIMwY0IUoMiRC9m6PqrQ+Y0gt9ChL?=
 =?us-ascii?Q?mJP15ZFW1sn0m2fbAf3+ul0pQayfzWQdzBGGtiZIv5ty2Gqstd7ZC6x/RYRW?=
 =?us-ascii?Q?yv8oVYLqgQtQIxbyQkxr4UA+lM12MHneqg5u5BWu0FnO3d5g31w2T6iB/Y5+?=
 =?us-ascii?Q?MT8rrgZHx9WR9+Prv//lZ1zC0JYOCy7MZiOMCo17+zO8+gMHuRAcbin+VL2e?=
 =?us-ascii?Q?b6Wid7FNTSlpF1+3giofxXHJy7piebMSgc84+tW9lk/wVSPI2GyXlYViMmHY?=
 =?us-ascii?Q?cXMqDZp4xgIoeb0dEgFOMQtc7I51gDO/iKYaA5An3ZLQGFnu6ahQ1aux9lR5?=
 =?us-ascii?Q?CC+eYMAadiGYyD7d3tWxbdkQW/3ol6riSMUmwZQLzPomXWVcfbJlfy8NbKf+?=
 =?us-ascii?Q?pmXNT+0D8WFZX7N6lq4mt9GZNSFzA4nLQlefgZ2+1xpRiflmZWOsv6tY05WC?=
 =?us-ascii?Q?27HH/he3YhH3VeUaU6Qm4XorLXsGjKEALmqiJYvfEBu9069AuW5s+vcz93QS?=
 =?us-ascii?Q?7mVK6zf5aX0iAoUrN+v+mQEGlcwzc7Cev7BFwrBKJ6wsTsEAT2WEAuO6NoY6?=
 =?us-ascii?Q?v/LipdGl5cCVnipdArfb6Z0I/CVZ/tYeyGzVWlWq3+5dmLikM6ZmDrgCZ1eq?=
 =?us-ascii?Q?k1j67+xVuhcNReQV1vM+je+T3uK//tjH+LyS/G5XPSt2VX3e5JdI0/AnwyCT?=
 =?us-ascii?Q?WpYRg/DiRj2QHCC7Tsn+gd74DTLa7SliwPUJx6JfofSNgM1w+93lyA+QSlCu?=
 =?us-ascii?Q?Ik0L+kGr+T+mH5gMXvjhxhVE9cRiwvrb4tecrM7emN7AE2TWemYrN9yiy0Sp?=
 =?us-ascii?Q?WGy0VwF8Yr6ZTYDilxqxyxKS3pv7fPZrH2P8IEqtqES8rOG8IBa4NiaPsXSZ?=
 =?us-ascii?Q?huRz3YIqbRgh9OuvsEU6i77i7QolChAl+o5zZMoySRSpbg204bwAhuI9zt82?=
 =?us-ascii?Q?zC7qlFjf64feDPao/v4Mru3Ap7a/ZWmg9rievzhPRyNpMHMM5giCOajHnTjJ?=
 =?us-ascii?Q?Pu+KkRASUDlabT90oq4fSXegfbaoILx1UUrrpx9NATJ1SyA8vKdT5Z7BBYDd?=
 =?us-ascii?Q?AflNlPd9Ry5P7Qx2+EDkli6moYlq6s4JuzK6DtB2s9wn0m3SBHXKRgutThCR?=
 =?us-ascii?Q?y7IdNWb27ysptdvNSN5CJnv5LVFSZ3D2TXAjRUmTi9cRWDkpD+pc6Nl1JNc1?=
 =?us-ascii?Q?oYflJ+fz3ja+X0wGPOGj48VuPF44l2e0kS2SL1l4mGJeQnviBbrsKr3h7/OJ?=
 =?us-ascii?Q?x+qBpMG9nAMQmOQLVnf/ivo9E5lukoUK+b8BIENgJwDFis3AfTIhvWPstZrQ?=
 =?us-ascii?Q?oIm+GTx0m4skZ7oSH5LtfkDu8fwk38SENQUpZl562429neNMXZ3Iz+9engAJ?=
 =?us-ascii?Q?AmFXHhibxigV4mZcRlOMI8+o+U8y3W03VxwKLkn9UwEiuGgHx5FeUYIJDm20?=
 =?us-ascii?Q?lg=3D=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: f1594483-9cef-4352-9752-08dae9d017fc
X-MS-Exchange-CrossTenant-AuthSource: DBBP189MB1433.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Dec 2022 19:08:39.2807 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HXM7JsVqsHHdvh83FySaoOejMxHysvzkdfCL+z+NzT5ugg46Wd07oUwYbRgl3oGHALJpdgU7/SK3rcBm9bDR7BkOgQyVQIDy/Mpt8YeZD2s=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3P189MB1049
Received-SPF: pass client-ip=40.107.6.132;
 envelope-from=sriram.yagnaraman@est.tech;
 helo=EUR04-DB3-obe.outbound.protection.outlook.com
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

Signed-off-by: Sriram Yagnaraman <sriram.yagnaraman@est.tech>
---
 hw/net/e1000_regs.h    | 363 +++++++++++++++++++++++++++++++++++++----
 hw/net/e1000x_common.c |  13 ++
 hw/net/e1000x_common.h |  29 ++++
 3 files changed, 376 insertions(+), 29 deletions(-)

diff --git a/hw/net/e1000_regs.h b/hw/net/e1000_regs.h
index 59e050742b..d28cb322b7 100644
--- a/hw/net/e1000_regs.h
+++ b/hw/net/e1000_regs.h
@@ -85,11 +85,13 @@
 #define E1000_DEV_ID_82573E_IAMT         0x108C
 #define E1000_DEV_ID_82573L              0x109A
 #define E1000_DEV_ID_82574L              0x10D3
+#define E1000_DEV_ID_82576               0x10C9
+#define E1000_DEV_ID_82576_VF            0x10CA
 #define E1000_DEV_ID_82546GB_QUAD_COPPER_KSP3 0x10B5
-#define E1000_DEV_ID_80003ES2LAN_COPPER_DPT     0x1096
-#define E1000_DEV_ID_80003ES2LAN_SERDES_DPT     0x1098
-#define E1000_DEV_ID_80003ES2LAN_COPPER_SPT     0x10BA
-#define E1000_DEV_ID_80003ES2LAN_SERDES_SPT     0x10BB
+#define E1000_DEV_ID_80003ES2LAN_COPPER_DPT   0x1096
+#define E1000_DEV_ID_80003ES2LAN_SERDES_DPT   0x1098
+#define E1000_DEV_ID_80003ES2LAN_COPPER_SPT   0x10BA
+#define E1000_DEV_ID_80003ES2LAN_SERDES_SPT   0x10BB
 
 #define E1000_DEV_ID_ICH8_IGP_M_AMT      0x1049
 #define E1000_DEV_ID_ICH8_IGP_AMT        0x104A
@@ -105,6 +107,7 @@
 #define E1000_PHY_ID2_8254xx_DEFAULT 0xC20 /* 82540x, 82545x, and 82546x */
 #define E1000_PHY_ID2_82573x 0xCC0
 #define E1000_PHY_ID2_82574x 0xCB1
+#define E1000_PHY_ID2_82576x 0x391
 
 /* Register Set. (82543, 82544)
  *
@@ -142,6 +145,7 @@
 #define E1000_IVAR     0x000E4  /* Interrupt Vector Allocation Register - RW */
 #define E1000_EITR     0x000E8  /* Extended Interrupt Throttling Rate - RW */
 #define E1000_RCTL     0x00100  /* RX Control - RW */
+#define E1000_SRRCTL   0x0280C  /* Split and Replication Receive Control - RW */
 #define E1000_RDTR1    0x02820  /* RX Delay Timer (1) - RW */
 #define E1000_RDBAL1   0x02900  /* RX Descriptor Base Address Low (1) - RW */
 #define E1000_RDBAH1   0x02904  /* RX Descriptor Base Address High (1) - RW */
@@ -150,6 +154,16 @@
 #define E1000_RDT1     0x02918  /* RX Descriptor Tail (1) - RW */
 #define E1000_FCTTV    0x00170  /* Flow Control Transmit Timer Value - RW */
 #define E1000_FCRTV    0x05F40  /* Flow Control Refresh Timer Value - RW */
+#define E1000_EICR     0x01580  /* Ext. Interrupt Cause Read - R/clr */
+#define E1000_EITR_IGB 0x01680  /* Extended Interrupt Throttling Rate - RW */
+#define E1000_EICS     0x01520  /* Ext. Interrupt Cause Set - W0 */
+#define E1000_EIMS     0x01524  /* Ext. Interrupt Mask Set/Read - RW */
+#define E1000_EIMC     0x01528  /* Ext. Interrupt Mask Clear - WO */
+#define E1000_EIAC_IGB 0x0152C  /* Ext. Interrupt Auto Clear - RW */
+#define E1000_EIAM     0x01530  /* Ext. Interrupt Ack Auto Clear Mask - RW */
+#define E1000_GPIE     0x01514  /* General Purpose Interrupt Enable - RW */
+#define E1000_IVAR_IGB 0x01700  /* Interrupt Vector Allocation (array) - RW */
+#define E1000_IVAR_MISC_IGB 0x01740 /* IVAR for "other" causes - RW */
 #define E1000_TXCW     0x00178  /* TX Configuration Word - RW */
 #define E1000_RXCW     0x00180  /* RX Configuration Word - RO */
 #define E1000_TCTL     0x00400  /* TX Control - RW */
@@ -225,6 +239,7 @@
 #define E1000_TDFHS    0x03420  /* TX Data FIFO Head Saved - RW */
 #define E1000_TDFTS    0x03428  /* TX Data FIFO Tail Saved - RW */
 #define E1000_TDFPC    0x03430  /* TX Data FIFO Packet Count - RW */
+#define E1000_DTXCTL   0x03590  /* DMA TX Control - RW */
 #define E1000_TDBAL    0x03800  /* TX Descriptor Base Address Low - RW */
 #define E1000_TDBAL_A  0x00420  /* Alias to TDBAL */
 #define E1000_TDBAH    0x03804  /* TX Descriptor Base Address High - RW */
@@ -316,6 +331,7 @@
 #define E1000_ICRXDMTC 0x04120  /* Interrupt Cause Rx Descriptor Minimum Threshold Count */
 #define E1000_ICRXOC   0x04124  /* Interrupt Cause Receiver Overrun Count */
 #define E1000_RXCSUM   0x05000  /* RX Checksum Control - RW */
+#define E1000_RLPML    0x05004  /* RX Long Packet Max Length */
 #define E1000_RFCTL    0x05008  /* Receive Filter Control*/
 #define E1000_MAVTV0   0x05010  /* Management VLAN TAG Value 0 */
 #define E1000_MAVTV1   0x05014  /* Management VLAN TAG Value 1 */
@@ -324,11 +340,18 @@
 #define E1000_MTA      0x05200  /* Multicast Table Array - RW Array */
 #define E1000_RA       0x05400  /* Receive Address - RW Array */
 #define E1000_RA_A     0x00040  /* Alias to RA */
+#define E1000_RA2      0x054E0  /* 2nd half of Rx address array - RW Array */
+#define E1000_PSRTYPE(_i) (0x05480 + ((_i) * 4))
+#define E1000_RAL(_i)  (((_i) <= 15) ? (0x05400 + ((_i) * 8)) : \
+                                       (0x054E0 + ((_i - 16) * 8)))
+#define E1000_RAH(_i)  (((_i) <= 15) ? (0x05404 + ((_i) * 8)) : \
+                                       (0x054E4 + ((_i - 16) * 8)))
 #define E1000_VFTA     0x05600  /* VLAN Filter Table Array - RW Array */
 #define E1000_VFTA_A   0x00600  /* Alias to VFTA */
 #define E1000_WUC      0x05800  /* Wakeup Control - RW */
 #define E1000_WUFC     0x05808  /* Wakeup Filter Control - RW */
 #define E1000_WUS      0x05810  /* Wakeup Status - RO */
+#define E1000_VT_CTL   0x0581C  /* VMDq Control - RW */
 #define E1000_MANC     0x05820  /* Management Control - RW */
 #define E1000_IPAV     0x05838  /* IP Address Valid - RW */
 #define E1000_IP4AT    0x05840  /* IPv4 Address Table - RW Array */
@@ -386,6 +409,62 @@
 #define E1000_TIMADJH    0x0B610 /* Time Adjustment Offset register High - RW */
 #define E1000_RXCFGL     0x0B634 /* RX Ethertype and Message Type - RW*/
 
+/* GPIE flags */
+#define E1000_GPIE_NSICR     0x00000001
+#define E1000_GPIE_MSIX_MODE 0x00000010
+#define E1000_GPIE_EIAME     0x40000000
+#define E1000_GPIE_PBA       0x80000000
+
+/* SRRCTL bit definitions */
+#define E1000_SRRCTL_BSIZEPKT_MASK       (BIT(7) - 1)
+#define E1000_SRRCTL_BSIZEPKT_SHIFT      10 /* Shift _right_ */
+#define E1000_SRRCTL_BSIZEHDRSIZE_SHIFT  2  /* Shift _left_ */
+#define E1000_SRRCTL_DESCTYPE_ADV_ONEBUF 0x02000000
+#define E1000_SRRCTL_DESCTYPE_HDR_SPLIT_ALWAYS 0x0A000000
+#define E1000_SRRCTL_RDMTS_MASK          ((BIT(25) - 1) & (~(BIT(20) - 1)))
+#define E1000_SRRCTL_RDMTS_SHIFT         15 /* Shift _right_ */
+#define E1000_SRRCTL_DROP_EN             0x80000000
+#define E1000_SRRCTL_TIMESTAMP           0x40000000
+
+#define E1000_RDBAL_REG(_n)   ((_n) < 4 ? (0x02800 + ((_n) * 0x100)) \
+                    : (0x0C000 + ((_n) * 0x40)))
+#define E1000_RDBAH_REG(_n)   ((_n) < 4 ? (0x02804 + ((_n) * 0x100)) \
+                    : (0x0C004 + ((_n) * 0x40)))
+#define E1000_RDLEN_REG(_n)   ((_n) < 4 ? (0x02808 + ((_n) * 0x100)) \
+                    : (0x0C008 + ((_n) * 0x40)))
+#define E1000_SRRCTL_REG(_n)  ((_n) < 4 ? (0x0280C + ((_n) * 0x100)) \
+                    : (0x0C00C + ((_n) * 0x40)))
+#define E1000_RDH_REG(_n)     ((_n) < 4 ? (0x02810 + ((_n) * 0x100)) \
+                    : (0x0C010 + ((_n) * 0x40)))
+#define E1000_RDT_REG(_n)     ((_n) < 4 ? (0x02818 + ((_n) * 0x100)) \
+                    : (0x0C018 + ((_n) * 0x40)))
+#define E1000_RXDCTL_REG(_n)  ((_n) < 4 ? (0x02828 + ((_n) * 0x100)) \
+                    : (0x0C028 + ((_n) * 0x40)))
+#define E1000_TDBAL_REG(_n)   ((_n) < 4 ? (0x03800 + ((_n) * 0x100)) \
+                    : (0x0E000 + ((_n) * 0x40)))
+#define E1000_TDBAH_REG(_n)   ((_n) < 4 ? (0x03804 + ((_n) * 0x100)) \
+                    : (0x0E004 + ((_n) * 0x40)))
+#define E1000_TDLEN_REG(_n)   ((_n) < 4 ? (0x03808 + ((_n) * 0x100)) \
+                    : (0x0E008 + ((_n) * 0x40)))
+#define E1000_TDH_REG(_n)     ((_n) < 4 ? (0x03810 + ((_n) * 0x100)) \
+                    : (0x0E010 + ((_n) * 0x40)))
+#define E1000_TDT_REG(_n)     ((_n) < 4 ? (0x03818 + ((_n) * 0x100)) \
+                    : (0x0E018 + ((_n) * 0x40)))
+#define E1000_TXDCTL_REG(_n)  ((_n) < 4 ? (0x03828 + ((_n) * 0x100)) \
+                    : (0x0E028 + ((_n) * 0x40)))
+#define E1000_RXCTL_REG(_n)   ((_n) < 4 ? (0x02814 + ((_n) * 0x100)) \
+                    : (0x0C014 + ((_n) * 0x40)))
+#define E1000_TXCTL_REG(_n)   ((_n) < 4 ? (0x03814 + ((_n) * 0x100)) \
+                    : (0x0E014 + ((_n) * 0x40)))
+#define E1000_TDWBAL_REG(_n)  ((_n) < 4 ? (0x03838 + ((_n) * 0x100)) \
+                    : (0x0E038 + ((_n) * 0x40)))
+#define E1000_TDWBAH_REG(_n)  ((_n) < 4 ? (0x0383C + ((_n) * 0x100)) \
+                    : (0x0E03C + ((_n) * 0x40)))
+
+/* TXDCTL & RXDCTL */
+#define E1000_TXDCTL_QUEUE_ENABLE  0x02000000 /* Enable specific Tx Queue */
+#define E1000_RXDCTL_QUEUE_ENABLE  0x02000000 /* Enable specific Rx Queue */
+
 /* RSS registers */
 #define E1000_CPUVEC    0x02C10 /* CPU Vector Register - RW */
 #define E1000_MRQC      0x05818 /* Multiple Receive Control - RW */
@@ -400,18 +479,31 @@
 #define E1000_RETA_VAL(reta, hash)  (((uint8_t *)(reta))[E1000_RETA_IDX(hash)])
 #define E1000_RSS_QUEUE(reta, hash) ((E1000_RETA_VAL(reta, hash) & BIT(7)) >> 7)
 
-#define E1000_MRQC_EN_TCPIPV4(mrqc) ((mrqc) & BIT(16))
-#define E1000_MRQC_EN_IPV4(mrqc)    ((mrqc) & BIT(17))
-#define E1000_MRQC_EN_TCPIPV6(mrqc) ((mrqc) & BIT(18))
-#define E1000_MRQC_EN_IPV6EX(mrqc)  ((mrqc) & BIT(19))
-#define E1000_MRQC_EN_IPV6(mrqc)    ((mrqc) & BIT(20))
-
-#define E1000_MRQ_RSS_TYPE_NONE     (0)
-#define E1000_MRQ_RSS_TYPE_IPV4TCP  (1)
-#define E1000_MRQ_RSS_TYPE_IPV4     (2)
-#define E1000_MRQ_RSS_TYPE_IPV6TCP  (3)
-#define E1000_MRQ_RSS_TYPE_IPV6EX   (4)
-#define E1000_MRQ_RSS_TYPE_IPV6     (5)
+#define E1000_MRQC_EN_TCPIPV4(mrqc)         ((mrqc) & BIT(16))
+#define E1000_MRQC_EN_IPV4(mrqc)            ((mrqc) & BIT(17))
+#define E1000_MRQC_EN_TCPIPV6(mrqc)         ((mrqc) & BIT(18))
+#define E1000_MRQC_EN_TCPIPV6EX_IGB(mrqc)   ((mrqc) & BIT(18))
+#define E1000_MRQC_EN_IPV6EX(mrqc)          ((mrqc) & BIT(19))
+#define E1000_MRQC_EN_IPV6(mrqc)            ((mrqc) & BIT(20))
+#define E1000_MRQC_EN_TCPIPV6_IGB(mrqc)     ((mrqc) & BIT(21))
+#define E1000_MRQC_EN_UDPIPV4(mrqc)         ((mrqc) & BIT(22))
+#define E1000_MRQC_EN_UDPIPV6(mrqc)         ((mrqc) & BIT(23))
+#define E1000_MRQC_EN_UDPIPV6EX(mrqc)       ((mrqc) & BIT(24))
+
+#define E1000_MRQC_ENABLE_RSS_MQ            0x00000002
+#define E1000_MRQC_ENABLE_VMDQ              0x00000003
+#define E1000_MRQC_ENABLE_VMDQ_RSS_MQ       0x00000005
+
+#define E1000_MRQ_RSS_TYPE_NONE      (0)
+#define E1000_MRQ_RSS_TYPE_IPV4TCP   (1)
+#define E1000_MRQ_RSS_TYPE_IPV4      (2)
+#define E1000_MRQ_RSS_TYPE_IPV6TCP   (3)
+#define E1000_MRQ_RSS_TYPE_IPV6EX    (4)
+#define E1000_MRQ_RSS_TYPE_IPV6      (5)
+#define E1000_MRQ_RSS_TYPE_IPV6TCPEX (6)
+#define E1000_MRQ_RSS_TYPE_IPV4UDP   (7)
+#define E1000_MRQ_RSS_TYPE_IPV6UDP   (8)
+#define E1000_MRQ_RSS_TYPE_IPV6UDPEX (9)
 
 #define E1000_ICR_ASSERTED BIT(31)
 #define E1000_EIAC_MASK    0x01F00000
@@ -419,6 +511,8 @@
 /* [TR]DBAL and [TR]DLEN masks */
 #define E1000_XDBAL_MASK            (~(BIT(4) - 1))
 #define E1000_XDLEN_MASK            ((BIT(20) - 1) & (~(BIT(7) - 1)))
+#define E1000_XDBAL_IGB_MASK        (~(BIT(7) - 1))
+#define E1000_XDLEN_IGB_MASK        ((BIT(20) - 1) & (~(BIT(7) - 1)))
 
 /* IVAR register parsing helpers */
 #define E1000_IVAR_INT_ALLOC_VALID  (0x8)
@@ -539,6 +633,8 @@
 #define M88E1000_PHY_VCO_REG_BIT8  0x100 /* Bits 8 & 11 are adjusted for */
 #define M88E1000_PHY_VCO_REG_BIT11 0x800    /* improved BER performance */
 
+#define IGP01E1000_PHY_PAGE_SELECT        0x1F /* Page Select */
+
 /* PHY Control Register */
 #define MII_CR_SPEED_SELECT_MSB 0x0040 /* bits 6,13: 10=1000, 01=100, 00=10 */
 #define MII_CR_COLL_TEST_ENABLE 0x0080 /* Collision test enable */
@@ -579,6 +675,8 @@
 #define E1000_ICR_RXDMT0        0x00000010 /* rx desc min. threshold (0) */
 #define E1000_ICR_RXO           0x00000040 /* rx overrun */
 #define E1000_ICR_RXT0          0x00000080 /* rx timer intr (ring 0) */
+#define E1000_ICR_RXDW          0x00000080 /* rx timer intr (ring 0) */
+#define E1000_ICR_VMMB          0x00000100 /* VM MB event */
 #define E1000_ICR_MDAC          0x00000200 /* MDIO access complete */
 #define E1000_ICR_RXCFG         0x00000400 /* RX /c/ ordered set */
 #define E1000_ICR_GPI_EN0       0x00000800 /* GP Int 0 */
@@ -590,6 +688,7 @@
 #define E1000_ICR_ACK           0x00020000 /* Receive Ack frame */
 #define E1000_ICR_MNG           0x00040000 /* Manageability event */
 #define E1000_ICR_DOCK          0x00080000 /* Dock/Undock */
+#define E1000_ICR_MDDET         0x10000000 /* Malicious VM driver behavior */
 #define E1000_ICR_INT_ASSERTED  0x80000000 /* If this bit asserted, the driver should claim the interrupt */
 #define E1000_ICR_RXD_FIFO_PAR0 0x00100000 /* queue 0 Rx descriptor FIFO parity error */
 #define E1000_ICR_TXD_FIFO_PAR0 0x00200000 /* queue 0 Tx descriptor FIFO parity error */
@@ -622,6 +721,7 @@
 #define E1000_ICS_RXDMT0    E1000_ICR_RXDMT0    /* rx desc min. threshold */
 #define E1000_ICS_RXO       E1000_ICR_RXO       /* rx overrun */
 #define E1000_ICS_RXT0      E1000_ICR_RXT0      /* rx timer intr */
+#define E1000_ICS_RXDW      E1000_ICR_RXDW      /* rx timer intr */
 #define E1000_ICS_MDAC      E1000_ICR_MDAC      /* MDIO access complete */
 #define E1000_ICS_RXCFG     E1000_ICR_RXCFG     /* RX /c/ ordered set */
 #define E1000_ICS_GPI_EN0   E1000_ICR_GPI_EN0   /* GP Int 0 */
@@ -630,9 +730,10 @@
 #define E1000_ICS_GPI_EN3   E1000_ICR_GPI_EN3   /* GP Int 3 */
 #define E1000_ICS_TXD_LOW   E1000_ICR_TXD_LOW
 #define E1000_ICS_SRPD      E1000_ICR_SRPD
-#define E1000_ICS_ACK       E1000_ICR_ACK       /* Receive Ack frame */
-#define E1000_ICS_MNG       E1000_ICR_MNG       /* Manageability event */
-#define E1000_ICS_DOCK      E1000_ICR_DOCK      /* Dock/Undock */
+#define E1000_ICS_ACK       E1000_ICR_ACK   /* Receive Ack frame */
+#define E1000_ICS_MNG       E1000_ICR_MNG   /* Manageability event */
+#define E1000_ICS_DOCK      E1000_ICR_DOCK  /* Dock/Undock */
+#define E1000_ICS_MDDET     E1000_ICR_MDDET /* Malicious VM driver behavior */
 #define E1000_ICS_RXD_FIFO_PAR0 E1000_ICR_RXD_FIFO_PAR0 /* queue 0 Rx descriptor FIFO parity error */
 #define E1000_ICS_TXD_FIFO_PAR0 E1000_ICR_TXD_FIFO_PAR0 /* queue 0 Tx descriptor FIFO parity error */
 #define E1000_ICS_HOST_ARB_PAR  E1000_ICR_HOST_ARB_PAR  /* host arb read buffer parity error */
@@ -651,6 +752,7 @@
 #define E1000_IMS_RXDMT0    E1000_ICR_RXDMT0    /* rx desc min. threshold */
 #define E1000_IMS_RXO       E1000_ICR_RXO       /* rx overrun */
 #define E1000_IMS_RXT0      E1000_ICR_RXT0      /* rx timer intr */
+#define E1000_IMS_RXDW      E1000_ICR_RXDW      /* rx timer intr */
 #define E1000_IMS_MDAC      E1000_ICR_MDAC      /* MDIO access complete */
 #define E1000_IMS_RXCFG     E1000_ICR_RXCFG     /* RX /c/ ordered set */
 #define E1000_IMS_GPI_EN0   E1000_ICR_GPI_EN0   /* GP Int 0 */
@@ -706,6 +808,12 @@
 #define E1000_IMC_PHYINT    E1000_ICR_PHYINT
 #define E1000_IMC_EPRST     E1000_ICR_EPRST
 
+/* Extended Interrupt Cause Read */
+#define E1000_EICR_MASK         0x01FFFFFF /* EICR used bits in MSIX mode */
+
+/* Extended Interrupt Mask Set */
+#define E1000_EIMS_OTHER        E1000_EICR_OTHER   /* Interrupt Cause Active */
+
 /* Receive Control */
 #define E1000_RCTL_RST            0x00000001    /* Software reset */
 #define E1000_RCTL_EN             0x00000002    /* enable */
@@ -741,6 +849,7 @@
 #define E1000_RCTL_VFE            0x00040000    /* vlan filter enable */
 #define E1000_RCTL_CFIEN          0x00080000    /* canonical form enable */
 #define E1000_RCTL_CFI            0x00100000    /* canonical form indicator */
+#define E1000_RCTL_PSP            0x00200000    /* pad small receive packets */
 #define E1000_RCTL_DPF            0x00400000    /* discard pause frames */
 #define E1000_RCTL_PMCF           0x00800000    /* pass MAC control frames */
 #define E1000_RCTL_BSEX           0x02000000    /* Buffer size extension */
@@ -790,15 +899,16 @@
 #define E1000_CTRL_FORCE_PHY_RESET 0x00008000 /* Reset both PHY ports, through PHYRST_N pin */
 #define E1000_CTRL_SPD_SHIFT 8          /* Speed Select Shift */
 
-#define E1000_CTRL_EXT_ASDCHK  0x00001000 /* auto speed detection check */
-#define E1000_CTRL_EXT_EE_RST  0x00002000 /* EEPROM reset */
-#define E1000_CTRL_EXT_LINK_EN 0x00010000 /* enable link status from external LINK_0 and LINK_1 pins */
+#define E1000_CTRL_EXT_ASDCHK   0x00001000 /* auto speed detection check */
+#define E1000_CTRL_EXT_EE_RST   0x00002000 /* EEPROM reset */
+#define E1000_CTRL_EXT_PFRSTD   0x00004000 /* PF reset done indication */
+#define E1000_CTRL_EXT_LINK_EN  0x00010000 /* enable external link status */
 #define E1000_CTRL_EXT_DRV_LOAD 0x10000000 /* Driver loaded bit for FW */
-#define E1000_CTRL_EXT_EIAME   0x01000000
-#define E1000_CTRL_EXT_IAME    0x08000000 /* Int ACK Auto-mask */
-#define E1000_CTRL_EXT_PBA_CLR 0x80000000 /* PBA Clear */
+#define E1000_CTRL_EXT_EIAME    0x01000000
+#define E1000_CTRL_EXT_IAME     0x08000000 /* Int ACK Auto-mask */
+#define E1000_CTRL_EXT_PBA_CLR  0x80000000 /* PBA Clear */
 #define E1000_CTRL_EXT_INT_TIMERS_CLEAR_ENA 0x20000000
-#define E1000_CTRL_EXT_SPD_BYPS  0x00008000 /* Speed Select Bypass */
+#define E1000_CTRL_EXT_SPD_BYPS 0x00008000 /* Speed Select Bypass */
 
 #define E1000_CTRL_SWDPIN0  0x00040000  /* SWDPIN 0 value */
 #define E1000_CTRL_SWDPIN1  0x00080000  /* SWDPIN 1 value */
@@ -837,13 +947,14 @@
 #define E1000_STATUS_ASDV_100   0x00000100      /* ASDV 100Mb */
 #define E1000_STATUS_ASDV_1000  0x00000200      /* ASDV 1Gb */
 #define E1000_STATUS_DOCK_CI    0x00000800      /* Change in Dock/Undock state. Clear on write '0'. */
-#define E1000_STATUS_GIO_MASTER_ENABLE 0x00080000 /* Status of Master requests. */
 #define E1000_STATUS_MTXCKOK    0x00000400      /* MTX clock running OK */
 #define E1000_STATUS_PHYRA      0x00000400      /* PHY Reset Asserted */
 #define E1000_STATUS_PCI66      0x00000800      /* In 66Mhz slot */
 #define E1000_STATUS_BUS64      0x00001000      /* In 64 bit slot */
 #define E1000_STATUS_PCIX_MODE  0x00002000      /* PCI-X mode */
 #define E1000_STATUS_PCIX_SPEED 0x0000C000      /* PCI-X bus speed */
+#define E1000_STATUS_IOV_MODE   0x00040000      /* VFE enable bit in IOV cap */
+#define E1000_STATUS_GIO_MASTER_ENABLE 0x00080000 /* Master request enable */
 #define E1000_STATUS_BMC_SKU_0  0x00100000 /* BMC USB redirect disabled */
 #define E1000_STATUS_BMC_SKU_1  0x00200000 /* BMC SRAM disabled */
 #define E1000_STATUS_BMC_SKU_2  0x00400000 /* BMC SDRAM disabled */
@@ -856,6 +967,7 @@
 #define E1000_STATUS_SERDES1_DIS  0x20000000 /* SERDES disabled on port 1 */
 #define E1000_STATUS_SPEED_SHIFT  6
 #define E1000_STATUS_ASDV_SHIFT   8
+#define E1000_STATUS_NUM_VFS_SHIFT 14
 
 /* EEPROM/Flash Control */
 #define E1000_EECD_SK        0x00000001 /* EEPROM Clock */
@@ -920,6 +1032,9 @@
 /* Delay increments in nanoseconds for interrupt throttling registers */
 #define E1000_INTR_THROTTLING_NS_RES (256)
 
+/* Delay increments in microseconds for interrupt throttling registers */
+#define E1000_INTR_THROTTLING_US_RES (1)
+
 /* EEPROM Commands - Microwire */
 #define EEPROM_READ_OPCODE_MICROWIRE  0x6  /* EEPROM read opcode */
 #define EEPROM_WRITE_OPCODE_MICROWIRE 0x5  /* EEPROM write opcode */
@@ -1007,6 +1122,58 @@ struct e1000_tx_desc {
 #define E1000_TXD_STAT_TC    0x00000004 /* Tx Underrun */
 #define E1000_TXD_EXTCMD_TSTAMP 0x00000010 /* IEEE1588 Timestamp packet */
 
+/* Transmit Descriptor - Advanced */
+union e1000_adv_tx_desc {
+    struct {
+        uint64_t buffer_addr;    /* Address of descriptor's data buf */
+        uint32_t cmd_type_len;
+        uint32_t olinfo_status;
+    } read;
+    struct {
+        uint64_t rsvd;       /* Reserved */
+        uint32_t nxtseq_seed;
+        uint32_t status;
+    } wb;
+};
+
+/* Context descriptors */
+struct e1000_adv_tx_context_desc {
+    uint32_t vlan_macip_lens;
+    uint32_t seqnum_seed;
+    uint32_t type_tucmd_mlhl;
+    uint32_t mss_l4len_idx;
+};
+
+/* Adv Transmit Descriptor Config Masks */
+#define E1000_ADVTXD_STA_DD       0x00000001 /* Descriptor Done */
+#define E1000_ADVTXD_MAC_TSTAMP   0x00080000 /* IEEE1588 Timestamp packet */
+#define E1000_ADVTXD_DTYP_CTXT    0x00200000 /* Advanced Context Descriptor */
+#define E1000_ADVTXD_DTYP_DATA    0x00300000 /* Advanced Data Descriptor */
+#define E1000_ADVTXD_DCMD_EOP     0x01000000 /* End of Packet */
+#define E1000_ADVTXD_DCMD_IFCS    0x02000000 /* Insert FCS (Ethernet CRC) */
+#define E1000_ADVTXD_DCMD_RS      0x08000000 /* Report Status */
+#define E1000_ADVTXD_DCMD_DEXT    0x20000000 /* Descriptor extension (1=Adv) */
+#define E1000_ADVTXD_DCMD_VLE     0x40000000 /* VLAN pkt enable */
+#define E1000_ADVTXD_DCMD_TSE     0x80000000 /* TCP Seg enable */
+#define E1000_ADVTXD_IDX_MASK     0x07 /* Adv desc POPTS mask */
+#define E1000_ADVTXD_IDX_SHIFT    4 /* Adv desc POPTS shift */
+#define E1000_ADVTXD_POPTS_MASK   0x07 /* Adv desc POPTS mask */
+#define E1000_ADVTXD_POPTS_SHIFT  8 /* Adv desc POPTS shift */
+#define E1000_ADVTXD_PAYLEN_SHIFT 14 /* Adv desc PAYLEN shift */
+
+#define E1000_ADVTXD_MACLEN_SHIFT    9  /* Adv ctxt desc mac len shift */
+#define E1000_ADVTXD_TUCMD_SHIFT     9  /* Adv ctx desc tucmd shift */
+#define E1000_ADVTXD_TUCMD_MASK      (BIT(12) - 1)
+#define E1000_ADVTXD_TUCMD_IPV4      0x01  /* IP Packet Type: 1=IPv4 */
+#define E1000_ADVTXD_TUCMD_L4T_UDP   0x00  /* L4 Packet TYPE of UDP */
+#define E1000_ADVTXD_TUCMD_L4T_TCP   0x01  /* L4 Packet TYPE of TCP */
+#define E1000_ADVTXD_TUCMD_L4T_SCTP  0x02 /* L4 packet TYPE of SCTP */
+/* IPSec Encrypt Enable for ESP */
+#define E1000_ADVTXD_L4LEN_SHIFT     8  /* Adv ctxt L4LEN shift */
+#define E1000_ADVTXD_MSS_SHIFT      16  /* Adv ctxt MSS shift */
+/* Adv ctxt IPSec SA IDX mask */
+/* Adv ctxt IPSec ESP len mask */
+
 /* Transmit Control */
 #define E1000_TCTL_RST    0x00000001    /* software reset */
 #define E1000_TCTL_EN     0x00000002    /* enable tx */
@@ -1055,6 +1222,34 @@ union e1000_rx_desc_extended {
     } wb;                           /* writeback */
 };
 
+/* Receive Descriptor - Advanced */
+union e1000_adv_rx_desc {
+    struct {
+        uint64_t pkt_addr;             /* Packet buffer address */
+        uint64_t hdr_addr;             /* Header buffer address */
+    } read;
+    struct {
+        struct {
+            struct {
+                uint16_t pkt_info;   /* RSS type, Packet type */
+                uint16_t hdr_info;   /* Split Head, buf len */
+            } lo_dword;
+            union {
+                uint32_t rss;          /* RSS Hash */
+                struct {
+                    uint16_t ip_id;    /* IP id */
+                    uint16_t csum;     /* Packet Checksum */
+                } csum_ip;
+            } hi_dword;
+        } lower;
+        struct {
+            uint32_t status_error;     /* ext status/error */
+            uint16_t length;           /* Packet length */
+            uint16_t vlan;             /* VLAN tag */
+        } upper;
+    } wb;  /* writeback */
+};
+
 #define MAX_PS_BUFFERS 4
 
 /* Number of packet split data buffers (not including the header buffer) */
@@ -1094,6 +1289,7 @@ union e1000_rx_desc_packet_split {
 /* Receive Checksum Control bits */
 #define E1000_RXCSUM_IPOFLD     0x100   /* IP Checksum Offload Enable */
 #define E1000_RXCSUM_TUOFLD     0x200   /* TCP/UDP Checksum Offload Enable */
+#define E1000_RXCSUM_CRCOFLD    0x800   /* CRC32 offload enable */
 #define E1000_RXCSUM_PCSD       0x2000  /* Packet Checksum Disable */
 
 #define E1000_RING_DESC_LEN       (16)
@@ -1114,6 +1310,7 @@ union e1000_rx_desc_packet_split {
 #define E1000_RXD_STAT_IPIDV    0x200   /* IP identification valid */
 #define E1000_RXD_STAT_UDPV     0x400   /* Valid UDP checksum */
 #define E1000_RXD_STAT_ACK      0x8000  /* ACK Packet indication */
+#define E1000_RXD_STAT_TS       0x10000 /* Pkt was time stamped */
 #define E1000_RXD_ERR_CE        0x01    /* CRC Error */
 #define E1000_RXD_ERR_SE        0x02    /* Symbol Error */
 #define E1000_RXD_ERR_SEQ       0x04    /* Sequence Error */
@@ -1148,7 +1345,9 @@ union e1000_rx_desc_packet_split {
 #define E1000_RXDPS_HDRSTAT_HDRLEN_MASK  0x000003FF
 
 /* Receive Address */
-#define E1000_RAH_AV  0x80000000        /* Receive descriptor valid */
+#define E1000_RAH_AV            0x80000000 /* Receive descriptor valid */
+#define E1000_RAH_POOL_MASK     0x03FC0000
+#define E1000_RAH_POOL_SHIFT    18
 
 /* Offload Context Descriptor */
 struct e1000_context_desc {
@@ -1213,7 +1412,7 @@ struct e1000_data_desc {
 #define E1000_MANC_NEIGHBOR_EN   0x00004000 /* Enable Neighbor Discovery
                                              * Filtering */
 #define E1000_MANC_ARP_RES_EN    0x00008000 /* Enable ARP response Filtering */
-#define E1000_MANC_DIS_IP_CHK_ARP  0x10000000 /* Disable IP address chacking */
+#define E1000_MANC_DIS_IP_CHK_ARP  0x10000000 /* Disable IP address checking */
                                               /*for ARP packets - in 82574 */
 #define E1000_MANC_TCO_RESET     0x00010000 /* TCO Reset Occurred */
 #define E1000_MANC_RCV_TCO_EN    0x00020000 /* Receive TCO Packets Enabled */
@@ -1248,4 +1447,110 @@ struct e1000_data_desc {
 #define E1000_IOADDR 0x00
 #define E1000_IODATA 0x04
 
+#define IGP01E1000_PHY_PAGE_SELECT        0x1F /* Page Select */
+
+/* SW Semaphore Register */
+#define E1000_SWSM_SMBI         0x00000001 /* Driver Semaphore bit */
+#define E1000_SWSM_SWESMBI      0x00000002 /* FW Semaphore bit */
+
+/* VT Registers */
+#define E1000_MBVFICR   0x00C80 /* Mailbox VF Cause - RWC */
+#define E1000_MBVFIMR   0x00C84 /* Mailbox VF int Mask - RW */
+#define E1000_VFLRE     0x00C88 /* VF Register Events - RWC */
+#define E1000_VFRE      0x00C8C /* VF Receive Enables */
+#define E1000_VFTE      0x00C90 /* VF Transmit Enables */
+#define E1000_QDE       0x02408 /* Queue Drop Enable - RW */
+#define E1000_DTXSWC    0x03500 /* DMA Tx Switch Control - RW */
+#define E1000_WVBR      0x03554 /* VM Wrong Behavior - RWS */
+#define E1000_RPLOLR    0x05AF0 /* Replication Offload - RW */
+#define E1000_UTA       0x0A000 /* Unicast Table Array - RW */
+#define E1000_IOVTCL    0x05BBC /* IOV Control Register */
+#define E1000_TXSWC     0x05ACC /* Tx Switch Control */
+#define E1000_LVMMC     0x03548 /* Last VM Misbehavior cause */
+/* These act per VF so an array friendly macro is used */
+#define E1000_P2VMAILBOX(_n)   (0x00C00 + (4 * (_n)))
+#define E1000_V2PMAILBOX(_n)   (0x00C40 + (4 * (_n)))
+#define E1000_VMBMEM(_n)       (0x00800 + (64 * (_n)))
+#define E1000_VMOLR(_n)        (0x05AD0 + (4 * (_n)))
+#define E1000_VLVF(_n)         (0x05D00 + (4 * (_n))) /* VLAN VM Filter */
+#define E1000_VMVIR(_n)        (0x03700 + (4 * (_n)))
+
+/* VT stats */
+/* Statistics registers */
+#define E1000_VFGPRC    0x00F10
+#define E1000_VFGORC    0x00F18
+#define E1000_VFMPRC    0x00F3C
+#define E1000_VFGPTC    0x00F14
+#define E1000_VFGOTC    0x00F34
+#define E1000_VFGOTLBC  0x00F50
+#define E1000_VFGPTLBC  0x00F44
+#define E1000_VFGORLBC  0x00F48
+#define E1000_VFGPRLBC  0x00F40
+
+#define E1000_P2VMAILBOX_STS    0x00000001 /* Initiate message send to VF */
+#define E1000_P2VMAILBOX_ACK    0x00000002 /* Ack message recv'd from VF */
+#define E1000_P2VMAILBOX_VFU    0x00000004 /* VF owns the mailbox buffer */
+#define E1000_P2VMAILBOX_PFU    0x00000008 /* PF owns the mailbox buffer */
+#define E1000_P2VMAILBOX_RVFU   0x00000010 /* Reset VFU - used when VF stuck */
+#define E1000_P2VMAILBOX_RO_BITS 0x04      /* Read-only bits */
+#define E1000_P2VMAILBOX_WO_BITS 0x13      /* Write-only bits, read as zero */
+
+#define E1000_MBVFICR_VFREQ_MASK 0x000000FF /* bits for VF messages */
+#define E1000_MBVFICR_VFREQ_VF1  0x00000001 /* bit for VF 1 message */
+#define E1000_MBVFICR_VFACK_MASK 0x00FF0000 /* bits for VF acks */
+#define E1000_MBVFICR_VFACK_VF1  0x00010000 /* bit for VF 1 ack */
+
+#define E1000_V2PMAILBOX_REQ    0x00000001 /* Request for PF Ready bit */
+#define E1000_V2PMAILBOX_ACK    0x00000002 /* Ack PF message received */
+#define E1000_V2PMAILBOX_VFU    0x00000004 /* VF owns the mailbox buffer */
+#define E1000_V2PMAILBOX_PFU    0x00000008 /* PF owns the mailbox buffer */
+#define E1000_V2PMAILBOX_PFSTS  0x00000010 /* PF wrote a message in the MB */
+#define E1000_V2PMAILBOX_PFACK  0x00000020 /* PF ack the previous VF msg */
+#define E1000_V2PMAILBOX_RSTI   0x00000040 /* PF has reset indication */
+#define E1000_V2PMAILBOX_RSTD   0x00000080 /* PF has indicated reset done */
+#define E1000_V2PMAILBOX_R2C_BITS 0x000000B0 /* All read to clear bits */
+#define E1000_V2PMAILBOX_RO_BITS 0xB8      /* Read-only bits */
+#define E1000_V2PMAILBOX_WO_BITS 0x03      /* Write-only bits, read as zero */
+#define E1000_VFMAILBOX_SIZE     16        /* 16 32 bit words - 64 bytes */
+
+/* Per VM Offload register setup */
+#define E1000_VMOLR_RLPML_MASK 0x00003FFF /* Long Packet Maximum Length mask */
+#define E1000_VMOLR_LPE        0x00010000 /* Accept Long packet */
+#define E1000_VMOLR_RSSE       0x00020000 /* Enable RSS */
+#define E1000_VMOLR_AUPE       0x01000000 /* Accept untagged packets */
+#define E1000_VMOLR_ROMPE      0x02000000 /* Accept overflow multicast */
+#define E1000_VMOLR_ROPE       0x04000000 /* Accept overflow unicast */
+#define E1000_VMOLR_BAM        0x08000000 /* Accept Broadcast packets */
+#define E1000_VMOLR_MPME       0x10000000 /* Multicast promiscuous mode */
+#define E1000_VMOLR_STRVLAN    0x40000000 /* Vlan stripping enable */
+#define E1000_VMOLR_STRCRC     0x80000000 /* CRC stripping enable */
+
+/* Replicated packet offload */
+#define E1000_RPLOLR_STRVLAN   0x40000000
+#define E1000_RPLOLR_STRCRC    0x80000000
+
+/* Easy defines for setting default pool, would normally be left a zero */
+#define E1000_VT_CTL_DEFAULT_POOL_SHIFT 7
+#define E1000_VT_CTL_DEFAULT_POOL_MASK  (0x7 << E1000_VT_CTL_DEFAULT_POOL_SHIFT)
+
+/* Other useful VMD_CTL register defines */
+#define E1000_VT_CTL_IGNORE_MAC         BIT(28)
+#define E1000_VT_CTL_DISABLE_DEF_POOL   BIT(29)
+#define E1000_VT_CTL_VM_REPL_EN         BIT(30)
+
+#define E1000_VLVF_ARRAY_SIZE     32
+#define E1000_VLVF_VLANID_MASK    0x00000FFF
+#define E1000_VLVF_POOLSEL_SHIFT  12
+#define E1000_VLVF_POOLSEL_MASK   0xFF
+#define E1000_VLVF_LVLAN          0x00100000
+#define E1000_VLVF_VLANID_ENABLE  0x80000000
+
+#define E1000_VMVIR_VLANA_DEFAULT      0x40000000 /* Always use default VLAN */
+#define E1000_VMVIR_VLANA_NEVER        0x80000000 /* Never insert VLAN tag */
+
+#define E1000_DTXSWC_MAC_SPOOF_SHIFT   0  /* Per VF MAC spoof control */
+#define E1000_DTXSWC_VLAN_SPOOF_SHIFT  8  /* Per VF VLAN spoof control */
+#define E1000_DTXSWC_LLE_SHIFT         16 /* Per VF Local LB enables */
+#define E1000_DTXSWC_VMDQ_LOOPBACK_EN BIT(31)  /* global VF LB enable */
+
 #endif /* HW_E1000_REGS_H */
diff --git a/hw/net/e1000x_common.c b/hw/net/e1000x_common.c
index a8d93870b5..3b6a291838 100644
--- a/hw/net/e1000x_common.c
+++ b/hw/net/e1000x_common.c
@@ -72,6 +72,19 @@ bool e1000x_rx_group_filter(uint32_t *mac, const uint8_t *buf)
             return true;
         }
     }
+    for (rp = mac + RA2; rp < mac + RA2 + 16; rp += 2) {
+        if (!(rp[1] & E1000_RAH_AV)) {
+            continue;
+        }
+        ra[0] = cpu_to_le32(rp[0]);
+        ra[1] = cpu_to_le32(rp[1]);
+        if (!memcmp(buf, (uint8_t *)ra, 6)) {
+            trace_e1000x_rx_flt_ucast_match((int)(rp - mac - RA2) / 2,
+                                            MAC_ARG(buf));
+            return true;
+        }
+    }
+
     trace_e1000x_rx_flt_ucast_mismatch(MAC_ARG(buf));
 
     f = mta_shift[(rctl >> E1000_RCTL_MO_SHIFT) & 3];
diff --git a/hw/net/e1000x_common.h b/hw/net/e1000x_common.h
index b7742775c4..ac0c19b1aa 100644
--- a/hw/net/e1000x_common.h
+++ b/hw/net/e1000x_common.h
@@ -27,7 +27,19 @@
 
 #include "e1000_regs.h"
 
+#define concat(x, y)         x ## y
+#define expand_concat(x, y)  concat(x, y)
+
 #define defreg(x)   x = (E1000_##x >> 2)
+#define defreg_arr8(x) expand_concat(x, 0) = (E1000_##x(0) >> 2), \
+                       expand_concat(x, 1) = (E1000_##x(1) >> 2), \
+                       expand_concat(x, 2) = (E1000_##x(2) >> 2), \
+                       expand_concat(x, 3) = (E1000_##x(3) >> 2), \
+                       expand_concat(x, 4) = (E1000_##x(4) >> 2), \
+                       expand_concat(x, 5) = (E1000_##x(5) >> 2), \
+                       expand_concat(x, 6) = (E1000_##x(6) >> 2), \
+                       expand_concat(x, 7) = (E1000_##x(7) >> 2)
+
 enum {
     defreg(CTRL),    defreg(EECD),    defreg(EERD),    defreg(GPRC),
     defreg(GPTC),    defreg(ICR),     defreg(ICS),     defreg(IMC),
@@ -91,6 +103,23 @@ enum {
     defreg(TSYNCRXCTL),
     defreg(TSYNCTXCTL),
 
+    defreg(FWSM),   defreg(SW_FW_SYNC), defreg(GPIE),    defreg(EIAC_IGB),
+    defreg(EICR),   defreg(EICS),       defreg(EIMS),    defreg(EIAM),
+    defreg(EIMC),   defreg(IVAR_IGB),   defreg(IVAR_MISC_IGB),
+    defreg(SRRCTL), defreg(MBVFICR),    defreg(MBVFIMR), defreg(VFLRE),
+    defreg(VFRE),   defreg(VFTE),       defreg(RA2),     defreg(VT_CTL),
+    defreg(UTA),    defreg(RPLOLR),     defreg(DTXSWC),  defreg(RLPML),
+    defreg(WVBR),   defreg(EITR_IGB),
+
+    /* stats */
+    defreg(VFGPRC), defreg(VFGORC), defreg(VFMPRC), defreg(VFGPTC),
+    defreg(VFGOTC), defreg(VFGOTLBC), defreg(VFGPTLBC), defreg(VFGORLBC),
+    defreg(VFGPRLBC),
+
+    /* arrays */
+    defreg_arr8(VMBMEM), defreg_arr8(VMOLR), defreg_arr8(VLVF),
+    defreg_arr8(VMVIR), defreg_arr8(P2VMAILBOX), defreg_arr8(V2PMAILBOX),
+
     /* Aliases */
     defreg(RDH0_A),  defreg(RDT0_A),  defreg(RDTR_A),  defreg(RDFH_A),
     defreg(RDFT_A),  defreg(TDH_A),   defreg(TDT_A),   defreg(TIDV_A),
-- 
2.34.1


