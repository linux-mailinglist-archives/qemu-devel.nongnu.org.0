Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EAFF33F3DD
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Mar 2021 16:13:26 +0100 (CET)
Received: from localhost ([::1]:41646 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lMXrR-0001la-4y
	for lists+qemu-devel@lfdr.de; Wed, 17 Mar 2021 11:13:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34972)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lMXII-0005Ln-Jq; Wed, 17 Mar 2021 10:37:06 -0400
Received: from mail-db8eur05on2128.outbound.protection.outlook.com
 ([40.107.20.128]:5633 helo=EUR05-DB8-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lMXIF-00079x-LG; Wed, 17 Mar 2021 10:37:06 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Pb2lqXxXFFcrr9HkavsOaszjhB5Nf72vn73w/fRadCH9EMHBY3QcIOojbrabDsShP37AbyoSEep82oi9aUgNMNP3pdj7eycDPzVXxXfuuOquBiKxqD7AwGwx5fN82VvQlLiNavfdmIeUFN+/o2MfM5D7FY3SBv6NlaYfO9hSlNBzxiZHnt+OzN5+hT87DKsiVillJ4NWJ9CDEVlJNp+9vge++H7lrIDbJJB52gmkqzK4eEgiVRmQ/9TFeRBK2OdW8foISyKNWBAU1uYmTdb+qBKqh3Z/beGcwXRqUCmzMwl2QRSR2M6J4OGtVaVpvktogVh79eoMTAF4Xn+8t4hhNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tlyIqqfGc95vrVAc+TfWpMYFG0x760og6wpVbqxhXW0=;
 b=DKw4Sow41x1C/FfgZCNNasTIRomB/LL49Sv0Q79uIsgSGsZ9a5JIUoRcAIdCROwr3ylwNsWVqe62y4lnPf3/geJkvuLNzd2bM+ddJC2fRwBk8ylYkofw6LAyyDEjcoy+wP1QOoNiIUI/8fqCBJZhjOO3qEsIfWu46frtKP/WW5aBeTjuBmi+QtqoWssVmFoJNfW8jz+/5R2g75t3176m5DWikQ9iKOO2Vt0lnPBJHM3WdnTNbrRDbAc4Fe7iQTrFk+jPLj47O7iNgQObCUni0NsxTDj4T7I47tL/0+3hPt6tmh5wQh8sYVGOfWpOZTquZJMjFwxKqlUbWyS7tZN6Ug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tlyIqqfGc95vrVAc+TfWpMYFG0x760og6wpVbqxhXW0=;
 b=g1NFsPNuFMGf7siBe/zSh4kIPGVyAEQyLBRHyqVx80IxzC6uqIBtxZ/fpzMiRxGvCJOLBU5D4yVURCTnp0rIFxx/zj3IFWhq13ZBZ97SsQB4WZIVCKHBnV8llUz1ID7DP8ucb4Sj1MRgGJ+hpmM8C9m3pxNp4tR2ywRwSchcXpo=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AS8PR08MB6216.eurprd08.prod.outlook.com (2603:10a6:20b:29c::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3933.32; Wed, 17 Mar
 2021 14:36:46 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f1f0:6610:11f5:5e4a]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f1f0:6610:11f5:5e4a%8]) with mapi id 15.20.3933.032; Wed, 17 Mar 2021
 14:36:46 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, armbru@redhat.com, fam@euphon.net,
 stefanha@redhat.com, vsementsov@virtuozzo.com, jsnow@redhat.com,
 mreitz@redhat.com, kwolf@redhat.com
Subject: [PATCH v3 30/36] block: bdrv_reopen_multiple: refresh permissions on
 updated graph
Date: Wed, 17 Mar 2021 17:35:23 +0300
Message-Id: <20210317143529.615584-31-vsementsov@virtuozzo.com>
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
 15.20.3955.18 via Frontend Transport; Wed, 17 Mar 2021 14:36:45 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: edaa67ae-b44b-45f2-886a-08d8e952175f
