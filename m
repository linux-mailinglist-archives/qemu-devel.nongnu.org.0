Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DFDF36DCAA
	for <lists+qemu-devel@lfdr.de>; Wed, 28 Apr 2021 18:06:26 +0200 (CEST)
Received: from localhost ([::1]:55996 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lbmhl-0004Ki-L0
	for lists+qemu-devel@lfdr.de; Wed, 28 Apr 2021 12:06:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58976)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lblyZ-0006FG-Gm; Wed, 28 Apr 2021 11:19:43 -0400
Received: from mail-eopbgr00103.outbound.protection.outlook.com
 ([40.107.0.103]:52805 helo=EUR02-AM5-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lblyX-0001yK-1r; Wed, 28 Apr 2021 11:19:43 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NJP2YG2DdRzBy2qiDl6rDmyRTuQBBZ0xfO91SFcQemwB682EIwBEWP9faMUEEzzh89ClPfLjGcOzMNMVTG7u1Ami4P2VB7VJeN8sSzQ7SVrd2ryBO8ePmHD2lefAHLZtk9LBJtqePyShuqCvk5H39kCErv4Cd6pttZEFH+wqUJApkkhThZCPqSy3nFIJechPhAyUD9nvhtdYZMfTbNsUM1OtlzLqSsqEypTeHnPs2wiJD6HtJLAgJvCbzit0DR/h3ScWdAIEcpJnngh+7+jxWWnRmi605k6TLExlg0IXUWs+DUMt6GUZeXZ2NF4QmKEYv7XQ/DlAZs47DK/4Xyfgag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GroWK5YBZyY7bhC4PxM3ARkpkK86cE3xOgFYTCXiGNQ=;
 b=CQ2A1y/iAA4DfmzEDAU/AVcrqP3YD7gQQRlPHjPWQ0IqDjxtKYRBStLRYnAqPp5p4N/nzHCQmtqH3twTRr5LLvwFKM+CydaLTiVNTE/D4OfU/eUduktPCjvQclIyqBztHNG63UP769dligvi+cGTDJgKb5MR9nTzQHjFdMbw11+y0jYonQAJeaGZclRQrL9d1XAP0aq2qIFyKZnJSuoUbI2OyAwu0VvMz1Arg9AdVnvZVanZek+jZ4kPT1DYfumD/+h0lrE/LHO2maXH9AD9GPWxvB3PTTNwNFRI0E8yMcnSeNLSYrJFDfRdKC7O+IePuwhcxhW/ZuKqkfqOcjx/tg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GroWK5YBZyY7bhC4PxM3ARkpkK86cE3xOgFYTCXiGNQ=;
 b=tlMkmDna9YB0PnhHVdwIe9vi9Ffjh/IFjHc5rKDz8rmq+THmWlO3pI6uMassBEZ98MM+y+6Xukk61ciXyef5wxqftWW9ubSDAvbWVCjFosm5FrlrkixOna8QYLaVUszGTHb6BYB93S3SBCcUG/QuSaBYjN7d/Q/SaIkGJOQEeMI=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AS8PR08MB6151.eurprd08.prod.outlook.com (2603:10a6:20b:290::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4065.21; Wed, 28 Apr
 2021 15:18:53 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133%7]) with mapi id 15.20.4065.027; Wed, 28 Apr 2021
 15:18:53 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, armbru@redhat.com, fam@euphon.net,
 stefanha@redhat.com, vsementsov@virtuozzo.com, jsnow@redhat.com,
 mreitz@redhat.com, kwolf@redhat.com
Subject: [PATCH v4 27/36] block: make bdrv_refresh_limits() to be a
 transaction action
Date: Wed, 28 Apr 2021 18:17:55 +0300
Message-Id: <20210428151804.439460-28-vsementsov@virtuozzo.com>
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
 15.20.4087.27 via Frontend Transport; Wed, 28 Apr 2021 15:18:52 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 84912573-b742-4f1e-1c59-08d90a58eed3
