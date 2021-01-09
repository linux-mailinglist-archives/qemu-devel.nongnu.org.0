Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 697E12EFFB0
	for <lists+qemu-devel@lfdr.de>; Sat,  9 Jan 2021 14:02:37 +0100 (CET)
Received: from localhost ([::1]:48096 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kyDt6-0000Gv-Eg
	for lists+qemu-devel@lfdr.de; Sat, 09 Jan 2021 08:02:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55414)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1kyDpf-0006Uf-1F; Sat, 09 Jan 2021 07:59:03 -0500
Received: from mail-eopbgr60103.outbound.protection.outlook.com
 ([40.107.6.103]:49158 helo=EUR04-DB3-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1kyDpd-0003dJ-6F; Sat, 09 Jan 2021 07:59:02 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TQIKLMOAF7X7xhz1rWU0Rv/547OmjijI0MiRImqaVWaLuMgXqLGPzW1TJ+t5uuqKyVykvlk8hdKxNXdEvcCbHthfQUxzyGcDzdYfnZsQ2sUfagLJx6tqUUf57fA73A/cIiQXhlMnY+xPzlN6i9IpuCcbXBWDtapCS5qU4XB4y8f6YABZXFSYX3qivNQFj+FjnB8gw+grK6v10v8uixFAPlSgjEUMntvr70c3plsXQF21Jt+ZyP1r3Gvh0aFff1OFTfZWkCE7kCIdFdnYc4ezZXpQJ71aUAa6rXNwr58zWilGkSWJoENtHw60JaMcJPXcxN2YwQO1qXrvD/z6E4eCwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8zeKglbOSbkoq0KTpzCbKUOHNoM3e4XBjXK1pjimCmI=;
 b=mvxKlF/unsz5NIYkB02EUp3xhviBZNaJkQlkeS/MJeIMAYxxwO1NgmmT2k+E8Qikzp/6Q9hf9e9Kpez9t+rv+Nyl7zqneS2KeE6KxdVKj73x4EhI/i+ifhvwmQJN2EjCf0/mJz0qjqZWcjIt1yvzUICeeB20fa9si4ixIkM2P3TvrRMIsgU1ERfMbcU1QeAa1+LYnfa3VmiYlk7RdsukGaKHPJiqO6+ZdByNUh5jin8IP2q4QpdzRHWy64Yi+MydzlYexgn2GxqWS67RnN/r9zbzzPUUH/zJSouk0w6gzWJVozSDWfyI6SODD7G42EkgeSYTgCkATVK5fVyYiH/WMw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8zeKglbOSbkoq0KTpzCbKUOHNoM3e4XBjXK1pjimCmI=;
 b=CHXDa6f8+ySf94XC4w5dmpj55x9yAM4XUfY22Io9t7hleJJabLuOHe+FXXzfe6+VK826z+9MorepN6zUeF+J3fLQPY0raqv6c/JT/bRlmE9kA+F0R/U2kQ2C6OJLq5UBliBREECOMn8Y+Vy/WtnzraXOc829V1JCSeE0MLt69s4=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM5PR0802MB2418.eurprd08.prod.outlook.com (2603:10a6:203:9f::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3742.6; Sat, 9 Jan
 2021 12:58:51 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::214a:3545:368c:7ae8]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::214a:3545:368c:7ae8%7]) with mapi id 15.20.3742.011; Sat, 9 Jan 2021
 12:58:51 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Subject: [PATCH v5 09/14] block/qcow2-bitmap: improve
 qcow2_load_dirty_bitmaps() interface
Date: Sat,  9 Jan 2021 15:58:06 +0300
Message-Id: <20210109125811.209870-10-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210109125811.209870-1-vsementsov@virtuozzo.com>
References: <20210109125811.209870-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [185.215.60.119]
X-ClientProxiedBy: AM0PR04CA0053.eurprd04.prod.outlook.com
 (2603:10a6:208:1::30) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from kvm.sw.ru (185.215.60.119) by
 AM0PR04CA0053.eurprd04.prod.outlook.com (2603:10a6:208:1::30) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3742.6 via Frontend Transport; Sat, 9 Jan 2021 12:58:50 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b85fb0eb-4353-4b05-7310-08d8b49e5041
