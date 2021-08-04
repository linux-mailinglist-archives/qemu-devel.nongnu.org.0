Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E3A23DFE37
	for <lists+qemu-devel@lfdr.de>; Wed,  4 Aug 2021 11:41:28 +0200 (CEST)
Received: from localhost ([::1]:39660 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mBDOx-0007kC-C9
	for lists+qemu-devel@lfdr.de; Wed, 04 Aug 2021 05:41:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47258)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mBDMV-0004en-DA; Wed, 04 Aug 2021 05:38:55 -0400
Received: from mail-eopbgr60121.outbound.protection.outlook.com
 ([40.107.6.121]:35908 helo=EUR04-DB3-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mBDMT-00062H-1x; Wed, 04 Aug 2021 05:38:55 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KLnv50CfrtjRD7gfB5cgjj92tk9I5LoQB+m83SSYE2We8A29jm48X5OkpyOhckZ2sp8v2Ru9UM93mN0amuGIuNJW6SoTWWNWc5szljQe1AHh0Qhcb4EuXk3XDsNE/876ybQMsaVngmMPL2xMYhSE44XSSyIswzXTNgTNzGtS6Jx0XHjd3332T5Yp+t/AJLL4wsS4ILZO0y0BXXgYryqgc8p4ChGC6T2ghR1MIXK2lF8NOnylapVT7knYeiFtf6HzJB1eBqrjzTH8yvxbqWa1mjqtjr4f1abhsLvUKlV0BNqUnHriuxa1bX3wwI1xA03hbZDvleg6frItWMHSjIF92w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=azU1N5pNsUUPSeVYu2MpKLtee8nLfliUIdvgSKe/Xuk=;
 b=JDf2HuwotSO8VX05QzHg6NBtoU4F8RKWpFog3hwzBPvqovPgyYfZfXcdWGTKFzoRXIrooMouKf2GLgej5ypPXsGpSWtI9KTiDzw17T+r5I2O1Au1x+qJSkEUeoNPOUW/leU/ANS0Vs/tsD3pJAwyP15Yg36l5jvr0TTz0f/3txsZdCmR1sI3w9e8NdjXYKSGXkXcAybT+zOG36u/dsce9S1mAprN+xhThGFGIceoOstN3QnrByKSShkIJcZYNk62Au8Ibkc9rDkdU2hJuGPRFjW/9xoFkQ4oMnKSIxv5jtpfJz94jTwC0aE8wFwfn4eS0XwOR5IsmGds+JKFVMukoA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=azU1N5pNsUUPSeVYu2MpKLtee8nLfliUIdvgSKe/Xuk=;
 b=jgEhsW3aQP+NceUvADB9G015rVEzxDk1UmF4E+XoZ4UXvBz0BPaZg98cS3PMTdPrMjXSIwF3kwqCgwYMTztzvQVZxTP5wJaq1SWfIl6M3Jb42/7XSCWyNzlWnjMMGYQp6ox+YCt0Rrsf31XR9kD2BPlEmsHP5uKG1ExlN4BoozE=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB5032.eurprd08.prod.outlook.com (2603:10a6:20b:ea::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4394.15; Wed, 4 Aug
 2021 09:38:45 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::44b9:68ac:bdc7:e23c]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::44b9:68ac:bdc7:e23c%8]) with mapi id 15.20.4373.026; Wed, 4 Aug 2021
 09:38:45 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, armbru@redhat.com, eblake@redhat.com,
 crosa@redhat.com, ehabkost@redhat.com, berrange@redhat.com,
 pbonzini@redhat.com, vsementsov@virtuozzo.com, jsnow@redhat.com,
 mreitz@redhat.com, kwolf@redhat.com
Subject: [PATCH v7 07/33] block/block-copy: introduce
 block_copy_set_copy_opts()
Date: Wed,  4 Aug 2021 12:37:47 +0300
Message-Id: <20210804093813.20688-8-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210804093813.20688-1-vsementsov@virtuozzo.com>
References: <20210804093813.20688-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: HE1P191CA0011.EURP191.PROD.OUTLOOK.COM (2603:10a6:3:cf::21)
 To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (185.215.60.211) by
 HE1P191CA0011.EURP191.PROD.OUTLOOK.COM (2603:10a6:3:cf::21) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4394.15 via Frontend Transport; Wed, 4 Aug 2021 09:38:44 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 05a1fe83-12a3-48c1-2209-08d9572ba754
