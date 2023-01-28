Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A2E4867FAFD
	for <lists+qemu-devel@lfdr.de>; Sat, 28 Jan 2023 21:51:56 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pLs9z-0006bC-Tt; Sat, 28 Jan 2023 15:50:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sriram.yagnaraman@est.tech>)
 id 1pLs9w-0006aV-IB
 for qemu-devel@nongnu.org; Sat, 28 Jan 2023 15:50:48 -0500
Received: from mail-db8eur05hn2032d.outbound.protection.outlook.com
 ([2a01:111:f400:7e1a::32d]
 helo=EUR05-DB8-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sriram.yagnaraman@est.tech>)
 id 1pLs9u-0005Ml-4T
 for qemu-devel@nongnu.org; Sat, 28 Jan 2023 15:50:47 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bIbscTcE5ER0fp/ZA3g3bm7DKHdZyAhM8md87ibNKiYez2Uw6juEMhpguyf8u3ueVyYE+hjN1VQPOj5W9uJiBspb/KVg7wkkLBAwa/BYv5zRcV3EgBaebzhjdL0FD1wyW+yCzqDzJ1jiczE8thcbf1JYPnd3Ee47Ygzmf9hcaCJlzV1r04CUYPTemthMHFvCJ6dL9x/T4dNQ142kP0e24WQazykWbiePgPg74PnLVwDBe/7ulEJpFr/X90no6NWWjPCMWu1YkGXF9EsH0iP59uepkHVkRRP2JuZ+plByoVRfR/ExJ6N5QkB00OG8zpQ6g8sHv8vnQmVWh04tV1upEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YWMd+DWMFVxpn7gj8QTQWmS7na3KeLNDzkkd9Izht3Q=;
 b=OAMBoRCIUeo3kEeJlHuq89bp2R7JwFjDjVl15LAsEQLTtVrCl9Fn2R9sNh+pAwifw9JCmg3KNnmqLMwSzxUY/dKAzwJxa7LCRY8IkKomkA0jmxEEI5KySx0Sm/zsfJTnUxwyYmx2Uxi1Hh/EAO2PtpGCzgjEn4ICGI62qBmc+uxvHKF3w3drGG+Hu2MO1sFdh7VgmnCA7ChlQRVhL8H7LKUSeA5/i+r07qaqcTdi71LxO9QM54JA2yY1iMuM425gSbbDkXZT+LQVZRbSEtq9LhXJs6tYwcqznNZxKWDYTRnyVMg0oteCNoSEkc7owwHF/T2nkG+54ukgUwzt0TqobQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=estab.onmicrosoft.com; 
 s=selector2-estab-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YWMd+DWMFVxpn7gj8QTQWmS7na3KeLNDzkkd9Izht3Q=;
 b=mGv9A3kFx4P/WHeCEAdoSKW4SbzPhGsm4ZJJoOYUKwRuA+3rdw70PQeJksu0/hmHxM1aHxbu+LRcIReN6dxrYDefljEyHcVOqHPWMnqE+ZVnWBbQzyBNPiKd2wqjDtBBASHrIIIqmhVEaC5Z9juABkzkUHM1idOyPcXlT9Jtrv4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from DBBP189MB1433.EURP189.PROD.OUTLOOK.COM (2603:10a6:10:1e7::15)
 by AM7P189MB0661.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:116::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6043.30; Sat, 28 Jan
 2023 20:50:26 +0000
Received: from DBBP189MB1433.EURP189.PROD.OUTLOOK.COM
 ([fe80::8f70:435b:ab64:9420]) by DBBP189MB1433.EURP189.PROD.OUTLOOK.COM
 ([fe80::8f70:435b:ab64:9420%9]) with mapi id 15.20.6043.030; Sat, 28 Jan 2023
 20:50:26 +0000
From: Sriram Yagnaraman <sriram.yagnaraman@est.tech>
To: 
Cc: qemu-devel@nongnu.org, Akihiko Odaki <akihiko.odaki@daynix.com>,
 Jason Wang <jasowang@redhat.com>,
 Dmitry Fleytman <dmitry.fleytman@gmail.com>,
 "Michael S . Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Sriram Yagnaraman <sriram.yagnaraman@est.tech>
