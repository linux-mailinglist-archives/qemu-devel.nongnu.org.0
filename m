Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AC58E686BAC
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Feb 2023 17:29:12 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pNFxp-0003BX-Dg; Wed, 01 Feb 2023 11:28:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sriram.yagnaraman@est.tech>)
 id 1pNFxj-00038a-Cs
 for qemu-devel@nongnu.org; Wed, 01 Feb 2023 11:27:56 -0500
Received: from mail-am0eur02on20704.outbound.protection.outlook.com
 ([2a01:111:f400:fe13::704]
 helo=EUR02-AM0-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sriram.yagnaraman@est.tech>)
 id 1pNFxh-0003K3-Ht
 for qemu-devel@nongnu.org; Wed, 01 Feb 2023 11:27:55 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dlKhbvtksirvCIxkP6SW6XsVU0JIt3Pbd0ZjWViOmiiWI/yQw4linAtf9U1ZF1OYoVQwAH1XOx/bzkoFyMKcOxEejDnTG3bjW06NrJywPY+jCbNbrFM4N4fQCsQYvbAodHv2qZITSvShC4uujyWCthC4IYLD52s16o8IlKdy6LGfUrAXNQlGkTgu3gIuKOcSlY0PxapIAd9n95i9dgxN1jHW77tEFaSEQ5ABDbl1y730mr/3Vj+h5Qwvdgesuxjg8z7YPTy4Hu+qrFBvTjF74wJpq46Q0a+WSM1DVflwgojHlANq0y1zZaGpZIrlw0SaZ4GFhjReC6Dct3OZux74ng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ml7PYWUwcO9OgfgeE8wjUWxpwkyeQMPKGixdTVNt8zo=;
 b=GG80B5U1nDrc8CjiCXw4IMT/oZXtu6vCzCYYh7DGT2fhYq3s1ZWykyItb433xIfe89r4VYXFMrVFWRt64yfFFRYyhKwNFcg2PVOVLGuod46q3rKto2l5EP4DR7fJY7vZ7NQTH8IPOIHUQOITdu1QpXezlhhvrT3uGQnkIQPSrSKBrkMMWxpouu2qK2QAit2GihZpZZBSu5sxrZKbL4MmVIxaMDHImn41ehjFvHXAFhstpoAABfU7X/Cge9n9pn/0+RO300TcsFjg86D1R9K0rOdXyX2P4MnV4R/I6IhT99k7BODbp9teYKqK0GaW0iin9UcyDEZPDm7AoIkCa9m3Ag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=estab.onmicrosoft.com; 
 s=selector2-estab-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ml7PYWUwcO9OgfgeE8wjUWxpwkyeQMPKGixdTVNt8zo=;
 b=RP9ZicsBznlqPlkiSmriGpI6oAcBs/vyy82T+F0gzdWaX3CRQP2wdmbLcpHQxDF+LXYJy0Qv/8O9iM2PBMVCWVg2u3P5c3b8/wwTUcGNHH7oFt0vvtxT2F9EvMbx6YRrzHTOLv6AAzBGL76n/ehoAsFKqa6e4JfMh9GZJ4sdlzU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from DBBP189MB1433.EURP189.PROD.OUTLOOK.COM (2603:10a6:10:1e7::15)
 by AM7P189MB0836.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:17a::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6064.24; Wed, 1 Feb
 2023 16:27:48 +0000
Received: from DBBP189MB1433.EURP189.PROD.OUTLOOK.COM
 ([fe80::8f70:435b:ab64:9420]) by DBBP189MB1433.EURP189.PROD.OUTLOOK.COM
 ([fe80::8f70:435b:ab64:9420%8]) with mapi id 15.20.6043.038; Wed, 1 Feb 2023
 16:27:48 +0000
From: Sriram Yagnaraman <sriram.yagnaraman@est.tech>
To: 
Cc: qemu-devel@nongnu.org, Akihiko Odaki <akihiko.odaki@daynix.com>,
 Jason Wang <jasowang@redhat.com>,
 Dmitry Fleytman <dmitry.fleytman@gmail.com>,
 "Michael S . Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Sriram Yagnaraman <sriram.yagnaraman@est.tech>
