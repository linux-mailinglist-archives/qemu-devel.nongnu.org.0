Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F2C0398A68
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Jun 2021 15:27:39 +0200 (CEST)
Received: from localhost ([::1]:34406 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1loQuI-0000b4-DO
	for lists+qemu-devel@lfdr.de; Wed, 02 Jun 2021 09:27:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34070)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1loQfR-0001AC-QX; Wed, 02 Jun 2021 09:12:17 -0400
Received: from mail-am6eur05on2138.outbound.protection.outlook.com
 ([40.107.22.138]:12054 helo=EUR05-AM6-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1loQfO-0003Pp-It; Wed, 02 Jun 2021 09:12:17 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=T0c1LwCe65z10D+rBD8UxOBXsK8OKefg+3uSEMgbLpK1eBV5bXeGojnozqs3f6sk6orUCDGfnpsZ6X84rKgl9XLEQA4lLlymuYJ7afYkSBz4r3Av4RjOqLwGR8nrQJOpd3YSebtYJgZ8jzqL6QDxPgKX51IIAy25+Bs+KNOpasJu3wFHnQ8V4EjS/s6eF1NnOTFLb09OZxXlUybmRM6qm+qOwMSeLe3YRqbAqxEfVgSpSJActxj4Lmm1txZt+VGldsXFRpvqQ3Ie5X7/6BhQmu/9oXc4on+/KnEORjwgPyiClp+LFSK91Ea4f6TUUa9wv7bv1mjIZq9BFoub36G7FQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zzEbTus52yZW9/K2jWF0Zh8FB09qCBl7UQJ9/5sI064=;
 b=mM/YhOrM8unhSyIjS2U4l5weWcuXpOHfKmLNvE5WNinyFlqsSNylylplxwPnCh0XvXsBtP2e4hXSk7v8r6gmAVvKhVlNj11p2tldnjAVbZ02Mg7clGmoPG8PLwvRsTY0SOPrD34xPWBguV8c+23w3rRAwFrZm8iqSnOBq6TUM/n7t3zlYti7U/535dii/Z5pycntUhB9/eLW8JKxSj6P2IkFGAL+QOGREkgslttji2gaddinPDKGOfuOuByZmcmQptnPqlXuc3/NoDW8PuUB8+WuEY2YJ+N8j9wy7WH9CHKx5kFRbIVkBxy1D7MyVTauFrBh/8c08J24qgc/Ul+Izw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zzEbTus52yZW9/K2jWF0Zh8FB09qCBl7UQJ9/5sI064=;
 b=KigoSGugY+8b23x5d1jBlO9pcT43/ctKbxmHV5LMNAK5uTJGBa48kIdzUl1ikjsaurtZmV/OpQnEvE0cCssLBL5qGohXh41t6UTcCNXXQJjAqIPMA0z+DWL6EKnqhl+DmOcv1RLJXjcxISH5p9Y/yr5Rgp8dj1+1Qug8jUGAduE=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AS8PR08MB6693.eurprd08.prod.outlook.com (2603:10a6:20b:39c::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4173.24; Wed, 2 Jun
 2021 13:11:52 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f928:f4f2:77c0:74b4]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f928:f4f2:77c0:74b4%7]) with mapi id 15.20.4173.030; Wed, 2 Jun 2021
 13:11:52 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, eblake@redhat.com, armbru@redhat.com,
 crosa@redhat.com, ehabkost@redhat.com, berrange@redhat.com,
 pbonzini@redhat.com, vsementsov@virtuozzo.com, jsnow@redhat.com,
 mreitz@redhat.com, kwolf@redhat.com
Subject: [PATCH v4 19/35] block/copy-before-write: bdrv_cbw_append(): drop
 unused compress arg
Date: Wed,  2 Jun 2021 16:10:52 +0300
Message-Id: <20210602131108.74979-20-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210602131108.74979-1-vsementsov@virtuozzo.com>
References: <20210602131108.74979-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [185.215.60.211]
X-ClientProxiedBy: HE1PR0501CA0011.eurprd05.prod.outlook.com
 (2603:10a6:3:1a::21) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (185.215.60.211) by
 HE1PR0501CA0011.eurprd05.prod.outlook.com (2603:10a6:3:1a::21) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4195.15 via Frontend Transport; Wed, 2 Jun 2021 13:11:51 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9d634048-ba33-47d7-8243-08d925c7fd1e
