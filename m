Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DF75369DC83
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Feb 2023 10:03:23 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pUOWg-0007m8-IL; Tue, 21 Feb 2023 04:01:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mads@ynddal.dk>) id 1pUOWe-0007kz-3s
 for qemu-devel@nongnu.org; Tue, 21 Feb 2023 04:01:28 -0500
Received: from mr85p00im-ztdg06011201.me.com ([17.58.23.181])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mads@ynddal.dk>) id 1pUOWc-0005Xl-EQ
 for qemu-devel@nongnu.org; Tue, 21 Feb 2023 04:01:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ynddal.dk; s=sig1;
 t=1676970085; bh=x91kESM8BSQWnznHZQrSejKxgQ5+SmVdkf/WYsOczh8=;
 h=From:To:Subject:Date:Message-Id:MIME-Version;
 b=HTDO4uQLHZ0zUimR1ZMp3y1QQpWEethMJ/OADSRVkrwZpG2x33t3kEB2989P/zUQH
 15nILllmJIUQYYgkjQVHCWE2VUTZEha0+QUo1udGxjayPhMexb7Fo+1h6oWFJU8wKP
 vvKzyxRBvDSSW4ZlZcz8jogNh8fV6rwFUmy34AQXgUoNWUffiKs73DmCOh2qJyXPeu
 w57kJFFT70j/PQVA7rxXPSsZxdmS9eoIKvadSRjZhYYt2+QdxdYfRs0MxZD3JzW/KB
 xDsgiOfccobpSbKnUqmYgWKVe5bZreNF/m5V31EuVNuxF7vNd6PS8rkaDRjP4nOc7A
 Qblc83uQHZiuQ==
Received: from localhost.localdomain (mr38p00im-dlb-asmtp-mailmevip.me.com
 [17.57.152.18])
 by mr85p00im-ztdg06011201.me.com (Postfix) with ESMTPSA id E04849620E5;
 Tue, 21 Feb 2023 09:01:23 +0000 (UTC)
From: Mads Ynddal <mads@ynddal.dk>
To: qemu-devel@nongnu.org
Cc: John Snow <jsnow@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Cleber Rosa <crosa@redhat.com>, Mads Ynddal <m.ynddal@samsung.com>
Subject: [PATCH 8/9] simpletrace: define exception and add handling
Date: Tue, 21 Feb 2023 10:01:03 +0100
Message-Id: <20230221090104.86103-9-mads@ynddal.dk>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230221090104.86103-1-mads@ynddal.dk>
References: <20230221090104.86103-1-mads@ynddal.dk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: zJRubo34omgtV4CQwHKlwOFt9QzQJA8w
X-Proofpoint-GUID: zJRubo34omgtV4CQwHKlwOFt9QzQJA8w
X-Proofpoint-Virus-Version: =?UTF-8?Q?vendor=3Dfsecure_engine=3D1.1.170-22c6f66c430a71ce266a39bfe25bc?=
 =?UTF-8?Q?2903e8d5c8f:6.0.425,18.0.816,17.0.605.474.0000000_definitions?=
 =?UTF-8?Q?=3D2022-01-18=5F01:2022-01-14=5F01,2022-01-18=5F01,2020-01-23?=
 =?UTF-8?Q?=5F02_signatures=3D0?=
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0
 mlxlogscore=696
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

Define `SimpleException` to differentiate our exceptions from generic
exceptions (IOError, etc.). Adapted simpletrace to support this and
output to stderr.

Signed-off-by: Mads Ynddal <m.ynddal@samsung.com>
---
 scripts/simpletrace.py | 23 +++++++++++++++--------
 1 file changed, 15 insertions(+), 8 deletions(-)

diff --git a/scripts/simpletrace.py b/scripts/simpletrace.py
index 61af68618f..35d2a757c4 100755
--- a/scripts/simpletrace.py
+++ b/scripts/simpletrace.py
@@ -25,12 +25,15 @@
 log_header_fmt = '=QQQ' # trace/simple.c::TraceLogHeader
 rec_header_fmt = '=QQII' # trace/simple.c::TraceRecord
 
+class SimpleException(Exception):
+    pass
+
 def read_header(fobj, hfmt):
     '''Read a trace record header'''
     hlen = struct.calcsize(hfmt)
     hdr = fobj.read(hlen)
     if len(hdr) != hlen:
-        raise ValueError('Error reading header. Wrong filetype provided?')
+        raise SimpleException('Error reading header. Wrong filetype provided?')
     return struct.unpack(hfmt, hdr)
 
 def get_record(event_mapping, event_id_to_name, rechdr, fobj):
@@ -42,10 +45,10 @@ def get_record(event_mapping, event_id_to_name, rechdr, fobj):
         try:
             event = event_mapping[name]
         except KeyError as e:
-            sys.stderr.write(f'{e} event is logged but is not declared ' \
-                             'in the trace events file, try using ' \
-                             'trace-events-all instead.\n')
-            sys.exit(1)
+            raise SimpleException(
+                f'{e} event is logged but is not declared in the trace events'
+                'file, try using trace-events-all instead.'
+            )
 
         rec = (name, timestamp_ns, pid)
         for type, name in event.args:
@@ -201,8 +204,7 @@ def run(analyzer):
         *no_header, trace_event_path, trace_file_path = sys.argv[1:]
         assert no_header == [] or no_header == ['--no-header'], 'Invalid no-header argument'
     except (AssertionError, ValueError):
-        sys.stderr.write(f'usage: {sys.argv[0]} [--no-header] <trace-events> <trace-file>\n')
-        sys.exit(1)
+        raise SimpleException(f'usage: {sys.argv[0]} [--no-header] <trace-events> <trace-file>\n')
 
     with open(trace_event_path, 'r') as events_fobj, open(trace_file_path, 'rb') as log_fobj:
         events = read_events(events_fobj, trace_event_path)
@@ -225,4 +227,9 @@ def catchall(self, *rec_args, event, timestamp_ns, pid, event_id):
             ]
             print(f'{event.name} {delta_ns / 1000:0.3f} {pid=} ' + ' '.join(fields))
 
-    run(Formatter)
+    try:
+        run(Formatter)
+    except SimpleException as e:
+        sys.stderr.write(e + "\n")
+        sys.exit(1)
+
-- 
2.38.1


