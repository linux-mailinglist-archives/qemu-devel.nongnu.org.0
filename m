Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BE7FF654365
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Dec 2022 15:52:47 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p8Mp9-0008DP-4M; Thu, 22 Dec 2022 09:45:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sriram.yagnaraman@est.tech>)
 id 1p8Jyk-0008Ua-OU
 for qemu-devel@nongnu.org; Thu, 22 Dec 2022 06:43:14 -0500
Received: from mail-he1eur01on2093.outbound.protection.outlook.com
 ([40.107.13.93] helo=EUR01-HE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sriram.yagnaraman@est.tech>)
 id 1p8Jyh-0007l2-BF
 for qemu-devel@nongnu.org; Thu, 22 Dec 2022 06:43:14 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jNxWu/3lZezNWMZImCrn/jPY86qd24Cz3B4Ck/2B936p0SQh9gAMtbWRfp6oQiN3RgzaxYnjE/1f0f5sJk0yIzC1wxd9rMeAlxlbDSDVQ8fOlaywrTWVRhM7XPhnR00OYBM5mpYim9adER/kd0+2JbkIBbqxeMdbDRIjCLNcz0VXKHk2GwANeMXcxT42mMBw2HW7O+59/Ume+tlBXdukA5L5n+JMhbva86K55itdvLmyM673IWejW2aD3+5JCrSD/gu+XINmOJuYWFCSM82WVzVr7tT7ExUzC/wM90XPrP0pFKepFmub53aFUY5JUh6Hd0qNi3CHCEBkRTEfLcpuIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xEiQFfASTRYzpu3mUGgY/uB9ne8dQs3BTxk/dEStPB8=;
 b=C8xlgV1TTIkjnr5j+qFtpUZ6LSkaCpYjDznX+6OIPnMtuXZDenwc8Utf1XXMeDtuwbRAdp67f/oDT3/hQ+/SIs5SUfRfihbkt0r/Nd7XPbt7Nmvm8sgRKZ+G/jpiS/X6//4ZQ8uOAZG7CMdPeq+qMcy+4BvjZ+/HotQGNBm/TS0QlxlmXcNPgibUtY4XiYCPB62HQZNl+fVA9YXCUi2+yupACxht5NCJZ3h4875g53/9oa6rX1Y7p/I2WtclOEV+ibgqi6LM9Yybh4MHwGAEHlhrgXkC0kcT2AiUKreHcHQiVrM8fAA88e2tT8gAf3VeVbjK/Sy6u9/EazGYQ3vhxA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=estab.onmicrosoft.com; 
 s=selector2-estab-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xEiQFfASTRYzpu3mUGgY/uB9ne8dQs3BTxk/dEStPB8=;
 b=jQZh8XfqhJc1GcsE3l4pXm+hY/wKLTBMPmNXF3p7xL+Y4vK+x6NrIdPSGJ7YXwTrvlsQntfNpyS/mHDfhKALa0p+E7eEzlP2XTFMOnFNAH/jEHiMjJ+itnfdQCZu2PnG3guCckJeJqlU5B9NslcKXe9C5GI0GchrreA/Ghf7wwU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from DBBP189MB1433.EURP189.PROD.OUTLOOK.COM (2603:10a6:10:1e7::15)
 by AS2P189MB2317.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:5e5::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5944.11; Thu, 22 Dec
 2022 11:43:07 +0000
Received: from DBBP189MB1433.EURP189.PROD.OUTLOOK.COM
 ([fe80::8f70:435b:ab64:9420]) by DBBP189MB1433.EURP189.PROD.OUTLOOK.COM
 ([fe80::8f70:435b:ab64:9420%3]) with mapi id 15.20.5944.006; Thu, 22 Dec 2022
 11:43:07 +0000
From: Sriram Yagnaraman <sriram.yagnaraman@est.tech>
To: qemu-devel@nongnu.org, Dmitry Fleytman <dmitry.fleytman@gmail.com>,
 Jason Wang <jasowang@redhat.com>, "Michael S . Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
