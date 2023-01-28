Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9206067FB04
	for <lists+qemu-devel@lfdr.de>; Sat, 28 Jan 2023 21:52:22 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pLs9u-0006Yw-Sa; Sat, 28 Jan 2023 15:50:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sriram.yagnaraman@est.tech>)
 id 1pLs9r-0006YV-T6
 for qemu-devel@nongnu.org; Sat, 28 Jan 2023 15:50:44 -0500
Received: from mail-db8eur05hn2032d.outbound.protection.outlook.com
 ([2a01:111:f400:7e1a::32d]
 helo=EUR05-DB8-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sriram.yagnaraman@est.tech>)
 id 1pLs9q-0005Ml-En
 for qemu-devel@nongnu.org; Sat, 28 Jan 2023 15:50:43 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=frVwQL9eSlZf/GTkgncMUs/QmhT4ot2RGzmSwCgwaNjQKNcbqKi3kQq2QSuVJW1CqJ41dLRrwyYy/mQDphlnVQK28u5ToFt1UlYFvymIEiqqxTHD43hTednC8vI2FTGI3D4c0dcattTnQOLPSgYZW9QooWTGfuoH+3XQ0WXTtw05ayRxkCacqst1pWhIMqc1yax01CD0DWRKzEnWjKphSpnft9E23yT8XEntS0FsX3dg5D+eyF2N4woGxaO0vNzEStYsGiYyXjj8XqZpkdKVg8igLbp0Johzv5BexC9wDAtAFuueWgBFLjMTGtDzHn4q948cYarxH7ZE3IO6K1AA4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RZkLlBngGOhYergm9/C7JespkP++ArlnL3VvhSPig/E=;
 b=NS6wSvYgvBUs0AmgYB1VowLS0QFSXa+EYhhn0/X7sESKfe0bdHfKxUqdBF+agTiLpS3wseWCWtDKvmY6XwZpo8Cee+8Ufb7H6AcjbL1w3d8Rgwls0Hp8JaD3bT55h0hjOS78reaOq/gz1JjpTxAxi3yI1soLxNMDbNGnpO0El2i5IwGtZRoGD9eE7VOmOg0j/EoWR2EjUvimCYy9rZaOstWaVJ7nx2g+fqPkFreE+2c/6Qap2Msx9zgbfDC3b9aXgVBkqbpRfdb4Kq5W68HIWJKN4PVH7qCI9RCR01npmGU+CROhdJ/QxcE6OV7olX+Cm6ME/oOVUr/c1jENK/8rrQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=estab.onmicrosoft.com; 
 s=selector2-estab-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RZkLlBngGOhYergm9/C7JespkP++ArlnL3VvhSPig/E=;
 b=TfOMhF+SGU2LzwPOotZAN9mma5l0BljQaPE4h7lm6OIx6Xc306McvwbgU67YQpT5+/3pvH8EZwDv7dQADsjzwJ3Maga3083pDHgH1pq9RVrPvtY7ErFXlTZ20iN7uHVG7K84/mF2qfkDtQ6vNhvRNt22SQJVEwPwzH4SXdYKzBI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from DBBP189MB1433.EURP189.PROD.OUTLOOK.COM (2603:10a6:10:1e7::15)
 by AM7P189MB0661.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:116::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6043.30; Sat, 28 Jan
 2023 20:50:21 +0000
Received: from DBBP189MB1433.EURP189.PROD.OUTLOOK.COM
 ([fe80::8f70:435b:ab64:9420]) by DBBP189MB1433.EURP189.PROD.OUTLOOK.COM
 ([fe80::8f70:435b:ab64:9420%9]) with mapi id 15.20.6043.030; Sat, 28 Jan 2023
 20:50:21 +0000
From: Sriram Yagnaraman <sriram.yagnaraman@est.tech>
To: 
Cc: qemu-devel@nongnu.org, Akihiko Odaki <akihiko.odaki@daynix.com>,
 Jason Wang <jasowang@redhat.com>,
 Dmitry Fleytman <dmitry.fleytman@gmail.com>,
 "Michael S . Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Sriram Yagnaraman <sriram.yagnaraman@est.tech>
