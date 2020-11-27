Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D6A02C6871
	for <lists+qemu-devel@lfdr.de>; Fri, 27 Nov 2020 16:08:19 +0100 (CET)
Received: from localhost ([::1]:45056 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kifMA-0002Vp-60
	for lists+qemu-devel@lfdr.de; Fri, 27 Nov 2020 10:08:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36926)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1kif1E-0001PU-0y; Fri, 27 Nov 2020 09:46:40 -0500
Received: from mail-am6eur05on2120.outbound.protection.outlook.com
 ([40.107.22.120]:28961 helo=EUR05-AM6-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1kif1B-0003Ef-Fl; Fri, 27 Nov 2020 09:46:39 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lLJEbuwlw8f8k+6q0nFLR+0oXk+fuMeiXKggt7GVavUIH9eP5HEDWLxEG87d2Lk+BPZN0JGGF5gq4uoz4cNyfgZE2LNaEGj9ssJ5Yw+QXM2LYinI+7mRpPxvbeW/MHM9JUm2XrdgcCafhA6Rtj6rGZ5mZroE/uCvOkkyRD7ghlkmBaVuOZKq05+4KFZY+VhlbJy21HKImYZPOzuTvWHr1vHGu2aW8ITH13QFIHBNl63zA26CIAMRT45I8bZry8cknWGSDmdZLCkmn+DZIvvlFko8kOHTH0huX3nAqP0J/wNiBDqGHf8l8hCHf3eVaJMeAHHcVFnQwNwfs8oV+Kcymw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=e3/jJ11NmJYIGTmvc/E+AaxtaGcjfHbiP48Ga6tajLw=;
 b=nSoupAB36CIRJGPWNfuzlddQsN0tfa3MjdpnAj0yxstd6PvpWNhzWGgsihzS73PljeXjBFzUdNLkF9H3GMUU3EIyIMR35krIy53JeHJxIkCZBYnaTqEdQ8/kuadU2FwuSrCei84rKj0fj1FbrvS69ATY2AOM8fJ/WVKiNO+7UT5XRf9pO47XmNgL8f6zCjJBOlLtyDPFdnojSC2vzDIweGs0rFEenywOsvYMI1L/00VapsU7hC/yMvTXAfSxqDpz0pJB1c5WtzmMBFWDhQf+e9faF8wV+3Yb+df0PyaXOlneJf0mBNlenv4cV0wq3XrqPIaTDsiBdeEoCFeEOEnefA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=e3/jJ11NmJYIGTmvc/E+AaxtaGcjfHbiP48Ga6tajLw=;
 b=firMSDmadOgBkaCrdXjYkD0zXavWk2aGPfykQeGlUJ3/ALlNKlQp+/kBthu6FRpjX2wClnnKPwuovroKMdTon4fwUmS7I95DOMShOcaPsVP5qLstwwazJocOcaEzPGE6RS0nIpMWzvMds4DW4vZHWCIKzwp5BeKrRzFBpTNeDhw=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB5078.eurprd08.prod.outlook.com (2603:10a6:20b:e7::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3611.25; Fri, 27 Nov
 2020 14:46:10 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::d585:99a4:d7a4:d478]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::d585:99a4:d7a4:d478%4]) with mapi id 15.20.3611.025; Fri, 27 Nov 2020
 14:46:10 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, armbru@redhat.com, jsnow@redhat.com,
 mreitz@redhat.com, kwolf@redhat.com, vsementsov@virtuozzo.com,
 den@openvz.org
