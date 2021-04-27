Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A56236C4BA
	for <lists+qemu-devel@lfdr.de>; Tue, 27 Apr 2021 13:14:32 +0200 (CEST)
Received: from localhost ([::1]:32838 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lbLfj-0001H1-D2
	for lists+qemu-devel@lfdr.de; Tue, 27 Apr 2021 07:14:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48392)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lbLd7-00082K-IA; Tue, 27 Apr 2021 07:11:49 -0400
Received: from mail-eopbgr70115.outbound.protection.outlook.com
 ([40.107.7.115]:25817 helo=EUR04-HE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lbLd5-00069e-As; Tue, 27 Apr 2021 07:11:49 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=F1ebJlbt4PiJOcEms6DUji5oC2qTp2KukTWnGZUeyDtqFx+y2FnJ677sMKmrUltBoMVjXeQIne+0X5ogjozXz+bCa9Cm48ZP38Jbj8NNtLOVxrvK1ZX6MC/tbnjQfXuULdyGtZoHx04xa2nVvmxaqujNR+NZj67BNGCr69+tHCljRwmL44lhzJNsTFtNdZX6TnMm7gCn/QsjmmcZH3fYfAmOMSjShPT8kQseSz46Q9ltchtv+lCu7QlRYXNMoSogL7b3Q1CnSz01usBVsXT4PLY9HP1adntFWo3e+rruP35vsn8OR6hIiXfb8GOUm0Yr7NbjWL5RHQbPbk4rcDBNAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2r6wGgT2GGzjlg/0WEZEX3JzWJ4ee5n/GQZp5idDGc0=;
 b=UXk5OcMEae7ucWc4fNuuf+aaoTtilhmrru8YmISQCO2KusJGO5i2dUPzib/ZFsJukLo/Fx4CpFtR+DIDdCs4QQhGR8hrnb4yyfUcaSpE8wQWoe6tYH4owSu5O6POteHPpztGWeq59expL5rid73vWYS6iU9bHChOPEC5F/r95QGVzhzr+SxqjLDhJvL6MHhCTJLJkcGWl4Yl/FioAcavTLSUvbNqFQrcderKamfGjQn6scyC7l3SSqyvPohQyyyMQX2QQhSKlV+XW4KHnFdMt/XNyB9yE+6OOCp4798fvTqnV81FmHrj7qsV3dHylGnBhlB1Gn4mi3+eyl54LyNJJA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2r6wGgT2GGzjlg/0WEZEX3JzWJ4ee5n/GQZp5idDGc0=;
 b=R3kBIu+b1oylZIy91NhLnDLnHy6R8ezeTtzAs3A1gLRySSPCnhn4wLakC+Bh926hTaO5gYCajfQyNYTfh2L0rNMyqXAwg42OHDnYWUMkc7ePVBB3NeNsHZvkre2QusxOas3NKcwzEdOJPquvFtCKIQnrnGmLghv2/Xt5q/XFIK8=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB3863.eurprd08.prod.outlook.com (2603:10a6:20b:8b::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4065.20; Tue, 27 Apr
 2021 11:11:41 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133%7]) with mapi id 15.20.4065.027; Tue, 27 Apr 2021
 11:11:41 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, armbru@redhat.com, mreitz@redhat.com,
 kwolf@redhat.com, jsnow@redhat.com, vsementsov@virtuozzo.com,
 eblake@redhat.com, pkrempa@redhat.com, nshirokovskiy@virtuozzo.com,
 den@openvz.org
Subject: [PATCH 1/2] qapi: block-dirty-bitmap-merge: support allocation maps
Date: Tue, 27 Apr 2021 14:11:25 +0300
Message-Id: <20210427111126.84307-2-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210427111126.84307-1-vsementsov@virtuozzo.com>
References: <20210427111126.84307-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [185.215.60.222]
X-ClientProxiedBy: HE1PR0402CA0038.eurprd04.prod.outlook.com
 (2603:10a6:7:7c::27) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (185.215.60.222) by
 HE1PR0402CA0038.eurprd04.prod.outlook.com (2603:10a6:7:7c::27) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4065.20 via Frontend Transport; Tue, 27 Apr 2021 11:11:40 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7620dce0-9872-41c7-61c4-08d9096d3bcf
