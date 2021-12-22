Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 27E6747D5F3
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Dec 2021 18:44:24 +0100 (CET)
Received: from localhost ([::1]:57224 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n05f4-0003sW-VF
	for lists+qemu-devel@lfdr.de; Wed, 22 Dec 2021 12:44:22 -0500
Received: from eggs.gnu.org ([209.51.188.92]:52380)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1n05bY-0000Ul-5H; Wed, 22 Dec 2021 12:40:44 -0500
Received: from mail-eopbgr70109.outbound.protection.outlook.com
 ([40.107.7.109]:22241 helo=EUR04-HE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1n05bV-0002WE-Op; Wed, 22 Dec 2021 12:40:43 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RNnE9GS3Nf+fNOLM60f1KgNXTjU0w8dAvFvsuLG+Pr0FP70ls5vi8uX5y5jHW3sCwcaBqQ942ZLbxtagLVPpLZGHp8Za/xxYjiVkOyaycrQq2b8yBTt5NkKbQNF9LzlObKk+pZFTj7lBysEOQL2EFqIxfrf6BQSwFxZDwJ0YzsGZIcnwfBLfL+r5HZz9bvUKq/QBwgI3l+ziKXrKQ2uhlZnwV/3rL/9IkWZ9tRsUUTVZGl3tPpjpaoX9w8euOkGGimAPZoN9vss/xc6nSwj2G1dbUP0Hum2TKjyvdbQIyWVL2gK42T1gIQwTgBL1WokgXPj57pxDWBcQ1ZsYT63LNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0W+c4GEJzYkqtX+5Fp3LT0W2so0PT2e/4svJn4jayjY=;
 b=M1ESPaJmM0FTWxPgwMrngiFjJkDDs1is6ylF36o+mD+z6/DIwzVacv7Zi+nZAKbLpb/AMbejqlzt4HK7eqrQg2wkJLYQ+7daBRlroVI3KfGAi/vT1EpcocL4s4M+vrej5/ZfS/uK1EwH6RQ3tOlQKChIfosB9FiV8hrwWg1TfUz96vBc06WxJVdznLrL8bM/xyXRCQpLb8/OpmX28d3sCUGJ4TM6Xh6J+ASr/ZB1m8flo27HznZfMX1Bxl5smufdikHT50jF/FzsSXM0GRr6rwuQlRK7zhwmn/I0psryb2eDKGvXEWciU+fkMXv2adxnzITIOz7IZqNqlZ/oKhRlEQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0W+c4GEJzYkqtX+5Fp3LT0W2so0PT2e/4svJn4jayjY=;
 b=f7jU1otXwf5ifFc9rXrj9Pq091MKpcxhYz3OROE+wRmw3eccyazZDFYnaG6j9XKttrtUpUcjPc6wEj8M1nCNDWG1y7pF47u82RFoJxKOaV94kxtXCIt0D8c9ekh0j75w6Ugrfr7y/UC0HEe2zl+V0hp7RZEZaRQ7W9TUxjgF4ao=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from DB9PR08MB6748.eurprd08.prod.outlook.com (2603:10a6:10:2a7::16)
 by DB7PR08MB2988.eurprd08.prod.outlook.com (2603:10a6:5:18::25) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4801.17; Wed, 22 Dec
 2021 17:40:33 +0000
Received: from DB9PR08MB6748.eurprd08.prod.outlook.com
 ([fe80::a89f:c7bc:b9f8:fc3e]) by DB9PR08MB6748.eurprd08.prod.outlook.com
 ([fe80::a89f:c7bc:b9f8:fc3e%6]) with mapi id 15.20.4823.019; Wed, 22 Dec 2021
 17:40:33 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, armbru@redhat.com, xiechanglong.d@gmail.com,
 wencongyang2@huawei.com, eblake@redhat.com, hreitz@redhat.com,
 kwolf@redhat.com, vsementsov@virtuozzo.com, jsnow@redhat.com,
 nikita.lapshin@virtuozzo.com
Subject: [PATCH v3 01/19] block/block-copy: move copy_bitmap initialization to
 block_copy_state_new()
Date: Wed, 22 Dec 2021 18:40:00 +0100
Message-Id: <20211222174018.257550-2-vsementsov@virtuozzo.com>
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
X-MS-Office365-Filtering-Correlation-Id: 30844477-f71e-43c4-448b-08d9c5722765
X-MS-TrafficTypeDiagnostic: DB7PR08MB2988:EE_
X-Microsoft-Antispam-PRVS: <DB7PR08MB2988EEDCB2016ACD21B491FDC17D9@DB7PR08MB2988.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:48;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 9Or2O73p0HqTKBsMXiDIUz31c3VgK9PJKpfWBwTqAWAVkjRHbKCW6fFdUszeUzWIZjzsgWO4ZVvONYFRoEtV1nf/oKpknhDBmwrnfkUtWpKaghWyCSLDW5uL4Xn3rcJwUdlTWrd1Kl7BlJc2+uePiKQW0KeBE6JWYph7KIP+CYuAXwkDQ74mQNtPyUrd8bywtcvRH0YW+HFvaS5lUi/IqPa8MNROi/XTfGuA3GxF4ddsmXOBvTFHiRc9fruc+vfJcPAlcvJDKEd8sipJwSPFX/LY2I41ySqjIniOuwCV/FWnL8GEwjFj5bj7/2yUhOfem88fkS4O4VKvgIZWXH3qL5XSBqRBq5/kv2whxBh4evhs8+mfrL4B7aggpSaV4NQNNJ4RvVAdClXu+5yiTbCGzE+yXENkgxfYQRT8lU1avYrUi44GkwKVN8fo4+RUQ0dCHDhzHA6nUJrkikbFNNT/TOV/sIlwURWOApbvSOOazhU/UmIbUrSSITxHx3jDXPEok+2L0aDbu3psSzYmrDOuWLdPxoszeQ3cq9bxZKUhf0KnIC6K71SKJ53OV7fDnt68gAMihLvIGOhAi+FNKjH0EsMNq+Kx2itXjH/lYQR6aARn8MZgR6cQtJFqGBSai48PEqrdZsKelWBJktBpntGNYhQ3dwAn4W85GuLFC22K/ofLNYKQ8/6A0roZXUC1oeYVR+SP9eqFHXkNH9dE+w1W0A==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DB9PR08MB6748.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(66476007)(6486002)(66556008)(38100700002)(66946007)(8936002)(1076003)(86362001)(83380400001)(5660300002)(52116002)(36756003)(6916009)(2616005)(8676002)(38350700002)(508600001)(6506007)(4326008)(6666004)(186003)(316002)(2906002)(6512007)(26005)(107886003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?vUDru4V0SxC73OkkK4QmFezQYiCu4h5S3gWYFiXz8ElGFabQSXupNfQAFRIq?=
 =?us-ascii?Q?N9RxZSG9/rThdxSUWQD2qv83AjP3V5nRuRdJKrPn7o4yVH1sAD/xZ5B6HnaE?=
 =?us-ascii?Q?SYHLmActx7JYod7Py4yecPh2mYMDcxKQOkALmldEYseXdQoV0iQusj7JVKx4?=
 =?us-ascii?Q?RqCx1/5nGGIKBFkaks1sZC9oxw4h/SzpQXhgmYhCvNoEEbK/WJddBZzr0+Xx?=
 =?us-ascii?Q?VjBm+20H9c0J66GVuGLaZ1BZJHXIl+cJwxJjFuJSzLrDSXzxcmA9gXhzAByT?=
 =?us-ascii?Q?9uf4joddAw5d1+SlJXOkHUalyjFLFUG938Bp112599WDFAz/XGN0eTLv1Uv9?=
 =?us-ascii?Q?QFWldiw7mE+GKJS5Ynxyx5AdC92yCfFiIjCd2jABsCVpFcDSok43Cyu5nv56?=
 =?us-ascii?Q?bY6PbJZx/dRCOfdybkHmy3/efaipZB786QjEJ1jq7f+8PMkojkx1ma9LJkTc?=
 =?us-ascii?Q?k+dLwMHV0SYLNpbw1/gmQxD4tf2suubyAEG3EQ3uaVq0NTFrS146CZlRXZqe?=
 =?us-ascii?Q?l+YiYzArps9bPG8tiMV7uILJt6wrGF0LJfq27V+r97Ge/5SWdrjeDwzMl2W7?=
 =?us-ascii?Q?daNX8LDM1VbZrqDyfX4daZcEqMReVXvMFdUL1OSJ788xGCnES9RH48WY3jEX?=
 =?us-ascii?Q?LY4PqxOyo8Rk3FXlnAQc+9kI0Sbhmk3Hf6adSWnnriLByGUkuiGyhCUtZ0/h?=
 =?us-ascii?Q?wflLBrj6j+nJYpZMJkuOxOjOJcJpgeTKYU6eVfsF2IPBrWt7z+xM6c/8P3G3?=
 =?us-ascii?Q?JdNZWPIqAOfNR0c/s8oyX2PyI6ErDDR/txfVx3+tv+l9W6VKiFDN2YusK5F8?=
 =?us-ascii?Q?/K/0+gajR4wG3rAI5a+z4KFZvQm+VeyfaTfXF5YcLDm8r3Tg+emrh7wqIJxX?=
 =?us-ascii?Q?fQ7DJtLOd8XaTth9NGXDt/WwpNeLpBfgq90Rb7t8+/NBkZrd3qjtCmq14vgD?=
 =?us-ascii?Q?pMDO+G0eo3J2AX/BNzWsgFquQtouN6TJvvlveTc+YjOlBJU2VKgz2DayJzTc?=
 =?us-ascii?Q?TnOuMbFVIMpSqHZ6mi2Eu+XzjMTRfg8CA/sQRkZEWKDVkcsWT9/EpuynG2CQ?=
 =?us-ascii?Q?dnu9uVuMttA+SoHIBwF0Vqroa52xXpvYzgPgPfbIMIqhDaxOwbDI19eUNtrW?=
 =?us-ascii?Q?t4ITdQOXyRyxDyXmErWQvfY1hF4hZX+Kt/PlTqEDyE075TexkS1FCd14hatO?=
 =?us-ascii?Q?+SRQ3NVggw4pdasZ/I19aUfsYx7+fuCF+ckMAbciNMSs6H87mWNXkcNOeU66?=
 =?us-ascii?Q?ol2l51B6cSxjejgjA3w5vpbdWljWy+nAbDJrkykVyXyq7jTFDxrhIO5yIidq?=
 =?us-ascii?Q?jLBUPPQv0mkhhWFU8mgN8WoJY72fAAYiD4cZERSfBht/cbp70N6rXtEXdYfU?=
 =?us-ascii?Q?hKpAT6uVwYypOlPQq3z1/kG6X+cC6OPny9SYZ0QUocXzqfr2Ab0J9AZo7tMi?=
 =?us-ascii?Q?JMhM3jTXJDLEGrG/gqI9lFRz5LLfS+KWVNGFwc+KQvIqM0tgJhwDR5uSOnsF?=
 =?us-ascii?Q?vvrq1tGeOyA6syaXOBYw+Czi8ZIKSXCqAnZPhhbu5ytsMM8h75u6kil467Gr?=
 =?us-ascii?Q?oxymITLKuBoxOo6H5jpTQ6rNRqpDV+2pxZNDcJWq98kMJznxNysxGz9rt3SN?=
 =?us-ascii?Q?VLd2NBSs+ZvS7U5RgGB2EhGApJP2uFc3VuoXz93DMx+1KKMs8eWuEh2KOCuz?=
 =?us-ascii?Q?dEoW2xq4ekYycqIHODIcFD+RJmw=3D?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 30844477-f71e-43c4-448b-08d9c5722765
X-MS-Exchange-CrossTenant-AuthSource: DB9PR08MB6748.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Dec 2021 17:40:33.0027 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kYCzqv+Eks8KXK2vC9k6gi5kVs3KXyOfjHqeGd627Vqe8QRLK3niPvpWrPmWBbz/ekcsm0qg0PUczsvZR+DSaHcZXKNAN3aY7S53v3hT1iU=
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

We are going to complicate bitmap initialization in the further
commit. And in future, backup job will be able to work without filter
(when source is immutable), so we'll need same bitmap initialization in
copy-before-write filter and in backup job. So, it's reasonable to do
it in block-copy.

Note that for now cbw_open() is the only caller of
block_copy_state_new().

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 block/block-copy.c        | 1 +
 block/copy-before-write.c | 4 ----
 2 files changed, 1 insertion(+), 4 deletions(-)

diff --git a/block/block-copy.c b/block/block-copy.c
index ce116318b5..abda7a80bd 100644
--- a/block/block-copy.c
+++ b/block/block-copy.c
@@ -402,6 +402,7 @@ BlockCopyState *block_copy_state_new(BdrvChild *source, BdrvChild *target,
         return NULL;
     }
     bdrv_disable_dirty_bitmap(copy_bitmap);
+    bdrv_set_dirty_bitmap(copy_bitmap, 0, bdrv_dirty_bitmap_size(copy_bitmap));
 
     /*
      * If source is in backing chain of target assume that target is going to be
diff --git a/block/copy-before-write.c b/block/copy-before-write.c
index c30a5ff8de..5bdaf0a9d9 100644
--- a/block/copy-before-write.c
+++ b/block/copy-before-write.c
@@ -149,7 +149,6 @@ static int cbw_open(BlockDriverState *bs, QDict *options, int flags,
                     Error **errp)
 {
     BDRVCopyBeforeWriteState *s = bs->opaque;
-    BdrvDirtyBitmap *copy_bitmap;
 
     bs->file = bdrv_open_child(NULL, options, "file", bs, &child_of_bds,
                                BDRV_CHILD_FILTERED | BDRV_CHILD_PRIMARY,
@@ -177,9 +176,6 @@ static int cbw_open(BlockDriverState *bs, QDict *options, int flags,
         return -EINVAL;
     }
 
-    copy_bitmap = block_copy_dirty_bitmap(s->bcs);
-    bdrv_set_dirty_bitmap(copy_bitmap, 0, bdrv_dirty_bitmap_size(copy_bitmap));
-
     return 0;
 }
 
-- 
2.31.1


