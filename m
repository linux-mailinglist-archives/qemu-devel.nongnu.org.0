Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A3262F8D75
	for <lists+qemu-devel@lfdr.de>; Sat, 16 Jan 2021 14:48:04 +0100 (CET)
Received: from localhost ([::1]:37082 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l0lvv-0005X6-90
	for lists+qemu-devel@lfdr.de; Sat, 16 Jan 2021 08:48:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58162)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1l0ltB-0003AF-3i; Sat, 16 Jan 2021 08:45:13 -0500
Received: from mail-db8eur05on2123.outbound.protection.outlook.com
 ([40.107.20.123]:62560 helo=EUR05-DB8-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1l0lt9-0007XP-1K; Sat, 16 Jan 2021 08:45:12 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RJDuPxHy+ibSYowuVHmMZfn2cnwBKdX53EfRSDvBV530tw3GeDAcZ9oX7kbNX23vUyuN1ZAc+/VjtnmYtZl47k8Ml9ia+42dHrPxMhOsmzmDxjZ1vWtT2n5d5w0g5NKL0CZhXUILPTYyA3TwxfIlJCunrv0Tie5gqq7u4vuhCuhpwhJD2m1RWPYye1YVG32E6Qi0fnZ8xBaybXoXjJqoD9yfhGDzyqHUg4vwmVILHBvtUnMF3stPaR04I0yOu/AEHaF8+MmbTXza/iAUC1J2np8QtSsmYw3YYTvJwyAR/81nJjLWTnJS2GP5SvvzenpBNKnW5BnRI+O7hI5qu1RHUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=M3GeFnsUXnYJkynJQB6sgGQCNimjAM7l1gIzxFb0qLE=;
 b=TGIADDHtp8jB2Yfrybo+fvxHN0B7/vZP/0Zt2heV+1NEcmSu8SOao5TUhoIm+TkysV96kQuwl6CrjKx9o9DWl0IRBHPY58vdSetuFyfBg0gZEUrMFayq8Ho7rUwZfVGPfobUv9nr5JYH+VOFy2RQBXamXDNx1OpoJxhiNgWOp3Te1c++Rv6m9Q7O3Wz7qSKZMUsfaKcwkQU3LCt0QUzXHnkWjWQAYQ90mBjIH5pRt3XwECuekmem9JIREJ4JiyoIeCZvz8pzFbR5IbGFpgkQI5fW2p/in2icthNY6yHEAjk0jQ6bn5cF64VCm5oVwWimuHqaya5qiiqWfTcyPEdF9w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=M3GeFnsUXnYJkynJQB6sgGQCNimjAM7l1gIzxFb0qLE=;
 b=b4FGUs6IaCOPm4u27i/p7seh0SyRIQQ0gocaHx9nH8RkEq+hOgZl3BfsHxio30HJzdyUGyrq/FxW7Od4ZRCFzoqpRQmaiDBw4FjPsDRjvHtJGp5Gk6Dd6po5KqkinHQYD7eMag+uBHBWmo6bYwgN+/kXPbyerjRPc/LYIb4VjtY=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM5PR0801MB2098.eurprd08.prod.outlook.com (2603:10a6:203:4a::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3763.11; Sat, 16 Jan
 2021 13:45:02 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::214a:3545:368c:7ae8]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::214a:3545:368c:7ae8%9]) with mapi id 15.20.3763.013; Sat, 16 Jan 2021
 13:45:02 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Subject: [PATCH v7 03/11] iotests: fix some whitespaces in test output files
Date: Sat, 16 Jan 2021 16:44:16 +0300
Message-Id: <20210116134424.82867-4-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210116134424.82867-1-vsementsov@virtuozzo.com>
References: <20210116134424.82867-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [185.215.60.72]
X-ClientProxiedBy: AM4PR0701CA0019.eurprd07.prod.outlook.com
 (2603:10a6:200:42::29) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from kvm.sw.ru (185.215.60.72) by
 AM4PR0701CA0019.eurprd07.prod.outlook.com (2603:10a6:200:42::29) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3784.4 via Frontend
 Transport; Sat, 16 Jan 2021 13:45:01 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 21154982-5950-46e8-e0a4-08d8ba24ec6a
