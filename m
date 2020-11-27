Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C56E92C6865
	for <lists+qemu-devel@lfdr.de>; Fri, 27 Nov 2020 16:04:31 +0100 (CET)
Received: from localhost ([::1]:60798 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kifIU-0005fH-Jy
	for lists+qemu-devel@lfdr.de; Fri, 27 Nov 2020 10:04:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36854)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1kif1A-0001HM-AB; Fri, 27 Nov 2020 09:46:36 -0500
Received: from mail-eopbgr60102.outbound.protection.outlook.com
 ([40.107.6.102]:38277 helo=EUR04-DB3-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1kif17-0003GS-8x; Fri, 27 Nov 2020 09:46:36 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WWr43XmL6XaSnvwuqhH7QaQiN7Z7D/nq7T7GGlOrsXbEYN4ac/bjpgr97W206HbrEXY8GPSJQIvLQWp+mVP7pLJ0YNQ+5SzZfEYkTCsUgxFZPfQxlSpXKBBFoVg39jfpM/F7BBGsovKGmw0wkmDLNzGsrj2RrnTOytfqwWDqHrTy/QzHWHSaT9ztREdJt0Bpk3kE1uXuQDCKNZbtdVx+ZxiNiwCsY06cXlglyPe35KbAm1xv2fOHJcvDwZwED5P5AdLznLgBOiCcchxeS0lWKTeVh+8G+ksv/DdVJWZ3bZny4RwNm0dNvjbvwHoSUwEMmwIXzh1Um3pJNwH2rA6rxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mhN1TD/4c0akfZwurebUV8jcB5XtT66iazWLi41Dlsc=;
 b=Qm5PuCwqqwClNJIbnPIi3uvQkB8lX2HyfZeQxeayWFfNr+Tw5KSN7KI0VRaQ7MOfBFlcUI6b68GmET9iJB5TMz68FFjSJVXMUWHNp/qjjaMM4XS125wlkG3Vpa/oQzrWdq6k/R7sw1NYoCq5vAAvcPXeKae4MYH4GvtJsXa51Rt5CI2Z2OYNyMeLXt1ZLLEfDUUsjXnvymG9nLUINVV722mmDczFoF1pSYU/vB8+LGOVQZfsZOiJ+IUmzSJbvydqJ4wYAwWEaxz837jpS6SYgpoQso4J0HLRAE2OE6pcLUjwE1FAp0MEubO7UUqvurxJOEiIO87fIVdPCLzxeEiE+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mhN1TD/4c0akfZwurebUV8jcB5XtT66iazWLi41Dlsc=;
 b=me/O+BXhDG96fk1fBblZyludELOW7Qcrlu6yBHncJiHK4ukOse+R92ma0m39j6nRkGMYV1vq8sPka4z4RtljjGfrl2+CGPSe2CI6DkXhuQVgcsuTadnT3btgSHM/bJz1B5/aN1CPTfPzQEHAwuZq9dpgiGcW3DXRGDQeGD34E5c=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB5078.eurprd08.prod.outlook.com (2603:10a6:20b:e7::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3611.25; Fri, 27 Nov
 2020 14:46:08 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::d585:99a4:d7a4:d478]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::d585:99a4:d7a4:d478%4]) with mapi id 15.20.3611.025; Fri, 27 Nov 2020
 14:46:08 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, armbru@redhat.com, jsnow@redhat.com,
 mreitz@redhat.com, kwolf@redhat.com, vsementsov@virtuozzo.com,
 den@openvz.org
Subject: [PATCH v2 20/36] block: add bdrv_attach_child_common() transaction
 action
Date: Fri, 27 Nov 2020 17:45:06 +0300
Message-Id: <20201127144522.29991-21-vsementsov@virtuozzo.com>
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
 Transport; Fri, 27 Nov 2020 14:45:51 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b183a8e7-d15f-484d-183b-08d892e3235e
