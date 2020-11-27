Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3561D2C689E
	for <lists+qemu-devel@lfdr.de>; Fri, 27 Nov 2020 16:20:19 +0100 (CET)
Received: from localhost ([::1]:48334 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kifXm-0007KU-6X
	for lists+qemu-devel@lfdr.de; Fri, 27 Nov 2020 10:20:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37038)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1kif1S-0001he-CN; Fri, 27 Nov 2020 09:46:54 -0500
Received: from mail-db8eur05on2103.outbound.protection.outlook.com
 ([40.107.20.103]:20897 helo=EUR05-DB8-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1kif1K-0003RM-7A; Fri, 27 Nov 2020 09:46:54 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=B1HhFFpwhlMRok8VdzJreT0xawZwBDpqa3AclVncD1cZN9C1fq2EiGLGfp/44QFhYKuIFuixmqMjkcbqy3O4NptXRbszGMjwkegVR80MhbFlTYprYXZQ5Fu6p6AfefrLk1ZAsdvI5a/s1G8+lLZV7oaV3ql1dhBGLdmv5AbDfsuUID27tdxLNqaDF3ty9ZVdv1VhxuVKFbOgLaI087FliE2TuD5/yJV3zJm/poE8c/QvSYJzMqCf0P2IUYznS3s71r7Nj/baxxJkSg+NsAv1HfPXCQGgBCtbQooZVwvHG/R6xF3H80+tDn8UK4+XZe7xI5g1HXTLCoKQONEZ6etiWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=05KA+XBCAPFxK7wF9bpUh64Oi8Gomrc3kIexIpQqP1c=;
 b=ETDKZOSSJkHahu9b9rNZxzaze8t6DpJg11b2vBCbIiozxIlBzp2znTofxy8T53WFdVnW8ow3QXZoRJ4T+478UG3X/NZNMdHIaE92+/YFqtYsi321zlnIaSvdejKNcKTbcrU8SijlKkSQ5Z6j2hOykPI/4wEEEqQHQX2olO8TEmjLSFzVhBE+NmvfAjA9YMH1j+jwXcZoTyMEqIZHRMhjWihzfqQx5tO1NsqYT+QfCQ6MlVpLTHv4sBsFwgCJPfYEqNqjjTs7HpdwD0tVJKpKFBQqS4vSyE6NcTr51CGzqy8rQmd1vCV7nDmIuNZ2Drd+DPTo7xCCAtq/2B8+XEaZyg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=05KA+XBCAPFxK7wF9bpUh64Oi8Gomrc3kIexIpQqP1c=;
 b=uMBlv2ALCn1jbJD3rzm5mIu0fc1AIh9cdH+tnXLkM6nL2HXZ42FnIXVQjzIF1XcKN1Xn3YLhYmFm1dDwKhxElWTMnlQND1VOUqEB/RSnCaX10cCNzEmZ6b6kIL91ryKcPD49Oon89isv63uLtnvZDKrQ8jnakWc1Lyh28Mkdq+E=
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
Subject: [PATCH v2 31/36] block: drop unused permission update functions
Date: Fri, 27 Nov 2020 17:45:17 +0300
Message-Id: <20201127144522.29991-32-vsementsov@virtuozzo.com>
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
 Transport; Fri, 27 Nov 2020 14:46:00 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ad0ba914-0263-43ca-afdd-08d892e32879
X-MS-TrafficTypeDiagnostic: AS8PR08MB5990:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AS8PR08MB5990BDA0B114D14B0B122227C1F80@AS8PR08MB5990.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2803;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: s96vAOwagChCEiWm41hDa9zqjUxm/CqvRzauTsi7XZx2G3zAjsN4KZVBvbmdn2CQbPddwPcrZOC3bf67wvrhD6+BAQ+0j06HLkSGhfbiYpuDbGFKrp6js1251rtppK6Fz2d72UDnyrSlM6IRc6DzfzXi4lJLcSDdyq9vZ5kOQI6uSvFf57z5jvwPKzAqn0PLAb5tSQ5+hFuCMl0HnnYwReiB7a66kD4u+Rt1wyjKdc/Jye+NZJqktKyy3TSFxDIk3rzo2yyoedie2mvyTIle7sq4N9bu0PkV/wCFNDGkDBtEotEbCLpf01xHyNANYPqmdC8F++9ms10gp75b70X+qzW+Z/HdWni7PCOojd47Hwmr/pWd05j+sDv830YYtLB0
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(136003)(366004)(39840400004)(396003)(346002)(83380400001)(26005)(956004)(6512007)(52116002)(2616005)(66556008)(2906002)(6666004)(8936002)(66476007)(186003)(5660300002)(6506007)(107886003)(316002)(6916009)(1076003)(15650500001)(66946007)(4326008)(86362001)(16526019)(36756003)(478600001)(6486002)(69590400008)(8676002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?95q/NUkaELdhW28NXGgoALpHomyvH85PDVbqRU9tAU/VyOQyLspb1p1hQriA?=
 =?us-ascii?Q?N2zEViwPHwIwLwWv/r0sYvYeBZD0kWMkSBKV5/iNH3ShAdqWqGvV/6oD+BsQ?=
 =?us-ascii?Q?H2hu33eSDFODnyC6/wWDruQTAvXoWLBwVTm/rAxjWo7Uvu1TKYtujtgYKu0X?=
 =?us-ascii?Q?sJHANaMZkZzLidz1V7AexOSuKhl7PoP9pDhHfrNpWlvIZk0EWsuoHATf5quA?=
 =?us-ascii?Q?8ZqE0MGk/6KFwlQRlpTXAHvqfOVB7b9imaNHDjvqM4ijP+vVkFEe0z3Twtyy?=
 =?us-ascii?Q?0TslPnMLRMP+xta1k2uHS9m74TvcFh6wFNr2UgSqifjM/BKVwtG1Lfxzb1gS?=
 =?us-ascii?Q?zpRy/00lkBoRyhKesEf2GKYBdcuSoYgw2zoEJyJYKySeE0vcQ08kCY7NaN03?=
 =?us-ascii?Q?Co285LE7fGXA2bY1dJNvN2pvlHoMgjF6YSptd9wlAkSPU5lWrfcqY72bSOnm?=
 =?us-ascii?Q?lA8Cme8SAsF/4Pr6y8JCch5vbY8W0wnl6dxuwe3i2Cze0ZKox4GfFcwNh4AB?=
 =?us-ascii?Q?LplmQxbUbK9Ne6E2wbNB8U4fz5P9sHNfB1+jTYtw6I9x0tOOs5qOt9QS97K+?=
 =?us-ascii?Q?r9VzXwfxoivdZniR9BkHv7lrYZLNrU2lti26e07wXv2wgoIDdmYkrQMOye7k?=
 =?us-ascii?Q?49sJNp31RuaGUVZDkFotU2EWOO8amis+2hJ/cc4TaneRFYhMKhVNDfBNEynC?=
 =?us-ascii?Q?B18OGx7yfUncoYjXtt+hSM3Oao7WM67J1de4oLhMAdR2GsfeiKPC0YHbrRzm?=
 =?us-ascii?Q?I4NBA34IP3fcsgL6XSY73+F9QiC3Y5g9Pkrln9z0KarFwpNgF9cxHn05o/Fc?=
 =?us-ascii?Q?f4su0OgpdMOE6PVopJVA7e8sJ2J+ggFtOeAa/Cbkn9B3Tj9+3IiaquW5n8n4?=
 =?us-ascii?Q?VMgVN9lYkRfhbeYZBO1/XP9TUzrUz0rqNkvCU0PrNAAn1toKaZ3X7aVgKlBF?=
 =?us-ascii?Q?S8VwW2TMXcq3+b0zbFww86AQRJ2Wxkt+To75YvUFW6ie9Ep2tytzotMOdCAg?=
 =?us-ascii?Q?qJh7?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ad0ba914-0263-43ca-afdd-08d892e32879
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Nov 2020 14:46:00.8783 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jO/jSFVVAJ2hoHv5Fs1ZF1EzVHYhSd80m6vdJ0sh0tugD+BYYzNKC7ovXmfWkkH3XgI1UwIzBM9s61FOuKAvmkkEf6oQM0ir1Lk9vtORkns=
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

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 block.c | 103 --------------------------------------------------------
 1 file changed, 103 deletions(-)

diff --git a/block.c b/block.c
index 474e624152..3ea04bbd8f 100644
--- a/block.c
+++ b/block.c
@@ -1933,11 +1933,6 @@ static int bdrv_fill_options(QDict **options, const char *filename,
     return 0;
 }
 
-static int bdrv_check_update_perm(BlockDriverState *bs, BlockReopenQueue *q,
-                                  uint64_t new_used_perm,
-                                  uint64_t new_shared_perm,
-                                  Error **errp);
-
 typedef struct BlockReopenQueueEntry {
      bool prepared;
      bool perms_checked;
@@ -2361,56 +2356,12 @@ static int bdrv_check_perm_common(GSList *list, BlockReopenQueue *q,
     return 0;
 }
 
-static int bdrv_check_perm(BlockDriverState *bs, BlockReopenQueue *q,
-                           uint64_t cumulative_perms,
-                           uint64_t cumulative_shared_perms, Error **errp)
-{
-    g_autoptr(GSList) list = bdrv_topological_dfs(NULL, NULL, bs);
-    return bdrv_check_perm_common(list, q, true, cumulative_perms,
-                                  cumulative_shared_perms, NULL, errp);
-}
-
 static int bdrv_list_refresh_perms(GSList *list, BlockReopenQueue *q,
                                    GSList **tran, Error **errp)
 {
     return bdrv_check_perm_common(list, q, false, 0, 0, tran, errp);
 }
 
-/*
- * Notifies drivers that after a previous bdrv_check_perm() call, the
- * permission update is not performed and any preparations made for it (e.g.
- * taken file locks) need to be undone.
- */
-static void bdrv_node_abort_perm_update(BlockDriverState *bs)
-{
-    BlockDriver *drv = bs->drv;
-    BdrvChild *c;
-
-    if (!drv) {
-        return;
-    }
-
-    bdrv_drv_set_perm_abort(bs);
-
-    QLIST_FOREACH(c, &bs->children, next) {
-        bdrv_child_set_perm_abort(c);
-    }
-}
-
-static void bdrv_list_abort_perm_update(GSList *list)
-{
-    for ( ; list; list = list->next) {
-        bdrv_node_abort_perm_update((BlockDriverState *)list->data);
-    }
-}
-
-__attribute__((unused))
-static void bdrv_abort_perm_update(BlockDriverState *bs)
-{
-    g_autoptr(GSList) list = bdrv_topological_dfs(NULL, NULL, bs);
-    return bdrv_list_abort_perm_update(list);
-}
-
 static void bdrv_node_set_perm(BlockDriverState *bs)
 {
     BlockDriver *drv = bs->drv;
@@ -2492,60 +2443,6 @@ char *bdrv_perm_names(uint64_t perm)
     return g_string_free(result, FALSE);
 }
 
-/*
- * Checks whether a new reference to @bs can be added if the new user requires
- * @new_used_perm/@new_shared_perm as its permissions. If @ignore_children is
- * set, the BdrvChild objects in this list are ignored in the calculations;
- * this allows checking permission updates for an existing reference.
- *
- * Needs to be followed by a call to either bdrv_set_perm() or
- * bdrv_abort_perm_update(). */
-__attribute__((unused))
-static int bdrv_check_update_perm(BlockDriverState *bs, BlockReopenQueue *q,
-                                  uint64_t new_used_perm,
-                                  uint64_t new_shared_perm,
-                                  Error **errp)
-{
-    BdrvChild *c;
-    uint64_t cumulative_perms = new_used_perm;
-    uint64_t cumulative_shared_perms = new_shared_perm;
-
-
-    /* There is no reason why anyone couldn't tolerate write_unchanged */
-    assert(new_shared_perm & BLK_PERM_WRITE_UNCHANGED);
-
-    QLIST_FOREACH(c, &bs->parents, next_parent) {
-        if ((new_used_perm & c->shared_perm) != new_used_perm) {
-            char *user = bdrv_child_user_desc(c);
-            char *perm_names = bdrv_perm_names(new_used_perm & ~c->shared_perm);
-
-            error_setg(errp, "Conflicts with use by %s as '%s', which does not "
-                             "allow '%s' on %s",
-                       user, c->name, perm_names, bdrv_get_node_name(c->bs));
-            g_free(user);
-            g_free(perm_names);
-            return -EPERM;
-        }
-
-        if ((c->perm & new_shared_perm) != c->perm) {
-            char *user = bdrv_child_user_desc(c);
-            char *perm_names = bdrv_perm_names(c->perm & ~new_shared_perm);
-
-            error_setg(errp, "Conflicts with use by %s as '%s', which uses "
-                             "'%s' on %s",
-                       user, c->name, perm_names, bdrv_get_node_name(c->bs));
-            g_free(user);
-            g_free(perm_names);
-            return -EPERM;
-        }
-
-        cumulative_perms |= c->perm;
-        cumulative_shared_perms &= c->shared_perm;
-    }
-
-    return bdrv_check_perm(bs, q, cumulative_perms, cumulative_shared_perms,
-                           errp);
-}
 
 static int bdrv_refresh_perms(BlockDriverState *bs, Error **errp)
 {
-- 
2.21.3


