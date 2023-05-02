Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DD5656F4013
	for <lists+qemu-devel@lfdr.de>; Tue,  2 May 2023 11:25:38 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ptmFP-00054C-5u; Tue, 02 May 2023 05:24:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mads@ynddal.dk>) id 1ptmFN-000541-Ma
 for qemu-devel@nongnu.org; Tue, 02 May 2023 05:24:33 -0400
Received: from mr85p00im-ztdg06021701.me.com ([17.58.23.196])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mads@ynddal.dk>) id 1ptmFL-00043G-Ge
 for qemu-devel@nongnu.org; Tue, 02 May 2023 05:24:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ynddal.dk; s=sig1;
 t=1683019470; bh=H1YUNZrIgSCfpd1j0RXperPCMm9oMS4OPMj6tkEAW4k=;
 h=From:To:Subject:Date:Message-Id:MIME-Version;
 b=Bti6yar0baBXEj5skF52jL7tfqBjHiajrAWx02apRaDO/IIn02jI5LP0Rih7WcIhl
 fbCXJt/eipgti7w5NLoCXCqPtbAfkXpjbJDlk1k3AkrM5DdR8xF8ow1Nu8WDM0se0p
 Qr3l6Pmv9rg9HN1z0Hm20v0U4dxgoOmEM1Q5aacbaceKxGobpVhRKCAQtYCUHH+L9u
 nDOd7dqVcb/ktHQOrPJeCCBEd4kyfhhkSCX7mSJ4zEjFwiuIZzs3u4U3NM+pEVm8H7
 MeKC50u/fcRKzeU58A4NRyCwPYn9leAycvf5NocC3y4mYMW5EKMEHPRwAPbaoTQDqN
 nBbiFzCzHQU0w==
Received: from localhost.localdomain (mr38p00im-dlb-asmtp-mailmevip.me.com
 [17.57.152.18])
 by mr85p00im-ztdg06021701.me.com (Postfix) with ESMTPSA id 022EF2633830;
 Tue,  2 May 2023 09:23:58 +0000 (UTC)
From: Mads Ynddal <mads@ynddal.dk>
To: qemu-devel@nongnu.org
Cc: Cleber Rosa <crosa@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 John Snow <jsnow@redhat.com>, Mads Ynddal <mads@ynddal.dk>,
 Mads Ynddal <m.ynddal@samsung.com>
Subject: [PATCH v2 06/12] simpletrace: Simplify construction of tracing methods
Date: Tue,  2 May 2023 11:23:33 +0200
Message-Id: <20230502092339.27341-7-mads@ynddal.dk>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230502092339.27341-1-mads@ynddal.dk>
References: <20230502092339.27341-1-mads@ynddal.dk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
index 10ca093046..f6b40d56f6 100755
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
 
@@ -189,34 +198,11 @@ def process(events, log, analyzer_class, read_header=True):
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
@@ -240,24 +226,18 @@ def run(analyzer):
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
 
     run(Formatter())
-- 
2.38.1


