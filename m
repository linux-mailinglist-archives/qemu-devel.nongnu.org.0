Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FC6241FABA
	for <lists+qemu-devel@lfdr.de>; Sat,  2 Oct 2021 11:58:52 +0200 (CEST)
Received: from localhost ([::1]:34038 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mWbn9-0003sg-Kl
	for lists+qemu-devel@lfdr.de; Sat, 02 Oct 2021 05:58:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34080)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mWblQ-00016A-WF
 for qemu-devel@nongnu.org; Sat, 02 Oct 2021 05:57:06 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:45455)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mWblN-0004MQ-V0
 for qemu-devel@nongnu.org; Sat, 02 Oct 2021 05:57:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633168620;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qMfn+KDKDXb3a8VinVn4bpWUD0UAYmWDXtYSpLs+RpI=;
 b=OP+VxrUKgUWBK1+jH6qjgD++8O9iaVPEln5GmSSFquvMg0srRpb+0KiNq0OJeFzasEysL4
 0bBPeZdzN0Wbuu1+JTYB/tbwDCbe1KKqGtErynHLJXhKi3/4e5MxTUtzj3LSrp9s4X6+Hi
 VgmIYvoRpedAuD4klG/VT2ficm8Ojmc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-235-Eg_rlWRGMh2c4bWO3pRjrQ-1; Sat, 02 Oct 2021 05:56:59 -0400
X-MC-Unique: Eg_rlWRGMh2c4bWO3pRjrQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 66C6E1006AA3;
 Sat,  2 Oct 2021 09:56:58 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-14.ams2.redhat.com
 [10.36.112.14])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 39CBA5C1CF;
 Sat,  2 Oct 2021 09:56:58 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 839FB11384A2; Sat,  2 Oct 2021 11:56:55 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 07/13] qapi/parser: Introduce NullSection
Date: Sat,  2 Oct 2021 11:56:49 +0200
Message-Id: <20211002095655.1944970-8-armbru@redhat.com>
In-Reply-To: <20211002095655.1944970-1-armbru@redhat.com>
References: <20211002095655.1944970-1-armbru@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

Here's the weird bit. QAPIDoc generally expects -- virtually everywhere
-- that it will always have a current section. The sole exception to
this is in the case that end_comment() is called, which leaves us with
*no* section. However, in this case, we also don't expect to actually
ever mutate the comment contents ever again.

NullSection is just a Null-object that allows us to maintain the
invariant that we *always* have a current section, enforced by static
typing -- allowing us to type that field as QAPIDoc.Section instead of
the more ambiguous Optional[QAPIDoc.Section].

end_section is renamed to switch_section and now accepts as an argument
the new section to activate, clarifying that no callers ever just
unilaterally end a section; they only do so when starting a new section.

Signed-off-by: John Snow <jsnow@redhat.com>

Message-Id: <20210930205716.1148693-8-jsnow@redhat.com>
Reviewed-by: Markus Armbruster <armbru@redhat.com>
Signed-off-by: Markus Armbruster <armbru@redhat.com>
---
 scripts/qapi/parser.py | 27 ++++++++++++++++-----------
 1 file changed, 16 insertions(+), 11 deletions(-)

diff --git a/scripts/qapi/parser.py b/scripts/qapi/parser.py
index 82f1d952b1..40c5da4b17 100644
--- a/scripts/qapi/parser.py
+++ b/scripts/qapi/parser.py
@@ -478,6 +478,13 @@ def __init__(self, parser, name, indent=0):
         def connect(self, member):
             self.member = member
 
+    class NullSection(Section):
+        """
+        Immutable dummy section for use at the end of a doc block.
+        """
+        def append(self, line):
+            assert False, "Text appended after end_comment() called."
+
     def __init__(self, parser, info):
         # self._parser is used to report errors with QAPIParseError.  The
         # resulting error position depends on the state of the parser.
@@ -525,7 +532,7 @@ def append(self, line):
         self._append_line(line)
 
     def end_comment(self):
-        self._end_section()
+        self._switch_section(QAPIDoc.NullSection(self._parser))
 
     @staticmethod
     def _is_section_tag(name):
@@ -699,9 +706,9 @@ def _start_symbol_section(self, symbols_dict, name, indent):
             raise QAPIParseError(self._parser,
                                  "'%s' parameter name duplicated" % name)
         assert not self.sections
-        self._end_section()
-        self._section = QAPIDoc.ArgSection(self._parser, name, indent)
-        symbols_dict[name] = self._section
+        new_section = QAPIDoc.ArgSection(self._parser, name, indent)
+        self._switch_section(new_section)
+        symbols_dict[name] = new_section
 
     def _start_args_section(self, name, indent):
         self._start_symbol_section(self.args, name, indent)
@@ -713,13 +720,11 @@ def _start_section(self, name=None, indent=0):
         if name in ('Returns', 'Since') and self.has_section(name):
             raise QAPIParseError(self._parser,
                                  "duplicated '%s' section" % name)
-        self._end_section()
-        self._section = QAPIDoc.Section(self._parser, name, indent)
-        self.sections.append(self._section)
-
-    def _end_section(self):
-        assert self._section is not None
+        new_section = QAPIDoc.Section(self._parser, name, indent)
+        self._switch_section(new_section)
+        self.sections.append(new_section)
 
+    def _switch_section(self, new_section):
         text = self._section.text = self._section.text.strip()
 
         # Only the 'body' section is allowed to have an empty body.
@@ -732,7 +737,7 @@ def _end_section(self):
                 self._parser,
                 "empty doc section '%s'" % self._section.name)
 
-        self._section = None
+        self._section = new_section
 
     def _append_freeform(self, line):
         match = re.match(r'(@\S+:)', line)
-- 
2.31.1


