Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 023B030BEE1
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Feb 2021 13:58:03 +0100 (CET)
Received: from localhost ([::1]:37418 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l6vFq-0003fF-1v
	for lists+qemu-devel@lfdr.de; Tue, 02 Feb 2021 07:58:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46864)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1l6v8t-0001Ip-3m; Tue, 02 Feb 2021 07:50:51 -0500
Received: from mail-eopbgr60139.outbound.protection.outlook.com
 ([40.107.6.139]:33232 helo=EUR04-DB3-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1l6v8p-0001qn-NF; Tue, 02 Feb 2021 07:50:50 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ezEiyOPHxtJpwNM6aps79yeh78CHn+F/Qd0AfF08VSneCrGWHD5bZBNPXMZDQfgJ80DYo4f9A1pGJocfownlaVwKi93Jh2+96eTEtr7rBtajsFrWGkF5n1qdHunPDHeTao929dA4wmq7Yfw1T9EburV5eJoZKyQ8XNUzgE+cmrAdV85AMPo64Tz6Yq4XixAqxK6c+k88R3zrADEL0zqgWaI7v8MOQ+DcFo3u8bAF9IyrtP1CmTftgOUt3ooLK1avJPWRklZhS8Yc3EZzxlZqw+qD4t1Y0wccnhkK2SVqtExqdxAS4LTP8jE1PQOsHwGwopd4nC0op+8oJVAdexJvNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2dDduFnmY5K+fYA3jfZl0dvuzWuGvbC0cdRabvJtxWs=;
 b=DnGJLB665yPtO/D76B3gMqHOFlz74MRdBu4AObdCkSKXnLQjOYSmAhmH4/tIt55ZMukj0E4q/1rd08sBtjYT5Bbp6JSV1IdYi3Je64WTyA6xUYTPmMbdU/rG8NBv99A6ycoyx7WjwPWnb7VFQoPe2kqu0xgTAMy2U3fxQwpZ0S4m9dxa4TftZ2AQzJtmbC66uT0oNG6mZXbd8STMxQYq0qDiiI717QIhpz14olN4Vl7bee+HuZ0EPnzSjKKTZGRJ/yJypFXLdCJEOf01DnkbEOGGZOgf8DphbuY2JeFPwSUMe/1Q7tLqVU5cpxfkVESm/jrPycFgqAJWyfxNDJn5ow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2dDduFnmY5K+fYA3jfZl0dvuzWuGvbC0cdRabvJtxWs=;
 b=dYnTRTPjU6CNQRBbK+2OKwqQxWLTwbBPcfad2tbLpTgsyR/ano74LsTPsH7Prurzwyso8Ej7EJb8sje2ACKygoOcUPQXzQnjhy9l9ijnDapYr/854UCJg/yzchceRj3pk6nSlfY+4Djbfo9kHj2v7FCqy/n4s0BbMoNL450MELI=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB3623.eurprd08.prod.outlook.com (2603:10a6:20b:48::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3805.24; Tue, 2 Feb
 2021 12:50:43 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f1f0:6610:11f5:5e4a]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f1f0:6610:11f5:5e4a%8]) with mapi id 15.20.3805.028; Tue, 2 Feb 2021
 12:50:43 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Subject: [PATCH v7 10/14] block/qcow2-bitmap: return status from
 qcow2_store_persistent_dirty_bitmaps
Date: Tue,  2 Feb 2021 15:49:52 +0300
Message-Id: <20210202124956.63146-11-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210202124956.63146-1-vsementsov@virtuozzo.com>
References: <20210202124956.63146-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [185.215.60.137]
X-ClientProxiedBy: AM0PR02CA0002.eurprd02.prod.outlook.com
 (2603:10a6:208:3e::15) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from kvm.sw.ru (185.215.60.137) by
 AM0PR02CA0002.eurprd02.prod.outlook.com (2603:10a6:208:3e::15) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3825.17 via Frontend Transport; Tue, 2 Feb 2021 12:50:42 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f61dfe0f-d382-418f-84fa-08d8c77926d0
