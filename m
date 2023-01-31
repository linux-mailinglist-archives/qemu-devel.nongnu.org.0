Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A9FC682950
	for <lists+qemu-devel@lfdr.de>; Tue, 31 Jan 2023 10:44:20 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pMnAV-0002HE-Gv; Tue, 31 Jan 2023 04:43:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sriram.yagnaraman@est.tech>)
 id 1pMnAL-0002Cb-Q2
 for qemu-devel@nongnu.org; Tue, 31 Jan 2023 04:43:03 -0500
Received: from mail-he1eur04on2115.outbound.protection.outlook.com
 ([40.107.7.115] helo=EUR04-HE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sriram.yagnaraman@est.tech>)
 id 1pMnAI-0001hD-Eb
 for qemu-devel@nongnu.org; Tue, 31 Jan 2023 04:43:00 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=C7INIZCGYx1Aw6V7SgxYsWEWhxJG6a7N2vvytdMWtRul9Mnne46MvSENS9FUL4Dj+MRzqUay6BUQI9b/muSC7B4vBNxVTSgzEMIVFMCvT/sJpZrqgL8EZofZjC30/L8SFUI9hLYo4Rnrg/1U1NZcv9f8UpwjjWV5A7KJVsteUJMHTYqPxF58VSUvinc4C/19p19paOQgrx43KrNv4+CgPWgoyZJx7KECw8nOZDdHlzh0UZkOM4Dro6pnnGBG3II+08HEf29dr4pTR+LDJL7tiZzfkQWDfGlwxiWx+Eqmru9v3Ly6R1rWl/nI8lPqWHN10QfOZ6F30jV9X9ZIRs+m1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uIkAS+i5c2z8IctwjHQQJbtynRClHb9dEPnRbfuV9I8=;
 b=F5F/ym1sYSc0vra3UJ2zb0BxAmu4st7g/k1frCHAwL7h1+3vNjFoHI8XxbxaQw3BysDfeNa25owDjiKt8KiOaxyD3U2OT2F6R8D7FHWn155tl9ttq5dbR3wN7n3TwA0+Y2VHRG1Z+D+FEr/W+elu8Oer13yADUQLVMIImQcUcGB58r9pxYeYERzdLSbuh0JA6UeZbQIcdBxURFm5EeYJMt+xS1m4sex2mnUi4J4Is01f8s6P8N/Z/ck/xQnkV4Eid3YPobo65jN4Nqy4UhnftViABSRfKKduOlaIQlReZFwm5ZfJusMi1i36/O6eWpQ8mNwPrd/OoH93g9JiovyZMg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=estab.onmicrosoft.com; 
 s=selector2-estab-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uIkAS+i5c2z8IctwjHQQJbtynRClHb9dEPnRbfuV9I8=;
 b=XLW16sX7cgD4DeaLDiiFnssud9fLQ3EQopfDdHiNV/LYLJV09U81k+Ym3QQnK53OXUjxO1QBqH0A7ZhGE5BE4JdiTMIQKWsPpRPAQkFWXjsnp2rGUWYciYgReeev9ASrpkjGY9Jzl4ZO70KxNlHcoNfuTo+L5SxbklW7DWba9Is=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from DBBP189MB1433.EURP189.PROD.OUTLOOK.COM (2603:10a6:10:1e7::15)
 by VI1P18901MB0733.EURP189.PROD.OUTLOOK.COM (2603:10a6:800:127::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6043.38; Tue, 31 Jan
 2023 09:42:44 +0000
Received: from DBBP189MB1433.EURP189.PROD.OUTLOOK.COM
 ([fe80::8f70:435b:ab64:9420]) by DBBP189MB1433.EURP189.PROD.OUTLOOK.COM
 ([fe80::8f70:435b:ab64:9420%8]) with mapi id 15.20.6043.038; Tue, 31 Jan 2023
 09:42:44 +0000
From: Sriram Yagnaraman <sriram.yagnaraman@est.tech>
To: 
Cc: qemu-devel@nongnu.org, Akihiko Odaki <akihiko.odaki@daynix.com>,
 Jason Wang <jasowang@redhat.com>,
 Dmitry Fleytman <dmitry.fleytman@gmail.com>,
 "Michael S . Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Sriram Yagnaraman <sriram.yagnaraman@est.tech>
Subject: [PATCH v3 7/9] igb: implement VF Tx and Rx stats
Date: Tue, 31 Jan 2023 10:42:30 +0100
Message-Id: <20230131094232.28863-8-sriram.yagnaraman@est.tech>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230131094232.28863-1-sriram.yagnaraman@est.tech>
References: <20230131094232.28863-1-sriram.yagnaraman@est.tech>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: GV3P280CA0033.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:150:9::26) To DBBP189MB1433.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:10:1e7::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DBBP189MB1433:EE_|VI1P18901MB0733:EE_
X-MS-Office365-Filtering-Correlation-Id: c7b95d67-da31-4e23-47e8-08db036f7d96
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: EqpcJgKS2AaOV6Gojd0n9i6m+FesZOQyjjftn5e9brTTG9mE1pS+Xw89QM0FuniIsJg/RDbVQlb0hsEaXvg9DxARgP20tdT8M10Pby6C7ANgjfSCvYATUKXOunFQL8Jt2lHb1qLeJ0rgAjheM3QS9JnhuFKH3l/tJZPJMgxZyxuATJ+srqJ9F46zN7NQ4cj8BSyM7d792BH20/wwhyssHqQsP99JdiadeWWgF+yYxHygcoaDz8L07FssUK3I4//s6IYR12TU1Iw3KvYlUrFTOGvZMOAD8AYK3z3Wz2obAN87/BUJtBY00AIMvIn+MQ5SsjQQZrzmEWpSpxL56NNJG9RpVm5rgMM1bZ3NJG/BT9GCZ5sdPWwv0XkSQ5+E4FiPSTlTbXVk/HBUQ51xXG27pMBiIVzNM7wwpCvGuZWpO+zeL7Z/HuqJw1Yo/TRxRGcQEohpVnA/WP/dnDj1W6K0X/BJJwD3s8bkBGNas4mEA3h1nwLiRLS8Q7Akz+yxGpXQN8Z3q59n9bl93EfiJrva67y5+lbArG+J1sMRxv0pJyV1kg4UjGSnesl7AFiJyLuMcD83LSOvofyQp7Hu3IA+1bkQvHHpCITe7/21yHuqjiN2R0Ed1k345IU12HLbEEMHn/K4UEW3/J/wlvzAfNCfPp7p0nfUxY5r7+xsVJO/KkoQlsfttS0q29d2bd4GQfwfs2ycESmonE084OtDulOCsysVNTQzsEgT4kqoi6KO8lg=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DBBP189MB1433.EURP189.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230025)(39840400004)(396003)(346002)(376002)(136003)(451199018)(109986016)(316002)(66946007)(70586007)(66556008)(83380400001)(86362001)(38100700002)(54906003)(36756003)(6512007)(26005)(186003)(2616005)(478600001)(6486002)(6506007)(6666004)(1076003)(5660300002)(44832011)(8936002)(2906002)(41300700001)(66476007)(4326008)(8676002)(266003)(37730700002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?KssYnMJIfvya7lAH8iqOf+tRtkEjndX/GrmIMKLRzpz78xtPwUi90AYnPOSU?=
 =?us-ascii?Q?Jmn9ck0Kf0X/4JUHVzISTUQ4JO5L4Wmq/7GtEI8NTTLZpggMZmjbCnSaut1s?=
 =?us-ascii?Q?RNZ+cZcjzqm+GFocfa7WwJdKnlLAsOvVRsM13IVIULisEcbKQniAExmWzt1F?=
 =?us-ascii?Q?uSI8HsJyVLqhhvjYzViDKcOJtWsdN+sZH8d5u3zgm3KvE84tgenAsgPjvwD7?=
 =?us-ascii?Q?QML5WmxcH5Y6waEHwi4KQyvSQJ2GHkNjCdFTd+HtygwBOzfJk5OfJXyVomn2?=
 =?us-ascii?Q?/cT1woz80AicIRZ3dN46HGA80eplTe71BlpBKy/VemN8ZN7XOLNdBUMW5htL?=
 =?us-ascii?Q?lOwL4m6H+7WVn2gH42xgsVLGhnJQYkg2RTddIh79/FoRT0U44yPttqDwl8tT?=
 =?us-ascii?Q?sdN8XbFCQQ+stq4jGgcA20S/+Wyb+Qj7OSCxIzZu1FMw9OfvTYqSDPyVPhZ3?=
 =?us-ascii?Q?+xTc0/5ppUwOLnmzGrB3Ojr+SkuWK4MaLaubp8vgh4YoHs8cMIcZ6IQtRIFz?=
 =?us-ascii?Q?84AThLJ0dsyAQlD3UXYY1Ud/jyYj03QjdeuL73Srr376voXds7w3O5tj08y2?=
 =?us-ascii?Q?Ycw8XD52kYIP8iSfE+ltSTWrwUYO944TUpCKCX47OVEqBMixjaTFCMCsi4Ff?=
 =?us-ascii?Q?10fMQyn4DlW2Xy6UzhlDKAjGkkKVhFEo8K23uw4UhgUtoLS8lNZUXkIybHXl?=
 =?us-ascii?Q?umL8hOUbQYlxZshWansso1QErZ88Ha0Sk7ubGQS1uT61dqzFXepI+QsLwLwv?=
 =?us-ascii?Q?qDvMTzyYQ6xsD1Rly2zBNdCDLVz9y0CcCIzcOYd6gD1IIVgGQMk/VkL9l1Y3?=
 =?us-ascii?Q?OanS1UZ5Efl7hIiyhxem9elDNqzqokhxRl19xvbVtEEf1uvmPgmUgBKQ7xqv?=
 =?us-ascii?Q?cAQhnK48eFYf9YsXmkQ6IMC+iTRkr4oqv2hdvDbY3pQvW0S489kdXKBU0w/t?=
 =?us-ascii?Q?9pdRKJAb5YGvfKfTR622SyvFUHyvoBfYiBfZx4iYNXNrWXvJ/2m2evkBztJ7?=
 =?us-ascii?Q?Y46jknSA1oo+xHzOkxrCGfoW190xXjy9FilMe2GwDkc1vAS/CVMLkf2o31AL?=
 =?us-ascii?Q?7a5LRAdt8cfVnDLY1kf+qWUP8DONuIym5Mb/YO1xdhJQHE25r7sV273gR08d?=
 =?us-ascii?Q?C2QjHtRuUaMXOE48tC67ictlC28i3BQI2mHNyOVAjEhZbE0LeVB7pj10052U?=
 =?us-ascii?Q?84UEVUV1sOb0l+OKCzocZd3FxwmXz3ZQZnUhuaWGm+kQmW/3Jr4kJn58Hspc?=
 =?us-ascii?Q?5zGANOC1+VvRZoCJnRD12eyrVL6zC6cERqumf0RpQZNKToWvMFu4TWQkrR4+?=
 =?us-ascii?Q?jTFYfANQ7rJJL0zFgtj8F/ZWGOIcKnLaFCOGJ7Ylf5I+vtK62P+DLfNADfgD?=
 =?us-ascii?Q?DaJeHgvtSp7PQyz5NXiNA2unA/coRj58x8VtvrWR+nNp99a96b5sp6rOmq0U?=
 =?us-ascii?Q?rBL8F3Bmb4NvyPNihShUCMurllZehnIXm9hxBJvw2pakIOJJmQ0M9gkPD2Qu?=
 =?us-ascii?Q?icqLYHfXQ5AFiGflcm5P5UokTJNzLvdY4HLRUoO8ALjCM39qhyk2n0eSADd5?=
 =?us-ascii?Q?G2ANUdLsaaFxnUbqyo8BP7SE2Ee/wFipK0xmgjb+ft2wZYVxGd6yzVAg0QqY?=
 =?us-ascii?Q?Dw=3D=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: c7b95d67-da31-4e23-47e8-08db036f7d96
