Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 82D03467764
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Dec 2021 13:27:40 +0100 (CET)
Received: from localhost ([::1]:36448 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mt7f9-0002XH-4o
	for lists+qemu-devel@lfdr.de; Fri, 03 Dec 2021 07:27:39 -0500
Received: from eggs.gnu.org ([209.51.188.92]:45156)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mt7ac-0004SI-BL; Fri, 03 Dec 2021 07:22:58 -0500
Received: from mail-eopbgr70128.outbound.protection.outlook.com
 ([40.107.7.128]:26637 helo=EUR04-HE1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@virtuozzo.com>)
 id 1mt7aa-00072E-FU; Fri, 03 Dec 2021 07:22:58 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iw0yYYhem8Z35ZAQuhj+jbag1ddPi8hIZYeaSqPg0yWcWriSmtnrmfRcWG0l/9pF4Zn6iA5+NO7HurCYf3h2pYNKvA1S+t7FiCSwEWSo81PQTm+8Xd7wF9MMgD+3I7maY3BEQMspHBvwRo4GZ6ELdAc/QcqJD30OkiCqDizVpJ1Iq9oPR4J+0k5kZLywIWnC9O8MmyJ257RmRo/cer6E1HwMoYfBn3E7EzwU9DqXb5CjnomDh4XMJjqLjNbDUzqmtXgIPsN/y7+N7T5ZPkcrvGitiuc69tqrK687pygefE6bfQm35s9+pAHOLsTzn3H6Dw0AclraF65m9pcFAQjzVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mevV4Dv3h61IoiOhPQRqTjP+QDUeOE+hO1uo4U56kl0=;
 b=bc1jW1VQkDhm3hETfmzagC6MY6A6vdjP2ejCYehbZG+2LlQW5L04o9r8XfiAqC3GmY1ARiBuc+0grgvJi8QlZtUVR7XJPg2l7k1x4XUcM3uoRzJDTFbknnDhBIsRJlhnFn7Rl8q9VlRLIQ/dCyba0EAIFhOsJyMLtuOtSsds6aqaO/fpWCiXzeKiaDOlktnz9NbFdiV5HxWAkF06h3bPJiwIqCLK2rAYxoFmcnPRE+AcBJg38oKxhZnE4OlccSo7UuSEoAn47RaV1xzbLYPk/vyupt0g0AeXFc2HJjacb/6k7Mn//UkrGSbyouKAEx88qM78pL3DSfEOmHeQfPFmug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=virtuozzo.com; dmarc=pass action=none
 header.from=virtuozzo.com; dkim=pass header.d=virtuozzo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=virtuozzo.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mevV4Dv3h61IoiOhPQRqTjP+QDUeOE+hO1uo4U56kl0=;
 b=AfwsHo48apmcoNaq9vcb/2Z6yabMhcemMgvyTlTUrSKXLHLL8jyIIraJ9rnJOMI1J9ZB+Jm2aadoZ8K82vflmPJgA1whwpo298zUYjBqSASFb8KtQxpdDxf/N1rhUsm4a+k0Gq+o5dEaVw5T9hhNRiLf3X9TttyhC+ZlkkIKUe4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=virtuozzo.com;
Received: from AM9PR08MB6737.eurprd08.prod.outlook.com (2603:10a6:20b:304::18)
 by AM4PR0802MB2178.eurprd08.prod.outlook.com (2603:10a6:200:5a::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4755.11; Fri, 3 Dec
 2021 12:22:39 +0000
Received: from AM9PR08MB6737.eurprd08.prod.outlook.com
 ([fe80::2078:5a2:1898:d83a]) by AM9PR08MB6737.eurprd08.prod.outlook.com
 ([fe80::2078:5a2:1898:d83a%7]) with mapi id 15.20.4669.024; Fri, 3 Dec 2021
 12:22:39 +0000
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, hreitz@redhat.com, kwolf@redhat.com,
 jsnow@redhat.com, vsementsov@virtuozzo.com, den@openvz.org
Subject: [PATCH 3/3] iotests: check: multiprocessing support
Date: Fri,  3 Dec 2021 13:22:23 +0100
Message-Id: <20211203122223.2780098-4-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211203122223.2780098-1-vsementsov@virtuozzo.com>
References: <20211203122223.2780098-1-vsementsov@virtuozzo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: AS9PR06CA0111.eurprd06.prod.outlook.com
 (2603:10a6:20b:465::17) To AM9PR08MB6737.eurprd08.prod.outlook.com
 (2603:10a6:20b:304::18)
MIME-Version: 1.0
Received: from kvm.ch-qa.sw.ru (130.117.225.5) by
 AS9PR06CA0111.eurprd06.prod.outlook.com (2603:10a6:20b:465::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4755.11 via Frontend
 Transport; Fri, 3 Dec 2021 12:22:39 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 71c98555-99db-4fa1-783f-08d9b6579905
X-MS-TrafficTypeDiagnostic: AM4PR0802MB2178:
X-Microsoft-Antispam-PRVS: <AM4PR0802MB2178EEA1D712B9B058618FD8C16A9@AM4PR0802MB2178.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Z+zYhnbShnc6cdpakPDgr7ZPZ3M1uD2JNKvBe3zW0a0ShZ8CsbDrx3Km5vAP3ItmBhIoc9oE02zETky+T0YniPKsthwswJfBIh/wz2Wxo+eyDW7joKVcFg8/Gcia2URHoVDX6g/DRwqQaqI+7pEkGGYJMhxrl1aJijaLJxBRaeVDC280tKrkqoLVTYfH+Okn6bQen1z1z0NDy9r3dOYMe88Ldo3juifFhS/VIl3hy3H8GUBMFADDrm6HoUxJZYq8UcDaunHPmV4GAy9w1GMN/DM/nJS6eaW8mLoTuSYTUaGbxHRWO6fVTctYQ5RoNyNQMt2RnOYJcHElwHZi8YxqMgg0u+IX8R3ciYhploGOudgazKOPWAafoRwXswvnJKi7ahtn4GHJc8k+BwGEPxWBoMuLIkP7K/NB3oKZ3W8aOl+P1OrJyexoC2XdonkwJNJBYQdw+nkNwYpcqa7B7Ob+xWjSOtsgQoHSlEh381XpHGMQ/jseUAWQiZnrAZMihlk6mPWjRxe6pfE4QcDItlW/fEr2t48V0ljKkUSoCdHJXIvdlLzpONVSc12/73l12WeWYedK2/cbpe5XE6dacI4kDJoJhp5gfXBDqzYNFaxJz+PCgHdTuF32RjX7JOakj8hQqJm7sBOq5kKRxgGzKQK6Iaju92H9RRgfCtlVY2y1TCXKanLNpu+dY1G5az0qltRR4rPk/bTNvD8p5xeLFZa94Q==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM9PR08MB6737.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(6916009)(508600001)(2906002)(66946007)(83380400001)(52116002)(6506007)(186003)(5660300002)(8936002)(38100700002)(26005)(6486002)(38350700002)(107886003)(36756003)(316002)(2616005)(1076003)(4326008)(86362001)(6512007)(8676002)(6666004)(956004)(66476007)(66556008);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?IyUipAfYlbnnn75Xj73UZgPkCgRuIxOsLkfbt5G6FIvYyqnLO3xsuAuuIRGh?=
 =?us-ascii?Q?AYQNs6m6omHmZ0KwyxEw0PiuCgM/RlbFvipG6jlog4Y14JjDVH43RdMzeC4/?=
 =?us-ascii?Q?zqf4vPeVyQ+0pLDcTnXczhEaVF/r0LE5Mf1Naxg52K3sJiPMvYdzyrYYit3+?=
 =?us-ascii?Q?JjK3AZjB8nakv8VI0Zd9N0MHGVlkgl+ns7JesrEAUhmJ/BTqZtgM+s4d8dki?=
 =?us-ascii?Q?G5y2puxKETUPGLy6TZPzBvJSVNnmA9V2F5ZKLfW6DnCoXwFBUY1DabupT/ou?=
 =?us-ascii?Q?sy0L+z1XQsj3VCe2rIMh68jzyIGLtV8z0XfXLsDUyc7p2pCDkb5LOi0sOpgq?=
 =?us-ascii?Q?w2ccnqOAu17m/n8zIstKCsXX3Om/fexgTScRV3mIY3lBr6mUKZyfQVpKhKwE?=
 =?us-ascii?Q?W0vNcasBYu7ZtdB/GwWGzcWJq/58UWPyUyn9nYRgEM0nT8wQj3p6z5OmBg8I?=
 =?us-ascii?Q?qiwcwn/6rilUehhGlZdf5CnD7Qjj2Inp206/RYWt4xucfrlsDaYXh8WWOUOs?=
 =?us-ascii?Q?y+MzM188RtI0tzqx4HZXSXbujXOKaSptBy5eoj96z7B6cIXSJm8JzinPA/dg?=
 =?us-ascii?Q?KbBYZ2bQtlCNoJ+F4vVWqTe4qkBBjFLNjRNxliaEs1f9YIo5hiqu5QyL+Aak?=
 =?us-ascii?Q?tJQAuqMNfpOyAem413pPID+sPzQHN/Uhv3IPGCuqdH6/UvGymJ8wk/hRzsuO?=
 =?us-ascii?Q?Jtu0Z0F3F31qFd7kLjZeZ4i6xAT04vPhd8fdAQVXKdgm1HnvqfpT9xe33hXf?=
 =?us-ascii?Q?OHu9gdoLZcyFUoXyp/DZe4G5nEWUA5ce8G7Cd14TTY0ZQsv3U/XSCRuPiqgc?=
 =?us-ascii?Q?BnUq47lv6AICIz2BVmhL1F+rWFQxC3oMRUyqbJpPdCy0r4kewLe/41II4cYi?=
 =?us-ascii?Q?0z9SOhQdiICCAmquFgcxMP4drzVQ9pJcy3B+MRI+qf6j+TpF38tqUxWkCU0H?=
 =?us-ascii?Q?WHlAKuNiMnFqLtbFFNTnHssiZKfOn2wHCrQ4o8raqAAgax27vIBZ1ILOS4Kn?=
 =?us-ascii?Q?gps5JU320MvLtcSTT/QDP5onNntEhNrBCJoqQ3603kZ9DeZfklUbu4Rei3P4?=
 =?us-ascii?Q?Ps3N7OLWjkoD8iymyvCplPksMTqjjHp8mRXbgMSYqeiJyoJljKX2u+oAANae?=
 =?us-ascii?Q?GNTi/aO8bU4lGF6WxPpYTA6pTR35d67gdHiFiLdiAZNXDkb1Xtew/DF/kZmV?=
 =?us-ascii?Q?vM3jmWammiaJO2d2O4Nl46Itv5ZLDJUHEYKmu7+zNBt1Pu44dmke0aUn4zRP?=
 =?us-ascii?Q?klQv46fJ7LiXN8Qi3huCCY2eHs6eweQedY+kNitPQISSm+onG/zQfszjhkC4?=
 =?us-ascii?Q?sr1Zxxxb9HiAa9FXtfOipJ/8YV96G/TfFrtzOs8r+iUzhy4uiDzTjBPBOGgL?=
 =?us-ascii?Q?nMuohHYyi7ZJmr5rZW28GESiFNqtLcdjWV1lRb5pXf31p1PiEWdBD7Rc6vhz?=
 =?us-ascii?Q?csii8bsTYKdv2UwbIcfk+BvcfHWaD3fdhLbv5fUTdvq51weB7RsVbiOLm+Cf?=
 =?us-ascii?Q?8tqA/hQa96sCWQeU73sontEk9bCqRhf6KOKo9wy90XaFg10TXQfARwrCCink?=
 =?us-ascii?Q?qLyrONvHaclP4xvkM6OslRDGJevL34SDBMk2Rf3GBS2NfUn6N2U4dDiCv42f?=
 =?us-ascii?Q?NslPW3k0nZ4YjHOVYHIeTKt4BhJlhRmyHfKbRskTtjkR5u08RJWqB11zv+zR?=
 =?us-ascii?Q?E8G9XQ=3D=3D?=
X-OriginatorOrg: virtuozzo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 71c98555-99db-4fa1-783f-08d9b6579905
X-MS-Exchange-CrossTenant-AuthSource: AM9PR08MB6737.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Dec 2021 12:22:39.6274 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0bc7f26d-0264-416e-a6fc-8352af79c58f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HuZj3hVgB2M8g9GKe4b3TtNvtaciWC9Ctnqiyq4EQb6YiOquSF346pdTp3E/OIOkdOU+ABCEkEjrhuJ5sVN5lNa2GVCurCA7tDE4LBBucc0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM4PR0802MB2178
Received-SPF: pass client-ip=40.107.7.128;
 envelope-from=vsementsov@virtuozzo.com;
 helo=EUR04-HE1-obe.outbound.protection.outlook.com
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
X-Mailman-Version: 2.1.29
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

Add -j <JOBS> parameter, to run tests in several jobs simultaneously.
For realization - simply utilize multiprocessing.Pool class.

Notes:

1. Of course, tests can't run simultaneously in same TEST_DIR. So,
   use subdirectories TEST_DIR/testname/ and SOCK_DIR/testname/
   instead of simply TEST_DIR and SOCK_DIR

2. multiprocessing.Pool.starmap function doesn't support passing
   context managers, so we can't simply pass "self". Happily, we need
   self only for read-only access, and it just works if it is defined
   in global space. So, add a temporary link TestRunner.shared_self
   during run_tests().

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 tests/qemu-iotests/check         |  4 +-
 tests/qemu-iotests/testrunner.py | 69 ++++++++++++++++++++++++++++----
 2 files changed, 64 insertions(+), 9 deletions(-)

diff --git a/tests/qemu-iotests/check b/tests/qemu-iotests/check
index 43a4b694cc..0c27721a41 100755
--- a/tests/qemu-iotests/check
+++ b/tests/qemu-iotests/check
@@ -34,6 +34,8 @@ def make_argparser() -> argparse.ArgumentParser:
                    help='show me, do not run tests')
     p.add_argument('-makecheck', action='store_true',
                    help='pretty print output for make check')
+    p.add_argument('-j', dest='jobs', type=int, default=1,
+                   help='run tests in multiple parallel jobs')
 
     p.add_argument('-d', dest='debug', action='store_true', help='debug')
     p.add_argument('-p', dest='print', action='store_true',
@@ -165,6 +167,6 @@ if __name__ == '__main__':
         with TestRunner(env, makecheck=args.makecheck,
                         color=args.color) as tr:
             paths = [os.path.join(env.source_iotests, t) for t in tests]
-            ok = tr.run_tests(paths)
+            ok = tr.run_tests(paths, args.jobs)
             if not ok:
                 sys.exit(1)
diff --git a/tests/qemu-iotests/testrunner.py b/tests/qemu-iotests/testrunner.py
index a9f2feb58c..0feaa396d0 100644
--- a/tests/qemu-iotests/testrunner.py
+++ b/tests/qemu-iotests/testrunner.py
@@ -26,6 +26,7 @@
 import json
 import termios
 import sys
+from multiprocessing import Pool
 from contextlib import contextmanager
 from typing import List, Optional, Iterator, Any, Sequence, Dict, \
         ContextManager
@@ -126,6 +127,31 @@ def __init__(self, status: str, description: str = '',
 
 
 class TestRunner(ContextManager['TestRunner']):
+    shared_self = None
+
+    @staticmethod
+    def proc_run_test(test: str, test_field_width: int) -> TestResult:
+        # We are in a subprocess, we can't change the runner object!
+        runner = TestRunner.shared_self
+        assert runner is not None
+        return runner.run_test(test, test_field_width, mp=True)
+
+    def run_tests_pool(self, tests: List[str],
+                       test_field_width: int, jobs: int) -> List[TestResult]:
+
+        # passing self directly to Pool.starmap() just doesn't work, because
+        # it's a context manager.
+        assert TestRunner.shared_self is None
+        TestRunner.shared_self = self
+
+        with Pool(jobs) as p:
+            results = p.starmap(self.proc_run_test,
+                                zip(tests, [test_field_width] * len(tests)))
+
+        TestRunner.shared_self = None
+
+        return results
+
     def __init__(self, env: TestEnv, makecheck: bool = False,
                  color: str = 'auto') -> None:
         self.env = env
@@ -219,11 +245,16 @@ def find_reference(self, test: str) -> str:
 
         return f'{test}.out'
 
-    def do_run_test(self, test: str) -> TestResult:
+    def do_run_test(self, test: str, mp: bool) -> TestResult:
         """
         Run one test
 
         :param test: test file path
+        :param mp: if true, we are in a multiprocessing environment, use
+                   personal subdirectories for test run
+
+        Note: this method may be called from subprocess, so it does not
+        change ``self`` object in any way!
         """
 
         f_test = Path(test)
@@ -249,6 +280,12 @@ def do_run_test(self, test: str) -> TestResult:
 
         args = [str(f_test.resolve())]
         env = self.env.prepare_subprocess(args)
+        if mp:
+            # Split test directories, so that tests running in parallel don't
+            # break each other.
+            for d in ['TEST_DIR', 'SOCK_DIR']:
+                env[d] = os.path.join(env[d], f_test.name)
+                Path(env[d]).mkdir(parents=True, exist_ok=True)
 
         t0 = time.time()
         with f_bad.open('w', encoding="utf-8") as f:
@@ -291,23 +328,32 @@ def do_run_test(self, test: str) -> TestResult:
                               casenotrun=casenotrun)
 
     def run_test(self, test: str,
-                 test_field_width: Optional[int] = None) -> TestResult:
+                 test_field_width: Optional[int] = None,
+                 mp: bool = False) -> TestResult:
         """
         Run one test and print short status
 
         :param test: test file path
         :param test_field_width: width for first field of status format
+        :param mp: if true, we are in a multiprocessing environment, don't try
+                   to rewrite things in stdout
+
+        Note: this method may be called from subprocess, so it does not
+        change ``self`` object in any way!
         """
 
         last_el = self.last_elapsed.get(test)
         start = datetime.datetime.now().strftime('%H:%M:%S')
 
         if not self.makecheck:
-            self.test_print_one_line(test=test, starttime=start,
-                                     lasttime=last_el, end='\r',
+            self.test_print_one_line(test=test,
+                                     status = 'started' if mp else '...',
+                                     starttime=start,
+                                     lasttime=last_el,
+                                     end = '\n' if mp else '\r',
                                      test_field_width=test_field_width)
 
-        res = self.do_run_test(test)
+        res = self.do_run_test(test, mp)
 
         end = datetime.datetime.now().strftime('%H:%M:%S')
         self.test_print_one_line(test=test, status=res.status,
@@ -321,7 +367,7 @@ def run_test(self, test: str,
 
         return res
 
-    def run_tests(self, tests: List[str]) -> bool:
+    def run_tests(self, tests: List[str], jobs: int = 1) -> bool:
         n_run = 0
         failed = []
         notrun = []
@@ -332,9 +378,16 @@ def run_tests(self, tests: List[str]) -> bool:
 
         test_field_width = max(len(os.path.basename(t)) for t in tests) + 2
 
-        for t in tests:
+        if jobs > 1:
+            results = self.run_tests_pool(tests, test_field_width, jobs)
+
+        for i, t in enumerate(tests):
             name = os.path.basename(t)
-            res = self.run_test(t, test_field_width=test_field_width)
+
+            if jobs > 1:
+                res = results[i]
+            else:
+                res = self.run_test(t, test_field_width)
 
             assert res.status in ('pass', 'fail', 'not run')
 
-- 
2.31.1


