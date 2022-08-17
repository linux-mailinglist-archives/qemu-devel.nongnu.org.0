Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 374135973D7
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Aug 2022 18:13:56 +0200 (CEST)
Received: from localhost ([::1]:37760 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oOLg2-0006Td-S4
	for lists+qemu-devel@lfdr.de; Wed, 17 Aug 2022 12:13:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51920)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alexander.ivanov@virtuozzo.com>)
 id 1oOLND-0006ud-G2; Wed, 17 Aug 2022 11:54:27 -0400
Received: from mail-eopbgr60098.outbound.protection.outlook.com
 ([40.107.6.98]:6277 helo=EUR04-DB3-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alexander.ivanov@virtuozzo.com>)
 id 1oOLNB-0001Kk-Ma; Wed, 17 Aug 2022 11:54:27 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mNqTWzt97KEtSlRV/1csNvZHg75BvyIb0nJVtHnlaF7aFX0snJHbd+ILCqLcqk9D5Ffww2zs+YpHHvdAJ6BuWwqSNlUN9jGB0O2+eEvL1I2QnQAGiRD0T+unaiQX0bK9loPuTyAGZd3mWqRy66FQ6RWFgWicHYHk0+BVHQbk2gjR+dkiHWRVYPhhj6tbX49kEKCf6kqH5upkz8imJ2aXx12x4IbGViWqRZ2nTNnQKCl7syIFJG43Laf08wX52IJ1PwpY/PzMlhBDCFd8XpI0P4Mk78tQDtQ02njLhX4XkanWxFoxqR9go1KgEd/HHixNOOShqa5y6uHJP/Q84wy+ZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RBgGvVKCBrcK1Ig1VxZ2R1dZCAF98IpY11F0Fbuh42k=;
 b=EM0cLS/tC/dXay6yBW1TGGyoEK/Wv2Ji6nNJL4Cd7gZdrmXVglk8krOM9bFFGfo/LwoRP2kbBJdNfMcvCt/BjIUQxgd9Yvecm62uGMiKJTm2MOFNjYI+4Blf1auZkQKZfNQYuKFp8n4MubAvrjTOc6zWLp8HoY96gfx8qWwnh/o5/f8uV9JKHPimUK1CjxeM0Yi73KTeIJy/f74v7bV+v7g2bD6fIvf1CvA55AgMT/S8bzP6fDa2adUx10lRXHzANQY+bsNCJGb/YkP1WdrPCw7OxRkEmngdqH5QUz2cZpcC9oJGWY5L9SAq/cl24DGTFv+cSM3X6kD4G6z0sMhGAg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RBgGvVKCBrcK1Ig1VxZ2R1dZCAF98IpY11F0Fbuh42k=;
 b=UppfQWPblhhJ4VOtXZZY2SUUV5Y2lhw3BNLYfy2tJKjWNarOfKTBt6fEo+4nSYap7vHwjBjVYRaoTyXJbBHArCDZHzVJbX0Cvd5hml5e+Fc2aRrugow5p2v7kMpK6iNPe5b7uRgvnbCZe+s9jzwjm1rfYtmN859/KxI8SVMLn5jbceN3D+xcu+ILJihKRvlCTMHdT2zj2dGF/TLQmV4erLm3Pq8dCtX0hsJJlvWiPjHleZZ7B9ElPnbOarj/wiuUXYWko+tkHieDUg+R+BG7co/JsjyK1CSlQ02O4f5XrFalPjg0b5hd2YwLqL8aN9trLYaChijSSNwB/nGhSEL6wg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from AS8PR08MB7095.eurprd08.prod.outlook.com (2603:10a6:20b:402::11)
 by PAXPR08MB6783.eurprd08.prod.outlook.com (2603:10a6:102:131::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5504.14; Wed, 17 Aug
 2022 15:54:14 +0000
Received: from AS8PR08MB7095.eurprd08.prod.outlook.com
 ([fe80::7da2:4a5a:2854:26f2]) by AS8PR08MB7095.eurprd08.prod.outlook.com
 ([fe80::7da2:4a5a:2854:26f2%6]) with mapi id 15.20.5504.028; Wed, 17 Aug 2022
 15:54:14 +0000
From: Alexander Ivanov <alexander.ivanov@virtuozzo.com>
To: qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, den@virtuozzo.com, stefanha@redhat.com,
 vsementsov@yandex-team.ru, kwolf@redhat.com, hreitz@redhat.com
Subject: [PATCH 06/10] iotests: Add out-of-image check test for parallels
 format
Date: Wed, 17 Aug 2022 17:53:57 +0200
Message-Id: <20220817155401.2045492-7-alexander.ivanov@virtuozzo.com>
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
X-MS-Office365-Filtering-Correlation-Id: 09488925-1686-4740-1061-08da8068bba9
X-MS-TrafficTypeDiagnostic: PAXPR08MB6783:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: g8vk+s2SnvLx3vT6ll01V6ozIsrTb4CZM8sgoZ2KhRg5+g4kNbN45NqsaC7xazOBR9VfOsqY9rATPrODvbFn1S4t/D7MwruPZX+PGkzVVv4KnN8/0dclIWn+Zim7XbU1t0vt2ldnu7DGu/xgpsMmlUuAjtN4NHjWo8Xv5NbdGHx1XDX6T/oXGv4Ch6BDQszu2F/DaBCVfFpmk1gt0W2A6obt2WOClHuYC+hZUIhnGiQKW4EJDRyaKnrVkpR3fg9Xk10YfxwzOO65DxVm0hzUpjQDuIigDdpAtjVfk56SVZuR3WSk8YPBcNQVNfZaPsZkCkMWbGKN0Jmqf3vOKDD4FRAq3dr4+RMsaEsl350+dZ0LOXS7l4Rd69acgWWTiZPXwOjLEFi3BxpQg4pqzHvcm5vSgoQIdui/aqcBHd+H4D/ahKTcpZGP4TcyPyfAa9l/WYCusQaJ0Dmg6tJ6eby6kX64OJ+yeYpfYtnuhZsjhusIA9DO3ASBiPHaeVuZw7l1ALuOeclWHHZD6PzYNmD9D1d0T3+SiMxsvmuoemMRRPunOTwTGR541N4DWF1042xWLx4MvFiD79k1+R73u7A0BufHffbhvXv740m+FNFOrcX76ZbikvkxrzbtwrZuRlKcsXvIgG3VJDnXtSeDbnZRNfvK1Ah64b0SJf65ltj2Fv3JDHT+33lPT8I0jkRD6k/BUUCoMf0B8Qz/1qErAuo1awvZTmVDCvoT5JM949uFXIFIsk6aTgNol4SCoZkyVE14spI1UCgvhvjlVYvg7fqnty+hQykoVzUe1xKPjhcvZKAA9PWkWL4v1FfLIBZFSDEw8WS352a8qk53yKJhmlLOhe4b9FdfVao5i6N3jO6AB6zFP1HSloDLFoCaUM6bkDXB
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AS8PR08MB7095.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(39850400004)(346002)(136003)(366004)(376002)(396003)(66476007)(66556008)(36756003)(5660300002)(44832011)(66946007)(6916009)(316002)(86362001)(8676002)(6512007)(52116002)(6666004)(83380400001)(26005)(478600001)(6486002)(4326008)(38100700002)(38350700002)(2906002)(186003)(2616005)(1076003)(41300700001)(6506007)(8936002)(2004002)(21314003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?8MTkZ2GOnrkQevTL+wD5b9J9iMA9tOAGCaFAqkUmNXcSZ9eyhyjysGdMP8if?=
 =?us-ascii?Q?W8fXVG7Sqcd9ki1TuIZBNt3yKzo/BLtcGXhd6atLxM1j1bgRVDv13tv5hbRq?=
 =?us-ascii?Q?D1NQ8miNo4VEgGptm+gaXVz+r371CQwT46LDR4/ESQrgJPcVJ22et3jAED6i?=
 =?us-ascii?Q?5bopIZ1UHckfobtCUL9aCzAtrxQcSk19kG0A9Unexd9FltmZba58eInSU64R?=
 =?us-ascii?Q?38CqY3fas4VRCuFZ2cLqE2j1qq1Pv60fSnniomsjywPi1b+f7Cw22KIwWRW8?=
 =?us-ascii?Q?Es4ZPrhQelkTRM0pMfWuty6VkjaEodD386o/FJZIL5kximyA2jKiTg/saoRZ?=
 =?us-ascii?Q?fD/OY4LnoP55CNiY5605GXVlO//t3LCwc5R+qc5UUcOgE++zMOht0CoYDSPQ?=
 =?us-ascii?Q?Mdh7NgZNqiLDvdb5aS2OChGWn2HhKGIhEUR7ztgT/inFNPYPwsLFK2sKcRQU?=
 =?us-ascii?Q?kVcpTGsk1llluxYspOwtO45r6XRg7NJ0fO1/NCLfGsbZA6ta7mfIv6W+bZM1?=
 =?us-ascii?Q?IoxBsYIPpyF0M+SDhFhP5TthNkRgc2Yhy60oN9M9UmZ8StLXkMsgbsiAqGJt?=
 =?us-ascii?Q?K8CpzThElG4c4Iil/xXbi0lV8a7ZUM2tUvuTNrB6HrQGHUeA1oraTzkVrNqT?=
 =?us-ascii?Q?pDnBtn2lemxtghw/OteGLfGUVlyQi9avwCtOocQgjt8S47CJriI26m1MtMoA?=
 =?us-ascii?Q?NTrQHZXAXfFC8yxtKMJ+TcRXdA4+5wrmXPQi6ll4S5fC+2L757Lx6NXQ+JOC?=
 =?us-ascii?Q?D0NktraasowO3K9w/DuS3IwqOr3BCoA8hVYcc7m6v45+9OocHs0xZ39+MYh4?=
 =?us-ascii?Q?dtDO1eL0Kw+J0No1NNubQrUFWcC90ys//dBp56fDYZCu3dWkTpmztIZxTCSf?=
 =?us-ascii?Q?Ly/iXTZh2/td15pFhL6/TCuubO9jD0Hsm1MPOMYy2AvBVYUSQCS04tx0iO/c?=
 =?us-ascii?Q?oEtNMX2Bbs8+bd0QvHUsDDBM5UAG/l/ELnEHEd7OqtAsufNPzM2gTWBCGKGf?=
 =?us-ascii?Q?jtPyvD9qE1l8iclMa00s7v50s3tjpAM6Qg68+Ghf1r+WJ6TFxXJ/Qv9wBQ/B?=
 =?us-ascii?Q?ZoensPn9GljvwwN8aOpr0tBXGVK5WBwt4pYspq//rKPPFU5RbyqU1aFSUZ+O?=
 =?us-ascii?Q?DwHP8fJ3xPgFxezj60JyL4suIKsYrHOD1c9wAsw0KSoKvDkik5hvtzsT+d7I?=
 =?us-ascii?Q?b5xzPGysxFbeDPFXulGRH3audSFg+xGb1A1WUZBWwLt/Dt6xRo+co7GDRgP4?=
 =?us-ascii?Q?WXN9koDsRp2r6YGfSpFvAf/WtaNAcLSpqaMAWHsMPd633en0l1xe68wNU3YG?=
 =?us-ascii?Q?du/fnNTdFujzr7/2V0Yg4EGSLghje9j/OkW8k1ZpJYaOJ/rpppn8LtdiZr4p?=
 =?us-ascii?Q?9sU5IUKu1fj+Sm36OookUBCuku2/+ThFvBkSgKr+6IwLmpw5JnECnQkgEjtO?=
 =?us-ascii?Q?uQTBDs8OHKPbwlcZ+0ykOQgf9kNbTwc7rSTqUnjizNEruwfDepTdGeYLuD+u?=
 =?us-ascii?Q?D5F2gx0sIEE/OvZi4zlcrghCjC67JEZ4fI5NaY52eeVhWn1Jya6waTqUu2cn?=
 =?us-ascii?Q?tAwCoteXK34G0H3FMEwEw942qR9T+TZu5gkuW6nWBamYAWBACKKJn+0nC4j3?=
 =?us-ascii?Q?g6aa0NltWTvZ5IhZLmYytPQ=3D?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 09488925-1686-4740-1061-08da8068bba9
X-MS-Exchange-CrossTenant-AuthSource: AS8PR08MB7095.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Aug 2022 15:54:14.1281 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rCRUnitF9MaI0fALfAxT6olrc0vDex7fSmpyVYUUchVCuMbXcU/RsKbeglZnHzYW/LFRO+nDsfWID1cKmKBL48/udtFeDO6cS3yHL2Y65mU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR08MB6783
Received-SPF: pass client-ip=40.107.6.98;
 envelope-from=alexander.ivanov@virtuozzo.com;
 helo=EUR04-DB3-obe.outbound.protection.outlook.com
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

Fill the image with a pattern to generate entries in the BAT,
set the first BAT entry outside the image, try to read the corrupted image,
repair and check for zeroes in the first cluster.

Signed-off-by: Alexander Ivanov <alexander.ivanov@virtuozzo.com>
---
 tests/qemu-iotests/tests/parallels-checks     | 78 +++++++++++++++++++
 tests/qemu-iotests/tests/parallels-checks.out | 22 ++++++
 2 files changed, 100 insertions(+)
 create mode 100755 tests/qemu-iotests/tests/parallels-checks
 create mode 100644 tests/qemu-iotests/tests/parallels-checks.out

diff --git a/tests/qemu-iotests/tests/parallels-checks b/tests/qemu-iotests/tests/parallels-checks
new file mode 100755
index 0000000000..5aaadb0c74
--- /dev/null
+++ b/tests/qemu-iotests/tests/parallels-checks
@@ -0,0 +1,78 @@
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
+echo "== read corrupted image =="
+{ $QEMU_IO -c "read -P 0x11 0 $CLUSTER_SIZE" "$TEST_IMG"; } 2>&1 | _filter_qemu_io | _filter_testdir
+
+echo "== repair image =="
+_check_test_img -r all
+
+echo "== read repaired image =="
+{ $QEMU_IO -c "read -P 0x00 0 $CLUSTER_SIZE" "$TEST_IMG"; } 2>&1 | _filter_qemu_io | _filter_testdir
+
+
+# success, all done
+echo "*** done"
+rm -f $seq.full
+status=0
diff --git a/tests/qemu-iotests/tests/parallels-checks.out b/tests/qemu-iotests/tests/parallels-checks.out
new file mode 100644
index 0000000000..787851a250
--- /dev/null
+++ b/tests/qemu-iotests/tests/parallels-checks.out
@@ -0,0 +1,22 @@
+QA output created by parallels-checks
+Formatting 'TEST_DIR/t.IMGFMT', fmt=IMGFMT size=4194304
+== TEST OUT OF IMAGE CHECK ==
+== write pattern ==
+wrote 4194304/4194304 bytes at offset 0
+4 MiB, X ops; XX:XX:XX.X (XXX YYY/sec and XXX ops/sec)
+== corrupt image ==
+== read corrupted image ==
+qemu-io: can't open device TEST_DIR/t.parallels: parallels: Offset in BAT is out of image
+== repair image ==
+Repairing cluster 0 is outside image
+The following inconsistencies were found and repaired:
+
+    0 leaked clusters
+    1 corruptions
+
+Double checking the fixed image now...
+No errors were found on the image.
+== read repaired image ==
+read 1048576/1048576 bytes at offset 0
+1 MiB, X ops; XX:XX:XX.X (XXX YYY/sec and XXX ops/sec)
+*** done
-- 
2.34.1


