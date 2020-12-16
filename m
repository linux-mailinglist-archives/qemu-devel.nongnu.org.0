Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 812752DBB24
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Dec 2020 07:22:13 +0100 (CET)
Received: from localhost ([::1]:58392 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kpQCS-0006oX-Iw
	for lists+qemu-devel@lfdr.de; Wed, 16 Dec 2020 01:22:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53596)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1kpQ88-0002pV-8V; Wed, 16 Dec 2020 01:17:44 -0500
Received: from mail-eopbgr00123.outbound.protection.outlook.com
 ([40.107.0.123]:51180 helo=EUR02-AM5-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1kpQ85-0001E7-R1; Wed, 16 Dec 2020 01:17:44 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=W6wEDVOu40eEZ/8quAsDFqkMXy0Au8rNXsrdmKORwZUlh2ZWlVhnJ9n2uzwBHUTrag2SKxd1nqLRcWxxOPqSrWYvOBw5MidSNBuTXpATcXndzR2N2eXZzRMuTPf//qajoOgBIVtGGNg9l7elwzMHAJzJosMmbeu8GouYWeNAUuvURSgOJzl3YNNDDxruvZH4VC5YNn9gri9DZkIgSqXsowL3X6kWXkUffdSH8MB//KGpVJy5A6qjeH9O52wVgD4YMxsLfhPvsb1aMFo6X01pEVK4spGaoUS3jdgv6CpZA3kGROXjLGkcdVvNrVPxHk3hOQG6RRO+SqmmJEfTZAB8Og==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1GjzSAeANX6iMiNI2+2QAQzVO6kM1AnBWqMsVVhkGmw=;
 b=d6HZVFAPR9UTPlUSxKiykPW7RxdspvV0AQXouNRPVy1LEHwABx/Ga9jJufyXnAmQl46mDXVGYw7/7osoYQd9l6sdE9ghFnW6Dsxi9TTc2d0D6fF5RQU7IGnOGYylso2UsDDqIkSSryIlYXE4E7Bb6QhqFoUBDx3uHIjE9YOwi2K5962B0QMliUr9DdyxfUILWDsGsD5LPjA88H/pYyQ0tR5KERGrlrehJmVGscvpGIQHMkk0yeWlt9CzR9ZIi/FY33Q9iytxxyStEM5ZjZzm6u7/lL+tDINCtANfAOWs2TvfFQiWqEzsVCnaVsZ9lvPSDGN/P6OVrKPLDvm2CtDHhw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1GjzSAeANX6iMiNI2+2QAQzVO6kM1AnBWqMsVVhkGmw=;
 b=qloWSQKPI047j/zzqujAVKelOKOzPB7NZM8al585c3qjoL7ajWV/WMNEnA3l6JfzKGkYAXyHIWGzUtexiUSVukkfyCOtEByb/uyJ8uFb4NKPX4dSSE3AHLawuvdDPzDw18mqulbFhnP5uLc4BN+o4lVcQcy9N1wwKasxi9MtOYM=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AS8PR08MB6309.eurprd08.prod.outlook.com (2603:10a6:20b:29f::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3654.24; Wed, 16 Dec
 2020 06:17:27 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::d585:99a4:d7a4:d478]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::d585:99a4:d7a4:d478%4]) with mapi id 15.20.3654.024; Wed, 16 Dec 2020
 06:17:27 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Subject: [PATCH v15 10/13] qapi: block-stream: add "bottom" argument
