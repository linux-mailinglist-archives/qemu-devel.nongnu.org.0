Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DF73B2EFF81
	for <lists+qemu-devel@lfdr.de>; Sat,  9 Jan 2021 13:38:00 +0100 (CET)
Received: from localhost ([::1]:45186 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kyDVH-0002pK-TL
	for lists+qemu-devel@lfdr.de; Sat, 09 Jan 2021 07:37:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50606)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1kyDL9-0008GS-RT; Sat, 09 Jan 2021 07:27:31 -0500
Received: from mail-am6eur05on2098.outbound.protection.outlook.com
 ([40.107.22.98]:57153 helo=EUR05-AM6-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1kyDL6-00067J-85; Sat, 09 Jan 2021 07:27:31 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BlB7AqOnVFs/DsyD0XDLu6I5VRd1rRJ7+YyScfVzum+8W+Lu6CSPQYpghkQFT6I6HRgJ68t1QczJbcWZgoH2HGudzDq4lH/krgm9aoV2C7XQFWUsY7MJTg/hZmOJrcqlwgSX4KtZkcCd4CY5cNT8Lv4qh2v9T/gHmgaY6N3C01iwy+hWCzicQJ2oEjYZjVFF7ZPsPFAYrjdXUKNdvIIn9jp04xgaKakGH2t/lddBxfWuH1RyJxpupWd0g7Ia495nfkRxTndnrNE4kdM7NMpWyKvfdfghxOVpdR+2DA/XZ0b+hjy7au1Dif4XMpPgzrrzhBBxJ4ZPTAQP5OFPbVjBBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gZvLyqV/CMzjr2V97rK2yuIn0lvCW1RBYlYeN/VT0j4=;
 b=IT9wdYeofmvbVFhkadJEkgzbcOShpyG1+Al+FNniptysek6v3hx1xdKItjsVlJMM465t6VtnKRaTjKbCyZ4ZDJpIR5/xrVUVDe9KXLdv8W9FfKm2rWvgwIDNED1gYeOjMBZaRXKKPsXs4I2hFjkQ76WdTPM//aZCspJoXwA0/tpLvNKxJWgz+VvI3mPhtaDND4nri5Ommwl7LLchGrdQqeloPYmGy32j7dMPtKAkOcWV8Ik8Hs3X2xvIid3zQnGr5IjHeKaXq9PkwybNISo1hCSVX9xAILMsHn0yQngEAKJrjjvGVvmtOIu1LxkFS4xJZXob6rsXavh64J3yN70PCg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gZvLyqV/CMzjr2V97rK2yuIn0lvCW1RBYlYeN/VT0j4=;
 b=I6rBQIelGV40ffgAIL85nBLPvG7/JvBu0Rtf7sky//woDHD6cV5cd76pa8+F10fNMtFkl5HHg5Wd/cADYJLJBxA/pkhU8KBCvjxb5dZEeSWx41mtG4zkmNUALW7gIxC5pXTiGEZ5mqVuC0+2Yxwmbr39IqS9xbmIepFAzi9F6+4=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM5PR0802MB2529.eurprd08.prod.outlook.com (2603:10a6:203:9e::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3742.11; Sat, 9 Jan
 2021 12:27:09 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::214a:3545:368c:7ae8]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::214a:3545:368c:7ae8%7]) with mapi id 15.20.3742.011; Sat, 9 Jan 2021
 12:27:09 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Subject: [PATCH v6 07/11] iotests: add findtests.py
