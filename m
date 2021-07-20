Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 839A33CFBF6
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Jul 2021 16:24:20 +0200 (CEST)
Received: from localhost ([::1]:33604 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m5qfT-0005ki-9S
	for lists+qemu-devel@lfdr.de; Tue, 20 Jul 2021 10:24:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40038)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1m5qe2-0004cn-MZ; Tue, 20 Jul 2021 10:22:50 -0400
Received: from mail-db8eur05on2113.outbound.protection.outlook.com
 ([40.107.20.113]:25313 helo=EUR05-DB8-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1m5qdz-0002OM-NW; Tue, 20 Jul 2021 10:22:50 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZT/F8KHdIhuVzMP+YRyjkfeQIfd1dQBYJmXajkH30rWLem4iLTbtEADnv9lq6lhXpWWnP3gkdp382/jmBvm9x5zqlUAOpAC+ELqWQ5ijsI17e0fol89aH9fNb8J8j2n4M9xjW1Dwa/eGABS5K2fL+3tLgIC7BbVkVn7ja/X7DxfHiMmHRCuuuvPWI6P4fW3eRJ1Iy5t6X+ib3D5A3vdRS+wD+Q2F0EGnqmN2NNLDhSpwV2cZrsentQvyXEKexuLgvjPZxTfpeDFGykTTLDKQ1Vjrmrl04wC3tFU6R5Zpf7bX6ituGY3gJTwqM1WonP1EylUasX5mBM9EWQ/cy8lZxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4IB9pE9qqKeO5wKKZ7eQvPB+LpGjJGyv0fMZIoaDEBg=;
 b=gMrsW8FCS9F08XCIDjqHOQYsSWJaeUFDs3PpOH/fPdpd85ldzJDO7Xma/NUhXwwp5yfnkiaz5XtsS2YgiKg/b0cvxZq/KgyFvqb6tZoi2qCtMvTaLhfDuF1Bu7/lbf9gddE73uY+bSyyff1cG6mCzjlGCRhVAzEWCpHmSUTMIda0qnJJCDlhiG1eW7icQKdDcuomNqNBUXY8kwoCdI14EuioPZdeEXyvUiddRRDDti9XHHXPo+Nwrf8fH42MJ967Pb6iGbBMzcXe9GWIArYJYHwvM3px9f+KxBM/L68jbW8hQSyd5dpoBFRgU5SpN43nWNSvMbYHvaWIU8sF+uItew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4IB9pE9qqKeO5wKKZ7eQvPB+LpGjJGyv0fMZIoaDEBg=;
 b=VcXJwtS7CVKoW4LujgSv/QW+vvwp/N5Rl23Yb50wYzfeFDF0XETDmVhiggdgnbmtfXq5JQ2boFQS4QQh45j3x5bb19CQ9eQrUUeD0eamMwRG9785Yl84UGHPCJNx9gy+fvWS1Az3T5B+Zy7SLyYOGLXXEIPASqGnenpf6NYKqnE=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB4072.eurprd08.prod.outlook.com (2603:10a6:20b:a8::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4331.28; Tue, 20 Jul
 2021 14:22:44 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::44b9:68ac:bdc7:e23c]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::44b9:68ac:bdc7:e23c%6]) with mapi id 15.20.4331.034; Tue, 20 Jul 2021
 14:22:44 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, crosa@redhat.com, ehabkost@redhat.com,
 eblake@redhat.com, armbru@redhat.com, vsementsov@virtuozzo.com,
 jsnow@redhat.com, mreitz@redhat.com, kwolf@redhat.com
Subject: [PATCH] block: drop BLK_PERM_GRAPH_MOD
Date: Tue, 20 Jul 2021 17:22:29 +0300
Message-Id: <20210720142229.763742-1-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.29.2
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: HE1PR0901CA0046.eurprd09.prod.outlook.com
 (2603:10a6:3:45::14) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (31.173.85.199) by
 HE1PR0901CA0046.eurprd09.prod.outlook.com (2603:10a6:3:45::14) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4331.21 via Frontend Transport; Tue, 20 Jul 2021 14:22:43 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3067dc65-c276-4a4c-9e80-08d94b89d73e
