Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B71F302AEB
	for <lists+qemu-devel@lfdr.de>; Mon, 25 Jan 2021 19:59:28 +0100 (CET)
Received: from localhost ([::1]:37118 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l475D-00061I-A4
	for lists+qemu-devel@lfdr.de; Mon, 25 Jan 2021 13:59:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60936)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1l46xY-0007ZK-Ql; Mon, 25 Jan 2021 13:51:32 -0500
Received: from mail-vi1eur05on2101.outbound.protection.outlook.com
 ([40.107.21.101]:34720 helo=EUR05-VI1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1l46xV-0005Oj-8u; Mon, 25 Jan 2021 13:51:32 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fi/yCZbtuFfwnoWp3fETUBll6Ao6yUZXuNmdx6PtxZar0Cq/8Kf/tfEgurFMEmb6sZxBc+tymUtJFxamTs2UuuN/cxJJLB5gY4GODcEpBP8vLYC3qcy0NaXzwG8DEj/Y/deKewufNjAEpZuErbyfpzCg6zf3/B8X0oXG8hXJzTK1ouxZIRN+tE4ED2nwmWAh+P3I9f2+QoZvK8SeTcns++b7MKKZukOciLfGHHQQnQKA7wzuG2Ud0PyCJAQrRTLpdEwkv0PbAiUww/oAImHH2Sx6NUOtPAW2GP4C4Xgpbd2CKlwNtVzzVZt8NtiT1/M6j0rwnfXFZD1OODtwkezdsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=j3BJxQvAjlZ2m8dAfjL/YBvPz8v7FSYQLMO3Tl48gFY=;
 b=H5DbIiuFglMDxE8UwfMeF8F/EhoPh8x8juQB4NYcvVIsJl8D1OzWQW9+EcEUJc8QUeqJGv3EIRtLgCpWWsGMbixkaF299Kt1iLjbE7BgA5ClzcowWk1SWfFOLe/TU3e7KIQsgED1I01VjrVcwBsCEZVI4md4hLneB8iecJZJi1Ol36wCaRIomH5xwakPrBahitPWu6guFZypDq/k8TGSv43ENhOlUaNYeitWCauT5unljBytt0Li5Woe03+b/ujEh4olddYW5KTOUsjSFFwIqsi6CBIZ1HbCNB5/PGmr1OnhS8yKlfHgpdt74fsEYBfzUYNCgMWuFAVGzuucvc7+kg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=j3BJxQvAjlZ2m8dAfjL/YBvPz8v7FSYQLMO3Tl48gFY=;
 b=V+8QuAKieaaTW0WajyK/xX8SIj0AfPv6vwnswS38JuLKCU3Tr7aAv88I0+u3ax1PvjaAcx/AXviusTKsyVH3kmrtaNnOnCGMJKCm91o0beFAaeQHtNEDjgwTOOFjotvrlQo38pRsLcLAWCXUGFREjzUBiPYVuYPIomC9wQIW+wM=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM6PR08MB4405.eurprd08.prod.outlook.com (2603:10a6:20b:b7::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3784.15; Mon, 25 Jan
 2021 18:51:18 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f1f0:6610:11f5:5e4a]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f1f0:6610:11f5:5e4a%8]) with mapi id 15.20.3784.019; Mon, 25 Jan 2021
 18:51:18 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Subject: [PATCH v9 4/6] iotests: add testrunner.py
Date: Mon, 25 Jan 2021 21:50:54 +0300
Message-Id: <20210125185056.129513-5-vsementsov@virtuozzo.com>
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
 Transport; Mon, 25 Jan 2021 18:51:17 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3bb02d58-6fdc-45e2-8c0b-08d8c16232f1
