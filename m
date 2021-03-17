Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 327AD33F3C1
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Mar 2021 15:58:33 +0100 (CET)
Received: from localhost ([::1]:36744 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lMXd2-0003io-7V
	for lists+qemu-devel@lfdr.de; Wed, 17 Mar 2021 10:58:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34874)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lMXI7-00051B-Ky; Wed, 17 Mar 2021 10:36:55 -0400
Received: from mail-db8eur05on2128.outbound.protection.outlook.com
 ([40.107.20.128]:5633 helo=EUR05-DB8-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lMXI4-00079x-G2; Wed, 17 Mar 2021 10:36:55 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aoUtafF9wBMqGoCNcNnTcZ0/qzVIdlz04v3L0Pnprbzf6qUgJApVNm0lzO10sjNC7Xa03A2TCU1XzpeHNnRmA2+jXjB6Z1VTzVrPA0PRPe7Qm6Q67L1nuSlsG8ev7Il63gem2J0Wycah4r+YSPUghbLN3bRzAuXGOoc01Z6zK86h40aZNC0V54nuFE86mg/NDllzI52bNWVrmiYCrZ3Zbtsd2sWqGWy3gU/e/DFjVxVEioUBvc4CDBV4y1x1bQlN4cFOnp0vCXl8VVi2IsX9V9+epfT9grzHSNv/bRcnWsuhO1EUai7ImfrXDtpPmo/R+fZvghwuVK51k0htvwi3gA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=m3MXzNqxeJCyhZrks/haO4bm+EYiBFvcPQM/a6hLQ30=;
 b=oARym8Iugi9JrqiQsr9M/ZpjkOUJ8gmIZ66gUpmY4fnFQgeEVAXEjXX0cMlnC4m1+G0Zk4a1spN/aKDole7IjhdPTomvIdRfQJb5w+DA1rP/wbpkQkQJNXciZbO4laUAVX/e15HtHyvKuaCNDUsHtYS9/y57rDsE+S3XeYSZ+qpwo4IgEBN2DPdwTSJiIGRIBGMFwz4T1H2sD7aqkbgANJ/wa/bU0n7bv8NGfsurP+/Ip0KkmU76OBVgrfuqJBRl46HGQubsxa93hH3gaM5+R6viRxzYRg1t9B2j8DYaN6QYME1d+rEr0Lo6uyiLb4WiZh6d9WfaAz4P/172JFjI5A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=m3MXzNqxeJCyhZrks/haO4bm+EYiBFvcPQM/a6hLQ30=;
 b=kmqAHTscgyAWoJL954B9K0JnYcka8p3upO9GxdpBatAesUM7Pq/T/96NcHeoVS8roy+wUKQ5YjUTmyyDO+EMRK8s2MQUfx2fW8orsUkQfR7pd7bjGi/cvR0MtLydBoLdPzPn+/9/d99mOd1ecwdseaRL1OVIPpjhSMUQd7PNntw=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AS8PR08MB6216.eurprd08.prod.outlook.com (2603:10a6:20b:29c::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3933.32; Wed, 17 Mar
 2021 14:36:42 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f1f0:6610:11f5:5e4a]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f1f0:6610:11f5:5e4a%8]) with mapi id 15.20.3933.032; Wed, 17 Mar 2021
 14:36:42 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, armbru@redhat.com, fam@euphon.net,
 stefanha@redhat.com, vsementsov@virtuozzo.com, jsnow@redhat.com,
 mreitz@redhat.com, kwolf@redhat.com
Subject: [PATCH v3 27/36] block: make bdrv_refresh_limits() to be a
 transaction action
Date: Wed, 17 Mar 2021 17:35:20 +0300
Message-Id: <20210317143529.615584-28-vsementsov@virtuozzo.com>
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
 15.20.3955.18 via Frontend Transport; Wed, 17 Mar 2021 14:36:41 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c9df5a96-9a71-4817-0c2a-08d8e95214e4
