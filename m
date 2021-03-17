Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F6BB33F39D
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Mar 2021 15:45:47 +0100 (CET)
Received: from localhost ([::1]:55192 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lMXQg-0004pw-0E
	for lists+qemu-devel@lfdr.de; Wed, 17 Mar 2021 10:45:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34744)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lMXHv-0004qB-UA; Wed, 17 Mar 2021 10:36:47 -0400
Received: from mail-eopbgr60123.outbound.protection.outlook.com
 ([40.107.6.123]:28737 helo=EUR04-DB3-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lMXHj-0006ux-MJ; Wed, 17 Mar 2021 10:36:43 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Fmu+beG7TOPQ4oSeLl3iPrBlrdNDO9j/9u6mSq0zo0wlAKcOBQBYJ5Z5/DOWmwiaF1FKopfHZQiM5T2fEHOY8Nryl6mwgHiZVoNqVY/jb8fii8ysRi8JLNkuYgpjQKVm6YbW89FmNBh/QWOi+fBmeh8wuVWhiW0WtuDWrxsnvigcT27EdWuWomUlVkFqpaw88qY54Xzh5VGd18BPnS85CmceUgPlFMVji4oOTpzUJ13dl4cn/GD32m80/XMH0ZuwhewDbW5U9Pzz9f4j0wfn3r6oFJv52uh3pOz+DnbJlxysRvd9OrPqu4+fPfXpcdVbMGvVQXqPT+irTdoaEwtURw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MXC+/hmi+ww7Erz97Y5eGx8It1Q77eahxTXng/xnr9k=;
 b=arR8iH/3GJrdaUFAVvsu0TRDpOki7EM5fsWPDbFAphcSdQvr7CVDT1Wv9KJ/oVjmXm74JEKVTWW4eTp/bjU3diVGGTL3oOZufSc0eR5lmp/j9Pd3g+/g8AwB60sF4jnp+ynxda02Th6/GC1qwgT4FvVGFmt/5pvfuufWNCB5UqsDgQSXFtYHHOLGjQQMDkqE02u0KhxYuBZpUAURmJnYsa2i/oDABR6TLR/T+lgJsOMeJBXuP9vz8ZUpmn09gl3gqMd5iH4bNqm2YWKDjd2anfEh8NOk0GGyxxhzn85bBkDnxM8Rx8NXsuGycSl0stIJNCnxYUSQt8gVexKj23L1LA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MXC+/hmi+ww7Erz97Y5eGx8It1Q77eahxTXng/xnr9k=;
 b=VMNWqQliffb6CDtbQi+MX93Ci+czBMPpkJySA/XeMHLI1qGBBg9hl9Y/1fJH0bxQevZYobRywVk2RfYLBRANbFiWKGwKb8o56YuONHdUB5xv9igR4bXi06VtZhARbCvNfboSeh9Pr+U9eNdjY+LxhUufjuctq3VYFiPa/6WmOv0=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB3544.eurprd08.prod.outlook.com (2603:10a6:20b:4e::30)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3933.32; Wed, 17 Mar
 2021 14:36:29 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f1f0:6610:11f5:5e4a]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f1f0:6610:11f5:5e4a%8]) with mapi id 15.20.3933.032; Wed, 17 Mar 2021
 14:36:29 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, armbru@redhat.com, fam@euphon.net,
 stefanha@redhat.com, vsementsov@virtuozzo.com, jsnow@redhat.com,
 mreitz@redhat.com, kwolf@redhat.com
Subject: [PATCH v3 18/36] block: add bdrv_attach_child_common() transaction
 action
Date: Wed, 17 Mar 2021 17:35:11 +0300
Message-Id: <20210317143529.615584-19-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210317143529.615584-1-vsementsov@virtuozzo.com>
References: <20210317143529.615584-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [185.215.60.202]
X-ClientProxiedBy: HE1PR0401CA0052.eurprd04.prod.outlook.com
 (2603:10a6:3:19::20) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (185.215.60.202) by
 HE1PR0401CA0052.eurprd04.prod.outlook.com (2603:10a6:3:19::20) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3955.18 via Frontend Transport; Wed, 17 Mar 2021 14:36:28 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 80d36711-7d4b-4f37-7ac0-08d8e9520d25
