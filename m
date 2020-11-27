Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AEFE02C6881
	for <lists+qemu-devel@lfdr.de>; Fri, 27 Nov 2020 16:13:41 +0100 (CET)
Received: from localhost ([::1]:59690 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kifRM-0000CI-Of
	for lists+qemu-devel@lfdr.de; Fri, 27 Nov 2020 10:13:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37064)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1kif1U-0001id-2p; Fri, 27 Nov 2020 09:46:56 -0500
Received: from mail-db8eur05on2112.outbound.protection.outlook.com
 ([40.107.20.112]:40192 helo=EUR05-DB8-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1kif1R-000369-At; Fri, 27 Nov 2020 09:46:55 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ft1PUTnof4mQKl2mxC2AvZbyuT4ls43UqBHmCVbxKVkw6CRdKiLtrxpr3IPx/9M3ZXeu9vxG4ESIyqCDxsZcuxNVM/Q6pibh4P2W4EZ8qcrlnSV4rQTzm7dGxAKDFZvMqPAUjil/UBQTx3RvedkU5wALE0B+cFtiaqQwYGadcQysceXZgqsFKY0v3B661P+FEqRzChpsdWiaKOxWEyVPaLrPCCtS99r7JVByaQVT3/SOc+4ESPxMT3caTtOEHbwtkXIe2b8znZkk5cBbEZtKu9jHxSS90Uw4bytfq35vbcdWG68r69FMOXAHOyf94uHyhBAVWvCV8d2ERRw9CF0hSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sFPGEPAiKKMfURhdgBuDqVfOjB1QsbB+PzCJJfiYB3Q=;
 b=jkUysl5tephSe46SxnQOTHGPU4zml+nHaMF9SUOA4+e/36VILxwawiFFvqrm9mFksdn0YZRXrM76TpvycnRa7t5pjXyDG0wfD/KAPxk0ahm2BGnNzeT6S34wIcBvPunpIxxvDKgxsOdx1ZksKFIDt9JH0/N38FA482ZVRsIrewsnwtwVT5EUj58sK7uDiLVbYLIj8jfvLBxa5OslofM8owWtqMCYicYv7k/5aopqQrcB5S1ukzXHbnYX2Ju9ioVS4ENd2JHAe+uax/n3vuAUoTehy3jo14sJFZlvJXb7xLVOS/7L/mhbfafpgnci7k2Vk3K23P5JJMzJ2ijCntMfCg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sFPGEPAiKKMfURhdgBuDqVfOjB1QsbB+PzCJJfiYB3Q=;
 b=ie8sJgNDIjyKLGfYkCjHxW7B0E/tkIOqf3RQKD24ID81B3a14JZijW7QZD7t7uF8L7H1jNfrcu+qbnGKtnRwWPLRdsG3ABkkaH1ssl8mO4kkMzu2FwDOME6j0Ng0EuuvFsIfqqzmXkx+sMs0Jq0BzY4rOkls3z3QavslIYBl5qc=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB5128.eurprd08.prod.outlook.com (2603:10a6:20b:e3::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3589.24; Fri, 27 Nov
 2020 14:45:57 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::d585:99a4:d7a4:d478]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::d585:99a4:d7a4:d478%4]) with mapi id 15.20.3611.025; Fri, 27 Nov 2020
 14:45:57 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, armbru@redhat.com, jsnow@redhat.com,
 mreitz@redhat.com, kwolf@redhat.com, vsementsov@virtuozzo.com,
 den@openvz.org
Subject: [PATCH v2 05/36] block: add bdrv_parent_try_set_aio_context
Date: Fri, 27 Nov 2020 17:44:51 +0300
Message-Id: <20201127144522.29991-6-vsementsov@virtuozzo.com>
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
 Transport; Fri, 27 Nov 2020 14:45:39 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7777bd0a-07e5-4ef3-ff3f-08d892e31c5f
