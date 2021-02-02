Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F319530BEBC
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Feb 2021 13:52:35 +0100 (CET)
Received: from localhost ([::1]:43960 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l6vAY-0003CD-Vr
	for lists+qemu-devel@lfdr.de; Tue, 02 Feb 2021 07:52:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46740)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1l6v8g-00013c-Fn; Tue, 02 Feb 2021 07:50:38 -0500
Received: from mail-eopbgr60139.outbound.protection.outlook.com
 ([40.107.6.139]:33232 helo=EUR04-DB3-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1l6v8e-0001qn-2e; Tue, 02 Feb 2021 07:50:38 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kzoF9UujkTpwyam736HcVttm+KkxAYucZxCHY8S8MSV/gfpyIZQtt5PRIpzPA4k0hhLBmqP6BL535coZgJQlLJDLKei/cCoDgxaoTq8NjOHWm74FBWLRWXq03JxMUrswiJBAeoz+0XDseRH+8NWSuUnhUvpOo9DmDnFXU1h/c98L8c7C0dki5hZgKdu3htKdKJlKWOwIQYKlD3IKSQXceLAQR9KctQ9ciOIAdsdgJSZWOIHrFZE7JRGngFF7FqzmjQqD9CzL2PDomCNMnqydGIjw5/4uEJc4ICj900LYr0tU+uQ20AtG3doxNO89FLT4LeofcSIgkUXxRWUj3lay6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Yo/s5OXrrpKMllUFSAC+QazhVEw8SvH8HAAlL0zj644=;
 b=GYMxLizsew3ZDpCz7M9W2OH5vQqlL65LYGpbf9h8ZMoo6kWMoSDbhX9fU6sWyh8zbdglaoHT0a7Erw3MwEOTCRA8HmvpN8UlVAF02hFhK9HsEDXDB0Zdf8BvYWsCmy817bt2xwlk2Yq/eTpfJC9ag3JatSjNXIa4twnBpuNRXDnxTFVuoOIDszFCwulM6/UAp0KxUkVnQq/QJItxRxm1FXMwGCOhlle4Eaysw0XvTIDB2Ap7zHnKeGhTe+1vkrUhERte2llQts6R1eJQ9iLXx/tmb9CeCjX0q3zgM0BEEz/esl7lDAOjFPAzmcSaFZ45SeERa/2p1AtP6RF5ff5HXQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Yo/s5OXrrpKMllUFSAC+QazhVEw8SvH8HAAlL0zj644=;
 b=EDROvWEkGRZJVZYnYBxTO+e9F+EQPerMY/wZ9doTqr1MlDg3V7mnTmXRyQtwNsdnSYCuCq5vbGJWBpQK0EEcIqdHtvX51BqOMqYnTShvJ884PEl5/LpK/NlGz4UoxBtleiHjMpq9rcO1f9vQCQJm8vUXyNSIMrM/deHvUN6xAYs=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB3623.eurprd08.prod.outlook.com (2603:10a6:20b:48::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3805.24; Tue, 2 Feb
 2021 12:50:32 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f1f0:6610:11f5:5e4a]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f1f0:6610:11f5:5e4a%8]) with mapi id 15.20.3805.028; Tue, 2 Feb 2021
 12:50:32 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Subject: [PATCH v7 01/14] block: return status from bdrv_append and friends
Date: Tue,  2 Feb 2021 15:49:43 +0300
Message-Id: <20210202124956.63146-2-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210202124956.63146-1-vsementsov@virtuozzo.com>
References: <20210202124956.63146-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [185.215.60.137]
X-ClientProxiedBy: AM0PR02CA0002.eurprd02.prod.outlook.com
 (2603:10a6:208:3e::15) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from kvm.sw.ru (185.215.60.137) by
 AM0PR02CA0002.eurprd02.prod.outlook.com (2603:10a6:208:3e::15) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3825.17 via Frontend Transport; Tue, 2 Feb 2021 12:50:31 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1aab8fea-acf5-4218-be26-08d8c7792097
