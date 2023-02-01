Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2568D68653A
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Feb 2023 12:18:17 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pNB7T-0003jP-Fc; Wed, 01 Feb 2023 06:17:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sriram.yagnaraman@est.tech>)
 id 1pNB7Q-0003ho-BX
 for qemu-devel@nongnu.org; Wed, 01 Feb 2023 06:17:36 -0500
Received: from mail-db3eur04on0723.outbound.protection.outlook.com
 ([2a01:111:f400:fe0c::723]
 helo=EUR04-DB3-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sriram.yagnaraman@est.tech>)
 id 1pNB7O-0005AG-Lc
 for qemu-devel@nongnu.org; Wed, 01 Feb 2023 06:17:36 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VXv67QsJHnhzxIIfDJVgKYjEw1L/Eb2nC424hTsZa9+0S8mCttXyWIdva42iduAebMz0TL6c4aifD4ufiR8GMHKtjZUXUb7+P3Kg8A95B3DPUCQ8lgNb8tuXW1dRHgpyqwH1T9KdbXVvwa8h05Xeb5VbNCyfmONAORauD0wIFKiVOec6Q3sZhOOXzdNK3SYydd0n/l8Xc2vO4gaBE/Ux3GgOL22DT/zB7QxT+986vHWh4MRbFnOb3KJ1tBdvvXhXgDA4RYGUtcMuvMgVJMW0pct7Mxb7t81ue9kcBbNF8p4lC3CNZ4POa/NIDG/wmGIo6eOfaG0GavRu128rMPrMuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=t5VsCVfVkCQ4ln6guIteSR/O2Ed1egWz6GVSp+tqtFA=;
 b=hk2cBG4GGdVdhKoQF2YLRu6TR3q1YQKx98Fzl2gYM1Q1PRXwA8xsurJFkn7+12ui8JmrMvQsQxD0/dRo+y8bSwlX5dyK/qMocgdphYX+DEP4WSNj9TOLo1hAVRPY3TWtd9svNR5UQoBvaHr0oYGF0L5j8YJt0o0AtLeEsVMWEaz0FlhH+SqYOsYnhGzlAOdkr/ykOtt94cBwXKAQCRqBLRfOAvsQbFMQO+hcG/U2iGkZF+PYb/7yWksupdqrhn1S/oQFFc0Z32pSl/CM8Kp8kqDwEFuhrPvRX3Lh+TMcEBzqEpc1YsDmX3DhELuMWu5XxeWIcWCKY9cIBNrODna92g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=estab.onmicrosoft.com; 
 s=selector2-estab-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=t5VsCVfVkCQ4ln6guIteSR/O2Ed1egWz6GVSp+tqtFA=;
 b=CkCynTxA8Lj7M9m2jkrM7yPgJoCuVWKZ848thV0m1B71jdjR5CPk5sCXq/qxYaMN29ElobhQ1jkRkyD4UrJ4LoP1cEXD5X9pSySTfOaiOr8i1uCTuUOWwWllIjn4BLdtOPT6UsvUCnLuSoAYFxQPx9WtIon/IXyV/6Bw1aYWcNw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from DBBP189MB1433.EURP189.PROD.OUTLOOK.COM (2603:10a6:10:1e7::15)
 by GV2P189MB2407.EURP189.PROD.OUTLOOK.COM (2603:10a6:150:db::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6043.38; Wed, 1 Feb
 2023 11:17:27 +0000
Received: from DBBP189MB1433.EURP189.PROD.OUTLOOK.COM
 ([fe80::8f70:435b:ab64:9420]) by DBBP189MB1433.EURP189.PROD.OUTLOOK.COM
 ([fe80::8f70:435b:ab64:9420%8]) with mapi id 15.20.6043.038; Wed, 1 Feb 2023
 11:17:27 +0000
From: Sriram Yagnaraman <sriram.yagnaraman@est.tech>
To: 
Cc: qemu-devel@nongnu.org, Akihiko Odaki <akihiko.odaki@daynix.com>,
 Jason Wang <jasowang@redhat.com>,
 Dmitry Fleytman <dmitry.fleytman@gmail.com>,
 "Michael S . Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Sriram Yagnaraman <sriram.yagnaraman@est.tech>
Subject: [PATCH v4 7/9] igb: implement VF Tx and Rx stats
Date: Wed,  1 Feb 2023 12:17:20 +0100
Message-Id: <20230201111722.28748-8-sriram.yagnaraman@est.tech>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230201111722.28748-1-sriram.yagnaraman@est.tech>
References: <20230201111722.28748-1-sriram.yagnaraman@est.tech>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: GVYP280CA0019.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:150:fa::22) To DBBP189MB1433.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:10:1e7::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DBBP189MB1433:EE_|GV2P189MB2407:EE_
X-MS-Office365-Filtering-Correlation-Id: d7938832-80b2-46f2-e1cf-08db0445e5a2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: z9HjlfbgYtkGNsCIjQ5DsJ71ifjzdP+Ry96IQJaHQvK7yQszi6k7k5YGurSA9YYVKEm/NFNYP19PNPrKrHCjiYIc/YCm7Y+RF8eRJSXiU9V6gQmnKJBDuii8FnA6LjxE77Soh9I6lx96XQAdUu9uX3i99A4pDzNS78/R+JNNg7Dmut0+ufjiLfxuYjf3xeBnxXejnGRzS8GD3jEOATuDGvU9QdXIzvhVOR//EpCFY9jtavL7kBz9y1DaEX5X97f57c3G4MmsslrRlcapQiNveshSR79CB+3qJJrHy6qFwsdoQGgvZbZhOu2VCpb611TAVtSvcVSlfFGC9Kr+pumh9O/aMhnkRwqncJQNgD3/NLpn8k7HXJIlhS4i6vnygD0ZogjxN7bUuh5xg8r/egHBm/B+W2n96kZxjUm6YWhCA+M5jhOklVysUwXc25wU5daK+pAG3dKGQksTV/uqGXww2R/NpiiCDqZxeh+ODZuPVCky3YQemFttRNTWZRNs81DFjvLYPZA9n7T6rU/hiOJod5al5PrMmydxuKegMVa/g1nOdpusIfK/KghIL3TFkAT6zHgHXleyp9hMOU5nollG20v5+OqMEBJgMJb5IlCU7GTWwvjsXGU61ekiLtTeS8EdtUQ91WqWyx6NvgA8eBvYzAzX1GrlJY6Tzc4khdk6I17NK8hbOptH01B6eJvJ8J9ogom5CNJ259xRoqSqn9ZS0tOzenu3KJVEQw0QxZbk4SU=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DBBP189MB1433.EURP189.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230025)(346002)(136003)(396003)(376002)(39840400004)(451199018)(109986016)(4326008)(44832011)(2906002)(5660300002)(54906003)(1076003)(6506007)(36756003)(6666004)(8936002)(66946007)(83380400001)(186003)(2616005)(41300700001)(26005)(6512007)(70586007)(66556008)(66476007)(8676002)(478600001)(86362001)(6486002)(316002)(38100700002)(266003)(37730700002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?YYtb10aH3ozkKZ7neAP/0ZiBidqlgGsN9hEsmVStp6/7AGdfHFe2zhsTghrD?=
 =?us-ascii?Q?9rY+dOVepvPUOvq/3BniT7oWw8Yr8zMPU5peeb1DUuSGIX/8kNKxYleFgfna?=
 =?us-ascii?Q?P6tgqjPnMlFaeptDOtyU4PE27JFBhwqkP3Kxa+EMsBsWjgsIy1RTGSWfY7GL?=
 =?us-ascii?Q?ft+r/Ax9hzRPHm13kl3mAr6keZ79SrzbGbRtmAjwzXmBqOKla3ddMAFM5sRY?=
 =?us-ascii?Q?h8OgPOySxD5+B1XBm2le9yK0/gPKoeNAPxHHLb8BJa67pLXf4nWVxoyv1rT7?=
 =?us-ascii?Q?LCQaDAHzRypPbql5FlRMsIOCJM1eaJV2iLc6WUFv/aELL24f3ddfRrFckyT8?=
 =?us-ascii?Q?dY+oro9ht5VXFfJOMFthMGaXA49trnWselexEbC0A2cYPdq2jgzGe25Lm4tu?=
 =?us-ascii?Q?qJCBjcmTCC5QgFpq+h6gtsI+6irNWOkbYaj6cmKuiX6hpMJ/0wR30gIBs45E?=
 =?us-ascii?Q?krWMhrPX59fUb6AKc+qycWlXOLNHXWy96C75RJMs24uwk+L6JxLUhK9xZU+i?=
 =?us-ascii?Q?vkK3KCSa4kM/9QaO4GHTvR58T2H6ITpz5zAeKc8gsBzgdNnqbtw6f/tFZLtp?=
 =?us-ascii?Q?3ZIm9s+okSilnEAsZvnlwRskmO6jYdwrJBzfjbWoG4sviKHjkkRePAT+sAx0?=
 =?us-ascii?Q?gPXzcGMvJofV9AEN90u1YgjkpxYtgGZ8EXYAskBx/HGUIQonMpzkB/3SIGLe?=
 =?us-ascii?Q?utF0V/XUwbBNp0EH2x9MVjLLPREYziV/38Ix176ePg4YkvWvqjg/YbZkFykd?=
 =?us-ascii?Q?gWJ9kmaH7hNEtT1ByhGBepVXshuZ462IiBQ9IyvSmMKz6kq3AFAFswwDZKlI?=
 =?us-ascii?Q?2XLrLLl44kze1kX8NP7EIqlFuZjH1ikOjD2fmrZVmt/QgmTYFJb6PEckj6Mg?=
 =?us-ascii?Q?8splY6HTVSzPqGNluT0kpySB+Fkcf49evtX88ZHMenwJTkZQ1IC5TvTxofNH?=
 =?us-ascii?Q?SMwYSYx8KIkRlZAQzWQGbMcKq6bgQjktTap3jSq8bvK+e0i3YL3TPNnOCWAJ?=
 =?us-ascii?Q?yV1NlaccSfEblH/iJRL2m458eBtSHDD4jrTxoDgVxaIOmxSaWvnHKtovlT2o?=
 =?us-ascii?Q?6xZiibPh19uW/p9SgyMJSeSu3tx49j0ssQWgcoRhYI7XfN3O5DSqMxzL/+/R?=
 =?us-ascii?Q?M++rw8iwxsVNg3VEmIjnkB5T3SGYys0XAlHsxly9FZkoV4FMenpzdpu/vt4Y?=
 =?us-ascii?Q?RssccJXkbe05RuskAam7ZC1v9RuNHggRObxMwCo34MRVrd1B+0N60vFsrCF3?=
 =?us-ascii?Q?wkcNJnUmxZa/xL1AEL5oqiCEDZNpQSGrWC0GtiDuteVdiiby97ulKZqcQ3FI?=
 =?us-ascii?Q?K0LOBSBF6MuT3/JIT1I3NCfsfeK7Te4TTz5OERxH7oUIZa9HKpfEWj6/QTgJ?=
 =?us-ascii?Q?KGd7q1ZNOoixxbzdH2NX4QBkIImvLw79U1YXw1pCXSfCkFaLBXBTSZM1S1pC?=
 =?us-ascii?Q?IyAk4UxQdU1+JEASKw/1vnsqsxxWuQ8euEcRCRdRz+z0nqEZeux9/aE8pGZO?=
 =?us-ascii?Q?QD6+PoHdi8hId20PklgSDZjZZ+xD+Hlac4TeoiRY+vgQRaFC6uv9uwV9i6Fa?=
 =?us-ascii?Q?Mu//lcG3RUVdDoTkcyuPOLY5QK2N/e5bHT14aTiEj4+Y6ybsguUaH9NY7hl8?=
 =?us-ascii?Q?MQ=3D=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: d7938832-80b2-46f2-e1cf-08db0445e5a2
