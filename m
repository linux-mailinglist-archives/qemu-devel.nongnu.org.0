Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B5C3F302AFF
	for <lists+qemu-devel@lfdr.de>; Mon, 25 Jan 2021 20:02:15 +0100 (CET)
Received: from localhost ([::1]:41192 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l477p-0007mn-KY
	for lists+qemu-devel@lfdr.de; Mon, 25 Jan 2021 14:02:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60826)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1l46xV-0007Tj-TO; Mon, 25 Jan 2021 13:51:29 -0500
Received: from mail-eopbgr140101.outbound.protection.outlook.com
 ([40.107.14.101]:5255 helo=EUR01-VE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1l46xS-0005RE-Tk; Mon, 25 Jan 2021 13:51:29 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=G0cZtP6IyiXU/PhEzlSmmH0r+/+nUpKb/3jxoGyCC44lmX70DBAVfi/9sgHdzXpTR/JRkZteYFIFKk2r0qhjjC4BG4pBr3eUnx3wtIWMfHvheTe0tZAcZffPVytpPLPocZ+6O9fjCNpXTxyTOiOtLgypw2mLem3GevYadkFBFD2AEygAMvJQrU6rBCORU/Ztmnw+3L+kt9w5kW1buk8E3lcARJHL0NSEXE9FGnRz1SnQFLdthJD/vbZZHirHLwAf44jw3uyZcrfZ61WL1C84UjZF6ZSHmV69PeV3dW86uhlMMYEGfrFXDec6MFUpPyZfjo5g+KA+PbbahEtn5gTuQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jZQzbO4hDeG0+fQYXsKT+vDtbDm6eI1MFCPIw/zUxnQ=;
 b=GnRnEaF/9HeQFwm+wPY87AFliOxlHgbWnGkAOWnxHMSGnccwuP6oxqoQqmkGzp4jZYzdmTFSpfXr7lqOnG8elN60McU5K2sqVDziVL9PGwmWqT+K5TY7zGBhIDnk3LJ6DV2IdFnGIVUnq5TKGIT0QhVKzY2ANb6X6Vpccr0kp++SSt78KjEi5JOm001WkMcdR7CmRFiUjj/4aHy95Bc/canXNmzDvR1MqJayfvekDF90XX8R7w6F9Nw+464GjXMoC2dq2+8a3a9E5d4Ae3jgHQh6xF8Tyit5HnMA01WUP+3dhtC40l8u7ybFAbIX5qkZc9f4/yFe8Vh04/Hjzt9mig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jZQzbO4hDeG0+fQYXsKT+vDtbDm6eI1MFCPIw/zUxnQ=;
 b=ZwIB/KTCMIN3LQcwwXhPeYjjUOuyUKQ6pKIgWdCPioL67x81asw/Lydl1QYhO5K7aEuuO2BoFulLQjkhs/czKslzwUsERK+7AgkzIW2ZxEJsgnASZKb6fRVRgThXVQQyRI83L5SJC+Q8kg9rXL7Aipmde7KNCuAmFTukinvk9qU=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB4405.eurprd08.prod.outlook.com (2603:10a6:20b:b7::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3784.15; Mon, 25 Jan
 2021 18:51:16 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f1f0:6610:11f5:5e4a]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f1f0:6610:11f5:5e4a%8]) with mapi id 15.20.3784.019; Mon, 25 Jan 2021
 18:51:16 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Subject: [PATCH v9 2/6] iotests: add findtests.py
Date: Mon, 25 Jan 2021 21:50:52 +0300
Message-Id: <20210125185056.129513-3-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210125185056.129513-1-vsementsov@virtuozzo.com>
References: <20210125185056.129513-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [185.215.60.113]
X-ClientProxiedBy: AM0PR01CA0134.eurprd01.prod.exchangelabs.com
 (2603:10a6:208:168::39) To AM7PR08MB5494.eurprd08.prod.outlook.com
 (2603:10a6:20b:dc::15)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from kvm.sw.ru (185.215.60.113) by
 AM0PR01CA0134.eurprd01.prod.exchangelabs.com (2603:10a6:208:168::39) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3784.12 via Frontend
 Transport; Mon, 25 Jan 2021 18:51:15 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 12a99195-e70e-46de-2760-08d8c16231ed