Subject: [PATCH 6/9] igb: add ICR_RXDW
Date: Sat, 28 Jan 2023 14:46:30 +0100
Message-Id: <20230128134633.22730-7-sriram.yagnaraman@est.tech>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230128134633.22730-1-sriram.yagnaraman@est.tech>
References: <20230128134633.22730-1-sriram.yagnaraman@est.tech>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: GVYP280CA0031.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:150:f9::9) To DBBP189MB1433.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:10:1e7::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DBBP189MB1433:EE_|AM7P189MB0661:EE_
X-MS-Office365-Filtering-Correlation-Id: 1d0c21cf-a72d-409f-d633-08db0171489c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: c8VAedQUzQGCWYrB+6a5Pb8JUEvmM16DT8XJyUYyG95ougOSCzdgXl+90KLYnGUGRv4q+OQF+U5Qs0cp1HWjU+yv9Hirbre/AZG5JRSYue0wEx4Hrgcva8GP9H+QmSZGSAEr/EC0FKmmatlAAB6vgxMHXlrhTCbxuNZqaW9OEWf1Wec6QBx/426Ij0gAUv2MNOUAP4pal4j2EEol3O2CKtknr1m3M7mq1mmbi2jHhzBUy1LmydvPn24QZBqVexC5TdOLa1O4IAsRFmOdgU0VrA9st8gMp+8eqM+N7XIDTLmyylFnqcNmAguAuM2EeD5CIQts9D6/fBAm5C8kJ4lDUHmV4IuWS06D+iYU6VJE2eHXRV9WKfTzM/gdqQ7ra6Fw5iaToPUyLXh1Gm07WH9zU7U3IMzut9nW2lwp7DdpUVRWC5LGGuO+/mzIbNaUDmsJR7+jSmm/geZnONZLujmUwAc70buRqCfvT6qT8sn8LmFT3nsA6ZluB11Y24b7zR6AYY9/gwwGlpghm8plKqsriJ8ot3KOl1ovJpS3az+TfV8fnz1BWdWAGXvO982PHRAy/aUlx77/lg4T+kjK85eTS2gLlQWphFlqi539gGzu3C+1sVkBkhkY+rvGABOr1ZB69HlwQUqSayNd1MT6rZCfhr2CCgr1w2hYzbj4ce4Rb4PXaiorJ2zsCH3QCUEKCIxYOytVWML9PWnQtfbEzgt7h6iffDVo53Ar/NYyo8oRRmI=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DBBP189MB1433.EURP189.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230025)(39830400003)(396003)(346002)(376002)(136003)(34036004)(109986016)(451199018)(8936002)(41300700001)(86362001)(2616005)(83380400001)(810100004)(38100700002)(41320700001)(316002)(8676002)(54906003)(36756003)(4326008)(66556008)(66476007)(70586007)(66946007)(1076003)(6506007)(6666004)(6512007)(26005)(186003)(6486002)(508600001)(44832011)(2906002)(5660300002)(266003)(37730700002);
 DIR:OUT; SFP:1501; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Jjx4LVBi4DiZ64o7T6D3qwRTrB5iq1XCQ/0z62hwhb5pSmhwVn4ypdBaOJYg?=
 =?us-ascii?Q?ndYuSI9QMFnQavvHC/ekuJcr01QaCFsrU15z08Ls77PPdO6cszi0tGijlkIo?=
 =?us-ascii?Q?jqqqnYWKts0QOR/wGqThpHHFhFWLLMrZaxkfc5mEIEhnKKHHR+Nj1CIB7GNH?=
 =?us-ascii?Q?IyZuFGal+NtkZNPIqW3J5xZylarNBlNoKEzIzEDseKQvbERKnWjopnn8RKWc?=
 =?us-ascii?Q?ZGhdhJS45Q5ELZTSRPPACDO9V/XdQsmhEOJir2HgwLSI39+FAf9dZLJmXSJv?=
 =?us-ascii?Q?I5kwuVdSUkHoqnAFH8KpQKFMXQsTsR06eaZyeUkXVy4rSA/A2z35i6Z+PlR2?=
 =?us-ascii?Q?7KRZtgrXid2vVmnsrheHcU2OZfDbHPG1tF5JmVst/M7OJsqTHxfGfuaYr5wO?=
 =?us-ascii?Q?RvKG3aHxOebRHCLQzefvIBJUZxIKF9akghcqQan/eZyfWvVOH7EH2Bom906L?=
 =?us-ascii?Q?JhBf5BZJYQbzyV6M+6T1l5lY8mgrefGD1tFAxi7i/TcUxWz0pv3NvryBgyS3?=
 =?us-ascii?Q?LdII/+3mivaekqvI9WOaDK6Nd3eVcX+rGlXxwUoAiK7hoEf5YFNxvEdIc5bc?=
 =?us-ascii?Q?16UZUXOd0kO1XUQEpeehzcwObUqOxLB/kViVTeofG04YHroEHKp7oVlLLGMx?=
 =?us-ascii?Q?EL9l6e9hHBqtPXLdu2i0sdd0w4BaMCxsSH1BScKqTFBarQ4RWFcOvcCwGnUB?=
 =?us-ascii?Q?WCBP+XIVpxlVGetza9H0vC3hKS28pSj6hwa5JWrlsVwjl7vmBbs2hWghwW1q?=
 =?us-ascii?Q?Yi0jK+DZ6EbW6r4SokFLG5oIMiVZENaFuHhNVBLeTfMhUJi7OY5sQzuKwLNN?=
 =?us-ascii?Q?KwOHM2PqHwkrnMPqKrXUZi8ycMGQxnvlxBGXRV6Rab8midKsu2KYIwJsjs3R?=
 =?us-ascii?Q?GghM0mpHFYkVeZab0CbK3CtCsgXP0RWS6Erv64CMhlXxvYHsgcIarPiKDQ+p?=
 =?us-ascii?Q?IPrRMDsuUXBr40BDg3tdLPB6rf9UIZ+LztdwIkxVlwYXnzd0gMiQhA1ASQAl?=
 =?us-ascii?Q?zyeXFNZ1syTAQ/ZamTRYpR5q1MraAL32NiJX+s6Z6GODzqykw82FB6JwZqka?=
 =?us-ascii?Q?ef8oRvTMbRZ60yuWQJKZzIJm0Eaar9Jz/t6pOPXNhjGufszaAOdLy2WBLL2s?=
 =?us-ascii?Q?TPEWf6nnjZlWLjrFcfGl81Ynmh7c9AsSju0kxShQwe7obPP5WxXTnjcbMxRV?=
 =?us-ascii?Q?HGkx8Dph094oK7EVL6CbnL1pbqZ1nEap7dSA0BtUzrI3iCgS3o4GMxo1UwbH?=
 =?us-ascii?Q?uCUCnFoQKzAztkdNqE6j8rXACydUA/Yv9PoHbWW33WhHMFWaAFNnuNgjEh97?=
 =?us-ascii?Q?rx/WNda29paCn6zO5GPEvRbjulUA9BKa2b6EByVwyw+B0PmWntlDPVajBwlq?=
 =?us-ascii?Q?MIX6eHZ+LBnAvYdtk1OgtOLbEOJFtweHcmulR4NHb7z3veSxE3OwBgeGTp1o?=
 =?us-ascii?Q?iSGE5vZotXcoUzP/CHMD1zI22Asn9lURrqDvk8CGXf3N32sG0YpSgwbYz2oq?=
 =?us-ascii?Q?qGqu2vFubrgRvEomh4sGmRGiSADS3F5b6UgYzFlKnfuagOS/dARxC26Bscna?=
 =?us-ascii?Q?Ihs98nl/4+WR3yU3NbTG32bEDNvWpX1E39f2S4oV9u36HH9vJGKfJYafFI94?=
 =?us-ascii?Q?NA=3D=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: 1d0c21cf-a72d-409f-d633-08db0171489c