X-MS-TrafficTypeDiagnostic: AM6PR08MB5032:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR08MB5032DFBC4B7A96C85F849737C1F19@AM6PR08MB5032.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: JCusQCWVl8BrFHnxHOBDV1PCP9WHHqd2xjGNmGBjWEg5ozIE5ydiiUQK7sWUslP+kVW+lBZxMg2N370CmQlL4Q74/RtBR5sPJMCnl1AJhNmvqN666U5rsx+KgZlFeePgrB9bsvV4urNrF/dSbtntzDiJ8Ks06Pcg+KWeh6OGise2SYz1Sl0tukXU3GkZgy88Ojw8Ec7RWHwFZE1H01g/96PUdf3ofPBG5pwt/3LIiSFOCBVR9eoRayg73c83csvqkiPq7j+KAO7A99K3WOh+boA7QW3v0zXOAvOsr5IiIUvs6rQkEpmp1xATZLBFkHNk4JJhBuPaP8vEqaDjkFu4npkfi55PKPNAkvz5GwurMAIzBnTcXaiv+FRkEqJRzpL+MS38XVHObzCt6cQUpMDEi5Q6DTAQw0/+RCUP5wH1xHPn1qoDomxvwe/sErEipC/hTlj7usxFaTyCGXY4eV+kedLNBLFyvjCvUW9Mw50piYdY8GSsXhNgp8Sb88+vCa41pOEJMrcn8ycXNPO2fkD+G1W+gYA3+IpD2ecJ84vIn2QCWXC16QtNGaKYxr0xTfKIc/hFAMWsMZxE5qCtC32V5zdZb/FUCPvMUyG1Gv2EW4J8BG0LMRP+0wfD1F/5MbW8JTua5EOsua7GtuDsNSpbcIppcBFrL4kTt9ZihmRwlJwY8MU2o6HSTqcLvPiBjwRtZ0LkFExfC/V8YnsLvmMXGw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(366004)(136003)(39840400004)(376002)(346002)(1076003)(186003)(26005)(7416002)(2906002)(6506007)(6512007)(52116002)(66946007)(66476007)(478600001)(66556008)(86362001)(956004)(83380400001)(36756003)(8936002)(38100700002)(6486002)(6916009)(316002)(4326008)(8676002)(38350700002)(5660300002)(2616005);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?2mWU7o4R0QAV9kbjrXql7Hgc0gz/ZmmyURbc2Q2mNE47atRQfc+PaV8qxoft?=
 =?us-ascii?Q?1PrzIzNCETFq1YhEhg4X0iAEHY8imG2VjZblvFqlQcRrNT8BSYEhU3ReVs2F?=
 =?us-ascii?Q?GK5Y1CfEadBGF3+r/SOCj4V9ITfQRazgZMQvrbhOktM2pZMNalvbNFSCe1wC?=
 =?us-ascii?Q?H8Qz1+XS0LgwVOI1+WDSKLNTFHr3uqLSC1drKK00n11YHqVwIfcr1/wkqMGB?=
 =?us-ascii?Q?YpjJZghgRFO34uzBxDIyUE9ovWB0+WagmEu45jZTgcutRkldNQXyvv6uTYqE?=
 =?us-ascii?Q?lqlyVMyjB1ufArovi9BLbM0yufY5kcGs+zTP0KUyIogECe5fAnuh2IQRX8TM?=
 =?us-ascii?Q?fZucOQAE9l5QBNFJQj4KSOS1tScDbZtxWoQTHDFXw/xPQ2L6LRpLaKohKx1+?=
 =?us-ascii?Q?EfM7h4iMdpyNCW0of3F/qOQEonc4JE4ysQfUhkcmcws2LPO0eYPOpsuVJJ1F?=
 =?us-ascii?Q?3/aLv6M2MJLpH06Ela9D4AoXvOzoN3MIoEY0zfGU4y69WjmzFg0ETCVxGyLK?=
 =?us-ascii?Q?hwKbe5K1Y8RFEHAtUcumHq9ItMBnDS963OxrtB520PRhnpd2Pl9TgAxQX95z?=
 =?us-ascii?Q?0B76kv967RVwU+nIyVv5ZVOupFEyyHkcisVopG5THNQRD3uDOK5GRkIBHBtv?=
 =?us-ascii?Q?bkhla4z0Kepo1pqqkFVzje9YKpxiGvJtl6GJIwIAC00xomgSyezMPeCS83KV?=
 =?us-ascii?Q?DjOtmt4ZYI4gygWXv94cC63SCE7DDzaro6ax986qAIB7Um6REGAIXlsTF3Rq?=
 =?us-ascii?Q?VZI6tMoDz4mg993gv6OXiYgg7VgKZUk018H6JqCvK5ztNUjwKfb0yfJTlGrA?=
 =?us-ascii?Q?iQgzVIRx6iUPCxvTF8NWugChBr5fow7s6WMsArAtxeHor1pjmhBR7abGh9q2?=
 =?us-ascii?Q?ZcVcWX3hKe8z5XPVm7aTHKcoZ+06m8hCgrmvsIYz+Jy1qxeaIQ7cRVCYhegR?=
 =?us-ascii?Q?DRH9T7P9LqGqLPmA273X42h9cYwHxeLKG6zpVkgwo0AENJF40sFwsWxPavEo?=
 =?us-ascii?Q?Hp5W9nARTjKessT7MTLqsh/CWFik5zGejbiMcsC3HFzfOUuZMUh77f96KI9A?=
 =?us-ascii?Q?mYA93Dab0rscyYZLdXC/y3Zuxfj0THYtGUdqBuHMRRz51AE7tB1nRDmQ9VIH?=
 =?us-ascii?Q?quI2ocqC33C/O5bMwgmnPgivz9RAWzTs8Cz86pu9Ds/SRSaMpLHX6dLIFeFj?=
 =?us-ascii?Q?TXb26zT6VBlMWSJJStL9Quk2FVoQrnrpAB98Qdd4AEsECr04nuhfCLuxQNmZ?=
 =?us-ascii?Q?GtDY0XuRLbqvoUSbN1brrJaS8oRYi8bT2b9C89KnRpdHnRL62qteKG1L+cs6?=
 =?us-ascii?Q?q3LdtvkYow1sDJdltsmoDdn/?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 05a1fe83-12a3-48c1-2209-08d9572ba754
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Aug 2021 09:38:45.4345 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: G8RiRPkWcQgmAFsyRPiy7IpKcwAivkPPotR2BVs7hen1Jw3eS+C6NL4zBpcv0TQpn5mhAcT7Ewb4uCgyWc87p8/i5ZZgTWsB7M+U1BJ5BzE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB5032
Received-SPF: pass client-ip=40.107.6.121;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR04-DB3-obe.outbound.protection.outlook.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
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