X-MS-TrafficTypeDiagnostic: AS8PR08MB6216:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AS8PR08MB6216EAB8452C6249200A691DC16A9@AS8PR08MB6216.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:114;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: tF2nekQluICHO7zhl215BZYmz+DBrQYmtRA5XfbokQyqNfxOL/dLutqEohGU/7MZuQgYz/o5EOMhYfjxKxNfondzYcSyVpQ0MHSVl9jNEqLoi89LOw8BvwH7SVAxSGUrT3ZISyXjylLmqSfnZEGUqZlyxO4EyldDuGHol++FF4e7nhtiOq+SCyaY/1p0SlwIhooQBanv4qTWRrlet2e37cJ3F4smszWVTgu/DU17poxYZ7s5zs8bp4NpSzaqgt4ULWh0yiD8DE4KhQh/HVDoQgNN2EEayNikfCS94nPR2WUTdKhbmDQL8hLf53ylNEjsiKfU0G5JfaWZv6UsUpy2DO2b8dpkaGvBAmD6y5gh0dMVgTB/VkDs92IO3IJ7yRq9tJ46dl/kAr4/ae+FraIt7f2Tc0CH7ndHbVyzOEhQjN8st1vA+ouI7c7YfMOlC9Hyvh860DJ9Rl/nI4ywEhc2KxLcpToBPulDN1g8+uC9J8dmnfEXqRjoHyDRdGOqaaXPlhcYiznaKOInkhwIpUBzq2OEn6vR/RwieTikEDmx6PzHbSw0AyZ6T6/itb6D628U2vo2rcQ/z8Y2Gil3r9Y2Bq20+k0wW4Wp3Sr674FHS5zLpSGl10mBxuj4leDqDPy3
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(366004)(346002)(376002)(39840400004)(136003)(6916009)(83380400001)(316002)(2616005)(66946007)(6512007)(66556008)(8676002)(956004)(26005)(30864003)(1076003)(16526019)(6486002)(186003)(4326008)(36756003)(8936002)(15650500001)(2906002)(6666004)(5660300002)(478600001)(86362001)(66476007)(6506007)(52116002)(69590400012);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?sizADMl3EDh+1GPMzgJ19hcOmKGRRBfDDy4u7ffuePswdmAJ48ParzWELons?=
 =?us-ascii?Q?lFlP3Zfx8fKSfPAmZf7CGjqIRjwPr9UWYHcNAT11XjBXJuAfKT/tMxeGYTIj?=
 =?us-ascii?Q?MlOGN3qmCw+iD6BcLFeEj0Kf1W6Yo96Md7UeZVKpJvEJF5vADTjyNf3p5JTv?=
 =?us-ascii?Q?Kte62Wzqy631QKoqh5Nu0elXcEmzeTENcFl9otfvlNfC4hLiV58dREtK0/C2?=
 =?us-ascii?Q?zVSPYDlZwryvmLPhMZj4wq8Qup0A9mZ1Uc0cUcbQ4ghh9Bn21S+HZgkLCdON?=
 =?us-ascii?Q?reAMJmmPe6Qr87f7LugNA3K2z9Drw7Sg00QA1iIcDvIBCZNQ4x66QVTNn+C3?=
 =?us-ascii?Q?FL+94lkq9J/EyD8hP+KSRq9QSaofKbYkjSCu3Hz8rjQKHPqx8DewZ0W8wGf9?=
 =?us-ascii?Q?TNZW0kyIkqrR9sAMBB/GoQUXFXDJjWIcx96tdOEArd+aUuIXbNR0gnWFbHen?=
 =?us-ascii?Q?6DgPagYrRCn+O/OFicfSRAuAxhjAHdr4TsKyeCKvyHru9SHi38P80rMvbcmF?=
 =?us-ascii?Q?mDgH0f/Hdulpd8KRY657YPvZbP/TyuAXIIkT1MnsbW6qdcGJrvfr+RHieue6?=
 =?us-ascii?Q?//VU2DJCh55sOhjvONc+dinMZRZGu4ZZuPoJr5mKzYA3ES3yNxsHwjWmcIk1?=
 =?us-ascii?Q?ef6CJex1JLVf9339nNVAZ/i/ub0uztoYtuwwsmeuvlBR0+x5dXzvBkqKfLls?=
 =?us-ascii?Q?netfsTkwki9f8f1lJBUcJvgtLZbges/vQqHZhtO/bBA/CEhJrVLV/PynltR/?=
 =?us-ascii?Q?rFSSNpiJpt6CSzT/AdYJViR+uN+Wxq6vP6MR2i3LhFAcHw0bXqnCdZAepY+u?=
 =?us-ascii?Q?CdN/lm4zQS8qFRkb+HWHOaR0j8aGw/kaEF3Qif+oAyJkoxEeEjeJf2K++YrI?=
 =?us-ascii?Q?lPtcySZBr1TJITbe22E964wPcIkY/EObczpKdJDJWYZVVqZVYnxNoZ1Tl/3n?=
 =?us-ascii?Q?gkt5y1hD8vjka/ppkLvm20qOa+Y2swbuPADSc62tHSh9BviBmn1f03cP/lzH?=
 =?us-ascii?Q?mAJf+JRlvr3Ztbi6uO/MR/k+H7NswvhZEST61gds5VA5x/0TADgDBwmkTAJU?=
 =?us-ascii?Q?N+UyNF4GXWxgE1App1SapaFrXqht1Ea7dSl/p0zTkx/jFlCfWOzG6mnDVrg7?=
 =?us-ascii?Q?BFBexGTprfLtdCXQ9AI9w3y4AaRV2uQVesnV71VCc+A5wF9z1Kj1cZDCb6qT?=
 =?us-ascii?Q?dhFOOMMwqTkVO58KFm/NDU/h2puto6BXYDCl0NAY+Lqr7VG2aQg9bebUgT9z?=
 =?us-ascii?Q?4VaUbyzxRwbZTNdwGf0+U4O8jYmltI28j46b7l/NXX/WZQSPors9Rl9+ahEC?=
 =?us-ascii?Q?W2cxWbOA7y0xPANc/A2VG7ju?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: edaa67ae-b44b-45f2-886a-08d8e952175f
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Mar 2021 14:36:46.3912 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JDypxI9rUsGyg1yXXQakMUOBIzJ5mCJ8vn49rwiokSFtp/arFmoaX+4ncFcossH+S+JBkUz00XoRdx3Dyc2WR7eENwL0jXTMCrQuV4eeFQk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6216
Received-SPF: pass client-ip=40.107.20.128;
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

