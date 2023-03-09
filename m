Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 42BC96B6BD9
	for <lists+qemu-devel@lfdr.de>; Sun, 12 Mar 2023 22:47:41 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pbTWE-0000T6-Ls; Sun, 12 Mar 2023 17:46:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sriram.yagnaraman@est.tech>)
 id 1pbTW6-0000SF-1M
 for qemu-devel@nongnu.org; Sun, 12 Mar 2023 17:46:12 -0400
Received: from mail-db8eur05on20729.outbound.protection.outlook.com
 ([2a01:111:f400:7e1a::729]
 helo=EUR05-DB8-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sriram.yagnaraman@est.tech>)
 id 1pbTW4-0004XO-HO
 for qemu-devel@nongnu.org; Sun, 12 Mar 2023 17:46:09 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=D877rCyhPHamJ6OeTiVIMY2YPG+ZjJ9Zxdk9STDddyOT73ckELixDMNeI80IwjGED/1P0BQ0rLg6IIRSBNDyGdGSeJTxDTLlRAHF92dGJat607i9F1Gor/TnTEZ5e+oGjuA5JNFaLU64oTbumJVmBhja19Yz5as0mExihnQmGZIj2/6W4/Umoe+zkVLGfoeEENaMzbkoHVbVR0m54s+ujpDfHPFyWH2vekYrqqkw7bwslYJJsDx06zvZ88KUkPu/FWzIzx1WLQWH/3XL3C0ecC2PRR39WKzUr4BDGo/oSzjvEvmMQhuyrjEkT84Dh4dr3eKYv8sgTL8kA5XD8058bQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fTm58uy61u9gD4G9c6pEDw/g8z/mc2WYJIkOAG9CgOg=;
 b=dZ5+OJ/DGMotS3Q8RBsILQN1n3yDKVy5A2dYPVHAJ4srGF2bXdsLdDIOZ+GFpv1f0uM3efZHAMYYRocJfKt4hb1EEIce5YtYH0E9AqZ7ar/A521uW6LJmXuyQ2TLllDI+Bw3ehD/gcvasolKB+Oh8gr2THk9PZDy8ajkkIzbkh3FtysEle2QiwHcG4o+RzqFTPPTQyGKqk3Y9ecL0lgntiO3iXr/RMNyC/d0K8ElRgbrvk1NNqoXAzkiQIdBkvQtzBZOC+BfovIx9+EbXeZ3PaW8lEmMu0/5/WU8bFptkw29XElxKekAglmK6AyI8vIQ8uzsNQiAMQcubEHERZqHlQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=estab.onmicrosoft.com; 
 s=selector2-estab-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fTm58uy61u9gD4G9c6pEDw/g8z/mc2WYJIkOAG9CgOg=;
 b=R5s/PsegyFDuwwOF5b5kk6D/JtE5s3F6SAvc3r94NlJQqVb6z2l8IZZNkNROk9XhPA0/E8v+xA1XxdaekSIuly29UvNXC2hiKz32NwinOUTKn9qtOndIKW2pRUOQ4C3cRkxIL9wXkxnHwk/UPyxZQbOrpboi0syV4rO4kW1Gt2M=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from DBBP189MB1433.EURP189.PROD.OUTLOOK.COM (2603:10a6:10:1e7::15)
 by AS4P189MB2207.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:58e::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.24; Sun, 12 Mar
 2023 21:45:46 +0000
Received: from DBBP189MB1433.EURP189.PROD.OUTLOOK.COM
 ([fe80::13ad:a312:15c6:91dc]) by DBBP189MB1433.EURP189.PROD.OUTLOOK.COM
 ([fe80::13ad:a312:15c6:91dc%9]) with mapi id 15.20.6178.024; Sun, 12 Mar 2023
 21:45:46 +0000
From: Sriram Yagnaraman <sriram.yagnaraman@est.tech>
To: 
Cc: qemu-devel@nongnu.org, Akihiko Odaki <akihiko.odaki@daynix.com>,
 Jason Wang <jasowang@redhat.com>,
 Dmitry Fleytman <dmitry.fleytman@gmail.com>,
 "Michael S . Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Sriram Yagnaraman <sriram.yagnaraman@est.tech>