X-MS-TrafficTypeDiagnostic: AM6PR08MB4405:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR08MB44056AB25D29269598A51853C1BD0@AM6PR08MB4405.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5797;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 7m3aaZxImN0WQMYAoNaC+cnTLOsCrJ0HtLgCZRGLhEwveaxEQ+ZnCjQKs2kBJZWZw5KeKGldGYOcDcyEWB21npJ6fBbH/UVsdKlHLvDV4mQ42lMYiGG5SMNh5QVX19DQqlwc0aM3JRFZoKbGS/ZP7A7LFnoNq0rgUSldCsereZ9itexvYlkP0HF3fg1So11PAXDkn9flIrODqFFlMQcpqUNiw6Hn4VhQUL4FCWYor6Zv2gac6DjZTjBS8A0Cu2tD7UaGcrjxVdpNphvwRt1+gfsxkEE3RmYoGo2zPVs/Qb1wv3Sh02XXenlxTzm1wdpv+y0siOWHhO9iGax7YUY+d3bLMLFT+7o4ddqvrxxtDVKxSUtDalzx3Njnwz228cbR7fsXCwQW3FruylRr6M1IKTjXxv2G0jQo8PDSz0WKpAO4+jkpIokA7o975cwqpx/Mv7kejOE82w8R8dYtP6B9wrgqV9w+PJVUkpyJ1yldHviKekuZ0nRCRv3zohFN6BZVov5+OeuMP2MQrrOeapaiIw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39840400004)(136003)(366004)(396003)(376002)(346002)(478600001)(2906002)(8676002)(6512007)(83380400001)(6666004)(6506007)(86362001)(5660300002)(36756003)(26005)(186003)(2616005)(16526019)(107886003)(1076003)(66476007)(66946007)(6486002)(30864003)(52116002)(66556008)(4326008)(956004)(8936002)(316002)(6916009)(2004002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?wFeGFPBzkVdPkbcYvzyKksLoxfp0Zti+/5ns15v5pLUO0CeBMCzKpIkI6ibP?=
 =?us-ascii?Q?LPvKj+hHX/m26NA39DgPIn7AKuQ9QMUCXLWHv5g6vnb+EGQCdD6D0BE6JHcl?=
 =?us-ascii?Q?BUF/gGZHE6ibhGRtNbODrQYkBRMzCBcQEXoONFu5AqZmypiL4wFSfNd8KBIN?=
 =?us-ascii?Q?TPB+gU3Vj+ccoSC/R+/BYBU69lKLc6MBHaiWPWuVKvQUNx5qDP5C5aGf2jzf?=
 =?us-ascii?Q?l2MKMChdcBtifAjoRmQUJiP2C8+teiV/A+NZ66XuxQOLq9CFNCJgL4SzV5nG?=
 =?us-ascii?Q?KePsNyEJ0L0ND5mtCS9VXx28UY7vAN/iJvrer+xXd1cXShoNjx9K0rdOBbPC?=
 =?us-ascii?Q?/I09768Ve9a/4a1hIwfQHqsauMGg8f36V4Ra1zIg3n9mNNyVO6/TOX+Pt5UY?=
 =?us-ascii?Q?YarxbpnRM2+6856WUWbcw4SLf2TrhNO50JRygGKIjJ0i8+3O7I9JI5ePD0Lk?=
 =?us-ascii?Q?40kZrkP09Ynd6jmF6RKfoEn3241jetgMUz0KuY7du/0AxY0Fn8F0k67BAN+J?=
 =?us-ascii?Q?AO4BETJuZSVAdJge473pHnSFbQF7+HZG9tsLDM2pBcrCBiwA9S6AdOpp/McN?=
 =?us-ascii?Q?NtLOsvGkhnvYuY//+pDVUvPUdaNgtg3HPozCw1vzoUafRm52l3lQ2w50PHNs?=
 =?us-ascii?Q?pXqorGSgr5UdjOkBX2pSWIb4QYjtWutfPdChicJDUNfAreY6DjBEVGz/sE1K?=
 =?us-ascii?Q?MqASKgJbW0JIbCdQzCN5xtPdd9YC1hRhGLuUlcZVJnDEIiG34UzeSLuro4rv?=
 =?us-ascii?Q?Uf/fXEvpzEwuM14ALr3K4QuYtQSYF/oZJr/L14vgoqeIneEqUwZnsGqGyhAZ?=
 =?us-ascii?Q?YQOcU0GruXxVTq2cGhP83BVE0dZ+0w6pE3AVkw1vxDoGR7PqVRX04PM0aWMV?=
 =?us-ascii?Q?+QoM9hS8nxG9SJnppjptDtyi5x6pmujQvBk7cYfu9P5F8CTVsSuMhHhorNLt?=
 =?us-ascii?Q?tRHvMpVpusZKjgQqS2ceGa3Xbn34MwHaAQzg2RqWPDEeYrWtqOFHTuDX85MH?=
 =?us-ascii?Q?Za7rIpU5BOsVcvk0tciGCIuhYkU86qP8fpZTXrdfk4WQZlhh8LFezosHd+X2?=
 =?us-ascii?Q?lolj1Aex?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3bb02d58-6fdc-45e2-8c0b-08d8c16232f1
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jan 2021 18:51:18.0314 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CVnt2sGh3YuOQRSmpp4dheD4VYhgUwL+8P0No8xRVXESrgrNj4bivxhHwybJ2dq+lf15Wk6Nyy6whFssFbmYKNnB6BZ85IjBWCdJftPeYg8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4405
Received-SPF: pass client-ip=40.107.21.101;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR05-VI1-obe.outbound.protection.outlook.com
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

Add TestRunner class, which will run tests in a new python iotests
running framework.

There are some differences with current ./check behavior, most
significant are:
- Consider all tests self-executable, just run them, don't run python
  by hand.
- Elapsed time is cached in json file
- Elapsed time precision increased a bit
- Instead of using "diff -w" which ignores all whitespace differences,
  manually strip whitespace at line end then use python difflib, which
  no longer ignores spacing mid-line

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 tests/qemu-iotests/testrunner.py | 366 +++++++++++++++++++++++++++++++
 1 file changed, 366 insertions(+)
 create mode 100644 tests/qemu-iotests/testrunner.py

diff --git a/tests/qemu-iotests/testrunner.py b/tests/qemu-iotests/testrunner.py
new file mode 100644
index 0000000000..8480d2d586
--- /dev/null
+++ b/tests/qemu-iotests/testrunner.py
@@ -0,0 +1,366 @@
+# Class for actually running tests.
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
+from pathlib import Path
+import datetime
+import time
+import difflib
+import subprocess
+import contextlib
+import json
+import termios
+import sys
+from contextlib import contextmanager
+from contextlib import AbstractContextManager
+from typing import List, Optional, Iterator, Any, Sequence
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
+        res = [line.rstrip()
+               for line in difflib.unified_diff(seq1, seq2, file1, file2)]
+        return res
+
+
+# We want to save current tty settings during test run,
+# since an aborting qemu call may leave things screwed up.
+@contextmanager
+def savetty() -> Iterator[None]:
+    isterm = sys.stdin.isatty()
+    if isterm:
+        fd = sys.stdin.fileno()
+        attr = termios.tcgetattr(fd)
+
+    try:
+        yield
+    finally:
+        if isterm:
+            termios.tcsetattr(fd, termios.TCSADRAIN, attr)
+
+
+class LastElapsedTime(AbstractContextManager['LastElapsedTime']):
+    """ Cache for elapsed time for tests, to show it during new test run
+
+    It is safe to use get() at any time.  To use update(), you must either
+    use it inside with-block or use save() after update().
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
+    def __exit__(self, exc_type: Any, exc_value: Any, traceback: Any) -> None:
+        self.save()
+
+
+class TestResult:
+    def __init__(self, status: str, description: str = '',
+                 elapsed: Optional[float] = None, diff: Sequence[str] = (),
+                 casenotrun: str = '', interrupted: bool = False) -> None:
+        self.status = status
+        self.description = description
+        self.elapsed = elapsed
+        self.diff = diff
+        self.casenotrun = casenotrun
+        self.interrupted = interrupted
+
+
+class TestRunner(AbstractContextManager['TestRunner']):
+    def __init__(self, env: TestEnv, makecheck: bool = False,
+                 color: str = 'auto') -> None:
+        self.env = env
+        self.test_run_env = self.env.get_env()
+        self.makecheck = makecheck
+        self.last_elapsed = LastElapsedTime('.last-elapsed-cache', env)
+
+        assert color in ('auto', 'on', 'off')
+        self.color = (color == 'on') or (color == 'auto' and
+                                         sys.stdout.isatty())
+
+        self._stack: contextlib.ExitStack
+
+    def __enter__(self) -> 'TestRunner':
+        self._stack = contextlib.ExitStack()
+        self._stack.enter_context(self.env)
+        self._stack.enter_context(self.last_elapsed)
+        self._stack.enter_context(savetty())
+        return self
+
+    def __exit__(self, exc_type: Any, exc_value: Any, traceback: Any) -> None:
+        self._stack.close()
+
+    def test_print_one_line(self, test: str, starttime: str,
+                            endtime: Optional[str] = None, status: str = '...',
+                            lasttime: Optional[float] = None,
+                            thistime: Optional[float] = None,
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
+            lasttime_s = f' (last: {lasttime:.1f}s)'
+        else:
+            lasttime_s = ''
+        if thistime:
+            thistime_s = f'{thistime:.1f}s'
+        else:
+            thistime_s = '...'
+
+        if endtime:
+            endtime = f'[{endtime}]'
+        else:
+            endtime = ''
+
+        if self.color:
+            if status == 'pass':
+                col = '\033[32m'
+            elif status == 'fail':
+                col = '\033[1m\033[31m'
+            elif status == 'not run':
+                col = '\033[33m'
+            else:
+                col = ''
+
+            col_end = '\033[0m'
+        else:
+            col = ''
+            col_end = ''
+
+        print(f'{test:{test_field_width}} {col}{status:10}{col_end} '
+              f'[{starttime}] {endtime:13}{thistime_s:5} {lasttime_s:14} '
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
+            sys.exit(f'Not executable: {f_test}')
+
+        if not f_reference.exists():
+            return TestResult(status='not run',
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
+        with f_test.open() as f:
+            try:
+                if f.readline() == '#!/usr/bin/env python3':
+                    args.insert(0, self.env.python)
+            except UnicodeDecodeError:  # binary test? for future.
+                pass
+
+        env = os.environ.copy()
+        env.update(self.test_run_env)
+
+        t0 = time.time()
+        with f_bad.open('w') as f:
+            proc = subprocess.Popen(args, cwd=str(f_test.parent), env=env,
+                                    stdout=f, stderr=subprocess.STDOUT)
+            try:
+                proc.wait()
+            except KeyboardInterrupt:
+                proc.terminate()
+                proc.wait()
+                return TestResult(status='not run',
+                                  description='Interrupted by user',
+                                  interrupted=True)
+            ret = proc.returncode
+
+        elapsed = round(time.time() - t0, 1)
+
+        if ret != 0:
+            return TestResult(status='fail', elapsed=elapsed,
+                              description=f'failed, exit status {ret}',
+                              diff=file_diff(str(f_reference), str(f_bad)))
+
+        if f_notrun.exists():
+            return TestResult(status='not run',
+                              description=f_notrun.read_text().strip())
+
+        casenotrun = ''
+        if f_casenotrun.exists():
+            casenotrun = f_casenotrun.read_text()
+
+        diff = file_diff(str(f_reference), str(f_bad))
+        if diff:
+            return TestResult(status='fail', elapsed=elapsed,
+                              description=f'output mismatch (see {f_bad})',
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
+            if res.interrupted:
+                break
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


