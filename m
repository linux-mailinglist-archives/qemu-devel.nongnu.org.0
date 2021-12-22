Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B2DDC47D5F5
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Dec 2021 18:44:44 +0100 (CET)
Received: from localhost ([::1]:58864 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n05fP-0004zz-MQ
	for lists+qemu-devel@lfdr.de; Wed, 22 Dec 2021 12:44:43 -0500
Received: from eggs.gnu.org ([209.51.188.92]:52522)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1n05bd-0000jx-3S; Wed, 22 Dec 2021 12:40:49 -0500
Received: from mail-eopbgr70109.outbound.protection.outlook.com
 ([40.107.7.109]:22241 helo=EUR04-HE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1n05bY-0002WE-SE; Wed, 22 Dec 2021 12:40:48 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jiqk3hcmDWVXTGEI5jyTaJguFPSOo/9TMCSzkcpvHHMTGCyhgcwlZE5HWX2WiO778W0XO33YdZH/wv82sb39WoQvl08lrHSeqUUDkSBbTOy7PhmXb3QG8kHbIijxjwKR4fOkb+hubzMDTxh1w4scaXyNBw8EqTIh4ii/yTxoxok9SJTj4Qs3Yu/zOXOvsDATMd2wgC5Mo+EEzSGsI/YGjmJnrepVCFezIYz50JMqWxZebGxuQk+dL8roFXChVOG1bp1wj4XyviwQ+45r6aT/dOiKcqmJRA2eOKlmt6lpdv2RmrkkFWAMMmA7+BekmJ7my/zGQK/9H+nJfgK+s+97sA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JNdVYZCjXAFpP7kOUC2W/0ZCiZ5Ei+0Ej97yjyNW43Q=;
 b=Ou1V4/XuuSOMEUR0PuyjvU8gcLeRIYymDtpz22/eFtLthxwjacX/iWzdHzgKVZaf4NaN42o+Fryrqfpj/26nXOhJ3gqEpPUELCbZ4bRFgDG4f//1KnwTNMo+Vm7tf7i1jDXkGtC2GymA8rI6hJSahm206dEnNVwnk0FtMMwLqLxt/mP/h0KBDt8xQWy96V9ZihdGWLgMgIKez2q6MunbzdwxiG8u+Ptb2KkR9SZ8jUwPpm+OtcFxhWcejPutEMfdX4wOPsZpa1ZpsAyTkDmqk4vjMHK2dAc2YCMfMCVRF3l9553vUTFVDsrlRpD6+ajmfM9VnVpoipnJEmm+nOU4QA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JNdVYZCjXAFpP7kOUC2W/0ZCiZ5Ei+0Ej97yjyNW43Q=;
 b=IPw3lTTcHQvXVeOFQmC8Pqf1KM22T4VIl90yibm1yrgjorEeECFs4nlt+FvTYK5gvZ1q0ZIr7NSagpHb0HyuMnSxgzsKJcEvnI8WN3+G0IcTDLwkWFiEK4h6WsbBgbJWAGZS4xUJWlKnLkGbroVuCMN/7mxftPxg+YrIG4N47DE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from DB9PR08MB6748.eurprd08.prod.outlook.com (2603:10a6:10:2a7::16)
 by DB7PR08MB2988.eurprd08.prod.outlook.com (2603:10a6:5:18::25) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4801.17; Wed, 22 Dec
 2021 17:40:34 +0000
Received: from DB9PR08MB6748.eurprd08.prod.outlook.com
 ([fe80::a89f:c7bc:b9f8:fc3e]) by DB9PR08MB6748.eurprd08.prod.outlook.com
 ([fe80::a89f:c7bc:b9f8:fc3e%6]) with mapi id 15.20.4823.019; Wed, 22 Dec 2021
 17:40:34 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, armbru@redhat.com, xiechanglong.d@gmail.com,
 wencongyang2@huawei.com, eblake@redhat.com, hreitz@redhat.com,
 kwolf@redhat.com, vsementsov@virtuozzo.com, jsnow@redhat.com,
 nikita.lapshin@virtuozzo.com
Subject: [PATCH v3 03/19] block/block-copy: block_copy_state_new(): add bitmap
 parameter
Date: Wed, 22 Dec 2021 18:40:02 +0100
Message-Id: <20211222174018.257550-4-vsementsov@virtuozzo.com>
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
X-MS-Office365-Filtering-Correlation-Id: aeb0595f-075c-42c4-61b7-08d9c5722864
X-MS-TrafficTypeDiagnostic: DB7PR08MB2988:EE_
X-Microsoft-Antispam-PRVS: <DB7PR08MB2988D46AC3D806FF3573A0EDC17D9@DB7PR08MB2988.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:27;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: TjcEWWeOOop0qa3USt4bA9QWfC7zfjQxOP+SHRXMBD1gR62LAM7JFx5IKLEn8u3ExXTM1CI5ab8QujglCRudnJjAm9fFHX4vJPqQr3rkDYOf0fzJ97LmUo1CxqtioYK3mZQcjX4Kp/iLDaGvkK2l/oKtSvuvb4kfV+tDGE7aygcziCsy2VBQl/ejq2WghuADanV+5kxAfP4Fv7IJtQC8no+Mo98+o6U4PvLScvM7otYHMsBW9spu84R2DxIVXCpvES9cph1CDMGKuc7Si2/voeA5f8nl/HcyAy208RXor++w+bSZPPMeuDYe5wLF4xjzmPGn8a2yiYxJTXIHH5DXSq0QqpOrMVJpM0vl7P4TuahtIx7FPZZzw6yu1vhj6f43KyaeVtEIt4qhBvSCqb8LdlJR4mymbQ+1tZKveFNUjVeSJczfhFzDirtAs4pQ96aza/+fLUWNOI3RyGWXAN/jOcN4Vy2BIpVjapaK6XTUNSKHfwuc2nl/+GsJt1oGV6AK4EieIgCc0sc2c2kHc11jMp9bVM6qpCkjiD4H7BmgyyrmpzBRBrqCphTte0MgjaVloJgNOkt/dJ8dTGcbO46sDO+igZ9QVAgtvyCV+f8x1tKr7QoRLtCShdNwVcR7u78YjDKEQ4KizrBsXBYybHE8y9R5MlPIXagcHOXb4VAOaMMKrNTQkJC5m4UlGFfYsLt6xVWNZPOR4cs4mNzTSQSO7Q==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DB9PR08MB6748.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(66476007)(6486002)(66556008)(38100700002)(66946007)(8936002)(1076003)(86362001)(83380400001)(5660300002)(52116002)(36756003)(6916009)(2616005)(8676002)(38350700002)(508600001)(6506007)(4326008)(6666004)(186003)(316002)(2906002)(6512007)(26005)(107886003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?bWIcr/wT4fIITjSEIEld06Dy42bmtZT71p///DeubyXabhuFJb5ybSdQXyNC?=
 =?us-ascii?Q?qbCI+UAcy8HyCAfJMKwZtJG+E/SpefcZUI0jcJhsKq/MapTz176mHrJonuz4?=
 =?us-ascii?Q?Qia1i/vDF4UwWL5Pa3r4JJvBoJIF7UKh8KnQldYEVqhIVp09rfL3nIaRBcwK?=
 =?us-ascii?Q?A0a7r0ckPC8DGkln8X+OOuRvRe/6Bk3lUojY4nTxMPjw8S8ItZ+d4NBaDiqK?=
 =?us-ascii?Q?UT6MP2Ce/5YTaXY8/rUFv1Fz5XfUswPSb3aI6dYFgbnjS03rrbuDQboasW0y?=
 =?us-ascii?Q?GeJdmtnKoMBfzAJLQX0//xEnrjMcw3jqdVAMgyI9QWlrf9aDApvQk1HuYI8H?=
 =?us-ascii?Q?p83uvUBz/+8HnuH5e0UoluBwt3pcrlC73rkmsItEFQe7z5SY2QMbW+Mf6ieo?=
 =?us-ascii?Q?OyjBdUgtw43SeeiyT6p4znx8phAjDu99MRDyp269ha0Z/hzMUdYAonLW72bi?=
 =?us-ascii?Q?2eoMTdHXNNbhbqcHBaAagbSMUTkjeApdL9afaWNXyUYsYzGEnPpyh+KgZ1iq?=
 =?us-ascii?Q?qmOhfCivcQBiInWtkcCDMBA1GvrQbMHomhhrN0KOieA/OyhAcM5gvDnMmGAE?=
 =?us-ascii?Q?3M0l0TvQMLfuSbiTF2DDTIiXeUoyfmksHIhR92rFGOh/M3nSK7f2BX0WZ4bJ?=
 =?us-ascii?Q?OktWWYZup/Hr0Ao4OJsAj5B9U9elUsx7G48PJW50H7DTmhfa805enJN34ZiO?=
 =?us-ascii?Q?CG6vXsCYpwHqSUptold/5N9sajdLYI0M9uYsGeiOTfU6XWMUNp91W0zzaQDk?=
 =?us-ascii?Q?NYZkJPv6Rr3l2NUv40lx2Rgi4QLo71OFWft0am5VUNXA1slYgTs2T0RQg0W9?=
 =?us-ascii?Q?gHrjmd+9L1KwJxXeYsXReKp9hrBx9HD1Rq2nBKCoD5QVnkq6YTuuu7Sv3Fc4?=
 =?us-ascii?Q?d4Z+0iXUcyNklrEvKEebckLq30zvO/pIage3vHDy04DbjENXHc7rtIbZyvE8?=
 =?us-ascii?Q?VZFeR6kIDmW2BH8YDi0i72RUkQ7w4NW6suG/gP4CZk9FLhatl6RMQlHgVrFu?=
 =?us-ascii?Q?hFUKSthUOjfG/mT01QJSejDLfipAWX4DMitH6ss8WZPWPQNBk4pUokQ4Mh11?=
 =?us-ascii?Q?RwEkTz+/1L0G79r6fV4t2cfJsgcJ9Wk+PLbYQa7ILX6y/1aZSwsfsiOloN7L?=
 =?us-ascii?Q?B2X8IUNs5YwGSnjLjYruQXRcbVx37JETFxNuTp7gFIlfDiys3Q5m7jRVex7O?=
 =?us-ascii?Q?HP2iUMaHHQIndO2G7gFgaKJWftw49uoMC1+AdW2leq2kr4mJXCxkn8Xkema4?=
 =?us-ascii?Q?NS8g86dFRuAnmQBzZ7te4tH1In1lso3UsJ1/1VS5rxPWmXxcfQ9yFqVNtyp4?=
 =?us-ascii?Q?49zmPjq1GgAVqdxPWn8o1gAe/zbwVz1ckjMua1DxD8pTfcLiAVKtPlwQYjCK?=
 =?us-ascii?Q?R+fMCWoGGtIkFS7eYYVV68BoTVq7L9HL6kdrBC5PSD1Z5LmqM3+zzdbzEDwo?=
 =?us-ascii?Q?5Zyt/w1aaz2jqKF7GV9YxUEY7pdX8O1DrqX2ELWGsgT3UO1WIy2H1lpzUMLH?=
 =?us-ascii?Q?PbLQTKQ+pXglWz4hHjjbocnqsoBQchNELG0AdYUAMnQu4CwQE3faGnCY3zvq?=
 =?us-ascii?Q?gU/A28tfMEdEJaxyPyS3oYw6I1Z7Ph0dm9x8M2EQEQcJfAFVMjN4bKSQ48IN?=
 =?us-ascii?Q?9aPUgCbe5zrpi8jmwI/f5ZIIH1iAhbirqBNuDTX2B8ArSTVQgec5yXJTzPW1?=
 =?us-ascii?Q?Gi8q4I/CPUaw18KtiwIT9HTQDx0=3D?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: aeb0595f-075c-42c4-61b7-08d9c5722864
X-MS-Exchange-CrossTenant-AuthSource: DB9PR08MB6748.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Dec 2021 17:40:34.7058 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uPs+XbQenR7DY/2xjOfcdpEPEObFAck3b2q4DofIJn7aqr7cO8FNxiELSNV9rruM0BWoQDtG5RbZFOJ97ITEe4rUkdxl/BBdlZD+9WaE0Vw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR08MB2988
Received-SPF: pass client-ip=40.107.7.109;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR04-HE1-obe.outbound.protection.outlook.com
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

This will be used in the following commit to bring "incremental" mode
to copy-before-write filter.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 include/block/block-copy.h |  2 +-
 block/block-copy.c         | 14 ++++++++++++--
 block/copy-before-write.c  |  2 +-
 3 files changed, 14 insertions(+), 4 deletions(-)

diff --git a/include/block/block-copy.h b/include/block/block-copy.h
index 99370fa38b..8da4cec1b6 100644
--- a/include/block/block-copy.h
+++ b/include/block/block-copy.h
@@ -25,7 +25,7 @@ typedef struct BlockCopyState BlockCopyState;
 typedef struct BlockCopyCallState BlockCopyCallState;
 
 BlockCopyState *block_copy_state_new(BdrvChild *source, BdrvChild *target,
-                                     Error **errp);
+                                     BdrvDirtyBitmap *bitmap, Error **errp);
 
 /* Function should be called prior any actual copy request */
 void block_copy_set_copy_opts(BlockCopyState *s, bool use_copy_range,
diff --git a/block/block-copy.c b/block/block-copy.c
index abda7a80bd..f6345e3a4c 100644
--- a/block/block-copy.c
+++ b/block/block-copy.c
@@ -384,8 +384,9 @@ static int64_t block_copy_calculate_cluster_size(BlockDriverState *target,
 }
 
 BlockCopyState *block_copy_state_new(BdrvChild *source, BdrvChild *target,
-                                     Error **errp)
+                                     BdrvDirtyBitmap *bitmap, Error **errp)
 {
+    ERRP_GUARD();
     BlockCopyState *s;
     int64_t cluster_size;
     BdrvDirtyBitmap *copy_bitmap;
@@ -402,7 +403,16 @@ BlockCopyState *block_copy_state_new(BdrvChild *source, BdrvChild *target,
         return NULL;
     }
     bdrv_disable_dirty_bitmap(copy_bitmap);
-    bdrv_set_dirty_bitmap(copy_bitmap, 0, bdrv_dirty_bitmap_size(copy_bitmap));
+    if (bitmap) {
+        if (!bdrv_merge_dirty_bitmap(copy_bitmap, bitmap, NULL, errp)) {
+            error_prepend(errp, "Failed to merge bitmap '%s' to internal "
+                          "copy-bitmap: ", bdrv_dirty_bitmap_name(bitmap));
+            return NULL;
+        }
+    } else {
+        bdrv_set_dirty_bitmap(copy_bitmap, 0,
+                              bdrv_dirty_bitmap_size(copy_bitmap));
+    }
 
     /*
      * If source is in backing chain of target assume that target is going to be
diff --git a/block/copy-before-write.c b/block/copy-before-write.c
index 5bdaf0a9d9..799223e3fb 100644
--- a/block/copy-before-write.c
+++ b/block/copy-before-write.c
@@ -170,7 +170,7 @@ static int cbw_open(BlockDriverState *bs, QDict *options, int flags,
             ((BDRV_REQ_FUA | BDRV_REQ_MAY_UNMAP | BDRV_REQ_NO_FALLBACK) &
              bs->file->bs->supported_zero_flags);
 
-    s->bcs = block_copy_state_new(bs->file, s->target, errp);
+    s->bcs = block_copy_state_new(bs->file, s->target, NULL, errp);
     if (!s->bcs) {
         error_prepend(errp, "Cannot create block-copy-state: ");
         return -EINVAL;
-- 
2.31.1


