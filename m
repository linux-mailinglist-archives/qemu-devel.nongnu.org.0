Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EB566F4011
	for <lists+qemu-devel@lfdr.de>; Tue,  2 May 2023 11:25:37 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ptmFT-000556-8H; Tue, 02 May 2023 05:24:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mads@ynddal.dk>) id 1ptmFR-00054x-Q6
 for qemu-devel@nongnu.org; Tue, 02 May 2023 05:24:37 -0400
Received: from mr85p00im-ztdg06021701.me.com ([17.58.23.196])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mads@ynddal.dk>) id 1ptmFQ-00043d-9I
 for qemu-devel@nongnu.org; Tue, 02 May 2023 05:24:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ynddal.dk; s=sig1;
 t=1683019475; bh=i6DKa/m8dKL3A4IVuxqhXIHlzicfl8iFYODS5hxoS4w=;
 h=From:To:Subject:Date:Message-Id:MIME-Version:Content-Type;
 b=fNRSw7YFqKtfERksteKgXJ8WzeQkvyRRLpb47LcCLyeiTynV6PwWeSBl+i0zV3HTy
 I/LMkPtwtDaKH02KUneMKmVofMl9+RvGaW5Is6M+6DgHG6rdsU0en3bR9x6TdqgNKw
 W1zEgzw4CdcAq5fJV+LggiurOct/ZptWTidbN1oOkDhP6zucDULI9vM/grfOv9hKUE
 lxqoQY/4oIcAM5Qi9vvay2HeFJDhGPy04i0fRtOpWLRTtcMBHf2uLB6dw3wq6oz3cS
 eQ6E8p5KKqNqm5mxTv1HyXvrFiVMt2GzF/uoUAUzIrV9CCc4Jk/a7+Fr3YFR6XTI80
 1XgvZ69Qq7wYA==
Received: from localhost.localdomain (mr38p00im-dlb-asmtp-mailmevip.me.com
 [17.57.152.18])
 by mr85p00im-ztdg06021701.me.com (Postfix) with ESMTPSA id 528E826339F0;
 Tue,  2 May 2023 09:24:33 +0000 (UTC)
From: Mads Ynddal <mads@ynddal.dk>
To: qemu-devel@nongnu.org
Cc: Cleber Rosa <crosa@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 John Snow <jsnow@redhat.com>, Mads Ynddal <mads@ynddal.dk>,
 Mads Ynddal <m.ynddal@samsung.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v2 08/12] simpletrace: define exception and add handling
Date: Tue,  2 May 2023 11:23:35 +0200
Message-Id: <20230502092339.27341-9-mads@ynddal.dk>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230502092339.27341-1-mads@ynddal.dk>
References: <20230502092339.27341-1-mads@ynddal.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

Define `SimpleException` to differentiate our exceptions from generic
exceptions (IOError, etc.). Adapted simpletrace to support this and
output to stderr.

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Signed-off-by: Mads Ynddal <m.ynddal@samsung.com>
---
 scripts/simpletrace.py | 22 ++++++++++++++--------
 1 file changed, 14 insertions(+), 8 deletions(-)

diff --git a/scripts/simpletrace.py b/scripts/simpletrace.py
index e77cb2469c..3cf34103e4 100755
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
@@ -207,8 +210,7 @@ def run(analyzer):
         *no_header, trace_event_path, trace_file_path = sys.argv[1:]
         assert no_header == [] or no_header == ['--no-header'], 'Invalid no-header argument'
     except (AssertionError, ValueError):
-        sys.stderr.write(f'usage: {sys.argv[0]} [--no-header] <trace-events> <trace-file>\n')
-        sys.exit(1)
+        raise SimpleException(f'usage: {sys.argv[0]} [--no-header] <trace-events> <trace-file>\n')
 
     with open(trace_event_path, 'r') as events_fobj, open(trace_file_path, 'rb') as log_fobj:
         events = read_events(events_fobj, trace_event_path)
@@ -231,4 +233,8 @@ def catchall(self, *rec_args, event, timestamp_ns, pid, event_id):
             ]
             print(f'{event.name} {delta_ns / 1000:0.3f} {pid=} ' + ' '.join(fields))
 
-    run(Formatter())
+    try:
+        run(Formatter())
+    except SimpleException as e:
+        sys.stderr.write(e + "\n")
+        sys.exit(1)
-- 
2.38.1


