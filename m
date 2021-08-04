Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D88F3E01D7
	for <lists+qemu-devel@lfdr.de>; Wed,  4 Aug 2021 15:22:31 +0200 (CEST)
Received: from localhost ([::1]:57428 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mBGqs-0002EB-5B
	for lists+qemu-devel@lfdr.de; Wed, 04 Aug 2021 09:22:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46236)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mBGmi-00021z-Mk; Wed, 04 Aug 2021 09:18:12 -0400
Received: from mail-eopbgr60122.outbound.protection.outlook.com
 ([40.107.6.122]:6733 helo=EUR04-DB3-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mBGmh-0005TW-1f; Wed, 04 Aug 2021 09:18:12 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GtuZZ29F8ad23coJJK86zvrkGGF+1g7BEu37/wXUyzjwXaPDJ8mLaucg1+unIKODdeTzYLc/RBpgrbpzY5D6VWavsoMQ7mYs0S1nT0SjVDksaBoNFIL0UFM+jK/SUC/IkOIBz3UxkVfZwlx6LkqEZoGhWLipkc1RDq7WW0oMaeEZZEmiVTUWunEfd2Y8axeIzHS3qz1JZdbW92zh6j0vZdMZR4CAwBu/pUGRbMLlF7gRBAz4SQ8j+xUeraF2OpWETlgp1XYBeQqpdUb83dCWcxhZ+Muh/QQBByHW2itg0ncI6DHAlF8MbaX4af5u4eaHwmYHxaj+DAjTG1+ycBbFBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=A0dxlpaHOT8WSyW0HNgZ2hLryOhEvrlc5CSxpdJ6aes=;
 b=IpQibdKJBniT+GIgpWhadkMpoEbjmY8W/LIkn2e4hGQ4q/nT6q0MPOXHeSfFUfqLa1JCL73zuie1W7so7lxDbk4rsZBpnnGozyyq9Q2xwhJzMC1Kosmevg7Vz4tria3F4H1nDXmrI2Q8ZE+aQb1B6ZYfPxN/d9pilN2iFvc/cTnZCnkwD15d9NcX9uFJNrLpJ3AiCHYgbp99Qnq9cZFrAFZn8ZAiB3l+fhMYlm2OA4wGa8DaMULMQPNijuYg9mCubwZmaBUgRx/LpcR67pA/+DnkJ73m1JTOZxalDZ4+JkoG7/qILWMhcdaMANtcpraBGmx/BN7VgFi9OZW9dDAP7g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=A0dxlpaHOT8WSyW0HNgZ2hLryOhEvrlc5CSxpdJ6aes=;
 b=tETBcm/FkW68i3mpG6r/vnn+Fimsm4kAEY0fOTuzmDHhmnrIHaLvCREjnsaAubg64tPWSysyT3BIsG4sNDQ3IJbfKROr4PWxQ7bncx6rGtn0eS3CFZEu/9l7//OuHuIL+xjmf7EJtEymK1NsvTIOZg2maxASiePqSEsOA+dbO+w=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AS8PR08MB6216.eurprd08.prod.outlook.com (2603:10a6:20b:29c::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4373.21; Wed, 4 Aug
 2021 13:18:08 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::44b9:68ac:bdc7:e23c]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::44b9:68ac:bdc7:e23c%8]) with mapi id 15.20.4373.026; Wed, 4 Aug 2021
 13:18:08 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, eblake@redhat.com, mreitz@redhat.com,
 vsementsov@virtuozzo.com, jsnow@redhat.com, kwolf@redhat.com
Subject: [PATCH 04/11] block/copy-before-write: add bitmap open parameter
Date: Wed,  4 Aug 2021 16:17:43 +0300
Message-Id: <20210804131750.127574-5-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210804131750.127574-1-vsementsov@virtuozzo.com>
References: <20210804131750.127574-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: HE1P192CA0003.EURP192.PROD.OUTLOOK.COM (2603:10a6:3:fe::13)
 To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (185.215.60.211) by
 HE1P192CA0003.EURP192.PROD.OUTLOOK.COM (2603:10a6:3:fe::13) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4394.15 via Frontend Transport; Wed, 4 Aug 2021 13:18:07 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 334f72b3-d521-44df-7d3b-08d9574a4d0e
