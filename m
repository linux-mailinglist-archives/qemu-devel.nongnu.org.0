Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F06A16F4019
	for <lists+qemu-devel@lfdr.de>; Tue,  2 May 2023 11:25:53 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ptmFX-00056R-Pk; Tue, 02 May 2023 05:24:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mads@ynddal.dk>) id 1ptmFV-00055e-3z
 for qemu-devel@nongnu.org; Tue, 02 May 2023 05:24:41 -0400
Received: from mr85p00im-ztdg06021701.me.com ([17.58.23.196])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mads@ynddal.dk>) id 1ptmFT-00043s-4W
 for qemu-devel@nongnu.org; Tue, 02 May 2023 05:24:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ynddal.dk; s=sig1;
 t=1683019478; bh=7Ut4rJeVaGTYYjAuxVN37gMwYEe4oWe3wtuhlH37QOc=;
 h=From:To:Subject:Date:Message-Id:MIME-Version;
 b=hUxyt5M0HQKvtsixz5zRPTjObToTV9TVMYMnMgPCGnm9Bl1/2zgmulKHMaaaHzQKf
 ZxKMFzsziAoKSLFlMhz1/Xn3BkezlZK/C6Ty0f8eVsq2eVfu5ZIvHwxtUJ7FFK0ik2
 LcP2NVYZ0H2GgNrCpl2hezWySlBu9147eA5kmOPqzzixmRkdsAxadPYl//TbaFlEJH
 jM89QTk35Zv5ThDk4bLZTjQs9eTO05Qym33KQippQiaMYztO6R6h7WQrAsS9lJtPut
 oUMk3gIjaoNFrC1bOqRssY7rkxhLLQ4iyPmVWEujKN2UbwXLx5hEbyNevGqwnrGH/r
 EW842jKhi2IbA==
Received: from localhost.localdomain (mr38p00im-dlb-asmtp-mailmevip.me.com
 [17.57.152.18])
 by mr85p00im-ztdg06021701.me.com (Postfix) with ESMTPSA id 5D7332633AE0;
 Tue,  2 May 2023 09:24:35 +0000 (UTC)
From: Mads Ynddal <mads@ynddal.dk>
To: qemu-devel@nongnu.org
Cc: Cleber Rosa <crosa@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 John Snow <jsnow@redhat.com>, Mads Ynddal <mads@ynddal.dk>,
 Mads Ynddal <m.ynddal@samsung.com>
Subject: [PATCH v2 09/12] simpletrace: Refactor to separate responsibilities
Date: Tue,  2 May 2023 11:23:36 +0200
Message-Id: <20230502092339.27341-10-mads@ynddal.dk>
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

NOTE: `process` changes function signature

Moved event_mapping and event_id_to_name down one level in the function
call-stack to keep variable instantiation and usage closer (`process`
and `run` has no use of the variables; `read_trace_records` does).

Instead of passing event_mapping and event_id_to_name to the bottom of
the call-stack, we move their use to `read_trace_records`. This
separates responsibility and ownership of the information.

`read_record` now just reads the arguments from the file-object by
knowning the total number of bytes. Parsing it to specific arguments is
moved up to `read_trace_records`.

Special handling of dropped events removed, as they can be handled
by the general code.

Signed-off-by: Mads Ynddal <m.ynddal@samsung.com>
---
 scripts/simpletrace.py | 130 ++++++++++++++++++++---------------------
 1 file changed, 63 insertions(+), 67 deletions(-)

diff --git a/scripts/simpletrace.py b/scripts/simpletrace.py
index 3cf34103e4..2fcbcb77d0 100755
--- a/scripts/simpletrace.py
+++ b/scripts/simpletrace.py
@@ -24,6 +24,7 @@
 
 log_header_fmt = '=QQQ' # trace/simple.c::TraceLogHeader
 rec_header_fmt = '=QQII' # trace/simple.c::TraceRecord
