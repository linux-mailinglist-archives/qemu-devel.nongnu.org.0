Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C14B3488C8
	for <lists+qemu-devel@lfdr.de>; Thu, 25 Mar 2021 07:13:17 +0100 (CET)
Received: from localhost ([::1]:41896 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lPJF6-0007Bw-9U
	for lists+qemu-devel@lfdr.de; Thu, 25 Mar 2021 02:13:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39802)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lPJ6G-000236-Nu
 for qemu-devel@nongnu.org; Thu, 25 Mar 2021 02:04:08 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:22025)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lPJ6E-0008MK-Ay
 for qemu-devel@nongnu.org; Thu, 25 Mar 2021 02:04:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616652245;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Fm4JAmHSZoelC8dOMDZzC9eOtxUxAJqYbsrxRdaNRA8=;
 b=fwW2g1u+oQFQ/ibqsUEZ2goHKZVb/dci3qJMg+zTRDNFP0sF0I96QDUOjggD6enduc+iJT
 zxokvgrAx74kRusHWQ1wHB10fR0XW2p149D3pjWKySo4AcEJmcMkG8MxJqMso3HEJJ//gk
 08bHXc+JJ+/alg3yZdTKMej+/mzYDmU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-595-qHvZa1lWNByh65ntZpZ_Aw-1; Thu, 25 Mar 2021 02:04:00 -0400
X-MC-Unique: qHvZa1lWNByh65ntZpZ_Aw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A8A4E190B2A1;
 Thu, 25 Mar 2021 06:03:59 +0000 (UTC)
Received: from scv.redhat.com (ovpn-117-181.rdu2.redhat.com [10.10.117.181])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 0F39F866C7;
 Thu, 25 Mar 2021 06:03:58 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: Markus Armbruster <armbru@redhat.com>,
	qemu-devel@nongnu.org
Subject: [PATCH v4 02/19] flake8: Enforce shorter line length for comments and
 docstrings
Date: Thu, 25 Mar 2021 02:03:39 -0400
Message-Id: <20210325060356.4040114-3-jsnow@redhat.com>
In-Reply-To: <20210325060356.4040114-1-jsnow@redhat.com>
References: <20210325060356.4040114-1-jsnow@redhat.com>
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
Cc: Michael Roth <michael.roth@amd.com>, John Snow <jsnow@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

PEP8's BDFL writes: "For flowing long blocks of text with fewer
structural restrictions (docstrings or comments), the line length should
be limited to 72 characters."

I do not like this patch. I have included it explicitly to recommend we
do not pay any further heed to the 72 column limit.

Signed-off-by: John Snow <jsnow@redhat.com>
---
 scripts/qapi/.flake8       |  1 +
 scripts/qapi/common.py     |  8 +++++---
 scripts/qapi/events.py     |  9 +++++----
 scripts/qapi/gen.py        |  8 ++++----
 scripts/qapi/introspect.py |  8 +++++---
 scripts/qapi/main.py       |  4 ++--
 scripts/qapi/parser.py     | 15 ++++++++-------
 scripts/qapi/schema.py     | 23 +++++++++++++----------
 scripts/qapi/types.py      |  7 ++++---
 9 files changed, 47 insertions(+), 36 deletions(-)

diff --git a/scripts/qapi/.flake8 b/scripts/qapi/.flake8
index 6b158c68b8..4f00455290 100644
--- a/scripts/qapi/.flake8
+++ b/scripts/qapi/.flake8
@@ -1,2 +1,3 @@
 [flake8]
 extend-ignore = E722  # Prefer pylint's bare-except checks to flake8's
+max-doc-length = 72
\ No newline at end of file
diff --git a/scripts/qapi/common.py b/scripts/qapi/common.py
index cbd3fd81d3..6e3d9b8ecd 100644
--- a/scripts/qapi/common.py
+++ b/scripts/qapi/common.py
@@ -41,7 +41,8 @@ def camel_to_upper(value: str) -> str:
     length = len(c_fun_str)
     for i in range(length):
         char = c_fun_str[i]
-        # When char is upper case and no '_' appears before, do more checks
+        # When char is upper case and no '_' appears before,
+        # do more checks
         if char.isupper() and (i > 0) and c_fun_str[i - 1] != '_':
             if i < length - 1 and c_fun_str[i + 1].islower():
                 new_name += '_'
@@ -78,8 +79,9 @@ def c_name(name: str, protect: bool = True) -> str:
     protect=True: 'int' -> 'q_int'; protect=False: 'int' -> 'int'
 
     :param name: The name to map.
