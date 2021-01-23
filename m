Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C916A301879
	for <lists+qemu-devel@lfdr.de>; Sat, 23 Jan 2021 22:08:24 +0100 (CET)
Received: from localhost ([::1]:55560 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l3Q8t-0002bN-Po
	for lists+qemu-devel@lfdr.de; Sat, 23 Jan 2021 16:08:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44634)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1l3Q5Z-0000d2-F5; Sat, 23 Jan 2021 16:04:57 -0500
Received: from mail-eopbgr150139.outbound.protection.outlook.com
 ([40.107.15.139]:30663 helo=EUR01-DB5-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1l3Q5X-0001gI-16; Sat, 23 Jan 2021 16:04:57 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=M55U71ikFMAYAGJ2XWC/SifhBT6+SCOTj4bHbp6Nx/IQJmSd/lBoVq5HNSJvzh51jzWFlclSatgUAkmwB5uHE4eRN8OyvrHIOI5U+tDAuLksSaGkgVLJqOlWwodLc9ODdgqABFRem/nVL8dhZxcotOm46f5cJF90tU2LnTyqP0zPilUSN0kKNtJVhPdUsD4bT9xs9IHuELlUYx+3MZ4HYKR0xPZxdtUyZz3+I0JXdHGCF3p1kc+MF9axKcn2x4i93EJ4J+h6dbfjPPm3Td0h3OAtFZ5ejpaD1b14HyWRd58lIqG0ZAUHK8jkOsT+Wog/uDqmxk5plIT8CHwIu4Cn8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jZQzbO4hDeG0+fQYXsKT+vDtbDm6eI1MFCPIw/zUxnQ=;
 b=GR1ROLJ7JYUQ9txRfKEBDqmbG0UQVzWqKcG/2Xji4m+wX/vZ7l8tAniSr9ZhLgvt8mg4X9gQnEhBTXt03qo7CgKv3teRilgQEZJfgTxMzYvsux0qjd5ZT5RMBP35orQHzttBK1kpXRJM/TSNoa+etM5SCkp8NAuj/W4wcdX5qWzF7fDHdOjsLEZqCtIclKGulbtaCOB2Mr4sd56IBNh3h0ATL30/zLXeJOFAkKatgw6UtSUBcogmE0FpM+9S7AWB8Vl5hroY4LTxSwgFxAXYScal9Z965fXFcNjs6y14xmz1jnQfKxFiqBA54YIZBNrpIM4QPJUy3RcNFg2RqH0Ibg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jZQzbO4hDeG0+fQYXsKT+vDtbDm6eI1MFCPIw/zUxnQ=;
 b=IspYs0wD69VlYmhzZbplqQ1aOQ6BgrlHl6oTDkl/uklaZiPjCQm27tP7zLuY4eaSe62NUjj8goeYkF4nstJ/fqAiIm/hDlMF7JhMtZ4JIQM7kFHolKPU9+pUk0I/wKk/jxe97MSngDRArot02TADuPN71ikohXSJglZ/SqUfhXM=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AS8PR08MB6053.eurprd08.prod.outlook.com (2603:10a6:20b:292::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3784.11; Sat, 23 Jan
 2021 21:04:47 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f1f0:6610:11f5:5e4a]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f1f0:6610:11f5:5e4a%8]) with mapi id 15.20.3784.015; Sat, 23 Jan 2021
 21:04:47 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Subject: [PATCH v8 1/5] iotests: add findtests.py
Date: Sun, 24 Jan 2021 00:04:24 +0300
Message-Id: <20210123210428.27220-2-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210123210428.27220-1-vsementsov@virtuozzo.com>
References: <20210123210428.27220-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [178.176.79.161]
X-ClientProxiedBy: HE1PR05CA0196.eurprd05.prod.outlook.com
 (2603:10a6:3:f9::20) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from kvm.sw.ru (178.176.79.161) by
 HE1PR05CA0196.eurprd05.prod.outlook.com (2603:10a6:3:f9::20) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3784.11 via Frontend Transport; Sat, 23 Jan 2021 21:04:45 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 15940a35-3318-4f07-df11-08d8bfe283d4
