Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 532273A2AA7
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Jun 2021 13:48:13 +0200 (CEST)
Received: from localhost ([::1]:56228 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lrJAS-0003YS-A2
	for lists+qemu-devel@lfdr.de; Thu, 10 Jun 2021 07:48:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59130)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lrIq9-00040I-I3; Thu, 10 Jun 2021 07:27:13 -0400
Received: from mail-eopbgr40090.outbound.protection.outlook.com
 ([40.107.4.90]:54851 helo=EUR03-DB5-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lrIq5-0004Ve-1Z; Thu, 10 Jun 2021 07:27:11 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oRgSQ1uDOWKd9qn3+o/Qr+pw54k81UDDsmFpoLxTo1x3oJyjioUoEodW4jJz0zSaFKr4rBhjiS9eIDtFFLXpw44dthOR/bCFk381k8cDIeX7Gth/qb8dGVuxYK51tRPr5lT/X89tZrP7rY2rKw75Z76M3r5QkvCOdglvPVLcULXVZh9RytyRdhFJut90p2LsPPTaPyGv7x1PIGWKXLOVAoQqfN5rdKk/7S3xXybNsFJn7MDtlzz/mz5BsJMQmolFImthPlj2OBlC9inF1qiHwYOKdL/8991G0Aige3/qSZuofCRQieDkzx6NSczCjK84qfKFiOzTYlM84Y31/5Z8zQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=A6gZyGdYcdOdZ98c6iLrdZgo9WnaPWMocI/jDACuhxI=;
 b=fbLv+A16cCsv+x0JlfXgIjZZronOW80GRS0UHBq0r9KaJNNmej42RXVzLQ2FZ1JtGhEdwemFBCuIda/UMGw9XEaBaIXR48qgqYlTtLh8R/5lIG1sZQMX92bIWFLq9kxDP80VTlIw5Hmu67Krmqm14p/OtXvaBY65LacQ/vPmwJEM3HL3uvsOSqznYCVJ8AtGcX1wgAz0kEHwZJj/tt7M7+b9ZX1spsxBiPgERQkYkARppIHSx9mvcOq0BlSjA3gYtW/hMboBPjSL6qJC1Xcy82BdXx6SaCtaevwEXwgt6H02rjlF+GJth8ebpIiOQAEJ0BJJh4ePz/OAlQtaFQzAbg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=A6gZyGdYcdOdZ98c6iLrdZgo9WnaPWMocI/jDACuhxI=;
 b=wNbpKJ2NcShbDxKhFcIUXfXjJkuvQRAbmNoUmjP1WzcIwwmIRAFrgKTeQ6ca9P65OUIvRcuLHpdi78gfsp0lIWEWPIKRCOEahgj+TYYjX7V9W5zZdL1hSDlCWDyiXYjqBglu3yUgr/ZcYJXsLnq1Mow3tMO0suC3M2ccnBbz4fY=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB3381.eurprd08.prod.outlook.com (2603:10a6:20b:43::26)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4195.25; Thu, 10 Jun
 2021 11:26:54 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f928:f4f2:77c0:74b4]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f928:f4f2:77c0:74b4%9]) with mapi id 15.20.4195.030; Thu, 10 Jun 2021
 11:26:54 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, vsementsov@virtuozzo.com, jsnow@redhat.com,
 mreitz@redhat.com, kwolf@redhat.com
Subject: [PATCH v5 20/35] block/copy-before-write: cbw_init(): use options
Date: Thu, 10 Jun 2021 14:26:03 +0300
Message-Id: <20210610112618.127378-21-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210610112618.127378-1-vsementsov@virtuozzo.com>
References: <20210610112618.127378-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [185.215.60.215]
X-ClientProxiedBy: HE1PR0902CA0037.eurprd09.prod.outlook.com
 (2603:10a6:7:15::26) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (185.215.60.215) by
 HE1PR0902CA0037.eurprd09.prod.outlook.com (2603:10a6:7:15::26) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4219.21 via Frontend Transport; Thu, 10 Jun 2021 11:26:54 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e6a7c1fb-c742-4fa8-cf56-08d92c02a6b3
