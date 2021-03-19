Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F65534199E
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Mar 2021 11:12:30 +0100 (CET)
Received: from localhost ([::1]:40982 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lNC7J-00084W-6b
	for lists+qemu-devel@lfdr.de; Fri, 19 Mar 2021 06:12:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46600)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lNC3b-0005BR-EX; Fri, 19 Mar 2021 06:08:39 -0400
Received: from mail-db8eur05on2125.outbound.protection.outlook.com
 ([40.107.20.125]:53216 helo=EUR05-DB8-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1lNC3Z-0005Ve-7d; Fri, 19 Mar 2021 06:08:39 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=P9vik0a3RumVeeu1P3+QaolNSk3jwgf99mnqFobFdCBdtvaFZRij3MYecjAJPJaP80fOowYs98fbFDvJhMyE//fkDfDhGkPIb/mjMTlxhzY61NVCmOGJ5kwBjczwBYGHrNZRD+09botrscoH+cSrOLZkGAhkQ8B2C0j8pUpuhXbhJfmoaYGUTPK10dBHpSA5DJD7LcG51beaDXccrYOFObPb1t/WH+i5Yor1DmZ8uvGSLZqb1qskvAU+/3iT5XwszOPSYUSVWmD11AuvFFPQKI3o5qZ2Ce/9l1NqJH8piqt+UhddfGEPc9NZlDpXr9KKF4AX3I2Q8zlmto+WjtAMUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=16r3DiadWOxkQ42LojADZo+zQt/YAQng9PMqIguR3yA=;
 b=fzErwfjVvv0QQeNJNX+Jvx1D4quEKp06lfdUffQr3UerOGnIANNkLLpMU2ZDBnViS83Rm5Hi8J434R3KRry1Bf/Jns33nEJZUy2265ocs8uSW9LCcAYosRwd9Oam3oZ4xuj69GKtNp0r3HSUeB/yhsQLjf1JdKg1X4chFRE538JYoOfZ7xValB/dsrd9pKyVoN7JYl7Lf2JT5OqMRfMq/wdlpzaNPV2lDeIyBOfzEbjoVGPWgOf+AcRWACTDyyD5nmqeDWxvmmMfM8e6DHLMG922ciFjk0MCzSkRWZLzX+VgvZ7LbnTNombenxXT38AhQHjuFWOt3Ds71H3Le4Tt2Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=16r3DiadWOxkQ42LojADZo+zQt/YAQng9PMqIguR3yA=;
 b=NiBjj8FCfh4YJ3E+fcirtD3CDRm+slacCkw4F+8oNaqnnfHGuI3EkjYe+ii5bDLM5lQh2F4i8Z6W29SzvPYyY6t7c6Md4wNTpPvzfczEMiDYPm3G9edjfI3XdRnefGumL07u9yEBdfQYQJ87CiIOK9B1fpEJmSyqnD6/CUgydsc=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB3720.eurprd08.prod.outlook.com (2603:10a6:20b:8f::29)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3955.18; Fri, 19 Mar
 2021 10:08:29 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f1f0:6610:11f5:5e4a]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f1f0:6610:11f5:5e4a%7]) with mapi id 15.20.3955.018; Fri, 19 Mar 2021
 10:08:29 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, mreitz@redhat.com, kwolf@redhat.com,
 vsementsov@virtuozzo.com, den@openvz.org
