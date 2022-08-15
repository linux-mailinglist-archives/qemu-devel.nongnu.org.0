Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 05359592B32
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Aug 2022 11:23:46 +0200 (CEST)
Received: from localhost ([::1]:49158 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oNWK1-0007mD-5P
	for lists+qemu-devel@lfdr.de; Mon, 15 Aug 2022 05:23:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60814)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alexander.ivanov@virtuozzo.com>)
 id 1oNVzh-0000at-TJ; Mon, 15 Aug 2022 05:02:45 -0400
Received: from mail-dbaeur03on2099.outbound.protection.outlook.com
 ([40.107.104.99]:8993 helo=EUR03-DBA-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alexander.ivanov@virtuozzo.com>)
 id 1oNVzg-0000MA-3G; Mon, 15 Aug 2022 05:02:45 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZZQ36RCodk1ZNzQRHRfrjkpLFP57hfrVKluo/JKTDMjRHLkgt6ABJkZ/33Xj6epXLN7q47ckyTMu/8eyKj3s1389ZGOIXgdwRB76vTUA+JK/gWpqxsZ/V/uRg7n32UOgDEaSxf5Wxs9FoOh+av8q56UX22qsvaYPEhAPqujE0+8sX+NVZ90FyKInnUjRGO2AIFsZb1rjW8eOfh/TY15WCOu6hScbTx/NDR08/AVuvui7hiRnUEbu9qWNhvwb9A6lHEC9qvdoieYIUmPzcKe4pD9sWvpaC4rniXJ7/TPTD8qphT0xZ9dJEwzJeiu4BUHsQBDlTk31IakL2skXf/GbBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iw2mfR1InmCH07m6nqXMQGwYdQ/DVmfxCKxZCPdZFkI=;
 b=mbbQkVzdCAvA13Kk3tpigSEHIwSocXsTwpF6MigiXxhQ3rlY6TBcasf4aB2wIr7U3ghuAtBHMKLvl8B09WI3K0K0e9O0xJmDDwWIdayOH6Z/+YLvxaVEcBiOeU1RqL4VPOvTNNDY0z/cCYPDxuG3L2OqwiGFku1ZVCXrwIdFf+1AhiW5hWbsosaAOoRFmZ+zRHagL3kzw0wFGpFO4MhgFi9jmkNDUlUivT2vOeJ9sc262GiciL1pSyQNxxN/tM/v0f4qazgUPpPhBocHCTjvyx3LmTp1rlgjl+fFI3b1go9s8SJ1oMuz6R+5+cXcwQ43+pHNQBa00EUV+7pm5iLkfQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iw2mfR1InmCH07m6nqXMQGwYdQ/DVmfxCKxZCPdZFkI=;
 b=ssG4YfePrYojzeExtdg1J5EkDjdmgoiGIecxo8I0LSdW8dR8c8FH4sl6ZGSnwnD8OYNYsG6j6pbsLpGidQg7mGL9YFnUenE2miFING2wTGSmwK8HKL2Eke7LiOhUmttQb/M7aMVyUhfAQFyv27bkElqKV4M2khyhK1sGrwmA8HHhPuzc0RWLKesxScuXXXyUstYhBJ+5FqnOJ1RfOuxf9SNRGQ2HzvBV6QEC0M8GYyIqmrbd67xe3i3vYvFUY2/r3s1d/vch9EC5couKW7+veYg1bj2BA+3t+85xDv0nh4tIGsHTB1HosdP9y1BjOD4nnocci0FK1LUxd5Ldu/K1dA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from DB9PR08MB7100.eurprd08.prod.outlook.com (2603:10a6:10:2c6::19)
 by PA4PR08MB6032.eurprd08.prod.outlook.com (2603:10a6:102:e4::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5525.11; Mon, 15 Aug
 2022 09:02:30 +0000
Received: from DB9PR08MB7100.eurprd08.prod.outlook.com
 ([fe80::4033:4b6e:d42c:349c]) by DB9PR08MB7100.eurprd08.prod.outlook.com
 ([fe80::4033:4b6e:d42c:349c%9]) with mapi id 15.20.5504.028; Mon, 15 Aug 2022
 09:02:30 +0000
From: Alexander Ivanov <alexander.ivanov@virtuozzo.com>
To: qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, den@virtuozzo.com, stefanha@redhat.com,
 vsementsov@yandex-team.ru, kwolf@redhat.com, hreitz@redhat.com
Subject: [PATCH v3 6/8] parallels: Move check of leaks to a separate function
Date: Mon, 15 Aug 2022 11:02:14 +0200
Message-Id: <20220815090216.1818622-7-alexander.ivanov@virtuozzo.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220815090216.1818622-1-alexander.ivanov@virtuozzo.com>
References: <20220815090216.1818622-1-alexander.ivanov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: FR0P281CA0044.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:48::7) To DB9PR08MB7100.eurprd08.prod.outlook.com
 (2603:10a6:10:2c6::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 27cb143d-c27b-4bd1-0f55-08da7e9ce229
X-MS-TrafficTypeDiagnostic: PA4PR08MB6032:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: aleiJNBgS16eRXT3aldUwq/y6Uca7RfZwG5kN1KHY4LBZSqUGi0yREgH2N4OSTCFHmn4gcD4M04R8IW3Ont2Qh/K8fXPLKsow7RxSlBCpE1LmvsMjXtsagpJzAKnNMgzcmouxGOl/RLPsW8OQkfAEPW8c8q+Qjv3mxwGFB8JOVXDUE3gX1NTMJAQMHEBnSlaLEQ4wwf4Ew6oC0FYaKyQgzVcu1Ag+nLfxcWdnB2bghPurFGB3ugTovs5cCIxKXMDt4/vpH3VqxxwGN8Qm3VNCd14qoHVPnNOU16iJmRiw8UlyAsVoe+NOvVBtCjcWxnxcNOzrhpE8b4uZ5Tylda9C7vZKp77frggSr2LZWaTFAVkdaUnvmgS92CWCI4KrMuXj3+ZrkCDOQPhVGFmM9Z8Qaw+b8x+VwZDEPvOH3TnG4SX0Jn2BgQFaMyf5nGszrGTK5UXyhy5L3ULitv/S+yFARrW34ubUuqew9YKY5pHps6ghzOVqg/PD644bSBVbDW4POJq46DC2m1CTQGT0VAiz0PNhav8gLfVVgpee3FbaZmvEqKMM+pGrYzte72IFcemVTi6Jgjfo9Ts4vo7yyh/IPrA0Z+uBjEgzDjwYm3xvS0t8be06KA5OsS2+btc4w1eZkpIn1SZbZu22y8SIj5eXEQ0HMJEqcg+gPgMt712e+/mPQLlGBrwH3adgXm0oa/6W66D6Tz8MLbIBM3vVQK3BIIBkDWv0HIzsXTxoj7pz89OYy4yPHlMvkrrJL7Df0o1YnxCa+WdpsgjnaENjdEZakISsmRUV1TlnYqE0KnFOA/IWCos8lsQsqES0ICjb20J
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DB9PR08MB7100.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(366004)(376002)(39840400004)(136003)(346002)(396003)(83380400001)(86362001)(2616005)(41300700001)(36756003)(6506007)(26005)(6512007)(6666004)(1076003)(4326008)(52116002)(186003)(316002)(6486002)(478600001)(66946007)(2906002)(66476007)(66556008)(6916009)(38100700002)(5660300002)(44832011)(8676002)(38350700002)(8936002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?o6Vz701seH3U7f1ckwAciiZdUtamIEqEZvrso0sMUnnrgofySqu3l5akc7zi?=
 =?us-ascii?Q?obzEQdrQgRJ944b7UTtnGuu2RxZQUcK6kjlnKU2MHIHdD9X00XJf2KsGy2ck?=
 =?us-ascii?Q?Q8qyW2NhAKosl7+6rSBtCT2OIb+C9V1BcJCwW5FvAoDIho0M2fId+Q8Wz4qD?=
 =?us-ascii?Q?EDTExMDs3XxtG/5f20UUdbW1QS17fPQgvPJ6Ujt3UWOomme8IlgX9Ee7h8aL?=
 =?us-ascii?Q?OG+kqH85s2zBf9EW8ssE1kj4fNnZzcz0EM7bvjPAybed1eEom6QmN+iCgeyv?=
 =?us-ascii?Q?0FzZqaizRvGUsyUsdbTSdk6tXb7kNdyrU18kgw+LSaMTmHLVhq2VtyDfmPZN?=
 =?us-ascii?Q?nOJ+b/IPi3l80zDwY840xxfnVL9uNSWG3GcvhnL0cvWlWqB9TbMIO6G6Xmxg?=
 =?us-ascii?Q?oCV0HaYioHNNvVvBJEuWdzhAiP7gFsSBFNFTWZ5axi8Chf1kT2t2LYaOJVhA?=
 =?us-ascii?Q?8Vb3lZC7LFD2G9w4Nva+i3FU4K5y8DQgOUaKTro3s704inTTzV0Muqw4Qq8O?=
 =?us-ascii?Q?kGiumZXnQ3aN6XuLXG5Bs/f3WkVXhddeiTVpZnHLPBm29+5g990dtdzUFcki?=
 =?us-ascii?Q?jVbC9S+M1BybcdcpF/yiILb0J1gQh38dEEi9GmaRQS+McaM1B0dYPR5MjRT3?=
 =?us-ascii?Q?XVgw2GHFr1qn8YaHpuouIM9dDeQdbdIbQ9D3L1yvwN0qdlMoa11R9PW6/CZ+?=
 =?us-ascii?Q?YxnYvQNnQTpvRddrd/rhYkoBH29pPv483GC0sZN/uLN8wAYXH2c//8jhq+/g?=
 =?us-ascii?Q?Dwd3hlfCZJNryj9CZOmQlYNy+h/fsLGoM28QJNLORp2JByCTHc6yY2DiTSXs?=
 =?us-ascii?Q?PtbUdpoQ1u8dvmk35e6XBXzb7+bwO9I4CiKMUrIvhDrVYp2XohmYcYDhrtbM?=
 =?us-ascii?Q?AcYgZID61B536SInEoMIWAVaivALizgIsosnSSgFGURpQJ5UlPewtC10l63N?=
 =?us-ascii?Q?ewUCz0xmziSVhRkUTTzGX0ePG1tOAai4MbykOVWCSC9AFjopUhps6EUaPYVU?=
 =?us-ascii?Q?uFV/zYInDbEvPssNDPc6melU0YZOqcMsuenND8dICrsFqrqBLTOpU8+0HfJd?=
 =?us-ascii?Q?fahgoAyQE5k/1uNg+4GTDKQTX9rGNFlUOTNvTISNw/AgCZICGV+AF+Ce5KUj?=
 =?us-ascii?Q?MAxMZont+cBdgJlVT8yK37D0w69GrE4U4pNJutybu3RNaz/vThMs/3v/fl4m?=
 =?us-ascii?Q?7CdKySIagUzxEar1hZyeTabKi8Fc42fDJugvwpXUTWg3dG7VKGPexFOzO4D/?=
 =?us-ascii?Q?zBtnDY624I4++Qytimn7HHSB2T66xl2VkumqSzL6xwXijUK4GUlLMyx+Ej6d?=
 =?us-ascii?Q?Vg/Zg5KTFI6hKWw153fD/HCUlJ8PEhegZKCmOZFhhAFXD9yAuKUNejqAL7bz?=
 =?us-ascii?Q?XJnuDpnBiny7HYY1ROVkgECIg6FHSdBKaiylfuDedzfcLXMAXGCjFLcfYiS7?=
 =?us-ascii?Q?VKgYWCbAa5HbEFwYPs6TOBE674Tc5A1q6JSCixqR5YP3NrII+4XWIhJPOiz1?=
 =?us-ascii?Q?fzII0EIKVvCXaypOjOBc+rODmOOg+ww37VNbBnhm7biyBucfB2ra49uMSX6t?=
 =?us-ascii?Q?+PE8OCBYmsMRDmi6lxSjZvrYnzIbB0N4MWJVtPepDL0I84lFb1G3erw9p9HO?=
 =?us-ascii?Q?1Yc1AaAKitPXC1/W97YkO44=3D?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 27cb143d-c27b-4bd1-0f55-08da7e9ce229
X-MS-Exchange-CrossTenant-AuthSource: DB9PR08MB7100.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Aug 2022 09:02:30.1779 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YUeeHTe/4VmyNlesuWD6JSAZgdCWLCFFl8nI9FkmeUeJI2uqZ8GH24piua6+xYySmoeh4V2D9Go7zWz1ll62wgjtW6yhzMBuCPVEuPPna7w=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR08MB6032
Received-SPF: pass client-ip=40.107.104.99;
 envelope-from=alexander.ivanov@virtuozzo.com;
 helo=EUR03-DBA-obe.outbound.protection.outlook.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

We will add more and more checks so we need a better code structure
in parallels_co_check. Let each check performs in a separate loop
in a separate helper.

Signed-off-by: Alexander Ivanov <alexander.ivanov@virtuozzo.com>
---
v2: No change.
v3: Fix commit message.

 block/parallels.c | 85 +++++++++++++++++++++++++++++------------------
 1 file changed, 52 insertions(+), 33 deletions(-)

diff --git a/block/parallels.c b/block/parallels.c
index 12104ba5ad..8737eadfb4 100644
--- a/block/parallels.c
+++ b/block/parallels.c
@@ -469,14 +469,13 @@ static int parallels_check_outside_image(BlockDriverState *bs,
     return 0;
 }
 
-static int coroutine_fn parallels_co_check(BlockDriverState *bs,
-                                           BdrvCheckResult *res,
-                                           BdrvCheckMode fix)
+static int parallels_check_leak(BlockDriverState *bs,
+                                BdrvCheckResult *res,
+                                BdrvCheckMode fix)
 {
     BDRVParallelsState *s = bs->opaque;
-    int64_t size, prev_off, high_off;
-    int ret;
-    uint32_t i;
+    int64_t size, off, high_off, count;
+    int i, ret;
 
     size = bdrv_getlength(bs->file->bs);
     if (size < 0) {
@@ -484,41 +483,16 @@ static int coroutine_fn parallels_co_check(BlockDriverState *bs,
         return size;
     }
 
-    qemu_co_mutex_lock(&s->lock);
-
-    parallels_check_unclean(bs, res, fix);
-
-    ret = parallels_check_outside_image(bs, res, fix);
-    if (ret < 0) {
-        goto out;
-    }
-
-    res->bfi.total_clusters = s->bat_size;
-    res->bfi.compressed_clusters = 0; /* compression is not supported */
-
     high_off = 0;
-    prev_off = 0;
     for (i = 0; i < s->bat_size; i++) {
-        int64_t off = bat2sect(s, i) << BDRV_SECTOR_BITS;
-        if (off == 0) {
-            prev_off = 0;
-            continue;
-        }
-
-        res->bfi.allocated_clusters++;
+        off = bat2sect(s, i) << BDRV_SECTOR_BITS;
         if (off > high_off) {
             high_off = off;
         }
-
-        if (prev_off != 0 && (prev_off + s->cluster_size) != off) {
-            res->bfi.fragmented_clusters++;
-        }
-        prev_off = off;
     }
 
     res->image_end_offset = high_off + s->cluster_size;
     if (size > res->image_end_offset) {
-        int64_t count;
         count = DIV_ROUND_UP(size - res->image_end_offset, s->cluster_size);
         fprintf(stderr, "%s space leaked at the end of the image %" PRId64 "\n",
                 fix & BDRV_FIX_LEAKS ? "Repairing" : "ERROR",
@@ -536,11 +510,56 @@ static int coroutine_fn parallels_co_check(BlockDriverState *bs,
             if (ret < 0) {
                 error_report_err(local_err);
                 res->check_errors++;
-                goto out;
+                return ret;
             }
             res->leaks_fixed += count;
         }
     }
+    return 0;
+}
+
+static int coroutine_fn parallels_co_check(BlockDriverState *bs,
+                                           BdrvCheckResult *res,
+                                           BdrvCheckMode fix)
+{
+    BDRVParallelsState *s = bs->opaque;
+    int64_t prev_off;
+    int ret;
+    uint32_t i;
+
+
+    qemu_co_mutex_lock(&s->lock);
+
+    parallels_check_unclean(bs, res, fix);
+
+    ret = parallels_check_outside_image(bs, res, fix);
+    if (ret < 0) {
+        goto out;
+    }
+
+    ret = parallels_check_leak(bs, res, fix);
+    if (ret < 0) {
+        goto out;
+    }
+
+    res->bfi.total_clusters = s->bat_size;
+    res->bfi.compressed_clusters = 0; /* compression is not supported */
+
+    prev_off = 0;
+    for (i = 0; i < s->bat_size; i++) {
+        int64_t off = bat2sect(s, i) << BDRV_SECTOR_BITS;
+        if (off == 0) {
+            prev_off = 0;
+            continue;
+        }
+
+        res->bfi.allocated_clusters++;
+
+        if (prev_off != 0 && (prev_off + s->cluster_size) != off) {
+            res->bfi.fragmented_clusters++;
+        }
+        prev_off = off;
+    }
 
 out:
     qemu_co_mutex_unlock(&s->lock);
-- 
2.34.1


