Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F29CE40ABCF
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Sep 2021 12:37:17 +0200 (CEST)
Received: from localhost ([::1]:46748 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mQ5oT-0006YZ-2N
	for lists+qemu-devel@lfdr.de; Tue, 14 Sep 2021 06:37:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51134)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mQ5e2-0004yT-E9; Tue, 14 Sep 2021 06:26:30 -0400
Received: from mail-eopbgr70094.outbound.protection.outlook.com
 ([40.107.7.94]:64463 helo=EUR04-HE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mQ5e0-0003Zb-C6; Tue, 14 Sep 2021 06:26:30 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FpIiRParl8JGfZaTGM80pgvgyxSymYZZNIlT3HCsLZIpEpP2VXJumPE6hzcQ7z21i36UiHErAvZFk9tLZ4yQk+9/RCSTa+HvXAXkwngdL/sDnVbwd9J3e5ikTY+GPgMAc2OA/XmZEHGqVnxovhh5gQusqItAHQ/NIb7bqJkNiZPTYCzLixS/6utwrqFOG873KP4kvJFjP4JH5/YHAx3/t92ffR+v8CwxBprkngRvwCr3Rs4AO8IFYEQO9Dg5UHLJiq4V30t499rlSWEn/gfzk1oJfZNH0NigjOIfahMZcHwlB4yEV/QEJ8htm+WfCh3KFp1ejt42mv4Utw1xRBjnrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
 bh=WoVjZHPrt+ZFKeQkw9jQvuFcBAf4TbeUOc4aJBXjDHE=;
 b=QueYcxAjV3e6uIQ7vZdbVxyW3PSy6C4nP7maj9JiBQMmFTSdehF6JUUWBPIBpJhc4GgUjCsc5hY75nK7cngsdjtP+H7X6gX/JZA2iAsOI3K36H6GjJcuCGicbjkIweuwCagjWqxdbq7SN3dTL9EQOoQgu5ltrKV25nUkVA6FZc94mMYa4LuUHHkXKUwNKWAU63iDB7g5/pO6LnhTMJD/Ie6iXjjt0O4A74pTh7wCJdVkkNqnSZmwpngvNLipp4PObCCumJiRJ+xT3r0YW1NOE6/T+9cny2vrI1QUi52Szv7zsSIGUgDwFSNrVfJrWg39EXx+6sy/u9TCvirYYoH1PA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WoVjZHPrt+ZFKeQkw9jQvuFcBAf4TbeUOc4aJBXjDHE=;
 b=G6Y4+bwD+B2bblC9rTldjMJpalpzXRB7x6ybiTlWj3ozzD9Bd25I7bx4gF999hxpUCTf99KEZowbnbI3dGBiowQG9A5ZL45KGV3qtpE+xcHxayhcbZZYSFScqeDy0krKnMvaBTdN/Oky8hY/4wKzFHpWjmzV+03At0rA6viiFvg=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AS8PR08MB6053.eurprd08.prod.outlook.com (2603:10a6:20b:292::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4500.14; Tue, 14 Sep
 2021 10:26:25 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::2817:53b3:f8b4:fe22]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::2817:53b3:f8b4:fe22%9]) with mapi id 15.20.4500.019; Tue, 14 Sep 2021
 10:26:24 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, hreitz@redhat.com, kwolf@redhat.com,
 vsementsov@virtuozzo.com, jsnow@redhat.com
Subject: [PATCH v3 17/17] iotests: declare lack of support for compresion_type
 in IMGOPTS
Date: Tue, 14 Sep 2021 13:25:47 +0300
Message-Id: <20210914102547.83963-18-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210914102547.83963-1-vsementsov@virtuozzo.com>
References: <20210914102547.83963-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: HE1P191CA0004.EURP191.PROD.OUTLOOK.COM (2603:10a6:3:cf::14)
 To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (185.215.60.196) by
 HE1P191CA0004.EURP191.PROD.OUTLOOK.COM (2603:10a6:3:cf::14) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4523.14 via Frontend Transport; Tue, 14 Sep 2021 10:26:24 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7abbe3e8-46df-4f7b-31bf-08d9776a1aa9
