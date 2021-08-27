Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 67FED3F9EC5
	for <lists+qemu-devel@lfdr.de>; Fri, 27 Aug 2021 20:28:12 +0200 (CEST)
Received: from localhost ([::1]:41658 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mJgaJ-0007u9-DX
	for lists+qemu-devel@lfdr.de; Fri, 27 Aug 2021 14:28:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33648)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mJgR4-0000zJ-BL; Fri, 27 Aug 2021 14:18:38 -0400
Received: from mail-db8eur05on2112.outbound.protection.outlook.com
 ([40.107.20.112]:12641 helo=EUR05-DB8-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mJgR1-0006Un-EV; Fri, 27 Aug 2021 14:18:38 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hbufT/HHFwVliUPfK6cG8Z2OMFEhPAoVbz+K3gD+E0/pe6FpX6mkSrc17VU2E/0N6eSmz65zagSaFdAX656lLMfjofM6Yeu3K8x59D8iqkSQCOpk5/Cr3XauI3blkxGOXF9sPQytnbyWnyYpeOn8iioNM4mEIja3RDfqCSRxoq53MZnTGB7m6cHjxPMxKmDuygNp+FMIocFiK+GYA7CB66VLbz+1l/Sp/f3qK4GTuHDwEgjfMNOlReeu4RJlZy0lu8JI/cF2/xA7a1xJh0wuRcTw5Ai2vxTnFDarAkidYP4VafOHJy49V4JlDcpYP+zbxJGjwEDlldkkmdp3ZZv/Kg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qFtcBZJgamPgS39MVptkX5N4hMH7c8jVfQ3cJ1EfEsw=;
 b=aNdb8kxyueG4L1PitFFvJf7rqBCCL3Tba3GHHjc5Yn7AxlNQM+l6cufbuc7JWoMesccXu2L5Cd/kjQndiAsoXx9xs/nFWFIL1IJq4/x48gpygwrfOheZZzOa1LuZsX1zIwgVG3+BT/AfgucuzshhcqFeoBv8VtWZs3bCXWEFWiMB3m4HCQy5FaPtoCm9NzbfO1AdAC/b/0ofb3sswt73kBbrGmXelE1DTMXg6nW/qYNgifGcyj0QCjx1alCGUJSzjBOqzWN+pOTT7/Nw6bRqRUNJbyHK9hNp6iA0vaBC4yw+AwT9gk3IUHq3dzIg/bHcMzt/R2HqcvfDVd3MFOYHRQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qFtcBZJgamPgS39MVptkX5N4hMH7c8jVfQ3cJ1EfEsw=;
 b=XwMi7dIcDlZJN8mx3yWcxMJQ+ovvf/ajZALx2W4y1VFd4wFvODnKO/KA4cTWd2m7JtogWgX/Hk3BGMqyNs6l2mNfW8QKsjMs0s9VqCPOviAVJEsqsom/yIRIMG7Vg2BMSNtoHJMP5yv8lflOAf6TtRzGCM5cIoaKVbsZd2TNNcE=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB3765.eurprd08.prod.outlook.com (2603:10a6:20b:8f::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4457.21; Fri, 27 Aug
 2021 18:18:29 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::2817:53b3:f8b4:fe22]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::2817:53b3:f8b4:fe22%7]) with mapi id 15.20.4457.023; Fri, 27 Aug 2021
 18:18:29 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, armbru@redhat.com, xiechanglong.d@gmail.com,
 wencongyang2@huawei.com, eblake@redhat.com, hreitz@redhat.com,
 kwolf@redhat.com, vsementsov@virtuozzo.com, jsnow@redhat.com
Subject: [PATCH v2 04/19] block/copy-before-write: add bitmap open parameter
Date: Fri, 27 Aug 2021 21:17:53 +0300
Message-Id: <20210827181808.311670-5-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210827181808.311670-1-vsementsov@virtuozzo.com>
References: <20210827181808.311670-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: HE1PR0402CA0012.eurprd04.prod.outlook.com
 (2603:10a6:3:d0::22) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (185.215.60.220) by
 HE1PR0402CA0012.eurprd04.prod.outlook.com (2603:10a6:3:d0::22) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4457.18 via Frontend Transport; Fri, 27 Aug 2021 18:18:28 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 702edab6-9c53-4af1-a193-08d9698711da
