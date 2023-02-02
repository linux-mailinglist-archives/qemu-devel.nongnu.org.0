Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F2A7D687669
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Feb 2023 08:36:50 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pNU8O-0008UC-7m; Thu, 02 Feb 2023 02:35:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sriram.yagnaraman@est.tech>)
 id 1pNU8M-0008TJ-BD
 for qemu-devel@nongnu.org; Thu, 02 Feb 2023 02:35:50 -0500
Received: from mail-vi1eur05on20726.outbound.protection.outlook.com
 ([2a01:111:f400:7d00::726]
 helo=EUR05-VI1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sriram.yagnaraman@est.tech>)
 id 1pNU8K-0001d4-I0
 for qemu-devel@nongnu.org; Thu, 02 Feb 2023 02:35:49 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BVL7CaXmNByLP5eW7IN8OKvA6b+swro206GXQk0GmHWFKY/jjnv1vQmDC62bAOKlWLhBZsTeA+GGfzxZDHevyPXI5TnO6zI0NlcixdvoSVmWaNK3kcKkyGfH10VfigJ4CpWSe7eFuPPXGlJ6+yHCFCx2rlXuTbt16egBQSXqExQ/DRPFfDy1fyNk38XquGBkI7EMbipAXrroBUPwcuWnkv4ZNvavUb7Fu1Kn/d72/UphlJq8AzHCPIGTxDIiii5vjfON8rx4t/bLJwCN7e0Re35piPY5657oCOGGjBWbAsOFIvGjDSE4OG2K2bDGiBDkAP/ZomghRUCED0FTp2Qcsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dubGTxz3D+Vb1lxN/2AFF00SeMK2xSB8M4VgYsRnquM=;
 b=GnxhHoSmbwVMrJvna8PvGVpEisNrDAXoViXZtrYANHQLh9RDprwSmwC9Ulu+9eVK91B3z/uvXPjHi4VSrxJdns53DKy+TjxQHVqWxL2H3Kf90rh5wpcLpIdtcjzAULY1FVXqYi2m3WrN/cvkuByjiBPjF3vqlDZibV8CuOoy4WubCcmFgnrMUOZK9RF2hBDuEPDJScZJqmHf7xK/wOyMsINNv0rXEOCLJyLydqSDoRG8OuqFg/BRD4qar2OiAkKGU+tKxv4CwVftkeBoMP20lwRGp6TZyGOt9+HmZ256f48nrV8z52j4PKWB8POPZP68Ip5YvrZouVzsSdH61SuuPw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=estab.onmicrosoft.com; 
 s=selector2-estab-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dubGTxz3D+Vb1lxN/2AFF00SeMK2xSB8M4VgYsRnquM=;
 b=Qj4tKZjFTZd3UlGsYDDdBzsgbpDoJyA7uc8MRwpZ9/jn1Tqrrc4gbzLjp3/Jj647dU+L7dWH0i+biVBHoFw6HKrP5805zLSSmBVh/oifAtK+ZyKU5lVCIuA5JwFPaCEx4f8o1rMl+ySKvV1RDPbCQqTynLOoa71a1S0r53HaBbs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from DBBP189MB1433.EURP189.PROD.OUTLOOK.COM (2603:10a6:10:1e7::15)
 by DB4P189MB2389.EURP189.PROD.OUTLOOK.COM (2603:10a6:10:3ff::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6043.38; Thu, 2 Feb
 2023 07:35:39 +0000
Received: from DBBP189MB1433.EURP189.PROD.OUTLOOK.COM
 ([fe80::8f70:435b:ab64:9420]) by DBBP189MB1433.EURP189.PROD.OUTLOOK.COM
 ([fe80::8f70:435b:ab64:9420%9]) with mapi id 15.20.6064.025; Thu, 2 Feb 2023
 07:35:39 +0000
From: Sriram Yagnaraman <sriram.yagnaraman@est.tech>
To: 
Cc: qemu-devel@nongnu.org, Akihiko Odaki <akihiko.odaki@daynix.com>,
 Jason Wang <jasowang@redhat.com>,
 Dmitry Fleytman <dmitry.fleytman@gmail.com>,
 "Michael S . Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Sriram Yagnaraman <sriram.yagnaraman@est.tech>
Subject: [PATCH v5 7/8] igb: implement VF Tx and Rx stats
Date: Thu,  2 Feb 2023 08:26:47 +0100
Message-Id: <20230202072648.4743-8-sriram.yagnaraman@est.tech>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230202072648.4743-1-sriram.yagnaraman@est.tech>
References: <20230202072648.4743-1-sriram.yagnaraman@est.tech>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: GV3P280CA0007.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:150:b::10) To DBBP189MB1433.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:10:1e7::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DBBP189MB1433:EE_|DB4P189MB2389:EE_
X-MS-Office365-Filtering-Correlation-Id: 116dc594-9505-49b7-3018-08db04f014a4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: MVqZ02hyLRrENQa6Eyo0/qh0I/5Mpah1/+kJgZ9R+9rMAUw8F9NYT2c4Uzz+QnNIsR462F3MA0850RTk4MSHD/hQZnF/khsMDo/YP2ZbTMvuSaXdSfYt3TgNwOsEn4c5HzQXDV8emckusETYXrjbdTXAc6+wANOaUjKFnFPB8t4vhWZFyvkdVxUdupKRppLztoV9NahehqIHj4Vrz3e+8AIIL4mxv0eKDg8mXv0c3v9TAmUFuiwEAfJM6Od7m+yob4OIXKlLiwRCMQUjjn71j5yFNI/eAxlsFjg/4bfzcc+aEyrRO0EJJ5ogfGWN/TMkk1YTf8ZVliFeGBf0qsG7PSCsWvIZDR6P0D6FGvDUzygoTxMS6p9lgPRJcL4hX5/QVJPOaVctFhB9iNRzsE0q1UajeMBrhvQ1pD7+JX4ZM+SfgSTikvZBctfc7lEoeOwizEKaMIUmUyianqW43gfKQ7lzA5rwvcwLw+FllXGKUd0WPkfECPjLTKchovGdwNkiMUKWxFnF5a4Jq6mrvHWUr4+vdNNwWyvbiQ7yZIPxFmJgH+OA8PQnFCzLRTI8EMa3o90Tas4J2ZNi5SR9i7bgT55Oba6molCEwh/XgH24uqbCW1SeioJodH1+ho4GA1KJ7n0Rbb3sUTElYhUb/4Q3Bwop/yHQdG0HnBNSHBoh0rvRRq/OqBRbT48nD22dgAIU+AD1pMBuwEGNsozT+Vs66XdnmpCNLaDmRYX5Sud/PYM=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DBBP189MB1433.EURP189.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230025)(376002)(346002)(39840400004)(396003)(136003)(451199018)(109986016)(6666004)(1076003)(186003)(6506007)(6512007)(83380400001)(26005)(2616005)(38100700002)(36756003)(86362001)(8936002)(41300700001)(44832011)(5660300002)(478600001)(2906002)(6486002)(66476007)(316002)(4326008)(8676002)(66556008)(66946007)(70586007)(54906003)(266003)(37730700002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?J5C5WAJX2rRGrSKKh4rqxVX+6aYlZ1cCP05CgVkYsFBh0o/3cK7Dsrvp9W4E?=
 =?us-ascii?Q?SufTsrtS9Q6GC8eRWTjLlHkrYLSC5OHgEz2eGNUj6b+U1cit+pN8S0OVBmQP?=
 =?us-ascii?Q?IvbnEb5O4FxELkDCryDybPkneAB2ln1BfW4j99TiLd9gkYi+C1yWfTZ4mhXO?=
 =?us-ascii?Q?NyRSlT/rr/T1Yunx8b8EaY1XnT99lt128pCvd1XDv9WFgqkaYMXomM7OiscM?=
 =?us-ascii?Q?NJDAteO06tX5S7chLylnSq5q4JjEyIUYliHKCTh3rcaiovYD8wpFSAgUw+It?=
 =?us-ascii?Q?SWCMdzYBMY6tuIqWE2t9siqMy3r/G9DnPiH1DNu2PPNMseW5K49joRsb7zXh?=
 =?us-ascii?Q?VT/0plyVQ4oaQUgofo1HHc4h/Hvry0tDpw6UOqQ7Uj+5YE5cRX6W3DMojuz3?=
 =?us-ascii?Q?vHBx/0bdIHx+zplTix5OV4C+97Up1wvImKNPvA0pH/l8CbDucoO644RxK9QI?=
 =?us-ascii?Q?03SVvvFlzjxZasT2Xw8gcXrEbG4Lg6zT34FrCK4C3yh0bOkhYXYtGsPNN187?=
 =?us-ascii?Q?marxvwI3I0canG6PdjpqTgJI+aTdymsjwytEaNvTDVisfvU6Sw8G4H7lMVDS?=
 =?us-ascii?Q?9NyQZOOatFsTXF9NP+iJsOGZWTSSFlCJXpbWmpVdNeijWAZgELc9OP+ANEph?=
 =?us-ascii?Q?vktFpxWc0gfgQnTvcuvQ2CmXtueoy9zkIWNuktzlcIYqpCUaetJ4/x6gtY7i?=
 =?us-ascii?Q?wp8p3z1MVtO6EoFyDScJgp+xKubG11CA7OxaU2cVAUzkvuV5kdKdCr2l0O/L?=
 =?us-ascii?Q?FTcO0L0NZQA+evNKzKyaEIOwR5YJmMJGZ0eS5VdBXNBd63bYrYekH0DblRUJ?=
 =?us-ascii?Q?SQZLyrXd+UJcn/UHAhZCMlBw5LP32T6SW2ZvDoXT0RBHiHbnhnZh9ns4uptP?=
 =?us-ascii?Q?uoumvHN3H1MuJcOwRaaxLLES6hh4g2kKHDW1DMyR8/O3lDHdN8P0Qt2Dg40m?=
 =?us-ascii?Q?1Z/JVFbP5du7vHYzeFepVCbODkqYOrPnCVK1s3lyzbPwnqxoQOGMElkHBmyq?=
 =?us-ascii?Q?nyourrNkkq/I7rcthHTdpWHT7pkeffTUF6N2VmVjKgb7EThJ9zHoI/YcN4NI?=
 =?us-ascii?Q?OtBThjLlCk2bkpzHpSBfzEhFub6bcSvKzxvat9/yJYpeNpuS7ukDWNy3b+Qp?=
 =?us-ascii?Q?BW6dFQbMQWlbD7xFJn8nvbt/28tmK9R1E0byIggIAwEhabddNJ1Ck6zcsAgt?=
 =?us-ascii?Q?cy64amvp/3fhKEG2VhRYt04LJPkws6a9OO29F3eajEMUS2PsKNXuHzoxmmIQ?=
 =?us-ascii?Q?RhWfcry5/TYCBUeTiH+fCK7hyLPa7IaaRfcPtWnZHyapJrcKvVnWNQHR9gz3?=
 =?us-ascii?Q?Tpm1aVZ6G7z6kIT8NNhSgfF8txPblq5uf5yofcVkWKShrQGMQfvO/hA4siqV?=
 =?us-ascii?Q?H5NLMLpDc85au0VfQqD3ZOPtYBXW2VRYHyyyxRhxK1641WS1txztlKpAtmOe?=
 =?us-ascii?Q?QPty+5W3cu+80lJZPSCodIfBVzTY9ANdRGZzErm9yhsemspOrD9AwOyS8IJl?=
 =?us-ascii?Q?OLoD+AMmgbF2JVDFbq4O34C0ClKyXzY3KpD8xvqowl0SATC54eC2drep63wD?=
 =?us-ascii?Q?wlqBHH4J0p5AqPHFsqIQpUNX+YOS/cW/zHJgrfiCy9gQUjAenFqikl/ThkO/?=
 =?us-ascii?Q?1Q=3D=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: 116dc594-9505-49b7-3018-08db04f014a4
X-MS-Exchange-CrossTenant-AuthSource: DBBP189MB1433.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Feb 2023 07:35:38.9274 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KcPqAfLMx/tMqDp7sueRssmZnm0uTDjkxnuwKvBP6oz4s7WNzsczIwegLGMkBNLP43/LidU1ircFtoLyKM4p+GRMjKwyTfYaucmBowzKYlg=
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

Please note that loopback counters for VM to VM traffic is not
implemented yet: VFGOTLBC, VFGPTLBC, VFGORLBC and VFGPRLBC.

Signed-off-by: Sriram Yagnaraman <sriram.yagnaraman@est.tech>
---
 hw/net/igb_core.c | 26 ++++++++++++++++++++++----
 1 file changed, 22 insertions(+), 4 deletions(-)

diff --git a/hw/net/igb_core.c b/hw/net/igb_core.c
index 9bedaa1e5f..42e3517695 100644
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