X-MS-TrafficTypeDiagnostic: AM5PR0802MB2418:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM5PR0802MB2418513664F03EDCE7E22682C1AD0@AM5PR0802MB2418.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1051;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: i3jAWHe87/Ngy7b5kkghG4i2olRT067NIYLAgS1trUFXhysa8tJKZKQSTCcVENSdV34XdYyvK+P2zCu3n4/ZLeZ4azv21lFQlFlg4r8P9YLfmTr4SyLTA5TUHEtA+RIP56nfnzaWbSNTf6irfJs8gsQ99Tn9bhSCdZ8GIOLfX34Ve1Xcgbl7O2s6UwAyVBksZWfAjHA6MvM6x34lY7qrpXCbAFKEvpu1a1b0IaI++a3veHlMkBu+cn9K1YDdW9xUPdn/FYcxNAO01f+YdR00F4EeapvCwTS6coRHBMy34gx8A9wbOkT51odWYGF2wl3hGCz8ImaWMsW/78LbXOU7amfUKNhAo2sStirJK4HOG1nV//SXwisQn8ofHntZgRzE5k8KPBSXTwTRUH+HdFRlUJrCEJWEDIzo9GVJ9zsDzQLYzd+5Ua6FX9ud5hRUTTEM
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(136003)(346002)(396003)(376002)(39840400004)(956004)(2616005)(66946007)(478600001)(8676002)(5660300002)(66476007)(66556008)(6916009)(83380400001)(52116002)(2906002)(6666004)(8936002)(1076003)(6506007)(316002)(26005)(4326008)(186003)(16526019)(7416002)(19627235002)(36756003)(6512007)(6486002)(86362001)(14143004);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?b6WUEoDY51H0QgR21B4dM3jlJqpORwR/2PhH8nAe+7qJXrlMPxNL7cHmau+w?=
 =?us-ascii?Q?agic5UgkDm1TNRbGkWkzp2BQb1hadtcX+84WjgBza8hPlqMO0B6VLiBNoS9A?=
 =?us-ascii?Q?3T1efjgGlRuXx7H291Te9dJWY87fCt+QJuNsBmI2RinjDgkpX4mXAZ890vLk?=
 =?us-ascii?Q?H3ZmtRj9xAacinxXtW9vAkMjSOET5hWGNfTu5GS/emr172v9IfLT/x4zmmCA?=
 =?us-ascii?Q?KhgWQqUK1j7ODN4nV8w86uxY8D797WNcF4tgjfu2WPIYulfuud3DNuhPQRR+?=
 =?us-ascii?Q?Ft1BDBJwkFJSOmvKHXbPo6G7reXPyYmfyY6omHyNMSesQgK5UygHLSYw/CrI?=
 =?us-ascii?Q?zE2a3IQA15KyRylV9pvCPCcPVZ4l1sy44Sdk3HQNUwd9CguRxvOykNHvZOs0?=
 =?us-ascii?Q?jCbD7rgcg7K7v9NHPD0zzpxqvLlFUd9s3L5vZ6ayhxqzCs10uxbkkQQQgEy9?=
 =?us-ascii?Q?qgBViZQSr1Y8Vy1N9zUcQkzv9OH5vhKTKH+7/MMleBqcds3hzr9fYzO2pofT?=
 =?us-ascii?Q?gQ7tgrqmU+0Xy5Qj+h4UE+NXzGAVno/3eSDqPEFFXwnhIDxQ1zJ7o+ci3yHa?=
 =?us-ascii?Q?P5fgTI/SV7YT+ae5xFJOsJaRzY3Xavo9B7n48rvbOICdEBK+8pggmgRgRE+O?=
 =?us-ascii?Q?pAqyV/bIzDIw1SKOGpPN+O/UFXXQtewGAcR1j7LvKAHur2dV/TbFiW8Bf450?=
 =?us-ascii?Q?PKKTzChqN0CxcI2eSaCuOqrsQAZxjNCbCRjhvMaZSgIUeizgKbIoE7RMi4DI?=
 =?us-ascii?Q?AhRy35JwtTD6+RXDVDrlD+eEeds5GMyejHJpucMyMTN3F/mHF58VpLNBKSo5?=
 =?us-ascii?Q?N/LKQl5/HPt6sYG+NBnIuCrAd5YJIGaz77uVs3rlQ6TN1qNOzMMOS5cg3lCw?=
 =?us-ascii?Q?NmY7lTsqVKl1Haf3cwm3jIgZ4PkaIKrsJcKXS+BQl7+2WJUHaeMsSeYNn8ZZ?=
 =?us-ascii?Q?IxNjkijTg95gXKNoBw8vnms4ls40RmBaUx/COnwZXgtP12RYygzghlL5xAST?=
 =?us-ascii?Q?qFQL?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jan 2021 12:58:51.6298 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-Network-Message-Id: b85fb0eb-4353-4b05-7310-08d8b49e5041
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UVBYcR6Ckq8dHwjKcYq9sPpmes5vBvjY8Lcu4rzZeihhAKRtDV3MliCtEltACghyqcQBHZAw1u3xTezwbYHnSydTDXQnj8qqyCbjYSybENw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR0802MB2418
Received-SPF: pass client-ip=40.107.6.103;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR04-DB3-obe.outbound.protection.outlook.com
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
Cc: kwolf@redhat.com, vsementsov@virtuozzo.com, berto@igalia.com,
 pavel.dovgaluk@ispras.ru, qemu-devel@nongnu.org, armbru@redhat.com,
 Greg Kurz <groug@kaod.org>, stefanha@redhat.com, pbonzini@redhat.com,
 mreitz@redhat.com, jsnow@redhat.com, ari@tuxera.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