X-MS-TrafficTypeDiagnostic: AM6PR08MB3765:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR08MB3765B30424BB79772CAD2CF4C1C89@AM6PR08MB3765.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:415;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: vHdkgVAMTHnDlFV276oBcMMreMPfEGH9wYlDgaPYn0g5j0Xqi/TkAmhrr9U6LD+VHMi+1OnxcIFmLgrgNTtrUa5cw8hy7wo4/pHTwdR0yRZtZVljWpRi5WkQPNku3F+KUo5jWK2/RiohUVSgQvS+kyt5QqImcwHEzfdptH7hZvK+RWaVWxXhXShOtI3u/hD+9UR5pJnUiHyn+zQfe0vRc+xjJq/I3oJXtJMqbLnoqKa7sW+UR0cHmx0P7wBEcJDE/50SZnYZUT8Qj0wFQLv/kHrIl+cjJWNIL3xa1mHcbtS7IbKyys3KQT7327mPHWd+s+CHrdqCHlDFneBu6s1yipkmj0QBVSNnq9VSfJQiArn8MY8+68TuFkpnzJCdc1bgaUzlj6GmYwTvjhgUub4AHItFHQVqAa00HmjcpD6BxEF5bVwLhL2v+ElWk3S+xrP7p5RB6BfruhRhf8gNAhm+OXqL0mLwO4t9dQHsLRaWV5LtX+RdZc6lwbXJXY4HtBrj/8mBYFVDsRccgkOKOkTh5OSFVYxUE70HN+FYit2yDNtibZHq1iL1JDiJGzVoR4ZA3FXkL0JJuxoACArepW26XiMROD7UoAeUMDZ8QS1uP5xJ94UJHt1kFscXPUqaQsYgHH6SLImwHJpvAHJLgLrrYeLIkLprdQDqNRK9QQOzDpu2k6/6ZgFI0U1oWF17U/twk2Ekpq8UC3WyzdpcSmJBpg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(39840400004)(366004)(136003)(346002)(396003)(52116002)(6486002)(1076003)(26005)(66946007)(66476007)(8936002)(6506007)(2616005)(38350700002)(38100700002)(956004)(5660300002)(86362001)(8676002)(186003)(6666004)(83380400001)(66556008)(6916009)(4326008)(6512007)(36756003)(2906002)(478600001)(316002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?tPXFcvVn7ey8beR6sJSLQUPcMePuK5mGkRbss0GDZbuaI66RQFciAOB4gA5x?=
 =?us-ascii?Q?+6eB+vhW5LOdQQUO9yNW80gMtytNnIb2Cly622DFg65r0yNjf7ondyL/jlQ5?=
 =?us-ascii?Q?5ikarCNs8KdrxjygbwI024aE4DoM3f/bfs6EwtkbRl93cafS+IJvqiev1y0C?=
 =?us-ascii?Q?lEXPgAN201+//y902ZJI8QjvBaUWuy6ZtHF3E9MScgqdATYcnSG1Q91/cQTf?=
 =?us-ascii?Q?bwJpdSUelFIOYfmC97gQxdYBWuy0w8HSCmGa2gtglywDS+uLCCm0ZeJj6v2O?=
 =?us-ascii?Q?UhIzAJow8cVKqU9IhB6zIJAeFSlPsTtCI7GlT0v1BvZPTlS3zCOVjLupVRRw?=
 =?us-ascii?Q?pDfS6s7LCYXLT6wxzErYMIBshzbIA8v/+UzLLKAU/jNK7lupkrPibVUq9XZx?=
 =?us-ascii?Q?4AQVl/SRsOGdjNNq60IHB+oOu3XPOwD83YhEooloaiWxiYN7Wu0yfDz/jXr5?=
 =?us-ascii?Q?tTSiVp13XYdifSGcFPkiaFhkT5YJf9Y7bC7pkYYP7Mai1q9s4nEGATSFHK1Z?=
 =?us-ascii?Q?pNbCUWbAmqrhFwoDU2ERiBTIol4OE7mECXoKE4hiPIfTPE9eYbyzMJfBeGmG?=
 =?us-ascii?Q?DtMT4OzkAbuliIIMJfJk/5o/aqAgtTG6g1QbXUZtx7uo9x9JzO2UPe7aiC6X?=
 =?us-ascii?Q?7I0FlSM3n1kk/law2cxN7DCuPmIK7ot22tN2AcZWei8LTNn2PJA/5BbOMA28?=
 =?us-ascii?Q?gMunH/DfHYUhUtf4EQMn22jeRaYPxtPi13MlD+0rIgQ0Gp9DCMl3V88sPWqd?=
 =?us-ascii?Q?d+FQHePjrG2vX+m96/u5NJYlDRC6iZlo1AYVga+14mAY256p0RXMR1wwBYLX?=
 =?us-ascii?Q?jO9ssKAlNoguAS5q58N+YJe646BZzhP9i3mjvrrLnfnzco49qK6fEVykTWhY?=
 =?us-ascii?Q?pzflH8YnKaU/9BcmoCzA1bf7YtZ0xAGY1s6hdjW3DgcUXnmFbXtK6ieBuXhD?=
 =?us-ascii?Q?Gyb7idug/p2k67yua9xm4jYXHrlqrUh+Rtj+VZtqmf0qtpCW1LWLZHVMI1LT?=
 =?us-ascii?Q?S0y7/DPfC6DQUxqfPYpj8jq3yp5ATIfMOn5A4W5luoTo27YPniu/qaNTEaRK?=
 =?us-ascii?Q?jmJ3fwpbhuM4IVBXepyTTrPsFQXSxS7MTf+n+BJerU8fcpr8zwJHPNfYeqfl?=
 =?us-ascii?Q?D2h1Z7e39ORDiRI0OIcsklC7HUJMd8LBRogi2OgRP6lLgV8Dsac3ebPaA5fL?=
 =?us-ascii?Q?Zc3kSubPA+Ng10qsetiEi+aK8nWevtQzuuxrbkwhVD/oLkiAiGWMJXpsWNN1?=
 =?us-ascii?Q?vhUrkwB13Ey/zG6odOXiSBVZnFYDucGzFpyZgo2VdwCSOenfMTj0v3QPjfbx?=
 =?us-ascii?Q?UuvijiF5PMmx2EtacQ4otne3?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 702edab6-9c53-4af1-a193-08d9698711da
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Aug 2021 18:18:29.2042 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GpfaE8BR4GxTwKMZ4oxSCeYruTKJJ5AFHHbhV/A6HlWX1p5YT+Gplysnb1iobeKUB7BUD1QQWQ+Pp/R6X2iz2Aqbq8M0zN041/YJzCPz46o=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB3765
Received-SPF: pass client-ip=40.107.20.112;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR05-DB8-obe.outbound.protection.outlook.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_PASS=-0.001,
 T_SPF_HELO_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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
 block/copy-before-write.c | 30 +++++++++++++++++++++++++++++-
 2 files changed, 38 insertions(+), 2 deletions(-)

diff --git a/qapi/block-core.json b/qapi/block-core.json
index 6764d8b84f..c42d23752d 100644
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
 # Since: 6.2
 ##
 { 'struct': 'BlockdevOptionsCbw',
   'base': 'BlockdevOptionsGenericFormat',
-  'data': { 'target': 'BlockdevRef' } }
+  'data': { 'target': 'BlockdevRef', '*bitmap': 'BlockDirtyBitmap' } }
 
 ##
 # @BlockdevOptions:
diff --git a/block/copy-before-write.c b/block/copy-before-write.c
index d31ca61111..e3456ad6aa 100644
--- a/block/copy-before-write.c
+++ b/block/copy-before-write.c
@@ -148,6 +148,7 @@ static int cbw_open(BlockDriverState *bs, QDict *options, int flags,
                     Error **errp)
 {
     BDRVCopyBeforeWriteState *s = bs->opaque;
+    BdrvDirtyBitmap *bitmap = NULL;
 
     bs->file = bdrv_open_child(NULL, options, "file", bs, &child_of_bds,
                                BDRV_CHILD_FILTERED | BDRV_CHILD_PRIMARY,
@@ -162,6 +163,33 @@ static int cbw_open(BlockDriverState *bs, QDict *options, int flags,
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
+        qdict_del(options, "bitmap.node");
+        qdict_del(options, "bitmap.name");
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
@@ -169,7 +197,7 @@ static int cbw_open(BlockDriverState *bs, QDict *options, int flags,
             ((BDRV_REQ_FUA | BDRV_REQ_MAY_UNMAP | BDRV_REQ_NO_FALLBACK) &
              bs->file->bs->supported_zero_flags);
 
-    s->bcs = block_copy_state_new(bs->file, s->target, NULL, errp);
+    s->bcs = block_copy_state_new(bs->file, s->target, bitmap, errp);
     if (!s->bcs) {
         error_prepend(errp, "Cannot create block-copy-state: ");
         return -EINVAL;
-- 
2.29.2