X-MS-TrafficTypeDiagnostic: AS8PR08MB6216:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AS8PR08MB6216645DD17811680F4D8145C1F19@AS8PR08MB6216.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:415;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: oR2/1x2oO1UxD+bAubGwCr3OBjc6e+RbD8V8Cn5xw+DYeW2vYFAg2wYj2CFu4/LKAWhIZ0iQtDgZRiiR11Ra9Ztim/YXwzxHwLT75VXPWFaweoKBEdYzrP77FqVQx9+yw1kXAAp6BjN7/Z+Q5gZpXcv6eS6yULEEkcpT24yqr4nx8C++EgIKIIR/G7xIBrzu6XLxK4EaftcGCO5+OOYZGPKb1aTKvP265Qr0Z0aQiM0eHqmB6EMf/d6rf+CDuWVnNkHt1bXaXRs/P+jWiwgFSFIT6S6KbyaIIbkHx0stu/eCb22OxmV8I9ZE2d8myuHZPpkvwHB8ZYfBh66qtZdT51mbRu+NfewSDcRYup+lE/jcSklWX6dNbkZ+XvUd+2Cr5qx/rNm0avWQo1ZCeQXV8kplb6yFNMDGJrUd8IZWxf4LBraOJbO5ewigB/Ern9ymu4D7h4FpRqUNo+w50MIeAGmS99Bsxxl9dQExkw8v0X+/Z1gnIWSy7fXsMmbvbHWzfhVOXnYDAoVLV+Bu4gdblAwrjcLffaG+m6R6FyIpqJ2AQ226oaQ+ZKupg4pZBbFc4buE+aATUj5ZFIWjR4FhivM6tzetLpWhW+obyny6eqfr0J2+Y/12evT3Ttb8d4h6y7/SFqq4YG4E9wkuTqugE2+CzL8wWBDZRTfxiC9SfsYGw1WnoekpUfhH3uazvD6N9bkGQSVwF+oQ4wSqkWKV/w==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(376002)(346002)(39830400003)(396003)(136003)(478600001)(1076003)(8936002)(6666004)(36756003)(66476007)(86362001)(316002)(4326008)(6916009)(6512007)(52116002)(2906002)(38100700002)(5660300002)(186003)(26005)(38350700002)(2616005)(956004)(66556008)(6486002)(6506007)(83380400001)(66946007)(8676002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?taN3uaYXSfyQ2VNUO6m5AWG/unMPxO1Tzs5SR6sHJavVUipanXb2SUJVhbVv?=
 =?us-ascii?Q?iwPvQzHU8gOIgbYbLf6za0ncbJbF98RsR/LKXy5x+C8uvZob6YkMoqQSwAo1?=
 =?us-ascii?Q?HImaBQNMaBJ9COvUlGg3UwWO5HTC2x/l0gYQwVB234xzMgbbtgaaIfIL9aZ5?=
 =?us-ascii?Q?LgxzM5LA4I8bER/FvwTNMQyiAYwNfRDttrqhlpIPpqoyVSNQ8XRRyfAv0Dzd?=
 =?us-ascii?Q?Z0jCFhzWhY9+LDJyv7/0y8HSdn92ngY1VijoaDCgyW0C7UgEixHaJcjJSJYs?=
 =?us-ascii?Q?RVIiqsgYMMTNKCzQAZGnk5WZLYlFQP93N0rcTPVm0Pdsv+UftvOeATa+Zlxn?=
 =?us-ascii?Q?27LK9B+e/npkBtXizBUX1PC5fj86BmzjXjBi+XYlVsEi4WfF57LwaZLWIfPK?=
 =?us-ascii?Q?jfa4ma/Pj995bYI4RdiTUAlhV5e8oarI5owGwe6d8YuR2e7Eu9EmNBbuEedH?=
 =?us-ascii?Q?WUxU/xl1kTvftbmjseRQ7/Bvsw3VTjyVHNaDVpFcv4xqzH3u71TsifjQL58g?=
 =?us-ascii?Q?gEDe3cUlGC7nRfvgG6RfGEcXQN0Y0r9zcwpU0Nyvgf6/p7J/cuCVIXkjUFGW?=
 =?us-ascii?Q?eaj82NfNk21hmsIElb9MZI6FRzwqkFYa1wAyOXrZ3sWmhi3VVQkuyxEvwkD7?=
 =?us-ascii?Q?7vmEBwQRYIMknPV4sl3PvduoL0Ne2NDR8UMtyrlZKgpllDLvalwzdO4UCdZH?=
 =?us-ascii?Q?QE/UjYz5Tqca8xN4hlFzeWcFFva75Yk0a9XS/ED24iuSUDwaMTrjAmAdMMIE?=
 =?us-ascii?Q?/vsVMGY/VnVis1TUBQH6iTqQmf/UlFjAvSL2CyDHkZsajrEpD+2NiVfllr+1?=
 =?us-ascii?Q?FvPOOdE4Ub3NCOO/bgWiDrWO/urateB83KVdWe7Tn5Yw+/skk3wVrlAgQVO2?=
 =?us-ascii?Q?xMjJg+VD0xi5uUmwv+FxwjhX12fbzATpSn7aZoEJxm1q7pC0VrxR/a0pXCQI?=
 =?us-ascii?Q?YYNciPfKoR8oWAkGN+XtIE8uqrHWYh7pZ6Hqr1AYUA0m/4/RmBPp2kejra2D?=
 =?us-ascii?Q?dy+ZO58S41WHWZqMO521ohTSrk5+SjLbYimkD/HmzcDLmi8cD3AuNqWUuZkl?=
 =?us-ascii?Q?ybmuxYG01HC80Ha87iH9I1rPflPLq8BHB8mVWYnl3mtZ8OouxyHFDJ5i0mV7?=
 =?us-ascii?Q?0XIiUtR+qff/oCt/eoXGw5q6RhyLtguHdWle/PostqmDgoCBsqYtgrYXt6Yq?=
 =?us-ascii?Q?Szs5MCPJcurx5JT7CaV9wd/lQFz87dFPXtK/ZJLszQW5cfUQtzYILaxEcou5?=
 =?us-ascii?Q?lC6EDz3NgHCTwudIA7MS9C6CdcII6BhAn9Osk3VPsC5NRyaDcWTtcNDSUalc?=
 =?us-ascii?Q?CEd8lkwYtDGqIdaG4TklDOrm?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 334f72b3-d521-44df-7d3b-08d9574a4d0e
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Aug 2021 13:18:08.3150 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5kL53lXT/LiK4C0bdsWd4it1kNC5tRRZeEkV4/4ldL0h/Pi8+vFwCRQ1GIr/dR1KPYBwkZt7sLz4N+/wsgD227NwAK652ipMsCewKs82U8A=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6216
Received-SPF: pass client-ip=40.107.6.122;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR04-DB3-obe.outbound.protection.outlook.com
X-Spam_score_int: -1
X-Spam_score: -0.2
X-Spam_bar: /
X-Spam_report: (-0.2 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, MSGID_FROM_MTA_HEADER=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
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

This brings "incremental" mode to copy-before-write filter: user can
specify bitmap so that filter will copy only "dirty" areas.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 qapi/block-core.json      | 10 +++++++++-
 block/copy-before-write.c | 28 +++++++++++++++++++++++++++-
 2 files changed, 36 insertions(+), 2 deletions(-)

diff --git a/qapi/block-core.json b/qapi/block-core.json
index 59d3e5e42d..d061204cb0 100644
--- a/qapi/block-core.json
+++ b/qapi/block-core.json
@@ -4063,11 +4063,19 @@
 #
 # @target: The target for copy-before-write operations.
 #
+# @bitmap: If specified, copy-before-write filter will do
+#          copy-before-write operations only for dirty regions of the
+#          bitmap. Bitmap size must be equal to length of file and
+#          target child of the filter. Note also, that bitmap is used
+#          only to initialize internal bitmap of the process, so further
+#          modifications (or removing) of specified bitmap doesn't
+#          influence the filter.
+#
 # Since: 6.1
 ##
 { 'struct': 'BlockdevOptionsCbw',
   'base': 'BlockdevOptionsGenericFormat',
-  'data': { 'target': 'BlockdevRef' } }
+  'data': { 'target': 'BlockdevRef', '*bitmap': 'BlockDirtyBitmap' } }
 
 ##
 # @BlockdevOptions:
diff --git a/block/copy-before-write.c b/block/copy-before-write.c
index dbafee1f03..b58a5e8b48 100644
--- a/block/copy-before-write.c
+++ b/block/copy-before-write.c
@@ -148,6 +148,7 @@ static int cbw_open(BlockDriverState *bs, QDict *options, int flags,
                     Error **errp)
 {
     BDRVCopyBeforeWriteState *s = bs->opaque;
+    BdrvDirtyBitmap *bitmap = NULL;
 
     bs->file = bdrv_open_child(NULL, options, "file", bs, &child_of_bds,
                                BDRV_CHILD_FILTERED | BDRV_CHILD_PRIMARY,
@@ -162,6 +163,31 @@ static int cbw_open(BlockDriverState *bs, QDict *options, int flags,
         return -EINVAL;
     }
 
+    if (qdict_haskey(options, "bitmap.node") ||
+        qdict_haskey(options, "bitmap.name"))
+    {
+        const char *bitmap_node, *bitmap_name;
+
+        if (!qdict_haskey(options, "bitmap.node")) {
+            error_setg(errp, "bitmap.node is not specified");
+            return -EINVAL;
+        }
+
+        if (!qdict_haskey(options, "bitmap.name")) {
+            error_setg(errp, "bitmap.name is not specified");
+            return -EINVAL;
+        }
+
+        bitmap_node = qdict_get_str(options, "bitmap.node");
+        bitmap_name = qdict_get_str(options, "bitmap.name");
+
+        bitmap = block_dirty_bitmap_lookup(bitmap_node, bitmap_name, NULL,
+                                           errp);
+        if (!bitmap) {
+            return -EINVAL;
+        }
+    }
+
     bs->total_sectors = bs->file->bs->total_sectors;
     bs->supported_write_flags = BDRV_REQ_WRITE_UNCHANGED |
             (BDRV_REQ_FUA & bs->file->bs->supported_write_flags);
@@ -169,7 +195,7 @@ static int cbw_open(BlockDriverState *bs, QDict *options, int flags,
             ((BDRV_REQ_FUA | BDRV_REQ_MAY_UNMAP | BDRV_REQ_NO_FALLBACK) &
              bs->file->bs->supported_zero_flags);
 
-    s->bcs = block_copy_state_new(bs->file, s->target, false, false, NULL,
+    s->bcs = block_copy_state_new(bs->file, s->target, false, false, bitmap,
                                   errp);
     if (!s->bcs) {
         error_prepend(errp, "Cannot create block-copy-state: ");
-- 
2.29.2