Subject: [PATCH 7/9] igb: implement VF Tx and Rx stats
Date: Sat, 28 Jan 2023 14:46:31 +0100
Message-Id: <20230128134633.22730-8-sriram.yagnaraman@est.tech>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230128134633.22730-1-sriram.yagnaraman@est.tech>
References: <20230128134633.22730-1-sriram.yagnaraman@est.tech>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: GVYP280CA0028.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:150:f9::10) To DBBP189MB1433.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:10:1e7::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DBBP189MB1433:EE_|AM7P189MB0661:EE_
X-MS-Office365-Filtering-Correlation-Id: 3f49075f-74b4-450a-92fd-08db017144db
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: +DJS3sPY2jDD5kRT/ckYlIuERVqrqcw5tRlWcXgHGaAvwhUhVSxLOMm+QnCR5eJRe/sBvTSzC6OZ3E/Upi5xtRuFE7g6FXPyprZl4kU+fGLg0d3VKgQzu9scRZozkbgyO/CvBVP4al76A/odcyDuvd9EQFGEj4NNwuUFKX/2Eb4aKwtb48x4z1iThdmbvSrA2bjsWishiXIsgbKQe7qggr72jAYlCjeywb+Vpa3QG18831um8K0ZtOygFdq7eg6fBamjsSBV+0SiswgVl7Wlcz21IcapFxJCMTnlIcFd9NECvKga/9+aIQd5V6tV8TJ4JoEj4gmKAwTlQsoSXMkqynIxMNEnLc6qR8F2wjeACI0xZ7icWkY82QD8dkgO/pxb/KOG5Nwx9RJbFysWQez8kLyNorQVWgo3PoQrhWfuhv+O7VWHpw9fwiHqHLvOBVe8//6KNyuDapdAeOP+hA3J54sgzYqEioHmpNZm9I6+Bq8mbgv9ORK0J82n1TX+Z58VK+WtsLkhsZjGxoMuTeonyQ/PtFw8kYzDSj00mNqLk6chATpn/KzytKvMphVgTwUfuQoFMntXiZrJzwE7u4qtgB7TaE1tLqZ4ml1vzvFVzqb4A2oFZyA6O/6EOPwcQ/1GZe6GQvM2t0QMY16C6STK76ZIm5mUuREDCLLzwUGarKf/kIZAFbpnjMWc9NEdDnBqp18mzecRVOnFTMd55v5AnkoOlUrQSOrKy7nUTHmZsZM=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DBBP189MB1433.EURP189.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230025)(39830400003)(396003)(346002)(376002)(136003)(34036004)(109986016)(451199018)(8936002)(41300700001)(86362001)(2616005)(83380400001)(810100004)(38100700002)(41320700001)(316002)(8676002)(54906003)(36756003)(4326008)(66556008)(66476007)(70586007)(66946007)(1076003)(6506007)(6666004)(6512007)(26005)(186003)(6486002)(508600001)(44832011)(2906002)(5660300002)(266003)(37730700002);
 DIR:OUT; SFP:1501; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?8QpLW2LAVUCTGVdZHI5iriO7bBKpiAIuL9MqEvXPa9eyaKIeVmN+hUzj3WV7?=
 =?us-ascii?Q?rKE2LQ0ITRXcbJRXvQwM5RwBvvv2+AxQtzskw8LFMxaZcOvaa+GaJlU0CISf?=
 =?us-ascii?Q?NrhvidRWIKvwLyVEcXSrlw82cUZYYsHNvbTB4LIbkuUniNe7kYt94WSs5b5I?=
 =?us-ascii?Q?TrsfJd0ZTPzq+aSOcuzqs38VMv34qNdmWZZL6Zht2M1zCh+Oc9Osbplj/m5Z?=
 =?us-ascii?Q?KPZsNVsp7tqdKP5HpdHsb7VL8yRcw3uvrsHkFf76kK26WZfXtIRRQooKbwfq?=
 =?us-ascii?Q?f5CLblbgTGwyBtiF/T5zUpmQdZka5GYqyiNa7NChMc7iRi/FQyxxgb62vzLh?=
 =?us-ascii?Q?MHL7Rb4D7UkjMfsGUJwzhkoJu9fjjRzqff8cbNSSKRBrlVtn+aguXO8RFf+c?=
 =?us-ascii?Q?7GO7K12tq4ZOKWEdB52Z/xWxrsabQQpu2Rz3nUgYp4b47LTAHWKFMOCr9wB3?=
 =?us-ascii?Q?LSM8SDUppclHEAD0Swq49JrCHb/vKuzls1LJXitn+S2m8/TeP8T2uq8lGtj2?=
 =?us-ascii?Q?//rsahLmsLml6r4pfWIRABr2DPrjJ2CLuLIKiQrnTGfwvioUjwcX5lvCy+aB?=
 =?us-ascii?Q?WRz2tDSwJrqejImN2mn3/y9Olo+awW4NxwJmSmcQYWp1cW0MsoNb89Sn6Gbt?=
 =?us-ascii?Q?kXH5v/QQwzMGKOLXhymCC0X/ZEHhNZ0elnuOMiUWjzB2L552a+jEHE4JswTC?=
 =?us-ascii?Q?OGICkWyHFxt4OxKhWbr/ooT5JSUjq19EzYqxSBm4jpyuIj8532rmshMQwvxP?=
 =?us-ascii?Q?ttSq501VsjGExZrt/RRjRm+XB1IhoAfb42tH/d9Zkniu4SFI2apM1ns01A2W?=
 =?us-ascii?Q?2ht2x2T8GO5Xqg16NHzsC68wRYJ3uVt8DXpvmi8rh0EFw6pGTgp0VLDBW7Zh?=
 =?us-ascii?Q?mAEjpDstqBdfvpW4G2qkJrQPL/BzcdCjBj8zMOR7ddOwxazeAFSlqa68L3M0?=
 =?us-ascii?Q?eaP613FOIFHoj2ZCS8Z+S4s+FSsaRiF7cIcLEGD1igB2N9twVQwGEhhI6lz2?=
 =?us-ascii?Q?T+FSecZyCVKDHzLLN6xoXHu1VtX7BV5cBPDc266gObe5f5Kx4NGcMAu2WcaV?=
 =?us-ascii?Q?50ape6wfLieXkCPNIkPdGoF7HAqEypsyOMhOPznlloWHtyaH3US9dCgZ0jOP?=
 =?us-ascii?Q?Nw1YNC9AxrE00oBIzNnOCSAULBJdbRQwLY8kXOwFpPSTlq7HJgP43SEHOTZA?=
 =?us-ascii?Q?XtXySJ4ZlKcNRHF5mg/WLYGLjQ5vsvsdT4MhTBZCuEyXY5OskjGk61Uiz8MJ?=
 =?us-ascii?Q?iMZExhw8n7eAD03ZvG9L/XP4HTxhDHkBOrDeQ4r4TeXupqqAKoeg/Du+JChP?=
 =?us-ascii?Q?aACWgUMz/Dcy0sRA5roZDWR7nBxigmUCKmW2T/KmGIgVd/ux1HM6h0U11JnK?=
 =?us-ascii?Q?b4eFV9fnFcjSKZGHDB6QpRlEM5P91AAOxkig8VCnt/9wYgztW0/VD6qxc2B+?=
 =?us-ascii?Q?gfbuTEoHYEuI8wbuGRsZYjwX8subIHC8dZcFcXr2tCzm5avpQ0j+CvlLqmsV?=
 =?us-ascii?Q?EXP2P+hvPHULyXhXOa6iVtRRyXf1KaWNQuzxPL7TnNs8BtQ91vv3HFeLgS45?=
 =?us-ascii?Q?nwZeq0PeAyfI/1eNJjdTxBo4TYWs+MBs93G7pRWa86uridoCVR3idD+mEPiA?=
 =?us-ascii?Q?VQ=3D=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: 3f49075f-74b4-450a-92fd-08db017144db
