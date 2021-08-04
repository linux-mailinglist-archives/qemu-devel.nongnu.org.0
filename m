Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AE1433DFE72
	for <lists+qemu-devel@lfdr.de>; Wed,  4 Aug 2021 11:55:09 +0200 (CEST)
Received: from localhost ([::1]:32850 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mBDcC-0007sP-N3
	for lists+qemu-devel@lfdr.de; Wed, 04 Aug 2021 05:55:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47464)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mBDMi-0004x3-UE; Wed, 04 Aug 2021 05:39:09 -0400
Received: from mail-eopbgr60121.outbound.protection.outlook.com
 ([40.107.6.121]:35908 helo=EUR04-DB3-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mBDMg-00062H-Rp; Wed, 04 Aug 2021 05:39:08 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JCoRf1NdyI4Ac9A8qakIDd1xG/IOB1t8ydbPMCZrEBB86hZaTdeF/MKgsMjsmbubFqdxILtuhW2MlJz0EfepBGXuPp92DX8pM8U6hsrjl5du1PyOMAa8iJDvWvOVma+wnI7Qi60d7pcQUuLcew96s6J5s1ww2uwLWDcvPLzhgFUx4WZSUDRjoRisktETJqK0UB7DjHW4f/RpznRHdsD0sW8Dquco/R0uwQ9URmrXJ563Ed88sZh1j2fFMp6LfaNa5QiHvfLB6wJdB+zLMzbZALOIMHITQOesgHT9FPwrPHH07mIfpyIJzPPZoWWZ7CamsjQN0VxhtILByNxkav2O1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=A6gZyGdYcdOdZ98c6iLrdZgo9WnaPWMocI/jDACuhxI=;
 b=BQzRDG4XnPbREATLWpEUz2M/yXkhe6+ElhbQDPR9cAUgiXuSnRc4Y/QsHKM2iYkVmikuGIyp7WMge5yJMk4naIrVg3yBgLWDtZmGhMiZt8+gxCHJjk7qg+xo9nlGwH+Oooyx+/n62r/yFfGJnEhWS8utAmhbeENPbgyEEc/ppMAY9G0lIn6/hVZSuln8vS+a1Vc198+D+8wWQzjxlYGnZKBM9Yn2/jzeYLbf6Atqsv6kycnulZUxmqrF/J2EMhZYU9Qia8/Xaoltbx3s+1nIDFukBaoYkKo6F7SUjtYZLddts/sKTJDHFw0dgv55dc1yvOKEBQeIKNvJeCCvq06Guw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=A6gZyGdYcdOdZ98c6iLrdZgo9WnaPWMocI/jDACuhxI=;
 b=opQEu/Zp9LGzWIb8XTpMeIKQ8usx4043k1hmKOej0P4RhlBgJwNBe9cDqMNxz2dq6qbj72K3GzKX8FjncfNn4OdKjd/Ug5yulspfDA+SB38M8WESIjEKlN5aFvqkYqDwnyiSCwBV+uQVOrcofGeynKujvJTBWa/T/8K3F5J+WB8=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB5032.eurprd08.prod.outlook.com (2603:10a6:20b:ea::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4394.15; Wed, 4 Aug
 2021 09:39:02 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::44b9:68ac:bdc7:e23c]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::44b9:68ac:bdc7:e23c%8]) with mapi id 15.20.4373.026; Wed, 4 Aug 2021
 09:39:02 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, armbru@redhat.com, eblake@redhat.com,
 crosa@redhat.com, ehabkost@redhat.com, berrange@redhat.com,
 pbonzini@redhat.com, vsementsov@virtuozzo.com, jsnow@redhat.com,
 mreitz@redhat.com, kwolf@redhat.com
Subject: [PATCH v7 18/33] block/copy-before-write: cbw_init(): use options
Date: Wed,  4 Aug 2021 12:37:58 +0300
Message-Id: <20210804093813.20688-19-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210804093813.20688-1-vsementsov@virtuozzo.com>
References: <20210804093813.20688-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: HE1P191CA0011.EURP191.PROD.OUTLOOK.COM (2603:10a6:3:cf::21)
 To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (185.215.60.211) by
 HE1P191CA0011.EURP191.PROD.OUTLOOK.COM (2603:10a6:3:cf::21) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4394.15 via Frontend Transport; Wed, 4 Aug 2021 09:39:01 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3e8dc36f-dd7c-40b8-4226-08d9572bb164
