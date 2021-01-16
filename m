Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A2352F8FAD
	for <lists+qemu-devel@lfdr.de>; Sat, 16 Jan 2021 23:20:10 +0100 (CET)
Received: from localhost ([::1]:38990 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l0tvV-00035X-9Y
	for lists+qemu-devel@lfdr.de; Sat, 16 Jan 2021 17:20:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51776)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1l0tVT-0004wJ-By; Sat, 16 Jan 2021 16:53:15 -0500
Received: from mail-vi1eur05on2126.outbound.protection.outlook.com
 ([40.107.21.126]:26209 helo=EUR05-VI1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1l0tVN-0000WU-Kz; Sat, 16 Jan 2021 16:53:15 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lcwoNYZLMiqbiPUOaSJkNYnTKyrq0iLeEKdnSJ5dSaptPaGL+pTWLLzHcqEmdNeZppeLbIcjk6kegUjFGRuAj0X/VCQnWHeNZBXXkt4WYi9g32ChMQQJlPfPsAfX3lq+xDhXG0mZZzyi6z5U5qfX1+MdduyYRVm1XtiIyBXsZPQx6cHa8ozJG9+1w7ZmFga8VZ+2WNERzt7GPopBqSyU4h1w6C4DJTwPrMyU+p6pYufUQDNcvYd6uiK+Eiq0+JT+2TjqyNLPbdYhpp09YXO3wIjfKhh9lbHdksCSZO1woAuzX16Fyzhhc+zCTZnt9uqBMCTvgADQTvEcHncXyYmPPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=k+xzsmZcPlMdMXmrJb9brCQ9omaWf0j/VELf2b5FLE8=;
 b=nZY0kfmM0CCaSbGoMPEQdwI/gli4fuzUntC6CNiosmmI/OnmqvgmbJkrsGNxVYdPblOG7mbQnqdWKKxllaWEJoPMi/9KSMgSaOgXILI8Dt/mHLMO4PV6iW/Ja53rofWkL0kjAUgNG+y3sWt5BI1gPKpwIeq8dxVgQLudlbtpWmD9SNQzvxW9LiCS7gpZ5rd85Kii/ZsONr748n5Ekrd6exXQM9LgueDorS2ZLAXKvpkwsnQw5P8LNV+1+49fFS4Y/mUvfyxQ47IsuD+vCWp66M2dfxsj4SWI6fI1TtBBp+Ss2tjKRGbJUN2vpM69SoNMIcaYVO0Elrwy/GTv4nJt7A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=k+xzsmZcPlMdMXmrJb9brCQ9omaWf0j/VELf2b5FLE8=;
 b=OjtPR/y9JNrD3uiBNYaInrihj3d9ZEcqBydQaamfNWJmvpOiCiiHna9aizyo8gZ6wRWM/xcX5U6a5Wv2n2EQ15TmVxXOeAOsb+1z2JT+9ops5SasNRpiXH5UHkd2Y1JL6xGLBz6TooaCBNXqfYUiTwwkxb3rpcz0w61fdSGIM+0=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB3542.eurprd08.prod.outlook.com (2603:10a6:20b:4b::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3763.12; Sat, 16 Jan
 2021 21:53:00 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::214a:3545:368c:7ae8]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::214a:3545:368c:7ae8%9]) with mapi id 15.20.3763.013; Sat, 16 Jan 2021
 21:53:00 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Subject: [PATCH v6 13/14] block/qed: bdrv_qed_do_open: deal with errp
