Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EE7A42DA47A
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Dec 2020 01:00:55 +0100 (CET)
Received: from localhost ([::1]:47862 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1koxlu-000393-L9
	for lists+qemu-devel@lfdr.de; Mon, 14 Dec 2020 19:00:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43712)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1koxf7-0003T3-Mr
 for qemu-devel@nongnu.org; Mon, 14 Dec 2020 18:53:53 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:27466)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1koxf5-0000uB-KW
 for qemu-devel@nongnu.org; Mon, 14 Dec 2020 18:53:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607990030;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Z/i3u4Jqw+ltJl/CYpUVaD3HcCU59abT8EbOdb4TprE=;
 b=JVTeWI3N3Tul9/dXqJYlDnt5yehleegQI0Uky+ja9M1JzDyawe35gavpQ0ZvJRAoKwvPrA
 4diPQUDfh3CTJLsrBNq6Udm7aZzoLvFaQF+z2b/a1mNZEQQ+MU/mP9nInE/jxP6f4FzOGt
 Pn1PmLR+3YYHN1wBj6OwYiXNfzUHfx8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-327-KO6a4wWePi2ztc_RSF24rA-1; Mon, 14 Dec 2020 18:53:49 -0500
X-MC-Unique: KO6a4wWePi2ztc_RSF24rA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2E53F9CDA0
 for <qemu-devel@nongnu.org>; Mon, 14 Dec 2020 23:53:48 +0000 (UTC)
Received: from scv.redhat.com (ovpn-116-117.rdu2.redhat.com [10.10.116.117])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 09E0E70484;
 Mon, 14 Dec 2020 23:53:46 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 09/12] qapi/gen: move write method to QAPIGenC,
 make fname a str
Date: Mon, 14 Dec 2020 18:53:24 -0500
Message-Id: <20201214235327.1007124-10-jsnow@redhat.com>
In-Reply-To: <20201214235327.1007124-1-jsnow@redhat.com>
References: <20201214235327.1007124-1-jsnow@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Cleber Rosa <crosa@redhat.com>, John Snow <jsnow@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Markus Armbruster <armbru@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

QAPIGenC and QAPIGenH in particular depend on fname being defined, but
we have a usage of QAPIGenCCode that isn't intended to be associated
with a particular file.

No problem, move the write method down to the class that actually needs
it, and keep QAPIGenCCode more abstract.

Signed-off-by: John Snow <jsnow@redhat.com>
---
 scripts/qapi/commands.py |  2 +-
 scripts/qapi/gen.py      | 54 ++++++++++++++++++++--------------------
 2 files changed, 28 insertions(+), 28 deletions(-)

diff --git a/scripts/qapi/commands.py b/scripts/qapi/commands.py
index 71744f48a353..b346676d15a0 100644
--- a/scripts/qapi/commands.py
+++ b/scripts/qapi/commands.py
@@ -258,7 +258,7 @@ def __init__(self, prefix: str):
         super().__init__(
             prefix, 'qapi-commands',
             ' * Schema-defined QAPI/QMP commands', None, __doc__)
-        self._regy = QAPIGenCCode(None)
+        self._regy = QAPIGenCCode()
         self._visited_ret_types: Dict[QAPIGenC, Set[QAPISchemaType]] = {}
 
     def _begin_user_module(self, name: str) -> None:
diff --git a/scripts/qapi/gen.py b/scripts/qapi/gen.py
index 17ae9f4af703..b2c89213d838 100644
--- a/scripts/qapi/gen.py
+++ b/scripts/qapi/gen.py
@@ -36,8 +36,7 @@
 
 
 class QAPIGen:
-    def __init__(self, fname: Optional[str]):
-        self.fname = fname
+    def __init__(self) -> None:
         self._preamble = ''
         self._body = ''
 
@@ -58,28 +57,6 @@ def _bottom(self) -> str:
         # pylint: disable=no-self-use
         return ''
 
-    def write(self, output_dir: str) -> None:
-        # Include paths starting with ../ are used to reuse modules of the main
-        # schema in specialised schemas. Don't overwrite the files that are
-        # already generated for the main schema.
-        if self.fname.startswith('../'):
-            return
-        pathname = os.path.join(output_dir, self.fname)
-        odir = os.path.dirname(pathname)
-
-        if odir:
-            os.makedirs(odir, exist_ok=True)
-
-        # use os.open for O_CREAT to create and read a non-existant file
-        fd = os.open(pathname, os.O_RDWR | os.O_CREAT, 0o666)
-        with os.fdopen(fd, 'r+', encoding='utf-8') as fp:
-            text = self.get_content()
-            oldtext = fp.read(len(text) + 1)
-            if text != oldtext:
-                fp.seek(0)
-                fp.truncate(0)
-                fp.write(text)
-
 
 def _wrap_ifcond(ifcond: List[str], before: str, after: str) -> str:
     if before == after:
@@ -121,8 +98,8 @@ def build_params(arg_type: Optional[QAPISchemaObjectType],
 
 
 class QAPIGenCCode(QAPIGen):
-    def __init__(self, fname: Optional[str]):
-        super().__init__(fname)
+    def __init__(self) -> None:
+        super().__init__()
         self._start_if: Optional[Tuple[List[str], str, str]] = None
 
     def start_if(self, ifcond: List[str]) -> None:
@@ -147,11 +124,34 @@ def get_content(self) -> str:
 
 class QAPIGenC(QAPIGenCCode):
     def __init__(self, fname: str, blurb: str, pydoc: str):
-        super().__init__(fname)
+        super().__init__()
+        self.fname = fname
         self._blurb = blurb
         self._copyright = '\n * '.join(re.findall(r'^Copyright .*', pydoc,
                                                   re.MULTILINE))
 
+    def write(self, output_dir: str) -> None:
+        # Include paths starting with ../ are used to reuse modules of the main
+        # schema in specialised schemas. Don't overwrite the files that are
+        # already generated for the main schema.
+        if self.fname.startswith('../'):
+            return
+        pathname = os.path.join(output_dir, self.fname)
+        odir = os.path.dirname(pathname)
+
+        if odir:
+            os.makedirs(odir, exist_ok=True)
+
+        # use os.open for O_CREAT to create and read a non-existant file
+        fd = os.open(pathname, os.O_RDWR | os.O_CREAT, 0o666)
+        with os.fdopen(fd, 'r+', encoding='utf-8') as fp:
+            text = self.get_content()
+            oldtext = fp.read(len(text) + 1)
+            if text != oldtext:
+                fp.seek(0)
+                fp.truncate(0)
+                fp.write(text)
+
     def _top(self) -> str:
         return mcgen('''
 /* AUTOMATICALLY GENERATED, DO NOT MODIFY */
-- 
2.26.2


