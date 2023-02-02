Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 291A6687847
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Feb 2023 10:07:57 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pNVYR-0003nX-Ae; Thu, 02 Feb 2023 04:06:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sriram.yagnaraman@est.tech>)
 id 1pNVXq-0003ZK-90
 for qemu-devel@nongnu.org; Thu, 02 Feb 2023 04:06:14 -0500
Received: from mail-db3eur04on0719.outbound.protection.outlook.com
 ([2a01:111:f400:fe0c::719]
 helo=EUR04-DB3-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sriram.yagnaraman@est.tech>)
 id 1pNVXo-000664-Mf
 for qemu-devel@nongnu.org; Thu, 02 Feb 2023 04:06:14 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iaiEuyfeP08jl0+XkwS5GkrVzBdDSyd5UHZPH4Xpwhuor80trmCQcKIJGwSozpLtNjGv05MvagFCyhULotpHKLYLgDQQNp6mL0NrBl1rx6mbm35n9cUjLQILAiCV8jZtaOvA0zdnTMhi03XZcVvlhHet7tQrS5di0ANxhPiZq37zpPy/ozt/xW5nds4rYk7LXrPGuCYYcGF1U6a2aJrE1ETZCACMlIKL9JWgWSktIG33cFuPCEAruU6vG8TbC14JkYoixwE6+kOU+94ZWdnBGmXl6liyGTkpC1WFd6lzUlCXA79q6eVj3ZWsbJjbYhI1/gyocUMK5V5it2mKyJdNCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+wtKfBce1V9EZUIvQf+JcLSNXi21QfymUTcfvyFbYPU=;
 b=G6FufWSZY877zbTA+y4rbIHWC8AQ+NRXq81l3Dq9NWDkA9IPsYs9XN8MNqfN+01fk9rXLUu5KDsak3kKk0vCs/v+2kR/r/12tmtQJfBEdvGBr68/TNmu89v+Y11Cu+cB2gxTMX7M4apxTyvCDvR3Ds4HK2ZeqxoXVX0k+Fq1iifWY0ZXu3RhXRXjc6tKyVQHYKTuiw5y6lMDtkFkesg3CBswkOw3DVatB3zBX0polLVsLypj/GzyhXOxr5ANDeDLzvojgkb+cv8DFV5hrHHI2RLKPoCAhXOztnynF3wA1i8V6y976uU7KtEfy6JltWb+TwSFjySlH0aYQM9turVkuw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=estab.onmicrosoft.com; 
 s=selector2-estab-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+wtKfBce1V9EZUIvQf+JcLSNXi21QfymUTcfvyFbYPU=;
 b=UTUWuXMM3Ah3Ej+Z214COEWnpXKu/mz0GqNjShNQJBmkqR+suqnvLj0T4B6mbMHGv/poEaEpXRDYYuET8v8d2mQK/uLzJci1lQIxhRn7ZgJZbBBVFaaIFbm+YphGv/RXRTasUm8tkDbjBwmnEkotWzLdX+g7lcYV/DWMSZFD08g=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from DBBP189MB1433.EURP189.PROD.OUTLOOK.COM (2603:10a6:10:1e7::15)
 by PAWP189MB2592.EURP189.PROD.OUTLOOK.COM (2603:10a6:102:362::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6043.38; Thu, 2 Feb
 2023 09:05:59 +0000
Received: from DBBP189MB1433.EURP189.PROD.OUTLOOK.COM
 ([fe80::8f70:435b:ab64:9420]) by DBBP189MB1433.EURP189.PROD.OUTLOOK.COM
 ([fe80::8f70:435b:ab64:9420%9]) with mapi id 15.20.6064.025; Thu, 2 Feb 2023
 09:05:59 +0000
From: Sriram Yagnaraman <sriram.yagnaraman@est.tech>
To: 
Cc: qemu-devel@nongnu.org, Akihiko Odaki <akihiko.odaki@daynix.com>,
 Jason Wang <jasowang@redhat.com>,
 Dmitry Fleytman <dmitry.fleytman@gmail.com>,
 "Michael S . Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Sriram Yagnaraman <sriram.yagnaraman@est.tech>
Subject: [PATCH v6 7/8] igb: implement VF Tx and Rx stats
Date: Thu,  2 Feb 2023 08:52:56 +0100
Message-Id: <20230202075257.16033-8-sriram.yagnaraman@est.tech>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230202075257.16033-1-sriram.yagnaraman@est.tech>
References: <20230202075257.16033-1-sriram.yagnaraman@est.tech>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: GVYP280CA0004.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:150:fa::6) To DBBP189MB1433.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:10:1e7::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DBBP189MB1433:EE_|PAWP189MB2592:EE_
X-MS-Office365-Filtering-Correlation-Id: d1e417a2-0389-432e-5aac-08db04fcb2c2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: zE1eXm4X6L/44q2SgTJBIhDIIZtTzCv/+KDf4vyMibDwjhxpkEokHA1apXcSYHHyGORLnO/ZK9NV1pxpdEWGJXQUwjgnTVXvFey93SvV1jNkCI8BJqaTEnk1+1uH3eAXRrsZH6fTj9gKKuKbPSMK9+wpSJCH7yj4XF8YJ8AfA4+eIXMvW4nJ+qZH4Q9umL3BjJvacbMiCZAaaIPmVmmXg+QDX4UpouJ7VWo+yNVJ02qlzdfgD6vTDRj2m07JT7HVg5Gox2JtD1ptni5ZnR6b5NBBj+/LvEOLKCHe8N+/gx1dgc5fN+Ukmd+J+RiuXedtqNhZJ1uWyg8d5UsDm5xWJClZbzVqIt5K0KIpe9pdtsgT6J/4iOgygLuwO+GLUghVPD04Ee/QKXl4bOGp9IXhWQIyxg6FX3RxIr3g/d9q8yoa6mdUTall8v5aMfd0gmVg9BGMpkaTOCskqcbHcqHy0Vh5u/y8KI7yGHCH7B3od5e188YXo4qOT6OhFdhE+p34lUORTpdOPhuVaPcQgaBIiR8SqiGfNzwsuKvxd3Y2mRtVNy9ykdHiMnaUsAkWeoPdFWOIcr78T8k96xhEoAHL89KULpRO3a7xra6UJ6/RsoRi0nYZSN8eoo8XCMXJ5cYjOoR617cWKTfH1CkmbIQhLeBXb4tW+i/PKK1ziOZDDU6z/zP2j9vPo/b6bvdD2jvmVetuvsAjGs2MYl8h2ZL8yeBwqeJ+T4X5k6zAhvwpoeg=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DBBP189MB1433.EURP189.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230025)(396003)(376002)(136003)(346002)(39840400004)(451199018)(109986016)(70586007)(83380400001)(66476007)(1076003)(316002)(8936002)(4326008)(6666004)(6506007)(66556008)(8676002)(54906003)(66946007)(41300700001)(478600001)(6512007)(2616005)(26005)(6486002)(86362001)(186003)(36756003)(44832011)(5660300002)(2906002)(38100700002)(266003)(37730700002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?KekGF6o/Te57noq0/xGQOFyBwvSUYMJFcdDkJRL1osJl74cx/4heBk+Hmyod?=
 =?us-ascii?Q?CKUgOsX/jfdbqgcV6cEcfGYaNFLA7do1K1v++abVTCuahG1FBmq+0F/s7v8C?=
 =?us-ascii?Q?c9J3OED6zSiBGEEVs2D+wBplDXJzEMWZt/FDBsb875VCSSX+bEp3yq4oY2fH?=
 =?us-ascii?Q?AUVcMACvjTZSo/5dqbdfZEXdFM+U276W9DOWag54dj54NURYmGOyj8eAA2Aj?=
 =?us-ascii?Q?RBgtE60JKgJ067ESGp2ADKh/fZZAsrQXHo4j0WmHYi5TVtMhcJrWp9Qbm1UJ?=
 =?us-ascii?Q?tGQH8HCDNd1jeIqsHnVrRvgbJlBGobOCbHX7n7TsPPYeSjl70HHNg2XNtfSG?=
 =?us-ascii?Q?jlTUEygb3XPqnnybiHjVyMc8fKRlNP8Rc5Zzrk2pYsye3n7d0uwUVtpudZ7k?=
 =?us-ascii?Q?RDcZas9buoosDCeVJ7g9H6s+Z7x4lLvpJt5taSwke/Kmksh5Y/sSLL+DQvQt?=
 =?us-ascii?Q?QvfRe9dW24PenxY7DYR56yLiqWVI0K12Yj0Jf1+OCWJX+pIv/0Om8IY330XI?=
 =?us-ascii?Q?BIGXJIBp6cpST3dc8MpnSb4jY19QEF99ljYHcqbu6l4kC3S1utKcV7a3J3Ty?=
 =?us-ascii?Q?Fn5NwAjTINrO4cqP5rw5uUMC31wJ0uObEf85BUfof8jbb51AKChUukIYXf8S?=
 =?us-ascii?Q?u+mxJBoHUShdB+WFO30Yoi+s8J54CrOaWsuNhlC9z7H7d8LbSIlNTv08tXWB?=
 =?us-ascii?Q?ruLXwaFEcCUvkYupMEu5dY2MavnAA925chuYegZbrisgXmuh+crSM/+933wN?=
 =?us-ascii?Q?n92Y2jeOuwbX03r4dv0G8QriiLbC2L02YY2r4nZuAZZgbal5/p0bth7flP12?=
 =?us-ascii?Q?jdAO4FpM2mSW6lc+F3oGKscs58CYGJVVRvVJGlg4UmBUeCvGF0Ic2m3ycP70?=
 =?us-ascii?Q?nBw7X8hgzdqgcJP6IAiN4cIRc6JTBgxkzGG8vZKWkSymvzr+3z9TcA0NXTlY?=
 =?us-ascii?Q?JwhOabvz8sg5BfX+FuVE5A8HWlsAG+I6s4XL9FOewrdNwWNIw/cW2Hzj0+KR?=
 =?us-ascii?Q?Wa2tTf0PMi89VhxPEJuUcRRUU+8eZQWErN5c93FMxCX+p3TeMUBABajsc8CX?=
 =?us-ascii?Q?xmuBk4ZeLAiZtwGRGv0X7yAg8B9spF3cm7X1gCOOt5w4/qD3Um8uKmoo2oe4?=
 =?us-ascii?Q?KKbJ4QCX1Q3ErQITX7ycV2sumYVt5j5+6uTp7anjThiCFyvzhM6187YvjD71?=
 =?us-ascii?Q?aWPiziNAX8rvPiW2nmOvWgUkybsaYtQtO9ACcf1I8sBe/uDtAqCvNrPQcQtu?=
 =?us-ascii?Q?YvKzvEMknHJLQhFY9w9/L1eMkOlWJGJCDPtH570F0dkukDkT7sCb7UhnZpUS?=
 =?us-ascii?Q?G6ORoV3oIl4K8KhvqBVevd+z+Z2PAl/gdtl/3p1Fclb0TEWB9NVTutnOcExj?=
 =?us-ascii?Q?LU/ZGDejIX/u2h9irm853d8qeY60VaHpsmHLecmGjgnpkfYX4YbYHhiv92gE?=
 =?us-ascii?Q?05q9utw0tze+29RQlGKrDngx2ivsEfzg93wsgF8qRTGBy8dzqfAZTOY92j1b?=
 =?us-ascii?Q?eCLMFxbg3rYH6ByxmvSNvMwviYJ0bWViGs7AqqOtscMW+nekj1X4dm+cNWlE?=
 =?us-ascii?Q?Ngx68Vie5Ctmjtj5ys+9eHgd4GSJ2SPpzhkErXH+GkPFwXkqFWgbljhLUJym?=
 =?us-ascii?Q?jQ=3D=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: d1e417a2-0389-432e-5aac-08db04fcb2c2
X-MS-Exchange-CrossTenant-AuthSource: DBBP189MB1433.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Feb 2023 09:05:58.1502 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GSUn4TRbvce0gr1aivvdDq8BV6yFVfMbnbZuccwaIsftt/gsi+BGmsOC09xkIKwZLdUSOTLpQSClXF+K6zrIivz5ak+xrZnmlkhAwEsakRc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWP189MB2592
Received-SPF: pass client-ip=2a01:111:f400:fe0c::719;
 envelope-from=sriram.yagnaraman@est.tech;
 helo=EUR04-DB3-obe.outbound.protection.outlook.com
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

Please note that loopback counters for VM to VM traffic is not
implemented yet: VFGOTLBC, VFGPTLBC, VFGORLBC and VFGPRLBC.

Signed-off-by: Sriram Yagnaraman <sriram.yagnaraman@est.tech>
---
 hw/net/igb_core.c | 26 ++++++++++++++++++++++----
 1 file changed, 22 insertions(+), 4 deletions(-)

diff --git a/hw/net/igb_core.c b/hw/net/igb_core.c
index 9994724a39..25a5e0ec87 100644
--- a/hw/net/igb_core.c
+++ b/hw/net/igb_core.c
@@ -490,7 +490,7 @@ igb_tx_pkt_send(IGBCore *core, struct igb_tx *tx, int queue_index)
 }
 
 static void