X-MS-TrafficTypeDiagnostic: AS8PR08MB6151:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AS8PR08MB61510A22067282D3AFD7A0EFC1409@AS8PR08MB6151.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: KsPQD2aEMlg/lyvaCkdGjsgGiyA9NWp8dwF/gxS0H3PFqXrc/fdH81mJoi27OVIHUUWY5PxaAbq8f9VKpPpaUu/saS0QVyi2CLgu3u+H5W9UplfOS/Kh+clYtA2jmQztZz1rda66MSD4emWbbkKejUUoOkc+We2DLNeYpW87UWp3KaR8ImdvBvrQHFcOaSp9zCqrjDVH/enbat+PXUgbO5jwYcIaGxgQeNFeUDsAp4sQ+XbR431NEs15FIgY8WClDAiIVX/RjeWIIy/NuxY6XCNT4TVZG9vHCSa5+GOar6D1V9fKo/5u1y0+RhYqGepUPmkNfpB2i9QaTw/NM/74yQuKGIIpsGY610PMlyCM02K/Y/HIH9LhNi9QqYUTPW4D68TFNy4B9iZsnOp4+39sJIqdNIizSCbK0q6cN3sTxEm3ShDRwNK5QIHlfAkRLyrch034SmnMhhWF1Jsaqx5Au9feMRZIi2Ilkbg3D0mhN7iOGvCcTNXQsZflx7M3h4CS4VEORkjPLWwgNl5IgsPvXSEP/ja+k/9SOzSD5UzJ63tnMAowQqyn2OtnMzXBNdZ2EfOJmKjrsEdze/uIdgdBXG7duDlzODeRJAw0hOZdOgfm9UIO24gy72qn2BwR7JpuSUkVmign2/azl9gYctiRTE2hzCI+2fKnL8jJ33B8Il+KxXmHjgODtEYNnPH3mjft
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39840400004)(376002)(396003)(136003)(366004)(346002)(478600001)(52116002)(36756003)(26005)(956004)(86362001)(6916009)(5660300002)(316002)(186003)(6506007)(6512007)(2906002)(83380400001)(16526019)(4326008)(6486002)(66556008)(66476007)(8676002)(66946007)(1076003)(8936002)(2616005)(38350700002)(38100700002)(69590400013);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?7QgC6MoQKCBX/OOzc9aOHGPhNXksYFfi5iAeKvvP5PizAJBs4cCakuIm02Fg?=
 =?us-ascii?Q?8/SluhrCHddipnc/AoMiFZ3u183x/cSw2fcZq1Hu6U9XBYUrQtIO81MwC0K1?=
 =?us-ascii?Q?Cyp47OOxkLPBzfJsLT718QB/ucfxgqsmZpeli2EIUQZ8hDkAasNP+wsfvRXz?=
 =?us-ascii?Q?kVAyzUneG+Jd0EEbwpcGH1c6/ovT7hlvMx92CxcQuyHuFT+Q34w2uKA2c9GF?=
 =?us-ascii?Q?s+ZrlxygSu7Fr9cRBSxeDscvSd8sA0IAJqzng//tl8j2C499yXT7FHtVeafw?=
 =?us-ascii?Q?0k+gNYThkzhb159/IzBgItCyvO8rgUu5Ha+9YJuLAowmAQ5C0ztMiHg74A6A?=
 =?us-ascii?Q?g+kZsLcmi249O27xylgX9CjQe4UWKC3ZWeEft+BVOO4kz4IHZYVHshcqXqgL?=
 =?us-ascii?Q?+KFwFxCtInweeRWyPRqqhDR7epJ4ez+lOf7/wSnTGUgBBgeufMgNBtKKb8Hu?=
 =?us-ascii?Q?suI8i2MNi9XSDZL0qm6/0EIN+KEJqyYRZedznm0h+1NIUXQrZUUAbFAz33IA?=
 =?us-ascii?Q?Pbep+aOQVVjZCfKR1WDAcmOPmFtg/iMfJFVeheJLkEOOUDPNlQrxq8zvK3al?=
 =?us-ascii?Q?LPB4y7C2CgdlpX9LxFWYkz/1Z+M+yVJ2AGpIg3jpx1cXE8tj5+iBWTe7CmGY?=
 =?us-ascii?Q?qcvt6olALssePnmrhmaL5VGjSFxLpCcNKcao0IKMyTLhSQk+Vd/17XrjlN04?=
 =?us-ascii?Q?M69igTO7c2UK196weisxSjBa8HktI3puN5Tjs/k3SwOtq6r1SOPaGHlRayUT?=
 =?us-ascii?Q?frI0Ow1YdBA5MsaTFRf8wOIvIFhTb0okHy2O6SyxhRsHiPIgxxqkjgppvSWL?=
 =?us-ascii?Q?qRbBnLAkmif3bjHHF/h2vQfJmhDflod4HZG0swsPprcie8syAPMkZJ+rzTON?=
 =?us-ascii?Q?Zkm3VcSKAQj0v9dTl77FzBclvA/G5q0nJVtIzE+x7734EGW8YREj7teWBC8j?=
 =?us-ascii?Q?7/hswkvq2rfs8Elaz3ACP+JPU/fRYrriQJSsQyEZFpk1fQo8drVv9rHh2r+t?=
 =?us-ascii?Q?X2ImL+fb5mCKlp3WLe6vqum7NMZ6sfIPn8v4fP0xEh0x35s69dnOoboBct5T?=
 =?us-ascii?Q?zbVfMIvyaCehyzbZy5g9KcMejh/jIFIUAjC1qSw/l/oVGKK+5kJZQZStRPLj?=
 =?us-ascii?Q?TwrKcs/BswUigyc8zSOO9Ec81TUEC0fFhRM86EH0ULaqcvUlrXiKFLWSyJPW?=
 =?us-ascii?Q?jm5Vpcz81pwInhRB5QbvWj55i/kca9RgL8xlMAWipvulKpI+xgBdkjwsH94e?=
 =?us-ascii?Q?jFFupy3xFq9yRHGneYo8gn8qiNl79D8fpiu8t45sKQ/x1isMHn90SaeUT8xk?=
 =?us-ascii?Q?fKKZnaJRgV8F3BMyQVtrSxdl?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 84912573-b742-4f1e-1c59-08d90a58eed3
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Apr 2021 15:18:53.1779 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TjhJahaSn+Q/5UHySfGGhcZb3+OHFw04OZWnPe3xkWfZucA6g85CyPZLosj+ncRAdlGD1D0K6VycjL4bHlsQOFObke28vPQDwTNW0AWCgRM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6151
Received-SPF: pass client-ip=40.107.0.103;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR02-AM5-obe.outbound.protection.outlook.com
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
Reviewed-by: Kevin Wolf <kwolf@redhat.com>
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
index 1dc14908ac..9922943793 100644
--- a/block.c
+++ b/block.c
@@ -49,7 +49,6 @@
 #include "qemu/timer.h"
 #include "qemu/cutils.h"
 #include "qemu/id.h"
