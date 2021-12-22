Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E733847D5FD
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Dec 2021 18:47:40 +0100 (CET)
Received: from localhost ([::1]:37768 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n05iF-0001PD-G3
	for lists+qemu-devel@lfdr.de; Wed, 22 Dec 2021 12:47:39 -0500
Received: from eggs.gnu.org ([209.51.188.92]:52416)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1n05bZ-0000a8-LR; Wed, 22 Dec 2021 12:40:45 -0500
Received: from mail-vi1eur05on2133.outbound.protection.outlook.com
 ([40.107.21.133]:46561 helo=EUR05-VI1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1n05bX-0002Xs-VW; Wed, 22 Dec 2021 12:40:45 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=P0FB3Och6EEzS8My4zjzjwQ+MfIvhKLYnpHtZNGL3KHiSpV/WttRqa4ul8i21n8KaYehYE8AC5nSx59bT7NbzMwpIUQdwL/KPqhKchRH7Hjq1/uqQD6i2lLeUNV27hq05DU2axH7c9NVONmBu/yct8sQGn4lN74bTuJhAkOw8+rp2QBAwBQzjLgWhvk2g4Sms2DgMIuZj3Ui6AbCM4UQ+5qf+O9otY7T9PDyYyBjCDorN6Aazbb3whQ8DG5Vs4Rp5rCShoOeT9vR1caH+3S0onJrSKrmbwwe6qvnCs/j4H+aqP/ckXntW5kXjKFNOdiwPv1kaaUQhqv6cBbrgp8w5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cPuHYFNucM2eM+aQcWNiQMeC4pPolROBBjoh9XsJKb4=;
 b=D+rBDUo549DsnpmtKf+nvirk5tL0GV1XTIyoTemLTvhfNSXFr9eil02J5lATSOcghWzMK5X+THfQ0tH6VSLEDirhYZsYUgFvrmVCBF8/lkM8zIAhM7DO+m9pLVk07ycPCAWyp0/+r1cYZiOq7VSqZVz06BC2FAYW2TDQ1iwfoy5eqXpB3Xx0mLZ0VoZG3AwsMZ6QPfLyVrZrcKwPOL8V34mjbl/uDu94yyf9D06RHeWULocyerxUPcCHLYO0o8LTCi9he3JvejO+0UL/VfQXCGfVQ+wDoGuO4B3qsQY14hj6BixR6WX2j/L2+G1Vobqngp7nMvzW4o1IvmEtVGJBdg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cPuHYFNucM2eM+aQcWNiQMeC4pPolROBBjoh9XsJKb4=;
 b=DZLp8TImkiNeHSEbTHBEOvJqiOQwLk8ccmPEQTI8mcgnARS2+qf4Bzh1X9JCXOVbYLk1BJNg24P5L5houfkjkmCf66B3CzwTEuaBNQgwE+DdNvUbGyRKPD2eHEHmcnAnfC/+GfyCs6yA0gdwOK4Z3pSO2rKYlZwRXCip1eklEVs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from DB9PR08MB6748.eurprd08.prod.outlook.com (2603:10a6:10:2a7::16)
 by DB8PR08MB3964.eurprd08.prod.outlook.com (2603:10a6:10:a4::25) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4801.17; Wed, 22 Dec
 2021 17:40:38 +0000
Received: from DB9PR08MB6748.eurprd08.prod.outlook.com
 ([fe80::a89f:c7bc:b9f8:fc3e]) by DB9PR08MB6748.eurprd08.prod.outlook.com
 ([fe80::a89f:c7bc:b9f8:fc3e%6]) with mapi id 15.20.4823.019; Wed, 22 Dec 2021
 17:40:38 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, armbru@redhat.com, xiechanglong.d@gmail.com,
 wencongyang2@huawei.com, eblake@redhat.com, hreitz@redhat.com,
 kwolf@redhat.com, vsementsov@virtuozzo.com, jsnow@redhat.com,
 nikita.lapshin@virtuozzo.com
Subject: [PATCH v3 08/19] block/reqlist: add reqlist_wait_all()
Date: Wed, 22 Dec 2021 18:40:07 +0100
Message-Id: <20211222174018.257550-9-vsementsov@virtuozzo.com>
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
X-MS-Office365-Filtering-Correlation-Id: 0c407063-c348-400a-7770-08d9c5722adc
X-MS-TrafficTypeDiagnostic: DB8PR08MB3964:EE_
X-Microsoft-Antispam-PRVS: <DB8PR08MB3964F18C6E1587B6DD3AEE4EC17D9@DB8PR08MB3964.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:411;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: JCgkTrafR+jnxUdUhdQyw4thXrdvUD/MH32YIXVbzjxJNmhKR0o6/IMgX5OFsnW37Y79u+bghw1cxa6r8pxpLomJWOsVNFcbIDmg18EaxM3OiiTfQwY8DiVKGQxCA+3Y6e7OmvzbY5xsm/kKi4bRkHPLBGHwQe4swM5R5PhOSYpZEUbMMmz06p/F/7L8022IhqBEP8Rj8s7aC/hkQoc28A0rRQPYZ2vqVVXIRBqKohevu9CPU/DkcT9HORa3sb0V7Y22Yx9Jm7FRRcTpZrRSOss719p1MR6WgvPADLFQpRenJ0KDkgTSo5GSO5yR40Cflafam6KIUFLQN7ZLvC/DXTyQZv11Vdm7EzgTnMY2rd2ALS3pxxNHQQDxPXIL93vB+BBZDiD6AdDO/Xb22tu8tAhgrWNM8wHDDR0qDPbGm86mRVq+HgwLK6haivVLTa0uSVz+tTsmRQFpvd090iivLIJjR1iTHwch5oB+cINbF/WDXuC285vtcDAz2FKQyZly1XSowgxw9IuQTrBfjJb0FfI47yejCWGtG/umXT4rqwfX4Cp1PUw/k5fh1xtLd83hcYQnLYHcgplUGlBIiwoDzm/wdfageuHfohvoviVMB2Lwc+J07wzQAaRh+Qqf7fBeKhnzLOHfdHcUOytFfVMvXhr9Q6pL4/17ammVUCFSSNMrTiwfUjfN62jZHh9+NOryCWFGSZw6GNi1JU9FlmLmOw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DB9PR08MB6748.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(107886003)(6512007)(6506007)(26005)(316002)(52116002)(2906002)(186003)(508600001)(6486002)(6916009)(4326008)(2616005)(8936002)(5660300002)(6666004)(8676002)(1076003)(38100700002)(38350700002)(86362001)(83380400001)(66946007)(66476007)(66556008)(36756003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?vwigR9oDTK3QElAILjI8rmX6q5qoeDJTNw5vbqXYGK09X7LpItGOGdeyBjSr?=
 =?us-ascii?Q?KCkec5ugS/VLBKQfTbOpA3+Lc0fuA5SPpGVYNkOhjEcYpNyAr/MrzWXpQcnk?=
 =?us-ascii?Q?rGJr5pCnZXD6Ex6xz7o95cyjN0W/3sclFgL6yZjY92ELsfksE/Hum3x8i0r6?=
 =?us-ascii?Q?1URbLrrsVr8dv57aohmaPSTBb+AS4PDvjqXN2hL8hJzyx7IimvCHkN4kUr8b?=
 =?us-ascii?Q?ERqDzATGCrEpyNM7WPU4O1VQ1YxZNmYLtyUxkS9zFy473vX3qI6ht/HVZWNt?=
 =?us-ascii?Q?C1Z3DZ4XLEk/txsyQHWk9yVbTBYDjp9C0Gqk+rpRWDRUA0QDkTO2J86mCOlj?=
 =?us-ascii?Q?NfsilJq5dBn+WmFxxEEuXWH4zOX3tFW3CSbaLsQ29HCcx9w/EmPVUG8N13QN?=
 =?us-ascii?Q?k/Cj0IQgHIGePDh5Llt2ln9pHg6fPCLj+hHyJusEP/O62lefVEFYl+WjKF79?=
 =?us-ascii?Q?9hZDmo3YPR3vtweljG9+wOgLRi7kbR2gmRhT12rv/bwUYit+ihdqEqaaVqVA?=
 =?us-ascii?Q?Z9OlBTNNRzxdTuqaxUJ2jxk592r9hXwzVqZleXHCFHzQMBmzG9SjLtjEsp4x?=
 =?us-ascii?Q?aXpscp2gPdbhQXqrxP2m1Xk76MJHyQ5Cok0A2Uh65YAKMN6iTfjp7XOO65D+?=
 =?us-ascii?Q?+7IcPgLUnb5f06iiC71BW7poXinEEks4uUnKIyFBIRKzQeN/HidYdtDtaTxt?=
 =?us-ascii?Q?mtBAJEW7nkvyGeSedh+UHcz7Y4aR4MIz+uynW4DwbVdhEHHpKnnRPbnuFiGq?=
 =?us-ascii?Q?BD5H7IVnhuZG2daBHTvcFX/ZOBI4pVUw1WxM8mglu6vG/TaamlnMfESY4WhI?=
 =?us-ascii?Q?uolhtIEZEkWmI4krAnAavE5Wx4WeC5n0BeUuWtpg8Q+znFWZvxhck0O0Nhpb?=
 =?us-ascii?Q?XLMmR/87PVeA9blzAcCx9lT6AExIRIr1Q7Qkfz+IXSy526Konq8eEkzHZaM5?=
 =?us-ascii?Q?atf41CQHUix9jV+4AUqx5s45zj9unaDRPqEjjBxJ8EcTmJ8VWh+Yg7HYI07Y?=
 =?us-ascii?Q?TwQHY388pvibpgagTslrJ0l5zl46deU/yorbCueLmUNxH8t3XqBq47SdI5Mv?=
 =?us-ascii?Q?XjPbfrsS+Aqgp15jszrPvRXSkl92zQyZNnT0UsG6DTSMvzS4Uvr4XTa8nh5s?=
 =?us-ascii?Q?L+9/9elUC4Kk14AyPW/ZKzCt/+ymMMrNtrSYGUJmB92YVPm1FJkItEmSO+Cm?=
 =?us-ascii?Q?Kk5/ItIrai4/u+TkDE5LOXuVNIpx9EBAFNCLiSLpvwQuOFAfI1Ce71RaGQG6?=
 =?us-ascii?Q?HV2/uBHOhwIgAVG3KC7p+zu6HwvQGTguCgi2HFC43qG5+nLMjQONujLiB9x8?=
 =?us-ascii?Q?q5CRlbyI6CC1Jlc/AR+L8P34EyLwCn5qBpMC9D7xXteo/uuWvPA5TdNad2lI?=
 =?us-ascii?Q?Y+1ilt6GI2ZQV3czjLyCmWOLutcUW6YFOVJ2biZHhSCgArP6qNsOEl//a533?=
 =?us-ascii?Q?7wekL6JLkb61wNS64Tz6mxq2XJsJvznml26sIgZemDwE4ARPn4OKIeZdmysh?=
 =?us-ascii?Q?aElBbG7ruC5wu5C86dR0pkNf7LmmCizVV+A72jkGh28pSEWiI/5rB0nvQEmp?=
 =?us-ascii?Q?4hwivwlDPL/4wKbkHl1zpLG4QDGgrS8qd8DmP5UDP5KVhthO0k9o4iYoc5qy?=
 =?us-ascii?Q?Sy6BPymirgAkH93GMbacXscBA1oF96kGIxQUmAVENdrdmn2XCHrwC2uQMqDI?=
 =?us-ascii?Q?2AgprP2Gyzeqz08Uk4rllywsZsc=3D?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0c407063-c348-400a-7770-08d9c5722adc
X-MS-Exchange-CrossTenant-AuthSource: DB9PR08MB6748.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Dec 2021 17:40:38.8326 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eboAZLA45OlF/TZViNuNp3sVUNgqG5iJQlA2mvps5IDJLpq+ny1qW0A+nWKY5R68FSMW9AqS+h52pwHby4nJfLKsDXxQVgrdovHbsRP1EuY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR08MB3964
Received-SPF: pass client-ip=40.107.21.133;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR05-VI1-obe.outbound.protection.outlook.com
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

Add function to wait for all intersecting requests.
To be used in the further commit.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 include/block/reqlist.h | 8 ++++++++
 block/reqlist.c         | 8 ++++++++
 2 files changed, 16 insertions(+)

diff --git a/include/block/reqlist.h b/include/block/reqlist.h
index b904d80216..4695623bb3 100644
--- a/include/block/reqlist.h
+++ b/include/block/reqlist.h
@@ -53,6 +53,14 @@ BlockReq *reqlist_find_conflict(BlockReqList *reqs, int64_t offset,
 bool coroutine_fn reqlist_wait_one(BlockReqList *reqs, int64_t offset,
                                    int64_t bytes, CoMutex *lock);
 
+/*
+ * Wait for all intersecting requests. It just calls reqlist_wait_one() in a
+ * loops, caller is responsible to stop producing new requests in this region
+ * in parallel, otherwise reqlist_wait_all() may never return.
+ */
+void coroutine_fn reqlist_wait_all(BlockReqList *reqs, int64_t offset,
+                                   int64_t bytes, CoMutex *lock);
+
 /*
  * Shrink request and wake all waiting coroutines (may be some of them are not
  * intersecting with shrunk request).
diff --git a/block/reqlist.c b/block/reqlist.c
index 5e320ba649..52a362a1d8 100644
--- a/block/reqlist.c
+++ b/block/reqlist.c
@@ -57,6 +57,14 @@ bool coroutine_fn reqlist_wait_one(BlockReqList *reqs, int64_t offset,
     return true;
 }
 
+void coroutine_fn reqlist_wait_all(BlockReqList *reqs, int64_t offset,
+                                   int64_t bytes, CoMutex *lock)
+{
+    while (reqlist_wait_one(reqs, offset, bytes, lock)) {
+        /* continue */
+    }
+}
+
 void coroutine_fn reqlist_shrink_req(BlockReq *req, int64_t new_bytes)
 {
     if (new_bytes == req->bytes) {
-- 
2.31.1


