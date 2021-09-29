Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 70A3441CD02
	for <lists+qemu-devel@lfdr.de>; Wed, 29 Sep 2021 21:56:47 +0200 (CEST)
Received: from localhost ([::1]:44970 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mVfh8-0001cu-FQ
	for lists+qemu-devel@lfdr.de; Wed, 29 Sep 2021 15:56:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47170)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1mVfWO-0007jY-5n
 for qemu-devel@nongnu.org; Wed, 29 Sep 2021 15:45:41 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:32816)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1mVfWG-0006Xm-Ea
 for qemu-devel@nongnu.org; Wed, 29 Sep 2021 15:45:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1632944731;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=vgEu582rg+QZQ5sXfi6l5BL21SJgdH3Gt59RDW8pSD0=;
 b=hNYszFvtHOwglwYNtyThYVKkkFh62EOl83uR3rFCFGtAfqsmjYFUCtMvPxAf7fusEmG+SK
 7LdLGODA2FDPA+R6m5dojDsMFDoxq4BeXr/QCWr/UaHF16N0sQd5CQYi5py4C/GyJ/mI/4
 TG65isSbwE90Ey00L2OPGGZ2fgZFKg0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-18-6pu-ePzhM4mAmdKUleYi4w-1; Wed, 29 Sep 2021 15:45:30 -0400
X-MC-Unique: 6pu-ePzhM4mAmdKUleYi4w-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E3653189CD1F;
 Wed, 29 Sep 2021 19:45:09 +0000 (UTC)
Received: from scv.redhat.com (unknown [10.22.9.55])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 01C512B3CD;
 Wed, 29 Sep 2021 19:45:07 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 05/13] qapi/parser: improve detection of '@symbol:' preface
Date: Wed, 29 Sep 2021 15:44:20 -0400
Message-Id: <20210929194428.1038496-6-jsnow@redhat.com>
In-Reply-To: <20210929194428.1038496-1-jsnow@redhat.com>
References: <20210929194428.1038496-1-jsnow@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
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
Cc: Eduardo Habkost <ehabkost@redhat.com>, Michael Roth <michael.roth@amd.com>,
 Markus Armbruster <armbru@redhat.com>, Eric Blake <eblake@redhat.com>,
 Cleber Rosa <crosa@redhat.com>, John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Leading and trailing whitespace are now discarded, addressing the FIXME
comment. A new error is raised to detect this accidental case.

Parsing for args sections is left alone here; the 'name' variable is
moved into the only block where it is used.

Signed-off-by: John Snow <jsnow@redhat.com>

---

Tangentially related to delinting in that removing 'FIXME' comments is a
goal for pylint. My goal is to allow 'TODO' to be checked in, but
'FIXME' should be fixed prior to inclusion.

Arbitrary, but that's life for you.

Signed-off-by: John Snow <jsnow@redhat.com>
---
 scripts/qapi/parser.py                              | 13 ++++++++-----
 tests/qapi-schema/doc-whitespace-leading-symbol.err |  1 +
 .../qapi-schema/doc-whitespace-leading-symbol.json  |  6 ++++++
 tests/qapi-schema/doc-whitespace-leading-symbol.out |  0
 .../qapi-schema/doc-whitespace-trailing-symbol.err  |  1 +
 .../qapi-schema/doc-whitespace-trailing-symbol.json |  6 ++++++
 .../qapi-schema/doc-whitespace-trailing-symbol.out  |  0
 tests/qapi-schema/meson.build                       |  2 ++
 8 files changed, 24 insertions(+), 5 deletions(-)
 create mode 100644 tests/qapi-schema/doc-whitespace-leading-symbol.err
 create mode 100644 tests/qapi-schema/doc-whitespace-leading-symbol.json
 create mode 100644 tests/qapi-schema/doc-whitespace-leading-symbol.out
 create mode 100644 tests/qapi-schema/doc-whitespace-trailing-symbol.err
 create mode 100644 tests/qapi-schema/doc-whitespace-trailing-symbol.json
 create mode 100644 tests/qapi-schema/doc-whitespace-trailing-symbol.out

