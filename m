Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 653DA3684FB
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Apr 2021 18:37:36 +0200 (CEST)
Received: from localhost ([::1]:42132 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lZcKd-0004iN-Dx
	for lists+qemu-devel@lfdr.de; Thu, 22 Apr 2021 12:37:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54894)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lZcES-0007HO-03; Thu, 22 Apr 2021 12:31:12 -0400
Received: from mail-eopbgr60110.outbound.protection.outlook.com
 ([40.107.6.110]:40766 helo=EUR04-DB3-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lZcEP-0003u4-Ns; Thu, 22 Apr 2021 12:31:11 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kI5AjjEBI2khaMrMExPnb1q2nuys5tEwQr5BYZJzFpPvxEk71AUO3qNhyqeCLHKs552JhYDjF7Brkpxycrwd/w5v3qSB9BVM0PlOT3RL34nztAXOAX8S0RX0GXlcvDLkbEHf0cPSqd5FTVMCtu9O8llfbmPCHatwgwWa29yRJwOsDiD7TH09ZqtLeqVEdc0mGQ3Z0Ve78AhlxTdA/wj7wa3f9AgQLTekS7RQxK3akV9dDsMBI5QG5vtcAoimX1lUsqfBqTFMzi0EdsCS/m9sLDIzTMyyMRr3A34GKyn2XTxPwOYBnp0wFvWIrSpEkx2m3GNPQISueK7NwEbq6bZW/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iXZs9GFBvUAXNvJ2vlQnOgXar2kFLPug2NV9BHHGUJM=;
 b=IrigYfy0whQVHB6HGpw7bHli1Uv8SYzQYwrlxegT/Uxou1njKFcUwvcjxqQzt3F8ahmcsfNtKYzVFbgzKK1n6yXLWo66khCKuphJhh+19gndOD7jUeF8KC+oC1/kVfLKATDDyzxG0CNRZc+Dm21/MRQubKE6FDgr2QNUJjCWiqWtFBkp+5cZo5Y6yKDYZYPef+6hmuJxqw6JCcHmx5Sa09mbXVnP9CC1hPe3B9ePwtOQaH+uaq6CHYkC0PBXItAbxSY21Fj7kUG2JTKiYLM6VL4Ak7vHnbZM6CPtRsnQr3LR7lHR013iNeobmOFkrVPOn3UecI4byJII060Oq+QJEQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iXZs9GFBvUAXNvJ2vlQnOgXar2kFLPug2NV9BHHGUJM=;
 b=TLR+Kyb6LVajb/9eD0fFpjEBU3J4asmGklH+q2uMNroOsg/9JVYEQYOpy/z88KhUtyt0Lsbm3MB6LD3gYncLv5ulFANXKw9CkyrvdlbLGrtIoWaAmObLebtOdw7ynP5+w3iJJq7JknthLdGhsaC9Rsc8Z6GN3ET6lfWc8vMyLGM=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB3447.eurprd08.prod.outlook.com (2603:10a6:20b:44::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4042.24; Thu, 22 Apr
 2021 16:31:02 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::b403:c1a9:6bb7:133%7]) with mapi id 15.20.4065.021; Thu, 22 Apr 2021
 16:31:02 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, mreitz@redhat.com, kwolf@redhat.com,
 vsementsov@virtuozzo.com, den@openvz.org
Subject: [PATCH v6 01/12] iotests: add qcow2-discard-during-rewrite
Date: Thu, 22 Apr 2021 19:30:35 +0300
Message-Id: <20210422163046.442932-2-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210422163046.442932-1-vsementsov@virtuozzo.com>
References: <20210422163046.442932-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [185.215.60.222]
X-ClientProxiedBy: HE1PR0501CA0006.eurprd05.prod.outlook.com
 (2603:10a6:3:1a::16) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (185.215.60.222) by
 HE1PR0501CA0006.eurprd05.prod.outlook.com (2603:10a6:3:1a::16) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4042.16 via Frontend Transport; Thu, 22 Apr 2021 16:31:02 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a2304b72-701f-496a-6f2c-08d905ac04fe
