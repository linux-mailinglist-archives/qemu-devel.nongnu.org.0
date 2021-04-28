Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F357636DC4A
	for <lists+qemu-devel@lfdr.de>; Wed, 28 Apr 2021 17:47:31 +0200 (CEST)
Received: from localhost ([::1]:45060 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lbmPT-0004Px-1A
	for lists+qemu-devel@lfdr.de; Wed, 28 Apr 2021 11:47:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58964)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lblyY-0006D8-Mc; Wed, 28 Apr 2021 11:19:42 -0400
Received: from mail-eopbgr80094.outbound.protection.outlook.com
 ([40.107.8.94]:21824 helo=EUR04-VI1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lblyS-00028Z-Pp; Wed, 28 Apr 2021 11:19:42 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fznuHGP/e3xTpOIpH/EfpWIA2H7l1YrLtDBjM6MPldwL+8sNz8XqAy9HEBro4Dk2S4Y+YfCKWbmkbgoXD2qsJ1Tocv5NZUln2yyuC+JPQPvOXf1W2auRBah653IAKlfV0HaR5V50HCWhCemmV0JawFjUgQ2EdqhpX6A4bfRpu0vSWiKKy43YMhfZg/hZE7nzHHWuZrYB232bT9HFLcOiRNtc9yiRV3DkW0fA0BACSOEGqrfM7SftJ7RAjUJ091ROsQUd8Ix9RgYufbzjUHFp4CuPO7d23p5gOBaQZL4/Wr6kxdygy7Gmik2yktsonph9MKo7O4WgpoSwRtWsdze+LA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bOy7hstDoraDGPAMEMM6ilqTU03Yqqj120FlojpYjPQ=;
 b=FjHI7NLtpRP/1nsdou4+rR3F/I8HrKNpLOEaclHPcZBDROFd3umvEH2DRkRrwNYYqJmgboULyijK2eWqgIi1DgY6FysuXhvKBGMBXwAPhyowDFe8sV2v0Ko4rG5mNOZfbg/pP/XEHvZ3APdA7DzTAuwvmNPLWnkAPnaQy+99Q7rOLtttOMff7kReT2P+8qGyG3NqWmQnu9ot2h2ZBD5mpH+rCrrTgh7ciXEwfSGeG4DonXeUgOb01OlV6Qj6pEEeKhOIY5PFpkOGSsLCNM/Y+5j6gtpzas+vfzJw6q4KcQxJMnbD/udOnyCB9q5V4F24kXRjuTH4/uVc0+UZa9yA0A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bOy7hstDoraDGPAMEMM6ilqTU03Yqqj120FlojpYjPQ=;
 b=t0hVnPV+7ZHjAhfvNKFXE7GUkEs6IJFDfqYhk3jc42JloJGPHLOCj9YZZfMkBwAZ8mTn9rVgrPTjvSuneRbrcegPRMKoCLpiYH0duUqyvm9WQ5VPSThzytPyOKD1zeMHejzAjf8uvb4APTn6rOa4igaSvHr2guBUBDMUyr/IOWk=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM5PR0802MB2419.eurprd08.prod.outlook.com (2603:10a6:203:a1::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4065.26; Wed, 28 Apr
 2021 15:19:27 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133%7]) with mapi id 15.20.4065.027; Wed, 28 Apr 2021
 15:19:26 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, armbru@redhat.com, fam@euphon.net,
 stefanha@redhat.com, vsementsov@virtuozzo.com, jsnow@redhat.com,
 mreitz@redhat.com, kwolf@redhat.com
Subject: [PATCH v4 30/36] block: bdrv_reopen_multiple: refresh permissions on
 updated graph
Date: Wed, 28 Apr 2021 18:17:58 +0300
Message-Id: <20210428151804.439460-31-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210428151804.439460-1-vsementsov@virtuozzo.com>
References: <20210428151804.439460-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [185.215.60.251]
X-ClientProxiedBy: HE1PR09CA0045.eurprd09.prod.outlook.com
 (2603:10a6:7:3c::13) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (185.215.60.251) by
 HE1PR09CA0045.eurprd09.prod.outlook.com (2603:10a6:7:3c::13) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4087.27 via Frontend Transport; Wed, 28 Apr 2021 15:18:55 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: bbe52faf-2a47-42c4-51f9-08d90a58f109
