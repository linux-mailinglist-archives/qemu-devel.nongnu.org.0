Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C59B84B91E9
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Feb 2022 20:56:25 +0100 (CET)
Received: from localhost ([::1]:49264 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nKQPY-0004iO-SQ
	for lists+qemu-devel@lfdr.de; Wed, 16 Feb 2022 14:56:24 -0500
Received: from eggs.gnu.org ([209.51.188.92]:56106)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1nKQG6-0003me-Iu; Wed, 16 Feb 2022 14:46:38 -0500
Received: from [2a01:111:f400:fe08::723] (port=55682
 helo=EUR03-AM5-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1nKQG4-0006EC-57; Wed, 16 Feb 2022 14:46:38 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KU9y8vVumbaPeqkGDmLAnGeQYmyoZXU7NgY/C2m6ufyDPYJphovf9fYQX1idAw+b0rI2ByELbzL+Hp6Lv4aNt56unt5vnFT6eywg7nV+dXhJ/4RNkBTdXBjGASHHmxEzoIiJeR29AIUoGDLo72R6f2J6hIPiReMR6q6mchT5V58CIN4jz78Z51VWUeznpFTqu2R/OHZwX2iNAJPSjSWQpnYgJ4r14z5PJkxK7umy31oUtxgwyc1cZak+0z5MFkFfxdGuR+tDZWQ3MLUOhti6NKifY5x2+A+jvaBrmt66KYzKoSWX4lTNXbPFpwRT+2kNUVlr8S1ebAqjoY83bq80zg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kTbVgi111p9ie3iLsxC0pOgHY1Obwf7KDXQPxiJ63Gk=;
 b=oBSugvH3RwC7Oqb0zQcICPftg6MuQSJovCxnThJW9yyepyO4MZ8LO65nEKnQNILU43B1mWbw8SdBYchmfuUih38vGBVdaSiKHrEkJ0cevqrAurDPcz8FQladhmz33fwyrc9+bDza9Op7EA1FAfST4Q2cCofr3UqNYE5UfyD5T/cN0RE6wL6sfU8V8Vgznlxso+w1vKLdeFuoEqTWzW5dxMKH1W9Bqu7ED6OwQmbpqY/HwU2SKNRaM9lN6NGcJbpXv23VmoHwGsucPg1rTG11DeoYeNikjHAiLMF2vnockP1YOzupq4rNL2C7Bds47E+NxZZs+OWwTRBeVVGjaxw9fQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kTbVgi111p9ie3iLsxC0pOgHY1Obwf7KDXQPxiJ63Gk=;
 b=UCO3LVZRSMvoReadm27oBaDltYJJSg9n7tLc1FkTMWHfXXGP0VqvN5O3IzMNuNL1xNsnH3CO8087y/np/KNGZwCYWdQSKFdBMY4x9MyedoMEwHXgDW3RKqWOCk/0GE9+lCoSPMS4w7Q7WR2OiHNqMoU9ZvlXFfbGFpHtDLtVL6Y=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from AM9PR08MB6737.eurprd08.prod.outlook.com (2603:10a6:20b:304::18)
 by AM4PR08MB2851.eurprd08.prod.outlook.com (2603:10a6:205:d::33) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4995.15; Wed, 16 Feb
 2022 19:46:28 +0000
Received: from AM9PR08MB6737.eurprd08.prod.outlook.com
 ([fe80::49c:67e9:3e24:8714]) by AM9PR08MB6737.eurprd08.prod.outlook.com
 ([fe80::49c:67e9:3e24:8714%4]) with mapi id 15.20.4995.016; Wed, 16 Feb 2022
 19:46:28 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, armbru@redhat.com, xiechanglong.d@gmail.com,
 wencongyang2@huawei.com, fam@euphon.net, stefanha@redhat.com,
 eblake@redhat.com, hreitz@redhat.com, kwolf@redhat.com,
 vsementsov@virtuozzo.com, jsnow@redhat.com, nikita.lapshin@virtuozzo.com
Subject: [PATCH v4 03/18] block/block-copy: block_copy_state_new(): add bitmap
 parameter
Date: Wed, 16 Feb 2022 20:46:02 +0100
Message-Id: <20220216194617.126484-4-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20220216194617.126484-1-vsementsov@virtuozzo.com>
References: <20220216194617.126484-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: AS8PR05CA0005.eurprd05.prod.outlook.com
 (2603:10a6:20b:311::10) To AM9PR08MB6737.eurprd08.prod.outlook.com
 (2603:10a6:20b:304::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 30edab47-f85f-4397-f4d6-08d9f18505db
X-MS-TrafficTypeDiagnostic: AM4PR08MB2851:EE_
X-Microsoft-Antispam-PRVS: <AM4PR08MB28517F88168780E4D5BC0C15C1359@AM4PR08MB2851.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:27;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 1rJfxJJrNh0wUZ+eflbb908+p0foaLlPNRo9u7WBVLBW4cVdgJ+UGH1kgKEbRg0DVjnjo2O+43u78k4wO/7fX+xa8+w+w4wwGO3KMKKJA06xJI7qfW0D7IZpYM/WV16U6dNPGcXEUBsftHzwT2mIsueGD3XjVxuaTi7wWcf+qZjgvA9SSyO82PlL2KU83js11FHYSEaWmYrpnc6GxngBAA0fTroMR41ycaVPECZnYsm8VxLVZjJKvTayu2mqa3piC+4t36RindnHuRap2OOSBhSpXUG7lzHkFc0XoFvq6URKgJ1+ae/XD0aTyc+ts88PN7xqqO/erS8NOvYPrnB1p0/gDubgF8eUbmlxPcCx6KzFGZ3yRzyVJhyTweNz5NwZIXuQeiGaqglUHdY06q8r86sKJ3SwNDVaYtf6ZjBgPrCryY9/5+4QMRJZy+TTLNfsWKy/crhYsFosgu9IOqhIAUTx752my2e5lFbx6L7HMRqwZGQt1zP1Kga7YdvNa6s3TGzOxiL4i5eLI5oR6K/+uwD/YsJu3KrFCeOFmdOoLp035BHkbV/i7VfsqLP0BkCh8fPvJkGM0CFb0qeYLsN3zQ+EpzISeTOW26qBWLPqoXBZ8yl6re54pKSlI4dj7OH+BrdtY0IJ+2BxmmhAha/SQcBvGwQxkBIH2X/w5oeEl8IH7O3KM1PDZpoLys/Idu7bkG8t+jtxi/LVtWlI9kkqFw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM9PR08MB6737.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(52116002)(7416002)(6486002)(1076003)(36756003)(2906002)(86362001)(83380400001)(508600001)(316002)(6916009)(5660300002)(66946007)(66476007)(2616005)(6512007)(66556008)(8676002)(107886003)(4326008)(26005)(6506007)(8936002)(38350700002)(186003)(6666004)(38100700002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?XafbmGZ3dnQ1zeWNu/dOFncSKPz3Bg7GGs0hJzzqZLduZF9uEAyJrJwWJYzO?=
 =?us-ascii?Q?fZo2O/bv4kKHQeC1068g5edqTwQXPTwW/8vDdJ7PjivBtpbavdOlJM6rLQ/C?=
 =?us-ascii?Q?yK2B8UroiQWuK0kzItjQqrAZ6Wb7a+sk1DeUteloK2VsAkiLf8BnOKv0iL1L?=
 =?us-ascii?Q?izTWqQ/bTU5SkhsF+7kd3xFNBt42SoeWRdVSE8ZCzFEgdejcoTLLxgMe9r2i?=
 =?us-ascii?Q?hrAt5FlHieAsf0TPG8EsINl+bvw0ZbYV3kNsXSmsywpGUFLPG14uSSe7xXpH?=
 =?us-ascii?Q?tuNZXvcWmtppFAfIwlXzNl4zJ9hHNO5o3zy7miuxHcQ5yjvS+pniEsJIK310?=
 =?us-ascii?Q?4TzmXtAiNf/rD7zWJ1TYvYM4S3OPv7QG3n1CyDM2pMIjmWN5r6I02NjfPBjR?=
 =?us-ascii?Q?V8kp9P/0zTlrQgStC8EFZMoCVelpEiiFn8V/uN3MzSl4011ylYj+WHJw62TR?=
 =?us-ascii?Q?b2rQe9TAqtEazG/lZw4pnB94xJnemnQL92GRW2Ed3W1EFvk5WVDNzGukfiXl?=
 =?us-ascii?Q?jdYTfE6Cx3RRpdoH0ui5GeTmUAQsHYVxjovjqjP2FFEfjZMlduU6UzY5yVT/?=
 =?us-ascii?Q?tk5XFr7kVuKefE5r8ljWueH9QNbjETDACRJ8y2k5dIHLuAmzAyu4o0EdmOqv?=
 =?us-ascii?Q?yMNiwrFk8tEq1IlYnpLQB9f+TrZbckNIWWd8pWSwCVNUJTLn63z9RfEpQ9oL?=
 =?us-ascii?Q?HCQZ35UMm4Qyve1Ws211DNQ5AvrJRnP1SyXvlnB/3v33t8S190c6UMgcUMWN?=
 =?us-ascii?Q?GJk1AswmDx3jrhdKXzOAtg/AozrReTKbDiSUsrgoXD0zjLiRau1uAkqEIUPL?=
 =?us-ascii?Q?Qkb/g70EmU2JIgdHCQme7rHoipcSZ4fZB4QCH1IEH4qRB486ektL30iiU5gB?=
 =?us-ascii?Q?s+bRTB/4EeDIl8Oncm37eLnZABID5sg+tFQ6PTeYYlcQcL931YEZYDA5kNPw?=
 =?us-ascii?Q?qjK0gvgfGWXKub8Wtz7DkJr9FvSzLITkwsOrmZjVQZTHkafl/rUiV5neoFjf?=
 =?us-ascii?Q?xF3rCL5EWj6xAU8ccfquAQlafvdUPp5R/zA1tWbRshGJK2JLk6YXm1B2vV9E?=
 =?us-ascii?Q?y7WDaMOWOz2CJI1YFlSSZVhCabPdSsJfLA/EFNdGRZM/lqqsJBaEamc4QUh1?=
 =?us-ascii?Q?17QqIzJA1ec+CnH/ZdisIltwOHed9w5IkYy0QUmHlL+r5Eqyh+qryIhxnTV8?=
 =?us-ascii?Q?OIlZyh5QuvdFjRlePrqYaI6hGN8O45m+L1f6y4AiA2vfKbTMDWMGacMZBZ09?=
 =?us-ascii?Q?pPNiBhIn9KTmY5/paPwVJKjhxBMC71DjavbFLU1n2/8Ic09kUNqh0qrpv4Mx?=
 =?us-ascii?Q?fOEAPHtIv/McxAcykoya4b/UcM184H87+4SoYR96YYGF5aFGA6BXLmNUoJdM?=
 =?us-ascii?Q?vLnKLTy44F7p6HKgzzfKq4wxptayp5iEMs60TVCeDIAA6jl96xY3LbWVbV9j?=
 =?us-ascii?Q?wL6DVk2hst7skVWK6SBcHmZZHjwbSCJ5MPvinHNVSzymJX4nryUGzm4NI9ne?=
 =?us-ascii?Q?q7dvdHQiE4+lv8FhvWg1RLDaQlbEp6GfrQaXvo+tWqiLUN4vV/E2e2FweXwP?=
 =?us-ascii?Q?sDjhWsNT9tg0l0kia0YEBca+zmuobLlbzcewv4A6eZKOL5CGHVb+oQCXgpeO?=
 =?us-ascii?Q?8EquMPoKU9spIHePO1BlduuzdwtVs0I48s0D0mx2hguPDF4j03g/M8L4oGmb?=
 =?us-ascii?Q?CvzYvA=3D=3D?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 30edab47-f85f-4397-f4d6-08d9f18505db
X-MS-Exchange-CrossTenant-AuthSource: AM9PR08MB6737.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Feb 2022 19:46:28.1818 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: seCIls8Qpl3AQSPhNk/XLh/XnMNFnrCvNijrWMi63+Kvi1ZYKJKrSe8kWEgamda+JU4i5Ax+l+69JnmBft4KA84jTKAvpkR5kuuOn4DsIKw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM4PR08MB2851
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a01:111:f400:fe08::723
 (failed)
Received-SPF: pass client-ip=2a01:111:f400:fe08::723;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR03-AM5-obe.outbound.protection.outlook.com
X-Spam_score_int: -2
X-Spam_score: -0.3
X-Spam_bar: /
X-Spam_report: (-0.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.978, RDNS_NONE=0.793, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
 include/block/block-copy.h |  1 +
 block/block-copy.c         | 14 +++++++++++++-
 block/copy-before-write.c  |  2 +-
 3 files changed, 15 insertions(+), 2 deletions(-)

diff --git a/include/block/block-copy.h b/include/block/block-copy.h
index 99370fa38b..b80ad02299 100644
--- a/include/block/block-copy.h
+++ b/include/block/block-copy.h
@@ -25,6 +25,7 @@ typedef struct BlockCopyState BlockCopyState;
 typedef struct BlockCopyCallState BlockCopyCallState;
 
 BlockCopyState *block_copy_state_new(BdrvChild *source, BdrvChild *target,
+                                     const BdrvDirtyBitmap *bitmap,
                                      Error **errp);
 
 /* Function should be called prior any actual copy request */
diff --git a/block/block-copy.c b/block/block-copy.c
index abda7a80bd..8aa6ee6a5c 100644
--- a/block/block-copy.c
+++ b/block/block-copy.c
@@ -384,8 +384,10 @@ static int64_t block_copy_calculate_cluster_size(BlockDriverState *target,
 }
 
 BlockCopyState *block_copy_state_new(BdrvChild *source, BdrvChild *target,
+                                     const BdrvDirtyBitmap *bitmap,
                                      Error **errp)
 {
+    ERRP_GUARD();
     BlockCopyState *s;
     int64_t cluster_size;
     BdrvDirtyBitmap *copy_bitmap;
@@ -402,7 +404,17 @@ BlockCopyState *block_copy_state_new(BdrvChild *source, BdrvChild *target,
         return NULL;
     }
     bdrv_disable_dirty_bitmap(copy_bitmap);
-    bdrv_set_dirty_bitmap(copy_bitmap, 0, bdrv_dirty_bitmap_size(copy_bitmap));
+    if (bitmap) {
+        if (!bdrv_merge_dirty_bitmap(copy_bitmap, bitmap, NULL, errp)) {
+            error_prepend(errp, "Failed to merge bitmap '%s' to internal "
+                          "copy-bitmap: ", bdrv_dirty_bitmap_name(bitmap));
+            bdrv_release_dirty_bitmap(copy_bitmap);
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