X-MS-Exchange-CrossTenant-AuthSource: DBBP189MB1433.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Feb 2023 11:17:25.6062 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vL4Ml9zT/jobkzyTvgWuKrM6C5FYoSx7HSFfL5/GZ0pGJmmXVcOCzFv4ZMbDhhDFPcxSd8vqAt5PI+0QP9dAl1PEAt02zw7VoxKasqqA3qI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2P189MB2407
Received-SPF: pass client-ip=2a01:111:f400:fe0c::723;
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
index c0b20287f2..e9b706df9c 100644
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
 
@@ -1395,7 +1402,8 @@ igb_write_to_rx_buffers(IGBCore *core,
 }
 
 static void
-igb_update_rx_stats(IGBCore *core, size_t data_size, size_t data_fcs_size)
+igb_update_rx_stats(IGBCore *core, const E1000E_RingInfo *rxi,
+                    size_t data_size, size_t data_fcs_size)
 {
     e1000x_update_rx_total_stats(core->mac, data_size, data_fcs_size);
 
@@ -1411,6 +1419,16 @@ igb_update_rx_stats(IGBCore *core, size_t data_size, size_t data_fcs_size)
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
@@ -1512,7 +1530,7 @@ igb_write_packet_to_guest(IGBCore *core, struct NetRxPkt *pkt,
 
     } while (desc_offset < total_size);
 
-    igb_update_rx_stats(core, size, total_size);
+    igb_update_rx_stats(core, rxi, size, total_size);
 }
 
 static inline void
-- 
2.34.1