X-MS-TrafficTypeDiagnostic: AM6PR08MB3623:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR08MB362397C185DBCA46995FCE03C1B59@AM6PR08MB3623.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:873;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: TPdc1kLN1e4KnT1nZ2qREuEkmgGS9PVSCz1niRgWXn8crsEhbl5oRuRYQO62IWOpqwPXk5Slxa7EpSK4mjByH5Jc5YilVWL8R7M6VxbfEeQDhDwbFBG+15EebHi0a4+cbKl/8xC7H3rpyrJVaNnx3l8+th3SguXkae4OlT1j601mZtnMQ2DHNnH14IC4EZrQbi0GAoe7d++smHTL/3tDs4rR/uKcPvEMcOUwm2QqJ5mxQN4ZaKf/GA/VqcnI1KmGKiZSG1UjJkgx72Nof92I2NlWpRvTDYmZphYtK7i1YT8eawCJ9TiH69R9vL6eOTxsO1V0FPIGIgeC6w3J2NRtKrihkQLIAw5v7pR1ERsx8QMRzEURG0SIFfUwM+o4qhRWRryu1s/wRtv2NiKIKbBxGx/3vgPzLIOpwBX1NN7WzFxytgeVtBVT5SNMwd7G+i+qb0TlGtgUDxS/tZjuzO42imQB/eNFt/X7CVCpOyW6lDNmqo3KM0t7ta5zmbpCt+55VtuZ3uUPe6ua1eRlWp1QCQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(346002)(39850400004)(376002)(396003)(136003)(2906002)(5660300002)(66476007)(316002)(66946007)(52116002)(6512007)(66556008)(36756003)(8936002)(6486002)(86362001)(7416002)(26005)(1076003)(83380400001)(186003)(4326008)(16526019)(6916009)(478600001)(2616005)(956004)(8676002)(6506007)(6666004);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?2CplSonfNWQQeUz4mjLFHgPLNKynhp3RGXj7fpI2Xnn8xD3yUoLdzkyDFx1a?=
 =?us-ascii?Q?nkWBkvuHFyRw3OLWeiPyxnSmy3Pgilw7ZkebN7ZpkjSEoczc7WpXV28x9UiX?=
 =?us-ascii?Q?/X7sHAd1uE4W2qd5ak7zfUPauizoTy/xJ/3x+kqH4xOVByExxcTFJtAnNjcV?=
 =?us-ascii?Q?28KLpWBDcpk2dbtt8RogGQUS4zn8P8fl9c5zpW5c8C+e5L2MO5HMIMopY7Y1?=
 =?us-ascii?Q?9jWrIcFiIU9Wsc7yER7uVNjsMSvGF3wfgSZNLWoY2m8FJlfd/w5BQicNv/VP?=
 =?us-ascii?Q?jKhM0VnmCC8j4EqFnInLi/MjGfgeDAliTMA3zkHDbvUmdQCOBkXluU58W0s8?=
 =?us-ascii?Q?jyJPSoCo1NOFmMvatyXKSH4hu6PMB6QLN3Hki9rjjjQVS5a1nFa9VxxaXya4?=
 =?us-ascii?Q?69Lgc/orAx8NREdcEcXfggFSENlVhP/5z1UYUj5qXo9dOaJ2TG0aSliXiNwZ?=
 =?us-ascii?Q?N/hFTCaLCZ06xB4ya19SEzs4EGWnxYguHgVe3YCg48FnfpZoZpVSl6t/Vc4a?=
 =?us-ascii?Q?wRZ7rkH0G8QI7q4JiEweB1WIG9jt4sZ8eIdyfX7h6qGjT2YCioqG1IU5wH/R?=
 =?us-ascii?Q?IWwGZuWcecSeSOtWUabZxvzko3hQROT8KO0ZTPYCxRkgi8UFip3+gWVBXkw/?=
 =?us-ascii?Q?kvshYUNizushOBPDaoKflPOjGUxVN/H0moCca6b0sRUg21Cgq/oS2sWWsJgA?=
 =?us-ascii?Q?GUiqbx7jPsAVTgJreWN3zQ8zzWKAwhArcMTbV8Xn2b+66lOiT8mzCro7fm7/?=
 =?us-ascii?Q?q3sTCYb9NCU7PVOjCNY7E+xhAqFsq/E4/TiPnBAWmLeOPAaSqQ+VWxYovP5W?=
 =?us-ascii?Q?ZBiJf4iECS7CNurSEGPGpX5VWSe3gpZ3Kc5AgC7aRvp2DM2/oSYKw9vRS1o4?=
 =?us-ascii?Q?ajvOnxzveWVey/hMv/1IMe/E9j79Wh9AGZ7cyQLHy6eBp5G5rB6mNZ1mCDTy?=
 =?us-ascii?Q?w+EIW/wz93VlKiRwX9iG77eN1YgrJXZ39PrURRctJ7Mwezu5Ci3ukmlgZuSw?=
 =?us-ascii?Q?azyHN59LTbai06z2c6iPREq1QSu4PtSxIHsFlGuTW7G7xejouelJ09lNvCEn?=
 =?us-ascii?Q?ZBgCcR/o?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1aab8fea-acf5-4218-be26-08d8c7792097
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Feb 2021 12:50:32.6294 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jtMOyTLSz8vsk66rxbkLLDgHEmN+N9hthcUMV52Y3yQgKwS/+ja+1cgwsYxNQo5bC4IqhcAp8BhSrdTuSdNlojn/0S/OKZ6xz6YtMp6/0bY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB3623
Received-SPF: pass client-ip=40.107.6.139;
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
 stefanha@redhat.com, pbonzini@redhat.com, mreitz@redhat.com, jsnow@redhat.com,
 ari@tuxera.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The recommended use of qemu error api assumes returning status together
