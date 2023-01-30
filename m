Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 46AA0680EE7
	for <lists+qemu-devel@lfdr.de>; Mon, 30 Jan 2023 14:28:55 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pMUA6-0002HJ-8f; Mon, 30 Jan 2023 08:25:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sriram.yagnaraman@est.tech>)
 id 1pMU8C-0007zK-DQ
 for qemu-devel@nongnu.org; Mon, 30 Jan 2023 08:23:49 -0500
Received: from mail-he1eur04on0730.outbound.protection.outlook.com
 ([2a01:111:f400:fe0d::730]
 helo=EUR04-HE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sriram.yagnaraman@est.tech>)
 id 1pMU8A-0006AH-GJ
 for qemu-devel@nongnu.org; Mon, 30 Jan 2023 08:23:31 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lQKteGl37ebvmOm2d/f21QdlIXJEwWjkzFa9QRxChytP6bLHQdAt1vGL0By9DCKC5hW2IhTNicUSunRQ40/qNkQnhl2XKyQ6PIOGLh9Cdi1zPzfJVNqXzIONdFzYWQYmVyfYAc9u30DZM+GWp6iTmMZwpWN8EfYmcLvBNd81pcjTKt04Kxs2+BKkPlidF+pDIaNgry1BBp2vXto7E4zMtQGfgZXlSzaO0zEvvUsfGlCq7GFdHBTwOeeKsHLxgwpaESo+CCP3pzh+EJdCqqSFYRWRNzqAcHg5foR4CQZ4NpkE+Xc4R4GS4kY8xP7O7S5q4pRBWrStKwwGeyBedt0+YA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kYeiHvKUBfCAXNtp/E6965ZC1ioE/jP3gr/WIC2RLZM=;
 b=SEfq5QmPQhhuu8IJrKwvk4Bw3MGcCYx/FDpa75IIeYnY1CMjS/k2CXNwwuy0D4veFmvCQs6ucUTsqZQ9NxNoJbVTbiDH3d6vG7ffhHRli8Y211U14Vcjg85rO+K6eVizizJO5Tpk1dhGdFc1U+tq44Jw0lKANTBKomvfD4NK9XYRbUckbLkLeaOIj3+Rtben/1hrWF+mepb6gfi2e62Ao7ND1LD4jBzqgQCJ4JCaQ5/BkIJZWDAu9WGwlgqHLJ8ygY2oxdTNgthjNPId9qt0nD0Y6XksNgS34VK2d7nCZDzBsbw9xpHT+aNln9v1FtBZE5fDewskbrNTphetNqk3YA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=estab.onmicrosoft.com; 
 s=selector2-estab-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kYeiHvKUBfCAXNtp/E6965ZC1ioE/jP3gr/WIC2RLZM=;
 b=NK9e3yieNeogBxFP0vMYSbqH6PkmVR2ewGMu1hrxBfte2Hj4rHLFXqvx4m9CA8k+u4qelTFSPreIroYodudydk08E4AD0VZwWBdJHasFMXVeztW/xxO+DOByeRwleuIxvHs4/pvV5RpGk2b/t8M3A7jMWvqa9BIO1loiBxqsuJs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from DBBP189MB1433.EURP189.PROD.OUTLOOK.COM (2603:10a6:10:1e7::15)
 by DB8P189MB0885.EURP189.PROD.OUTLOOK.COM (2603:10a6:10:16f::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6043.36; Mon, 30 Jan
 2023 13:23:12 +0000
Received: from DBBP189MB1433.EURP189.PROD.OUTLOOK.COM
 ([fe80::8f70:435b:ab64:9420]) by DBBP189MB1433.EURP189.PROD.OUTLOOK.COM
 ([fe80::8f70:435b:ab64:9420%9]) with mapi id 15.20.6043.036; Mon, 30 Jan 2023
 13:23:12 +0000
From: Sriram Yagnaraman <sriram.yagnaraman@est.tech>
To: 
Cc: qemu-devel@nongnu.org, Akihiko Odaki <akihiko.odaki@daynix.com>,
 Jason Wang <jasowang@redhat.com>,
 Dmitry Fleytman <dmitry.fleytman@gmail.com>,
 "Michael S . Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Sriram Yagnaraman <sriram.yagnaraman@est.tech>
Subject: [PATCH v2 7/9] igb: implement VF Tx and Rx stats
Date: Mon, 30 Jan 2023 14:23:02 +0100
Message-Id: <20230130132304.2347-8-sriram.yagnaraman@est.tech>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230130132304.2347-1-sriram.yagnaraman@est.tech>
References: <20230130132304.2347-1-sriram.yagnaraman@est.tech>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: GV3P280CA0039.SWEP280.PROD.OUTLOOK.COM (2603:10a6:150:9::8)
 To DBBP189MB1433.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:10:1e7::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DBBP189MB1433:EE_|DB8P189MB0885:EE_
X-MS-Office365-Filtering-Correlation-Id: 1a2c1170-ce19-4aba-9aba-08db02c522fa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 7sTOg7eKLro0064Kyy6AhssxqP0YMzSccs3NzdoSOLABUwdZsaPkUZAmb9CR04y0vczg4n4v9OIRkMyeF+buj/kgEFQ0uBf9+PcgNbjbYeeK+QvDsry+YrmHZIKm5Kc5rkDLVG8ZczdC17x62MQ8Yn9Jw67JxYLkiLh16b/GF9AdzX6yrVrLmRemTv9FMDpS/hhT5w/6exDKtkf7zU8wS+QVpizJssMmAYat/q8ePu+LryTALO9Cn+o0HDxptI3Xoad46o/W16St9Zab15ZKptuKdpOZ7krWKPB+hX4/6ZxZI8Jf2zqFMlSCo4hHLLoHLqjV8QVSptnaq3D8pq8paXI9eR0fNyIZna56By+VC+4JMGhgkibdnBVEVQgwQcLkC3+0igwB/xC7fPgBAbizuXVf1u+NDCTEBjNNbsb7K7EFRXe2s0+5kNYwDtkIFWETMCA1uXgLDjf+BZy+CTs7dJjZgOXH/7RTGurGjxdbBQoCejRgf03XsJ0TKM8wJFFhpFTb5kmXtxjY/QffqCKcxHmRONdAUTT1eonaUfoCEFmUnstOmJI9mRzEq6VBOhYV0wsQn1XbkzARjKCR0v1ONRghjhT18o0pta/3eZZJ/kvEXIKCcGxEtydo5dvCKZdv7SL+yVEf+T8Ln7/fqDfOK01tRqv7A8sTwLDlAhP6dbq4a/fWaK9A91AkuGDg3vR9EvMLGHs5j02Kk9xlkqyPvjDSXx4vImNa7h7e0bAafok=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DBBP189MB1433.EURP189.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230025)(346002)(376002)(136003)(39830400003)(396003)(109986016)(451199018)(86362001)(38100700002)(36756003)(5660300002)(8936002)(70586007)(54906003)(66946007)(66476007)(316002)(4326008)(8676002)(66556008)(2906002)(44832011)(83380400001)(2616005)(6486002)(478600001)(41300700001)(26005)(6506007)(186003)(6512007)(1076003)(6666004)(266003)(37730700002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?QUwrPwTFWB6QiRXpOOcMdqj3hdHgvcLZS2Wo0acnAxSWQ37Ro0vcoWDyOKAr?=
 =?us-ascii?Q?w8L64oM4nqokgke+PAQGWCOIIZTS3JaNehY0/IH0hpmkU43AMNMwiRa3Hao9?=
 =?us-ascii?Q?TNjf4BwzXkxFXlYxsC1JArCf2/pz6U4GJwBiOnfG2KdOVA495sxhD/5vihsQ?=
 =?us-ascii?Q?sjlXtG3ZYgZ7gwG/ld2Ly5ygc0hyPMi+lQQmn4283SPlJAAxYgwYbpHllZgN?=
 =?us-ascii?Q?Y+ukSdsLZz9KFTqVdRS51nf+wa1gzi6fxbPO4MobGnUrRr9rMY80toPiU+pG?=
 =?us-ascii?Q?LdPL8uL1l7LRquuhA4NKlDRy3/XWw2oQwsCEWBJLEqJ4+UlupGJEzRp+ZRjP?=
 =?us-ascii?Q?TOEnniIMWYE6A9d2xtzMzlWnIUCn1MDP/+WjAURPZiyjrY+4I1d7kskk/ilO?=
 =?us-ascii?Q?n1AZUDjoTOiVlkv+d6r3fhzeN4uXYspaueLaqATVXBYhbdp7nvLyJkBLqf6W?=
 =?us-ascii?Q?9aXXwgJ47CT/uVRDtZ+IjKSvJsPQBQc6DP9jgfNto61HVWGN+tyANw7Yj+/n?=
 =?us-ascii?Q?3E1w18BbpI9F09RI1V67GyxzrJZVRjCUx8uAaJl+nasKK8F5jcuagB5a4xhM?=
 =?us-ascii?Q?EbYkwvytfL/m9KTHKzzzUIc39KR+PMxednoQ/LsFYHWXocqCPG4ZK774al1K?=
 =?us-ascii?Q?7ljPFYSL2u5NNpvsB/31mfej4a5B8+6MMO/TnKCtnlNlMhW/MUK2Ua5A0PQw?=
 =?us-ascii?Q?2OqrNweNguZwAkZZA8HqKcpVxueqvn3M5nnJdPGvwUBq60M1XQKrUu/Yx0zy?=
 =?us-ascii?Q?ecxLbHCuc71DZIEt1otEFZEJBCVyBG/NmZWMQ+r4i+gW5Bm+NOz5vwhH4iIs?=
 =?us-ascii?Q?uCIJW3TVMcXlzXuk4zPWdQ689s+riQ0386a+ttibzunJDPwppoNhwasJe8XD?=
 =?us-ascii?Q?2WLM3ecIXYFoXSKR6Pdc/kvILykzgOQgO8kT0SFF7NAH/K5Pr2mYwIrC+GZe?=
 =?us-ascii?Q?WvDU9hFpT80wH8A1hE+4Oo5l8rOfgRD5Fk78BA1qv1AoLdlOToUqrcFlAMyC?=
 =?us-ascii?Q?aHWNOoH9a4AcfIXJp8o8DEk8gQ+BWuF25631MyqzS/4W3eTxYr5XB8fRs3//?=
 =?us-ascii?Q?OGYmjR3IbjQbWP5SdwW0A0m+8J4wRIcgkJJ3SQk1P2VPcI2pZ/nPdVYTzpWC?=
 =?us-ascii?Q?X3eHRbW8gBxy0yKHZgnUkEn7iQ9ryIfl4CZ/tBuXB/u0BxAG0RXMuuHXeOC3?=
 =?us-ascii?Q?1yBFpevupMFXioxsR+6iPJ61u30BU4Xg71/agEWEdZ4LDKle1MFbCn4ONyNE?=
 =?us-ascii?Q?Jb06o9eK/eGRgSkNR1G+QK911zpFvXu1yc9gMvLxD+5J87y9LggztKzIPkS7?=
 =?us-ascii?Q?ymMdAmism4mQ05D5P5JL5wcwCNXYLEWRWLfSZ3hSZL2UMAqqyg1Pm6vmZfep?=
 =?us-ascii?Q?WPSVhhb6tvNLYHuQB/MoRIQEPDG90nvE1PmJbqTvHrs0eiiO90jWizC45fF+?=
 =?us-ascii?Q?TYbLzfJTUAY4TpGqW4TItfr1hX4LhZo8ZsnGV7qXyJCsmWaVJUugKT/34zuQ?=
 =?us-ascii?Q?5msd7vI8Y7+iLn6Mh+qKxL0LWN7mSOBWt51jLga63VEYxxGkxmb++5w9D6mD?=
 =?us-ascii?Q?ILYneQReuLfNBymLAWCqiWcHvXeXXaAx943X8vrizEbwaqw4kKuUF/tXEFPh?=
 =?us-ascii?Q?Fg=3D=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: 1a2c1170-ce19-4aba-9aba-08db02c522fa
X-MS-Exchange-CrossTenant-AuthSource: DBBP189MB1433.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jan 2023 13:23:12.3124 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rkW8k475V2HneZzuBKYy48ObPAxQrzwyg8nFopx3HpMJXhl+o0QRkW4LI8aBdhKt6DPwWAQpqD+Bv8vIlGSjqPnX1ULGENlMpFjtMbSsEfw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8P189MB0885
Received-SPF: pass client-ip=2a01:111:f400:fe0d::730;
 envelope-from=sriram.yagnaraman@est.tech;
 helo=EUR04-HE1-obe.outbound.protection.outlook.com
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
index b41b1a5d21..89cad57cb8 100644
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
@@ -515,6 +515,13 @@ igb_on_tx_done_update_stats(IGBCore *core, struct NetTxPkt *tx_pkt)
     core->mac[GPTC] = core->mac[TPT];
     core->mac[GOTCL] = core->mac[TOTL];
     core->mac[GOTCH] = core->mac[TOTH];
+
+    if (core->mac[MRQC] & 1) {
+        uint16_t pool = qn % IGB_MAX_VM_POOLS;
+
+        core->mac[PVFGOTC0 + (pool * 64)] += tot_len;
+        core->mac[PVFGPTC0 + (pool * 64)]++;
+    }
 }
 
 static void
