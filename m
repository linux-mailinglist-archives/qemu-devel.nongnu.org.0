Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CB7A85973A4
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Aug 2022 18:10:31 +0200 (CEST)
Received: from localhost ([::1]:50390 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oOLck-0000iD-An
	for lists+qemu-devel@lfdr.de; Wed, 17 Aug 2022 12:10:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51910)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alexander.ivanov@virtuozzo.com>)
 id 1oOLNC-0006sZ-HV; Wed, 17 Aug 2022 11:54:26 -0400
Received: from mail-db8eur05on2123.outbound.protection.outlook.com
 ([40.107.20.123]:3297 helo=EUR05-DB8-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alexander.ivanov@virtuozzo.com>)
 id 1oOLNA-0001NL-HR; Wed, 17 Aug 2022 11:54:26 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dACfP9JgqctqDBX1lIUTlNp9vahKj6Fveq9ApxwYNcMCUixqqpJet9/p+L6paExphIBRCUlcUxhOnZX3TRuFT/53ThaKWouujRULrq/19AxTpbXdAyCUCzw8bFoJg7WFeHM1+fU8sLYNkRgH4CLQXePsmQdniin5pM/EDc6B4h3pqXsYFxxfCDWFxiLJRsmUx+VGzGUbBugU4GwloOOboGOEDXd/8HKgW6mYlgotbF9Itm4Uiti/qSbIJpdJ5d7aAAlNpkYYXKGjU1U8lyVIa4xm1El3Ajs8SYzOaJJ9SGC4zCaFMYUWkhv6wzoy9HgI+RHQGWMQNdvjA0eQv+y49A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GUzIX6u3DKOmDHmvbTdFQOrIOj/bS00MEFboiZ23OBA=;
 b=O5d+gujL+hfH4zLqQiBbRI4BAPSrdwCVEJ2SrtyFkS+V2yW8OOfPbar7adbssBQckE1MOqqCGSzieWRJFyqe601aIvseSQ/uSmx5Ccztv8sXle2rVNCOrwIRaJM6Eu8DCkOod921Bg+klRdMqMVcbdszclKSM8z5IKDI+E+21NxZi64hCakClQg2Fehdm1mmA5O/aNBnNuZxFeecHpgUMxg6LqdTKTiXudNosZMvsWqG3HXgMaW2jAKWZxfj2KPhyRxbBtFAvp84BQbmq/WeGhiVsUEtn5yw7zsnaJXngLrrXGFjtnFliAfgtKFv5HLA1m9ma4dnO40aK3QiyFz5/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GUzIX6u3DKOmDHmvbTdFQOrIOj/bS00MEFboiZ23OBA=;
 b=evFs4HQ1QghefO8MN7mbUCw0zHrV7dLgRSRxtiu6kjn+QSLYvU+CzUFQqjxFGAmowZ71dx65T+KNZokedqh0sbEZZ14lWGQEt3g9pNdpjk8u5Povrl8puOr23arzAoVeF67U5Dv3o3R0g/BuzdQDeuKiDNa7IAnha6EE7oeNeS63qRGIAcbfT7WPu6OC4y/48kK5nI3DFqZRdCzwxYY+pmsczrhCTQybKrUCUjdpxjT4uct1xDj253P9SXYEADT6exQWHBVZMzw+PgEfBJe//VGA2t6/VKDxRJxTxroIKO04HneSjqbiRuNNSxvsFW4rdaJnEEP6uWIWYv8qqMttlQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from AS8PR08MB7095.eurprd08.prod.outlook.com (2603:10a6:20b:402::11)
 by AM0PR08MB3873.eurprd08.prod.outlook.com (2603:10a6:208:10c::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5525.11; Wed, 17 Aug
 2022 15:54:17 +0000
Received: from AS8PR08MB7095.eurprd08.prod.outlook.com
 ([fe80::7da2:4a5a:2854:26f2]) by AS8PR08MB7095.eurprd08.prod.outlook.com
 ([fe80::7da2:4a5a:2854:26f2%6]) with mapi id 15.20.5504.028; Wed, 17 Aug 2022
 15:54:17 +0000
From: Alexander Ivanov <alexander.ivanov@virtuozzo.com>
To: qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, den@virtuozzo.com, stefanha@redhat.com,
 vsementsov@yandex-team.ru, kwolf@redhat.com, hreitz@redhat.com
Subject: [PATCH 10/10] iotests: Fix cluster size in parallels images tests
 (131)
Date: Wed, 17 Aug 2022 17:54:01 +0200
Message-Id: <20220817155401.2045492-11-alexander.ivanov@virtuozzo.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220817155401.2045492-1-alexander.ivanov@virtuozzo.com>
References: <20220817155401.2045492-1-alexander.ivanov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: FR0P281CA0111.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a8::12) To AS8PR08MB7095.eurprd08.prod.outlook.com
 (2603:10a6:20b:402::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8bd6ebb7-7f1b-4ba5-65aa-08da8068bda0
X-MS-TrafficTypeDiagnostic: AM0PR08MB3873:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: pBW9x4nvkA5KdXNZ4xXw233+rm09vuINpTHyEuJx4/Y9i6WTKxzHRrf7twonEKpOJm+tDSBVOGWDA5mG2wnm9WU6b6G1+cr9rH8JSEl9K+s4KI4VNjyy/tU/a37wqzQA0WIGW6clsxt3FQg183lLDvdwUTrB7SZGh8E4JpfKI7feMnmEH8STSwiVTXBDVDYqls6oMUyq7PX0b7AR0MoVzzdfs3FcEkoXytHtlEU1UiG95NkJj8aJrKbAGMyZyQon6vD+6YypePrj1Itt3/qrik+nSk8wfZLhVIEu4AFVOxTtq7lBlwl1PVfkK8q1AwN0dIoto60gwJH6os8Kga4b+PaB8LrQFny0aMPiHraRI+rhbeNWuzTqtjrRbT5VZvZzCYAgZUsFrkGNt97IPtPxXRwm1i+Te2y2o11jlFdPnGZbO7boWFkYZxtKQbfJmKK2iKVuCbhmANJ9yd26n+lhy4o4w7Hs29dKhabuJ74vzv0KPmjIe1p73JkkFd3Tui/G4tMg60rr1bWA+Bp2QWoyu6nzRg97BUh9mf5fmVPcn2Ow7M00iQ55F/rnJz9oVaL1HGFUYEm4mElbpAPyriyl17u3NMP2R14692qi/8bkP7diEgbf3if2PPeMg0pB0U12630fcbBxQn+EeWbKWOpRdgN2ZceLVWVK+fdmYsy92PzFhVyC3OfbN5yb5qhAz+gGqNaOgiWUCA2c3SGC24K2q2s3Pi2pvIED6diBQ7zt9H+HrSbqKxEbLdRKrH7MdKDTocFrsrPqoj65Dez1y1R3gPfRsdsVLy04xYEKHD1c+p9IdIAI2/2ZHCp8ysWLIfquXgsABdauet7rbs5b9vN9eQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AS8PR08MB7095.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(396003)(366004)(346002)(39850400004)(136003)(376002)(66476007)(38100700002)(4326008)(38350700002)(8676002)(2906002)(66946007)(86362001)(66556008)(316002)(8936002)(6916009)(44832011)(2616005)(5660300002)(6666004)(1076003)(186003)(6512007)(52116002)(6486002)(41300700001)(478600001)(83380400001)(6506007)(26005)(36756003)(21314003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?DTQ8DWY3wwmjqofrwFY6l2ASkFCZnH/UKNSBOtXOqLD1tly9nfAumQkiYAAa?=
 =?us-ascii?Q?aVBhR3pW42hOPsf+dNAREx6HWRXEIsAnWDLP95+3hOKlD4GsoAYajwj3JAlG?=
 =?us-ascii?Q?HOEuVXCt6mIpILgbajCjccDxNDdtiBmiMctirukDGUKOimkzTgx/m+J7S+OM?=
 =?us-ascii?Q?RuydQmp2nsbDJHPT2jOJ5bYS6Z6kC27TrBtyHt9SGbDO8rBAkdkYIQs8Qqkc?=
 =?us-ascii?Q?qY01N3bq4nULy6fz7/gYZaV/Iok5bGbzQj0s6YRUaDjmhf7r3C6wCb5TEMt/?=
 =?us-ascii?Q?B4TI9LG/YnM3e7CW69amD3wrgWLTn+2ISKLcGAHUpKHzAI9lqauDTNNf480O?=
 =?us-ascii?Q?p7M2lSGiAOBOoBopaPo2U0vUvHiUr5BuZ7dS2hEovYjC5YzMa3KNiFp+0m4S?=
 =?us-ascii?Q?7eBM95oETXPbeIYopXY5IOXDnQRIWgawT1+pnqov1XDIJZHUYp5z4T6xwAJI?=
 =?us-ascii?Q?x+FCpVFvGO3fHzLI+g/TQKvzCZFmdP3bm7ebYkUB8/4XADPvF9TQW9iR+AF6?=
 =?us-ascii?Q?jBp7Jmzcj2J/gibFX27qmlSmRbTqP4ICiHZ220K+BMc5c8DRO5TBCexIDoo8?=
 =?us-ascii?Q?6HFSIjk//wPiS8qrTxwQwz2L+E9+/rKOUssv1KAaeAokjdF0rquEXadEz9Ex?=
 =?us-ascii?Q?xxS/6L4XTWIHRcGJcsUWNhHtpDLj/ZxhsYGihHeGrx72yK1QdAkz63/C8Gep?=
 =?us-ascii?Q?QGRJiSyYW/VcgsjKwVKR59cxC/ol1t/SkZDyrDa7gbxksFzin3TDQnssv3N2?=
 =?us-ascii?Q?tVr8C8626vDHKpXHJ2vnrYkfsf9nyS4fJD/63vQGyYPQ5Z/k6yryPysySpfi?=
 =?us-ascii?Q?+j+gOETZ6W+3qNFEcykUx7jgFm/mitvj59xW7aV3xv7We4QjPRDbwf82ZMXe?=
 =?us-ascii?Q?mMJIUrcWZpUUCrEJCG0Qe072209DEDOJJEeHXXYuJtm93edDXiZp/sOin36o?=
 =?us-ascii?Q?jpCBiN0NAkn7ysXNP+EQSvKYnj1LkPdsJYHtcVJy4uMDER0QhGWVgReSQ5H8?=
 =?us-ascii?Q?lWyc6LlFvmSl83YsSrfrYYK44PjIhlIuL41KxrJDPLJ3MSwcsGntx8QkJfHl?=
 =?us-ascii?Q?rQJTjdiWXlT8sjzBeVC1gynHg60nqvXaRRj9POz1pKdBBRRHd9eFoPtm3E5g?=
 =?us-ascii?Q?UUUrTiQMhN8/dFEh6t0VtkoXEq1qAdehKwikpLvoLHkV9XKoIhqAHe5DMZR6?=
 =?us-ascii?Q?5KiMLyMaVTfRrKfOdCBni9lfEfZSgHzVrABP/m6/qZfYeKX8ZtjJcczlqKJw?=
 =?us-ascii?Q?MzqB9TNGULwH473D27QA4rmIjojZ3qMnGYhNLHNnMJ5sbXbdlHko0O137Yfv?=
 =?us-ascii?Q?JxGkj6P3nuyJvOwwOta+SA3lOMkm6c8ZQnNtbH7B2CeBOIFWdgGgx8ZGjyxN?=
 =?us-ascii?Q?DBK/rwxz8hLEOZS+b1n6ODYWkZaUZYBYCuQjwXtKXVCFgxBiEg+DE1T9/JzE?=
 =?us-ascii?Q?gRMUMwRc02tLlPJqbtUdB3RQtgtwtlNYohyyhBalB5zhEbZrVnnQJzO1RV6e?=
 =?us-ascii?Q?cc/1hcxrnLk2t/UrNQE5nwkphgtsxwPApEU1fJwbRrMBgD63GGdC9YpAigvP?=
 =?us-ascii?Q?Swg34PmQm7GlGopsyQlhGJBV/qXXTK7Xih/o592zbTyYvAt5rPOcum0EI0qF?=
 =?us-ascii?Q?r3onikzOnlmhFuAWGV2Afmw=3D?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8bd6ebb7-7f1b-4ba5-65aa-08da8068bda0
X-MS-Exchange-CrossTenant-AuthSource: AS8PR08MB7095.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Aug 2022 15:54:17.3799 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hzP2eXZoUkk1YOcGoPmBfFcMsJeeEg7NdXtm506wAXA2Yk8BKJedBt+97w+XTBWp/k629NXvJkbMpUeqbIzqBQrY2kTi/RMl2SKI06mXeDw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB3873
Received-SPF: pass client-ip=40.107.20.123;
 envelope-from=alexander.ivanov@virtuozzo.com;
 helo=EUR05-DB8-obe.outbound.protection.outlook.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

In this test cluster size is 64k, but modern tools generate images
with cluster size 1M.
Calculate cluster size using track field from image header.

Signed-off-by: Alexander Ivanov <alexander.ivanov@virtuozzo.com>
---
 tests/qemu-iotests/131     |  5 ++++-
 tests/qemu-iotests/131.out | 44 +++++++++++++++++++-------------------
 2 files changed, 26 insertions(+), 23 deletions(-)

diff --git a/tests/qemu-iotests/131 b/tests/qemu-iotests/131
index 601546c84c..78ef238c64 100755
--- a/tests/qemu-iotests/131
+++ b/tests/qemu-iotests/131
@@ -44,10 +44,13 @@ _supported_os Linux
 inuse_offset=$((0x2c))
 
 size=$((64 * 1024 * 1024))
-CLUSTER_SIZE=$((64 * 1024))
 IMGFMT=parallels
 _make_test_img $size
 
+# get cluster size in sectros from "tracks" header field
+CLUSTER_SIZE_OFFSET=28
+CLUSTER_SIZE=$(peek_file_le $TEST_IMG $CLUSTER_SIZE_OFFSET 4)
+CLUSTER_SIZE=$((CLUSTER_SIZE * 512))
 CLUSTER_HALF_SIZE=$((CLUSTER_SIZE / 2))
 CLUSTER_DBL_SIZE=$((CLUSTER_SIZE * 2))
 
diff --git a/tests/qemu-iotests/131.out b/tests/qemu-iotests/131.out
index de5ef7a8f5..98017a067e 100644
--- a/tests/qemu-iotests/131.out
+++ b/tests/qemu-iotests/131.out
@@ -1,26 +1,26 @@
 QA output created by 131
 Formatting 'TEST_DIR/t.IMGFMT', fmt=IMGFMT size=67108864
 == read empty image ==
-read 65536/65536 bytes at offset 32768
-64 KiB, X ops; XX:XX:XX.X (XXX YYY/sec and XXX ops/sec)
+read 1048576/1048576 bytes at offset 524288
+1 MiB, X ops; XX:XX:XX.X (XXX YYY/sec and XXX ops/sec)
 == write more than 1 block in a row ==
-wrote 131072/131072 bytes at offset 32768
-128 KiB, X ops; XX:XX:XX.X (XXX YYY/sec and XXX ops/sec)
+wrote 2097152/2097152 bytes at offset 524288
+2 MiB, X ops; XX:XX:XX.X (XXX YYY/sec and XXX ops/sec)
 == read less than block ==
-read 32768/32768 bytes at offset 32768
-32 KiB, X ops; XX:XX:XX.X (XXX YYY/sec and XXX ops/sec)
+read 524288/524288 bytes at offset 524288
+512 KiB, X ops; XX:XX:XX.X (XXX YYY/sec and XXX ops/sec)
 == read exactly 1 block ==
-read 65536/65536 bytes at offset 65536
-64 KiB, X ops; XX:XX:XX.X (XXX YYY/sec and XXX ops/sec)
+read 1048576/1048576 bytes at offset 1048576
+1 MiB, X ops; XX:XX:XX.X (XXX YYY/sec and XXX ops/sec)
 == read more than 1 block ==
-read 131072/131072 bytes at offset 32768
-128 KiB, X ops; XX:XX:XX.X (XXX YYY/sec and XXX ops/sec)
+read 2097152/2097152 bytes at offset 524288
+2 MiB, X ops; XX:XX:XX.X (XXX YYY/sec and XXX ops/sec)
 == check that there is no trash after written ==
-read 32768/32768 bytes at offset 163840
-32 KiB, X ops; XX:XX:XX.X (XXX YYY/sec and XXX ops/sec)
+read 524288/524288 bytes at offset 2621440
+512 KiB, X ops; XX:XX:XX.X (XXX YYY/sec and XXX ops/sec)
 == check that there is no trash before written ==
-read 32768/32768 bytes at offset 0
-32 KiB, X ops; XX:XX:XX.X (XXX YYY/sec and XXX ops/sec)
+read 524288/524288 bytes at offset 0
+512 KiB, X ops; XX:XX:XX.X (XXX YYY/sec and XXX ops/sec)
 == Corrupt image ==
 qemu-io: can't open device TEST_DIR/t.parallels: parallels: Image was not closed correctly; cannot be opened read/write
 ERROR image was not closed correctly
@@ -35,19 +35,19 @@ The following inconsistencies were found and repaired:
 
 Double checking the fixed image now...
 No errors were found on the image.
-read 65536/65536 bytes at offset 65536
-64 KiB, X ops; XX:XX:XX.X (XXX YYY/sec and XXX ops/sec)
+read 1048576/1048576 bytes at offset 1048576
+1 MiB, X ops; XX:XX:XX.X (XXX YYY/sec and XXX ops/sec)
 == allocate with backing ==
 Formatting 'TEST_DIR/t.IMGFMT', fmt=IMGFMT size=67108864
 Formatting 'TEST_DIR/t.IMGFMT.base', fmt=IMGFMT size=67108864
-wrote 65536/65536 bytes at offset 0
-64 KiB, X ops; XX:XX:XX.X (XXX YYY/sec and XXX ops/sec)
+wrote 1048576/1048576 bytes at offset 0
+1 MiB, X ops; XX:XX:XX.X (XXX YYY/sec and XXX ops/sec)
 wrote 64/64 bytes at offset 0
 64 bytes, X ops; XX:XX:XX.X (XXX YYY/sec and XXX ops/sec)
 read 64/64 bytes at offset 0
 64 bytes, X ops; XX:XX:XX.X (XXX YYY/sec and XXX ops/sec)
-read 65472/65472 bytes at offset 64
-63.938 KiB, X ops; XX:XX:XX.X (XXX YYY/sec and XXX ops/sec)
-read 67043328/67043328 bytes at offset 65536
-63.938 MiB, X ops; XX:XX:XX.X (XXX YYY/sec and XXX ops/sec)
+read 1048512/1048512 bytes at offset 64
+1023.938 KiB, X ops; XX:XX:XX.X (XXX YYY/sec and XXX ops/sec)
+read 66060288/66060288 bytes at offset 1048576
+63 MiB, X ops; XX:XX:XX.X (XXX YYY/sec and XXX ops/sec)
 *** done
-- 
2.34.1