X-MS-TrafficTypeDiagnostic: AM6PR08MB3863:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR08MB38634412B6BFB5A38BEBAF3FC1419@AM6PR08MB3863.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:337;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: D5a/iqVeA8GkbNB5bg5LX0P+JEiMeIp3yqpLeMv/EV+YCPZF2F2Iay1+PxO05LUn5HnSYI5bc+vO4PboTYb+5IquaZMunpZNnRJAvkIDYjCoYvjD5wy/LmUEeLP9F/3RzJwWBzxiytI8fCRHwLnzh84QV6PaTZHDxPcUVlbUwKf7//jsYPEfgVfP5L7EPKMkXzoUARDsCjq50lF4e2MFlToIIu+pRyN6JoYrsLtwidWmximU1gFZpQ5xzC/ENBvprzSmKCVqIt0+JGIcdtaHPbVdahuqrwBZh3kTl15A0+sYAjAT2z+CAIkdYqvrO2zgpPxtMWTD+TID6xRpowQYpzq7n2oaZ7IVcciSkKu9RcIvVtfFdM9x1ciRmHPzpkwleKVZOUbKfk9Djzw5JzpGhUVea5O2LIGfB7GPD+jI8QXBXiApCyfTGoJQndg4mmGcE6HaJPdIu77ZNd1eSCzN2NIsMPOgYl1ot0lV7jxgsSLy3G8TO7BfzUPHlLgA2bJjItAofPllaNjwXa2Pd0MmD4PWl41cW923lhM1onTQ4VdeJqk39uZFwqYjhVMXMaeN/j09vv6mk7VMMSPZJz86EfeOGoln5n15cYWUwKUzuUqNd8ixaatyKnMPFhIqo3TsWno+wy1HyTZuzoOiz6E1+dyLDmAh7MVKJ4jcyB6V86tzagfXr+Sf8wvlYsvaEo5C6F1sn6DekWokXodhToTN3d2p4vP8jz9L+b7R2kuMvow=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(396003)(39840400004)(346002)(136003)(376002)(38100700002)(38350700002)(4326008)(66556008)(1076003)(6506007)(66476007)(36756003)(5660300002)(6916009)(478600001)(6666004)(107886003)(6486002)(52116002)(8676002)(66946007)(86362001)(8936002)(16526019)(186003)(26005)(956004)(2616005)(2906002)(83380400001)(6512007)(316002)(69590400013)(14143004);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?mirQLvjCoRNc46NYA945xdjjEx9A/GQKPnfr1QaJvYeao+xI5FvshVQPeoXQ?=
 =?us-ascii?Q?O1nco5/0D+D09Oz66sCc0JjQTGDiVIgX0xejZlc/yR15Ii5e2iLR9+a1zncG?=
 =?us-ascii?Q?VENcd4ELb7tIdER9vp/6CP6uYvhHeQINu1ujM8evfz9zxRqTEKzGAVV6sZyX?=
 =?us-ascii?Q?b+Bri+zCzTwQkS3l9EQO2yuWoP2Cp6PeaJNhBeqQ8AaY7Q1fi5d9WZqQ+lNZ?=
 =?us-ascii?Q?/h1PeoOvI4tyjVrBC5zZ3A6OGy1QxjzWpsE8pgKarj1qIGWr49dqrgCxWiMO?=
 =?us-ascii?Q?8WvNlZ6hTF7MXtzf8GWOq2i6cFmMz6fq3vJHLx23eN4JcU3CUPNGRFofuFz4?=
 =?us-ascii?Q?66JSRznV/jz+BZyW/U7gmn/Sm+lKYULR9SBjdHeBX4bAt3QmaI7JqKQ/4DGm?=
 =?us-ascii?Q?OSv/H8I1K7lcI9xLj2JrIJ1OmLvaqZKn5DoiHmKj1/5W6o/UZXLyyLA59Pu2?=
 =?us-ascii?Q?VBaiLCEsnRwB1xCXctiG3pJDcDdqON2zgJLOr3i93JSvCBuRTYZwIPvlVrAK?=
 =?us-ascii?Q?zDdkgVqS9okDh9FV3hOBtH9HvYZ/eJhTdaj5vQ1/RQQyWUiCGgJB1SGGs9KU?=
 =?us-ascii?Q?+y/tnRxTgt2G5gXEfCILAKUgm19AmqFVqYfYcvMGXRASgGidQQVZYVgsuZ4J?=
 =?us-ascii?Q?JKEAwjK9ZH2Omu5aniyyhfilZCIK0aASCtvifgoBVaAuLUD6c4CnRVmQ8KRU?=
 =?us-ascii?Q?aJq/QpY8zDjmeDTqA+SW/Nhrw/gBFnhGxeaT1fFNec3dIlC4kCx8zVa2EYic?=
 =?us-ascii?Q?BoJZtn5WFidBqD3pbE3JCUmdXFw66xOegP+nbps8uMywhqp3lRjXSvmdFhcL?=
 =?us-ascii?Q?yfPwlPG2dzYHv+idUzLEF08xKgpWr0t6xDf3xQQLtuJKMVDJB8NKLoapvq+c?=
 =?us-ascii?Q?7ZFZux4/axLrqeeNzcvEA270rRTAc1/LeMZHv2OFyN6W2qEwxVykhdO9ZLlV?=
 =?us-ascii?Q?9uacducsfle8vjZLRT/Az9rO76Bl7see/7/3RrETQVIIE68Tl67zbNqBrq0u?=
 =?us-ascii?Q?KURMG+0hd4BN5OiOS8cuhp6V6+Nau5ad0esxdUZ5iZL8fr91BmbPLpxCPoZG?=
 =?us-ascii?Q?0LsdLERR0y8Uw/7BDBR84RCgbnOPVI48+2+Y7L+7vxapgNhCEQaL8W76A+C0?=
 =?us-ascii?Q?S8AUEnY13Vn+G4uOVOvoVKyTFSg5W9l16Fnqu3+C7vEOTe5B47yXDPjApKC3?=
 =?us-ascii?Q?Fjvz750VV7hKt8/zXL2xU9THv16GrMGO+fpIZgtBnmqsxbZeZ1sJ0BmmMz65?=
 =?us-ascii?Q?FvYZPZidv80txdGS2Rol8bxi+9eRIMPJgODi5ARqDUwjkb3HnMjVSmaDvSyK?=
 =?us-ascii?Q?zY3U0MKgRG/yKPehZHO0Tn2I?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7620dce0-9872-41c7-61c4-08d9096d3bcf
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Apr 2021 11:11:41.1860 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xQ2FHFRvZEnWSh3JU/nbSd0n7yb0vr394DMaSCdl1KNHegW+duUTgPH4/Vh/1w46WS3rJ4JuN5u0pF+Py0uylDOT3qY48927jlQJgM8yAXs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB3863
Received-SPF: pass client-ip=40.107.7.115;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR04-HE1-obe.outbound.protection.outlook.com
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