Subject: [PATCH v4 2/3] iotests: add qcow2-discard-during-rewrite
Date: Fri, 19 Mar 2021 13:08:10 +0300
Message-Id: <20210319100811.342464-3-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210319100811.342464-1-vsementsov@virtuozzo.com>
References: <20210319100811.342464-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [185.215.60.202]
X-ClientProxiedBy: AM0PR01CA0082.eurprd01.prod.exchangelabs.com
 (2603:10a6:208:10e::23) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (185.215.60.202) by
 AM0PR01CA0082.eurprd01.prod.exchangelabs.com (2603:10a6:208:10e::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3955.18 via Frontend
 Transport; Fri, 19 Mar 2021 10:08:28 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c5fb078a-da50-43f1-fbf4-08d8eabef136
X-MS-TrafficTypeDiagnostic: AM6PR08MB3720:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR08MB3720449E45C1E213337C9B35C1689@AM6PR08MB3720.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4502;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: RMsnL8pDuJjkObXe68ObKoDHeeVkucbhRNCnkGWzECjNH9MVJMEyON/Aa56Ow/7yjslCNsZDC7MtLzYPtzl0bAmmNVWfiA/CsoZplFgtHaPoXrTAzDoM8HEy0Li+77OF6ubyfNB106XB0rWWfclQQAmgZGCzulXp88EEcnc3wbufjf/TrXODpFXCfbGCWnynDbMlkm/aV+0gOwJvCfPMmdAySohEvQoSnxoflu3fD1vxwzsPMIqeu87xUHxq06jMZFicK8JeX5oc1/ZEmI2mBMzqFCMZr4nMTcSV1vd4qgCRsczKL/GSjl2/AYSW+L9ywvknCkE+xlu2YOTABbXOtAa17KU+EmFD4FiuGUNUK1Bro+v0UEfNJEIFDGRwydlhFanYph+ZPCXSjWqmnt8thXwbpseFMhjHKN8LKw4V3oLFKkxDMLZPKuagz9JlTfbYek3tAmuqXc+zelKg4/BoKqo/xoJ1bUVVVWpVjsLoOmJh6AyYuMAubcUT8kDlNSqNT0JQsWCDlPhgRA9U+x9jgpAMtKweE3C+H91SKVdmSUhLvLB0HCR5fSnIdIrGn32bDLpFFoC4m4zctXIn/hC/VFagfInfHlSlJmecRZCFPH1OqXCZkd0+g0kbPp3EIzkIzkcFRcdqpHOY7GaMcU3vUQV+ppilNNIp9EQWrieB+GfDn83A2dqgDb2o53MpE8rH5mKxfTZyxw0aAm5BxJnae6JvbfpAI3EH+QuO0bV6hKW4aoPmhvlwu+RaQZr5dyTOZhXzacptWus+98di52JWXhhrwAjYbOpy/m5/KaRJSN+bYgr0ak75aO0S/pFiddE8
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(376002)(396003)(39840400004)(346002)(136003)(186003)(956004)(69590400012)(2616005)(83380400001)(16526019)(107886003)(66556008)(6506007)(38100700001)(66946007)(316002)(2906002)(86362001)(6512007)(5660300002)(8936002)(1076003)(6916009)(8676002)(36756003)(6666004)(478600001)(26005)(4326008)(66476007)(6486002)(52116002)(2004002)(21314003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?1mXbv1p5rHHtmFHcAtQ9SbgFg3QjkiwveAp9bikWkWLE4TId9MgB5dwfw5KY?=
 =?us-ascii?Q?PJOH7uM92PVC3HDwLunKQ/4sQZow3cpog6cmfCG0WfbrnV7NYtz/xr3TUt0I?=
 =?us-ascii?Q?J+BDxUTws0qji2pWtCFyUJ3WuPDtrlrpgAuFy7704Le85iXwi2Ehuo7cmP7W?=
 =?us-ascii?Q?SzY8Mv3p+DmlD+BZsV20JGchUyx4/e5qVMDfTxyOHBPIoOk2DMK86HFfHadD?=
 =?us-ascii?Q?p4/cqz3cKDexCetbPJzBqrrZglZ7hQESfXqKKBF+sGT3qqgLUKQcxOvZa/uy?=
 =?us-ascii?Q?7liXp0GjurZ+r08pYPENP5uTMwtKnNF4GOtTAin3/lXl7F9peSkV0J3607PB?=
 =?us-ascii?Q?RBGaO5JrCswPU9YVq+h5414Fn8Ox3B85S9FkF1YhM6sttsMmtlbahJklkGs7?=
 =?us-ascii?Q?+DTfzNtjTPFTCRHacPN5sna9+vz1+fgFd2VCEQZKKP8HYiFEMCytKIxQdoXg?=
 =?us-ascii?Q?DhYEaQHdQxOeSa4qpSHQAZAPnd3mRYfEyo4HTRyPWmOJaIqv7wnTUabl+O43?=
 =?us-ascii?Q?K/02qqCrV9VQ5FjDERjtJq+guckxQmV/06VQ0+euKIgl1FbxaDnky26s69f5?=
 =?us-ascii?Q?qVX7FvlVMImuki1TiujWi/5xILEvwHXUvztqL3V+uA6nTegshc1R4Qd9SSvA?=
 =?us-ascii?Q?QS9L3KCgciCOsFWFWEjZmzibS1WOHYLe5mAs5WJ03iVPPE7yIDDL5lIi0syl?=
 =?us-ascii?Q?Q9xbYtRXJITXmmSMvxzV3qg3qTeqPMaCQqd18mbNYpkalmdhUTIOrGPJ9jBR?=
 =?us-ascii?Q?Ml+5HMHvr17ZS/eLu/dKFuGpibHdXM3GXUOcZfpPGVFcq0EDJhI4+501mNVt?=
 =?us-ascii?Q?5oHsQyaZzhaYAIhCOmad5RMW3TprBUrCQlWclBVrUsf9884I1TDjy3u28EsN?=
 =?us-ascii?Q?UvhYkU/hyDnMll+7UV26WJTnkPSlXgLlYjUH0WoSwd4/ZT20b16LbPOp7jKR?=
 =?us-ascii?Q?rfZA5f2+6s0i/HZBNCzPuuj6AKT8Zzyi9gd7/FapEvpe+pjZt5mnePZwKOfD?=
 =?us-ascii?Q?cVCTDXxdOzXX/pTZkWr2Oq2lMA7KQAWQusq/ORoDIc4CvQ6wfR1C79LoyZ0n?=
 =?us-ascii?Q?lp5F4cz1kg7CmOlRpqtCWXh/jY+M2JQwgTS7jN5OLoTZ4KBTx0TloZWRjsP+?=
 =?us-ascii?Q?MAMl6c7Atuj1otgcU+DnRdRbYDTxhiSQ68HiAA3H9Nie5fgRjFgVrfbmk7dz?=
 =?us-ascii?Q?S6l2FAyN7pOomqZ1NhlMrLAPCHzZMI2SVRrsMbTB7q3oOHH9yGYEiV7LQ7nw?=
 =?us-ascii?Q?8j9DnpnQkdKC2/5U9vc+48Iqk/YL7l5jJqIHt90GiDpqbXQK7ujqolUXgx1B?=
 =?us-ascii?Q?Ye/68rcxwDDQZwW0IPeJ/Y1A?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c5fb078a-da50-43f1-fbf4-08d8eabef136
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Mar 2021 10:08:28.6534 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Pv6i0iqZx6Xp1+m++vnb0HwXf+dQU+MnywvADQOckJLc3lDYQ/s6RAr0KX2k04p6ANHJEThDA6zZjxO7ZgDl99pYRdFGWZz4C63SmwYNq4g=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB3720
Received-SPF: pass client-ip=40.107.20.125;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR05-DB8-obe.outbound.protection.outlook.com
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
 .../tests/qcow2-discard-during-rewrite        | 99 +++++++++++++++++++
 .../tests/qcow2-discard-during-rewrite.out    | 17 ++++
 2 files changed, 116 insertions(+)
 create mode 100755 tests/qemu-iotests/tests/qcow2-discard-during-rewrite
 create mode 100644 tests/qemu-iotests/tests/qcow2-discard-during-rewrite.out

diff --git a/tests/qemu-iotests/tests/qcow2-discard-during-rewrite b/tests/qemu-iotests/tests/qcow2-discard-during-rewrite
new file mode 100755
index 0000000000..dd9964ef3f
--- /dev/null
+++ b/tests/qemu-iotests/tests/qcow2-discard-during-rewrite
@@ -0,0 +1,99 @@
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
+aio_discard 0 64K
+EOF
+
+# Now discard must be blocked by discard_rw_lock.
+# Prior to introducing of discard_rw_lock discard
+# will run and discard the cluster we are writing
+# to. Give it a chance to do it.
+sleep 1
+
+# Write another cluster. Data writing should be
+# blocked by discard_rw_lock (as we have pending
+# writer). Prior to introducing of the lock this
+# write will allocate same cluster that was
+# discarded and successfully write to it.
+# Give it a chance.
+cat <<EOF
+aio_write -P 3 128K 64K
+EOF
+
+# a chance for write to finish
+sleep 1
+
+cat <<EOF
+resume A
+EOF
+
+# On good scenario wait for
+# 1. finish first write
+# 2. finish discard
+# 3. finish second write
+# On bad scenario discard and second write are finished,
+# wait only for first write, which will pollute data
+# of second write
+sleep 1
+
+cat <<EOF
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
index 0000000000..dd54e928a6
--- /dev/null
+++ b/tests/qemu-iotests/tests/qcow2-discard-during-rewrite.out
@@ -0,0 +1,17 @@
+QA output created by qcow2-discard-during-rewrite
+Formatting 'TEST_DIR/t.IMGFMT', fmt=IMGFMT size=1048576
+wrote 65536/65536 bytes at offset 0
+64 KiB, X ops; XX:XX:XX.X (XXX YYY/sec and XXX ops/sec)
+blkdebug: Suspended request 'A'
+blkdebug: Resuming request 'A'
+discarded 65536/65536 bytes at offset 0
+64 KiB, X ops; XX:XX:XX.X (XXX YYY/sec and XXX ops/sec)
+wrote 65536/65536 bytes at offset 0
+64 KiB, X ops; XX:XX:XX.X (XXX YYY/sec and XXX ops/sec)
+wrote 65536/65536 bytes at offset 131072
+64 KiB, X ops; XX:XX:XX.X (XXX YYY/sec and XXX ops/sec)
+read 65536/65536 bytes at offset 0
+64 KiB, X ops; XX:XX:XX.X (XXX YYY/sec and XXX ops/sec)
+read 65536/65536 bytes at offset 131072
+64 KiB, X ops; XX:XX:XX.X (XXX YYY/sec and XXX ops/sec)
+*** done
-- 
2.29.2


