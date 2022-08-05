Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2446758ADB2
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Aug 2022 17:53:38 +0200 (CEST)
Received: from localhost ([::1]:37246 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oJzdp-00073n-9A
	for lists+qemu-devel@lfdr.de; Fri, 05 Aug 2022 11:53:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34980)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alexander.ivanov@virtuozzo.com>)
 id 1oJzYg-00070l-N9; Fri, 05 Aug 2022 11:48:18 -0400
Received: from mail-eopbgr10136.outbound.protection.outlook.com
 ([40.107.1.136]:43843 helo=EUR02-HE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alexander.ivanov@virtuozzo.com>)
 id 1oJzYe-0003rS-MY; Fri, 05 Aug 2022 11:48:18 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IbLYCK4DGt2OvV+TaozKzuO4nlMzjAClBKYFxTWivX2v81O7mCYK4P2YNyGWPWXQ6rBxlI8Zv6DtJwzm1YmRPydbhpMqKKTKkHqUsm0geRVG/rrvO8cUYY5NXFuTYsEAjwsHbcpKyMu/o0EeF4cmf9iwzzIM34x37klm2WhwcU+e1mRm0CZH0606BsvPEUZj20JF5xKZkp+SPxqunqrDk45vmtgei0l7AerYOrF9b7hv8AFmSxPIWbcSD4Wga2WDxrK/MwsnNuYTBB0YcbL50W0l9amJP4hWgpdehEPnnnupLe6huQegXdzXtHbPdwNhP8R2FPIYfwYEmJvxnP1Wdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=K2LlNjDFXSTgOa9dNrJxpgiUjI9orjxR4z1el1Aw5d8=;
 b=JlFwjZtUSS3IxGpQSHCCCirs33eS5fRCzCxA1p6Sy//mMIRgrJ1LmorEKCDNuPivbGBF47HyL8ebgBKcGZytcbEkO28QmSC3jwRIYO2Taqm2HTMI/vGB7HF0mE+3rEkQ3VCbAISlI6Jwz1APV9OS1BjiNtNenf4+KhKFVa4k7hS1X2lP43P/m7Rh4Vx6bxjoxiSBHC50lZIti6KNufnmTMQtAf6Cl0RuOj2MCEBW6wwBGM44htziT6su2XTiiFUgslOgIbDPlY5oqSr1yvHCTRbdMUu1vbGFyCp+Gv8mPRj427fhnKFUTqlJXg9vNhO0EiSR3E4rfPOQWarH4bjflg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=K2LlNjDFXSTgOa9dNrJxpgiUjI9orjxR4z1el1Aw5d8=;
 b=eWgKU8hZTWrt4YgSQ/Na4s1IGFqWn0UP6OzzXngLNj69NpBJaxJhKWAgvwIBOceSXycNKP48i6aoAuXqi/1DQ1brA8neqcq50i6O7qedaeTKui3M4RrTOVhW9SrfHtWqJfh5JL9fyPwRv9DRYy2ukkh/9dBPC+Khl2LvtgxXz0PEpcwzfS283n6FkR/8wjgRYW6gFlYZZK/PAAgGSydpIqDNEOIlR4LxQ+IPNeqHgdpbvlyj20bnThmYqqUWUgevAtv8PcyCDvaagEU1oa7hfSoSe7/0+KSXRzlyuWSwzDsQaYKAeZ+QNiOtWtsSz7B7U5sSWa0ZO4FdvYXXAFTucw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from AS8PR08MB7095.eurprd08.prod.outlook.com (2603:10a6:20b:402::11)
 by PA4PR08MB7668.eurprd08.prod.outlook.com (2603:10a6:102:265::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5504.14; Fri, 5 Aug
 2022 15:48:03 +0000
Received: from AS8PR08MB7095.eurprd08.prod.outlook.com
 ([fe80::7da2:4a5a:2854:26f2]) by AS8PR08MB7095.eurprd08.prod.outlook.com
 ([fe80::7da2:4a5a:2854:26f2%6]) with mapi id 15.20.5504.016; Fri, 5 Aug 2022
 15:48:03 +0000
From: alexander.ivanov@virtuozzo.com
To: qemu-devel@nongnu.org
Cc: den@virtuozzo.com, natalia.kuzmina@openvz.org, stefanha@redhat.com,
 vsementsov@yandex-team.ru, kwolf@redhat.com, hreitz@redhat.com,
 qemu-block@nongnu.org
Subject: [PATCH v2 3/3] iotests, parallels: Add a test for duplicated clusters
Date: Fri,  5 Aug 2022 17:47:52 +0200
Message-Id: <20220805154752.799395-4-alexander.ivanov@virtuozzo.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220805154752.799395-1-alexander.ivanov@virtuozzo.com>
References: <20220805154752.799395-1-alexander.ivanov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: FR3P281CA0129.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:94::17) To AS8PR08MB7095.eurprd08.prod.outlook.com
 (2603:10a6:20b:402::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7ba2c39f-9d36-45dd-b1d6-08da76f9e179
X-MS-TrafficTypeDiagnostic: PA4PR08MB7668:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: yBkZwo+sGdUlM/DWRv0uyxW0Bd7YrI4pWttzpX/A73MZjA4y5wTPWqDK2zggjhB7XnQuFObI9O8o0lKdjcD4qol6XP/GMjAdFrd94WJ3kRksTO8sVwCcQsOzKM2miNhza5yUlCgjx2WeWnet2kWBgZem7zvZfvns/yfjhfeQ8EL/P+XEGto/ex+RgUxjRhoDxG52nRCoOs+oH7nPkX8kMVj9ffe7ePh1VmHNnXIG1sSNR1Q3vxhzlDEo5riEZwBV0ft7cvXU6xM+EZT4Mn9xrKydO5TUivgAZqZ+lb4b1ToSxEUZU3QU/H9LmazvdW+HEfLrpRKI9nMIclu79MWDBOBplt/ftG0bXJliPfHNBdR0GNHr+h2GI/Si9YLzFwWYcI1hMCXHlqwDryG5wiHpqC6oANb/IUxBggaEhQmlNJxSL6due5NvPdf+eXCHe+8QFee+2slc43euBhd9bC36WnLvbLE5qqo/CYEUccAMk61d+C3Nl97qpuDzajSkFQ3wq3FV9FWYRdOAfm6ga2C66WWj3w1Oyv/6sP4ZTUL7aciDPaLcWKidAls/TO1XKm0nUz1lBWTqfhc9O0rtuVHCL0sgNPeBU73Tvix5SZLnmHJJaAk+RGDAi3l+38XYehgBJCv23haYrqkWguhtTlLU+CIyM6qmz6fRNZ4fXGuqab523uLMBiP8Egz4Bxa6eXlh35uW46FNufPV55E4IlqjALuHMaBD/lq4V6b1s0MaH9KMZC4kGRGvyb7GY8OapFhfw2yrmbPeQQ0hn0nJI7Hlmi0SLSfAWuCsoTDDJR2W//sKZvRYU1MJB/1qSEm6x6H0YEy8GKvonSHg/dTJ8Tm+l5VF0goneWfbi5KYkwF36kg=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AS8PR08MB7095.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(136003)(346002)(376002)(39850400004)(366004)(396003)(6486002)(8676002)(5660300002)(478600001)(66556008)(66946007)(2906002)(4326008)(83380400001)(38350700002)(8936002)(66476007)(52116002)(36756003)(41300700001)(38100700002)(186003)(86362001)(1076003)(6506007)(2616005)(6666004)(26005)(6512007)(9686003)(6916009)(316002)(21314003)(2004002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?6p3+Ninra4wS8J4wErigknBspP8sbDSaSFkGv2kurcfFTSyWFqu0VKdwP18t?=
 =?us-ascii?Q?vILEM0jd9TyYTbF0S73bXbkaAPQPFBCWr+EEaOB2IP7iDIiTsp0SWriG2JSj?=
 =?us-ascii?Q?M5d/T9vxOglVsAQb4SFqX1sZwra044D9owwdQsdGyu6X2WtUcg1qYfxlXqih?=
 =?us-ascii?Q?dTdYLuJteIXt/Y6on34J5Pi+qHFgZf1fTbjQov5YoA5ZnOih7dBSYFl9FzV9?=
 =?us-ascii?Q?qT9VId8mBaHJSa2nrhi9etyTrq1Q/OHupg6gz6CxtQtn3QiKX9NRPGFwIh6m?=
 =?us-ascii?Q?V6h3L2n+L1nXNId/IFdkkaNnp/s+wpxK2RzfKLYf6mSsiQ0fliyJJSgzKpwK?=
 =?us-ascii?Q?w1Qw7topdT/2do0mGdMZ2Govpgn8HD2tnHv7XZd+ZEm+5IVqcxxvqHgfxXVN?=
 =?us-ascii?Q?x8B1ucjw3vlDYA8RQKEI4onpJa4YflrOJZolHLmEK5tfxNQXmE4efGwS6tXH?=
 =?us-ascii?Q?P51X6bOd/tCuAUiUW3ChvfMNEB1HnGrdBQS4cEmDThKtyceA0/u8ncajV6uY?=
 =?us-ascii?Q?n4oATsAEyVqd4aZNNd4sJh0LefcqMMIfWq9+seqzp23NBGf8s9C5RvO3k9XN?=
 =?us-ascii?Q?51pf4SAfkcZi9tdVr91JowISOvJd//e/KAY1aziPdQpa7+8nY8H18hAYd4v7?=
 =?us-ascii?Q?ULGal85GZkf9VuTb8r+inhk4tOvSPh6qcD6w/60thKECv0q7gwhAIzY8uJ+t?=
 =?us-ascii?Q?4OTKw1DFhTgVs2MWKuyyah68L7lRtwbhpBVgbemITxmEBFcWms0KdLZHYWdU?=
 =?us-ascii?Q?SFAxHTORwcXDF35rO1yX4yw2UQgFddD9yD74sUPrfvgW4ZjprM+J55C/SGQO?=
 =?us-ascii?Q?WxtwklxXPqSrbP0q1Xwf6SI0yy4/FmCSLT6nlp3t0HZ/TL27zXVvfXjQYEBP?=
 =?us-ascii?Q?e+CcgKubA88EzLvoXTYE5URTfsMHG4JfOtJsmhWQiOEJg+vfYG41OUZPZSPp?=
 =?us-ascii?Q?0v/A0goYUuJ2iG2QuNu1n4QzQZeHEtkdll73NY4HxOCI/TiZHv1rGLhEsVEV?=
 =?us-ascii?Q?0FDHWkod2yDWnweU3wQvDgWTroMwf0+/A2jC7O0UzpmmqCVE0Jy2UxR/JWaj?=
 =?us-ascii?Q?kohcP91jLqhhN/eOUFJICiZVuvfoehvkuoBOc5P5X+TWDogZbIvYUmsWQUGl?=
 =?us-ascii?Q?8UIN6K7Lzwr2MCl0/oa6oedVnatCLtHOpu4i9NTrH3nQ9I/LjAJwbIaXB6Zv?=
 =?us-ascii?Q?zHF85xt3Pgxs1wLBpPoIPeZWq523/3FfkAj6BKUuN76SvKgg2IIAApz0xCcj?=
 =?us-ascii?Q?zx7aCkFxcoa02tXYGM24X7eOuU+GRKcSptmbtuPRJFJye8wNsMzDrl768ZNc?=
 =?us-ascii?Q?CZooJe+7S4nCQvhkSRe4OWvtfiFEVNUhPKIGwVS388Nm6hmDAm0RsVKm8BE0?=
 =?us-ascii?Q?D8LZfguH1uAQ8QKMEgtXNQ2mTVf4U2gxpYvqDRCRK4gbiAZwMOLmhMYkrD21?=
 =?us-ascii?Q?7h3ZcoWn3H36n8+sqIWl701i5+EYM4iqmV/iQO64jG2BOExIUIgvzH/yUBdI?=
 =?us-ascii?Q?okYyVBC7auTy+VsLZSaXNY6rIoX18gtVPbRF50ZOCdd2p9EQTx+xB5mPLcIu?=
 =?us-ascii?Q?OI7FLWHPkY4LLb9f/Yc+42+/qqFbor0pU9OsNC1tlHs0lT0mN7N9Y9a1EBjT?=
 =?us-ascii?Q?NHlfEaGjIUgH3Xux1zfFQhk=3D?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7ba2c39f-9d36-45dd-b1d6-08da76f9e179
X-MS-Exchange-CrossTenant-AuthSource: AS8PR08MB7095.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Aug 2022 15:48:02.9691 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 42d7MCNlB/N9epVp0xMF7/wacKrZkF1oAXY8ho46NKt3tw3cIDaLnk2vHTgokFZEhM7PGeEYgLIqn3demtCgI6qXjEzdcf4Mk/IABPmSEQM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR08MB7668
Received-SPF: pass client-ip=40.107.1.136;
 envelope-from=alexander.ivanov@virtuozzo.com;
 helo=EUR02-HE1-obe.outbound.protection.outlook.com
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

From: Alexander Ivanov <alexander.ivanov@virtuozzo.com>

Check if original and duplicated offsets refer to the same cluster.
Repair the image and check that writing to a referred cluster
doesn't affects another referred cluster.

Signed-off-by: Natalia Kuzmina <natalia.kuzmina@openvz.org>
Signed-off-by: Alexander Ivanov <alexander.ivanov@virtuozzo.com>
---
 tests/qemu-iotests/314                        |  89 ++++++++++++++++++
 tests/qemu-iotests/314.out                    |  36 +++++++
 .../parallels-2-duplicated-cluster.bz2        | Bin 0 -> 148 bytes
 3 files changed, 125 insertions(+)
 create mode 100755 tests/qemu-iotests/314
 create mode 100644 tests/qemu-iotests/314.out
 create mode 100644 tests/qemu-iotests/sample_images/parallels-2-duplicated-cluster.bz2

diff --git a/tests/qemu-iotests/314 b/tests/qemu-iotests/314
new file mode 100755
index 0000000000..79b4d3a749
--- /dev/null
+++ b/tests/qemu-iotests/314
@@ -0,0 +1,89 @@
+#!/usr/bin/env bash
+# group: rw auto quick
+#
+# Test qemu-img check on duplicated clusters
+#
+# Copyright (c) 2022 Virtuozzo International GmbH
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
+# creator natalia.kuzmina@openvz.org
+
+owner=alexander.ivanov@virtuozzo.com
+
+seq=`basename $0`
+echo "QA output created by $seq"
+
+status=1    # failure is the default!
+
+_cleanup()
+{
+    _cleanup_test_img
+}
+trap "_cleanup; exit \$status" 0 1 2 3 15
+
+# get standard environment, filters and checks
+. ./common.rc
+. ./common.filter
+. ./common.pattern
+
+_supported_fmt parallels
+_supported_proto file
+_supported_os Linux
+
+echo
+echo "using sample corrupted image"
+echo
+_use_sample_img parallels-2-duplicated-cluster.bz2
+
+CLUSTER_SIZE=65536
+
+#read one cluster from original offset
+$QEMU_IO -c "read -P 0x11 0 $CLUSTER_SIZE" "$TEST_IMG" | \
+    _filter_qemu_io
+#read from duplicated offset (data must be the same as on original offset)
+$QEMU_IO -c "read -P 0x11 $((4 * CLUSTER_SIZE)) $CLUSTER_SIZE" "$TEST_IMG" | \
+    _filter_qemu_io
+#change data from original offset
+$QEMU_IO -c "write -P 0x55 0 $CLUSTER_SIZE" "$TEST_IMG" | \
+    _filter_qemu_io
+#read from duplicated offset (data must be the same as on original offset)
+$QEMU_IO -c "read -P 0x55 $((4 * CLUSTER_SIZE)) $CLUSTER_SIZE" "$TEST_IMG" | \
+    _filter_qemu_io
+echo
+echo "check and repair the image for parallels format"
+echo
+_check_test_img -r all
+echo
+
+#read one cluster from original offset
+$QEMU_IO -c "read -P 0x55 0 $CLUSTER_SIZE" "$TEST_IMG" | \
+    _filter_qemu_io
+#read copied data from new offset
+$QEMU_IO -c "read -P 0x55 $((4 * CLUSTER_SIZE)) $CLUSTER_SIZE" "$TEST_IMG" | \
+    _filter_qemu_io
+#change data from original offset
+$QEMU_IO -c "write -P 0x11 0 $CLUSTER_SIZE" "$TEST_IMG" | \
+    _filter_qemu_io
+#read from new offset (fail, now this data was left unchanged)
+$QEMU_IO -c "read -P 0x11 $((4 * CLUSTER_SIZE)) $CLUSTER_SIZE" "$TEST_IMG" | \
+    _filter_qemu_io
+
+echo
+echo
+# success, all done
+echo "*** done"
+rm -f $seq.full
+status=0
diff --git a/tests/qemu-iotests/314.out b/tests/qemu-iotests/314.out
new file mode 100644
index 0000000000..c36022c407
--- /dev/null
+++ b/tests/qemu-iotests/314.out
@@ -0,0 +1,36 @@
+QA output created by 314
+
+using sample corrupted image
+
+read 65536/65536 bytes at offset 0
+64 KiB, X ops; XX:XX:XX.X (XXX YYY/sec and XXX ops/sec)
+read 65536/65536 bytes at offset 262144
+64 KiB, X ops; XX:XX:XX.X (XXX YYY/sec and XXX ops/sec)
+wrote 65536/65536 bytes at offset 0
+64 KiB, X ops; XX:XX:XX.X (XXX YYY/sec and XXX ops/sec)
+read 65536/65536 bytes at offset 262144
+64 KiB, X ops; XX:XX:XX.X (XXX YYY/sec and XXX ops/sec)
+
+check and repair the image
+
+Repairing BAT offset in entry 4 duplicates offset in entry 0
+The following inconsistencies were found and repaired:
+
+    0 leaked clusters
+    1 corruptions
+
+Double checking the fixed image now...
+No errors were found on the image.
+
+read 65536/65536 bytes at offset 0
+64 KiB, X ops; XX:XX:XX.X (XXX YYY/sec and XXX ops/sec)
+read 65536/65536 bytes at offset 262144
+64 KiB, X ops; XX:XX:XX.X (XXX YYY/sec and XXX ops/sec)
+wrote 65536/65536 bytes at offset 0
+64 KiB, X ops; XX:XX:XX.X (XXX YYY/sec and XXX ops/sec)
+Pattern verification failed at offset 262144, 65536 bytes
+read 65536/65536 bytes at offset 262144
+64 KiB, X ops; XX:XX:XX.X (XXX YYY/sec and XXX ops/sec)
+
+
+*** done
diff --git a/tests/qemu-iotests/sample_images/parallels-2-duplicated-cluster.bz2 b/tests/qemu-iotests/sample_images/parallels-2-duplicated-cluster.bz2
new file mode 100644
index 0000000000000000000000000000000000000000..ee8f0149b5ecffc4fdc5e2c0cf45b731610378af
GIT binary patch
literal 148
zcmZ>Y%CIzaj8qGboOfsS0tPO%`U`(O5*Pv)I2hO&I2yDPt~od`068263_Exd7-leV
zwiz(^Ft8k0sa3TsBZG0}Vv}35zt?O%VET5A+3Q2o4%bdpm~pLC^&`WR2CW6$VGH;&
vm{u|@;OhXBE0|U>d|v){U)AOQJ)h70iu-<&;S?CYW~db}a<vGU0CEKYoE$uo

literal 0
HcmV?d00001

-- 
2.34.1


