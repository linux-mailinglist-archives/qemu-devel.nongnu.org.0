Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D9DF73677D7
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Apr 2021 05:18:29 +0200 (CEST)
Received: from localhost ([::1]:37372 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lZPrI-0001EA-UO
	for lists+qemu-devel@lfdr.de; Wed, 21 Apr 2021 23:18:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49146)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lZPgx-0006Ri-IM
 for qemu-devel@nongnu.org; Wed, 21 Apr 2021 23:07:47 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:50234)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lZPgk-0006TE-RM
 for qemu-devel@nongnu.org; Wed, 21 Apr 2021 23:07:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1619060852;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xpkhKvDHe9RkmkEsvTSqCffg5pJnPEUTyuWI8r+TjZk=;
 b=EPD7npMqIgiAdXFiYMgSph3HmM7Mnf1xsO/a74xhuIaHnqoOSQ/Tj0plbzTNgbq+ymHav3
 0F2gMbjZAJVMJtmWWb5sGzco8TaqTAXm1zF5tZHFtmM1KV+MvvP/q+UooXThqtkui8pVoE
 BAod1zK5UUzctkF0vHrNXOAK/DqkDRQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-306-i6Kw0kCOOGGzp1sbBkOACg-1; Wed, 21 Apr 2021 23:07:30 -0400
X-MC-Unique: i6Kw0kCOOGGzp1sbBkOACg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7416F18397A3;
 Thu, 22 Apr 2021 03:07:29 +0000 (UTC)
Received: from scv.redhat.com (ovpn-118-152.rdu2.redhat.com [10.10.118.152])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9D263607CB;
 Thu, 22 Apr 2021 03:07:28 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 09/22] qapi: add match_nofail helper
Date: Wed, 21 Apr 2021 23:07:07 -0400
Message-Id: <20210422030720.3685766-10-jsnow@redhat.com>
In-Reply-To: <20210422030720.3685766-1-jsnow@redhat.com>
References: <20210422030720.3685766-1-jsnow@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: Michael Roth <michael.roth@amd.com>, Cleber Rosa <crosa@redhat.com>,
 John Snow <jsnow@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Mypy cannot generally understand that these regex functions cannot
possibly fail. Add a _nofail helper that clarifies this for mypy.
Signed-off-by: John Snow <jsnow@redhat.com>
---
 scripts/qapi/common.py |  8 +++++++-
 scripts/qapi/main.py   |  6 ++----
 scripts/qapi/parser.py | 13 +++++++------
 3 files changed, 16 insertions(+), 11 deletions(-)

diff --git a/scripts/qapi/common.py b/scripts/qapi/common.py
index cbd3fd81d36..d38c1746767 100644
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
+def match_nofail(pattern: str, string: str) -> Match[str]:
+    match = re.match(pattern, string)
+    assert match is not None
+    return match
diff --git a/scripts/qapi/main.py b/scripts/qapi/main.py
index 70f8aa86f37..e8d4ba4b389 100644
--- a/scripts/qapi/main.py
+++ b/scripts/qapi/main.py
@@ -8,11 +8,11 @@
 """
 
 import argparse
-import re
 import sys
 from typing import Optional
 
 from .commands import gen_commands
+from .common import match_nofail
 from .error import QAPIError
 from .events import gen_events
 from .introspect import gen_introspect
@@ -22,9 +22,7 @@
 
 
 def invalid_prefix_char(prefix: str) -> Optional[str]:
-    match = re.match(r'([A-Za-z_.-][A-Za-z0-9_.-]*)?', prefix)
-    # match cannot be None, but mypy cannot infer that.
-    assert match is not None
+    match = match_nofail(r'([A-Za-z_.-][A-Za-z0-9_.-]*)?', prefix)
     if match.end() != len(prefix):
         return prefix[match.end()]
     return None
diff --git a/scripts/qapi/parser.py b/scripts/qapi/parser.py
index f2425c0228a..7f3c009f64b 100644
--- a/scripts/qapi/parser.py
+++ b/scripts/qapi/parser.py
@@ -18,6 +18,7 @@
 import os
 import re
 
+from .common import match_nofail
 from .error import QAPISemError, QAPISourceError
 from .source import QAPISourceInfo
 
@@ -235,8 +236,8 @@ def accept(self, skip_comment=True):
             elif not self.tok.isspace():
                 # Show up to next structural, whitespace or quote
                 # character
-                match = re.match('[^[\\]{}:,\\s\'"]+',
-                                 self.src[self.cursor-1:])
+                match = match_nofail('[^[\\]{}:,\\s\'"]+',
+                                     self.src[self.cursor-1:])
                 raise QAPIParseError(self, "stray '%s'" % match.group(0))
 
     def get_members(self):
@@ -369,7 +370,7 @@ def append(self, line):
             # Strip leading spaces corresponding to the expected indent level
             # Blank lines are always OK.
             if line:
-                indent = re.match(r'\s*', line).end()
+                indent = match_nofail(r'\s*', line).end()
                 if indent < self._indent:
                     raise QAPIParseError(
                         self._parser,
@@ -505,7 +506,7 @@ def _append_args_line(self, line):
             # from line and replace it with spaces so that 'f' has the
             # same index as it did in the original line and can be
             # handled the same way we will handle following lines.
-            indent = re.match(r'@\S*:\s*', line).end()
+            indent = match_nofail(r'@\S*:\s*', line).end()
             line = line[indent:]
             if not line:
                 # Line was just the "@arg:" header; following lines
@@ -540,7 +541,7 @@ def _append_features_line(self, line):
             # from line and replace it with spaces so that 'f' has the
             # same index as it did in the original line and can be
             # handled the same way we will handle following lines.
-            indent = re.match(r'@\S*:\s*', line).end()
+            indent = match_nofail(r'@\S*:\s*', line).end()
             line = line[indent:]
             if not line:
                 # Line was just the "@arg:" header; following lines
@@ -586,7 +587,7 @@ def _append_various_line(self, line):
             # from line and replace it with spaces so that 'f' has the
             # same index as it did in the original line and can be
             # handled the same way we will handle following lines.
-            indent = re.match(r'\S*:\s*', line).end()
+            indent = match_nofail(r'\S*:\s*', line).end()
             line = line[indent:]
             if not line:
                 # Line was just the "Section:" header; following lines
-- 
2.30.2


