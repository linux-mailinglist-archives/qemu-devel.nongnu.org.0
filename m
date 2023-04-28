Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 605BB6F1621
	for <lists+qemu-devel@lfdr.de>; Fri, 28 Apr 2023 12:56:37 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1psLkT-0008Or-Bm; Fri, 28 Apr 2023 06:54:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1psLkQ-0008MM-0B
 for qemu-devel@nongnu.org; Fri, 28 Apr 2023 06:54:42 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1psLkL-0003xq-OH
 for qemu-devel@nongnu.org; Fri, 28 Apr 2023 06:54:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1682679277;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=m5+SeVnmrha2uhnROKPH0wtGpAO+YfEVEsHBJXoWvI8=;
 b=UEvS6Je3TVKb0EhK4WP/QTiDRX7Ge3q4qlBRjDDuvCMJkMnMtP8fuYONDkWQAfMazpLcCU
 YUI6tlmV2fhVIg6H3Pkon1ssldWaDKIS8dwAgcwNBA47TZh5DslcurObtT25tCU3H6lod9
 oun9l+SV+diZlATcC72T/f+7+wKspU8=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-270-RsAgVY1JPN6Q3Em9rWhlLA-1; Fri, 28 Apr 2023 06:54:34 -0400
X-MC-Unique: RsAgVY1JPN6Q3Em9rWhlLA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 1C7761064B4E;
 Fri, 28 Apr 2023 10:54:33 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.192.121])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id AC01640C2064;
 Fri, 28 Apr 2023 10:54:32 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id A299721D0D70; Fri, 28 Apr 2023 12:54:29 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Cc: michael.roth@amd.com, peter.maydell@linaro.org, pbonzini@redhat.com,
 marcandre.lureau@redhat.com, berrange@redhat.com, thuth@redhat.com,
 philmd@linaro.org, mst@redhat.com, imammedo@redhat.com,
 anisinha@redhat.com, eblake@redhat.com, kraxel@redhat.com,
 kwolf@redhat.com, hreitz@redhat.com, arei.gonglei@huawei.com,
 pizhenwei@bytedance.com, jsnow@redhat.com, vsementsov@yandex-team.ru,
 eduardo@habkost.net, marcel.apfelbaum@gmail.com, wangyanan55@huawei.com,
 quintela@redhat.com, peterx@redhat.com, leobras@redhat.com,
 jasowang@redhat.com, yuval.shaia.ml@gmail.com, pavel.dovgaluk@ispras.ru,
 jiri@resnulli.us, stefanb@linux.vnet.ibm.com, stefanha@redhat.com,
 lukasstraub2@web.de, kkostiuk@redhat.com, qemu-block@nongnu.org,
 victortoso@redhat.com
Subject: [PATCH 13/17] qapi: Relax doc string @name: description indentation
 rules
Date: Fri, 28 Apr 2023 12:54:25 +0200
Message-Id: <20230428105429.1687850-14-armbru@redhat.com>
In-Reply-To: <20230428105429.1687850-1-armbru@redhat.com>
References: <20230428105429.1687850-1-armbru@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.171,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

The QAPI schema doc comment language provides special syntax for
command and event arguments, struct and union members, alternate
branches, enumeration values, and features: descriptions starting with
"@name:".

By convention, we format them like this:

    # @name: Lorem ipsum dolor sit amet, consectetur adipiscing elit,
    #        sed do eiusmod tempor incididunt ut labore et dolore
    #        magna aliqua.

Okay for names as short as "name", but we have much longer ones.  Their
description gets squeezed against the right margin, like this:

    # @dirty-sync-missed-zero-copy: Number of times dirty RAM synchronization could
    #                               not avoid copying dirty pages. This is between
    #                               0 and @dirty-sync-count * @multifd-channels.
    #                               (since 7.1)

The description text is effectively just 50 characters wide.  Easy
enough to read, but can be cumbersome to write.

The awkward squeeze against the right margin makes people go beyond it,
which produces two undesirables: arguments about style, and descriptions
that are unnecessarily hard to read, like this one:

    # @postcopy-vcpu-blocktime: list of the postcopy blocktime per vCPU.  This is
    #                           only present when the postcopy-blocktime migration capability
    #                           is enabled. (Since 3.0)

We could instead format it like

    # @postcopy-vcpu-blocktime:
    # list of the postcopy blocktime per vCPU.  This is only present
    # when the postcopy-blocktime migration capability is
    # enabled. (Since 3.0)