X-MS-TrafficTypeDiagnostic: AS8PR08MB6693:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AS8PR08MB6693AED9102659A886E6D98BC13D9@AS8PR08MB6693.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:60;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: rn3mFZ89f4fUBsIUcmUksmXCmnkLSLGxFsFI6tahA1HSc6KlwtJ3ydL452t4BYZeEldZZWiQ0jiDAoEmmHg/m/RgaqD/UiqFVVhBi9LpSTQ3E3Y/5B4ElQf1g3NSRSkwhdpV2TekLYsMFc4n6kcQQTkffhIyncsMmIA1R9T+l5IhAZDswz8OHC5FAsWGX/Bv0PEIMrGdSX8cajl30mMuXvIN2bCbf4xvmjDUbruGIc7dNZDWNQYRL4GOO6dGk5pXZEQpZd3yP+TTPHKHw34lASOtEzUdvLRF330kKyQvi7bP0/xqbYVLz58fM/ZnNJQ9sUT5Emk1ifzj5J8e22CqY6vxQhy+LJaXRjRNCMxVZOty77QOaqBsvkLnDHBzKK5pR5/8kkrgOuEYYDEeZBIUYPt+QKhTwfcnTNifFweUFR5/fiklTludX2PznKA0XKtBemjzlSBKbfhv9RZLlI3AjPd1sRveGXoRPVxjSYmU3emqPi3iruX7SBHH2fR2WWR8yuh6tsh9YyjNrqZ4igLjfyzZexSnHgDC4FrQ73xNukvutGVQP6ZCvy+islPNhW2FfourNp02FMP3TmUO4USc7n/1T0j+pwZV6+yAwe78oo6a6bL7/bHw/ViAZg82hzbKOueRcfG5hfWca/NS1IVby1dpTvp8MSWZkZwWDm4BpEtGOezy5FJqhGkQzVmetftM
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(136003)(366004)(346002)(376002)(39840400004)(8936002)(5660300002)(83380400001)(38350700002)(38100700002)(36756003)(1076003)(6486002)(7416002)(4326008)(6512007)(16526019)(186003)(2616005)(956004)(316002)(6916009)(6506007)(66556008)(478600001)(66946007)(66476007)(2906002)(86362001)(52116002)(8676002)(26005)(69590400013);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?z4y6ChIjLTWd3WaBZEIXtw2IqDjfnglRywdNu9rB3KCaxbRYVik7kutZ86UA?=
 =?us-ascii?Q?7zKKem5taJ8biGJ/V1Es8LptzAID0tY+WAI5ueLmgg6mRY8otWX0TnnrvD4K?=
 =?us-ascii?Q?v4gO2v/L3EpEoCYiV2sQh5TknTUdxyoyzARPcnxzyMnzG/Vun3haW7xlDOeq?=
 =?us-ascii?Q?OHjouE7FGZ/ZR8HEYdf85l0IQbWYvtkGahDUl5yaAHZBZt+YevUZDtvKkRc9?=
 =?us-ascii?Q?G18YTArVG6FpKeL5c0+sZizJaLotnMWPcD4aXMEh5/9KZcCbV5aG/8iwOusE?=
 =?us-ascii?Q?g+pNnsWCrbBOOzAHM5WnIN2ikZgXv8/RF/yEa1nJPYfy7CyK3c08obQAOSf+?=
 =?us-ascii?Q?eHZZlbUKl3f6/Ylnq0j3YwiVK5rFW3PTIN470/qhBcNbl3Q6JRGI1fJIc4on?=
 =?us-ascii?Q?EUJ9b/FVTZM7COe/PBt61fCRl7/La8AZ1SRyODAqguAuC77ZohzUPzv4FuRQ?=
 =?us-ascii?Q?VXvMBJ4Ws0kmk3eEaItedXgP2/MwcSh+wywurDI3kmTM6w4xwnvn9EJp3GrP?=
 =?us-ascii?Q?Y/kAtUaZHSjp3JWzXdyjQt6cqU7hdJ9qNEjzl2Dm6gqhUL4c0aQ+g5lE96X4?=
 =?us-ascii?Q?Ig9dLot06Mg0E7slhTvb3tFeNgmGXTohGSRHqYtd8kFTYuG+zil8swoni6qA?=
 =?us-ascii?Q?k0wSmPQgz1DYXacy1Qb+bH/+Rp9qLKpGanO225PKrTZCd5HF/V1JXQYWm2GI?=
 =?us-ascii?Q?EL06Qys0iUO8cdbv2wOaXzznRJRMCmb0tvaCTVLm5GaVfGHQW6nQQEJuXeto?=
 =?us-ascii?Q?cy1vMXLRQmDVDUbwx4aZxWHimQZ1dJ2TA8sBvI6Kxv0nqp3Vyh30la5ih9VZ?=
 =?us-ascii?Q?T5joC+AnqmJ1df85B3Mpaw6kRXmsk76SfbrKWGIofTqRh5bqZICZ+pSgazdm?=
 =?us-ascii?Q?KOFZaZQyw/fsmQPE6QwsbmeY4stAPEl07KQgD4yqE2K1PoGiSsV9I0Uy5c4q?=
 =?us-ascii?Q?Dhw2U5kbA5qgNdtoVUbfzsohbpvx5HyLuuDRIBnuBrAWCQESNIS1MyQIrh2S?=
 =?us-ascii?Q?aAwuZoMVGY8y+GGfUDA+2tBGuQnjE8aOCOO0TFhddE0lwu3CHrY+YppCaWKb?=
 =?us-ascii?Q?/QierjMS6w7ihMN4t285KiRlW+OyJqj6CxAqdIYZALR0sxlXCxXGFIS/SJEp?=
 =?us-ascii?Q?23233hq08s3VQxnfDF16tDyrlTNQCrwjeD039bqMdNtL2Cdo70axz7jsXW4z?=
 =?us-ascii?Q?l6y+BidVFsOyudGRF8F3QI/WG8LfMsl23KXx3mC8Wnp+oaPesUYoqqhhu+kz?=
 =?us-ascii?Q?Q+wt47zNY5wEAGx7mkCJ694ZYT7FTKWXJU1FAoB8KcrnyPew02LHKvntIr+e?=
 =?us-ascii?Q?eajnADJ/ZJL0cqPKw3dwG+X2?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9d634048-ba33-47d7-8243-08d925c7fd1e
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jun 2021 13:11:52.6165 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AI6w4ga7Zuw2Rqyqi/esTP5Wb7cB2mh/bfuvRyt5WZ7Re+XRTCm+v9P2JXWxjxk052xZ3upmSU3QWpEmSSvPUIamTmW1+egggzvMFz7uG/E=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6693
Received-SPF: pass client-ip=40.107.22.138;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR05-AM6-obe.outbound.protection.outlook.com
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

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 block/copy-before-write.h | 1 -
 block/backup.c            | 2 +-
 block/copy-before-write.c | 7 +++----
 3 files changed, 4 insertions(+), 6 deletions(-)

