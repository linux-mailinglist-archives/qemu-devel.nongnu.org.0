Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A34C238B596
	for <lists+qemu-devel@lfdr.de>; Thu, 20 May 2021 19:55:06 +0200 (CEST)
Received: from localhost ([::1]:42396 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ljmsx-0005XA-VA
	for lists+qemu-devel@lfdr.de; Thu, 20 May 2021 13:55:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56178)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1ljmrF-0002ny-AQ
 for qemu-devel@nongnu.org; Thu, 20 May 2021 13:53:19 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:23063)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1ljmr1-0006an-AP
 for qemu-devel@nongnu.org; Thu, 20 May 2021 13:53:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621533182;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=os7xo38UCBmwKhLI/0JiqPA9x0+dfdx06a5GGU04Az0=;
 b=CWOhsn3UPe+bBtZ7/MEgrN97eMZ3EGpeo7v4XRBFNODQANJaxBZSzSfthcHKZyNeizj3q3
 hNyYLYr2o0u+NWUQHzvoloNbMVc8YVKZUExrE08bx9J4HqyfudFk/UnxL1zOCXcdquFhh8
 2NDhtGvVaWHH4M3EoYY/aJotnAKjT9A=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-319-rTFWMTmfMp6n_Z0WWh1G4Q-1; Thu, 20 May 2021 13:53:00 -0400
X-MC-Unique: rTFWMTmfMp6n_Z0WWh1G4Q-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 91EC91926DA9;
 Thu, 20 May 2021 17:52:59 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-114-17.ams2.redhat.com
 [10.36.114.17])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 3F515610B0;
 Thu, 20 May 2021 17:52:59 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 5521D1132EA4; Thu, 20 May 2021 19:52:56 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 09/15] qapi: add must_match helper
Date: Thu, 20 May 2021 19:52:50 +0200
Message-Id: <20210520175256.1119684-10-armbru@redhat.com>
In-Reply-To: <20210520175256.1119684-1-armbru@redhat.com>
References: <20210520175256.1119684-1-armbru@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.39,
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
Cc: peter.maydell@linaro.org, John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: John Snow <jsnow@redhat.com>

Mypy cannot generally understand that these regex functions cannot
possibly fail. Add a "must_match" helper that makes this clear for
mypy.

Signed-off-by: John Snow <jsnow@redhat.com>
Message-Id: <20210519183951.3946870-10-jsnow@redhat.com>
Reviewed-by: Markus Armbruster <armbru@redhat.com>
Signed-off-by: Markus Armbruster <armbru@redhat.com>
---
 scripts/qapi/common.py |  8 +++++++-
 scripts/qapi/main.py   |  6 ++----
 scripts/qapi/parser.py | 13 +++++++------
 3 files changed, 16 insertions(+), 11 deletions(-)

diff --git a/scripts/qapi/common.py b/scripts/qapi/common.py
index cbd3fd81d3..6ad1eeb61d 100644
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
index 703e7ed1ed..f2ea6e0ce4 100644
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
index 7c71866195..48137d3fbe 100644
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
2.26.3