X-MS-TrafficTypeDiagnostic: AS8PR08MB6053:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AS8PR08MB60533E82B59A54D9E8112A0CC1BF0@AS8PR08MB6053.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: m5+u+09fQtlT24uuvbG0flUhUUnvebytzquohnWHLnlq5dwGPP2wBDp4xT4tkhOy0NM+VkyHbOGX4TFqiMsImgXiXUso0h2UjZ/jfn8hnAMO/QJVUikvQmPPno/a+TL0igoFM5cba8hOc5+Y9+WnTaW1YcGM6m7iuFFXLqR7MltR0pHao9jT+UTO2mRLEQGx8IqXuIcJYvbSDTANgb4vPWGKx2L3pAbcvuHfNt01o0+1yopEv8Ryqi3HpWB5LO5A3yCKZ9sYlQMH64hYQomZ79hPsQ++tuZ3HJYBE/Yzhc7AyMzJHZt7WtQo5t/QSo7W4jUgQcaHfWfbbyMADFJXtEvbBQ954U35i7n3jyi/DIDyL9IKqtkHfZhE2FZ+FRD0p91WPo3FTyfHZjgCbOx7n0kGlb2N4gs+zgaSPliHHd5nhElxBQaRIpjIvMB5SqGbQ5xMddSpeOeIf36G7eMLpia8sdApmiKnb2BkXxcJG34WqkSYzPB4dVXP/FFC39EDTG7QhCJmMXrdIRQ4BWA/Hdsy4TAc8Ae/rxf/upMmGXsMiW0I6AUUhfu0OxlrYfFo9nRmjarZszncEcjpVDNSKSfLzkRy1+Kc/W4NyKo/PU3ZZ4ARMnF89sp/xTMQg7OFFnq3lnsca0sPejCnesDDVQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(83380400001)(956004)(107886003)(6486002)(186003)(66946007)(66476007)(4326008)(52116002)(5660300002)(1076003)(8936002)(26005)(2906002)(6916009)(6512007)(6666004)(36756003)(8676002)(6506007)(2616005)(498600001)(66556008)(16526019)(86362001)(2004002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?Lj3ZLNJhewOoBSaji7qEkXwF0786xfHe9GF8FyGkTKEzqjU3t/QdEjza3OOt?=
 =?us-ascii?Q?VqtmA8GAbcwubXwNoVlkhNzp80Fftu2bd2Q3M4raRPbXtO2ai7A9q+EU0H5t?=
 =?us-ascii?Q?LsEq8z0oCc/2BfOBvYEq4kZ0hK4xft2GLPRR49yl8rWvdaKjjDr6UhXvd7SA?=
 =?us-ascii?Q?WaDxp1NEfd7n9oLfh5r3RfcmisWa7l1M+GLTrEqZIqOOCZyfTCBM/fUr0cS7?=
 =?us-ascii?Q?8jOcfPsYwKpyUp7W3ZvAOMsph5rXVgyxZavPIKaVWajCZ6MRP2VK8oKRwKui?=
 =?us-ascii?Q?oclOC18+kBBG9m3V0odVPr7/SSwXlPkclsYH+WjWhOi4u+F8dhI5D5iJKxWp?=
 =?us-ascii?Q?D+n7yXoA0LGJEngYS0cZBQy/0cjA1kCzX3jZ+M/zO1FYa/VcEfdd8w6peoQg?=
 =?us-ascii?Q?NU7EW6vstan65K4PlX3SDzg6IZlSCi5KvsqUURIVM47XObMdU1U1airpew4g?=
 =?us-ascii?Q?Rsp59duMa88DwMiFY7qqbD39rDHiPTFVEwQHJzsNSivOZXZOFBZsm9GoVMIP?=
 =?us-ascii?Q?hX+VrmEDH0QpVVgu/9/x/nJ7Yeh7icaLD9Q4Rn1CQJEvJPZICn0MvPxJU9X8?=
 =?us-ascii?Q?xIFVHIMOqibsyJwl8AWQZUmHb2wOtNbTx/X5msJ6WFQfXGAruPm6KYkDnMrk?=
 =?us-ascii?Q?kUQZ3JcihU8kbK0boCo/3T0aKfX2vC4MLQi4FFy+9Z64PpxGpmfqZptZvbLw?=
 =?us-ascii?Q?Ao1Zj1yhcVV736e4rEj05anaElxRTuzNl/73ZZgN9jz6nEXgcQdOE6HaWGs+?=
 =?us-ascii?Q?Ibv1IMgVxiRJk3GbXBAZwrL0OZYz7uXiCsXK9PtCqJmdGXL86w/e+9Dygc4D?=
 =?us-ascii?Q?c3lW29LoiytMhG9ewidIwi58ePm9mHMV5ZTe5MV2iUul1RkHJANMr+G02nyz?=
 =?us-ascii?Q?55wb0L0YENqewWW6F4aJaWwkCRMmR6jH4iB+NQ9HjqwB6k70gUWICNTd7oUI?=
 =?us-ascii?Q?nF1uAjjYs4QJAXdC+qNBAH2nWmRi1LsNzCuIbLXbWgNyRpGOfvdddhT6m6gE?=
 =?us-ascii?Q?je5X?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 15940a35-3318-4f07-df11-08d8bfe283d4
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jan 2021 21:04:47.2118 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /vy+wbkdBttZq+VgfmzINYP6d4a6bKzZ3Z4lBQUxNMHwIRvCTQdePb9tGRVxVCKh911C8ETZDavfTVowpXSlmAr6ORAxmmN9jqkQ4h7Ys5c=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6053
Received-SPF: pass client-ip=40.107.15.139;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR01-DB5-obe.outbound.protection.outlook.com
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
Cc: kwolf@redhat.com, vsementsov@virtuozzo.com, qemu-devel@nongnu.org,
 mreitz@redhat.com, den@openvz.org, jsnow@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Add python script with new logic of searching for tests:

Current ./check behavior:
 - tests are named [0-9][0-9][0-9]
 - tests must be registered in group file (even if test doesn't belong
   to any group, like 142)

Behavior of findtests.py:
 - group file is dropped
 - tests are all files in tests/ subdirectory (except for .out files),
   so it's not needed more to "register the test", just create it with
   appropriate name in tests/ subdirectory. Old names like
   [0-9][0-9][0-9] (in root iotests directory) are supported too, but
   not recommended for new tests
 - groups are parsed from '# group: ' line inside test files
 - optional file group.local may be used to define some additional
   groups for downstreams
 - 'disabled' group is used to temporary disable tests. So instead of
   commenting tests in old 'group' file you now can add them to
   disabled group with help of 'group.local' file
 - selecting test ranges like 5-15 are not supported more
   (to support restarting failed ./check command from the middle of the
    process, new argument is added: --start-from)

Benefits:
 - no rebase conflicts in group file on patch porting from branch to
   branch
 - no conflicts in upstream, when different series want to occupy same
   test number
 - meaningful names for test files
   For example, with digital number, when some person wants to add some
   test about block-stream, he most probably will just create a new
   test. But if there would be test-block-stream test already, he will
   at first look at it and may be just add a test-case into it.
   And anyway meaningful names are better.

This commit doesn't update check behavior (which will be done in
further commit), still, the documentation changed like new behavior is
already here.  Let's live with this small inconsistency for the
following few commits, until final change.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Reviewed-by: Eric Blake <eblake@redhat.com>
---
 docs/devel/testing.rst          |  50 +++++++++-
 tests/qemu-iotests/findtests.py | 159 ++++++++++++++++++++++++++++++++
 2 files changed, 208 insertions(+), 1 deletion(-)
 create mode 100644 tests/qemu-iotests/findtests.py

