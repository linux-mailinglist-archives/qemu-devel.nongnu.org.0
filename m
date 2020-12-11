Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C24F2D7EF5
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Dec 2020 20:01:35 +0100 (CET)
Received: from localhost ([::1]:42148 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1knnfa-0004zw-BZ
	for lists+qemu-devel@lfdr.de; Fri, 11 Dec 2020 14:01:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43570)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1knnKn-0006dt-SN; Fri, 11 Dec 2020 13:40:07 -0500
Received: from mail-eopbgr70097.outbound.protection.outlook.com
 ([40.107.7.97]:21414 helo=EUR04-HE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1knnKk-0008BO-Dk; Fri, 11 Dec 2020 13:40:05 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bhOtwmiuciXegVpk0/N59P/cS0YyV3yt0oJRgUjfH7efBkZKGIuopKBPxFUPV5rCKnpmoab7loCAc3hvVnGIGnNHh0MKYL5NYi7dhaMuO1Uv2ssyAnKWZzpDOpSMad4FZBFlriWDUhvdWrs6c1CbRIKUgeyOCvGU2Dq6r9jaj+m8WhuUm5gNYcw3503q+BPG41Ly64Dcwu7Z9m8VGJCc0i+PhBWvR3Fx0Wk41GxK41QGL+BCqVoMIsauDrLYwD3iS97iZDYdGqpSDToGposik64GxJTPZr6Spn5lLCJXa5AUaBxQJFWt1moDUw0qZIYsn9T3po6xH9L/Q/gPtrxoOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uRVxsqlcDVMA/yosvYRBrO3+9X8GOnnwkjE5ScJQudM=;
 b=LOP3Nn4remipUlUgIUVajLveBlx0GJ71trqxRj9wYQdby+bCQhIUCoeU+hqKAzrNeRCpG3lKl8/2H/oqtz1XzzrUDGKHpwuxAgDamQZctbmhpVTS8TBnucJojaSd/QUmMjWk4vpaShBL2ybijDy1f0L0bAnTr46kxt6TWslWftiMwU/oxpW45U5KvHtFVncsrmCWxTQoXkD5kFIBDzDdTe3G15oUBU/d+t0mEqFmrB36TyQlpwO8puFf67TVj2j2IZlOzeZmbJdBXHDO0IWuMQXw1H3WK05dM5UCnFvAMEk5eNwQ6IvEYJ6WUZ+TtsRwj/gs8NL+iXIZpiYCaty5fg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uRVxsqlcDVMA/yosvYRBrO3+9X8GOnnwkjE5ScJQudM=;
 b=RWaADRfL8bIGb6CIjW3f9dWFVh+HnSsou8CcNa4r/thm38HjzUP7Ru3dnigTHtx5siNqZ3wU+SAFS96NvEDzAOFH7Fvuzb1CGd649TPqrIkoeDaDGPDXAshJpW5KSTg3QibthFEthCAqqNq5ZoaOHqp6hq+MjcNwlq8z+ybTJzU=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB4915.eurprd08.prod.outlook.com (2603:10a6:20b:d1::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3632.18; Fri, 11 Dec
 2020 18:39:51 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::d585:99a4:d7a4:d478]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::d585:99a4:d7a4:d478%4]) with mapi id 15.20.3654.016; Fri, 11 Dec 2020
 18:39:51 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Subject: [PATCH v4 04/16] block/io: refactor bdrv_pad_request(): move
 bdrv_pad_request() up
Date: Fri, 11 Dec 2020 21:39:22 +0300
Message-Id: <20201211183934.169161-5-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.25.4
In-Reply-To: <20201211183934.169161-1-vsementsov@virtuozzo.com>
References: <20201211183934.169161-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [185.215.60.91]
X-ClientProxiedBy: AM0PR04CA0050.eurprd04.prod.outlook.com
 (2603:10a6:208:1::27) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from kvm.sw.ru (185.215.60.91) by
 AM0PR04CA0050.eurprd04.prod.outlook.com (2603:10a6:208:1::27) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3654.12 via Frontend Transport; Fri, 11 Dec 2020 18:39:50 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: fa3541be-5d42-46c3-70e3-08d89e042526
