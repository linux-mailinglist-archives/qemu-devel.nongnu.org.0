Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DC4F52EFFB5
	for <lists+qemu-devel@lfdr.de>; Sat,  9 Jan 2021 14:06:14 +0100 (CET)
Received: from localhost ([::1]:57058 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kyDwb-0004c5-UV
	for lists+qemu-devel@lfdr.de; Sat, 09 Jan 2021 08:06:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55476)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1kyDpk-0006ib-56; Sat, 09 Jan 2021 07:59:08 -0500
Received: from mail-eopbgr60103.outbound.protection.outlook.com
 ([40.107.6.103]:49158 helo=EUR04-DB3-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1kyDpi-0003dJ-33; Sat, 09 Jan 2021 07:59:07 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dopjuMw22/mr0wP9mZFaSxrBZz1nGyaynTHVsmp5ExfC226StPtp0xwM9eTYkjfcVN6TFIthoDt8F0DFYVdQurqPivB2F+EiJ8JgU2v7tP8wbuRy0jBvFjlGWczJPDd4SixMGPHYyyyQ8OXrin7g7TQgfO5lCe6es75CleJqrXIj4U6SdOapuENJbRoo8nNEe8FDgcnECvq4TJSbt1PtHLl9uJ0a/eMffT68XaNJHeVBPE3H0WbnyaD8RMpuYjjrVoIs0kTzuSQjRjeruCgpzIJg7RkVpj2KFqRREPfZDw81Mhgyw76UjLy/G4RG4FOnD9RZ2MHMEHaH4uJy0rnlIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=k+xzsmZcPlMdMXmrJb9brCQ9omaWf0j/VELf2b5FLE8=;
 b=SS8CV0zKdp3s+u4HL5P8MOFcqlLnvhiE+MvF1XffGBaJOj4LTZnFOuICmXYqjvZYc/NcGIPFN/CH3cUElOeoZ2wNPas1pQvAr0A09Y2H5+mxFufCZ2aXEcBx9KEo4Gy0ZTX5e2h/gm93pHXn5Fu2l/nx+c43WBgNifocjllKFOhDL9aLkFShVs/QXimMasj0s/DSeoClOQ9JTHcvMhN/QrWmypjvkoLWN521cVFS+NhZqGkThHIP511Gl4hNgCbEyWdnnpIco+Vr87fuRI2dlUZ8Hh7SYHPD8xfErMyv86xJ/NVSGLeJZVUFogV/uEsYz2HCqwqchzKIoaqx0k/4sw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=k+xzsmZcPlMdMXmrJb9brCQ9omaWf0j/VELf2b5FLE8=;
 b=RESzDbpc8hkj4HSFiJazUt2x/LqNF5Wa00RsJrutH1nUghDUfMFSL4xPvPgSLibB1A46roUJHSyXNRPIi59pg9PG1+ALgVrP9sKnSzKEfet4g26mPLu1QWcD1XyK0sRPSn/PR1LuYikzaqothFwgkIDT68xHNqplfY33ldofpEE=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM5PR0802MB2418.eurprd08.prod.outlook.com (2603:10a6:203:9f::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3742.6; Sat, 9 Jan
 2021 12:58:56 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::214a:3545:368c:7ae8]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::214a:3545:368c:7ae8%7]) with mapi id 15.20.3742.011; Sat, 9 Jan 2021
 12:58:56 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Subject: [PATCH v5 13/14] block/qed: bdrv_qed_do_open: deal with errp
Date: Sat,  9 Jan 2021 15:58:10 +0300
Message-Id: <20210109125811.209870-14-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210109125811.209870-1-vsementsov@virtuozzo.com>
References: <20210109125811.209870-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [185.215.60.119]
X-ClientProxiedBy: AM0PR04CA0053.eurprd04.prod.outlook.com
 (2603:10a6:208:1::30) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from kvm.sw.ru (185.215.60.119) by
 AM0PR04CA0053.eurprd04.prod.outlook.com (2603:10a6:208:1::30) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3742.6 via Frontend Transport; Sat, 9 Jan 2021 12:58:55 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: fbd23eb6-d9c3-403c-fecd-08d8b49e5300
