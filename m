Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B5A33F59FB
	for <lists+qemu-devel@lfdr.de>; Tue, 24 Aug 2021 10:44:49 +0200 (CEST)
Received: from localhost ([::1]:34958 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mIS31-0003p5-Ea
	for lists+qemu-devel@lfdr.de; Tue, 24 Aug 2021 04:44:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58720)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mIRy3-0002RO-T8; Tue, 24 Aug 2021 04:39:36 -0400
Received: from mail-eopbgr70101.outbound.protection.outlook.com
 ([40.107.7.101]:20612 helo=EUR04-HE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mIRy2-0007OJ-43; Tue, 24 Aug 2021 04:39:35 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gAwAbZ3i7whHUPVbQXfsa6Gs3sdi3wZO4aa6J0fmQozQLdOg1iUZPYA9XoMacjXT1oMts5TKKaaHcvV71kvaeCn5OYR0Fi50LGIuiScbciSHFYeXL/Z2dMg5JfS5fbwg/ErfKhTDBCd+KO02KGeGvqD2y5AIO7XstSZWyAn0Z3JgtJ7o+hgsgjU7ScI5DeRhr063p0lQLTr3kWeXTuRKS6jKtYb2ct0KFGC7E2hxTMBsJnOPwd8qepdSUuNLaiqPPoxY18PIMjNiiuDPA/XTF6RjOzRQ32GXh1WUmufsh7RTl/LrmKn1nPWujN1V7F80ybWujhr7/wRLUnbJNnhyRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Xj4QwWVEAI0SFQXolIGfYTJdaECXiNjdZSmeNhl3FKo=;
 b=YEtf09AC9+JSN+OcR6KHdaZgdtdwfg1A2aso5Qm7jMb6G4kEeUqyU3iPALTUfSfFtxyPh09paZBPVReYfTgo/kJud1ms+Zburpz9dfiXJ/35LIS+lTCl9e/6ypHRNd5cSHc36dZo60ygLC8hHHTVOK6ZjNc5hbO9qtVKbmhmlogfDzPB1HXSM5Boybez5kgVztKEOa0gjIOQR2bERceHZQpHGxtu7ulLvf4CSPmx+UrEwGIS6vPKCVJ5Ri+QMipyia9lJz1TmWy0KCeXJOie5ZIRFUTan5Cjg1UY3t/B2I5GejQvBSFa+j3v6WbedLJqLS8hNLaG4f2bbNryHb6z5g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Xj4QwWVEAI0SFQXolIGfYTJdaECXiNjdZSmeNhl3FKo=;
 b=R2PWmouDBNsIpwTuM8XUIrAXcS1Ed2ycPaFkPPLJ1XpVqNiqfRDW8NSmxmcQM0f9ABEueQwZp2yEozHkfUKTBrQuHxva73MgdOuZu7b6nYzQMtiNTR+Y5bpIlENXn5QK5Jb4OzJcGdZLm2qIRde8vOl2qUes+7k43i4uBK4Ylh8=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM5PR0801MB1780.eurprd08.prod.outlook.com (2603:10a6:203:39::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4436.19; Tue, 24 Aug
 2021 08:39:27 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::3c5e:7829:362d:1423]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::3c5e:7829:362d:1423%2]) with mapi id 15.20.4436.025; Tue, 24 Aug 2021
 08:39:27 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, eblake@redhat.com, armbru@redhat.com,
 crosa@redhat.com, ehabkost@redhat.com, berrange@redhat.com,
 pbonzini@redhat.com, vsementsov@virtuozzo.com, jsnow@redhat.com,
 hreitz@redhat.com, kwolf@redhat.com
Subject: [PATCH v8 07/34] block/block-copy: introduce
 block_copy_set_copy_opts()
