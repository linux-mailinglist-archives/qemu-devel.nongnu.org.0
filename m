Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0509D2C68A3
	for <lists+qemu-devel@lfdr.de>; Fri, 27 Nov 2020 16:23:43 +0100 (CET)
Received: from localhost ([::1]:56704 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kifb5-0002Ue-0a
	for lists+qemu-devel@lfdr.de; Fri, 27 Nov 2020 10:23:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37082)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1kif1W-0001jd-3q; Fri, 27 Nov 2020 09:46:59 -0500
Received: from mail-db8eur05on2103.outbound.protection.outlook.com
 ([40.107.20.103]:20897 helo=EUR05-DB8-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1kif1T-0003RM-0p; Fri, 27 Nov 2020 09:46:57 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Gg9no6ccQ5dFFjTTTpK8CVG9R+gUqaIgJ7gCh79/NfQJmiMAVikb1wgxpfWv0LMBWhpoahfpgoYbH473KnAxiVpJcwBgKCIdYFdznTMc+7EB94rs5+ypMYheL2gjrCcWxyGlulxgyYCnvKCkf+UHsWcfBqLwISFQzOJ9cg8DTOp/stsv9yj7eJfJrzvfBEZBZTmlcfAIAgXHe5nUdbNiNHcaZ9//BNLYL7K8NKx6dhVgD7HwbaGnbP+Ni/qzqrhX2tQeVMGppchtNEun17Uhl4LT+3K2Ls5gHXHgZUd8b8CDEyr/1h/ZwSZ4dc6Gp3+GNl0Ab97cGpTVKKG1N2xxPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=B9AbPK1v3nYwEjHS358SNuG4zwCkc34Um7nmW4zQP5Q=;
 b=XhpkOBXfqCVgJgzdpM2jcBhe+/P+U6R/9AuwR4gF0w5Gix6OR62pCLfv1K+Pd+/hklj71XGISvo9bFZGzwZ8hklNIquchJAZCmK/mz/yhu8StcAycuoP0cHLjkc9C16irhD2yfQTGXUERUaPcpSUmbzwxm9jQAPXhzb2sJdIF3tn/CRhP/lIZlDS7GSlCmduiAnooaftLemmeem3IXOKVvKZy9/XiTgKIBzK/hLnclYrvtgos9dhE76aljYtpYVsY9ucYspOCKslt9jnXVNB8bKxbTjlp0boKCLRgcVnlU5/vJdr8N87Ky9RNDujPk58qZZIn5ZNNQ9lVF6LLZvzyA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=B9AbPK1v3nYwEjHS358SNuG4zwCkc34Um7nmW4zQP5Q=;
 b=hXLeNLebtPAtrRYeXZdtlR8W+zjWKeEH3oMrG+Sv2UdER0yqU/HpWwDuXuTfvW79Oa6sz59MUI1j4CFZ2F9gUPMfckAytpcB/XxjKVr75wwqyQpjfsJn6GBODlcdWoDJOAm+NrICCZC6x1fYywWBGC2oDxhB9GxuLltcNQj1NC8=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AS8PR08MB5990.eurprd08.prod.outlook.com (2603:10a6:20b:296::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3611.20; Fri, 27 Nov
 2020 14:46:42 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::d585:99a4:d7a4:d478]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::d585:99a4:d7a4:d478%4]) with mapi id 15.20.3611.025; Fri, 27 Nov 2020
 14:46:42 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, armbru@redhat.com, jsnow@redhat.com,
 mreitz@redhat.com, kwolf@redhat.com, vsementsov@virtuozzo.com,
 den@openvz.org
Subject: [PATCH v2 33/36] block: inline bdrv_replace_child()
Date: Fri, 27 Nov 2020 17:45:19 +0300
Message-Id: <20201127144522.29991-34-vsementsov@virtuozzo.com>
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
 Transport; Fri, 27 Nov 2020 14:46:01 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: cd3a50ac-029d-4e69-03a9-08d892e32965