X-MS-Exchange-CrossTenant-AuthSource: DBBP189MB1433.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jan 2023 20:50:20.4991 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Q1t0Z+zLolHR+7ExzKoCw88z7vDLGcUi4sKE+SGfUIgr0duoJlA+hm6kCLXp2sZL5NATRgOeR98DHqSbGPicpOxIWR+KIw1Hh9+xZmBLcho=
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

Please note that loopback counters for VM to VM traffic is not
implemented yet: VFGOTLBC, VFGPTLBC, VFGORLBC and VFGPRLBC.

Signed-off-by: Sriram Yagnaraman <sriram.yagnaraman@est.tech>
---
 hw/net/igb_core.c | 31 ++++++++++++++++++++++++++-----
 1 file changed, 26 insertions(+), 5 deletions(-)

diff --git a/hw/net/igb_core.c b/hw/net/igb_core.c
index 43ff387b16..375d9d5e34 100644
--- a/hw/net/igb_core.c
+++ b/hw/net/igb_core.c
@@ -488,7 +488,7 @@ igb_tx_pkt_send(IGBCore *core, struct igb_tx *tx, int queue_index)
 }
 
 static void
-igb_on_tx_done_update_stats(IGBCore *core, struct NetTxPkt *tx_pkt)
+igb_on_tx_done_update_stats(IGBCore *core, struct NetTxPkt *tx_pkt, int qn)
 {
     static const int PTCregs[6] = { PTC64, PTC127, PTC255, PTC511,
                                     PTC1023, PTC1522 };
@@ -515,6 +515,14 @@ igb_on_tx_done_update_stats(IGBCore *core, struct NetTxPkt *tx_pkt)
     core->mac[GPTC] = core->mac[TPT];
     core->mac[GOTCL] = core->mac[TOTL];
     core->mac[GOTCH] = core->mac[TOTH];
+
+    if (core->mac[MRQC] & 1) {
+        uint16_t pool = (qn > IGB_MAX_VF_FUNCTIONS) ?
+                        (qn - IGB_MAX_VF_FUNCTIONS) : qn;
+
+        core->mac[PVFGOTC0 + (pool * 64)] += tot_len;
+        core->mac[PVFGPTC0 + (pool * 64)]++;
+    }
 }
 
 static void