-    :param protect: If true, avoid returning certain ticklish identifiers
-                    (like C keywords) by prepending ``q_``.
+    :param protect: If true, avoid returning certain ticklish
+                    identifiers (like C keywords) by prepending
+                    ``q_``.
     """
     # ANSI X3J11/88-090, 3.1.1
     c89_words = set(['auto', 'break', 'case', 'char', 'const', 'continue',
diff --git a/scripts/qapi/events.py b/scripts/qapi/events.py
index fee8c671e7..210b56974f 100644
--- a/scripts/qapi/events.py
+++ b/scripts/qapi/events.py
@@ -48,7 +48,8 @@ def gen_param_var(typ: QAPISchemaObjectType) -> str:
     """
     Generate a struct variable holding the event parameters.
 
-    Initialize it with the function arguments defined in `gen_event_send`.
+    Initialize it with the function arguments defined in
+    `gen_event_send`.
     """
     assert not typ.variants
     ret = mcgen('''
@@ -86,9 +87,9 @@ def gen_event_send(name: str,
     # FIXME: Our declaration of local variables (and of 'errp' in the
     # parameter list) can collide with exploded members of the event's
     # data type passed in as parameters.  If this collision ever hits in
-    # practice, we can rename our local variables with a leading _ prefix,
-    # or split the code into a wrapper function that creates a boxed
-    # 'param' object then calls another to do the real work.
+    # practice, we can rename our local variables with a leading _
+    # prefix, or split the code into a wrapper function that creates a
+    # boxed 'param' object then calls another to do the real work.
     have_args = boxed or (arg_type and not arg_type.is_empty())
 
     ret = mcgen('''
diff --git a/scripts/qapi/gen.py b/scripts/qapi/gen.py
index 1fa503bdbd..c54980074e 100644
--- a/scripts/qapi/gen.py
+++ b/scripts/qapi/gen.py
@@ -63,9 +63,9 @@ def _bottom(self) -> str:
         return ''
 
     def write(self, output_dir: str) -> None:
-        # Include paths starting with ../ are used to reuse modules of the main
-        # schema in specialised schemas. Don't overwrite the files that are
-        # already generated for the main schema.
+        # Include paths starting with ../ are used to reuse modules
+        # of the main schema in specialised schemas. Don't overwrite
+        # the files that are already generated for the main schema.
         if self.fname.startswith('../'):
             return
         pathname = os.path.join(output_dir, self.fname)
@@ -189,7 +189,7 @@ def _bottom(self) -> str:
 @contextmanager
 def ifcontext(ifcond: Sequence[str], *args: QAPIGenCCode) -> Iterator[None]:
     """
-    A with-statement context manager that wraps with `start_if()` / `end_if()`.
+    A context manager that wraps output with `start_if()` / `end_if()`.
 
     :param ifcond: A sequence of conditionals, passed to `start_if()`.
     :param args: any number of `QAPIGenCCode`.
diff --git a/scripts/qapi/introspect.py b/scripts/qapi/introspect.py
index 9a348ca2e5..faf00013ad 100644
--- a/scripts/qapi/introspect.py
+++ b/scripts/qapi/introspect.py
@@ -61,8 +61,9 @@
 # With optional annotations, the type of all values is:
 # JSONValue = Union[_Value, Annotated[_Value]]
 #
-# Sadly, mypy does not support recursive types; so the _Stub alias is used to
-# mark the imprecision in the type model where we'd otherwise use JSONValue.
+# Sadly, mypy does not support recursive types; so the _Stub alias is
+# used to mark the imprecision in the type model where we'd otherwise
+# use JSONValue.
 _Stub = Any
 _Scalar = Union[str, bool, None]
 _NonScalar = Union[Dict[str, _Stub], List[_Stub]]
@@ -217,7 +218,8 @@ def visit_end(self) -> None:
         self._name_map = {}
 
     def visit_needed(self, entity: QAPISchemaEntity) -> bool:
-        # Ignore types on first pass; visit_end() will pick up used types
+        # Ignore types on first pass;
+        # visit_end() will pick up used types
         return not isinstance(entity, QAPISchemaType)
 
     def _name(self, name: str) -> str:
