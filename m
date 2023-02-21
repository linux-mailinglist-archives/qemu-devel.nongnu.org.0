Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DEB7669DC86
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Feb 2023 10:04:18 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pUOWd-0007kb-Br; Tue, 21 Feb 2023 04:01:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mads@ynddal.dk>) id 1pUOWa-0007k4-UH
 for qemu-devel@nongnu.org; Tue, 21 Feb 2023 04:01:24 -0500
Received: from mr85p00im-ztdg06011201.me.com ([17.58.23.181])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mads@ynddal.dk>) id 1pUOWZ-0005Vh-2B
 for qemu-devel@nongnu.org; Tue, 21 Feb 2023 04:01:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ynddal.dk; s=sig1;
 t=1676970081; bh=nBHUCSVeaJc/sZEH8GcagQNr0dcQJayGmXVTFHWPvqU=;
 h=From:To:Subject:Date:Message-Id:MIME-Version;
 b=IHQZRRxuw/LpVRzLQasfHxwIPQJ8Ppcl2Va4G6aAJWcg8Z9J7IW5KA7krLNFME+MK
 Rde5fZGlPtv9S87ISsGs/afCTtgq63t7PkyR/eDMKW/7lP/i7H5QN65nP2rkTwlPhL
 L02y+w2rf78f2ED7i9R5W1m7r/3prK2c3gXhWlWzc9+NwMiA/AGVY4zgHo6VOhPm8y
 5EY637eCuzhuil5WQ5o5g8y2N9SklEGJSvRqM9uh1yWs+L+UZvH5jZcHwOFHWLyNpH
 iOh/U8jC+v3wT/urCM8sWzYcoAzhLsXsEpq2Yc28jl+9vMl/py/Mlpba3jspI14fol
 ttB1MUKDKSSqA==
Received: from localhost.localdomain (mr38p00im-dlb-asmtp-mailmevip.me.com
 [17.57.152.18])
 by mr85p00im-ztdg06011201.me.com (Postfix) with ESMTPSA id 6F1B8962D11;
 Tue, 21 Feb 2023 09:01:20 +0000 (UTC)
From: Mads Ynddal <mads@ynddal.dk>
To: qemu-devel@nongnu.org
Cc: John Snow <jsnow@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Cleber Rosa <crosa@redhat.com>, Mads Ynddal <m.ynddal@samsung.com>
Subject: [PATCH 6/9] simpletrace: Simplify construction of tracing methods
Date: Tue, 21 Feb 2023 10:01:01 +0100
Message-Id: <20230221090104.86103-7-mads@ynddal.dk>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230221090104.86103-1-mads@ynddal.dk>
References: <20230221090104.86103-1-mads@ynddal.dk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: QIGr0pon3tx98urpSxXjRerrogQxGy3l
X-Proofpoint-GUID: QIGr0pon3tx98urpSxXjRerrogQxGy3l
X-Proofpoint-Virus-Version: =?UTF-8?Q?vendor=3Dfsecure_engine=3D1.1.170-22c6f66c430a71ce266a39bfe25bc?=
 =?UTF-8?Q?2903e8d5c8f:6.0.425,18.0.816,17.0.605.474.0000000_definitions?=
 =?UTF-8?Q?=3D2022-01-18=5F01:2022-01-14=5F01,2022-01-18=5F01,2020-01-23?=
 =?UTF-8?Q?=5F02_signatures=3D0?=
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0
 mlxlogscore=880
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

By moving the dynamic argument construction to keyword-arguments,
we can remove all of the specialized handling, and streamline it.
If a tracing method wants to access these, they can define the
kwargs, or ignore it be placing `**kwargs` at the end of the
function's arguments list.

Signed-off-by: Mads Ynddal <m.ynddal@samsung.com>
---
 scripts/simpletrace.py | 84 ++++++++++++++++--------------------------
 1 file changed, 32 insertions(+), 52 deletions(-)

diff --git a/scripts/simpletrace.py b/scripts/simpletrace.py
index 01bd47a130..df52b09dbc 100755
--- a/scripts/simpletrace.py
+++ b/scripts/simpletrace.py
@@ -131,16 +131,25 @@ class Analyzer:
     If a method matching a trace event name exists, it is invoked to process
     that trace record.  Otherwise the catchall() method is invoked.
 
+    The methods are called with a set of keyword-arguments. These can be ignored
+    using `**kwargs` or defined like any keyword-argument.
+
+    The following keyword-arguments are available:
+        event: Event object of current trace
+        event_id: The id of the event in the current trace file
+        timestamp_ns: The timestamp in nanoseconds of the trace
+        pid: The process id recorded for the given trace
+
     Example:
     The following method handles the runstate_set(int new_state) trace event::
 
