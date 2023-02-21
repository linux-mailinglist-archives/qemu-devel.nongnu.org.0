Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E98E69DC87
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Feb 2023 10:04:37 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pUOWU-0007eU-Vg; Tue, 21 Feb 2023 04:01:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mads@ynddal.dk>) id 1pUOWT-0007e8-3T
 for qemu-devel@nongnu.org; Tue, 21 Feb 2023 04:01:17 -0500
Received: from mr85p00im-ztdg06011201.me.com ([17.58.23.181])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mads@ynddal.dk>) id 1pUOWR-0005Su-2z
 for qemu-devel@nongnu.org; Tue, 21 Feb 2023 04:01:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ynddal.dk; s=sig1;
 t=1676970071; bh=gyQnCVNzCEHVqVEoI58x5xyPhDVaVkRYebDl9/4EbWs=;
 h=From:To:Subject:Date:Message-Id:MIME-Version;
 b=OdXbchtSCBOhe4ClOJ7lAcK+RvXMEFv4Oiwhf/ShKLz6uQi3sDfhAjj5ZtHkom67I
 AL5wfbmRiP4QSAOnLk0pI5BP4rgafIJF4WaEkUVp5s0y0ZHWZWqKEzkf5Jyw0JKEl1
 96o6opRXBdhQBge3LhronaAgfaitB0qTAWzV3wETWpP4+Odd+EThvX/GnhRRtBeo0X
 E+/RmTV7F3oi6oDbJs9nU2gSQt/AUGTg1teP3wczVchmvIYYKUEa85Skx44FJF1Z0r
 8jK9V9aTc6Ymig5bv5hoO72rx2zibMSQnJvWGqyZMYlhzSzTuQ5dWHreHOVUYp/SAv
 6eJL3Lk6tMulQ==
Received: from localhost.localdomain (mr38p00im-dlb-asmtp-mailmevip.me.com
 [17.57.152.18])
 by mr85p00im-ztdg06011201.me.com (Postfix) with ESMTPSA id 11C209629C2;
 Tue, 21 Feb 2023 09:01:09 +0000 (UTC)
From: Mads Ynddal <mads@ynddal.dk>
To: qemu-devel@nongnu.org
Cc: John Snow <jsnow@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Cleber Rosa <crosa@redhat.com>, Mads Ynddal <m.ynddal@samsung.com>
Subject: [PATCH 1/9] simpletrace: Improve parsing of sys.argv;
 fix files never closed.
Date: Tue, 21 Feb 2023 10:00:56 +0100
Message-Id: <20230221090104.86103-2-mads@ynddal.dk>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230221090104.86103-1-mads@ynddal.dk>
References: <20230221090104.86103-1-mads@ynddal.dk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: Vr-dEIAdOUs3DDOmtY6XERk7hsi-dRPg
X-Proofpoint-GUID: Vr-dEIAdOUs3DDOmtY6XERk7hsi-dRPg
X-Proofpoint-Virus-Version: =?UTF-8?Q?vendor=3Dfsecure_engine=3D1.1.170-22c6f66c430a71ce266a39bfe25bc?=
 =?UTF-8?Q?2903e8d5c8f:6.0.425,18.0.816,17.0.605.474.0000000_definitions?=
 =?UTF-8?Q?=3D2022-01-18=5F01:2022-01-14=5F01,2022-01-18=5F01,2020-01-23?=
 =?UTF-8?Q?=5F02_signatures=3D0?=
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0
 mlxlogscore=643
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

The arguments extracted from `sys.argv` named and unpacked to make it
clear what the arguments are and what they're used for.

The two input files were opened, but never explicitly closed. File usage
changed to use `with` statement to take care of this. At the same time,
ownership of the file-object is moved up to `run` function. Secondary `open`
inside `process` removed so there's only one place to handle `open`.

Signed-off-by: Mads Ynddal <m.ynddal@samsung.com>
---
 scripts/simpletrace.py | 28 +++++++++++-----------------
 1 file changed, 11 insertions(+), 17 deletions(-)

diff --git a/scripts/simpletrace.py b/scripts/simpletrace.py
index 1f6d1ae1f3..9211caaec1 100755
--- a/scripts/simpletrace.py
+++ b/scripts/simpletrace.py
@@ -9,6 +9,7 @@
 #
 # For help see docs/devel/tracing.rst
 
+import sys
 import struct
 import inspect
 from tracetool import read_events, Event
@@ -44,7 +45,6 @@ def get_record(edict, idtoname, rechdr, fobj):
         try:
             event = edict[name]
         except KeyError as e:
-            import sys
             sys.stderr.write('%s event is logged but is not declared ' \
                              'in the trace events file, try using ' \
                              'trace-events-all instead.\n' % str(e))
@@ -166,11 +166,6 @@ def end(self):
 
 def process(events, log, analyzer, read_header=True):
     """Invoke an analyzer on each event in a log."""
-    if isinstance(events, str):
-        events = read_events(open(events, 'r'), events)
-    if isinstance(log, str):
-        log = open(log, 'rb')
-
     if read_header:
         read_trace_header(log)
 
@@ -223,19 +218,18 @@ def run(analyzer):
 
     This function is useful as a driver for simple analysis scripts.  More
     advanced scripts will want to call process() instead."""
-    import sys
-
-    read_header = True
-    if len(sys.argv) == 4 and sys.argv[1] == '--no-header':
-        read_header = False
-        del sys.argv[1]
-    elif len(sys.argv) != 3:
-        sys.stderr.write('usage: %s [--no-header] <trace-events> ' \
-                         '<trace-file>\n' % sys.argv[0])
+
+    try:
+        # NOTE: See built-in `argparse` module for a more robust cli interface
+        *no_header, trace_event_path, trace_file_path = sys.argv[1:]
+        assert no_header == [] or no_header == ['--no-header'], 'Invalid no-header argument'
+    except (AssertionError, ValueError):
+        sys.stderr.write(f'usage: {sys.argv[0]} [--no-header] <trace-events> <trace-file>\n')
         sys.exit(1)
 
-    events = read_events(open(sys.argv[1], 'r'), sys.argv[1])
-    process(events, sys.argv[2], analyzer, read_header=read_header)
+    with open(trace_event_path, 'r') as events_fobj, open(trace_file_path, 'rb') as log_fobj:
+        events = read_events(events_fobj, trace_event_path)
+        process(events, log_fobj, analyzer, read_header=not no_header)
 
 if __name__ == '__main__':
     class Formatter(Analyzer):
-- 
2.38.1