+rec_header_fmt_len = struct.calcsize(rec_header_fmt)
 
 class SimpleException(Exception):
     pass
@@ -36,35 +37,6 @@ def read_header(fobj, hfmt):
         raise SimpleException('Error reading header. Wrong filetype provided?')
     return struct.unpack(hfmt, hdr)
 
-def get_record(event_mapping, event_id_to_name, rechdr, fobj):
-    """Deserialize a trace record from a file into a tuple
-       (name, timestamp, pid, arg1, ..., arg6)."""
-    event_id, timestamp_ns, length, pid = rechdr
-    if event_id != dropped_event_id:
-        name = event_id_to_name[event_id]
-        try:
-            event = event_mapping[name]
-        except KeyError as e:
-            raise SimpleException(
-                f'{e} event is logged but is not declared in the trace events'
-                'file, try using trace-events-all instead.'
-            )
-
-        rec = (name, timestamp_ns, pid)
-        for type, name in event.args:
-            if is_string(type):
-                l = fobj.read(4)
-                (len,) = struct.unpack('=L', l)
-                s = fobj.read(len)
-                rec = rec + (s,)
-            else:
-                (value,) = struct.unpack('=Q', fobj.read(8))
-                rec = rec + (value,)
-    else:
-        (dropped_count,) = struct.unpack('=Q', fobj.read(8))
-        rec = ("dropped", timestamp_ns, pid, dropped_count)
-    return rec
-
 def get_mapping(fobj):
     (event_id, ) = struct.unpack('=Q', fobj.read(8))
     (len, ) = struct.unpack('=L', fobj.read(4))
@@ -72,10 +44,11 @@ def get_mapping(fobj):
 
     return (event_id, name)
 
-def read_record(event_mapping, event_id_to_name, fobj):
-    """Deserialize a trace record from a file into a tuple (event_num, timestamp, pid, arg1, ..., arg6)."""
-    rechdr = read_header(fobj, rec_header_fmt)
-    return get_record(event_mapping, event_id_to_name, rechdr, fobj)
+def read_record(fobj):
+    """Deserialize a trace record from a file into a tuple (event_num, timestamp, pid, args)."""
+    event_id, timestamp_ns, record_length, record_pid = read_header(fobj, rec_header_fmt)
+    args_payload = fobj.read(record_length - rec_header_fmt_len)
+    return (event_id, timestamp_ns, record_pid, args_payload)
 
 def read_trace_header(fobj):
     """Read and verify trace file header"""
@@ -90,30 +63,60 @@ def read_trace_header(fobj):
     if log_version != 4:
         raise ValueError(f'Log format {log_version} not supported with this QEMU release!')
 
-def read_trace_records(event_mapping, event_id_to_name, fobj):
-    """Deserialize trace records from a file, yielding record tuples (event_num, timestamp, pid, arg1, ..., arg6).
-
-    Note that `event_id_to_name` is modified if the file contains mapping records.
+def read_trace_records(events, fobj, read_header):
+    """Deserialize trace records from a file, yielding record tuples (event, event_num, timestamp, pid, arg1, ..., arg6).
 
     Args:
         event_mapping (str -> Event): events dict, indexed by name
-        event_id_to_name (int -> str): event names dict, indexed by event ID
         fobj (file): input file
