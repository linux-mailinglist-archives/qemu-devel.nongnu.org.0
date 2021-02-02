Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C5A8A30BEDE
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Feb 2021 13:57:36 +0100 (CET)
Received: from localhost ([::1]:34952 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l6vFP-0002fI-QR
	for lists+qemu-devel@lfdr.de; Tue, 02 Feb 2021 07:57:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46914)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1l6v8y-0001WG-03; Tue, 02 Feb 2021 07:50:56 -0500
Received: from mail-eopbgr60133.outbound.protection.outlook.com
 ([40.107.6.133]:57568 helo=EUR04-DB3-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1l6v8u-00022r-Rd; Tue, 02 Feb 2021 07:50:55 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jgcMUsW5HXjEG9h9Xltnq5gXL8idXhWz6yf9EYwckCM0XijG8CfN7sTwhsjcn65STY5ff2Q3X7vu8bEB+cDP/zm1/ZCg1HQL4m2f54pQpCPkqIWxI1ARoe4MuW2gQv47B3DvhbVkmAGcmvwKCtRhyDu/65jI00umNGRwWvAN9EBDxiLZXJuDW8Gvgrh+q5ZTuP+tiFEprfNpkFq/l/NT+u0gC9RInp3EBFSSMpkTZ9BmEdNquDzXpy0JED+kCUNKMgjAPCnRoqluLzsLJsxa/T9xlShWKxynlrYQZIdPoV7+ThugBqTplsoOTcsDuiTU6Tg/pd6nY0eOee9CFpb/og==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=k+xzsmZcPlMdMXmrJb9brCQ9omaWf0j/VELf2b5FLE8=;
 b=RR+ZXOXkjG9+UYilk4f5cySeulFemSKvspLb0WeJb995ovzud8OBJwiYNTgvgyw27upepoXS01PlK1nWvsqUJV/BpOjtQq9uQWgnEZHw7alj/TBsEmeFJxynf+WXJGq7DBm5gecuCFR/VrwYqfLapzBeD/B3Dcon3S5DnIFQ0F9f0waEUC6oYKkbCEqf58EbegzO0yHAJlZQVKg1/o9Kyi9+W079xZegAIG4HA61BjQH+BYW2sfal5FeXAqkTWSEaEPuAQi+o8/TMEdJA/eX4uM5m9n2ygRohYZFVgc9RcnURld1Fy5wm45WoMeZhnA5o/Zkthmjdj4I49jyBJxexA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=k+xzsmZcPlMdMXmrJb9brCQ9omaWf0j/VELf2b5FLE8=;
 b=clDSKu3nSVB8YwLMIKtBPPHcfEqAdhDvY7qeJef8PYMnZevYpfVBwCQdQvL/FZopI3qccChBMLC7ss7t+Va4irBro6C7fgwRgSVsMTH50pF9atPGuRED0QeZboyeS1SMemxK7gBj1DNZk2WGXTnfv7AtmpAsMDcjtyCbSKZhUSU=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB3623.eurprd08.prod.outlook.com (2603:10a6:20b:48::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3805.24; Tue, 2 Feb
 2021 12:50:46 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f1f0:6610:11f5:5e4a]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f1f0:6610:11f5:5e4a%8]) with mapi id 15.20.3805.028; Tue, 2 Feb 2021
 12:50:46 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Subject: [PATCH v7 13/14] block/qed: bdrv_qed_do_open: deal with errp
Date: Tue,  2 Feb 2021 15:49:55 +0300
Message-Id: <20210202124956.63146-14-vsementsov@virtuozzo.com>
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
 15.20.3825.17 via Frontend Transport; Tue, 2 Feb 2021 12:50:45 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6d111141-ab4a-445c-27b2-08d8c77928ec
