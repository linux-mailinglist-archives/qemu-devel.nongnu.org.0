Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CE8992C6892
	for <lists+qemu-devel@lfdr.de>; Fri, 27 Nov 2020 16:17:23 +0100 (CET)
Received: from localhost ([::1]:41048 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kifUw-0004G1-Su
	for lists+qemu-devel@lfdr.de; Fri, 27 Nov 2020 10:17:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36962)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1kif1H-0001Xf-8S; Fri, 27 Nov 2020 09:46:43 -0500
Received: from mail-am6eur05on2120.outbound.protection.outlook.com
 ([40.107.22.120]:28961 helo=EUR05-AM6-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1kif1F-0003Ef-HM; Fri, 27 Nov 2020 09:46:42 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=b6WESaz9lyjcLYVuN88sAQDFcKivKAhT2RlQ3SaGK6nrF93+nw8J3GDWw2mnMoY29ukS+8cL8H4xyGmmHI5Llv8qjqP1mm+NZnFtQjYGteQE6M1rt+uVtgVqKc8ZZrl5FsXDlgHhGWr5r0rc2+a0rPm6fEbGPjjIcjSFoxkSu+jb+amIYqxUozQNugujyWTsPOzcPECd4be5CWiwvhsQtMTfV/Rj4Hdv+5KzsqBBDGMxdW1LzCVg4f0zHf70zozR+ZekBTuW4MnYbvDfg8PKrFGm9P4UGs9Kbv/MqlN3Y9zgvKlO5qgRMz8vuclUWHu+28/EjDF4/vzDx5XUMptQtQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fwaqD+hyd1Vd+fW6ZI7JMGYdt3V8aUmP/LogfrlTC0Y=;
 b=HzVnjY0bK3GVOFPcX06r4WnV2JFlzSY1h4dcHsN7WrZ98vHFC66Egox4dnvMLQ1m0sk6TEyJ7mR34Cd7THME5xgwp9bknHfvzlMptdAtRMMg70Tc0U7B1PkahG+wsk97rnskJxGM2BQ9YgHGVC5150wOXy1s1LD2tCoi8hIb6wPwI+3cuIk3mWQA/pNve8iRTuGOY/bc3iM5jsiWRuZdQgMj5RvgYbkPHdSdtbdz+azOjITWQ0SGiPKsYVL9B5HBZ5wpB45gKdlZQyJPWnlVPImYY9ECUtAFVM3hRaYm5+xuuwNw6qXa4R2h0SJfo+CqjrZqNLfDG/MWfMgIgTw3+A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fwaqD+hyd1Vd+fW6ZI7JMGYdt3V8aUmP/LogfrlTC0Y=;
 b=kbYQf8upQPQ72nTd92P/hqdHw/hEwzDhlK5l0vr0GzSEFjPeUP69oQ43Tzve7GCQcTqkq1DCwQa95u8ez1JdZ5zt2iD4aw2tlKaEAvwh6ii5q2ongW5zL+L106pZrOOqZWKkgmrNvZIhh0CUhmsr+md95lNTZjluivJ0yCME4sM=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB5078.eurprd08.prod.outlook.com (2603:10a6:20b:e7::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3611.25; Fri, 27 Nov
 2020 14:46:11 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::d585:99a4:d7a4:d478]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::d585:99a4:d7a4:d478%4]) with mapi id 15.20.3611.025; Fri, 27 Nov 2020
 14:46:11 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, armbru@redhat.com, jsnow@redhat.com,
 mreitz@redhat.com, kwolf@redhat.com, vsementsov@virtuozzo.com,
 den@openvz.org
Subject: [PATCH v2 29/36] blockdev: qmp_x_blockdev_reopen: acquire all contexts
Date: Fri, 27 Nov 2020 17:45:15 +0300
Message-Id: <20201127144522.29991-30-vsementsov@virtuozzo.com>
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
 Transport; Fri, 27 Nov 2020 14:45:58 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d3bdeb4a-6700-45fe-c38d-08d892e32786