X-MS-TrafficTypeDiagnostic: AM5PR0802MB2419:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM5PR0802MB2419D30F3D34A234C3D13467C1409@AM5PR0802MB2419.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:114;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: dvwZiU3vS4wCBla61RrzayKmg1rnjL4PtaY2BW9jylETou4TNRGhMtOPrnVUSCQ5ieQ8wnOlGXra3HFoJ7p+mKG8f3MxR0U0C4f2f1bTkl2stLFBd9LlXGJ/NLB3Ww5zivvq/tJHZ8WcQBKIZ+AgO6z6vfnXkChkmikxdaDzNh9B2ppA9RJlhrG0Rb4rRGmgsAETEH0uDEfd42shz7oX9kXnsCC3BUaSyPfDTuMZTjyM2DrI3cEhVVcGUh/IgMzy1ciiLsVg8Q8lyvc6B0Uf//Dd8aLNAYxi8xBXLsCenUowrIE1C1iiXf2lF6y3pP5Mv5RnslTeboGZUzwq3VzwADZPE+t/+qqz4xqGSIHJyNx75EAtMpRlUBaTMHJtWuiqiIBpUr+CJgYBCoUQe5jci1G6wN6r+ZCfsmtUDkk9HNx1fEpP8ch+ltIwjgGcwk8iP/rkdescPcyGaTK/gTZL+svT6xRNoxp8A6Oe+uVfDQ1SFWttQb8ER/tMl6HzNpXOMv54hq9JLJnfmMwnCA+gwj7bZ9KmZ/bwfxdFwBrjyz3lHtSJw8rRrQnXRIV0EstjTYrgWBDqBCUkQ6fXcFFg/eFSDXrTPZxm+uRQqlHleGtjwMP3+akbbUl5/k7otuDUps0PIWBlo1qXllsoVNJxjvJ6Ddcw29I5G447083xHqtogTzMfkSi1SeB6JjwEJpU
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(39840400004)(136003)(376002)(346002)(366004)(15650500001)(66476007)(83380400001)(8936002)(186003)(66946007)(16526019)(8676002)(30864003)(956004)(36756003)(38100700002)(66556008)(4326008)(2616005)(6512007)(478600001)(52116002)(26005)(86362001)(6486002)(6916009)(1076003)(2906002)(6506007)(5660300002)(316002)(38350700002)(69590400013);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?CCSgfrbF+BaJyHiZek+hsx46lhYV/EITQl7LRjvjQ4gXaJLJkLZo0VtmK0z/?=
 =?us-ascii?Q?WsVbRJYrEaucnCmIPTAGDYDOW7YYsshgHvdCrbka+6eT0U6lF6H/CBFd9xn7?=
 =?us-ascii?Q?2fV1pyarfE9qnj/WbBq7K03ffDjhC7Ws46xzLV45lrwHA4Ory6EyUnPncoJF?=
 =?us-ascii?Q?eOf/KvbRKQnUPe8zPL2DG/DuLDDTur59SX26iXVAKNQnZ3hTRWcVDZlPh90u?=
 =?us-ascii?Q?f4hkROpbJubKZ3iGE/gz8duiIPlkU0CkH5GPGSzPgVzjnG05kPW0HxcU6WXx?=
 =?us-ascii?Q?DSQPB4PxA2M9H1In5cA/qnHrYtr6n08/V3i2ezdmj8g75w7tF22aLvd4ja4A?=
 =?us-ascii?Q?4qvNm+sGk37cHeZK4qTRTp+crr6KHqsMDi30czCPp7NcVEUWpb0e0jHWMAfi?=
 =?us-ascii?Q?ghIVYBuUewNZrYP6gM8DxSCzG2kHngUDgIidbnNLHEvYRMKaluVepXTBxWKN?=
 =?us-ascii?Q?7uV140nsumE2WSmm7DWMF6n/Wi1PRVEuueBz/TbUOcdhIuRjr10mZBhtnyhz?=
 =?us-ascii?Q?g3KbPR1tO2335Jq8rZsALRV8MdDJJF2Ln/BDs6Ah1OOZ9EYXHPC85GCs0oTY?=
 =?us-ascii?Q?g3zk8hgnBh/m4i99nmW1uKepEu5n9BOHWagYS0LEHzUMpQ+nQcSREIPwwm81?=
 =?us-ascii?Q?maehLmCY1q9ZHM374hv4r7i1yxZeat1AjXaq4Hhy7xJ8FozR3yVdy5/tt1KL?=
 =?us-ascii?Q?OMXL9fV6zvTW9+Q0nt69FkOZe7XpJDRTkI9uUpyyAAzzE2mr45yl2bBGQJv2?=
 =?us-ascii?Q?pC82a1Bi12xFOOHH8NTlWVJKHfjG5OjC8nP72KjlI4H5y4ovSTH85OSCOZtE?=
 =?us-ascii?Q?e/B2u7eTlkYR4MrQgat1K1E3P1P5Q3wHVSzCnv4dbBGENRR+bCUU2Rq6vi7G?=
 =?us-ascii?Q?xG7Fbw4pVTPJ+nVv3y0PSHp0DIfd9CkOOmSXY+IhJAGKW6TYpe86DQiUPhRN?=
 =?us-ascii?Q?0Hc6L06uRQhtXi+oX6c91DnJAnTiiMWDEL/X83fdMWRvvG4Cm1WU8iPBs9yo?=
 =?us-ascii?Q?AZ6051F9Wfh+D67n36wLJrDnOF4N6DgHSCfNtOBim6Lecea6+LmHCeXmvNWH?=
 =?us-ascii?Q?hglGy46IL7uG/Ohi9/+Cc8VAT7nAlyWFl8WhyvH3/Mj2n4zkKj/5GlJAgaTw?=
 =?us-ascii?Q?mgkYUenx0kry8APAk+kWBqbC6DmkYMrs3hM05pvd3IasjXE6CgM4YOC/JxuH?=
 =?us-ascii?Q?GtmvauABPsOyh1fAlDw4BFXteVittbb7hLEYseH2kVc0h6WfmfO0BALDKQQh?=
 =?us-ascii?Q?VMaF5sPQsmaydwQVgrKuxqByOYugbWJlEX5698r4osEHx/whQbbn7PKYSXxX?=
 =?us-ascii?Q?/fH6/5KMUgjCBsFmGsG5iU6N?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bbe52faf-2a47-42c4-51f9-08d90a58f109
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Apr 2021 15:18:56.8364 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6DakpwsBxJXiURbcqVe3dnq0dLdcY75/IB9T1zKx/bpVt/Hl17LKocHEPsMsaoR1d1lyiRgPXLGZhRLZGTUfEC6o57iTMH73jGQgAukhwJ8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR0802MB2419
Received-SPF: pass client-ip=40.107.8.94;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR04-VI1-obe.outbound.protection.outlook.com
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