or, since the commit before previous, like

    # @postcopy-vcpu-blocktime:
    # 	  list of the postcopy blocktime per vCPU.  This is only present
    # 	  when the postcopy-blocktime migration capability is
    # 	  enabled. (Since 3.0)

However, I'd rather have

    # @postcopy-vcpu-blocktime: list of the postcopy blocktime per vCPU.
    #     This is only present when the postcopy-blocktime migration
    #     capability is enabled.  (Since 3.0)

because this is how rST field and option lists work.

To get this, we need to let the first non-blank line after the
"@name:" line determine expected indentation.

This fills up the indentation pitfall mentioned in
docs/devel/qapi-code-gen.rst.  A related pitfall still exists.  Update
the text to show it.

Signed-off-by: Markus Armbruster <armbru@redhat.com>
---
 docs/devel/qapi-code-gen.rst          | 10 ++--
 scripts/qapi/parser.py                | 73 +++++++--------------------
 tests/qapi-schema/doc-bad-indent.err  |  2 +-
 tests/qapi-schema/doc-bad-indent.json |  3 +-
 tests/qapi-schema/doc-good.json       |  3 +-
 tests/qapi-schema/doc-good.out        |  3 +-
 6 files changed, 32 insertions(+), 62 deletions(-)

diff --git a/docs/devel/qapi-code-gen.rst b/docs/devel/qapi-code-gen.rst
index 6386b58881..875f893be2 100644
--- a/docs/devel/qapi-code-gen.rst
+++ b/docs/devel/qapi-code-gen.rst
@@ -1074,10 +1074,14 @@ Indentation matters.  Bad example::
 
  # @none: None (no memory side cache in this proximity domain,
  #              or cache associativity unknown)
+ #     (since 5.0)
 
-The description is parsed as a definition list with term "None (no
-memory side cache in this proximity domain," and definition "or cache
-associativity unknown)".
+The last line's de-indent is wrong.  The second and subsequent lines
+need to line up with each other, like this::
+
+ # @none: None (no memory side cache in this proximity domain,
+ #     or cache associativity unknown)
+ #     (since 5.0)
 
 Section tags are case-sensitive and end with a colon.  Good example::
 