Cc: Sriram Yagnaraman <sriram.yagnaraman@est.tech>
Subject: [PATCH 3/5] hw/net/igb: register definitions
Date: Thu, 22 Dec 2022 12:41:18 +0100
Message-Id: <20221222114120.8790-4-sriram.yagnaraman@est.tech>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221222114120.8790-1-sriram.yagnaraman@est.tech>
References: <20221222114120.8790-1-sriram.yagnaraman@est.tech>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: GV2PEPF000000F2.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:144:1:0:1:0:d) To DBBP189MB1433.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:10:1e7::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DBBP189MB1433:EE_|AS2P189MB2317:EE_
X-MS-Office365-Filtering-Correlation-Id: 34012085-393e-48b7-ec65-08dae411b1c4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: UotPfTHGQdzDcIB+aOrHyr4I/RBBlqQefVx/vKj1ax5ncXiAzpimJjbNeXhTS2Ev2QPx9aJEla79CZ8IEddOOP8fVZiO+v/6883NiFtoU+ymJCgmgin5ZxkGXkmuhmuRgmnFqlAvKSjhmGeydpzx+58We9+0a8o9X42arrRmPpDy84mlVpqcQ5pEj8WpjYXBVnX5cMDe05iWEWYzANfb8wZRihWhlcMo7+6KDS2oF2uK8g69MOZNuE9NGrcMzev1cTZ2xszX/VQJHBNTkY52jnQK5IcIMNFuH0QZYOhX/+a7milAcaiH12tyX4+Wdb+OuW2d7yUxoWeut89IQ4PI+ObMuvnCzEx8inPPPFRLZ2kdKnQ/kfDcVXE/YuddHHRI4rjiGGWvAApTAr2bRgr9eX6kXWvEF4Tvbh9tqOJn3kiJo+k0dMG7M3foyYtbpJBuJTM4h3aLdNjE6M8Np8aQrz9iLKw2vjvP0jQKfYefn4y4s7+T1eA1CwLOzidBzsxrNsjYLXcG+Mx2wXU+wZleWOr8+OnHWXdR6T+apeUXFOV1XD8Rj+O2nzBGG6WLbltAhl2+TvTKw3lBbToLvF8L34NCSMVZaCJ+KakDIlPckYA4TLjwUCr5mV1pdwLaUOFX0/IzP/z89AU7VR4b9PK9xl16UCMPwzb9X08RddeFO7T2F8BDLrymdWjYIZN+qeSa
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DBBP189MB1433.EURP189.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230022)(376002)(396003)(346002)(39830400003)(136003)(451199015)(83380400001)(86362001)(1076003)(2906002)(44832011)(38100700002)(41300700001)(30864003)(8936002)(5660300002)(66946007)(478600001)(6666004)(6506007)(6486002)(2616005)(26005)(186003)(6512007)(4326008)(70586007)(66476007)(8676002)(316002)(66556008)(110136005)(36756003)(37730700002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Tl3teNOvQR6eTsge1zD9zJ0Gbp26WRpLIO2G163N/WwvMQZNov5ud1Xj5tS9?=
 =?us-ascii?Q?cX5+Ao+K75gqi0kd4ZZqSzWa9+oVOgFehwwmWCERutF3f4kL1a03EQL0MAZI?=
 =?us-ascii?Q?Kv+HlIk6bp/UZS7hukoOl+ctqCOsNU0afvd0bbkHJ5LOa2WQoRR1vmK3ybMJ?=
 =?us-ascii?Q?oXoXuCHGD2UdBzquCEK0Zsmh5xWMq1Vn8g3uCBBtvgPOhQBloWRWi+f6BsY9?=
 =?us-ascii?Q?4hI419lG+RnpY0+aQbRVaMJ5PFQAixWcgJ1XmHPDFG7mugaTfqaIlNKZNB4N?=
 =?us-ascii?Q?BEPSko5/WDm3V0zlopaCjpKq7BWng3OcJGI+QhIvn6Viz5xbMV3XPsnSmtuy?=
 =?us-ascii?Q?hha4J8EPGN6yXoQ5JqzEwoZCNNdcNSnZms0SRwYLc8GDiDZD12V4SpmW1vXp?=
 =?us-ascii?Q?O3pRuPglBLQb6HS3xVLdJkN1pfiGh3zswy2Q3mwbYL5QFaC7ZnHiazTVimT3?=
 =?us-ascii?Q?GzJK2HQS38vFmL5OHQC6POumLMwxSRhK28FG9JS0NbMDxMUSwJZzoh9sFos+?=
 =?us-ascii?Q?M6ghMPo0ZvC5tG4nBRPYf4kXYEMpdzsNr2t6yZZLa9KG3FhaogzjysABVsQ/?=
 =?us-ascii?Q?UmE7nEJTnJSrZxM/e2k3hPpzgzALAvUw0taXEaF7Zzds8aPUBBfHBNUXSu3n?=
 =?us-ascii?Q?Q0in27cxdRUPa4ND8zxJ1Z0poA74haglO8yt9QkFyWPGQJJDeWiSjNLfma3O?=
 =?us-ascii?Q?+eiqy2gyQc9itdhijP2rqjTmqw8XiCVC6EMQgbFPF6tez5shFKpOEE01BnxY?=
 =?us-ascii?Q?O6a4JG/M/NF/kAQsZLnq1OAw/Hc1CrNsKMb4kVYqXf46kfnynFrw8L1ebeS5?=
 =?us-ascii?Q?csf9z16UdiA454dLepAyVJN9uS1XFzeKLIAbxjUzDO72tDpZciOy3t2qgbNe?=
 =?us-ascii?Q?P5O1AaPiC+FnGpfuQgx01n5gjtTQZojZQ9AeHnz7cuI3XJuucFLmKaPwbPWx?=
 =?us-ascii?Q?QDvCqyEFgQBYfam02Sp4hXYDUt8hD8bYJK/RdZoxZtWDJ8DKBGF5lobVfJnj?=
 =?us-ascii?Q?v1ltPL0+s4pofJlGj/ig6Qx9O34yKXYK73irX1gcDMBJ4o8bLdP0A+onKnq9?=
 =?us-ascii?Q?r85c95o1/IAsNAu4UVFFYKDzkpgCE404syxJKcILzQYMzK1h4GCdiu6r8KkB?=
 =?us-ascii?Q?MW4lfaSsdAARwWdO7k2A7lvWi6TxbsibSzOrrYPssROIuZU2UP3aYyWzMc2Z?=
 =?us-ascii?Q?ssIP71029dEn2+TZa7SuQ+kRgLRWxf7Az+gneyAoZrQRHdw6IGETZlk7mcLx?=
 =?us-ascii?Q?gyojNTwZUqctkIxN2/Ajg87f77S8/ZcbOCkAhwtcNlJ4yCGrx+MNS0ZfSxHW?=
 =?us-ascii?Q?0Go0IhjufesXCt0R6xXX4uJ5bHU8C0Jh4ONjrUd7AKQ/xA6ltsD5U50yGcMn?=
 =?us-ascii?Q?3E4Ryc7Bh0WzBBeIho7HnKdO/M7C4Ju1IOJ8AvaISXeGBTlpLDpgL6O2sxsq?=
 =?us-ascii?Q?jHb8fPxFTzX4syPqeh1mYni6j8FLEALOG2oNm5cJW5ZbYAqVKxJ/NzO36Am2?=
 =?us-ascii?Q?2bDCPK9a4MkICzn3qkkyLMdqoC5kiw3TcRIOiMsLZ5K6H88y6R+6KTED4otn?=
 =?us-ascii?Q?2IQGh0bIV38GRp5VOZ0xtMvbi9YiksWOMRjE/HpYy1UtWNu+BCb36aRTMi/G?=
 =?us-ascii?Q?Zw=3D=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: 34012085-393e-48b7-ec65-08dae411b1c4
X-MS-Exchange-CrossTenant-AuthSource: DBBP189MB1433.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Dec 2022 11:43:07.5802 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jMWYNBP4SMFIYYJ2XJV4znfmiBb0DQi9mWl2q1zWcIEbYOP1pvJCbri/o+FSefsUI1Lwm/kFtGH3KtnSKqkIm5SzkMTMPAA3jJLmzkx852Q=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2P189MB2317
Received-SPF: pass client-ip=40.107.13.93;
 envelope-from=sriram.yagnaraman@est.tech;
 helo=EUR01-HE1-obe.outbound.protection.outlook.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Thu, 22 Dec 2022 09:45:08 -0500
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


