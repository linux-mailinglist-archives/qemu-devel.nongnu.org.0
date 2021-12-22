Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E4DD47D625
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Dec 2021 18:55:30 +0100 (CET)
Received: from localhost ([::1]:56534 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n05po-0005iu-N0
	for lists+qemu-devel@lfdr.de; Wed, 22 Dec 2021 12:55:28 -0500
Received: from eggs.gnu.org ([209.51.188.92]:52538)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1n05bd-0000m9-Mg; Wed, 22 Dec 2021 12:40:49 -0500
Received: from mail-vi1eur05on2133.outbound.protection.outlook.com
 ([40.107.21.133]:46561 helo=EUR05-VI1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1n05ba-0002Xs-SR; Wed, 22 Dec 2021 12:40:49 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mJI/SljCmIDGhiPXKdOA8V+2wvT3Qoln0d4YjahpgU3kUZXS+fLPYPJymnH7rDEXOVDecHNby/Z0XyUqoF3auCj6evQDWhuODBfsD5JAaqGlo9gTkpOofQsvAlGedVHVLW+R6utfCJUxjWl3kyvZwlGKpjCh+eShnWGTCQ8Gs0je8Sil7m9OUbFuOSmdPnFX5n/KQWS3gYwdNUp+Z5WduGYtW5GFrVOtJBMvKpy4fhTbSgv6YKwkFsmzFK8lOHvqSJGr7ERk+Y20vI7nTtYuUE3dYa5FroV0/BlmrB7rTm2YBjuaXsJZsYJx1MSdZQPmr67ucXTjfNJpBHCA0NjPVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UmflLzZBTAU1snzUjeZl36iVtlE9noG60L8d7L71WY8=;
 b=U/wCNbKdvCJd9874k8tdu7uv+Y/0mZwK5bteg6ZzZIL9axVPEH3onZIA3yvuyF29zbB4eQuXEioZ5uC701lhNmczbCShAlEz+5dXrRNFIAhl8yC0klOsERdzVLx6p7ZGxBaTRr2O13gnMvpt6v8NeZ6sOL6YGPvmDkC1FGSAwJmx/KTIJ5rXkiCMZX/x7kqIQjQRrwGWQMssoEkaVw1UV6BFBBVHOfRI5wTKRaG2rNQpHu9H80Ph5XY8gdVRFiI9daiXktax3i1wmHmJe80yj8Hbv/V9Az8esGiHeKGgFM+2NKgYcE4fHbe09LgK10vNLvYGsuSt733y19loDMyL1A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UmflLzZBTAU1snzUjeZl36iVtlE9noG60L8d7L71WY8=;
 b=BPqP2kFo+oZ1CIAHQXhrVwa4jqkBBJi3eFC+rvQnss1wjmf176hD86AzJyQnuftxyc0WhPdnjH+W6ZJd0B9orcQU5e7ktv85o5sPxL3jtv9gone72ATDTS8zVUdiBw2gGupTS8/FJ8W2MNv/sFBpsgdRH+tx4VjCQKwmybiXhVU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from DB9PR08MB6748.eurprd08.prod.outlook.com (2603:10a6:10:2a7::16)
 by DB8PR08MB3964.eurprd08.prod.outlook.com (2603:10a6:10:a4::25) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4801.17; Wed, 22 Dec
 2021 17:40:40 +0000
Received: from DB9PR08MB6748.eurprd08.prod.outlook.com
 ([fe80::a89f:c7bc:b9f8:fc3e]) by DB9PR08MB6748.eurprd08.prod.outlook.com
 ([fe80::a89f:c7bc:b9f8:fc3e%6]) with mapi id 15.20.4823.019; Wed, 22 Dec 2021
 17:40:40 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, armbru@redhat.com, xiechanglong.d@gmail.com,
 wencongyang2@huawei.com, eblake@redhat.com, hreitz@redhat.com,
 kwolf@redhat.com, vsementsov@virtuozzo.com, jsnow@redhat.com,
 nikita.lapshin@virtuozzo.com
Subject: [PATCH v3 10/19] block: introduce fleecing block driver
Date: Wed, 22 Dec 2021 18:40:09 +0100
Message-Id: <20211222174018.257550-11-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211222174018.257550-1-vsementsov@virtuozzo.com>
References: <20211222174018.257550-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: AS8P250CA0017.EURP250.PROD.OUTLOOK.COM
 (2603:10a6:20b:330::22) To DB9PR08MB6748.eurprd08.prod.outlook.com
 (2603:10a6:10:2a7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2d59649a-9984-4901-3178-08d9c5722bd9
X-MS-TrafficTypeDiagnostic: DB8PR08MB3964:EE_
X-Microsoft-Antispam-PRVS: <DB8PR08MB39641F7169B64B7068454362C17D9@DB8PR08MB3964.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6790;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 3bqmxx47iIy75zsOgLmYJHz2es30F63ABAeIPuyI0gjKx6FHLyJRlxCtciQ376RirbBQuaSIT0hX8o4xvMTCNfw0K4GICk6jBryFjtfnBc8qG7B5XKcStwXeJXszj78WUBPeyfGGM+xFaQSdt2eh8jmZIaqINvkrmFyyy41PS3tD7azpXLrf6trOnnYK5RlkASNBRKsYjlp4GHgtWmsYh9h4fIMpP/S8AzX1LppzhVTyZT03iPeZtrBlLx6jSr8PvDMCAPlDTM0H+eMzUBuMKUcpma+MMYtAeaTqaD0Ma6LugRwHO1pyJzFChtLchnM24l9LYJYdMMtJl4pqzQ5TRElF5Lb5dRkvURrJzJEa2gNiT8mn9j8LSMcItqy6HOOG0e9Of9N7q3mesLtIZtsnLfNUvi0ZEr+xSLBw73dVeuG7sL6QnpNxslmwj3yGf1K6D40CIiFt94OOKuZ8eT1zY0+oEkLPZw9ceTrOQSGdX0yYdcnu5jbkgIT60P0+6KxkHvbYeqvTeBETCRiZ8gfhuPTlT8ZfLa8utczFuVMjKKmYDnQ+xqlqVNMAp4ufdRmz973aWdRF/tXE8mvpMJVvlAB5HAfpSZWQ5qxIwkNSmHFgzKKyYycsOIadaD+qafmpcsHnV3I7rrB2IXt1qmhb8U+bpkDUsLXsIpUcEfXBQRaPu97sjaGeVpMbJd+5GdGiMCC6+d9l8Bu1b+vAdM9FPqV6UO6J/YPQUs2L95xH68GX4p/JaH5EnY7H4mmSUg4KK77jyNrFjrJTgXpHWdRJ0itHGBAOQR4QwDkeEhGMBZ/Jv3bzzsHpv5Y1UOJLSoeS
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DB9PR08MB6748.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(107886003)(6512007)(6506007)(26005)(316002)(52116002)(2906002)(30864003)(186003)(508600001)(6486002)(6916009)(4326008)(2616005)(8936002)(5660300002)(6666004)(8676002)(1076003)(38100700002)(38350700002)(86362001)(83380400001)(66946007)(66476007)(66556008)(36756003)(2004002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?TtujZrd5dbmwuasaGTKmfnGLUIkQN9alAPt4psDpjUjjKgvqDNFB/z3pNB6k?=
 =?us-ascii?Q?vooF/igz3tRgzeGO4gYqOqFQbtBGEfPvB4JiioAaNRPy28Y9za7T0sbdN/In?=
 =?us-ascii?Q?TDFqN7/pqtNJaj2a9Z1n4G6XB4LGISoBTMliIqwgSpYxQ2gkh7nrEv6Wex12?=
 =?us-ascii?Q?SejKzuIDtIPfF8ezz1flE/IIz4Vzen2cLmxUdbZlr+xHkn1+IGVXo4bOR/60?=
 =?us-ascii?Q?oFfzOem7aRQnL0kiY/bK0y1JRvoiu4jgXShSR82KnqcWnpBdeC2vxHjEjnWv?=
 =?us-ascii?Q?djHKmt6rR+hLe1jX5BSE90Ix3j+aT9yfFeMp0eUk+XmOSDrI7DYhl3U8Q+En?=
 =?us-ascii?Q?92EU7ocv1OKz22IcJIY26ACdrI7IflOCKKpnBA1CA7Dl8d/1SrhefUMUS963?=
 =?us-ascii?Q?79fE29uZwSayb5JXqkMX4w4bnDr7h9168S0N9IwSn96Irr2oYDtqTb70lrXI?=
 =?us-ascii?Q?8qTRaeKGX+pQy/Psh/QTgg6pFcGEfloQeqXZ0E8ftW1syET7B12qlQl/CL7h?=
 =?us-ascii?Q?mlwI9mmJiuxfmRK6coXUkP06tHWoKODwMz1hxVna9QXXsZc1PJGnKK3jaDRj?=
 =?us-ascii?Q?Pr0CuNMpIm7bU+uA6OQueV7CLV9T0Igy52kQvN9xM4F5ggPp9+cW3RRCiWV/?=
 =?us-ascii?Q?SOOnF9jB6OBnafJgm6toxa6GR9RRx34qcPj3t3S78v0Nwjn0PySMy57bfk6+?=
 =?us-ascii?Q?NDzctHqhKhG82Ln3B3IbSso6SR8VPOYfJNJWOvYsWeas8EE42FAHg0r5qRTI?=
 =?us-ascii?Q?FLejnv+YZB8s5WES4uzTU7nNMlYWB8XDr+CP1bEjM2iqqmV+vHraqqXp52mb?=
 =?us-ascii?Q?0tAa/19KWzPfCxBnFJJm95mTnQeCz9Djx4vrN6hRTfBvW9MxLH7xnXAWdfco?=
 =?us-ascii?Q?Psq2+Qd5Myh/nz5gMseIGA7eQK2iIVBSCXSzprB5avlxoMyZuPoL3WMj7HqL?=
 =?us-ascii?Q?CfBeTIWPLezDkQluKt/RnjKPljiXXUQT5lEyinLl/wEO55prqaQ9DksoyFKO?=
 =?us-ascii?Q?Aaqcw15SRpBmJRyv/7H6n/N7NPJCuicdRfW0ZC6QoslHdkdurHd4iIl7ubV9?=
 =?us-ascii?Q?C5zDEXm2fv9NvcoBad5ZRGY3pPZ59Z1DAYlhLHL1KVkBoWnSm3zFCnoLP7m7?=
 =?us-ascii?Q?UB9iS6N0wYO6SBbrXEF8ZQ/KryL4KqKs+7x+O2jm3xgD5NZk3Gzyd84fPpVS?=
 =?us-ascii?Q?zGhHQgClpV4A1vbvKb1c7eUeXUzcROj0XZwmQikU1bWsVgplLoKG4KGHsbIA?=
 =?us-ascii?Q?iAVqGmj9zvVI3mFW8fny+NQvq/JqL+tFMatzwbXu4iY8Ftw07no3UTxJKroO?=
 =?us-ascii?Q?KKYr02UicDCHo0VfZ70B9Mb5S/ywFSBSABs57xmDJXajqVb2reS4kwtTpHVC?=
 =?us-ascii?Q?EgTpaccVQP0DMh2iDVHFMqW1DFE1IGREQGna+zlzPOqFnseMjA7hLk6nWreM?=
 =?us-ascii?Q?NGaS+Q3qz+x/PEtG5TGlqiudpDV9WYwi8sbcTufbCZs7mE68v+cs8URbo5Jf?=
 =?us-ascii?Q?8suIxlU0aDT/+xSGUUVWC1mhYH7i730kmbKy9PP7cpfdUI8Xz8WJnYLXe6AY?=
 =?us-ascii?Q?0dxEj4/tsGoik5vjUm7TV9JSpFkimQwiFGtzJWTGw/wYcA81ZBMLPMgjDhQR?=
 =?us-ascii?Q?3xKkZNENC5gZB78QQrAHakGmhbpoBMPOlHUkFQ0SaBJI43WhjOUIdJ60P1+r?=
 =?us-ascii?Q?xyzD3l3VUPcpxqPKINULCs942G8=3D?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2d59649a-9984-4901-3178-08d9c5722bd9
X-MS-Exchange-CrossTenant-AuthSource: DB9PR08MB6748.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Dec 2021 17:40:40.4277 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: n3gEbVHXwzMiv8UZWYuhNp5xYJAC9heit2FkxVGBsmlNf7b3j4c0d1vPCv1TrInw7D34/IoL+EEFOVmRKZB0wl8l0K9fAmPROnSycUxWNLQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR08MB3964
Received-SPF: pass client-ip=40.107.21.133;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR05-VI1-obe.outbound.protection.outlook.com
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

Introduce a new driver, that works in pair with copy-before-write to
improve fleecing.

Without fleecing driver, old fleecing scheme looks as follows:

[guest]
  |
  |root
  v
[copy-before-write] -----> [temp.qcow2] <--- [nbd export]
  |                 target  |
  |file                     |backing
  v                         |
[active disk] <-------------+

With fleecing driver, new scheme is:

[guest]
  |
  |root
  v
[copy-before-write] -----> [fleecing] <--- [nbd export]
  |                 target  |    |
  |file                     |    |file
  v                         |    v
[active disk]<--source------+  [temp.img]

Benefits of new scheme:

1. Access control: if remote client try to read data that not covered
   by original dirty bitmap used on copy-before-write open, client gets
   -EACCES.

2. Discard support: if remote client do DISCARD, this additionally to
   discarding data in temp.img informs block-copy process to not copy
   these clusters. Next read from discarded area will return -EACCES.
   This is significant thing: when fleecing user reads data that was
   not yet copied to temp.img, we can avoid copying it on further guest
   write.

3. Synchronisation between client reads and block-copy write is more
   efficient: it doesn't block intersecting block-copy write during
   client read.

4. We don't rely on backing feature: active disk should not be backing
   of temp image, so we avoid some permission-related difficulties and
   temp image now is not required to support backing, it may be simple
   raw image.

Note that now nobody calls fleecing_drv_activate(), so new driver is
actually unusable. It's a work for the following patch: support
fleecing block driver in copy-before-write filter driver.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 qapi/block-core.json |  37 +++++-
 block/fleecing.h     |  16 +++
 block/fleecing-drv.c | 261 +++++++++++++++++++++++++++++++++++++++++++
 MAINTAINERS          |   1 +
 block/meson.build    |   1 +
 5 files changed, 315 insertions(+), 1 deletion(-)
 create mode 100644 block/fleecing-drv.c

diff --git a/qapi/block-core.json b/qapi/block-core.json
index 6904daeacf..b47351dbac 100644
--- a/qapi/block-core.json
+++ b/qapi/block-core.json
@@ -2917,13 +2917,14 @@
 # @blkreplay: Since 4.2
 # @compress: Since 5.0
 # @copy-before-write: Since 6.2
+# @fleecing: Since 7.0
 #
 # Since: 2.9
 ##
 { 'enum': 'BlockdevDriver',
   'data': [ 'blkdebug', 'blklogwrites', 'blkreplay', 'blkverify', 'bochs',
             'cloop', 'compress', 'copy-before-write', 'copy-on-read', 'dmg',
-            'file', 'ftp', 'ftps', 'gluster',
+            'file', 'fleecing', 'ftp', 'ftps', 'gluster',
             {'name': 'host_cdrom', 'if': 'HAVE_HOST_BLOCK_DEVICE' },
             {'name': 'host_device', 'if': 'HAVE_HOST_BLOCK_DEVICE' },
             'http', 'https', 'iscsi',
@@ -4181,6 +4182,39 @@
   'base': 'BlockdevOptionsGenericFormat',
   'data': { 'target': 'BlockdevRef', '*bitmap': 'BlockDirtyBitmap' } }
 
+##
+# @BlockdevOptionsFleecing:
+#
+# Driver that works in pair with copy-before-write filter to make a fleecing
+# scheme like this:
+#
+#    [guest]
+#      |
+#      |root
+#      v
+#    [copy-before-write] -----> [fleecing] <--- [nbd export]
+#      |                 target  |    |
+#      |file                     |    |file
+#      v                         |    v
+#    [active disk]<--source------+  [temp.img]
+#
+# The scheme works like this: on write, fleecing driver saves data to its
+# ``file`` child and remember that this data is in ``file`` child. On read
+# fleecing reads from ``file`` child if data is already stored to it and
+# otherwise it reads from ``source`` child.
+# In the same time, before each guest write, ``copy-before-write`` copies
+# corresponding old data  from ``active disk`` to ``fleecing`` node.
+# This way, ``fleecing`` node looks like a kind of snapshot for extenal
+# reader like NBD export.
+#
+# @source: node name of source node of fleecing scheme
+#
+# Since: 7.0
+##
+{ 'struct': 'BlockdevOptionsFleecing',
+  'base': 'BlockdevOptionsGenericFormat',
+  'data': { 'source': 'str' } }
+
 ##
 # @BlockdevOptions:
 #
@@ -4237,6 +4271,7 @@
       'copy-on-read':'BlockdevOptionsCor',
       'dmg':        'BlockdevOptionsGenericFormat',
       'file':       'BlockdevOptionsFile',
+      'fleecing':   'BlockdevOptionsFleecing',
       'ftp':        'BlockdevOptionsCurlFtp',
       'ftps':       'BlockdevOptionsCurlFtps',
       'gluster':    'BlockdevOptionsGluster',
diff --git a/block/fleecing.h b/block/fleecing.h
index fb7b2f86c4..75ad2f8b19 100644
--- a/block/fleecing.h
+++ b/block/fleecing.h
@@ -80,6 +80,9 @@
 #include "block/block-copy.h"
 #include "block/reqlist.h"
 
+
+/* fleecing.c */
+
 typedef struct FleecingState FleecingState;
 
 /*
@@ -132,4 +135,17 @@ void fleecing_discard(FleecingState *f, int64_t offset, int64_t bytes);
 void fleecing_mark_done_and_wait_readers(FleecingState *f, int64_t offset,
                                          int64_t bytes);
 
+
+/* fleecing-drv.c */
+
+/* Returns true if @bs->drv is fleecing block driver */
+bool is_fleecing_drv(BlockDriverState *bs);
+
+/*
+ * Normally FleecingState is created by copy-before-write filter. Then
+ * copy-before-write filter calls fleecing_drv_activate() to share FleecingState
+ * with fleecing block driver.
+ */
+void fleecing_drv_activate(BlockDriverState *bs, FleecingState *fleecing);
+
 #endif /* FLEECING_H */
diff --git a/block/fleecing-drv.c b/block/fleecing-drv.c
new file mode 100644
index 0000000000..202208bb03
--- /dev/null
+++ b/block/fleecing-drv.c
@@ -0,0 +1,261 @@
+/*
+ * fleecing block driver
+ *
+ * Copyright (c) 2021 Virtuozzo International GmbH.
+ *
+ * Author:
+ *  Sementsov-Ogievskiy Vladimir <vsementsov@virtuozzo.com>
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License as published by
+ * the Free Software Foundation; either version 2 of the License, or
+ * (at your option) any later version.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ * GNU General Public License for more details.
+ *
+ * You should have received a copy of the GNU General Public License
+ * along with this program. If not, see <http://www.gnu.org/licenses/>.
+ */
+
+#include "qemu/osdep.h"
+
+#include "sysemu/block-backend.h"
+#include "qemu/cutils.h"
+#include "qapi/error.h"
+#include "block/block_int.h"
+#include "block/coroutines.h"
+#include "block/qdict.h"
+#include "block/block-copy.h"
+#include "block/reqlist.h"
+
+#include "block/copy-before-write.h"
+#include "block/fleecing.h"
+
+typedef struct BDRVFleecingState {
+    FleecingState *fleecing;
+    BdrvChild *source;
+} BDRVFleecingState;
+
+static coroutine_fn int fleecing_co_preadv_part(
+        BlockDriverState *bs, int64_t offset, int64_t bytes,
+        QEMUIOVector *qiov, size_t qiov_offset, BdrvRequestFlags flags)
+{
+    BDRVFleecingState *s = bs->opaque;
+    const BlockReq *req;
+    int ret;
+
+    if (!s->fleecing) {
+        /* fleecing_drv_activate() was not called */
+        return -EINVAL;
+    }
+
+    /* TODO: upgrade to async loop using AioTask */
+    while (bytes) {
+        int64_t cur_bytes;
+
+        ret = fleecing_read_lock(s->fleecing, offset, bytes, &req, &cur_bytes);
+        if (ret < 0) {
+            return ret;
+        }
+
+        if (req) {
+            ret = bdrv_co_preadv_part(s->source, offset, cur_bytes,
+                                      qiov, qiov_offset, flags);
+            fleecing_read_unlock(s->fleecing, req);
+        } else {
+            ret = bdrv_co_preadv_part(bs->file, offset, cur_bytes,
+                                      qiov, qiov_offset, flags);
+        }
+        if (ret < 0) {
+            return ret;
+        }
+
+        bytes -= cur_bytes;
+        offset += cur_bytes;
+        qiov_offset += cur_bytes;
+    }
+
+    return 0;
+}
+
+static int coroutine_fn fleecing_co_block_status(BlockDriverState *bs,
+                                                 bool want_zero, int64_t offset,
+                                                 int64_t bytes, int64_t *pnum,
+                                                 int64_t *map,
+                                                 BlockDriverState **file)
+{
+    BDRVFleecingState *s = bs->opaque;
+    const BlockReq *req = NULL;
+    int ret;
+    int64_t cur_bytes;
+
+    if (!s->fleecing) {
+        /* fleecing_drv_activate() was not called */
+        return -EINVAL;
+    }
+
+    ret = fleecing_read_lock(s->fleecing, offset, bytes, &req, &cur_bytes);
+    if (ret < 0) {
+        return ret;
+    }
+
+    *pnum = cur_bytes;
+    *map = offset;
+
+    if (req) {
+        *file = s->source->bs;
+        fleecing_read_unlock(s->fleecing, req);
+    } else {
+        *file = bs->file->bs;
+    }
+
+    return ret;
+}
+
+static int coroutine_fn fleecing_co_pdiscard(BlockDriverState *bs,
+                                             int64_t offset, int64_t bytes)
+{
+    BDRVFleecingState *s = bs->opaque;
+    if (!s->fleecing) {
+        /* fleecing_drv_activate() was not called */
+        return -EINVAL;
+    }
+
+    fleecing_discard(s->fleecing, offset, bytes);
+
+    bdrv_co_pdiscard(bs->file, offset, bytes);
+
+    /*
+     * Ignore bdrv_co_pdiscard() result: fleecing_discard() succeeded, that
+     * means that next read from this area will fail with -EACCES. More correct
+     * to report success now.
+     */
+    return 0;
+}
+
+static int coroutine_fn fleecing_co_pwrite_zeroes(BlockDriverState *bs,
+        int64_t offset, int64_t bytes, BdrvRequestFlags flags)
+{
+    BDRVFleecingState *s = bs->opaque;
+    if (!s->fleecing) {
+        /* fleecing_drv_activate() was not called */
+        return -EINVAL;
+    }
+
+    /*
+     * TODO: implement cache, to have a chance to fleecing user to read and
+     * discard this data before actual writing to temporary image.
+     */
+    return bdrv_co_pwrite_zeroes(bs->file, offset, bytes, flags);
+}
+
+static coroutine_fn int fleecing_co_pwritev(BlockDriverState *bs,
+                                            int64_t offset,
+                                            int64_t bytes,
+                                            QEMUIOVector *qiov,
+                                            BdrvRequestFlags flags)
+{
+    BDRVFleecingState *s = bs->opaque;
+    if (!s->fleecing) {
+        /* fleecing_drv_activate() was not called */
+        return -EINVAL;
+    }
+
+    /*
+     * TODO: implement cache, to have a chance to fleecing user to read and
+     * discard this data before actual writing to temporary image.
+     */
+    return bdrv_co_pwritev(bs->file, offset, bytes, qiov, flags);
+}
+
+
+static void fleecing_refresh_filename(BlockDriverState *bs)
+{
+    pstrcpy(bs->exact_filename, sizeof(bs->exact_filename),
+            bs->file->bs->filename);
+}
+
+static int fleecing_open(BlockDriverState *bs, QDict *options, int flags,
+                         Error **errp)
+{
+    BDRVFleecingState *s = bs->opaque;
+
+    bs->file = bdrv_open_child(NULL, options, "file", bs, &child_of_bds,
+                               BDRV_CHILD_DATA | BDRV_CHILD_PRIMARY,
+                               false, errp);
+    if (!bs->file) {
+        return -EINVAL;
+    }
+
+    s->source = bdrv_open_child(NULL, options, "source", bs, &child_of_bds,
+                               BDRV_CHILD_DATA, false, errp);
+    if (!s->source) {
+        return -EINVAL;
+    }
+
+    bs->total_sectors = bs->file->bs->total_sectors;
+
+    return 0;
+}
+
+static void fleecing_child_perm(BlockDriverState *bs, BdrvChild *c,
+                                BdrvChildRole role,
+                                BlockReopenQueue *reopen_queue,
+                                uint64_t perm, uint64_t shared,
+                                uint64_t *nperm, uint64_t *nshared)
+{
+    bdrv_default_perms(bs, c, role, reopen_queue, perm, shared, nperm, nshared);
+
+    if (role & BDRV_CHILD_PRIMARY) {
+        *nshared &= BLK_PERM_CONSISTENT_READ;
+    } else {
+        *nperm &= BLK_PERM_CONSISTENT_READ;
+
+        /*
+         * copy-before-write filter is responsible for source child and need
+         * write access to it.
+         */
+        *nshared |= BLK_PERM_WRITE;
+    }
+}
+
+BlockDriver bdrv_fleecing_drv = {
+    .format_name = "fleecing",
+    .instance_size = sizeof(BDRVFleecingState),
+
+    .bdrv_open                  = fleecing_open,
+
+    .bdrv_co_preadv_part        = fleecing_co_preadv_part,
+    .bdrv_co_pwritev            = fleecing_co_pwritev,
+    .bdrv_co_pwrite_zeroes      = fleecing_co_pwrite_zeroes,
+    .bdrv_co_pdiscard           = fleecing_co_pdiscard,
+    .bdrv_co_block_status       = fleecing_co_block_status,
+
+    .bdrv_refresh_filename      = fleecing_refresh_filename,
+
+    .bdrv_child_perm            = fleecing_child_perm,
+};
+
+bool is_fleecing_drv(BlockDriverState *bs)
+{
+    return bs && bs->drv == &bdrv_fleecing_drv;
+}
+
+void fleecing_drv_activate(BlockDriverState *bs, FleecingState *fleecing)
+{
+    BDRVFleecingState *s = bs->opaque;
+
+    assert(is_fleecing_drv(bs));
+
+    s->fleecing = fleecing;
+}
+
+static void fleecing_init(void)
+{
+    bdrv_register(&bdrv_fleecing_drv);
+}
+
+block_init(fleecing_init);
diff --git a/MAINTAINERS b/MAINTAINERS
index 78ea04e292..42dc979052 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2425,6 +2425,7 @@ F: block/copy-before-write.h
 F: block/copy-before-write.c
 F: block/fleecing.h
 F: block/fleecing.c
+F: block/fleecing-drv.c
 F: include/block/aio_task.h
 F: block/aio_task.c
 F: util/qemu-co-shared-resource.c
diff --git a/block/meson.build b/block/meson.build
index d30da90a01..b493580fbe 100644
--- a/block/meson.build
+++ b/block/meson.build
@@ -19,6 +19,7 @@ block_ss.add(files(
   'dirty-bitmap.c',
   'filter-compress.c',
   'fleecing.c',
+  'fleecing-drv.c',
   'io.c',
   'mirror.c',
   'nbd.c',
-- 
2.31.1


