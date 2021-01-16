Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D585C2F8D78
	for <lists+qemu-devel@lfdr.de>; Sat, 16 Jan 2021 14:51:29 +0100 (CET)
Received: from localhost ([::1]:45648 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l0lzE-0000hH-SK
	for lists+qemu-devel@lfdr.de; Sat, 16 Jan 2021 08:51:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58258)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1l0ltG-0003Lr-7Z; Sat, 16 Jan 2021 08:45:18 -0500
Received: from mail-eopbgr60109.outbound.protection.outlook.com
 ([40.107.6.109]:49662 helo=EUR04-DB3-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1l0ltD-0007U8-1t; Sat, 16 Jan 2021 08:45:17 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FY0EfBSTJeUgfJZFEtc1Alp9MnsHCGO5v7b1sUjMNqNXLHSynTMmtxZT6e36MK3dHsIJXvIJu1Hn4H/f6jEo3EWoBImLpXDc7emvNNoYnW0ylPC6PM6dONF2IIL9/ZSXVddgaRRIZqLdUl1wtPuUOMP8V2htVlXmAlx2kDPfujfKwqPpsNi8Jpoco/wpIjdCePY8K7RPZni5uTuffdvfsXWCjHoE/6sJmghaWgLE3w+Jk3l5gtQr7qkfEQPksvVQDiAckih2b2OSg9mkwUbQf+3TMGWqQWmnjME7Nhev1hXkbk09yFxrcC7hG0m+2l+KxVAM/PHmsS0ODCF6g+3yHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Coo2ZGUp+Iu/2xclmi0nchlvKaX9xRmg3BaPribk6U4=;
 b=GaWLpZ+L8XhSnzf0JTujtFJoYyjUpw+DxolyuO4KtbI8L/B0aAPVJN1+eyL1NyrKKOwZzxYQoH4EaNfhK5Rw/lkOuRzuWQLqnhuHT87lZ94LxrxBytNodoInYSuS6zqm+/57rjMSnAgONuFOIbZ8A3VFMmUXKRN/0sPpQJ3kTzE+1MetvpA940HgC3s8OL1yag2Df9Vjiy+u74wMq6tUKy2TqJsHbX0Q4XoKJVduxEGT0CgN7ojnLxYN3wUOVLIzabHPtZfNwcjXpUTemkCWBZcS0Ho3rCAT0Fs9Pa8oCIm/k+CH5v+4aWJ3VTmlsWTGLF2c0bUZI+QNIGDnq8x/vw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Coo2ZGUp+Iu/2xclmi0nchlvKaX9xRmg3BaPribk6U4=;
 b=vAKmiyJ/2oy+oCEypZ7KnXQYJWPLYt5uszftPWtq/8SE5PjquAXPyAb/dNkeZJLHSjuMQ7Kt4Qj3fH+i0ikfrt+Iur/Imv6MoHarywo0hlg5l4L31HMyNZdazsiU+MOaeD9qtMzx2mh10K4wGpP8Dj9SNoXEVDOFj6j2iw03M4g=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM5PR0801MB2098.eurprd08.prod.outlook.com (2603:10a6:203:4a::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3763.11; Sat, 16 Jan
 2021 13:45:08 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::214a:3545:368c:7ae8]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::214a:3545:368c:7ae8%9]) with mapi id 15.20.3763.013; Sat, 16 Jan 2021
 13:45:08 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Subject: [PATCH v7 07/11] iotests: add findtests.py
Date: Sat, 16 Jan 2021 16:44:20 +0300
Message-Id: <20210116134424.82867-8-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210116134424.82867-1-vsementsov@virtuozzo.com>
References: <20210116134424.82867-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [185.215.60.72]
X-ClientProxiedBy: AM4PR0701CA0019.eurprd07.prod.outlook.com
 (2603:10a6:200:42::29) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from kvm.sw.ru (185.215.60.72) by
 AM4PR0701CA0019.eurprd07.prod.outlook.com (2603:10a6:200:42::29) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3784.4 via Frontend
 Transport; Sat, 16 Jan 2021 13:45:06 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 90ac79d3-0f2b-42cc-49d2-08d8ba24ef9c