diff --git a/docs/devel/testing.rst b/docs/devel/testing.rst
index 0aa7a13bba..454b706141 100644
--- a/docs/devel/testing.rst
+++ b/docs/devel/testing.rst
@@ -111,7 +111,7 @@ check-block
 -----------
 
 ``make check-block`` runs a subset of the block layer iotests (the tests that
-are in the "auto" group in ``tests/qemu-iotests/group``).
+are in the "auto" group).
 See the "QEMU iotests" section below for more information.
 
 GCC gcov support
@@ -224,6 +224,54 @@ another application on the host may have locked the file, possibly leading to a
 test failure.  If using such devices are explicitly desired, consider adding
 ``locking=off`` option to disable image locking.
 
+Test case groups
+----------------
+
+"Tests may belong to one or more test groups, which are defined in the form
+of a comment in the test source file. By convention, test groups are listed
+in the second line of the test file, after the "#!/..." line, like this:
+
+.. code::
+
+  #!/usr/bin/env python3
+  # group: auto quick
+  #
+  ...
+
+Another way of defining groups is creating the tests/qemu-iotests/group.local
+file. This should be used only for downstream (this file should never appear
+in upstream). This file may be used for defining some downstream test groups
+or for temporarily disabling tests, like this:
+
+.. code::
+
+  # groups for some company downstream process
+  #
+  # ci - tests to run on build
+  # down - our downstream tests, not for upstream
+  #
+  # Format of each line is:
+  # TEST_NAME TEST_GROUP [TEST_GROUP ]...
+
+  013 ci
+  210 disabled
+  215 disabled
+  our-ugly-workaround-test down ci
+
+Note that the following group names have a special meaning:
+
+- quick: Tests in this group should finish within a few seconds.
+
+- auto: Tests in this group are used during "make check" and should be
+  runnable in any case. That means they should run with every QEMU binary
+  (also non-x86), with every QEMU configuration (i.e. must not fail if
+  an optional feature is not compiled in - but reporting a "skip" is ok),
+  work at least with the qcow2 file format, work with all kind of host
+  filesystems and users (e.g. "nobody" or "root") and must not take too
+  much memory and disk space (since CI pipelines tend to fail otherwise).
+
+- disabled: Tests in this group are disabled and ignored by check.
+
 .. _docker-ref:
 
 Docker based tests
