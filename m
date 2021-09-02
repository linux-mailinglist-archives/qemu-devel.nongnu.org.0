Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DED183FEB7C
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Sep 2021 11:44:12 +0200 (CEST)
Received: from localhost ([::1]:58058 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mLjGV-0007Eb-Ul
	for lists+qemu-devel@lfdr.de; Thu, 02 Sep 2021 05:44:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54610)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mLjAl-0005vf-G5; Thu, 02 Sep 2021 05:38:15 -0400
Received: from mail-eopbgr00133.outbound.protection.outlook.com
 ([40.107.0.133]:32007 helo=EUR02-AM5-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mLjAj-0006TF-2z; Thu, 02 Sep 2021 05:38:15 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Gn614bFPgaUISdGOaUrVqU9Paq2DNLSmEOJrSb2oBIO8BMH0yJ5kWs0hJDdvHNsyZ1Tw5U2mfKDGiNFuf+QY8WfU7AUXFWu/CVkJ/ra6DaUML3U2jlAdcwGxczemp4qbfpKgUCbZSgxx5s4v2fa1ayg0zGMD4S7EioOqYoqkm61P18o9KCrAos47KmItHYmyAO5z5e9kKKZs1TFmRKEQEqSp+0ZhirH2LAXHdvpq86Y/zuOLTLugOV6jv328/TfuLcc8sjOaKnEnyC8TkSTcxp5RsPZCrq6TTjbe9BnigXzXBrn+Cv7HaDd7a3nVJW3+zuG9sO6Rha+YPW77UPOs2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WARG2GuKIHPUpgigNhGDmmNfsUlmUpF1MIc433jhmDo=;
 b=OyKGK7glnCxALZfoUiuxWYdxGPe2vQYLPO5h5elnRXf3Pi1Z2Pe4v12/rrbRNFrzSc5go+ND77O+iSzyREGvx4UsEzOq/EndDmYTc+vOoxpGIvXmGPO3nJLsLb2Lt8f1Oyy6ahJIjpytqrmB5jtGxwXRthO67sLx5uFQgBp6wZz/MtRDMWoqhMXa06gTUNeqlbpgHsZ3wuaPTtnkLOw23xmnAksLuIKQCYI0A8C1Op/We0uLqUz6OoQEt9JxRNB28QR1/QRYEOoB2L6hKnlklf4O8OOyMVVeLmfQPhfwSrbOKqYk/mKEll2zrk9DyAtKjac8QBdY5Z5CoUnsdbd04w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WARG2GuKIHPUpgigNhGDmmNfsUlmUpF1MIc433jhmDo=;
 b=B0ivWYY4CDai7oZRmlcnDHjPGM+j6LN409G4/7+rMy20ZsJqNNMKg4nvZr+cluOMMN+egu+TczRD+PIqdTNdDK4Y48cyN5QUdG6GSx9G/GW12h5wBcVAVMhauLbcI7EtNl+8UHce7jqt23awKlTtD2ixhbqBpAH6z7qelMH1gds=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM5PR0801MB2099.eurprd08.prod.outlook.com (2603:10a6:203:4d::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4457.23; Thu, 2 Sep
 2021 09:38:09 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::2817:53b3:f8b4:fe22]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::2817:53b3:f8b4:fe22%8]) with mapi id 15.20.4478.019; Thu, 2 Sep 2021
 09:38:09 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, crosa@redhat.com, ehabkost@redhat.com,
 armbru@redhat.com, eblake@redhat.com, vsementsov@virtuozzo.com,
 jsnow@redhat.com, hreitz@redhat.com, kwolf@redhat.com
Subject: [PATCH v2] block: drop BLK_PERM_GRAPH_MOD
Date: Thu,  2 Sep 2021 12:37:54 +0300
Message-Id: <20210902093754.2352-1-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.29.2
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: HE1PR06CA0159.eurprd06.prod.outlook.com
 (2603:10a6:7:16::46) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (185.215.60.196) by
 HE1PR06CA0159.eurprd06.prod.outlook.com (2603:10a6:7:16::46) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4478.17 via Frontend Transport; Thu, 2 Sep 2021 09:38:08 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f71141c0-311f-470c-1573-08d96df55fa9