Subject: [PATCH v2 25/36] block: introduce bdrv_drop_filter()
Date: Fri, 27 Nov 2020 17:45:11 +0300
Message-Id: <20201127144522.29991-26-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.21.3
In-Reply-To: <20201127144522.29991-1-vsementsov@virtuozzo.com>
References: <20201127144522.29991-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [185.215.60.91]
X-ClientProxiedBy: AM4PR0501CA0052.eurprd05.prod.outlook.com
 (2603:10a6:200:68::20) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (185.215.60.91) by
 AM4PR0501CA0052.eurprd05.prod.outlook.com (2603:10a6:200:68::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3611.22 via Frontend
 Transport; Fri, 27 Nov 2020 14:45:55 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7ae10653-b76b-4785-45e9-08d892e325a9
X-MS-TrafficTypeDiagnostic: AM6PR08MB5078:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR08MB50781B384F316B60CC44BA7BC1F80@AM6PR08MB5078.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3826;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: JixDfZX+m8BIFjdmn/maumd/4lXempl1MyE+3fvm9tdAj9NlSTVGt7mWrigQXfv9lSNk+m6zSGK0KJhavExQh1wqnOb1SEZF2fYhvxOSL1jN+YR0yeS0IkXpDAOy/mpsLA6mYboayPsKitf3e7900uTzrTgyq0ChpJSlLIUZptOq2MnLZXVbq2R0A7poD6Ty6VuWMjZKv6xwhd7/dr15gK66zVBh7+vmwPagG/I4Bfg9PjRwFuAdg5DyM31zjg+BbxdNDRCiu6KjWHmyvTp16k0yg8V4GXenyxzh3AZ9JaYmr9YFcIm/EdbyFQkMyYpBNPpAnOJK7kJkF8eySxIYYgvv8+O2Uz0Tcm0fvsehJ/+BCFEi99EQE2/q9iwm7xBt
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(39840400004)(346002)(136003)(396003)(376002)(86362001)(16526019)(66556008)(66476007)(478600001)(8676002)(186003)(66946007)(26005)(52116002)(83380400001)(6506007)(69590400008)(107886003)(6666004)(316002)(4326008)(36756003)(5660300002)(6486002)(2616005)(956004)(1076003)(6916009)(6512007)(8936002)(2906002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?VI+E9N9keUGti5svXkJRTU/veZbhjFkhgxzxTdZCCemseIcZkb5xZCpom7VM?=
 =?us-ascii?Q?b+3RVj0vvLJZNJC5oM51rgw5zNPZRQBumO3FIMMwQwE6TcsuDGU8TWVcZxFT?=
 =?us-ascii?Q?n1YvQn2zyGy1RUpGjEY4uNnU9BV2pI73ohmaUWxM3mFlEvc2T8MpFhn2kDZ0?=
 =?us-ascii?Q?87oyNRLNzYD0zx6XSKsgwqvqVbuu2H4u3ZjWue1tJlfJ+Pa+ks9ljuvX1gXv?=
 =?us-ascii?Q?sjJCo6P1jPNnsnbHtTQKFQGKyCdlaJlgq8F+5On9TzuubY/U5tc/aU9KZ68O?=
 =?us-ascii?Q?Bl33yxRSAZT6/78M+usXoLb2KIP1mCy2zyZjIt4AQPOBDAnSE+IDZqY99Ips?=
 =?us-ascii?Q?hM57LbpTqQOcD54psbbZ6EjUBlUtXgPau30EU6MTnTtKxSYM5Tvm9h4ot83U?=
 =?us-ascii?Q?2ONZy66h/jVe6sBEVjyZhS978bkwWYOI+lM4OL9dPd5X26plvQyqTFELQi/v?=
 =?us-ascii?Q?/WHF2LKemlRk5GemuHOn3IQtFGZJxQ+R1l7QI6Am2y+mielFj2ccrrYm7maI?=
 =?us-ascii?Q?vxCgHRuF3BIsi2RNUJ8yoUPOB1lwh1rr9swUlRNHmPho6tw3mPe9dJ+Mz4GG?=
 =?us-ascii?Q?tsRQMcJkyKVcEjucQL8QXYiTRZKJZEc8sZp+KmCg3t4LrBVafT/twFRBqzjX?=
 =?us-ascii?Q?Za8bZBn96DWNxJbItCirImwQx6/VgdjBdXvulMf7Yr/CQ+azYjyNnaVMAEc2?=
 =?us-ascii?Q?uGE1YKFRMIoSXB+u8ZyJByHKpM7Wpy2amlIccnrOKxb7ZaeSqNgB8qHeY1gh?=
 =?us-ascii?Q?zVkWswUH6wntVlIRsd3DjC4AskNtel3IQdbpE6WpS/dPIdS0TRFZpzaYOTiO?=
 =?us-ascii?Q?TdGAcnwbhsMeohhvB/+PDupeVCEJt2wuony1XFt9SOW6ACsD1XqukuqS1+wp?=
 =?us-ascii?Q?tNZ6A6aWhsK5AunhktYIdTPdMLMXScMMEIdsCgo0kXb+z8gHct6yxjEf+8Ok?=
 =?us-ascii?Q?0jcwr5jtsq9uRePE7H2Gtf+fItve8C6v3oPT50+HA0mtiEJktCBf7jyIDnpG?=
 =?us-ascii?Q?gmAP?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7ae10653-b76b-4785-45e9-08d892e325a9
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Nov 2020 14:45:56.1500 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1um8fenG6bUfn4k4RwPrdItqWZieJGt80nzH9HZm1Qk7kQeQYBrcQMFh+kxU1M9dOGzQEptounwqb1hSY95GdrbioozZHcVtsVadmBX2IpE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB5078
Received-SPF: pass client-ip=40.107.22.120;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR05-AM6-obe.outbound.protection.outlook.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Using bdrv_replace_node() for removing filter is not good enough: it
keeps child reference of the filter, which may conflict with original
top node during permission update.

Instead let's create new interface, which will do all graph
modifications first and then update permissions.

Let's modify bdrv_replace_node_common(), allowing it additionally drop
backing chain child link pointing to new node. This is quite
appropriate for bdrv_drop_intermediate() and makes possible to add
new bdrv_drop_filter() as a simple wrapper.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 include/block/block.h |  1 +
 block.c               | 42 ++++++++++++++++++++++++++++++++++++++----
 2 files changed, 39 insertions(+), 4 deletions(-)

diff --git a/include/block/block.h b/include/block/block.h
index 8f6100dad7..0f21ef313f 100644
--- a/include/block/block.h
+++ b/include/block/block.h
@@ -348,6 +348,7 @@ int bdrv_append(BlockDriverState *bs_new, BlockDriverState *bs_top,
                 Error **errp);
 int bdrv_replace_node(BlockDriverState *from, BlockDriverState *to,
                       Error **errp);
+int bdrv_drop_filter(BlockDriverState *bs, Error **errp);
 
 int bdrv_parse_aio(const char *mode, int *flags);
 int bdrv_parse_cache_mode(const char *mode, int *flags, bool *writethrough);
diff --git a/block.c b/block.c
index b1394b721c..e835a78f06 100644
--- a/block.c
+++ b/block.c
@@ -4919,7 +4919,6 @@ static TransactionActionDrv bdrv_remove_backing_drv = {
     .commit = bdrv_child_free,
 };
 
-__attribute__((unused))
 static void bdrv_remove_backing(BlockDriverState *bs, GSList **tran)
 {
     if (!bs->backing) {
@@ -4968,15 +4967,30 @@ static int bdrv_replace_node_noperm(BlockDriverState *from,
  *
  * With auto_skip=false the error is returned if from has a parent which should
  * not be updated.
+ *
+ * With detach_subchain to must be in a backing chain of from. In this case
+ * backing link of the cow-parent of @to is removed.
  */
 static int bdrv_replace_node_common(BlockDriverState *from,
                                     BlockDriverState *to,
-                                    bool auto_skip, Error **errp)
+                                    bool auto_skip, bool detach_subchain,
+                                    Error **errp)
 {
     int ret = -EPERM;
     GSList *tran = NULL;
     g_autoptr(GHashTable) found = NULL;
     g_autoptr(GSList) refresh_list = NULL;
+    BlockDriverState *to_cow_parent;
+
+    if (detach_subchain) {
+        assert(bdrv_chain_contains(from, to));
+        for (to_cow_parent = from;
+             bdrv_filter_or_cow_bs(to_cow_parent) != to;
+             to_cow_parent = bdrv_filter_or_cow_bs(to_cow_parent))
+        {
+            ;
+        }
+    }
 
     /* Make sure that @from doesn't go away until we have successfully attached
      * all of its parents to @to. */
@@ -4997,6 +5011,10 @@ static int bdrv_replace_node_common(BlockDriverState *from,
         goto out;
     }
 
+    if (detach_subchain) {
+        bdrv_remove_backing(to_cow_parent, &tran);
+    }
+
     found = g_hash_table_new(NULL, NULL);
 
     refresh_list = bdrv_topological_dfs(refresh_list, found, to);
@@ -5016,7 +5034,13 @@ out:
 int bdrv_replace_node(BlockDriverState *from, BlockDriverState *to,
                       Error **errp)
 {
-    return bdrv_replace_node_common(from, to, true, errp);
+    return bdrv_replace_node_common(from, to, true, false, errp);
+}
+
+int bdrv_drop_filter(BlockDriverState *bs, Error **errp)
+{
+    return bdrv_replace_node_common(bs, bdrv_filter_or_cow_bs(bs), true, true,
+                                    errp);
 }
 
 /*
@@ -5326,7 +5350,17 @@ int bdrv_drop_intermediate(BlockDriverState *top, BlockDriverState *base,
         updated_children = g_slist_prepend(updated_children, c);
     }
 
-    bdrv_replace_node_common(top, base, false, &local_err);
+    /*
+     * It seems correct to pass detach_subchain=true here, but it triggers
+     * one more yet not fixed bug, when due to nested aio_poll loop we switch to
+     * another drained section, which modify the graph (for example, removing
+     * the child, which we keep in updated_children list). So, it's a TODO.
+     *
+     * Note, bug triggered if pass detach_subchain=true here and run
+     * test-bdrv-drain. test_drop_intermediate_poll() test-case will crash.
+     * That's a FIXME.
+     */
+    bdrv_replace_node_common(top, base, false, false, &local_err);
     if (local_err) {
         error_report_err(local_err);
         goto exit;
-- 
2.21.3


