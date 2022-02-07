Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FC7A4AC668
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Feb 2022 17:51:52 +0100 (CET)
Received: from localhost ([::1]:59604 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nH7Ez-0004EK-1W
	for lists+qemu-devel@lfdr.de; Mon, 07 Feb 2022 11:51:49 -0500
Received: from eggs.gnu.org ([209.51.188.92]:47272)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1nH71W-0001uj-V6; Mon, 07 Feb 2022 11:37:55 -0500
Received: from mail-am6eur05on2101.outbound.protection.outlook.com
 ([40.107.22.101]:1216 helo=EUR05-AM6-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1nH71R-0005Gz-1S; Mon, 07 Feb 2022 11:37:54 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eLzMV2jWpX9n8Xt/xEIrlqQ0b/RKk4fbSwkSRMEcmoXl1WxG50WNj/PYql3rFO1xHSh8SaIlhCncibjPyTTB58/cNxeTygn2d4l3Juz97rTtu5i8CMwGNp+Q+lKFh9rn11o/MYJH3vmcjFAQmaX0LyuvQSak8lJDJWtr0KkL09kCNaQLbRSUrJxuJ7Qy3BI0mbOcAfUmVfSrTK5aYAaAdFvSuslshT1hCBt/Sqm+6V9mGvv/1DpEvwFQA27QbGGWLeuP+mSKqRXNq/F0jObRDTkgw5hWtP54R9Rnr1Vf4pyTB521wAS3zKFY0BIP0dekuFrwJ35j/tYfmIV1eClkXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HieOdbkksE1iny0YXh1qWbUuWw+LwUAx3dDPEYDN6vo=;
 b=eLKQwCSUT/z7fwG/4R+kQ81rc/vwQ9M/pyTelK5gKO9LxuZhAsps7BY0TP3+nRJAe0hM03dDgDKz6x1yAiWJcxA8gSOikvTMyDwn6SrfXU7OBodEOo0fVYSoRKuQKFFfqIUNfQYh7ke+uAnDn/6l213lw9gI8a/+7ue8TdtAkAh0sRcsUbW921RJaVVXY0VTMOJNOMFmMWoz0Ia6UODAH2pC2nQvLP0FYnHyC35ZYofCCIMXJZMRES67Qyg8zhqacQJ7d2KT1Dpdt9RRZ6ldhYj4bVZyJQ/HNhiRtXCBmNlAdosto9S20mS8NBC5ZHU2jDlwwWhp+Td2FsEl43pQVg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HieOdbkksE1iny0YXh1qWbUuWw+LwUAx3dDPEYDN6vo=;
 b=V8n7y3sAbGRrYD6/WLsj2YBGXCVTCXLHCudqgKJ8vocjN1hjLosG/ZCNR1ljHrDNsJE3r0sZ3VcJSuMmRXp9Ef2+GBVZc5Wri+8S/KOQBuCW1HfayAaO6G4UNROqbndiplq3RNpzCxSIkcp8FGaK9pYslij+v3WQgk1e/vrNqQM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from AM9PR08MB6737.eurprd08.prod.outlook.com (2603:10a6:20b:304::18)
 by VI1PR0802MB2288.eurprd08.prod.outlook.com (2603:10a6:800:a6::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.17; Mon, 7 Feb
 2022 16:37:39 +0000
Received: from AM9PR08MB6737.eurprd08.prod.outlook.com
 ([fe80::49c:67e9:3e24:8714]) by AM9PR08MB6737.eurprd08.prod.outlook.com
 ([fe80::49c:67e9:3e24:8714%4]) with mapi id 15.20.4951.018; Mon, 7 Feb 2022
 16:37:39 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, armbru@redhat.com, jsnow@redhat.com,
 vsementsov@virtuozzo.com, eblake@redhat.com, hreitz@redhat.com,
 kwolf@redhat.com, den@openvz.org, ktkhai@virtuozzo.com, igor@virtuozzo.com
Subject: [PATCH 03/14] block: bdrv_refresh_perms(): allow external tran
Date: Mon,  7 Feb 2022 17:37:17 +0100
Message-Id: <20220207163728.30362-4-vsementsov@virtuozzo.com>
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
X-MS-Office365-Filtering-Correlation-Id: fd1b0d81-fc74-44b1-fa40-08d9ea58279c
X-MS-TrafficTypeDiagnostic: VI1PR0802MB2288:EE_
X-Microsoft-Antispam-PRVS: <VI1PR0802MB2288DF3BC847156A07B36CA5C12C9@VI1PR0802MB2288.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2733;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: yxdNlglfe8D1E7LMsX3LGlYAPfbplA5Ggd07jBYIgksrGpXUNEZGtf684CWgKv5ICGDzWUK6MsnjEN2XXAUmuXc4eXHC56fofxcMZULUuqjsOf6SeewK6jHf6tcpaNF1OH2tGfwO2ovU5wHqH8GCdKO9yUxBHZ8H3gNTaKrXv9VtO13lfr+juydgvYWWX8DebMNpLok8Qj0HR+O2wBnD9WGZmLKvUpqe7szux1Zkl/Sfl0FvPR4TJjlBbOL5UjAxIMuMe2xH7M5nrHKHdO4DdqDsMvdMgrcy36dVO/wv4Ykwx50h6huqDTAbPUaW6j54Jmu2yAHcAgVPybYHkS305f1mAjVJv/B303fhaaikJ34PSAxY5ev/XyjEDLx6dENMQSY2oJg5OVlARe3oy1zYAmKYskMJ/qdbqkgh4V85Ts3V4yymyQMu6j9q/+6IUXwMVF7qcOlUQm/TktvqF9LA7SpV3b4TrFHCJoVnYFnGSGVY/rOhJ1AQeSVIPVPpVUxcpYuT5SJ2HNQ5mrFhES0jUQ1jWA1NoHGrHQ8yzWGmDrkkMRMmYg8V9kksHp2bCk7fUIAVuotLd4q589Y+pbybcWvJB7bx/emCmWZON83nAbM3hPD8EBJ2Bp8pn//Vm17JbAkswl4oKgUVyEpbNrxKTvushyD5ED9LeBAUFIcsTE/6WQNSZnJWg+tI5q0RwgQWqu9dHDv6XEQfoGfsCaI9Ew==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM9PR08MB6737.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(36756003)(66946007)(66556008)(8936002)(8676002)(38100700002)(83380400001)(66476007)(5660300002)(6916009)(4326008)(2906002)(508600001)(26005)(1076003)(186003)(86362001)(6486002)(38350700002)(2616005)(107886003)(6512007)(6506007)(6666004)(316002)(52116002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?QefhUzMB5+my2LDaYXzMPal73xDWGZbpCYlIIWqbnl/LJplZvRnqXL29mzSj?=
 =?us-ascii?Q?55lax9DmHdtTsniCMNLhbT7HIQCV7AK9N2DfMB4azE15d0Ccy5FlWiU1qVsr?=
 =?us-ascii?Q?Jgu0upgU/R2HTuy9xt6oJkyaMgVH7sGisE3QDSFZqCjjog8D0bkPvO8+vQky?=
 =?us-ascii?Q?/pNesNyz/ccBpLOTxq+SMnfWfzh5rWHZcaxRcpXP2bN4TW21MYqqiOoWEXEu?=
 =?us-ascii?Q?AAo8TTeQRrTJT+4e65LL7zUvMfVEwSQjsTA08Q491fY4kTb9/MeO5ck9JqO0?=
 =?us-ascii?Q?B+bhOflwga4ZY/xW0cJukJUk6EN1d7YrxNKkbkWDhF8C+GMGMWz2bfaYYvZl?=
 =?us-ascii?Q?pSOXkvpJDFmCY8fLULDyJ94zEZWCFlEpLMkwi1MhUMdc0/bLfY8PMntvMKBx?=
 =?us-ascii?Q?wKAHUg6BAVcXe6ut07aSQeMkAP6mKR0MP7G9fhjk2UvJdoAhzEGQjyB73c8m?=
 =?us-ascii?Q?mFnJH4DO66It4JRv11ZMWgTsCfvVEa4wy189p6bq/FEfA4MFJs+ei9AZC7gs?=
 =?us-ascii?Q?k/GteUExreH1v6CsaKjDYrnz+MyY8guKVSxaloR+SgoVinb7+54G+XaGWmn0?=
 =?us-ascii?Q?cjU+3sOuAZtwOOKo9jU8PeAQphEJaNCBKEY0BPSlXtVKDDY0MDgG6DWY1MII?=
 =?us-ascii?Q?P4EBg1VrMUskvlmC+P7yC6n+1cA2VQNWJMroa9pGDLO18cvLjvkPFt3zTb2v?=
 =?us-ascii?Q?DQMP1kPKf0N3DFlpJAeaV3ALpDkXdGN5BfzINJfIOkFG4aE99kfNgBjC/e0n?=
 =?us-ascii?Q?AZ+Dz8aQO64E4jEowe0of+Oz9snKX9jn+FQY4SsFx0xTSJNR/t5Ap/rvA7cj?=
 =?us-ascii?Q?p31smt9t38z2NjO3+oogUHXsL2VaSkKeZD1RyKx+TtPUdvA4uPW4nYOPpMqb?=
 =?us-ascii?Q?y0Uz9hv/kTjdk5bKE7unNYYi0kUHQuNSVi6XoXhLUfV0lDBH8P67XEfmlN7W?=
 =?us-ascii?Q?GaTsAC/bYTF3ms4ArMprZZ18UxENj+bBXkOywIEBnV5+f/vxcWHuewQIlp3k?=
 =?us-ascii?Q?RoEWnUJ+sGPy0QdLYv/WIp6xzCWya/zTM1meTfrlZfujmYmxGDEADtCMNnSi?=
 =?us-ascii?Q?VzLH0hj/pZ36lvvuRjcYNzl76XCo4d/cXZVLB6aHxXuTdENb+5iwEOB0akd4?=
 =?us-ascii?Q?6j+S7rINkfzlcLdMUN/IgwoOaG5EQVDGR89MIO6JmcLxpQHfTJECrHo3ucPs?=
 =?us-ascii?Q?u+u533v88XI6qkq6Uu+rm9gDVLaKlUjwvrl55kUVnDeIN0TGsEIE4bLuDvCN?=
 =?us-ascii?Q?4+9p0zgg1JBmjWXAlst+AZlbsEEO2PPdNMMIX397EdWVV30/X3UZDGcUa8kK?=
 =?us-ascii?Q?2JixAGfflTqvmsDhTdTVa9/Wc7ZCi/kuntqUl+tsILGb6pRez0zL1fne8sxq?=
 =?us-ascii?Q?GmkmUI7i7nfCeDS5w+7qe/7D036l3+uZX7BIGclzpaKtu0KMBNuj/KjlwjUv?=
 =?us-ascii?Q?qdI2oDXfgvJngov9SFW7ZSjdfHkrC/cQXz2f8ctTq46ZSJPgNMoxe+VmIZz0?=
 =?us-ascii?Q?nn1o+Adu9rb9JtF5Hd5BGIoqOBp+KtJUquqGIwd42acZ9Cy17dM436+YaRUG?=
 =?us-ascii?Q?RbAt2d493s6FFAu7EC/Fe+jRnLbUmcQtRta/QEFk48/J6M8iq/Vj4evMhppt?=
 =?us-ascii?Q?6Cn/VbAZokXp68DVY+iOcBm79dAIlp6QIRUc6hjcFKU3lzGM+6KUrY83mmYM?=
 =?us-ascii?Q?EsMoew=3D=3D?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fd1b0d81-fc74-44b1-fa40-08d9ea58279c
X-MS-Exchange-CrossTenant-AuthSource: AM9PR08MB6737.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Feb 2022 16:37:39.3037 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rGKHQLc72v4gZDXjCtnuq9DUAIkp1z7AoqIzTj1yVaAJGR2Q1wP+mrJy/QrevRpSZiOOE/vQr7IJ0EaMdkqCLjiKLFu3YTDGs7sPqdveygU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0802MB2288
Received-SPF: pass client-ip=40.107.22.101;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR05-AM6-obe.outbound.protection.outlook.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

Allow passing external Transaction pointer, stop creating extra
Transaction objects.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 block.c | 31 ++++++++++++++++++++-----------
 1 file changed, 20 insertions(+), 11 deletions(-)

diff --git a/block.c b/block.c
index 378841a546..7b65c7c5c0 100644
--- a/block.c
+++ b/block.c
@@ -2475,14 +2475,23 @@ char *bdrv_perm_names(uint64_t perm)
 }
 
 
-static int bdrv_refresh_perms(BlockDriverState *bs, Error **errp)
+/* @tran is allowed to be NULL. In this case no rollback is possible */
+static int bdrv_refresh_perms(BlockDriverState *bs, Transaction *tran,
+                              Error **errp)
 {
     int ret;
-    Transaction *tran = tran_new();
+    Transaction *local_tran = NULL;
     g_autoptr(GSList) list = bdrv_topological_dfs(NULL, NULL, bs);
 
+    if (!tran) {
+        tran = local_tran = tran_new();
+    }
+
     ret = bdrv_list_refresh_perms(list, NULL, tran, errp);
-    tran_finalize(tran, ret);
+
+    if (local_tran) {
+        tran_finalize(local_tran, ret);
+    }
 
     return ret;
 }
@@ -2496,7 +2505,7 @@ int bdrv_child_try_set_perm(BdrvChild *c, uint64_t perm, uint64_t shared,
 
     bdrv_child_set_perm(c, perm, shared, tran);
 
-    ret = bdrv_refresh_perms(c->bs, &local_err);
+    ret = bdrv_refresh_perms(c->bs, tran, &local_err);
 
     tran_finalize(tran, ret);
 
@@ -2976,7 +2985,7 @@ BdrvChild *bdrv_root_attach_child(BlockDriverState *child_bs,
         goto out;
     }
 
-    ret = bdrv_refresh_perms(child_bs, errp);
+    ret = bdrv_refresh_perms(child_bs, tran, errp);
 
 out:
     tran_finalize(tran, ret);
@@ -3014,7 +3023,7 @@ BdrvChild *bdrv_attach_child(BlockDriverState *parent_bs,
         goto out;
     }
 
-    ret = bdrv_refresh_perms(parent_bs, errp);
+    ret = bdrv_refresh_perms(parent_bs, tran, errp);
     if (ret < 0) {
         goto out;
     }
@@ -3041,7 +3050,7 @@ void bdrv_root_unref_child(BdrvChild *child)
          * we're loosening restrictions. Errors of permission update are not
          * fatal in this case, ignore them.
          */
-        bdrv_refresh_perms(child_bs, NULL);
+        bdrv_refresh_perms(child_bs, NULL, NULL);
 
         /*
          * When the parent requiring a non-default AioContext is removed, the
@@ -3277,7 +3286,7 @@ int bdrv_set_backing_hd(BlockDriverState *bs, BlockDriverState *backing_hd,
         goto out;
     }
 
-    ret = bdrv_refresh_perms(bs, errp);
+    ret = bdrv_refresh_perms(bs, tran, errp);
 out:
     tran_finalize(tran, ret);
 
@@ -5067,7 +5076,7 @@ int bdrv_append(BlockDriverState *bs_new, BlockDriverState *bs_top,
         goto out;
     }
 
-    ret = bdrv_refresh_perms(bs_new, errp);
+    ret = bdrv_refresh_perms(bs_new, tran, errp);
 out:
     tran_finalize(tran, ret);
 
@@ -6297,7 +6306,7 @@ int coroutine_fn bdrv_co_invalidate_cache(BlockDriverState *bs, Error **errp)
      */
     if (bs->open_flags & BDRV_O_INACTIVE) {
         bs->open_flags &= ~BDRV_O_INACTIVE;
-        ret = bdrv_refresh_perms(bs, errp);
+        ret = bdrv_refresh_perms(bs, NULL, errp);
         if (ret < 0) {
             bs->open_flags |= BDRV_O_INACTIVE;
             return ret;
@@ -6422,7 +6431,7 @@ static int bdrv_inactivate_recurse(BlockDriverState *bs)
      * We only tried to loosen restrictions, so errors are not fatal, ignore
      * them.
      */
-    bdrv_refresh_perms(bs, NULL);
+    bdrv_refresh_perms(bs, NULL, NULL);
 
     /* Recursively inactivate children */
     QLIST_FOREACH(child, &bs->children, next) {
-- 
2.31.1


