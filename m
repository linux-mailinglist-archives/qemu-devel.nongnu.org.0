Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 094073F9EE8
	for <lists+qemu-devel@lfdr.de>; Fri, 27 Aug 2021 20:36:13 +0200 (CEST)
Received: from localhost ([::1]:52500 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mJgi4-0006yg-4e
	for lists+qemu-devel@lfdr.de; Fri, 27 Aug 2021 14:36:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33774)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mJgRI-0001CV-54; Fri, 27 Aug 2021 14:18:53 -0400
Received: from mail-eopbgr20112.outbound.protection.outlook.com
 ([40.107.2.112]:14422 helo=EUR02-VE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mJgRG-0006cC-HX; Fri, 27 Aug 2021 14:18:51 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nUO+Bz33yuvLLG8h32a9XCgYRRbkrnRyGP2oZsa9iGmKXRDiz/nkzz/H8teX4rzTtrzP/je08LnhkUyniX2NJgMagQ2KpBbBRajKIZElhvjLGJawOtZtd13p37ebFJZZ0TeJnzG4fLamcvrUDepCfso/M0J7VcCFYo5WhdnS4dk40nU3r8HE/e9NsV35Hg/6my9gW4TIdWIr931dQ8uNcdTGwqWF45k2/Vqv6qnWbng0IwOfNrphpaq11cwljHgZ09zGlGUuX8tYbTkpfPXEBrTyPfFwIJzwm5tu1KI09fuxRzko9LpgSVHXR4lPni3BAL4OVqWjKLUOewzXChEp+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3+V3Bo4cmsYrYVsU9IWJEGuHXi3CRaeIdC92Q11Kkeo=;
 b=ldox3ZJWVm5+UhdimOMrGlD6nDd8VZ3TO9dTysp2U57bwTAlZMrSvSOli0+H27wrpx7m11sSORQrSS8p3wkyiQw0OYGwRzqLfOibxMI9HzPLPd9jcF9OiuZ6KoukvpY8FitVioP2xO7DSab0f9ykaXuTfXeGzeAqOPAu0jszcgiCrj5O3f4ikh02b5lH08rJDikfUW9q1uKEHyZWXPfNSBc7OL1bHf4yac1PS6wnpA5Co+NUisX/mSAxrFbnPG3P+A0F20iAP+4pXTPaVr0L1670ZrnAzFyIvlKTr+wBf4M+5AbFyFjDqOzIT1qw9w1aXYjvAItkTgG9XYCYZ0cZhw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3+V3Bo4cmsYrYVsU9IWJEGuHXi3CRaeIdC92Q11Kkeo=;
 b=lYS/nISTXbliTXYMIMe9mBP4Q75M8aPMOCMC+snzmNSKhLg4kBB1wlUIveTQhReByElTEPbpYG3SjGHj9Q6BqcfqvKTNmg8ZBtdxyNYWhmv1Jbr8oJ+Nzj0bbXXq7hF91To9HQOrwDIMjjWWkE5N8u+GhL7RkkGi3vGtCYBtLKI=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB3765.eurprd08.prod.outlook.com (2603:10a6:20b:8f::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4457.21; Fri, 27 Aug
 2021 18:18:37 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::2817:53b3:f8b4:fe22]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::2817:53b3:f8b4:fe22%7]) with mapi id 15.20.4457.023; Fri, 27 Aug 2021
 18:18:37 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, armbru@redhat.com, xiechanglong.d@gmail.com,
 wencongyang2@huawei.com, eblake@redhat.com, hreitz@redhat.com,
 kwolf@redhat.com, vsementsov@virtuozzo.com, jsnow@redhat.com
Subject: [PATCH v2 11/19] block/copy-before-write: support fleecing block
 driver
Date: Fri, 27 Aug 2021 21:18:00 +0300
Message-Id: <20210827181808.311670-12-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210827181808.311670-1-vsementsov@virtuozzo.com>
References: <20210827181808.311670-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: HE1PR0402CA0012.eurprd04.prod.outlook.com
 (2603:10a6:3:d0::22) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (185.215.60.220) by
 HE1PR0402CA0012.eurprd04.prod.outlook.com (2603:10a6:3:d0::22) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4457.18 via Frontend Transport; Fri, 27 Aug 2021 18:18:36 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 14822b89-aa20-4ba4-142c-08d969871707