X-MS-TrafficTypeDiagnostic: AM6PR08MB4915:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR08MB4915BAB816B8CB1153FCFA32C1CA0@AM6PR08MB4915.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6430;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: o5Dmu0vvX8wOJJEmpeHWWx2eFNA8m52dI3oVUGf8+tcu3RobcN158uTTofNRt5WXK/N0spKKymM7mRawjyHiuxATyIj61OqON5ja3TV7mV19LrW4QhDtZXgLd7A+T56fKCkb/bmjODhWSLuYJrEqBLQQlwlgtFfUq2zdorIQVHLEg6t6Opm7AwLyHKelWbEKq1qMJGnbUK6Bo+ii5lLZxAVdishu/lcAAa3A5OjR+Szf9+gUwNBJSsLjnuCe0JSbEDjSVGnZMRo2WOrg77OyckYDZ2TaQWJErz+OstF7c8iVv6OsiAzztJORld5FSkGQ25V4zIDi/N+vUtxMdUcxEA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(346002)(39840400004)(136003)(396003)(376002)(66476007)(6506007)(66946007)(956004)(6486002)(86362001)(4326008)(66556008)(6916009)(6512007)(2616005)(6666004)(83380400001)(1076003)(26005)(316002)(16526019)(5660300002)(8676002)(186003)(478600001)(8936002)(2906002)(36756003)(107886003)(52116002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?vhE/yUL8AY8qml8npL7TfL1zioL+0tbt6VUyMDaPf3q5V+ly3ucYQ72/GQJe?=
 =?us-ascii?Q?2tGbff7tFZCIR19nXT7I9bUMQRVBQsdzp0Z55I81IatoomDzjxVbpucfLOkO?=
 =?us-ascii?Q?WgZD0Ar4DfftQQBIhvG6kKail1TX3CT/mRzMK0gndIqPpuqLnC6Zs9hvCAEE?=
 =?us-ascii?Q?Zdg8iInjwtn1Kysa8ChykKXbDh406V4YQHUqf80q6SaN3wpJcuuxhYNcKKdM?=
 =?us-ascii?Q?zPXNiKuw0O+H91Nn0o2WXCTyyp4IFFZtmmb0dG9J3a3eTQREpHkc1v4pRjBW?=
 =?us-ascii?Q?B48Uh2/XE3vKhKNODqYY6ZyiIjI0uXXsCbHdpqOVKLLXqngkhqloichj68zu?=
 =?us-ascii?Q?wuFkuB9xR+0Mm39k7HYTHLByEpuP0kv6FK1qpX0xc2wzBS+SFVQJ4TAgfqEH?=
 =?us-ascii?Q?zwNGOAuJJHuaZod5nYV4kQK5je2DnQ47bat+v30EGIRelq2DUMMdSi4LLmnb?=
 =?us-ascii?Q?BcmcuYp3jlBbcWtXDFx9WKysMrhamhAxqdvYH4njZKqGc7q4aFxx7PQe0TXq?=
 =?us-ascii?Q?K5QsB+bLfKc0ehG4aCmFf9oyEfh/b+72ITs7iWmzXrnLSvsPOzsZPN7XgYi9?=
 =?us-ascii?Q?EhVyqx4fSBOi4ffNJdbKi784U/BlmS77CdzAQTG5utHskIC7y+vM/t8G1mkS?=
 =?us-ascii?Q?Hd5rQ07TYlu0+o4UwIgUiFCD2RJ9vRld4+Vkp6Vb9x1oapsLEFq5lQ3D7EYS?=
 =?us-ascii?Q?J8K16btgvquXEzYXE9qOh7egVYU71uJby8enohQlNc8ywB8v3hfBDi9Vzl7T?=
 =?us-ascii?Q?KTGhaCSp40bIjGSOivpqVsJyS3FiZEbWgaJpr9Z6+RHGGMQLQHwYkqFFex5l?=
 =?us-ascii?Q?TJxBh/ve3MQAwvOcvPFds0qxDldYGAdly4imwNM6dJJ4Fz3eWTWgvjEhUepR?=
 =?us-ascii?Q?dlCawIxco4PGqeYoTVLAlHnJgbvJMQGe+UPT2zSPxAbE0hydxb3nnX2v7mVE?=
 =?us-ascii?Q?MgeeBL3upvKRwbuelLGbHGSbGiVKVpy6w0yIPleTkDOrVBhHFNocMIw+o/vg?=
 =?us-ascii?Q?ne2w?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Dec 2020 18:39:51.2024 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-Network-Message-Id: fa3541be-5d42-46c3-70e3-08d89e042526
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: V46JA60/jPK+1QlOS6OSMdzAEDhZUL6rT/FL6lrXSLZB/6py+JQ4iGv8lkbZk3RaFdGaWfeg0cuxo4p74m2asO6S697uLPxiCmKAnpr7blA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4915
Received-SPF: pass client-ip=40.107.7.97;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR04-HE1-obe.outbound.protection.outlook.com
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
Cc: fam@euphon.net, kwolf@redhat.com, vsementsov@virtuozzo.com,
 berto@igalia.com, qemu-devel@nongnu.org, mreitz@redhat.com,
 stefanha@redhat.com, den@openvz.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Prepare to the following patch when bdrv_pad_request() will be able to
fail. Update the comments.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 block/io.c | 25 +++++++++++++++++++------
 1 file changed, 19 insertions(+), 6 deletions(-)

diff --git a/block/io.c b/block/io.c
index d9bc67f1b0..dcfab267f8 100644
--- a/block/io.c
+++ b/block/io.c
@@ -2107,6 +2107,7 @@ int coroutine_fn bdrv_co_pwritev_part(BdrvChild *child,
     uint64_t align = bs->bl.request_alignment;
     BdrvRequestPadding pad;
     int ret;
+    bool padded = false;
 
     trace_bdrv_co_pwritev(child->bs, offset, bytes, flags);
 
@@ -2138,20 +2139,32 @@ int coroutine_fn bdrv_co_pwritev_part(BdrvChild *child,
         return 0;
     }
 
+    if (!(flags & BDRV_REQ_ZERO_WRITE)) {
+        /*
+         * Pad request for following read-modify-write cycle.
+         * bdrv_co_do_zero_pwritev() does aligning by itself, so, we do
+         * alignment only if there is no ZERO flag.
+         */
+        padded = bdrv_pad_request(bs, &qiov, &qiov_offset, &offset, &bytes,
+                                  &pad);
+    }
+
     bdrv_inc_in_flight(bs);
-    /*
-     * Align write if necessary by performing a read-modify-write cycle.
-     * Pad qiov with the read parts and be sure to have a tracked request not
-     * only for bdrv_aligned_pwritev, but also for the reads of the RMW cycle.
-     */
     tracked_request_begin(&req, bs, offset, bytes, BDRV_TRACKED_WRITE);
 
     if (flags & BDRV_REQ_ZERO_WRITE) {
+        assert(!padded);
         ret = bdrv_co_do_zero_pwritev(child, offset, bytes, flags, &req);
         goto out;
     }
 
-    if (bdrv_pad_request(bs, &qiov, &qiov_offset, &offset, &bytes, &pad)) {
+    if (padded) {
+        /*
+         * Request was unaligned to request_alignment and therefore padded.
+         * We are going to do read-modify-write. User is not prepared to widened
+         * request intersections with other requests, so we serialize the
+         * request.
+         */
         bdrv_mark_request_serialising(&req, align);
         bdrv_padding_rmw_read(child, &req, &pad, false);
     }
-- 
2.25.4