X-MS-TrafficTypeDiagnostic: AM5PR0801MB2098:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM5PR0801MB2098FEE678CEF24A1C03559CC1A60@AM5PR0801MB2098.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: fwEcMYWWh+OBXxTQ9bRt1Sr7iHZTDwzHb70vhjljDBQ039XikpVK2n7s+09/wchOHGoT10ABjqQppXf8wEz1VTSozVRo9Oobo38cMAHhTf/6t3xGo8MOMLcoS+V17SstWA34qG9jNuk9SihUHyC4YaXQQSNwUp9Oy/8okemUhdwfekQOYKVihaaPX7bqwiShKwmlki5QHjKlkAciwG4OJb/1cPH4bjrHtsGYUtrPPh4udNG+3BgBe0ZAhG2XNTPFT5meq+uPnl0Ai+cPu2MDyjn3gFulUppFscfsk6LQQfO+4Dsgg0xAe8Aa9llmw+sdxNWFTBlfhW5rWZOEs4BVGwtlXmplodVGeDvzY92oa3YZadRHoOJMWlmBpTZ88dAWn4HGfRn3kHZqWbDbrmjlA2ZtVViJurD4LlgHoR9FE4rstpx4HppaFKUM5Z35F9ubi6ltaNbWI/Hhxi3z396gU0SBGF6oZ+OSzjpqn09oEMO8okkfkwfUjR3CVDCKPxuIieAexWMZeAsXYAJGas3O2kS/hlRX+t66a/EP08tEZymnN+QG9Hx7IBY/b+t5CCNgzDmUb5rl/Wbxb/d/m1twphpT67zQoqQ+Nwcuf60gVkpJRErHeSIm0npK36LVbB0G6z+c2OxB7MADgN9yRx00QQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(136003)(366004)(376002)(346002)(39830400003)(6916009)(36756003)(83380400001)(66946007)(6666004)(6512007)(86362001)(1076003)(66556008)(5660300002)(6486002)(66476007)(6506007)(478600001)(4326008)(8676002)(8936002)(956004)(2906002)(52116002)(186003)(16526019)(316002)(26005)(2616005)(2004002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?Kqj9sZ6Vjf67suBGeXftsYvUill8pj/fidi4VFLUM87rnOtNA3UXBllpd6Ot?=
 =?us-ascii?Q?34Bi+q5YEFU515hDXiI/5J9bGmPqGaq+9akPc93IKewfdaiTBH+L6vLlTTNk?=
 =?us-ascii?Q?gZWzVU5XzioF9OL0k14XLRphW2yHLcbKqiDxAIZVHkE14E7OURohN09gJ4ib?=
 =?us-ascii?Q?66WGv0ZRBU7dGiyZsHweSZOHixdvvHxU0WEgHPJhqD2khknbyzQ6/lPTP5I1?=
 =?us-ascii?Q?nC0PxFf/NBXu8CRWygKHgMixg5FE62bQ+GsziBpU+TLpAZi+gKoJKFrE8g5/?=
 =?us-ascii?Q?QgSQVrvtB3J2lUy8pF6pyCkj7bc1MqI6W3DY85yUp/4ufNX7sfZtdmbgmqTQ?=
 =?us-ascii?Q?9H57nyqjceVv0aT/XH01STYjuYQnO8GQvBVDGWFe4UxsQa3GqQCoPHDfkY69?=
 =?us-ascii?Q?r1Unvw5XVpc0EHaUpWsOhYeFD03qVCJgkfO1tbgsUnSw5DoCWDvFp6wEasH1?=
 =?us-ascii?Q?sxsZqPBnMFoZ6TadGItGBhqCBNs0CwKrx3mEYSCyvQlNdhMbXQ1+cQYodzM+?=
 =?us-ascii?Q?cKRa8Xg/0Wxmulta3rP0rJjjy3sfUO4rX8hXxn1VdhgNzfEBFq90GvPdvNpy?=
 =?us-ascii?Q?N/7IrqDX8v+p8AsR4OIJoZJ88VdgFxAr5Pn658QMPMlCVXuKJJ2IOpTuSvfe?=
 =?us-ascii?Q?UbqKGLdj+NoXDLt2hzZaFAH841PtDxd9a7PGeFxPrxerxkR0EnBcHdi/JVRK?=
 =?us-ascii?Q?5iQ/gidSa8kPoYc6+pqLWM6KLzu0x7tn3pvVTjDj7umdlMuGGh5gN/ePcbrh?=
 =?us-ascii?Q?yufkuqHUkKJYHWLAmxSSHB8ODZ6HrSvrxjEXpKXFI6hqko1HsebUviX406se?=
 =?us-ascii?Q?lpFrbE0r7UvmJ+qrh6KEIkN+ZGbGEOWLWtttMwOcmGq6GiZw+N2gY45HwgHD?=
 =?us-ascii?Q?mRf0s9H9EuZF29e6E1Mkyd8oXJ1QxjIdi9bM7ZskJGBTjdrGnMR+GlP/l39S?=
 =?us-ascii?Q?+jTWsNbYf5ybv9eEBMewlLQ0YnzPKbyFUjwk1iALIDXgcqhCtt/1IlBBtTiZ?=
 =?us-ascii?Q?/7vy?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 90ac79d3-0f2b-42cc-49d2-08d8ba24ef9c
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jan 2021 13:45:08.2366 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: has1HimhAQ83p1li/auzyaBhve4yT322b1KbZN01dBstSUGyuopgVmzQU5RXyE+z/r5kM4YrJzR8JnWaMB2eY6gJQ6zwdYzqLtz0xNakXXA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR0801MB2098
Received-SPF: pass client-ip=40.107.6.109;
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
Cc: kwolf@redhat.com, vsementsov@virtuozzo.com, jsnow@redhat.com,
 qemu-devel@nongnu.org, mreitz@redhat.com, den@openvz.org
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

This commit don't update check behavior (which will be done in further
commit), still, the documentation changed like new behavior is already
here.  Let's live with this small inconsistency for the following few
commits, until final change.

The file findtests.py is self-executable and may be used for debugging
purposes.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
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
index 0000000000..065ec13125
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
+            raise ValueError('Paths are unsupported for test selecting, '
+                             f'requiring "{name}" is wrong')
+
+        if re.fullmatch(r'\d+', name):
+            # Numbered tests are old naming convetion. We should convert them
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


