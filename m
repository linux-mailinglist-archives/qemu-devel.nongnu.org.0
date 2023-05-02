Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B7BD6F401C
	for <lists+qemu-devel@lfdr.de>; Tue,  2 May 2023 11:26:11 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ptmEr-00050Y-Ga; Tue, 02 May 2023 05:24:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mads@ynddal.dk>) id 1ptmEq-00050A-0u
 for qemu-devel@nongnu.org; Tue, 02 May 2023 05:24:00 -0400
Received: from mr85p00im-ztdg06021701.me.com ([17.58.23.196])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mads@ynddal.dk>) id 1ptmEk-0003zq-VA
 for qemu-devel@nongnu.org; Tue, 02 May 2023 05:23:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ynddal.dk; s=sig1;
 t=1683019433; bh=/KmlytnpwbgD49q4DS/EcNt6l8csM0KFrKLmm68kPao=;
 h=From:To:Subject:Date:Message-Id:MIME-Version:Content-Type;
 b=bO+aeN5qy0KHH3pY5T2G5P0BTwBzY+tZkdfmjb4uZmREzRMPDqpH1MSbNKgTquiic
 L8p9l6Ys+JURfK0f8CMqOOi9z8/FiDdgGaNHUxkRsi8aY3m9bVjcnSCO2ltPyfQfXr
 gxVBp0y6L4ht2LQWGumm6Il0G1lXdsNvD+ggToIiuVwmBZ48zZur1UFNzeeVY8xCMY
 x5EsQVlVXPrzKdKfRT+JBMaA1dCaeZSR3fmOOxCcOGsxp3jDNkQBEQdsbGo7jhyEQq
 PtbTaOGj3I9+EdMI/wDvIYpygL75WncQ0eagjR+DUMYpzWyohXFDpALesPuVeLGRC9
 wUETA/0WA1q4w==
Received: from localhost.localdomain (mr38p00im-dlb-asmtp-mailmevip.me.com
 [17.57.152.18])
 by mr85p00im-ztdg06021701.me.com (Postfix) with ESMTPSA id A4B50263363D;
 Tue,  2 May 2023 09:23:51 +0000 (UTC)
From: Mads Ynddal <mads@ynddal.dk>
To: qemu-devel@nongnu.org
Cc: Cleber Rosa <crosa@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 John Snow <jsnow@redhat.com>, Mads Ynddal <mads@ynddal.dk>,
 Mads Ynddal <m.ynddal@samsung.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v2 03/12] simpletrace: changed naming of edict and idtoname to
 improve readability
Date: Tue,  2 May 2023 11:23:30 +0200
Message-Id: <20230502092339.27341-4-mads@ynddal.dk>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230502092339.27341-1-mads@ynddal.dk>
References: <20230502092339.27341-1-mads@ynddal.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: PQTYx7dpOPA7u02HiOmSus87arTRD6vD
X-Proofpoint-ORIG-GUID: PQTYx7dpOPA7u02HiOmSus87arTRD6vD
X-Proofpoint-Virus-Version: =?UTF-8?Q?vendor=3Dfsecure_engine=3D1.1.170-22c6f66c430a71ce266a39bfe25bc?=
 =?UTF-8?Q?2903e8d5c8f:6.0.425,18.0.816,17.11.62.513.0000000_definitions?=
 =?UTF-8?Q?=3D2022-01-18=5F01:2022-01-14=5F01,2022-01-18=5F01,2021-12-02?=
 =?UTF-8?Q?=5F01_signatures=3D0?=
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 adultscore=0 spamscore=0
 phishscore=0 clxscore=1030 mlxlogscore=747 bulkscore=0 malwarescore=0
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
 T_SCC_BODY_TEXT_LINE=-0.01,
 T_SPF_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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

Readability is subjective, but I've expanded the naming of the variables
and arguments, to help with understanding for new eyes on the code.

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Signed-off-by: Mads Ynddal <m.ynddal@samsung.com>
---
 scripts/simpletrace.py | 34 +++++++++++++++++-----------------
 1 file changed, 17 insertions(+), 17 deletions(-)

