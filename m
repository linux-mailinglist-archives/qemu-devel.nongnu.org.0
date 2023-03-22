Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 51F676C4CBB
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Mar 2023 15:02:04 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pez0f-0003jE-J8; Wed, 22 Mar 2023 10:00:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sriram.yagnaraman@est.tech>)
 id 1pez0e-0003ii-2H
 for qemu-devel@nongnu.org; Wed, 22 Mar 2023 10:00:12 -0400
Received: from mail-db8eur05on20704.outbound.protection.outlook.com
 ([2a01:111:f400:7e1a::704]
 helo=EUR05-DB8-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sriram.yagnaraman@est.tech>)
 id 1pez0c-0002Do-4A
 for qemu-devel@nongnu.org; Wed, 22 Mar 2023 10:00:11 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nebBV8B/4AcE940M0FFCFRXjyNYOcZ0tcE2IKGXmptN7svUB5z14PbNMTA6dRyUHi5W654EZKMoquoZW/zXqcVRdSX2tehVdhnoCjMdpw0kijjsXfnWf/+v+rnC89lnKb2RJxwEkLgDoaABsHHa+wN78jlvUuwrf1Go9ZnChi1OA8OqigkKQXWjcj2qWwsycNqCuu3xcS88LfLH0IuPXcDYLkFUZqBQmfMagHeis2iBd6EwFizIZ7SBiXEz5kraCmyzt8I4P8r4j2xJiWuib0ZjSQR8UyIzey5H4Xv4kn04NhSI0sTWlw5YwB2E9c/MI38OyA2iy4dgYR+R6lx6v2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ireoCQZ05DXXs5CGCBJkJTK2s5ErNwIgT9doCBVQXKM=;
 b=hkRxCB6Z1/wBelDOdjGZPDAmGn0ynAFIhKb7AmO1aiT09ADOi7Hh8MPMhIM9sIn68AAZj7I4J7kn+KzUa4n7hXgBtSWrzyvOvmwBhcatOAPuC6WkO1Y++ZXqaO18Q1Vnx9AtQEFVt3ZpfqTuxn8NdthM603GQbhjD5W1n1hd1nWt/iBBDvGNzMj9tW8W8hO7LxDTEdqsE2d77+lQswogvqoPkA5kgf9oyFjJNPiWcXaHN/ioQyhPKsPUkTiv76sRD6p+dmIsJeFcf1gxcBRq2rqMrRDXIows7YrYMwWRAPePlE/7X50wn0sJ/rSOffmkGjsb1QDQDvmlnSFeIvxfUQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=estab.onmicrosoft.com; 
 s=selector2-estab-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ireoCQZ05DXXs5CGCBJkJTK2s5ErNwIgT9doCBVQXKM=;
 b=eNYm4rMzd3I9hNPAmR4crCj6KtLyedViOobNPRYJyqzQ6WayVHydf68+cmm72PFI0rGqS2ZIw7MrJ2aRi0/4ORBVUkv7PwnTNEuSVw7joFneP+ItLnzmSvwdl6a0SMddKYBnLgNfMDwPR+2I9VgeCeIeQBz/GnbRzXeQ/D9rJRk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from DBBP189MB1433.EURP189.PROD.OUTLOOK.COM (2603:10a6:10:1e7::15)
 by PRAP189MB1850.EURP189.PROD.OUTLOOK.COM (2603:10a6:102:27b::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.37; Wed, 22 Mar
 2023 14:00:03 +0000
Received: from DBBP189MB1433.EURP189.PROD.OUTLOOK.COM
 ([fe80::13ad:a312:15c6:91dc]) by DBBP189MB1433.EURP189.PROD.OUTLOOK.COM
 ([fe80::13ad:a312:15c6:91dc%9]) with mapi id 15.20.6178.037; Wed, 22 Mar 2023
 14:00:02 +0000
From: Sriram Yagnaraman <sriram.yagnaraman@est.tech>
To: 
Cc: qemu-devel@nongnu.org, Akihiko Odaki <akihiko.odaki@daynix.com>,
 Jason Wang <jasowang@redhat.com>,
 Dmitry Fleytman <dmitry.fleytman@gmail.com>,
 "Michael S . Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Sriram Yagnaraman <sriram.yagnaraman@est.tech>
Subject: [PATCH v9 7/8] igb: implement VF Tx and Rx stats
Date: Wed, 22 Mar 2023 14:04:39 +0100
Message-Id: <20230322130440.26808-8-sriram.yagnaraman@est.tech>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230322130440.26808-1-sriram.yagnaraman@est.tech>
References: <20230322130440.26808-1-sriram.yagnaraman@est.tech>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: GV3P280CA0091.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:150:8::25) To DBBP189MB1433.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:10:1e7::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DBBP189MB1433:EE_|PRAP189MB1850:EE_
X-MS-Office365-Filtering-Correlation-Id: 59861c2f-be8c-4b06-fd2b-08db2addbb5f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Bb0HRoD3C1nwfV5iiONX/m6Q/qRUxNpMkgtUt5LGF6xMuzGj7jsMiN0W7Z3znHQvXq3se7gHizbJWM/LJb1SQ1tQrJGsxQ3j3c6B8HddPiVxzl8VOU/rOlr6sN3Ge7MNtbxmJFSPkvEU70fxpLm/d2p6Tb3kN45vQ439vw5x4g0CdMbK7YJa0PoDgK4IhewucYUjCX0wSRn7hVrijAfKrchRiNG5R3ziBIOviMDcIAqzekxzPITtA7MhtQl2TxogJ8vrgOeiAOPKaZ0cUKn1e06FXyl6GFrfbQxkMwA6mE2U0PNtZcgyWr5bPydR5h5+ePCX6ZRVFqwBXJFf/b//UuYnbqjCPLRL+mgvyj6U5Pv3cWNIlJsC0H5sgi2PSpBuRNRlZLXbth5/jlnMfRouEF5dFrmRkdMQgDT35cVuAY8/0aaqqyGl71OoodcgC4NLrQBPQxjG3a/KkaD2HjQgdW424wo8yRulRUH81qLJB/doEAN0EphajQDai1Vp7XJ2ui+vzEkCX6W3bar3ivxSzM/AAalRENPRm2AauO4k7aNL6ICxZ8OG7DA+y+q6IuHpB6Tca3AYVO3jC9qyxLI6qZX7peyl4MVi5sp4jkUF9N/DWuhemEUw+Odyt0ujmDhnbAfq1lL3g5PQuMxrbxW/JwyN/JWP/e2XvkemrIF2xNR2utD3/750oninX9EXuJe3V9ayUpwyxaMhNhiYLwGQRW55s8qBIoHZrowTq57KM7o=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DBBP189MB1433.EURP189.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230025)(396003)(136003)(39840400004)(376002)(346002)(109986016)(451199018)(86362001)(36756003)(83380400001)(186003)(66476007)(8676002)(316002)(4326008)(66946007)(70586007)(478600001)(2616005)(54906003)(1076003)(6506007)(26005)(6512007)(6486002)(6666004)(66556008)(38100700002)(5660300002)(44832011)(41300700001)(8936002)(2906002)(266003)(37730700002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?uO11mD2zqqT9qZ9RbS8YnoXlzzfMcWGM6XwWg4SAJcXhO2PYfUdhNp3k1wVd?=
 =?us-ascii?Q?y8XJlu+sYheKoQWvrcYNRUHqbCZFsjCHdiZJOYbub+FpqnJytHPRT2DrPASi?=
 =?us-ascii?Q?s3yLWrIeCtS2aGBmA/tv3jRXM08DiYEE7RZUDhH3Dwvjxe8Z9dZrJ0nUPslA?=
 =?us-ascii?Q?iNbWc9dqgygHF2Tn2k7cnWTFZMoBr7VSjTWPwDTALX/HfTeF2fV2tPKk6Uob?=
 =?us-ascii?Q?pjVGQYtxvE1A/L4ASWIGJD8x2ozeRgYWTUbqYTAXoryuRcjtmfDZykABpPvI?=
 =?us-ascii?Q?GqHb3Bet1vX4BfRlH/uNSa7bMHgpECDRCIZHGTXnTj0Y/79FSVEKokfeW0a6?=
 =?us-ascii?Q?qBFc/EwOLrZ4kcX2h7sODDw6D+C/pPcK+3emcFvoSM62WyuYlQX/pNf0xoPN?=
 =?us-ascii?Q?Dfv4SbwdMaX6kAY7QYxRn8VyVPeAK+PEuU8sMLi3rVI0rkXXXxsnh57WcYEH?=
 =?us-ascii?Q?jfuRwiJB5NmdYrhON4f/zhjdAbzyXGk8IhmE1/hbpvuwh3cMjw5cJmvEePWG?=
 =?us-ascii?Q?AECBpoFe+8VshVzUWUR3xLeKN1LCIQImyivktSTQpaB0vGJsT1gElzdi3qJl?=
 =?us-ascii?Q?cWVWkBdVO4Fky8O1c4jXbWzyFUgePlCwtYpTxdi7KiRrOOfzeuNWW7zssHAC?=
 =?us-ascii?Q?Dgpf0P1pm2tsmJqre/6yjOhSAfYgFj7J0bUuLqiK8YmyPHdUeE5xy9xfr3aa?=
 =?us-ascii?Q?npqK45MK7sHwyAYW0AGGSOG0c9NDtftUL9e1aq1ZeMz2iUO1JYjHAu4KiwCM?=
 =?us-ascii?Q?3Z89z8g9AGOXGG7GgkvsNfAtDddqQnESl5wce5DHftr8gceGikCaNc++8iPU?=
 =?us-ascii?Q?m+M4zKzEZKVMfS1haolnK10gK/7jj+PpUWfdp23k/SVPD3+ZohlHYbM2UE0f?=
 =?us-ascii?Q?6KSWpbT3IW9lFEi1jidQJ/lRUQQit3DnJNvo2nZ+nQk9WqEYdKT3w6e9dwre?=
 =?us-ascii?Q?3XUc1hZ1KYzM2u5iPmG/JetynF0LwPt79XeomFqLuS1fTuz90dOdMg+CduyB?=
 =?us-ascii?Q?kYwt8EURztmNN+1salLurIfGYf9dQ5jhG5xlMwEOYXYqj4r4dko3OZrUZVPj?=
 =?us-ascii?Q?7XWSUrpOXWAkhDSUQYCpMo33kHAIa8O+7Rk5FriDd/ETJIGMQw/+Mwl9ALkQ?=
 =?us-ascii?Q?lrC9W9t5yk0thSfTDuD3x+jqj703slh+21gl4y3t+qAL1nYWIS5tbpDSwOlA?=
 =?us-ascii?Q?yvjwc4V2p+Sify0MhgjpDaVOhGUosxyq4TSkrLnz3UQHm4UP/hV1Knb8nD3l?=
 =?us-ascii?Q?ADPU0uKOO15lnsEHYQOx/LB0bHV5eMk4PQt78pDZItPyARZVXBiZ04+ns5oo?=
 =?us-ascii?Q?hWGc9uNapMeQoOWZC71HD4ANWE923rOOpR6P65Q1J0ckiz7O/1oWTErbEE6Z?=
 =?us-ascii?Q?1kA7lkP6lCB5Qnk7OOtpMfQ51qpLlNmoowh/HYpxV1JVhSMwGdySPICL8j5D?=
 =?us-ascii?Q?ykWDE/pNRdPRPUdvj/5SDlQ/B7czj/hEWKgamdD1ijiFebGbpIr5ThQr8IoL?=
 =?us-ascii?Q?z4PjzZmHV4nL8zkWSVrxrjuE3jnv+Rts1J/gWVHUY/7SMEl3RJK7l6RFENP+?=
 =?us-ascii?Q?CgCOUe4Se5dirpao8D3pNXEtGeeCYte4+9HUkdiwnli8tYWVfgiB+Vw4EdkK?=
 =?us-ascii?Q?sQ=3D=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: 59861c2f-be8c-4b06-fd2b-08db2addbb5f
X-MS-Exchange-CrossTenant-AuthSource: DBBP189MB1433.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Mar 2023 14:00:02.3931 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jHo/RVNurZELCZ+0MuCW1FB9aynl99WPEhpB4XIQpp7qbzTf0hV4IeQC+a0+6w9UaES0gEGyKCm1NAsBW5lB8XSRgR7aCwCVFDhkpp7+554=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PRAP189MB1850
Received-SPF: pass client-ip=2a01:111:f400:7e1a::704;
 envelope-from=sriram.yagnaraman@est.tech;
 helo=EUR05-DB8-obe.outbound.protection.outlook.com
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
index ce81e60558..27bb4a55e6 100644
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