X-MS-TrafficTypeDiagnostic: AM6PR08MB3623:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR08MB3623F16101899435E57EB368C1B59@AM6PR08MB3623.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:246;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: iM3t3GrKA2QzHgIApsbrXq3yRkCeUAOuamQbOWQx2XIjqDt5Aie0rNdcraX49joKYEUBkdDWo032M+s5fzuyJcqYAZh9G8bdt1DkR/SJxlkO8B0Gf+lEPViFKqiLV7//wc1vd6L2DUoKpBh3+XDv/xhKn7Mr5Z+R5DgCSzWUZr3P5qamzxjAZCuKeJCc+m13TahlJNXxnIRh3LiybAynmGEXN3sFaSZGnpeFybhHYgSPPUWdiT6KiWQrd0klOYZgQjV4RXplcUSTC7DHMPIRVkQErqcVVb8juyIkkcFzBUossFzgEBcY0Oe8boCZmF0J+qZIAcnsp3xJ9qECQgqmt0MV1Tl86KitvoWVjnXG8F5oS5BZbIuLTxjp9P1ouupfTclLyyd7u0RyA0BFkpx+ej1mSY8hpzyJc58GfmiwHTuHKVIbVfdoX0MLXKRUYKy3cux/oI7zzIARHIerj9fursGuczgrQ9QQgHelCQMPUjaBkBhbrwL18us2KPZnZEO/fxD3jsf/7vzHKqlM9GxBZhlC0VZHxGLDumx4X4wGGtHqox4Kj6Miel05v7vElD64
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(346002)(39850400004)(376002)(396003)(136003)(2906002)(5660300002)(66476007)(316002)(66946007)(52116002)(6512007)(66556008)(36756003)(8936002)(6486002)(19627235002)(86362001)(7416002)(26005)(1076003)(83380400001)(186003)(4326008)(16526019)(6916009)(478600001)(2616005)(956004)(8676002)(6506007)(6666004)(14143004);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?QYNlkzQmLp2lqBE4Q8J9xSZzlYas5mQbOMRvZ15vBvO2qFhJEy8RITYc1rig?=
 =?us-ascii?Q?gtvuRTe/qhH8DJeusWzWuRetK6DZN9w6j9M/qyPUG3soFaPa3mzUz948RwTr?=
 =?us-ascii?Q?EiKloxf9U4OpokaYwwRsYUFPQQtssIMxbITzk9I/679HneoSKNhS5kr8jQEX?=
 =?us-ascii?Q?W+9+J9RYf1CkHsHvRC51eOzscwq0ChhuaEiTD1eFLmmQJa0lftrjCvnhDWPB?=
 =?us-ascii?Q?wT/wqRXySWF4MVujxBrz+ETrrlKkz2y7ITWAgUkwGfg410oQBEKaQQlmfCez?=
 =?us-ascii?Q?s51KnAphhPM3+GhGURPgg0EREcxV8cZAGokS/H6GdcByTM/G07Yj2u9hCVfA?=
 =?us-ascii?Q?XDgp2/nM395D/+MkjgMSi4AlOlG9tewVzVhPTgqsvf/1lQrAVdw1CLpWEu0C?=
 =?us-ascii?Q?Kg9U98A+0VV0pNwm/naCLSPBeV2K8HUh7RpKC00RRlz8YL6mKXFvwP9AC62v?=
 =?us-ascii?Q?ZCQPUuDdGxx/hkMW7UESGOyNvsMlJDWi0ggjGT2piHxzfZdQKJS2GKOcw9kL?=
 =?us-ascii?Q?0aCbNoyOgfcUuh9gM3V9rH5VmKO1k3zDIyGEETCiYtz9BCQzh3PMHV8tOtnF?=
 =?us-ascii?Q?XqbH20SlrbhSrrb5e5A3QKkaiUZb0E5rKNDeLreimdOdyb6oSKpSuQO00bZp?=
 =?us-ascii?Q?Fd4mXFQgnF71O/ZiEaxqkJYhzApJ/NDyDeWUjae/3nqP6ku/v8EmFIr7/bQo?=
 =?us-ascii?Q?g7uSBMQ+RxOTndRJcUqHxOEhGIPOLLvmkYWUAf4EkRnt2zWyZ3Hy9dG49jpz?=
 =?us-ascii?Q?uowtOPM4u/A6YMbk5zWk1vWaGUahYd8zlDuKqI41AALNqfvHJfHVr6ggsMJF?=
 =?us-ascii?Q?gMnZ6okEQF6ExZvDbf+JjfztVsWs18jgyLZerh2OR9PSyivvZJioGDfDToe3?=
 =?us-ascii?Q?0nW3+rJtS46Nvub8T0qFOpbSOYB8IMv6Z3bwg83ne7FaNi/fGZUfKNpfmJJI?=
 =?us-ascii?Q?JKuXypEC1LD0d/krl3Hg4nStymLvtefMLV4nFCuk4/hfgfHyEHmjnZXWYOGP?=
 =?us-ascii?Q?RoDl4+RRK3WDzhjxlLWagLaxWNbo6G2aaGiunovC1Ws465iBo0uK9J89PbNu?=
 =?us-ascii?Q?VZcx8ryE?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f61dfe0f-d382-418f-84fa-08d8c77926d0
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Feb 2021 12:50:43.1693 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3VKpZfmHHGX49zq9kA+BrHNpuajBYNGy6XMHZQoC8MVNdpxB2nQTgeC3Fr0Evqm8jXqBuZipZ/xtGA5MNfsqUGbvVt14MASzEet6KPHknbg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB3623
Received-SPF: pass client-ip=40.107.6.139;
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
Cc: kwolf@redhat.com, vsementsov@virtuozzo.com, berto@igalia.com,
 pavel.dovgaluk@ispras.ru, qemu-devel@nongnu.org, armbru@redhat.com,
 Greg Kurz <groug@kaod.org>, stefanha@redhat.com, pbonzini@redhat.com,
 mreitz@redhat.com, jsnow@redhat.com, ari@tuxera.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