Move bdrv_reopen_multiple to new paradigm of permission update:
first update graph relations, then do refresh the permissions.

We have to modify reopen process in file-posix driver: with new scheme
we don't have prepared permissions in raw_reopen_prepare(), so we
should reconfigure fd in raw_check_perm(). Still this seems more native
and simple anyway.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
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
index fde4bb219d..53a8af301a 100644
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
 
@@ -2434,6 +2435,7 @@ static void bdrv_list_abort_perm_update(GSList *list)
     }
 }
 
+__attribute__((unused))
 static void bdrv_abort_perm_update(BlockDriverState *bs)
 {
     g_autoptr(GSList) list = bdrv_topological_dfs(NULL, NULL, bs);
@@ -2529,6 +2531,7 @@ char *bdrv_perm_names(uint64_t perm)
  *
  * Needs to be followed by a call to either bdrv_set_perm() or
  * bdrv_abort_perm_update(). */
+__attribute__((unused))
 static int bdrv_check_update_perm(BlockDriverState *bs, BlockReopenQueue *q,
                                   uint64_t new_used_perm,
                                   uint64_t new_shared_perm,
@@ -4148,10 +4151,6 @@ static BlockReopenQueue *bdrv_reopen_queue_child(BlockReopenQueue *bs_queue,
     bs_entry->state.explicit_options = explicit_options;
     bs_entry->state.flags = flags;
 
-    /* This needs to be overwritten in bdrv_reopen_prepare() */
-    bs_entry->state.perm = UINT64_MAX;
-    bs_entry->state.shared_perm = 0;
-
     /*
      * If keep_old_opts is false then it means that unspecified
      * options must be reset to their original value. We don't allow
@@ -4236,6 +4235,9 @@ int bdrv_reopen_multiple(BlockReopenQueue *bs_queue, Error **errp)
 {
     int ret = -1;
     BlockReopenQueueEntry *bs_entry, *next;
+    Transaction *tran = tran_new();
+    g_autoptr(GHashTable) found = NULL;
+    g_autoptr(GSList) refresh_list = NULL;
 
     assert(bs_queue != NULL);
 
@@ -4249,33 +4251,33 @@ int bdrv_reopen_multiple(BlockReopenQueue *bs_queue, Error **errp)
 
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
@@ -4291,51 +4293,31 @@ int bdrv_reopen_multiple(BlockReopenQueue *bs_queue, Error **errp)
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
@@ -4360,53 +4342,6 @@ int bdrv_reopen_set_read_only(BlockDriverState *bs, bool read_only,
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
@@ -4448,6 +4383,7 @@ static bool bdrv_reopen_can_attach(BlockDriverState *parent,
  * Return 0 on success, otherwise return < 0 and set @errp.
  */
 static int bdrv_reopen_parse_backing(BDRVReopenState *reopen_state,
+                                     Transaction *set_backings_tran,
                                      Error **errp)
 {
     BlockDriverState *bs = reopen_state->bs;
@@ -4524,6 +4460,8 @@ static int bdrv_reopen_parse_backing(BDRVReopenState *reopen_state,
 
     /* If we want to replace the backing file we need some extra checks */
     if (new_backing_bs != bdrv_filter_or_cow_bs(overlay_bs)) {
+        int ret;
+
         /* Check for implicit nodes between bs and its backing file */
         if (bs != overlay_bs) {
             error_setg(errp, "Cannot change backing link if '%s' has "
@@ -4544,9 +4482,11 @@ static int bdrv_reopen_parse_backing(BDRVReopenState *reopen_state,
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
 
@@ -4571,7 +4511,8 @@ static int bdrv_reopen_parse_backing(BDRVReopenState *reopen_state,
  *
  */
 static int bdrv_reopen_prepare(BDRVReopenState *reopen_state,
-                               BlockReopenQueue *queue, Error **errp)
+                               BlockReopenQueue *queue,
+                               Transaction *set_backings_tran, Error **errp)
 {
     int ret = -1;
     int old_flags;
@@ -4638,10 +4579,6 @@ static int bdrv_reopen_prepare(BDRVReopenState *reopen_state,
         goto error;
     }
 
-    /* Calculate required permissions after reopening */
-    bdrv_reopen_perm(queue, reopen_state->bs,
-                     &reopen_state->perm, &reopen_state->shared_perm);
-
     if (drv->bdrv_reopen_prepare) {
         /*
          * If a driver-specific option is missing, it means that we
@@ -4695,7 +4632,7 @@ static int bdrv_reopen_prepare(BDRVReopenState *reopen_state,
      * either a reference to an existing node (using its node name)
      * or NULL to simply detach the current backing file.
      */
-    ret = bdrv_reopen_parse_backing(reopen_state, errp);
+    ret = bdrv_reopen_parse_backing(reopen_state, set_backings_tran, errp);
     if (ret < 0) {
         goto error;
     }
@@ -4817,22 +4754,6 @@ static void bdrv_reopen_commit(BDRVReopenState *reopen_state)
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
index 05079b40ca..7b7e63cfa9 100644
--- a/block/file-posix.c
+++ b/block/file-posix.c
@@ -175,7 +175,6 @@ typedef struct BDRVRawState {
 } BDRVRawState;
 
 typedef struct BDRVRawReopenState {
-    int fd;
     int open_flags;
     bool drop_cache;
     bool check_cache_dropped;
@@ -1080,7 +1079,6 @@ static int raw_reopen_prepare(BDRVReopenState *state,
     BDRVRawReopenState *rs;
     QemuOpts *opts;
     int ret;
-    Error *local_err = NULL;
 
     assert(state != NULL);
     assert(state->bs != NULL);
@@ -1106,32 +1104,18 @@ static int raw_reopen_prepare(BDRVReopenState *state,
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
@@ -1145,10 +1129,6 @@ static void raw_reopen_commit(BDRVReopenState *state)
     s->drop_cache = rs->drop_cache;
     s->check_cache_dropped = rs->check_cache_dropped;
     s->open_flags = rs->open_flags;
-
-    qemu_close(s->fd);
-    s->fd = rs->fd;
-
     g_free(state->opaque);
     state->opaque = NULL;
 
@@ -1167,10 +1147,6 @@ static void raw_reopen_abort(BDRVReopenState *state)
         return;
     }
 
-    if (rs->fd >= 0) {
-        qemu_close(rs->fd);
-        rs->fd = -1;
-    }
     g_free(state->opaque);
     state->opaque = NULL;
 
@@ -3078,39 +3054,30 @@ static int raw_check_perm(BlockDriverState *bs, uint64_t perm, uint64_t shared,
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
@@ -3132,7 +3099,7 @@ static int raw_check_perm(BlockDriverState *bs, uint64_t perm, uint64_t shared,
     return 0;
 
 fail:
-    if (s->perm_change_fd && !s->reopen_state) {
+    if (s->perm_change_fd) {
         qemu_close(s->perm_change_fd);
     }
     s->perm_change_fd = 0;
@@ -3163,7 +3130,7 @@ static void raw_abort_perm_update(BlockDriverState *bs)
 
     /* For reopen, .bdrv_reopen_abort is called afterwards and will close
      * the file descriptor. */
-    if (s->perm_change_fd && !s->reopen_state) {
+    if (s->perm_change_fd) {
         qemu_close(s->perm_change_fd);
     }
     s->perm_change_fd = 0;
-- 
2.29.2