X-MS-TrafficTypeDiagnostic: AM6PR08MB3381:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR08MB338184CF2CDB05DC9873702CC1359@AM6PR08MB3381.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:110;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: omlJ5hw+P84KotOeJ1bNppe1U0jsNqrlv/G7WUc5dtpCR6FEPQZV9s4MAKNg4JXL6oTaCLST7/XMA+t5TRmsjYZ7k32nLQRd/oT25XABPdIUAHdH04JnjeCT3FqUnB/d1EE5qlQVUY2srcLsjooyzqIWX2prSQdSUmXjakFRIDHu9xxoou/8qfEIOA2Ptgl0LlK/8dTj7x0vK50ie2Vx+nN9PvcSDblxr0UKPlfzHuS7acLO91+NGpehwdVnwqSGgchpJA7r+t1wlcLo58IStb2yKKmdnPKiVKGyA89lRnxAn02ata8u3VeoYIUGCJQx+sjgM7jQk0t9V7cDE0UpiyKhrGez5gnVTYw5uzy23VtVCMh6RiR1FGws6imrFHep+bHMVW48CBAjUzcjqXM39I5vm8RxxxUOZ7vCZMGVxlvbUUfo3skqJGpaO+l5y2tcWDJ1Bmm1TcB3yyi4J8LMLNi0eNxYrElhlmH87xEUqLEeHpoTQCTWw8Ww7aRrt6yb8AbvIAB/U8hOdUYM2quwkIeZvekqSpV6wXyqh0MepA6Lp2DeiIuHEbuT87JkzWmUrsOfmsHyNzgk3k5KQgZ1QpVXP28uo0IMUD67/hmjZcZv/VdQwQdH9Ib2SKNPvR0MV5r4iuWAMhnhxNJo5gHyk/d331917mVykPjzV+e8WYN9PpEQpsf6kswQRmrJwkJN
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(366004)(39840400004)(136003)(376002)(346002)(2616005)(66476007)(83380400001)(956004)(8676002)(8936002)(38100700002)(6666004)(66946007)(1076003)(5660300002)(66556008)(316002)(26005)(4326008)(6512007)(478600001)(6486002)(186003)(2906002)(52116002)(38350700002)(6916009)(6506007)(36756003)(16526019)(86362001)(69590400013);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?y/KVHr9joHz0qq2fCO8ln/3JFjCOc8hcW3+t9KN0JbZ1R63Ux8W84avH4Kxa?=
 =?us-ascii?Q?10o2ySGWTaPWfkJzLWeTFWAjA638l2iksbD/Y27uN0fbvkAYnTosLQSaXYJI?=
 =?us-ascii?Q?birL7UptlKV+XpuEkQKvDOCKuAuCfdXP70jyUoRqBdpKF8nRENQpJgSv0Q1r?=
 =?us-ascii?Q?lxUm6GxJIsFh6JxuEpPP3iSN7Zd1RJg8wO6W9wFyH+qW1zkrQcsFwEOkiX97?=
 =?us-ascii?Q?AM9M4uhv/wj3wk871QeTFaRVxJCOVtPfHxk73+NQiluNlxyMitXibqkoayXB?=
 =?us-ascii?Q?uWTuCSxE+N2klu3S+gIkHZvAmQuaa8hXNPbe4kO5rR/MiaxUVwY8dz6ToRvj?=
 =?us-ascii?Q?QuEDr3mTbNzLU1itYZWb4ncsGryP5TDYpl912G1isNkC5NscBom/THsLhFHV?=
 =?us-ascii?Q?yOUfE+CJxlqtWgOuEqGoFRa116tbt8Ubzr+cZszx+RUT2Y5Mog87QmFyYBhk?=
 =?us-ascii?Q?PSGLvJ0Ckw1W2KY/BhzaDQpkYdNyfVYtlCsiQeUzE+CB0hItCTQUZrivCLqe?=
 =?us-ascii?Q?KYjs1FzvF9+G1+JIm69vxrYa3hYll+VWkLZZJE4evbMnngiW73Q3RdFUZLo7?=
 =?us-ascii?Q?i/PYAP4c+g8MlCrivbr7HiwPvNluP/B7CxSZHPpqHPUuamvM7h2FGZa5QylM?=
 =?us-ascii?Q?AD8/DkP/CYnPDytdvlesEshRlueapdjlHp6EZj7UvfPqsmBuIWou9paPJtIj?=
 =?us-ascii?Q?0hOsYRDYctft8EhEtNhZu6+Z7gif4aqcb6YOwTXDGSTMg4kehbjvTU//b+Ji?=
 =?us-ascii?Q?lBJhq/EqfbclWwzpFEzFrD9bwyphzDnapNyB/+mp4Rdk2B8sWs/uU1Fj1WwU?=
 =?us-ascii?Q?p63MawPWC3Fl82JiGPKkRSTX0WL4kSSQy2T4GPNphEJO9D8wi6VTKTZZusB4?=
 =?us-ascii?Q?76UeTLuQfvwmKsmwfHDZ2Qgwc+WckNWY9IkbEB/W4r79qDKPQUItEUwithEE?=
 =?us-ascii?Q?o5lpZhCp6Ljkl4SCWlWqg5Y3LbWo209gX5K9VtCTU5cv3uRlt4QOx+hK4cOk?=
 =?us-ascii?Q?/GSrfFk5xoT2q08TqFFpSYx3S/3ZQG+aDwfSLhSxWfByN2JejAZJ0wnDccrO?=
 =?us-ascii?Q?B+rbuLqbZ1tKE9boD8+/n+P+z7NSDTtrtDUYkb+nmHW9sI8K/TAZ2AGO0fZM?=
 =?us-ascii?Q?wlDJW2O4A4DIe1cxiZjjRI2GGz9J6Uvt3BxP5JrYQDZUeVKArKDHmaqK+XP7?=
 =?us-ascii?Q?XGcjJ4aq7xwZ5OMcCmfigNlpxFA30FAXGTdBH9tgWHxRRAgiPOxd3KIruQWa?=
 =?us-ascii?Q?wdGrzgEswi8ibEIwqAn8yJMsk6l1WkWiFbIllPv52UbOr7dC8H8BJ+xVqH6l?=
 =?us-ascii?Q?4mma1Qs131wiJS97WI4ZXMDR?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e6a7c1fb-c742-4fa8-cf56-08d92c02a6b3
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jun 2021 11:26:54.9567 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SNetw7xDW4rhLRU2jtrPaxm6dYaZjAoDJkawr4rJ918aro6o+hxcnvNXWqT8iKvh2HdSqaOKpkVrWFf5/ld3Eg9xXk++TAJpf0lOR+mSN/M=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB3381
Received-SPF: pass client-ip=40.107.4.90;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR03-DB5-obe.outbound.protection.outlook.com
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