Date: Tue, 24 Aug 2021 11:38:29 +0300
Message-Id: <20210824083856.17408-8-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210824083856.17408-1-vsementsov@virtuozzo.com>
References: <20210824083856.17408-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: HE1PR05CA0178.eurprd05.prod.outlook.com
 (2603:10a6:3:f8::26) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (185.215.60.249) by
 HE1PR05CA0178.eurprd05.prod.outlook.com (2603:10a6:3:f8::26) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4436.19 via Frontend Transport; Tue, 24 Aug 2021 08:39:25 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1b7e8228-a465-489e-8bb3-08d966daaeb7
X-MS-TrafficTypeDiagnostic: AM5PR0801MB1780:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM5PR0801MB17806B832A9E75EDD69E5126C1C59@AM5PR0801MB1780.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:71;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 50SPKZSQUpYOr4D41N0IRyG5e1VzermUe6cqi/VHQzfpf+PnOFdejY+WvY8ANkXYeWcXzZfS9sv0WeiYOGbXNPPC7swrM/zuzq6reiM1eulZ32ZhNbWz5+B5UtJwH6VL3aEyJt0cM6PrEcLrGRVRLCzEvxG0LdbY43sMswudlmlvGmgT+j5Va0Lrw7yBrgGyZXRAvdI8sjjBbOWkWQmgYYxZq2UyoCCpidF7OT8+yR7ERq3DZH6sDGogSLynpixk3cLLR1tKCrynF84Ech+9C44ArMdZNUp0ypJ4TH3D9jBg16U0/ggxwsxabJArjytTcON924bm7b5TIqkQEUv1IF+a5utrGuDgR7KLOMJER2knO6jCxvG4Gt8OwFkOyJjeYZAz13Ei8qJFurlKpWYMtK6TppHTyrC9r3tRX0ouyg/E1fBevgTfm+g3fUfgE/JvUhNfly1IAkvWM/MU2yLkGwRw96/B/zicD5iHYWgHTneWVoQHOLIkXo/e/xMLhDg33D/4V3wHG0qTJvaga7TLHG9rYTMxZyFqSG+1/e2AwIntuXIuE6tfdy8z16unsKl1X5cKIbyaJkrT5CrrJbrGPCJ5XUkymD8K/TrdV5lbxLjaCuuyp4aqF9rTl7+QyIYPqP+Pib2k2WzysBw52eQs2KqeMVoOGI0dl+F/x4QBmjBfEwbExZ1XyFr0WJDCN57as+qL0P35yt9JvGQZQFnS1Q==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(39840400004)(376002)(346002)(366004)(396003)(6512007)(83380400001)(4326008)(66556008)(66476007)(186003)(86362001)(38100700002)(38350700002)(36756003)(316002)(7416002)(478600001)(1076003)(52116002)(8676002)(2906002)(26005)(66946007)(2616005)(956004)(5660300002)(6486002)(6916009)(6506007)(8936002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ak6WaiQ5OnPSJvOujVj2tue41k00bRaZgZXgr+lBXjysL4/WQ+eo1J11ayZP?=
 =?us-ascii?Q?EdcX7Z0kLo+KePyVTpdxsS6I1CoBLPfmb4NFTMt/WoQDGDnYjbdD/RseA+Wn?=
 =?us-ascii?Q?q+4SRKpMMp7jsWsvyVDl0w6kwi7QI5FTXtN26pGZaT70BNTJ5/+CeBQcF7DN?=
 =?us-ascii?Q?Icislk+XwAG1ZjQYwI0RXRrQWWaQbIgxzevWfvVPbWrznuAX5TWosplhgwFz?=
 =?us-ascii?Q?WszWHbSncBzddCKANOlVe1nwbmSsGG+BCR6e9aGNEHn21yxdQENWH9SJujsO?=
 =?us-ascii?Q?gioCkg2I2+MifiJkg/XHbx2Lpd6x2srif6xeHt+5Q/ZTmH/813yZXDJENf/+?=
 =?us-ascii?Q?S0bdzniIMol6i63/Df2D7iGx6Rl5vj0qDpdEkHkgS19BY+G9RjzgdBfSrOjE?=
 =?us-ascii?Q?xA6fJ1PuYCNzwO/hcTMX5sqwixhtWjNb3NqDb0sdGc11mVZ63JiY+sl4nAbo?=
 =?us-ascii?Q?6TTv0vPVBNJyS1t50XttcxCGjSMzQ7GHoxUDHdwRtY8pPy9h/5T2m4cmr2gk?=
 =?us-ascii?Q?wW8ktZ8FSwt/O5GepmUMVDnN5nayWcPZsQLXhJzUGnLYmirVI63q1+MLpG4q?=
 =?us-ascii?Q?q/enStLtGvREBQGm/VTA6FwwCsvZ/Ok6d+uDgYzq1i4dbipPxQxwZYFUVmlz?=
 =?us-ascii?Q?hJ0Rc7oRh+vPzYrU3RkUATTYvyYOfIRC52LS0UpNafJFHlC7Q3y7oGkeyFiN?=
 =?us-ascii?Q?5GTXBJZJddezmMYYN/lm+bzfzMvP0FYTnzi8zl0c2QO0O6SZKBKRS2SUQUzQ?=
 =?us-ascii?Q?KPyQpqr682fVhQvnjrhYCayi1D0OquGDMVrdVePsRLRqXfcDniyqPPVihcNd?=
 =?us-ascii?Q?PEmOs2ax6MgN8em9FznHH+mAITHaCkvRFyOsVR88CcJL0pNd7e26Mo+0E/ox?=
 =?us-ascii?Q?cqI4XEuxDqlhs7vZyieqnXn8QRYyM5m5UKRhUCn+FRAMd5pEc5AziQVhYm+n?=
 =?us-ascii?Q?ZrdjOLknXlfE2V3zUuBK11mDSIg00zrcaTgq5zkoOARq5a/B4Ir/8jNdJW7V?=
 =?us-ascii?Q?cVmpTTrGIfkHCij9d0kXAVk7iOLmSTEdIK7KRbKCd3+S7s62LV1LxSn5kbrD?=
 =?us-ascii?Q?Ag/up/Zg52eiapvw1dgqi0t5HfaY2Uw6G2nWRwz60UgtOTwXymNvpe9ITxzd?=
 =?us-ascii?Q?4kPadTkHiNPqKZQ/+qUOgiXBz0B5Lr2doOj+rx5oIqFiDjtv88Jh+ql2366M?=
 =?us-ascii?Q?QhYg45gxJUwXTYDQFUw3Ek16Nl9JJRf3VQzbGcqlrxI3C3ml5bw/8/BzvT+j?=
 =?us-ascii?Q?qMQPOPwIywWuEVp8Va7+hpcJdvSBB7/2/Mzomaz3djyka98DScP8Bhv94YX3?=
 =?us-ascii?Q?ztbPdp3R9vG95MIfHJneglZ3?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1b7e8228-a465-489e-8bb3-08d966daaeb7
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Aug 2021 08:39:27.1187 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LO//bScb7H31L1GQY0ELwZsvYV7oKLvBVsPwsz6Jo252XMscYXykYTFLXqSgsAj2BEEiuJNl93yCMgnVwUr9reoBktRY6Py5vwy7S8pNIGY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR0801MB1780
Received-SPF: pass client-ip=40.107.7.101;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR04-HE1-obe.outbound.protection.outlook.com
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

We'll need a possibility to set compress and use_copy_range options
after initialization of the state. So make corresponding part of
block_copy_state_new() separate and public.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 include/block/block-copy.h |  3 +++
 block/block-copy.c         | 49 ++++++++++++++++++++++----------------
 2 files changed, 32 insertions(+), 20 deletions(-)

diff --git a/include/block/block-copy.h b/include/block/block-copy.h
index 734389d32a..dca6c4ce36 100644
--- a/include/block/block-copy.h
+++ b/include/block/block-copy.h
@@ -28,6 +28,9 @@ BlockCopyState *block_copy_state_new(BdrvChild *source, BdrvChild *target,
                                      int64_t cluster_size, bool use_copy_range,
                                      bool compress, Error **errp);
 
+/* Function should be called prior any actual copy request */
+void block_copy_set_copy_opts(BlockCopyState *s, bool use_copy_range,
+                              bool compress);
 void block_copy_set_progress_meter(BlockCopyState *s, ProgressMeter *pm);
 
 void block_copy_state_free(BlockCopyState *s);
diff --git a/block/block-copy.c b/block/block-copy.c
index 58b4345a5a..e83870ff81 100644
--- a/block/block-copy.c
+++ b/block/block-copy.c
@@ -315,6 +315,33 @@ static uint32_t block_copy_max_transfer(BdrvChild *source, BdrvChild *target)
                                      target->bs->bl.max_transfer));
 }
 