X-MS-TrafficTypeDiagnostic: AM6PR08MB5078:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR08MB507824CB0FA1BC4F6AF1C824C1F80@AM6PR08MB5078.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:267;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 6mXTXI7btwRUjlaNLoXIcgh5NR/KxryQMF5ba5JI0fMQH+GkwN8D3WWHAI/uwF69aHHzPb+aYCD8F7gUO3NnH8Dolx3grLuXexbmCV/Z2EPuA04sSLCAbTgpoT28L2IF9K3d6bTnL9bGrUfPetRlZjn6BiVptpslg8Xv3pKrppLQTnr2AJpcNkAT8glLfWIQsNro7XSu4kDu+HdlTaHU7aKqli64OVWIZoxSeRQQLkqGRYHEggxO45+uS+8qc8vC9by0uCJ/heW568dIvp2Ali74Js19V6tvyVcaj8LUTlFizljj9Kb+BlUb65Qf8oK6vmgUK0CIijJannJ7ZyU1z2CuCFcyIdBIifSBMoNKpd3BIORUSp/59RMsPlwxvoyd
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(39840400004)(346002)(136003)(396003)(376002)(86362001)(16526019)(66556008)(66476007)(478600001)(8676002)(186003)(66946007)(26005)(52116002)(83380400001)(6506007)(69590400008)(107886003)(6666004)(316002)(4326008)(36756003)(5660300002)(6486002)(2616005)(956004)(1076003)(6916009)(6512007)(8936002)(2906002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?4FQnXiq/wUc4jkcymfCAz9rZEDcjVEx0SJ49rHgwG6y+T1dzvkadtmBemVGQ?=
 =?us-ascii?Q?wX6Dl7MIuWWDw7zH7h5Zl8XGLUE+oDF5VX9Tud3IuDfsmPVcj7Wh953Npsm0?=
 =?us-ascii?Q?2KEptO/aYjM+adIvbevyB3QYhGGARbvwg97JDaIsr5ljxUSfKW3n493giNd9?=
 =?us-ascii?Q?51WbSSFityccvyn41U+UAOV6xkkw9OUGS8GorIJ+0u7QQohlXkfon7Mlefgs?=
 =?us-ascii?Q?V5q7knRXkByhp8/056vgdJQxyOKf8dqcs6+xx4WiZ86ov+dEkrOiNQOhXICB?=
 =?us-ascii?Q?s+3OPz4bYZXqOjp8Y2/daPo88PvZJ4MDxk8GOL5EssdtMN84dDtsx6hD0OVf?=
 =?us-ascii?Q?AAVlO0ydpEBlD0tcNEsIoTVH5yGZVLdPll1UFUUPWG1dIhgBwiA8oCEtIjhn?=
 =?us-ascii?Q?Mj9ZOctk+ZKMLupdJs4eV3NCohCnC/+o3IqEzJ+WVULvh5178Yod5ATTDgTe?=
 =?us-ascii?Q?lP3/hQhBchkCPXgD0CXE+Xc1RZwOKtLd92s/R8cOe00Td+9lNGqIaYhk+jFz?=
 =?us-ascii?Q?KL+TJmtMAMAVmh2Fr3YFPe8QJHd2sLpBSFH2lolQdQ+6b79Aa7l8LwjZZR57?=
 =?us-ascii?Q?x6z5BBTRut0YneA8WNCxIktsSGP3poiuNoiuv9RgqpQCSdkiLHFUShuvBmg2?=
 =?us-ascii?Q?3rIGEIsVf8dgJUUFOb/M05e/DXwW2O3wZ2NeJZKsxui+SBvKefsoJQ0OsjzZ?=
 =?us-ascii?Q?WSer0C5EePx0CrJ/LsuvBt/eQ48gxDY+eS/pNO50wcFmVlvmzvJkU8Jt9i7G?=
 =?us-ascii?Q?3T/0bpGze3cbo8nJ0MWmcSBYNqt2ZJ1oN9F2BS2nHt7J+PQuD/c5vA1xILHK?=
 =?us-ascii?Q?M2UYjpzdf7u95MSrN0/XiES58ETI5q7zlWf9GnXpJTVdqNJQRZ6rNyWXrv1b?=
 =?us-ascii?Q?lZLKGEuQ1dPN4b1WcNRzD92Pk81m5+lVNQ0jGYyWF22XNTP+/5Wvob+oYvQ3?=
 =?us-ascii?Q?O1TyG4HTeA2VTkhQaNubQsVLPd9/QZZooyvY6uKH49ng79eG913VJIacQLFG?=
 =?us-ascii?Q?RU68?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b183a8e7-d15f-484d-183b-08d892e3235e
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Nov 2020 14:45:52.3327 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qXuQVG1W0LPaA9PTmLU1cwmo/OIRyuCbef8owo3TaK/wo48yllLkk2w940k8o9kOTQtVcGAzv0Cxax8Et9sRsyTYNZD7UWWaFEmGyNdRS68=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB5078
Received-SPF: pass client-ip=40.107.6.102;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR04-DB3-obe.outbound.protection.outlook.com
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

Split out no-perm part of bdrv_root_attach_child() into separate
transaction action. bdrv_root_attach_child() now moves to new
permission update paradigm: first update graph relations then update
permissions.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 block.c | 162 ++++++++++++++++++++++++++++++++++++++++----------------
 1 file changed, 117 insertions(+), 45 deletions(-)

diff --git a/block.c b/block.c
index f0fcd75555..a7ccbb4fb1 100644
--- a/block.c
+++ b/block.c
@@ -86,6 +86,13 @@ static void bdrv_parent_set_aio_context_ignore(BdrvChild *c, AioContext *ctx,
                                                GSList **ignore);
 static void bdrv_replace_child_noperm(BdrvChild *child,
                                       BlockDriverState *new_bs);
+static int bdrv_attach_child_common(BlockDriverState *child_bs,
+                                    const char *child_name,
+                                    const BdrvChildClass *child_class,
+                                    BdrvChildRole child_role,
+                                    uint64_t perm, uint64_t shared_perm,
+                                    void *opaque, BdrvChild **child,
+                                    GSList **tran, Error **errp);
 
 static int bdrv_reopen_prepare(BDRVReopenState *reopen_state, BlockReopenQueue
                                *queue, Error **errp);
@@ -2898,55 +2905,22 @@ BdrvChild *bdrv_root_attach_child(BlockDriverState *child_bs,
                                   uint64_t perm, uint64_t shared_perm,
                                   void *opaque, Error **errp)
 {
-    BdrvChild *child;
-    Error *local_err = NULL;
     int ret;
-    AioContext *ctx;
+    BdrvChild *child = NULL;
+    GSList *tran = NULL;
 
-    ret = bdrv_check_update_perm(child_bs, NULL, perm, shared_perm, NULL, errp);
+    ret = bdrv_attach_child_common(child_bs, child_name, child_class,
+                                   child_role, perm, shared_perm, opaque,
+                                   &child, &tran, errp);
     if (ret < 0) {
-        bdrv_abort_perm_update(child_bs);
         bdrv_unref(child_bs);
         return NULL;
     }
 
-    child = g_new(BdrvChild, 1);
-    *child = (BdrvChild) {
-        .bs             = NULL,
-        .name           = g_strdup(child_name),
-        .klass          = child_class,
-        .role           = child_role,
-        .perm           = perm,
-        .shared_perm    = shared_perm,
-        .opaque         = opaque,
-    };
-
-    ctx = bdrv_child_get_parent_aio_context(child);
-
-    /* If the AioContexts don't match, first try to move the subtree of
-     * child_bs into the AioContext of the new parent. If this doesn't work,
-     * try moving the parent into the AioContext of child_bs instead. */
-    if (bdrv_get_aio_context(child_bs) != ctx) {
-        ret = bdrv_try_set_aio_context(child_bs, ctx, &local_err);
-        if (ret < 0) {
-            if (bdrv_parent_try_set_aio_context(child, ctx, NULL) == 0) {
-                ret = 0;
-                error_free(local_err);
-                local_err = NULL;
-            }
-        }
-        if (ret < 0) {
-            error_propagate(errp, local_err);
-            g_free(child);
-            bdrv_abort_perm_update(child_bs);
-            bdrv_unref(child_bs);
-            return NULL;
-        }
-    }
-
-    /* This performs the matching bdrv_set_perm() for the above check. */
-    bdrv_replace_child(child, child_bs);
+    ret = bdrv_refresh_perms(child_bs, errp);
+    tran_finalize(tran, ret);
 
+    bdrv_unref(child_bs);
     return child;
 }
 
@@ -2988,16 +2962,114 @@ BdrvChild *bdrv_attach_child(BlockDriverState *parent_bs,
     return child;
 }
 
-static void bdrv_detach_child(BdrvChild *child)
+static void bdrv_remove_empty_child(BdrvChild *child)
 {
+    assert(!child->bs);
     QLIST_SAFE_REMOVE(child, next);
-
-    bdrv_replace_child(child, NULL);
-
     g_free(child->name);
     g_free(child);
 }
 
+typedef struct BdrvAttachChildCommonState {
+    BdrvChild **child;
+    AioContext *old_parent_ctx;
+    AioContext *old_child_ctx;
+} BdrvAttachChildCommonState;
+
+static void bdrv_attach_child_common_abort(void *opaque)
+{
+    BdrvAttachChildCommonState *s = opaque;
+    BdrvChild *child = *s->child;
+    BlockDriverState *bs = child->bs;
+
+    bdrv_replace_child_noperm(child, NULL);
+
+    if (bdrv_get_aio_context(bs) != s->old_child_ctx) {
+        bdrv_try_set_aio_context(bs, s->old_child_ctx, &error_abort);
+    }
+
+    if (bdrv_child_get_parent_aio_context(child) != s->old_parent_ctx) {
+        bdrv_parent_try_set_aio_context(child, s->old_parent_ctx,
+                                        &error_abort);
+    }
+
+    bdrv_unref(bs);
+    bdrv_remove_empty_child(child);
+    *s->child = NULL;
+}
+
+static TransactionActionDrv bdrv_attach_child_common_drv = {
+    .abort = bdrv_attach_child_common_abort,
+};
+
+/*
+ * Common part of attoching bdrv child to bs or to blk or to job
+ */
+static int bdrv_attach_child_common(BlockDriverState *child_bs,
+                                    const char *child_name,
+                                    const BdrvChildClass *child_class,
+                                    BdrvChildRole child_role,
+                                    uint64_t perm, uint64_t shared_perm,
+                                    void *opaque, BdrvChild **child,
+                                    GSList **tran, Error **errp)
+{
+    int ret;
+    BdrvChild *new_child;
+    AioContext *parent_ctx;
+    AioContext *child_ctx = bdrv_get_aio_context(child_bs);
+
+    assert(child);
+    assert(*child == NULL);
+
+    new_child = g_new(BdrvChild, 1);
+    *new_child = (BdrvChild) {
+        .bs             = NULL,
+        .name           = g_strdup(child_name),
+        .klass          = child_class,
+        .role           = child_role,
+        .perm           = perm,
+        .shared_perm    = shared_perm,
+        .opaque         = opaque,
+    };
+
+    parent_ctx = bdrv_child_get_parent_aio_context(new_child);
+    if (child_ctx != parent_ctx) {
+        ret = bdrv_try_set_aio_context(child_bs, parent_ctx, NULL);
+        if (ret < 0) {
+            /*
+             * bdrv_try_set_aio_context_tran don't need rollback after failure,
+             * so we don't care.
+             */
+            ret = bdrv_parent_try_set_aio_context(new_child, child_ctx, errp);
+        }
+        if (ret < 0) {
+            bdrv_remove_empty_child(new_child);
+            return ret;
+        }
+    }
+
+    bdrv_ref(child_bs);
+    bdrv_replace_child_noperm(new_child, child_bs);
+
+    *child = new_child;
+
+    BdrvAttachChildCommonState *s = g_new(BdrvAttachChildCommonState, 1);
+    *s = (BdrvAttachChildCommonState) {
+        .child = child,
+        .old_parent_ctx = parent_ctx,
+        .old_child_ctx = child_ctx,
+    };
+    tran_prepend(tran, &bdrv_attach_child_common_drv, s);
+
+    return 0;
+}
+
+static void bdrv_detach_child(BdrvChild *child)
+{
+    bdrv_replace_child(child, NULL);
+    bdrv_remove_empty_child(child);
+}
+
 /* Callers must ensure that child->frozen is false. */
 void bdrv_root_unref_child(BdrvChild *child)
 {
-- 
2.21.3