Add possibility to merge allocation map of specified node into target
bitmap.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 qapi/block-core.json            | 31 +++++++++++++++++--
 include/block/block_int.h       |  4 +++
 block/dirty-bitmap.c            | 42 +++++++++++++++++++++++++
 block/monitor/bitmap-qmp-cmds.c | 55 ++++++++++++++++++++++++++++-----
 4 files changed, 122 insertions(+), 10 deletions(-)

diff --git a/qapi/block-core.json b/qapi/block-core.json
index 6d227924d0..0fafb043bc 100644
--- a/qapi/block-core.json
+++ b/qapi/block-core.json
@@ -2006,6 +2006,32 @@
   'data': { 'node': 'str', 'name': 'str', '*granularity': 'uint32',
             '*persistent': 'bool', '*disabled': 'bool' } }
 
+##
+# @AllocationMapMode:
+#
+# An enumeration of possible allocation maps that could be merged into target
+# bitmap.
+#
+# @top: The allocation status of the top layer of the attached storage node.
+#
+# Since: 6.1
+##
+{ 'enum': 'AllocationMapMode',
+  'data': ['top'] }
+
+##
+# @BlockDirtyBitmapMergeExternalSource:
+#
+# @node: name of device/node which the bitmap is tracking
+#
+# @name: name of the dirty bitmap
+#
+# Since: 6.1
+##
+{ 'struct': 'BlockDirtyBitmapMergeExternalSource',
+  'data': { 'node': 'str', '*name': 'str',
+            '*allocation-map': 'AllocationMapMode' } }
+
 ##
 # @BlockDirtyBitmapMergeSource:
 #
@@ -2017,7 +2043,7 @@
 ##
 { 'alternate': 'BlockDirtyBitmapMergeSource',
   'data': { 'local': 'str',
-            'external': 'BlockDirtyBitmap' } }
+            'external': 'BlockDirtyBitmapMergeExternalSource' } }
 
 ##
 # @BlockDirtyBitmapMerge:
@@ -2176,7 +2202,8 @@
 #
 ##
 { 'command': 'block-dirty-bitmap-merge',
-  'data': 'BlockDirtyBitmapMerge' }
+  'data': 'BlockDirtyBitmapMerge',
+  'coroutine': true }
 
 ##
 # @BlockDirtyBitmapSha256:
diff --git a/include/block/block_int.h b/include/block/block_int.h
index 88e4111939..b5aeaef425 100644
--- a/include/block/block_int.h
+++ b/include/block/block_int.h
@@ -1361,6 +1361,10 @@ bool bdrv_dirty_bitmap_merge_internal(BdrvDirtyBitmap *dest,
                                       const BdrvDirtyBitmap *src,
                                       HBitmap **backup, bool lock);
 
+int bdrv_merge_allocation_top_to_dirty_bitmap(BdrvDirtyBitmap *dest,
+                                              BlockDriverState *bs,
+                                              Error **errp);
+
 void bdrv_inc_in_flight(BlockDriverState *bs);
 void bdrv_dec_in_flight(BlockDriverState *bs);
 