X-MS-TrafficTypeDiagnostic: AM6PR08MB3623:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR08MB362363C75E44C1D3F7479138C1B59@AM6PR08MB3623.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:826;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: JYR7slKf2kdRUspD+Un9j4u2Cvo4SCpwLJXZhE+9SpmuBmz1M2OYKLy+Gya2pgZBhbzP2Ek1zFvygTj8hXqhOEzo3lge7kovHGJVNomuFJZt0VlI40JcZMZn58RE8jVOYpn3yYfasRVqMJtufdCEOup9bx8/kWyJWm8XVETT3x65I6TnHEwv/tAg1WDeuN8zgwKaggDH4xP1oTht2wS+kevXofqioiXe/l+gwc+bKmfRl7arW7KIkkKfJY5fjp/PQHngjjjJfFFUziFeP/PcXxKtMIbFQgAssggaOko+4nZTd+6NkJbtNHmb5T7ScG1Pl6M+I2Yb48nDOdkJiB971B8daEyeBjV8cvR8s8ZYUx2hKhbZfJM604mQ24iyp9DO5fvQjLb/tLmSOGhLOg2Y3LJhUxDyXv+vv7M3mbXEL0e+nfK2hgvS/ZVOncJYj2oSLMxZ6QTUhuGrpF/nu+ZkznTxUZRc9LD6gJ1o2FQImBKcVovTGUuoPIWq2NVVG8ixMaVIbukB71HDzJZu1Kf7VQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(346002)(39850400004)(376002)(396003)(136003)(2906002)(5660300002)(66476007)(316002)(66946007)(52116002)(6512007)(66556008)(36756003)(8936002)(6486002)(86362001)(7416002)(26005)(1076003)(83380400001)(186003)(4326008)(16526019)(6916009)(478600001)(2616005)(956004)(8676002)(6506007)(6666004);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?IZSs+fH0GnY6mTCjC8GkBjQ3BJPNW4FjRKvZfMfOmQhYhU6H+7Hwx3QsFb7h?=
 =?us-ascii?Q?OpLf2vrH3JUbvtUM3WVg2j0BbDzPspUEOowPoTc7IkT1owj/dTIDd73vy+24?=
 =?us-ascii?Q?952QwXhD2WQ3QPXsAVpAd5PqfF0wcX/ntcjEL9Ua7iLCyI4CR4C3TRctNmCX?=
 =?us-ascii?Q?XZpUa3KY1zpYaLa+Z9/qwB8j0zBquk7mTMu8d7aLDBnx3vOQoH57qRBwJEow?=
 =?us-ascii?Q?o8GhpKeG1m3s0GEGa6XPuQUg3FMTB66ujooLBl4IixKIe4WSIbBLYN4TpbJr?=
 =?us-ascii?Q?Scx7icyL2tPmvyZXfEYPzcuikQYT1ts1YV+hL8ANRDfSPLU8KxHXBoMMFP4y?=
 =?us-ascii?Q?9DOoXt1UqHCFVNBQnufVzjR/bCH9pDsPhrE6p556OSlx5/zB5Y4Fo0JPmt3+?=
 =?us-ascii?Q?5pMRh+cb/7mD5ttCcGdhteW0GAHRfycC5P6sEZHVisBvH7+6wDn5b6sFdoLS?=
 =?us-ascii?Q?AaJ5qxcMX7WgaEgqJbuFvV0vLkR06kykIpQoI1KCVd4WlzgCSVdxXoOK0TJH?=
 =?us-ascii?Q?sHzyoG28xpqDqQc9PjLioWgTZY5TeTIMUTJF4Rfy8di4iLZbDEitCCfvSEQx?=
 =?us-ascii?Q?GbggwSzU+xy5WQ+4md2xN4f5T8MHnyTVr3FUu3wlW1poq2lPMhtTgPAs7NQ3?=
 =?us-ascii?Q?pgi7FcX5z2wj+xFPS0xUuLJge+Dypqqo3FMNUSwv4wgi5UuYDjDW67MLUL26?=
 =?us-ascii?Q?hWeZGBjlzxBb9L1DUbAwPwjW8ZCTeaVrJm3oXzTdEFvnqe8wZ5lio6f04Waz?=
 =?us-ascii?Q?eXXBiLE+uXHDOL+L42gol6+OzysRGdFQJHkIC/3lyZy4ipueoH1jtNZKMy//?=
 =?us-ascii?Q?tpAyYWEdeVBEyvOXtWpNu2B5DgWyl/2+bFFzCh1A+zQlJwL+KONPbx0+meY9?=
 =?us-ascii?Q?Jw7nD2fGzJ5x5ZcG0vFpfMY8ueOrAJudD3e799yS9tmsSfLy+fSI9f8wxPcm?=
 =?us-ascii?Q?sA1ZuFLbRQiPvyUCeh5R3apCTDgRXaxYqp6QCaYoSSIPBPymmT1B02Yd3mnp?=
 =?us-ascii?Q?vqKILX2C5/ygeRTPV5mddhUj8IrvT7I06Q4BtilDr9lnZwt+0gsy3pH1P2cd?=
 =?us-ascii?Q?KQrllRZg?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6d111141-ab4a-445c-27b2-08d8c77928ec
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Feb 2021 12:50:46.6013 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rllR2TP5B7HfZ8m+xggZUONSm16GAYmVxmFM96YEm+wHE89VcfwT2SLXkZi0XM06ovfB9BCHyiMtmf/rZbT1z+1fMyegNgAuCmW5J9icyss=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB3623
Received-SPF: pass client-ip=40.107.6.133;
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

Set errp always on failure. Generic bdrv_open_driver supports driver
functions which can return negative value and forget to set errp.
That's a strange thing.. Let's improve bdrv_qed_do_open to not behave
this way. This allows to simplify code in
bdrv_qed_co_invalidate_cache().

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Reviewed-by: Alberto Garcia <berto@igalia.com>
Reviewed-by: Greg Kurz <groug@kaod.org>
---
 block/qed.c | 24 +++++++++++++++---------
 1 file changed, 15 insertions(+), 9 deletions(-)