X-MS-TrafficTypeDiagnostic: AM5PR0801MB2098:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM5PR0801MB2098C76059E227D785C3D4BFC1A60@AM5PR0801MB2098.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:530;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 7iQI8V1jDOAuq8hMzuqm02oj62tRTPYSOoANXSz8sCGyrmZZqj5fLsykb4eYQig9vn8gX+RIPgdTK/FCQimA3QN0YtYN8SJmBeLrStFkkh0I5xtYgPNh7IbrRM5ByGC/RYtQ9zK33JHg48ADBy+VhYjnapNJv/9XnaShIQ/pqU0txIai/wSwT33MJAptRZu8yyLEWmcoY65p9DL4QdyqHw8Q7+gjehtoxnEA0fxSJZTsKyOFV4h3wHoaJUXiUjRW1mKXlUpjjH30yVkq4bwwmEe8bKHNESebTF1tCCTy42nCddzdvBTceR5YJ6yPKxXSa+uZrVbsQhs3FDqGLDbI70y1GLP65j4UZ7kfw44D4K+CE4oIZRwQR4WA2VzTpxXRhYbIJ9zpceFksnGQTGYNndsu5zUr4pS+zvcEnuBaGeoBO0d90GgZysC6Am0MduHPPnPnIM6lu96ZyGtB80CNQGPF1D5yg6WfdxTiLt5fSeHnTxY9+6oad+8Z/9tAME4r9MYXJSPpa6t/1m1BX0iSLmjk1NBdfZJNw69zglR/oM0lQ2DvJ+ERgZWekqcQQ9Ow
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(136003)(366004)(376002)(346002)(39830400003)(6916009)(36756003)(83380400001)(66946007)(6666004)(6512007)(86362001)(1076003)(66556008)(5660300002)(6486002)(66476007)(6506007)(478600001)(4326008)(8676002)(8936002)(956004)(2906002)(52116002)(186003)(16526019)(316002)(26005)(2616005)(21314003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?TPS5wQkw5zUiYIP9Ih1ekZvOZFY5DgsakHf0s4yAmawiqICR1YPIPKrfvvFW?=
 =?us-ascii?Q?XxkRm3cyBfU0ezxIqdq6/TOlfNFRtYL4h/x+qFpjxShxEzwxEcKzqG9P8sDZ?=
 =?us-ascii?Q?Tn4CWd927Iu/ps95UwULOH5C3FodxHQ/DfIs1r8LtTghfFP0bPVdN+S34LU2?=
 =?us-ascii?Q?71kIC8I5O/7mF6geZFgH+dUtufgw4H7iKzG/FhEnnBfTw5L84/hoWphZQZ3+?=
 =?us-ascii?Q?MsR+a3jhKTMmzESUefMddXxbp965F/TUlXTJA59wGJLCy+QLO1u8lom4Fabe?=
 =?us-ascii?Q?FWDOCMf5tDGUaoTvDg37m0yMt3m3/fPT1yNh5uofiRrW9C3Rlhx5SPPFkaAx?=
 =?us-ascii?Q?3xDY47iTnoi2OvDVRDQt3Ev+Ae06je3sETBnxEsd3eXgcNSChLs3YQsXepz5?=
 =?us-ascii?Q?4LGdAIY/P5eWOQsQjUdtgQFV2CjQ0CP5ZEmWHS6O9lBItFBUTWtsl1n7cwoX?=
 =?us-ascii?Q?7+nFhb69mTLCv5vRbkBCAZd2gMZjcxqIhndR9lzrSgkE7mVdEjBsi4XlAq6P?=
 =?us-ascii?Q?987SwPXfqReWp948iU2D+mf0y01MmtFcaTm0viKFrCQmcXk/XfHY38CsYuI2?=
 =?us-ascii?Q?aTkXNm3K/hRWPaRnkSjAd67n1tq+xNPt5SIepwiBY9trO9hFgAg0FPWcGqfC?=
 =?us-ascii?Q?PIIxPK+DiUPTRZHgaDhv341UkWnKvgbgidpxYrQuZ46RElslpXzQXtaj86zF?=
 =?us-ascii?Q?wl+vESiJ+lMboT+Y4BbSuCdX23gSZnjjQJQV+TpoKRS/byrveEPA+vyGYHMd?=
 =?us-ascii?Q?OT8iwtw7CrDgeIQR2aq4BwMAhnxEZw1hZomDZ1jrO5acCq/cymDjwMrR7DUd?=
 =?us-ascii?Q?XyIVFEPm83+GCDCzwG9+2rrB3/IQg7E6LsFc8m5Rat8ZNtLPgwAnPnpCU8H1?=
 =?us-ascii?Q?Vf8OcOEED1C5HRoLorFka5MIGas9/k8XvTPoUYHk7B8SP7aHzJnKQMy6WNyS?=
 =?us-ascii?Q?hvxHV13I67eBW1WvOynkBWELUzq8QBnPvbcZdZjejOqGxv1sg+z+aKcRvZX3?=
 =?us-ascii?Q?Usgr?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 21154982-5950-46e8-e0a4-08d8ba24ec6a
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jan 2021 13:45:02.3475 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: f5Jd9G22f5rytDaaI/pdAMRN+tFS1g9XA0/WRhmH0UtqwBL7p/x4+cM8cgWKTT2gSX0fi/PRy+Gfb0P5cHCnscqWbGHoWeydLROX+IGocxs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR0801MB2098
Received-SPF: pass client-ip=40.107.20.123;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR05-DB8-obe.outbound.protection.outlook.com
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
Cc: kwolf@redhat.com, vsementsov@virtuozzo.com, jsnow@redhat.com,
 qemu-devel@nongnu.org, mreitz@redhat.com, den@openvz.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We are going to be stricter about comparing test result with .out
files. So, fix some whitespaces now.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Reviewed-by: Eric Blake <eblake@redhat.com>
---
 tests/qemu-iotests/175.out |  2 +-
 tests/qemu-iotests/271.out | 12 ++++++------
 tests/qemu-iotests/287.out | 10 +++++-----
 3 files changed, 12 insertions(+), 12 deletions(-)

diff --git a/tests/qemu-iotests/175.out b/tests/qemu-iotests/175.out
index 39c2ee0f62..40a5bd1ce6 100644
--- a/tests/qemu-iotests/175.out
+++ b/tests/qemu-iotests/175.out
@@ -23,4 +23,4 @@ size=4096, min allocation
 == resize empty image with block_resize ==
 Formatting 'TEST_DIR/t.IMGFMT', fmt=IMGFMT size=0
 size=1048576, min allocation
- *** done
+*** done
diff --git a/tests/qemu-iotests/271.out b/tests/qemu-iotests/271.out
index 92deb7ebb0..81043ba4d7 100644
--- a/tests/qemu-iotests/271.out
+++ b/tests/qemu-iotests/271.out
@@ -500,7 +500,7 @@ L2 entry #0: 0x8000000000050001 0000000000000001
 
 Formatting 'TEST_DIR/t.IMGFMT', fmt=IMGFMT size=1048576
 L2 entry #1: 0x8000000000060000 00000001ffffffff
-qcow2: Marking image as corrupt: Invalid cluster entry found  (L2 offset: 0x40000, L2 index: 0x1); further corruption events will be suppressed
+qcow2: Marking image as corrupt: Invalid cluster entry found (L2 offset: 0x40000, L2 index: 0x1); further corruption events will be suppressed
 write failed: Input/output error
 
 ### Corrupted L2 entries - write test (unallocated) ###
@@ -515,14 +515,14 @@ L2 entry #0: 0x8000000000060000 0000000000000001
 
 Formatting 'TEST_DIR/t.IMGFMT', fmt=IMGFMT size=1048576
 L2 entry #0: 0x0000000000000000 0000000000000001
-qcow2: Marking image as corrupt: Invalid cluster entry found  (L2 offset: 0x40000, L2 index: 0); further corruption events will be suppressed
+qcow2: Marking image as corrupt: Invalid cluster entry found (L2 offset: 0x40000, L2 index: 0); further corruption events will be suppressed
 write failed: Input/output error
 
 # Both 'subcluster is zero' and 'subcluster is allocated' bits set
 
 Formatting 'TEST_DIR/t.IMGFMT', fmt=IMGFMT size=1048576
 L2 entry #1: 0x0000000000000000 0000000100000001
-qcow2: Marking image as corrupt: Invalid cluster entry found  (L2 offset: 0x40000, L2 index: 0x1); further corruption events will be suppressed
+qcow2: Marking image as corrupt: Invalid cluster entry found (L2 offset: 0x40000, L2 index: 0x1); further corruption events will be suppressed
 write failed: Input/output error
 
 ### Compressed cluster with subcluster bitmap != 0 - write test ###
@@ -583,7 +583,7 @@ read 524288/524288 bytes at offset 0
 read 524288/524288 bytes at offset 524288
 512 KiB, X ops; XX:XX:XX.X (XXX YYY/sec and XXX ops/sec)
 Offset          Length          Mapped to       File
-0               0x80000        0               TEST_DIR/t.qcow2.base
+0               0x80000         0               TEST_DIR/t.qcow2.base
 # backing file and preallocation=falloc
 Formatting 'TEST_DIR/t.IMGFMT', fmt=IMGFMT size=524288 backing_file=TEST_DIR/t.IMGFMT.base backing_fmt=raw preallocation=falloc
 Image resized.
@@ -592,7 +592,7 @@ read 524288/524288 bytes at offset 0
 read 524288/524288 bytes at offset 524288
 512 KiB, X ops; XX:XX:XX.X (XXX YYY/sec and XXX ops/sec)
 Offset          Length          Mapped to       File
-0               0x80000        0               TEST_DIR/t.qcow2.base
+0               0x80000         0               TEST_DIR/t.qcow2.base
 # backing file and preallocation=full
 Formatting 'TEST_DIR/t.IMGFMT', fmt=IMGFMT size=524288 backing_file=TEST_DIR/t.IMGFMT.base backing_fmt=raw preallocation=full
 Image resized.
@@ -601,7 +601,7 @@ read 524288/524288 bytes at offset 0
 read 524288/524288 bytes at offset 524288
 512 KiB, X ops; XX:XX:XX.X (XXX YYY/sec and XXX ops/sec)
 Offset          Length          Mapped to       File
-0               0x80000        0               TEST_DIR/t.qcow2.base
+0               0x80000         0               TEST_DIR/t.qcow2.base
 
 ### Image resizing with preallocation and backing files ###
 
diff --git a/tests/qemu-iotests/287.out b/tests/qemu-iotests/287.out
index 6b9dfb4af0..49ab6a27d5 100644
--- a/tests/qemu-iotests/287.out
+++ b/tests/qemu-iotests/287.out
@@ -10,22 +10,22 @@ incompatible_features     []
 Formatting 'TEST_DIR/t.IMGFMT', fmt=IMGFMT size=67108864
 incompatible_features     [3]
 
-=== Testing zlib with incompatible bit set  ===
+=== Testing zlib with incompatible bit set ===
 
 Formatting 'TEST_DIR/t.IMGFMT', fmt=IMGFMT size=67108864
 incompatible_features     [3]
 
-=== Testing zstd with incompatible bit unset  ===
+=== Testing zstd with incompatible bit unset ===
 
 Formatting 'TEST_DIR/t.IMGFMT', fmt=IMGFMT size=67108864
 incompatible_features     []
 
-=== Testing compression type values  ===
+=== Testing compression type values ===
 
 Formatting 'TEST_DIR/t.IMGFMT', fmt=IMGFMT size=67108864
-   0
+0
 Formatting 'TEST_DIR/t.IMGFMT', fmt=IMGFMT size=67108864
-   1
+1
 
 === Testing simple reading and writing with zstd ===
 
-- 
2.29.2


