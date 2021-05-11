Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DA5CD37B18A
	for <lists+qemu-devel@lfdr.de>; Wed, 12 May 2021 00:17:57 +0200 (CEST)
Received: from localhost ([::1]:50204 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lgahQ-00080D-VM
	for lists+qemu-devel@lfdr.de; Tue, 11 May 2021 18:17:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55932)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lgaWd-00013E-7A
 for qemu-devel@nongnu.org; Tue, 11 May 2021 18:06:47 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:23060)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lgaWY-0006oa-PJ
 for qemu-devel@nongnu.org; Tue, 11 May 2021 18:06:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620770802;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cfbQmIiSzWSfTu5pZq4MPmX+jeTNTqinJ5hSicstPoY=;
 b=Ds4Kz3RvVyLQYPEfaxQiREWCxdNKr37ASPuQgKuXqj7XSJzn6e3QxGeEZQ1lInmxKQkW0E
 caYpVJvUmJkd8mo6k3YzRg/3lv30+1AdK1/YCeq5JBIO7Wum/xsJ7mq0iMunJQnSG+3GRF
 /LXWmLbKySzYonRMs6JDwTowcbKpu5w=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-256-NR9f4jY7P4qN5acuOLfN6w-1; Tue, 11 May 2021 18:06:20 -0400
X-MC-Unique: NR9f4jY7P4qN5acuOLfN6w-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id AE3FE107ACC7;
 Tue, 11 May 2021 22:06:19 +0000 (UTC)
Received: from scv.redhat.com (ovpn-117-64.rdu2.redhat.com [10.10.117.64])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C72EA60CC9;
 Tue, 11 May 2021 22:06:18 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 17/21] qapi: [WIP] Rip QAPIDoc out of parser.py
Date: Tue, 11 May 2021 18:05:57 -0400
Message-Id: <20210511220601.2110055-18-jsnow@redhat.com>
In-Reply-To: <20210511220601.2110055-1-jsnow@redhat.com>
References: <20210511220601.2110055-1-jsnow@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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

This (rather unglamorously) rips QAPIDoc out of parser.py. It does not
leave a working solution in its place, opting instead just for code
movement.

Signed-off-by: John Snow <jsnow@redhat.com>
---
 scripts/qapi/parser.py  | 342 -------------------------------------
 scripts/qapi/qapidoc.py | 362 ++++++++++++++++++++++++++++++++++++++++
 2 files changed, 362 insertions(+), 342 deletions(-)
 create mode 100644 scripts/qapi/qapidoc.py

diff --git a/scripts/qapi/parser.py b/scripts/qapi/parser.py
index ed543a2b7a4..54df1bfd499 100644
--- a/scripts/qapi/parser.py
+++ b/scripts/qapi/parser.py
@@ -16,7 +16,6 @@
 
 from collections import OrderedDict
 import os
