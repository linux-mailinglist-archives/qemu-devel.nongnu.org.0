Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EC642EFF72
	for <lists+qemu-devel@lfdr.de>; Sat,  9 Jan 2021 13:32:28 +0100 (CET)
Received: from localhost ([::1]:59428 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kyDPv-0004xF-FW
	for lists+qemu-devel@lfdr.de; Sat, 09 Jan 2021 07:32:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50476)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1kyDKz-0007yA-AM; Sat, 09 Jan 2021 07:27:22 -0500
Received: from mail-eopbgr60116.outbound.protection.outlook.com
 ([40.107.6.116]:64990 helo=EUR04-DB3-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1kyDKt-00067G-HX; Sat, 09 Jan 2021 07:27:21 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=V4+H9YaYwI20mZ6S2mDmHPMxjFQMHzljVPejI9in/05vI+FCncnulHKluZWrJY317i2arhtsmgO6eMGZ8gecUcSkE1CR9rnl7sF3v5rGe4uuKdoRe6kaUx9xO+hpoRaEqOgy7/cM2sEJjQadY0vIWO7LdmSI3PA4CRBdf9lSkXJpubOqDYBsjKzYPKsGEEnU9HaI4Lcztciw4xfPjITqDwjJrTzrXBEaBOIwQRicct31CLd1QtYy00YtrP5DcwNx8pMGCSg9hKLn7ewg+QDPAsq9fFHbBz4fTAQp+Ey4HnJ8thdBdEbuTFoGHvS1XgsARomSRy3dHnWqy4QhMsuxCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Qk3fwmLe+JggtZYR+5DQGJe9BsbyiQtFVkqH5DgJTZA=;
 b=BTh79EqUPbgc7f1dt/h74IP0c4QAxIokKj42dTQU6nJCHF8LHNJPOaD1Ulft5wxfwuetVeCxRpeynto/T7cmi6vzI3of1mkIpoc7ArQ8P9eVDPWtXIagbKPOLE9RRy7ISqC2Df31tHcwUxiVTUk+0GoryE2fn64JJtfork/Y23ZIptgdcYJ0cxQfeMGG8GgdkSL5HdVZBrYUfOKxsZqclqFq+WjIhlTSzHXifaNTOAuirRgTYLMPkr9cCPdlFWGkLbDf1c8CxYrEZWYK+NjEf1oF5bK4VtL513Cx4SXB+Haobmt5zEM9AL2m7vz3OGs6/3upwfyOuMuECFdIpIknkQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Qk3fwmLe+JggtZYR+5DQGJe9BsbyiQtFVkqH5DgJTZA=;
 b=jxogs4dqNPHy+i7dArDh6GEgW7jYh3PtRNqU2kcJQ9z9Un7Vp+cFhGKRB6vqo8PJ0MxJn/vi1fXc3ocTVgcGsduckw2crsVqOb6AGDtItEEv3hCPSSY3tleG8W1NkXqTMKNMVYaA7eZW9FL3NUWdX0fVTrItKXGQfSxM7VAKEFE=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB4168.eurprd08.prod.outlook.com (2603:10a6:20b:aa::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3742.6; Sat, 9 Jan
 2021 12:27:11 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::214a:3545:368c:7ae8]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::214a:3545:368c:7ae8%7]) with mapi id 15.20.3742.011; Sat, 9 Jan 2021
 12:27:10 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Subject: [PATCH v6 09/11] iotests: add testrunner.py
Date: Sat,  9 Jan 2021 15:26:29 +0300
Message-Id: <20210109122631.167314-10-vsementsov@virtuozzo.com>
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
 Transport; Sat, 9 Jan 2021 12:27:10 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 706c8728-9897-4660-b7bc-08d8b499e346