It's recommended for bool functions with errp to return true on success
and false on failure. Non-standard interfaces don't help to understand
the code. The change is also needed to reduce error propagation.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Reviewed-by: Alberto Garcia <berto@igalia.com>
Reviewed-by: Greg Kurz <groug@kaod.org>
---
 block/qcow2.h        |  3 ++-
 block/qcow2-bitmap.c | 26 +++++++++++++++-----------
 block/qcow2.c        |  6 ++----
 3 files changed, 19 insertions(+), 16 deletions(-)

diff --git a/block/qcow2.h b/block/qcow2.h
index a6bf2881bb..d19c883206 100644
--- a/block/qcow2.h
+++ b/block/qcow2.h
@@ -978,7 +978,8 @@ void qcow2_cache_discard(Qcow2Cache *c, void *table);
 int qcow2_check_bitmaps_refcounts(BlockDriverState *bs, BdrvCheckResult *res,
                                   void **refcount_table,
                                   int64_t *refcount_table_size);
-bool qcow2_load_dirty_bitmaps(BlockDriverState *bs, Error **errp);
+bool qcow2_load_dirty_bitmaps(BlockDriverState *bs, bool *header_updated,
+                              Error **errp);
 bool qcow2_get_bitmap_info_list(BlockDriverState *bs,
                                 Qcow2BitmapInfoList **info_list, Error **errp);
 int qcow2_reopen_bitmaps_rw(BlockDriverState *bs, Error **errp);
diff --git a/block/qcow2-bitmap.c b/block/qcow2-bitmap.c
index 55cd52ab96..ca01f08bac 100644
--- a/block/qcow2-bitmap.c
+++ b/block/qcow2-bitmap.c
@@ -962,25 +962,27 @@ static void set_readonly_helper(gpointer bitmap, gpointer value)
     bdrv_dirty_bitmap_set_readonly(bitmap, (bool)value);
 }
 
-/* qcow2_load_dirty_bitmaps()
- * Return value is a hint for caller: true means that the Qcow2 header was
- * updated. (false doesn't mean that the header should be updated by the
- * caller, it just means that updating was not needed or the image cannot be
- * written to).
- * On failure the function returns false.
+/*
+ * Return true on success, false on failure.
+ * If header_updated is not NULL then it is set appropriately regardless of
+ * the return value.
  */
-bool qcow2_load_dirty_bitmaps(BlockDriverState *bs, Error **errp)
+bool qcow2_load_dirty_bitmaps(BlockDriverState *bs, bool *header_updated,
+                              Error **errp)
 {
     BDRVQcow2State *s = bs->opaque;
     Qcow2BitmapList *bm_list;
     Qcow2Bitmap *bm;
     GSList *created_dirty_bitmaps = NULL;
-    bool header_updated = false;
     bool needs_update = false;
 
+    if (header_updated) {
+        *header_updated = false;
+    }
+
     if (s->nb_bitmaps == 0) {
         /* No bitmaps - nothing to do */
-        return false;
+        return true;
     }
 
     bm_list = bitmap_list_load(bs, s->bitmap_directory_offset,
@@ -1036,7 +1038,9 @@ bool qcow2_load_dirty_bitmaps(BlockDriverState *bs, Error **errp)
             error_setg_errno(errp, -ret, "Can't update bitmap directory");
             goto fail;
         }
-        header_updated = true;
+        if (header_updated) {
+            *header_updated = true;
+        }
     }
 
     if (!can_write(bs)) {
@@ -1047,7 +1051,7 @@ bool qcow2_load_dirty_bitmaps(BlockDriverState *bs, Error **errp)
     g_slist_free(created_dirty_bitmaps);
     bitmap_list_free(bm_list);
 
-    return header_updated;
+    return true;
 
 fail:
     g_slist_foreach(created_dirty_bitmaps, release_dirty_bitmap_helper, bs);
diff --git a/block/qcow2.c b/block/qcow2.c
index 1e83c6cebe..20d67bd9c7 100644
--- a/block/qcow2.c
+++ b/block/qcow2.c
@@ -1296,7 +1296,6 @@ static int coroutine_fn qcow2_do_open(BlockDriverState *bs, QDict *options,
     unsigned int len, i;
     int ret = 0;
     QCowHeader header;
-    Error *local_err = NULL;
     uint64_t ext_end;
     uint64_t l1_vm_state_index;
     bool update_header = false;
@@ -1784,9 +1783,8 @@ static int coroutine_fn qcow2_do_open(BlockDriverState *bs, QDict *options,
 
     if (!(bdrv_get_flags(bs) & BDRV_O_INACTIVE)) {
         /* It's case 1, 2 or 3.2. Or 3.1 which is BUG in management layer. */
-        bool header_updated = qcow2_load_dirty_bitmaps(bs, &local_err);
-        if (local_err != NULL) {
-            error_propagate(errp, local_err);
+        bool header_updated;
+        if (!qcow2_load_dirty_bitmaps(bs, &header_updated, errp)) {
             ret = -EINVAL;
             goto fail;
         }
-- 
2.29.2