X-MS-TrafficTypeDiagnostic: AS8PR08MB6216:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AS8PR08MB62161EBD78A8A08D37EBA37BC16A9@AS8PR08MB6216.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: pVFbqQNSqdr07ISsczpbrLgZPWnZKjB/EgGREsHaiP/VRShKIpJWjwh37kZEcKZYX/UTygPU3Q0D9uTDPLTXP4M+46WuuuePdXcaRdm/fte9yFyBm4vIsibaS5lX35ve/Uy6T3l/JMRU9iZnBYYsXayI0BWPFwRuqUxouRVVE0LpgCWZNK9bvcee2zbKyz8oEgK8hNoiwDDQ3z5Y43NZdEtP4FQznvW6Uq1OFPe81kzPhf83u6ysSLgoIO6iVUprmFL89sdbNlDayIWZMtekt8UVTxmFtKQGyfrN7U8CAs3MPnAmyOY0SjE9Rfi7h7B0zQgIb/cD7wWyDF9ZwiXGKGZL/+cCzhcC0GgNtv0bRcdywfBVdo9raDUD64L2PwiNcELMGczFQ1p8Ne1OKgB8LkSfZfWY3RGtDH9np4wWfYGeCeN4HFhBHhMmXREac8224ogTbUDKqWWA7Uq/hqM75F6Y3fA7BcM53oicu7ccJsRj5jxJebG0mqgN5RpZSLaDMXZz9aevQ2PNZLpYWi2JlRKupODVvuobVFYK7SJ4wYd143fqv5zwtQIRrGUInsqqLXbtDRBeCoBEZw8KJ8iHLxiqgsQd7ZDG+v/SWcxoc8TSBxyu8fAadZ6tz8CE23z1
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(366004)(346002)(376002)(39840400004)(136003)(6916009)(83380400001)(316002)(2616005)(66946007)(6512007)(66556008)(8676002)(956004)(26005)(1076003)(16526019)(6486002)(186003)(4326008)(36756003)(8936002)(2906002)(6666004)(5660300002)(478600001)(86362001)(66476007)(6506007)(52116002)(69590400012);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?7kakRSDuuUlmeNHlB0xYSTGH/VtS3oF+ZVUIV9+NP3pb1u18ulII2ajPKpuF?=
 =?us-ascii?Q?yt5CVoYjnBOn4VrJGXdh2CZIDmY7ZHanHqGIbIZRHmE8pB1zHl7qi6/a863K?=
 =?us-ascii?Q?wQ2BftDoZVxwmqUGykpZyJkl3ly93Q3lK2B3rQdZke1bNIboPf+70MZGQ6YL?=
 =?us-ascii?Q?UFVxZ7zgSHNpqu826KZ+TJtN5SQpBhfoF2hezFX65mYG2wC04FxQZ9Bd4/FA?=
 =?us-ascii?Q?E5/BqEu3KDXEKr17eSxGrm6q5D8tfvzapVxWPYmZSTrvWUv6ee+coeLeB58m?=
 =?us-ascii?Q?KgwfbfwEerZF1dXZfB8+2GqFep2IrTuCDoZt+0HwgAWlyziz2nAYOP5MPqAY?=
 =?us-ascii?Q?W8N1c+HrIRIRH2BmEvgTZ+DweYK4eglfZJ//WV0L111Krl0wOCMfEl9QmJBm?=
 =?us-ascii?Q?lM3e6u6TNVc89Q7x1+DN3gPzTouAGwX9pePMFe0UmjrC/R2isHPV4/ZEmzG9?=
 =?us-ascii?Q?i2x2LDHa0eGbZksnxRAavfh5e+tW1H43xkoDjCBRYM5K5TdUA6e6WlTsqDti?=
 =?us-ascii?Q?i1D6sLXgZ8ZdJzwnqXPwwmIPK44vrn+NVoJ+/Useib1/iHdYkuNzh1KNjpoy?=
 =?us-ascii?Q?WU2zDwGlrUmS+jZNG6s53CzVvWCBEtTbAEQ3pvnrZjqTw3BUFsVxxxXqlg7M?=
 =?us-ascii?Q?jBOD+f1ahdHmrKBvNqP9V5SP8KDrHk+in8+mshCgRGyF5KgGLNWFhOoRYJj+?=
 =?us-ascii?Q?RUBo3I6V3kejegnCbmNq2F8esEV6e1nk+RMyvXfFI/xUtg8gikPXylxcQKHU?=
 =?us-ascii?Q?iQZG6ex7hjK+RuVbPWsbWn0K+pONYnbaS39rCPIujC9iJi1mrJ5Rj5mJ8bEu?=
 =?us-ascii?Q?x2o1F9oBbsUUNCBjFT9zz6tgJjsgX471YR7Sgb6LVQE6H74qtMWi+SOW7o+1?=
 =?us-ascii?Q?byJoFiSWDzLKuCQRtq6VO/DN3G/L3rbDBQGxZLdcxMWawBnJ0wREGqTDI4Ey?=
 =?us-ascii?Q?9UfWwFEKBxpZbGyCeO4fz2tktJ3YCzUxAENz1rW4CkOTvkJCjhRUprZrP1Rv?=
 =?us-ascii?Q?bwimizRZYgTKCFbVlUEuvVCo4PpHSOFtesQo+S0u09bph+l8Ts7rzGKh3vSX?=
 =?us-ascii?Q?F64Qu0JMZxLSL4FtCOPPjKdn30sWVQ88LrsdbpEVvizZ/MiJJw6VQr/U8P1k?=
 =?us-ascii?Q?/KGks2qXZARkspF8FLuE7woomPqkXhSxZ0fyF931HXzwGJUJxn7DMmVt/jge?=
 =?us-ascii?Q?26ubHVc9lC79OMOe5J1wDOF7Iv2bLaxg1ir/7fQolU/iM+8R4w7g5Qbmi7sr?=
 =?us-ascii?Q?dc03h0AiZTOJrRyiNAWhJDbch6kY9Kfml4f/AZM0Adaw+Uv2NFxXAr5eb6Oh?=
 =?us-ascii?Q?CX7LmRKlu6nDRFdJbRgyJdei?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c9df5a96-9a71-4817-0c2a-08d8e95214e4
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Mar 2021 14:36:42.1558 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pJm0/qURiUrBf8+Itpz73oyeeElLTwapm2x+W9TIEngZY24OQIyJxX1AfIIMVHXObFQNNoxJHBlXjrFUDNAtSUgybEY7P7utDQuxX4bgktE=
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

