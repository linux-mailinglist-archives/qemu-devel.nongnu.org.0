Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E03C6C465A
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Mar 2023 10:28:36 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1peukn-0007Np-A5; Wed, 22 Mar 2023 05:27:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sriram.yagnaraman@est.tech>)
 id 1peukl-0007Ne-GP
 for qemu-devel@nongnu.org; Wed, 22 Mar 2023 05:27:31 -0400
Received: from mail-vi1eur05on2072b.outbound.protection.outlook.com
 ([2a01:111:f400:7d00::72b]
 helo=EUR05-VI1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sriram.yagnaraman@est.tech>)
 id 1peukk-0003Dm-38
 for qemu-devel@nongnu.org; Wed, 22 Mar 2023 05:27:31 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=esHiqVY7fxnoKArUUTfa/8ZuKzs4SHT5pnxuj6HPHue79LA7QIwkpMcH5aW8L50MWhNupFvOnnv16PmylOJiXiZRuVR2dWVw6GtfGlze2QLc0yhekTGxYnO06PY+Pyqkn654sF1iM1sCv9vsKXdKz00FWnGMXrEJ+EoZJ7KaWWyiw9sZIfZ4fQL59OB5qttdBUkYGfRGhDDlWecG5yP4zITvPKLD2v5eFAzPoxRtTy0uV480+lCFjFJxDhBlnDcnRC55L/VbLGTS4tdVTgKDSSf4oDnQ10tRSZLmcvFaeWa0jEstORjIBoPNYgeqodPrmC/ZlBp5RNtLDTTSNTH+qg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3M9iv/scqIQeGFWEHdxbik4dTokBVxXkAFlZ9lIy70M=;
 b=BMDqb653NAxQ+O2YoqtsJQ3eGAl6ta4uubPvfb0Sjaj1GgEC0nlJQUpX0w1FZTx9hMobITr5F9if+QdNtk4Jx0VYzkHc5Qhoixy90AhbX/MvH8d29p2ruv7URAcCQC1ql31CTmoltBLNhKnYbhLI6A9y5PFbPugYSIJwvh3wYaWC/Ku2v9PTLFkZ3pnx4r10rb2eqv6kvZytEmu/A4WKAb1H4Ath4/ZSIdyDPRkoiqYmJuyHWSHJgJLVhjnheLcEE9qmG9ZnuLHFCNGvfb86Xx1qkV/JrpHflKuUR9MN+qegGPbagg9kIQi4ruzZp4t20uMktHZKcNLBxRR5db2M/g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=estab.onmicrosoft.com; 
 s=selector2-estab-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3M9iv/scqIQeGFWEHdxbik4dTokBVxXkAFlZ9lIy70M=;
 b=mcsHTJmJk9w0omwAsi/qE568RX5AtrhUAJwQZ8hQWylxAuGtYJqcBiMukAY8VllN6oQCO5/j1rxCOETS26b0awt2YL/OvtrbxOk2GPaignNDp2X2qAEoZ5yp4Eo6xkcG/DYoFcUFvMDQ0L6I+AcFvsc1FDxLr3NhXV3kveSM7lQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from DBBP189MB1433.EURP189.PROD.OUTLOOK.COM (2603:10a6:10:1e7::15)
 by DU0P189MB2201.EURP189.PROD.OUTLOOK.COM (2603:10a6:10:3ee::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.37; Wed, 22 Mar
 2023 09:27:13 +0000
Received: from DBBP189MB1433.EURP189.PROD.OUTLOOK.COM
 ([fe80::13ad:a312:15c6:91dc]) by DBBP189MB1433.EURP189.PROD.OUTLOOK.COM
 ([fe80::13ad:a312:15c6:91dc%9]) with mapi id 15.20.6178.037; Wed, 22 Mar 2023
 09:27:13 +0000
From: Sriram Yagnaraman <sriram.yagnaraman@est.tech>
To: 
Cc: qemu-devel@nongnu.org, Akihiko Odaki <akihiko.odaki@daynix.com>,
 Jason Wang <jasowang@redhat.com>,
 Dmitry Fleytman <dmitry.fleytman@gmail.com>,
 "Michael S . Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Sriram Yagnaraman <sriram.yagnaraman@est.tech>
Subject: [PATCH v8 7/8] igb: implement VF Tx and Rx stats
Date: Wed, 22 Mar 2023 10:27:03 +0100
Message-Id: <20230322092704.22776-8-sriram.yagnaraman@est.tech>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230322092704.22776-1-sriram.yagnaraman@est.tech>
References: <20230322092704.22776-1-sriram.yagnaraman@est.tech>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: OS6P279CA0138.NORP279.PROD.OUTLOOK.COM
 (2603:10a6:e10:3a::15) To DBBP189MB1433.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:10:1e7::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DBBP189MB1433:EE_|DU0P189MB2201:EE_
X-MS-Office365-Filtering-Correlation-Id: 4e4d1de1-b654-4708-ea02-08db2ab79de2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: m5911G0UQ3EjdmD3z7mjKlA2gC43VyF4oHP02EoOhwvbwAxCry6jCDciW3ueaiujksNa7lrcblILwLorzZLYJm4pFE0qzAvyeE81KdryFgGbXzz1Y0dvfMQ0ELKYCmGAX//iahyfKeoMOVWUPPO63sIjWyZEBLvrYfm7I46bGJGHTI8bVRdBO8gtp+L3k3lugV8ngm7W8GsVoT8sVY6UIrHAsqeed45XGqhTvPuZ7ICSvo0bQ+OWTMONI5xmWobbLmUTES2vKIrm9RL0nipfSrjmDhGVXHdWe734zf+4ryGUBSLRMFfpDhSBJqv/0fDY7KOIE1q27jbEGNeiiAxkt9j9Vu9IcRb3do3ZECss3/1DKPG7KP+T37Lhzq4qoOO6lc+iXLTceQ0rVE03CoIdoKPMxxLLwARxM4dvAB0ybUgUcx9z8z0Z0f4tZ8IUhqSmz2pe0ByXBP4GunMr5Frs5wUzZ3+KXAfAPochUiv4Uem9snA9PkC4jbRbAh5cnsAguX4pcUArsG98ol10APZgax5hwAjkXfg8GYphDetZR3jC89TkBILAA1wWoOHbymIMaMssEhGlkysCCWQI1tApe2dq8nodw3W4W1ZeDnw7x+6J6wZ5thx3TRyaRw7890IUtYSXhqqobYaRHQ1ojE+sXKTrBC7N73ni29N9yX6SfnzapJ6Dl0jDjqtN1NWkXIpKHBBdY3PMpKE8B/9ut06P2k/Z2pAw7Xt2T86MD7QNhzs=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DBBP189MB1433.EURP189.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230025)(396003)(376002)(136003)(39840400004)(346002)(109986016)(451199018)(36756003)(44832011)(8936002)(5660300002)(41300700001)(83380400001)(2906002)(2616005)(316002)(478600001)(6486002)(54906003)(86362001)(38100700002)(1076003)(6512007)(26005)(8676002)(70586007)(6506007)(66476007)(66556008)(66946007)(4326008)(186003)(6666004)(266003)(37730700002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?dCrIqqGpWCdeJ7bwZcazBN6bybotqDec/uNGPSYnJlzdkAiW8odKQnGA/212?=
 =?us-ascii?Q?ksdYArypoCbJueWyalVue/8UvQMuT5Nu59zNUUM26/KcPkB/OU03a6JyYq6X?=
 =?us-ascii?Q?km+Wo+E0x9o7NezvYYLBnFAVFOdnhgkv5wsrNVKpFYRD512f2jqYZNcivMkO?=
 =?us-ascii?Q?eDny2IAxEhnB8wQL4cXmZRCF3xjEPxkdIrfbfCWVYBN9lB+IQZy6GAtmc/P3?=
 =?us-ascii?Q?VeRbVSwD8HRKqo+8RYORf6FUPIKxPqn1mReB6JLXPrMScwJIPIb4N1hcP/Qt?=
 =?us-ascii?Q?5zsEFxyuXFCWjLV2rmUTZj5cQ7VAF4MNhv7NMqYZ0FVGk9FysEhfMMI44dbJ?=
 =?us-ascii?Q?h9ULfOxcHCQL9Nyk5IBBsFxGvcc+zUYz3U77sG85ASe9M1oiR1uqw99uZVJm?=
 =?us-ascii?Q?LX5o09JgayyWZVeHEgzeyCTQmtQtUGtH0t4YxYa4INrSUOlixCjs/4hgM57w?=
 =?us-ascii?Q?1gfJtiIntiOYcns4Hbjy7Qo2Id+uW+A4hfxe7XmYcMweWbOSfnbDA8ZfaQlC?=
 =?us-ascii?Q?7mZtgDdjIDygRTeZoPt1/wJk37NvniJeBeJernNZBduCNkYill3dUj8SNSLB?=
 =?us-ascii?Q?JqcdLl0ZeUjx3tUg6Ngegc126UkI/9Y9CnUXUUH7rhAjV+W5qHrXQunFjfo2?=
 =?us-ascii?Q?anCEfRSUnfDU1cLEpLEhmrSaElqjagku5ceRYxg/LtKLo90CKKtspRDburRZ?=
 =?us-ascii?Q?QmWHeQ3hildVN0YtnoKOyAbCXhxQ/5Qy0MfuAvXC1rRfXIo84QHOngZYbB/7?=
 =?us-ascii?Q?WV5ji+iH5WjC8YJrdCrej0DEv7E6+8/iJyyBbpZxsaTW/wnEGTPMb/f0OIKf?=
 =?us-ascii?Q?4+bhgk+6YjtfQ234AKN/JSCxWvCWwO9kdiwGixLd2ATeWYaLY4pTf1m/j5ab?=
 =?us-ascii?Q?grd8GvHAh/NHgnoDgt+r7A9rBv0t9genDHbIqbNn5DvmpSu2vTUTScySVtKG?=
 =?us-ascii?Q?ysbIC6ZAX7lkLsDMxC1GlSH04xdbJtEwcBnuaVcR2rIxYigkYKcyseCHf/kD?=
 =?us-ascii?Q?UdU4t/5nq9PmDMco45w6Wf3PjUBKEGkwrXt78FeywMJQh+owrrFgUDlhsqRq?=
 =?us-ascii?Q?k+C85H6P3T2wJl7AG1Cj4vqJ+wI8IzzMZ8o39NfsYo7UZYpK8teOwWGOhnlD?=
 =?us-ascii?Q?Ge8kHEfq6suDWw5Zb4+QtrLxOZ9k0ASKw7Cbl1mIQBoBUdkHJTpD3cF0e1SL?=
 =?us-ascii?Q?AaFBhbwLXgoIuoGKL3cvnaswNwxqLj3VfNawTCTm2R62F/8j0uhcEjibVRqN?=
 =?us-ascii?Q?eUCY63tBQtsd43AbUif3EYidFZUvW0NAfSdSnbIjd51nzY5zASds5mFS4Ypi?=
 =?us-ascii?Q?AlbBPvs1ZFMh5s8ifICl15a8t0uBb0uG4Q5ztEuO0vEbPSz2+VQwJOfSWd5a?=
 =?us-ascii?Q?/C9KLEA6ZQenyhcYhqDorXOj8BFBCA8GAmkdoDcmAB8MKEjKgtyiadfkYpl5?=
 =?us-ascii?Q?h2JycNFiupaAF01mIs1PHRZKhMwcmBhBWtxauBIZ8lPVYpBIErh/ksDs9YiP?=
 =?us-ascii?Q?dRzfDENov7+1O2XmTk8p3QkpFZrV9pQfjimQGNSqFWuL55F7QlzutlkmtJBN?=
 =?us-ascii?Q?uPzof+CWRsfbHBlAfmODcfOqbA1U9TUMq8g35EyCIHpfGigkN7tIGx+sPmmm?=
 =?us-ascii?Q?Bw=3D=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: 4e4d1de1-b654-4708-ea02-08db2ab79de2
X-MS-Exchange-CrossTenant-AuthSource: DBBP189MB1433.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Mar 2023 09:27:12.0738 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jVtrXKtDvDdPyl6fHxQAOQSbtGbKNs3sM7RlctPjUGERtixbsZvMmMNbxFhM3OCL+lNTUfJoncC4+Afm095chfr36w2iaExqe84y7QntLek=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0P189MB2201
Received-SPF: pass client-ip=2a01:111:f400:7d00::72b;
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

Please note that loopback counters for VM to VM traffic is not
implemented yet: VFGOTLBC, VFGPTLBC, VFGORLBC and VFGPRLBC.

Signed-off-by: Sriram Yagnaraman <sriram.yagnaraman@est.tech>
---
 hw/net/igb_core.c | 26 ++++++++++++++++++++++----
 1 file changed, 22 insertions(+), 4 deletions(-)

diff --git a/hw/net/igb_core.c b/hw/net/igb_core.c
index fd38c7c56c..7e97a01d66 100644
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
@@ -582,7 +589,7 @@ igb_process_tx_desc(IGBCore *core,
                 net_tx_pkt_setup_vlan_header_ex(tx->tx_pkt, vlan, vet);
             }
             if (igb_tx_pkt_send(core, tx, queue_index)) {
-                igb_on_tx_done_update_stats(core, tx->tx_pkt);
+                igb_on_tx_done_update_stats(core, tx->tx_pkt, queue_index);
             }
         }
 
@@ -1406,7 +1413,8 @@ igb_write_to_rx_buffers(IGBCore *core,
 }
 
 static void
-igb_update_rx_stats(IGBCore *core, size_t data_size, size_t data_fcs_size)
+igb_update_rx_stats(IGBCore *core, const E1000E_RingInfo *rxi,
+                    size_t data_size, size_t data_fcs_size)
 {
     e1000x_update_rx_total_stats(core->mac, data_size, data_fcs_size);
 
@@ -1422,6 +1430,16 @@ igb_update_rx_stats(IGBCore *core, size_t data_size, size_t data_fcs_size)
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
@@ -1523,7 +1541,7 @@ igb_write_packet_to_guest(IGBCore *core, struct NetRxPkt *pkt,
 
     } while (desc_offset < total_size);
 
-    igb_update_rx_stats(core, size, total_size);
+    igb_update_rx_stats(core, rxi, size, total_size);
 }
 
 static inline void
-- 
2.34.1