X-MS-TrafficTypeDiagnostic: AM6PR08MB5032:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR08MB5032ADBE9B2CA36925EE7939C1F19@AM6PR08MB5032.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:110;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: xFqLDpNjF8j0VVqgOIYPhniw9OgXvL6nGgBK8RLGfQZ1anrx89fqncxf65ow1n9EiIegHGQhqGwB6PG9fhSxQYjpXEQ7vLTv31gW6m4PTQ976SL/MDfAPXbPZTCDMH97hhZPTmFei6Oc8RoFm+9W7crtB5b1ZGjUwI7jiFRCGT+TMIOOp9LX2iBlISz+A8svLIKYUH2SjMxkC5VxN6D0i2M0D+nJpUPVFyg2Q3+XNxxfa7eYJouRjOSnbpHweOqIt1qbVDbhYqESMCxCG76tofkDlWUg0sbCIl6FqAJvcwgPW144QT8Ye5HImSOxIMSi5uc+AwJ/as3+6G4FS1iBcZRN1klsNnGF7TIYspgAuwDSNfg1koD1Argik1nkGRccFNQDMFUiH0PumbEEGLo9eh7DDQIbihACPM0HbE/DIwtfBshGy2TzcTJ5kQ2Hz5PVQTBU7H65j0GQFC1RXxU1mJmmPvVPW0WglMiAQVVflsMKffDBDP/MVoYKOMUtGvGoDqqO63kNk/ZBVRor37ck8mFTTC2zErW92Q55QibU3gkXyzhF8TEKi0q/L1KMpTjNgLyxrnDxGuR/kBkZjIxhE27908nCHWVQ7n0GEv6HydJg2uFIllw8q/nDoWg+8V8bj92ZFtccHKxqQmjr1I4P0V8etk8JXhb5mc4k17hNTMAXi3eK9IFGaswtHWP7mAOMnj1j+K2veS5aHccJOxGdyA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(366004)(136003)(39840400004)(376002)(346002)(1076003)(186003)(26005)(7416002)(2906002)(6666004)(6506007)(6512007)(52116002)(66946007)(66476007)(478600001)(66556008)(86362001)(956004)(83380400001)(36756003)(8936002)(38100700002)(6486002)(6916009)(316002)(4326008)(8676002)(38350700002)(5660300002)(2616005);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?rXvmCqFk3wC7I8hZq4mCBwoDxT6ufzqBnlZRTxMldsd3g/UduEMmim0iOiz2?=
 =?us-ascii?Q?GwJC82bafdyAJhKmGJDGgSKOZ+STNK8fSC3zVYF7ccqXtcG/hJ+UIacM5h8h?=
 =?us-ascii?Q?ZzCMHka3yEU4FUx/oJYEKqqsCdDZrp7nII0OhmDtdw1FVSRTZPTiS+Gqd/Ty?=
 =?us-ascii?Q?lpF2mR8JqqT/nmJNGksN9UoJZpqasibj76IrQrdzebSOagueLAiueBP2RXiR?=
 =?us-ascii?Q?lfyTVqUyOyDEXtHPX6QBzeNMpxDmXgdjtOQ+YMbmnJz6kFL4MPKCV9S0T0do?=
 =?us-ascii?Q?Wx83VKS3kDZ8eNxvucbWh+0wWDLaZO5f+Qrr3uJG4ntcw4TQHKjS8JpeuZcc?=
 =?us-ascii?Q?lQJRMOq0I0yLGTAOViZI2v65dvyygu4IAcjnfQEiv+13XuHFO2qOAUdy/BNE?=
 =?us-ascii?Q?cP5O4hQe0Xm6GparsyidXeLu4CUFegqEyWPRAh3xY9Vp/6GsvhODNObmDWaG?=
 =?us-ascii?Q?m2KhIUYreIVPuOonQ3THNFfyMyWe23kTWu13evHEEWFZjrxMW87u779WuceV?=
 =?us-ascii?Q?ce/3KM2bcSkWBZIRiBYsny6AEb3I4QnPVESWEhv9Tgsfg71mUzJIc7G+GuT4?=
 =?us-ascii?Q?YX1xOOFrqyOfxj8nL+yIq6o/VJoG+KHjSSXmqBCK7jLh+YjoRJED/vOK9Iuj?=
 =?us-ascii?Q?W3Ii7CbhJzbNC9MptD9tfZOTcdpUncZK36NHtiPgrp5srzG4GBqOMViLd80Y?=
 =?us-ascii?Q?PU22Ez4qiVpEcazKblLSCgQ+UlAwUr2nSgCthe2PutGhV982LSF7olAyEyWJ?=
 =?us-ascii?Q?pnzbmOrd/Fw2sncB38NrBOMtgbFABQwMigFyzl+SMIUYc+V3JwIsjI2mA4uH?=
 =?us-ascii?Q?q7CYJX4anP8JR9/HJJGlUizLm8vmmZ+ykTs6GXvz2Xk/wQz2ispB/6PiQPDN?=
 =?us-ascii?Q?H5F7zAj4EAqhL9v/l5oczHIrXFiuCgT6tXIDUipbBGaLJT/4KwYUqMRXTXFW?=
 =?us-ascii?Q?qhxcETvbKvCzAX4zLzR1fVqguzmfr45y3l5pAtuiBB4iMBcjsjrcc7Aky56Y?=
 =?us-ascii?Q?t5BvoIiXtiILr1ZUEGpp8GyTp/Lh0OPRWYijn1goJVHvGFZOwiGY42SSkZ+E?=
 =?us-ascii?Q?0srjle43g16Amtbm5MHLOffJKfidV+1Xek9Qda/wOAnAHqN18N3IWXMCm+DB?=
 =?us-ascii?Q?EOt+kj8PerCPEzv/gLlmlXrB2vRqpjW6L+qVgvn9nnos+KfRXCiNgzpPbfer?=
 =?us-ascii?Q?/KuHz7c5PqgmHUPHjrJ4V5KX06Jfbnk4QBsDJZLz7/ASA9fUEazF5kSISXW+?=
 =?us-ascii?Q?MwLRyLNKuiIJzpr8TvpgpSf7lznM3fEIgNR8KaSK6BMBqt37uAw2nJ7cGO8N?=
 =?us-ascii?Q?owoUBN+iJkNB+ZSkcP0QPiCF?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3e8dc36f-dd7c-40b8-4226-08d9572bb164
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Aug 2021 09:39:02.3721 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YEaHeC+LloErp5ESUNuFho4mZ+qUqPJ4SCG8XEXhy2afvjoTdtULs9A9hxAc1mHuDmNTJIajyhtlZ2baUSXH+ux3QWBUepghp17YyNFWnws=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB5032
Received-SPF: pass client-ip=40.107.6.121;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR04-DB3-obe.outbound.protection.outlook.com
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