To be used in further commit.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 include/block/block.h |  3 ++-
 block.c               |  9 ++++-----
 block/io.c            | 31 +++++++++++++++++++++++++++++--
 3 files changed, 35 insertions(+), 8 deletions(-)

diff --git a/include/block/block.h b/include/block/block.h
index 85481a05c6..ad38259c91 100644
--- a/include/block/block.h
+++ b/include/block/block.h
@@ -9,6 +9,7 @@
 #include "block/dirty-bitmap.h"
 #include "block/blockjob.h"
 #include "qemu/hbitmap.h"
+#include "qemu/transactions.h"
 
 /*
  * generated_co_wrapper
@@ -421,7 +422,7 @@ int64_t bdrv_get_allocated_file_size(BlockDriverState *bs);
 BlockMeasureInfo *bdrv_measure(BlockDriver *drv, QemuOpts *opts,
                                BlockDriverState *in_bs, Error **errp);
 void bdrv_get_geometry(BlockDriverState *bs, uint64_t *nb_sectors_ptr);
-void bdrv_refresh_limits(BlockDriverState *bs, Error **errp);
+void bdrv_refresh_limits(BlockDriverState *bs, Transaction *tran, Error **errp);
 int bdrv_commit(BlockDriverState *bs);
 int bdrv_make_empty(BdrvChild *c, Error **errp);
 int bdrv_change_backing_file(BlockDriverState *bs, const char *backing_file,
diff --git a/block.c b/block.c
index 3b9681a738..03a1f02e5b 100644
--- a/block.c
+++ b/block.c
@@ -49,7 +49,6 @@
 #include "qemu/timer.h"
 #include "qemu/cutils.h"
 #include "qemu/id.h"
-#include "qemu/transactions.h"
 #include "block/coroutines.h"
 
 #ifdef CONFIG_BSD
@@ -1543,7 +1542,7 @@ static int bdrv_open_driver(BlockDriverState *bs, BlockDriver *drv,
         return ret;
     }
 
-    bdrv_refresh_limits(bs, &local_err);
+    bdrv_refresh_limits(bs, NULL, &local_err);
     if (local_err) {
         error_propagate(errp, local_err);
         return -EINVAL;
@@ -3328,7 +3327,7 @@ int bdrv_set_backing_hd(BlockDriverState *bs, BlockDriverState *backing_hd,
     }
 
 out:
-    bdrv_refresh_limits(bs, NULL);
+    bdrv_refresh_limits(bs, NULL, NULL);
 
     return ret;
 }
@@ -4812,7 +4811,7 @@ static void bdrv_reopen_commit(BDRVReopenState *reopen_state)
         bdrv_set_backing_hd(bs, reopen_state->new_backing_bs, &error_abort);
     }
 
-    bdrv_refresh_limits(bs, NULL);
+    bdrv_refresh_limits(bs, NULL, NULL);
 }
 
 /*
@@ -5203,7 +5202,7 @@ int bdrv_append(BlockDriverState *bs_new, BlockDriverState *bs_top,
 out:
     tran_finalize(tran, ret);
 
-    bdrv_refresh_limits(bs_top, NULL);
+    bdrv_refresh_limits(bs_top, NULL, NULL);
 
     return ret;
 }
diff --git a/block/io.c b/block/io.c
index ca2dca3007..35b6c56efc 100644
--- a/block/io.c
+++ b/block/io.c
@@ -133,13 +133,40 @@ static void bdrv_merge_limits(BlockLimits *dst, const BlockLimits *src)
     dst->max_iov = MIN_NON_ZERO(dst->max_iov, src->max_iov);
 }
 
-void bdrv_refresh_limits(BlockDriverState *bs, Error **errp)
+typedef struct BdrvRefreshLimitsState {
+    BlockDriverState *bs;
+    BlockLimits old_bl;
+} BdrvRefreshLimitsState;
+
+static void bdrv_refresh_limits_abort(void *opaque)
+{
+    BdrvRefreshLimitsState *s = opaque;
+
+    s->bs->bl = s->old_bl;
+}
+
+static TransactionActionDrv bdrv_refresh_limits_drv = {
+    .abort = bdrv_refresh_limits_abort,
+    .clean = g_free,
+};
+
+/* @tran is allowed to be NULL, in this case no rollback is possible. */
+void bdrv_refresh_limits(BlockDriverState *bs, Transaction *tran, Error **errp)
 {
     ERRP_GUARD();
     BlockDriver *drv = bs->drv;
     BdrvChild *c;
     bool have_limits;
 
+    if (tran) {
+        BdrvRefreshLimitsState *s = g_new(BdrvRefreshLimitsState, 1);
+        *s = (BdrvRefreshLimitsState) {
+            .bs = bs,
+            .old_bl = bs->bl,
+        };
+        tran_add(tran, &bdrv_refresh_limits_drv, s);
+    }
+
     memset(&bs->bl, 0, sizeof(bs->bl));
 
     if (!drv) {
@@ -156,7 +183,7 @@ void bdrv_refresh_limits(BlockDriverState *bs, Error **errp)
     QLIST_FOREACH(c, &bs->children, next) {
         if (c->role & (BDRV_CHILD_DATA | BDRV_CHILD_FILTERED | BDRV_CHILD_COW))
         {
-            bdrv_refresh_limits(c->bs, errp);
+            bdrv_refresh_limits(c->bs, tran, errp);
             if (*errp) {
                 return;
             }
-- 
2.29.2