X-MS-TrafficTypeDiagnostic: AM6PR08MB4072:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR08MB4072EF3D47FE120A906258A4C1E29@AM6PR08MB4072.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4714;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: J66KjzMvGkAPMwRFPHWiZi5pb4VeWZ9hRqnUhrF3SGKd3XfrgD+Z33J1ZCoYzNdQFl9RuslXOBV0JbJ6XYxN0HJ9qEip7nGSc5GIZbbHaMJ96jx53loUQFDNLKUjOUDDCtSNyPTH0RZjVwRBILgyNtRBxrD3396S0Ei5yl4BFkF5HoBWZW+ZBoFKnQ1jLnRYN1xiRH3EFtzoSsbZN0O2M+2K+bljdAmhoO0PKp9C3axreT/Zf0DApfH8wC6XtELgomLnCPW1v7iPgjvpqTG5/gpd/LqRaiEqRGPFOyewvj06aPxe1uRAPQfpC+gcMmpSsGthA44BoQL9GpxvnMwzZeXpWEUNTMpmjRI2//1qowWYeBzfwKu8TMCBtQvf2KicQMv+GHHek3xcHO5GBYqimQQeG4qE/g22FyQXDXhtJOEQocWviTKUmCR1jlsvsm2pwRuhbDcaLd3rnrJAj0rmvvN+NnHhX7YxXPBePFS5QllMG+4/Aj+oWAQb5fgukDkaGXIGkPTsRRtGIYGQyjFVzhKIVKuLJCnvSPIr2eEWHJaUQbkfG9V7O8SiJuIWb9gdZAHk6QFPS4Vf48LzO8YZGjoWjK3u7yT6cIhgYL8SBxTXTO60B7Z3HssNHrb6RKooipJSI6vBg0zUS3xeOLTpoH3GgykfkdMOkR/hdumFomMEeYYB9x/0pHJGYT1Q3h73jFuPkkfK1EG7bGZydm8X6A==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(136003)(366004)(39830400003)(376002)(346002)(8936002)(8676002)(316002)(5660300002)(52116002)(6506007)(6666004)(26005)(86362001)(186003)(38350700002)(66476007)(2906002)(6486002)(83380400001)(36756003)(6916009)(66556008)(956004)(478600001)(2616005)(38100700002)(4326008)(66946007)(1076003)(6512007);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?v0ITALIFdxJf9tctvYwfIYxT4UnvyWXzLK8Y23HdDg40S7T1sVEyzukLDJg3?=
 =?us-ascii?Q?6Ck6XbD7GS2HBl3cbshgl4mZUuyf+J7o+HMiN5KE2CfC4VCJV3X2NnAtzeF5?=
 =?us-ascii?Q?98CJSGSKobrqw+WUSnyl3bSu/qlSbS08TyakjEZ5PImU8FsgjnB0dxA3bbX1?=
 =?us-ascii?Q?30HHWMV/cH5RGjtIxHes0i/tFFngmZQfboWDsYpAUXhSr6OBtNH+L4YVqeNU?=
 =?us-ascii?Q?HbG+A1FJOU+xnCxg8kWy0gStudctu0MM+oJeSmSa7KWThKsxyq/KjchyI6X8?=
 =?us-ascii?Q?GPAH3t2818C+EBQ47gi7RAdDggDGEYaU3u0hXW0JhqJFRsIMWI2xI7KTLpeU?=
 =?us-ascii?Q?+yYHZZiMqL15pxuxiVrjRGVzrzN7MNLrTcpR/f8cHMDH2hPCph6AmKbXar93?=
 =?us-ascii?Q?O2i0MEak8UzJdIaBv5gmHTblQamSyW+8agvFHVvM8bAUaPd3Le5Y5CyjDqJ8?=
 =?us-ascii?Q?LCnzBtcTuteMAFn2NjwaPppW8z64rRQ88tcaNQxegH97Vmno2a6dAAxbhJqS?=
 =?us-ascii?Q?7I5gQTzLVKas0D0pjIyFNUeie/zKrftgOwwbm1lfOZlx9Cim9cXGCtZG319R?=
 =?us-ascii?Q?20zHsyMX6TpM+1SLmlSYwbU3+39TrDYEBn5ujizeKdBafnEI0JiFeCZt/8KE?=
 =?us-ascii?Q?EbnuOoDeYNDrhMgXbiBG6UiLesoMwWLxQ6du7eLbh5OBswkEOP1gUu3YOg/e?=
 =?us-ascii?Q?Y8EXYy7/Ey3lAzVwutqbfhJA+0wWuQDBYlsR7FGTZMq1z44ewY3F1Bos9Puj?=
 =?us-ascii?Q?bW0jz4ldOcjg9lfldDnOdT4pHkozMQ3idfVGyhAmThzpLE7ci0rUyyks0T0D?=
 =?us-ascii?Q?VBkJlzMrxcGjChZ+2J34kYQVV6yHHMoH8padFaoZanl1mf1sNF0/uISj0ITk?=
 =?us-ascii?Q?VSuIKRDpN+slD+lxuzdw3iOs9Y06opowLAHEDJ37tH9ajsp2lpyfbjzlrx75?=
 =?us-ascii?Q?UG3/6NGWrZgJwDkwsa6Ir4CikWYJnqI6Y79ATcWDmiA0ijW7xg8puMVPwXfp?=
 =?us-ascii?Q?6TaDX0WPI8BWOQJECzOwl37BfjH2nx5FXZKQB4ZkuLgGRCL7SAYBwbaqxL/n?=
 =?us-ascii?Q?jt4tml8pZWLKNL+9qf2iV2IfPRJzfoNAn1a1OvsTOlc7eV/HHNMcnLGMQdTZ?=
 =?us-ascii?Q?FyfWQVywUxP5nCY9oi1ZUt9iPjLa29/YXjYM2GD5dlqvgomgIdZh2J0DjVKo?=
 =?us-ascii?Q?KJ31hwtXGC4D0G15Q6A1xijUUWVs4uFYjRo7s4n9PThuRazThPbsQ/dnu6hZ?=
 =?us-ascii?Q?SkbSo/uteMldA7K/33fxCBh9auCBC2s4gys9bSZVNzfw953bTbhDcTPbY5ag?=
 =?us-ascii?Q?XdTU0eBSlVIP8T9ZbdA8AK91?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3067dc65-c276-4a4c-9e80-08d94b89d73e
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jul 2021 14:22:44.5793 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9BRh+xfvXwLsnhc1zMuhVIDzuOuUsfNm8fZo+sKOTqcaYvLafJ6rRl3yprdPEbNmkivy0iGHwmVonaxX9nXfxLi//JOJ8S9eGklE202NPtU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4072
Received-SPF: pass client-ip=40.107.20.113;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR05-DB8-obe.outbound.protection.outlook.com
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