-      def runstate_set(self, new_state):
+      def runstate_set(self, new_state, **kwargs):
           ...
 
-    The method can also take a timestamp argument before the trace event
-    arguments::
+    The method can also explicitly take a timestamp keyword-argument with the
+    trace event arguments::
 
-      def runstate_set(self, timestamp, new_state):
+      def runstate_set(self, new_state, *, timestamp, **kwargs):
           ...
 
     Timestamps have the uint64_t type and are in nanoseconds.
@@ -148,7 +157,7 @@ def runstate_set(self, timestamp, new_state):
     The pid can be included in addition to the timestamp and is useful when
     dealing with traces from multiple processes::
 
-      def runstate_set(self, timestamp, pid, new_state):
+      def runstate_set(self, new_state, *, timestamp, pid, **kwargs):
           ...
     """
 
@@ -156,7 +165,7 @@ def __enter__(self):
         """Called at the start of the trace."""
         return self
 
-    def catchall(self, event, rec):
+    def catchall(self, *rec_args, event, timestamp_ns, pid, event_id):
         """Called if no specific method for processing a trace event has been found."""
         pass
 
@@ -183,34 +192,11 @@ def process(events, log, analyzer_class, read_header=True):
         for event_id, event in enumerate(events):
             event_id_to_name[event_id] = event.name
 
-    def build_fn(analyzer, event):
-        if isinstance(event, str):
-            return analyzer.catchall
-
-        fn = getattr(analyzer, event.name, None)
-        if fn is None:
-            return analyzer.catchall
-
-        event_argcount = len(event.args)
-        fn_argcount = len(inspect.getfullargspec(fn)[0]) - 1
-        if fn_argcount == event_argcount + 1:
-            # Include timestamp as first argument
-            return lambda _, rec: fn(*(rec[1:2] + rec[3:3 + event_argcount]))
-        elif fn_argcount == event_argcount + 2:
-            # Include timestamp and pid
-            return lambda _, rec: fn(*rec[1:3 + event_argcount])
-        else:
-            # Just arguments, no timestamp or pid
-            return lambda _, rec: fn(*rec[3:3 + event_argcount])
-
     with analyzer_class() as analyzer:
-        fn_cache = {}
-        for rec in read_trace_records(event_mapping, event_id_to_name, log):
-            event_num = rec[0]
-            event = event_mapping[event_num]
-            if event_num not in fn_cache:
-                fn_cache[event_num] = build_fn(analyzer, event)
-            fn_cache[event_num](event, rec)
+        for event_id, timestamp_ns, record_pid, *rec_args in read_trace_records(event_mapping, event_id_to_name, log):
+            event = event_mapping[event_id]
+            fn = getattr(analyzer, event.name, analyzer.catchall)
+            fn(*rec_args, event=event, event_id=event_id, timestamp_ns=timestamp_ns, pid=record_pid)
 
 
 def run(analyzer):
@@ -234,24 +220,18 @@ def run(analyzer):
 if __name__ == '__main__':
     class Formatter(Analyzer):
         def __init__(self):
-            self.last_timestamp = None
-
-        def catchall(self, event, rec):
-            timestamp = rec[1]
-            if self.last_timestamp is None:
-                self.last_timestamp = timestamp
-            delta_ns = timestamp - self.last_timestamp
-            self.last_timestamp = timestamp
-
-            fields = [event.name, '%0.3f' % (delta_ns / 1000.0),
-                      'pid=%d' % rec[2]]
-            i = 3
-            for type, name in event.args:
-                if is_string(type):
-                    fields.append('%s=%s' % (name, rec[i]))
-                else:
-                    fields.append('%s=0x%x' % (name, rec[i]))
-                i += 1
-            print(' '.join(fields))
+            self.last_timestamp_ns = None
+
+        def catchall(self, *rec_args, event, timestamp_ns, pid, event_id):
+            if self.last_timestamp_ns is None:
+                self.last_timestamp_ns = timestamp_ns
+            delta_ns = timestamp_ns - self.last_timestamp_ns
+            self.last_timestamp_ns = timestamp_ns
+
+            fields = [
+                f'{name}={r}' if is_string(type) else f'{name}=0x{r:x}'
+                for r, (type, name) in zip(rec_args, event.args)
+            ]
+            print(f'{event.name} {delta_ns / 1000:0.3f} {pid=} ' + ' '.join(fields))
 
     run(Formatter)
-- 
2.38.1


