Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EDE02F8D7D
	for <lists+qemu-devel@lfdr.de>; Sat, 16 Jan 2021 14:57:33 +0100 (CET)
Received: from localhost ([::1]:57926 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l0m55-00064C-Ty
	for lists+qemu-devel@lfdr.de; Sat, 16 Jan 2021 08:57:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58284)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1l0ltJ-0003UR-Gv; Sat, 16 Jan 2021 08:45:21 -0500
Received: from mail-eopbgr60109.outbound.protection.outlook.com
 ([40.107.6.109]:49662 helo=EUR04-DB3-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1l0ltG-0007U8-SV; Sat, 16 Jan 2021 08:45:21 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=A2h2Hf+qo5jgvB2NReugRrcR8ySn5uOCJSW/9rE+OrCzRc1BdmMKKLMkjpMhikIrjZbHRXsRwACGYUS5/8juM8vWkUdTimv4K8RFnxijTyW4LiBcB9aO4WU2OcMZYujSlxHcmq/BYfgXWO5SNlqvuU5n9vFc/gk6+RREUMHN9C63kl5xycR5SYMwkbe6Ot+xLCwFfP/ybNgBDmZe4Pv1uUjDFd9hLcrKbMYhf/yG50PD1N+Cmz2PxgxZsARDHvsNrkM/sFCFAC9UEf2fnQ95ZLwSXWrXXGsTGzGjHWmXkmLsMAFevDFmnPNO4o5tvj/UD7C6b6TqYBP5n80Y/QLjSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=j9Q71Gx/heEzWm83K6Uvx1xmDV/7EYYn1GKFqpbO8OE=;
 b=dlkHvD/Ltx48Zb0NRFmws4gRi5O43KtMcbxiPEKB28O4fy8qrVi+3rfUiyOL72Xx/WsfHXnEJjoue2iZLjXScxVF9rGm587KcJ7J/Gy0pOZhQ5lEGug4I3O+mfoGQ8N70WXl+CtPxsTBo0C5R8buEJsQVQbqjGkp+NXQ1UJ4Eddu8dPdPNc0SG1YD3H5TqQfBIM+f/ra7bc9SwV+CBLeFDAjvVq1dMRN1RkCwnYBmNTJ5aJwK4X73o71qomMN80DJ58raHdlw170gqFzKNcdpU8xhQvW82hVbdvEtfLv7h1jDPlnkDYUKk62ZrcM2UpCwkDAX6A+hxucs/mXBZoh4w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=j9Q71Gx/heEzWm83K6Uvx1xmDV/7EYYn1GKFqpbO8OE=;
 b=S77GxMLMNT11TpHkrQ8D2qmnPvM1EgyhcQLVFuPTJnpAdMA9xelf6vM6TjQDTqgJAo6d+w0SK/czK4DeBufa8VM8ZJh/PGhkAdZkjFksxGKecPTFht9EjVzOeYA3mADy4T/JU/O01aT9IMQRiGDr5DDUT8JEC53XefAojQ/kNSc=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AM5PR0801MB2098.eurprd08.prod.outlook.com (2603:10a6:203:4a::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3763.11; Sat, 16 Jan
 2021 13:45:10 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::214a:3545:368c:7ae8]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::214a:3545:368c:7ae8%9]) with mapi id 15.20.3763.013; Sat, 16 Jan 2021
 13:45:10 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Subject: [PATCH v7 09/11] iotests: add testrunner.py
Date: Sat, 16 Jan 2021 16:44:22 +0300
Message-Id: <20210116134424.82867-10-vsementsov@virtuozzo.com>
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
 Transport; Sat, 16 Jan 2021 13:45:09 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 61e2c1d7-26d1-40eb-8c5c-08d8ba24f124
