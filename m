Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E83CB3F9EF9
	for <lists+qemu-devel@lfdr.de>; Fri, 27 Aug 2021 20:38:40 +0200 (CEST)
Received: from localhost ([::1]:59020 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mJgkR-0003G2-V5
	for lists+qemu-devel@lfdr.de; Fri, 27 Aug 2021 14:38:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33748)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mJgRF-0001BJ-M9; Fri, 27 Aug 2021 14:18:51 -0400
Received: from mail-eopbgr20112.outbound.protection.outlook.com
 ([40.107.2.112]:14422 helo=EUR02-VE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mJgRC-0006cC-EF; Fri, 27 Aug 2021 14:18:48 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HyLPI4N8xEhpApHIv95j/A32G50ejmDwK2Avc2GY0B6DZJoEf3QTozZMGCvzHJk9tulYHcy7dwVPBiAqyIRRQJQaGjyXNz0dFDZkyrkQx63578miO9ypXSmXQBY0ioK0YZHToMAf/y5IA6gY3s6g199Jz6hxl2GtvY0JCsJ3lG6Cye8H8+nUhCBsMuhEGNMoEj3VLB4/JfKHvhX0FAjRl0qReyk3lxJ6yPhsjSa87f/P3RjyFKGhH8pbJOplGSH2yx4tlH7oWOpxCKQSfSbE39rfc+3Fg4bGTglDwvnlcqs6T5oj4iptolET9u7Ph75HgE6f2DAWUTiAKAuFNNQUQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dJwsSMpxre8rPTk3/yhoKFut5BoKBXJ29NtDUk3IrbQ=;
 b=bUisssrH+5b9euRSt2SabgJtVVINHI5oyHpb9pMk/Anr1GQ+vBztX9SC2sC3Bwy0TANvVqiBUd9+t7VWo11hDXxTl5Ohm7EzRkuUQ9HuE+/59Q/Tgc1LGpqiWXdAmmn12LE2un4cLfhKTVCiLBnq7TRh5OUStdsr7X1NZvLVJAF1WI3LBKRSDPAVQpZdRQDXeBYGxR8z/PRNuHvXTgy7QbwUaNTwQCKpwKBu4GHWiC74R6g4thvVaM1kjqkc5Evxq7IemJyskHE0v3QIUQ2MT3jMlxRjaKZ9XW5z+B/ZwrwlrYvi/t5SWuKTDdS+kiY1yqR6GGzn5X6IfaVSaLYEMQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dJwsSMpxre8rPTk3/yhoKFut5BoKBXJ29NtDUk3IrbQ=;
 b=P2FjsiiBZWP85+QZ8voQSzKD4IkHQEUNsZenDbuhEXKsimLRv3ERTmpzkrgk2bt7qD3QHeZ5wEhYXEQrM30Z7W173gE1/s4/Ltj+iMD7GfZE4bLyOXqCBNCjpy7WUIZAbTKbWCYtYUZKFMijSfzlIXJZtA2YKgZlqXjlXgvNY2Q=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB3765.eurprd08.prod.outlook.com (2603:10a6:20b:8f::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4457.21; Fri, 27 Aug
 2021 18:18:36 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::2817:53b3:f8b4:fe22]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::2817:53b3:f8b4:fe22%7]) with mapi id 15.20.4457.023; Fri, 27 Aug 2021
 18:18:36 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, armbru@redhat.com, xiechanglong.d@gmail.com,
 wencongyang2@huawei.com, eblake@redhat.com, hreitz@redhat.com,
 kwolf@redhat.com, vsementsov@virtuozzo.com, jsnow@redhat.com
Subject: [PATCH v2 10/19] block: introduce fleecing block driver
Date: Fri, 27 Aug 2021 21:17:59 +0300
Message-Id: <20210827181808.311670-11-vsementsov@virtuozzo.com>
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
 15.20.4457.18 via Frontend Transport; Fri, 27 Aug 2021 18:18:35 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 517fddc0-e93f-4e00-c88a-08d96987163d