-igb_on_tx_done_update_stats(IGBCore *core, struct NetTxPkt *tx_pkt)
+igb_on_tx_done_update_stats(IGBCore *core, struct NetTxPkt *tx_pkt, int qn)
 {
     static const int PTCregs[6] = { PTC64, PTC127, PTC255, PTC511,
                                     PTC1023, PTC1522 };
@@ -517,6 +517,13 @@ igb_on_tx_done_update_stats(IGBCore *core, struct NetTxPkt *tx_pkt)
     core->mac[GPTC] = core->mac[TPT];
     core->mac[GOTCL] = core->mac[TOTL];
     core->mac[GOTCH] = core->mac[TOTH];
+
+    if (core->mac[MRQC] & 1) {
+        uint16_t pool = qn % IGB_NUM_VM_POOLS;
+
+        core->mac[PVFGOTC0 + (pool * 64)] += tot_len;
+        core->mac[PVFGPTC0 + (pool * 64)]++;
+    }
 }
 
 static void
@@ -579,7 +586,7 @@ igb_process_tx_desc(IGBCore *core,
                     core->mac[VET] & 0xffff);
             }
             if (igb_tx_pkt_send(core, tx, queue_index)) {
-                igb_on_tx_done_update_stats(core, tx->tx_pkt);
+                igb_on_tx_done_update_stats(core, tx->tx_pkt, queue_index);
             }
         }
 