X-MS-TrafficTypeDiagnostic: AM5PR0801MB2099:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM5PR0801MB20996F1E5AB5863FDAA2E0CEC1CE9@AM5PR0801MB2099.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4714;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 124flXG9HhJypenzrk9ngV8eaXIeiuKLRe0UmJuZ9eZSmuSTWF3wJ0gKP4I7+2nxgJcWsA0EWFs94XmXuccal7+HEuzoOY7jSM9c9TzkSHtVYe5alljhjgvvaWij6fc+K0QY7waRv2c7oaM8TMjC9Lnl5Q/hqkzfsoL7Dnyhdlcukx9MrRnZT/1gLdaPmnkaEUzhXFNhU5q+sXQuqxqumiLsa/IqWkLmx1J7oa/qLYmp33ff66eD/4MU8jmdmNLr5upwi9P6MdcwzrgbeNiKxyL83w3NJiafXpuzE9hSdeFJ65KuY/Tsh3Fua+TNyW/bffXxUneNRvr/FTjO8u5qypw2hsks8fuKAokbKDrmvVWQ6gfagGVLWKii9KxXNXMEQgOIQp2SVonY/PHwOWhLlZ3zwgqtv6DsOcARmt2qR4hukqFZpOxEAd043L4GJau7DJlRYZK2erxfmx+Di+o0fYlMlUM7xLHNvHMRb+knPPGsimwzYqH9Fq7zOc79msFQG2r+4KWGLU9TaJ180dG7BSzcB2JqNpGvaT/sH0ueQi7zLqGBbFfD3sowiRApB1WokbyvB/LTpqqgQgxN52oYleUOgF7Xz37CrkOOHoWhF97/GsvWbssKmM9KUWXbH8OBUeGEJP4UZOJgtDRMshJN/bUkhi7C7B6Aelc6YqrZlBIvBA5b8Hq4o5b0OsX/y6EImzEk8BNUAfj7NA/aeM7MXg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(366004)(39850400004)(376002)(396003)(346002)(26005)(6666004)(1076003)(36756003)(66556008)(66946007)(86362001)(2616005)(186003)(38350700002)(5660300002)(66476007)(6512007)(956004)(52116002)(478600001)(83380400001)(38100700002)(4326008)(8936002)(6506007)(316002)(6916009)(2906002)(8676002)(6486002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?HnM5vWl7m0CQgmdfegHJjP8CMokfCCnXG2/iLCh5Woa4630e4JDUfbjS98cd?=
 =?us-ascii?Q?26xY7vTJrwTxCATtow7YLO9YWD/VI6+PMBVzh1OfYKsKoN86Ho5F62OIYnIQ?=
 =?us-ascii?Q?bNYLSuO1boRVLpscoAjAqcbVSTE/DSTLDKsLgyRJPlaBxIgfRA5c/0UJFqb0?=
 =?us-ascii?Q?mugiiOyH1X7zHbl4Pg+oSwk2Xhcgv/a4x2OJHvszFfIFZlSqVp2L/vQ+L1io?=
 =?us-ascii?Q?f9qaBxFgJYb8G2vg9M4K52kE7IeX51dLRAAK4bOWvPi+s9nuenK/b7RxigIe?=
 =?us-ascii?Q?09XbtHOz8tPTG+b7qdTsMsgtSI2pv+3NCY94ElH+i6V36zYSa62xZK1wlMji?=
 =?us-ascii?Q?+0T/Uj7LcXn15NML+IdCX6ldb/PyIbFR5MOalNjNncHXNnfFGphtW97VvRJq?=
 =?us-ascii?Q?Zb1afRCtFFjEtVzWGA7n2349lGXatIfm9KymQJhUZqab7AGOG0jPZzGrOtTc?=
 =?us-ascii?Q?eh+PqeEbiZF7jqPczgkkXDo9IRRBboz5Ae1VxzICD5KDT0HwUfHSN5Ha6VRy?=
 =?us-ascii?Q?3cshuHClyLLYQPvHRKhBhZCr+C45UZtEdlXo0fJ2TlLBAOyuwSAgtd52kPZP?=
 =?us-ascii?Q?0xaJ9P3TTREWYH52ua7htDTccSiRXSJYCw0BcgbRYtVJXBZh61igzI4Klxsw?=
 =?us-ascii?Q?37HmRi/+L/bz180FItrzS1LzZ9hFiTZkNQLSIDrdnIirLubAA1gYMpmb/w6i?=
 =?us-ascii?Q?aJJi+JOUDrN7lvrfMILPpAG0JSaAcJp5/U5fj8LUPWus3I64mIBcQrQNfId6?=
 =?us-ascii?Q?lPsv9TAFXRqE4ObPohu5AoRPHZxBVyhoYtQm+6yOYq1A+Uh3Yy8hahjie7Vx?=
 =?us-ascii?Q?91VALQi+adeIxGmpEuCJrrbWQIMTnJUQ5MIxLh/OAJqQtbw/wm8ERKj/sfhe?=
 =?us-ascii?Q?LeD+fVQUs1epteBIPCqNu/+LvIku77/hpSOeyTCQn/S5tj9J7fRUNYpG+on/?=
 =?us-ascii?Q?COfjymXouDrCa1K21tFJBpvoMyNqD+1g50SArcVp4nJrDF357AFEQnF3lIDY?=
 =?us-ascii?Q?Rm6HKvtel8bSXNionEzbkVUG1h8Sf5fypAciO4K6NCE/11qH2sFcxQ5PbD+I?=
 =?us-ascii?Q?q3XdFzRdWALuFoBmbRwNZETaalmIopetv4q+rchH1wt+52vA/wYV1kKjkOil?=
 =?us-ascii?Q?0LqXVRZAzCvxPdWLL3AiDAGUUZNK0UvmR+L+vE7WF+mobUCzzvzoZmmuC7Rg?=
 =?us-ascii?Q?fZiWY0pTophosLGO/TcOpYBiA1wtNXOdPYhMmPcts7aeYGeiT4HDtcSp52vR?=
 =?us-ascii?Q?GHeI36yaZzPHHdUoyeVOsXRNGliVW9MIhWxvaUMQGTCt7dWaTA3M4FuqJjh7?=
 =?us-ascii?Q?vaXqClXkdK5NJqTvweaT7Sij?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f71141c0-311f-470c-1573-08d96df55fa9
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Sep 2021 09:38:09.0699 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cWrG7fLkLXPx+L1hkjV+lQCoX7dYH6MgFih9ERkGebK3Lui+wiuECkC2HRHRD4jX3IinaeLUtcgj+YLYfTV0rikXzNC0itcIGbI4lWOygQs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR0801MB2099
Received-SPF: pass client-ip=40.107.0.133;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR02-AM5-obe.outbound.protection.outlook.com
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

First, this permission never protected a node from being changed, as
generic child-replacing functions don't check it.

Second, it's a strange thing: it presents a permission of parent node
to change its child. But generally, children are replaced by different
mechanisms, like jobs or qmp commands, not by nodes.

Graph-mod permission is hard to understand. All other permissions
describe operations which done by parent node on its child: read,
write, resize. Graph modification operations are something completely
different.

The only place where BLK_PERM_GRAPH_MOD is used as "perm" (not shared
perm) is mirror_start_job, for s->target. Still modern code should use
bdrv_freeze_backing_chain() to protect from graph modification, if we
don't do it somewhere it may be considered as a bug. So, it's a bit
risky to drop GRAPH_MOD, and analyzing of possible loss of protection
is hard. But one day we should do it, let's do it now.

One more bit of information is that locking the corresponding byte in
file-posix doesn't make sense at all.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---

v2: fix grammar

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
index 06674c25c9..6fa2c4ab82 100644
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
index 3477290f9a..bccca61429 100644
--- a/include/block/block.h
+++ b/include/block/block.h
@@ -269,12 +269,13 @@ enum {
     BLK_PERM_RESIZE             = 0x08,
 
     /**
-     * This permission is required to change the node that this BdrvChild
-     * points to.
+     * There was a now-removed bit BLK_PERM_GRAPH_MOD, with value of 0x10. QEMU
+     * 6.1 and earlier may still lock the corresponding byte in block/file-posix
+     * locking.  So, implementing some new permission should be very careful to
+     * not interfere with this old unused thing.
      */
-    BLK_PERM_GRAPH_MOD          = 0x10,
 
-    BLK_PERM_ALL                = 0x1f,
+    BLK_PERM_ALL                = 0x0f,
 
     DEFAULT_PERM_PASSTHROUGH    = BLK_PERM_CONSISTENT_READ
                                  | BLK_PERM_WRITE
diff --git a/block.c b/block.c
index e97ce0b1c8..761d47d6f3 100644
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
index 98fc66eabf..5ab0174446 100644
--- a/block/mirror.c
+++ b/block/mirror.c
@@ -1147,10 +1147,7 @@ static void mirror_complete(Job *job, Error **errp)
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
@@ -1658,7 +1655,7 @@ static BlockJob *mirror_start_job(
     s = block_job_create(job_id, driver, NULL, mirror_top_bs,
                          BLK_PERM_CONSISTENT_READ,
                          BLK_PERM_CONSISTENT_READ | BLK_PERM_WRITE_UNCHANGED |
-                         BLK_PERM_WRITE | BLK_PERM_GRAPH_MOD, speed,
+                         BLK_PERM_WRITE, speed,
                          creation_flags, cb, opaque, errp);
     if (!s) {
         goto fail;
@@ -1702,9 +1699,7 @@ static BlockJob *mirror_start_job(
             target_perms |= BLK_PERM_RESIZE;
         }
 
-        target_shared_perms |= BLK_PERM_CONSISTENT_READ
-                            |  BLK_PERM_WRITE
-                            |  BLK_PERM_GRAPH_MOD;
+        target_shared_perms |= BLK_PERM_CONSISTENT_READ | BLK_PERM_WRITE;
     } else if (bdrv_chain_contains(bs, bdrv_skip_filters(target))) {
         /*
          * We may want to allow this in the future, but it would
@@ -1715,10 +1710,6 @@ static BlockJob *mirror_start_job(
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