X-MS-TrafficTypeDiagnostic: AS8PR08MB6053:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AS8PR08MB605312C212ACAC88EAEDDCA3C1DA9@AS8PR08MB6053.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: L6fMqhpXFvUHKxAW/DDwL/BJeN8lG2hVkDv3Oths2I9jFuLs87MTO9S8YS8vhoHB2tWd2ynVgt6h8HbU4ON++bd4C7LnCbYK71578AFMLsbmqrU8TdzvQslYfO6lvtQUmV7pQyGb3cHPRz2Boz+rIdtPHyqK2swNZ6cQHcEihXSsj4AP9ZYhcjm1BXdsVU7S0PxIkvwW95SMeTy4vFcuwrhrEcXJQubAkC8fHd/X9PZHv+JwYpPsg/ar89VP/+paCKY1P7ezLuGeHNQdyT4LaQG9LGhgs93UGCZEHNbo0Ev/ofkQLSajYgwGZ8rvU6oHhUY3EaZuBzRXGd0CsVjt+22iN6g/ZhxNixkC4J3eoaDUJIAT3jU0x7TtuwnPCtXOVoPbHI0WJ5z8TAiNRO6zZA92XN9BeNf6d/7otADfV2ZM0DKjrtvLiQYv7FNJazIYW/p22xLhkoF70DqztoNFEXPvttcqQjC27Uj5QeCFE4sUeqFhWRmw6/HpDW0FeF/aMmn7RrsSFTl+7qjT2zUdOECgqdZ+o11GJIZf5tIca+vaJZinytB6BbcM8ZaGjC/RE7lhnstqGKguUlJAFD05YyDP3TymywdSuAAQ/vUSgj2XjwGpcodgaJcpq5YZq/K5Fo1ew6IzPStrUiEqUBZn1qX6gSidgc9v4X+3WX51rS7Hszdn+wKtQu+KnvCTw84i7T/8h5jwjKAtCvB8AUNF2A==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(26005)(508600001)(66946007)(83380400001)(8936002)(2906002)(66556008)(38350700002)(316002)(6666004)(36756003)(38100700002)(86362001)(52116002)(66476007)(6486002)(186003)(5660300002)(6916009)(956004)(1076003)(8676002)(2616005)(4326008)(6512007)(6506007);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?D19fjSvXvDqRFilZgiLqoAdMG2FfAnLsc61Bi1+BC5sU+jEbJt7QH9+mAhhH?=
 =?us-ascii?Q?+bG9HI+N2sr76xAz8e2ILR8Rla0K0kpHy2X621BmNYlTZawnU/1pjkF8rEJJ?=
 =?us-ascii?Q?G9waVV5/ZA0YMFNqFugKfzFKSdqyocRS9qt08E0XD4p9K3LuewgPR9vm67WH?=
 =?us-ascii?Q?CSrQb/zgNFQcW9iyFvyD1mjBAZpHkhS+2Yj8bkLrBbGiUW9C+z/0yRZ/J6DA?=
 =?us-ascii?Q?hhMGKczZB8cQOtXnd4CNL0MQM5as2pX2IZbRlUqNJndTAwCI6I4UKQYFmcEE?=
 =?us-ascii?Q?rjnYTwlCWKNOVK69IiMTFibMXTlNRXKO7frX7u5gc9JHdFOjounu6R2JNLjx?=
 =?us-ascii?Q?XQ1VVM3u454yBO24xTy+7nuQUV0I+bPtebZmNQViljNHoHOIev5Gz8JqsayC?=
 =?us-ascii?Q?oGaY4fKv8fNAtyW7p6Z6kBd4r+4nOm2iVlIFtxwGvmhlcXavnDPwt7iwJ35J?=
 =?us-ascii?Q?nZdfH7EqeOdWI30dSlazjPSO07DAoKkYkVHCei3/ylvjT99pxTRBQ6IgKG6k?=
 =?us-ascii?Q?498bI1coYQhGzbYCKb4mFc6wabgtKk+lF+30DEPGssNDmDsDlQv6J1lMN4OM?=
 =?us-ascii?Q?ZMTKlEs/edkAbIICrhL2mjFk+jGRdvyWa1SV2QvdP0C1n/t7OqC/bGShVxzj?=
 =?us-ascii?Q?QwYj0fI3Oa5Ymtk7m56D64npStfJ85ufkp8FMCrbRtf4k7dQj5/gIQIGXvSU?=
 =?us-ascii?Q?M6mxZibIiXNX0HgU45sWzHY3So74ZNT/GgK8NmDSxr2BmwG97v+3v8GvuSwQ?=
 =?us-ascii?Q?X53k1ghQh8NwPEvHourKOZrPYBXS1waPg32ABmYJ9K4NcyQkdp+3DHwsizBu?=
 =?us-ascii?Q?ZFgv2rMjqALQeuZ0eq+mp2yT7Yq9HljLwRDJyCWOVVIAIJSDzpNm8TBEa4GF?=
 =?us-ascii?Q?+TYBv1UEbFEdrCUv/Luj8BLR4qodoqkMiL8hP7OMX/d7nOYbY3kOVcWXjEVa?=
 =?us-ascii?Q?4ylOMqRXwc+00aV9kZ5aYzhDiCnpZw2i5uX2HJa3ANs4iVSZMA9aaAK95bQ4?=
 =?us-ascii?Q?MsSPbTSH9LZaB6J61B8ktWudQDd0LEka/0z4Gq1GHezoYECsAN1njVfBkVAI?=
 =?us-ascii?Q?FURRZRGElpCDUzsWRjG+FfSkJWizG3jSEcU3rRAkZg1fKRpMg19bthaBWFV9?=
 =?us-ascii?Q?mqhgtUzBX3qTelwirCuwyp5eZAl2/0ymX/8EzGDnBvnImK+HAo6WbSWkSDCr?=
 =?us-ascii?Q?OTMzz6gMMFaK9auZxE38w+MYacU0LQuX7912FKfemnn6YXK4iab6s3bQ8dwT?=
 =?us-ascii?Q?Sakp34KNvUB1GgiFcIAY6oxAKW80JFzRUYkkpo8y0niSCnjThhD/XTl1vE7g?=
 =?us-ascii?Q?LgtOUTcEOZVOxZVvI8NTkdp/?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7abbe3e8-46df-4f7b-31bf-08d9776a1aa9
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Sep 2021 10:26:24.8574 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WdzBmyM1+WWE8tqS0W4WpHLji7ku6nCFeGjm3VVL3wnZPDHiiVX38bW+Pfz6PlXWGXbU2EMvzr0wc5PqmGOFupUyNEdEPCV0HhUfEUzll60=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6053
Received-SPF: pass client-ip=40.107.7.94;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR04-HE1-obe.outbound.protection.outlook.com
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

