Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D740333F3D0
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Mar 2021 16:06:30 +0100 (CET)
Received: from localhost ([::1]:53730 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lMXkj-0002jB-R5
	for lists+qemu-devel@lfdr.de; Wed, 17 Mar 2021 11:06:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34978)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lMXIJ-0005OF-I9; Wed, 17 Mar 2021 10:37:07 -0400
Received: from mail-db8eur05on2106.outbound.protection.outlook.com
 ([40.107.20.106]:39072 helo=EUR05-DB8-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lMXIH-0007Ew-E2; Wed, 17 Mar 2021 10:37:07 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iiB4UHr005/Pp+g912rsMLfg7nDFKoDRIihozSRvSQ3inNjuaB9ucfPOFstUwObGk8XyOqmKDQPniu9xpiJzslIR/urXmX/CPeayWBGBJkXqRBQvnzmvouBWQLfsjMv4cDbTlBAZuIntS/7j1bsdEQGZ/ug/DCRN2Duyj1Z3/09PzpMdehq7BaFGVAR2Kt7vxQcx72WYomMseJ4hAp4YRlm8jWHlIwTJtyzpVqghYDyHBguf2xq58x8raFzXmV5PA+UNayAO1uKu46Hk5pzUFbCujdUbKBXW/yEB4hEJDh3L5BwvJa3eAT7B35JxQui3ypso/bhCKN6DMv7vj6Q4Pw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=29gbyL69Ob/VCkLz3u3RazZ18XR+4biTtbXAOYqK1rI=;
 b=BbIprDJ1RubLTA/Tsi1nZy6U+m3/rZnh69YpKFboEeh/Niu0WJpW3bSyrx7FVMaCmvhHEzBuI+MriL7xjdxCLdbpSwYyGPTc0DT7eOW9EWC8J5HikNuN1tTE5JWdixPLhmRdM6m2bmbrbQ5wzbepktJrf1ejpg1e6T9cpc5x059BQPYMvFBb640SKBTqMHc/Xzcot6vlrUAf1gGWe35kdD8e5eLxS0bSi8fqi00bLScvO2KYkNWuupEVjaStGq2PWhcQ76wTmQaUPBaBthRE3ClqLwkuG9FGdKdHqf96/t7KBU0QdT54ptjUjVYyOTRGRa74+5QY9HEZOZ6hLJlR0Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=29gbyL69Ob/VCkLz3u3RazZ18XR+4biTtbXAOYqK1rI=;
 b=ODy1zxXzOLmz+ScPoBupEr+4pzF9bSnkWadFlECA0ujukglGjoO7IxY67yDg/zlRl/nlYdmrlOkI+I9k94jQoVNK0NGzMiHnwWa+g7hOy6BXXSX9o4QVWVqyl+G6jOCHfPqgVuYJAAABU34Pwg92ooGMpM7up8fwfN7Ue+AO3n0=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AS8PR08MB6216.eurprd08.prod.outlook.com (2603:10a6:20b:29c::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3933.32; Wed, 17 Mar
 2021 14:36:47 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f1f0:6610:11f5:5e4a]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f1f0:6610:11f5:5e4a%8]) with mapi id 15.20.3933.032; Wed, 17 Mar 2021
 14:36:47 +0000
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, armbru@redhat.com, fam@euphon.net,
 stefanha@redhat.com, vsementsov@virtuozzo.com, jsnow@redhat.com,
 mreitz@redhat.com, kwolf@redhat.com
Subject: [PATCH v3 31/36] block: drop unused permission update functions
Date: Wed, 17 Mar 2021 17:35:24 +0300
Message-Id: <20210317143529.615584-32-vsementsov@virtuozzo.com>
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
 15.20.3955.18 via Frontend Transport; Wed, 17 Mar 2021 14:36:46 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6b83233f-ec61-46e6-d7df-08d8e9521839
