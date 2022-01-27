Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DCE9B49E954
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Jan 2022 18:54:28 +0100 (CET)
Received: from localhost ([::1]:34270 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nD8yZ-0006tY-9y
	for lists+qemu-devel@lfdr.de; Thu, 27 Jan 2022 12:54:27 -0500
Received: from eggs.gnu.org ([209.51.188.92]:38184)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1nD894-00043M-ES
 for qemu-devel@nongnu.org; Thu, 27 Jan 2022 12:01:14 -0500
Received: from [2a01:111:f400:fe06::708] (port=63135
 helo=EUR02-VE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1nD88u-0002Rv-IB
 for qemu-devel@nongnu.org; Thu, 27 Jan 2022 12:01:08 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LJ5JyyUj+yR5uClbSE3X6eISNapGxJ+Dlmu4051+3e09m+YvGfwxB8COGqpJzygWYk+jHexlAdN+6NLb1X1C8ociT1PjqSQPgYqGCfBlLFe5txrtSIOY1i6rTK0vrfUEywvrdKU1AEexHvpDNFe+roWYpLKXXFEod4Hh9WmerZ/02frbT+ea7TRXPKpIMzBLLDShW68l6Ah6jnUPE2uoZGHOj9wMYuj9Hc4Au6/2r+/EmmCl4xU9sS20RyPkOGLposHpUONWdeSCnhxVLEBfLRktF3d5/vL3AN4Qk/x6SPttNh3KqO0O9jw10KrF1znkNmWjm1SMPMtCPMqj03Dy+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AfG3LZ8a4a0YM5mqdzYz3resveBifW5lAI4xGf0dlA4=;
 b=L+HTjn5vMbrqlLbLCWeVl39np5Ovnra5b/0SkUptd2EkK9U6tYOtLGc2LJiOVKpAJkVzkanNzZbydu9A1al8Bm1x6RJpQ0NvU6xPJeH3v4BqLVbw1odlSxCP0UAio/7VFAPnXe6DIhTVrpfQFh1CDsEc13YJFlYlTl4dxV/4QnjES2p42aq6hpO+J2OtMmjyQYuzMV/yJxsxYNchrpraaVfClYHmAo/M74mDW7iV4RXP63WGCIRRAYN6P/yy1vmP0irZZ6G+iqhxRRdlfd2sv45zuv0X8dVzG3I4NPSoIGufv8X6/LAcfUXdPMGHbj7eQc/A6HTFVvmSbkHiD7asuQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AfG3LZ8a4a0YM5mqdzYz3resveBifW5lAI4xGf0dlA4=;
 b=kK26LexUdFHzNA2XmlgV4bSGftRhtO0vBjIux1SgNog1P0dEtocxT0+S7TZlOHQWE/Zr38qVrVtkpKhdKDDbNnAIW49EpD0FeNDNW4/blszKZdsgbl/ipWl2iLSvY7CW2WwuvU1lcWGGT8F+fYs/cGoHMLuhT2Q4jAM97CiiYFU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from AM9PR08MB6737.eurprd08.prod.outlook.com (2603:10a6:20b:304::18)
 by AM0PR08MB4436.eurprd08.prod.outlook.com (2603:10a6:208:13a::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4930.15; Thu, 27 Jan
 2022 17:00:30 +0000
Received: from AM9PR08MB6737.eurprd08.prod.outlook.com
 ([fe80::4def:4b08:dfe6:b4bd]) by AM9PR08MB6737.eurprd08.prod.outlook.com
 ([fe80::4def:4b08:dfe6:b4bd%3]) with mapi id 15.20.4909.017; Thu, 27 Jan 2022
 17:00:30 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, armbru@redhat.com, eblake@redhat.com,
 hreitz@redhat.com, kwolf@redhat.com, vsementsov@virtuozzo.com,
 den@openvz.org, ktkhai@virtuozzo.com, igor@virtuozzo.com
Subject: [PATCH v2 2/2] iotests: add qcow2-keep-dirty
Date: Thu, 27 Jan 2022 18:00:19 +0100
Message-Id: <20220127170019.3292051-3-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20220127170019.3292051-1-vsementsov@virtuozzo.com>
References: <20220127170019.3292051-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: AM5PR1001CA0072.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:206:15::49) To AM9PR08MB6737.eurprd08.prod.outlook.com
 (2603:10a6:20b:304::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d4c22449-0c46-452a-583b-08d9e1b68654
X-MS-TrafficTypeDiagnostic: AM0PR08MB4436:EE_
X-Microsoft-Antispam-PRVS: <AM0PR08MB4436110600643ABBF6B6055EC1219@AM0PR08MB4436.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2958;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: CZ8zxUHGZ0LrXUUuPgBXCeEOWK7OvOBDIJXB5vUPSgYXhfXU/OvN32sFewDgHtcnukyCW/GstVaB47c/xlyQavmmlU/wPk+8ROhAs5pOvr3sIBEv6op6q8WVYwV0F2IF+Dq6ofz9Us4wCADigcr4WCgcuYrYlNqDASa91j2zU+N8Glmpr4n3Fm9kRM1dL5XtYzinpRZjCMECe+0IbyR/H3PuEtpHL+CI2jQ8azl/tkMJ1iRFq/XMi7tbVQjTntaHO3vQkR51B5qqWzJJHT5BD5hvoc3vQlWHGN6XfMfszqYNedgMsY6A+2m6MzkBi4kRAh8qK3q/QcmATdtTgcBU5BjxARhBsrTd2R0RVAYboYQN/gAJCPKN1eoAbirSvHrmfD3FwX3QVvPaMGO6H/cjTwmpf2aO33MofrzOjq4DiAer3DmGu8ttCPjy7Ish0UaxCoZfP0ExY3a5Z93N317HIuEy56AUSd2JYk2BOyFu4Y0lA4I3wmrwJLSySegbIcgqDhB7VQEtHDgPk5stEpo7iHAjuuIF1zoIJNaIdFUmMxnnRL8lR3TkDYFv1k6U1sH8tpSHMLkx3p0tJHS5r24U39TDMRWU+O9FJZQ7OxE8MquJPGhDShWvXy9p92uRxfBpYUo7NDjNZpiqlzRPA+AjAl/pFuCzuF2m5t6fkRQEdGcaYrfv5j2TasomWBDxadcuCGMq3KIdwsAFcUpjPvGYCnhUOwBvaBq25qrx7L2EUBU5+P/Qz7AQCrnkyKL2tUOJvse3RHRP3DprAHio20Orr8oYKJ9eeXj83QF7P+FVY9f70yL5DGCRUOGOR4g/B3sjzsExXFG2jjnRPO6qzwmYIA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM9PR08MB6737.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(107886003)(6666004)(6512007)(2616005)(86362001)(6486002)(26005)(186003)(83380400001)(52116002)(6506007)(1076003)(508600001)(66476007)(2906002)(8936002)(8676002)(36756003)(66946007)(66556008)(6916009)(4326008)(38350700002)(38100700002)(5660300002)(316002)(2004002)(14143004)(20210929001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?UtDoGIadGK8f9hMLcRKuk20Ig28Vxi9/5UHGeHvDikV2pfJTUsWsm++FVx3Y?=
 =?us-ascii?Q?P1X3dPclR3DlGBqRFz954i4kRAMfvzyfi/s3/8YTjAzpvLtbbWvNTmCaiYAn?=
 =?us-ascii?Q?YCV6ZMB9vOVKSS8E0X/95E+SPkyXvvk0B0o1h8FRhAqPPEu0dH9wyXxfv1tv?=
 =?us-ascii?Q?5E3cyKYYrPyJN5hVDwidn7YB8ApKEDbEZu/92HsngFkBD4+j4E3hAQUX07tJ?=
 =?us-ascii?Q?bm8uDAE7FcLLORXDYFt9B7if1S4YmSc5eZQQRDv4Eh9bcHdLbasfifSfShwL?=
 =?us-ascii?Q?wqP1nfw1x6yr9ym7DZxixzl5CSoe1LkDAmjuG+FLbKZzqqFgesY1rgIhaER+?=
 =?us-ascii?Q?3QvdHhW++uPw8gImwKah69VpAbjV6U7ShvOI+98Z+IJHCIGOKxo40bBgEgQB?=
 =?us-ascii?Q?1cyU0z6mOrriJx0BBYyNFGG8DXnY/hX7bzet+XsozwjT1tm5+Bb0GGeLQnsS?=
 =?us-ascii?Q?mt79fp+Ss24ALAFgKCK79ZsCGhMrtKin7U6UIoc792bCSFCjoiFXM19FiTDz?=
 =?us-ascii?Q?9OQn/9ZN0APBh42jyssw+LmIfSG57X9V5pT74EK/1uMr88KcSfhPLifonZRx?=
 =?us-ascii?Q?gmqcjsWQsrtuyXCjKRND/Iq0qHtZ1GoCXq9zT4r5ECIvJMLBCqYouh3bA6qq?=
 =?us-ascii?Q?PS/Z2CQd98wGwyyeSteSVuFkcQR5e46jdLar5sB1FVuOJASX3uHKMWdfyktj?=
 =?us-ascii?Q?JvVztDFDZQRP4LR7k9Ni2rdBdRYZL9uTdykQ0n4DjzmZvGatUBOnI1Vw0eqh?=
 =?us-ascii?Q?0hMrJMxQxnAUwY5HYKBjw1QBJeRYd2eENre098SYkG6nunDcI5eH5mSu5iyA?=
 =?us-ascii?Q?IX5WplGiGb9vXQPpeOdf9gmL83+eryKeEU/hptqUkaor35k61OGY4yPtz7Iu?=
 =?us-ascii?Q?2DCx/SYjknR9Xkc1ZZ1pT6R/vkOQ8/6/n8AGwMesbnhG5qVG/MEEGrj0XQzx?=
 =?us-ascii?Q?pyzG0Kt+dqn6uwx/PWKRBNjdW3fkdpYQbkGxdOc6fbK07aC4RVyqgUNg0UQ/?=
 =?us-ascii?Q?r9s9bzJ2/n3O+MU9xV3bxyUEDAXLEy+2P+suh6fi2n9HeihS9hspby6pPFxf?=
 =?us-ascii?Q?9CjfBSeLAGqHC3UAMIFYhcl6tLb+rbPbdJzFGZmMWcNVo8vgYSlqILvxUMSE?=
 =?us-ascii?Q?EvOzKbf/mS6QNsF+Zsmnvr9z4XZ+Jhr9E67sXLaaoc9d9KRopOPD9E7boHX0?=
 =?us-ascii?Q?kJZ/JDBNeShWMZZ6FOQOW0zEJnZBeeLYnKdf5QxwaXAnEdpj+rsXS6Wt+bte?=
 =?us-ascii?Q?ZxJTSaa8K/qlVjK3tOoHrbztIPAqX/FWpznoY+0CbZ8p/xtL2nZy2CXtnSFK?=
 =?us-ascii?Q?ziXYhctcdxeeXnja45034zF9to5u/N+iD+eFk5dPLa3u+5/tZ+4EPgFqtTPV?=
 =?us-ascii?Q?NjDKTRvB2kYptpJGSXXIidSHYoNyqtdvQgrRlb4bIccBfyphPsYpOWujj6BX?=
 =?us-ascii?Q?fFsGwuxvLiojRnGN+zraylvDjzw6jcTDDvAScJgahnLoxnLQ5yN8FlGEL4JE?=
 =?us-ascii?Q?XVSrjZp7N9fa3bZt/S4qH3vLqeW/jgdBg8ACmEWtmMmtK+PJEPKt3WfU4hpr?=
 =?us-ascii?Q?HW9BBViROUzVbUr9wX2csDtkbqt2kfI5Y6BPQf+b7SO3prQjc6a1VQgJ0J/3?=
 =?us-ascii?Q?0Khsw8gosGpVugMyK4WuZiglTDplJCKGVNPh826a6HV/IjkL17npPzuAChYA?=
 =?us-ascii?Q?aniibu2qeT/CghfosZk6OSNDwYE=3D?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d4c22449-0c46-452a-583b-08d9e1b68654
X-MS-Exchange-CrossTenant-AuthSource: AM9PR08MB6737.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jan 2022 17:00:30.5013 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MLxop7uRNi4LtobEqfWLRbwC8sxaoP0y71U2QmTbMZrLitqk03U61JE/QRLqXc4rII8mrvzx0m2CqK0yPTpFqV1v6UOMH9xupPtgncLfXwA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB4436
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a01:111:f400:fe06::708
 (failed)
Received-SPF: pass client-ip=2a01:111:f400:fe06::708;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR02-VE1-obe.outbound.protection.outlook.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

Test new qcow2 open option: keep-dirty.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 tests/qemu-iotests/tests/qcow2-keep-dirty     | 99 +++++++++++++++++++
 tests/qemu-iotests/tests/qcow2-keep-dirty.out | 31 ++++++
 2 files changed, 130 insertions(+)
 create mode 100755 tests/qemu-iotests/tests/qcow2-keep-dirty
 create mode 100644 tests/qemu-iotests/tests/qcow2-keep-dirty.out

diff --git a/tests/qemu-iotests/tests/qcow2-keep-dirty b/tests/qemu-iotests/tests/qcow2-keep-dirty
new file mode 100755
index 0000000000..8f74e68967
--- /dev/null
+++ b/tests/qemu-iotests/tests/qcow2-keep-dirty
@@ -0,0 +1,99 @@
+#!/usr/bin/env bash
+# group: rw quick
+#
+# Test qcow2 keep-dirty option
+#
+# Copyright (c) 2022 Virtuozzo International GmbH.
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
+owner=vsementsov@virtuozzo.com
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
+. ../common.qemu
+
+_supported_fmt qcow2
+_supported_proto file
+_supported_os Linux
+# This test does not make much sense with external data files
+_unsupported_imgopts data_file
+
+check_dirty_bit() {
+    $QEMU_IMG info --output=json "$TEST_IMG" | grep 'dirty-flag'
+}
+
+set_dirty_bit() {
+    echo Set dirty bit
+    $PYTHON ../qcow2.py "$TEST_IMG" set-feature-bit incompatible 0
+    check_dirty_bit
+}
+
+QEMU_IO_OPTIONS=$QEMU_IO_OPTIONS_NO_FMT
+
+keep_dirty_opts="driver=qcow2,keep-dirty=true,file.filename=$TEST_IMG"
+
+size=10M
+
+_make_test_img $size
+
+echo
+echo Check that keep-dirty not allowed without dirty bit
+$QEMU_IO -c 'quit' --image-opts "$keep_dirty_opts"
+
+echo
+echo Check that usual access clears dirty bit
+set_dirty_bit
+$QEMU_IO -c 'quit' "$TEST_IMG"
+check_dirty_bit
+
+echo
+echo Check keep-dirty
+set_dirty_bit
+$QEMU_IO -c 'quit' --image-opts "$keep_dirty_opts"
+check_dirty_bit
+
+echo
+echo Check that usual qemu-img check clears dirty bit
+set_dirty_bit
+$QEMU_IMG check -r all "$TEST_IMG"
+check_dirty_bit
+
+echo
+echo Test qemu-img check with keep-dirty
+set_dirty_bit
+# also set corrupt bit
+$PYTHON ../qcow2.py "$TEST_IMG" set-feature-bit incompatible 1
+$PYTHON ../qcow2.py "$TEST_IMG" dump-header | grep incompatible
+$QEMU_IMG check -r all --image-opts "$keep_dirty_opts"
+$PYTHON ../qcow2.py "$TEST_IMG" dump-header | grep incompatible
+
+# success, all done
+echo "*** done"
+rm -f $seq.full
+status=0
diff --git a/tests/qemu-iotests/tests/qcow2-keep-dirty.out b/tests/qemu-iotests/tests/qcow2-keep-dirty.out
new file mode 100644
index 0000000000..6224cb7ece
--- /dev/null
+++ b/tests/qemu-iotests/tests/qcow2-keep-dirty.out
@@ -0,0 +1,31 @@
+QA output created by qcow2-keep-dirty
+Formatting 'TEST_DIR/t.IMGFMT', fmt=IMGFMT size=10485760
+
+Check that keep-dirty not allowed without dirty bit
+qemu-io: can't open: keep-dirty behaviour is requested but image is not dirty
+
+Check that usual access clears dirty bit
+Set dirty bit
+    "dirty-flag": true
+    "dirty-flag": false
+
+Check keep-dirty
+Set dirty bit
+    "dirty-flag": true
+    "dirty-flag": true
+
+Check that usual qemu-img check clears dirty bit
+Set dirty bit
+    "dirty-flag": true
+No errors were found on the image.
+Image end offset: 262144
+    "dirty-flag": false
+
+Test qemu-img check with keep-dirty
+Set dirty bit
+    "dirty-flag": true
+incompatible_features     [0, 1]
+No errors were found on the image.
+Image end offset: 262144
+incompatible_features     [0]
+*** done
-- 
2.31.1


