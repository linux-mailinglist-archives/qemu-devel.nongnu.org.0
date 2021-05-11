Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 12C3D37B173
	for <lists+qemu-devel@lfdr.de>; Wed, 12 May 2021 00:12:26 +0200 (CEST)
Received: from localhost ([::1]:33800 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lgac5-0005HF-1w
	for lists+qemu-devel@lfdr.de; Tue, 11 May 2021 18:12:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55702)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lgaW8-0007Uz-UD
 for qemu-devel@nongnu.org; Tue, 11 May 2021 18:06:16 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:44088)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lgaW6-0006Rd-Ob
 for qemu-devel@nongnu.org; Tue, 11 May 2021 18:06:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620770774;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8nOQsNt8acyCnBU2ptkWNXXNpOfhla1lorwI4QOI0Pc=;
 b=b6h4Jv6zFb/tmP+UCa7ZOqb3Vp5jRGyVqPBqK6w/6hGr2S4pxyREKSbSbb7Joef+BOZDKa
 kuFghMEB8eN1ZfoSX+tpTmUMpm3loVl8LsozQHsMBvZTqCmehH8OsbVaXEIs0A5DEtQeaA
 Jc7dK/r3+rHaJZWcEzDlHhCAe3oe8/0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-172-7nbL9VY_P4qLoGJU-ooZRw-1; Tue, 11 May 2021 18:06:12 -0400
X-MC-Unique: 7nbL9VY_P4qLoGJU-ooZRw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B1553101371B;
 Tue, 11 May 2021 22:06:11 +0000 (UTC)
Received: from scv.redhat.com (ovpn-117-64.rdu2.redhat.com [10.10.117.64])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 94BD960CC9;
 Tue, 11 May 2021 22:06:10 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 09/21] qapi: add must_match helper
Date: Tue, 11 May 2021 18:05:49 -0400
Message-Id: <20210511220601.2110055-10-jsnow@redhat.com>
In-Reply-To: <20210511220601.2110055-1-jsnow@redhat.com>
References: <20210511220601.2110055-1-jsnow@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Michael Roth <michael.roth@amd.com>, John Snow <jsnow@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Mypy cannot generally understand that these regex functions cannot
possibly fail. Add a "must_match" helper that makes this clear for
mypy.

Signed-off-by: John Snow <jsnow@redhat.com>
---
 scripts/qapi/common.py |  8 +++++++-
 scripts/qapi/main.py   |  6 ++----
 scripts/qapi/parser.py | 13 +++++++------
 3 files changed, 16 insertions(+), 11 deletions(-)

diff --git a/scripts/qapi/common.py b/scripts/qapi/common.py
index cbd3fd81d36..6ad1eeb61d4 100644
--- a/scripts/qapi/common.py
+++ b/scripts/qapi/common.py
@@ -12,7 +12,7 @@
 # See the COPYING file in the top-level directory.
 
 import re
-from typing import Optional, Sequence
+from typing import Match, Optional, Sequence
 
 
 #: Magic string that gets removed along with all space to its right.
@@ -210,3 +210,9 @@ def gen_endif(ifcond: Sequence[str]) -> str:
 #endif /* %(cond)s */
 ''', cond=ifc)
     return ret
+
+
+def must_match(pattern: str, string: str) -> Match[str]:
+    match = re.match(pattern, string)
+    assert match is not None
+    return match
diff --git a/scripts/qapi/main.py b/scripts/qapi/main.py
index 703e7ed1ed5..f2ea6e0ce4a 100644
--- a/scripts/qapi/main.py
+++ b/scripts/qapi/main.py
@@ -8,11 +8,11 @@
 """
 
 import argparse
-import re
 import sys
 from typing import Optional
 
 from .commands import gen_commands
+from .common import must_match
 from .error import QAPIError
 from .events import gen_events
 from .introspect import gen_introspect
@@ -22,9 +22,7 @@
 
 
 def invalid_prefix_char(prefix: str) -> Optional[str]:
-    match = re.match(r'([A-Za-z_.-][A-Za-z0-9_.-]*)?', prefix)
-    # match cannot be None, but mypy cannot infer that.
-    assert match is not None
+    match = must_match(r'([A-Za-z_.-][A-Za-z0-9_.-]*)?', prefix)
     if match.end() != len(prefix):
         return prefix[match.end()]
     return None
diff --git a/scripts/qapi/parser.py b/scripts/qapi/parser.py
index 5ef1b8935e6..39de24785ac 100644
--- a/scripts/qapi/parser.py
+++ b/scripts/qapi/parser.py
@@ -18,6 +18,7 @@
 import os
 import re
 
+from .common import must_match
 from .error import QAPISemError, QAPISourceError
 from .source import QAPISourceInfo
 
@@ -238,8 +239,8 @@ def accept(self, skip_comment=True):
             elif not self.tok.isspace():
                 # Show up to next structural, whitespace or quote
                 # character
-                match = re.match('[^[\\]{}:,\\s\'"]+',
-                                 self.src[self.cursor-1:])
+                match = must_match('[^[\\]{}:,\\s\'"]+',
+                                   self.src[self.cursor-1:])
                 raise QAPIParseError(self, "stray '%s'" % match.group(0))
 
     def get_members(self):
@@ -369,7 +370,7 @@ def append(self, line):
             # Strip leading spaces corresponding to the expected indent level
             # Blank lines are always OK.
             if line:
-                indent = re.match(r'\s*', line).end()
+                indent = must_match(r'\s*', line).end()
                 if indent < self._indent:
                     raise QAPIParseError(
                         self._parser,
@@ -505,7 +506,7 @@ def _append_args_line(self, line):
             # from line and replace it with spaces so that 'f' has the
             # same index as it did in the original line and can be
             # handled the same way we will handle following lines.
-            indent = re.match(r'@\S*:\s*', line).end()
+            indent = must_match(r'@\S*:\s*', line).end()
             line = line[indent:]
             if not line:
                 # Line was just the "@arg:" header; following lines
@@ -540,7 +541,7 @@ def _append_features_line(self, line):
             # from line and replace it with spaces so that 'f' has the
             # same index as it did in the original line and can be
             # handled the same way we will handle following lines.
-            indent = re.match(r'@\S*:\s*', line).end()
+            indent = must_match(r'@\S*:\s*', line).end()
             line = line[indent:]
             if not line:
                 # Line was just the "@arg:" header; following lines
@@ -586,7 +587,7 @@ def _append_various_line(self, line):
             # from line and replace it with spaces so that 'f' has the
             # same index as it did in the original line and can be
             # handled the same way we will handle following lines.
-            indent = re.match(r'\S*:\s*', line).end()
+            indent = must_match(r'\S*:\s*', line).end()
             line = line[indent:]
             if not line:
                 # Line was just the "Section:" header; following lines
-- 
2.30.2