diff --git a/scripts/qapi/parser.py b/scripts/qapi/parser.py
index bfd2dbfd9a2..2f93a752f66 100644
--- a/scripts/qapi/parser.py
+++ b/scripts/qapi/parser.py
@@ -549,18 +549,21 @@ def _append_body_line(self, line):
 
         Else, append the line to the current section.
         """
-        name = line.split(' ', 1)[0]
-        # FIXME not nice: things like '#  @foo:' and '# @foo: ' aren't
-        # recognized, and get silently treated as ordinary text
-        if not self.symbol and not self.body.text and line.startswith('@'):
-            if not line.endswith(':'):
+        stripped = line.strip()
+
+        if not self.symbol and not self.body.text and stripped.startswith('@'):
+            if not stripped.endswith(':'):
                 raise QAPIParseError(self._parser, "line should end with ':'")
+            if not stripped == line:
+                raise QAPIParseError(
+                    self._parser, "extra whitespace around symbol declaration")
             self.symbol = line[1:-1]
             # FIXME invalid names other than the empty string aren't flagged
             if not self.symbol:
                 raise QAPIParseError(self._parser, "invalid name")
         elif self.symbol:
             # This is a definition documentation block
+            name = line.split(' ', 1)[0]
             if name.startswith('@') and name.endswith(':'):
                 self._append_line = self._append_args_line
                 self._append_args_line(line)
diff --git a/tests/qapi-schema/doc-whitespace-leading-symbol.err b/tests/qapi-schema/doc-whitespace-leading-symbol.err
new file mode 100644
index 00000000000..785468b90e2
--- /dev/null
+++ b/tests/qapi-schema/doc-whitespace-leading-symbol.err
@@ -0,0 +1 @@
+doc-whitespace-leading-symbol.json:4:1: extra whitespace around symbol declaration
diff --git a/tests/qapi-schema/doc-whitespace-leading-symbol.json b/tests/qapi-schema/doc-whitespace-leading-symbol.json
new file mode 100644
index 00000000000..128c781bec9
--- /dev/null
+++ b/tests/qapi-schema/doc-whitespace-leading-symbol.json
@@ -0,0 +1,6 @@
+# Documentation for expression has leading whitespace
+
+##
+#  @leading-whitespace:
+##
+{ 'command': 'leading-whitespace', 'data': {'a': 'int'} }
diff --git a/tests/qapi-schema/doc-whitespace-leading-symbol.out b/tests/qapi-schema/doc-whitespace-leading-symbol.out
new file mode 100644
index 00000000000..e69de29bb2d
diff --git a/tests/qapi-schema/doc-whitespace-trailing-symbol.err b/tests/qapi-schema/doc-whitespace-trailing-symbol.err
new file mode 100644
index 00000000000..fe583b38008
--- /dev/null
+++ b/tests/qapi-schema/doc-whitespace-trailing-symbol.err
@@ -0,0 +1 @@
+doc-whitespace-trailing-symbol.json:4:1: extra whitespace around symbol declaration
diff --git a/tests/qapi-schema/doc-whitespace-trailing-symbol.json b/tests/qapi-schema/doc-whitespace-trailing-symbol.json
new file mode 100644
index 00000000000..da706c3d176
--- /dev/null
+++ b/tests/qapi-schema/doc-whitespace-trailing-symbol.json
@@ -0,0 +1,6 @@
+# Documentation for expression has extra whitespace
+
+##
+# @trailing-whitespace:  
+##
+{ 'command': 'trailing-whitespace', 'data': {'a': 'int'} }
diff --git a/tests/qapi-schema/doc-whitespace-trailing-symbol.out b/tests/qapi-schema/doc-whitespace-trailing-symbol.out
new file mode 100644
index 00000000000..e69de29bb2d
diff --git a/tests/qapi-schema/meson.build b/tests/qapi-schema/meson.build
index 6187efbd58f..64ffbd1b3d4 100644
--- a/tests/qapi-schema/meson.build
+++ b/tests/qapi-schema/meson.build
@@ -82,6 +82,8 @@ schemas = [
   'doc-missing.json',
   'doc-no-symbol.json',
   'doc-undoc-feature.json',
+  'doc-whitespace-leading-symbol.json',
+  'doc-whitespace-trailing-symbol.json',
   'double-type.json',
   'duplicate-key.json',
   'empty.json',
-- 
2.31.1