+        read_header (bool): whether headers were read from fobj
 
     """
-    while True:
-        t = fobj.read(8)
-        if len(t) == 0:
-            break
+    frameinfo = inspect.getframeinfo(inspect.currentframe())
+    dropped_event = Event.build("Dropped_Event(uint64_t num_events_dropped)",
+                                frameinfo.lineno + 1, frameinfo.filename)
+
+    event_mapping = {e.name: e for e in events}
+    event_mapping["dropped"] = dropped_event
+    event_id_to_name = {dropped_event_id: "dropped"}
 
+    # If there is no header assume event ID mapping matches events list
+    if not read_header:
+        for event_id, event in enumerate(events):
+            event_id_to_name[event_id] = event.name
+
+    while t := fobj.read(8):
         (rectype, ) = struct.unpack('=Q', t)
         if rectype == record_type_mapping:
-            event_id, name = get_mapping(fobj)
-            event_id_to_name[event_id] = name
+            event_id, event_name = get_mapping(fobj)
+            event_id_to_name[event_id] = event_name
         else:
-            rec = read_record(event_mapping, event_id_to_name, fobj)
-
-            yield rec
+            event_id, timestamp_ns, pid, args_payload = read_record(fobj)
+            event_name = event_id_to_name[event_id]
+
+            try:
+                event = event_mapping[event_name]
+            except KeyError as e:
+                raise SimpleException(
+                    f'{e} event is logged but is not declared in the trace events'
+                    'file, try using trace-events-all instead.'
+                )
+
+            offset = 0
+            args = []
+            for type, _ in event.args:
+                if is_string(type):
+                    (len,) = struct.unpack_from('=L', args_payload, offset=offset)
+                    offset += 4
+                    s = args_payload[offset:offset+len]
+                    offset += len
+                    args.append(s)
+                else:
+                    (value,) = struct.unpack_from('=Q', args_payload, offset=offset)
+                    offset += 8
+                    args.append(value)
+
+            yield (event_mapping[event_name], event_name, timestamp_ns, pid) + tuple(args)
 
 class Analyzer:
     """A trace file analyzer which processes trace records.
@@ -173,28 +176,22 @@ def __call__(self):
         With this function, it will work in both cases."""
         return self
 
-def process(events, log, analyzer_class, read_header=True):
-    """Invoke an analyzer on each event in a log."""
-    if read_header:
-        read_trace_header(log)
+def process(events_fobj, log_fobj, analyzer_class, read_header=True):
+    """Invoke an analyzer on each event in a log.
 
-    frameinfo = inspect.getframeinfo(inspect.currentframe())
-    dropped_event = Event.build("Dropped_Event(uint64_t num_events_dropped)",
-                                frameinfo.lineno + 1, frameinfo.filename)
-    event_mapping = {"dropped": dropped_event}
-    event_id_to_name = {dropped_event_id: "dropped"}
-
-    for event in events:
-        event_mapping[event.name] = event
+    Args:
+        events_fobj (file): file-object to read event data from
+        log_fobj (file): file-object to read log data from
+        analyzer_class (Analyzer): the Analyzer to interpret the event data
+        read_header (bool, optional): Whether to read header data from the log data. Defaults to True.
+    """
+    if read_header:
+        read_trace_header(log_fobj)
 
-    # If there is no header assume event ID mapping matches events list
-    if not read_header:
-        for event_id, event in enumerate(events):
-            event_id_to_name[event_id] = event.name
+    events = read_events(events_fobj, events_fobj.name)
 
     with analyzer_class() as analyzer:
-        for event_id, timestamp_ns, record_pid, *rec_args in read_trace_records(event_mapping, event_id_to_name, log):
-            event = event_mapping[event_id]
+        for event, event_id, timestamp_ns, record_pid, *rec_args in read_trace_records(events, log_fobj, read_header):
             fn = getattr(analyzer, event.name, analyzer.catchall)
             fn(*rec_args, event=event, event_id=event_id, timestamp_ns=timestamp_ns, pid=record_pid)
 
@@ -213,8 +210,7 @@ def run(analyzer):
         raise SimpleException(f'usage: {sys.argv[0]} [--no-header] <trace-events> <trace-file>\n')
 
     with open(trace_event_path, 'r') as events_fobj, open(trace_file_path, 'rb') as log_fobj:
-        events = read_events(events_fobj, trace_event_path)
-        process(events, log_fobj, analyzer, read_header=not no_header)
+        process(events_fobj, log_fobj, analyzer, read_header=not no_header)
 
 if __name__ == '__main__':
     class Formatter(Analyzer):
-- 
2.38.1


