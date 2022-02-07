Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CFB8B4AC68F
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Feb 2022 17:58:21 +0100 (CET)
Received: from localhost ([::1]:43646 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nH7LI-0004nz-VM
	for lists+qemu-devel@lfdr.de; Mon, 07 Feb 2022 11:58:20 -0500
Received: from eggs.gnu.org ([209.51.188.92]:47538)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1nH71f-0001yF-Bs; Mon, 07 Feb 2022 11:38:03 -0500
Received: from [2a01:111:f400:7e1b::716] (port=32353
 helo=EUR05-AM6-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1nH71d-0005Iz-6j; Mon, 07 Feb 2022 11:38:03 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Gs44eXXSp9S8imgjU8cSJioaQW3GQ58czbg+RZ2ge+hvNje6cHrjWfjJyAnOLookbtqwZ5KnLCdBp7zg96Tl2CuGPEvLJzuCM5SlT1vGHI520u+vQVq4a2u5RJw9tL2wN612+lQmzthzm4MO3fD7XgsXmhiwUT7THWSHJK+tLQvy89zS7spnqQW5LSis756yzDYz7Yz1IASLAAiQr9DawwFQTr9/6EIlUBYS0QbfhLdNctIJmCiVPi36Eu8TG0FhPAX/ylUGBdhYQzidt+cAa46/pJujM2V/GxaeXMKrFdNy/z++Oc5DW49PHa2iweLDX8kcKgHftZ+vamBkjuwEEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=H1OlxZzs7F0wEu/bdT7/ECBbghpOwnIpR9VbwgCczCQ=;
 b=nUyJWUh7K/H7P217eu7sWkzpqK50hnPb9e3+mM6UCHJaKXhT7DvbCiskcEkuuT3AXdKnmeD7tfOs0lM4Ki9dtcI7CPVSykyaP6xibOHRwCuKBFUtDiJOm06zTaAmTrmjUDzQ3yrnf3NyvxzLDfSOqzlVuyOBolMrp6mwDOj+3aIHA32R1VjJ4VKX9Yr/PJs+sk5LNMGUWkFccDYtXcj1derg88vjU4at6Zgw0T/ck6bKQQBZLDDpMHRv2V7ImjZfP2YPtuf1ay3AHTkMbShslWGjIdGJNcG1W2c7Gjz/BaehCDf9d/aIvSTBSwlhUxmQRX69WcvBZfxByzWuB2dw2g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=H1OlxZzs7F0wEu/bdT7/ECBbghpOwnIpR9VbwgCczCQ=;
 b=ibhR/3ogQmjeYGckIVuG1UplcvK9wOOgWLazG58eXGPYnKHhKxjxAVqNqy1N2EUkTQcKTWXB5rcNcJKuWxKme+nL08qoC/JgPPvj+jjxtO+tpN2ABJ4S5vyHkJ+BWM3VMQS30fYkWrN0BYFVMHlEEv26wla+gDtnvNvub92M1Eo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from AM9PR08MB6737.eurprd08.prod.outlook.com (2603:10a6:20b:304::18)
 by VI1PR0802MB2288.eurprd08.prod.outlook.com (2603:10a6:800:a6::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.17; Mon, 7 Feb
 2022 16:37:44 +0000
Received: from AM9PR08MB6737.eurprd08.prod.outlook.com
 ([fe80::49c:67e9:3e24:8714]) by AM9PR08MB6737.eurprd08.prod.outlook.com
 ([fe80::49c:67e9:3e24:8714%4]) with mapi id 15.20.4951.018; Mon, 7 Feb 2022
 16:37:44 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, armbru@redhat.com, jsnow@redhat.com,
 vsementsov@virtuozzo.com, eblake@redhat.com, hreitz@redhat.com,
 kwolf@redhat.com, den@openvz.org, ktkhai@virtuozzo.com, igor@virtuozzo.com
Subject: [PATCH 12/14] qcow2: implement .bdrv_close_safe
Date: Mon,  7 Feb 2022 17:37:26 +0100
Message-Id: <20220207163728.30362-13-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20220207163728.30362-1-vsementsov@virtuozzo.com>
References: <20220207163728.30362-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: AM6P193CA0126.EURP193.PROD.OUTLOOK.COM
 (2603:10a6:209:85::31) To AM9PR08MB6737.eurprd08.prod.outlook.com
 (2603:10a6:20b:304::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c0c082e7-cde5-41fe-4375-08d9ea582a15
X-MS-TrafficTypeDiagnostic: VI1PR0802MB2288:EE_
X-Microsoft-Antispam-PRVS: <VI1PR0802MB2288D31FEC5FC5964E3D20A6C12C9@VI1PR0802MB2288.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:117;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: e+/v9d7A04cY4zRG6VZ/dNO2hhoZfl5wpG5UrqUqlsJGA5giiqNTz7sN+50oCWOPPLikESH2DmvfLyBs/8UpDfGClswqWUw7jSXJ8WWEqKvztafiEQDxCmVunRGoJk+8By4Q++pHqK2sMbFMnJitdvBO8BukRfZjkYdUwsUHnppJIwSaiTmIZHtO4agmjE9+0z29j69gJSNfzzMMFzuVxKSf2Y3pk/cFqruP3mSNYJ2fGaivdc9koIJ3hLQnrzmqXb8zWXGiAsn60fTsUHdE3UakASxbg/GKIoe5jPxgX+46FH8tJo0ciOJYdhCe5s3lfAIF5UI+KvyOtgou0b8mT+UTMy53tgWfeCdUnDAB1S8h7E0vETHfnb60iROlQRekkJGcrQDYSl86Pa98sjP5q3wcVw134SKM1aBNH/qdUgzq23WyeEhn37feotqxUVWyEtxhPhC/Qij2a+uGOs1/gwp67WZXVEnQjQKeFrncAmVmMrMHn1fQfaWWK4B/UaJtxxVp30xlOYmDyJ9Q683HYbRMg+3t9OFxuobqo8W2DXNB1zuxvFH1H+d/6SbVKfytXnZ6bJBF0shtK2NrJqCeFWUaal+P7nythfctUeod/HXvD1fCKV1TPivYFYjUHe/OTa6SEu2p8KBZnAK+WG42BRphxgZsgrcsvDxQmgDOJozT/3ePG6i4Adi5C+58Nm23iid2EtRdadPcT6AVI5MH9+eTyrUbzvzkutSilsmS/3U=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM9PR08MB6737.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(36756003)(66946007)(66556008)(8936002)(8676002)(38100700002)(83380400001)(66476007)(5660300002)(6916009)(4326008)(2906002)(508600001)(26005)(1076003)(186003)(86362001)(6486002)(38350700002)(2616005)(107886003)(6512007)(6506007)(6666004)(316002)(52116002)(142923001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?31FlC5QHCmg2MFsj4H0pZab3ChbaMSlo3G/C6x8aoO90xYvj06AmqvqdShBp?=
 =?us-ascii?Q?d7EjF8fLkSoDhnmDcgJ8Q6zJmaVBzRqncvthNRQvk0sXK5mQ914oF0ZolGDP?=
 =?us-ascii?Q?03EHn2ePMG7nJ10R57EZZDcUAyb+bmBEnYUUX66YBBn53nKTtIq0AZha+p92?=
 =?us-ascii?Q?4uBWw3pXkGmU1dGA5XoZ/axQYAX9uI6Sge3GMVVCffGRNEzxoJxlIj7fWtD9?=
 =?us-ascii?Q?4N6DvQDcJ7SlL4XgfzmTdrjVIHYz5jRnBMsb8JZTenJPYL6x1wVx8H+3c9fJ?=
 =?us-ascii?Q?mucI9qQNt7XMSrqoO5NJCtcbdW1wnIKwmdkbpZ8We2IWbjrVIEDg+FJCmbIE?=
 =?us-ascii?Q?5UtPaeYd+Sjb4q3CyHsNt9KxJBH6OSKGnjRpfkAxhzUquIj6UR8d3LX0+xjS?=
 =?us-ascii?Q?kKNpiVIVFWOgEqheSP0jI3+pJiB63S/odBlz+u7IM0RhUDhAhGaq3l9aRZN6?=
 =?us-ascii?Q?6nf6kZMKvZQejSyWvaafEyI2kmY8a/sSxhuM5ycblLydPaUamu9SgmoSfFMD?=
 =?us-ascii?Q?SkJZblgHz6Yh0w6JMJPa3VQ3IovezKs3rSHGq9N4nmEB/5p58vtbm4KmdXxD?=
 =?us-ascii?Q?MwgFTOYMXMVeRJXp6DpRTNPZqF5/sY5EK7vvNON/uwjbGfQRvy04UJ2gMvhq?=
 =?us-ascii?Q?iBYx148hYI6/u8cHHe7cKCyYOdfdkIOGNzNg3E8nGe5G+EGY2Ge4hSdMrva1?=
 =?us-ascii?Q?dGxQFL+AkHQxvxzOo9UyRpZiIhwaA1F27V8vRvc2Jgr8PmU2jM7PsV3o2XXx?=
 =?us-ascii?Q?dP/aNuAeIQIcA6ONCCXj3XgUGXpAZJAHOCooceuUihVbp0ndegyhmlH/F3IA?=
 =?us-ascii?Q?g5zIwSfZ++dsKdp/H1jPBTUnwIMkda1CdGCuqznfekjQ7YUJ1qs0lVXaVLsW?=
 =?us-ascii?Q?mwvjRy7N+4BGQ1/UeNz7sNfM3Gj5oHhxlzhqRSW2gdoBd+MSaaeAYHcECUCg?=
 =?us-ascii?Q?Zy0By296TazwdpYSIoyJTiG85rneDKUJ82smsTXay41+79GBl9dz1heXi9g5?=
 =?us-ascii?Q?cYknsfLNt5BphfOGk2OPP65N/DfN79Nl4nX3Dh+WLQ4bWa3fCTxn7/Pr26ED?=
 =?us-ascii?Q?n0ev8PLX5TwO852SjjpXPCwUOdErpmxcV9n4HqwNURvN1YHWcccguIwqDRbz?=
 =?us-ascii?Q?jLccJr0LYMl2VANgfx7WJVFfWIYfvdl2Z2J64RYcVDIAA5q6iBg91dmei901?=
 =?us-ascii?Q?lWswkq2XleOjD0kg4P+eqK5xWa4mVe3ySTi+80GNQxA6Qqm3P7FwRHHguzlL?=
 =?us-ascii?Q?zAOMPKdvXzwv9HCEeaNOn5h8GII06fL/9eEwvqC5fwbxkgtcKA0WV/AO+kwJ?=
 =?us-ascii?Q?LHOlPWmJITfVG3pWBkKaCCjWDRny+BXgeR7zNazCiUBUGgTRTkIrTSqgoZE9?=
 =?us-ascii?Q?f8SXXM4AXJ3lgSsJTz5mB0iwvRwizy9y3i9BTCqmNWfX2oIRiuqgCSoAXLtR?=
 =?us-ascii?Q?madYhvlV5EiAQm1ig6fOUorwo4dC91vTEMxMS5MdEpC0FITosAW1n2nBfFW/?=
 =?us-ascii?Q?hY6jZGNQc68CRWbe8pFN78Bl2UE9EQPk3+6RbsbLjHo2GcYNT33vEcZWYxQg?=
 =?us-ascii?Q?JdynOOZuxUv8FOLA8PJ7TETgM99qQsEUDkl0d/AceZI17ak1JtQLYov3R3KO?=
 =?us-ascii?Q?ok2SQRd0rcmtOcC+o/q1bucJXXZVVUfY+wG2rXeiitHdzntfnj4/qoddWEdf?=
 =?us-ascii?Q?a62ksA=3D=3D?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c0c082e7-cde5-41fe-4375-08d9ea582a15
X-MS-Exchange-CrossTenant-AuthSource: AM9PR08MB6737.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Feb 2022 16:37:43.4318 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2wpt49Lp9pGhe2SnRzAWczdKmkcInfO0+FGd3utki7E3xHkpc8ARNBSuUIwOx9C0akl+zR+Hnf3xn4Jsj0d9vZ7lBIjpVHWeo2PwkRxBtB0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0802MB2288
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a01:111:f400:7e1b::716
 (failed)
Received-SPF: pass client-ip=2a01:111:f400:7e1b::716;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR05-AM6-obe.outbound.protection.outlook.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
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

Implement new API, so that qcow2 supports blockdev-del with
force=false.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 include/block/block.h |  2 +
 block.c               |  4 +-
 block/qcow2.c         | 85 ++++++++++++++++++++++++++++++++++---------
 3 files changed, 72 insertions(+), 19 deletions(-)

diff --git a/include/block/block.h b/include/block/block.h
index 42d78a7a31..fbb5f3ff6d 100644
--- a/include/block/block.h
+++ b/include/block/block.h
@@ -672,6 +672,8 @@ void bdrv_disable_copy_on_read(BlockDriverState *bs);
 void bdrv_ref(BlockDriverState *bs);
 void bdrv_unref(BlockDriverState *bs);
 void bdrv_unref_child(BlockDriverState *parent, BdrvChild *child);
+int bdrv_unref_child_safe(BlockDriverState *parent, BdrvChild *child,
+                          Transaction *tran, Error **errp);
 int bdrv_try_unref(BlockDriverState *bs, Error **errp);
 BdrvChild *bdrv_attach_child(BlockDriverState *parent_bs,
                              BlockDriverState *child_bs,
diff --git a/block.c b/block.c
index 187732c6f8..dd2ddedc86 100644
--- a/block.c
+++ b/block.c
@@ -3216,8 +3216,8 @@ static void bdrv_unset_inherits_from(BlockDriverState *root, BdrvChild *child,
  * When @tran is not NULL, first failure is returned and the action may be
  * rolled back.
  */
-static int bdrv_unref_child_safe(BlockDriverState *parent, BdrvChild *child,
-                                 Transaction *tran, Error **errp)
+int bdrv_unref_child_safe(BlockDriverState *parent, BdrvChild *child,
+                          Transaction *tran, Error **errp)
 {
     if (child == NULL) {
         return 0;
diff --git a/block/qcow2.c b/block/qcow2.c
index 8ad555feb7..a8f891ee34 100644
--- a/block/qcow2.c
+++ b/block/qcow2.c
@@ -2740,23 +2740,24 @@ static int qcow2_inactivate(BlockDriverState *bs)
     return qcow2_do_inactivate(bs, true, &error_abort);
 }
 
-static void qcow2_close(BlockDriverState *bs)
-{
-    BDRVQcow2State *s = bs->opaque;
-    qemu_vfree(s->l1_table);
-    /* else pre-write overlap checks in cache_destroy may crash */
-    s->l1_table = NULL;
+typedef struct Qcow2CloseState {
+    BlockDriverState *bs;
+    void *old_l1_table;
+} Qcow2CloseState;
 
-    if (!(s->flags & BDRV_O_INACTIVE)) {
-        qcow2_inactivate(bs);
-    }
+static void qcow2_close_commit(void *opaque)
+{
+    Qcow2CloseState *cs = opaque;
+    BlockDriverState *bs = cs->bs;
+    BDRVQcow2State *s = bs->opaque;
+
+    qemu_vfree(cs->old_l1_table);
 
     cache_clean_timer_del(bs);
     qcow2_cache_destroy(s->l2_table_cache);
     qcow2_cache_destroy(s->refcount_block_cache);
 
     qcrypto_block_free(s->crypto);
-    s->crypto = NULL;
     qapi_free_QCryptoBlockOpenOptions(s->crypto_opts);
 
     g_free(s->unknown_header_fields);
@@ -2766,15 +2767,65 @@ static void qcow2_close(BlockDriverState *bs)
     g_free(s->image_backing_file);
     g_free(s->image_backing_format);
 
-    if (has_data_file(bs)) {
-        bdrv_unref_child(bs, s->data_file);
-        s->data_file = NULL;
-    }
-
     qcow2_refcount_close(bs);
     qcow2_free_snapshots(bs);
 }
 
+static void qcow2_close_abort(void *opaque)
+{
+    Qcow2CloseState *cs = opaque;
+    BlockDriverState *bs = cs->bs;
+    BDRVQcow2State *s = bs->opaque;
+
+    s->l1_table = cs->old_l1_table;
+}
+
+static TransactionActionDrv qcow2_close_drv = {
+    .commit = qcow2_close_commit,
+    .abort = qcow2_close_abort,
+    .clean = g_free,
+};
+
+static int qcow2_close_safe(BlockDriverState *bs, Transaction *tran,
+                            Error **errp)
+{
+    BDRVQcow2State *s = bs->opaque;
+    int ret;
+    Qcow2CloseState *cs = g_new(Qcow2CloseState, 1);
+
+    *cs = (Qcow2CloseState) {
+        .bs = bs,
+        .old_l1_table = s->l1_table,
+    };
+
+    /* else pre-write overlap checks in cache_destroy may crash */
+    s->l1_table = NULL;
+    if (tran) {
+        tran_add(tran, &qcow2_close_drv, cs);
+    }
+
+    if (!(s->flags & BDRV_O_INACTIVE)) {
+        ret = qcow2_do_inactivate(bs, !tran, errp);
+        if (ret < 0 && tran) {
+            return ret;
+        }
+    }
+
+    if (has_data_file(bs)) {
+        ret = bdrv_unref_child_safe(bs, s->data_file, tran, errp);
+        if (ret < 0 && tran) {
+            return ret;
+        }
+    }
+
+    if (!tran) {
+        qcow2_close_commit(cs);
+        g_free(cs);
+    }
+
+    return 0;
+}
+
 static void coroutine_fn qcow2_co_invalidate_cache(BlockDriverState *bs,
                                                    Error **errp)
 {
@@ -2793,7 +2844,7 @@ static void coroutine_fn qcow2_co_invalidate_cache(BlockDriverState *bs,
     crypto = s->crypto;
     s->crypto = NULL;
 
-    qcow2_close(bs);
+    qcow2_close_safe(bs, NULL, &error_abort);
 
     memset(s, 0, sizeof(BDRVQcow2State));
     options = qdict_clone_shallow(bs->options);
@@ -6043,7 +6094,7 @@ BlockDriver bdrv_qcow2 = {
     .instance_size      = sizeof(BDRVQcow2State),
     .bdrv_probe         = qcow2_probe,
     .bdrv_open          = qcow2_open,
-    .bdrv_close         = qcow2_close,
+    .bdrv_close_safe    = qcow2_close_safe,
     .bdrv_reopen_prepare  = qcow2_reopen_prepare,
     .bdrv_reopen_commit   = qcow2_reopen_commit,
     .bdrv_reopen_commit_post = qcow2_reopen_commit_post,
-- 
2.31.1