+void block_copy_set_copy_opts(BlockCopyState *s, bool use_copy_range,
+                              bool compress)
+{
+    /* Keep BDRV_REQ_SERIALISING set (or not set) in block_copy_state_new() */
+    s->write_flags = (s->write_flags & BDRV_REQ_SERIALISING) |
+        (compress ? BDRV_REQ_WRITE_COMPRESSED : 0);
+
+    if (s->max_transfer < s->cluster_size) {
+        /*
+         * copy_range does not respect max_transfer. We don't want to bother
+         * with requests smaller than block-copy cluster size, so fallback to
+         * buffered copying (read and write respect max_transfer on their
+         * behalf).
+         */
+        s->method = COPY_READ_WRITE_CLUSTER;
+    } else if (compress) {
+        /* Compression supports only cluster-size writes and no copy-range. */
+        s->method = COPY_READ_WRITE_CLUSTER;
+    } else {
+        /*
+         * If copy range enabled, start with COPY_RANGE_SMALL, until first
+         * successful copy_range (look at block_copy_do_copy).
+         */
+        s->method = use_copy_range ? COPY_RANGE_SMALL : COPY_READ_WRITE;
+    }
+}
+
 BlockCopyState *block_copy_state_new(BdrvChild *source, BdrvChild *target,
                                      int64_t cluster_size, bool use_copy_range,
                                      bool compress, Error **errp)