Move bdrv_reopen_multiple to new paradigm of permission update:
first update graph relations, then do refresh the permissions.

We have to modify reopen process in file-posix driver: with new scheme
we don't have prepared permissions in raw_reopen_prepare(), so we
should reconfigure fd in raw_check_perm(). Still this seems more native
and simple anyway.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Reviewed-by: Kevin Wolf <kwolf@redhat.com>
---
 include/block/block.h |   3 +-
 block.c               | 187 ++++++++++++------------------------------
 block/file-posix.c    |  91 +++++++-------------
 3 files changed, 84 insertions(+), 197 deletions(-)

diff --git a/include/block/block.h b/include/block/block.h
index ad38259c91..8d5b3ecebd 100644
--- a/include/block/block.h
+++ b/include/block/block.h
@@ -208,8 +208,7 @@ typedef struct BDRVReopenState {
     BlockdevDetectZeroesOptions detect_zeroes;
     bool backing_missing;
     bool replace_backing_bs;  /* new_backing_bs is ignored if this is false */
-    BlockDriverState *new_backing_bs; /* If NULL then detach the current bs */
-    uint64_t perm, shared_perm;
+    BlockDriverState *old_backing_bs; /* keep pointer for permissions update */
     QDict *options;
     QDict *explicit_options;
     void *opaque;
diff --git a/block.c b/block.c
index 357ec1be2c..ffaa367a1b 100644
--- a/block.c
+++ b/block.c
@@ -95,8 +95,9 @@ static int bdrv_attach_child_noperm(BlockDriverState *parent_bs,
 static void bdrv_remove_filter_or_cow_child(BlockDriverState *bs,
                                             Transaction *tran);
 
-static int bdrv_reopen_prepare(BDRVReopenState *reopen_state, BlockReopenQueue
-                               *queue, Error **errp);
+static int bdrv_reopen_prepare(BDRVReopenState *reopen_state,
+                               BlockReopenQueue *queue,
+                               Transaction *set_backings_tran, Error **errp);
 static void bdrv_reopen_commit(BDRVReopenState *reopen_state);
 static void bdrv_reopen_abort(BDRVReopenState *reopen_state);
 
@@ -2468,6 +2469,7 @@ static void bdrv_list_abort_perm_update(GSList *list)
     }
 }
 
