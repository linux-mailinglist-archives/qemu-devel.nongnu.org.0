Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A0CBE6C857B
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Mar 2023 20:02:13 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pfmfh-0001Ti-8c; Fri, 24 Mar 2023 15:01:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sriram.yagnaraman@est.tech>)
 id 1pfmfc-0001TA-GG
 for qemu-devel@nongnu.org; Fri, 24 Mar 2023 15:01:48 -0400
Received: from mail-he1eur01on0726.outbound.protection.outlook.com
 ([2a01:111:f400:fe1e::726]
 helo=EUR01-HE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sriram.yagnaraman@est.tech>)
 id 1pfmfa-00034J-Mj
 for qemu-devel@nongnu.org; Fri, 24 Mar 2023 15:01:48 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZrSmGgo8Z3NZfK4yZv6IYLAcB8Db++7TZ9rPoVTp7yQIIUOpOb6A4Ynib84PDySQd5y9ug7Ikz/TSjF9PhaB3/u1GEheo/PDcxMELCPXG3vfoZSWjMYV/x6DR7kF7ydiLjcmEQVD2NjzWoMlXMsXn2qYsiPp2t03CDxWasKBqiJDqKJ6M0h6cHOxzl3Eg5YtJmg+d4S3lWTiH1jH4OgOR7SL2Wv3esjGYNtKYRpkc+3RoveyFLMUndLTlu/J+8rsaMzRvh5+fgmBN39GhQ5C/c7K8BOuzpkyYQc+nVtoc7VpsLLO3uxMCv/sfy2DrFzw1OzTfE8tGt/r2/gbxObx9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=d5j8s7q6DgkB0IBldXGQq8X2/Bdscwa+1Yo5hQ5yQYI=;
 b=BgkK7UVTz9eA3WkAIM1fzVjP9Xnv4hiY4dMP05vrat4aNdcIdPDwUszPBGXQVb+/Z9aG44K4ATLPK1EndEkPhEtqw4tDtM5WH6V3elTVgUqnxyx4O9GpT0vyiBjo6h1tRz5Qfblz0uTk/AyO+H7AxRFgbzq/HbXKfwSAMZ7tfUImXOm+6e/lCoTnUVvtb5Wq852VXihOT5H4BdcDx4HcVEEyZXOz0NIhbsBSUqAVDBF8MqOGCWvFIV23dHFn/s2j4Ux2jQC2pKPBFbE6U19joN5UOOCLh8xL8xUmXKy+j+SMyrgGpq66m8xA1yb5VTl04uM8Eb1vWh2zvf5+HG7bYQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=estab.onmicrosoft.com; 
 s=selector2-estab-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=d5j8s7q6DgkB0IBldXGQq8X2/Bdscwa+1Yo5hQ5yQYI=;
 b=SZI1GEISCGGu3CdKZsO7YH2vimUuQnRYmYDizZ9Tmnd+/EesHpAZ81yCscpYmADHHAocoLuO/GZwGOqftXOoL6nZjfQn5+HM4d9bNMJL8R7qDoo54RttruyDlgoF+o3dvp6T9iRXR/d1fvPwqAz2Gbihqllms7UzQlcyWQXdQKk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from DBBP189MB1433.EURP189.PROD.OUTLOOK.COM (2603:10a6:10:1e7::15)
 by DB3P189MB2380.EURP189.PROD.OUTLOOK.COM (2603:10a6:10:439::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.38; Fri, 24 Mar
 2023 19:01:10 +0000
Received: from DBBP189MB1433.EURP189.PROD.OUTLOOK.COM
 ([fe80::13ad:a312:15c6:91dc]) by DBBP189MB1433.EURP189.PROD.OUTLOOK.COM
 ([fe80::13ad:a312:15c6:91dc%9]) with mapi id 15.20.6178.039; Fri, 24 Mar 2023
 19:01:10 +0000
From: Sriram Yagnaraman <sriram.yagnaraman@est.tech>
To: 
Cc: qemu-devel@nongnu.org, Akihiko Odaki <akihiko.odaki@daynix.com>,
 Jason Wang <jasowang@redhat.com>,
 Dmitry Fleytman <dmitry.fleytman@gmail.com>,
 "Michael S . Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Sriram Yagnaraman <sriram.yagnaraman@est.tech>
Subject: [PATCH v10 3/8] igb: add ICR_RXDW
Date: Fri, 24 Mar 2023 16:34:56 +0100
Message-Id: <20230324153501.20695-4-sriram.yagnaraman@est.tech>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230324153501.20695-1-sriram.yagnaraman@est.tech>
References: <20230324153501.20695-1-sriram.yagnaraman@est.tech>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: GV3P280CA0062.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:150:a::18) To DBBP189MB1433.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:10:1e7::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DBBP189MB1433:EE_|DB3P189MB2380:EE_
X-MS-Office365-Filtering-Correlation-Id: 6021f18c-767d-455c-2365-08db2c9a21b4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: rfrGs8N3i1Gm5aTSkvWxJN3Sw0hj5N2Nlm4D+HaQif5MYphRw05J65dPua5e48rLkILCoRoAN4yjpVh+rcLV9wgOr/f6hJSPcL8VFeYxDPmYG47HJBzdFwJb5ga8eYdl1dMDx660AgQ66PbI9YPY3FoOLVS/tp2z0CkY6wLSQRd2rVlSbwh2Q5uOY4L8uBhsRGi+k4HxrKfCXh1D6ubyT/7C8Z5W5pIuuUpQ7VKhpzntcYPTe93LYC8EulCf/i2d/9KKHeuoLZLXihiVRZ7ox0dLjHP5iaGDtC7WWRxOOp7qnYgyqKJZ6vzgRCeHhcpFqGqeyRweximGg4kkIVstovqZyZ5dGLHbZ24JjkReTLdYSjMNlCjDfL7v6GVDWP+DMScZSXN+DxDQ0aWr/+yKNM/Qyp6u87bm9h6bFfFMAw8fUORnxAVlPvQ6USvoPoGTuXFFNB9Kahrs+sYgE1RidW2RdVGNzZHJsc9M/TOc9ilitbCiY1VVLC4OQ/s9TKLwRMlTqRi/MoaKTOqXDYIVGgtp6DWhcMbs3XtZWhS8roj1+/2LlZ+0md1bjnbXUYmA5Lg3B5zOdmZBRVhLfCEwBFQB5uugM5nPToD/Bit3x8R8KHF3Ao1ksHxQIrwOJsMIqGa5S1swJGBcWq56Orjr9g==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DBBP189MB1433.EURP189.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230028)(376002)(136003)(396003)(346002)(39840400004)(451199021)(109986019)(66946007)(54906003)(316002)(66556008)(38100700002)(8676002)(70586007)(44832011)(66476007)(86362001)(4326008)(41300700001)(36756003)(5660300002)(8936002)(186003)(2616005)(2906002)(6486002)(6666004)(26005)(6512007)(478600001)(1076003)(6506007)(83380400001)(266003)(37730700002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?A+OoxQi19RFofYULTXhAbK6o8dsy/TZVcnZmybXYC5zvbrleEGMjHD7aXdTd?=
 =?us-ascii?Q?LRqepa9N2SzjGVwdAvSTR6sBgJJ8PVlSEfbcTt+tM4brA8DmvFgvUhSQCgXb?=
 =?us-ascii?Q?ATcv/R7+rIwcJIs7fYDpJC6s+uIO9CE6Q5HRze2hQhBe3GzlJmoiYC5N8bLS?=
 =?us-ascii?Q?VSTuAXurInhnABs1gw0ej9lty1rvZLnQor4de9ArnW7HOyt4sES71D/PG+GE?=
 =?us-ascii?Q?bNgK2dBi5w5WFv/vL9MD3Fo5J0ql4+bwwVsj0dK5hK/Q+9B3kztxQOThBAEQ?=
 =?us-ascii?Q?trIoq5RRSk7WRzCNQFyF9YdgTH5Z7mEkzXr9aHbgIddi8/OWvVhOl5VegoD6?=
 =?us-ascii?Q?c+/QIsL5vG4nnm7CEJeEvJS4AsGB/liCS0LxPD2NXOIngifqX+lX6pbcl3hc?=
 =?us-ascii?Q?0QPChRavYK1PtD+Vhd4grXveKO46PjkBWaMb94AxPOQ2DmXjEO6rQV6McZ3/?=
 =?us-ascii?Q?4cBK3Bi6TlQ60WPvcRz0rYUyPRlP16prtcziUJwJ0kfs+bvZw2X3rrEwgAN3?=
 =?us-ascii?Q?5z6nR5H+R9sY9FZv99h/WS6EL2CSq8HYTCANfmCzGnixturKgHpezHUJla3H?=
 =?us-ascii?Q?a6gcFHxCvRg3qtaj0Ujj8zgc1JNwctKyui6NWlVEMa1GJtYWvxfcjOP024/A?=
 =?us-ascii?Q?M0tRtuyBeEsarWEZj63N0liMCPoSCPSGZPFBVKBLs0W0j9+UiFlWDICyPbj8?=
 =?us-ascii?Q?dVbgx5LCML/94MRt0LffUutHEq6r3KZGGlGiswdjhHVjRxZwbprYoeQeUCcQ?=
 =?us-ascii?Q?SHCVli7i/G+ZX+WR7weQcLlUuPmMdxYl/m6+9vdabn795JIuAc/jvjxJKLYr?=
 =?us-ascii?Q?uyu93I+K5dA8oq6ub2jpWzCFpFK5PToSakLFa6NSvha+oLqD9aj2UofYB4FB?=
 =?us-ascii?Q?+N9G23kPmkJX0hbFfY/PZXFF7nG3RZcG4hRJLUfVqbLbNZXZkGN9XTXgwL8N?=
 =?us-ascii?Q?c8Qgne5kjn5dUzdW6sYrBkc34V+WS/iJFyWtJVuC7XiVZmcVuRX5Ts0Od7FK?=
 =?us-ascii?Q?1eg+Od+cH2w6ht7N1d/rdYrRjgHVefr4GMPoSrhoXftyBaJYdUg5NJIUDcUB?=
 =?us-ascii?Q?1gG8krQj151hWLosnImXc+CB8zkH29F/JAN1msL9LKi3eKVC7wg3HUgD3gHs?=
 =?us-ascii?Q?zvT43cf896yabNRKefRglCxWasmOITjEZmF8k1/+dCF5Kn5FTsuufFdua8YI?=
 =?us-ascii?Q?Fvi75e1Rtxh9QsPyBxdLVAVxcDRXHSvkDL81GmVjA7MMAT93y5//xYy+OU7H?=
 =?us-ascii?Q?l3it/S+B4O8ndGBfzuoGvwkjjJaciCBTr6Bw43OSIR4HdoYMEFQohz4ZGN87?=
 =?us-ascii?Q?6T3jHGCSJ/YoFNciEeavAO63z9oscDAbZDtTKXZsdPevBBKFxkUJGRPTtIAp?=
 =?us-ascii?Q?v1we/e9dFnK1lUX3akJqiCkwYiIm/vqRxPUbA7YVcGl4Q5CiXTBkNTDs/9qz?=
 =?us-ascii?Q?FPa+jszpP4WSjWkvpANQF5N60IHnvI32gnJCwbXS9U3DDN7eKGqVYo04IIlW?=
 =?us-ascii?Q?euP55zmXONDZFMJTDZbK6FkXZcXxNf2L3IPJ+UcnXOgjHOzmnbjlTTvvTDaD?=
 =?us-ascii?Q?bMWNHuQQmyIET/x2adoRqaJ4rQGacQFZSqRM9t7oH7xpzLW6sKNwIH65WXQe?=
 =?us-ascii?Q?gw=3D=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: 6021f18c-767d-455c-2365-08db2c9a21b4
X-MS-Exchange-CrossTenant-AuthSource: DBBP189MB1433.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Mar 2023 19:01:10.6358 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ri6YEWUtSDvctXlBMCl/cdKeNvsKBY7IxhdMwBn4E5QsxFR3E5WEHYJBc80DVMoWP8ehEnYrSr02mtBuI7n6E0ObU1Sf24W7Lcm6pYRllhI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB3P189MB2380
Received-SPF: pass client-ip=2a01:111:f400:fe1e::726;
 envelope-from=sriram.yagnaraman@est.tech;
 helo=EUR01-HE1-obe.outbound.protection.outlook.com
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
index 6ba9696637..9ab90e8576 100644
--- a/hw/net/igb_core.c
+++ b/hw/net/igb_core.c
@@ -1583,7 +1583,7 @@ igb_receive_internal(IGBCore *core, const struct iovec *iov, int iovcnt,
             continue;
         }
 
-        n |= E1000_ICR_RXT0;
+        n |= E1000_ICR_RXDW;
 
         igb_rx_fix_l4_csum(core, core->rx_pkt);
         igb_write_packet_to_guest(core, core->rx_pkt, &rxr, &rss_info);
-- 
2.34.1