X-MS-TrafficTypeDiagnostic: AM6PR08MB4168:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR08MB4168CB692D5EC379FC07ACF2C1AD0@AM6PR08MB4168.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5236;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: EujxbLORLrXCcchdhoMIJeLqZx9L974BtFjuwXyVBStbntnJYPinF8bhiyGaCncXRH+VFOmQKSCPO6IiIGnl0J9wD5kOuHrzt6GlfzipRAPgy9nQ34VFHkYjE6ikTJ7oxpj1Oh6j3pdYgXmVpTsV/tfGvccKgCoosXeXe94F+BEKnVLcOfhrwzrWCu06WCgUVTKhP6ZAZlVUdOSQ7S1OEsUu1AAZdiiSm0Aozho9bAZa5dwXHp38zOfj+Ysegd6J8jHjE8I71jf10ps4nMmdPoWyxbUSpJlhd8+jsILYQD71W+bIh/gKLRBcMAiRA/R5X9dJsu8JGDzbm8k2uXQtj2J8UUSqU2nwRX3kgX2xfQZxKthH1lkdb5nzm5EHhNfIAY0Grjo25WFqby+X9ZwVy0fo8qFeNwz7j4/TJqX+F/RarSkaXs4mY9XR5LlAiWb8X8S+02r7jUKOsS3k9AH1U1DeZzFAQ2uaheFRUMXTkRsXKG1aXRwbd5oFWid0vk7ciaKJrZLTBk2VFbPU9PTXYw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(376002)(346002)(136003)(396003)(39840400004)(66556008)(1076003)(316002)(66476007)(66946007)(8936002)(6916009)(52116002)(6666004)(83380400001)(26005)(478600001)(36756003)(4326008)(16526019)(6506007)(6512007)(86362001)(2906002)(6486002)(8676002)(956004)(2616005)(30864003)(186003)(5660300002)(2004002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?tM78l+D/JwORq1crF5GC63WTTMzMi7YFIeP8jQYGUHptbnSv19okaDNx5oT/?=
 =?us-ascii?Q?u3ZGsdepem9M0lHx6qCqqEbotKymMhO+MDLaeIowaC6UXXqAqPOBhrezi1yl?=
 =?us-ascii?Q?3tIut9KvChGm4UUTFgrTq1GE3sErFd3c1+LgWS6jhVLZwdz9iTP8SlWv7mxH?=
 =?us-ascii?Q?G+ZPaEPTQ51q9uetUlscg5gPIztkQmwgssVVmNcQpq3veaIJuwYnzJ8hPIi6?=
 =?us-ascii?Q?KF99XD22DH4tc+ObIeKRgHHz1TtYXzLNCQLBzSIGxhZX/jxobKgieRIwzmcF?=
 =?us-ascii?Q?n8Aft9sNWNi1d0kDKgeFC0vHqieNuJawrBW3aGWSHf5HmqBRJ+ylkupmYeYh?=
 =?us-ascii?Q?GrBSatpeqmCBCn9g1tyQYdIhyhin5vrzerylvPcXippsL2QvLeGw4wDvYZa+?=
 =?us-ascii?Q?iGKpTJRA1tvmUqaLpkmEaQK39hOX/YXfZlZQ1dWXzGYbcG/Iz8T9IxC6p6q/?=
 =?us-ascii?Q?fJLAW5niEo9xOhKZCfL9P3N+aHD58GWE+xeXX+8Pe/M9cA45C6XrKlD8LE/F?=
 =?us-ascii?Q?S3cTCBPI3bB4JvMX9KBhKSl3R0dEmHy6gAKV59OYmNHPrBXPTjX5BVkna36t?=
 =?us-ascii?Q?8vF2d7oanUgsCkVYfzE+1yh7+lCnwUN7g6Mn5JStSWSqOVolZC4natoGL5EH?=
 =?us-ascii?Q?6vY9QG68ltN2/x/M01zlSYr/G4ZhkR7OpF54/O2Cb4aQa00Mwn3oFte3BK2d?=
 =?us-ascii?Q?6NZ99wPd+EWmeSZ4YCNybheAmgCS5Z4oQioKdyG2ZiGVEi8uPpROQfGNv/vH?=
 =?us-ascii?Q?hpeVZAQlOCxUuf0ZEklmnrKUSJVHX0dpsg5IjV7CeUjspHvIWdPL/LPUpWS5?=
 =?us-ascii?Q?20zkDR4k8oMqxLntk6UG/yXnnJZ5TjHSDfwTATVgdjzIcmL+0k+mZtZl0Zp8?=
 =?us-ascii?Q?ZCbYxOQ9yvG6nXnZRCBicQ52HmcUr5pDOyoWa/LVXTa2ocl8DZczfNJYfZzl?=
 =?us-ascii?Q?OauvwgM8Augwo454Luum8zO3U5D5GZV3K5qKdo2i3wGNtENqJPMrvLk4+96S?=
 =?us-ascii?Q?2e4I?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jan 2021 12:27:10.8665 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-Network-Message-Id: 706c8728-9897-4660-b7bc-08d8b499e346
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: z5QsuN1k89/coErPaBLruXVQVcBAfQ/ArMRjTk+Z7M0UYTF6KYsKSJtFfFtsE4MGSGGFNLR1FkuL3weuyCPFSoPbP0Vtmqp3awkvpctIIyw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4168
Received-SPF: pass client-ip=40.107.6.116;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR04-DB3-obe.outbound.protection.outlook.com
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

Add TestRunner class, which will run tests in a new python iotests
running framework.

There are some differences with current ./check behavior, most
significant are:
- Consider all tests self-executable, just run them, don't run python
  by hand.
- Elapsed time is cached in json file
- Elapsed time precision increased a bit
- use python difflib instead of "diff -w", to ignore spaces at line
  ends strip lines by hand. Do not ignore other spaces.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 tests/qemu-iotests/testrunner.py | 351 +++++++++++++++++++++++++++++++
 1 file changed, 351 insertions(+)
 create mode 100644 tests/qemu-iotests/testrunner.py

diff --git a/tests/qemu-iotests/testrunner.py b/tests/qemu-iotests/testrunner.py
new file mode 100644
index 0000000000..e395877882
--- /dev/null
+++ b/tests/qemu-iotests/testrunner.py
@@ -0,0 +1,351 @@
+# Class for actual tests running.
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
+import random
+from pathlib import Path
+import datetime
+import time
+import difflib
+import subprocess
+import collections
+import contextlib
+import json
+import argparse
+import termios
+import sys
+from contextlib import contextmanager
+from typing import List, Optional, Iterator
+
+from testenv import TestEnv
+
+
+def silent_unlink(path: Path) -> None:
+    try:
+        path.unlink()
+    except OSError:
+        pass
+
+
+def file_diff(file1: str, file2: str) -> List[str]:
+    with open(file1) as f1, open(file2) as f2:
+        # We want to ignore spaces at line ends. There are a lot of mess about
+        # it in iotests.
+        # TODO: fix all tests to not produce extra spaces, fix all .out files
+        # and use strict diff here!
+        seq1 = [line.rstrip() for line in f1]
+        seq2 = [line.rstrip() for line in f2]
+        return list(difflib.unified_diff(seq1, seq2, file1, file2))
+
+
+# We want to save current tty settings during test run,
+# since an aborting qemu call may leave things screwed up.
+@contextmanager
+def savetty() -> Iterator:
+    isterm = sys.stdin.isatty()
+    if isterm:
+        fd = sys.stdin.fileno()
+        attr = termios.tcgetattr(0)
+
+    try:
+        yield
+    finally:
+        if isterm:
+            termios.tcsetattr(fd, termios.TCSADRAIN, attr)
+
+
+class LastElapsedTime:
+    """ Cache for elapsed time for tests, to show it during new test run
+
+    Use get() in any time. But, if use update you should then call save(),
+    or use update() inside with-block.
+    """
+    def __init__(self, cache_file: str, env: TestEnv) -> None:
+        self.env = env
+        self.cache_file = cache_file
+
+        try:
+            with open(cache_file) as f:
+                self.cache = json.load(f)
+        except (OSError, ValueError):
+            self.cache = {}
+
+    def get(self, test: str,
+            default: Optional[float] = None) -> Optional[float]:
+        if test not in self.cache:
+            return default
+
+        if self.env.imgproto not in self.cache[test]:
+            return default
+
+        return self.cache[test][self.env.imgproto].get(self.env.imgfmt,
+                                                       default)
+
+    def update(self, test: str, elapsed: float) -> None:
+        d = self.cache.setdefault(test, {})
+        d = d.setdefault(self.env.imgproto, {})
+        d[self.env.imgfmt] = elapsed
+
+    def save(self) -> None:
+        with open(self.cache_file, 'w') as f:
+            json.dump(self.cache, f)
+
+    def __enter__(self) -> 'LastElapsedTime':
+        return self
+
+    def __exit__(self, *args) -> None:
+        self.save()
+
+
+TestResult = collections.namedtuple(
+    'TestResult',
+    ['status', 'description', 'elapsed', 'diff', 'casenotrun'],
+    defaults=('', '', '', ''))
+
+
+class TestRunner:
+    _argparser = None
+    @classmethod
+    def get_argparser(cls) -> argparse.ArgumentParser:
+        if cls._argparser is not None:
+            return cls._argparser
+
+        p = argparse.ArgumentParser(description="= test running options =",
+                                    add_help=False, usage=argparse.SUPPRESS)
+
+        p.add_argument('-makecheck', action='store_true',
+                       help='pretty print output for make check')
+
+        cls._argparser = p
+        return p
+
+    def __init__(self, argv: List[str], env: TestEnv) -> None:
+        self.env = env
+        self.test_run_env = self.env.get_env()
+        if 'MALLOC_PERTURB_' not in os.environ and \
+                'MALLOC_PERTURB_' not in self.test_run_env:
+            x = random.randrange(1, 255)
+            self.test_run_env['MALLOC_PERTURB_'] = str(x)
+
+        args, self.remaining_argv = self.get_argparser().parse_known_args(argv)
+        self.makecheck = args.makecheck
+
+        self.last_elapsed = LastElapsedTime('.last-elapsed-cache', env)
+
+    def __enter__(self) -> 'TestRunner':
+        self._stack = contextlib.ExitStack()
+        self._stack.enter_context(self.env)
+        self._stack.enter_context(self.last_elapsed)
+        self._stack.enter_context(savetty())
+        return self
+
+    def __exit__(self, *args) -> None:
+        self._stack.close()
+
+    def test_print_one_line(self, test: str, starttime: str,
+                            endtime: Optional[str] = None, status: str = '...',
+                            lasttime: Optional[float] = None,
+                            thistime: Optional[str] = None,
+                            description: str = '',
+                            test_field_width: Optional[int] = None,
+                            end: str = '\n') -> None:
+        """ Print short test info before/after test run """
+        test = os.path.basename(test)
+
+        if test_field_width is None:
+            test_field_width = 8
+
+        if self.makecheck and status != '...':
+            if status and status != 'pass':
+                status = f' [{status}]'
+            else:
+                status = ''
+
+            print(f'  TEST   iotest-{self.env.imgfmt}: {test}{status}')
+            return
+
+        if lasttime:
+            lasttime_s = f' (last: {lasttime}s)'
+        else:
+            lasttime_s = ''
+        if thistime:
+            thistime = f'{thistime:.1f}s'
+        else:
+            thistime = '...'
+
+        if endtime:
+            endtime = f'[{endtime}]'
+        else:
+            endtime = ''
+
+        if status == 'pass':
+            col = '\033[32m'
+        elif status == 'fail':
+            col = '\033[1m\033[31m'
+        elif status == 'not run':
+            col = '\033[33m'
+        else:
+            col = ''
+
+        col_end = '\033[0m'
+
+        print(f'{test:{test_field_width}} {col}{status:10}{col_end} '
+              f'[{starttime}] {endtime:13}{thistime:5} {lasttime_s:14} '
+              f'{description}', end=end)
+
+    def find_reference(self, test: str) -> str:
+        if self.env.cachemode == 'none':
+            ref = f'{test}.out.nocache'
+            if os.path.isfile(ref):
+                return ref
+
+        ref = f'{test}.out.{self.env.imgfmt}'
+        if os.path.isfile(ref):
+            return ref
+
+        ref = f'{test}.{self.env.qemu_default_machine}.out'
+        if os.path.isfile(ref):
+            return ref
+
+        return f'{test}.out'
+
+    def do_run_test(self, test: str) -> TestResult:
+        f_test = Path(test)
+        f_bad = Path(f_test.name + '.out.bad')
+        f_notrun = Path(f_test.name + '.notrun')
+        f_casenotrun = Path(f_test.name + '.casenotrun')
+        f_reference = Path(self.find_reference(test))
+
+        if not f_test.exists():
+            return TestResult(status='fail',
+                              description=f'No such test file: {f_test}')
+
+        if not os.access(str(f_test), os.X_OK):
+            exit(f'Not executable: {f_test}')
+
+        if not f_reference.exists():
+            return TestResult(status='fail',
+                              description='No qualified output '
+                                          f'(expected {f_reference})')
+
+        for p in (f_bad, f_notrun, f_casenotrun):
+            silent_unlink(p)
+
+        args = [str(f_test.resolve())]
+        if self.env.debug:
+            args.append('-d')
+
+        env = os.environ.copy()
+        env.update(self.test_run_env)
+
+        t0 = time.time()
+        with f_bad.open('w') as f:
+            ret = subprocess.run(args, cwd=str(f_test.parent), env=env,
+                                 stdout=f, stderr=subprocess.STDOUT).returncode
+        elapsed = round(time.time() - t0, 1)
+
+        if ret != 0:
+            return TestResult(status='fail', elapsed=elapsed,
+                              description=f'failed, exit status {ret}',
+                              diff=file_diff(str(f_reference), str(f_bad)))
+
+        if f_notrun.exists():
+            return TestResult(status='not run', elapsed=elapsed,
+                              description=f_notrun.read_text().strip())
+
+        casenotrun = None
+        if f_casenotrun.exists():
+            casenotrun = f_casenotrun.read_text()
+
+        diff = file_diff(str(f_reference), str(f_bad))
+        if diff:
+            return TestResult(status='fail', elapsed=elapsed,
+                              description='output mismatch (see {f_bad})',
+                              diff=diff, casenotrun=casenotrun)
+        else:
+            f_bad.unlink()
+            self.last_elapsed.update(test, elapsed)
+            return TestResult(status='pass', elapsed=elapsed,
+                              casenotrun=casenotrun)
+
+    def run_test(self, test: str,
+                 test_field_width: Optional[int] = None) -> TestResult:
+        last_el = self.last_elapsed.get(test)
+        start = datetime.datetime.now().strftime('%H:%M:%S')
+
+        self.test_print_one_line(test=test, starttime=start, lasttime=last_el,
+                                 end='\r', test_field_width=test_field_width)
+
+        res = self.do_run_test(test)
+
+        end = datetime.datetime.now().strftime('%H:%M:%S')
+        self.test_print_one_line(test=test, status=res.status,
+                                 starttime=start, endtime=end,
+                                 lasttime=last_el, thistime=res.elapsed,
+                                 description=res.description,
+                                 test_field_width=test_field_width)
+
+        if res.casenotrun:
+            print(res.casenotrun)
+
+        return res
+
+    def run_tests(self, tests: List[str]) -> None:
+        n_run = 0
+        failed = []
+        notrun = []
+        casenotrun = []
+
+        if not self.makecheck:
+            self.env.print_env()
+            print()
+
+        test_field_width = max(len(os.path.basename(t)) for t in tests) + 2
+
+        for t in tests:
+            name = os.path.basename(t)
+            res = self.run_test(t, test_field_width=test_field_width)
+
+            assert res.status in ('pass', 'fail', 'not run')
+
+            if res.casenotrun:
+                casenotrun.append(t)
+
+            if res.status != 'not run':
+                n_run += 1
+
+            if res.status == 'fail':
+                failed.append(name)
+                if self.makecheck:
+                    self.env.print_env()
+                if res.diff:
+                    print('\n'.join(res.diff))
+            elif res.status == 'not run':
+                notrun.append(name)
+
+        if notrun:
+            print('Not run:', ' '.join(notrun))
+
+        if casenotrun:
+            print('Some cases not run in:', ' '.join(casenotrun))
+
+        if failed:
+            print('Failures:', ' '.join(failed))
+            print(f'Failed {len(failed)} of {n_run} iotests')
+        else:
+            print(f'Passed all {n_run} iotests')
-- 
2.29.2