@@ -1398,7 +1405,8 @@ igb_write_to_rx_buffers(IGBCore *core,
 }
 
 static void
-igb_update_rx_stats(IGBCore *core, size_t data_size, size_t data_fcs_size)
+igb_update_rx_stats(IGBCore *core, const E1000E_RingInfo *rxi,
+                    size_t data_size, size_t data_fcs_size)
 {
     e1000x_update_rx_total_stats(core->mac, data_size, data_fcs_size);
 
@@ -1414,6 +1422,16 @@ igb_update_rx_stats(IGBCore *core, size_t data_size, size_t data_fcs_size)
     default:
         break;
     }
+
+    if (core->mac[MRQC] & 1) {
+        uint16_t pool = rxi->idx % IGB_NUM_VM_POOLS;
+
+        core->mac[PVFGORC0 + (pool * 64)] += data_size + 4;
+        core->mac[PVFGPRC0 + (pool * 64)]++;
+        if (net_rx_pkt_get_packet_type(core->rx_pkt) == ETH_PKT_MCAST) {
+            core->mac[PVFMPRC0 + (pool * 64)]++;
+        }
+    }
 }
 
 static inline bool
@@ -1515,7 +1533,7 @@ igb_write_packet_to_guest(IGBCore *core, struct NetRxPkt *pkt,
 
     } while (desc_offset < total_size);
 
-    igb_update_rx_stats(core, size, total_size);
+    igb_update_rx_stats(core, rxi, size, total_size);
 }
 
 static inline void
-- 
2.34.1