compression_type can't be used if we want to create image with
compat=0.10. So, skip these tests, not many of them.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Reviewed-by: Hanna Reitz <hreitz@redhat.com>
---
 tests/qemu-iotests/031 | 5 +++--
 tests/qemu-iotests/051 | 5 +++--
 tests/qemu-iotests/061 | 6 +++++-
 tests/qemu-iotests/112 | 3 ++-
 tests/qemu-iotests/290 | 2 +-
 5 files changed, 14 insertions(+), 7 deletions(-)

diff --git a/tests/qemu-iotests/031 b/tests/qemu-iotests/031
index 648112f796..ee587b1606 100755
--- a/tests/qemu-iotests/031
+++ b/tests/qemu-iotests/031
@@ -42,8 +42,9 @@ trap "_cleanup; exit \$status" 0 1 2 3 15
 _supported_fmt qcow2
 _supported_proto file fuse
 # We want to test compat=0.10, which does not support external data
-# files or refcount widths other than 16
-_unsupported_imgopts data_file 'refcount_bits=\([^1]\|.\([^6]\|$\)\)'
+# files or refcount widths other than 16 or compression type
+_unsupported_imgopts data_file compression_type \
+    'refcount_bits=\([^1]\|.\([^6]\|$\)\)'
 
 CLUSTER_SIZE=65536
 
diff --git a/tests/qemu-iotests/051 b/tests/qemu-iotests/051
index 7bf29343d7..4832000fd5 100755
--- a/tests/qemu-iotests/051
+++ b/tests/qemu-iotests/051
@@ -41,8 +41,9 @@ _supported_fmt qcow2
 _supported_proto file
 # A compat=0.10 image is created in this test which does not support anything
 # other than refcount_bits=16;
-# it also will not support an external data file
-_unsupported_imgopts 'refcount_bits=\([^1]\|.\([^6]\|$\)\)' data_file
+# it also will not support an external data file and compression type
+_unsupported_imgopts 'refcount_bits=\([^1]\|.\([^6]\|$\)\)' data_file \
+    compression_type
 _require_drivers nbd
 
 do_run_qemu()
diff --git a/tests/qemu-iotests/061 b/tests/qemu-iotests/061
index 70edf1a163..513fbec14c 100755
--- a/tests/qemu-iotests/061
+++ b/tests/qemu-iotests/061
@@ -48,7 +48,11 @@ _supported_os Linux
 # not work with it;
 # we have explicit tests for various cluster sizes, the remaining tests
 # require the default 64k cluster
-_unsupported_imgopts 'refcount_bits=\([^1]\|.\([^6]\|$\)\)' data_file cluster_size
+# we don't have explicit tests for zstd qcow2 compression type, as zstd may be
+# not compiled in. And we can't create compat images with comression type
+# extension
+_unsupported_imgopts 'refcount_bits=\([^1]\|.\([^6]\|$\)\)' data_file \
+    cluster_size compression_type
 
 echo
 echo "=== Testing version downgrade with zero expansion ==="
diff --git a/tests/qemu-iotests/112 b/tests/qemu-iotests/112
index 07ac74fb2c..5333212993 100755
--- a/tests/qemu-iotests/112
+++ b/tests/qemu-iotests/112
@@ -43,7 +43,8 @@ _supported_proto file fuse
 # This test will set refcount_bits on its own which would conflict with the
 # manual setting; compat will be overridden as well;
 # and external data files do not work well with our refcount testing
-_unsupported_imgopts refcount_bits 'compat=0.10' data_file
+# also, compression type is not supported with compat=0.10 used in test
+_unsupported_imgopts refcount_bits 'compat=0.10' data_file compression_type
 
 print_refcount_bits()
 {
diff --git a/tests/qemu-iotests/290 b/tests/qemu-iotests/290
index ed80da2685..776b59de1b 100755
--- a/tests/qemu-iotests/290
+++ b/tests/qemu-iotests/290
@@ -41,7 +41,7 @@ trap "_cleanup; exit \$status" 0 1 2 3 15
 _supported_fmt qcow2
 _supported_proto file fuse
 _supported_os Linux
-_unsupported_imgopts 'compat=0.10' refcount_bits data_file
+_unsupported_imgopts 'compat=0.10' refcount_bits data_file compression_type
 
 echo
 echo "### Test 'qemu-io -c discard' on a QCOW2 image without a backing file"
-- 
2.29.2