X-MS-Exchange-CrossTenant-AuthSource: DBBP189MB1433.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jan 2023 09:42:38.8185 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +sgHfmg9LINV0ZTkoeAbzczttwXHJQ3Ftn7P9Ee4VugDmynqxyjkHQreW5e3d+2yagXk9qBG5R/ykcyyhTkBWcaoVf/ESnRF9JOk0nkWdWM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1P18901MB0733
Received-SPF: pass client-ip=40.107.7.115;
 envelope-from=sriram.yagnaraman@est.tech;
 helo=EUR04-HE1-obe.outbound.protection.outlook.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
index 31a325d374..c5f9c14f47 100644
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
 
@@ -1396,7 +1403,8 @@ igb_write_to_rx_buffers(IGBCore *core,
 }
 
 static void
-igb_update_rx_stats(IGBCore *core, size_t data_size, size_t data_fcs_size)
+igb_update_rx_stats(IGBCore *core, const E1000E_RingInfo *rxi,
+                    size_t data_size, size_t data_fcs_size)
 {
     e1000x_update_rx_total_stats(core->mac, data_size, data_fcs_size);
 
@@ -1412,6 +1420,16 @@ igb_update_rx_stats(IGBCore *core, size_t data_size, size_t data_fcs_size)
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
@@ -1513,7 +1531,7 @@ igb_write_packet_to_guest(IGBCore *core, struct NetRxPkt *pkt,
 
     } while (desc_offset < total_size);
 
-    igb_update_rx_stats(core, size, total_size);
+    igb_update_rx_stats(core, rxi, size, total_size);
 }
 
 static inline void
-- 
2.34.1