@@ -577,7 +584,7 @@ igb_process_tx_desc(IGBCore *core,
                     core->mac[VET] & 0xffff);
             }
             if (igb_tx_pkt_send(core, tx, queue_index)) {
-                igb_on_tx_done_update_stats(core, tx->tx_pkt);
+                igb_on_tx_done_update_stats(core, tx->tx_pkt, queue_index);
             }
         }
 
@@ -1394,7 +1401,8 @@ igb_write_to_rx_buffers(IGBCore *core,
 }
 
 static void
-igb_update_rx_stats(IGBCore *core, size_t data_size, size_t data_fcs_size)
+igb_update_rx_stats(IGBCore *core, const E1000E_RingInfo *rxi,
+                    size_t data_size, size_t data_fcs_size)
 {
     e1000x_update_rx_total_stats(core->mac, data_size, data_fcs_size);
 
@@ -1410,6 +1418,16 @@ igb_update_rx_stats(IGBCore *core, size_t data_size, size_t data_fcs_size)
     default:
         break;
     }
+
+    if (core->mac[MRQC] & 1) {
+        uint16_t pool = rxi->idx % IGB_MAX_VM_POOLS;
+
+        core->mac[PVFGORC0 + (pool * 64)] += data_size + 4;
+        core->mac[PVFGPRC0 + (pool * 64)]++;
+        if (net_rx_pkt_get_packet_type(core->rx_pkt) == ETH_PKT_MCAST) {
+            core->mac[PVFMPRC0 + (pool * 64)]++;
+        }
+    }
 }
 
 static inline bool
@@ -1511,7 +1529,7 @@ igb_write_packet_to_guest(IGBCore *core, struct NetRxPkt *pkt,
 
     } while (desc_offset < total_size);
 
-    igb_update_rx_stats(core, size, total_size);
+    igb_update_rx_stats(core, rxi, size, total_size);
 }
 
 static inline void
-- 
2.34.1


