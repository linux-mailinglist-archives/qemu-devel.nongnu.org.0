Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 075442B938F
	for <lists+qemu-devel@lfdr.de>; Thu, 19 Nov 2020 14:21:42 +0100 (CET)
Received: from localhost ([::1]:56666 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kfjsb-0002NI-2d
	for lists+qemu-devel@lfdr.de; Thu, 19 Nov 2020 08:21:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59304)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1kfjoG-0006Oc-30; Thu, 19 Nov 2020 08:17:12 -0500
Received: from mail-eopbgr80122.outbound.protection.outlook.com
 ([40.107.8.122]:25503 helo=EUR04-VI1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1kfjoC-00062k-E7; Thu, 19 Nov 2020 08:17:11 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=G+iJVyfWb/6dS8/ZU7OHhuXluQZudZ9u52Hbj9TS11vvzd13X1fmDMVNqs0bfPlc4AlX+05AFzFJVIsoYjiOndHn6GEgEfvKA5wW9U7stDjniUW6PAAib+um8hgJXPQfOklkLxIqng7iG+kOQCf4XiOMmvZNMZttyXmiVFJXt/SaZb3Yo4p3ubBEbEXBOYmiATIfMb+Oxx5Jv75dkM2dGco+SQlcn36mOeKJ7hnJOIZniN3zQfXL7i9za59n9F4CB2rw+bqScVQAMrsOEnzg1QWItrzttDOI76lnPiP/MSEWwgcnb4cyXqTo6P2foD3/kfUWBPmQDpmtsvB7jXFuDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JyHmjzYM881334lgbH5kWx0S6pC1N/n7Jkm9g0gHqyQ=;
 b=Yy6TNDYMwxTPYzZ3C1k9R8wSOVEz+Wt9oCr/XQfGBH0b2FVQMMNZeXbD3F0ph5ntdxq61r4alTwnpCLJkY94hGXcnax7HdEe+RiSa6bxIZhdAz0l3Kdus0SGzTmeKq8A7Qyu4W8j/cca8UisFS0e94c61jNgkXEOk7vg+99L0eMSCK344EHOwKIoGbB0kjvJ6hQs3jwlqaqZ36MEnt02rGwyP4KVGBDLJuQgo2MuXlZu7Q52TyoFf1yhR3MbFVfCie+BChiiolwjPLie5lxkgt+Bw6GIbR9JVl2Ty/l68RevvVNTtkE2YZMwWhmQjCFU/Yq+M35wkbc5/ZXFa+1/+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JyHmjzYM881334lgbH5kWx0S6pC1N/n7Jkm9g0gHqyQ=;
 b=UebP42XxKcx3bLnd6yMD+7W5tZleLxQhcYw4SmoYQJr4ejPMx2xJKdOorz0W7uvZFNqn6A45+1tfcB5D46rM263IJdmmPXwoO6UIXmw9wL8r8KMJW6pjRSZ1XaTF8NMYh4gyASNabdyvBDpbRDc0BGMSTpgWZalKGwC2b8Y1E6w=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM5PR0801MB1844.eurprd08.prod.outlook.com (2603:10a6:203:39::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3589.22; Thu, 19 Nov
 2020 13:16:54 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::fd02:1330:f620:1243]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::fd02:1330:f620:1243%9]) with mapi id 15.20.3589.021; Thu, 19 Nov 2020
 13:16:54 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, crosa@redhat.com, ehabkost@redhat.com,
 vsementsov@virtuozzo.com, eblake@redhat.com, jsnow@redhat.com,
 armbru@redhat.com, mreitz@redhat.com, kwolf@redhat.com, den@openvz.org,
 andrey.shinkevich@virtuozzo.com
Subject: [PATCH 3/4] block: add dbg_dump_block_layer()
Date: Thu, 19 Nov 2020 16:16:33 +0300
Message-Id: <20201119131634.14009-4-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.21.3
In-Reply-To: <20201119131634.14009-1-vsementsov@virtuozzo.com>
References: <20201119131634.14009-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [185.215.60.89]
X-ClientProxiedBy: AM0PR07CA0031.eurprd07.prod.outlook.com
 (2603:10a6:208:ac::44) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from kvm.sw.ru (185.215.60.89) by
 AM0PR07CA0031.eurprd07.prod.outlook.com (2603:10a6:208:ac::44) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3589.15 via Frontend Transport; Thu, 19 Nov 2020 13:16:53 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3125164a-c84a-4f28-8e49-08d88c8d623e