with setting errp and avoid void functions with errp parameter. Let's
improve bdrv_append and some friends to reduce error-propagation
overhead in further patches.

Choose int return status, because bdrv_replace_node_common() has call
to bdrv_check_update_perm(), which reports int status, which seems
correct to propagate.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 include/block/block.h | 12 ++++-----
 block.c               | 58 +++++++++++++++++++++++++++----------------
 2 files changed, 43 insertions(+), 27 deletions(-)

diff --git a/include/block/block.h b/include/block/block.h
index 81fcaad5ac..da24192901 100644
--- a/include/block/block.h
+++ b/include/block/block.h
@@ -356,10 +356,10 @@ int bdrv_create(BlockDriver *drv, const char* filename,
 int bdrv_create_file(const char *filename, QemuOpts *opts, Error **errp);
 
 BlockDriverState *bdrv_new(void);
-void bdrv_append(BlockDriverState *bs_new, BlockDriverState *bs_top,
-                 Error **errp);
-void bdrv_replace_node(BlockDriverState *from, BlockDriverState *to,
-                       Error **errp);
+int bdrv_append(BlockDriverState *bs_new, BlockDriverState *bs_top,
+                Error **errp);
+int bdrv_replace_node(BlockDriverState *from, BlockDriverState *to,
+                      Error **errp);
 BlockDriverState *bdrv_insert_node(BlockDriverState *bs, QDict *node_options,
                                    int flags, Error **errp);
 
@@ -373,8 +373,8 @@ BdrvChild *bdrv_open_child(const char *filename,
                            BdrvChildRole child_role,
                            bool allow_none, Error **errp);
 BlockDriverState *bdrv_open_blockdev_ref(BlockdevRef *ref, Error **errp);
-void bdrv_set_backing_hd(BlockDriverState *bs, BlockDriverState *backing_hd,
-                         Error **errp);
+int bdrv_set_backing_hd(BlockDriverState *bs, BlockDriverState *backing_hd,
+                        Error **errp);
 int bdrv_open_backing_file(BlockDriverState *bs, QDict *parent_options,
                            const char *bdref_key, Error **errp);
 BlockDriverState *bdrv_open(const char *filename, const char *reference,
diff --git a/block.c b/block.c
index 91a66d4f3e..8a169641de 100644
--- a/block.c
+++ b/block.c
@@ -2827,14 +2827,15 @@ static BdrvChildRole bdrv_backing_role(BlockDriverState *bs)
  * Sets the bs->backing link of a BDS. A new reference is created; callers
  * which don't need their own reference any more must call bdrv_unref().
  */
-void bdrv_set_backing_hd(BlockDriverState *bs, BlockDriverState *backing_hd,
-                         Error **errp)
+int bdrv_set_backing_hd(BlockDriverState *bs, BlockDriverState *backing_hd,
+                        Error **errp)
 {
+    int ret = 0;
     bool update_inherits_from = bdrv_chain_contains(bs, backing_hd) &&
         bdrv_inherits_from_recursive(backing_hd, bs);
 
     if (bdrv_is_backing_chain_frozen(bs, child_bs(bs->backing), errp)) {
-        return;
+        return -EPERM;
     }
 
     if (backing_hd) {
@@ -2853,15 +2854,22 @@ void bdrv_set_backing_hd(BlockDriverState *bs, BlockDriverState *backing_hd,
 
     bs->backing = bdrv_attach_child(bs, backing_hd, "backing", &child_of_bds,
                                     bdrv_backing_role(bs), errp);
+    if (!bs->backing) {
+        ret = -EPERM;
+        goto out;
+    }
+
     /* If backing_hd was already part of bs's backing chain, and
      * inherits_from pointed recursively to bs then let's update it to
      * point directly to bs (else it will become NULL). */
-    if (bs->backing && update_inherits_from) {
+    if (update_inherits_from) {
         backing_hd->inherits_from = bs;
     }
 
 out:
     bdrv_refresh_limits(bs, NULL);
+
+    return ret;
 }
 
 /*
@@ -4533,9 +4541,9 @@ static bool should_update_child(BdrvChild *c, BlockDriverState *to)
  * With auto_skip=false the error is returned if from has a parent which should
  * not be updated.
  */
-static void bdrv_replace_node_common(BlockDriverState *from,
-                                     BlockDriverState *to,
-                                     bool auto_skip, Error **errp)
+static int bdrv_replace_node_common(BlockDriverState *from,
+                                    BlockDriverState *to,
+                                    bool auto_skip, Error **errp)
 {
     BdrvChild *c, *next;
     GSList *list = NULL, *p;
@@ -4557,11 +4565,13 @@ static void bdrv_replace_node_common(BlockDriverState *from,
             if (auto_skip) {
                 continue;
             }
+            ret = -EINVAL;
             error_setg(errp, "Should not change '%s' link to '%s'",
                        c->name, from->node_name);
             goto out;
         }
         if (c->frozen) {
+            ret = -EPERM;
             error_setg(errp, "Cannot change '%s' link to '%s'",
                        c->name, from->node_name);
             goto out;
@@ -4592,14 +4602,18 @@ static void bdrv_replace_node_common(BlockDriverState *from,
 
     bdrv_set_perm(to);
 
+    ret = 0;
+
 out:
     g_slist_free(list);
     bdrv_drained_end(from);
     bdrv_unref(from);
+
+    return ret;
 }
 
-void bdrv_replace_node(BlockDriverState *from, BlockDriverState *to,
-                       Error **errp)
+int bdrv_replace_node(BlockDriverState *from, BlockDriverState *to,
+                      Error **errp)
 {
     return bdrv_replace_node_common(from, to, true, errp);
 }
@@ -4620,28 +4634,30 @@ void bdrv_replace_node(BlockDriverState *from, BlockDriverState *to,
  * parents of bs_top after bdrv_append() returns. If the caller needs to keep a
  * reference of its own, it must call bdrv_ref().
  */
-void bdrv_append(BlockDriverState *bs_new, BlockDriverState *bs_top,
-                 Error **errp)
+int bdrv_append(BlockDriverState *bs_new, BlockDriverState *bs_top,
+                Error **errp)
 {
-    Error *local_err = NULL;
-
-    bdrv_set_backing_hd(bs_new, bs_top, &local_err);
-    if (local_err) {
-        error_propagate(errp, local_err);
+    int ret = bdrv_set_backing_hd(bs_new, bs_top, errp);
+    if (ret < 0) {
         goto out;
     }
 
-    bdrv_replace_node(bs_top, bs_new, &local_err);
-    if (local_err) {
-        error_propagate(errp, local_err);
+    ret = bdrv_replace_node(bs_top, bs_new, errp);
+    if (ret < 0) {
         bdrv_set_backing_hd(bs_new, NULL, &error_abort);
         goto out;
     }
 
-    /* bs_new is now referenced by its new parents, we don't need the
-     * additional reference any more. */
+    ret = 0;
+
 out:
+    /*
+     * bs_new is now referenced by its new parents, we don't need the
+     * additional reference any more.
+     */
     bdrv_unref(bs_new);
+
+    return ret;
 }
 
 static void bdrv_delete(BlockDriverState *bs)
-- 
2.29.2


