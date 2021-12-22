Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C764947D4E2
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Dec 2021 17:10:00 +0100 (CET)
Received: from localhost ([::1]:52256 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n04Bj-0004ub-VA
	for lists+qemu-devel@lfdr.de; Wed, 22 Dec 2021 11:09:59 -0500
Received: from eggs.gnu.org ([209.51.188.92]:52442)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1n045O-00055T-C5; Wed, 22 Dec 2021 11:03:28 -0500
Received: from mail-eopbgr70109.outbound.protection.outlook.com
 ([40.107.7.109]:2823 helo=EUR04-HE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1n045M-00043n-8F; Wed, 22 Dec 2021 11:03:25 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CDI+lBfWqS1FIyJ2/1mwFmXFfcWvlO4UGUkV1aoDXlKfiKk9hA9D5FRaKPqnRyW2imsD+9EEWM6ZT53M9k5u75VE7oTiSveKJY5XuqEv7Hrmra9cbidWRf6+fTavPRwo7ai71AnHiKXfUrynuhg16PM7F7MpdIDJInRSfu1k2imie4XCOSz0huX82wTt2h9ihdJVeYecfaoy5L8NZb+zzGQQk648GtEXU31JOguwRCbc54xL7B37+f4LjreHkHleiuvxS6A0JvTXBGJDN7CxhB6oONUbgak8vDNriIGP+5UBQ5HgcCbgIarKLar/U+77JcrOEiXcenp2lUf2p5H7bg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AndI/kjMV/Rw7ma9GHxUT1a7OLf3o/5vszUKnrgH8aY=;
 b=amLNKxl6WSy6ZGOwHSzwuccW9qT5n0iNPkBW9+P/L1zBKsgABxS1g6xFUsRvoL3QDVLI0yQYaW4yNzuT3VkMqFTXcLi1JUkYkwQQlGZWEtGc/sYMgGAWVrwC+ArZKC749EQ2VVJrgVc8mYoPQkv5/s2R13duFv1yG5G0XCrQSrTpE1NVPsj6FVrYlbCBCdi97Dp31LhjYkgQR4/nkqnlmP5lIfoQe4vlXHoJvjmr5SRIbueSxzmIBZ3oJEAnkCB8YctypeV9Nh8zIy8GIZbBx39hDuWA6DPEf+xVKkO5aI7oc/9PynPBtF6SU2DnERyRWqC4vtwX0nxHhn6j0Ru3Hg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AndI/kjMV/Rw7ma9GHxUT1a7OLf3o/5vszUKnrgH8aY=;
 b=VGvpxW4qdVW7cmR1XQYRZuUEyBmrBzwLik8Lc8pOEewNu+yPOUkXlV5YYi+qMv1kCUgHzgFz8SV+X9ICXd9+gnJSoM+QVQ4z/tnOM+Jjiy7UiBLvaY2r4HGGkMQnrTSOaGotzKgIolyXK7fc8h7qBuzk0m3w51ReTriLXTwISs0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from AM9PR08MB6737.eurprd08.prod.outlook.com (2603:10a6:20b:304::18)
 by AM9PR08MB6148.eurprd08.prod.outlook.com (2603:10a6:20b:284::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4823.18; Wed, 22 Dec
 2021 16:03:12 +0000
Received: from AM9PR08MB6737.eurprd08.prod.outlook.com
 ([fe80::b118:483a:d003:3112]) by AM9PR08MB6737.eurprd08.prod.outlook.com
 ([fe80::b118:483a:d003:3112%5]) with mapi id 15.20.4823.016; Wed, 22 Dec 2021
 16:03:12 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, eblake@redhat.com, armbru@redhat.com,
 hreitz@redhat.com, kwolf@redhat.com, vsementsov@virtuozzo.com,
 den@openvz.org, nshirokovskiy@virtuozzo.com, yur@virtuozzo.com,
 dim@virtuozzo.com, igor@virtuozzo.com, pkrempa@redhat.com,
 libvir-list@redhat.com, stefanha@redhat.com
Subject: [PATCH v2 3/4] block: make bdrv_find_child() function public
Date: Wed, 22 Dec 2021 17:02:53 +0100
Message-Id: <20211222160254.226909-4-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211222160254.226909-1-vsementsov@virtuozzo.com>
References: <20211222160254.226909-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: AM6P193CA0070.EURP193.PROD.OUTLOOK.COM
 (2603:10a6:209:8e::47) To AM9PR08MB6737.eurprd08.prod.outlook.com
 (2603:10a6:20b:304::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 81918132-e9a8-4d09-6b95-08d9c5648e32
X-MS-TrafficTypeDiagnostic: AM9PR08MB6148:EE_
X-Microsoft-Antispam-PRVS: <AM9PR08MB6148D27A95BA2108CD15539AC17D9@AM9PR08MB6148.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:635;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: pyjfb6VZGYAFY0M41XmYmxw/Ty3Mfiz6c5wbFnADV73wzKlEPSulvw+KIlT28oBLC15rxEtfpPIYyliONO2PgsImF/m2znSK/GKKFuqPYdVODJYBCidAt27b7UjkKlQtL4S8FMqCu5sXZjeMfIxQ4hoZTSCnVxl2TViproIg2jDj/6+aClJgI4FTxWA+1Tuaw8bzEbUnCgexL37r8cjyp7KYxlb+9/DCw2g4ljx9qcM/lksX68u8B7CY8iuFNjLfS/V4Q2S7VCb8iniH1G6UQfwyhHEkCADMAK8ZpdEjpR9PvK1EhdoMvFYcoudoJHiZu8JzDGDFsLmLpvhU5d4LSZWkCSBl9CeNzXP9jLoBDYSl/dcG47VOwRv/duXCR0vxTWUizqoY5BLEeQjZse48LnS9W4wiCXeo/6TiJ5zqLn+D58OY0UG8Wg4Uj4/U/jcF7FXgESKd0uQGWWa6jr9uPhP4m0jk6hUJscysYIgRmQLEOhkE715x1YKyJTqL+CCDjRbRKkeakz3ttlTh2xlErRyLlkwpNJeeYZxKNVVXVSTtar/HvZ3nojLRtZmvRsFQmgDDRoNFHb5ERg0DDI4ZtvEVkgpNiKRdW2xket28of92KrQrxFqURDBkifi52zG4eXbn3yBvSowTENpSaIb9I4lO/F3MfplHkH4gh5fVCeR3dZR1zEzfGopdn3mJ2mcxDusZTxGwbMHziTbWar7W6w==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM9PR08MB6737.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(38350700002)(38100700002)(6506007)(316002)(2906002)(6916009)(2616005)(1076003)(5660300002)(83380400001)(6666004)(86362001)(8936002)(6512007)(66476007)(36756003)(6486002)(186003)(26005)(4326008)(8676002)(66556008)(508600001)(66946007)(52116002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?sAS4A97sfKMw6qnECFv1+kwP6UtmDy4VyS7/zFkLlUTOYX/8XhkZrhCDmvA3?=
 =?us-ascii?Q?on5vSSjI9bTQtYWn+mkOMM7zcVwl8DMp30JFZz5q8HxZnLHCNZvSJXeE5Ew8?=
 =?us-ascii?Q?PTVEs7UPkccSvcQY9NgcbNIPUJBg4bU7PGffbhA1uLiDVx79c/UCH3ATBqBO?=
 =?us-ascii?Q?aUK7ii4/BrCEDPtykkJqqqYtCC/+0R7JpC33mht2FYFvO/r3EVVP01my23+S?=
 =?us-ascii?Q?g4VbjUzycbJGJF61j3cQL4VJfZGoCfhJunbnIa1aIDNAlTrxFmZH31rwPPry?=
 =?us-ascii?Q?FwN1vfO3GEMjr1ZbxpuaA9ojP43I4lNL1VNaDbMhP+bIYikIseroDI2HqMCS?=
 =?us-ascii?Q?2YZKAEY6ladtzURpnhPGWlPqkQFaAekGLkTxdRc70nnuGu+5a+tnI7lWkBsr?=
 =?us-ascii?Q?K3lP2iCmfgKZ9i80qsJIZO8kancjalYh2ywW33QUFI2s7sMlxnOy1XN9BfXa?=
 =?us-ascii?Q?orlRCQevmE7WtOTPXOEED5K6IuM9WWlMECuG2dBLycEhrdY1PqreQ1i15I3d?=
 =?us-ascii?Q?dz11o22Z4GEm1Nn56OOirH2/2xceJD6voN8w11H/Cfu5mvO5aqWveac5FNrE?=
 =?us-ascii?Q?0jnHn9MTuWQhFWZqfvNDk8h95cRcFGGrZNbRoBmWcWGFPsjcDhlJ/LI8/k2w?=
 =?us-ascii?Q?yBrBKtao5X3zqa1PE4Gppe/7bN8oXRYK2cCwfsmozMZdXS8rUJDUuHihnpMY?=
 =?us-ascii?Q?/kGBa2lM/UDN+xuz/DIBEP+NskgXGXL9eJT4DsGBSzZBCR8SrS3sKXhj+dHK?=
 =?us-ascii?Q?oTMjootY0zNjKs1YtY5Ve7BTA//AquDKI/yDPQyaoaRLu7l+2Zi2tolG3yPq?=
 =?us-ascii?Q?j/7LGkSOvuV9rRwna5BG7jqSuxcNMHvjvZFf2Q+Q9PnUK2FFecQIV3bded10?=
 =?us-ascii?Q?3y/Ii1qdFRAbrrtaU2jDlsOk4iAbQEdukBu1yNAVD7DlB45V8oeLyPbyecES?=
 =?us-ascii?Q?Pc8DDOEZ1SGk3/PB41E9TJxvBI383ihFlA58pPYhElr3Gs7FcyJSp+qrbce6?=
 =?us-ascii?Q?STD5BRMXGPEDfK2wZ+hMTvsgoROCCgKTAkCDCinj8qqTk70WNaZPpf1Ro7eI?=
 =?us-ascii?Q?GFS8cM63MHd49GtZs8N5hmxfiH5DSZiV6XMb52nc7SZk0zAoxhaDsRSis3D2?=
 =?us-ascii?Q?eaXPsct7h6agV8pHxN+DPA7QECLq4r7AVXSZ7TY8/H/as8q1ZViEorE87I34?=
 =?us-ascii?Q?3g1PunkNBCS8zWQ/7ilHZqNBSOIk9WC6mEq3sSvguX9ONUCQWhXTGN6hX8xK?=
 =?us-ascii?Q?CDbZOvujrEM/pLjM1HD2vTKLeQhCuWx3fmmgD2IHy5oHDDYLU1RBEWP8wE5u?=
 =?us-ascii?Q?eS2O9iytTZvrSXwwF/2p8YjzowKDSMmZ5Wez678a10nYrcy0sZrzpTKYpxLT?=
 =?us-ascii?Q?T26H99aWtxd3oj1g3u83ZVky8SRhULQeeqAOZH1mbJI1t3f4lYvbm2oTj7Q5?=
 =?us-ascii?Q?wVVRNGdi8OXFDtj4v+Xtkz0964v7Vs274vcjucui/8+kR8ghalWXt0dNYR3P?=
 =?us-ascii?Q?tVzX4LjQ6q4WPVDa98AwqdYTAGBmEHwoRkpPkUNFlKBHePxEbPQUzcF7bnm+?=
 =?us-ascii?Q?adzlczJqx2P2ZHq8rOCBAyF2I/3pwTtKzSVTBZA6ml8yLdsaCe4KeLhV+JKh?=
 =?us-ascii?Q?2HCz/pqfr/e0wfr2t+Php8tMu6H3qm1Z433Cjo3p01adMpsVWmuq4S8jTRFv?=
 =?us-ascii?Q?IqbtA1R0mifGpxZ8cSzG/ZpIz7k=3D?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 81918132-e9a8-4d09-6b95-08d9c5648e32
X-MS-Exchange-CrossTenant-AuthSource: AM9PR08MB6737.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Dec 2021 16:03:12.4750 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dMeIfQ5LO6CVnN43+BMq46IgJqjI7BOUjTYZb91Ac4EQofWglZgJ9boZZEyU3BPrjUVlFdvyZERwTPIlBEDcnOYSxl3iZVcJBcHMKSHdmRs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR08MB6148
Received-SPF: pass client-ip=40.107.7.109;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR04-HE1-obe.outbound.protection.outlook.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

To be reused soon.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 include/block/block_int.h |  1 +
 block.c                   | 13 +++++++++++++
 blockdev.c                | 14 --------------
 3 files changed, 14 insertions(+), 14 deletions(-)

diff --git a/include/block/block_int.h b/include/block/block_int.h
index f4c75e8ba9..79bdde8bf4 100644
--- a/include/block/block_int.h
+++ b/include/block/block_int.h
@@ -1433,6 +1433,7 @@ BdrvDirtyBitmap *block_dirty_bitmap_remove(const char *node, const char *name,
                                            BlockDriverState **bitmap_bs,
                                            Error **errp);
 
+BdrvChild *bdrv_find_child(BlockDriverState *parent_bs, const char *child_name);
 BdrvChild *bdrv_cow_child(BlockDriverState *bs);
 BdrvChild *bdrv_filter_child(BlockDriverState *bs);
 BdrvChild *bdrv_filter_or_cow_child(BlockDriverState *bs);
diff --git a/block.c b/block.c
index 0ac5b163d2..840d52e7c8 100644
--- a/block.c
+++ b/block.c
@@ -7727,6 +7727,19 @@ int bdrv_make_empty(BdrvChild *c, Error **errp)
     return 0;
 }
 
+BdrvChild *bdrv_find_child(BlockDriverState *parent_bs, const char *child_name)
+{
+    BdrvChild *child;
+
+    QLIST_FOREACH(child, &parent_bs->children, next) {
+        if (strcmp(child->name, child_name) == 0) {
+            return child;
+        }
+    }
+
+    return NULL;
+}
+
 /*
  * Return the child that @bs acts as an overlay for, and from which data may be
  * copied in COW or COR operations.  Usually this is the backing file.
diff --git a/blockdev.c b/blockdev.c
index 0eb2823b1b..ce23059d5e 100644
--- a/blockdev.c
+++ b/blockdev.c
@@ -3644,20 +3644,6 @@ out:
     aio_context_release(aio_context);
 }
 
-static BdrvChild *bdrv_find_child(BlockDriverState *parent_bs,
-                                  const char *child_name)
-{
-    BdrvChild *child;
-
-    QLIST_FOREACH(child, &parent_bs->children, next) {
-        if (strcmp(child->name, child_name) == 0) {
-            return child;
-        }
-    }
-
-    return NULL;
-}
-
 void qmp_x_blockdev_change(const char *parent, bool has_child,
                            const char *child, bool has_node,
                            const char *node, Error **errp)
-- 
2.31.1


