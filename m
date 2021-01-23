Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 92A7430187C
	for <lists+qemu-devel@lfdr.de>; Sat, 23 Jan 2021 22:11:35 +0100 (CET)
Received: from localhost ([::1]:35172 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l3QBy-0005oX-L7
	for lists+qemu-devel@lfdr.de; Sat, 23 Jan 2021 16:11:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44684)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1l3Q5k-0000lC-JO; Sat, 23 Jan 2021 16:05:08 -0500
Received: from mail-eopbgr150139.outbound.protection.outlook.com
 ([40.107.15.139]:30663 helo=EUR01-DB5-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1l3Q5h-0001gI-8d; Sat, 23 Jan 2021 16:05:08 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UEIl7qsy0Xzsl5l2gKPGp5g+cwtnAELfMYSVRfV83GqVyBb0Cs+Y4aYpiPVjF0Xjv9UYDWyHG171l70/EtOAXIW4R9Cqudon3QcU9tlp8WP1bCs7NQYkogrCyZGHgNZuEUTemJZkWxj81YGOqbjHDkzJmJf0GhYiQDzn8hCz9v78Sxuy66gsmyArdHDmGUgxUvCqZsNO9f/BCUt7OQgV66hrxiFS4dnFHg8OHctIYbCO+9Q9wxQwvgbh4z1PQoSRVkDnc0TSEhxHoymEHDvzivub9i+pATZr5BpeqpdS/tL/Od/AIdA0k2AoINBRobXKzaPSNxIYsVP/KgTc4V7Ohg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=n4REcoWvH4S40efv+2pvAuvO7deXtxjE+PB1Ib8p9cM=;
 b=J+2EEA1riJ8AGBARHFfslV3uv5AdoGreVcwz7t22vN4kgJGSAzoWPQfj2RaHrZ/Igwyh9hnp9o58jZv1TbHuWPuOydkQ28szJc/4YaUCexqbwxzUUDlRpfZUV8wOK/4XYdsav1cvwn3t5alsIUlBgm1ZJqXDpTeInPltLBSWMkHQHRWC8kYBPzZVg+XbxVS+zjVQoPCkv+L42se58Fp/dNcIbkBc8VURBQ27Hw5WwxJ9Vhbnb5y5D+SjXwHg1ybOnSI67ULlpNeecbp0uVhwVPm80AY2gpA/6D6/XjOJr9Fx7mTFdzpPVjt7TzipCGQ5rtTTUCqm/neMGFBrnbeL0Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=n4REcoWvH4S40efv+2pvAuvO7deXtxjE+PB1Ib8p9cM=;
 b=v8DWEtiEHiPe0hn3di0xxgS5HP1QtZybbDaxXRERGGAx2MpW+Q3N3LpCBAXirCQvwdl/+bs8yqEBX44IYrOP8vV1U3T4UXAJxtYNw7knsHGhv+vjHjJDHXzUdnpToJmJHyWTJQ5Zxe3vmtTnjGHtR7+AeXA877lmNx5WjmgwDyY=
Authentication-Results: nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=none action=none header.from=virtuozzo.com;
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com (2603:10a6:20b:dc::15)
 by AS8PR08MB6053.eurprd08.prod.outlook.com (2603:10a6:20b:292::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3784.11; Sat, 23 Jan
 2021 21:04:50 +0000
Received: from AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f1f0:6610:11f5:5e4a]) by AM7PR08MB5494.eurprd08.prod.outlook.com
 ([fe80::f1f0:6610:11f5:5e4a%8]) with mapi id 15.20.3784.015; Sat, 23 Jan 2021
 21:04:50 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Subject: [PATCH v8 3/5] iotests: add testrunner.py
Date: Sun, 24 Jan 2021 00:04:26 +0300
Message-Id: <20210123210428.27220-4-vsementsov@virtuozzo.com>
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
 15.20.3784.11 via Frontend Transport; Sat, 23 Jan 2021 21:04:49 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: be39e3d9-f2f9-4342-bca8-08d8bfe28607