-#include "qemu/transactions.h"
 #include "block/coroutines.h"
 
 #ifdef CONFIG_BSD
@@ -1577,7 +1576,7 @@ static int bdrv_open_driver(BlockDriverState *bs, BlockDriver *drv,
         return ret;
     }
 
-    bdrv_refresh_limits(bs, &local_err);
+    bdrv_refresh_limits(bs, NULL, &local_err);
     if (local_err) {
         error_propagate(errp, local_err);
         return -EINVAL;
@@ -3363,7 +3362,7 @@ int bdrv_set_backing_hd(BlockDriverState *bs, BlockDriverState *backing_hd,
     }
 
 out:
-    bdrv_refresh_limits(bs, NULL);
+    bdrv_refresh_limits(bs, NULL, NULL);
 
     return ret;
 }
@@ -4847,7 +4846,7 @@ static void bdrv_reopen_commit(BDRVReopenState *reopen_state)
         bdrv_set_backing_hd(bs, reopen_state->new_backing_bs, &error_abort);
     }
 
-    bdrv_refresh_limits(bs, NULL);
+    bdrv_refresh_limits(bs, NULL, NULL);
 }
 
 /*
@@ -5244,7 +5243,7 @@ int bdrv_append(BlockDriverState *bs_new, BlockDriverState *bs_top,
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