One more step closer to .bdrv_open(): use options instead of plain
arguments. Move to bdrv_open_child() calls, native for drive open
handlers.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 block/copy-before-write.c | 29 +++++++++++++++--------------
 1 file changed, 15 insertions(+), 14 deletions(-)

diff --git a/block/copy-before-write.c b/block/copy-before-write.c
index 1e7180760a..1cefcade78 100644
--- a/block/copy-before-write.c
+++ b/block/copy-before-write.c
@@ -144,25 +144,20 @@ static void cbw_child_perm(BlockDriverState *bs, BdrvChild *c,
     }
 }
 
-static int cbw_init(BlockDriverState *bs, BlockDriverState *source,
-                    BlockDriverState *target, Error **errp)
+static int cbw_init(BlockDriverState *bs, QDict *options, Error **errp)
 {
     BDRVCopyBeforeWriteState *s = bs->opaque;
 
-    bdrv_ref(target);
-    s->target = bdrv_attach_child(bs, target, "target", &child_of_bds,
-                                  BDRV_CHILD_DATA, errp);
-    if (!s->target) {
-        error_prepend(errp, "Cannot attach target child: ");
+    bs->file = bdrv_open_child(NULL, options, "file", bs, &child_of_bds,
+                               BDRV_CHILD_FILTERED | BDRV_CHILD_PRIMARY,
+                               false, errp);
+    if (!bs->file) {
         return -EINVAL;
     }
 
-    bdrv_ref(source);
-    bs->file = bdrv_attach_child(bs, source, "file", &child_of_bds,
-                                 BDRV_CHILD_FILTERED | BDRV_CHILD_PRIMARY,
-                                 errp);
-    if (!bs->file) {
-        error_prepend(errp, "Cannot attach file child: ");
+    s->target = bdrv_open_child(NULL, options, "target", bs, &child_of_bds,
+                                BDRV_CHILD_DATA, false, errp);
+    if (!s->target) {
         return -EINVAL;
     }
 
@@ -209,6 +204,7 @@ BlockDriverState *bdrv_cbw_append(BlockDriverState *source,
     int ret;
     BDRVCopyBeforeWriteState *state;
     BlockDriverState *top;
+    QDict *opts;
 
     assert(source->total_sectors == target->total_sectors);
 
@@ -220,7 +216,12 @@ BlockDriverState *bdrv_cbw_append(BlockDriverState *source,
     }
     state = top->opaque;
 
-    ret = cbw_init(top, source, target, errp);
+    opts = qdict_new();
+    qdict_put_str(opts, "file", bdrv_get_node_name(source));
+    qdict_put_str(opts, "target", bdrv_get_node_name(target));
+
+    ret = cbw_init(top, opts, errp);
+    qobject_unref(opts);
     if (ret < 0) {
         goto fail;
     }
-- 
2.29.2