X-MS-TrafficTypeDiagnostic: AS8PR08MB5990:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AS8PR08MB5990F9CAA6C5CA9AF5862255C1F80@AS8PR08MB5990.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: bENxrbYnfmqtP+8fSZdQAegx8p8in8V06IOXv8wWCHqO0vKUt1ZNeFGfmH7FGRvvoAc9rItFZzEtRUWOgkqtFyCsChNF6FAhh11QUf0A2eUDHQb6xcjQF6xSSlJiBnRsfpjZcCIrxt1p/po5XCJP5mRDGKu8YTbelMISVoANm0vJ06EiDWVD+1gT+q+zci8V6Az/EyWnwDgFlRGpOlcevxXFk836NDhqQ3lHWy5HZoL0Wrmxv+OG7XyjF62qSgPx0aEh6SBtT0zDOq55sbhDIdsD0/Cpv1E49o7FdCU0C+loKsixQjg7+hdL85v96fjN/mhlgMVyOm5FtuxlnEwPPZ1MvUPtwpfW/m8it3AKmQH7W9U59Ekgekn2yzZ+SiLh
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(136003)(366004)(39840400004)(396003)(346002)(83380400001)(26005)(956004)(6512007)(52116002)(2616005)(66556008)(2906002)(6666004)(8936002)(66476007)(186003)(5660300002)(6506007)(107886003)(316002)(6916009)(1076003)(66946007)(4326008)(86362001)(16526019)(36756003)(478600001)(6486002)(69590400008)(8676002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?YrtJa3eciC1aVDA2LX+jMmgEIG9b8U19IjZ5YrcPscg7L8V6YFLL/kVZlNOF?=
 =?us-ascii?Q?bquL7ugbOBUuVpqki5J0uwq2URcnR81SVXGq58bU6wkQ/lKDtHr19nJhs2NA?=
 =?us-ascii?Q?9oC9zdg2vpmb/XpDYGYQdvTkzsl/hB/zMwAp6JP5FZ0NQco37QEhYun/1BSK?=
 =?us-ascii?Q?r27627l/c1OYt2wAXrst27XdXZ36cEy/+393balN4KDmlDYFYhvfNC5euJ88?=
 =?us-ascii?Q?0SQGuI9qesLIBXn3/JcFeSRmIzND/xzQlSBaq4ZSuMCnlaOQr5u3Ut3e1BX+?=
 =?us-ascii?Q?CNqz9jXd1X0UCASp0gTmm6wWhzDFnnMH3K0vvEMn2ONaVs26oenwacQ8rQEm?=
 =?us-ascii?Q?+IblulyofsZUxA4kuj14SQ43te3fRYicW1OjO8YXLE1ylO/vAd9MFpjdyoKd?=
 =?us-ascii?Q?jGE8TUL/cygyZzuKanoul0o+Brpf6rUrZOqiHykt5AqNrgPHYIz7OGJxtjqU?=
 =?us-ascii?Q?17ado6iOaubyIFqPfkxa845bKsRjzWXPVK6n+urT7rOqXl7KjBjIEMlv8Vfs?=
 =?us-ascii?Q?ZUzBMtsgDuqQK2+3Y0gIqclHqMCU8XBGFE4vngffPRGNMaIZw/5xgv9rmYjX?=
 =?us-ascii?Q?ULKHUwcAlwCoQJg3jlXuWhX9OjotYOP/MgxuqW94ZWmMxe9Pn43fo4q+8Yzo?=
 =?us-ascii?Q?bJaIHBeyWqSY4MHr0zsbs7qD7lgaJ2vpxngDJhwQqmpCp+34ZgirNrchJkyt?=
 =?us-ascii?Q?/OX1hdGk8Q/16DiY6V0rEG+vsHQtSfw194yIWBICC0TnwmTMNjgtDLVxloL0?=
 =?us-ascii?Q?oDSUg1rzflwdIeth2T1zaxHnhXN23y7pDBC6WJolY2Im+9BIk66CGdwEzJ6K?=
 =?us-ascii?Q?Q7iBX0KiGo1REBayveXA/SjyujvD8N75z2/j3PjhpTdpIFvmzk0Uqpr0sZs6?=
 =?us-ascii?Q?VguSMemL+CWNaU4PXi2nVb0oReB3xMxejQv5WrpcmwG4rfh8pbAaF9j/TKbD?=
 =?us-ascii?Q?G/rCJgWbjhWbbWCEqoe5fS/hl84n7lgSaaGgRJrLQ1XyJpUzsdbqTKu3guI6?=
 =?us-ascii?Q?u1Mb?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cd3a50ac-029d-4e69-03a9-08d892e32965
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Nov 2020 14:46:02.4265 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5OXWV8h5nCzr4Np313JqwAC6nF7deZxW6mmUHh1rcNWYUJyAGbg/BdYzh1pTBnBdWXWahgEMzjrtj8qGyAM+8niaCv2YQC/mV4sTd4VEXjs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB5990
Received-SPF: pass client-ip=40.107.20.103;
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

bdrv_replace_child() has only one caller, the second argument is
unused. Inline it now. This triggers deletion of some more unused
interfaces.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 block.c | 101 ++++++++++----------------------------------------------
 1 file changed, 18 insertions(+), 83 deletions(-)

diff --git a/block.c b/block.c
index 6c87ad0287..3093d20db8 100644
--- a/block.c
+++ b/block.c
@@ -2336,42 +2336,6 @@ static int bdrv_list_refresh_perms(GSList *list, BlockReopenQueue *q,
     return 0;
 }
 
-static void bdrv_node_set_perm(BlockDriverState *bs)
-{
-    BlockDriver *drv = bs->drv;
-    BdrvChild *c;
-
-    if (!drv) {
-        return;
-    }
-
-    bdrv_drv_set_perm_commit(bs);
-
-    /* Drivers that never have children can omit .bdrv_child_perm() */
-    if (!drv->bdrv_child_perm) {
-        assert(QLIST_EMPTY(&bs->children));
-        return;
-    }
-
-    /* Update all children */
-    QLIST_FOREACH(c, &bs->children, next) {
-        bdrv_child_set_perm_commit(c);
-    }
-}
-
-static void bdrv_list_set_perm(GSList *list)
-{
-    for ( ; list; list = list->next) {
-        bdrv_node_set_perm((BlockDriverState *)list->data);
-    }
-}
-
-static void bdrv_set_perm(BlockDriverState *bs)
-{
-    g_autoptr(GSList) list = bdrv_topological_dfs(NULL, NULL, bs);
-    return bdrv_list_set_perm(list);
-}
-
 void bdrv_get_cumulative_perm(BlockDriverState *bs, uint64_t *perm,
                               uint64_t *shared_perm)
 {
@@ -2711,52 +2675,6 @@ static void bdrv_replace_child_noperm(BdrvChild *child,
     }
 }
 
-/*
- * Updates @child to change its reference to point to @new_bs, including
- * checking and applying the necessary permission updates both to the old node
- * and to @new_bs.
- *
- * NULL is passed as @new_bs for removing the reference before freeing @child.
- *
- * If @new_bs is not NULL, bdrv_check_perm() must be called beforehand, as this
- * function uses bdrv_set_perm() to update the permissions according to the new
- * reference that @new_bs gets.
- *
- * Callers must ensure that child->frozen is false.
- */
-static void bdrv_replace_child(BdrvChild *child, BlockDriverState *new_bs)
-{
-    BlockDriverState *old_bs = child->bs;
-
-    /* Asserts that child->frozen == false */
-    bdrv_replace_child_noperm(child, new_bs);
-
-    /*
-     * Start with the new node's permissions.  If @new_bs is a (direct
-     * or indirect) child of @old_bs, we must complete the permission
-     * update on @new_bs before we loosen the restrictions on @old_bs.
-     * Otherwise, bdrv_check_perm() on @old_bs would re-initiate
-     * updating the permissions of @new_bs, and thus not purely loosen
-     * restrictions.
-     */
-    if (new_bs) {
-        bdrv_set_perm(new_bs);
-    }
-
-    if (old_bs) {
-        /*
-         * Update permissions for old node. We're just taking a parent away, so
-         * we're loosening restrictions. Errors of permission update are not
-         * fatal in this case, ignore them.
-         */
-        bdrv_refresh_perms(old_bs, NULL);
-
-        /* When the parent requiring a non-default AioContext is removed, the
-         * node moves back to the main AioContext */
-        bdrv_try_set_aio_context(old_bs, qemu_get_aio_context(), NULL);
-    }
-}
-
 /*
  * This function steals the reference to child_bs from the caller.
  * That reference is later dropped by bdrv_root_unref_child().
@@ -2979,8 +2897,25 @@ static int bdrv_attach_child_noperm(BlockDriverState *parent_bs,
 
 static void bdrv_detach_child(BdrvChild *child)
 {
-    bdrv_replace_child(child, NULL);
+    BlockDriverState *old_bs = child->bs;
+
+    bdrv_replace_child_noperm(child, NULL);
     bdrv_remove_empty_child(child);
+
+    if (old_bs) {
+        /*
+         * Update permissions for old node. We're just taking a parent away, so
+         * we're loosening restrictions. Errors of permission update are not
+         * fatal in this case, ignore them.
+         */
+        bdrv_refresh_perms(old_bs, NULL);
+
+        /*
+         * When the parent requiring a non-default AioContext is removed, the
+         * node moves back to the main AioContext
+         */
+        bdrv_try_set_aio_context(old_bs, qemu_get_aio_context(), NULL);
+    }
 }
 
 /* Callers must ensure that child->frozen is false. */
-- 
2.21.3