X-MS-TrafficTypeDiagnostic: AS8PR08MB6053:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AS8PR08MB6053955447B7A429F1C175F3C1BF0@AS8PR08MB6053.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5797;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: N7eAfFbbCnNz1wTiUcW4c5YulvpMsxc4lQV/IZb7rICLWu+ANs0B5x4H4uEcx13eBJD308gm1ra7CGRPquJv8q8VVej2CYNfgZPrI86Ncs+YA/468R8e7pdURb7/3a5ySoS57fEOLwlyN+VmKZwDUkWf0Y00OJbaYZBVR+lM3urUBlEbISCcylXFcTM2ig0jrNCP5dJz0TDPFX7Mx/Al2l5em8v9GNsxd0yQrfpa5VfXpcedT0+qkgeRmuK53VctXkCTUknCNYTCvFXn/q8b7Kpjee3/buJJQkm4lyx4jS0NW0UplU4XkEHvdIOxw7aWceTkOgOPE5eEq4V/q3AtQ8+dfJYDFIrISohAEpU0r91Ezf/MGLyhITvr3GaztW92DDDdLwKTEruPBxeZq/0WLjnrh4rO0xZ2lb3R0F2hwE2mQfVUz5sagU5U9FLrmBWx7MKaV9DjZ3Gtb1aIEcU+S4V0bm5Gca0esUPvyo5zuLoBEu8nWdNH2cMD5G1TOpbES9GJpZfmXc3c+dSm7Wg9DYgFIDsNH5oubHGypjmL1pPw6ua/1IPslqG6Y4zX/oTO1JeGQdLAWBXtdghUhz4YwzmoclAeDu/jH8Pf+49wWRISpJFvoCYH3U5+FQVROpTgeVALFhv7f9jQvDuqI5ICHQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR08MB5494.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(366004)(396003)(136003)(376002)(39840400004)(83380400001)(956004)(107886003)(30864003)(6486002)(186003)(66946007)(66476007)(4326008)(52116002)(5660300002)(1076003)(8936002)(478600001)(26005)(2906002)(6916009)(6512007)(6666004)(36756003)(8676002)(6506007)(2616005)(316002)(66556008)(16526019)(86362001)(2004002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?5n5dRC8xVLC5k83soVRrO/wJHIjju9eFht4qm1lqHitWs4SeghXL5cSwyTRU?=
 =?us-ascii?Q?T1h+Zj/TiA0GGHzb1T8fdqhaJmB83o1i3zwwyOpBzW5p47IeDqgL+bepFqHs?=
 =?us-ascii?Q?JzCaKL09WddMwpyOVotV4+lpvjonb5U8A4yZzoAHwA1bwkr1U960jyYssx7+?=
 =?us-ascii?Q?3f4RiRv8szyK9cvkF7z7/1FSovMHJ1yEYMrMdCEWxqeGLxSkDEAcnYXXlGJJ?=
 =?us-ascii?Q?EuU80W8WwKCydl3SDnjy5VvadNfHb287lMkMjxS1ZoCz9NxxpacI02evsILu?=
 =?us-ascii?Q?5oQV2XYRaCfTUOAVjENGTN808sWvYdQ0OmPuLBjpRvYcjRTNG4GMUc3Bcq51?=
 =?us-ascii?Q?MaLK/1Er1n0eslmKoDyNdJFBoqAz+b1cgejfoI8FIIc5J9q4MzEdYHQJaaLi?=
 =?us-ascii?Q?eg6+qfxbTZikG7UA0TM5VXbrEXnEAMRbL09r/DhtMzJSUcj4ASqXc+OyojqH?=
 =?us-ascii?Q?puXBHgEp4OYmCnHJ8U6BY8ncXV9/C+5BMvEUrF+1MPafFrHAbuxLskZ1BqN0?=
 =?us-ascii?Q?czjj782OHMo5CsKBCePkXyFK6ezdXD7efiaEpFgNbNhlJntnk/KYLKv+jqGF?=
 =?us-ascii?Q?P6obHwGARmglIYp8GazOb0ult41swOejVVpcF0WGSbig1R7cI6lfnwhkUZPP?=
 =?us-ascii?Q?2e6IYr/busNz1x/fcVIQLkWRAUolO1Avu4Poi84EmcOyt9CzFY8aPd9LI1Gu?=
 =?us-ascii?Q?bQHoF3fwv2gdKvzH90JHKVE7zVmM8whpFdCExI9HvZeBZNdoIIUfcO3gTEsD?=
 =?us-ascii?Q?B3vXpYL810p5BiglsnqSI5Dpw1zJFCGKrhGIaa7ks2xbCyzRjqOce3yHZK9v?=
 =?us-ascii?Q?TFDesgD/SOTLX4+QL4tOaN8UjIQS9pLOVMLa6AMCWcv4TgrxjX7TFeFOZYEQ?=
 =?us-ascii?Q?/kpOMWXVQOuAbqEaPJGP8Ce2tKB/lStd3PYnfB3qrLAKAQb95KeJTdRktOYG?=
 =?us-ascii?Q?8TU/RwSBXHU+9uiSHzAewtuK3hO0MSX9AuIQ/+8chRFI3mcCDsLO4nYmwClp?=
 =?us-ascii?Q?k/vA?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: be39e3d9-f2f9-4342-bca8-08d8bfe28607
X-MS-Exchange-CrossTenant-AuthSource: AM7PR08MB5494.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jan 2021 21:04:50.7532 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lg5eKhx4udzzREHxf8cHXzmW8EC2HXAh+gedLoHuclai5jw5CatFXmponzk6HVuXJub00m2kwlTcdKdp6bXIEcEwTEAmQJjEvFbQvEvSCII=
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
index 0000000000..e80c25adba
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
+            return TestResult(status='not run', elapsed=elapsed,
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