diff --git a/tests/qemu-iotests/findtests.py b/tests/qemu-iotests/findtests.py
new file mode 100644
index 0000000000..d0c72efd6a
--- /dev/null
+++ b/tests/qemu-iotests/findtests.py
@@ -0,0 +1,159 @@
+# TestFinder class, define set of tests to run.
+#
+# Copyright (c) 2020-2021 Virtuozzo International GmbH
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
+import os
+import glob
+import re
+from collections import defaultdict
+from contextlib import contextmanager
+from typing import Optional, List, Iterator, Set
+
+
+@contextmanager
+def chdir(path: Optional[str] = None) -> Iterator[None]:
+    if path is None:
+        yield
+        return
+
+    saved_dir = os.getcwd()
+    os.chdir(path)
+    try:
+        yield
+    finally:
+        os.chdir(saved_dir)
+
+
+class TestFinder:
+    def __init__(self, test_dir: Optional[str] = None) -> None:
+        self.groups = defaultdict(set)
+
+        with chdir(test_dir):
+            self.all_tests = glob.glob('[0-9][0-9][0-9]')
+            self.all_tests += [f for f in glob.iglob('tests/*')
+                               if not f.endswith('.out') and
+                               os.path.isfile(f + '.out')]
+
+            for t in self.all_tests:
+                with open(t) as f:
+                    for line in f:
+                        if line.startswith('# group: '):
+                            for g in line.split()[2:]:
+                                self.groups[g].add(t)
+                            break
+
+    def add_group_file(self, fname: str) -> None:
+        with open(fname) as f:
+            for line in f:
+                line = line.strip()
+
+                if (not line) or line[0] == '#':
+                    continue
+
+                words = line.split()
+                test_file = self.parse_test_name(words[0])
+                groups = words[1:]
+
+                for g in groups:
+                    self.groups[g].add(test_file)
+
+    def parse_test_name(self, name: str) -> str:
+        if '/' in name:
+            raise ValueError('Paths are unsupported for test selection, '
+                             f'requiring "{name}" is wrong')
+
+        if re.fullmatch(r'\d+', name):
+            # Numbered tests are old naming convention. We should convert them
+            # to three-digit-length, like 1 --> 001.
+            name = f'{int(name):03}'
+        else:
+            # Named tests all should be in tests/ subdirectory
+            name = os.path.join('tests', name)
+
+        if name not in self.all_tests:
+            raise ValueError(f'Test "{name}" is not found')
+
+        return name
+
+    def find_tests(self, groups: Optional[List[str]] = None,
+                   exclude_groups: Optional[List[str]] = None,
+                   tests: Optional[List[str]] = None,
+                   start_from: Optional[str] = None) -> List[str]:
+        """Find tests
+
+        Algorithm:
+
+        1. a. if some @groups specified
+             a.1 Take all tests from @groups
+             a.2 Drop tests, which are in at least one of @exclude_groups or in
+                 'disabled' group (if 'disabled' is not listed in @groups)
+             a.3 Add tests from @tests (don't exclude anything from them)
+
+           b. else, if some @tests specified:
+             b.1 exclude_groups must be not specified, so just take @tests
+
+           c. else (only @exclude_groups list is non-empty):
+             c.1 Take all tests
+             c.2 Drop tests, which are in at least one of @exclude_groups or in
+                 'disabled' group
+
+        2. sort
+
+        3. If start_from specified, drop tests from first one to @start_from
+           (not inclusive)
+        """
+        if groups is None:
+            groups = []
+        if exclude_groups is None:
+            exclude_groups = []
+        if tests is None:
+            tests = []
+
+        res: Set[str] = set()
+        if groups:
+            # Some groups specified. exclude_groups supported, additionally
+            # selecting some individual tests supported as well.
+            res.update(*(self.groups[g] for g in groups))
+        elif tests:
+            # Some individual tests specified, but no groups. In this case
+            # we don't support exclude_groups.
+            if exclude_groups:
+                raise ValueError("Can't exclude from individually specified "
+                                 "tests.")
+        else:
+            # No tests no groups: start from all tests, exclude_groups
+            # supported.
+            res.update(self.all_tests)
+
+        if 'disabled' not in groups and 'disabled' not in exclude_groups:
+            # Don't want to modify function argument, so create new list.
+            exclude_groups = exclude_groups + ['disabled']
+
+        res = res.difference(*(self.groups[g] for g in exclude_groups))
+
+        # We want to add @tests. But for compatibility with old test names,
+        # we should convert any number < 100 to number padded by
+        # leading zeroes, like 1 -> 001 and 23 -> 023.
+        for t in tests:
+            res.add(self.parse_test_name(t))
+
+        sequence = sorted(res)
+
+        if start_from is not None:
+            del sequence[:sequence.index(self.parse_test_name(start_from))]
+
+        return sequence
-- 
2.29.2


