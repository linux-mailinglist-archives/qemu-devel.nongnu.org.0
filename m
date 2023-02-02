Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1336968766A
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Feb 2023 08:36:51 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pNU8N-0008U3-FN; Thu, 02 Feb 2023 02:35:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sriram.yagnaraman@est.tech>)
 id 1pNU8G-0008SV-V2
 for qemu-devel@nongnu.org; Thu, 02 Feb 2023 02:35:45 -0500
Received: from mail-vi1eur05on20726.outbound.protection.outlook.com
 ([2a01:111:f400:7d00::726]
 helo=EUR05-VI1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sriram.yagnaraman@est.tech>)
 id 1pNU8D-0001d4-VL
 for qemu-devel@nongnu.org; Thu, 02 Feb 2023 02:35:44 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IGYlkPneJi1hmTDPCV7cTypyWMdxHYUExnQUaqi0x3mcNa3tZMEFZIIPVM0/U1WCKYkXRf6K4YVRC6InUSM8yXcgtXiUXb0+yIUrBTKebLv0OHvYU6eT1uAWLCc2XVexLmq/EjBEkrzxdDeNkKUVx78nfLobOxmHIin6oiy3F73aUq9hQQD6vwPrOaeoaAJJ+RV+yQOoLOasWwjMBR3k/XMsKf6NPlB0qnmknOFjHUk8hh/LKE2PQYQWU40N6bYjmAFIyz45D43ODHNQTc9YT2BB3I4DTNmMVPYc5NcCMlAqJaZqRKUpCUixheAbd4GQCJA/olSeKQ79XlYOprUNnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ml7PYWUwcO9OgfgeE8wjUWxpwkyeQMPKGixdTVNt8zo=;
 b=LXAL9Cm0bvu901RjmkJkOzxb1lawsYRaJE5dmiS6+HTs1U/dRLsXGQc2UJcp8jvyMDgTLOU5UprHC1DYfKftPdU5cd26DBptAz6IX2V/E/XeqLAFcdo1MMln7yx642Qki616CebSvKaRhxTfSWki9x5Q0MPtInmnmiQEomM02Xq2+a0f9AiZ95pi4dUaTF2rogHX0n2Bh57SCv02Vs+X+XUyyMPfLdty/YquQAIaFbxaOipjL3H9GMIDVsiGcFhde+Ow4Ex5G3GmwAP22wQEiXdeVaD1rVfCBb2RQHzFhyjPupN3FqdYlIOgSx6SDUSpm5lS/qXfe4sbF6h/gCbFjw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=estab.onmicrosoft.com; 
 s=selector2-estab-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ml7PYWUwcO9OgfgeE8wjUWxpwkyeQMPKGixdTVNt8zo=;
 b=GOAW9inGFzbTtR15Kp/JrOO4pNIsyROgD5k1fCqJ0WRjo9Mr9m0H9qjr0ZoKLvZSQnQlBAM8kUW/u2wtMM2cu+PHkoTPUKJMruB/FgRGSR3ygfN/vSAY8xdgU+6N5qKGk88FFJChPQXpNJQVOPFWJDpM5l+l1GbmuQnpI43cm4o=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from DBBP189MB1433.EURP189.PROD.OUTLOOK.COM (2603:10a6:10:1e7::15)
 by DB4P189MB2389.EURP189.PROD.OUTLOOK.COM (2603:10a6:10:3ff::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6043.38; Thu, 2 Feb
 2023 07:35:38 +0000
Received: from DBBP189MB1433.EURP189.PROD.OUTLOOK.COM
 ([fe80::8f70:435b:ab64:9420]) by DBBP189MB1433.EURP189.PROD.OUTLOOK.COM
 ([fe80::8f70:435b:ab64:9420%9]) with mapi id 15.20.6064.025; Thu, 2 Feb 2023
 07:35:38 +0000
From: Sriram Yagnaraman <sriram.yagnaraman@est.tech>
To: 
Cc: qemu-devel@nongnu.org, Akihiko Odaki <akihiko.odaki@daynix.com>,
 Jason Wang <jasowang@redhat.com>,
 Dmitry Fleytman <dmitry.fleytman@gmail.com>,
 "Michael S . Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Sriram Yagnaraman <sriram.yagnaraman@est.tech>
Subject: [PATCH v5 3/8] igb: add ICR_RXDW
Date: Thu,  2 Feb 2023 08:26:43 +0100
Message-Id: <20230202072648.4743-4-sriram.yagnaraman@est.tech>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230202072648.4743-1-sriram.yagnaraman@est.tech>
References: <20230202072648.4743-1-sriram.yagnaraman@est.tech>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: GV3P280CA0004.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:150:b::18) To DBBP189MB1433.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:10:1e7::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DBBP189MB1433:EE_|DB4P189MB2389:EE_
X-MS-Office365-Filtering-Correlation-Id: f434395d-d4d4-48c0-d9e4-08db04f01425
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ZNmf/4+x1IWEPxMKvJPKmVJwz9TfDZ2nFyAx+ReHKw7gSuM5bQQzMy/nnGqcxzR9/ID2ip0yo4oGfqMgdY2oH871UxqVqSIrGNBryYi7hJ/cNS11rYruu2C1/+vRriN1QDZ1dUhxtJanZDZptvnqvAMZzdIeSzmE7uxfuoPIzdanGI75T+oR4Ft1H024F3o77h0cDncAUSnk7bCO8qfZuiRyYe59WfTDgwTyCT5SVHX40WNtImifV6yOXiymNO9uu3jEw3bK+Sb1BgvNNRAbQ0LttaabncoHGNFRrqRd0A6oSlcs9c1e018+RDi1By6oQUaAKERGl+qEeAucFvJBw+LhppD0tNal1FQgDKPaTNfRs3mrX9wyLy7soFKXnt3gIR6zdFB98NhkflH4zq25GTiBlrwe7/farnhWInGJNhKXPDMb3+KteMyepbvuSv86ven/ASNe/91LDqLNXQLL14TvUBie16O2dR0+c2CciMErWAIHfGpyT4wS2HABT5RaOKvyiL5ZU2oGoR+tZtbDGmvYPlZX/rl543VYVPOSy037jRutrcLamQ2EkWNV3fOj+yLoeVrwN5QGPY3kaqMeHP6XkK/CVb7FJHgTsSyn5NpGnTqMLZv8Vba6vrclLfZJg0SyhJLIAKMTFp+3H2wiAHOSHoEDcP9ooJ3fztHgxXzhE8p9eFriuK4Pzs0ARBQLEDNg0JJhdMTJX4dr7A213WtmmAtJ7hZSYOaGY8UlKo8=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DBBP189MB1433.EURP189.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230025)(376002)(346002)(39840400004)(396003)(136003)(451199018)(109986016)(6666004)(1076003)(186003)(6506007)(6512007)(83380400001)(26005)(2616005)(38100700002)(36756003)(86362001)(8936002)(41300700001)(44832011)(5660300002)(478600001)(2906002)(6486002)(66476007)(316002)(4326008)(8676002)(66556008)(66946007)(70586007)(54906003)(266003)(37730700002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?uZTnVnAdKW2+tfFk1kMg+Ox1fjZEUSAe8Or9JyXtduVs3+o3T63+CzUpXvZr?=
 =?us-ascii?Q?q0Uer7TWYT7A2MV7Vzy8poSVJeh7B/gamM7xRyebwRRO2WeZqji5o2hlPOFI?=
 =?us-ascii?Q?4a78iJ10GGu/Ma5hZNumIA7xjfosjPf80cmIeffc4DDhYm/a0E0fMcJuN4qh?=
 =?us-ascii?Q?GgpYz9CdgnBWZ7rDyeKQkKJ5Cpt0qEUoiCG3eMpvL2vubvJqVwM6s/sHoBrW?=
 =?us-ascii?Q?fAUE03U0sx2d4C1oKoKFKmaF8AKZrpnuGJlKixWfD9VFFtnLvJ6HpiDuTiST?=
 =?us-ascii?Q?M5Ngq4xLRPGYBEimuqfPV6dY6xpqG8ULB9jeuhAELT4zW8yfazy97Dv6gt0D?=
 =?us-ascii?Q?Sz54EdkQSpEcmYvdWH6twH3e8xBAQqZ8I02o1GRZk+X/4oIlifayBQg/cM2G?=
 =?us-ascii?Q?68ON1t56yVubD7rDk4kfOLk54cs+xqg3KQqh0Mj3XWyb9OSit0WYFoxTZKcm?=
 =?us-ascii?Q?hKEDxiaPIcKAuPg9SdGpgtfo+2fCPlLfUHvs0ow2qJ+tjZ0tGj6nyp+t2A5H?=
 =?us-ascii?Q?/DdEa8mZot1YQ88HmW3HmGAuiCfg8F2VWypE8pvF7aHaXDBWY4fJEHrzgTKX?=
 =?us-ascii?Q?/RQrSAJEO3JgOaxcV/Zot1RA/+kXpjcCYbsyxmGVir4rOx8gOUIoUYokxCZ/?=
 =?us-ascii?Q?95rmtaQ1N5ClxNWNifoz9tNkBSK8I++VPof6QZrSFiQQsfp14jrVUt3vkBaY?=
 =?us-ascii?Q?/QWpN2zRnHl2k1fWP1iW7kDlHsnqKr5ptCS/1+yrdrZDYFA/1uZrziXQP0+8?=
 =?us-ascii?Q?iniQy74pQHL7qiFEnIk5AZ17vXGblIUY75ZqPvdOGz6u7IeedUsPn1vksqkL?=
 =?us-ascii?Q?S1M1zbOym5HksRLUKfvgc1GGiNZ52PxyFB8YV9NH/++Jb/QeUBD7mxNzmDMG?=
 =?us-ascii?Q?wjQ4ZgPKJIaMoaePwdiPSVRlU6amkMdoDem0zBcq8FMeiyiRJJ6uza6HVfpI?=
 =?us-ascii?Q?FhkFNVrntbDUhSfJiq7/7jYrQV9oOd9eHnsGg/iZ6gExtBty+wQ25Qia+m6x?=
 =?us-ascii?Q?vJ3fsGtIWvcxDHDLejbSF+IPPhd2R72ZGqMeVZtD/p98PLrCyoDokykupQZT?=
 =?us-ascii?Q?9xItDkxvmL71RfBdruEg/5S9jbTaEop+Bkyv9REHDEhPVrqY7fJJ6YdFd4I9?=
 =?us-ascii?Q?YuRfxC6biSJgLazpK+u1erihQS5qoogVI3r2Yyt0Yi9YzQzdX+U8TUxyQJ07?=
 =?us-ascii?Q?N2c/o8W52uvIZNdgBYq0MFwxhQTDPZIsYrUzD2Y2DlhzlkL6xT4GphZpsB9B?=
 =?us-ascii?Q?OS+9ZhNYg4dSsD8ApkxxlgGoBMtCwqBJ23/Yf8En53llKp0jfaPzCaQGf3Jf?=
 =?us-ascii?Q?/Y1ANKdPsOX8O3KO3+Be/VrzefLUhviIsHQLacrF1gq+j/yH/5u2P12hUWks?=
 =?us-ascii?Q?PDAGpA8yvb3kq2cm1UMK8MKmcegxIw/OiWvVnGFS+YabyfW3FS6yIBh1Q4xV?=
 =?us-ascii?Q?bAd3p9IP7uGvRC6o9aqYkbvKXHS1ARtQyjtYc/fPsJaItC+vvLXpqoPnmczQ?=
 =?us-ascii?Q?HhcDXDVRk3z5KZ013u3w8vhYYahj0BmWdvhyolSAFslx9dM+s4a94Xd4IG9p?=
 =?us-ascii?Q?iQLWAzyCUP+3lfbOapxh7Y16uZts6s1z7D8jJRNNqMZPkcLvu0FfTmOahGvL?=
 =?us-ascii?Q?DQ=3D=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: f434395d-d4d4-48c0-d9e4-08db04f01425
X-MS-Exchange-CrossTenant-AuthSource: DBBP189MB1433.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Feb 2023 07:35:38.1150 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NwhHqDacNKDNZUQJSOMWdf+jXb1RCq6+gKSOArcR49IC/39YEDnBwzQkvPtlftf11vlUaJZxgarqfH9mgUNVJHVTJr+XJUOmlBKXgXzRibc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB4P189MB2389
Received-SPF: pass client-ip=2a01:111:f400:7d00::726;
 envelope-from=sriram.yagnaraman@est.tech;
 helo=EUR05-VI1-obe.outbound.protection.outlook.com
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


