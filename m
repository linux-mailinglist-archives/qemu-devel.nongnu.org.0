Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AE1AD2FAAD
	for <lists+qemu-devel@lfdr.de>; Thu, 30 May 2019 13:07:51 +0200 (CEST)
Received: from localhost ([127.0.0.1]:52096 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hWIuU-0005BW-Rn
	for lists+qemu-devel@lfdr.de; Thu, 30 May 2019 07:07:50 -0400
Received: from eggs.gnu.org ([209.51.188.92]:40407)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <kwolf@redhat.com>) id 1hWIqB-0001oV-5y
	for qemu-devel@nongnu.org; Thu, 30 May 2019 07:03:25 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <kwolf@redhat.com>) id 1hWIq9-0003no-Je
	for qemu-devel@nongnu.org; Thu, 30 May 2019 07:03:23 -0400
Received: from mx1.redhat.com ([209.132.183.28]:35722)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <kwolf@redhat.com>)
	id 1hWIq5-0003ap-DZ; Thu, 30 May 2019 07:03:17 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id A596C81E14;
	Thu, 30 May 2019 11:03:14 +0000 (UTC)
Received: from linux.fritz.box.com (ovpn-116-119.ams2.redhat.com
	[10.36.116.119])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 42AEB6FC11;
	Thu, 30 May 2019 11:03:12 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Date: Thu, 30 May 2019 13:02:53 +0200
Message-Id: <20190530110255.16225-5-kwolf@redhat.com>
In-Reply-To: <20190530110255.16225-1-kwolf@redhat.com>
References: <20190530110255.16225-1-kwolf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.25]);
	Thu, 30 May 2019 11:03:16 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PATCH v4 4/6] qapi: Disentangle QAPIDoc code
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: kwolf@redhat.com, pkrempa@redhat.com, armbru@redhat.com,
	qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Documentation comments follow a certain structure: First, we have a text
with a general description (called QAPIDoc.body). After this,
descriptions of the arguments follow. Finally, we have a part that
contains various named sections.

The code doesn't show this structure, but just checks various attributes
that indicate indirectly which part is being processed, so it happens to
do the right set of things in the right phase. This is hard to follow,
and adding support for documentation of features would be even harder.

This patch restructures the code so that the three parts are clearly
separated. The code becomes a bit longer, but easier to follow. The
resulting output remains unchanged.

Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 scripts/qapi/common.py | 122 ++++++++++++++++++++++++++++++++---------
 1 file changed, 97 insertions(+), 25 deletions(-)

diff --git a/scripts/qapi/common.py b/scripts/qapi/common.py
index 9e4b6c00b5..55ccd216cf 100644
--- a/scripts/qapi/common.py
+++ b/scripts/qapi/common.py
@@ -120,6 +120,22 @@ class QAPIDoc(object):
         def connect(self, member):
             self.member =3D member
=20
+    class DocPart:
+        """
+        Expression documentation blocks consist of
+        * a BODY part: first line naming the expression, plus an
+          optional overview
+        * an ARGS part: description of each argument (for commands and
+          events) or member (for structs, unions and alternates),
+        * a VARIOUS part: optional tagged sections.
+
+        Free-form documentation blocks consist only of a BODY part.
+        """
+        # TODO Make it a subclass of Enum when Python 2 support is remov=
ed
+        BODY =3D 1
+        ARGS =3D 2
+        VARIOUS =3D 3
+
     def __init__(self, parser, info):
         # self._parser is used to report errors with QAPIParseError.  Th=
e
         # resulting error position depends on the state of the parser.
@@ -135,6 +151,7 @@ class QAPIDoc(object):
         self.sections =3D []
         # the current section
         self._section =3D self.body
+        self._part =3D QAPIDoc.DocPart.BODY
=20
     def has_section(self, name):
         """Return True if we have a section with this name."""
@@ -144,7 +161,24 @@ class QAPIDoc(object):
         return False
=20
     def append(self, line):
-        """Parse a comment line and add it to the documentation."""
+        """
+        Parse a comment line and add it to the documentation.
+
+        The way that the line is dealt with depends on which part of the
+        documentation we're parsing right now:
+
+        BODY means that we're ready to process free-form text into self.=
body. A
+        symbol name is only allowed if no other text was parsed yet. It =
is
+        interpreted as the symbol name that describes the currently docu=
mented
+        object. On getting the second symbol name, we proceed to ARGS.
+
+        ARGS means that we're parsing the arguments section. Any symbol =
name is
+        interpreted as an argument and an ArgSection is created for it.
+
+        VARIOUS is the final part where free-form sections may appear. T=
his
+        includes named sections such as "Return:" as well as unnamed
+        paragraphs. Symbols are not allowed any more in this part.
+        """
         line =3D line[1:]
         if not line:
             self._append_freeform(line)