X-MS-Exchange-CrossTenant-AuthSource: DBBP189MB1433.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jan 2023 20:50:26.5645 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Nz7D8SRGGzsxafmHATER5L4v2ttp+RKan6eDT+Rps+Hp+oq2DSpt399PpIOxy2t/uyi/1dCWXuqxneD29OV4+AQ6E8/D9/vcDHtzhDN1LHE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7P189MB0661
Received-SPF: pass client-ip=2a01:111:f400:7e1a::32d;
 envelope-from=sriram.yagnaraman@est.tech;
 helo=EUR05-DB8-obe.outbound.protection.outlook.com
X-Spam_score_int: -3
X-Spam_score: -0.4
X-Spam_bar: /
X-Spam_report: (-0.4 / 5.0 requ) BAYES_00=-1.9, DATE_IN_PAST_06_12=1.543,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
 hw/net/igb_core.c    | 4 ++--
 2 files changed, 6 insertions(+), 2 deletions(-)

diff --git a/hw/net/e1000x_regs.h b/hw/net/e1000x_regs.h
index bb3fb36b8d..3a3431d878 100644
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
index e4fd4a1a5f..43ff387b16 100644
--- a/hw/net/igb_core.c
+++ b/hw/net/igb_core.c
@@ -1640,7 +1640,7 @@ igb_receive_internal(IGBCore *core, const struct iovec *iov, int iovcnt,
             core->mac[EICR] |= igb_rx_wb_eic(core, rxr.i->idx);
 
             /* same as RXDW (rx descriptor written back)*/
-            icr_bits |= E1000_ICR_RXT0;
+            icr_bits |= E1000_ICR_RXDW;
         }
     }
 
@@ -1650,7 +1650,7 @@ igb_receive_internal(IGBCore *core, const struct iovec *iov, int iovcnt,
         e1000x_inc_reg_if_not_full(core->mac, ROC);
     }
 
-    if (icr_bits & E1000_ICR_RXT0) {
+    if (icr_bits & E1000_ICR_RXDW) {
         trace_e1000e_rx_written_to_guest(icr_bits);
     } else {
         trace_e1000e_rx_not_written_to_guest(icr_bits);
-- 
2.34.1