Date: Wed, 16 Dec 2020 09:17:00 +0300
Message-Id: <20201216061703.70908-11-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.25.4
In-Reply-To: <20201216061703.70908-1-vsementsov@virtuozzo.com>
References: <20201216061703.70908-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [185.215.60.92]
X-ClientProxiedBy: AM4PR0202CA0008.eurprd02.prod.outlook.com
 (2603:10a6:200:89::18) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from kvm.sw.ru (185.215.60.92) by
 AM4PR0202CA0008.eurprd02.prod.outlook.com (2603:10a6:200:89::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3654.12 via Frontend
 Transport; Wed, 16 Dec 2020 06:17:26 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 48334fcc-fd8d-4a35-198d-08d8a18a4303
X-MS-TrafficTypeDiagnostic: AS8PR08MB6309:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AS8PR08MB63098D75CCF236F4A774E21CC1C50@AS8PR08MB6309.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6430;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: LDFpWHQTl5eeGzzZLuagi6UW/03RI0BUMKyOdY9QgFZhKmvd2lfCLREeyHVZXl9XHmxgGHAa5VKevRixBQOuIjMkNPc1sDfvlgUFrMNgHqKZdUYb3yForqLfcnW2M5V0zjXi67LxVd4yli0AU1dBt2cz8PX3RVwg80I/a9xgiONMPVO5Amk8j8bcCOnXswZlku40+BbcKjkhONsZIQ61cArPq11esTr019ETCyCA6VO3t3BMuU64oi0n0w5KASHhfDx0AKbY3s6fx6E3Dv/B4TJ4VavxWurQPvR1KM6MJDciQuJWNpmJv/qvjsWIzD67MHi4Gfgtk4xtq4hdOwzF5g==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(136003)(396003)(366004)(346002)(39840400004)(4326008)(5660300002)(66556008)(66476007)(186003)(16526019)(956004)(6506007)(6512007)(2616005)(66946007)(36756003)(6666004)(1076003)(86362001)(6916009)(316002)(6486002)(52116002)(2906002)(8676002)(83380400001)(107886003)(478600001)(8936002)(26005);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?CXxCNSmsKBOt7qb18neNqmv4HbL2+WUPGKD6W59ECQpll4zhAOq6k82wJZ82?=
 =?us-ascii?Q?822ll+Ko2H9a0Qr04rJgkJiMqicFYgG5muBxmFQyq6ALyMqMvBTz892TzLcB?=
 =?us-ascii?Q?JazLrg0DeT+qsiTx1/PJk3i8SnOKQlMglNzWHcRNuJMZKklwBEunF+f0B9Cm?=
 =?us-ascii?Q?fPdnuXX0eUDaZqssYMRLdW39AT+R0EV0Bv2R6gSWKZCgKzHouqIl0rPsFPcK?=
 =?us-ascii?Q?112HpE7LEhNS5ErdhZhu/GXx7L3f8F0azssTu4EgxbmEuYeAkYtak69i9XDy?=
 =?us-ascii?Q?YnWXDk5EqDRVs5ryRjoOtHDBQUigC78RF4BHDYaGGa2AqPtGXvOtilDN/mbw?=
 =?us-ascii?Q?u9AzrptnnCk0OWoqW++PDhC3iAezdFoo3+DNlcsldjnYwHmT6MmC4f9zNTW4?=
 =?us-ascii?Q?zvz2PjfeoQw2Phn3BrfVJKau/t0NgOMIbdznXu78tC2WkeFSz7ZM9tp5bcKF?=
 =?us-ascii?Q?MJ/iffIYrxeDrk9tVt3jUgSC4xNKz57+v0fnRLIBF9jkHOJZ4QDbYBIdcQgu?=
 =?us-ascii?Q?++Q5ilDhRLRJ1r2Cv/NXES+iYIe87VSeZkhOwEmEEaq6k+nFewzi6d5jtOJZ?=
 =?us-ascii?Q?j3c70zylisJEiyoyE6BThQIVi9KQz794MPqzZ98S+a71o68CQyfba3m2U4kg?=
 =?us-ascii?Q?RfNpzqGNKSZOAPmwLROughd+yg4eGV8jLZl3Pg4p6lcHDAI7zglmZL1/Y03R?=
 =?us-ascii?Q?AuTSmYJh96rGrcKrp2gZZGDJzd3bf5SWOx79xqhxTECEUiN5qrAK9B9tZ65o?=
 =?us-ascii?Q?r83eHG8a76BfBS6k7TzVKpTCcbVzs+avx+NT1Gf1cQ8qNcZU48HfIgnNdWOL?=
 =?us-ascii?Q?pzv2Z2SAswOj+rd68940Vjo6XkNxm8LiV19ry/NFsX6pOCfCV0h28dP7QJ0p?=
 =?us-ascii?Q?/wNf9OgMqUFQUGcFJlEvDZ+7GLkkBsCUgBesIUNt321qqEU4cX0oD1xgd87Q?=
 =?us-ascii?Q?21L3URciqjnoZ2OAD9UUXXypERMqP/Hk/C3beIRLXbzLpbgYtD5C1QSf8jDb?=
 =?us-ascii?Q?LLHj?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Dec 2020 06:17:27.4392 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-Network-Message-Id: 48334fcc-fd8d-4a35-198d-08d8a18a4303
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: b6P7LWRcIqUyN/UlpwCWc9qea0i7tBG0+M82H4vbb6midBQqF6zB8UezIgE/yBstiWD6vbNIr6wJyO/HLrQEfhlBNzKXtUBxt3K15x/ntFg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6309
Received-SPF: pass client-ip=40.107.0.123;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR02-AM5-obe.outbound.protection.outlook.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: fam@euphon.net, kwolf@redhat.com, vsementsov@virtuozzo.com,
 qemu-devel@nongnu.org, armbru@redhat.com, stefanha@redhat.com, den@openvz.org,
 andrey.shinkevich@virtuozzo.com, mreitz@redhat.com, jsnow@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The code already don't freeze base node and we try to make it prepared
for the situation when base node is changed during the operation. In
other words, block-stream doesn't own base node.

Let's introduce a new interface which should replace the current one,
which will in better relations with the code. Specifying bottom node
instead of base, and requiring it to be non-filter gives us the
following benefits:

 - drop difference between above_base and base_overlay, which will be
   renamed to just bottom, when old interface dropped

 - clean way to work with parallel streams/commits on the same backing
   chain, which otherwise become a problem when we introduce a filter
   for stream job

 - cleaner interface. Nobody will surprised the fact that base node may
   disappear during block-stream, when there is no word about "base" in
   the interface.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 qapi/block-core.json           | 12 ++++---
 include/block/block_int.h      |  1 +
 block/monitor/block-hmp-cmds.c |  3 +-
 block/stream.c                 | 50 +++++++++++++++++++---------
 blockdev.c                     | 59 ++++++++++++++++++++++++++++------
 5 files changed, 94 insertions(+), 31 deletions(-)

diff --git a/qapi/block-core.json b/qapi/block-core.json
index b8094a5ec7..cb0066fd5c 100644
--- a/qapi/block-core.json
+++ b/qapi/block-core.json
@@ -2517,10 +2517,14 @@
 # @device: the device or node name of the top image
 #
 # @base: the common backing file name.
-#        It cannot be set if @base-node is also set.
+#        It cannot be set if @base-node or @bottom is also set.
 #
 # @base-node: the node name of the backing file.
-#             It cannot be set if @base is also set. (Since 2.8)
+#             It cannot be set if @base or @bottom is also set. (Since 2.8)
+#
+# @bottom: the last node in the chain that should be streamed into
+#          top. It cannot be set if @base or @base-node is also set.
+#          It cannot be filter node. (Since 6.0)
 #
 # @backing-file: The backing file string to write into the top
 #                image. This filename is not validated.
@@ -2576,8 +2580,8 @@
 ##
 { 'command': 'block-stream',
   'data': { '*job-id': 'str', 'device': 'str', '*base': 'str',
-            '*base-node': 'str', '*backing-file': 'str', '*speed': 'int',
-            '*on-error': 'BlockdevOnError',
+            '*base-node': 'str', '*backing-file': 'str', '*bottom': 'str',
+            '*speed': 'int', '*on-error': 'BlockdevOnError',
             '*filter-node-name': 'str',
             '*auto-finalize': 'bool', '*auto-dismiss': 'bool' } }
 
diff --git a/include/block/block_int.h b/include/block/block_int.h
index 1f56443440..4b8aa61fb4 100644
--- a/include/block/block_int.h
+++ b/include/block/block_int.h
@@ -1160,6 +1160,7 @@ int is_windows_drive(const char *filename);
  */
 void stream_start(const char *job_id, BlockDriverState *bs,
                   BlockDriverState *base, const char *backing_file_str,
+                  BlockDriverState *bottom,
                   int creation_flags, int64_t speed,
                   BlockdevOnError on_error,
                   const char *filter_node_name,
diff --git a/block/monitor/block-hmp-cmds.c b/block/monitor/block-hmp-cmds.c
index e8a58f326e..afd75ab628 100644
--- a/block/monitor/block-hmp-cmds.c
+++ b/block/monitor/block-hmp-cmds.c
@@ -507,7 +507,8 @@ void hmp_block_stream(Monitor *mon, const QDict *qdict)
     int64_t speed = qdict_get_try_int(qdict, "speed", 0);
 
     qmp_block_stream(true, device, device, base != NULL, base, false, NULL,
-                     false, NULL, qdict_haskey(qdict, "speed"), speed, true,
+                     false, NULL, false, NULL,
+                     qdict_haskey(qdict, "speed"), speed, true,
                      BLOCKDEV_ON_ERROR_REPORT, false, NULL, false, false, false,
                      false, &error);
 
diff --git a/block/stream.c b/block/stream.c
index 6a525a5edf..045d6bc76b 100644
--- a/block/stream.c
+++ b/block/stream.c
@@ -221,6 +221,7 @@ static const BlockJobDriver stream_job_driver = {
 
 void stream_start(const char *job_id, BlockDriverState *bs,
                   BlockDriverState *base, const char *backing_file_str,
+                  BlockDriverState *bottom,
                   int creation_flags, int64_t speed,
                   BlockdevOnError on_error,
                   const char *filter_node_name,
@@ -230,25 +231,42 @@ void stream_start(const char *job_id, BlockDriverState *bs,
     BlockDriverState *iter;
     bool bs_read_only;
     int basic_flags = BLK_PERM_CONSISTENT_READ | BLK_PERM_WRITE_UNCHANGED;
-    BlockDriverState *base_overlay = bdrv_find_overlay(bs, base);
+    BlockDriverState *base_overlay;
     BlockDriverState *above_base;
 
-    if (!base_overlay) {
-        error_setg(errp, "'%s' is not in the backing chain of '%s'",
-                   base->node_name, bs->node_name);
-        return;
-    }
+    assert(!(base && bottom));
+    assert(!(backing_file_str && bottom));
+
+    if (bottom) {
+        /*
+         * New simple interface. The code is written in terms of old interface
+         * with @base parameter (still, it doesn't freeze link to base, so in
+         * this mean old code is correct for new interface). So, for now, just
+         * emulate base_overlay and above_base. Still, when old interface
+         * finally removed, we should refactor code to use only "bottom", but
+         * not "*base*" things.
+         */
+        assert(!bottom->drv->is_filter);
+        base_overlay = above_base = bottom;
+    } else {
+        base_overlay = bdrv_find_overlay(bs, base);
+        if (!base_overlay) {
+            error_setg(errp, "'%s' is not in the backing chain of '%s'",
+                       base->node_name, bs->node_name);
+            return;
+        }
 
-    /*
-     * Find the node directly above @base.  @base_overlay is a COW overlay, so
-     * it must have a bdrv_cow_child(), but it is the immediate overlay of
-     * @base, so between the two there can only be filters.
-     */
-    above_base = base_overlay;
-    if (bdrv_cow_bs(above_base) != base) {
-        above_base = bdrv_cow_bs(above_base);
-        while (bdrv_filter_bs(above_base) != base) {
-            above_base = bdrv_filter_bs(above_base);
+        /*
+         * Find the node directly above @base.  @base_overlay is a COW overlay,
+         * so it must have a bdrv_cow_child(), but it is the immediate overlay
+         * of @base, so between the two there can only be filters.
+         */
+        above_base = base_overlay;
+        if (bdrv_cow_bs(above_base) != base) {
+            above_base = bdrv_cow_bs(above_base);
+            while (bdrv_filter_bs(above_base) != base) {
+                above_base = bdrv_filter_bs(above_base);
+            }
         }
     }
 
diff --git a/blockdev.c b/blockdev.c
index b58f36fc31..18699d3cda 100644
--- a/blockdev.c
+++ b/blockdev.c
@@ -2499,6 +2499,7 @@ void qmp_block_stream(bool has_job_id, const char *job_id, const char *device,
                       bool has_base, const char *base,
                       bool has_base_node, const char *base_node,
                       bool has_backing_file, const char *backing_file,
+                      bool has_bottom, const char *bottom,
                       bool has_speed, int64_t speed,
                       bool has_on_error, BlockdevOnError on_error,
                       bool has_filter_node_name, const char *filter_node_name,
@@ -2506,12 +2507,31 @@ void qmp_block_stream(bool has_job_id, const char *job_id, const char *device,
                       bool has_auto_dismiss, bool auto_dismiss,
                       Error **errp)
 {
-    BlockDriverState *bs, *iter;
+    BlockDriverState *bs, *iter, *iter_end;
     BlockDriverState *base_bs = NULL;
+    BlockDriverState *bottom_bs = NULL;
     AioContext *aio_context;
     Error *local_err = NULL;
     int job_flags = JOB_DEFAULT;
 
+    if (has_base && has_base_node) {
+        error_setg(errp, "'base' and 'base-node' cannot be specified "
+                   "at the same time");
+        return;
+    }
+
+    if (has_base && has_bottom) {
+        error_setg(errp, "'base' and 'bottom' cannot be specified "
+                   "at the same time");
+        return;
+    }
+
+    if (has_bottom && has_base_node) {
+        error_setg(errp, "'bottom' and 'base-node' cannot be specified "
+                   "at the same time");
+        return;
+    }
+
     if (!has_on_error) {
         on_error = BLOCKDEV_ON_ERROR_REPORT;
     }
@@ -2524,12 +2544,6 @@ void qmp_block_stream(bool has_job_id, const char *job_id, const char *device,
     aio_context = bdrv_get_aio_context(bs);
     aio_context_acquire(aio_context);
 
-    if (has_base && has_base_node) {
-        error_setg(errp, "'base' and 'base-node' cannot be specified "
-                   "at the same time");
-        goto out;
-    }
-
     if (has_base) {
         base_bs = bdrv_find_backing_image(bs, base);
         if (base_bs == NULL) {
@@ -2553,8 +2567,33 @@ void qmp_block_stream(bool has_job_id, const char *job_id, const char *device,
         bdrv_refresh_filename(base_bs);
     }
 
-    /* Check for op blockers in the whole chain between bs and base */
-    for (iter = bs; iter && iter != base_bs;
+    if (has_bottom) {
+        bottom_bs = bdrv_lookup_bs(NULL, bottom, errp);
+        if (!bottom_bs) {
+            goto out;
+        }
+        if (!bottom_bs->drv) {
+            error_setg(errp, "Node '%s' is not open", bottom);
+            goto out;
+        }
+        if (bottom_bs->drv->is_filter) {
+            error_setg(errp, "Node '%s' is a filter, use a non-filter node "
+                       "as 'bottom'", bottom);
+            goto out;
+        }
+        if (!bdrv_chain_contains(bs, bottom_bs)) {
+            error_setg(errp, "Node '%s' is not in a chain starting from '%s'",
+                       bottom, device);
+            goto out;
+        }
+        assert(bdrv_get_aio_context(bottom_bs) == aio_context);
+    }
+
+    /*
+     * Check for op blockers in the whole chain between bs and base (or bottom)
+     */
+    iter_end = has_bottom ? bdrv_filter_or_cow_bs(bottom_bs) : base_bs;
+    for (iter = bs; iter && iter != iter_end;
          iter = bdrv_filter_or_cow_bs(iter))
     {
         if (bdrv_op_is_blocked(iter, BLOCK_OP_TYPE_STREAM, errp)) {
@@ -2578,7 +2617,7 @@ void qmp_block_stream(bool has_job_id, const char *job_id, const char *device,
     }
 
     stream_start(has_job_id ? job_id : NULL, bs, base_bs, backing_file,
-                 job_flags, has_speed ? speed : 0, on_error,
+                 bottom_bs, job_flags, has_speed ? speed : 0, on_error,
                  filter_node_name, &local_err);
     if (local_err) {
         error_propagate(errp, local_err);
-- 
2.25.4