X-MS-TrafficTypeDiagnostic: AM6PR08MB3765:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR08MB37656CEFE37F55437525A7FEC1C89@AM6PR08MB3765.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:55;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: oyyZDKEFXnqzWnglc+sL+opWexDulCbXafIHxa0594T7qrqctU6aCwiAfFk+EQtVndnx6MQ9lE4DBdeQ5sP6+QX+t8i/Gs6FH782ZAhR/VoJhN5uxsrkiUpVUC01yIvcFLLGFhaMjL3yZHhmDW+a6by7dMUgPs91WfeygYFSgsY0a7zSkDHutlih2NCVjxAxSI05SpzEAY80GTOuWLlV5rFavaM1pbYsWJrs82W7jg+MLU03YaApFzwHySbg2I9RyGa7oVCVK6eMkclEUCLbRgbiFp80AHt5WLZQ7OAWCOAzxmfl1xLH4ml2lPNVKpfCUDmJrh9ZKWWxIorZ4eQCuwW4najpiL05Ku4P4DPZA8CVwVS2aX3Os797/trFi/7AsQW8sAkGIfQHVaYJA0bepW6CYBXRGmvY2MWgOB2Jus3aIf7gbKj0HX+6aVJ4Dnq01kdWOlx6l8cZRRxtTmtoJ0IoTbN5090uBUilvLV4Q6u6tJzM57FseIot1biBgVMZVDgZXX4bcLWpkiYqe3pWdRfeBkx0QO+bf0lOBKJWsivqe3/9bhsbsVx1pX3PgzZ1Ev6sjNpookmLXB7X1LHX/lkpWyMTFAbgY+oXlvuOFVYOTCQjJM5qk5aNrZLOiemDh9dsqpMRarYsQUN3QjcPhUHDuqlvipLrHw8e+mFpVTPbc1o7v1QhkrgHdz2CkVWtB0X8Lpzbde1TvqjScUnvWw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(39840400004)(366004)(136003)(346002)(396003)(52116002)(6486002)(1076003)(26005)(66946007)(66476007)(8936002)(6506007)(2616005)(38350700002)(38100700002)(956004)(5660300002)(86362001)(8676002)(186003)(6666004)(83380400001)(66556008)(6916009)(4326008)(6512007)(36756003)(2906002)(478600001)(316002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?xbWOg7Q6jNuZXwDTbNbCBg1fnC7ybWELSAo6ULOYh9xUQlXb6ZZrCyXUd6km?=
 =?us-ascii?Q?aVWhMq5h90gyXOyZbviE9g1xuUQjahwVE3xGnhmDsJpS8kJq54I81oySgFCx?=
 =?us-ascii?Q?RejNS1hDWRa5J2KFu6mZkTLdeRKJYjNz1i+TX+vq49jyG6gJFsR4x5zFpKEj?=
 =?us-ascii?Q?i69peaasHt5+pwFXyAhVNC/fjrlvS7RgYXZWaAG/m/B29dZ2HaA7tuXIGgpp?=
 =?us-ascii?Q?RyjGzBTk2uatZLTE062A5X16TJwjjVZefc0Hx9JuR0FdvoV/WTZTTbM2xGxo?=
 =?us-ascii?Q?RzOMXgmf7zOpgzY7t0KNVVMTh8hNb3e4/GMkJhYn7YjL1Di4yICP4NWRdaxA?=
 =?us-ascii?Q?zU+7jh+q2om4qSFaOS/3qqBcO6m0VTy5hddHrcpmRFC6kNRiQVP1pLEt7Blb?=
 =?us-ascii?Q?tCO4W9bB/J9iFUJBgMYeIqoL5jjKywt6ySm8azroK824//dL1KoXii1Lp2Ps?=
 =?us-ascii?Q?2DLsChWAqouyLM3yMkFWFINqzAyjbKbtVI3FmpWk3tlBd5yGm3Mo1n+iUh6Z?=
 =?us-ascii?Q?4RwzxdZXmBPXP12nsTyizdAQYir4ccrnqfwg+phHYUcc1+zhKqBubv7aGhS9?=
 =?us-ascii?Q?xXZKVqlIHls9DYx6ifPBO6YJJM6z+eVMzePuWUD1aDQbdX8JxObTpybyPrCG?=
 =?us-ascii?Q?zbxoDIbWqaMBpjY02jgWGaMfhJqW7t2qPNWbh9hXWxlpw8skXM13E7aDO3Cy?=
 =?us-ascii?Q?Df8keNLn31gG5ZB589JZ592GGlnDZM/3pon08KVSYFhSFal3ExvONSz1QnO7?=
 =?us-ascii?Q?AwRcDKvYq3vp4FFQRiN8zjuQNSDqIKNbg4PHXRPUpJ/RY8EGGDeF0BIOlaSZ?=
 =?us-ascii?Q?GsaEFATp3yQTHysVAupXvgvkDzCxrDYbSFqQicywLx6lSf7MTszfZIQ6FiAD?=
 =?us-ascii?Q?jZhQQizpNaN79o4XswvWVw15V2fwBGBpR3wrbMkPZrenADCkFho64BfPm3ZQ?=
 =?us-ascii?Q?g/wOu8i1icdAFBLvaOEpnK7LJ1NaGor+72xjVv0PlCbIB00mo0Tht9cwB2EC?=
 =?us-ascii?Q?qffTYeD9cnM/iHv3AA0QeH4LPt6pw+gqvRdkNDAd0OF1NmAK/csQhQqEfuTJ?=
 =?us-ascii?Q?RgKEcWLvNGN7LpJnnB9Uq3rjt9CzWTQX4/Os+t/pElMB00SbHx67iJw1MPdl?=
 =?us-ascii?Q?8aT36GSNkp0+H+vns5EZkZ+lBjhXO6Noh+oEvmU64zb22uCelXhMDR3BJ0aX?=
 =?us-ascii?Q?gKTIllSSRYy8Og/jq9RMDcjYOXBs+3DpCNunVIQFEWesZeCISimsPaBe81du?=
 =?us-ascii?Q?clZzB5DuOLjuQv8nrEx6icOz5FYU5o1ErwY2ZnVi/htp947ZksIwqzPQXsYT?=
 =?us-ascii?Q?7Byog0Je7JetG+5fILGyxyPz?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 14822b89-aa20-4ba4-142c-08d969871707
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Aug 2021 18:18:37.8721 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2mMdtOPkWk6M9WjYN7hpcGOhoH4TAQVvwVNiS2/51BubVoNl5ay5HqsfFGMFSpiReFsrAPP7AdQ4U5xLDHhl/R4cwHHynhoiiwuqPRKeqzA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB3765
Received-SPF: pass client-ip=40.107.2.112;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR02-VE1-obe.outbound.protection.outlook.com
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

The last step to make new fleecing scheme work (see block/fleecing.h
for descritption) is to update copy-before-write filter:

If we detect that unfiltered target child is fleecing block driver, we
do:
 - initialize shared FleecingState
 - activate fleecing block driver with it
 - do guest write synchronization with help of
   fleecing_mark_done_and_wait_readers() function

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 block/copy-before-write.c | 27 ++++++++++++++++++++++++++-
 1 file changed, 26 insertions(+), 1 deletion(-)

diff --git a/block/copy-before-write.c b/block/copy-before-write.c
index e3456ad6aa..686a085861 100644
--- a/block/copy-before-write.c
+++ b/block/copy-before-write.c
@@ -33,10 +33,13 @@
 #include "block/block-copy.h"
 
 #include "block/copy-before-write.h"
+#include "block/fleecing.h"
 
 typedef struct BDRVCopyBeforeWriteState {
     BlockCopyState *bcs;
     BdrvChild *target;
+
+    FleecingState *fleecing;
 } BDRVCopyBeforeWriteState;
 
 static coroutine_fn int cbw_co_preadv(
@@ -50,6 +53,7 @@ static coroutine_fn int cbw_do_copy_before_write(BlockDriverState *bs,
         uint64_t offset, uint64_t bytes, BdrvRequestFlags flags)
 {
     BDRVCopyBeforeWriteState *s = bs->opaque;
+    int ret;
     uint64_t off, end;
     int64_t cluster_size = block_copy_cluster_size(s->bcs);
 
@@ -60,7 +64,16 @@ static coroutine_fn int cbw_do_copy_before_write(BlockDriverState *bs,
     off = QEMU_ALIGN_DOWN(offset, cluster_size);
     end = QEMU_ALIGN_UP(offset + bytes, cluster_size);
 
-    return block_copy(s->bcs, off, end - off, true);
+    ret = block_copy(s->bcs, off, end - off, true);
+    if (ret < 0) {
+        return ret;
+    }
+
+    if (s->fleecing) {
+        fleecing_mark_done_and_wait_readers(s->fleecing, off, end - off);
+    }
+
+    return 0;
 }
 
 static int coroutine_fn cbw_co_pdiscard(BlockDriverState *bs,
@@ -149,6 +162,7 @@ static int cbw_open(BlockDriverState *bs, QDict *options, int flags,
 {
     BDRVCopyBeforeWriteState *s = bs->opaque;
     BdrvDirtyBitmap *bitmap = NULL;
+    BlockDriverState *unfiltered_target;
 
     bs->file = bdrv_open_child(NULL, options, "file", bs, &child_of_bds,
                                BDRV_CHILD_FILTERED | BDRV_CHILD_PRIMARY,
@@ -162,6 +176,7 @@ static int cbw_open(BlockDriverState *bs, QDict *options, int flags,
     if (!s->target) {
         return -EINVAL;
     }
+    unfiltered_target = bdrv_skip_filters(s->target->bs);
 
     if (qdict_haskey(options, "bitmap.node") ||
         qdict_haskey(options, "bitmap.name"))
@@ -203,6 +218,14 @@ static int cbw_open(BlockDriverState *bs, QDict *options, int flags,
         return -EINVAL;
     }
 
+    if (is_fleecing_drv(unfiltered_target)) {
+        s->fleecing = fleecing_new(s->bcs, unfiltered_target, errp);
+        if (!s->fleecing) {
+            return -EINVAL;
+        }
+        fleecing_drv_activate(unfiltered_target, s->fleecing);
+    }
+
     return 0;
 }
 
@@ -210,6 +233,8 @@ static void cbw_close(BlockDriverState *bs)
 {
     BDRVCopyBeforeWriteState *s = bs->opaque;
 
+    fleecing_free(s->fleecing);
+    s->fleecing = NULL;
     block_copy_state_free(s->bcs);
     s->bcs = NULL;
 }
-- 
2.29.2