X-MS-TrafficTypeDiagnostic: AM6PR08MB4405:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR08MB440519BABABC52CAC5E73A80C1BD0@AM6PR08MB4405.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: dReIdRe4v6laZNhU3MFiNfjrIRflOnWl/1ywRB7Z5iC4nJ//Eyq3iAuF/pmrayl2d4XhWQKznVZP9/qXBz1kJXNfL9swRhdfVnBp+NeYTpbitucCYqDRUSOBGol/EN8RwmlxRl8ta/5/8oBRJMKyprcjh3YjMz14VVroe08fgfDNWwNFVyNC2vN0c+uImP5u+Z8a7rv+vo56TPx9Ajhakk32SghxwCPZVtp/SAb2JuuK9yxANXuAEYA97o8XdmCQRYi3yKwOuRCcOCPr3vJwOrFkTxRp77Bq+lilODSOhW6nEpAJH2IgkwborYPO2ZtSN2FRU9Ii2tfW2HbhMSnjqjekEFOYfgZP1z2jhEgw8wyodjZNyFeimPBvrIYRIH1kfIoFwxL93SdR2oPULxz/j+A/R3xMsNsBbOo6YEeaJ6Q24iO3mGFfi7lmPgElRw4FTwHjP4+XndbFnbyU44UlLFEf26Okzc1Ouitr/XpUzHipgczh1fZcD5BDcBqKqHt8Y4IkvBWARaEMivwvkoUj/w==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39840400004)(136003)(366004)(396003)(376002)(346002)(478600001)(2906002)(8676002)(6512007)(83380400001)(6666004)(6506007)(86362001)(5660300002)(36756003)(26005)(186003)(2616005)(16526019)(107886003)(1076003)(66476007)(66946007)(6486002)(52116002)(66556008)(4326008)(956004)(8936002)(316002)(6916009)(2004002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?/yTaVxIz2QQUrGr2dWVEEwwimoPJ60ebmh4laeb/FkWAQ+LrVwZaEqGYmX6H?=
 =?us-ascii?Q?OMcDX4H6cZHeqvg5Yr0sZV2eQWTdVNW6g5Bu+rTpzVwgnYgLQayBj7JBp4Z2?=
 =?us-ascii?Q?zVWqNvjjNUWg7Q6FJ5cO6gpG+Vj4iJRWCMf/2Gvwz6FNm6k28rd3J1Gb4X6u?=
 =?us-ascii?Q?G3ThStrVoEFGQTUWhHEmhjo0nosuFsYt3z344eR09cqCq8PpdOiFETdp0+F3?=
 =?us-ascii?Q?ApNLE5Ho3AW3cwqj+8HD6szjCPXlKHdhztWOV0vlmJtHD813H8tlenU/IUVA?=
 =?us-ascii?Q?aClJG6RZe8ZO6vxB4AeA/u4KZqAwDu9HWviDugxGK4IbtTB6v9zLABubpU2b?=
 =?us-ascii?Q?wZTH/ueoQVUKswdZE5LdSQq5fEgJN38g57cwFioSBkR9FviVNejBEOn7zy/6?=
 =?us-ascii?Q?33WbgP0pD/hQFKv/dwq6mKvTcaAw0qWHg2oBk49CuphxKncIKkRvlPUQo6sx?=
 =?us-ascii?Q?joPzA+hWQRrBrMxSTDP+9f/wNmPE5ovi8hsv8YTYBnoyTatcelw6/0toFwYS?=
 =?us-ascii?Q?I3zPYZukdbhthyXjQLga2+4BgjMX0rRVYv6Gzdt3QK/t8Zqc31LeOfau3kMV?=
 =?us-ascii?Q?A5mnb15Xt1qEZgh4DwMywIVzNPY7pwHbTpdr6nwqDaP92YeySx1lV0r674DA?=
 =?us-ascii?Q?hMgWzBwLAswTaKkjvXZEgMYUc/8r+g5kjUYon7nK0xjb9NKcNi9+/24Ag6aN?=
 =?us-ascii?Q?CuvueY5TRguM0IMCLl18Wd7ySm3q5YZ7eRRP8UGKdWVONYSahfXN/aTALwGm?=
 =?us-ascii?Q?DExKPGpGpq+b03pyxLu+MBQ5o5LvhbQ5NJ/pKTnlgF898C1QXTJjyHZ7mQrK?=
 =?us-ascii?Q?bNS5AqrfNMUYAlbPZGEQT60R0J5m8DzOeFwbmMn4TVpCLC3NnB15UuzsXjS7?=
 =?us-ascii?Q?PpmFOWwaN+X5QfSzHv+RCv7J9VP/sFSPWkizOQ0g+8v6fR/UZKQKapRjRANV?=
 =?us-ascii?Q?DPXz7+C/7VvlqJRZS0vXx7OQ3Oc91RlGEOEKEBjotQZ5ID4ctE0aWdPiTFcu?=
 =?us-ascii?Q?qgy5dcwblsDN3PoUtyL50pbBmOYkjOy4tBYhjcDuMQG4z3BVf14adqeQ2P3Q?=
 =?us-ascii?Q?2jI+yjO3?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 12a99195-e70e-46de-2760-08d8c16231ed
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jan 2021 18:51:16.3209 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HzRLt4ZYRfsorPosnOGC2vbD+oepkSbGyjOLcpOVVzAjPWZxhsTj9joQuL7QbHoJ+yTBkleG9lXJt8bmSBmLRgs+Shx7HKuJfCfOeBAIxdI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4405
Received-SPF: pass client-ip=40.107.14.101;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR01-VE1-obe.outbound.protection.outlook.com
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