X-MS-TrafficTypeDiagnostic: AM5PR0801MB2098:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM5PR0801MB2098D3C0FBDFC450BAFC8357C1A60@AM5PR0801MB2098.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5236;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: zJ6SDlYBBldhJrCDylIjczbDq+Yl7FCGiqY1eSw20dsbnqEXgUxrNkGejhHjof1bygAvrXdc3fEMyiwXXl7Hf6Nx6KWh2iXpgOlk7QEt/QNADKp3z/AFvvv6HCjZgD5PHXIPAqk4jfh4JR1gPrP+kwgT+fBRn3pg4WPDMPZD9IW80O2wOeiL/QK+fo8LNDjDO7phC8bwME+/cvf2L+sM9NVjANOwKO0FAY28FIHRNeH+soFwlwjQR0wpZ6ZQhPLq901OIq1K+CQGTEresgzKMAGGE4yfUqivvdaDHQ89+gdzLzeK0jPpj4LvqXICz1s03RWd671R5bEOH4asecl3vf+X+6ZHq/6bxZ7+xXDt9ixqPx/oVj6rOFoiwwpl8agZBmtQDS/VaT8w1jFjZrfa1txwyGgiv6pLVzSqnhr4q+BaQxwa6sPaqNv3DUsicj1sWApQDeGRAdrY0IYe3ZzDrpmqj1Cj+6np+TltW2O8gR/XTRDTPU7e+fa5ihisF5duxlJM8BfYlperFBq+lSSt1RaJy7MJhgvzb9GcReK8bIlhhkmQ962fmxellj/7DtMeuR5zONnS22SoNlf2o2kYI652/SzDxSU+Rdt0DMM01MWb0qRmwwriJoj+3EKqIgz4/QgtM1MvzGV4dGjsjoe17w==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(136003)(366004)(376002)(346002)(39830400003)(6916009)(36756003)(83380400001)(66946007)(6666004)(6512007)(86362001)(30864003)(1076003)(66556008)(5660300002)(6486002)(66476007)(6506007)(478600001)(4326008)(8676002)(8936002)(956004)(2906002)(52116002)(186003)(16526019)(316002)(26005)(2616005)(2004002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?FBoXVzJufMHHzSOyRG6aBtOdKb31lAdegvGD8o54r2Gv73g+JKYRTOoJMCUm?=
 =?us-ascii?Q?yDCd1BaihsOgjmdh762cpaBh7OS4p6tXZaqxfF72B2qwG0O7XxgRwD4WUgNX?=
 =?us-ascii?Q?wI2URVWtK8J5hnRDv3tJPTuuMfTzt4n9db9Tjh9B6WrD6b0bpQ9HVFcV/3AS?=
 =?us-ascii?Q?HNhh5GVc+tSKG4ujqbZCskKfKOo3Q7Tfilr2cFjzr0ZXvWoDDHyKfpFoSF1C?=
 =?us-ascii?Q?tIy+RE9g/zZuXGy3VU6QykrB99IcMAH+LkgpEB8cg679V4zVEp9YnWWZnbdO?=
 =?us-ascii?Q?QgYJBdExPRTCp8Utqjx2On9j6TOXvwwaaLFSlycqkTH+grivm68qMUVNYxXW?=
 =?us-ascii?Q?Os8llSpYJqg9b5ZBv8wdyFlILqbsxBTuZQ08z/U/WaU+Y53T+/c9d9H29Xuq?=
 =?us-ascii?Q?PNd5D6vBQ8AdApb/TRCOPeDhvbhAgPtVUaq5Pf1YByimGcrelZVtra2uLLZa?=
 =?us-ascii?Q?nKeifykTkSi/ILC79kZXDtWBEbYqiTE9vylnirvC24Ghfvfa5/AndaxEkXI0?=
 =?us-ascii?Q?Nqdu9pr1spfG7UwfI1FqdTB/3iQpJPt+gVG9PecZHDCLGeAAyjbgJB6lpRnU?=
 =?us-ascii?Q?WGu2zKb0bzFGWQYGwhM7yxOXL67pZAP0xLsJ7Vpd3OyLYQpAN5Rg3qOdbmaE?=
 =?us-ascii?Q?5LlEwkQ7Krq5zFF/9phcF9OfvaYOigsO3Dpo76tNUmJFNZc9dFS6RpQsG9rZ?=
 =?us-ascii?Q?izF7Alj+Po9cHV41u8L99Pa7mukWmZ4SnNgVidtiN3rFb7zWXPO6N3iPpXVp?=
 =?us-ascii?Q?Y3PILG5u7lvUChEBfzFFjvKlgd+CNo5SKbYXmRANhG/4DehWJf54zWn6GuOf?=
 =?us-ascii?Q?0Fm1uV822Zq+wvZbQLk8TONeAHo4zhnXzBLGIlFWuAhaBTaALxzaaiUbr/CH?=
 =?us-ascii?Q?8Ixm0ZNgvZpfMwSd7pjf0HolaQXkdIHtsagmLbMusFZbT7efL+ywPX3CzX9y?=
 =?us-ascii?Q?VkHOC5H8BvBcuJkJaolZMSNv7DDf27BSkxduTC3mq8aoBS84K+0dUmBNtu1f?=
 =?us-ascii?Q?fYX1?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 61e2c1d7-26d1-40eb-8c5c-08d8ba24f124
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jan 2021 13:45:10.1871 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6pEeBg1RBVek0qRllpumqJ3rEIM4hyyQbp/BmumLscnjZhUNQ+gJySmDR0BBlGP5dsa98BFR+4TQ+viQ9uaZWI0QoDJGEz5jQRJNtBJ6vOo=
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
 tests/qemu-iotests/testrunner.py | 344 +++++++++++++++++++++++++++++++
 1 file changed, 344 insertions(+)
 create mode 100644 tests/qemu-iotests/testrunner.py

diff --git a/tests/qemu-iotests/testrunner.py b/tests/qemu-iotests/testrunner.py
new file mode 100644
index 0000000000..92722cc68b
--- /dev/null
+++ b/tests/qemu-iotests/testrunner.py
@@ -0,0 +1,344 @@
+# Class for actual tests running.
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
+import random
+from pathlib import Path
+import datetime
+import time
+import difflib
+import subprocess
+import collections
+import contextlib
+import json
+import termios
+import sys
+from contextlib import contextmanager
+from contextlib import AbstractContextManager
+from typing import List, Optional, Iterator, Any
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
+def savetty() -> Iterator[None]:
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
+class LastElapsedTime(AbstractContextManager['LastElapsedTime']):
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
+    def __exit__(self, exc_type: Any, exc_value: Any, traceback: Any) -> None:
+        self.save()
+
+
+TestResult = collections.namedtuple(
+    'TestResult',
+    ['status', 'description', 'elapsed', 'diff', 'casenotrun'],
+    defaults=('', '', '', ''))
+
+
+class TestRunner(AbstractContextManager['TestRunner']):
+    def __init__(self, env: TestEnv, makecheck: bool = False) -> None:
+        self.env = env
+        self.test_run_env = self.env.get_env()
+        if 'MALLOC_PERTURB_' not in os.environ and \
+                'MALLOC_PERTURB_' not in self.test_run_env:
+            x = random.randrange(1, 255)
+            self.test_run_env['MALLOC_PERTURB_'] = str(x)
+
+        self.makecheck = makecheck
+
+        self.last_elapsed = LastElapsedTime('.last-elapsed-cache', env)
+
+    def __enter__(self) -> 'TestRunner':
+        # pylint: disable=attribute-defined-outside-init
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
+            sys.exit(f'Not executable: {f_test}')
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
+            ret = subprocess.run(args, cwd=str(f_test.parent), env=env,
+                                 stdout=f, stderr=subprocess.STDOUT,
+                                 check=False).returncode
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


