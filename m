Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AA2B269DC80
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Feb 2023 10:02:12 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pUOWb-0007k3-Iu; Tue, 21 Feb 2023 04:01:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mads@ynddal.dk>) id 1pUOWY-0007iA-N3
 for qemu-devel@nongnu.org; Tue, 21 Feb 2023 04:01:22 -0500
Received: from mr85p00im-ztdg06011201.me.com ([17.58.23.181])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mads@ynddal.dk>) id 1pUOWX-0005VG-0K
 for qemu-devel@nongnu.org; Tue, 21 Feb 2023 04:01:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ynddal.dk; s=sig1;
 t=1676970080; bh=l/aCZe1H5Hng++TSGvfhaA4HhXrphUiVh1oiy3JASog=;
 h=From:To:Subject:Date:Message-Id:MIME-Version;
 b=BcjHBLj3lcmFbPBaI6x/g7JORDBhprdtevGeTN/CAszUDsrOeyklEzi7IXFINTA+G
 Xld1t4eep6RXcwhKoxTHKtZjGSUyyDcMFpGSCQ6vBKGUjmM5zsthLC98vOArHQtfWF
 cqUYxY4CUkdn4d01mAfKX0mJUUvO5ttgkuclfcxnWP/x0AhyLI42lUoJp3Xyx7oiJF
 +44XjeFvYuw/jMdkpiPY1IkPCIAGEViw5+qDLGBBSeZvMkrJKJa/DjTov4eWVr8VgK
 EuXRrlZPzAHBNbLPeTgx2pmwXc80RV+wBasPikMiwfw/7lYHsDDu8Q19rqbqRYIIdg
 tLd6Nfl/uUABw==
Received: from localhost.localdomain (mr38p00im-dlb-asmtp-mailmevip.me.com
 [17.57.152.18])
 by mr85p00im-ztdg06011201.me.com (Postfix) with ESMTPSA id 64613962546;
 Tue, 21 Feb 2023 09:01:17 +0000 (UTC)
From: Mads Ynddal <mads@ynddal.dk>
To: qemu-devel@nongnu.org
Cc: John Snow <jsnow@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Cleber Rosa <crosa@redhat.com>, Mads Ynddal <m.ynddal@samsung.com>
Subject: [PATCH 5/9] simpletrace: Changed Analyzer class to become
 context-manager
Date: Tue, 21 Feb 2023 10:01:00 +0100
Message-Id: <20230221090104.86103-6-mads@ynddal.dk>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230221090104.86103-1-mads@ynddal.dk>
References: <20230221090104.86103-1-mads@ynddal.dk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: mjmxTAzBP5vejbrDVVtE5WnMbbuHJIoB
X-Proofpoint-GUID: mjmxTAzBP5vejbrDVVtE5WnMbbuHJIoB
X-Proofpoint-Virus-Version: =?UTF-8?Q?vendor=3Dfsecure_engine=3D1.1.170-22c6f66c430a71ce266a39bfe25bc?=
 =?UTF-8?Q?2903e8d5c8f:6.0.425,18.0.816,17.0.605.474.0000000_definitions?=
 =?UTF-8?Q?=3D2022-01-18=5F01:2022-01-14=5F01,2022-01-18=5F01,2020-01-23?=
 =?UTF-8?Q?=5F02_signatures=3D0?=
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0
 mlxlogscore=984
 phishscore=0 adultscore=0 spamscore=0 clxscore=1030 bulkscore=0 mlxscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2209130000 definitions=main-2302210078
Received-SPF: pass client-ip=17.58.23.181; envelope-from=mads@ynddal.dk;
 helo=mr85p00im-ztdg06011201.me.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Mads Ynddal <m.ynddal@samsung.com>

Instead of explicitly calling `begin` and `end`, we can change the class
to use the context-manager paradigm. This is mostly a styling choice,
used in modern Python code. But it also allows for more advanced analyzers
to handle exceptions gracefully in the `__exit__` method (not
demonstrated here).

Signed-off-by: Mads Ynddal <m.ynddal@samsung.com>
---
 scripts/simpletrace.py | 36 ++++++++++++++++++------------------
 1 file changed, 18 insertions(+), 18 deletions(-)

diff --git a/scripts/simpletrace.py b/scripts/simpletrace.py
index 7444a6e090..01bd47a130 100755
--- a/scripts/simpletrace.py
+++ b/scripts/simpletrace.py
@@ -121,12 +121,12 @@ def read_trace_records(event_mapping, event_id_to_name, fobj):
 
             yield rec
 
-class Analyzer(object):
+class Analyzer:
     """A trace file analyzer which processes trace records.
 
-    An analyzer can be passed to run() or process().  The begin() method is
-    invoked, then each trace record is processed, and finally the end() method
-    is invoked.
+    An analyzer can be passed to run() or process().  The __enter__() method is
+    invoked when opening the analyzer using the `with` statement, then each trace
+    record is processed, and finally the __exit__() method is invoked.
 
     If a method matching a trace event name exists, it is invoked to process
     that trace record.  Otherwise the catchall() method is invoked.
@@ -152,19 +152,19 @@ def runstate_set(self, timestamp, pid, new_state):
           ...
     """
 
-    def begin(self):
+    def __enter__(self):
         """Called at the start of the trace."""
-        pass
+        return self
 
     def catchall(self, event, rec):
         """Called if no specific method for processing a trace event has been found."""
         pass
 
-    def end(self):
+    def __exit__(self, _type, value, traceback):
         """Called at the end of the trace."""
         pass
 
-def process(events, log, analyzer, read_header=True):
+def process(events, log, analyzer_class, read_header=True):
     """Invoke an analyzer on each event in a log."""
     if read_header:
         read_trace_header(log)
@@ -203,15 +203,15 @@ def build_fn(analyzer, event):
             # Just arguments, no timestamp or pid
             return lambda _, rec: fn(*rec[3:3 + event_argcount])
 
-    analyzer.begin()
-    fn_cache = {}
-    for rec in read_trace_records(event_mapping, event_id_to_name, log):
-        event_num = rec[0]
-        event = event_mapping[event_num]
-        if event_num not in fn_cache:
-            fn_cache[event_num] = build_fn(analyzer, event)
-        fn_cache[event_num](event, rec)
-    analyzer.end()
+    with analyzer_class() as analyzer:
+        fn_cache = {}
+        for rec in read_trace_records(event_mapping, event_id_to_name, log):
+            event_num = rec[0]
+            event = event_mapping[event_num]
+            if event_num not in fn_cache:
+                fn_cache[event_num] = build_fn(analyzer, event)
+            fn_cache[event_num](event, rec)
+
 
 def run(analyzer):
     """Execute an analyzer on a trace file given on the command-line.
@@ -254,4 +254,4 @@ def catchall(self, event, rec):
                 i += 1
             print(' '.join(fields))
 
-    run(Formatter())
+    run(Formatter)
-- 
2.38.1


