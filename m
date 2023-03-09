Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E4B546B6BD4
	for <lists+qemu-devel@lfdr.de>; Sun, 12 Mar 2023 22:47:12 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pbTW3-0000R2-28; Sun, 12 Mar 2023 17:46:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sriram.yagnaraman@est.tech>)
 id 1pbTVx-0000QU-QL
 for qemu-devel@nongnu.org; Sun, 12 Mar 2023 17:46:01 -0400
Received: from mail-db8eur05on20729.outbound.protection.outlook.com
 ([2a01:111:f400:7e1a::729]
 helo=EUR05-DB8-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sriram.yagnaraman@est.tech>)
 id 1pbTVw-0004XO-A5
 for qemu-devel@nongnu.org; Sun, 12 Mar 2023 17:46:01 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fg9a7wAqCPPTdt5/BQhVJVhwM3DQAuT/3PxB+XSWWrW3VZIiOzvwh5qR6nJTUXcSVIGVRn7MrXED0QYp3qNEWoWwxbFKKdiVQZZJjs70nodUGMF42hEiaFV6PmYoLWdinpiMMCpqpKd+1ITpiEsd1L7LwI0lTCALlu9kD62fUFifqhVFo7pg3NYIae4pkBNWQCL4p708sf8mm66FXBMGn8cAbI5NRh5soE5rC1TpU1pUS8PaOA2wba7RXkC6wn+r6h/uACxAvQ4cfMDHNgxnSL1pTDkpFqfaFyBSDiPA7I33SABdTHx9VQLbEKpy98msp+sUMaGlfBjWurZmqg0GlA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/kUZjQx5/iNIDsGj9w9VwHOI/GyscuRJUQVxuSMwVDU=;
 b=J+OgLpWM90KTBAnPBYnpJvwWId7cVQ4xT+LXX2zJYql3fm0z1Cs8hI4stFqpSn/dhVkeS3nXvKy3f5N4rSvLRTWVIydfj/1K957igqzqxM9wJWKQYNiEZ0ZlDV9S+3X8kYNPQ3eH1ZJ0HKRu6TJ/N0EgewgDGIlMd4IrCuaQhb7NgdTZn3qKaas/OXS53dFDemADd70OfV+TNW7zqG4B6+E7dSx2IVUdnEOxIyib17sVG8DSLTsJOaJs2Zf8tFL2FOmDqFqzlhRSUZZMLtOIhmWULfAAwSqsnEDI6vIvxmgRG4e/PRmdIzsKerHHdP6yqjbgWfvTfcl2lGJHOjJXcw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=estab.onmicrosoft.com; 
 s=selector2-estab-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/kUZjQx5/iNIDsGj9w9VwHOI/GyscuRJUQVxuSMwVDU=;
 b=WuU6YbsadrnmzQ1VZXjSqH/cnOkD2S1tBPEiso/Jx1KcpELQ4bMHFg46T+uZVSWGVZr5049NSrsvGpfF2peezFELhX1Ln8DZ7gYP107NnIRNDrutKTcA37X/gvDjWxioZp6hnzWd++TE5toZQCF6NFIKBJdjbU2kLJcR6EgfbXQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from DBBP189MB1433.EURP189.PROD.OUTLOOK.COM (2603:10a6:10:1e7::15)
 by AS4P189MB2207.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:58e::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.24; Sun, 12 Mar
 2023 21:45:45 +0000
Received: from DBBP189MB1433.EURP189.PROD.OUTLOOK.COM
 ([fe80::13ad:a312:15c6:91dc]) by DBBP189MB1433.EURP189.PROD.OUTLOOK.COM
 ([fe80::13ad:a312:15c6:91dc%9]) with mapi id 15.20.6178.024; Sun, 12 Mar 2023
 21:45:45 +0000
From: Sriram Yagnaraman <sriram.yagnaraman@est.tech>
To: 
Cc: qemu-devel@nongnu.org, Akihiko Odaki <akihiko.odaki@daynix.com>,
 Jason Wang <jasowang@redhat.com>,
 Dmitry Fleytman <dmitry.fleytman@gmail.com>,
 "Michael S . Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Sriram Yagnaraman <sriram.yagnaraman@est.tech>