diff --git a/scripts/qapi/main.py b/scripts/qapi/main.py
index 703e7ed1ed..5bcac83985 100644
--- a/scripts/qapi/main.py
+++ b/scripts/qapi/main.py
@@ -1,5 +1,5 @@
-# This work is licensed under the terms of the GNU GPL, version 2 or later.
-# See the COPYING file in the top-level directory.
+# This work is licensed under the terms of the GNU GPL, version 2 or
+# later. See the COPYING file in the top-level directory.
 
 """
 QAPI Generator
diff --git a/scripts/qapi/parser.py b/scripts/qapi/parser.py
index 58267c3db9..d5bf91f2b0 100644
--- a/scripts/qapi/parser.py
+++ b/scripts/qapi/parser.py
@@ -331,8 +331,8 @@ def __init__(self, parser, name=None, indent=0):
             self._indent = indent
 
         def append(self, line):
-            # Strip leading spaces corresponding to the expected indent level
-            # Blank lines are always OK.
+            # Strip leading spaces corresponding to the expected indent
+            # level. Blank lines are always OK.
             if line:
                 indent = re.match(r'\s*', line).end()
                 if indent < self._indent:
@@ -353,10 +353,10 @@ def connect(self, member):
             self.member = member
 
     def __init__(self, parser, info):
-        # self._parser is used to report errors with QAPIParseError.  The
-        # resulting error position depends on the state of the parser.
-        # It happens to be the beginning of the comment.  More or less
-        # servicable, but action at a distance.
+        # self._parser is used to report errors with QAPIParseError.
+        # The resulting error position depends on the state of the
+        # parser. It happens to be the beginning of the comment. More
+        # or less servicable, but action at a distance.
         self._parser = parser
         self.info = info
         self.symbol = None
@@ -430,7 +430,8 @@ def _append_body_line(self, line):
             if not line.endswith(':'):
                 raise QAPIParseError(self._parser, "line should end with ':'")
             self.symbol = line[1:-1]
-            # FIXME invalid names other than the empty string aren't flagged
+            # FIXME invalid names other than the empty string aren't
+            # flagged
             if not self.symbol:
                 raise QAPIParseError(self._parser, "invalid name")
         elif self.symbol:
diff --git a/scripts/qapi/schema.py b/scripts/qapi/schema.py
index 703b446fd2..01cdd753cd 100644
--- a/scripts/qapi/schema.py
+++ b/scripts/qapi/schema.py
@@ -166,9 +166,10 @@ def is_user_module(cls, name: str) -> bool:
     @classmethod
     def is_builtin_module(cls, name: str) -> bool:
         """
-        The built-in module is a single System module for the built-in types.
+        Return true when given the built-in module name.
 
-        It is always "./builtin".
+        The built-in module is a specific System module for the built-in
+        types. It is always "./builtin".
         """
         return name == cls.BUILTIN_MODULE_NAME
 
@@ -294,7 +295,8 @@ def connect_doc(self, doc=None):
             m.connect_doc(doc)
 
     def is_implicit(self):
-        # See QAPISchema._make_implicit_enum_type() and ._def_predefineds()
+        # See QAPISchema._make_implicit_enum_type() and
+        # ._def_predefineds()
         return self.name.endswith('Kind') or self.name == 'QType'
 
     def c_type(self):
@@ -421,9 +423,9 @@ def check(self, schema):
 
         self.members = members  # mark completed
 
-    # Check that the members of this type do not cause duplicate JSON members,
-    # and update seen to track the members seen so far. Report any errors
-    # on behalf of info, which is not necessarily self.info
+    # Check that the members of this type do not cause duplicate JSON
+    # members, and update seen to track the members seen so far. Report
+    # any errors on behalf of info, which is not necessarily self.info
     def check_clash(self, info, seen):
         assert self._checked
         assert not self.variants       # not implemented
@@ -494,11 +496,12 @@ def __init__(self, name, info, doc, ifcond, features, variants):
     def check(self, schema):
         super().check(schema)
         self.variants.tag_member.check(schema)
-        # Not calling self.variants.check_clash(), because there's nothing
-        # to clash with
+        # Not calling self.variants.check_clash(), because there's
+        # nothing to clash with
         self.variants.check(schema, {})
-        # Alternate branch names have no relation to the tag enum values;
-        # so we have to check for potential name collisions ourselves.
+        # Alternate branch names have no relation to the tag enum
+        # values; so we have to check for potential name collisions
+        # ourselves.
         seen = {}
         types_seen = {}
         for v in self.variants.variants:
diff --git a/scripts/qapi/types.py b/scripts/qapi/types.py
index 20d572a23a..2e67ab1752 100644
--- a/scripts/qapi/types.py
+++ b/scripts/qapi/types.py
@@ -35,8 +35,8 @@
 from .source import QAPISourceInfo
 
 
-# variants must be emitted before their container; track what has already
-# been output
+# variants must be emitted before their container; track what has
+# already been output
 objects_seen = set()
 
 
@@ -297,7 +297,8 @@ def _begin_user_module(self, name: str) -> None:
 '''))
 
     def visit_begin(self, schema: QAPISchema) -> None:
-        # gen_object() is recursive, ensure it doesn't visit the empty type
+        # gen_object() is recursive, ensure
+        # it doesn't visit the empty type
         objects_seen.add(schema.the_empty_object_type.name)
 
     def _gen_type_cleanup(self, name: str) -> None:
-- 
2.30.2


