Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 864182EFFAE
	for <lists+qemu-devel@lfdr.de>; Sat,  9 Jan 2021 14:02:16 +0100 (CET)
Received: from localhost ([::1]:46850 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kyDsl-0007xg-1D
	for lists+qemu-devel@lfdr.de; Sat, 09 Jan 2021 08:02:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55312)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1kyDpW-0006A7-AO; Sat, 09 Jan 2021 07:58:54 -0500
Received: from mail-am6eur05on2129.outbound.protection.outlook.com
 ([40.107.22.129]:46432 helo=EUR05-AM6-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1kyDpS-0003fN-2l; Sat, 09 Jan 2021 07:58:54 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IiCY+HrPcoDlp04/pUlqxM/7jng2xf5kpUXbN979N+7+8zd7kHq7jNeZdSuIkyMTBnSQiJpuMYH1VOAovm/cYigDo6obQFhPaG3H9k4Ogc98/lRyOG3osePWpc9WvV6mtVItC2WI3Hyr/gSCjy+OXNTrOUQUcfnbTA2rB9MJWqKd8FiggMVjM2N2GI8ufXBxLC+/NmvWmiM+VL3sXJdQ31I0407KsflcpthJy0oXI6y5ZYYhGJl8/pZRcNYfwnVoRxotPNmDDF8QSh+h26CLYNjKcINasrnsGhCsvkUsIbQX8/A0aE6MX8rf6QA50LIwkx/rQiJkGm/MtuRrS4u9Vg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xMMvLZDdFlVtoMXUZWOUFlKNE9jP+XW12IgXK6hWYG8=;
 b=ktnon88H9039lkZZdwacLTV9RnpQQTs6Tg6sdsJgycWLm9AlCS1viFAXm1w6apErFoBNCmJ2ykSsLQNo3imNLKquFeb1xcQyG23Zi1A+2d7XxJyjAXdcK5UMiGcKBla465jrURcYnvlelrBn2GS2JkePQDtdU6SE5rFB7K2VerMui/2izPpi1RrwWIKJ+5Z1RFjttr/1r0m8Hv4pE26wnZOEdox1V58gImmdxbM5ZrpCDEiSkcgfiDG2MZRIuoMRdlhsgpRmE2vfwlR9aqOGQgptQUTi1tThM8DWcazqMKL0WBOV6RkiYxN//KTtWCuwzx+hzn2Sjaios6khutMsTw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xMMvLZDdFlVtoMXUZWOUFlKNE9jP+XW12IgXK6hWYG8=;
 b=CT+NLBBhKxpVO+bbUE8M97LBN0q59MTU5G5cuZSBPDBQdlgQW9nLUvrasvgPL7P1fqAUGI3zs+MFpoEMzM0BujNMgv3eFBS8mKjz+O0La5Axn5CfGYp3s2M3t3KDHmMQJxKtJNqAKw5gBwQTu+/K/5vb94Enmbonrq68SI7FVbI=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM5PR0802MB2418.eurprd08.prod.outlook.com (2603:10a6:203:9f::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3742.6; Sat, 9 Jan
 2021 12:58:41 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::214a:3545:368c:7ae8]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::214a:3545:368c:7ae8%7]) with mapi id 15.20.3742.011; Sat, 9 Jan 2021
 12:58:41 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Subject: [PATCH v5 01/14] block: return status from bdrv_append and friends
Date: Sat,  9 Jan 2021 15:57:58 +0300
Message-Id: <20210109125811.209870-2-vsementsov@virtuozzo.com>
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
 15.20.3742.6 via Frontend Transport; Sat, 9 Jan 2021 12:58:40 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a583bcf9-b5b1-43d7-25eb-08d8b49e4a3b