One more step closer to .bdrv_open(): use options instead of plain
arguments. Move to bdrv_open_child() calls, native for drive open
handlers.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 block/copy-before-write.c | 29 +++++++++++++++--------------
 1 file changed, 15 insertions(+), 14 deletions(-)

diff --git a/block/copy-before-write.c b/block/copy-before-write.c
index 1e7180760a..1cefcade78 100644
--- a/block/copy-before-write.c
+++ b/block/copy-before-write.c
@@ -144,25 +144,20 @@ static void cbw_child_perm(BlockDriverState *bs, BdrvChild *c,
     }
 }
 
-static int cbw_init(BlockDriverState *bs, BlockDriverState *source,
-                    BlockDriverState *target, Error **errp)
+static int cbw_init(BlockDriverState *bs, QDict *options, Error **errp)
 {
     BDRVCopyBeforeWriteState *s = bs->opaque;
 
-    bdrv_ref(target);
-    s->target = bdrv_attach_child(bs, target, "target", &child_of_bds,
-                                  BDRV_CHILD_DATA, errp);
-    if (!s->target) {
-        error_prepend(errp, "Cannot attach target child: ");
+    bs->file = bdrv_open_child(NULL, options, "file", bs, &child_of_bds,
+                               BDRV_CHILD_FILTERED | BDRV_CHILD_PRIMARY,
+                               false, errp);
+    if (!bs->file) {
         return -EINVAL;
     }
 
-    bdrv_ref(source);
-    bs->file = bdrv_attach_child(bs, source, "file", &child_of_bds,
-                                 BDRV_CHILD_FILTERED | BDRV_CHILD_PRIMARY,
-                                 errp);
-    if (!bs->file) {
-        error_prepend(errp, "Cannot attach file child: ");
+    s->target = bdrv_open_child(NULL, options, "target", bs, &child_of_bds,
+                                BDRV_CHILD_DATA, false, errp);
+    if (!s->target) {
         return -EINVAL;
     }
 
@@ -209,6 +204,7 @@ BlockDriverState *bdrv_cbw_append(BlockDriverState *source,
     int ret;
     BDRVCopyBeforeWriteState *state;
     BlockDriverState *top;
+    QDict *opts;
 
     assert(source->total_sectors == target->total_sectors);
 
@@ -220,7 +216,12 @@ BlockDriverState *bdrv_cbw_append(BlockDriverState *source,
     }
     state = top->opaque;
 
-    ret = cbw_init(top, source, target, errp);
+    opts = qdict_new();
+    qdict_put_str(opts, "file", bdrv_get_node_name(source));
+    qdict_put_str(opts, "target", bdrv_get_node_name(target));
+
+    ret = cbw_init(top, opts, errp);
+    qobject_unref(opts);
     if (ret < 0) {
         goto fail;
     }
-- 
2.29.2