diff --git a/block/dirty-bitmap.c b/block/dirty-bitmap.c
index 68d295d6e3..78097e30c5 100644
--- a/block/dirty-bitmap.c
+++ b/block/dirty-bitmap.c
@@ -914,6 +914,48 @@ out:
     }
 }
 
+int bdrv_merge_allocation_top_to_dirty_bitmap(BdrvDirtyBitmap *dest,
+                                              BlockDriverState *bs,
+                                              Error **errp)
+{
+    int ret;
+    int64_t offset = 0;
+    int64_t bytes = bdrv_getlength(bs);
+
+    if (bytes < 0) {
+        error_setg(errp, "Failed to get length of node '%s'",
+                   bdrv_get_node_name(bs));
+        return bytes;
+    }
+
+    if (bdrv_dirty_bitmap_size(dest) < bytes) {
+        error_setg(errp, "Bitmap is smaller than node '%s'",
+                   bdrv_get_node_name(bs));
+        return -EINVAL;
+    }
+
+    while (bytes) {
+        int64_t cur_bytes = bytes;
+
+        ret = bdrv_is_allocated(bs, offset, cur_bytes, &cur_bytes);
+        if (ret < 0) {
+            error_setg(errp,
+                       "Failed to get block allocation status of node '%s'",
+                       bdrv_get_node_name(bs));
+            return ret;
+        }
+
+        if (ret) {
+            bdrv_set_dirty_bitmap(dest, offset, cur_bytes);
+        }
+
+        bytes -= cur_bytes;
+        offset += cur_bytes;
+    }
+
+    return 0;
+}
+
 /**
  * bdrv_dirty_bitmap_merge_internal: merge src into dest.
  * Does NOT check bitmap permissions; not suitable for use as public API.
diff --git a/block/monitor/bitmap-qmp-cmds.c b/block/monitor/bitmap-qmp-cmds.c
index 9f11deec64..19845a22c4 100644
--- a/block/monitor/bitmap-qmp-cmds.c
+++ b/block/monitor/bitmap-qmp-cmds.c
@@ -34,6 +34,7 @@
 
 #include "block/block_int.h"
 #include "qapi/qapi-commands-block.h"
+#include "qapi/qapi-types-block-core.h"
 #include "qapi/error.h"
 
 /**
@@ -273,8 +274,11 @@ BdrvDirtyBitmap *block_dirty_bitmap_merge(const char *node, const char *target,
     }
 
     for (lst = bms; lst; lst = lst->next) {
+        src = NULL;
+
         switch (lst->value->type) {
             const char *name, *node;
+            bool has_alloc, has_name;
         case QTYPE_QSTRING:
             name = lst->value->u.local;
             src = bdrv_find_dirty_bitmap(bs, name);
@@ -286,22 +290,57 @@ BdrvDirtyBitmap *block_dirty_bitmap_merge(const char *node, const char *target,
             break;
         case QTYPE_QDICT:
             node = lst->value->u.external.node;
-            name = lst->value->u.external.name;
-            src = block_dirty_bitmap_lookup(node, name, NULL, errp);
-            if (!src) {
+            has_name = lst->value->u.external.has_name;
+            has_alloc = lst->value->u.external.has_allocation_map;
+            if (has_name == has_alloc) {
+                error_setg(errp, "Exactly one of @name and @allocation-map "
+                           "fields must be specified.");
                 dst = NULL;
                 goto out;
             }
+            if (has_name) {
+                name = lst->value->u.external.name;
+                src = block_dirty_bitmap_lookup(node, name, NULL, errp);
+                if (!src) {
+                    dst = NULL;
+                    goto out;
+                }
+            } else {
+                int ret;
+                AioContext *old_ctx;
+                assert(has_alloc);
+                /* The only existing mode currently is 'top' */
+                assert(lst->value->u.external.allocation_map ==
+                       ALLOCATION_MAP_MODE_TOP);
+
+                bs = bdrv_lookup_bs(node, node, NULL);
+                if (!bs) {
+                    error_setg(errp, "Node '%s' not found", node);
+                    dst = NULL;
+                    goto out;
+                }
+
+                old_ctx = bdrv_co_enter(bs);
+                ret = bdrv_merge_allocation_top_to_dirty_bitmap(anon, bs, errp);
+                bdrv_co_leave(bs, old_ctx);
+
+                if (ret < 0) {
+                    dst = NULL;
+                    goto out;
+                }
+            }
             break;
         default:
             abort();
         }
 
-        bdrv_merge_dirty_bitmap(anon, src, NULL, &local_err);
-        if (local_err) {
-            error_propagate(errp, local_err);
-            dst = NULL;
-            goto out;
+        if (src) {
+            bdrv_merge_dirty_bitmap(anon, src, NULL, &local_err);
+            if (local_err) {
+                error_propagate(errp, local_err);
+                dst = NULL;
+                goto out;
+            }
         }
     }
 
-- 
2.29.2