Subject: [PATCH v7 7/8] igb: implement VF Tx and Rx stats
Date: Thu,  9 Mar 2023 23:00:11 +0100
Message-Id: <20230309220012.25642-8-sriram.yagnaraman@est.tech>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230309220012.25642-1-sriram.yagnaraman@est.tech>
References: <20230309220012.25642-1-sriram.yagnaraman@est.tech>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: GV3P280CA0100.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:150:8::14) To DBBP189MB1433.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:10:1e7::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DBBP189MB1433:EE_|AS4P189MB2207:EE_
X-MS-Office365-Filtering-Correlation-Id: 12ae61ff-3505-4273-24d0-08db234321c4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: U64ku1eD1BEOOURwIkq5KcGibfIxmZoDS8S8Kg+QJqlcuj6NGgEqWBLPiCYmu698PaXwiu5yUAgUWObphiGbJcT/oxzI8EXiXQJb8fMYFs5QbIZ717FA0s7GdERZh33h7Q+HRSF5Fafw1TCXR95tcjtJMe6S5yjUGv3poNgIWUYPPlyYFrw8K0mWr6sRqkjdhISu3oy6tkc1Hl7lqsUFsK6CV0V51wcBd27jE7gE8io4SJ28QgFXo7CtJf3LBpqvIVk3s8EeF2u14+dQkOFPVvV8WfU8MZz+r8SR+kM1Addpx/ZgJ9YhM3f7fIJhiwxLj8/VnyD5/mz7+T4hmXWuf7CWXN+H5TDfLMdajyTuAdBYGyb2TwxEOajl5s0XB7ggiYMT5OBPa+l7tvGY6uo4xretHCGO0eGO7WGx6wwCUDtdEf2XCWHa1+dlTgDsh1QGhAxVD24wSROzpUTLpkX7Y0071vQXaqCx/TJp8+Efy0Rm/Ph6pM3EGNdAcbtNbVU+nOETOVL1luxK9UI/QdwDQciOevmb/TTxXyjXfeAy5dqV17/1gPHK/+ZngP3lAXvYVlffel2MaNWIhQ9FNX/xjVM5XadjPYcJQMaAslPMdukOGw3BUG8L3cQUKBkiiMHAalmQaSPd0mcS2RdXXWHcD/kdjlDJ4f//w0mZ/DY4ddl+JtJeZClRErUmQOI2/NjJKOn1boIrp49oalKMHYoKuQ5lf06jLWtZ2GJE4/BoJTY=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DBBP189MB1433.EURP189.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230025)(376002)(396003)(136003)(39830400003)(346002)(451199018)(109986016)(86362001)(36756003)(38100700002)(4326008)(70586007)(8676002)(66946007)(66556008)(66476007)(41300700001)(8936002)(54906003)(478600001)(316002)(44832011)(5660300002)(2906002)(2616005)(83380400001)(6506007)(6486002)(186003)(6666004)(6512007)(1076003)(26005)(266003)(37730700002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?VYFcJ5TGcdDf8fE1x4RHoa6HaIlJtoW5pSTOui+u8G2l2YpXwa4iKHSqo+UE?=
 =?us-ascii?Q?DguJcp4HmY2eW6ztFPmMf9Z/WYR9nSLTty86rWUQTq4mg23Xzx3sXycEQuSB?=
 =?us-ascii?Q?AxbChhGKajHjqbHwGfJYZuEkpqAG6I5FvmY/mSMXlLBjHSgWK6wC3BAzLNnM?=
 =?us-ascii?Q?eS34dCgD7Utt4u5mt0MwtOkExZP59Q9o/xqRVVcp11Zuz922AKRgCBqpLKFA?=
 =?us-ascii?Q?qYRLRGdIWen34EZCZZwFxdS4IaLkG9KPXPGxkFDLj6eFC82Jcn6Q6pITnW0j?=
 =?us-ascii?Q?oeiU2xUk1J1S4ko52Ay7AFrdPSCriBc7/UI1n/CQu/hE4TP4Bw+rRXMw6sU7?=
 =?us-ascii?Q?giGUTw6GveBUGnyEAN/kIMw7SioaHYrdvX1qBIcK3kF5RA1Y1N45427Qb1Lp?=
 =?us-ascii?Q?uzMfHzJCw10vFo/qWTRvviQxhCBtn7wQnFlltuKBN++16eAjxcsbABAy/eDg?=
 =?us-ascii?Q?ehv+jJD9wTI01u41HAnvoyHy7/h9ha6xwrI7B4X0aBvlgXpXmrUdd6/fEx4X?=
 =?us-ascii?Q?IwF5VL9wFD7NRW06QJsHPjTr/HrGoz5+m95jLHDasfZOyMETBV6Cgt8YMiSf?=
 =?us-ascii?Q?Pr1EDAJBLfVlfwYmxQMCGGhQdlFVzOOMq2j9b0XYsqk3DwSaJWdKdlx8N6Z2?=
 =?us-ascii?Q?FRAjA+/vaiobtw0q33DyaL7uRfln02ezCvU9dOI9UqQx8GXK9A0yjgj8koLu?=
 =?us-ascii?Q?VyMiSASUzl8pEXT50JBG/j2hE/strdA7Qrp6Qx1AfPK58/1x9OqgDhCBNRV/?=
 =?us-ascii?Q?bG/nBDWF5JxKCYXX/0naFrbEnyEW2ujwToPFX0Bq8pKs0edt97fwjss7fTR5?=
 =?us-ascii?Q?AdHPbij9IIx/BfOe5321U99fPixz2qzc+Bf4sXa9PgIOhxMT4cBbiknUTPo8?=
 =?us-ascii?Q?a2rjZCxfXJkvWtg4v3Qhzy4g1lVu/+In/yOBqu0u9imdZ7tQr/J/9W/HZXO7?=
 =?us-ascii?Q?B91lQQVye12bLhGhKMrh3NYpQl/jMIQCiLtUg9Fd+6a1B5x5ls0xiZqF74jg?=
 =?us-ascii?Q?w7anKbFOIcAGmBQsF/0fDrKSFnFfAWwJSc2iQxau2iPDtaAWwWDF50mkSMCl?=
 =?us-ascii?Q?teY3k6HhXyuQA/A2cEojcQGuox0keWuXGzxO8K09+4nItDF/Dn6A/ET/P9Jh?=
 =?us-ascii?Q?ik2VDP2T1LR5cxjWdGuiTTjh578Oeyt4oEvXtd3LbOY1CUJ0DBbhP9tlZ2ue?=
 =?us-ascii?Q?kOQLAvDw7zlevPsZBDeRDwLK6XLVc03kW80ehbbVJBBWzB615rB+RlDevNlW?=
 =?us-ascii?Q?yOAtygkm+BkSvVlu6ne/WNzcE+mTbm/B/g34XOKr8VNHgcDtmThuOe0DfFux?=
 =?us-ascii?Q?/AWqvh9hTA0/QHE6vpSJQAVigBot/kOxHrkUoetdEsBgOEo8Digr+S8JAvuN?=
 =?us-ascii?Q?M+BFM+0u+rNcKZQzNixtUxJJlAxb5l8vqqNIwYpdQHYq+4YcrJeOa9UhmEZT?=
 =?us-ascii?Q?eMAWMOffBNXiShPBrco2PtSPgmBaxsNMzEX5SZ6eja4P9gHS6pcs9VbJ/iME?=
 =?us-ascii?Q?NpS/y1hmDWTLDn0YQZvBHJjP6enwA+FpaD53LQTpV6wDOrFS6IFd9IYp3i/m?=
 =?us-ascii?Q?v3fM3mDEaPtyK5dq1gVxEU6vxKVqBlRpM0SND4BUC9Vb/aoYPukeGCP3RPtF?=
 =?us-ascii?Q?Ow=3D=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: 12ae61ff-3505-4273-24d0-08db234321c4
