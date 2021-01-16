Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A74BE2F8F92
	for <lists+qemu-devel@lfdr.de>; Sat, 16 Jan 2021 23:01:19 +0100 (CET)
Received: from localhost ([::1]:44180 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l0tdG-0006wN-N1
	for lists+qemu-devel@lfdr.de; Sat, 16 Jan 2021 17:01:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51018)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1l0tQb-0005gU-PJ; Sat, 16 Jan 2021 16:48:13 -0500
Received: from mail-vi1eur05on2101.outbound.protection.outlook.com
 ([40.107.21.101]:54721 helo=EUR05-VI1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1l0tQY-0007Dt-N3; Sat, 16 Jan 2021 16:48:13 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jonJkpwlGwDi+CWEl1SU7eFuXdf6TmZdq0naO5SBRHQ/rsWoMCppMXLT09X654MOWBaqZ5PN8a8mHoUIXQpSrpVuh7xrEWTGBqxrzH+2RWCNU1YGKu285PtHfkkThs4Kh4kXwQqqPOBu1lz7Nf0N7JNPf9zeIDj7+uRNXsQJxz79QMp6RqHYycBu/+wXAytSRP3Ad0o9lcNyI2mWA+oQFM7eCXZk5VMDxMemgseghoWg7ogGaVvrU2gwTLN8HoOFKQGZrpw8d3cQnu6IYVlTQ2PvZLmOVJipVqmIZMoZ/u0JGq47f8Tuf1Tz446WBTClbPfbyaqr/ilM1vmpO9MaXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tLG3gwjolYPIuaOvdPMzCLH9H6meR+M97iRxn2d+Rn0=;
 b=XMGBaVL7AdoXV9DWJNUjS6yiNRrgT+wv80VZQrIiABYKB4EcH4mTQJbGV4lQbD9js1Th66My/5iXX7/OcxbIKvMVxgKrjeQmxJeOpPfIRoTyLUBxor2cu6NB5hmfnDf9l7iZ29OwspOk0kfb5SN5x+kdfn+N8+w2irZmRwsDfljjYYVVP89z8bJiCj8Q0tjG5NAzBK5ulmQhGOiRyaFCnjSz+GKj5wbihYTxmkwLx+2dCxz8p5dxl6Rec6JeCNCzhZY5eeDF/LmwVGzAmrdZkSlgsb9KcBFjE3tBi/mBJX5zQIi7jxiaEMnRp3sTFwOXUQLGji8fsI18MIbSo/ZAMg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tLG3gwjolYPIuaOvdPMzCLH9H6meR+M97iRxn2d+Rn0=;
 b=pJUsPtGdKN3C+JKo+aoBS8JQbhpjhQuNh9/vcQRvzK2mfud776rZpbpFSzL2vYkNLyo0Rm0tNn2LdQC4ufEhNR8Cha7W7/Ra/nlkJDs1BiTwCJfLqOaeK6YvDV/IesMLfa/sQI0+ygzQDcmANeYRZM6KtyWBWF1lTA70DtV3klU=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB3542.eurprd08.prod.outlook.com (2603:10a6:20b:4b::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3763.12; Sat, 16 Jan
 2021 21:47:58 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::214a:3545:368c:7ae8]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::214a:3545:368c:7ae8%9]) with mapi id 15.20.3763.013; Sat, 16 Jan 2021
 21:47:58 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Subject: [PATCH v4 18/23] qapi: backup: disable copy_range by default
