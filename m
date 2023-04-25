Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F08B6EE224
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Apr 2023 14:47:59 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1prI4B-00014Y-Cc; Tue, 25 Apr 2023 08:46:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alexander.ivanov@virtuozzo.com>)
 id 1prI49-00013h-KZ; Tue, 25 Apr 2023 08:46:41 -0400
Received: from mail-ve1eur01on0722.outbound.protection.outlook.com
 ([2a01:111:f400:fe1f::722]
 helo=EUR01-VE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alexander.ivanov@virtuozzo.com>)
 id 1prI47-0000dl-1S; Tue, 25 Apr 2023 08:46:41 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OJk6Qby7/4x596IhNC79H7aQt9aj6QcP5R/CE3Ba90kV4YDtewf0y212k9xdDIcOGKEwjMRNXWatp4I/Watb8vpAW/rMihuYevQ735zPGS1Ue12iHi0nKVP69Jh3xoP3tWgvABwgWiGnlY6ezGHnNSFcLkFcDSuOHyqq7QANaNcW/tMhU7W1wnd9IVtiut3pnAB+hf4HZ44WcJ1nAhEiYI8V4Dg5jWICNvm7B6CrVPtQjO3E/6HRLiIpqIXU8QTE2MqsZRqleKN5OUyIIc5bMy4Ba66pCDmiOglzvTUGJMwMMPtOrshQhykB9Mkpa1+A//2ipqmsy1EZz8OEOb8Taw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iHjWyJBVJLjBk8GJoTBSaW47iRQj6eUjDQdb19JXS3Y=;
 b=MIT5k56Q9II59xL6u25kh1onUEtcQDNAx3SHKv8NDyyebYH/9EcKS7ZSX7U0Tef4uIXzFLYlYkRF4gXmasa8++3IuUYGnsRhu5EPSUnFczYYcpWOYX1kjwMCDaz7gkHs0OBnHYsX+Ip6TYCrP7jf4WOhsOEs+5g84kfxYjvXk8CwA1sPrbehRLYlRfPDtKCx59g+ZhZ5AdFaj3CK5EFFKYW602U6UuOaibRS3179+UudgTfNNraMgNVidb3qRaVNAhJywycW90RMW4FLMEwsjsp+q2B1djmXfTYPybCb+7xSTOF6tBpUefvnXQQ53hBgxmUjnZlDQgYkNEzuMOk08A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iHjWyJBVJLjBk8GJoTBSaW47iRQj6eUjDQdb19JXS3Y=;
 b=UY6CWMjmfecQSbabmuIi1S40zliwWxmOYnoX0Shz4CWYTgQhAOs+eEbAr6zm6trzKEwZHGUEQwtU4Ixc3CFyocygFmyQ8Q/XhzGWng/yaLF13ClrGzXdCb3P/1A7tpdzAorJq7MWH9QN/Ti9XoB3f7lpJttvSPbRUqwYBxkH34L8Mno25edzOoL8iHvU4vgoCtPTXmXuUV9WbyaZAQBsO6kW4+Rtsouqjsqr4lFb18kLun6ejkCNyhJoMHDqQuEB8DmrBGzjUS4r5rIWDSb49bfHkR53POMZtkx3Xf5VMCsOJTA7uSAwD/gf0jH0vI8MWfrZZPQKCSHSzJfaf4U9Hw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from AS8PR08MB7095.eurprd08.prod.outlook.com (2603:10a6:20b:402::11)
 by DBBPR08MB5961.eurprd08.prod.outlook.com (2603:10a6:10:203::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6319.34; Tue, 25 Apr
 2023 12:46:34 +0000
Received: from AS8PR08MB7095.eurprd08.prod.outlook.com
 ([fe80::b630:c4eb:fba3:1158]) by AS8PR08MB7095.eurprd08.prod.outlook.com
 ([fe80::b630:c4eb:fba3:1158%6]) with mapi id 15.20.6319.034; Tue, 25 Apr 2023
 12:46:34 +0000
From: Alexander Ivanov <alexander.ivanov@virtuozzo.com>
To: qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, den@virtuozzo.com, stefanha@redhat.com,
 vsementsov@yandex-team.ru, kwolf@redhat.com, hreitz@redhat.com
Subject: [PATCH 5/6] iotests: Fix cluster size in parallels images tests (131)
Date: Tue, 25 Apr 2023 14:46:18 +0200
Message-Id: <20230425124620.241022-6-alexander.ivanov@virtuozzo.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230425124620.241022-1-alexander.ivanov@virtuozzo.com>
References: <20230425124620.241022-1-alexander.ivanov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: VI1PR07CA0238.eurprd07.prod.outlook.com
 (2603:10a6:802:58::41) To AS8PR08MB7095.eurprd08.prod.outlook.com
 (2603:10a6:20b:402::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR08MB7095:EE_|DBBPR08MB5961:EE_
X-MS-Office365-Filtering-Correlation-Id: 3bfebc45-7edf-4a52-4f32-08db458b19cb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: zylpkcJJmgMP3W+RMC5oCYMVyn+M7jPVBslqDUNRmvOnnEd9sKeK/ndzyHFwKRGdDXsAy36zyTgF5VugvQZEBigXQ+YdnmG1eDNoQEoi822cAfxPrp5c1MMfitb1p8Gmj9r/QsEmrfUO7Bj5F+XDD7MLDt6if2G8a1cX3wcrICAp6Ua7rFH1eOkO//xfjrRYFcU8makAeBkfwRtkC7IeJtWmMBPxLAb87Wadd2yPwJykXfhRgZhUZ8Y5i+l6VMNtzpWV9yQLLC+EPxIT+ks79fbAAeIUW8k6X5duSOn/BtYDbB7StMCUKkSGLQ5jz+/SQYwrWVZxZT9tjiiAm/AZuwq5Xd1+HwZ0ZCI85Md1PJEgn7GSAYw39LDYzXLbb5lYYi2jAShwlk3J2EEk4x91h3tje2Hsu3USiVacChOIaLR1AEfMtHxaQRLJ13STBvSyNZjTG8bjjiMxU1NqBNvBvscs2+r8DBGxGDid3u8ETqmxpVIeKwc0O0ZnE1kD1JhuHboc7OpXEmPamZkcDXHuBltNX0kv6IV4qDS5WT251Cqzy8l9CAuhTago21acfLdMD8kyBl8xkN+CNt+ViqPDbe4faR+vMzxi6X5BxOZpcpUc10RrzLIqe6f1fmNcC3HsGahwv73xECz3AhPu/8lXxQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AS8PR08MB7095.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(346002)(136003)(376002)(39850400004)(366004)(396003)(451199021)(83380400001)(478600001)(52116002)(6486002)(6666004)(2616005)(6512007)(1076003)(26005)(6506007)(186003)(5660300002)(44832011)(36756003)(38350700002)(38100700002)(66946007)(66556008)(4326008)(6916009)(66476007)(41300700001)(86362001)(2906002)(8936002)(316002)(8676002)(21314003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Np2iFqpYgJSubnOBFFlYRu28dwZffm9wUbOpOBhCwXQGDTsnPBN0FVhwpBhU?=
 =?us-ascii?Q?nAaEOBVwdkf2p8H84MG9g+M3f5bWg6O9nzbMARSz4oRVGIvwquUPA2mDOLIR?=
 =?us-ascii?Q?BJZ6N8ojgFJJ5LZME3hIqdHHzjRySVK+4u/3qgOV/D9ZQlQMxG/Rh0MFH0AB?=
 =?us-ascii?Q?AkRWB3VO2QK4Q3f3DcxudGgjV1N7o9hiRaX6fzoqgy3dIIfu7HqLPyQcq3F/?=
 =?us-ascii?Q?+iKrxBMwxEmovPs/5ntxRr/WDNaF2AAqkY5aBSpn21hXCo6ytWDOQctK2FGl?=
 =?us-ascii?Q?WTwm1udI2d50DWr+auWFnUcWxkjWZZXRX8fX7g6/kC3qadNqWZNj8LkFvJhp?=
 =?us-ascii?Q?5Nj1flm0rlJavNCKshDwAcUbLv2Tcwarb8t3NsmkOuHX3a31MeNbvlzA3WuN?=
 =?us-ascii?Q?/kwh4oPFztZ+WedAoMNqgOhnYGU87HuYEIhMPSkGrBdq4ZfMjfqBxbo7m+mp?=
 =?us-ascii?Q?6IOyZvkYUFZe/VxhRzbpKzHUQxqZt2O4Fb2/88iXXB2AxFepMLbL1W4Xt6y0?=
 =?us-ascii?Q?njYl6Cmg5MVVlY+TcZwsJD71k0QxQFmL57MLVv8/dASmWdyhIiHcKMuAyOyB?=
 =?us-ascii?Q?7/5K/Jd/UmD+LwQ+n9CEFbofSAMSSs9tXGRvKZRshR0W9anqjiLBKOcRh+vS?=
 =?us-ascii?Q?coa8pCD5PBX/OHY+948Zu2jocR6ZGm/xpFlhPMsl6c5dWmjp0qBQeq4c51N1?=
 =?us-ascii?Q?auVYD5swAoFab7GZC7hIxgvXJGmYLKrAJEiJcZEh1SAnRJ3DLZwx+g0Q9l5T?=
 =?us-ascii?Q?QfKk66YnDIUZTVO5g/UH6lGu749jaGTP6nq2K+4m9cfavLgSCKNFWCn3ebc4?=
 =?us-ascii?Q?VRzJ7kDSwZwFWR+anfKWA+gRmJ4TcuUYX6J/S9HQLih0UmSZO6nKFv/vnLiY?=
 =?us-ascii?Q?P5PgCrmWS6f1JQ/iQbnAYbE7+PruGHJ3nqvKSBTYIjr/wlfObGQesAbaFhrf?=
 =?us-ascii?Q?S+T/1G23WkPZPWOu0c1VG8kcjYWpmSIzAq1fVn5WlV6yTJChg5415kndBKjf?=
 =?us-ascii?Q?lxzevMSlB1SQrS0qmFuA/r0ycixHN+G0Y7Sz1God1M13gK/3k/XdNOnHrs+D?=
 =?us-ascii?Q?viLKMJnNMof85EroZUkboToJRYl1rkJBv84VJW0F3/NgSwtiFfUTSybHUawD?=
 =?us-ascii?Q?WgiLZ+PdIXHAEPCsOU1fxX6M9q2iXLMnaN+zF15vcuUrW4TQ1o5UMUjTTMtw?=
 =?us-ascii?Q?J9bcjGrIobRE/mTlcuC7n34X/tqv893i10KPw+5KN8SnC6aeSbqaNzQ1uCYM?=
 =?us-ascii?Q?TFdstIVcKQ95RiHM0n1oa7bj586twVGgOMSPKhPQ5Xv1GnWyAAE4/wiYb9VO?=
 =?us-ascii?Q?gPjfLsK44/9sbm8yPmsOL+xgrog/r0vERweOdOB1t7s/swO3HyM+xKAHsbBJ?=
 =?us-ascii?Q?85BDCkNoJv+rNinsS0j3N0lz9d6QL65kJSb+LbGfDhmZpmx/jhUjFHfA4qj2?=
 =?us-ascii?Q?UlNP4PcpAPaaQEF7LLqImvlGGKXR/lE7I8hGraW13D53UyBQk6ekEDWvNpIt?=
 =?us-ascii?Q?NpJNA4a/bovDCj1Jv15Ijc9XYwtvIxtwjvAxBK3rHLPcaFZhe/cIz/CDlcNC?=
 =?us-ascii?Q?HdHlYhbln2pMJ5oV6zBSM8WOMO+y8v1GPZ7rWNRUHYErR5Lzna0GipfLLNyp?=
 =?us-ascii?Q?FA=3D=3D?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3bfebc45-7edf-4a52-4f32-08db458b19cb
X-MS-Exchange-CrossTenant-AuthSource: AS8PR08MB7095.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Apr 2023 12:46:34.1072 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: A7hcmFxnCUCrsIe8eUtwq7LvHoJfxjnz9BLERhkBU4erGK3NCyyeqS+islkB+xRFAHATGQIH8QcUKh2VPEbNmDtLNKqn5aOR+OAgx8ISZss=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR08MB5961
Received-SPF: pass client-ip=2a01:111:f400:fe1f::722;
 envelope-from=alexander.ivanov@virtuozzo.com;
 helo=EUR01-VE1-obe.outbound.protection.outlook.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_PASS=-0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

In this test cluster size is 64k, but modern tools generate images with
cluster size 1M. Calculate cluster size using track field from image header.

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