X-MS-TrafficTypeDiagnostic: AM5PR0802MB2418:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM5PR0802MB24183EF4E2C4673DBA73D91CC1AD0@AM5PR0802MB2418.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:873;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: qfq5gDoVO+X43S+1PG8cnRApOWUcQtF/elChmWoSMH5JFo8s72yE2HSxW5563yxH1ddOrs0THxm08bbMhgH2IhAGGabLj3qDyUW83vxEb0ydHSZadqwwrgeQLqIDvfHMzzEt3crUB5j/8cv2D0tFXD34R9f29Fb+CmOYbCBOq6EWmQCViMMwq3Kp8Ys3b+xqubB2A+Ex0myfhQmBLYy2Mm0vPFS7eoz6cHrygb8O7JfJEyCDGhym9c3wyrXs4PbDphJj6Dkw6lCwYnJQaCDipc8SXfP972iXN3ZojayAHS8zPLJp3qjezcf/ecnwBSatMloK/02l8gq5avU737HaotoS1XWW+bgyKGCE7gd6vfiWRxO2cF4dcpT5xX5jZC+KTjWrejKj7JcuxSc+51X9jg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(136003)(346002)(396003)(376002)(39840400004)(956004)(2616005)(66946007)(478600001)(8676002)(5660300002)(66476007)(66556008)(6916009)(83380400001)(52116002)(2906002)(6666004)(8936002)(1076003)(6506007)(316002)(26005)(4326008)(186003)(16526019)(7416002)(36756003)(6512007)(6486002)(86362001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?ZHKy28HUADEmk25aa5csdnF1zZ70l0G3468fWI52ObUfs1oHR/KqOa29pdrz?=
 =?us-ascii?Q?PkHTriSaOLuySfFFEuF2p2C0DGZWP+0JeZqZoKQ1D5Ef4yx6ZZ4QHTY7HAq5?=
 =?us-ascii?Q?7d2gamAoscrMXBrsOOQ0zmoDAcDJFva8RrrgP5yu2uMh/88Yth2sfFygsf9x?=
 =?us-ascii?Q?2TfNZjV/mpjsmdeq6ZyPDDC/tK5hySaUREsMZegLd+h+A2DCgbPaDcAhAxOr?=
 =?us-ascii?Q?bm099OM3TopeVFX6IOt78HfK4F8lekA7GkezFinL30FiDl7P8J/ogiZ+D2Kz?=
 =?us-ascii?Q?jbSmJDpUZl5kYPtz1itGbMwFNOvmLYxPBU1ba45xDfpU8hY62rMOH/wZphMf?=
 =?us-ascii?Q?cjUSngwXzgLlWNExra2rCdCOacu3EWaLIJanrn9HM65q+XMcEiSRKxVrPROd?=
 =?us-ascii?Q?uIYg+lVZuXBmX096JyIYW9+cGP0WMJULFQ2y3rPWel4hhnc4wBZcb0EjdDzi?=
 =?us-ascii?Q?Z+aCr5MMlXbcEJqAkI3g6OkihKKk12692440qK8xLuFrKdvSiwP8RHso8vmb?=
 =?us-ascii?Q?FdOocYRIFj4HyLdhgltE5nrNzoZiTM+OWTE62S76dkyIdbAcKK0dqESM/dzN?=
 =?us-ascii?Q?GweMlfA5MvGpZpTPpSY6rXr3XkV7qjb+1cMOC4Ao/E460TZ42S76YZJtDXus?=
 =?us-ascii?Q?1w+3glEqfLLO2mAcsIs4e9FW/QjQ42d1PJUqPzl27XWvS2K65/TRZORsONrw?=
 =?us-ascii?Q?miqfxiXtwitHM8bntKwNn8rkeZtkHcppqUaqDDe/VtG/G+dX+sC7QHhf8FlR?=
 =?us-ascii?Q?srJbE1mHGXQUHWWvikOa8xZCtBu7zeyF+WACh0KkY1Aet79Rhl4KU0WFgWCd?=
 =?us-ascii?Q?xj+vwpCjbT95BM51CMy+3gkVjlhhlec98rnS1UTcFIKt2Mbv0Kgn8C0fIt8x?=
 =?us-ascii?Q?8PYLsJNWrhJCeWOcejNF+KwmwYZw/xrEaWqDJ3VLlDJxgP+Ls7m7H8uDCwwe?=
 =?us-ascii?Q?yUUrhzmgwbuHrS0QTzK+nUBDIYEl0/fQGGO373cKJ1wsBmpXXaAMDzKh99SO?=
 =?us-ascii?Q?p/Qp?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jan 2021 12:58:41.5371 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-Network-Message-Id: a583bcf9-b5b1-43d7-25eb-08d8b49e4a3b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 60KBWixxrNymCpOs4MvRe/aBvBcTopKPdyMIE1NAUXkSC9WfwBywYuVv/KBI5EHJ4ezKYoG4m3aWYK63B6OxB/NpP9/Ynn/coM+2jYeWcCo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR0802MB2418
Received-SPF: pass client-ip=40.107.22.129;
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
 block.c               | 57 ++++++++++++++++++++++++++++---------------
 2 files changed, 43 insertions(+), 26 deletions(-)

diff --git a/include/block/block.h b/include/block/block.h
index a193545b6a..b4e0347b49 100644
--- a/include/block/block.h
+++ b/include/block/block.h
@@ -354,10 +354,10 @@ int bdrv_create(BlockDriver *drv, const char* filename,
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
 
 int bdrv_parse_aio(const char *mode, int *flags);
 int bdrv_parse_cache_mode(const char *mode, int *flags, bool *writethrough);
@@ -369,8 +369,8 @@ BdrvChild *bdrv_open_child(const char *filename,
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
index 8b9d457546..1a5d0e748d 100644
--- a/block.c
+++ b/block.c
@@ -2827,14 +2827,15 @@ static BdrvChildRole bdrv_backing_role(BlockDriverState *bs)
  * Sets the bs->backing link of a BDS. A new reference is created; callers
  * which don't need their own reference any more must call bdrv_unref().
  */
-void bdrv_set_backing_hd(BlockDriverState *bs, BlockDriverState *backing_hd,
+int bdrv_set_backing_hd(BlockDriverState *bs, BlockDriverState *backing_hd,
                          Error **errp)
 {
+    int ret;
     bool update_inherits_from = bdrv_chain_contains(bs, backing_hd) &&
         bdrv_inherits_from_recursive(backing_hd, bs);
 
     if (bdrv_is_backing_chain_frozen(bs, child_bs(bs->backing), errp)) {
-        return;
+        return -EPERM;
     }
 
     if (backing_hd) {
@@ -2853,15 +2854,24 @@ void bdrv_set_backing_hd(BlockDriverState *bs, BlockDriverState *backing_hd,
 
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
 
+    ret = 0;
+
 out:
     bdrv_refresh_limits(bs, NULL);
+
+    return ret;
 }
 
 /*
@@ -4533,9 +4543,9 @@ static bool should_update_child(BdrvChild *c, BlockDriverState *to)
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
@@ -4562,6 +4572,7 @@ static void bdrv_replace_node_common(BlockDriverState *from,
             goto out;
         }
         if (c->frozen) {
+            ret = -EPERM;
             error_setg(errp, "Cannot change '%s' link to '%s'",
                        c->name, from->node_name);
             goto out;
@@ -4592,14 +4603,18 @@ static void bdrv_replace_node_common(BlockDriverState *from,
 
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
@@ -4620,28 +4635,30 @@ void bdrv_replace_node(BlockDriverState *from, BlockDriverState *to,
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