X-MS-TrafficTypeDiagnostic: AM5PR0801MB1844:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM5PR0801MB1844DF5EA46FC33D2594BD23C1E00@AM5PR0801MB1844.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:569;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: vh/W3g30Q2zRZOaXk+Th8+OXMd/alHXI0l2k+iKTgSYDpxVshQpLgVI8EENrsYjsqM+VRRoerxxVnQmlk32qlMHVv1Nu0ONkNVQYwnOXEz5ldJG63vdMW7NxeV/E+u9hNpL8lyx/0/23nKS4IXIbtYBTZuPF4eDvZR45z2C7QdZqY752eVR0kvU0nLqfI+PnN/888N1ZrgRdHzBu2QUEK+v93FZsBX/SVlMoCjVnf+ZDTJp4999j18zHbauMG0al03JGdEzaCwthRxCtrjRYumoXcZ+afZYUmJrwbDRUaHw2FNkN/fvxTo03kg6TW5OZy2f3Fn7+W3IesFQ2GA8FCa8VSZ5+TgmUuzBFJLHAl3Wws+4FVwSfLIlkTQ6dJ/+o
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(39840400004)(136003)(366004)(376002)(346002)(6486002)(36756003)(186003)(16526019)(316002)(2616005)(26005)(4326008)(107886003)(478600001)(6512007)(83380400001)(6916009)(8676002)(6506007)(52116002)(6666004)(2906002)(8936002)(956004)(66946007)(1076003)(66476007)(86362001)(66556008)(5660300002)(245554002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: 4k/XIoJ97qguzQEnF7e8SNz0vwt+r7BLQBUBM7d+g0CzurlEP20vFZdO2wb2nJwSZlB3KdONRqJYInXCuteP2iuum1DYhPlzYd7T7DOcgLbQEQhsc89uKZRPNqyhk676civS/8l1EblEQLfduY570JIpW7lptBTW6Q2KBAs6WVfZAxb1fN8nWV944zr2Y3qv0m4ZGKOOA1dRuEYms9yI+l9dLPgYhWi9LV/XUjfceb8RgMVDW8V51WLgcGS+f35nSmMxto400EAw75R1nkctrG+OcOqO4E3CxORP1MBI6t9HfzJ28itzCxv98qLy2NXwJklefE0wJoww3yz2YD5DOVuT8RCX0zyr1N8Z1p3BUAF6xGFv6eLV8ZaHpCEQpeRRkdEg/pjTKi1Hn1TcyqqIu/sfn2yLj/Rhpr9tvMgi69sbeESxR/seLzTsD6QoOGpDjTKF57TFka6KVd2lZ/iknAKHiOexatEwWZH/07jbtu/dmgvtfz5HGMXHIxVWp9X8w/EAvVehU+cL8my9Qtfm2RRqom1CzgiE79QLA5qQ3kj53pcL4OTHkfqjyESHp1fT4/v08pt7oktGmygv5RL8NcHsXSEQZDDU0D1Y5zoXYY59ye4XfTg68OB4NguFJ4NgxBKidnQ0VkSL3hgwuJTOZw==
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3125164a-c84a-4f28-8e49-08d88c8d623e
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Nov 2020 13:16:54.1211 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5/l2munSrcbrewHQWDT1oSqaGOorr9xSR8IO5UnDME8Z3vGO88sgniAuLslODQEbKBSdfh6iGPZXst0v/krt2yU0JRmwF/4KJlULkuyxNck=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR0801MB1844
Received-SPF: pass client-ip=40.107.8.122;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR04-VI1-obe.outbound.protection.outlook.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/19 08:17:00
X-ACL-Warn: Detected OS   = Windows NT kernel [generic] [fuzzy]
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

Add function for debugging: we already have x-debug-query-block-graph
qmp command and scripts/render_block_graph.py which can dump
block-layer graph for running vm using qmp command. But when debug
block layer code, its often needed to dump some intermediate state
during some operation, so separate qmp command doesn't help.

So, let's introduce a function which can dump needed information into
json file.

In next commit we'll update scripts/render_block_graph.py so that it
will be able to parse json files.

For new function to not crash if we have mirror_top filter node not yet
bdrv_append()ed (to debug why it can't be appended), make
bdrv_get_allocated_file_size() and bdrv_refresh_filename() not crash on
filters without a child.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 qapi/block-core.json  | 13 +++++++++++
 include/block/block.h |  3 +++
 block.c               | 51 ++++++++++++++++++++++++++++++++++++++++++-
 3 files changed, 66 insertions(+), 1 deletion(-)

diff --git a/qapi/block-core.json b/qapi/block-core.json
index 04ad80bc1e..3f8e5a3822 100644
--- a/qapi/block-core.json
+++ b/qapi/block-core.json
@@ -1908,6 +1908,19 @@
 ##
 { 'command': 'x-debug-query-block-graph', 'returns': 'XDbgBlockGraph' }
 
+##
+# @XDbgBlockLayerDump:
+#
+# Unite query-named-block-nodes, query-block-jobs and
+# x-debug-query-block-graph results into one structure for block_layer_dump()
+# function.
+#
+# Since: 5.3
+##
+{ 'struct': 'XDbgBlockLayerDump',
+  'data': { 'nodes': ['BlockDeviceInfo'], 'jobs': ['BlockJobInfo'],
+            'graph': 'XDbgBlockGraph' } }
+
 ##
 # @drive-mirror:
 #
diff --git a/include/block/block.h b/include/block/block.h
index d17151abd7..6a75bbc84c 100644
--- a/include/block/block.h
+++ b/include/block/block.h
@@ -836,4 +836,7 @@ int coroutine_fn bdrv_co_copy_range(BdrvChild *src, uint64_t src_offset,
                                     BdrvChild *dst, uint64_t dst_offset,
                                     uint64_t bytes, BdrvRequestFlags read_flags,
                                     BdrvRequestFlags write_flags);
+
+int dbg_dump_block_layer(const char *filename, Error **errp);
+
 #endif
diff --git a/block.c b/block.c
index eca16a5e29..82f847a88e 100644
--- a/block.c
+++ b/block.c
@@ -5035,7 +5035,8 @@ int64_t bdrv_get_allocated_file_size(BlockDriverState *bs)
         return -ENOTSUP;
     } else if (drv->is_filter) {
         /* Filter drivers default to the size of their filtered child */
-        return bdrv_get_allocated_file_size(bdrv_filter_bs(bs));
+        return bdrv_filter_child(bs) ?
+            bdrv_get_allocated_file_size(bdrv_filter_bs(bs)) : -ENOMEDIUM;
     } else {
         /* Other drivers default to summing their children's sizes */
         return bdrv_sum_allocated_file_size(bs);
@@ -5382,6 +5383,51 @@ XDbgBlockGraph *bdrv_get_xdbg_block_graph(void)
     return xdbg_graph_finalize(gr);
 }
 
+int dbg_dump_block_layer(const char *filename, Error **errp)
+{
+    ERRP_GUARD();
+    Visitor *v;
+    g_autoptr(XDbgBlockLayerDump) dump = g_new0(XDbgBlockLayerDump, 1);
+    QObject *obj = NULL;
+    QString *json;
+    FILE *f;
+
+    dump->nodes = bdrv_named_nodes_list(false, errp);
+    if (*errp) {
+        return -EINVAL;
+    }
+    dump->jobs = block_jobs_info_list(errp);
+    if (*errp) {
+        return -EINVAL;
+    }
+    dump->graph = bdrv_get_xdbg_block_graph();
+
+    v = qobject_output_visitor_new(&obj);
+    if (visit_type_XDbgBlockLayerDump(v, "unused", &dump, errp)) {
+        visit_complete(v, &obj);
+    }
+    visit_free(v);
+    if (*errp) {
+        return -EINVAL;
+    }
+
+    json = qobject_to_json_pretty(obj);
+    qobject_unref(obj);
+
+    f = fopen(filename, "w");
+    if (!f) {
+        error_setg_errno(errp, errno, "Can't open file '%s'", filename);
+        qobject_unref(json);
+        return -EINVAL;
+    }
+
+    fputs(qstring_get_str(json), f);
+    fclose(f);
+    qobject_unref(json);
+
+    return 0;
+}
+
 BlockDriverState *bdrv_lookup_bs(const char *device,
                                  const char *node_name,
                                  Error **errp)
@@ -6885,6 +6931,9 @@ void bdrv_refresh_filename(BlockDriverState *bs)
     if (bs->implicit) {
         /* For implicit nodes, just copy everything from the single child */
         child = QLIST_FIRST(&bs->children);
+        if (!child) {
+            return;
+        }
         assert(QLIST_NEXT(child, next) == NULL);
 
         pstrcpy(bs->exact_filename, sizeof(bs->exact_filename),
-- 
2.21.3