Date: Sun, 17 Jan 2021 00:52:08 +0300
Message-Id: <20210116215209.823266-14-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210116215209.823266-1-vsementsov@virtuozzo.com>
References: <20210116215209.823266-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [185.215.60.72]
X-ClientProxiedBy: AM9P195CA0006.EURP195.PROD.OUTLOOK.COM
 (2603:10a6:20b:21f::11) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from kvm.sw.ru (185.215.60.72) by
 AM9P195CA0006.EURP195.PROD.OUTLOOK.COM (2603:10a6:20b:21f::11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3763.10 via Frontend Transport; Sat, 16 Jan 2021 21:52:58 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 78585aea-4731-4529-003b-08d8ba691747
X-MS-TrafficTypeDiagnostic: AM6PR08MB3542:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR08MB3542138C14C33780BE1E3574C1A60@AM6PR08MB3542.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:826;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 6KuQS6P3lJJx0W4YC+//YAsVwuFdajJWF74JQ4JruzFvwZhS7P/N6gxmx5G+K3QvwTlRPZpY1frvMpSwgn2R3ZpQ/5SGYQ/T5gWToohZHq2K2T0Bq+87G3I7agZFQGLD8s5gzWWzK329ZryGtstE0U9n0lhUd5RaNzBcBgKGMqVriBhylYkhkmvyDuV25JGU1rY/ReaE21zBqwmsmq/G9etUt2dTfnaKzbsBzy6c9lEC/YznspaGx9ZcNw/jeth0XX8LHNjEQ7xBYmxmAARvBBYoBKSBSuASsaQqExx15PWPDczVuHu3v53cNDP9zP2b2GbZu5a01jrmwqnIr+38Chg5yXLn5WB7KzyQm113vTPKPpLJ2Mn46+CGxKIFjVBMtRU1oqM4+Rit6WYwRZWwShVXpeJVSJqLYP5jJqoPxUKHINwy8UhnS9y1ltEk/OIWW1rfUVQbCst7Rq5gQp06lvjhnptqxe+7gDb6rolAmnRZIzmWt57ikpKK7fjHuhW8jN986MufAcjacVFTHKbfsg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(39840400004)(376002)(136003)(366004)(396003)(66946007)(66556008)(66476007)(83380400001)(6486002)(26005)(8676002)(8936002)(86362001)(2906002)(16526019)(478600001)(316002)(6506007)(52116002)(186003)(36756003)(6666004)(4326008)(6916009)(6512007)(2616005)(5660300002)(1076003)(7416002)(956004);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?XFGc9EJCdo7yGWTqKAQsPnkCH4OngKybSGKv2M+rHSLOHyJzYINb5YARsFiO?=
 =?us-ascii?Q?gnIXqEhvllMiQo36hk4HciWh1xZKCfgY6Ko0ESsLRIk0zXb6fYSf19N0joar?=
 =?us-ascii?Q?uPTPzSuHsaeQmvXsh5AI96w9y94ghnv8KuX7YxkCS9cmlgzAi9IpiSwlAAqQ?=
 =?us-ascii?Q?BCjxdZcQptD2o9RK9k8daQVUUtf/ZKIuW0+YPsb1GFSYNnS0LieEMCY+oGwK?=
 =?us-ascii?Q?yVqkexwvDOw0p8jJw45kBqLR3RfX1G4yR42VtGf3hLKX8pipmAUq2+VQqhfq?=
 =?us-ascii?Q?1rxgWtm6Hqk70hBQ+/CFbvHDHnUXFvNUBTxjSrGs+ra1tH7fR9zX2sogX1cz?=
 =?us-ascii?Q?z9Cpx/Eg3HYJ1/7np/eZ+LYMWPWE/by+PJZNvp6pzMPdhiBX7lXSFGc6wYhF?=
 =?us-ascii?Q?+YVV5rEP98bTz/kpFTce/yR7we1crHjgme9R9NksyNPBtmsF4RXhOEy3gwOe?=
 =?us-ascii?Q?4eQumGvgvHYv9EgZsGS3E7RxgxiGbFnXS7bqYOx41rL/FNcMIM8Nb8StScrt?=
 =?us-ascii?Q?ekT6P1hV9PaPsNuNmHodf14p3kiDVzxbrD/DzJ2YXMF6K/wYSHZbfn9/xXXf?=
 =?us-ascii?Q?DNa+IWLcA/cKpB1JGyAh7GYOHPMSpFnagw1nMJGDTra/xvrjp4KXVyGhrB37?=
 =?us-ascii?Q?KQkttbcAPTu9l1eTkecLd27xCqDjKMYkbbcvrUdFwFD4tibgutE1FqR8H4Vh?=
 =?us-ascii?Q?GslK9Ux0K/3cRiiSsxz9l9T0c0tAAldgRN01EYrL1uzspxHuh3brzFTLYlG8?=
 =?us-ascii?Q?2TU89AbuVZTLvWikYAsLWhGXwPngknGKQqwK+b3yoUG5XTSaLaJw14U2AIMZ?=
 =?us-ascii?Q?yVHgLh1a2AJGk+LDqtsCkJYGTot17YomP1lf8zRNkvHinsQQlc1THW5MJjFs?=
 =?us-ascii?Q?5NGirWeBAK4aM4iqxb3OmNU/la4Wq4wOoKJxcTpPmA0t7C68SuWKAOrZoK3c?=
 =?us-ascii?Q?sRCFCtkCnETpqrJ4CRq1maRYwOMsxzhdFC0UvyGj1e71bfh5oDZ4dbYQCIYn?=
 =?us-ascii?Q?58VO?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 78585aea-4731-4529-003b-08d8ba691747
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jan 2021 21:52:59.9499 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4E5H01CKXtOJ/EgEOdQuOtfRaPh+bLIndH8hs4j+/GVDwVplkquNZ4oJMv7aPy6gAcR/Mb90E7bvNzy0D0+2RXcJWBMD8DRV4RGxgdjlDVA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB3542
Received-SPF: pass client-ip=40.107.21.126;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR05-VI1-obe.outbound.protection.outlook.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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