Date: Sun, 17 Jan 2021 00:47:00 +0300
Message-Id: <20210116214705.822267-19-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210116214705.822267-1-vsementsov@virtuozzo.com>
References: <20210116214705.822267-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [185.215.60.72]
X-ClientProxiedBy: AM4PR0701CA0005.eurprd07.prod.outlook.com
 (2603:10a6:200:42::15) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from kvm.sw.ru (185.215.60.72) by
 AM4PR0701CA0005.eurprd07.prod.outlook.com (2603:10a6:200:42::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3784.6 via Frontend
 Transport; Sat, 16 Jan 2021 21:47:58 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d855c77a-7b5d-4171-318a-08d8ba6863c4
X-MS-TrafficTypeDiagnostic: AM6PR08MB3542:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR08MB3542C61E04E8604EC82CD328C1A60@AM6PR08MB3542.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1360;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: FJ0Ma79k/FOJQvO+sGDDAOAyCVgxiIkfiDAqv1tu8WcQfESuAF0zA7e2ZtdXHbYQbSt1FgqsAWaJnRL8wrOlkcImWdoVjo9JtAz5ob+t+AnxwOxeQaUzqJIAj2RJvIPNRUgU6oIZvfucRf1dvXrd8q81RZQoSCAjWBFDR7+hPSaikINpHFgzn4mENDKxSROj9PGykMOPsBCiWuvIcBxVwhmCuKRCqbd05MgyffdWSY+XrfyFasKT94AbzPtd1+PWcq5EyFcqnrAFwqKHc+CljQl9HZqCl1xnQbNVy0/YKvGj9Jserkg/CEqdKNM/+E4C3VaA1mD/ynkIDtC1HMjQ0GiE890FnBFZYijhIypgCU2ZnQQQgbwtlDZY6WTtGrjMramMHt/UPi3/1B5R/leQK+qV9IP7Bn/TSq+zMLtqR3AwVTyxxuAUZgWkWfvnLcNK9l/tYNew5wvCyNxDNh++POEQfrOYdc7hRZ4hIueZigp0QOXMrT/jrhxjFgB/a+M+v19G8gUAbe5sGfykF1RZ6Q==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(39840400004)(376002)(136003)(366004)(396003)(66946007)(66556008)(66476007)(83380400001)(107886003)(6486002)(26005)(8676002)(8936002)(86362001)(2906002)(16526019)(478600001)(316002)(6506007)(52116002)(186003)(36756003)(6666004)(4326008)(6916009)(6512007)(2616005)(5660300002)(1076003)(956004);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?5fwleeOAVUVvLBzleCmTjYY1kGy5k+FO4getzen7NflFCrd0NcsIe7967auw?=
 =?us-ascii?Q?sKLZDsIabjjxVNQNtC+N38l/rWh0s4N8cGcZdpbuM/1we9O+m5HZgUybkvGY?=
 =?us-ascii?Q?lKlYCAv9UEuHhkztp2WHHHL0tTeDHXVzoCQaHeziF7zVOXuq7H98hGAIAKt5?=
 =?us-ascii?Q?C0CLd4MfHQ6QVvfr4eRfo2wCGJkV0wy1FN4jP6U9osGsJOT8LuGtFbF3+eIP?=
 =?us-ascii?Q?48enSBpp1nkeN89AMmyNen2vZY9HKr3gSghI+EnGJtRKmRiEfn9azqYmqIcq?=
 =?us-ascii?Q?IpuVLJyotrr897gs5SbxwhVapZ8g6Hctn/iz0CqjbdLZ1Ps7zuTqYawwGnV4?=
 =?us-ascii?Q?aHO3/vrNyeH+BzRWzKpg9axlQlT4PKiMuzGx8yk/ATDtbCwOpfNRC33QAS6n?=
 =?us-ascii?Q?nklT3GUmrnSUKkgq/xxxWOZyhhwlOuLTReXaHVxfTSUQFaD56lZZF5NzEJ0W?=
 =?us-ascii?Q?RopZt16EGFCJVXEGBn+pVye+4enjv7209ji/pfq71sRPs1hWNAurbkwxVFRY?=
 =?us-ascii?Q?WdLo1cHfLFA155KQJ3zlx5XolMW7KoMAcFv6g8Jgh9U/TiUi/7DG00RW72c5?=
 =?us-ascii?Q?WwyNtiUsh6c9jisizN6YqJ4R69mgaB1JzbwmQx7PemuzrGtMXHUZXxZa071g?=
 =?us-ascii?Q?Dn0SfvuJ2xajlLPZYQGmLJ13u815wlrnorz8lhTQpKJgYx54hsojz4jboKD6?=
 =?us-ascii?Q?bY2RiMfMCrol2eKsoL2e8UowoPuyG2eq4W0IES9/j2/W7SbrJDi6wm8p5LKx?=
 =?us-ascii?Q?SSN8PN+QSEKQDachDupbejMJVU7MRKgQzM6MQ8ShBSq36qo5IxtbrDPZXw7m?=
 =?us-ascii?Q?OpyERhNVI0KtblH5DwtWscxL6gvVIEGlyYDav1x1z2KCa6drrDphpStOT1js?=
 =?us-ascii?Q?0Q+4oLmE0U1xBuHUjiykmfIYkBBQ5U6XEa+AWKuLqXzbJ0FCxmJwboaa4c8W?=
 =?us-ascii?Q?gUfN2jqmHnRIQGznSpa06oiC+MJlhZakoZ0nTuTGB8qY/8jEmxLYE3GeQ7SO?=
 =?us-ascii?Q?Hnwq?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d855c77a-7b5d-4171-318a-08d8ba6863c4
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jan 2021 21:47:58.7371 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PSZV9L2AyNRkO8QaAl1+03s6qfNrDu7UGYL5IqXRwrKbj8RjVHWs6+AAO4aCiYS44fYGeJVHWeU4gQF7dWhPpSM0Qy9xSfx9BMkIr9rM18g=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB3542
Received-SPF: pass client-ip=40.107.21.101;
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
Cc: kwolf@redhat.com, vsementsov@virtuozzo.com, wencongyang2@huawei.com,
 xiechanglong.d@gmail.com, qemu-devel@nongnu.org, armbru@redhat.com,
 jsnow@redhat.com, den@openvz.org, mreitz@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Further commit will add a benchmark
(scripts/simplebench/bench-backup.py), which will show that backup
works better with async parallel requests (previous commit) and
disabled copy_range. So, let's disable copy_range by default.

Note: the option was added several commits ago with default to true,
to follow old behavior (the feature was enabled unconditionally), and
only now we are going to change the default behavior.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Reviewed-by: Max Reitz <mreitz@redhat.com>
---
 qapi/block-core.json | 2 +-
 blockdev.c           | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/qapi/block-core.json b/qapi/block-core.json
index c0e9d119d2..933c2327c8 100644
--- a/qapi/block-core.json
+++ b/qapi/block-core.json
@@ -1377,7 +1377,7 @@
 # Optional parameters for backup. These parameters don't affect
 # functionality, but may significantly affect performance.
 #
-# @use-copy-range: Use copy offloading. Default true.
+# @use-copy-range: Use copy offloading. Default false.
 #
 # @max-workers: Maximum number of parallel requests for the sustained background
 #               copying process. Doesn't influence copy-before-write operations.
diff --git a/blockdev.c b/blockdev.c
index 6db433cef8..41d1431210 100644
--- a/blockdev.c
+++ b/blockdev.c
@@ -2794,7 +2794,7 @@ static BlockJob *do_backup_common(BackupCommon *backup,
 {
     BlockJob *job = NULL;
     BdrvDirtyBitmap *bmap = NULL;
-    BackupPerf perf = { .use_copy_range = true, .max_workers = 64 };
+    BackupPerf perf = { .max_workers = 64 };
     int job_flags = JOB_DEFAULT;
 
     if (!backup->has_speed) {
-- 
2.29.2