diff --git a/scripts/qapi/parser.py b/scripts/qapi/parser.py
index fc04c4573e..3e29b7bf48 100644
--- a/scripts/qapi/parser.py
+++ b/scripts/qapi/parser.py
@@ -474,17 +474,21 @@ def __init__(self, parser: QAPISchemaParser,
             self._parser = parser
             # optional section name (argument/member or section name)
             self.name = name
+            # section text without section name
             self.text = ''
-            # the expected indent level of the text of this section
-            self._indent = indent
+            # indentation to strip (None means indeterminate)
+            self._indent = None if self.name else 0
 
         def append(self, line: str) -> None:
-            # Strip leading spaces corresponding to the expected indent level
-            # Blank lines are always OK.
+            line = line.rstrip()
+
             if line:
                 indent = must_match(r'\s*', line).end()
-                if self._indent < 0:
-                    self._indent = indent
+                if self._indent is None:
+                    # indeterminate indentation
+                    if self.text != '':
+                        # non-blank, non-first line determines indentation
+                        self._indent = indent
                 elif indent < self._indent:
                     raise QAPIParseError(
                         self._parser,
@@ -492,7 +496,7 @@ def append(self, line: str) -> None:
                         self._indent)
                 line = line[self._indent:]
 
-            self.text += line.rstrip() + '\n'
+            self.text += line + '\n'
 
     class ArgSection(Section):
         def __init__(self, parser: QAPISchemaParser,
@@ -621,22 +625,8 @@ def _append_args_line(self, line: str) -> None:
 
         """
         if match := self._match_at_name_colon(line):
-            # If line is "@arg:   first line of description", find
-            # the index of 'f', which is the indent we expect for any
-            # following lines.  We then remove the leading "@arg:"
-            # from line and replace it with spaces so that 'f' has the
-            # same index as it did in the original line and can be
-            # handled the same way we will handle following lines.
-            name = match.group(1)
-            indent = match.end()
-            line = line[indent:]
-            if not line:
-                # Line was just the "@arg:" header
-                # The next non-blank line determines expected indent
-                indent = -1
-            else:
-                line = ' ' * indent + line
-            self._start_args_section(name, indent)
+            line = line[match.end():]
+            self._start_args_section(match.group(1), 0)
         elif self._match_section_tag(line):
             self._append_line = self._append_various_line
             self._append_various_line(line)
@@ -655,22 +645,8 @@ def _append_args_line(self, line: str) -> None:
 
     def _append_features_line(self, line: str) -> None:
         if match := self._match_at_name_colon(line):
-            # If line is "@arg:   first line of description", find
-            # the index of 'f', which is the indent we expect for any
-            # following lines.  We then remove the leading "@arg:"
-            # from line and replace it with spaces so that 'f' has the
-            # same index as it did in the original line and can be
-            # handled the same way we will handle following lines.
-            name = match.group(1)
-            indent = match.end()
-            line = line[indent:]
-            if not line:
-                # Line was just the "@arg:" header
-                # The next non-blank line determines expected indent
-                indent = -1
-            else:
-                line = ' ' * indent + line
-            self._start_features_section(name, indent)
+            line = line[match.end():]
+            self._start_features_section(match.group(1), 0)
         elif self._match_section_tag(line):
             self._append_line = self._append_various_line
             self._append_various_line(line)
@@ -700,21 +676,8 @@ def _append_various_line(self, line: str) -> None:
                                  "'@%s:' can't follow '%s' section"
                                  % (match.group(1), self.sections[0].name))
         if match := self._match_section_tag(line):
-            # If line is "Section:   first line of description", find
-            # the index of 'f', which is the indent we expect for any
-            # following lines.  We then remove the leading "Section:"
-            # from line and replace it with spaces so that 'f' has the
-            # same index as it did in the original line and can be
-            # handled the same way we will handle following lines.
-            indent = must_match(r'\S*:\s*', line).end()
-            line = line[indent:]
-            if not line:
-                # Line was just the "Section:" header
-                # The next non-blank line determines expected indent
-                indent = 0
-            else:
-                line = ' ' * indent + line
-            self._start_section(match.group(1), indent)
+            line = line[match.end():]
+            self._start_section(match.group(1), 0)
 
         self._append_freeform(line)
 
@@ -750,7 +713,7 @@ def _start_section(self, name: Optional[str] = None,
         self.sections.append(new_section)
 
     def _switch_section(self, new_section: 'QAPIDoc.Section') -> None:
-        text = self._section.text = self._section.text.strip()
+        text = self._section.text = self._section.text.strip('\n')
 
         # Only the 'body' section is allowed to have an empty body.
         # All other sections, including anonymous ones, must have text.
diff --git a/tests/qapi-schema/doc-bad-indent.err b/tests/qapi-schema/doc-bad-indent.err
index 67844539bd..3c9699a8e0 100644
--- a/tests/qapi-schema/doc-bad-indent.err
+++ b/tests/qapi-schema/doc-bad-indent.err
@@ -1 +1 @@
-doc-bad-indent.json:6:1: unexpected de-indent (expected at least 4 spaces)
+doc-bad-indent.json:7:1: unexpected de-indent (expected at least 2 spaces)
diff --git a/tests/qapi-schema/doc-bad-indent.json b/tests/qapi-schema/doc-bad-indent.json
index edde8f21dc..3f22a27717 100644
--- a/tests/qapi-schema/doc-bad-indent.json
+++ b/tests/qapi-schema/doc-bad-indent.json
@@ -3,6 +3,7 @@
 ##
 # @foo:
 # @a: line one
-# line two is wrongly indented
+#   line two
+# line three is wrongly indented
 ##
 { 'command': 'foo', 'data': { 'a': 'int' } }
diff --git a/tests/qapi-schema/doc-good.json b/tests/qapi-schema/doc-good.json
index 34c3dcbe97..354dfdf461 100644
--- a/tests/qapi-schema/doc-good.json
+++ b/tests/qapi-schema/doc-good.json
@@ -144,7 +144,8 @@
 #     description starts on a new line,
 #     indented
 #
-# @arg2: the second argument
+# @arg2: description starts on the same line
+#     remainder indented differently
 #
 # Features:
 # @cmd-feat1: a feature
diff --git a/tests/qapi-schema/doc-good.out b/tests/qapi-schema/doc-good.out
index 277371acc8..24d9ea954d 100644
--- a/tests/qapi-schema/doc-good.out
+++ b/tests/qapi-schema/doc-good.out
@@ -161,7 +161,8 @@ doc symbol=cmd
 description starts on a new line,
 indented
     arg=arg2
-the second argument
+description starts on the same line
+remainder indented differently
     arg=arg3
 
     feature=cmd-feat1
-- 
2.39.2


