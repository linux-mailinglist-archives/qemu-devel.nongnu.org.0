Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EB48F33A1E
	for <lists+qemu-devel@lfdr.de>; Mon,  3 Jun 2019 23:49:16 +0200 (CEST)
Received: from localhost ([127.0.0.1]:41291 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hXupP-0000a0-QB
	for lists+qemu-devel@lfdr.de; Mon, 03 Jun 2019 17:49:15 -0400
Received: from eggs.gnu.org ([209.51.188.92]:39740)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <jsnow@redhat.com>) id 1hXuni-0008F5-QO
	for qemu-devel@nongnu.org; Mon, 03 Jun 2019 17:47:32 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <jsnow@redhat.com>) id 1hXunb-0003Cj-F9
	for qemu-devel@nongnu.org; Mon, 03 Jun 2019 17:47:30 -0400
Received: from mx1.redhat.com ([209.132.183.28]:58950)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <jsnow@redhat.com>)
	id 1hXunR-0002aL-D3; Mon, 03 Jun 2019 17:47:15 -0400
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 44DFF3107B1B;
	Mon,  3 Jun 2019 21:47:04 +0000 (UTC)
Received: from probe.bos.redhat.com (dhcp-17-164.bos.redhat.com [10.18.17.164])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 7C7FB5C239;
	Mon,  3 Jun 2019 21:47:01 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org,
	qemu-block@nongnu.org
Date: Mon,  3 Jun 2019 17:46:52 -0400
Message-Id: <20190603214653.29369-3-jsnow@redhat.com>
In-Reply-To: <20190603214653.29369-1-jsnow@redhat.com>
References: <20190603214653.29369-1-jsnow@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.47]);
	Mon, 03 Jun 2019 21:47:08 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PATCH v3 2/3] sphinx: add qmp_lexer
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
Cc: Fam Zheng <fam@euphon.net>, Peter Maydell <peter.maydell@linaro.org>,
	John Snow <jsnow@redhat.com>, Aarushi Mehta <mehta.aaru20@gmail.com>,
	Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Sphinx, through Pygments, does not like annotated json examples very
much. In some versions of Sphinx (1.7), it will render the non-json
portions of code blocks in red, but in newer versions (2.0) it will
throw an exception and not highlight the block at all. Though we can
suppress this warning, it doesn't bring back highlighting on non-strict
json blocks.

We can alleviate this by creating a custom lexer for QMP examples that
allows us to properly highlight these examples in a robust way, keeping
our directionality and elision notations.

Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
Signed-off-by: John Snow <jsnow@redhat.com>
---
 docs/conf.py             |  4 ++--
 docs/sphinx/qmp_lexer.py | 43 ++++++++++++++++++++++++++++++++++++++++
 2 files changed, 45 insertions(+), 2 deletions(-)
 create mode 100644 docs/sphinx/qmp_lexer.py

diff --git a/docs/conf.py b/docs/conf.py
index befbcc6c3e..e46b299b71 100644
--- a/docs/conf.py
+++ b/docs/conf.py
@@ -41,7 +41,7 @@ except NameError:
 # add these directories to sys.path here. If the directory is relative t=
o the
 # documentation root, use an absolute path starting from qemu_docdir.
 #
-# sys.path.insert(0, os.path.join(qemu_docdir, "my_subdir"))
+sys.path.insert(0, os.path.join(qemu_docdir, "sphinx"))
=20
=20
 # -- General configuration ---------------------------------------------=
---
@@ -54,7 +54,7 @@ needs_sphinx =3D '1.3'
 # Add any Sphinx extension module names here, as strings. They can be
 # extensions coming with Sphinx (named 'sphinx.ext.*') or your custom
 # ones.
-extensions =3D []
+extensions =3D ['qmp_lexer']
=20
 # Add any paths that contain templates here, relative to this directory.
 templates_path =3D ['_templates']
diff --git a/docs/sphinx/qmp_lexer.py b/docs/sphinx/qmp_lexer.py
new file mode 100644
index 0000000000..f7e4c0e198
--- /dev/null
+++ b/docs/sphinx/qmp_lexer.py
@@ -0,0 +1,43 @@
+# QEMU Monitor Protocol Lexer Extension
+#
+# Copyright (C) 2019, Red Hat Inc.
+#
+# Authors:
+#  Eduardo Habkost <ehabkost@redhat.com>
+#  John Snow <jsnow@redhat.com>
+#
+# This work is licensed under the terms of the GNU GPLv2 or later.
+# See the COPYING file in the top-level directory.
+"""qmp_lexer is a Sphinx extension that provides a QMP lexer for code bl=
ocks."""
+
+from pygments.lexer import RegexLexer, DelegatingLexer
+from pygments.lexers.data import JsonLexer
+from pygments import token
+from sphinx import errors
+
+class QMPExampleMarkersLexer(RegexLexer):
+    """
+    QMPExampleMarkersLexer lexes QMP example annotations.
+    This lexer adds support for directionality flow and elision indicato=
rs.
+    """
+    tokens =3D {
+        'root': [
+            (r'-> ', token.Generic.Prompt),
+            (r'<- ', token.Generic.Prompt),
+            (r' ?\.{3} ?', token.Generic.Prompt),
+        ]
+    }
+
+class QMPExampleLexer(DelegatingLexer):
+    """QMPExampleLexer lexes annotated QMP examples."""
+    def __init__(self, **options):
+        super(QMPExampleLexer, self).__init__(JsonLexer, QMPExampleMarke=
rsLexer,
+                                              token.Error, **options)
+
+def setup(sphinx):
+    """For use by the Sphinx extensions API."""
+    try:
+        sphinx.require_sphinx('2.1')
+        sphinx.add_lexer('QMP', QMPExampleLexer)
+    except errors.VersionRequirementError:
+        sphinx.add_lexer('QMP', QMPExampleLexer())
--=20
2.20.1


