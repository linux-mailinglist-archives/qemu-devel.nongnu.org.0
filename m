Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 36D804B7439
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Feb 2022 18:56:46 +0100 (CET)
Received: from localhost ([::1]:36038 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nK24D-000189-7O
	for lists+qemu-devel@lfdr.de; Tue, 15 Feb 2022 12:56:45 -0500
Received: from eggs.gnu.org ([209.51.188.92]:46654)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1nK213-0006Cz-CE; Tue, 15 Feb 2022 12:53:29 -0500
Received: from [2a01:111:f400:fe0c::71d] (port=64834
 helo=EUR04-DB3-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1nK211-0007aW-D1; Tue, 15 Feb 2022 12:53:29 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eXtNU13VJbBXzjqc1br6MsZLGiXwj2wgxeIEKLbpIdoXRgEqBvp3CkMissthj/rmGkrWrfDTJmQ3Vi0jTdiO4NBkSnVs0pxC9OohO9ZkEq8Eve34N++8yhQJjZNb8YVswdShkekp9+nY1Bd99osHRhYLXSf1Ide/Az9RZtA+8+kp5UBylbzq3WYDfMbJBxyl2ImMCpAcW/IfXZg7bB/poRzkW3KzA6rnk3hNObp6DUA9+Un91xxzSLs8+SZZ3UlDlkZ4DaAD9bPc9dXqs9xtLzIesSheAkPE5cGu0+xJD7ZW7cMvZ8GMf47ElQ7/T3xYbJH7dgqwPwr5YnIHViYQuw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=00mF59kZm41Y0m94Xc2xzHz7fe9xhoLcFTexJNAxGGA=;
 b=EOkKmuZtHn5qRK+kmYvxZ3o6TCvIagGaQ0tq4YNE/P8K4vezVsAnDkx63m6ngqMD2KK8XWlYOa2sAdul/pgfd4Bpcc/CboCSVjZIySbTL8vR1zc7pBm7vuYevymW4/XyqwWGyVuiAbcZyAbWIDcoYHZIY+3ZyiuzR2EBXTiLb7YbUbmwrO3Tl2Escel5s1Udd3wY2UJUo/vUuvUEXIg3PSHCZJMCoVcp7Kz/b4EBkCeeFWoFrbXT1CavAD6IgUBPPCmRpzuJbIT4fNHlEEEZy07DnpfZE698bt/DsxMJukSMxBzNO4M/XuvZI8fpzJZ6V4tHrYUt5tSHp2iUTH1MoA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=00mF59kZm41Y0m94Xc2xzHz7fe9xhoLcFTexJNAxGGA=;
 b=fbmvCZHbIxvnvgGZcGnF3AlfoLNBimFggmX6Oxi0BOgqWl8b2iGSFl3EyHUYbhzTOzNdLNaiGBBjp2p6SmbxhhNWdAw7VqQDUpCvnorr5jX4Aq+6Ajr3U88hlv6fqqvNzprut8pPtuHyuRlJ8USIrI1pLB/ivUok/3aPMBSBiwc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from AM9PR08MB6737.eurprd08.prod.outlook.com (2603:10a6:20b:304::18)
 by HE1PR0802MB2235.eurprd08.prod.outlook.com (2603:10a6:3:c3::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4975.15; Tue, 15 Feb
 2022 17:53:20 +0000
Received: from AM9PR08MB6737.eurprd08.prod.outlook.com
 ([fe80::49c:67e9:3e24:8714]) by AM9PR08MB6737.eurprd08.prod.outlook.com
 ([fe80::49c:67e9:3e24:8714%4]) with mapi id 15.20.4995.014; Tue, 15 Feb 2022
 17:53:20 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, fam@euphon.net, stefanha@redhat.com,
 eblake@redhat.com, vsementsov@virtuozzo.com, jsnow@redhat.com,
 hreitz@redhat.com, kwolf@redhat.com
Subject: [PATCH 1/4] block: bdrv_merge_dirty_bitmap: add return value
Date: Tue, 15 Feb 2022 18:53:07 +0100
Message-Id: <20220215175310.68058-2-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20220215175310.68058-1-vsementsov@virtuozzo.com>
References: <20220215175310.68058-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: AM6PR08CA0013.eurprd08.prod.outlook.com
 (2603:10a6:20b:b2::25) To AM9PR08MB6737.eurprd08.prod.outlook.com
 (2603:10a6:20b:304::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ae07d560-d56a-47d5-cfd5-08d9f0ac0d85
X-MS-TrafficTypeDiagnostic: HE1PR0802MB2235:EE_
X-Microsoft-Antispam-PRVS: <HE1PR0802MB223568CA3F40C4D9D1C84908C1349@HE1PR0802MB2235.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:69;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: SjSFIkSHcAPcWs2QroODNzgs2rpDpVDuVlmvtqvyj7MDVYEgy19bJZyu3gHvJbmsMYIeW8A9z22KV3pymThQzrbruGWmzXBAbKDEgSRSYV/b9ay9DxaLgBBFM9SVzgb0BbIvL2gDsjJJ3iE1LEeX41nwakl90xCrhO8BOq+Sj5N+RoF/TDTCBvderGuiUw1fPlLnO33V3d08yVQX/08Hi6p12tPfBiQZp1QKvaWwXoCIVMy5vZkS8jHO87Zh5Ca0IugWEVB1+3FEE3F4mRWaczy2HSvnp3+N91mIW2rpeIMOF+Vo1AcJzZkauAIShot2SopdTzydmP/GeBCpOJ0/TXAhMO+0mljfkXAhaIbGZe17A4CLAsxeXUHa8MSu1HJ9CrMstBRBw5McBo2Bgjo0Le84RpKBfmNVcCEWzlMZXaAXN0WaW8J4kGGLMh06mEokPiVvxAO4x3treH3olIuRQcy2cNm5fgx8cWdcfmC/Up75LfDBpnUeOttwyzWt5zqejIf9YkhH9f3QK4Rd0gwk8iapVFXhK/KSTchdlSLpz99RGDZeYiKPyi252KrPfWofAibbNvKLYiZz6ucvTB+k2P+h3Vigrk+6PyOkUU53iOWibKvcTl+WE/LJ6IYAnRGFFQzYDGGS+KR8ArO0TVAM5TXCxJNAiBaZ8bYKKX/KvkNfqN9lo5Wyg9NLxYC66zPAsaqr7Epbpf5yJTUQI2nwRrf88OWJSRtrdLUc+dGl4/g=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM9PR08MB6737.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(2616005)(83380400001)(6512007)(66946007)(4326008)(8676002)(66476007)(6666004)(6916009)(66556008)(38350700002)(86362001)(38100700002)(26005)(1076003)(36756003)(5660300002)(6486002)(316002)(508600001)(52116002)(6506007)(8936002)(186003)(2906002)(14143004);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?XHTI69M+HoShDDyizNFwdAydK4EClWwX2jREswmC4yB8YWaYX6a7sadd3XSV?=
 =?us-ascii?Q?rhI21kP6LBWDzPyprBEGw2N6zLSejxaD0Hz1/NjPqKSonThfEf+PticWUqK7?=
 =?us-ascii?Q?J/47s8D6+hsXTu1/COS8sTHLnt3PcmCtY5Q8OxScqfkSpSY7k9Y/boKRSIIX?=
 =?us-ascii?Q?CcLCn+WmyNo8+NDixOMGG1jdEOKV4TOHz/tH7Y1OOVN/edl+Egp4qMyzvjoE?=
 =?us-ascii?Q?K3+/z/SZBFx+VhohA8kmXgsUChcQhPuyfGP3DiifJggK+1HAj14/ThS5vOHi?=
 =?us-ascii?Q?ljZYB1M7qHkY1a7MqDDF49j+YehFBPt4qYwcaizj5ILpCGW1T4mlt+xrl3Wm?=
 =?us-ascii?Q?bioQ6ahyeNGcoF+6SwhVql7W3XZsmvII11V5HSOFJUx+pvSCcgdeHiMUX30C?=
 =?us-ascii?Q?cF7TmdWrBU2PplXWTIU1H2GxlyhdANBqcMJNmONyCBNvI/h+FAXPs92MTEsJ?=
 =?us-ascii?Q?NnQqxEbVoXQMa4IU4lpPYPNH00JcTt8ZBeiehFhoZylAwfU5rkgTjEf41nKB?=
 =?us-ascii?Q?bEWZ9Ty+uaa1IsRfuK2u3NgZXcdm6y7+N09yZEdxKUk8gd7yMlL1+5NEypbP?=
 =?us-ascii?Q?6HslZUvjd+L3/fyK6qAlcJHuzYF/BKHZo94Oh2Ozq1pbecK1OCwKgDJePMK3?=
 =?us-ascii?Q?ZJAQg5Ct4gSWRBN0BlDt3LnIBXpLHxhMNWBRU19q5bWKw/SamlGoK2CgfBEz?=
 =?us-ascii?Q?3EWOX6oFexxxHyv9FVcTDKqbk2fHb/8V0XfGN9vlY/Fsb+04E6+NAkBzxIkA?=
 =?us-ascii?Q?plFg2fs/Wb929cQx6/47Dl17Q3ufmNpVcQ/aWK7bPqogfGj/Qxhi+uvH+56F?=
 =?us-ascii?Q?0DLQmBYYsN6I2Rt85+9M+ZaU6SBQKMpvkHq2/DCc3vt41gF4ssg0biGg/nX4?=
 =?us-ascii?Q?C9kVhfuK4tO6vzvNK3wNdBx9+TjnMROe9mbwH9Nw4Xd9XXQ5CjN9zaYMUjEM?=
 =?us-ascii?Q?Q2uJb/1Z8sd31zeJIehWp6djQQApMQl3CY+zS5YKntE4MifIKVsxMFaJ6322?=
 =?us-ascii?Q?9Cq/ROHJ+EohRploru/+QzOSkadf7b+U1/Ib7yS7OYXC1E3KNDU4R4GMfJFc?=
 =?us-ascii?Q?uIbRJLUHYJD9kojBgdQs4XDnlb0LQ9MWS9YU3r/BfTwK4AcgzMmzyfTtJ5QL?=
 =?us-ascii?Q?IRoXcHwnYUN1rhP1ipz9wV26T50gRfO59hjKCKyw4CowSUxeOs390Wgu8lZY?=
 =?us-ascii?Q?DhL335aOCPefjXasPtcYccAhQ59+KxELr0PkM+GIXTjKsV46Bd1G4i8UPcLq?=
 =?us-ascii?Q?mlMKsQxLJgVjT6D1VK/hKg2MLe/yyNGovc1v2zYyq8qxnocZbBNBlqcRNywO?=
 =?us-ascii?Q?pIURGOoH7aMAb9GkPgofBKnJ6mWZlezsVYrj7l48oq3U1TLKKg+g5I7pZMDa?=
 =?us-ascii?Q?4doDlBbIg8y5Xyp8DiEWOLHeqr7lXR5nvKiIQo7C2cKBcMhY3m4iS06n4pSD?=
 =?us-ascii?Q?QzjsmYm7KzaTPuwpqxizsCn1IRo03Id7ZotStdB9HguYg41pYmd0Ii9B78kA?=
 =?us-ascii?Q?Zz++JXFir5D1uhw1yLiThlVFv56k0LV9mQcrTeVLwQXGLM5m1ZbpjqxfQGAs?=
 =?us-ascii?Q?DgoNqaX/U14M/S5C2fSfHPSWG/onCIHqqXYy+KQ8nAjMKdqKraXOeGyTrNDt?=
 =?us-ascii?Q?dwjcSlWTUedmvql+T51G7Xf0h5zDNCzOT0b22jguu7OzXXrVv86L/wP0OWrW?=
 =?us-ascii?Q?tARKyQjga2P7iwrSaGWJXxpoFAQ=3D?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ae07d560-d56a-47d5-cfd5-08d9f0ac0d85
X-MS-Exchange-CrossTenant-AuthSource: AM9PR08MB6737.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Feb 2022 17:53:20.2330 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BI+8QC1xT4cJJgYIlVIMl20Mj6wMEDIGKc6Qz1rWec2wek9gWT2zqZZkc5cDOqUrvRJVIbecON4UIsD3kidmZCin/r31hABb7qZb9vFQZ5M=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR0802MB2235
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a01:111:f400:fe0c::71d
 (failed)
Received-SPF: pass client-ip=2a01:111:f400:fe0c::71d;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR04-DB3-obe.outbound.protection.outlook.com
X-Spam_score_int: -3
X-Spam_score: -0.4
X-Spam_bar: /
X-Spam_report: (-0.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.904, RDNS_NONE=0.793, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Add return value to bdrv_merge_dirty_bitmap() and use it to reduce
error propagation.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 include/block/dirty-bitmap.h    | 2 +-
 block/dirty-bitmap.c            | 6 ++++--
 block/monitor/bitmap-qmp-cmds.c | 5 +----
 3 files changed, 6 insertions(+), 7 deletions(-)

diff --git a/include/block/dirty-bitmap.h b/include/block/dirty-bitmap.h
index 40950ae3d5..f95d350b70 100644
--- a/include/block/dirty-bitmap.h
+++ b/include/block/dirty-bitmap.h
@@ -77,7 +77,7 @@ void bdrv_dirty_bitmap_set_persistence(BdrvDirtyBitmap *bitmap,
                                        bool persistent);
 void bdrv_dirty_bitmap_set_inconsistent(BdrvDirtyBitmap *bitmap);
 void bdrv_dirty_bitmap_set_busy(BdrvDirtyBitmap *bitmap, bool busy);
-void bdrv_merge_dirty_bitmap(BdrvDirtyBitmap *dest, const BdrvDirtyBitmap *src,
+bool bdrv_merge_dirty_bitmap(BdrvDirtyBitmap *dest, const BdrvDirtyBitmap *src,
                              HBitmap **backup, Error **errp);
 void bdrv_dirty_bitmap_skip_store(BdrvDirtyBitmap *bitmap, bool skip);
 bool bdrv_dirty_bitmap_get(BdrvDirtyBitmap *bitmap, int64_t offset);
diff --git a/block/dirty-bitmap.c b/block/dirty-bitmap.c
index 0ef46163e3..d16b96ee62 100644
--- a/block/dirty-bitmap.c
+++ b/block/dirty-bitmap.c
@@ -881,10 +881,10 @@ bool bdrv_dirty_bitmap_next_dirty_area(BdrvDirtyBitmap *bitmap,
  *
  * @backup: If provided, make a copy of dest here prior to merge.
  */
-void bdrv_merge_dirty_bitmap(BdrvDirtyBitmap *dest, const BdrvDirtyBitmap *src,
+bool bdrv_merge_dirty_bitmap(BdrvDirtyBitmap *dest, const BdrvDirtyBitmap *src,
                              HBitmap **backup, Error **errp)
 {
-    bool ret;
+    bool ret = false;
 
     bdrv_dirty_bitmaps_lock(dest->bs);
     if (src->bs != dest->bs) {
@@ -912,6 +912,8 @@ out:
     if (src->bs != dest->bs) {
         bdrv_dirty_bitmaps_unlock(src->bs);
     }
+
+    return ret;
 }
 
 /**
diff --git a/block/monitor/bitmap-qmp-cmds.c b/block/monitor/bitmap-qmp-cmds.c
index 9f11deec64..83970b22fa 100644
--- a/block/monitor/bitmap-qmp-cmds.c
+++ b/block/monitor/bitmap-qmp-cmds.c
@@ -259,7 +259,6 @@ BdrvDirtyBitmap *block_dirty_bitmap_merge(const char *node, const char *target,
     BlockDriverState *bs;
     BdrvDirtyBitmap *dst, *src, *anon;
     BlockDirtyBitmapMergeSourceList *lst;
-    Error *local_err = NULL;
 
     dst = block_dirty_bitmap_lookup(node, target, &bs, errp);
     if (!dst) {
@@ -297,9 +296,7 @@ BdrvDirtyBitmap *block_dirty_bitmap_merge(const char *node, const char *target,
             abort();
         }
 
-        bdrv_merge_dirty_bitmap(anon, src, NULL, &local_err);
-        if (local_err) {
-            error_propagate(errp, local_err);
+        if (!bdrv_merge_dirty_bitmap(anon, src, NULL, errp)) {
             dst = NULL;
             goto out;
         }
-- 
2.31.1


