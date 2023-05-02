Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 75A7D6F4017
	for <lists+qemu-devel@lfdr.de>; Tue,  2 May 2023 11:25:52 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ptmEt-00051F-2Q; Tue, 02 May 2023 05:24:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mads@ynddal.dk>) id 1ptmEr-00050q-DF
 for qemu-devel@nongnu.org; Tue, 02 May 2023 05:24:01 -0400
Received: from mr85p00im-ztdg06021701.me.com ([17.58.23.196])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mads@ynddal.dk>) id 1ptmEp-00040B-Kc
 for qemu-devel@nongnu.org; Tue, 02 May 2023 05:24:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ynddal.dk; s=sig1;
 t=1683019438; bh=truZGcf/836/sOv1LjrGTCJdJmzGnXZDDsKkr3nCFe0=;
 h=From:To:Subject:Date:Message-Id:MIME-Version;
 b=NXL1RNRvrxVYmIEtLSg8MnGCVLLXdGdIaEyfki4JKEZK0+CjATmwOd/8Ty+juEK6g
 hB7LOZZtAdQ4MjqYNALCgfmu5QlEjccLTj8Jd8ubqy9ny+3/pe9ep/q6+kiCPmo+7e
 wmuS/MTjT8eWKskg5+d1txZdoYR63Xh00V3PyhG0BONlqQ/3FQNaTQAzY8rdONzd7C
 zt0o0nFrJ323pjp5Qvbdo8hpPxsDffiEcmbGXG/AWIlOtPr5kESTXROoFzyPGLPhSv
 fFx7Il5MYHM4MKzxg+EZZk/YzZ1KPoBZLCUKdrVU3ZfFAgPqlz2bLLfCPTdmArRIPD
 IUKqFHsTcLnFg==
Received: from localhost.localdomain (mr38p00im-dlb-asmtp-mailmevip.me.com
 [17.57.152.18])
 by mr85p00im-ztdg06021701.me.com (Postfix) with ESMTPSA id DE1FB2633960;
 Tue,  2 May 2023 09:23:56 +0000 (UTC)
From: Mads Ynddal <mads@ynddal.dk>
To: qemu-devel@nongnu.org
Cc: Cleber Rosa <crosa@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 John Snow <jsnow@redhat.com>, Mads Ynddal <mads@ynddal.dk>,
 Mads Ynddal <m.ynddal@samsung.com>
Subject: [PATCH v2 05/12] simpletrace: Changed Analyzer class to become
 context-manager
Date: Tue,  2 May 2023 11:23:32 +0200
Message-Id: <20230502092339.27341-6-mads@ynddal.dk>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230502092339.27341-1-mads@ynddal.dk>
References: <20230502092339.27341-1-mads@ynddal.dk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: NInfHy1XcRfCJWMxyUwC2BYIS5pibZQU
X-Proofpoint-ORIG-GUID: NInfHy1XcRfCJWMxyUwC2BYIS5pibZQU
X-Proofpoint-Virus-Version: =?UTF-8?Q?vendor=3Dfsecure_engine=3D1.1.170-22c6f66c430a71ce266a39bfe25bc?=
 =?UTF-8?Q?2903e8d5c8f:6.0.425,18.0.816,17.11.62.513.0000000_definitions?=
 =?UTF-8?Q?=3D2022-01-18=5F01:2022-01-14=5F01,2022-01-18=5F01,2021-12-02?=
 =?UTF-8?Q?=5F01_signatures=3D0?=
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 adultscore=0 spamscore=0
 phishscore=0 clxscore=1030 mlxlogscore=999 bulkscore=0 malwarescore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2305020080
Received-SPF: pass client-ip=17.58.23.196; envelope-from=mads@ynddal.dk;
 helo=mr85p00im-ztdg06021701.me.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
 scripts/simpletrace.py | 40 +++++++++++++++++++++++-----------------
 1 file changed, 23 insertions(+), 17 deletions(-)

diff --git a/scripts/simpletrace.py b/scripts/simpletrace.py
index 7444a6e090..10ca093046 100755
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
@@ -152,19 +152,25 @@ def runstate_set(self, timestamp, pid, new_state):
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
+    def __call__(self):
+        """Fix for legacy use without context manager.
+        We call the provided object in `process` regardless of it being the object-type or instance.
+        With this function, it will work in both cases."""
+        return self
+
+def process(events, log, analyzer_class, read_header=True):
     """Invoke an analyzer on each event in a log."""
     if read_header:
         read_trace_header(log)
@@ -203,15 +209,15 @@ def build_fn(analyzer, event):
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
-- 
2.38.1