X-MS-TrafficTypeDiagnostic: AM6PR08MB3447:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR08MB3447E37869C7F9309628D31EC1469@AM6PR08MB3447.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3826;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: VaufMrKpnj2X0Qnvmz9aquL6h+N53+VMWKkdLzLteNN3CJbdLjJGWDGluM11ivJ2M1XUaJpCxR6Dqw0gQCaGM6GTYkbVYBg3RuYjPvr/5UvlmJjJMuOoJSZzbsPQRJIDw1Bvilh4sN8OBQPASF10h0O6onC8qurgP3S+UM1YdsKIDpO4G6ldYfkXK/GCCxT/BQUB7xiqB2m1sg7o8rNe79dBUVQ8Ho1pa6MSa4tSW9+ntzoZU/fid4btaLmMC+2vf4gL6UpUbSyVlSkj/tBZB4/kR/z9mbUQXG7xoAU8mpSJfHRroVKQ9FCkJ/hrnIY31BKxCSeshEReVvtKuCRp/SrDHVkrftPo04oRGBwCpvZly+zkU7IFPgC7CfFivuTozgUlW+Q+qssuXcDbQEMMQ0/aeP5i9pNOYoqlUjHo9z9MAdyUYHMYRm33eRJ796O5ByEi9Zgt6sZAr71H7digaTSEi1VqGf6R6Wju2w6kaI3wO8DwEQGdkjJFAq+7+DTFM7gYNK06titCjB/l3M51RuldX2ZVSYQ2r5+BnLXRhRUaVZB6JKA7+v0ZkY2DxlKtmItjpmscC2ptRnRa9HEmYRvB3llZNgewr/zyuH4IvxL49Vla1MmGcNKKkEgrP+lJzMUk+2S0uDPsyhIYlsRDuArhA4lYp0G8eQOKuGWtYmtiR3YAEHEufuCSAW3YgkW8kAtQ5kZBpBjnEeAw8RiVpaGdb6swj1RC97rNll1SO5VgeeAsjyu1qxiLQ8nadJKVLOclettiBPe9nCd8xdjKNvq/wbeG4hh1E2BfuzzBjKDu+2Lvvsg+pw2hztt3peIQ
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(136003)(39840400004)(366004)(346002)(396003)(8676002)(38350700002)(478600001)(186003)(6512007)(38100700002)(66556008)(2906002)(5660300002)(4326008)(26005)(86362001)(83380400001)(316002)(66946007)(52116002)(16526019)(1076003)(6486002)(6916009)(66476007)(36756003)(6506007)(956004)(2616005)(8936002)(6666004)(107886003)(69590400013)(2004002)(21314003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?ph1bvPDBGfQwyk3mrSibbPXISpGg1Z7naJM3dkGLIEmUlvy04uzay5/fCpfj?=
 =?us-ascii?Q?mV+utdM9Inf6r9c/U4rQznNkbzuUdQNGGgKBtBdvU7Kpa7SLapCs8oJLUGIL?=
 =?us-ascii?Q?8TXY6gKhzCMF74Q76IovwfAZgftlG71DYOw4YFYUJdPnjSHav11ELvhbudDE?=
 =?us-ascii?Q?ZmGphhDISsnKdPm43u1zEyuxCP/r9w3/m8Rtn9r+sFjRiQw3tkl7b54lJFbc?=
 =?us-ascii?Q?QIm+kDvhQ4LhVjdMJ33WfItBuNrczBoQbfw2F99xxvr/ggZejhbduOv0JwI3?=
 =?us-ascii?Q?A0HmpquVWm33Dj+mmOYVXGmQPNZOWlprIxkRAYEsm0hBXkg1XpV8vBSRASIy?=
 =?us-ascii?Q?qYFfEIghfpvBpt7/eLUmMCBtvIgOfvJTOlu5DvOraQp6iSvNypmXYaanE3hV?=
 =?us-ascii?Q?6ZHSbvdqyXlTknujmADqnsMtWdo4YK2ajn3iIfyo1E7z4dEKaIz4qKP/HoTy?=
 =?us-ascii?Q?3LULk4sMUpMgXPmoQr0kyzandiDq5siw59NZPqpdf351y4e9GQr5V5wPxBqs?=
 =?us-ascii?Q?lqjn3Xox8wUdy06glVug05Q0salDii+MzaDdz8JJSOeBAYJ5F4REC+uScUqD?=
 =?us-ascii?Q?FF6FcyA4c+sK6GfTmm6JkAy3OCcrXxOUTzJSo93vz/eFKtAfSfVZ9t84eHUG?=
 =?us-ascii?Q?n5I0iQElUoIGgjPymO7ZyBM/k71UPwEejRQb46ExJUVUqfcc4H5Wc33p2aBl?=
 =?us-ascii?Q?BLGmwNbf0bstBGti7ciuFsag6KDyS3Eq5hRLcDxQ9zVfwVgOVqmOyCJzCcxU?=
 =?us-ascii?Q?qxp7IW1DuYy3K7ZQoS6VB7tI+XwPPOlDSWQPXiHhoA0G9Uy2MvWj3hQlnhn0?=
 =?us-ascii?Q?aKW4hwQqkqXtIsalld4Jz8RUgZB3khzPGUSxVcUQR6Dx0aNs2aJdIDj6/ac+?=
 =?us-ascii?Q?awMdpbYdkrShf1ddWVU4DSDdIljRsTSDAPx61Lnbb5VrV+snQBS7MYvenBYB?=
 =?us-ascii?Q?b4/1Y1FBD2Rve0lJL0yGjRZ7lj7+rAKjBzT/8UuvPc1/E7d5SWV4beHBC4aw?=
 =?us-ascii?Q?0QNq6rNR41/X7xZR8Urws4lV6heWN8WSnRL3j/jqPfHI95JE5z6Ktck9YHQU?=
 =?us-ascii?Q?nIeffek/7ISf7DxyY+u/kvB7VCyL1Lo4C0oqZ7R56Kri19IXa/txaCv7ZalU?=
 =?us-ascii?Q?JENpCct7FmnnnWpKvNfX0LuQBqPAS5G93We8zYZDGnPpGiMMur3BJI0mG8/T?=
 =?us-ascii?Q?8Kf+6AO5ISD5lVU5JIxphBSb7zk9qt90CgN8n/no6NJ6EArmxStw5WqZaOhw?=
 =?us-ascii?Q?e2W/EvwvyQUdgnzftDyTuc0XTMZwY4EoJJEu3DEylhe5YLds0jkTWE/Vw3jD?=
 =?us-ascii?Q?lR0GO0BdlLcOgTfQVJ/VfPuj?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a2304b72-701f-496a-6f2c-08d905ac04fe
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Apr 2021 16:31:02.7546 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IT3AwQ2Hrsq4aLLMO6Lp6LQFBKNQBYVbRa7d4IEHQLEBhu9VRebx7F/NLxTFpbpkP/uYTMa9cySPi1LoNCOpB2skpldtzwtQRUxOGVW5CR0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB3447
Received-SPF: pass client-ip=40.107.6.110;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR04-DB3-obe.outbound.protection.outlook.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

Simple test:
 - start writing to allocated cluster A
 - discard this cluster
 - write to another unallocated cluster B (it's allocated in same place
   where A was allocated)
 - continue writing to A

For now last action pollutes cluster B which is a bug fixed by the
following commit.

For now, add test to "disabled" group, so that it doesn't run
automatically.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 .../tests/qcow2-discard-during-rewrite        | 72 +++++++++++++++++++
 .../tests/qcow2-discard-during-rewrite.out    | 21 ++++++
 2 files changed, 93 insertions(+)
 create mode 100755 tests/qemu-iotests/tests/qcow2-discard-during-rewrite
 create mode 100644 tests/qemu-iotests/tests/qcow2-discard-during-rewrite.out

diff --git a/tests/qemu-iotests/tests/qcow2-discard-during-rewrite b/tests/qemu-iotests/tests/qcow2-discard-during-rewrite
new file mode 100755
index 0000000000..7f0d8a107a
--- /dev/null
+++ b/tests/qemu-iotests/tests/qcow2-discard-during-rewrite
@@ -0,0 +1,72 @@
+#!/usr/bin/env bash
+# group: quick disabled
+#
+# Test discarding (and reusing) host cluster during writing data to it.
+#
+# Copyright (c) 2021 Virtuozzo International GmbH.
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
+. ./../common.rc
+. ./../common.filter
+
+_supported_fmt qcow2
+_supported_proto file fuse
+_supported_os Linux
+
+size=1M
+_make_test_img $size
+
+(
+cat <<EOF
+write -P 1 0 64K
+
+break pwritev A
+aio_write -P 2 0 64K
+wait_break A
+
+discard 0 64K
+write -P 3 128K 64K
+read -P 3 128K 64K
+
+break pwritev_done B
+resume A
+wait_break B
+resume B
+
+read -P 0 0 64K
+read -P 3 128K 64K
+EOF
+) | $QEMU_IO blkdebug::$TEST_IMG | _filter_qemu_io
+
+# success, all done
+echo "*** done"
+rm -f $seq.full
+status=0
diff --git a/tests/qemu-iotests/tests/qcow2-discard-during-rewrite.out b/tests/qemu-iotests/tests/qcow2-discard-during-rewrite.out
new file mode 100644
index 0000000000..8e75b2fbff
--- /dev/null
+++ b/tests/qemu-iotests/tests/qcow2-discard-during-rewrite.out
@@ -0,0 +1,21 @@
+QA output created by qcow2-discard-during-rewrite
+Formatting 'TEST_DIR/t.IMGFMT', fmt=IMGFMT size=1048576
+wrote 65536/65536 bytes at offset 0
+64 KiB, X ops; XX:XX:XX.X (XXX YYY/sec and XXX ops/sec)
+blkdebug: Suspended request 'A'
+discard 65536/65536 bytes at offset 0
+64 KiB, X ops; XX:XX:XX.X (XXX YYY/sec and XXX ops/sec)
+wrote 65536/65536 bytes at offset 131072
+64 KiB, X ops; XX:XX:XX.X (XXX YYY/sec and XXX ops/sec)
+read 65536/65536 bytes at offset 131072
+64 KiB, X ops; XX:XX:XX.X (XXX YYY/sec and XXX ops/sec)
+blkdebug: Resuming request 'A'
+blkdebug: Suspended request 'B'
+blkdebug: Resuming request 'B'
+wrote 65536/65536 bytes at offset 0
+64 KiB, X ops; XX:XX:XX.X (XXX YYY/sec and XXX ops/sec)
+read 65536/65536 bytes at offset 0
+64 KiB, X ops; XX:XX:XX.X (XXX YYY/sec and XXX ops/sec)
+read 65536/65536 bytes at offset 131072
+64 KiB, X ops; XX:XX:XX.X (XXX YYY/sec and XXX ops/sec)
+*** done
-- 
2.29.2