diff --git a/block/copy-before-write.h b/block/copy-before-write.h
index b386fd8f01..51847e711a 100644
--- a/block/copy-before-write.h
+++ b/block/copy-before-write.h
@@ -32,7 +32,6 @@
 BlockDriverState *bdrv_cbw_append(BlockDriverState *source,
                                   BlockDriverState *target,
                                   const char *filter_node_name,
-                                  bool compress,
                                   BlockCopyState **bcs,
                                   Error **errp);
 void bdrv_cbw_drop(BlockDriverState *bs);
diff --git a/block/backup.c b/block/backup.c
index 83516297cb..4869f1e5da 100644
--- a/block/backup.c
+++ b/block/backup.c
@@ -452,7 +452,7 @@ BlockJob *backup_job_create(const char *job_id, BlockDriverState *bs,
         goto error;
     }
 
-    cbw = bdrv_cbw_append(bs, target, filter_node_name, false, &bcs, errp);
+    cbw = bdrv_cbw_append(bs, target, filter_node_name, &bcs, errp);
     if (!cbw) {
         goto error;
     }
diff --git a/block/copy-before-write.c b/block/copy-before-write.c
index 4858dcf8ff..1e7180760a 100644
--- a/block/copy-before-write.c
+++ b/block/copy-before-write.c
@@ -145,7 +145,7 @@ static void cbw_child_perm(BlockDriverState *bs, BdrvChild *c,
 }
 
 static int cbw_init(BlockDriverState *bs, BlockDriverState *source,
-                    BlockDriverState *target, bool compress, Error **errp)
+                    BlockDriverState *target, Error **errp)
 {
     BDRVCopyBeforeWriteState *s = bs->opaque;
 
@@ -173,7 +173,7 @@ static int cbw_init(BlockDriverState *bs, BlockDriverState *source,
             ((BDRV_REQ_FUA | BDRV_REQ_MAY_UNMAP | BDRV_REQ_NO_FALLBACK) &
              bs->file->bs->supported_zero_flags);
 
-    s->bcs = block_copy_state_new(bs->file, s->target, false, compress, errp);
+    s->bcs = block_copy_state_new(bs->file, s->target, false, false, errp);
     if (!s->bcs) {
         error_prepend(errp, "Cannot create block-copy-state: ");
         return -EINVAL;
@@ -202,7 +202,6 @@ BlockDriver bdrv_cbw_filter = {
 BlockDriverState *bdrv_cbw_append(BlockDriverState *source,
                                   BlockDriverState *target,
                                   const char *filter_node_name,
-                                  bool compress,
                                   BlockCopyState **bcs,
                                   Error **errp)
 {
@@ -221,7 +220,7 @@ BlockDriverState *bdrv_cbw_append(BlockDriverState *source,
     }
     state = top->opaque;
 
-    ret = cbw_init(top, source, target, compress, errp);
+    ret = cbw_init(top, source, target, errp);
     if (ret < 0) {
         goto fail;
     }
-- 
2.29.2


