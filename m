Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B98037B198
	for <lists+qemu-devel@lfdr.de>; Wed, 12 May 2021 00:23:28 +0200 (CEST)
Received: from localhost ([::1]:33126 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lgaml-0007Gs-ID
	for lists+qemu-devel@lfdr.de; Tue, 11 May 2021 18:23:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55850)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lgaWO-00006f-VV
 for qemu-devel@nongnu.org; Tue, 11 May 2021 18:06:32 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:47478)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lgaWM-0006eP-Sr
 for qemu-devel@nongnu.org; Tue, 11 May 2021 18:06:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620770790;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=L22ohg11je14HGZTcuKIEY1RXGdhUyC06NJGTwse8Ms=;
 b=Hn28Wjh7Wf9vUo8IsDJi0887XsJ8NFEtXqrirAg2JQxPHXvKI3dVmv5/JBAEwLDZLMZFym
 yukeDOtb1t2X0+U+e398wIQoAfI/q0craa9qnPnDsZerVZmmNqbSq4vi0urnC4PpHK6upy
 GYTFFJuGZLmqrjSsecEqbbgThUQlwwk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-299-6VMxeuXFMzKw7ImoLPUb6g-1; Tue, 11 May 2021 18:06:26 -0400
X-MC-Unique: 6VMxeuXFMzKw7ImoLPUb6g-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id AFEBA107ACCA;
 Tue, 11 May 2021 22:06:25 +0000 (UTC)
Received: from scv.redhat.com (ovpn-117-64.rdu2.redhat.com [10.10.117.64])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 0EC69BA6F;
 Tue, 11 May 2021 22:06:24 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 20/21] qapi: [WIP] Add QAPIDocError
Date: Tue, 11 May 2021 18:06:00 -0400
Message-Id: <20210511220601.2110055-21-jsnow@redhat.com>
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
Received-SPF: pass client-ip=216.205.24.124; envelope-from=jsnow@redhat.com;
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

Raise this error instead of QAPIParseError and delegate the context up
to the parent parser.

In a chat off-list, we discussed how this design forces us to continue
having less accurate error context information.

Still, it's useful for an extremely simple split without a lot of fuss.

Signed-off-by: John Snow <jsnow@redhat.com>
---
 scripts/qapi/parser.py  | 12 ++++++++++--
 scripts/qapi/qapidoc.py | 36 +++++++++++++++++-------------------
 2 files changed, 27 insertions(+), 21 deletions(-)

diff --git a/scripts/qapi/parser.py b/scripts/qapi/parser.py
index 940a427b1ae..cde9782c5b0 100644
--- a/scripts/qapi/parser.py
+++ b/scripts/qapi/parser.py
@@ -26,7 +26,7 @@
 
 from .common import must_match
 from .error import QAPISemError, QAPISourceError
-from .qapidoc import QAPIDoc
+from .qapidoc import QAPIDoc, QAPIDocError
 from .source import QAPISourceInfo
 
 
@@ -391,7 +391,7 @@ def get_expr(self) -> _ExprValue:
                 self, "expected '{', '[', string, or boolean")
         return expr
 
-    def get_doc(self, info: QAPISourceInfo) -> List['QAPIDoc']:
+    def _get_doc(self, info: QAPISourceInfo) -> List['QAPIDoc']:
         if self.val != '##':
             raise QAPIParseError(
                 self, "junk after '##' at start of documentation comment")
@@ -424,3 +424,11 @@ def get_doc(self, info: QAPISourceInfo) -> List['QAPIDoc']:
             self.accept(False)
 
         raise QAPIParseError(self, "documentation comment must end with '##'")
+
+    def get_doc(self, info: QAPISourceInfo) -> List['QAPIDoc']:
+        # Tie QAPIDocError exceptions to the current parser state,
+        # re-raise as QAPIParseError.
+        try:
+            return self._get_doc(info)
+        except QAPIDocError as err:
+            raise QAPIParseError(self, str(err)) from err
diff --git a/scripts/qapi/qapidoc.py b/scripts/qapi/qapidoc.py
index 4985d9565b8..938e2009dcd 100644
--- a/scripts/qapi/qapidoc.py
+++ b/scripts/qapi/qapidoc.py
@@ -18,7 +18,11 @@
 import re
 
 from .common import must_match
