Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (unknown [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BE976C8573
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Mar 2023 20:00:35 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pfmd8-0005sc-FE; Fri, 24 Mar 2023 14:59:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sriram.yagnaraman@est.tech>)
 id 1pfmd6-0005rz-Dg
 for qemu-devel@nongnu.org; Fri, 24 Mar 2023 14:59:12 -0400
Received: from mail-am6eur05on20729.outbound.protection.outlook.com
 ([2a01:111:f400:7e1b::729]
 helo=EUR05-AM6-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sriram.yagnaraman@est.tech>)
 id 1pfmd4-0002ID-SE
 for qemu-devel@nongnu.org; Fri, 24 Mar 2023 14:59:12 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IfmhXKCeDjEZWCnjU6Z87nGiuHaAmL65mKjq8E3u9if+QyR8ST3/U00JvYk16jvhtvstZnqJs3T7TH6+mG0zCHirK4+SVB+i+7VdWeoThZQ7Yal1KY4/8PxDZRRA23ZqrU2DqIWy0+vD2XkzEXeMh0yIDMm0oK+qmSI5gbdL2CGrLsoCcMqXnnNSfBvYqhsRhB4jlLBk+GKLAjcWIddbr+SvGN8R6RY+RJD6RnLQ6bZihhtA4K2oTxgnh+sfCtuhnQPEJrUxifXP5PG/nzn3Ngwmj4EcOgdl8tbpqD7nAOeypNEl89NYWksEF6QloZN1r7DY4qpXh7JX8IkKdV5wmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PEEjRzKALsH8Mu6wUSgfNEoaeCf4X3DidEO1qINXbKU=;
 b=geVL7eepT6297atU4r8ruDYIl0VhZH/RRjTMNt0IoGP1Zphr5LogZckjgC818qXNRYnefhk6Jj+Kv0+Ucz4deeVM7IaMiI9DbAS/MQ+iISkwxW1/+Ab4aX++XAE7S08e9nqzeUPe3DRufS5c3h2nJRFh4uF2MDOG5Yu4CuL6XZmcq16wOOP+MMN47tv8gKnPcKKRwRqDbmmWVNQHHlgsij5oC67IcrA9oG3JSs+CDmEt43QSlwSdJdM7s4/UavQkeVP0iTKknv5jaD8Y16ebVqez69xxzNeWanNDQKEUnpymXXorrdyOmTMCS+FDKd0lDmic9Rj00wvE9ZOcKaLvfA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=estab.onmicrosoft.com; 
 s=selector2-estab-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PEEjRzKALsH8Mu6wUSgfNEoaeCf4X3DidEO1qINXbKU=;
 b=GiHrWdbaQmTtcZD1KmQ7Oyg1F9+0hZ1e6IimbClqsRTSa1Bwjax4jnKuZvav4j/+uLEchcwEJQ6x2zruW3j0nchDmouy/JDPghdV7kq5oM4BfpDrDNeLgMsTCxTeMe1utZUbBM8uOPGREgF0ofyWWa3+ashCCMseSy0U8Jv3+Eo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from DBBP189MB1433.EURP189.PROD.OUTLOOK.COM (2603:10a6:10:1e7::15)
 by DB3P189MB2380.EURP189.PROD.OUTLOOK.COM (2603:10a6:10:439::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.38; Fri, 24 Mar
 2023 18:58:57 +0000
Received: from DBBP189MB1433.EURP189.PROD.OUTLOOK.COM
 ([fe80::13ad:a312:15c6:91dc]) by DBBP189MB1433.EURP189.PROD.OUTLOOK.COM
 ([fe80::13ad:a312:15c6:91dc%9]) with mapi id 15.20.6178.039; Fri, 24 Mar 2023
 18:58:57 +0000
From: Sriram Yagnaraman <sriram.yagnaraman@est.tech>
To: 
Cc: qemu-devel@nongnu.org, Akihiko Odaki <akihiko.odaki@daynix.com>,
 Jason Wang <jasowang@redhat.com>,
 Dmitry Fleytman <dmitry.fleytman@gmail.com>,
 "Michael S . Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Sriram Yagnaraman <sriram.yagnaraman@est.tech>
Subject: [PATCH v10 7/8] igb: implement VF Tx and Rx stats
Date: Fri, 24 Mar 2023 16:35:00 +0100
Message-Id: <20230324153501.20695-8-sriram.yagnaraman@est.tech>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230324153501.20695-1-sriram.yagnaraman@est.tech>
References: <20230324153501.20695-1-sriram.yagnaraman@est.tech>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: GV3P280CA0116.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:150:8::15) To DBBP189MB1433.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:10:1e7::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DBBP189MB1433:EE_|DB3P189MB2380:EE_
X-MS-Office365-Filtering-Correlation-Id: 2c6ac994-4763-4396-cf31-08db2c99d0fb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: aW7C2bGKt4Umx1iHR6yauhypEpzBOWbox/dlEXJZehB3Qj92qdpX1eR7xBTEclzJ4Gj5qLGvRWW6fiuaY274jK1YtTCT+BCVulYfxd4CMll4OQQmcJrLGBXpoPu6I7soQC14Rlap6QIVepNuh6w9d+KV+6eJyLjDn7ny+wQtIpSiMFvSnRoD1N65Gnh8qttItnQo1hv6mfYPQ8zZI9kMgMoiTF4ZivMWhheuT/Dy29IOpQXfDHuxaWI2kG6IWBQpvmYcgpWhyHzI+7uX9jCtt1tqpDrNh+YM/gF9VN2oslZW17mImvDZDfbEuS1m30kmMRKXjNWTiojqjMGQOlYje6Pm6vE3cd/jylv5RrSAGi0IVZStiity7TlbMnPAXue47uUmZaAQDBZXlNQlss/MufWiI0RDs4nuu4kjECp7GmTQ2SW+nml80omf/HrCFaVhjBetscE1fsD9ypnBdBRojW23fdAt5mzqcuX1SBRy4csiCCfgIVzDWnowpOvDVgUxqafMg97dzCtKX6ckvlrY+qoEKfcTx3pcVMKP0WlC+kiiG5j+YotHGDriV+Mjz7zPHcIM0Iph1y9hjE/umN7ZHyQFDZa/Uzkwb7HTwODEz2DPz0PIPoBoAEsPLfJAJqpJzn2ZNdr4BQs4CUY4JtW28A==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DBBP189MB1433.EURP189.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230028)(376002)(136003)(396003)(346002)(39840400004)(451199021)(109986019)(66946007)(54906003)(316002)(66556008)(38100700002)(8676002)(70586007)(44832011)(66476007)(86362001)(4326008)(41300700001)(36756003)(5660300002)(8936002)(186003)(2616005)(2906002)(6486002)(6666004)(26005)(6512007)(478600001)(1076003)(6506007)(83380400001)(266003)(37730700002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?5yslaih7z0Zkb8xzz9b2+MIZkISEkMtEaljw4OoA+E4t/mjwChZJSGo/bpdS?=
 =?us-ascii?Q?8kOQNlaQlJpvfzYlSqgaqtx+ObY8/Zg6Sqjvokeea48e54b3RHnM108EuHM+?=
 =?us-ascii?Q?wYTj+MpWyRbMdFfCrwyfuhM5GQibaWWaWzwE9/xw1KQH3wQQUKuYVE3hZIO7?=
 =?us-ascii?Q?10szREPtvhJbWRE0TGAmpUx46086f8KYE+iqLGvPmSVf0/LbvEiEmGjrGu8z?=
 =?us-ascii?Q?7J1QNGcQ3NR+BHJdzY7ZqXjzEh/PPfx7WYL11PxOfWQPh2nEgR/+yyTR/xqv?=
 =?us-ascii?Q?CHqn9uhEa4GkkZp//y+K8bKc+3JdTxDPNf5i2IUn7SlVFwPEYGYUkyujSEzk?=
 =?us-ascii?Q?JHOvRGGqUcN1scxGom5/z6e2xm/7btIAyipl/2oSBKnsAy1xXzTyGPxVOmrf?=
 =?us-ascii?Q?+Ixvye22JZVXagv2xHYWRt6PGBdR3NwNpWMrZtjqh1xSj4/F2FbY4poNproH?=
 =?us-ascii?Q?nMv68tePNZZCoYESD/P4OSAt0m9axT5E5q+U+tG+6tL7m6pcQ0npSsTJWsLW?=
 =?us-ascii?Q?F/akc2MSwjThWYxuMt6UzW3X7AXmh34JiWvpZhvtmWRVbn3pEZQKdnvf1sir?=
 =?us-ascii?Q?fuBYpW37n2KF7ed3jULh7LcOp0jeoQSYKgWRwDTBntT0fqPmj8zhjqkYg+K9?=
 =?us-ascii?Q?PjTlnxLEv8Ybp0QKm76f1zQ396+pC/AaL0Iimi3vE8O3AxD1sfbOF9Osq328?=
 =?us-ascii?Q?QJPk6JhwHZvU4hzKPdARS+69+zOuF5BxSan5yAz0BRPHWsGjATxBgNaVjx+R?=
 =?us-ascii?Q?oVdtf+Uy53+UiLxyQfXQCq6+x8BfQY1RvvpyHZdhA9jzustqoKd7cCwiJzpf?=
 =?us-ascii?Q?e+ygHWnv05zaCpgNIG1EiwAI9MT+OWIz09e3zOpr7wBd7uBG3LSR7ME9L17X?=
 =?us-ascii?Q?rZctNSGkZR0q99R8TwjZ951IIOXW2ibhljhvzU8qw1haWM6On4GBnhoTWwyw?=
 =?us-ascii?Q?5EV6aFIxI7AFwXpSrzAhCv7GkzPio4556U6oxN4LTQnoI8VE3jeJuTvoFz0g?=
 =?us-ascii?Q?IaJYx9Bgr2fXj0dnggIRJvSZCOa+t3tzSq2gy6SgtBQHU21bpwsiNtwgyTzK?=
 =?us-ascii?Q?PCE6x9JWUZzuE3oJ4kZAIl2a1GpQSmVQj+P4oE+9wuSETDSb19wkiq/sVEUo?=
 =?us-ascii?Q?4X0IvF3lQpb/D8YJeSwrtaBsDlLRWrMLIS0E7SLu23YhdLm5tJbGYy75k6ry?=
 =?us-ascii?Q?YbW7xA4ZXVz6xLXMr+dxwLQ5lKfd2CvtjW4vANd221cHXk6rfGzu9/H9nPc1?=
 =?us-ascii?Q?Xj5EurL+tsjg2PTwTPkUOOA+Rqkg4NQsBz8VDTXuLl5EOmtrOgSMyMjrn9kG?=
 =?us-ascii?Q?FckjVLRxDMSlkUC9bESXFZmGfkPLZOxWvs0qr15V00uFq0xFFncQKDH8pdtg?=
 =?us-ascii?Q?7TAd9yaa1H/TheNDjh4Fu8vrZh5vKiJAC3i5w9QxEuCD67v5aYfU7B9eIDcR?=
 =?us-ascii?Q?pGE0ml6vp6v5t5Ny9CXCQJGQJV1vTjBg27LbwlKf6Nj97ZByjqtxZcJSZnv4?=
 =?us-ascii?Q?NRzVFfHasEoNsk5EDFk/4fpULoxYtTs3/+3S6fpKpAmODb1WPdA/P74s1YIa?=
 =?us-ascii?Q?x1NV8Dc9S6nIzXWUnU/e2eh2xQTCsCOwob4qEZ0pwrdP6RFOJcaGTEX60050?=
 =?us-ascii?Q?lg=3D=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: 2c6ac994-4763-4396-cf31-08db2c99d0fb
X-MS-Exchange-CrossTenant-AuthSource: DBBP189MB1433.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Mar 2023 18:58:55.2245 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TJokSTpIcfbWX/QlDSIRrWjSQ8faf4O6PC3yPX9Vz0xX+Md/568F0Smji4SKKDA+XoeAzDozIfY2888x1pnAb4SrLMIVpQ7pcNidKp5Qhf8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB3P189MB2380
Received-SPF: pass client-ip=2a01:111:f400:7e1b::729;
 envelope-from=sriram.yagnaraman@est.tech;
 helo=EUR05-AM6-obe.outbound.protection.outlook.com
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

Please note that loopback counters for VM to VM traffic is not
implemented yet: VFGOTLBC, VFGPTLBC, VFGORLBC and VFGPRLBC.

Signed-off-by: Sriram Yagnaraman <sriram.yagnaraman@est.tech>
---
 hw/net/igb_core.c | 26 ++++++++++++++++++++++----
 1 file changed, 22 insertions(+), 4 deletions(-)

diff --git a/hw/net/igb_core.c b/hw/net/igb_core.c
index fd61c6c550..162ba8becf 100644
--- a/hw/net/igb_core.c
+++ b/hw/net/igb_core.c
@@ -492,7 +492,7 @@ igb_tx_pkt_send(IGBCore *core, struct igb_tx *tx, int queue_index)
 }
 
 static void