First, this permission never protected node from being changed, as
generic child-replacing functions don't check it.

Second, it's a strange thing: it presents a permission of parent node
to change its child. But generally, children are replaced by different
mechanisms, like jobs or qmp commands, not by nodes.

Graph-mod permission is hard to understand. All other permissions
describe operations which done by parent node on it child: read, write,
resize. Graph modification operations are something completely
different.

The only place, where BLK_PERM_GRAPH_MOD is used as "perm" (not shared
perm) is mirror_start_job, for s->target. Still modern code should use
bdrv_freeze_backing_chain() to protect from graph modification, if we
don't do it somewhere it may be considered as a bug. So, it's a bit
risky to drop GRAPH_MOD, and analyzing of possible loss of protection
is hard. But one day we should do it, let's do it now.

One more bit of information is that locking corresponding byte in
file-posix doesn't make sense at all.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 qapi/block-core.json          |  7 ++-----
 include/block/block.h         |  9 +++++----
 block.c                       |  7 +------
 block/commit.c                |  1 -
 block/mirror.c                | 15 +++------------
 hw/block/block.c              |  3 +--
 scripts/render_block_graph.py |  1 -
 tests/qemu-iotests/273.out    |  4 ----
 8 files changed, 12 insertions(+), 35 deletions(-)

diff --git a/qapi/block-core.json b/qapi/block-core.json
index 675d8265eb..f9d0e4f348 100644
--- a/qapi/block-core.json
+++ b/qapi/block-core.json
@@ -1825,14 +1825,11 @@
 #
 # @resize: This permission is required to change the size of a block node.
 #
-# @graph-mod: This permission is required to change the node that this
-#             BdrvChild points to.
-#
 # Since: 4.0
 ##
 { 'enum': 'BlockPermission',
-  'data': [ 'consistent-read', 'write', 'write-unchanged', 'resize',
-            'graph-mod' ] }
+  'data': [ 'consistent-read', 'write', 'write-unchanged', 'resize' ] }
+
 ##
 # @XDbgBlockGraphEdge:
 #
