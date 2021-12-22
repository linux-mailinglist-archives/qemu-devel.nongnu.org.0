Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DDD1847D5FE
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Dec 2021 18:48:10 +0100 (CET)
Received: from localhost ([::1]:38566 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n05ij-0001wr-Fw
	for lists+qemu-devel@lfdr.de; Wed, 22 Dec 2021 12:48:09 -0500
Received: from eggs.gnu.org ([209.51.188.92]:52484)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1n05bd-0000hC-3k; Wed, 22 Dec 2021 12:40:49 -0500
Received: from mail-db8eur05on2127.outbound.protection.outlook.com
 ([40.107.20.127]:22544 helo=EUR05-DB8-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1n05ba-0002Yd-Dq; Wed, 22 Dec 2021 12:40:47 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jsLPbs2lVssrbnjZog0cgMoR4WkuYlJlNrChV2pytNaMIsg1sPN+G64TeOuXqOYxaXon35yxNm2LMG+kDrI7O4Q5UCL+yH/Q1R7t4g7ixAIVvl2SRuwYJfljkgwjQqm3Q0gg99JZO3y0Kj1FnB2mtP924jhdGIPisaoGDNpymY+s9IOXHQ9Mt/5Oh4BoVA6OPvVkL+pwtgP/ff6EFTo4k+mB0/Acl1zUPFjLdyCltmFdEjwIMiWkdoY8UVpFJqqurKtWWwY3TlUNSsJUi92g0JotK44U4Sa7q7ojcUKg+RyUiRcivli1TqgHCSCxyX8vWh2QBed3QaE5p69VWtgsgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EhaMl/LpD+r5VyjgfnB0lOUVKm+Hpn23oXfZZOnNIuY=;
 b=BPFvrbujG3a78ueZoPx57RdQ/xogXjWBuoaLS+8KS/U1Au5ydZpFU2ofhU/iuqopZQ2M/lmdt+tPlldVMmNlRAK0Kdp3sZlnrXgaeZzcM6oUBTZT0mnMaSXughF+/kjZRKL429FmO7xBNB+bHdl7mohZqawtfBY8men1bOJAywa/43SocDbUV0PUVKWJkcRFAarOUHkJ2Hjq5eDq3VcVesVhJNfZ0gn8eQzc7eY/PkDw8xp98+8uJOJIs1uZQu/dHZg2ksZfjlzH0lbqftGEG4RzatB8ZUb4fzi6VueQxFNTkW1Gej5hQK3bh5JCFe+3GSaJb26rLn045XfeQS06uw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EhaMl/LpD+r5VyjgfnB0lOUVKm+Hpn23oXfZZOnNIuY=;
 b=uzipKsJww1iJvQKIKAnsR5LrkxeI03tYe7sPJYal1pJxDQVdA8AyR4VJUzQ26xb7QvicCV+x1lL3Xf6Rf714PutFESKLsXyPGogZ0q5JAbsrxEc5VRjgZHv3ARcxjG42BYJ+77ZiqvlRu8wGtxjtGhqC0tLCXR5Ap0XenvUOcus=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from DB9PR08MB6748.eurprd08.prod.outlook.com (2603:10a6:10:2a7::16)
 by DB7PR08MB2988.eurprd08.prod.outlook.com (2603:10a6:5:18::25) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4801.17; Wed, 22 Dec
 2021 17:40:35 +0000
Received: from DB9PR08MB6748.eurprd08.prod.outlook.com
 ([fe80::a89f:c7bc:b9f8:fc3e]) by DB9PR08MB6748.eurprd08.prod.outlook.com
 ([fe80::a89f:c7bc:b9f8:fc3e%6]) with mapi id 15.20.4823.019; Wed, 22 Dec 2021
 17:40:35 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, armbru@redhat.com, xiechanglong.d@gmail.com,
 wencongyang2@huawei.com, eblake@redhat.com, hreitz@redhat.com,
 kwolf@redhat.com, vsementsov@virtuozzo.com, jsnow@redhat.com,
 nikita.lapshin@virtuozzo.com
Subject: [PATCH v3 04/19] block/copy-before-write: add bitmap open parameter
Date: Wed, 22 Dec 2021 18:40:03 +0100
Message-Id: <20211222174018.257550-5-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211222174018.257550-1-vsementsov@virtuozzo.com>
References: <20211222174018.257550-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: AS8P250CA0017.EURP250.PROD.OUTLOOK.COM
 (2603:10a6:20b:330::22) To DB9PR08MB6748.eurprd08.prod.outlook.com
 (2603:10a6:10:2a7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6d0c6964-2913-4067-f3c3-08d9c57228dd
X-MS-TrafficTypeDiagnostic: DB7PR08MB2988:EE_
X-Microsoft-Antispam-PRVS: <DB7PR08MB298874C6FA493F6DB3774295C17D9@DB7PR08MB2988.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:415;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: hi/wavGcgQhYzjDBNoIAX3nEMsyMJ64yAfSwMXu5giHeennTwXPthrvwveOKJQ0oBoUVAuv9WbDEz5qMjIp8sDIiqYkw7Vg7lC3yGLtCWASU1qJvhYGj/FQJLcv0IoZE/f8E0+uhmos/6sE/yep6S9tH1lvsKgAbGXQcUkCqPw+OiaDrpFyB7zWhwSjs4F4JQp8lZDJA84T8NTm+9dVJxx2iQ9V7xxd1Fb4rVuV5QX66XqnXzn+d2hMpyexuoNZX4tn0/V/nQ+oFgdB8v2xn+Sr6qQqBdQeE9gzV0o3FC/fI0PSxIxq6LhTDiHr6k2NNWa0EB2p7K16ImnH0KBliiUbR7TNK4WZC7FSLYd8IO/XAynPmrnnaRvx2fx+Gs2J4JJ0S9cZbDXCsW1Fq7Qe6Ek9o8F7u+WRkt4lQpgoy/CfdOmH8mlxmbRSUBoyf87XMYMGoqMreZLEq958axjbdubTJa2vOcOzyUfVziQJUjsa8E/33+ECk9SXWrC++FBgDmIpHqoHTiR4TOtVdQtf+smMMg7F/Up7c01n7KmJr+5WdtJjuJb1btYUJQGftNrMVymaBV5tdgRT/SEx4lx8wpsqoQ8UfzcwKL039AXWixG+cTmf4uMgH2B5/tgm3qwjpoue424NLvzw3NMDrBkNN/lonWpownBt8BfSEfCRy5AJdB6YoU5/3ABiSS0asJkHfa3UkmQ7JXa3f4dsilRFoVg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DB9PR08MB6748.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(66476007)(6486002)(66556008)(38100700002)(66946007)(8936002)(1076003)(86362001)(83380400001)(5660300002)(52116002)(36756003)(6916009)(2616005)(8676002)(38350700002)(508600001)(6506007)(4326008)(6666004)(186003)(316002)(2906002)(6512007)(26005)(107886003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?+dAF1qihkfx2JHz4RW38Xys1BQ+654EdRr0maOizykbIVQuvuuyc1Rip10dL?=
 =?us-ascii?Q?jX5BRmuqr86CxFPW004/pheK+B2NeW7gZKZjrcoG59Ru2X3OBr6MDDeVvk6t?=
 =?us-ascii?Q?ns0iQgApevZR8gt7SHdRgRRHSAizPUnz6b5MN+6JIsjgYwylBksLCmMK4I/B?=
 =?us-ascii?Q?cYZLBwsv0U86SaHGAnZMdUWwIMbnGwPWwaPkYz5HhAECLepm+ZwyMoATxoGZ?=
 =?us-ascii?Q?dNymge4/teH7NRkVo2FbDQk6yQXiloCj2CrwlOWemWtrOYCUf+SysmXTqAq1?=
 =?us-ascii?Q?Ua3h6Ay5mAVvKyGyKzcYP0P214qPfw33CQKurWUaYBH208uIY7aSlPq74l++?=
 =?us-ascii?Q?U1mnSGVxAIqfbz6XAidfqOMdA7DqpLI51wOBXAGvJSkLulEfL9ekXm6QpQxu?=
 =?us-ascii?Q?Wv/zh2HTknPKJeJvyEvFld2G8xHaFxxh/lQhjO/i7JkonsARgZDX2y3TUpx1?=
 =?us-ascii?Q?MXnpnDwkrGDCF0H+QO1aiBjrCrGjV91fr+RxutriEj0i4ZGg6IP0zSdEDvLC?=
 =?us-ascii?Q?xvv6MZv6+IQbZgSsTqia+ICKRrEdnNlm22bShrSrLlZlutTOjapHpL0rfpoX?=
 =?us-ascii?Q?+3+onWh9va0cnKZUIB9ZBJp96olD9IXsB0EsnBf41LGOFka9BVE2zlO6nH8F?=
 =?us-ascii?Q?LoGb7GjcXiIiiARrPMr6jRzfkrnl/Xt2wVZJx6lBuEeTwDIKcWstdAe0fU6O?=
 =?us-ascii?Q?UoBf69Nb/U+acurP2zftn8Hne2VLSc1DiVzxRVrP4OPnie5CW6xZUztycl+K?=
 =?us-ascii?Q?Lvs7ls7FSvpz0JGQ4iNYx2c7aAsq+BOPbHw3sP3TKcfZNjrzR1Sjbfpevysu?=
 =?us-ascii?Q?U8gDypd+5gRTIXORFZRtneqcc/Qlyl8gHvIq2BH/YSACBVlYmXCXjAvjZF/r?=
 =?us-ascii?Q?CodFibaJepXPdTtGxIVyitp87fgpCa6zXym+IV5nq6Ky1WQ02GJ+VOwU+8yT?=
 =?us-ascii?Q?dmBxY+0SOS6r/jbv/ib6QHg7uGJbO7G/CS4A39mEBhfM7Ia/eNI09dxD/Joz?=
 =?us-ascii?Q?kZgZTUmi/2MfBxRfwJ7Mgdlp27SQPzVPwvZLxIX/1uSdAOdDfmG3qIB8hgpp?=
 =?us-ascii?Q?RoGY6eqsNFnQjO+ag4Lk59I7A4vX5eCfWJ4TPH5NqR5Pvqt8q3lEcjaP8Goh?=
 =?us-ascii?Q?WuJ7RWgLz8y1yVjSMPNuUKGNsZJx0eBhLo2RJxf/xUjMujdn4dg08o2SCVWz?=
 =?us-ascii?Q?ySMfbKPnvRfM4Nu0T3FC04GJbhThhRqSRsRjG7l9TRUQik8yv6nqLYpFLOw5?=
 =?us-ascii?Q?HeqeM7k0noGsvsiP2v0IGAbgo3CXZCKWyl6dU4eIr1TzJg+77WLyi52npgmu?=
 =?us-ascii?Q?vabLNkSxhZlC0dOn0yrP6iZX2Rtjgt7xM9wbsrAaQFB+dgntu4d5c6UIbo4b?=
 =?us-ascii?Q?FxQiIVoai7WqK5spulD3kz00p9ERjJ1jneQZDK5Gz6oZcnqBLp6/JsNIT0XW?=
 =?us-ascii?Q?6J9TFUxa6BA5wwbFYWX+QDR4LbXErXWbpnICXM7z/XRGr/+s9ZXcjUzQWht8?=
 =?us-ascii?Q?INmUAjVqDdrdnFa9IqwkD+hml7YDv6vu0xB73zeoLHon3NLYMr0Rou56/ACx?=
 =?us-ascii?Q?Aq/2/haGA69BkcxFr21aKIoPeI144MtigTvsvkTnoA0yw2qPtKCn/S8aQQFW?=
 =?us-ascii?Q?xLpM/dGQwK6jCrVCrpbFUnNgvTQ405ZUn5Nm4L3oLXZrlwEhUcFlFJsEG1T2?=
 =?us-ascii?Q?XAYnQjFekHguBlZXCkXui9RzsJA=3D?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6d0c6964-2913-4067-f3c3-08d9c57228dd
X-MS-Exchange-CrossTenant-AuthSource: DB9PR08MB6748.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Dec 2021 17:40:35.3619 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0RdjLp34R8pCLTKnEbmEgr5Rxbkk/rK59p7/tHEjiQ/2ZvZXlG7RWvpmHu9ZpBoLG1TCsSWZNEVpilgkxZuM+6dKC9gIsdqc26xDWmf6ISg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR08MB2988
Received-SPF: pass client-ip=40.107.20.127;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR05-DB8-obe.outbound.protection.outlook.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

This brings "incremental" mode to copy-before-write filter: user can
specify bitmap so that filter will copy only "dirty" areas.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 qapi/block-core.json      | 10 +++++++++-
 block/copy-before-write.c | 30 +++++++++++++++++++++++++++++-
 2 files changed, 38 insertions(+), 2 deletions(-)

diff --git a/qapi/block-core.json b/qapi/block-core.json
index 1d3dd9cb48..6904daeacf 100644
--- a/qapi/block-core.json
+++ b/qapi/block-core.json
@@ -4167,11 +4167,19 @@
 #
 # @target: The target for copy-before-write operations.
 #
+# @bitmap: If specified, copy-before-write filter will do
+#          copy-before-write operations only for dirty regions of the
+#          bitmap. Bitmap size must be equal to length of file and
+#          target child of the filter. Note also, that bitmap is used
+#          only to initialize internal bitmap of the process, so further
+#          modifications (or removing) of specified bitmap doesn't
+#          influence the filter.
+#
 # Since: 6.2
 ##
 { 'struct': 'BlockdevOptionsCbw',
   'base': 'BlockdevOptionsGenericFormat',
-  'data': { 'target': 'BlockdevRef' } }
+  'data': { 'target': 'BlockdevRef', '*bitmap': 'BlockDirtyBitmap' } }
 
 ##
 # @BlockdevOptions:
diff --git a/block/copy-before-write.c b/block/copy-before-write.c
index 799223e3fb..4cd90d22df 100644
--- a/block/copy-before-write.c
+++ b/block/copy-before-write.c
@@ -149,6 +149,7 @@ static int cbw_open(BlockDriverState *bs, QDict *options, int flags,
                     Error **errp)
 {
     BDRVCopyBeforeWriteState *s = bs->opaque;
+    BdrvDirtyBitmap *bitmap = NULL;
 
     bs->file = bdrv_open_child(NULL, options, "file", bs, &child_of_bds,
                                BDRV_CHILD_FILTERED | BDRV_CHILD_PRIMARY,
@@ -163,6 +164,33 @@ static int cbw_open(BlockDriverState *bs, QDict *options, int flags,
         return -EINVAL;
     }
 
+    if (qdict_haskey(options, "bitmap.node") ||
+        qdict_haskey(options, "bitmap.name"))
+    {
+        const char *bitmap_node, *bitmap_name;
+
+        if (!qdict_haskey(options, "bitmap.node")) {
+            error_setg(errp, "bitmap.node is not specified");
+            return -EINVAL;
+        }
+
+        if (!qdict_haskey(options, "bitmap.name")) {
+            error_setg(errp, "bitmap.name is not specified");
+            return -EINVAL;
+        }
+
+        bitmap_node = qdict_get_str(options, "bitmap.node");
+        bitmap_name = qdict_get_str(options, "bitmap.name");
+        qdict_del(options, "bitmap.node");
+        qdict_del(options, "bitmap.name");
+
+        bitmap = block_dirty_bitmap_lookup(bitmap_node, bitmap_name, NULL,
+                                           errp);
+        if (!bitmap) {
+            return -EINVAL;
+        }
+    }
+
     bs->total_sectors = bs->file->bs->total_sectors;
     bs->supported_write_flags = BDRV_REQ_WRITE_UNCHANGED |
             (BDRV_REQ_FUA & bs->file->bs->supported_write_flags);
@@ -170,7 +198,7 @@ static int cbw_open(BlockDriverState *bs, QDict *options, int flags,
             ((BDRV_REQ_FUA | BDRV_REQ_MAY_UNMAP | BDRV_REQ_NO_FALLBACK) &
              bs->file->bs->supported_zero_flags);
 
-    s->bcs = block_copy_state_new(bs->file, s->target, NULL, errp);
+    s->bcs = block_copy_state_new(bs->file, s->target, bitmap, errp);
     if (!s->bcs) {
         error_prepend(errp, "Cannot create block-copy-state: ");
         return -EINVAL;
-- 
2.31.1