X-MS-TrafficTypeDiagnostic: AS8PR08MB6216:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AS8PR08MB6216B71BA75F3FE67932AAB5C16A9@AS8PR08MB6216.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2803;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Ypr2y7iQegunzY/fZKLOudwUdjH3faPTnQFGbhMBQnR929JxmGvhU9/Eqd7G5QKJDOZqNaZWFcmoTUUpcovM4fh9Zx9uD1nvaE6Fc+XtCZ0TYN2Q0SCw4rGlR3UGxwWT/D1sFbU+lyHfjlb5hZvvu7WZuVang1Jg1nz79wzk7fASjJUqP8v6QiSxD6Tcy2QvDMrZSC0u0aiNd5BDrQtJh4zIY/YhW8nNTeUTOmxHdPsQoryqBnGL4P6iBloOFKkdwlTsETusZtlg9yC9VCROoVd6c6i1hE/uvP4g7BNiEqjBFvBdDk6t0xbwaWGtaNmXudeTJd7ywAgdUW6fcWVM4Iu8veN/BeiMs9LHkRuqHZ54P/0m8IKWE+W0ZgETHONFJMlyZJ2NVIF5y2L90Q6H/CcJqjI71mDFgvVHWTj3aoOjRghmAudpbzjFIA/3mj6FtuT1oThpnFqYNdkaKyjOYbYrbu4irCb6nVLV/TUE688i21UKNe+jWMtqwVJdC1URq4trsXI19/6LaKRcQZbthvlY+9eWlhOOhkTTfU7ZxgVdpb3UZnzroBwAdFG6Xq01lSJqpJuWpelJNrvJw6/1ck1gALm8f15b1yXwC8hyI04=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(366004)(346002)(376002)(39840400004)(136003)(6916009)(83380400001)(316002)(2616005)(66946007)(6512007)(66556008)(8676002)(956004)(26005)(1076003)(16526019)(6486002)(186003)(4326008)(36756003)(8936002)(15650500001)(2906002)(6666004)(5660300002)(478600001)(86362001)(66476007)(6506007)(52116002)(69590400012);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?0ROB7AaO/l70al8xE4RnKCE+huKAOdQO5TQLJoAaGpspZZHPtvctrvoU8RJr?=
 =?us-ascii?Q?Fv/DZaGiQVj0vN9ZDSueiZvAjB7Pyu7YyKBjiBIohE567uiH2yOLdzjcc6tg?=
 =?us-ascii?Q?CwSoFbyTxU7pDR9LNL8ruV/H2trtYiuv/wK/cxIBpvx2EyLomcLcowTxIxEL?=
 =?us-ascii?Q?HArj//PnrR1k/OeJpMQMzXwlZWTvOcC8CQUt+hLSiLBafYVzgkWHOwa/aF0m?=
 =?us-ascii?Q?abl9DM3VgCVw9ScOX1kQWvFikAreia4MMu/eNXOtrz3WzdV6Q9Yz9CeYYtMu?=
 =?us-ascii?Q?81s+3pbzQ7JgPI5naPqqEwqQr1MHu5EPUeK6Jss74tEYsAulm9zw4h0bOQ2e?=
 =?us-ascii?Q?Dpwek19Z9BOCpOLDUT50Isc9VYgxyATZq9b9abROqZVzJyzjN3byDjZ0+k2l?=
 =?us-ascii?Q?HGm/EnAkgVrdaypsbih6N3UQGxx/ZdyqvqoG5a7hnXKyWhtcdMZ9K1Mgo+f/?=
 =?us-ascii?Q?a5/Wo+y2aKWrKQrs8dmVOc3QjK9fMo8VGn0smbWN4ifFIQQvdVVWW1AaWk3a?=
 =?us-ascii?Q?Ce2VBxO8v5CyM/irVm1wOlRGL4D7chId6EV2om9bYqSQRTBIKxx5yX1yEQfM?=
 =?us-ascii?Q?Lhxoz/90okytPOMm1C8fRd1K2V9PeyhPTOZnuWysDvBWkUtc+B2ZZb2MWoY+?=
 =?us-ascii?Q?J+DxwqKMhcUZGPArnJK5B7wOMyDZ4X3r+zr/xC0O8zxcoN02LA2YT+8zVbKA?=
 =?us-ascii?Q?ZeIeztldbh/7A4/AyDGPomMRP9JZOdIOcJ1CSHHWoBf2baYhgo4pHPp+49z1?=
 =?us-ascii?Q?4qFn4SW0S/2W8L5Hd3WBCyjQTimkXucJreymsHFeMaZL/Qs7yX19dqhUJayV?=
 =?us-ascii?Q?4wi60umYF4g82MqOHJZG7IgGhL+Ux0jjPyed4YsRPnJboPSdoapCNoeyeUXK?=
 =?us-ascii?Q?/t0yYZQglWkjGhd5hCNI4TIYBPaUL77QilsAPCyAMLVDC64mmCRdqOXMDksh?=
 =?us-ascii?Q?wVwXy97mJrNsfVq6vAhBLn6zyNv1SmonpWaVo+fmdK9oas2nKPSJqIXQdyP7?=
 =?us-ascii?Q?V7KO/OJCO5VMhHfOZ0DKxBLUpOS6LMEfeztr/Ki+CYdcd+O15V+Imn6bA5IG?=
 =?us-ascii?Q?AE100fOTFGjpP1Qqpr7+oMHLkiD8WDqlXqGejkX7e0/5fDnZaZlewuD1aCoQ?=
 =?us-ascii?Q?mQtHA8ETU/mXXabNPHPIk6tImN3WEqBPP+iaF9Jw1avUQb4E96H/+RbWcJhR?=
 =?us-ascii?Q?yLgX31lcwYXBRWnyH9hHg/YouZqmfoigbZokGVHgf5M2nN1e0xtTYC3A6dSw?=
 =?us-ascii?Q?HCNef5ilq8UW1n613ZQ/PF3JgPcalsM0qCVBzPb1xrrE7AxHXppqeuiR4Q1X?=
 =?us-ascii?Q?jvtMuYoQv+MnEfSraVqiUobp?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6b83233f-ec61-46e6-d7df-08d8e9521839
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Mar 2021 14:36:47.7472 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /8ZSJT7RHu0FTO74kRwQvJNMIOlsZb43YYDIAtQJjhmtJ0wV//YaFOzzlcNrkzpbyY6vQprZm8V4noMvgAVlBjFG5CU0S5LRDKgwPA6Dal8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6216
Received-SPF: pass client-ip=40.107.20.106;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR05-DB8-obe.outbound.protection.outlook.com
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
Reply-to:  Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
From:  Vladimir Sementsov-Ogievskiy via <qemu-devel@nongnu.org>

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 block.c | 103 --------------------------------------------------------
 1 file changed, 103 deletions(-)

diff --git a/block.c b/block.c
index 53a8af301a..b39e6455b2 100644
--- a/block.c
+++ b/block.c
@@ -1953,11 +1953,6 @@ static int bdrv_fill_options(QDict **options, const char *filename,
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
@@ -2392,56 +2387,12 @@ static int bdrv_check_perm_common(GSList *list, BlockReopenQueue *q,
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
                                    Transaction *tran, Error **errp)
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
@@ -2523,60 +2474,6 @@ char *bdrv_perm_names(uint64_t perm)
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
2.29.2