diff --git a/include/block/block.h b/include/block/block.h
index 3477290f9a..b52ba758c7 100644
--- a/include/block/block.h
+++ b/include/block/block.h
@@ -269,12 +269,13 @@ enum {
     BLK_PERM_RESIZE             = 0x08,
 
     /**
-     * This permission is required to change the node that this BdrvChild
-     * points to.
+     * There was a removed now BLK_PERM_GRAPH_MOD, with value of 0x10. QEMU 6.1
+     * and earlier still my lock corresponding byte in block/file-posix locking.
+     * So, implementing some new permission should be very careful to not
+     * interfere with this old unused thing.
      */
-    BLK_PERM_GRAPH_MOD          = 0x10,
 
-    BLK_PERM_ALL                = 0x1f,
+    BLK_PERM_ALL                = 0x0f,
 
     DEFAULT_PERM_PASSTHROUGH    = BLK_PERM_CONSISTENT_READ
                                  | BLK_PERM_WRITE
diff --git a/block.c b/block.c
index be083f389e..465c69ac26 100644
--- a/block.c
+++ b/block.c
@@ -2397,7 +2397,6 @@ char *bdrv_perm_names(uint64_t perm)
         { BLK_PERM_WRITE,           "write" },
         { BLK_PERM_WRITE_UNCHANGED, "write unchanged" },
         { BLK_PERM_RESIZE,          "resize" },
-        { BLK_PERM_GRAPH_MOD,       "change children" },
         { 0, NULL }
     };
 
@@ -2513,8 +2512,7 @@ static void bdrv_default_perms_for_cow(BlockDriverState *bs, BdrvChild *c,
         shared = 0;
     }
 
-    shared |= BLK_PERM_CONSISTENT_READ | BLK_PERM_GRAPH_MOD |
-              BLK_PERM_WRITE_UNCHANGED;
+    shared |= BLK_PERM_CONSISTENT_READ | BLK_PERM_WRITE_UNCHANGED;
 
     if (bs->open_flags & BDRV_O_INACTIVE) {
         shared |= BLK_PERM_WRITE | BLK_PERM_RESIZE;
@@ -2632,7 +2630,6 @@ uint64_t bdrv_qapi_perm_to_blk_perm(BlockPermission qapi_perm)
         [BLOCK_PERMISSION_WRITE]            = BLK_PERM_WRITE,
         [BLOCK_PERMISSION_WRITE_UNCHANGED]  = BLK_PERM_WRITE_UNCHANGED,
         [BLOCK_PERMISSION_RESIZE]           = BLK_PERM_RESIZE,
-        [BLOCK_PERMISSION_GRAPH_MOD]        = BLK_PERM_GRAPH_MOD,
     };
 
     QEMU_BUILD_BUG_ON(ARRAY_SIZE(permissions) != BLOCK_PERMISSION__MAX);
