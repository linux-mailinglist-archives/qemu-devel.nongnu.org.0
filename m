Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 761146FC11C
	for <lists+qemu-devel@lfdr.de>; Tue,  9 May 2023 10:02:16 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pwIGw-00008u-PR; Tue, 09 May 2023 04:00:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1pwIGn-0008Ua-M1
 for qemu-devel@nongnu.org; Tue, 09 May 2023 04:00:27 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1pwIGl-0008V4-UX
 for qemu-devel@nongnu.org; Tue, 09 May 2023 04:00:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1683619223;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=BNCfKT61deeM62mksJwv6S1TyaJ5AQ1h8o0X7+3Q+Ig=;
 b=GTJQi1hkaxFwjvXcNdOJ3KanAA9n8FV71pLLOuSnwL9oDC4MqWV0QiIlQcEDiVQURADJAw
 oAk4bx8EQfDj627fPjWUsj2sAJ4hIP0m1liNkbsxmhxAKlXQnEbGW0XxPrfo0DA0YtKDSM
 8cWiRHXwKSpf58jFL3M3Ocsca3choPs=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-158-T4XBBuLEOWqcDxRBR0goPQ-1; Tue, 09 May 2023 04:00:22 -0400
X-MC-Unique: T4XBBuLEOWqcDxRBR0goPQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id F21053C10696;
 Tue,  9 May 2023 08:00:21 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.192.121])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id AF71E2166B29;
 Tue,  9 May 2023 08:00:21 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 3842321E4AA6; Tue,  9 May 2023 10:00:11 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Cc: richard.henderson@linaro.org,
	Juan Quintela <quintela@redhat.com>
Subject: [PULL 12/17] qapi: Rewrite parsing of doc comment section symbols and
 tags
Date: Tue,  9 May 2023 10:00:06 +0200
Message-Id: <20230509080011.3231661-13-armbru@redhat.com>
In-Reply-To: <20230509080011.3231661-1-armbru@redhat.com>
References: <20230509080011.3231661-1-armbru@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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

To recognize a line starting with a section symbol and or tag, we
first split it at the first space, then examine the part left of the
space.  We can just as well examine the unsplit line, so do that.

Signed-off-by: Markus Armbruster <armbru@redhat.com>
Message-Id: <20230428105429.1687850-13-armbru@redhat.com>
Reviewed-by: Juan Quintela <quintela@redhat.com>
---
 scripts/qapi/parser.py | 51 +++++++++++++++++++-----------------------
 1 file changed, 23 insertions(+), 28 deletions(-)

diff --git a/scripts/qapi/parser.py b/scripts/qapi/parser.py
index ddc14ceaba..fc04c4573e 100644
--- a/scripts/qapi/parser.py
+++ b/scripts/qapi/parser.py
@@ -560,12 +560,12 @@ def end_comment(self) -> None:
         self._switch_section(QAPIDoc.NullSection(self._parser))
 
     @staticmethod
-    def _is_section_tag(name: str) -> bool:
-        return name in ('Returns:', 'Since:',
-                        # those are often singular or plural
-                        'Note:', 'Notes:',
-                        'Example:', 'Examples:',
-                        'TODO:')
+    def _match_at_name_colon(string: str) -> re.Match:
+        return re.match(r'@([^:]*): *', string)
+
+    @staticmethod
+    def _match_section_tag(string: str) -> re.Match:
+        return re.match(r'(Returns|Since|Notes?|Examples?|TODO): *', string)
 
     def _append_body_line(self, line: str) -> None:
         """
@@ -581,7 +581,6 @@ def _append_body_line(self, line: str) -> None:
 
         Else, append the line to the current section.
         """
-        name = line.split(' ', 1)[0]
         # FIXME not nice: things like '#  @foo:' and '# @foo: ' aren't
         # recognized, and get silently treated as ordinary text
         if not self.symbol and not self.body.text and line.startswith('@'):