X-MS-Exchange-CrossTenant-AuthSource: DBBP189MB1433.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Mar 2023 21:45:44.0590 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FZhLXiDixp/uhnb7OdryzuHg1uCwG+zMyTSAXAp+6egX8aKab3cXepTONVBMyHSLk7iujn+op+tUIfB2A1GmNSJqh0taxuWFf3hI1/bi7+E=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4P189MB2207
Received-SPF: pass client-ip=2a01:111:f400:7e1a::729;
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
index f91cea20e5..86de73afc8 100644
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
 
@@ -1403,7 +1410,8 @@ igb_write_to_rx_buffers(IGBCore *core,
 }
 
 static void
-igb_update_rx_stats(IGBCore *core, size_t data_size, size_t data_fcs_size)
+igb_update_rx_stats(IGBCore *core, const E1000E_RingInfo *rxi,
+                    size_t data_size, size_t data_fcs_size)
 {
     e1000x_update_rx_total_stats(core->mac, data_size, data_fcs_size);
 
@@ -1419,6 +1427,16 @@ igb_update_rx_stats(IGBCore *core, size_t data_size, size_t data_fcs_size)
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
@@ -1520,7 +1538,7 @@ igb_write_packet_to_guest(IGBCore *core, struct NetRxPkt *pkt,
 
     } while (desc_offset < total_size);
 
-    igb_update_rx_stats(core, size, total_size);
+    igb_update_rx_stats(core, rxi, size, total_size);
 }
 
 static inline void
-- 
2.34.1