X-MS-TrafficTypeDiagnostic: AM6PR08MB5128:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR08MB5128FB3D519EAF8BBDFA335BC1F80@AM6PR08MB5128.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:185;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 3Zk7GI9ro2+TxPsPCMMHkgKmrjXn5/8hQ4s6bk56xuD0u+A1sSQR6/UpqHwaYzO0iyZ6okOl+QaEkIhbJjzLyWTLwwZxFjE8ojPCKS1iLXtkV9VvEPGzlb1VNKJM53f6e6+ZqOJGHFdYyO0lntrD1CfIGMO3c5oKe0JOkgH8vBmkcQMBLmKxXBFmDHu7MoRYlqV4Q7lb3xWfaBLL25lTn61vD66yO2EomeI+sicGwaQtOhrMG0J/WdFCAy2Hu/Svf7YHG4WzouCc/BjUCTyDT7s6QZv8xoOEKWpyyFt045K5Xge58i96/NXq78eb2naxQzbqyEJJ4PaAyhVFvbC/ks6mRhbTBqb8TEStJF4wX5lm6ETm3J9UgGjn+ih++kXI
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(366004)(346002)(39840400004)(136003)(376002)(66946007)(66556008)(478600001)(6512007)(2616005)(66476007)(6506007)(316002)(26005)(186003)(6666004)(69590400008)(16526019)(956004)(8676002)(5660300002)(6916009)(83380400001)(2906002)(4326008)(1076003)(8936002)(36756003)(86362001)(6486002)(52116002)(107886003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?uGKoWHrJa62C+MTqGaDhBCWzdkUu1sq3S+VY2I3thJGVSTpwaOfbcl3bpGbM?=
 =?us-ascii?Q?7b0CUwcNwqGe4QB9pfBlgLMMyzGCqkCggCjvRvV+r8McWSxxmgM3ryibMVfq?=
 =?us-ascii?Q?gz+mz1x58LujVcEunF39SK1Mh8RdNMBvIDdSwwFDNEeEoKdc5Wnfk8zPqaHA?=
 =?us-ascii?Q?fOpz0i28tZEEBW7bMRIrhLUg62xXG7shmlDN0PZccEMFKfU9+r1FwGD9vpoo?=
 =?us-ascii?Q?xF5M5I1TtT7uVujGYKadxXKStwKTgopgBFMG9ofdwN9sJali3UXrpmFd3uXz?=
 =?us-ascii?Q?XRL2FJKdQJaYXdCgPbhc73LBJspZPqWjR27WPrqfchCnMHtHExf4jUMRospD?=
 =?us-ascii?Q?LBm+Xqst3GOQjVT8mN9aAH6mlAWO2FlqnEOHrmfig2litSbch1gmT6HAkGvr?=
 =?us-ascii?Q?3RsrQBMOIEvXlR7Hup8LHv1YlimnELRBltqYRvN3b26WnGa7a7IkSdm9Wtnw?=
 =?us-ascii?Q?+HiDkrboNbrQ6+U1pc607Xd5B/+DvCh+a7lRNEqWobxBRwxr5yvBc6AezLIk?=
 =?us-ascii?Q?ZLlw8vn+Bml7W/0BHDeJmNK34f7YDAvp994wg/23+UiZQWOuFRf1XsuF2TdA?=
 =?us-ascii?Q?EoBE0ktGei1tTHMFfXPNypBUyZqji4JiLje8fKNJB0U7wUMxzRnx+xY9hX9w?=
 =?us-ascii?Q?E07VXe8PK8iDZD+jdULAchuckrwUgJFhd2AJyHQQGOjSkKvxA/ziAVBiTphC?=
 =?us-ascii?Q?/+IZRH4tNTfBKwQ687xiWzKjPzplBG3xDPXRrxaW97A66j4INlghv3Wr3iXS?=
 =?us-ascii?Q?pOpqDybPYPi0RUohNZAF7D+gPQ9UZSJWrp8Aly7AbbP38PDPej0RhVzOPaft?=
 =?us-ascii?Q?p/5bRTCaIsp5ZAU1IJlbi+HKBg6jLW5nRw/tO4SBAQwuXkrcRYULJVH4rc5x?=
 =?us-ascii?Q?Lig25LbmpsHvTkLEvXIviCn8pkjh0/xh8uz2WO2gtzA9nC+OUPyd5yNsQIpT?=
 =?us-ascii?Q?5OS46HMX+2r4NbptYRWVf2t1aoT0OgNwE9gRP0kJvdaS1DOagDgo/UJvoaim?=
 =?us-ascii?Q?dGf+?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7777bd0a-07e5-4ef3-ff3f-08d892e31c5f
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Nov 2020 14:45:40.6181 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nxIh97qxXj70Xnb2JQwfEWjp38cxmYRmmyUxr8mp+Uif58FWP8sxH7HcuYXOFOHtB0TdHeJOuGxdkOPYK8Pj7NNnFIYJvyR3rEYpnLOWRvY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB5128
Received-SPF: pass client-ip=40.107.20.112;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR05-DB8-obe.outbound.protection.outlook.com
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

We already have bdrv_parent_can_set_aio_context(). Add corresponding
bdrv_parent_set_aio_context_ignore() and
bdrv_parent_try_set_aio_context() and use them instead of open-coding.

Make bdrv_parent_try_set_aio_context() public, as it will be used in
further commit.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 include/block/block.h |  2 ++
 block.c               | 51 +++++++++++++++++++++++++++++++++----------
 2 files changed, 41 insertions(+), 12 deletions(-)

diff --git a/include/block/block.h b/include/block/block.h
index ee3f5a6cca..550c5a7513 100644
--- a/include/block/block.h
+++ b/include/block/block.h
@@ -686,6 +686,8 @@ bool bdrv_child_can_set_aio_context(BdrvChild *c, AioContext *ctx,
                                     GSList **ignore, Error **errp);
 bool bdrv_can_set_aio_context(BlockDriverState *bs, AioContext *ctx,
                               GSList **ignore, Error **errp);
+int bdrv_parent_try_set_aio_context(BdrvChild *c, AioContext *ctx,
+                                    Error **errp);
 int bdrv_probe_blocksizes(BlockDriverState *bs, BlockSizes *bsz);
 int bdrv_probe_geometry(BlockDriverState *bs, HDGeometry *geo);
 
diff --git a/block.c b/block.c
index 916087ee1a..5d925c208d 100644
--- a/block.c
+++ b/block.c
@@ -81,6 +81,9 @@ static BlockDriverState *bdrv_open_inherit(const char *filename,
                                            BdrvChildRole child_role,
                                            Error **errp);
 
+static void bdrv_parent_set_aio_context_ignore(BdrvChild *c, AioContext *ctx,
+                                               GSList **ignore);
+
 /* If non-zero, use only whitelisted block drivers */
 static int use_bdrv_whitelist;
 
@@ -2655,17 +2658,12 @@ BdrvChild *bdrv_root_attach_child(BlockDriverState *child_bs,
      * try moving the parent into the AioContext of child_bs instead. */
     if (bdrv_get_aio_context(child_bs) != ctx) {
         ret = bdrv_try_set_aio_context(child_bs, ctx, &local_err);
-        if (ret < 0 && child_class->can_set_aio_ctx) {
-            GSList *ignore = g_slist_prepend(NULL, child);
-            ctx = bdrv_get_aio_context(child_bs);
-            if (child_class->can_set_aio_ctx(child, ctx, &ignore, NULL)) {
-                error_free(local_err);
+        if (ret < 0) {
+            if (bdrv_parent_try_set_aio_context(child, ctx, NULL) == 0) {
                 ret = 0;
-                g_slist_free(ignore);
-                ignore = g_slist_prepend(NULL, child);
-                child_class->set_aio_ctx(child, ctx, &ignore);
+                error_free(local_err);
+                local_err = NULL;
             }
-            g_slist_free(ignore);
         }
         if (ret < 0) {
             error_propagate(errp, local_err);
@@ -6452,9 +6450,7 @@ void bdrv_set_aio_context_ignore(BlockDriverState *bs,
         if (g_slist_find(*ignore, child)) {
             continue;
         }
-        assert(child->klass->set_aio_ctx);
-        *ignore = g_slist_prepend(*ignore, child);
-        child->klass->set_aio_ctx(child, new_context, ignore);
+        bdrv_parent_set_aio_context_ignore(child, new_context, ignore);
     }
 
     bdrv_detach_aio_context(bs);
@@ -6511,6 +6507,37 @@ static bool bdrv_parent_can_set_aio_context(BdrvChild *c, AioContext *ctx,
     return true;
 }
 
+static void bdrv_parent_set_aio_context_ignore(BdrvChild *c, AioContext *ctx,
+                                               GSList **ignore)
+{
+    if (g_slist_find(*ignore, c)) {
+        return;
+    }
+    *ignore = g_slist_prepend(*ignore, c);
+
+    assert(c->klass->set_aio_ctx);
+    c->klass->set_aio_ctx(c, ctx, ignore);
+}
+
+int bdrv_parent_try_set_aio_context(BdrvChild *c, AioContext *ctx,
+                                    Error **errp)
+{
+    GSList *ignore = NULL;
+
+    if (!bdrv_parent_can_set_aio_context(c, ctx, &ignore, errp)) {
+        g_slist_free(ignore);
+        return -EPERM;
+    }
+
+    g_slist_free(ignore);
+    ignore = NULL;
+
+    bdrv_parent_set_aio_context_ignore(c, ctx, &ignore);
+    g_slist_free(ignore);
+
+    return 0;
+}
+
 bool bdrv_child_can_set_aio_context(BdrvChild *c, AioContext *ctx,
                                     GSList **ignore, Error **errp)
 {
-- 
2.21.3


