Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 779762CF6A8
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Dec 2020 23:17:18 +0100 (CET)
Received: from localhost ([::1]:33132 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1klJO9-0001nC-HO
	for lists+qemu-devel@lfdr.de; Fri, 04 Dec 2020 17:17:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39592)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1klJFv-0003fB-JE; Fri, 04 Dec 2020 17:08:47 -0500
Received: from mail-vi1eur05on2136.outbound.protection.outlook.com
 ([40.107.21.136]:31968 helo=EUR05-VI1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1klJFj-00027F-Q1; Fri, 04 Dec 2020 17:08:45 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lNXlwfcMkB61IR0gRA3Se1yHil2383BbDBOi06Y/XKY/zbxrXCDuD6pv7gRfLxbyTL3uibH8KhvAm7CKWlJ5I4jrL+6pJyK04KPd8I2T6t2QiIFrVme7SPcyFILKSEvkHkVqcRgnAnAYF6W28ESVGFSGYopj4bHonvt+3OxsZnhqI6In/Av3flLzc3+ltkDCf9oEDFVKDRQKe2ZLnLedwey2tnmJHd9GxLBtlHpTUYtEjpTh7E/sUjEGhiVavC3jDVMV3ShWbBpIm04n8kHmTmPSVvuq/Dmo86nNvhVbaKCJK9t0FeWUaiyOSM2yORvE9C1I2N7VEIc//LI5VgCfpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3UPkFDTxtb89loCeCCba1X4AvFzQt+MF8OkMfDpe3es=;
 b=RhJvIDc/Y2bx+JH9DoCZ7vESnibeB32mtxphaDxiyWiVSfWYpKVlq9KH4/mOtjZftnFFiSG27XJE6d8M39v58/wSffwFAyxxb4aoKHZ0nIUXOfGIkHC4miAtwGxUb70CFEicYZ7cqdzV00PTvcT4DWKDkpwU/DvnlKUarvmTMplPtqlF56JUsmBmo0BfoN2RaYOiGyXlso3yK/HS4wwVEHzLjyXNrDklYYJZf4MqCE4ucLAcUntR5Jt1tjueqG8vSczce3O3DkpIYYGKy9I4pOp/Z4SGtLucIJBFzjqs+TBp2I47RwIOBUVWi/aAeSxU62tTndtUbbayjel9+pj5Zg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3UPkFDTxtb89loCeCCba1X4AvFzQt+MF8OkMfDpe3es=;
 b=FBAc9eqpaYRqcxN76PQjmwAkW4siH07fomCe1psvfi99J5P+L7tACinse32gPNF6K5PywwmOWj8uTC5VZskFCoG4CdvZqA6upZKJnZksChfup2pggjAOA1KsnnljNvZJfOm8W7Q62lIdwLCw+9AtEpTpgLgf+By4HAbDQPMz1Gc=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB4072.eurprd08.prod.outlook.com (2603:10a6:20b:a8::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3632.18; Fri, 4 Dec
 2020 22:08:23 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::d585:99a4:d7a4:d478]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::d585:99a4:d7a4:d478%4]) with mapi id 15.20.3632.021; Fri, 4 Dec 2020
 22:08:23 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, eblake@redhat.com, armbru@redhat.com,
 jsnow@redhat.com, fam@euphon.net, stefanha@redhat.com, mreitz@redhat.com,
 kwolf@redhat.com, den@openvz.org, andrey.shinkevich@virtuozzo.com,
 vsementsov@virtuozzo.com