diff --git a/scripts/simpletrace.py b/scripts/simpletrace.py
index 7ba805443d..9981699630 100755
--- a/scripts/simpletrace.py
+++ b/scripts/simpletrace.py
@@ -33,17 +33,17 @@ def read_header(fobj, hfmt):
         return None
     return struct.unpack(hfmt, hdr)
 
-def get_record(edict, idtoname, rechdr, fobj):
+def get_record(event_mapping, event_id_to_name, rechdr, fobj):
     """Deserialize a trace record from a file into a tuple
        (name, timestamp, pid, arg1, ..., arg6)."""
     if rechdr is None:
         return None
     if rechdr[0] != dropped_event_id:
         event_id = rechdr[0]
-        name = idtoname[event_id]
+        name = event_id_to_name[event_id]
         rec = (name, rechdr[1], rechdr[3])
         try:
-            event = edict[name]
+            event = event_mapping[name]
         except KeyError as e:
             sys.stderr.write('%s event is logged but is not declared ' \
                              'in the trace events file, try using ' \
@@ -72,10 +72,10 @@ def get_mapping(fobj):
 
     return (event_id, name)
 
-def read_record(edict, idtoname, fobj):
+def read_record(event_mapping, event_id_to_name, fobj):
     """Deserialize a trace record from a file into a tuple (event_num, timestamp, pid, arg1, ..., arg6)."""
     rechdr = read_header(fobj, rec_header_fmt)
-    return get_record(edict, idtoname, rechdr, fobj)
+    return get_record(event_mapping, event_id_to_name, rechdr, fobj)
 
 def read_trace_header(fobj):
     """Read and verify trace file header"""
@@ -96,14 +96,14 @@ def read_trace_header(fobj):
         raise ValueError('Log format %d not supported with this QEMU release!'
                          % log_version)
 
-def read_trace_records(edict, idtoname, fobj):
+def read_trace_records(event_mapping, event_id_to_name, fobj):
     """Deserialize trace records from a file, yielding record tuples (event_num, timestamp, pid, arg1, ..., arg6).
 
-    Note that `idtoname` is modified if the file contains mapping records.
+    Note that `event_id_to_name` is modified if the file contains mapping records.
 
     Args:
-        edict (str -> Event): events dict, indexed by name
-        idtoname (int -> str): event names dict, indexed by event ID
+        event_mapping (str -> Event): events dict, indexed by name
+        event_id_to_name (int -> str): event names dict, indexed by event ID
         fobj (file): input file
 
     """
@@ -115,9 +115,9 @@ def read_trace_records(edict, idtoname, fobj):
         (rectype, ) = struct.unpack('=Q', t)
         if rectype == record_type_mapping:
             event_id, name = get_mapping(fobj)
-            idtoname[event_id] = name
+            event_id_to_name[event_id] = name
         else:
-            rec = read_record(edict, idtoname, fobj)
+            rec = read_record(event_mapping, event_id_to_name, fobj)
 
             yield rec
 
@@ -172,16 +172,16 @@ def process(events, log, analyzer, read_header=True):
     frameinfo = inspect.getframeinfo(inspect.currentframe())
     dropped_event = Event.build("Dropped_Event(uint64_t num_events_dropped)",
                                 frameinfo.lineno + 1, frameinfo.filename)
-    edict = {"dropped": dropped_event}
-    idtoname = {dropped_event_id: "dropped"}
+    event_mapping = {"dropped": dropped_event}
+    event_id_to_name = {dropped_event_id: "dropped"}
 
     for event in events:
-        edict[event.name] = event
+        event_mapping[event.name] = event
 
     # If there is no header assume event ID mapping matches events list
     if not read_header:
         for event_id, event in enumerate(events):
-            idtoname[event_id] = event.name
+            event_id_to_name[event_id] = event.name
 
     def build_fn(analyzer, event):
         if isinstance(event, str):
@@ -205,9 +205,9 @@ def build_fn(analyzer, event):
 
     analyzer.begin()
     fn_cache = {}
-    for rec in read_trace_records(edict, idtoname, log):
+    for rec in read_trace_records(event_mapping, event_id_to_name, log):
         event_num = rec[0]
-        event = edict[event_num]
+        event = event_mapping[event_num]
         if event_num not in fn_cache:
             fn_cache[event_num] = build_fn(analyzer, event)
         fn_cache[event_num](event, rec)
-- 
2.38.1


