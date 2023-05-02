Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C04106F401B
	for <lists+qemu-devel@lfdr.de>; Tue,  2 May 2023 11:26:10 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ptmFR-00054v-MO; Tue, 02 May 2023 05:24:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mads@ynddal.dk>) id 1ptmFP-00054E-Kb
 for qemu-devel@nongnu.org; Tue, 02 May 2023 05:24:35 -0400
Received: from mr85p00im-ztdg06021701.me.com ([17.58.23.196])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mads@ynddal.dk>) id 1ptmFN-00043S-R0
 for qemu-devel@nongnu.org; Tue, 02 May 2023 05:24:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ynddal.dk; s=sig1;
 t=1683019472; bh=sCL7u+UhJwxQZ2a/xWumax2lo1QYXCfoz8z/0fdBaZ8=;
 h=From:To:Subject:Date:Message-Id:MIME-Version;
 b=FTAl+tPK4P0ramwQFZwbusQwXhPoxk4grDje5/HI9eIRPihpNc9mFk68j4hWTjUHE
 Ho89FOv3ro06x1fOGQOfJeLHYGmt/Qb2+cYjgxXLKWhtYxokqhZnEgViKBiXaIQo9h
 Xsnzr6cSKiXG0Wa0e/FB+ll5dxTfIoxDiKypkP8N2/6yvLpNMTOxXmCvX5oawAYy/g
 bpQhuowQ4i5G8sn2dt4QEuOtcAR2DTmb0MSPWhPE2QUPm9Y3acIAA5h4GdK3BKXRvu
 y6r50bUK5gSvma/g36djKWVuLljSFXZHx/B2o74Vx9Jvgk7iT4OiBA0stlYLxodd2F
 01jvbUGoiC7uw==
Received: from localhost.localdomain (mr38p00im-dlb-asmtp-mailmevip.me.com
 [17.57.152.18])
 by mr85p00im-ztdg06021701.me.com (Postfix) with ESMTPSA id 7237E26337D1;
 Tue,  2 May 2023 09:24:31 +0000 (UTC)
From: Mads Ynddal <mads@ynddal.dk>
To: qemu-devel@nongnu.org
Cc: Cleber Rosa <crosa@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 John Snow <jsnow@redhat.com>, Mads Ynddal <mads@ynddal.dk>,
 Mads Ynddal <m.ynddal@samsung.com>
Subject: [PATCH v2 07/12] simpletrace: Improved error handling on struct unpack
Date: Tue,  2 May 2023 11:23:34 +0200
Message-Id: <20230502092339.27341-8-mads@ynddal.dk>
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

A failed call to `read_header` wouldn't be handled the same for the two
different code paths (one path would try to use `None` as a list).
Changed to raise exception to be handled centrally. This also allows for
easier unpacking, as errors has been filtered out.

Signed-off-by: Mads Ynddal <m.ynddal@samsung.com>
---
 scripts/simpletrace.py | 41 ++++++++++++++++-------------------------
 1 file changed, 16 insertions(+), 25 deletions(-)

diff --git a/scripts/simpletrace.py b/scripts/simpletrace.py
index f6b40d56f6..e77cb2469c 100755
--- a/scripts/simpletrace.py
+++ b/scripts/simpletrace.py
@@ -30,26 +30,24 @@ def read_header(fobj, hfmt):
     hlen = struct.calcsize(hfmt)
     hdr = fobj.read(hlen)
     if len(hdr) != hlen:
-        return None
+        raise ValueError('Error reading header. Wrong filetype provided?')
     return struct.unpack(hfmt, hdr)
 
 def get_record(event_mapping, event_id_to_name, rechdr, fobj):
     """Deserialize a trace record from a file into a tuple
        (name, timestamp, pid, arg1, ..., arg6)."""
-    if rechdr is None:
-        return None
-    if rechdr[0] != dropped_event_id:
-        event_id = rechdr[0]
+    event_id, timestamp_ns, length, pid = rechdr
+    if event_id != dropped_event_id:
         name = event_id_to_name[event_id]
-        rec = (name, rechdr[1], rechdr[3])
         try:
             event = event_mapping[name]
         except KeyError as e:
-            sys.stderr.write('%s event is logged but is not declared ' \
+            sys.stderr.write(f'{e} event is logged but is not declared ' \
                              'in the trace events file, try using ' \
-                             'trace-events-all instead.\n' % str(e))
+                             'trace-events-all instead.\n')
             sys.exit(1)
 
+        rec = (name, timestamp_ns, pid)
         for type, name in event.args:
             if is_string(type):
                 l = fobj.read(4)
@@ -60,9 +58,8 @@ def get_record(event_mapping, event_id_to_name, rechdr, fobj):
                 (value,) = struct.unpack('=Q', fobj.read(8))
                 rec = rec + (value,)
     else:
-        rec = ("dropped", rechdr[1], rechdr[3])
-        (value,) = struct.unpack('=Q', fobj.read(8))
-        rec = rec + (value,)
+        (dropped_count,) = struct.unpack('=Q', fobj.read(8))
+        rec = ("dropped", timestamp_ns, pid, dropped_count)
     return rec
 
 def get_mapping(fobj):
@@ -79,22 +76,16 @@ def read_record(event_mapping, event_id_to_name, fobj):
 
 def read_trace_header(fobj):
     """Read and verify trace file header"""
-    header = read_header(fobj, log_header_fmt)
-    if header is None:
-        raise ValueError('Not a valid trace file!')
-    if header[0] != header_event_id:
-        raise ValueError('Not a valid trace file, header id %d != %d' %
-                         (header[0], header_event_id))
-    if header[1] != header_magic:
-        raise ValueError('Not a valid trace file, header magic %d != %d' %
-                         (header[1], header_magic))
-
-    log_version = header[2]
+    _header_event_id, _header_magic, log_version = read_header(fobj, log_header_fmt)
+    if _header_event_id != header_event_id:
+        raise ValueError(f'Not a valid trace file, header id {_header_event_id} != {header_event_id}')
+    if _header_magic != header_magic:
+        raise ValueError(f'Not a valid trace file, header magic {_header_magic} != {header_magic}')
+
     if log_version not in [0, 2, 3, 4]:
-        raise ValueError('Unknown version of tracelog format!')
+        raise ValueError(f'Unknown version {log_version} of tracelog format!')
     if log_version != 4:
-        raise ValueError('Log format %d not supported with this QEMU release!'
-                         % log_version)
+        raise ValueError(f'Log format {log_version} not supported with this QEMU release!')
 
 def read_trace_records(event_mapping, event_id_to_name, fobj):
     """Deserialize trace records from a file, yielding record tuples (event_num, timestamp, pid, arg1, ..., arg6).
-- 
2.38.1