It's better to return status together with setting errp. It makes
possible to avoid error propagation.

While being here, put ERRP_GUARD() to fix error_prepend(errp, ...)
usage inside qcow2_store_persistent_dirty_bitmaps() (see the comment
above ERRP_GUARD() definition in include/qapi/error.h)

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Reviewed-by: Greg Kurz <groug@kaod.org>
Reviewed-by: Alberto Garcia <berto@igalia.com>
---
 block/qcow2.h        |  2 +-
 block/qcow2-bitmap.c | 13 ++++++-------
 2 files changed, 7 insertions(+), 8 deletions(-)

diff --git a/block/qcow2.h b/block/qcow2.h
index d19c883206..0fe5f74ed3 100644
--- a/block/qcow2.h
+++ b/block/qcow2.h
@@ -984,7 +984,7 @@ bool qcow2_get_bitmap_info_list(BlockDriverState *bs,
                                 Qcow2BitmapInfoList **info_list, Error **errp);
 int qcow2_reopen_bitmaps_rw(BlockDriverState *bs, Error **errp);
 int qcow2_truncate_bitmaps_check(BlockDriverState *bs, Error **errp);
-void qcow2_store_persistent_dirty_bitmaps(BlockDriverState *bs,
+bool qcow2_store_persistent_dirty_bitmaps(BlockDriverState *bs,
                                           bool release_stored, Error **errp);
 int qcow2_reopen_bitmaps_ro(BlockDriverState *bs, Error **errp);
 bool qcow2_co_can_store_new_dirty_bitmap(BlockDriverState *bs,
diff --git a/block/qcow2-bitmap.c b/block/qcow2-bitmap.c
index 8b28e4c576..e50da1ee7d 100644
--- a/block/qcow2-bitmap.c
+++ b/block/qcow2-bitmap.c
@@ -1529,9 +1529,10 @@ out:
  * readonly to begin with, and whether we opened directly or reopened to that
  * state shouldn't matter for the state we get afterward.
  */
-void qcow2_store_persistent_dirty_bitmaps(BlockDriverState *bs,
+bool qcow2_store_persistent_dirty_bitmaps(BlockDriverState *bs,
                                           bool release_stored, Error **errp)
 {
+    ERRP_GUARD();
     BdrvDirtyBitmap *bitmap;
     BDRVQcow2State *s = bs->opaque;
     uint32_t new_nb_bitmaps = s->nb_bitmaps;
@@ -1551,7 +1552,7 @@ void qcow2_store_persistent_dirty_bitmaps(BlockDriverState *bs,
         bm_list = bitmap_list_load(bs, s->bitmap_directory_offset,
                                    s->bitmap_directory_size, errp);
         if (bm_list == NULL) {
-            return;
+            return false;
         }
     }
 
@@ -1666,7 +1667,7 @@ success:
     }
 
     bitmap_list_free(bm_list);
-    return;
+    return true;
 
 fail:
     QSIMPLEQ_FOREACH(bm, bm_list, entry) {
@@ -1684,16 +1685,14 @@ fail:
     }
 
     bitmap_list_free(bm_list);
+    return false;
 }
 
 int qcow2_reopen_bitmaps_ro(BlockDriverState *bs, Error **errp)
 {
     BdrvDirtyBitmap *bitmap;
-    Error *local_err = NULL;
 
-    qcow2_store_persistent_dirty_bitmaps(bs, false, &local_err);
-    if (local_err != NULL) {
-        error_propagate(errp, local_err);
+    if (!qcow2_store_persistent_dirty_bitmaps(bs, false, errp)) {
         return -EINVAL;
     }
 
-- 
2.29.2