-igb_on_tx_done_update_stats(IGBCore *core, struct NetTxPkt *tx_pkt)
+igb_on_tx_done_update_stats(IGBCore *core, struct NetTxPkt *tx_pkt, int qn)
 {
     static const int PTCregs[6] = { PTC64, PTC127, PTC255, PTC511,
                                     PTC1023, PTC1522 };
@@ -519,6 +519,13 @@ igb_on_tx_done_update_stats(IGBCore *core, struct NetTxPkt *tx_pkt)
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
@@ -583,7 +590,7 @@ igb_process_tx_desc(IGBCore *core,
                 net_tx_pkt_setup_vlan_header_ex(tx->tx_pkt, vlan, vet);
             }
             if (igb_tx_pkt_send(core, tx, queue_index)) {
-                igb_on_tx_done_update_stats(core, tx->tx_pkt);
+                igb_on_tx_done_update_stats(core, tx->tx_pkt, queue_index);
             }
         }
 
@@ -1409,7 +1416,8 @@ igb_write_to_rx_buffers(IGBCore *core,
 }
 
 static void
-igb_update_rx_stats(IGBCore *core, size_t data_size, size_t data_fcs_size)
+igb_update_rx_stats(IGBCore *core, const E1000E_RingInfo *rxi,
+                    size_t data_size, size_t data_fcs_size)
 {
     e1000x_update_rx_total_stats(core->mac, data_size, data_fcs_size);
 
@@ -1425,6 +1433,16 @@ igb_update_rx_stats(IGBCore *core, size_t data_size, size_t data_fcs_size)
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
@@ -1526,7 +1544,7 @@ igb_write_packet_to_guest(IGBCore *core, struct NetRxPkt *pkt,
 
     } while (desc_offset < total_size);
 
-    igb_update_rx_stats(core, size, total_size);
+    igb_update_rx_stats(core, rxi, size, total_size);
 }
 
 static inline void
-- 
2.34.1