Subject: [PATCH v14 10/13] qapi: block-stream: add "bottom" argument
Date: Sat,  5 Dec 2020 01:07:55 +0300
Message-Id: <20201204220758.2879-11-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.21.3
In-Reply-To: <20201204220758.2879-1-vsementsov@virtuozzo.com>
References: <20201204220758.2879-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [185.215.60.91]
X-ClientProxiedBy: AM4PR0701CA0003.eurprd07.prod.outlook.com
 (2603:10a6:200:42::13) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from kvm.sw.ru (185.215.60.91) by
 AM4PR0701CA0003.eurprd07.prod.outlook.com (2603:10a6:200:42::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3654.7 via Frontend
 Transport; Fri, 4 Dec 2020 22:08:22 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c7cfc02a-5227-4ff3-10a6-08d898a11de3
X-MS-TrafficTypeDiagnostic: AM6PR08MB4072:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR08MB4072D32A12D4E9C035A2BFC0C1F10@AM6PR08MB4072.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 1TP6vbMmkvDwWt3jflUvRVrAjug8YGhTn848I4vTmU+Nmov/tSyuvEPqFbVI6O9MkKEF0jWQ0S9zW4sAsc4esaler37YG79Kol0io5k+Qwg4bdcrltyzoRDD8RDpO8ClYPhwy0Odq0NI7n4B1XG737OxlV7LS3+GfwBzzMlXzrJjxDOuOCaKoYKNH8liN4KWD18o/jDDk6/RPL1zU0+RYkuVjx5jT3prqZba+YWFE/IIO0O9CVLG0DwqONOyQMyxiXfC2b88hxHiNih+u3a4Kz525jGC9dQx1PEW0yPCr9g86+vbf61WK3GW2K2t3GJdq7+g5dvhMxoUMsOcodX6VA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(396003)(39840400004)(376002)(346002)(366004)(66946007)(66556008)(1076003)(5660300002)(956004)(107886003)(6666004)(16526019)(26005)(66476007)(4326008)(36756003)(186003)(86362001)(6506007)(8936002)(2906002)(6916009)(52116002)(478600001)(6512007)(316002)(83380400001)(8676002)(6486002)(2616005);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?WxJjZyPtw0JnPLrT2tBEpOz93GnVgR8yxebRZ7X1oq5kSE6J41WsinsL6KQd?=
 =?us-ascii?Q?YNmbB1ccFAO8TgUPHzAK4xjw5Yerj3itQe4L+5X5Bmh1VDZ4CD4aUSj6Fk/N?=
 =?us-ascii?Q?QoB1aOkMVdsj8CJVy+0F2VNLcTl18XruxHZTimsvs7Dyjo64hcCSqtoDj1mo?=
 =?us-ascii?Q?U4m6i/t2PGKmOmumsbM/gNLdplZuFd3WqbF7k2adfcOCjR1NTUeQn/zpbk6C?=
 =?us-ascii?Q?+653t2LgeFetgfPrmQMJAZs3omJlL0EGXrMQVB9Qn3XL/P2lf4gJS/ckulfG?=
 =?us-ascii?Q?5FI5PfAiOgxcddzkZtVbQ/9EpYeJ9WSdrB5t12qfprEh7oQrcDMIVjs36zcX?=
 =?us-ascii?Q?zsdW4g5CXlNLCCmTptzg1wEF1W8vGwYUZmbApuyq3cn87VllC1v+y6GbzmxT?=
 =?us-ascii?Q?NbrPffBVSYLAmmVzxN4bBHs7RCliGz35sF7+UqB/oDcD+sl0g/V+CHRhuFN9?=
 =?us-ascii?Q?DGVNip2BM2edtS2Vfb6QU3ZuOtjwJ1phGQxCgcs/dBxe8E2PZhMduQC6sSus?=
 =?us-ascii?Q?TZyT5LjK/xUvr8mDAAGejauz0AVM4KSfE7/5dKuGR8k4DCSv7Mgqz4fy8cTb?=
 =?us-ascii?Q?2x1AIe6NKogX9Ta7tsiaZ2Zgws6Aqfg2+brjNFq1u/JuzuwZ3e/JbuatXfdp?=
 =?us-ascii?Q?rZF2PQzsSqN2KEvE458vt7RNj2GRufEICsPrYz3z9k4rZxmwn3TS6Ba+2k+l?=
 =?us-ascii?Q?zjRcX183yozcLu9m2WHofnpA5D4iQb8oZE0FDG3ITHVhN55EAfV7baJVi1ER?=
 =?us-ascii?Q?ACeSHAWL+OCLHr4ED7iG3gar06FemDTq4hs9SPNeWmKZnMP8lCbVMusNB84H?=
 =?us-ascii?Q?GlYy8mG6WL89mQDEW5FsFnVYO/zc3ZVaYvdroyjdY2a2DmcI2IZ5azU54kDR?=
 =?us-ascii?Q?Q9nRYKYADnM2THGEsaCC+wovTzm0rsVUjP5KVwsBI92mOYP4OL0RHEsihef2?=
 =?us-ascii?Q?ZUqJhIiFJg6LKUIWzInnGIF8UOb3zfbenY2l9sFpuj6ft5U6NQ0LnQn9nffu?=
 =?us-ascii?Q?dfWC?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c7cfc02a-5227-4ff3-10a6-08d898a11de3
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Dec 2020 22:08:23.3383 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YcFJBuN/vW62HtkwblxIqKwP491qIe905ePru3vDSmxBcFzR8uhZCbmi+AVfY4UoVBoFcd4rzoNKJvStsmbMcAzcKHmUqD4OmCQ1GfM5gXg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4072
Received-SPF: pass client-ip=40.107.21.136;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR05-VI1-obe.outbound.protection.outlook.com
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
 qapi/block-core.json           |  8 +++--
 include/block/block_int.h      |  1 +
 block/monitor/block-hmp-cmds.c |  3 +-
 block/stream.c                 | 50 +++++++++++++++++++---------
 blockdev.c                     | 61 ++++++++++++++++++++++++++++------
 5 files changed, 94 insertions(+), 29 deletions(-)

diff --git a/qapi/block-core.json b/qapi/block-core.json
index 04055ef50c..5d6681a35d 100644
--- a/qapi/block-core.json
+++ b/qapi/block-core.json
@@ -2522,6 +2522,10 @@
 # @base-node: the node name of the backing file.
 #             It cannot be set if @base is also set. (Since 2.8)
 #
+# @bottom: the last node in the chain that should be streamed into
+#          top. It cannot be set any of @base, @base-node or @backing-file
+#          is set. It cannot be filter node. (Since 6.0)
+#
 # @backing-file: The backing file string to write into the top
 #                image. This filename is not validated.
 #
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
index 247e166ab6..b13154edbf 100644
--- a/include/block/block_int.h
+++ b/include/block/block_int.h
@@ -1152,6 +1152,7 @@ int is_windows_drive(const char *filename);
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
index c208393c34..a2744d07fe 100644
--- a/block/stream.c
+++ b/block/stream.c
@@ -237,6 +237,7 @@ static const BlockJobDriver stream_job_driver = {
 
 void stream_start(const char *job_id, BlockDriverState *bs,
                   BlockDriverState *base, const char *backing_file_str,
+                  BlockDriverState *bottom,
                   int creation_flags, int64_t speed,
                   BlockdevOnError on_error,
                   const char *filter_node_name,
@@ -246,25 +247,42 @@ void stream_start(const char *job_id, BlockDriverState *bs,
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
index 70900f4f77..e0e19db88b 100644
--- a/blockdev.c
+++ b/blockdev.c
@@ -2497,6 +2497,7 @@ void qmp_block_stream(bool has_job_id, const char *job_id, const char *device,
                       bool has_base, const char *base,
                       bool has_base_node, const char *base_node,
                       bool has_backing_file, const char *backing_file,
+                      bool has_bottom, const char *bottom,
                       bool has_speed, int64_t speed,
                       bool has_on_error, BlockdevOnError on_error,
                       bool has_filter_node_name, const char *filter_node_name,
@@ -2504,16 +2505,37 @@ void qmp_block_stream(bool has_job_id, const char *job_id, const char *device,
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
+    struct {
+        bool a;
+        const char *a_name;
+        bool b;
+        const char *b_name;
+    } restricted_pairs[] = {
+        {has_base, "base", has_base_node, "base-node"},
+        {has_bottom, "bottom", has_base, "base"},
+        {has_bottom, "bottom", has_base_node, "base-node"},
+        {has_bottom, "bottom", has_backing_file, "backing-file"},
+        {0}
+    }, *rp = restricted_pairs;
 
     if (!has_on_error) {
         on_error = BLOCKDEV_ON_ERROR_REPORT;
     }
 
+    for ( ; rp->a_name; rp++) {
+        if (rp->a && rp->b) {
+            error_setg(errp, "'%s' and '%s' cannot be specified "
+                       "at the same time", rp->a_name, rp->b_name);
+            return;
+        }
+    }
+
     bs = bdrv_lookup_bs(device, device, errp);
     if (!bs) {
         return;
@@ -2522,12 +2544,6 @@ void qmp_block_stream(bool has_job_id, const char *job_id, const char *device,
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
@@ -2551,8 +2567,33 @@ void qmp_block_stream(bool has_job_id, const char *job_id, const char *device,
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
+            error_setg(errp, "Node '%s' is filter, use non-filter node"
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
@@ -2576,7 +2617,7 @@ void qmp_block_stream(bool has_job_id, const char *job_id, const char *device,
     }
 
     stream_start(has_job_id ? job_id : NULL, bs, base_bs, backing_file,
-                 job_flags, has_speed ? speed : 0, on_error,
+                 bottom_bs, job_flags, has_speed ? speed : 0, on_error,
                  filter_node_name, &local_err);
     if (local_err) {
         error_propagate(errp, local_err);
-- 
2.21.3


