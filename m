Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E93AC4CC699
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Mar 2022 20:54:45 +0100 (CET)
Received: from localhost ([::1]:38318 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nPrXA-0006PH-Ui
	for lists+qemu-devel@lfdr.de; Thu, 03 Mar 2022 14:54:45 -0500
Received: from eggs.gnu.org ([209.51.188.92]:39002)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1nPrN6-00040P-Fk; Thu, 03 Mar 2022 14:44:22 -0500
Received: from [2a01:111:f400:7d00::710] (port=7585
 helo=EUR05-VI1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1nPrN1-0004Xj-5Y; Thu, 03 Mar 2022 14:44:20 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WNogrxWS0M2g0uLmbIQaFAXs63Fter1QPD0z8W2A1Joy9iXt0HYdnvaxfctwxDd9nF1i2CxYh43c89oTcLnG4/y88CyQHBlDzMnvVu4Iqs9ucU8vMahHFs5mI2E/d55D8QXl9ez+28TGMGrLz3s/pZX1E7R9tNlDXvnbO66lcG5S4C2yJh9y22YTqjdpXBE3eaUBHaSSFZFX/QBSZISf61RrtTUq5k0G68bAG4qCEFkf6xs2f21VJoHsfJ0JBPDikekOhfVVj6lIyyI2hnnFvghxQR1/YxjfIvwAomBlsJwuKcb0X2T4azQ7kO+3daNU0l1umd1tQrltmAnbad8sYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NmMZWPsXy6sCn/KTx0rcRRhgXC50lQ65Ci4s+q4S0Dk=;
 b=cCjdHYSNZGU7099yIA/6wIF5lGZYWKHCDw5mpRLdOzJPC88Oe750pQX22Il1mNJpnrQVQrRktGDvWjlkIFwpuVPBFNqrUdO8QLh8ytaDw1xXmrPg2+7ZlVtZamzCAzwx5PaLb2ZwKui6k/lvbkCXsJCur2JwhJH+rIPXOqvQ4/V2iBnmQ8znaqhVOG4mx9TYo/ybSccUvUQR3w7WwSfVmAhFntaT77dTpQyqbpQyDTft33ZWGL6uDZVetpGOfS6nFk7CGl69cgQnuRG2xPQFHfm6FNKPkeOkkpYP0dfQsiR95wP+5bAT4Zf3NLCtKPGSstZTFB1BH0yeo5KdAyD0QQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NmMZWPsXy6sCn/KTx0rcRRhgXC50lQ65Ci4s+q4S0Dk=;
 b=ZXCtrIM32sqEwTDXrkz2oMCKsO6DAo4CRCvNAcAm8mA1HUzqjZ6JEYBif9rN3vwESF9em3uCZ7t+VTzh9Cwpc80u7t8UIYD4rxlZp05qzpczljgz2y7ca8+IGYllgzpuHyTv2hwuFEy2bR24Tiu0etlHw4pfI92JWLMZ5Ax6cZ4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from AM9PR08MB6737.eurprd08.prod.outlook.com (2603:10a6:20b:304::18)
 by VE1PR08MB4736.eurprd08.prod.outlook.com (2603:10a6:802:a6::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5017.26; Thu, 3 Mar
 2022 19:44:07 +0000
Received: from AM9PR08MB6737.eurprd08.prod.outlook.com
 ([fe80::4545:8e0c:19c7:2a6d]) by AM9PR08MB6737.eurprd08.prod.outlook.com
 ([fe80::4545:8e0c:19c7:2a6d%5]) with mapi id 15.20.5038.014; Thu, 3 Mar 2022
 19:44:06 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, armbru@redhat.com, fam@euphon.net,
 stefanha@redhat.com, eblake@redhat.com, hreitz@redhat.com,
 kwolf@redhat.com, vsementsov@virtuozzo.com, jsnow@redhat.com
Subject: [PATCH v6 03/16] block/block-copy: block_copy_state_new(): add bitmap
 parameter
Date: Thu,  3 Mar 2022 20:43:36 +0100
Message-Id: <20220303194349.2304213-4-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20220303194349.2304213-1-vsementsov@virtuozzo.com>
References: <20220303194349.2304213-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: VE1PR03CA0038.eurprd03.prod.outlook.com
 (2603:10a6:803:118::27) To AM9PR08MB6737.eurprd08.prod.outlook.com
 (2603:10a6:20b:304::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5e784927-8c28-4b6d-1ef6-08d9fd4e2dc3
X-MS-TrafficTypeDiagnostic: VE1PR08MB4736:EE_
X-Microsoft-Antispam-PRVS: <VE1PR08MB4736F897E0DC1153FD7EED62C1049@VE1PR08MB4736.eurprd08.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 0z3OdpCiVODHMp+Pi8ghuFzap3nqexBjI6B/iGErSBE4pSVn0pjn+e8GjCLgc1NpXsLeUsylKORWyhfl+Kt1kk5HpMnD7fGi+lqt7WTYgmfEDLUxUd9bLN0mxzs5N/arY1aDkqHLFzZ7HC2djEhqzgGzaiiniCTEd+MsuFHcH5Cysrro7VZT4hTqwrVgwb5sHBwce5EsU0G6eDgrjmGDYjaLj62Q0oKFyIv82uzMDvLln6OFfWWA4LB/xYc5xnaepb6WPF/nVjYE+/oQcqMKtRj8/TF2nL9UKnJMTlk2YK8P7lj03oxnSome8qh402JxXjjxKubVr2Rt7ekfPLtOdq1fl4UPbkyvBjiUjkaT4VdDDzeg9RgPNaq/X1CKezBbSgCqeEXZLcAPusTTRQVX+02l89iFMCM5bbm0n8bG5rhMIsLgt6qkx9tvfrwXiibLZq95pCydxOtd5QUQ6+eNe7BriypCJH0az9fgifX1ASb9PLLFDkEE1dTkjAgxXzbuggh2vpax1ioEyRdCd7jJiJFv9ne/553w+K/sxDmx1pW6aCDSyPcBEGtTbRwkundvfD6x3xZY4OuhmFGtzm1Oxlw/TsTCPZAe2h2KCM5UtGRpAOmZ1h/IEXYj3Br19jDdDo6wMMsKQJQFkq0xUnodGAdLfLeARboSUu0g93sr6FL0HbrYKMtpHRta+UacS2KGdLGWPnf4PgQzAPkh5vZ4RQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM9PR08MB6737.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(6506007)(6512007)(26005)(6486002)(6666004)(186003)(1076003)(2616005)(316002)(6916009)(508600001)(36756003)(4326008)(8676002)(66476007)(83380400001)(66556008)(66946007)(86362001)(8936002)(5660300002)(52116002)(38100700002)(2906002)(38350700002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?CjU+mlrkQID4Z4WXDg9b9is7GBbSrioo+1f9VK9JMacf1QRW4E77YsbroYKp?=
 =?us-ascii?Q?rCsHPU6LUhK+CfSI40buj7VyfDCw00g0YhvZGMoLq5MzaQWj/5aSMnUKjZL6?=
 =?us-ascii?Q?fJNaTooMJqhdaTl/8wewMDOrKQ6tntJBrIbJhu9ni/wKyr72U1pACwv6UAil?=
 =?us-ascii?Q?FNi5DwwD2roeX6FYnFWEQ0Xk2qrZ/+zX7+EZwrMQZy3CKI5GtlXb46aZvh7L?=
 =?us-ascii?Q?YAhTdEBspB7dMPn3HGksHi+uDxtENI74ApMePKuDF5TEvI49zgesjIEEApoF?=
 =?us-ascii?Q?/5J992x8BhRhAHLmNvRf5OCMOLHuVQ3BDbOTi7NqROUKDBfSFX7HAakjd/Ay?=
 =?us-ascii?Q?3Du4j0NRaOqa2XJMG8aiyKcLbcqDH1bVpDkEz8H+j2IwYzcB4wl2aWcBGIR0?=
 =?us-ascii?Q?4fPDAaK3XOLQNkIINmvJ/zCanJ0CQQiTnlkGwsHfdhuF3zi8Bp0t4U3nJ3Lj?=
 =?us-ascii?Q?9Ql7Sc+kyZMmvAP9XXwTaPTbtxMbBm4RdWteyBugEwlEG8STgiQr5aVPeO8p?=
 =?us-ascii?Q?Qe1pb/es9+uQj02o6J9NpQr4+9qV+qVkLxd10hW06HQ7k98HDwvzDdOW+QtJ?=
 =?us-ascii?Q?FolbD3ZdBa/41ilBW6H3fZGRjJehYCtGNFPAbOq74VoQBSrpwhXe+8bWPkCH?=
 =?us-ascii?Q?eybn6bpeLpYp0YdrNECQyaNkRYpoH0JuO2HBouEIazMyecbPGJYPLdR21MJb?=
 =?us-ascii?Q?KzKEZWM4TIgS9Y7mKziJhzK9tTB/hCBr6/zCRGZHIRnCR02dav+uXBnZDua1?=
 =?us-ascii?Q?ZcNl386S5c03esVLW/0t+Zh/b3qn0HKI3eel5zWcakirQbM2KQnBPrt8NGli?=
 =?us-ascii?Q?/K8LlFmV/mxgTgkLqaajIq3h9lMkNDOw1I3iCVpS0D/3zkn9IBXVxlHdWvBM?=
 =?us-ascii?Q?6wQ7+19d1LhI02JGlPnDw8FZ6SH31cyjisYaq6kou7nAaWPPYTU3WG530bZ6?=
 =?us-ascii?Q?OKeBy2fY1ULvdOW8Ud0srdv39fKF4H4UczR/ThpnPaQKss9DuioQWPRbxF2Q?=
 =?us-ascii?Q?eQdYiO3D75buNYCOQpRxELyT9Y78p6/qvZQFa+H8iTOAN8bZbBHEJ+ec9rcZ?=
 =?us-ascii?Q?t55Xev3RZT9EO+rbtkYUY2uc2Z9gFkaFfaVuX+Z1aRmlvT1WxIKrHTYeG1Nx?=
 =?us-ascii?Q?C0l33dmk5cmOS27ITT2zrcaJ8lvlWOT1RQcIfd1Pi0U4GAJBbONZnEvQyB6h?=
 =?us-ascii?Q?DNOf4CkhQBeCe7WuAXrU9L6VPQFfSa4Ndzv10fXjne6tZvkpXnAyeJxaLIG4?=
 =?us-ascii?Q?N5ya+6F8iAMjWF/nPCpaYBg/PSDBOyi4ZCghOYHYKoTvEidh4hHj+AusilOf?=
 =?us-ascii?Q?IbkNVQqcmVaIV/Ncr5YdchnKXqDXfFAcNWiu+K8NR2cmsyq7RGsu+9ksdw3U?=
 =?us-ascii?Q?689GLxtIR+70wNTSD7Kz3yBuhUSN6ZsCcRjLPtTbznq08ETRNqrqAm3QjoAd?=
 =?us-ascii?Q?vBOECF4e9XZXEwR400tARkWXfLq49vQPPHJaq0mgTBxQSX6gHkB1bqT42pSk?=
 =?us-ascii?Q?O6RgViIUxeJ1mDCAro4iW60sfyqKX/Afp8V5Zi6oiXqZLZQLGbH5h5FWFky8?=
 =?us-ascii?Q?XRnUcG6uTopkNpmtpl9VKMNbhnmmgTTqCX0KaGrHfannFEXG0Pu8v9+Ss4/F?=
 =?us-ascii?Q?S/C7LwMJTlX0SZOHiPAU1CleJs8FqmBNKVFWjW7Wi1XVHOiSPbxTMKdGDexp?=
 =?us-ascii?Q?t16wfg=3D=3D?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5e784927-8c28-4b6d-1ef6-08d9fd4e2dc3
X-MS-Exchange-CrossTenant-AuthSource: AM9PR08MB6737.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Mar 2022 19:44:06.8080 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tnwqFoGd6/unmX8LUB9DsSx0n94ELLTCJ+TLyBjX717mS/TQlU0bsuSE56ovBZRYJl1PMPfu3SaMf+0pOuFWWuFlgoCmcuGGerS1pjCQWOQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR08MB4736
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a01:111:f400:7d00::710
 (failed)
Received-SPF: pass client-ip=2a01:111:f400:7d00::710;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR05-VI1-obe.outbound.protection.outlook.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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

This will be used in the following commit to bring "incremental" mode
to copy-before-write filter.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Reviewed-by: Hanna Reitz <hreitz@redhat.com>
---
 include/block/block-copy.h |  1 +
 block/block-copy.c         | 14 +++++++++++++-
 block/copy-before-write.c  |  2 +-
 3 files changed, 15 insertions(+), 2 deletions(-)

diff --git a/include/block/block-copy.h b/include/block/block-copy.h
index 99370fa38b..b80ad02299 100644
--- a/include/block/block-copy.h
+++ b/include/block/block-copy.h
@@ -25,6 +25,7 @@ typedef struct BlockCopyState BlockCopyState;
 typedef struct BlockCopyCallState BlockCopyCallState;
 
 BlockCopyState *block_copy_state_new(BdrvChild *source, BdrvChild *target,
+                                     const BdrvDirtyBitmap *bitmap,
                                      Error **errp);
 
 /* Function should be called prior any actual copy request */
diff --git a/block/block-copy.c b/block/block-copy.c
index abda7a80bd..8aa6ee6a5c 100644
--- a/block/block-copy.c
+++ b/block/block-copy.c
@@ -384,8 +384,10 @@ static int64_t block_copy_calculate_cluster_size(BlockDriverState *target,
 }
 
 BlockCopyState *block_copy_state_new(BdrvChild *source, BdrvChild *target,
+                                     const BdrvDirtyBitmap *bitmap,
                                      Error **errp)
 {
+    ERRP_GUARD();
     BlockCopyState *s;
     int64_t cluster_size;
     BdrvDirtyBitmap *copy_bitmap;
@@ -402,7 +404,17 @@ BlockCopyState *block_copy_state_new(BdrvChild *source, BdrvChild *target,
         return NULL;
     }
     bdrv_disable_dirty_bitmap(copy_bitmap);
-    bdrv_set_dirty_bitmap(copy_bitmap, 0, bdrv_dirty_bitmap_size(copy_bitmap));
+    if (bitmap) {
+        if (!bdrv_merge_dirty_bitmap(copy_bitmap, bitmap, NULL, errp)) {
+            error_prepend(errp, "Failed to merge bitmap '%s' to internal "
+                          "copy-bitmap: ", bdrv_dirty_bitmap_name(bitmap));
+            bdrv_release_dirty_bitmap(copy_bitmap);
+            return NULL;
+        }
+    } else {
+        bdrv_set_dirty_bitmap(copy_bitmap, 0,
+                              bdrv_dirty_bitmap_size(copy_bitmap));
+    }
 
     /*
      * If source is in backing chain of target assume that target is going to be
diff --git a/block/copy-before-write.c b/block/copy-before-write.c
index 5bdaf0a9d9..799223e3fb 100644
--- a/block/copy-before-write.c
+++ b/block/copy-before-write.c
@@ -170,7 +170,7 @@ static int cbw_open(BlockDriverState *bs, QDict *options, int flags,
             ((BDRV_REQ_FUA | BDRV_REQ_MAY_UNMAP | BDRV_REQ_NO_FALLBACK) &
              bs->file->bs->supported_zero_flags);
 
-    s->bcs = block_copy_state_new(bs->file, s->target, errp);
+    s->bcs = block_copy_state_new(bs->file, s->target, NULL, errp);
     if (!s->bcs) {
         error_prepend(errp, "Cannot create block-copy-state: ");
         return -EINVAL;
-- 
2.31.1