@@ -353,32 +380,14 @@ BlockCopyState *block_copy_state_new(BdrvChild *source, BdrvChild *target,
         .copy_bitmap = copy_bitmap,
         .cluster_size = cluster_size,
         .len = bdrv_dirty_bitmap_size(copy_bitmap),
-        .write_flags = (is_fleecing ? BDRV_REQ_SERIALISING : 0) |
-            (compress ? BDRV_REQ_WRITE_COMPRESSED : 0),
+        .write_flags = (is_fleecing ? BDRV_REQ_SERIALISING : 0),
         .mem = shres_create(BLOCK_COPY_MAX_MEM),
         .max_transfer = QEMU_ALIGN_DOWN(
                                     block_copy_max_transfer(source, target),
                                     cluster_size),
     };
 
-    if (s->max_transfer < cluster_size) {
-        /*
-         * copy_range does not respect max_transfer. We don't want to bother
-         * with requests smaller than block-copy cluster size, so fallback to
-         * buffered copying (read and write respect max_transfer on their
-         * behalf).
-         */
-        s->method = COPY_READ_WRITE_CLUSTER;
-    } else if (compress) {
-        /* Compression supports only cluster-size writes and no copy-range. */
-        s->method = COPY_READ_WRITE_CLUSTER;
-    } else {
-        /*
-         * If copy range enabled, start with COPY_RANGE_SMALL, until first
-         * successful copy_range (look at block_copy_do_copy).
-         */
-        s->method = use_copy_range ? COPY_RANGE_SMALL : COPY_READ_WRITE;
-    }
+    block_copy_set_copy_opts(s, use_copy_range, compress);
 
     ratelimit_init(&s->rate_limit);
     qemu_co_mutex_init(&s->lock);
-- 
2.29.2


