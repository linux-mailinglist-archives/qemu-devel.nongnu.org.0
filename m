Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E46442DCAED
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Dec 2020 03:19:54 +0100 (CET)
Received: from localhost ([::1]:57668 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kpitW-0003sn-03
	for lists+qemu-devel@lfdr.de; Wed, 16 Dec 2020 21:19:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53624)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1kpiaC-0002GS-RX
 for qemu-devel@nongnu.org; Wed, 16 Dec 2020 20:59:56 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:52975)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1kpia3-0007Ba-D1
 for qemu-devel@nongnu.org; Wed, 16 Dec 2020 20:59:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1608170386;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=f8nKPihbKZ56Dc478W9rWwckr42c8RsR38TC3NpzLws=;
 b=Yyukgqxet2eTx9x4UQZ+fKob/FuCqt0Gyy4T9kJz2ZjEKVbOzhNyEEh7qrFB6yV2mUpk7P
 Wa6Ua9uDBe6yQcL0izx9KRg/S7sDgOn5CFJoLvx9IclUpeAOScYRimowV4ySSUUivm2QQ2
 1AMKsldW1O/p3VpMS/YFiE0N7K/5WYM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-79-fLsiGXTKPBGMqUBU1i-MGA-1; Wed, 16 Dec 2020 20:59:42 -0500
X-MC-Unique: fLsiGXTKPBGMqUBU1i-MGA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 57421801AC1;
 Thu, 17 Dec 2020 01:59:41 +0000 (UTC)
Received: from scv.redhat.com (ovpn-112-131.rdu2.redhat.com [10.10.112.131])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 8C4CC1E5;
 Thu, 17 Dec 2020 01:59:40 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 09/12] qapi/gen: move write method to QAPIGenC,
 make fname a str
Date: Wed, 16 Dec 2020 20:59:24 -0500
Message-Id: <20201217015927.197287-10-jsnow@redhat.com>
In-Reply-To: <20201217015927.197287-1-jsnow@redhat.com>
References: <20201217015927.197287-1-jsnow@redhat.com>
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
Cc: Eduardo Habkost <ehabkost@redhat.com>, Michael Roth <michael.roth@amd.com>,
 Markus Armbruster <armbru@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

QAPIGenC and QAPIGenH in particular depend on fname being defined, but
we have a usage of QAPIGenCCode that isn't intended to be associated
with a particular file.

No problem, move the write method down to the class that actually needs
it, and keep QAPIGenCCode more abstract.

Signed-off-by: John Snow <jsnow@redhat.com>

---

Possibly un-needed in concert with a forthcoming patch by Markus, but I
didn't have it in my hands at time of publishing.

Signed-off-by: John Snow <jsnow@redhat.com>
---
 scripts/qapi/commands.py |  2 +-
 scripts/qapi/gen.py      | 54 ++++++++++++++++++++--------------------
 2 files changed, 28 insertions(+), 28 deletions(-)

diff --git a/scripts/qapi/commands.py b/scripts/qapi/commands.py
index 71744f48a35..b346676d15a 100644
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
index 12ea98fb61e..2dd99635e74 100644
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


