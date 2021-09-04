Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 35594400C25
	for <lists+qemu-devel@lfdr.de>; Sat,  4 Sep 2021 18:40:37 +0200 (CEST)
Received: from localhost ([::1]:41316 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mMYia-0002te-7m
	for lists+qemu-devel@lfdr.de; Sat, 04 Sep 2021 12:40:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53160)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mMYTn-0002zs-Ln; Sat, 04 Sep 2021 12:25:24 -0400
Received: from mail-vi1eur05on2095.outbound.protection.outlook.com
 ([40.107.21.95]:18546 helo=EUR05-VI1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mMYTm-0007GP-1X; Sat, 04 Sep 2021 12:25:19 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jKYxJgVHMowtPN38b/QTSY8p4ERd3gRoqsFSwuqEvp+RVxqVqowzV+/FXZNT1yvS9Ln0gqtVyyWOJ46WWsy1v+lrbysHnv3fpeVEAODuDMYE29BcjvAa6MJY7XrgXHkQfJBZ4M6GN0QSiEaOtAB0BtUPpf3wokxLi3I70uZ3ojJ32AnI6mw4VszgM1CQUpibr4rOc2E0aSbESV6E1W4MphKKA5+jzNeCi/Izjy/50gdkRve2B7oOQm8r68QQvBskgzmvpPyXNOR4VnseNjMfkncpSwWJJfVMC9cFJi5Vtdmwksczn6tgeSIlFA2X6S6zDh6X0idUItZpS83GXyrD/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
 bh=LMaBfg8VvlNM9Ib/8Ou/neYhEZLhouR0GN9AA8FciwY=;
 b=fp0R/jQpNOE4Ifhpcp528+vASaZYMyhEXxfHQdPjNiZnjZEJJlJDfH4yYJuQpuB1oWhyYy0zxQVkmjzC75DAf0qevOey18NjlLOw3lYX/wmRPzO0/DVjUGIgKXY6M6ZjlFAHtY/1yeQp5RVLEHzgE/LpiVHS0oG1+idKR11yJWRtR7rBiK7J+4ozNkgvJbAon3YjZlScPO9cX6cQ4babOWync6641mqcG4doPNLa9w5o+6XgOW/LObNfrPn3PaUEHtqTLntaOYftFilxsQj/WXWN7sowDe39eWUVFLtN2+VtDdhLxV6dkfJJeSAl0q1IVAjI7hTSeicWQ8BvyyWUyg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LMaBfg8VvlNM9Ib/8Ou/neYhEZLhouR0GN9AA8FciwY=;
 b=O/pBgPWaRUI+gHgW+Z8vj+9sDzQQUfF9kvO5bDvpmUgg0eQvpDmm09Z8i8w8p5rEeMUKptyhjD/RDSnmHzfWu1nkEfjDBnVYRPdNG0PlV2DZd6rzD/D3trGnW2DV2Z/P/zSvz9YSC3kc7ytK0z7EiLW9/+8Ua1L7iEeFBMVRNwY=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AS8PR08MB6904.eurprd08.prod.outlook.com (2603:10a6:20b:394::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4478.20; Sat, 4 Sep
 2021 16:25:05 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::2817:53b3:f8b4:fe22]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::2817:53b3:f8b4:fe22%8]) with mapi id 15.20.4478.024; Sat, 4 Sep 2021
 16:25:05 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, vsementsov@virtuozzo.com, hreitz@redhat.com,
 kwolf@redhat.com
Subject: [PATCH v7 11/11] qcow2: use reqlist_mark_req_invalid()
Date: Sat,  4 Sep 2021 19:24:28 +0300
Message-Id: <20210904162428.222008-12-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210904162428.222008-1-vsementsov@virtuozzo.com>
References: <20210904162428.222008-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: HE1PR05CA0275.eurprd05.prod.outlook.com
 (2603:10a6:3:fc::27) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (185.215.60.196) by
 HE1PR05CA0275.eurprd05.prod.outlook.com (2603:10a6:3:fc::27) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4478.17 via Frontend Transport; Sat, 4 Sep 2021 16:25:04 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 082fc503-e653-4414-7e0b-08d96fc08dea
