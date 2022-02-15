Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D91254B743E
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Feb 2022 18:59:32 +0100 (CET)
Received: from localhost ([::1]:42974 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nK26t-0005oT-MD
	for lists+qemu-devel@lfdr.de; Tue, 15 Feb 2022 12:59:31 -0500
Received: from eggs.gnu.org ([209.51.188.92]:46708)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1nK218-0006QK-L7; Tue, 15 Feb 2022 12:53:34 -0500
Received: from [2a01:111:f400:fe0c::71d] (port=64834
 helo=EUR04-DB3-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1nK216-0007aW-BJ; Tue, 15 Feb 2022 12:53:34 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jBS2zoJ84HJBRHSt7DGjzlRiNtpzLJQp5DKAv73/ndUGohbTG//NZAcsJKRr1X6pPNR+PkiKKuYTuzxhJ1qhySLhvFlCQTfjskko+WcqzWOMncGaYvjhrQ0zcS2lYtxxkOUD2QQ7ba3WODmTEwp6Uk9YuFst+H7bv0JCzs4S7DZav6dQbNximNtCaaUbVi0NcKcBTEgoMxRyNYBfQw0XFrHLamux/oLvLjJx8LIN4qzFMxipkpPXiWZ2abIC+I4T60jYjhJ9QXV7ymdYOSvlCJdWEHhCCp82XQn6HybTadtKXy3mUM8lBLk7+35oQ6lTWr5CqAXt4ZSfLx3ADRMWHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1sI84jtDtTHyZ/vJYtTfgGW2x+nk1QWJEqHypZ3Lc8Y=;
 b=J9XpXwvYEHCpo1Z6TW8hEtfdkkYLp8e4GjhAceLPUVJ+3hpBsApFTLRCDL5AyxpCSfFb0wIifAGRv18/zTHUEJ9nb2OJIx2gihp/6UnJYNj+yQSLis5FJkMLy6J3mj51xwPwWIXA+1ZSGSeSLdV9qWFZmpIipGg0j8roZfwh1z6UDwq/DtxaYQ8YYZUGn0xbXAmzKNJakyCcmIEVhHiRKLwIWVwjvtA+rUtAvLgUti0EQdE5ZpYN4TfbNm/eEQ7F9y8UlenLc32cmOEhyD9YVTkJxvdZWlL/dITqAIQ71vDAtjuNuTtevHyJgxb8HCC+0TNSNuCq8/llvRmb3N4X9w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1sI84jtDtTHyZ/vJYtTfgGW2x+nk1QWJEqHypZ3Lc8Y=;
 b=ne/qEgXCV9foC0zSOjqtqF74WGYIHTpV31ktzVFuW4RVVmV3McX0BPcJRK0ZkWVikdCcfPk6O02txG3mDqWo5LW3cdadov8hW+D4vlh09dn8tK9Jb8Yl/+Lp08hG0VP35M0FPPqz5vzAnxMQc3ZhvEuU7wFYowov5is74wI0eOg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from AM9PR08MB6737.eurprd08.prod.outlook.com (2603:10a6:20b:304::18)
 by HE1PR0802MB2235.eurprd08.prod.outlook.com (2603:10a6:3:c3::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4975.15; Tue, 15 Feb
 2022 17:53:21 +0000
Received: from AM9PR08MB6737.eurprd08.prod.outlook.com
 ([fe80::49c:67e9:3e24:8714]) by AM9PR08MB6737.eurprd08.prod.outlook.com
 ([fe80::49c:67e9:3e24:8714%4]) with mapi id 15.20.4995.014; Tue, 15 Feb 2022
 17:53:21 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, fam@euphon.net, stefanha@redhat.com,
 eblake@redhat.com, vsementsov@virtuozzo.com, jsnow@redhat.com,
 hreitz@redhat.com, kwolf@redhat.com
Subject: [PATCH 3/4] block: improve block_dirty_bitmap_merge(): don't allocate
 extra bitmap
Date: Tue, 15 Feb 2022 18:53:09 +0100
Message-Id: <20220215175310.68058-4-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20220215175310.68058-1-vsementsov@virtuozzo.com>
References: <20220215175310.68058-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: AM6PR08CA0013.eurprd08.prod.outlook.com
 (2603:10a6:20b:b2::25) To AM9PR08MB6737.eurprd08.prod.outlook.com
 (2603:10a6:20b:304::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9c1a7ae8-3215-4445-fcb1-08d9f0ac0dfc
X-MS-TrafficTypeDiagnostic: HE1PR0802MB2235:EE_
X-Microsoft-Antispam-PRVS: <HE1PR0802MB2235C587293A927753EDBA3BC1349@HE1PR0802MB2235.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:660;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: zapjNmrcjCv1AOQBRwWcyA6jWajboak+4FyRSoQL4OfXYOVbQD9xNV8MWRqMuA/ZwEd283csGcpbfxJgVPn6sBqwiqpE0W3xhqWB/94nnIxiFikByvweGEp1Kf96uOhgXF1X90Uskd7AznLV4DTUJt3pOgN5Ed8Gn7lHbJuDzcqt5e+tEB+CrsCLcaxTxf/FMk1Ka7uOCMUXuw78igw4Dw70fTav9IQcvErjUItyKb2soC03xCeMrnxOMEdgFBQdIp4FcAL4/2DaJZpho73F6LbxwPISjrRCcAgSfpLB/MAu/uu0SHBt7yuj9rM3op69xk0RKvpWAVYZPFPggU+KySR88HAVx2koUufKWepHKLd+zgxKzNNNs7WpaLJwAVguvDil/QNv2PRBDB6ksK4bCV/F5Us/C/xQLFKwv+UOQrCOvDwRpYASTFUt0by4D58i+VmYJsVsCi4cCC2/O990xLUQ4yuJ23hyOnlQ4qfylwne3lVvTKJifn15eXK4f7HXWjrdTDlgIalIlVl3/l8f6Jq4JxGKBHGux6/0wky8McR2qBwPWr+maess5dPZxAdSOZnsd0f64EVGt5gOLumwkLkCGoa9PaWO/u2sYb+bwQY5uxOxa5qXIlsTmr/vU0IE2GQolY/93+YkULwti7gLnywHlzr68h+9Mi9BujcVqoBn7J65zKXspcb9k1w6Ep52Z/t9koeA+/iDfoyUnyBUGkYSs9/3nyOWeEpphK+kUQ0=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM9PR08MB6737.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(2616005)(83380400001)(6512007)(66946007)(4326008)(8676002)(66476007)(6666004)(6916009)(66556008)(38350700002)(86362001)(38100700002)(26005)(1076003)(36756003)(5660300002)(6486002)(316002)(508600001)(52116002)(6506007)(8936002)(186003)(2906002)(14143004);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?VdGzjivJ0DO6qqS9jYQ402qJ/63DMei3PitgZQWZjqC9LqdqI00d7VWVGJNe?=
 =?us-ascii?Q?wXV2ZCWwM87JB9MWoKekNBxp1tmi9DEQgzVLv3qX6/l1G2w1R4h53BH+V3N4?=
 =?us-ascii?Q?FVhqLkyzmoWbkCI4EXmcqAVl1XW5Anrjmuu79vKZnuiXGaHMfFXNwp2kT8GW?=
 =?us-ascii?Q?kN+mM9+UoBTqoKhyEWeA8EQSIur6QvUIh47ERTrVvRcqDEFwDLWOBZQiRHFW?=
 =?us-ascii?Q?ABDabMVBhX9CnBKZtg5TZeb2Li+zGH2FDvi3+GUcH9OgcymjVDlSGsj7pfBr?=
 =?us-ascii?Q?rwDAMkVxN5vjVhIaCO5LnnvEh8O0+/XwiPw27m71ZC7XhovvmXr5V2pv+cvr?=
 =?us-ascii?Q?6rU81uEzMn8L7m7gpTPBSddfiHvqC7CdJSY54cSIyl7kx0rABsfgVCGp4Wgb?=
 =?us-ascii?Q?B/qKsa5Sg/uJLh/7RWSCRF/pOnhMvjgWi9SK+JjKg/t6MirgLkulewZsDesm?=
 =?us-ascii?Q?o4dHDrKKKRI/HxkWt58z2kz/ImSXUFAZq4+hzZUfzwo7jaOSi25NLbcNZ0ck?=
 =?us-ascii?Q?nj0ItOj+9xdsaEuUko+ZQzBZwIfsOUNLgv33OOjTZV+YXz2jc3601gwhqEio?=
 =?us-ascii?Q?4kYf/BlfUy7knoVcZhFRnahJzG8n4W6kQMlD5PbwaYsr+Lo2O5YbPNmCtQKY?=
 =?us-ascii?Q?VBC5A162gKVVS+PtrfLxerTAjQGcIOZLsSVawwkyc3SGyQyJUx4kUhEWwfQF?=
 =?us-ascii?Q?4zgSQaD9AyYWhLG4bvpZdVUQA552QWHDPOst35BI245eMVfkH3jsDY7/j11I?=
 =?us-ascii?Q?+NCp0dmmHvXzOFYD8G1/nI2Tg3Yp7+WhAQnvtfxkVRoCVC3/zW0TPCTLH0Or?=
 =?us-ascii?Q?SUcsm7gNX+AaM3efMSaFilpLfchVC//FqMJNuyPcuXoNz/qYl3kTeZ0VnXvq?=
 =?us-ascii?Q?KeR+sVAyauU4sH8nRu2YIEYt3R3rLlj47hRPeZtARQmiuznqFbXi0DK1QRtf?=
 =?us-ascii?Q?umMI0u4IacPX1YMY3oUAqQ4qODJ4qfGye86ZuRXRs6jj9HGn5IXYYxm1u9gm?=
 =?us-ascii?Q?GyBD0+NzT1HeaVzKnKUesjK6VsnELR+I72eIIqQiXWkOSfgHTPEORKh3XOCm?=
 =?us-ascii?Q?FXN9Hof1SmQrLOlMZXIQj092lhHWBEPTat7jRZ8/m6AKMvm30bLm5+NooIdS?=
 =?us-ascii?Q?tqVaQQ1aKkhOh5sEELfSmGfBDXyos2OzSUHfak69FK+5DDvMpJb0BFFm1/L6?=
 =?us-ascii?Q?kpdqo0gqKP0ITE5gl7JdFwJSplFK0fEtB+Lrn6ZbrRxWTdpmhBE6I/b6iAQr?=
 =?us-ascii?Q?kziFgbxfaS/T/9IQmgk8mDeRDDS1AxVhJ3K8sAj14DRqhlEEqJPoBQRpcD/w?=
 =?us-ascii?Q?+uaeHNP/7hHNYmYt7E81o6nAeDKJHUXlw/Urpr3yPP3cIUDYmGhSlyT5tM5q?=
 =?us-ascii?Q?hVdnf5jWQCg66bflu784LBL7xIbgQfvOnzk4Ug8+JL860j7WU03NSCzwQzUu?=
 =?us-ascii?Q?ouAVCZ51jUYvyKG0hGLThOcOyHi7oW/Bpqvrfk+gSXFZJuFkh3+lQFp0jJ0m?=
 =?us-ascii?Q?clMwdrTFbr8uOlw0WHUqp4yJvWmU/WcO0dcNlgHaQPy6bBInUlgVXMCacYTJ?=
 =?us-ascii?Q?oPrZnfk8S5txTJHXB7iQnVCUJFOkkCV3YhXKU4JYsY4plMd44B9IO4jIb5To?=
 =?us-ascii?Q?kF3Y8FXthiEqc92WTkI4MVt6GwB27gYzCgd4HYb6QzAD6s9hD9BL+yxaxzn+?=
 =?us-ascii?Q?9FRM8LU/WlFP/w5r4rfw62amtDE=3D?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9c1a7ae8-3215-4445-fcb1-08d9f0ac0dfc
X-MS-Exchange-CrossTenant-AuthSource: AM9PR08MB6737.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Feb 2022 17:53:21.0780 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mlfTD0jDk4HiUf2t8NiGCmo+C1oQQv/GDNtJPidVlJnEjjNB6ls0fB7Ojy/Oc4frHvFpbBdyRNpCxz4SKljZQmI554liEmp5Lv4Thdn0gnU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR0802MB2235
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a01:111:f400:fe0c::71d
 (failed)
Received-SPF: pass client-ip=2a01:111:f400:fe0c::71d;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR04-DB3-obe.outbound.protection.outlook.com
X-Spam_score_int: -3
X-Spam_score: -0.4
X-Spam_bar: /
X-Spam_report: (-0.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.904, RDNS_NONE=0.793, SPF_HELO_PASS=-0.001,
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

We don't need extra bitmap. All we need is to backup the original
bitmap when we do first merge. So, drop extra temporary bitmap and work
directly with target and backup.

Note that block_dirty_bitmap_merge() semantics changed: on failure
target may be modified now, and caller should call
block_dirty_bitmap_restore() if needed. The only caller is
qmp_transaction() and ->abort() is called for failed action. So, we are
OK.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 block/monitor/bitmap-qmp-cmds.c | 31 +++++++++----------------------
 1 file changed, 9 insertions(+), 22 deletions(-)

diff --git a/block/monitor/bitmap-qmp-cmds.c b/block/monitor/bitmap-qmp-cmds.c
index a94aaa9fb3..2ce1b4e455 100644
--- a/block/monitor/bitmap-qmp-cmds.c
+++ b/block/monitor/bitmap-qmp-cmds.c
@@ -252,12 +252,15 @@ void qmp_block_dirty_bitmap_disable(const char *node, const char *name,
     bdrv_disable_dirty_bitmap(bitmap);
 }
 
+/*
+ * On failure target may be modified. In this case @backup is set.
+ */
 BdrvDirtyBitmap *block_dirty_bitmap_merge(const char *node, const char *target,
                                           BlockDirtyBitmapMergeSourceList *bms,
                                           HBitmap **backup, Error **errp)
 {
     BlockDriverState *bs;
-    BdrvDirtyBitmap *dst, *src, *anon;
+    BdrvDirtyBitmap *dst, *src;
     BlockDirtyBitmapMergeSourceList *lst;
 
     dst = block_dirty_bitmap_lookup(node, target, &bs, errp);
@@ -265,12 +268,6 @@ BdrvDirtyBitmap *block_dirty_bitmap_merge(const char *node, const char *target,
         return NULL;
     }
 
-    anon = bdrv_create_dirty_bitmap(bs, bdrv_dirty_bitmap_granularity(dst),
-                                    NULL, errp);
-    if (!anon) {
-        return NULL;
-    }
-
     for (lst = bms; lst; lst = lst->next) {
         switch (lst->value->type) {
             const char *name, *node;
@@ -279,8 +276,7 @@ BdrvDirtyBitmap *block_dirty_bitmap_merge(const char *node, const char *target,
             src = bdrv_find_dirty_bitmap(bs, name);
             if (!src) {
                 error_setg(errp, "Dirty bitmap '%s' not found", name);
-                dst = NULL;
-                goto out;
+                return NULL;
             }
             break;
         case QTYPE_QDICT:
@@ -288,28 +284,19 @@ BdrvDirtyBitmap *block_dirty_bitmap_merge(const char *node, const char *target,
             name = lst->value->u.external.name;
             src = block_dirty_bitmap_lookup(node, name, NULL, errp);
             if (!src) {
-                dst = NULL;
-                goto out;
+                return NULL;
             }
             break;
         default:
             abort();
         }
 
-        if (!bdrv_merge_dirty_bitmap(anon, src, NULL, errp)) {
-            dst = NULL;
-            goto out;
+        if (!bdrv_merge_dirty_bitmap(dst, src, backup, errp)) {
+            return NULL;
         }
+        backup = NULL; /* Set once by first bdrv_merge_dirty_bitmap() call */
     }
 
-    /* Merge into dst; dst is unchanged on failure. */
-    if (!bdrv_merge_dirty_bitmap(dst, anon, backup, errp)) {
-        dst = NULL;
-        goto out;
-    }
-
- out:
-    bdrv_release_dirty_bitmap(anon);
     return dst;
 }
 
-- 
2.31.1