X-MS-TrafficTypeDiagnostic: AM6PR08MB5078:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR08MB5078A0CC5F0400E65CC8920DC1F80@AM6PR08MB5078.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: qOgepWtu+WiogXvhLvYShumMhsMwA9wsWIfEwBVsejuYKEv/mdR+GLTDISTFoI+MXBimacerjBqlf/Dc2UtFvrAeA3pn/Cenuuey9x3YTbDnhU7TwxOywkutAKhlCxvlMGnnFXa7R767HJeyndN1VZN8fLt4juKCD/vnYc41zX5oCEF8qCAsxdfP0hzMsnSqbmZ/C2E+a6B9mHBivB2WPpPdCnW8jDM7b42M8MijoFay8SjWY366U1tmHX9DhCJqCX7ttJBH3aHC9R/9h17Q9r+cu7CYn2NTcSEVy9rGqvHdQuOopGkV4X2lIvOFVmNEk6XGlsdqaJU7Ow/R7OmLwTr58kFJWrv+vTmFrzxZ/AucejeeF4tQOf/kppYsdyCa
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(39840400004)(346002)(136003)(396003)(376002)(86362001)(16526019)(66556008)(66476007)(478600001)(8676002)(186003)(66946007)(26005)(52116002)(83380400001)(6506007)(69590400008)(107886003)(6666004)(316002)(4326008)(36756003)(5660300002)(6486002)(2616005)(956004)(1076003)(6916009)(6512007)(8936002)(2906002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?4rmhEIw+cqbhF+EBxeeIcHWSLr0jdqQlqlw7wRacwJeEwHraO3i3QlB8imGo?=
 =?us-ascii?Q?jznXwjdRIiMe1ecpgtiaskPX6qIVBMoFS1fD4TNhhjGzSeqRzJqB3C5CR8ws?=
 =?us-ascii?Q?6Db29Z3F1nN5wuxdUulJ74STRhIAiVknwghxzQY5v9QLzAwFpWAOF4vxjEgB?=
 =?us-ascii?Q?JWebeFXYZSgtBf1W6bb6xBhhIckR4Pzulb/WMoBc5ber6/gY+JfqQwGqUdHN?=
 =?us-ascii?Q?dxdeaQUHKhI9U7Lao+ekWvLQcueDRmwXP+o19N7bF/YCEU8XW7hQ7q9k8imV?=
 =?us-ascii?Q?WBmCdLBmcWLbqXDGx622Lq5ikSg/pvNvO5CQTh3GXuiLDoBhMmuicS5x/nxQ?=
 =?us-ascii?Q?jkD16ynzzpRcY52OZ4MQwUYJYyLaVaMNCuJg7e7g8fDOiwXKd9z4gzaD7iCi?=
 =?us-ascii?Q?ylMXJBoJ2aPbC3CYIuJdJpn9z53tlSfD1eQwiLsMqBnOw1X4v3SZiB8IN8FS?=
 =?us-ascii?Q?us6X68IfcEmF8iMm8COjewHL/KYBPLQleYxm2ZqHDxLNBz5ZzxLzC9COrYoB?=
 =?us-ascii?Q?cfhMEEdtXNRnxhj5iNq7BBUPsnm1RRDioyiIcRDpyUmvl5w1ty3IA8yJOCr/?=
 =?us-ascii?Q?qOt7zsqV52SDm4ULmQezk2TcGXJscP2vqnGikOI6BiyTvIZC533LbM77RPkp?=
 =?us-ascii?Q?9ZjGc/aVZXNGtGro1qT2iRSU9e2ZQH9JCmF1GjvexsAKG5KwpX28WRxVWfYI?=
 =?us-ascii?Q?+nuEvy7qzYxm3LXEzRskt9cZBzV2MiKS9rTni2qhG/1A1idmI5eCS/YJYx6x?=
 =?us-ascii?Q?ibM1CNEEJ16zXmbJbOib5nrApm+owuFZYBAZkybD78Sjq/hTAPgpkVaKujbE?=
 =?us-ascii?Q?PTBXsbuQej2Xn42KTzTeV0MmRL/VgJQNnFZOkTXsLqcuAzaZC72YMt3ncmBe?=
 =?us-ascii?Q?VZrFnrvKeXkX2+Wj86CA+XDcM5RrZV2Hka7vTpdwg2s/lI3IVBbkfFfECJPW?=
 =?us-ascii?Q?+6OCW33QSzRnlJ/Agoug6W2GgVggKYjIit+bkA6DFMiKj3lpB/X6CxSE+vn5?=
 =?us-ascii?Q?RKMh?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d3bdeb4a-6700-45fe-c38d-08d892e32786
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Nov 2020 14:45:59.2873 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sO+uiLZpZGaI1W/Mwpo6m7sTg7WUUEySP2cja+EH2oiDd7mSi4LmF8c+QZ1DGBAkmO/r8n5JpucGwD1KwhOzAxwWLssiXZTGipv8JSmsIXk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB5078
Received-SPF: pass client-ip=40.107.22.120;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR05-AM6-obe.outbound.protection.outlook.com
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

During reopen we may add backing bs from other aio context, which may
lead to changing original context of top bs.

We are going to move graph modification to prepare stage. So, it will
be possible that bdrv_flush() in bdrv_reopen_prepare called on bs in
non-original aio context, which we didn't aquire which leads to crash.

More correct would be to acquire all aio context we are going to work
with. And the simplest ways is to just acquire all of them. It may be
optimized later if needed.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 blockdev.c | 23 +++++++++++++++++++----
 1 file changed, 19 insertions(+), 4 deletions(-)

diff --git a/blockdev.c b/blockdev.c
index 2af35d0958..098a05709d 100644
--- a/blockdev.c
+++ b/blockdev.c
@@ -3531,7 +3531,6 @@ fail:
 void qmp_x_blockdev_reopen(BlockdevOptions *options, Error **errp)
 {
     BlockDriverState *bs;
-    AioContext *ctx;
     QObject *obj;
     Visitor *v = qobject_output_visitor_new(&obj);
     BlockReopenQueue *queue;
@@ -3557,13 +3556,29 @@ void qmp_x_blockdev_reopen(BlockdevOptions *options, Error **errp)
     qdict_flatten(qdict);
 
     /* Perform the reopen operation */
-    ctx = bdrv_get_aio_context(bs);
-    aio_context_acquire(ctx);
+    BdrvNextIterator it;
+    GSList *aio_ctxs = NULL, *ctx;
+    BlockDriverState *it_bs;
+
+    for (it_bs = bdrv_first(&it); it_bs; it_bs = bdrv_next(&it)) {
+        AioContext *aio_context = bdrv_get_aio_context(it_bs);
+
+        if (!g_slist_find(aio_ctxs, aio_context)) {
+            aio_ctxs = g_slist_prepend(aio_ctxs, aio_context);
+            aio_context_acquire(aio_context);
+        }
+    }
+
     bdrv_subtree_drained_begin(bs);
     queue = bdrv_reopen_queue(NULL, bs, qdict, false);
     bdrv_reopen_multiple(queue, errp);
     bdrv_subtree_drained_end(bs);
-    aio_context_release(ctx);
+
+    for (ctx = aio_ctxs; ctx != NULL; ctx = ctx->next) {
+        AioContext *aio_context = ctx->data;
+        aio_context_release(aio_context);
+    }
+    g_slist_free(aio_ctxs);
 
 fail:
     visit_free(v);
-- 
2.21.3