X-MS-TrafficTypeDiagnostic: AM5PR0802MB2418:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM5PR0802MB24186076B0E3DB32EBCABC66C1AD0@AM5PR0802MB2418.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:826;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: GWf7xQ4rhC0PV6OQVV4rZ1NRerPuo5SXyHxWrFs2IiK0hp9kn8rvfqkKhOKqQfOO5+u92DHVfE9uwS1mWNuENwhTg/loAlfMseqmh4ITzQ91O2L2o6rY10YE4eqm3A3cpa9EeA/Vb+7fGXJjDLqBwCicFXn4g6EIHO/m5kpAIWYB3GPTlbLiMgkgybdAhGIFtyLANvMe0GFcDBMUv29Gu39ojy2mvhofIBG6JpEk2TLBEn314XQDOidX1/l7uq0YNdJvZAfQbaqTqKXb0bnnhzfbEW5Iju4V5MjHIoggv0kFAES4nhHpWhm2pDMO7Rcz3ehySYGxr7FYXUdCI2RMgcSj0bwDh6LeZXBTniPXxHuu+0NHRk1Md5WaLRulS8DrWh0yZ/gTU0TByPASVNMnlQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(136003)(346002)(396003)(376002)(39840400004)(956004)(2616005)(66946007)(478600001)(8676002)(5660300002)(66476007)(66556008)(6916009)(83380400001)(52116002)(2906002)(6666004)(8936002)(1076003)(6506007)(316002)(26005)(4326008)(186003)(16526019)(7416002)(36756003)(6512007)(6486002)(86362001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?cVH6wnI8HWSrZpY2RVfjR4gFjBrXyZ9ACRw8hAHMgsuhF88RJ2da68+bbUSh?=
 =?us-ascii?Q?WruE0dCEWX+cgXVVflUMnvQey4vNbetlolROzI5NmCNucpYwTb9A13ycSbJU?=
 =?us-ascii?Q?u+pnzE2P1Pue+TqMxEk9H4YUVBTWgEYHxuoxF8E6nnc01auxl5I6EEmz+ev7?=
 =?us-ascii?Q?5RdMQk0GxuYhwJ9CYhgd1UF1QeGlPSnOte9m5DQOobpBrLeNzeRKc1ZiJim6?=
 =?us-ascii?Q?Ty+uvFAWpsHJz/4RXQFUSHgb2ythUnK9Inh3vGlQ8sZLs8Txhefd5cRtsina?=
 =?us-ascii?Q?bSxbspLg1y4Y3+P0tppPUJ+kloV3YnAFJ8AMtiF+DBz/TkU6V7noADoZj3W5?=
 =?us-ascii?Q?fdDwHxDEBTHyrtYoEsJbQQ+zkJfRuI9eyXbQhXSPlB/ay0JavtCBrB/dAHwW?=
 =?us-ascii?Q?IOdkbHd12v+uVNoDsRVR6gYKZFUUAOxLjc+Vagvw3f60+Dcwll6mns11YBQ/?=
 =?us-ascii?Q?9p3+yxSP2XzuGVCed+hwu1N12SGj8q0KU40Ap/lBLRAkx9dMGOCy8Fvd3XAQ?=
 =?us-ascii?Q?wkuzmYkqKo1O4QQJrFriekMtgSJKOUkmL12L+FdnRZaAkwjpicjr1DoUvNeF?=
 =?us-ascii?Q?I8qD+CLHYh9xeX+kwDc6GbaNT3T8yA9pUxTzxN+YqYgOG2UvCwrGDOYQs810?=
 =?us-ascii?Q?EGyYqxcb+d1DfVGeyysjjxZx+edcX3DM2sUDMVjDTNciC5JNiqkplrtb1soc?=
 =?us-ascii?Q?UbMz4t7Q060Mh1np4hVn3ZPD5qQ32KSA1w8uZikioHfEaW4v3/dfNC1R/GxP?=
 =?us-ascii?Q?BhoZU5LVpcpqSGeJN4fp/n0bvUTm3xUyBzY5bOotasR6at+rYOobrQmZ6wZ1?=
 =?us-ascii?Q?fYt7WYYFeylzRPV3o1p0FShChOkMK+CS3ihn6Y5LdC/lkPw6aPoxn3wEKhLe?=
 =?us-ascii?Q?SefDKs332ZzLnewMcr3ojoXZ244eo/Mr9wVbNQDyEEey0uwm35F7hj7rG9o3?=
 =?us-ascii?Q?85pjWX7hkDfy8TLuqBaiaM/CZcKH4a63p08mgn3Jy1xAr9iLXg/iEuf9YW1s?=
 =?us-ascii?Q?ODar?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jan 2021 12:58:56.3023 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-Network-Message-Id: fbd23eb6-d9c3-403c-fecd-08d8b49e5300
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Pa7iUEdBHgan/GIM4qsfwrwtmH4O+6UpZKaTLBRgpe7G2eb82tAME/iGVlB5cxzwJGMTOc5NlqJPqjTxgl7++/c6c2oEANHjyy1Wl67uwNk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR0802MB2418
Received-SPF: pass client-ip=40.107.6.103;
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