We'll need a possibility to set compress and use_copy_range options
after initialization of the state. So make corresponding part of
block_copy_state_new() separate and public.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 include/block/block-copy.h |  2 ++
 block/block-copy.c         | 66 +++++++++++++++++++++-----------------
 2 files changed, 39 insertions(+), 29 deletions(-)

diff --git a/include/block/block-copy.h b/include/block/block-copy.h
index 734389d32a..f0ba7bc828 100644
--- a/include/block/block-copy.h
+++ b/include/block/block-copy.h
@@ -28,6 +28,8 @@ BlockCopyState *block_copy_state_new(BdrvChild *source, BdrvChild *target,
                                      int64_t cluster_size, bool use_copy_range,
                                      bool compress, Error **errp);
 
+void block_copy_set_copy_opts(BlockCopyState *s, bool use_copy_range,
+                              bool compress);
 void block_copy_set_progress_meter(BlockCopyState *s, ProgressMeter *pm);
 
 void block_copy_state_free(BlockCopyState *s);
diff --git a/block/block-copy.c b/block/block-copy.c
index 58b4345a5a..84c29fb233 100644
--- a/block/block-copy.c
+++ b/block/block-copy.c
@@ -315,21 +315,11 @@ static uint32_t block_copy_max_transfer(BdrvChild *source, BdrvChild *target)
                                      target->bs->bl.max_transfer));
 }
 