Subject: [PATCH v4 3/9] igb: add ICR_RXDW
Date: Wed,  1 Feb 2023 12:17:16 +0100
Message-Id: <20230201111722.28748-4-sriram.yagnaraman@est.tech>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230201111722.28748-1-sriram.yagnaraman@est.tech>
References: <20230201111722.28748-1-sriram.yagnaraman@est.tech>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: GV2PEPF00000103.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:144:1:0:1:0:1d) To DBBP189MB1433.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:10:1e7::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DBBP189MB1433:EE_|AM7P189MB0836:EE_
X-MS-Office365-Filtering-Correlation-Id: 9b955247-381a-4f97-4a1a-08db047141b8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: SF+Vg6teluPtOqye29lDnpF80wgakI1gf4X6oIAFos+dbQJUt05Xxp4EXY6HO5J+BztW5XgUACg+T2D/Snslp/Cf5qso0MGAKp8MW0cFbNGfWTXILqLljclnqbhAYBQ/5hFBWhQPZMJ3ACrpHDAUzsSJQ8AKLt1jSsti3s4KC5JSKuE61TsWcb8qXe/sHVxtKriFRTuMXdF3xG1WxwlaZx2IdV5LHy+7UMOY+yIzqAuTDsuwKwhY3yMu3b4XvObqsoOYMVvOBFUqXhaNX3+qX8/UXP/kOmrosKNKJn5A5Q9C2TcfMCMLCNpZVDujZTq2cY/JIwdB/dok8SwJsFm3sIwPN9XGK4X39WLjoV2T1RzHCgbWQ9bEkPMQwTg1sO/jRd4MagfAQxEEyqgujjD/lypYHyyLxl93vIXeHCdW0CmT02x2k+9Coln24ouhmgbJjFiu3b4JzLB7JPdvD70r7MGqrdHopM/5FJcP78yr2SnKC+jzO/iIHZd2q7Ydz3VbWSoAeY29ByZTKAhlBpfmcJ3qbV7BWmxeq/QyjkcvT8RG3QiectyvnJ2QUABQ/fZ8zH6wt0h3kwXZnY0Huxv+6n++iCy4g3mLtJUuA9xJBcnSKPnlnT2kJDKQB8cixbhDd5sqDtOxXIltQbUOcHUAvsa7TMau8TiKoNGsIfJXcvknLR8+bjVWGcK8FtosquLEe7OfLZMDmHrxlOQCkUYPe7zejYaFyId4bVi8xzw1C4M=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DBBP189MB1433.EURP189.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230025)(396003)(136003)(346002)(376002)(39840400004)(451199018)(109986016)(316002)(6486002)(86362001)(478600001)(2616005)(38100700002)(6666004)(1076003)(6512007)(186003)(6506007)(26005)(54906003)(5660300002)(36756003)(83380400001)(2906002)(66476007)(66556008)(41300700001)(8676002)(8936002)(44832011)(4326008)(70586007)(66946007)(266003)(37730700002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?vugg7HYbcvGrQY+Aeea4tQojJ08G+3xI9cjaSdwLm5OhA63gVhqRaFBxuYPg?=
 =?us-ascii?Q?QLCE+qwdz0VvCV0HVJ7cbQjTk02hJHR4ITdaDglUGVaRIi0+EmVU71vj+ZT6?=
 =?us-ascii?Q?5OzgVSfejTOziH+w/hZC0h7xt4Wo5ZlmUYIcXAIxKAyasv9hODibYOmhxBVp?=
 =?us-ascii?Q?gKu/LPzG5Mr3Ct9Nev2aF3MEj3rk8A7Ekh8VoX5XyTUbizrbtYew8C4HI0yC?=
 =?us-ascii?Q?Iy5BnhY72BJd6D2O95IVtlKeL5Y5iF5e81inY0U96PPIGTW6AcZngm4JWoEK?=
 =?us-ascii?Q?3kwPXc31/w1vDZmYQ5joIgEbXesFBvVtRb+grC5S6V7OZYD8I5bYliuCA3Fg?=
 =?us-ascii?Q?pxMK9FY6IUg5dSV5fHZA1KEDsykPv5dh87gDoAuCI5b8RVMf6ssBu8pRPvlN?=
 =?us-ascii?Q?W4UwkeGeRlS25d8FsZyu8y5bI4bibPa+axyduwhBU1trH8wpS1yldPpRb/vX?=
 =?us-ascii?Q?CB3QoJQguAZj9+XmKxZWpoKpJDE3+E17DGIlfCIHg+bdmLjQNZnBBPRgUhSp?=
 =?us-ascii?Q?2qB7EVLpvIhAwbYuk8AVZYRaShJRpUzELC2NUh87ZhnT5zsJUF5Tz/3rVA+B?=
 =?us-ascii?Q?dBR/oRivBv5KXb0UdgV7ADmuBLdPyNXApOb1M6ThJCr9Y5M5GD7Nn7M+Ps+m?=
 =?us-ascii?Q?kTsx8+lOdKE5myFFdW04uLL/d/I8S3GQihnwc2ktlkvY6h4/MXqsyoKidXP1?=
 =?us-ascii?Q?SJjHNZmPQmDhQYPBns4TY3QO05qIS0R8VR3g2Y5wsnLwJKlB5dJtlU9j5Z6l?=
 =?us-ascii?Q?85UOvyCq+EVHP/o0PKvlqBTC7uuxF0dkAeUySl4dveK7xWtRJrpm6WHarCpP?=
 =?us-ascii?Q?OYhdq9gcSgun0fnuEHIMl3UXgfj2zvwK+OVh7y8J41I8+He0xnfOTm3LfTBl?=
 =?us-ascii?Q?3+Ka+Gj09/wFIAekAfzqPXSCLq8pBelRUU45nsDKxbF/mc4tS4e64ZK9YMPl?=
 =?us-ascii?Q?ahSWkgzjlpGe5ALD5i/UOWBLGIx0Ol99C69EjMkjMmoiExPOWax2UsCCo8zy?=
 =?us-ascii?Q?m8Cq/vg0hLePruUnGS/zIkdmGNbMKKrZGD+cSvGTaFL+S9qJdsK/KqZQbSk4?=
 =?us-ascii?Q?WVIUvl1kEGZ83ls2Da3d7hhxKrNeSDC3g6VE4hG9sZOEnYifs1poTR2eNm0v?=
 =?us-ascii?Q?my1FTL8Z8jfijwPvv6PxPvMM68Slp/DGccGcNRU/fVobBErb/fjZOJMDbAQ5?=
 =?us-ascii?Q?UxgU/0lkqsF0xKtm2X4fSIuplQzb+FJfWjbeFsJJ5CDncBDhfPS9DnWhinP5?=
 =?us-ascii?Q?c7/wTC7ahFUFRIAsj082njrhJzqmEKKcLjp5g20OicuGSaDSAjiXhzKuQRpk?=
 =?us-ascii?Q?YP/nFQaDTE2gM6mKVLWaY0OtsMR9g0XtpkUrKO1+B/AHumHjGBh2PB5faTLy?=
 =?us-ascii?Q?u1JmJJBHCYUN4Zlu8BGHqULKObOyB7zvYr9YP5+jd7Tip8pODIwmCsYGupXo?=
 =?us-ascii?Q?JRd5eLuBIZedtQgb3CJoo8fNza0iwQTfZmkZ4vKWjJcs+tyM4SApA3yWwl47?=
 =?us-ascii?Q?zcW1U0EAQNVl5ILPqZ/uOPpQXELBvDqKfmVkJNrE817hD+5yOToDQ92pkHQQ?=
 =?us-ascii?Q?q+8Z6n9Y52GjTWAJY6mDteodjfAqJ0imbP/jWTy0rQUY+Mmhe5ucfdEiREqu?=
 =?us-ascii?Q?yA=3D=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: 9b955247-381a-4f97-4a1a-08db047141b8
X-MS-Exchange-CrossTenant-AuthSource: DBBP189MB1433.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Feb 2023 16:27:48.5187 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Itm9FPYj7uqGE2Z/YIgZGuU3GRbocxjGpRzpN7bPwJCJFm7wlky1lavAExLT2p0UN5fZo5kmCe0k33KNHB4Bv4Fa6JGYgOaNXV2D/ZK8LrE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7P189MB0836
Received-SPF: pass client-ip=2a01:111:f400:fe13::704;
 envelope-from=sriram.yagnaraman@est.tech;
 helo=EUR02-AM0-obe.outbound.protection.outlook.com
X-Spam_score_int: -2
X-Spam_score: -0.3
X-Spam_bar: /
X-Spam_report: (-0.3 / 5.0 requ) BAYES_00=-1.9, DATE_IN_PAST_03_06=1.592,
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
 hw/net/igb_core.c    | 2 +-
 2 files changed, 5 insertions(+), 1 deletion(-)

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
index b484e6ac30..1ddf54f630 100644
--- a/hw/net/igb_core.c
+++ b/hw/net/igb_core.c
@@ -1582,7 +1582,7 @@ igb_receive_internal(IGBCore *core, const struct iovec *iov, int iovcnt,
             n |= E1000_ICS_RXDMT0;
         }
 
-        n |= E1000_ICR_RXT0;
+        n |= E1000_ICR_RXDW;
 
         trace_e1000e_rx_written_to_guest(rxr.i->idx);
     }
-- 
2.34.1