-from .error import QAPISemError
+from .error import QAPIError, QAPISemError
+
+
+class QAPIDocError(QAPIError):
+    """QAPIDoc parsing errors."""
 
 
 class QAPIDoc:
@@ -56,8 +60,7 @@ def append(self, line):
             if line:
                 indent = must_match(r'\s*', line).end()
                 if indent < self._indent:
-                    raise QAPIParseError(
-                        self._parser,
+                    raise QAPIDocError(
                         "unexpected de-indent (expected at least %d spaces)" %
                         self._indent)
                 line = line[self._indent:]
@@ -114,7 +117,7 @@ def append(self, line):
             return
 
         if line[0] != ' ':
-            raise QAPIParseError(self._parser, "missing space after #")
+            raise QAPIDocError("missing space after #")
         line = line[1:]
         self._append_line(line)
 
@@ -148,11 +151,11 @@ def _append_body_line(self, line):
         # recognized, and get silently treated as ordinary text
         if not self.symbol and not self.body.text and line.startswith('@'):
             if not line.endswith(':'):
-                raise QAPIParseError(self._parser, "line should end with ':'")
+                raise QAPIDocError("line should end with ':'")
             self.symbol = line[1:-1]
             # FIXME invalid names other than the empty string aren't flagged
             if not self.symbol:
-                raise QAPIParseError(self._parser, "invalid name")
+                raise QAPIDocError("invalid name")
         elif self.symbol:
             # This is a definition documentation block
             if name.startswith('@') and name.endswith(':'):
@@ -261,9 +264,8 @@ def _append_various_line(self, line):
         name = line.split(' ', 1)[0]
 
         if name.startswith('@') and name.endswith(':'):
-            raise QAPIParseError(self._parser,
-                                 "'%s' can't follow '%s' section"
-                                 % (name, self.sections[0].name))
+            raise QAPIDocError("'%s' can't follow '%s' section"
+                               % (name, self.sections[0].name))
         if self._is_section_tag(name):
             # If line is "Section:   first line of description", find
             # the index of 'f', which is the indent we expect for any
@@ -286,10 +288,9 @@ def _append_various_line(self, line):
     def _start_symbol_section(self, symbols_dict, name, indent):
         # FIXME invalid names other than the empty string aren't flagged
         if not name:
-            raise QAPIParseError(self._parser, "invalid parameter name")
+            raise QAPIDocError("invalid parameter name")
         if name in symbols_dict:
-            raise QAPIParseError(self._parser,
-                                 "'%s' parameter name duplicated" % name)
+            raise QAPIDocError("'%s' parameter name duplicated" % name)
         assert not self.sections
         self._end_section()
         self._section = QAPIDoc.ArgSection(self._parser, name, indent)
@@ -303,8 +304,7 @@ def _start_features_section(self, name, indent):
 
     def _start_section(self, name=None, indent=0):
         if name in ('Returns', 'Since') and self.has_section(name):
-            raise QAPIParseError(self._parser,
-                                 "duplicated '%s' section" % name)
+            raise QAPIDocError("duplicated '%s' section" % name)
         self._end_section()
         self._section = QAPIDoc.Section(self._parser, name, indent)
         self.sections.append(self._section)
@@ -313,17 +313,15 @@ def _end_section(self):
         if self._section:
             text = self._section.text = self._section.text.strip()
             if self._section.name and (not text or text.isspace()):
-                raise QAPIParseError(
-                    self._parser,
+                raise QAPIDocError(
                     "empty doc section '%s'" % self._section.name)
             self._section = None
 
     def _append_freeform(self, line):
         match = re.match(r'(@\S+:)', line)
         if match:
-            raise QAPIParseError(self._parser,
-                                 "'%s' not allowed in free-form documentation"
-                                 % match.group(1))
+            raise QAPIDocError("'%s' not allowed in free-form documentation"
+                               % match.group(1))
         self._section.append(line)
 
     def connect_member(self, member):
-- 
2.30.2