diff --git a/block/qed.c b/block/qed.c
index b27e7546ca..f45c640513 100644
--- a/block/qed.c
+++ b/block/qed.c
@@ -393,6 +393,7 @@ static int coroutine_fn bdrv_qed_do_open(BlockDriverState *bs, QDict *options,
 
     ret = bdrv_pread(bs->file, 0, &le_header, sizeof(le_header));
     if (ret < 0) {
+        error_setg(errp, "Failed to read QED header");
         return ret;
     }
     qed_header_le_to_cpu(&le_header, &s->header);
@@ -408,25 +409,30 @@ static int coroutine_fn bdrv_qed_do_open(BlockDriverState *bs, QDict *options,
         return -ENOTSUP;
     }
     if (!qed_is_cluster_size_valid(s->header.cluster_size)) {
+        error_setg(errp, "QED cluster size is invalid");
         return -EINVAL;
     }
 
     /* Round down file size to the last cluster */
     file_size = bdrv_getlength(bs->file->bs);
     if (file_size < 0) {
+        error_setg(errp, "Failed to get file length");
         return file_size;
     }
     s->file_size = qed_start_of_cluster(s, file_size);
 
     if (!qed_is_table_size_valid(s->header.table_size)) {
+        error_setg(errp, "QED table size is invalid");
         return -EINVAL;
     }
     if (!qed_is_image_size_valid(s->header.image_size,
                                  s->header.cluster_size,
                                  s->header.table_size)) {
+        error_setg(errp, "QED image size is invalid");
         return -EINVAL;
     }
     if (!qed_check_table_offset(s, s->header.l1_table_offset)) {
+        error_setg(errp, "QED table offset is invalid");
         return -EINVAL;
     }
 
@@ -438,6 +444,7 @@ static int coroutine_fn bdrv_qed_do_open(BlockDriverState *bs, QDict *options,
 
     /* Header size calculation must not overflow uint32_t */
     if (s->header.header_size > UINT32_MAX / s->header.cluster_size) {
+        error_setg(errp, "QED header size is too large");
         return -EINVAL;
     }
 
@@ -445,6 +452,7 @@ static int coroutine_fn bdrv_qed_do_open(BlockDriverState *bs, QDict *options,
         if ((uint64_t)s->header.backing_filename_offset +
             s->header.backing_filename_size >
             s->header.cluster_size * s->header.header_size) {
+            error_setg(errp, "QED backing filename offset is invalid");
             return -EINVAL;
         }
 
@@ -453,6 +461,7 @@ static int coroutine_fn bdrv_qed_do_open(BlockDriverState *bs, QDict *options,
                               bs->auto_backing_file,
                               sizeof(bs->auto_backing_file));
         if (ret < 0) {
+            error_setg(errp, "Failed to read backing filename");
             return ret;
         }
         pstrcpy(bs->backing_file, sizeof(bs->backing_file),
@@ -475,6 +484,7 @@ static int coroutine_fn bdrv_qed_do_open(BlockDriverState *bs, QDict *options,
 
         ret = qed_write_header_sync(s);
         if (ret) {
+            error_setg(errp, "Failed to update header");
             return ret;
         }
 
@@ -487,6 +497,7 @@ static int coroutine_fn bdrv_qed_do_open(BlockDriverState *bs, QDict *options,
 
     ret = qed_read_l1_table_sync(s);
     if (ret) {
+        error_setg(errp, "Failed to read L1 table");
         goto out;
     }
 
@@ -503,6 +514,7 @@ static int coroutine_fn bdrv_qed_do_open(BlockDriverState *bs, QDict *options,
 
             ret = qed_check(s, &result, true);
             if (ret) {
+                error_setg(errp, "Image corrupted");
                 goto out;
             }
         }
@@ -1537,22 +1549,16 @@ static void coroutine_fn bdrv_qed_co_invalidate_cache(BlockDriverState *bs,
                                                       Error **errp)
 {
     BDRVQEDState *s = bs->opaque;
-    Error *local_err = NULL;
     int ret;
 
     bdrv_qed_close(bs);
 
     bdrv_qed_init_state(bs);
     qemu_co_mutex_lock(&s->table_lock);
-    ret = bdrv_qed_do_open(bs, NULL, bs->open_flags, &local_err);
+    ret = bdrv_qed_do_open(bs, NULL, bs->open_flags, errp);
     qemu_co_mutex_unlock(&s->table_lock);
-    if (local_err) {
-        error_propagate_prepend(errp, local_err,
-                                "Could not reopen qed layer: ");
-        return;
-    } else if (ret < 0) {
-        error_setg_errno(errp, -ret, "Could not reopen qed layer");
-        return;
+    if (ret < 0) {
+        error_prepend(errp, "Could not reopen qed layer: ");
     }
 }
 
-- 
2.29.2