@@ -5326,8 +5323,6 @@ int bdrv_drop_intermediate(BlockDriverState *top, BlockDriverState *base,
     update_inherits_from = bdrv_inherits_from_recursive(base, explicit_top);
 
     /* success - we can delete the intermediate states, and link top->base */
-    /* TODO Check graph modification op blockers (BLK_PERM_GRAPH_MOD) once
-     * we've figured out how they should work. */
     if (!backing_file_str) {
         bdrv_refresh_filename(base);
         backing_file_str = base->filename;
diff --git a/block/commit.c b/block/commit.c
index 42792b4556..837b07e314 100644
--- a/block/commit.c
+++ b/block/commit.c
@@ -370,7 +370,6 @@ void commit_start(const char *job_id, BlockDriverState *bs,
     s->base = blk_new(s->common.job.aio_context,
                       base_perms,
                       BLK_PERM_CONSISTENT_READ
-                      | BLK_PERM_GRAPH_MOD
                       | BLK_PERM_WRITE_UNCHANGED);
     ret = blk_insert_bs(s->base, base, errp);
     if (ret < 0) {
diff --git a/block/mirror.c b/block/mirror.c
index 019f6deaa5..fca219a737 100644
--- a/block/mirror.c
+++ b/block/mirror.c
@@ -1135,10 +1135,7 @@ static void mirror_complete(Job *job, Error **errp)
         replace_aio_context = bdrv_get_aio_context(s->to_replace);
         aio_context_acquire(replace_aio_context);
 
-        /* TODO Translate this into permission system. Current definition of
-         * GRAPH_MOD would require to request it for the parents; they might
-         * not even be BlockDriverStates, however, so a BdrvChild can't address
-         * them. May need redefinition of GRAPH_MOD. */
+        /* TODO Translate this into child freeze system. */
         error_setg(&s->replace_blocker,
                    "block device is in use by block-job-complete");
         bdrv_op_block_all(s->to_replace, s->replace_blocker);
@@ -1645,7 +1642,7 @@ static BlockJob *mirror_start_job(
     s = block_job_create(job_id, driver, NULL, mirror_top_bs,
                          BLK_PERM_CONSISTENT_READ,
                          BLK_PERM_CONSISTENT_READ | BLK_PERM_WRITE_UNCHANGED |
-                         BLK_PERM_WRITE | BLK_PERM_GRAPH_MOD, speed,
+                         BLK_PERM_WRITE, speed,
                          creation_flags, cb, opaque, errp);
     if (!s) {
         goto fail;
@@ -1689,9 +1686,7 @@ static BlockJob *mirror_start_job(
             target_perms |= BLK_PERM_RESIZE;
         }
 
-        target_shared_perms |= BLK_PERM_CONSISTENT_READ
-                            |  BLK_PERM_WRITE
-                            |  BLK_PERM_GRAPH_MOD;
+        target_shared_perms |= BLK_PERM_CONSISTENT_READ | BLK_PERM_WRITE;
     } else if (bdrv_chain_contains(bs, bdrv_skip_filters(target))) {
         /*
          * We may want to allow this in the future, but it would
@@ -1702,10 +1697,6 @@ static BlockJob *mirror_start_job(
         goto fail;
     }
 
-    if (backing_mode != MIRROR_LEAVE_BACKING_CHAIN) {
-        target_perms |= BLK_PERM_GRAPH_MOD;
-    }
-
     s->target = blk_new(s->common.job.aio_context,
                         target_perms, target_shared_perms);
     ret = blk_insert_bs(s->target, target, errp);
diff --git a/hw/block/block.c b/hw/block/block.c
index d47ebf005a..25f45df723 100644
--- a/hw/block/block.c
+++ b/hw/block/block.c
@@ -171,8 +171,7 @@ bool blkconf_apply_backend_options(BlockConf *conf, bool readonly,
         perm |= BLK_PERM_WRITE;
     }
 
-    shared_perm = BLK_PERM_CONSISTENT_READ | BLK_PERM_WRITE_UNCHANGED |
-                  BLK_PERM_GRAPH_MOD;
+    shared_perm = BLK_PERM_CONSISTENT_READ | BLK_PERM_WRITE_UNCHANGED;
     if (resizable) {
         shared_perm |= BLK_PERM_RESIZE;
     }
diff --git a/scripts/render_block_graph.py b/scripts/render_block_graph.py
index da6acf050d..42288a3cfb 100755
--- a/scripts/render_block_graph.py
+++ b/scripts/render_block_graph.py
@@ -35,7 +35,6 @@ def perm(arr):
     s = 'w' if 'write' in arr else '_'
     s += 'r' if 'consistent-read' in arr else '_'
     s += 'u' if 'write-unchanged' in arr else '_'
-    s += 'g' if 'graph-mod' in arr else '_'
     s += 's' if 'resize' in arr else '_'
     return s
 
diff --git a/tests/qemu-iotests/273.out b/tests/qemu-iotests/273.out
index 4e840b6730..6a74a8138b 100644
--- a/tests/qemu-iotests/273.out
+++ b/tests/qemu-iotests/273.out
@@ -204,7 +204,6 @@ Testing: -blockdev file,node-name=base,filename=TEST_DIR/t.IMGFMT.base -blockdev
                 "name": "file",
                 "parent": 5,
                 "shared-perm": [
-                    "graph-mod",
                     "write-unchanged",
                     "consistent-read"
                 ],
@@ -219,7 +218,6 @@ Testing: -blockdev file,node-name=base,filename=TEST_DIR/t.IMGFMT.base -blockdev
                 "name": "backing",
                 "parent": 5,
                 "shared-perm": [
-                    "graph-mod",
                     "resize",
                     "write-unchanged",
                     "write",
@@ -233,7 +231,6 @@ Testing: -blockdev file,node-name=base,filename=TEST_DIR/t.IMGFMT.base -blockdev
                 "name": "file",
                 "parent": 3,
                 "shared-perm": [
-                    "graph-mod",
                     "write-unchanged",
                     "consistent-read"
                 ],
@@ -246,7 +243,6 @@ Testing: -blockdev file,node-name=base,filename=TEST_DIR/t.IMGFMT.base -blockdev
                 "name": "backing",
                 "parent": 3,
                 "shared-perm": [
-                    "graph-mod",
                     "resize",
                     "write-unchanged",
                     "write",
-- 
2.29.2