@@ -577,7 +585,7 @@ igb_process_tx_desc(IGBCore *core,
                     core->mac[VET] & 0xffff);
             }
             if (igb_tx_pkt_send(core, tx, queue_index)) {
-                igb_on_tx_done_update_stats(core, tx->tx_pkt);
+                igb_on_tx_done_update_stats(core, tx->tx_pkt, queue_index);
             }
         }
 
@@ -1364,7 +1372,8 @@ igb_write_to_rx_buffers(IGBCore *core,
 }
 
 static void
-igb_update_rx_stats(IGBCore *core, size_t data_size, size_t data_fcs_size)
+igb_update_rx_stats(IGBCore *core, const E1000E_RingInfo *rxi,
+                    size_t data_size, size_t data_fcs_size)
 {
     e1000x_update_rx_total_stats(core->mac, data_size, data_fcs_size);
 
@@ -1380,6 +1389,18 @@ igb_update_rx_stats(IGBCore *core, size_t data_size, size_t data_fcs_size)
     default:
         break;
     }
+
+    if (core->mac[MRQC] & 1) {
+        uint16_t qn = rxi->idx;
+        uint16_t pool = (qn > IGB_MAX_VF_FUNCTIONS) ?
+                        (qn - IGB_MAX_VF_FUNCTIONS) : qn;
+
+        core->mac[PVFGORC0 + (pool * 64)] += data_size + 4;
+        core->mac[PVFGPRC0 + (pool * 64)]++;
+        if (net_rx_pkt_get_packet_type(core->rx_pkt) == ETH_PKT_MCAST) {
+            core->mac[PVFMPRC0 + (pool * 64)]++;
+        }
+    }
 }
 
 static inline bool
@@ -1481,7 +1502,7 @@ igb_write_packet_to_guest(IGBCore *core, struct NetRxPkt *pkt,
 
     } while (desc_offset < total_size);
 
-    igb_update_rx_stats(core, size, total_size);
+    igb_update_rx_stats(core, rxi, size, total_size);
 }
 
 static inline bool
@@ -1490,7 +1511,7 @@ igb_is_oversized(IGBCore *core, const E1000E_RingInfo *rxi, size_t size)
     bool vmdq = core->mac[MRQC] & 1;
     uint16_t qn = rxi->idx;
     uint16_t pool = (qn > IGB_MAX_VF_FUNCTIONS) ?
-                   (qn - IGB_MAX_VF_FUNCTIONS) : qn;
+                    (qn - IGB_MAX_VF_FUNCTIONS) : qn;
 
     bool lpe = (vmdq ? core->mac[VMOLR0 + pool] & E1000_VMOLR_LPE :
                 core->mac[RCTL] & E1000_RCTL_LPE);
-- 
2.34.1