X-MS-TrafficTypeDiagnostic: AM6PR08MB3544:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR08MB3544C8F6C521DAEFF4B18788C16A9@AM6PR08MB3544.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2887;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: UN4ydbJuA20jOPeHZXvCA/tejjPfFfX7GXpBvgtNA+ZBv2O8CjKrbwtSjrTEYi5qeOzMPRlUHBh0rwaJ1FGEE8xRvconAZxuzM0N4qXSfFQV+yvnP6VUYDsI5VI4AWalavzsN4zXDdyi2H395AlKcr+ruT6hP8WEeZ0yUXuxc3TYQpVGQW1RZBXPywwJhcQx91eUlquEyMPglrDmCpR0+tgrdFlBvEa55UYz3VRy34qXdiatCHMEvGbttDwBCoA16ssozzuqPZGsaqA2M2cA1myqhBXx89IMCa6Myas2hb7Q+t7NZhORi/iBW9EHfGyBpiZqtm7mgCJnnFV7ymRUi090CV+NaE5n1TRj2cIT4Ug1zZjLTdDLNuNG6Hg1J2+8JWwRqeXjdZk7SHaSD3IlP+vAyV94NrFb+kwxNQRLTeDwoVdT7luhNidefVtuGWsc/Lz3vmcvvdIrK+6K422wM9DUxjGYjat4J8g6mkHzMh0ln7mBAVr7Ounu1MMzLU7gFFW7ZMoOjEh3suiS+z2MnG5wE3E5u00oKoBGjrEFPchPxdIMVfDyTRfgOV5lCenstbcZo/E6hYxWGD4934SEaalo7JTUj3S/TlvTTkqCJEyXyqBIHWEJHfxVCEuBjJ3L
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(366004)(376002)(39840400004)(136003)(396003)(186003)(8676002)(16526019)(26005)(86362001)(1076003)(52116002)(36756003)(6916009)(66476007)(6506007)(4326008)(6486002)(2616005)(5660300002)(8936002)(66556008)(66946007)(83380400001)(2906002)(478600001)(956004)(6666004)(69590400012)(6512007)(316002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?LNtCHs7Cb8puVERmxDoVQWGCfPtPIgm8U8VhD+4p6JYNP1JUPPHYB0Dmw2w8?=
 =?us-ascii?Q?8AXzNtCzoy3bYplsgL3aPGYXn6bfZDfF5RT+Plx1rudiLdqf4+b0J7P8mJ84?=
 =?us-ascii?Q?k3khdDpwiHiN2GCaD43usI96dPUQtW2K/JEBPrQpgtzBQa0m2FbUvCx68nmO?=
 =?us-ascii?Q?ihZ6UAv72wk8dPtbXGjpyM0uNEnanYJo1rd1LTV8rTK2YG5cnF5RAuavKVW2?=
 =?us-ascii?Q?pxvkbFdCUOxClDjAdDOe4oGelqluODNmKRcZzCOGWTG6S8t4VSG5dO9Vt8Fk?=
 =?us-ascii?Q?EaWRIu7uP0dW0+bsGGbeA8o1ACnbbsxqmfAaZbtiekqbYJMxJp3xrL+6FjUK?=
 =?us-ascii?Q?b6i6wsv3MC3Be5Zq7AruDcxmK5e7m4M0kVHPnNIabbMlPFaaygjNnlX0B4y4?=
 =?us-ascii?Q?PgIfyUPF60eBytiFNHFK6emnY1xbP4STev4QzUrbE3fnj+wAVlF56B1tAwcZ?=
 =?us-ascii?Q?9+xMIEveDXsb432Et268svzFY60dyHSWFbDAqf9ZT4TXhvXdJIQMHKvpCaj+?=
 =?us-ascii?Q?m7qQgjxMyOkfIuwqcv50Anh/MEXfMOfU64Jm+TQkS15T9Eoap3PpejiJbdRH?=
 =?us-ascii?Q?xCKUZQSIlvA4pfefyPXtjXJkVlplPbIIQg/iJTAZuSb6NKUhUxjlyuccMSDs?=
 =?us-ascii?Q?YSvnnewMHAivvL2rhxrZSbUasISVIhXPb3RjtjiOgn4Ki0lHSVBnR9VKbPej?=
 =?us-ascii?Q?+9XB2SoczG03hybwlGXxIVbawpCKNGoxP+cdb192VPQARkBL6GEZLMFqu6cx?=
 =?us-ascii?Q?/BgF6FQ4bCcEr0q9hMt3SkE321OOLR8aYe8r1hSN9HxvDiKyVdyUG+07mIZ5?=
 =?us-ascii?Q?eh62I9FWRz41wZPxzX35IVxu03nUtJ5chXPpDIBJUb6AlF83vsPv1/Fo3DqG?=
 =?us-ascii?Q?xGwhzCgDXjxie6vQ2zDNZ72v1KRIZZrSRy9sRHsFyd/Lled+G28TMCfcLbPS?=
 =?us-ascii?Q?azPvsDAAdb0RyEeaYKU3vhgEKMmfv+N9HsnaRNdLsVKW29X42v+VEYhTU+Ep?=
 =?us-ascii?Q?6QYRhzxJRwLUgiDBQbHpVF8ynHDBIDGlXi1hvFQwcMvpX2XRGUg8lLIzhKcv?=
 =?us-ascii?Q?Mj5yep3O+AQ3Mfgs3v6QgjgH9fDl7Prye/LSb8KXgCxYNLA4DNW8LJ8jywUS?=
 =?us-ascii?Q?p53EGoBVwp1tZXZTUtqcs/X4Wxe66iO/dE8w+EQw9KsYA31Xy+nTACkBjc0o?=
 =?us-ascii?Q?uhL5++h8G8Xc5m/OU3aowG1zTePN+8MqEdfrMh5lX2+j3uYhftRpRHxx6DVj?=
 =?us-ascii?Q?iQ9Jr/3foJvOEfbUIz/2A6MBbkeboLxX7/477RU4rZHoRgM1jBRjz3oEGtyS?=
 =?us-ascii?Q?evsPIfN+/UxJST/dw4j0w0kr?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 80d36711-7d4b-4f37-7ac0-08d8e9520d25
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Mar 2021 14:36:29.2006 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: w4eps9+o4I/nhevI6jB+dfb2hPBsVDft02dRXfZ1z1D3WnIcxLoJmiZAhbqkn2ePhxCCtPt5EzJ2IgfMMAOgfMryJ1m/NKnSZJPFtKEBjAE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB3544
Received-SPF: pass client-ip=40.107.6.123;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR04-DB3-obe.outbound.protection.outlook.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
 block.c | 189 ++++++++++++++++++++++++++++++++++++++++----------------
 1 file changed, 135 insertions(+), 54 deletions(-)

diff --git a/block.c b/block.c
index 98ff44dbf7..b6bdc534d2 100644
--- a/block.c
+++ b/block.c
@@ -2921,37 +2921,73 @@ static void bdrv_replace_child(BdrvChild *child, BlockDriverState *new_bs)
     }
 }
 
