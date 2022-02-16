Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BFED64B91F8
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Feb 2022 20:59:16 +0100 (CET)
Received: from localhost ([::1]:55322 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nKQSJ-0000Uw-Rw
	for lists+qemu-devel@lfdr.de; Wed, 16 Feb 2022 14:59:15 -0500
Received: from eggs.gnu.org ([209.51.188.92]:56144)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1nKQG8-0003nl-Ng; Wed, 16 Feb 2022 14:46:43 -0500
Received: from [2a01:111:f400:7e1b::707] (port=17600
 helo=EUR05-AM6-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1nKQG7-0006Dk-6U; Wed, 16 Feb 2022 14:46:40 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PQfs5dmjo3EGylAugLqf307JPMrt2NtoZkifagSaiLVMCkd5SV8T3YGetODTrGsey6UJMXhLj1NG4iZtItDZlds3GA9fA+BvuviCfQ1fg88jFR/dUcmC4rTq+MPrU8701uqE4z/7gfdUZWvMO7WenAzV4mE3IPuNFKHE8HQY/8jKHSamoaX/E7tM+R5FSt+rIeLi789c3r3WgaF0ug6hPG2CoSQJqk+JafPQj1xwUwx9DBx2eaNscq49VMjtcLSVh2T4qxd0/yTDe7cVqAXc4BxnpCcqOhlSvZW3or7fbJduOEi/VoldJgArEybg/clSEDjD2n3/rAfEn85qSOwXvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ca8vM/oTqjTB8b5Pi2Mz4F8t/yw948dRrpl+Gsj2CCw=;
 b=UNS4WaXXTMijp8exlF3d7TzqP8tnnYhYBvEz+dgSztSXyBsJ1j2nUFeSuXksRSbUiovjuUV2PKrpGxsp7ftOBQQJCA1x5xBZ8B1KIz5MmVBcl7/1KX1XynrczrfW0dRBb4DqCq7C3WsMRwyIPDz3nB+H/ZpkaL/2peHD/LAM5//MmmbqEvrDYd4HbyJVLxccOSIz5g38sZyIiF2zMxa8AaZsKbjigjSxKPrQFUX+XNKoCw3REa+nRzOPyvps0WUSulztSPdVu6mbTIDY6i6O7FzVgDjDRUstJj35OJqX0fBToka37EEoQgLcbkgz/YdiDZHxJx7DP+oz2GzO+R3WRg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ca8vM/oTqjTB8b5Pi2Mz4F8t/yw948dRrpl+Gsj2CCw=;
 b=wvIKkPYtggrynRMRpkq1bjGT7PNOV1YjdH/n9LzA4XSdwCvWVbadvBwPsd4i0kGHjzaqD7xWdSTmAiR63pu/9LXWZ0OrPW4DUTDqLnerEogzzU4TiPuJgnvEtH/6Pd8NsMXTqlHBiayI1sNCdVprjcTkesD9QrbbSGWNYiIhMv0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from AM9PR08MB6737.eurprd08.prod.outlook.com (2603:10a6:20b:304::18)
 by AM4PR08MB2851.eurprd08.prod.outlook.com (2603:10a6:205:d::33) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4995.15; Wed, 16 Feb
 2022 19:46:29 +0000
Received: from AM9PR08MB6737.eurprd08.prod.outlook.com
 ([fe80::49c:67e9:3e24:8714]) by AM9PR08MB6737.eurprd08.prod.outlook.com
 ([fe80::49c:67e9:3e24:8714%4]) with mapi id 15.20.4995.016; Wed, 16 Feb 2022
 19:46:29 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, armbru@redhat.com, xiechanglong.d@gmail.com,
 wencongyang2@huawei.com, fam@euphon.net, stefanha@redhat.com,
 eblake@redhat.com, hreitz@redhat.com, kwolf@redhat.com,
 vsementsov@virtuozzo.com, jsnow@redhat.com, nikita.lapshin@virtuozzo.com
Subject: [PATCH v4 05/18] block/block-copy: add block_copy_reset()
Date: Wed, 16 Feb 2022 20:46:04 +0100
Message-Id: <20220216194617.126484-6-vsementsov@virtuozzo.com>
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
X-MS-Office365-Filtering-Correlation-Id: 5041a10e-00de-47c9-06c7-08d9f1850666
X-MS-TrafficTypeDiagnostic: AM4PR08MB2851:EE_
X-Microsoft-Antispam-PRVS: <AM4PR08MB285105049BCBE49EDBA0237AC1359@AM4PR08MB2851.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:69;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: zLgn30JjW4vJwGxlM7jkKJNEwYrG+CwFZTCHUlR6nH9FAnC6mPoosn2Ht445/IX8u2WI5+L/r5zeZhf3r5cqV3etMFVIBVqTrLZ72uJ7A9G76/s32v+9S/h7/CyEqzkSLwBj31z799a7ujRsyuPXILTrJwRfIfZ5AQUSjJy8d2Fg0l74qlPNt5G2xmB2fNE+rawuyVdZV4GZlkNqfAZXjXI6dptjzUM0rbtYRpb3EY0ltoj3qaymem3cd79F8Mj6hJjAJB+sBEYM8b0JwLrY2ak75MCXWMkO6uPj3AEecrD8tMWiyIX4gAm5FZwMMl2mikFXwZjj5EJzMeiuPe5okgfuw/7POE/pnKLx/VqB9qJ74PbkS9eXWgnVMzXWMy5sbK5Wd/aVszmAyA+kMETS2xmyD7loNJV87mO979Ltpz0Qzy4IoRwAIeYj0VD27JmPh7JvUKnCKzTX0jAFuheB0mEiLyJdMJyuut78K5mQZh5HzpMBSsh7RUIh2Fz9jFgH6iKSeUaKaQaraV53nssFyX/v+U3T1Yz9Z1k+wgDcXuGrwwBqi8DxCLefHoxengA9tNdMIOc30RVsF7U2BuGI7L0YTf34aUBN3un4Yu+vhfzmhAykrJTGH0IZSDsqLw/s2lk7bLbbX1ypmuGLJOZBedOJLc+AO7Z62BXoiQ0DlvbuGiC7mLybB63k2BsaBwz2Nlg0KeYMGr1vzVTEC/9X9Q==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM9PR08MB6737.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(52116002)(7416002)(6486002)(1076003)(36756003)(2906002)(86362001)(83380400001)(508600001)(316002)(6916009)(5660300002)(66946007)(66476007)(2616005)(6512007)(66556008)(8676002)(107886003)(4326008)(26005)(6506007)(8936002)(38350700002)(186003)(6666004)(38100700002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?g+0Sz2XLs5zzwRt5Vaew7fpSrphq1drdTmp+jUnGKWKnS7NaiTi/tmWIhrJ+?=
 =?us-ascii?Q?PPHA5MRUyibkvGt5mI2ayqSQ4vceynFffhxSLLnC7XZPuoug5PaqqWoWKXR6?=
 =?us-ascii?Q?bfHuPbeOoh4eTovT0uIhqFWkoedoXhvAAkG1gVJWDTfTMH0M9SzBJ8/OSAi0?=
 =?us-ascii?Q?vyBX63E+SvCzHuxsoQZhAWQaJ5/soY7ufjiuGF855nhaaoP9dRqYCWL6Vn1N?=
 =?us-ascii?Q?QZvHDSiUZc1ibaaUcrQSmJY0W//f/1ySYy6rGSv+Z1VIcb6tjQ78Z19wIEB+?=
 =?us-ascii?Q?IcIISUgkDfNnr3/0VDAv08En3wQTUxPb0QY0af91cucBw4+cY75v4ECB3anG?=
 =?us-ascii?Q?VoO77Px+19IrZXpW2M/dO8P28wVkIyKS6w4ESHMaJMGDyVR89VQoiiKNhea4?=
 =?us-ascii?Q?ez0+5zj7PbN7PkLz1q1WKaZcmbbFk9zWlyj+iiAkWyAzFk0mbfXYGnyKmTgR?=
 =?us-ascii?Q?75VLu4iTEoeCX39kblnHe7/p09jmjRErJXnqVA73KyjQ6PYWDVQ2uQIbEhVw?=
 =?us-ascii?Q?mpZvI30rwGTJ09z5zMwgo1fNIofE8ZrGBTjI3nEetfK6VZ/WlYkf+TueJuZ1?=
 =?us-ascii?Q?6TUjWjhbWznXn+1gjpxLGduGqFQrYsi6MGQ+uXVPijKM0qQ2jHhMJfaaqeAP?=
 =?us-ascii?Q?BlKEhHOa1lb/dyIC6zzagmY7azHTD6zeolYy7RV4UgdjzHeRLCyk03Yct6oA?=
 =?us-ascii?Q?en+WIwNpReK99ON8g0DboVANjj3xaKAt3zX/xNw8kPV0BXipEe3ebprfWqqf?=
 =?us-ascii?Q?w9UW8rlRzuntVkheMUi4+nmH1T4aCTWbT0ZigRQ5TDPFtNZOlwX8zmkw46JO?=
 =?us-ascii?Q?bTQtZgksrGWHypghUqx5gbGP/0ZZ0opZhavFaMU1GrkDeaS5sgAsfXpBIyu5?=
 =?us-ascii?Q?36ClWe3Y+b1+mOLnSsnlKWx3exe2T59jvLT4L9obSMGiFObywo3bRlT8nSAj?=
 =?us-ascii?Q?4A+HTpebsRuB5UCnhJ/EYBlB2SrPeAoejta8eN3yCA+gI/i4mF1wDxqS0EGD?=
 =?us-ascii?Q?X7YxCccWsXax399vZ0xzrMTk6jTcmdp+YBuQXGjmjGFohgQPRCMzgHsssSpM?=
 =?us-ascii?Q?FQZp2qmlHTKWrvAaZfNoHVu0zH9AjiSeFRbJghFOcF7mHmiRFhLBJrxiL+Ry?=
 =?us-ascii?Q?YKfRiDgbtYeQ6oKZrOKn866aETmJwcJgFH93R3bmfYYu0iBIxqaapK1S5d5h?=
 =?us-ascii?Q?NX3laWwolY6C1MLE+he9Gh8znEWtS+xjQsGIUcL/mzazJD8yLmx1LFCOnyRN?=
 =?us-ascii?Q?3GdUj2MXzOA0T/c35x/u/lHDZQC2ud2lzBe2tLke2ck+tdOWXfnk2OtDgTqn?=
 =?us-ascii?Q?Gfo0HbQFR5IYDRKmQcrJOBw+9jInFE82PSHGB4peCT8yq+dpGxprxswjBckR?=
 =?us-ascii?Q?3pTW3JI5ZgrAokh91MHXFuCVIt5x9n7SzkJdv5dsWItm7EBry4zr8M8MjvJs?=
 =?us-ascii?Q?wvqHCuvn4H57gwRAivMvpm/65l9KiCK6XDi5n87hOGQDs4jaFdjA2qOvtM/O?=
 =?us-ascii?Q?cLKXm6MZee71H84CGEUU65dthk6uNGfX0xo+grv5FCcXi/2S5wjDR/nCgJcX?=
 =?us-ascii?Q?TU/dOyjq+Z08+ykNGjlzLnSHT+7SW8gfSNCZPcMdIGgN+Lzxe3NT+MWaTF2b?=
 =?us-ascii?Q?L+APQXDLNCAiYVBR8q9LcbP6VNPQAv13tQc4x36BgGdOs4SHZhVGNTsGl/uN?=
 =?us-ascii?Q?FkuHcA=3D=3D?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5041a10e-00de-47c9-06c7-08d9f1850666
X-MS-Exchange-CrossTenant-AuthSource: AM9PR08MB6737.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Feb 2022 19:46:29.1023 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZnrIDEyvRgE6GIDd3+gxkDCtIVaZAU7hqlsFGG/hYDckVRzGksNifCFznyxp8Ygl3Q8BFCE0lbel3Nds+VcRpOhvX2TPVLsvk0MWGsf+C04=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM4PR08MB2851
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a01:111:f400:7e1b::707
 (failed)
Received-SPF: pass client-ip=2a01:111:f400:7e1b::707;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR05-AM6-obe.outbound.protection.outlook.com
X-Spam_score_int: -2
X-Spam_score: -0.3
X-Spam_bar: /
X-Spam_report: (-0.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.978, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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

Split block_copy_reset() out of block_copy_reset_unallocated() to be
used separately later.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Reviewed-by: Hanna Reitz <hreitz@redhat.com>
---
 include/block/block-copy.h |  1 +
 block/block-copy.c         | 21 +++++++++++++--------
 2 files changed, 14 insertions(+), 8 deletions(-)

diff --git a/include/block/block-copy.h b/include/block/block-copy.h
index b80ad02299..68bbd344b2 100644
--- a/include/block/block-copy.h
+++ b/include/block/block-copy.h
@@ -35,6 +35,7 @@ void block_copy_set_progress_meter(BlockCopyState *s, ProgressMeter *pm);
 
 void block_copy_state_free(BlockCopyState *s);
 
+void block_copy_reset(BlockCopyState *s, int64_t offset, int64_t bytes);
 int64_t block_copy_reset_unallocated(BlockCopyState *s,
                                      int64_t offset, int64_t *count);
 
diff --git a/block/block-copy.c b/block/block-copy.c
index 8aa6ee6a5c..0834e29b6e 100644
--- a/block/block-copy.c
+++ b/block/block-copy.c
@@ -692,6 +692,18 @@ static int block_copy_is_cluster_allocated(BlockCopyState *s, int64_t offset,
     }
 }
 
+void block_copy_reset(BlockCopyState *s, int64_t offset, int64_t bytes)
+{
+    QEMU_LOCK_GUARD(&s->lock);
+
+    bdrv_reset_dirty_bitmap(s->copy_bitmap, offset, bytes);
+    if (s->progress) {
+        progress_set_remaining(s->progress,
+                               bdrv_get_dirty_count(s->copy_bitmap) +
+                               s->in_flight_bytes);
+    }
+}
+
 /*
  * Reset bits in copy_bitmap starting at offset if they represent unallocated
  * data in the image. May reset subsequent contiguous bits.
@@ -712,14 +724,7 @@ int64_t block_copy_reset_unallocated(BlockCopyState *s,
     bytes = clusters * s->cluster_size;
 
     if (!ret) {
-        qemu_co_mutex_lock(&s->lock);
-        bdrv_reset_dirty_bitmap(s->copy_bitmap, offset, bytes);
-        if (s->progress) {
-            progress_set_remaining(s->progress,
-                                   bdrv_get_dirty_count(s->copy_bitmap) +
-                                   s->in_flight_bytes);
-        }
-        qemu_co_mutex_unlock(&s->lock);
+        block_copy_reset(s, offset, bytes);
     }
 
     *count = bytes;
-- 
2.31.1