X-MS-TrafficTypeDiagnostic: AM6PR08MB3765:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR08MB37658BBF823156C8C6BEF910C1C89@AM6PR08MB3765.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6790;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: w7huqST5nElVG5M8VXK2o59dzKJ9nuLIPUga6iJ6cx6OKNxru2gH6vYR5X45pPcPWLjoa7+Bf0lcsuHMfD63148COPlsP5S5Ki39fmOqPL/KDpi2A4soHmx+P+m7HXnjdUCzAvZh9Zmrq7K5umpJuPP8OcSxgra9iLR9tp+wt62Mb/U7wwpOkvjsWzQd/Odlt4SOxFOb9FmVjn2v5VQz4j+3A19JVv08kB4BmThf3e0BYC+as1RPOXL8GgTKoGmmRHQgOawWpI7J9x6Ctcl6A5p4PeVb7Ko4x288ZWjqOvJ40+YJTR2fJcx28XF3GgPkGlgDbXfzYiQglU5h/1WOH2FmwDYJnEE3HxfQ0bUj2SyJC1QJg+ZSkE+kBOe+kylgMnKstjIcv9bAE8+CyYsCP8fjz1NmmLwNKDpztiozcEzO81RkXS358CNdw/gtffWGXbc90+3ZXHN4SDjp8jBynT1QpB6SNWs5Z5b8SubJNvWqUg6+4I3qljqs9na9SPKJYAZcmsx+nMwzmZGofLz1jYwaI2TTgKINowPdHHb5l/uKJLjwML7Fm0k0yGUVxu6DKjt2cQnBf1kTRdu6LM8ZAY3qkmuoY524beDD5v41VNNHd8t/npAdH4E0xsNURlMEnpETVanqyqtauX2XZVjfYDQSlRBV9qbu6pYysQDMmn+a6/2eKg+HPtCHEgQ4dDpbraB0qqurjKNraDeppflvy2+4wucpZN7qL5EGc/mzk1JbMYUht/KN2TjA5o098aGBrmSerhQbYUgBjoDrXRSDlkZfHCfnmOte7FU3c0sOFfc=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(39840400004)(366004)(136003)(346002)(396003)(52116002)(6486002)(1076003)(26005)(66946007)(66476007)(8936002)(6506007)(30864003)(2616005)(38350700002)(38100700002)(956004)(5660300002)(86362001)(8676002)(186003)(6666004)(83380400001)(66556008)(6916009)(4326008)(6512007)(36756003)(2906002)(478600001)(316002)(2004002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?8QVyUH1g8R8ucLIavxX2uxMUh4PVoNCpzv/TkqwAlWtTdpze2uuUWejQFTrm?=
 =?us-ascii?Q?ym3f52Dq+UqsLKvZ3b4bB2jgHFbObXsgvEqAxqVQYdFyfg3qMSpbNGNOBxy6?=
 =?us-ascii?Q?Wh0eHnEwIWOO3GgKL3x2o04UysRWMVSKH5bF1NX/QfAtFCqXspH8H+K33cIY?=
 =?us-ascii?Q?4HnfH5VINu4Zvo3tfUKJZlQIHHmOOqVtWZDr1yAuoWjoAaK8SaveNI02dGvh?=
 =?us-ascii?Q?3JN75gOU4rh/bw+dP2Mg8vdoPufe1DdGSDrspSdiCRQcHunAPHHS3X8dE4RT?=
 =?us-ascii?Q?KLSraApplrF45gHYlrUvVtS63lHyZvofLS/j8utNAik1IKkRU6blGzfoqsnn?=
 =?us-ascii?Q?DExpbr558oNLoCQPu1rYLOso2wSVQEh3wMKt+LeLz++XMm9nNKrOX8TJPeId?=
 =?us-ascii?Q?5BRyJjWcMR/87WFgYSo8AnNLNycImzJpNHBXuI4jvl4Dm3QOn0Rcz9eCAyQK?=
 =?us-ascii?Q?nLX5qgWYSUFxSzBl5UUi4x34fSwGRI1HNIjVZXdrHJZy9DGxWR0unTJcqA4X?=
 =?us-ascii?Q?lkBHGE4lIhznPA+UoOMa+6qrQwA4suw5knPy8iOl/HA9+iYag0DE0aXOQ5ow?=
 =?us-ascii?Q?Hsk7ougqREG0WX3Gc+qvPtcZeBkRLsmqPInbUhsR3LzmemPWJPHexEBW4pPx?=
 =?us-ascii?Q?UJfGI8pVtr63QUrXDcV+7may2yZ4Ho+1XF/H8nQqARkhTIa6/CcJlzbYV/Qb?=
 =?us-ascii?Q?d3ZojnfekWVumb+eCd/NIg3lzyuaMmh/qOJajAPtDais0HQlsWBQNR9JsFmc?=
 =?us-ascii?Q?4Uv7NOg9VJgBlNr3s5F+HdokYasPN5AYsSw26CCxkoHHW1ISEdzdvFu+sknP?=
 =?us-ascii?Q?fn7l4YWWCLDlrwgCrNo0uM2BfOo1EfmXiEyJRkVX9URNkIGnv5RRe/h/q5wz?=
 =?us-ascii?Q?psreSvXKPe0GlCPVD8s0Jp2STDb5XCpxkV4PcmQGwa7/a3+QcXCwpcAITSUH?=
 =?us-ascii?Q?rTbcrEDRWTa1wA7ExgOlOh7OSVuso8miHe6bvd5E4mqMk+VU0DOhMfgRT3BO?=
 =?us-ascii?Q?yazfGFT5n8ZIQaxmKlfMayCjDMIUY9Nqf4851vf2hRu/9pDFevUQcVcLCZsU?=
 =?us-ascii?Q?WyePP0DR5LBb3BTNNpG1gbJwW5jdRWktVrS1hVnFXvq3QjO4pL3a8vgue5LH?=
 =?us-ascii?Q?HhRh+CIqHVIY93L4SF/vJxSOdU5XFT4HvEWP/RGHLrt32qtBso+eIG1pCSso?=
 =?us-ascii?Q?Amz8BtFEZvpDKcm8QMHrnisDqG+XcG+PTPgFMUtnD9v5B4il5bKVfOrzbaz2?=
 =?us-ascii?Q?WHXeBlde7feadt5TM8RBYJRj8F8OEo60VUcNZYu6jBYnibNsFn20+sq1BhD3?=
 =?us-ascii?Q?Jeg0uCGPJrnrmkLIL5gM6Tqt?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 517fddc0-e93f-4e00-c88a-08d96987163d
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Aug 2021 18:18:36.6555 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Zbmxs4UW50gYRFGJPicVk56HAUE637ptatb1/QA0NT9+92ZxyKHP3fjKEeCuq1dp0/jzIBq/ul79saSMtBkSb/hPyTisd7ECLeKAmgmWssw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB3765
Received-SPF: pass client-ip=40.107.2.112;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR02-VE1-obe.outbound.protection.outlook.com
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
 qapi/block-core.json |  17 ++-
 block/fleecing.h     |  16 +++
 block/fleecing-drv.c | 260 +++++++++++++++++++++++++++++++++++++++++++
 MAINTAINERS          |   1 +
 block/meson.build    |   1 +
 5 files changed, 294 insertions(+), 1 deletion(-)
 create mode 100644 block/fleecing-drv.c

diff --git a/qapi/block-core.json b/qapi/block-core.json
index c42d23752d..8a333136f5 100644
--- a/qapi/block-core.json
+++ b/qapi/block-core.json
@@ -2826,13 +2826,14 @@
 # @blkreplay: Since 4.2
 # @compress: Since 5.0
 # @copy-before-write: Since 6.2
+# @fleecing: Since 6.2
 #
 # Since: 2.9
 ##
 { 'enum': 'BlockdevDriver',
   'data': [ 'blkdebug', 'blklogwrites', 'blkreplay', 'blkverify', 'bochs',
             'cloop', 'compress', 'copy-before-write', 'copy-on-read', 'dmg',
-            'file', 'ftp', 'ftps', 'gluster',
+            'file', 'fleecing', 'ftp', 'ftps', 'gluster',
             {'name': 'host_cdrom', 'if': 'defined(HAVE_HOST_BLOCK_DEVICE)' },
             {'name': 'host_device', 'if': 'defined(HAVE_HOST_BLOCK_DEVICE)' },
             'http', 'https', 'iscsi',
@@ -4077,6 +4078,19 @@
   'base': 'BlockdevOptionsGenericFormat',
   'data': { 'target': 'BlockdevRef', '*bitmap': 'BlockDirtyBitmap' } }
 
+##
+# @BlockdevOptionsFleecing:
+#
+# Driver that works in pair with copy-before-write to make fleecing scheme.
+#
+# @source: source node of fleecing
+#
+# Since: 6.2
+##
+{ 'struct': 'BlockdevOptionsFleecing',
+  'base': 'BlockdevOptionsGenericFormat',
+  'data': { 'source': 'str' } }
+
 ##
 # @BlockdevOptions:
 #
@@ -4133,6 +4147,7 @@
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
index 0000000000..9161e13809
--- /dev/null
+++ b/block/fleecing-drv.c
@@ -0,0 +1,260 @@
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
+        BlockDriverState *bs, uint64_t offset, uint64_t bytes,
+        QEMUIOVector *qiov, size_t qiov_offset, int flags)
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
+                                             int64_t offset, int bytes)
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
+        int64_t offset, int bytes, BdrvRequestFlags flags)
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
+                                       uint64_t offset,
+                                       uint64_t bytes,
+                                       QEMUIOVector *qiov, int flags)
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
index 20f3c7eb68..9b62f99557 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2343,6 +2343,7 @@ F: block/copy-before-write.h
 F: block/copy-before-write.c
 F: block/fleecing.h
 F: block/fleecing.c
+F: block/fleecing-drv.c
 F: include/block/aio_task.h
 F: block/aio_task.c
 F: util/qemu-co-shared-resource.c
diff --git a/block/meson.build b/block/meson.build
index caa52f49c2..10cd0c0ad2 100644
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
2.29.2