-BlockCopyState *block_copy_state_new(BdrvChild *source, BdrvChild *target,
-                                     int64_t cluster_size, bool use_copy_range,
-                                     bool compress, Error **errp)
+/* Function should be called prior any actual copy request */
+void block_copy_set_copy_opts(BlockCopyState *s, bool use_copy_range,
+                              bool compress)
 {
-    BlockCopyState *s;
-    BdrvDirtyBitmap *copy_bitmap;
     bool is_fleecing;
-
-    copy_bitmap = bdrv_create_dirty_bitmap(source->bs, cluster_size, NULL,
-                                           errp);
-    if (!copy_bitmap) {
-        return NULL;
-    }
-    bdrv_disable_dirty_bitmap(copy_bitmap);
-
     /*
      * If source is in backing chain of target assume that target is going to be
      * used for "image fleecing", i.e. it should represent a kind of snapshot of
@@ -344,24 +334,12 @@ BlockCopyState *block_copy_state_new(BdrvChild *source, BdrvChild *target,
      * For more information see commit f8d59dfb40bb and test
      * tests/qemu-iotests/222
      */
-    is_fleecing = bdrv_chain_contains(target->bs, source->bs);
+    is_fleecing = bdrv_chain_contains(s->target->bs, s->source->bs);
 
-    s = g_new(BlockCopyState, 1);
-    *s = (BlockCopyState) {
-        .source = source,
-        .target = target,
-        .copy_bitmap = copy_bitmap,
-        .cluster_size = cluster_size,
-        .len = bdrv_dirty_bitmap_size(copy_bitmap),
-        .write_flags = (is_fleecing ? BDRV_REQ_SERIALISING : 0) |
-            (compress ? BDRV_REQ_WRITE_COMPRESSED : 0),
-        .mem = shres_create(BLOCK_COPY_MAX_MEM),
-        .max_transfer = QEMU_ALIGN_DOWN(
-                                    block_copy_max_transfer(source, target),
-                                    cluster_size),
-    };
+    s->write_flags = (is_fleecing ? BDRV_REQ_SERIALISING : 0) |
+        (compress ? BDRV_REQ_WRITE_COMPRESSED : 0);
 
-    if (s->max_transfer < cluster_size) {
+    if (s->max_transfer < s->cluster_size) {
         /*
          * copy_range does not respect max_transfer. We don't want to bother
          * with requests smaller than block-copy cluster size, so fallback to
@@ -379,6 +357,36 @@ BlockCopyState *block_copy_state_new(BdrvChild *source, BdrvChild *target,
          */
         s->method = use_copy_range ? COPY_RANGE_SMALL : COPY_READ_WRITE;
     }
+}
+
+BlockCopyState *block_copy_state_new(BdrvChild *source, BdrvChild *target,
+                                     int64_t cluster_size, bool use_copy_range,
+                                     bool compress, Error **errp)
+{
+    BlockCopyState *s;
+    BdrvDirtyBitmap *copy_bitmap;
+
+    copy_bitmap = bdrv_create_dirty_bitmap(source->bs, cluster_size, NULL,
+                                           errp);
+    if (!copy_bitmap) {
+        return NULL;
+    }
+    bdrv_disable_dirty_bitmap(copy_bitmap);
+
+    s = g_new(BlockCopyState, 1);
+    *s = (BlockCopyState) {
+        .source = source,
+        .target = target,
+        .copy_bitmap = copy_bitmap,
+        .cluster_size = cluster_size,
+        .len = bdrv_dirty_bitmap_size(copy_bitmap),
+        .mem = shres_create(BLOCK_COPY_MAX_MEM),
+        .max_transfer = QEMU_ALIGN_DOWN(
+                                    block_copy_max_transfer(source, target),
+                                    cluster_size),
+    };
+
+    block_copy_set_copy_opts(s, use_copy_range, compress);
 
     ratelimit_init(&s->rate_limit);
     qemu_co_mutex_init(&s->lock);
-- 
2.29.2


