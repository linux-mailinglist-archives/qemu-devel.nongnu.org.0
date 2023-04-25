Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D19F6EE22F
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Apr 2023 14:48:39 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1prI47-00012a-B7; Tue, 25 Apr 2023 08:46:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alexander.ivanov@virtuozzo.com>)
 id 1prI45-00011z-Mh; Tue, 25 Apr 2023 08:46:37 -0400
Received: from mail-he1eur04on070e.outbound.protection.outlook.com
 ([2a01:111:f400:fe0d::70e]
 helo=EUR04-HE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alexander.ivanov@virtuozzo.com>)
 id 1prI43-0000dV-Rs; Tue, 25 Apr 2023 08:46:37 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FfWLdQ4Z7x/wnkprY1H/3VOyWDsspOzxp9uPDINc/TdU7vhYqT9D/oioSO8BsENNLkElyu0t3CJfqKMReSaXCVZMe9QGv7YjMpyYIZT8N0CB/6uVrastuBo9qEB8jXGO6mqaMdV1JU6UWmhJgNv3lHtxVNQhZdbr/6I57DNLN6nuELh/myeYcmTxw52HKrmZeR0r3aQsTXV9F8A3IvnJckDbnzELuJqZ+Dl3MDqMgh3gWb9SmEiv5dszoypZh4Lics6r1JylOkxH2CLO1jaLXgft4mXC8e8YEbm0hNUQcq4hSrOHqbDD/lrhfqXYGnTu0ZWkzgsdcnp98A3fksRHHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MxUYf6aObS4iITGDY50zim4uxE7+oXyFe5i3tjss0V4=;
 b=BbPlxcUuVFfM5jWZ+Pci/pG0mnZf0NHcTyKO0f0LF2SCLXfaOucP8jMrbUVW9XXaRoz5SUWcNiZu75xwwN2VxOVXYS1HKiJ06vxdEOnwddVrwUfQA6d9AloMX7wKVYrPeRZRDrfDt5xonck3GGw87gr1bfbuD3IVN8myYoIqZ5MjEd31X+4L3/G1RXn2B7fQSoqbOsGYbfV8G+qOYGk+oNTP3lYvr/BGtAC9BWQlQZck+XcdvmEPHissnUV87460tthgP/49XYaR4pOQcgQt//qaYT7TmoccfqZSRfSVOwiVr/8idZGhJ9/b8rG2UWrPHHdq/inbFo8Y1e4GIgbDRA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MxUYf6aObS4iITGDY50zim4uxE7+oXyFe5i3tjss0V4=;
 b=dmmrranFTBoyQqkAKGFhkvKYa6cNZdNz2ZB3Yg7IxybxdlKGDhJJD1wQptdbQVpo73N3m4Af0uXA6c8I3haTFImEvv/mZozslg5/0G3LNvVqho6UP6T6iHJo5jUCUzkdo3jW513hy7LjOAEj0D0zJvGirxzwXtBSSnCCp8KC0lKgfAr0W5kROCVqlbP6tKTfmlCpn5yp7HY1qe7to1nYz2/s2dbYP6hfOi2VqHsPU7Ia4W0sGYOCni6VxwcD/5/2A+Xg/2Dzgxo9B5CNVljzpxPEOa9jVAFX5Un6Kfwd0EdRMNC5b49MQ3L+nbOUmzSLBjk1CjrAD/u6QoGcTLrsLg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from AS8PR08MB7095.eurprd08.prod.outlook.com (2603:10a6:20b:402::11)
 by AS8PR08MB9410.eurprd08.prod.outlook.com (2603:10a6:20b:5a9::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6319.33; Tue, 25 Apr
 2023 12:46:29 +0000
Received: from AS8PR08MB7095.eurprd08.prod.outlook.com
 ([fe80::b630:c4eb:fba3:1158]) by AS8PR08MB7095.eurprd08.prod.outlook.com
 ([fe80::b630:c4eb:fba3:1158%6]) with mapi id 15.20.6319.034; Tue, 25 Apr 2023
 12:46:29 +0000
From: Alexander Ivanov <alexander.ivanov@virtuozzo.com>
To: qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, den@virtuozzo.com, stefanha@redhat.com,
 vsementsov@yandex-team.ru, kwolf@redhat.com, hreitz@redhat.com
Subject: [PATCH 1/6] iotests: Add out-of-image check test for parallels format
Date: Tue, 25 Apr 2023 14:46:14 +0200
Message-Id: <20230425124620.241022-2-alexander.ivanov@virtuozzo.com>
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
X-MS-TrafficTypeDiagnostic: AS8PR08MB7095:EE_|AS8PR08MB9410:EE_
X-MS-Office365-Filtering-Correlation-Id: 766010c1-fb06-4dec-a2b0-08db458b1715
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: bkgwFlcjJYWjpY4jDIwRc5woA3s32LaVUkSkg/n8TK1h2y6dmegNWgIMTQtHOQ/rGHtH9HOZtnFHXf9UxE9d/jnhN0oEwg4PR67eiqOrBSBSMdkArw2/MKjfUauklAjyck1wasfZxV06QmFpeCMzNXujNV+SliiC/lw0aYkxLFBetmm3cOW1RyPijHeII4Wf7UUm5ehcA43tUUQvg2nrjq8o+s0mVOvTwHHbHT8S5FWkbfTF+vWqHjmweNHL+XxXMDFYtXel1fusxVtEpSlj6B0RDgqPqCtoxufEVA6Vagcku+ZADy9vcC/iUXaUN2uGa4x2NuDnR8ViMwwVSU7K22hm2eKam4DBEeYT1fUhdhZzfwcdPeX9j1QnBxbLx7OUxtEwsycqTg2K3EYLjHTrY12cNIXeQFAfHmRDFsHkaf1wJ/Wl+XG+FVZqNq9DSqKEszILfGnX1EL5flqNfFOS7FFt1AvgfQGt1vOotFPv4twqG0zsS5ORU+DewJU3iwNoGvcsLg9Xs7Ghy1fU9j+82YEqA5NQyadyxlu+GhDqEJpD5zozh7iNUi2ft7shxra49O/FngGfCtbR0imguZEYC1c/X1t4q+KWWZGd3x1Az1JcmGhZDepPqki4OtThnvzm7wwfmM0V0DsZjV5Th7htRw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AS8PR08MB7095.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(396003)(366004)(39850400004)(346002)(136003)(376002)(451199021)(52116002)(6486002)(2906002)(6512007)(6506007)(2616005)(6666004)(186003)(1076003)(66946007)(66476007)(8936002)(8676002)(66556008)(41300700001)(6916009)(4326008)(316002)(26005)(478600001)(44832011)(5660300002)(38350700002)(38100700002)(36756003)(86362001)(83380400001)(21314003)(2004002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?qw8zB7gwjazrdfqnAZ3RoYW06qvr+qbuDLtr3QvoUNIFSqUHb39D6EAjDdlb?=
 =?us-ascii?Q?oB2uTrZ8YNNU10AFsd3oRy2AEDOYNHVbCA/IO81KH5TNiJbsb0nKvWJO3fdz?=
 =?us-ascii?Q?9vxaUYUPwgJzldm81Y8uNleaZAuSpGPUP2AmKRyrS/hh9i7q9nJ0tqWr3xeJ?=
 =?us-ascii?Q?iuWDyMx0ZveVKPiCpeWGBCeulTzNC5JaIgaszvMULPFge3x641cc7Tze6qu7?=
 =?us-ascii?Q?3JqbjRQNnyJ8RtHXkScDsC43Dkm/F3k8YJWt7kWB9r3gEQPufR74qBsIk81y?=
 =?us-ascii?Q?MzonS4xoLHrcEyVCilCB6Q73kbRJNwtQA7jSPZtKLeO1Qhw4F44hM/1RbIT3?=
 =?us-ascii?Q?K7ugjyLRHoN7j7Df0ZXCcp7H9uyjjmc6ziGqovtRKo4ubZuPk2FXtmvYtujp?=
 =?us-ascii?Q?JMWctJtUiDJfvSehbAAqiDbGTBNPENuRNHZvZHMW+sMCtl41rm+yUXpkkHGD?=
 =?us-ascii?Q?uY5M0KBFTWYhvIw/sxyWQPNUiuBujFvxeYIximTPBewbRqWTulBosHJarUV0?=
 =?us-ascii?Q?X9em3MMkJ9hcS00qfiFIwIdSnR6gkyN+cJJq3tSe4I3toybu8txw0MWjs0x7?=
 =?us-ascii?Q?gNvXT4ALC3G5PyXvJhmp8Oe3wms+bDAsZaoM1JEaLZvBovq4SzLPWbxz7m0J?=
 =?us-ascii?Q?qqpwlKM0OyFXyOdz3/LxcMwZzqP711HB+4+BwQKCdWG478R96XgoDwxxhhV/?=
 =?us-ascii?Q?hhd1U0KPyGcc3A7ZU9V+s+YiMWqlOuTkFHB7gRM1kA1R7HZdAxOWH/b3PKvT?=
 =?us-ascii?Q?dzz3Pv3ltg9Ca76IhGfE07Gj15lQOPu/DdAT4FlKeOfUgnYdKhLosxKA5Pfe?=
 =?us-ascii?Q?ole/4teVJ6pyNcnznxuTVjoAEO+SnG3oNyq2kdpq6kyGmIO/Vi6Rrojkvypb?=
 =?us-ascii?Q?3EQEEVgZbfvoZcHblHdntl1EeSVtcHkCkljrN/ICvSTHw00xGrEravhyZzeC?=
 =?us-ascii?Q?pp6tuXgdQ2j5IEVR4pvN9BEGUwhZNBpS5ZazCDqIXjW+j3GB7bSiPGcKH3pH?=
 =?us-ascii?Q?V8vlvXyWDXtPf1qKHjtnkhZElegDSC9YncA+8uZOKR5YKnoS0FCiaUGLHM/p?=
 =?us-ascii?Q?gInS4SkS/RgcuhND6hKrOIOzKs5GMhv/fC8yBIm/pwJHrztJFLFgc6r4G2bE?=
 =?us-ascii?Q?CZEnxALvLsx9c39b3kMv1XwayiujX5Ny+DbLJw7kNmyrHuDC/ZbfN42ev2Cd?=
 =?us-ascii?Q?dCBBm4QjLTjXhIGQ5Wsovtj8nFIhNGk/6Pb91Pweezjy3w6jFiLLgsFTP0kY?=
 =?us-ascii?Q?LarQiiwCQObd2E7IZPI2GtIwubs4CtnN5nkXN6r1Caai0iINjcpQMZRy4VXQ?=
 =?us-ascii?Q?s5xqEjMQTLL51isATsHc45pXqyQmEZJASPee2rSV8IwphThfJisIs642MONv?=
 =?us-ascii?Q?23+PDgXzn8vEB7rwEcnxype10rQvPRJKnuSbiG8lXJAPKyde2Aw2eEqJEcPP?=
 =?us-ascii?Q?qAFKp78n2sYPi3AjGyHLE10+GeLvAOMNy1zoRl/zKCVa11bO+Ur/3UxM2hDl?=
 =?us-ascii?Q?ufgD5WULKvc//xGOx5sbhUUvzgfCebIIGYa5+EzABuohayxjhaGe2rmJAwyV?=
 =?us-ascii?Q?IJZoXAVNQ/qgr8U/U8d5sTEoUmoH1M79oIG2eijq7yMUweUXyz5QphtEB/bq?=
 =?us-ascii?Q?Sg=3D=3D?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 766010c1-fb06-4dec-a2b0-08db458b1715
X-MS-Exchange-CrossTenant-AuthSource: AS8PR08MB7095.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Apr 2023 12:46:29.4863 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Gs0VNn4SUnn6VqWpIQGRgOwSfeoB4OR2M+cE+bmau/r01aDZgVwtODCvKxVt2Vtfm99KeZRQd7KmnwiMJeuXVR6MnvXhRQ9vXbR6Z/4EUqg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB9410
Received-SPF: pass client-ip=2a01:111:f400:fe0d::70e;
 envelope-from=alexander.ivanov@virtuozzo.com;
 helo=EUR04-HE1-obe.outbound.protection.outlook.com
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

Fill the image with a pattern to generate entries in the BAT, set the first
BAT entry outside the image, try to read the corrupted image. At the image
opening it should be repaired, check for zeroes in the first cluster.

Signed-off-by: Alexander Ivanov <alexander.ivanov@virtuozzo.com>
---
 tests/qemu-iotests/tests/parallels-checks     | 71 +++++++++++++++++++
 tests/qemu-iotests/tests/parallels-checks.out | 12 ++++
 2 files changed, 83 insertions(+)
 create mode 100755 tests/qemu-iotests/tests/parallels-checks
 create mode 100644 tests/qemu-iotests/tests/parallels-checks.out

diff --git a/tests/qemu-iotests/tests/parallels-checks b/tests/qemu-iotests/tests/parallels-checks
new file mode 100755
index 0000000000..055ce34766
--- /dev/null
+++ b/tests/qemu-iotests/tests/parallels-checks
@@ -0,0 +1,71 @@
+#!/usr/bin/env bash
+# group: rw quick
+#
+# Test qemu-img check for parallels format
+#
+# Copyright (C) 2022 Virtuozzo International GmbH
+#
+# This program is free software; you can redistribute it and/or modify
+# it under the terms of the GNU General Public License as published by
+# the Free Software Foundation; either version 2 of the License, or
+# (at your option) any later version.
+#
+# This program is distributed in the hope that it will be useful,
+# but WITHOUT ANY WARRANTY; without even the implied warranty of
+# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+# GNU General Public License for more details.
+#
+# You should have received a copy of the GNU General Public License
+# along with this program.  If not, see <http://www.gnu.org/licenses/>.
+#
+
+# creator
+owner=alexander.ivanov@virtuozzo.com
+
+seq=`basename $0`
+echo "QA output created by $seq"
+
+status=1	# failure is the default!
+
+_cleanup()
+{
+    _cleanup_test_img
+}
+trap "_cleanup; exit \$status" 0 1 2 3 15
+
+# get standard environment, filters and checks
+. ../common.rc
+. ../common.filter
+
+_supported_fmt parallels
+_supported_proto file
+_supported_os Linux
+
+SIZE=$((4 * 1024 * 1024))
+IMGFMT=parallels
+CLUSTER_SIZE_OFFSET=28
+BAT_OFFSET=64
+
+_make_test_img $SIZE
+
+CLUSTER_SIZE=$(peek_file_le $TEST_IMG $CLUSTER_SIZE_OFFSET 4)
+CLUSTER_SIZE=$((CLUSTER_SIZE * 512))
+LAST_CLUSTER_OFF=$((SIZE - CLUSTER_SIZE))
+LAST_CLUSTER=$((LAST_CLUSTER_OFF/CLUSTER_SIZE))
+
+echo "== TEST OUT OF IMAGE CHECK =="
+
+echo "== write pattern =="
+{ $QEMU_IO -c "write -P 0x11 0 $SIZE" "$TEST_IMG"; } 2>&1 | _filter_qemu_io | _filter_testdir
+
+echo "== corrupt image =="
+cluster=$(($LAST_CLUSTER + 2))
+poke_file "$TEST_IMG" "$BAT_OFFSET" "\x$cluster\x00\x00\x00"
+
+echo "== read corrupted image with repairing =="
+{ $QEMU_IO -c "read -P 0x00 0 $CLUSTER_SIZE" "$TEST_IMG"; } 2>&1 | _filter_qemu_io | _filter_testdir
+
+# success, all done
+echo "*** done"
+rm -f $seq.full
+status=0
diff --git a/tests/qemu-iotests/tests/parallels-checks.out b/tests/qemu-iotests/tests/parallels-checks.out
new file mode 100644
index 0000000000..ea4dcef0a6
--- /dev/null
+++ b/tests/qemu-iotests/tests/parallels-checks.out
@@ -0,0 +1,12 @@
+QA output created by parallels-checks
+Formatting 'TEST_DIR/t.IMGFMT', fmt=IMGFMT size=4194304
+== TEST OUT OF IMAGE CHECK ==
+== write pattern ==
+wrote 4194304/4194304 bytes at offset 0
+4 MiB, X ops; XX:XX:XX.X (XXX YYY/sec and XXX ops/sec)
+== corrupt image ==
+== read corrupted image with repairing ==
+Repairing cluster 0 is outside image
+read 1048576/1048576 bytes at offset 0
+1 MiB, X ops; XX:XX:XX.X (XXX YYY/sec and XXX ops/sec)
+*** done
-- 
2.34.1