X-MS-TrafficTypeDiagnostic: AS8PR08MB6904:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AS8PR08MB69044560DBF68EBD64FDDCA9C1D09@AS8PR08MB6904.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:626;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Yc/oA9l7xkGHtc/HaVw3Gq/A16rwvUezRfokFyRniD+0vsqSjFlZ8Yyp0BGBr/8VP+mhPhvKdyvubLVRDdLFsRWmigDt+nSRnRg+NGQU5yUNgPvWq/CoTbGklmWENoWJiGPDUNQkq3Qs7GDwr+Xtkb2U6g/xvrt47QKdDhBTKByRy8YNVyzS6k41AbNrGHrHohIJ0q88Du4rg9AcOXcX9WjLwg1K2DaPO4prqq3DETOSbfUVD2xTfssAXyapIDmU5hHwjtopDDScLX0BOwX9hhOoQTJYxHnUzZK0C6eJQzcY6HfJNSjELLl4bLwDwEES3Rle6jwnRbfoJLDm7nt1hFsUGzyo01i9FRSPh3HuwAuasEXP3lW5RyvbcYo1NTraNu6XLNWkNOZ8sqOA4l715dJgSUjynuEHShQZnS35ZMxEZtTFFXnSCPnvveY6b+O2O+BMYf9lti/XaG9huzXeMAbmHyMjTlmY35Awl7+sWrT06lb7YucFjdtoVqGPgt1snCS0R8cdX1UsimX+B+hARTL33u1a4Tj71M0x1FSnQzw08HahoWw8KuUdBrEc6k5YHfyVTuSIT4XpFeoFVsUUqpkknOVEeR4PQyi15xdl+KK0IO700ZEwo4+SadmLmJmLE61mnVeTZK4MkuLSYtpsukIEXAOG1VgMV8G4ets9bNZqNvgQeUvTiSVNObCiIj0eUyOpsaYAEEh/S+gsx7ElCw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(136003)(376002)(39840400004)(396003)(366004)(6486002)(66946007)(8936002)(52116002)(6666004)(83380400001)(478600001)(4326008)(38350700002)(186003)(38100700002)(5660300002)(2906002)(1076003)(8676002)(6506007)(86362001)(6916009)(6512007)(66556008)(36756003)(26005)(2616005)(956004)(316002)(66476007);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?dYOHVUo4olKKLp51S7yo0EbfPiIEEzqYReWP1KxiRN/imcIAuP3I13MVj7zQ?=
 =?us-ascii?Q?2yhIgLLxPEyPyS57I2+Rt7ZqthtaP7xzYmjycMoV02hMCzeQM7ZbBBkW9n5q?=
 =?us-ascii?Q?BBKUf0bkGIKma1/T8wlrQvIPvSa3nzFX3sTl3cgXl9/sh1QV3hGuQ7i410Oi?=
 =?us-ascii?Q?4S9VvWPvrIeY/19pPPIJwyWLcr+8MmhBh5K3Ezz4soRjLjvGxqvgKgkHaz7u?=
 =?us-ascii?Q?rgD5S7QjR5BEB4vcYqW2w3Npwo7QU1j4dJod9E+t82wnYaA3bj9lQvSymsHN?=
 =?us-ascii?Q?rg8xMBBNJ7UfUroDHVQXDY7OrUx440ghhqN4rhnYOL6kkMLY+8z00MtZyxl1?=
 =?us-ascii?Q?LP3T1aVQ0zAMA2bYPklVSPwZV5c8+9o/pYAJlxTmbr8EHYKBmMHhXh8/6AWx?=
 =?us-ascii?Q?Yt+4pthmxsY5K4a3hUr2dR0Y6RUXeHckjZnmaysty0EDZcm34uGjoTMtDuWD?=
 =?us-ascii?Q?5SKPmWhUAXmNa2E8637DuX7igHzKZzmqOcaJLrd666CWryddrnW8CfJ/dGyK?=
 =?us-ascii?Q?vNs8pTXOH7nwl0KE3QOxHOqJqOWYIgtW/9rhHLsPaiNvN1elUQJv0wk5hITi?=
 =?us-ascii?Q?xxGnBRIrpzxPmz/WS8JLcQa4Z7mYCEXM8+hl3cInPlVmEXYYKoleeabjUinK?=
 =?us-ascii?Q?5YOAIFS0d+6VmWJ5MDpeo6OsldQRn8m6eBTv50GREgtEn89eVMKirFZbtwms?=
 =?us-ascii?Q?nIk6DUM560c+3XgxjlCVDA4WD73vnSLSGlh9cchyFm3/ibkEdHHtcCxt0qMr?=
 =?us-ascii?Q?u42Ysbz71V071cCjMeEGWwTpqOKSDO7xn64mRLA50ensToANq+ZTjio2YYoN?=
 =?us-ascii?Q?2XWzbc2Y73A+0aZ5ADL9KtNj39F1J7sVGeEtaBT5qj3Zb5tW7yI3tZ1fbczS?=
 =?us-ascii?Q?OndcOXybPogx9aMzytGy5y7qpyTQU/BXFXa0GAWr7BX6gq8VQGPrN1SJzipn?=
 =?us-ascii?Q?i5brJKOQClzMnViTkbziEggReUh21QXy4ycmoUq8Qo4RnGlnawZiBsSJK6Vt?=
 =?us-ascii?Q?R26NkTbN9uRTkIbSe+lbLayU/7MAtugWtSfPy9cLeJCkp6jlOuO8+Mfb9YXr?=
 =?us-ascii?Q?SRygAfzSofh63dsGkRjTpUlS1um/st0qtS0iD7a5zAJLQrOt0fHb2T44QTVq?=
 =?us-ascii?Q?IOsq+65a2o7kDg+jeoCAp1vTl1HouW56n7+zfK/uyUfV9E1dvPczg5bGub+K?=
 =?us-ascii?Q?ZFqJhkzYvLNuJro10o49w6EE1zxIomBupLTq9E//aXReshb4JzICeJavMvVI?=
 =?us-ascii?Q?YmDG0dzmZCIKAA+BNfY08/KTxIXcs6C4Sokvq3eDieKF0K4dkY+fpP+9vSmb?=
 =?us-ascii?Q?s1s1Eu/IGVwAkaBvEI5QF4KJ?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 082fc503-e653-4414-7e0b-08d96fc08dea
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Sep 2021 16:25:05.6538 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EZY2CrU4M1Ry4rLCE1N5qlL85iEJ5QtF9Vxj8wqd2BWJWvKJzn41LrWdqNHGY7kJZyJhXl/E6dMMzQd55Xn1kAGr/Zaq0MFWVBZZXigBqkg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6904
Received-SPF: pass client-ip=40.107.21.95;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR05-VI1-obe.outbound.protection.outlook.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Instead of small critical sections which wants only to remove a
request from the list let's use new atomic interface. And don't forget
to call reqlist_free_invalid_reqs() when we are in a critical section
anyway, to not overflow the RAM with invalid requests.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 block/qcow2.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/block/qcow2.c b/block/qcow2.c
index aefe6558b6..f2094c1ecc 100644
--- a/block/qcow2.c
+++ b/block/qcow2.c
@@ -2306,9 +2306,7 @@ static coroutine_fn int qcow2_co_preadv_task(BlockDriverState *bs,
     }
 
     if (req) {
-        WITH_QEMU_LOCK_GUARD(&s->lock) {
-            reqlist_free_req(req);
-        }
+        reqlist_mark_req_invalid(req);
     }
 
     return ret;