Subject: [PATCH v7 3/8] igb: add ICR_RXDW
Date: Thu,  9 Mar 2023 23:00:07 +0100
Message-Id: <20230309220012.25642-4-sriram.yagnaraman@est.tech>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230309220012.25642-1-sriram.yagnaraman@est.tech>
References: <20230309220012.25642-1-sriram.yagnaraman@est.tech>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: GV3P280CA0110.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:150:8::17) To DBBP189MB1433.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:10:1e7::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DBBP189MB1433:EE_|AS4P189MB2207:EE_
X-MS-Office365-Filtering-Correlation-Id: bd74c114-9fce-4516-ef22-08db2343218a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: MKgga7rFLZEJRHKEHWaoJoa9Y8JGSMKQd3Z3BKbnDX47m61HFsJhE7jHXJ5AOmAAzk6vMVT3bGXaMgRj93UH2yGMuFjydtgPf1jPhvUZHAHDvMP3shnilMPd1+mLopnhbelb+IiJtVk1b275U83uSgp0X1B/Q6Jr7R9ncBHoSoOuWGo49z1WYqN4Jeu1moxfOgAGSDQWMsYqMRN9Zld4axEZ/0qLf+dO9CiRZfOcMR27Qq7fiE7s8dWuJmAYNInLmxaEcmKwi4F6mC4yUCaLUYod2mQITRQRiEZTaFf8/PkqRvF43ifx5OgOk6eu5exo5KG93MlSpXJjrJ1TOdDIiuDd+321912YoV07jugScuHMJIj/18SmmK1kAkVBcfa6aXYQTvLKFn3Xk/c87Pu6/okHzteCqI9lnTWOH7Dow3e59yFCCUnNFXOrilQMmFqsAE3ntrAYOmPuKyko0p8g0iVRrYbFTuYCl7CRl9quo6UgHOOjz/NAAHAj1AmA1+bWhYTQfmoOhcJJzG+syjmKbgD2KGd2jH2SMcUvXmVgche3/KTwOSCckAlWUTmM0Io71cY3s2KAvD6jXlAdtBzofdxA188EYUWmGVMem7bTdenCSEk1YSKDfyHrZ/5CCNKTrRmiDD5aquIT3tQSqNHZkxJe2sjG/9eVKiBNXN6Gl9AqtIHBWAcia67L0Y2WmknVfT9RbgK1nkD4zBmMy3qX5w==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DBBP189MB1433.EURP189.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230025)(376002)(396003)(136003)(39830400003)(346002)(451199018)(109986016)(86362001)(36756003)(38100700002)(4326008)(70586007)(8676002)(66946007)(66556008)(66476007)(41300700001)(8936002)(54906003)(478600001)(316002)(44832011)(5660300002)(2906002)(2616005)(83380400001)(6506007)(6486002)(186003)(6666004)(6512007)(1076003)(26005)(266003)(37730700002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?qK+j8AzDziQ3uEV9UAMrxDOeGR1gMPvWwgqx28gS8ZhjVhrF+Y+kHQAJ3nqF?=
 =?us-ascii?Q?Ga7r1bFwRLrBgI5X+Ju6PnoXrKLnT9GpLHylGe7tR1j5GpQlH4pgihmEAH1z?=
 =?us-ascii?Q?1rLmy/1G3KB1iaRHyopHKVM+zSal6vwJMjoDhwZaYWYNtxTsSZgo8caGsp2F?=
 =?us-ascii?Q?6Khv/5L8XszI8nPUjHqMHEJ1wTBRhVW+g/1b1O6hJaVJA34bBRDkycTm/6mz?=
 =?us-ascii?Q?W1K5qquSfUigukMUgbqdMdcnonRsE+B8Au1j0mVt8duAuDvwZmkNTNCroIpa?=
 =?us-ascii?Q?dUJFBZf/MLQ0pJgjxXqNof6nLJdyoblncopnQHrC8cn/SoXqI95GHeLLas4d?=
 =?us-ascii?Q?OlEhcWMkrFOIggvILP5WeGZDntfc/kU6TIptom7rSHdP+ABwEPGt2sU66Cud?=
 =?us-ascii?Q?W2fc3A/3x/ORUezfPTZ+fTIU0iGp+glpjk5veP08TiqpdukibSbLPWE4FLmd?=
 =?us-ascii?Q?ZOmMObcyUMR7Jnfnn2mO4qtxXZsPV0nT7hyULHEPjjbskH+Gl1BlhkBvAQLe?=
 =?us-ascii?Q?Kxgy/WIeYCLD96MqsOfuUp77zacAPczIRXIOrs7MwFW4pqI3CFF3gYx2oRE1?=
 =?us-ascii?Q?62yA1DV7cRjYDkaRQ8RSmkIoJGjSBSu1KNiDYndNJErRk2REi/3pww817lT4?=
 =?us-ascii?Q?TqYARdFWnkvr/hYfNZzLz6L4eV2UNTGDviouO7M/xElOOxNFp3DouWljyAT3?=
 =?us-ascii?Q?/Ctxzvo64a9WZpUUY/Mnux/6TshshOGOTw1bh38QtYR1GCJOJSlri4GwnDZt?=
 =?us-ascii?Q?lpAITZdMfXKLUdTr6dgy9dHVRQazdshGGqh5JYEvzkF5eedD/35lPm/K4v4A?=
 =?us-ascii?Q?lAYQc3MF+e9uc+KWIXJID82kSLtOjOJJdasThm8H5HZ7R5JZjE+U2/awRXz6?=
 =?us-ascii?Q?2imgBwuo5sYA41PcViNM3yzwDVG1/Y6iC+6/2Fa5CZXV5V2MUfQf78kuMeJX?=
 =?us-ascii?Q?ISTJOehQk4YEitrb3XjKF8Wq5qsfMTCk1+GWZDcUVju2bK+NsEZZMjczgsUJ?=
 =?us-ascii?Q?7Fc6XMtT6ZfwCrVkYot6quxHoLqx+7FANXficWi0eL8a3UzpQBwthRc3N3eD?=
 =?us-ascii?Q?dYC4p8oIG6CSBl1fERI12itvnN39oXVZ/CMiNLo55m7aXhIXCpCAttf85RCu?=
 =?us-ascii?Q?sc74g1TjIWmNtr/iCUdi0kIetpTSOGDyDyNKw9yRx0nz2wyx/GD2nSKe5PYV?=
 =?us-ascii?Q?90P4T82ux6cSFALETFqIqIKz3NwdHixM92DiRwxkpywtW25Z+pUTHsynjQHz?=
 =?us-ascii?Q?MSf8mck7tVbo7mZ37EgzkyadgPCq+HHFTrYCVxnpYayl4XD7xXSbFayNg/YU?=
 =?us-ascii?Q?joRu+/UZCEYiKhH+oVnnqeCJQxZy031QO/WGpbvKqyRB6KgdXHtUqSxyAWLF?=
 =?us-ascii?Q?VDRWY2ELacD2QKDW+9644VUV2PzF8NoYyqOn+fl5R/W/01zV3Y2LKjAuuRxS?=
 =?us-ascii?Q?x8qYXNzMeui4rr4oG+MVL2qIlBVSAgTXboNQjLa3FsZX/7W0NRdj92nhlyqe?=
 =?us-ascii?Q?yJm/3ej9HwJIkSFaL2SdInmIv44I9CBR9js2B79nVK5fioJIc/JryMh982+2?=
 =?us-ascii?Q?03SUkfhYNM3O9xSv3OMQ1vInWb6F81Fu0SNEvaAQ7IrxnGYJvgeUm7hSd6Bg?=
 =?us-ascii?Q?3w=3D=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: bd74c114-9fce-4516-ef22-08db2343218a
X-MS-Exchange-CrossTenant-AuthSource: DBBP189MB1433.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Mar 2023 21:45:43.6998 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PTMEGsN3EYWhbPuho3IIVerLAht7iD9waknOr/k8IMeVOwidmeGMHVlEaq/vvP/s68fi+QKME5iSj8Y9mqDJJ8T4bT4v0wBrAJGqhkKyuqc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4P189MB2207
Received-SPF: pass client-ip=2a01:111:f400:7e1a::729;
 envelope-from=sriram.yagnaraman@est.tech;
 helo=EUR05-DB8-obe.outbound.protection.outlook.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_PASS=-0.001,
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
index 5eb83a56f9..2a16692448 100644
--- a/hw/net/igb_core.c
+++ b/hw/net/igb_core.c
@@ -1577,7 +1577,7 @@ igb_receive_internal(IGBCore *core, const struct iovec *iov, int iovcnt,
             continue;
         }
 
-        n |= E1000_ICR_RXT0;
+        n |= E1000_ICR_RXDW;
 
         igb_rx_fix_l4_csum(core, core->rx_pkt);
         igb_write_packet_to_guest(core, core->rx_pkt, &rxr, &rss_info);
-- 
2.34.1