@@ -154,37 +188,85 @@ class QAPIDoc(object):
             raise QAPIParseError(self._parser, "Missing space after #")
         line =3D line[1:]
=20
+        if self._part =3D=3D QAPIDoc.DocPart.BODY:
+            self._append_body_line(line)
+        elif self._part =3D=3D QAPIDoc.DocPart.ARGS:
+            self._append_args_line(line)
+        elif self._part =3D=3D QAPIDoc.DocPart.VARIOUS:
+            self._append_various_line(line)
+        else:
+            assert False
+
+    def end_comment(self):
+        self._end_section()
+
+    def _check_named_section(self, name):
+        if name in ('Returns:', 'Since:',
+                    # those are often singular or plural
+                    'Note:', 'Notes:',
+                    'Example:', 'Examples:',
+                    'TODO:'):
+            self._part =3D QAPIDoc.DocPart.VARIOUS
+            return True
+        return False
+
+    def _append_body_line(self, line):
+        name =3D line.split(' ', 1)[0]
         # FIXME not nice: things like '#  @foo:' and '# @foo: ' aren't
         # recognized, and get silently treated as ordinary text
-        if self.symbol:
-            self._append_symbol_line(line)
-        elif not self.body.text and line.startswith('@'):
+        if not self.symbol and not self.body.text and line.startswith('@=
'):
             if not line.endswith(':'):
                 raise QAPIParseError(self._parser, "Line should end with=
 :")
             self.symbol =3D line[1:-1]
             # FIXME invalid names other than the empty string aren't fla=
gged
             if not self.symbol:
                 raise QAPIParseError(self._parser, "Invalid name")
+        elif self.symbol:
+            # We already know that we document some symbol
+            if name.startswith('@') and name.endswith(':'):
+                self._part =3D QAPIDoc.DocPart.ARGS
+                self._append_args_line(line)
+            elif self.symbol and self._check_named_section(name):
+                self._append_various_line(line)
+            else:
+                self._append_freeform(line.strip())
         else:
-            self._append_freeform(line)
-
-    def end_comment(self):
-        self._end_section()
+            # This is free-form documentation without a symbol
+            self._append_freeform(line.strip())
=20
-    def _append_symbol_line(self, line):
+    def _append_args_line(self, line):
         name =3D line.split(' ', 1)[0]
=20
         if name.startswith('@') and name.endswith(':'):
             line =3D line[len(name)+1:]
             self._start_args_section(name[1:-1])
-        elif name in ('Returns:', 'Since:',
-                      # those are often singular or plural
-                      'Note:', 'Notes:',
-                      'Example:', 'Examples:',
-                      'TODO:'):
+        elif self._check_named_section(name):
+            self._append_various_line(line)
+            return
+        elif (self._section.text.endswith('\n\n')
+              and line and not line[0].isspace()):
+            self._start_section()
+            self._part =3D QAPIDoc.DocPart.VARIOUS
+            self._append_various_line(line)
+            return
+
+        self._append_freeform(line.strip())
+
+    def _append_various_line(self, line):
+        name =3D line.split(' ', 1)[0]
+
+        if name.startswith('@') and name.endswith(':'):
+            raise QAPIParseError(self._parser,
+                                 "'%s' can't follow '%s' section"
+                                 % (name, self.sections[0].name))
+        elif self._check_named_section(name):
             line =3D line[len(name)+1:]
             self._start_section(name[:-1])
=20
+        if (not self._section.name or
+                not self._section.name.startswith('Example')):
+            line =3D line.strip()
+
         self._append_freeform(line)
=20
     def _start_args_section(self, name):
@@ -194,10 +276,7 @@ class QAPIDoc(object):
         if name in self.args:
             raise QAPIParseError(self._parser,
                                  "'%s' parameter name duplicated" % name=
)
-        if self.sections:
-            raise QAPIParseError(self._parser,
-                                 "'@%s:' can't follow '%s' section"
-                                 % (name, self.sections[0].name))
+        assert not self.sections
         self._end_section()
         self._section =3D QAPIDoc.ArgSection(name)
         self.args[name] =3D self._section
@@ -219,13 +298,6 @@ class QAPIDoc(object):
             self._section =3D None
=20
     def _append_freeform(self, line):
-        in_arg =3D isinstance(self._section, QAPIDoc.ArgSection)
-        if (in_arg and self._section.text.endswith('\n\n')
-                and line and not line[0].isspace()):
-            self._start_section()
-        if (in_arg or not self._section.name
-                or not self._section.name.startswith('Example')):
-            line =3D line.strip()
         match =3D re.match(r'(@\S+:)', line)
         if match:
             raise QAPIParseError(self._parser,
--=20
2.20.1