+__attribute__((unused))
 static void bdrv_abort_perm_update(BlockDriverState *bs)
 {
     g_autoptr(GSList) list = bdrv_topological_dfs(NULL, NULL, bs);
@@ -2563,6 +2565,7 @@ char *bdrv_perm_names(uint64_t perm)
  *
  * Needs to be followed by a call to either bdrv_set_perm() or
  * bdrv_abort_perm_update(). */
+__attribute__((unused))
 static int bdrv_check_update_perm(BlockDriverState *bs, BlockReopenQueue *q,
                                   uint64_t new_used_perm,
                                   uint64_t new_shared_perm,
@@ -4183,10 +4186,6 @@ static BlockReopenQueue *bdrv_reopen_queue_child(BlockReopenQueue *bs_queue,
     bs_entry->state.explicit_options = explicit_options;
     bs_entry->state.flags = flags;
 
-    /* This needs to be overwritten in bdrv_reopen_prepare() */
-    bs_entry->state.perm = UINT64_MAX;
-    bs_entry->state.shared_perm = 0;
-
     /*
      * If keep_old_opts is false then it means that unspecified
      * options must be reset to their original value. We don't allow
@@ -4271,6 +4270,9 @@ int bdrv_reopen_multiple(BlockReopenQueue *bs_queue, Error **errp)
 {
     int ret = -1;
     BlockReopenQueueEntry *bs_entry, *next;
+    Transaction *tran = tran_new();
+    g_autoptr(GHashTable) found = NULL;
+    g_autoptr(GSList) refresh_list = NULL;
 
     assert(bs_queue != NULL);
 
@@ -4284,33 +4286,33 @@ int bdrv_reopen_multiple(BlockReopenQueue *bs_queue, Error **errp)
 
     QTAILQ_FOREACH(bs_entry, bs_queue, entry) {
         assert(bs_entry->state.bs->quiesce_counter > 0);
-        if (bdrv_reopen_prepare(&bs_entry->state, bs_queue, errp)) {
-            goto cleanup;
+        ret = bdrv_reopen_prepare(&bs_entry->state, bs_queue, tran, errp);
+        if (ret < 0) {
+            goto abort;
         }
         bs_entry->prepared = true;
     }
 
+    found = g_hash_table_new(NULL, NULL);
     QTAILQ_FOREACH(bs_entry, bs_queue, entry) {
         BDRVReopenState *state = &bs_entry->state;
-        ret = bdrv_check_perm(state->bs, bs_queue, state->perm,
-                              state->shared_perm, errp);
-        if (ret < 0) {
-            goto cleanup_perm;
-        }
-        /* Check if new_backing_bs would accept the new permissions */
-        if (state->replace_backing_bs && state->new_backing_bs) {
-            uint64_t nperm, nshared;
-            bdrv_child_perm(state->bs, state->new_backing_bs,
-                            NULL, bdrv_backing_role(state->bs),
-                            bs_queue, state->perm, state->shared_perm,
-                            &nperm, &nshared);
-            ret = bdrv_check_update_perm(state->new_backing_bs, NULL,
-                                         nperm, nshared, errp);
-            if (ret < 0) {
-                goto cleanup_perm;
-            }
+
+        refresh_list = bdrv_topological_dfs(refresh_list, found, state->bs);
+        if (state->old_backing_bs) {
+            refresh_list = bdrv_topological_dfs(refresh_list, found,
+                                                state->old_backing_bs);
         }
-        bs_entry->perms_checked = true;
+    }
+
+    /*
+     * Note that file-posix driver rely on permission update done during reopen
+     * (even if no permission changed), because it wants "new" permissions for
+     * reconfiguring the fd and that's why it does it in raw_check_perm(), not
+     * in raw_reopen_prepare() which is called with "old" permissions.
+     */
+    ret = bdrv_list_refresh_perms(refresh_list, bs_queue, tran, errp);
+    if (ret < 0) {
+        goto abort;
     }
 
     /*
@@ -4326,51 +4328,31 @@ int bdrv_reopen_multiple(BlockReopenQueue *bs_queue, Error **errp)
         bdrv_reopen_commit(&bs_entry->state);
     }
 
-    ret = 0;
-cleanup_perm:
-    QTAILQ_FOREACH_SAFE(bs_entry, bs_queue, entry, next) {
-        BDRVReopenState *state = &bs_entry->state;
-
-        if (!bs_entry->perms_checked) {
-            continue;
-        }
-
-        if (ret == 0) {
-            uint64_t perm, shared;
+    tran_commit(tran);
 
-            bdrv_get_cumulative_perm(state->bs, &perm, &shared);
-            assert(perm == state->perm);
-            assert(shared == state->shared_perm);
+    QTAILQ_FOREACH_REVERSE(bs_entry, bs_queue, entry) {
+        BlockDriverState *bs = bs_entry->state.bs;
 
-            bdrv_set_perm(state->bs);
-        } else {
-            bdrv_abort_perm_update(state->bs);
-            if (state->replace_backing_bs && state->new_backing_bs) {
-                bdrv_abort_perm_update(state->new_backing_bs);
-            }
+        if (bs->drv->bdrv_reopen_commit_post) {
+            bs->drv->bdrv_reopen_commit_post(&bs_entry->state);
         }
     }
 
-    if (ret == 0) {
-        QTAILQ_FOREACH_REVERSE(bs_entry, bs_queue, entry) {
-            BlockDriverState *bs = bs_entry->state.bs;
+    ret = 0;
+    goto cleanup;
 
-            if (bs->drv->bdrv_reopen_commit_post)
-                bs->drv->bdrv_reopen_commit_post(&bs_entry->state);
+abort:
+    tran_abort(tran);
+    QTAILQ_FOREACH_SAFE(bs_entry, bs_queue, entry, next) {
+        if (bs_entry->prepared) {
+            bdrv_reopen_abort(&bs_entry->state);
         }
+        qobject_unref(bs_entry->state.explicit_options);
+        qobject_unref(bs_entry->state.options);
     }
+
 cleanup:
     QTAILQ_FOREACH_SAFE(bs_entry, bs_queue, entry, next) {
-        if (ret) {
-            if (bs_entry->prepared) {
-                bdrv_reopen_abort(&bs_entry->state);
-            }
-            qobject_unref(bs_entry->state.explicit_options);
-            qobject_unref(bs_entry->state.options);
-        }
-        if (bs_entry->state.new_backing_bs) {
-            bdrv_unref(bs_entry->state.new_backing_bs);
-        }
         g_free(bs_entry);
     }
     g_free(bs_queue);
@@ -4395,53 +4377,6 @@ int bdrv_reopen_set_read_only(BlockDriverState *bs, bool read_only,
     return ret;
 }
 
-static BlockReopenQueueEntry *find_parent_in_reopen_queue(BlockReopenQueue *q,
-                                                          BdrvChild *c)
-{
-    BlockReopenQueueEntry *entry;
-
-    QTAILQ_FOREACH(entry, q, entry) {
-        BlockDriverState *bs = entry->state.bs;
-        BdrvChild *child;
-
-        QLIST_FOREACH(child, &bs->children, next) {
-            if (child == c) {
-                return entry;
-            }
-        }
-    }
-
-    return NULL;
-}
-
-static void bdrv_reopen_perm(BlockReopenQueue *q, BlockDriverState *bs,
-                             uint64_t *perm, uint64_t *shared)
-{
-    BdrvChild *c;
-    BlockReopenQueueEntry *parent;
-    uint64_t cumulative_perms = 0;
-    uint64_t cumulative_shared_perms = BLK_PERM_ALL;
-
-    QLIST_FOREACH(c, &bs->parents, next_parent) {
-        parent = find_parent_in_reopen_queue(q, c);
-        if (!parent) {
-            cumulative_perms |= c->perm;
-            cumulative_shared_perms &= c->shared_perm;
-        } else {
-            uint64_t nperm, nshared;
-
-            bdrv_child_perm(parent->state.bs, bs, c, c->role, q,
-                            parent->state.perm, parent->state.shared_perm,
-                            &nperm, &nshared);
-
-            cumulative_perms |= nperm;
-            cumulative_shared_perms &= nshared;
-        }
-    }
-    *perm = cumulative_perms;
-    *shared = cumulative_shared_perms;
-}
-
 static bool bdrv_reopen_can_attach(BlockDriverState *parent,
                                    BdrvChild *child,
                                    BlockDriverState *new_child,
@@ -4483,6 +4418,7 @@ static bool bdrv_reopen_can_attach(BlockDriverState *parent,
  * Return 0 on success, otherwise return < 0 and set @errp.
  */
 static int bdrv_reopen_parse_backing(BDRVReopenState *reopen_state,
+                                     Transaction *set_backings_tran,
                                      Error **errp)
 {
     BlockDriverState *bs = reopen_state->bs;
@@ -4559,6 +4495,8 @@ static int bdrv_reopen_parse_backing(BDRVReopenState *reopen_state,
 
     /* If we want to replace the backing file we need some extra checks */
     if (new_backing_bs != bdrv_filter_or_cow_bs(overlay_bs)) {
+        int ret;
+
         /* Check for implicit nodes between bs and its backing file */
         if (bs != overlay_bs) {
             error_setg(errp, "Cannot change backing link if '%s' has "
@@ -4579,9 +4517,11 @@ static int bdrv_reopen_parse_backing(BDRVReopenState *reopen_state,
             return -EPERM;
         }
         reopen_state->replace_backing_bs = true;
-        if (new_backing_bs) {
-            bdrv_ref(new_backing_bs);
-            reopen_state->new_backing_bs = new_backing_bs;
+        reopen_state->old_backing_bs = bs->backing ? bs->backing->bs : NULL;
+        ret = bdrv_set_backing_noperm(bs, new_backing_bs, set_backings_tran,
+                                      errp);
+        if (ret < 0) {
+            return ret;
         }
     }
 
@@ -4606,7 +4546,8 @@ static int bdrv_reopen_parse_backing(BDRVReopenState *reopen_state,
  *
  */
 static int bdrv_reopen_prepare(BDRVReopenState *reopen_state,
-                               BlockReopenQueue *queue, Error **errp)
+                               BlockReopenQueue *queue,
+                               Transaction *set_backings_tran, Error **errp)
 {
     int ret = -1;
     int old_flags;
@@ -4673,10 +4614,6 @@ static int bdrv_reopen_prepare(BDRVReopenState *reopen_state,
         goto error;
     }
 
-    /* Calculate required permissions after reopening */
-    bdrv_reopen_perm(queue, reopen_state->bs,
-                     &reopen_state->perm, &reopen_state->shared_perm);
-
     if (drv->bdrv_reopen_prepare) {
         /*
          * If a driver-specific option is missing, it means that we
@@ -4730,7 +4667,7 @@ static int bdrv_reopen_prepare(BDRVReopenState *reopen_state,
      * either a reference to an existing node (using its node name)
      * or NULL to simply detach the current backing file.
      */
-    ret = bdrv_reopen_parse_backing(reopen_state, errp);
+    ret = bdrv_reopen_parse_backing(reopen_state, set_backings_tran, errp);
     if (ret < 0) {
         goto error;
     }
@@ -4852,22 +4789,6 @@ static void bdrv_reopen_commit(BDRVReopenState *reopen_state)
         qdict_del(bs->explicit_options, child->name);
         qdict_del(bs->options, child->name);
     }
-
-    /*
-     * Change the backing file if a new one was specified. We do this
-     * after updating bs->options, so bdrv_refresh_filename() (called
-     * from bdrv_set_backing_hd()) has the new values.
-     */
-    if (reopen_state->replace_backing_bs) {
-        BlockDriverState *old_backing_bs = child_bs(bs->backing);
-        assert(!old_backing_bs || !old_backing_bs->implicit);
-        /* Abort the permission update on the backing bs we're detaching */
-        if (old_backing_bs) {
-            bdrv_abort_perm_update(old_backing_bs);
-        }
-        bdrv_set_backing_hd(bs, reopen_state->new_backing_bs, &error_abort);
-    }
-
     bdrv_refresh_limits(bs, NULL, NULL);
 }
 
diff --git a/block/file-posix.c b/block/file-posix.c
index 20e14f8e96..10b71d9a13 100644
--- a/block/file-posix.c
+++ b/block/file-posix.c
@@ -175,7 +175,6 @@ typedef struct BDRVRawState {
 } BDRVRawState;
 
 typedef struct BDRVRawReopenState {
-    int fd;
     int open_flags;
     bool drop_cache;
     bool check_cache_dropped;
@@ -1075,7 +1074,6 @@ static int raw_reopen_prepare(BDRVReopenState *state,
     BDRVRawReopenState *rs;
     QemuOpts *opts;
     int ret;
-    Error *local_err = NULL;
 
     assert(state != NULL);
     assert(state->bs != NULL);
@@ -1101,32 +1099,18 @@ static int raw_reopen_prepare(BDRVReopenState *state,
      * bdrv_reopen_prepare() will detect changes and complain. */
     qemu_opts_to_qdict(opts, state->options);
 
-    rs->fd = raw_reconfigure_getfd(state->bs, state->flags, &rs->open_flags,
-                                   state->perm, true, &local_err);
-    if (local_err) {
-        error_propagate(errp, local_err);
-        ret = -1;
-        goto out;
-    }
-
-    /* Fail already reopen_prepare() if we can't get a working O_DIRECT
-     * alignment with the new fd. */
-    if (rs->fd != -1) {
-        raw_probe_alignment(state->bs, rs->fd, &local_err);
-        if (local_err) {
-            error_propagate(errp, local_err);
-            ret = -EINVAL;
-            goto out_fd;
-        }
-    }
+    /*
+     * As part of reopen prepare we also want to create new fd by
+     * raw_reconfigure_getfd(). But it wants updated "perm", when in
+     * bdrv_reopen_multiple() .bdrv_reopen_prepare() callback called prior to
+     * permission update. Happily, permission update is always a part (a seprate
+     * stage) of bdrv_reopen_multiple() so we can rely on this fact and
+     * reconfigure fd in raw_check_perm().
+     */
 
     s->reopen_state = state;
     ret = 0;
-out_fd:
-    if (ret < 0) {
-        qemu_close(rs->fd);
-        rs->fd = -1;
-    }
+
 out:
     qemu_opts_del(opts);
     return ret;
@@ -1140,10 +1124,6 @@ static void raw_reopen_commit(BDRVReopenState *state)
     s->drop_cache = rs->drop_cache;
     s->check_cache_dropped = rs->check_cache_dropped;
     s->open_flags = rs->open_flags;
-
-    qemu_close(s->fd);
-    s->fd = rs->fd;
-
     g_free(state->opaque);
     state->opaque = NULL;
 
@@ -1162,10 +1142,6 @@ static void raw_reopen_abort(BDRVReopenState *state)
         return;
     }
 
-    if (rs->fd >= 0) {
-        qemu_close(rs->fd);
-        rs->fd = -1;
-    }
     g_free(state->opaque);
     state->opaque = NULL;
 
@@ -3073,39 +3049,30 @@ static int raw_check_perm(BlockDriverState *bs, uint64_t perm, uint64_t shared,
                           Error **errp)
 {
     BDRVRawState *s = bs->opaque;
-    BDRVRawReopenState *rs = NULL;
+    int input_flags = s->reopen_state ? s->reopen_state->flags : bs->open_flags;
     int open_flags;
     int ret;
 
-    if (s->perm_change_fd) {
+    /* We may need a new fd if auto-read-only switches the mode */
+    ret = raw_reconfigure_getfd(bs, input_flags, &open_flags, perm,
+                                false, errp);
+    if (ret < 0) {
+        return ret;
+    } else if (ret != s->fd) {
+        Error *local_err = NULL;
+
         /*
-         * In the context of reopen, this function may be called several times
-         * (directly and recursively while change permissions of the parent).
-         * This is even true for children that don't inherit from the original
-         * reopen node, so s->reopen_state is not set.
-         *
-         * Ignore all but the first call.
+         * Fail already check_perm() if we can't get a working O_DIRECT
+         * alignment with the new fd.
          */
-        return 0;
-    }
-
-    if (s->reopen_state) {
-        /* We already have a new file descriptor to set permissions for */
-        assert(s->reopen_state->perm == perm);
-        assert(s->reopen_state->shared_perm == shared);
-        rs = s->reopen_state->opaque;
-        s->perm_change_fd = rs->fd;
-        s->perm_change_flags = rs->open_flags;
-    } else {
-        /* We may need a new fd if auto-read-only switches the mode */
-        ret = raw_reconfigure_getfd(bs, bs->open_flags, &open_flags, perm,
-                                    false, errp);
-        if (ret < 0) {
-            return ret;
-        } else if (ret != s->fd) {
-            s->perm_change_fd = ret;
-            s->perm_change_flags = open_flags;
+        raw_probe_alignment(bs, ret, &local_err);
+        if (local_err) {
+            error_propagate(errp, local_err);
+            return -EINVAL;
         }
+
+        s->perm_change_fd = ret;
+        s->perm_change_flags = open_flags;
     }
 
     /* Prepare permissions on old fd to avoid conflicts between old and new,
@@ -3127,7 +3094,7 @@ static int raw_check_perm(BlockDriverState *bs, uint64_t perm, uint64_t shared,
     return 0;
 
 fail:
-    if (s->perm_change_fd && !s->reopen_state) {
+    if (s->perm_change_fd) {
         qemu_close(s->perm_change_fd);
     }
     s->perm_change_fd = 0;
@@ -3158,7 +3125,7 @@ static void raw_abort_perm_update(BlockDriverState *bs)
 
     /* For reopen, .bdrv_reopen_abort is called afterwards and will close
      * the file descriptor. */
-    if (s->perm_change_fd && !s->reopen_state) {
+    if (s->perm_change_fd) {
         qemu_close(s->perm_change_fd);
     }
     s->perm_change_fd = 0;
-- 
2.29.2