@@ -2348,6 +2346,7 @@ static coroutine_fn int qcow2_co_preadv_part(BlockDriverState *bs,
         }
 
         qemu_co_mutex_lock(&s->lock);
+        reqlist_free_invalid_reqs(&s->guest_reqs);
         ret = qcow2_get_host_offset(bs, offset, &cur_bytes,
                                     &host_offset, &type, &req);
         qemu_co_mutex_unlock(&s->lock);
@@ -2769,6 +2768,8 @@ static void qcow2_close(BlockDriverState *bs)
 
     qcow2_refcount_close(bs);
     qcow2_free_snapshots(bs);
+
+    reqlist_free_invalid_reqs(&s->guest_reqs);
 }
 
 static void coroutine_fn qcow2_co_invalidate_cache(BlockDriverState *bs,
@@ -4619,6 +4620,7 @@ qcow2_co_pwritev_compressed_task(BlockDriverState *bs,
     }
 
     qemu_co_mutex_lock(&s->lock);
+    reqlist_free_invalid_reqs(&s->guest_reqs);
     ret = qcow2_alloc_compressed_cluster_offset(bs, offset, out_len,
                                                 &cluster_offset, &req);
     if (ret < 0) {
@@ -4641,9 +4643,7 @@ success:
     ret = 0;
 fail:
     if (req) {
-        WITH_QEMU_LOCK_GUARD(&s->lock) {
-            reqlist_free_req(req);
-        }
+        reqlist_mark_req_invalid(req);
     }
     qemu_vfree(buf);
     g_free(out_buf);
-- 
2.29.2