-/*
- * This function steals the reference to child_bs from the caller.
- * That reference is later dropped by bdrv_root_unref_child().
- *
- * On failure NULL is returned, errp is set and the reference to
- * child_bs is also dropped.
- *
- * The caller must hold the AioContext lock @child_bs, but not that of @ctx
- * (unless @child_bs is already in @ctx).
- */
-BdrvChild *bdrv_root_attach_child(BlockDriverState *child_bs,
-                                  const char *child_name,
-                                  const BdrvChildClass *child_class,
-                                  BdrvChildRole child_role,
-                                  uint64_t perm, uint64_t shared_perm,
-                                  void *opaque, Error **errp)
+static void bdrv_remove_empty_child(BdrvChild *child)
 {
-    BdrvChild *child;
-    Error *local_err = NULL;
-    int ret;
-    AioContext *ctx;
+    assert(!child->bs);
+    QLIST_SAFE_REMOVE(child, next);
+    g_free(child->name);
+    g_free(child);
+}
 
-    ret = bdrv_check_update_perm(child_bs, NULL, perm, shared_perm, NULL, errp);
-    if (ret < 0) {
-        bdrv_abort_perm_update(child_bs);
-        bdrv_unref(child_bs);
-        return NULL;
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
     }
 
-    child = g_new(BdrvChild, 1);
-    *child = (BdrvChild) {
+    if (bdrv_child_get_parent_aio_context(child) != s->old_parent_ctx) {
+        GSList *ignore = g_slist_prepend(NULL, child);
+
+        child->klass->can_set_aio_ctx(child, s->old_parent_ctx, &ignore,
+                                      &error_abort);
+        g_slist_free(ignore);
+        ignore = g_slist_prepend(NULL, child);
+        child->klass->set_aio_ctx(child, s->old_parent_ctx, &ignore);
+
+        g_slist_free(ignore);
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
+                                    Transaction *tran, Error **errp)
+{
+    BdrvChild *new_child;
+    AioContext *parent_ctx;
+    AioContext *child_ctx = bdrv_get_aio_context(child_bs);
+
+    assert(child);
+    assert(*child == NULL);
+
+    new_child = g_new(BdrvChild, 1);
+    *new_child = (BdrvChild) {
         .bs             = NULL,
         .name           = g_strdup(child_name),
         .klass          = child_class,
@@ -2961,37 +2997,92 @@ BdrvChild *bdrv_root_attach_child(BlockDriverState *child_bs,
         .opaque         = opaque,
     };
 
-    ctx = bdrv_child_get_parent_aio_context(child);
-
-    /* If the AioContexts don't match, first try to move the subtree of
+    /*
+     * If the AioContexts don't match, first try to move the subtree of
      * child_bs into the AioContext of the new parent. If this doesn't work,
-     * try moving the parent into the AioContext of child_bs instead. */
-    if (bdrv_get_aio_context(child_bs) != ctx) {
-        ret = bdrv_try_set_aio_context(child_bs, ctx, &local_err);
+     * try moving the parent into the AioContext of child_bs instead.
+     */
+    parent_ctx = bdrv_child_get_parent_aio_context(new_child);
+    if (child_ctx != parent_ctx) {
+        Error *local_err = NULL;
+        int ret = bdrv_try_set_aio_context(child_bs, parent_ctx, &local_err);
+
         if (ret < 0 && child_class->can_set_aio_ctx) {
-            GSList *ignore = g_slist_prepend(NULL, child);
-            ctx = bdrv_get_aio_context(child_bs);
-            if (child_class->can_set_aio_ctx(child, ctx, &ignore, NULL)) {
+            GSList *ignore = g_slist_prepend(NULL, new_child);
+            if (child_class->can_set_aio_ctx(new_child, child_ctx, &ignore,
+                                             NULL))
+            {
                 error_free(local_err);
                 ret = 0;
                 g_slist_free(ignore);
-                ignore = g_slist_prepend(NULL, child);
-                child_class->set_aio_ctx(child, ctx, &ignore);
+                ignore = g_slist_prepend(NULL, new_child);
+                child_class->set_aio_ctx(new_child, child_ctx, &ignore);
             }
             g_slist_free(ignore);
         }
+
         if (ret < 0) {
             error_propagate(errp, local_err);
-            g_free(child);
-            bdrv_abort_perm_update(child_bs);
-            bdrv_unref(child_bs);
-            return NULL;
+            bdrv_remove_empty_child(new_child);
+            return ret;
         }
     }
 
-    /* This performs the matching bdrv_set_perm() for the above check. */
-    bdrv_replace_child(child, child_bs);
+    bdrv_ref(child_bs);
+    bdrv_replace_child_noperm(new_child, child_bs);
+
+    *child = new_child;
 
+    BdrvAttachChildCommonState *s = g_new(BdrvAttachChildCommonState, 1);
+    *s = (BdrvAttachChildCommonState) {
+        .child = child,
+        .old_parent_ctx = parent_ctx,
+        .old_child_ctx = child_ctx,
+    };
+    tran_add(tran, &bdrv_attach_child_common_drv, s);
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
+/*
+ * This function steals the reference to child_bs from the caller.
+ * That reference is later dropped by bdrv_root_unref_child().
+ *
+ * On failure NULL is returned, errp is set and the reference to
+ * child_bs is also dropped.
+ *
+ * The caller must hold the AioContext lock @child_bs, but not that of @ctx
+ * (unless @child_bs is already in @ctx).
+ */
+BdrvChild *bdrv_root_attach_child(BlockDriverState *child_bs,
+                                  const char *child_name,
+                                  const BdrvChildClass *child_class,
+                                  BdrvChildRole child_role,
+                                  uint64_t perm, uint64_t shared_perm,
+                                  void *opaque, Error **errp)
+{
+    int ret;
+    BdrvChild *child = NULL;
+    Transaction *tran = tran_new();
+
+    ret = bdrv_attach_child_common(child_bs, child_name, child_class,
+                                   child_role, perm, shared_perm, opaque,
+                                   &child, tran, errp);
+    if (ret < 0) {
+        bdrv_unref(child_bs);
+        return NULL;
+    }
+
+    ret = bdrv_refresh_perms(child_bs, errp);
+    tran_finalize(tran, ret);
+
+    bdrv_unref(child_bs);
     return child;
 }
 
@@ -3033,16 +3124,6 @@ BdrvChild *bdrv_attach_child(BlockDriverState *parent_bs,
     return child;
 }
 
-static void bdrv_detach_child(BdrvChild *child)
-{
-    QLIST_SAFE_REMOVE(child, next);
-
-    bdrv_replace_child(child, NULL);
-
-    g_free(child->name);
-    g_free(child);
-}
-
 /* Callers must ensure that child->frozen is false. */
 void bdrv_root_unref_child(BdrvChild *child)
 {
-- 
2.29.2