@@ -595,12 +594,12 @@ def _append_body_line(self, line: str) -> None:
                     self._parser, "name required after '@'")
         elif self.symbol:
             # This is a definition documentation block
-            if name.startswith('@') and name.endswith(':'):
+            if self._match_at_name_colon(line):
                 self._append_line = self._append_args_line
                 self._append_args_line(line)
             elif line == 'Features:':
                 self._append_line = self._append_features_line
-            elif self._is_section_tag(name):
+            elif self._match_section_tag(line):
                 self._append_line = self._append_various_line
                 self._append_various_line(line)
             else:
@@ -621,16 +620,15 @@ def _append_args_line(self, line: str) -> None:
         Else, append the line to the current section.
 
         """
-        name = line.split(' ', 1)[0]
-
-        if name.startswith('@') and name.endswith(':'):
+        if match := self._match_at_name_colon(line):
             # If line is "@arg:   first line of description", find
             # the index of 'f', which is the indent we expect for any
             # following lines.  We then remove the leading "@arg:"
             # from line and replace it with spaces so that 'f' has the
             # same index as it did in the original line and can be
             # handled the same way we will handle following lines.
-            indent = must_match(r'@\S*:\s*', line).end()
+            name = match.group(1)
+            indent = match.end()
             line = line[indent:]
             if not line:
                 # Line was just the "@arg:" header
@@ -638,8 +636,8 @@ def _append_args_line(self, line: str) -> None:
                 indent = -1
             else:
                 line = ' ' * indent + line
-            self._start_args_section(name[1:-1], indent)
-        elif self._is_section_tag(name):
+            self._start_args_section(name, indent)
+        elif self._match_section_tag(line):
             self._append_line = self._append_various_line
             self._append_various_line(line)
             return
@@ -656,16 +654,15 @@ def _append_args_line(self, line: str) -> None:
         self._append_freeform(line)
 
     def _append_features_line(self, line: str) -> None:
-        name = line.split(' ', 1)[0]
-
-        if name.startswith('@') and name.endswith(':'):
+        if match := self._match_at_name_colon(line):
             # If line is "@arg:   first line of description", find
             # the index of 'f', which is the indent we expect for any
             # following lines.  We then remove the leading "@arg:"
             # from line and replace it with spaces so that 'f' has the
             # same index as it did in the original line and can be
             # handled the same way we will handle following lines.
-            indent = must_match(r'@\S*:\s*', line).end()
+            name = match.group(1)
+            indent = match.end()
             line = line[indent:]
             if not line:
                 # Line was just the "@arg:" header
@@ -673,8 +670,8 @@ def _append_features_line(self, line: str) -> None:
                 indent = -1
             else:
                 line = ' ' * indent + line
-            self._start_features_section(name[1:-1], indent)
-        elif self._is_section_tag(name):
+            self._start_features_section(name, indent)
+        elif self._match_section_tag(line):
             self._append_line = self._append_various_line
             self._append_various_line(line)
             return
@@ -698,13 +695,11 @@ def _append_various_line(self, line: str) -> None:
 
         Else, append the line to the current section.
         """
-        name = line.split(' ', 1)[0]
-
-        if name.startswith('@') and name.endswith(':'):
+        if match := self._match_at_name_colon(line):
             raise QAPIParseError(self._parser,
-                                 "'%s' can't follow '%s' section"
-                                 % (name, self.sections[0].name))
-        if self._is_section_tag(name):
+                                 "'@%s:' can't follow '%s' section"
+                                 % (match.group(1), self.sections[0].name))
+        if match := self._match_section_tag(line):
             # If line is "Section:   first line of description", find
             # the index of 'f', which is the indent we expect for any
             # following lines.  We then remove the leading "Section:"
@@ -719,7 +714,7 @@ def _append_various_line(self, line: str) -> None:
                 indent = 0
             else:
                 line = ' ' * indent + line
-            self._start_section(name[:-1], indent)
+            self._start_section(match.group(1), indent)
 
         self._append_freeform(line)
 
-- 
2.39.2