-import re
 from typing import (
     Dict,
     List,
@@ -424,344 +423,3 @@ def get_doc(self, info: QAPISourceInfo) -> List['QAPIDoc']:
             self.accept(False)
 
         raise QAPIParseError(self, "documentation comment must end with '##'")
-
-
-class QAPIDoc:
-    """
-    A documentation comment block, either definition or free-form
-
-    Definition documentation blocks consist of
-
-    * a body section: one line naming the definition, followed by an
-      overview (any number of lines)
-
-    * argument sections: a description of each argument (for commands
-      and events) or member (for structs, unions and alternates)
-
-    * features sections: a description of each feature flag
-
-    * additional (non-argument) sections, possibly tagged
-
-    Free-form documentation blocks consist only of a body section.
-    """
-
-    class Section:
-        def __init__(self, parser, name=None, indent=0):
-            # parser, for error messages about indentation
-            self._parser = parser
-            # optional section name (argument/member or section name)
-            self.name = name
-            self.text = ''
-            # the expected indent level of the text of this section
-            self._indent = indent
-
-        def append(self, line):
-            # Strip leading spaces corresponding to the expected indent level
-            # Blank lines are always OK.
-            if line:
-                indent = must_match(r'\s*', line).end()
-                if indent < self._indent:
-                    raise QAPIParseError(
-                        self._parser,
-                        "unexpected de-indent (expected at least %d spaces)" %
-                        self._indent)
-                line = line[self._indent:]
-
-            self.text += line.rstrip() + '\n'
-
-    class ArgSection(Section):
-        def __init__(self, parser, name, indent=0):
-            super().__init__(parser, name, indent)
-            self.member = None
-
-        def connect(self, member):
-            self.member = member
-
-    def __init__(self, parser, info):
-        # self._parser is used to report errors with QAPIParseError.  The
-        # resulting error position depends on the state of the parser.
-        # It happens to be the beginning of the comment.  More or less
-        # servicable, but action at a distance.
-        self._parser = parser
-        self.info = info
-        self.symbol = None
-        self.body = QAPIDoc.Section(parser)
-        # dict mapping parameter name to ArgSection
-        self.args = OrderedDict()
-        self.features = OrderedDict()
-        # a list of Section
-        self.sections = []
-        # the current section
-        self._section = self.body
-        self._append_line = self._append_body_line
-
-    def has_section(self, name):
-        """Return True if we have a section with this name."""
-        for i in self.sections:
-            if i.name == name:
-                return True
-        return False
-
-    def append(self, line):
-        """
-        Parse a comment line and add it to the documentation.
-
-        The way that the line is dealt with depends on which part of
-        the documentation we're parsing right now:
-        * The body section: ._append_line is ._append_body_line
-        * An argument section: ._append_line is ._append_args_line
-        * A features section: ._append_line is ._append_features_line
-        * An additional section: ._append_line is ._append_various_line
-        """
-        line = line[1:]
-        if not line:
-            self._append_freeform(line)
-            return
-
-        if line[0] != ' ':
-            raise QAPIParseError(self._parser, "missing space after #")
-        line = line[1:]
-        self._append_line(line)
-
-    def end_comment(self):
-        self._end_section()
-
-    @staticmethod
-    def _is_section_tag(name):
-        return name in ('Returns:', 'Since:',
-                        # those are often singular or plural
-                        'Note:', 'Notes:',
-                        'Example:', 'Examples:',
-                        'TODO:')
-
-    def _append_body_line(self, line):
-        """
-        Process a line of documentation text in the body section.
-
-        If this a symbol line and it is the section's first line, this
-        is a definition documentation block for that symbol.
-
-        If it's a definition documentation block, another symbol line
-        begins the argument section for the argument named by it, and
-        a section tag begins an additional section.  Start that
-        section and append the line to it.
-
-        Else, append the line to the current section.
-        """
-        name = line.split(' ', 1)[0]
-        # FIXME not nice: things like '#  @foo:' and '# @foo: ' aren't
-        # recognized, and get silently treated as ordinary text
-        if not self.symbol and not self.body.text and line.startswith('@'):
-            if not line.endswith(':'):
-                raise QAPIParseError(self._parser, "line should end with ':'")
-            self.symbol = line[1:-1]
-            # FIXME invalid names other than the empty string aren't flagged
-            if not self.symbol:
-                raise QAPIParseError(self._parser, "invalid name")
-        elif self.symbol:
-            # This is a definition documentation block
-            if name.startswith('@') and name.endswith(':'):
-                self._append_line = self._append_args_line
-                self._append_args_line(line)
-            elif line == 'Features:':
-                self._append_line = self._append_features_line
-            elif self._is_section_tag(name):
-                self._append_line = self._append_various_line
-                self._append_various_line(line)
-            else:
-                self._append_freeform(line)
-        else:
-            # This is a free-form documentation block
-            self._append_freeform(line)
-
-    def _append_args_line(self, line):
-        """
-        Process a line of documentation text in an argument section.
-
-        A symbol line begins the next argument section, a section tag
-        section or a non-indented line after a blank line begins an
-        additional section.  Start that section and append the line to
-        it.
-
-        Else, append the line to the current section.
-
-        """
-        name = line.split(' ', 1)[0]
-
-        if name.startswith('@') and name.endswith(':'):
-            # If line is "@arg:   first line of description", find
-            # the index of 'f', which is the indent we expect for any
-            # following lines.  We then remove the leading "@arg:"
-            # from line and replace it with spaces so that 'f' has the
-            # same index as it did in the original line and can be
-            # handled the same way we will handle following lines.
-            indent = must_match(r'@\S*:\s*', line).end()
-            line = line[indent:]
-            if not line:
-                # Line was just the "@arg:" header; following lines
-                # are not indented
-                indent = 0
-            else:
-                line = ' ' * indent + line
-            self._start_args_section(name[1:-1], indent)
-        elif self._is_section_tag(name):
-            self._append_line = self._append_various_line
-            self._append_various_line(line)
-            return
-        elif (self._section.text.endswith('\n\n')
-              and line and not line[0].isspace()):
-            if line == 'Features:':
-                self._append_line = self._append_features_line
-            else:
-                self._start_section()
-                self._append_line = self._append_various_line
-                self._append_various_line(line)
-            return
-
-        self._append_freeform(line)
-
-    def _append_features_line(self, line):
-        name = line.split(' ', 1)[0]
-
-        if name.startswith('@') and name.endswith(':'):
-            # If line is "@arg:   first line of description", find
-            # the index of 'f', which is the indent we expect for any
-            # following lines.  We then remove the leading "@arg:"
-            # from line and replace it with spaces so that 'f' has the
-            # same index as it did in the original line and can be
-            # handled the same way we will handle following lines.
-            indent = must_match(r'@\S*:\s*', line).end()
-            line = line[indent:]
-            if not line:
-                # Line was just the "@arg:" header; following lines
-                # are not indented
-                indent = 0
-            else:
-                line = ' ' * indent + line
-            self._start_features_section(name[1:-1], indent)
-        elif self._is_section_tag(name):
-            self._append_line = self._append_various_line
-            self._append_various_line(line)
-            return
-        elif (self._section.text.endswith('\n\n')
-              and line and not line[0].isspace()):
-            self._start_section()
-            self._append_line = self._append_various_line
-            self._append_various_line(line)
-            return
-
-        self._append_freeform(line)
-
-    def _append_various_line(self, line):
-        """
-        Process a line of documentation text in an additional section.
-
-        A symbol line is an error.
-
-        A section tag begins an additional section.  Start that
-        section and append the line to it.
-
-        Else, append the line to the current section.
-        """
-        name = line.split(' ', 1)[0]
-
-        if name.startswith('@') and name.endswith(':'):
-            raise QAPIParseError(self._parser,
-                                 "'%s' can't follow '%s' section"
-                                 % (name, self.sections[0].name))
-        if self._is_section_tag(name):
-            # If line is "Section:   first line of description", find
-            # the index of 'f', which is the indent we expect for any
-            # following lines.  We then remove the leading "Section:"
-            # from line and replace it with spaces so that 'f' has the
-            # same index as it did in the original line and can be
-            # handled the same way we will handle following lines.
-            indent = must_match(r'\S*:\s*', line).end()
-            line = line[indent:]
-            if not line:
-                # Line was just the "Section:" header; following lines
-                # are not indented
-                indent = 0
-            else:
-                line = ' ' * indent + line
-            self._start_section(name[:-1], indent)
-
-        self._append_freeform(line)
-
-    def _start_symbol_section(self, symbols_dict, name, indent):
-        # FIXME invalid names other than the empty string aren't flagged
-        if not name:
-            raise QAPIParseError(self._parser, "invalid parameter name")
-        if name in symbols_dict:
-            raise QAPIParseError(self._parser,
-                                 "'%s' parameter name duplicated" % name)
-        assert not self.sections
-        self._end_section()
-        self._section = QAPIDoc.ArgSection(self._parser, name, indent)
-        symbols_dict[name] = self._section
-
-    def _start_args_section(self, name, indent):
-        self._start_symbol_section(self.args, name, indent)
-
-    def _start_features_section(self, name, indent):
-        self._start_symbol_section(self.features, name, indent)
-
-    def _start_section(self, name=None, indent=0):
-        if name in ('Returns', 'Since') and self.has_section(name):
-            raise QAPIParseError(self._parser,
-                                 "duplicated '%s' section" % name)
-        self._end_section()
-        self._section = QAPIDoc.Section(self._parser, name, indent)
-        self.sections.append(self._section)
-
-    def _end_section(self):
-        if self._section:
-            text = self._section.text = self._section.text.strip()
-            if self._section.name and (not text or text.isspace()):
-                raise QAPIParseError(
-                    self._parser,
-                    "empty doc section '%s'" % self._section.name)
-            self._section = None
-
-    def _append_freeform(self, line):
-        match = re.match(r'(@\S+:)', line)
-        if match:
-            raise QAPIParseError(self._parser,
-                                 "'%s' not allowed in free-form documentation"
-                                 % match.group(1))
-        self._section.append(line)
-
-    def connect_member(self, member):
-        if member.name not in self.args:
-            # Undocumented TODO outlaw
-            self.args[member.name] = QAPIDoc.ArgSection(self._parser,
-                                                        member.name)
-        self.args[member.name].connect(member)
-
-    def connect_feature(self, feature):
-        if feature.name not in self.features:
-            raise QAPISemError(feature.info,
-                               "feature '%s' lacks documentation"
-                               % feature.name)
-        self.features[feature.name].connect(feature)
-
-    def check_expr(self, expr):
-        if self.has_section('Returns') and 'command' not in expr:
-            raise QAPISemError(self.info,
-                               "'Returns:' is only valid for commands")
-
-    def check(self):
-
-        def check_args_section(args, info, what):
-            bogus = [name for name, section in args.items()
-                     if not section.member]
-            if bogus:
-                raise QAPISemError(
-                    self.info,
-                    "documented member%s '%s' %s not exist"
-                    % ("s" if len(bogus) > 1 else "",
-                       "', '".join(bogus),
-                       "do" if len(bogus) > 1 else "does"))
-
-        check_args_section(self.args, self.info, 'members')
-        check_args_section(self.features, self.info, 'features')
diff --git a/scripts/qapi/qapidoc.py b/scripts/qapi/qapidoc.py
new file mode 100644
index 00000000000..4985d9565b8
--- /dev/null
+++ b/scripts/qapi/qapidoc.py
@@ -0,0 +1,362 @@
+# -*- coding: utf-8 -*-
+#
+# QAPI schema (doc) parser
+#
+# Copyright IBM, Corp. 2011
+# Copyright (c) 2013-2019 Red Hat Inc.
+#
+# Authors:
+#  Anthony Liguori <aliguori@us.ibm.com>
+#  Markus Armbruster <armbru@redhat.com>
+#  Marc-André Lureau <marcandre.lureau@redhat.com>
+#  Kevin Wolf <kwolf@redhat.com>
+#
+# This work is licensed under the terms of the GNU GPL, version 2.
+# See the COPYING file in the top-level directory.
+
+from collections import OrderedDict
+import re
+
+from .common import must_match
+from .error import QAPISemError
+
+
+class QAPIDoc:
+    """
+    A documentation comment block, either definition or free-form
+
+    Definition documentation blocks consist of
+
+    * a body section: one line naming the definition, followed by an
+      overview (any number of lines)
+
+    * argument sections: a description of each argument (for commands
+      and events) or member (for structs, unions and alternates)
+
+    * features sections: a description of each feature flag
+
+    * additional (non-argument) sections, possibly tagged
+
+    Free-form documentation blocks consist only of a body section.
+    """
+
+    class Section:
+        def __init__(self, parser, name=None, indent=0):
+            # parser, for error messages about indentation
+            self._parser = parser
+            # optional section name (argument/member or section name)
+            self.name = name
+            self.text = ''
+            # the expected indent level of the text of this section
+            self._indent = indent
+
+        def append(self, line):
+            # Strip leading spaces corresponding to the expected indent level
+            # Blank lines are always OK.
+            if line:
+                indent = must_match(r'\s*', line).end()
+                if indent < self._indent:
+                    raise QAPIParseError(
+                        self._parser,
+                        "unexpected de-indent (expected at least %d spaces)" %
+                        self._indent)
+                line = line[self._indent:]
+
+            self.text += line.rstrip() + '\n'
+
+    class ArgSection(Section):
+        def __init__(self, parser, name, indent=0):
+            super().__init__(parser, name, indent)
+            self.member = None
+
+        def connect(self, member):
+            self.member = member
+
+    def __init__(self, parser, info):
+        # self._parser is used to report errors with QAPIParseError.  The
+        # resulting error position depends on the state of the parser.
+        # It happens to be the beginning of the comment.  More or less
+        # servicable, but action at a distance.
+        self._parser = parser
+        self.info = info
+        self.symbol = None
+        self.body = QAPIDoc.Section(parser)
+        # dict mapping parameter name to ArgSection
+        self.args = OrderedDict()
+        self.features = OrderedDict()
+        # a list of Section
+        self.sections = []
+        # the current section
+        self._section = self.body
+        self._append_line = self._append_body_line
+
+    def has_section(self, name):
+        """Return True if we have a section with this name."""
+        for i in self.sections:
+            if i.name == name:
+                return True
+        return False
+
+    def append(self, line):
+        """
+        Parse a comment line and add it to the documentation.
+
+        The way that the line is dealt with depends on which part of
+        the documentation we're parsing right now:
+        * The body section: ._append_line is ._append_body_line
+        * An argument section: ._append_line is ._append_args_line
+        * A features section: ._append_line is ._append_features_line
+        * An additional section: ._append_line is ._append_various_line
+        """
+        line = line[1:]
+        if not line:
+            self._append_freeform(line)
+            return
+
+        if line[0] != ' ':
+            raise QAPIParseError(self._parser, "missing space after #")
+        line = line[1:]
+        self._append_line(line)
+
+    def end_comment(self):
+        self._end_section()
+
+    @staticmethod
+    def _is_section_tag(name):
+        return name in ('Returns:', 'Since:',
+                        # those are often singular or plural
+                        'Note:', 'Notes:',
+                        'Example:', 'Examples:',
+                        'TODO:')
+
+    def _append_body_line(self, line):
+        """
+        Process a line of documentation text in the body section.
+
+        If this a symbol line and it is the section's first line, this
+        is a definition documentation block for that symbol.
+
+        If it's a definition documentation block, another symbol line
+        begins the argument section for the argument named by it, and
+        a section tag begins an additional section.  Start that
+        section and append the line to it.
+
+        Else, append the line to the current section.
+        """
+        name = line.split(' ', 1)[0]
+        # FIXME not nice: things like '#  @foo:' and '# @foo: ' aren't
+        # recognized, and get silently treated as ordinary text
+        if not self.symbol and not self.body.text and line.startswith('@'):
+            if not line.endswith(':'):
+                raise QAPIParseError(self._parser, "line should end with ':'")
+            self.symbol = line[1:-1]
+            # FIXME invalid names other than the empty string aren't flagged
+            if not self.symbol:
+                raise QAPIParseError(self._parser, "invalid name")
+        elif self.symbol:
+            # This is a definition documentation block
+            if name.startswith('@') and name.endswith(':'):
+                self._append_line = self._append_args_line
+                self._append_args_line(line)
+            elif line == 'Features:':
+                self._append_line = self._append_features_line
+            elif self._is_section_tag(name):
+                self._append_line = self._append_various_line
+                self._append_various_line(line)
+            else:
+                self._append_freeform(line)
+        else:
+            # This is a free-form documentation block
+            self._append_freeform(line)
+
+    def _append_args_line(self, line):
+        """
+        Process a line of documentation text in an argument section.
+
+        A symbol line begins the next argument section, a section tag
+        section or a non-indented line after a blank line begins an
+        additional section.  Start that section and append the line to
+        it.
+
+        Else, append the line to the current section.
+
+        """
+        name = line.split(' ', 1)[0]
+
+        if name.startswith('@') and name.endswith(':'):
+            # If line is "@arg:   first line of description", find
+            # the index of 'f', which is the indent we expect for any
+            # following lines.  We then remove the leading "@arg:"
+            # from line and replace it with spaces so that 'f' has the
+            # same index as it did in the original line and can be
+            # handled the same way we will handle following lines.
+            indent = must_match(r'@\S*:\s*', line).end()
+            line = line[indent:]
+            if not line:
+                # Line was just the "@arg:" header; following lines
+                # are not indented
+                indent = 0
+            else:
+                line = ' ' * indent + line
+            self._start_args_section(name[1:-1], indent)
+        elif self._is_section_tag(name):
+            self._append_line = self._append_various_line
+            self._append_various_line(line)
+            return
+        elif (self._section.text.endswith('\n\n')
+              and line and not line[0].isspace()):
+            if line == 'Features:':
+                self._append_line = self._append_features_line
+            else:
+                self._start_section()
+                self._append_line = self._append_various_line
+                self._append_various_line(line)
+            return
+
+        self._append_freeform(line)
+
+    def _append_features_line(self, line):
+        name = line.split(' ', 1)[0]
+
+        if name.startswith('@') and name.endswith(':'):
+            # If line is "@arg:   first line of description", find
+            # the index of 'f', which is the indent we expect for any
+            # following lines.  We then remove the leading "@arg:"
+            # from line and replace it with spaces so that 'f' has the
+            # same index as it did in the original line and can be
+            # handled the same way we will handle following lines.
+            indent = must_match(r'@\S*:\s*', line).end()
+            line = line[indent:]
+            if not line:
+                # Line was just the "@arg:" header; following lines
+                # are not indented
+                indent = 0
+            else:
+                line = ' ' * indent + line
+            self._start_features_section(name[1:-1], indent)
+        elif self._is_section_tag(name):
+            self._append_line = self._append_various_line
+            self._append_various_line(line)
+            return
+        elif (self._section.text.endswith('\n\n')
+              and line and not line[0].isspace()):
+            self._start_section()
+            self._append_line = self._append_various_line
+            self._append_various_line(line)
+            return
+
+        self._append_freeform(line)
+
+    def _append_various_line(self, line):
+        """
+        Process a line of documentation text in an additional section.
+
+        A symbol line is an error.
+
+        A section tag begins an additional section.  Start that
+        section and append the line to it.
+
+        Else, append the line to the current section.
+        """
+        name = line.split(' ', 1)[0]
+
+        if name.startswith('@') and name.endswith(':'):
+            raise QAPIParseError(self._parser,
+                                 "'%s' can't follow '%s' section"
+                                 % (name, self.sections[0].name))
+        if self._is_section_tag(name):
+            # If line is "Section:   first line of description", find
+            # the index of 'f', which is the indent we expect for any
+            # following lines.  We then remove the leading "Section:"
+            # from line and replace it with spaces so that 'f' has the
+            # same index as it did in the original line and can be
+            # handled the same way we will handle following lines.
+            indent = must_match(r'\S*:\s*', line).end()
+            line = line[indent:]
+            if not line:
+                # Line was just the "Section:" header; following lines
+                # are not indented
+                indent = 0
+            else:
+                line = ' ' * indent + line
+            self._start_section(name[:-1], indent)
+
+        self._append_freeform(line)
+
+    def _start_symbol_section(self, symbols_dict, name, indent):
+        # FIXME invalid names other than the empty string aren't flagged
+        if not name:
+            raise QAPIParseError(self._parser, "invalid parameter name")
+        if name in symbols_dict:
+            raise QAPIParseError(self._parser,
+                                 "'%s' parameter name duplicated" % name)
+        assert not self.sections
+        self._end_section()
+        self._section = QAPIDoc.ArgSection(self._parser, name, indent)
+        symbols_dict[name] = self._section
+
+    def _start_args_section(self, name, indent):
+        self._start_symbol_section(self.args, name, indent)
+
+    def _start_features_section(self, name, indent):
+        self._start_symbol_section(self.features, name, indent)
+
+    def _start_section(self, name=None, indent=0):
+        if name in ('Returns', 'Since') and self.has_section(name):
+            raise QAPIParseError(self._parser,
+                                 "duplicated '%s' section" % name)
+        self._end_section()
+        self._section = QAPIDoc.Section(self._parser, name, indent)
+        self.sections.append(self._section)
+
+    def _end_section(self):
+        if self._section:
+            text = self._section.text = self._section.text.strip()
+            if self._section.name and (not text or text.isspace()):
+                raise QAPIParseError(
+                    self._parser,
+                    "empty doc section '%s'" % self._section.name)
+            self._section = None
+
+    def _append_freeform(self, line):
+        match = re.match(r'(@\S+:)', line)
+        if match:
+            raise QAPIParseError(self._parser,
+                                 "'%s' not allowed in free-form documentation"
+                                 % match.group(1))
+        self._section.append(line)
+
+    def connect_member(self, member):
+        if member.name not in self.args:
+            # Undocumented TODO outlaw
+            self.args[member.name] = QAPIDoc.ArgSection(self._parser,
+                                                        member.name)
+        self.args[member.name].connect(member)
+
+    def connect_feature(self, feature):
+        if feature.name not in self.features:
+            raise QAPISemError(feature.info,
+                               "feature '%s' lacks documentation"
+                               % feature.name)
+        self.features[feature.name].connect(feature)
+
+    def check_expr(self, expr):
+        if self.has_section('Returns') and 'command' not in expr:
+            raise QAPISemError(self.info,
+                               "'Returns:' is only valid for commands")
+
+    def check(self):
+
+        def check_args_section(args, info, what):
+            bogus = [name for name, section in args.items()
+                     if not section.member]
+            if bogus:
+                raise QAPISemError(
+                    self.info,
+                    "documented member%s '%s' %s not exist"
+                    % ("s" if len(bogus) > 1 else "",
+                       "', '".join(bogus),
+                       "do" if len(bogus) > 1 else "does"))
+
+        check_args_section(self.args, self.info, 'members')
+        check_args_section(self.features, self.info, 'features')
-- 
2.30.2