Date: Sat,  9 Jan 2021 15:26:27 +0300
Message-Id: <20210109122631.167314-8-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210109122631.167314-1-vsementsov@virtuozzo.com>
References: <20210109122631.167314-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [185.215.60.119]
X-ClientProxiedBy: AM0PR02CA0217.eurprd02.prod.outlook.com
 (2603:10a6:20b:28f::24) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from kvm.sw.ru (185.215.60.119) by
 AM0PR02CA0217.eurprd02.prod.outlook.com (2603:10a6:20b:28f::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3742.6 via Frontend
 Transport; Sat, 9 Jan 2021 12:27:08 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0e02b79c-4895-4540-d915-08d8b499e25b
X-MS-TrafficTypeDiagnostic: AM5PR0802MB2529:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM5PR0802MB2529E3F967963D6264560C06C1AD0@AM5PR0802MB2529.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: fxUOW1yx4CAaV3cgv2dyRD4qj4VCGRZdv7HuiQDTKHRxCev41aKT0J/0fGJ0Mnk8n4Il41sJ2VKjOWBstzw9ZRP5NMWOj5MdvHNll9BdusUH67IfboMYhs2hmUCxzbpdCCMOXg74zfaZLNgdyLW2G8PGBQFyEGkJY5FBpXHIyrQ4p8jlCOPmbYyWqAFmaxqKeiF+UscxkLue0pqYBaSCpzRTqOsgXMkc9WC4PTDnOBoKiUIBVbfxm/bzaiKDztmBQ80SaYX/zN7xJMv1pvDQ6FPjJZz9us0RilYPejzX+ZGCG3f9zEF6DoO8Fl/1KRzRJ4A++cv3KYAyOqjMiC7r+u0Ehq1KhFCO1LgZs8pzIEStONGFw09jI0nsQwbYCCDpan2Y0XxxPw8+EXDQprM9h3/XuKsR1NDZF1AuTob9apz4mttRAyMMqjgOIDPAheYhlrfhKNc6I/tcD1Ww1yrBnpMdDQCJvlUw3HRjWjzsKkdVW/8IJeYM1QHl+eti6lGrnfnTNevRyJaGggEzhTAc8w==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(346002)(39840400004)(366004)(396003)(376002)(8936002)(6666004)(1076003)(6506007)(52116002)(478600001)(30864003)(2906002)(8676002)(16526019)(5660300002)(186003)(26005)(36756003)(66556008)(66476007)(6916009)(66946007)(2616005)(6486002)(6512007)(4326008)(83380400001)(86362001)(956004)(316002)(2004002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?UOV6j132+oK2i2nlC8KRek7OxeEfcugi6ga5i6uguD3eiPxEFQCKLvbNJiYD?=
 =?us-ascii?Q?uqZ8UMzv+p4kee+BdxQ4uevVnrMrRZIUBL429+THNQPSGoQc4fQfUq0JeRZG?=
 =?us-ascii?Q?+qRCIBhoAhT9DsyHthjMcaJA7RS6ijggT+/jZYeuQwAdrhFshMqQV+5/YCBv?=
 =?us-ascii?Q?AinOQiBA/QPqDwGsRRW1eNTluAxPPaFgIJbjNhvkAcp9JuG5UCktWABKnnob?=
 =?us-ascii?Q?D/4+UGhzlprr4blxT82Sn5PBbZlgihXmXBZwiq6OeJOZgBf8E4oriNwmIr60?=
 =?us-ascii?Q?F10DlGCRR9nLY1dSShHU4Xbrr6jnGwHlY/9EBYBqidtUhLHpOR5Y0RUemjTw?=
 =?us-ascii?Q?HiDIPrg+eSBTEA63HFTrbe6HiqRw3Su51vBWfBT2u8fszESEK4m6O6JP2Ogl?=
 =?us-ascii?Q?GEx/rKL5dsRnKNRWOIfeOeb0bF7SOQklPjSelfLLqrsz9ACgHzqgQ8W1GSQy?=
 =?us-ascii?Q?x1rpeRYv/JP+G0KY5ZI9A0EQEJv7DZY0H4AeMqTTwN+MSXhkTJhNxmBZLuL1?=
 =?us-ascii?Q?OySVfaQvjM3gGi45Y5DiJCFHomkMx0N2C0vuaf6oNGsraWk3yzo+p7RIawWL?=
 =?us-ascii?Q?5KrSasc0GJTNJ+bgEhm5O+RQkON7u7lwBTpj/uhc8HjFStMR701qHNM+0Wwq?=
 =?us-ascii?Q?xdIECDlNlZE8aW1OnrTvEKG3rD/ZEpYINPyrGyHVmG2JA+7e8t7i3SCtYNQc?=
 =?us-ascii?Q?Zwu+zDn1M72Jj+IefvXIzC9dsy2zxW6Gzbw1+F92MJwNpDN/UuMPjZcc+L5V?=
 =?us-ascii?Q?IqYUHqWqSMLnUNqEOvJ1tu8MpqM6WkJLT3Ui5d45qXVOpqh3hNgVdpCDGqbP?=
 =?us-ascii?Q?1U58qojgKsPIAlIrmA8yjw6B5fKHkFikQAGYM4grf8J0EhQ29OVSlKim9B5Y?=
 =?us-ascii?Q?Nm5nVVP5hhQhT0/X4cBQjDLxtg5yVnP2WkwB6jwwYo59pqUnPJ61qB+364T0?=
 =?us-ascii?Q?DzQq6GuJmYECAGeVz8qvmPKmdibaetZYrQg4JTTI483xnVvKB/qwcmOFiA9l?=
 =?us-ascii?Q?ZK0e?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jan 2021 12:27:09.2884 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-Network-Message-Id: 0e02b79c-4895-4540-d915-08d8b499e25b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: asTcmLAef/lipdOIxDodunkronQvTQ/lDFxIvHjrEUwWejFOZ3FD8VlCJTl0iu8mUuspe/4JOkeG8QwbiBrf+9PXJZsVrq//ZjZGFos7Bfg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR0802MB2529
Received-SPF: pass client-ip=40.107.22.98;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR05-AM6-obe.outbound.protection.outlook.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MSGID_FROM_MTA_HEADER=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

This commit don't update check behavior (which will be don in further
commit), still, the documentation changed like new behavior is already
here.  Let's live with this small inconsistency for the following few
commits, until final change.

The file findtests.py is self-executable and may be used for debugging
purposes.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 docs/devel/testing.rst          |  50 ++++++-
 tests/qemu-iotests/findtests.py | 229 ++++++++++++++++++++++++++++++++
 2 files changed, 278 insertions(+), 1 deletion(-)
 create mode 100755 tests/qemu-iotests/findtests.py

diff --git a/docs/devel/testing.rst b/docs/devel/testing.rst
index 0aa7a13bba..bfb6b65edc 100644
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
+Test may belong to some groups, you may define it in the comment inside the
+test. By convention, test groups are listed in the second line of the test
+file, after "#!/..." line, like this:
+
+.. code::
+
+  #!/usr/bin/env python3
+  # group: auto quick
+  #
+  ...
+
+Additional way of defining groups is creating tests/qemu-iotests/group.local
+file. This should be used only for downstream (this file should never appear
+in upstream). This file may be used for defining some downstream test groups
+or for temporary disable tests, like this:
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
+The (not exhaustive) list of groups:
+
+- quick : Tests in this group should finish within some few seconds.
+
+- auto : Tests in this group are used during "make check" and should be
+  runnable in any case. That means they should run with every QEMU binary
+  (also non-x86), with every QEMU configuration (i.e. must not fail if
+  an optional feature is not compiled in - but reporting a "skip" is ok),
+  work at least with the qcow2 file format, work with all kind of host
+  filesystems and users (e.g. "nobody" or "root") and must not take too
+  much memory and disk space (since CI pipelines tend to fail otherwise).
+
+- disabled : Tests in this group are disabled and ignored by check.
+
 .. _docker-ref:
 
 Docker based tests
diff --git a/tests/qemu-iotests/findtests.py b/tests/qemu-iotests/findtests.py
new file mode 100755
index 0000000000..b053db48e8
--- /dev/null
+++ b/tests/qemu-iotests/findtests.py
@@ -0,0 +1,229 @@
+#!/usr/bin/env python3
+#
+# Parse command line options to define set of tests to run.
+#
+# Copyright (c) 2020 Virtuozzo International GmbH
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
+import sys
+import glob
+import argparse
+import re
+from collections import defaultdict
+from contextlib import contextmanager
+from typing import Optional, List, Tuple, Iterator, Set
+
+
+@contextmanager
+def chdir(path: Optional[str] = None) -> Iterator:
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
+    _argparser = None
+    @classmethod
+    def get_argparser(cls) -> argparse.ArgumentParser:
+        if cls._argparser is not None:
+            return cls._argparser
+
+        p = argparse.ArgumentParser(description="= test selecting options =",
+                                    add_help=False, usage=argparse.SUPPRESS)
+
+        p.add_argument('-g', '--groups', metavar='group1,...',
+                       help='include tests from these groups')
+        p.add_argument('-x', '--exclude-groups', metavar='group1,...',
+                       help='exclude tests from these groups')
+        p.add_argument('--start-from', metavar='TEST',
+                       help='Start from specified test: make sorted sequence '
+                       'of tests as usual and then drop tests from the first '
+                       'one to TEST (not inclusive). This may be used to '
+                       'rerun failed ./check command, starting from the '
+                       'middle of the process.')
+        p.add_argument('tests', metavar='TEST_FILES', nargs='*',
+                       help='tests to run')
+
+        cls._argparser = p
+        return p
+
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
+
+    def add_group_file(self, fname: str):
+        with open(fname) as f:
+            for line in f:
+                line = line.strip()
+
+                if (not line) or line[0] == '#':
+                    continue
+
+                words = line.split()
+                test_file = words[0]
+                groups = words[1:]
+
+                if test_file not in self.all_tests:
+                    print(f'Warning: {fname}: "{test_file}" test is not found.'
+                          ' Skip.')
+                    continue
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
+            exclude_groups.append('disabled')
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
+
+    def find_tests_argv(self, argv: List[str]) -> Tuple[List[str], List[str]]:
+        """Returns tuple of tests list and remaining arguments list"""
+        args, remaining = self.get_argparser().parse_known_args(argv)
+
+        if args.groups is not None:
+            args.groups = args.groups.split(',')
+
+        if args.exclude_groups is not None:
+            args.exclude_groups = args.exclude_groups.split(',')
+
+        return self.find_tests(**vars(args)), remaining
+
+
+def find_tests(argv, test_dir: Optional[str] = None) -> Tuple[List[str],
+                                                              List[str]]:
+    """Returns tuple of tests list and remaining arguments list"""
+    tf = TestFinder(test_dir)
+
+    if test_dir is None:
+        group_local = 'group.local'
+    else:
+        group_local = os.path.join(test_dir, 'group.local')
+    if os.path.isfile(group_local):
+        tf.add_group_file(group_local)
+
+    return tf.find_tests_argv(argv)
+
+
+if __name__ == '__main__':
+    if len(sys.argv) == 2 and sys.argv[1] in ['-h', '--help']:
+        TestFinder.get_argparser().print_help()
+        exit()
+
+    tests, remaining_argv = find_tests(sys.argv[1:])
+    print('\n'.join(tests))
+    if remaining_argv:
+        print('\nUnhandled options: ', remaining_argv)
-- 
2.29.2


