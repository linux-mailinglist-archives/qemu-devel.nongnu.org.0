Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B40FC122684
	for <lists+qemu-devel@lfdr.de>; Tue, 17 Dec 2019 09:18:41 +0100 (CET)
Received: from localhost ([::1]:37522 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ih840-00051P-Ns
	for lists+qemu-devel@lfdr.de; Tue, 17 Dec 2019 03:18:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48522)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <armbru@redhat.com>) id 1ih80V-0001Ap-0H
 for qemu-devel@nongnu.org; Tue, 17 Dec 2019 03:15:04 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <armbru@redhat.com>) id 1ih80S-0003HP-Nc
 for qemu-devel@nongnu.org; Tue, 17 Dec 2019 03:15:02 -0500
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:57058
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <armbru@redhat.com>) id 1ih80S-0003Gw-Jq
 for qemu-devel@nongnu.org; Tue, 17 Dec 2019 03:15:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1576570500;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=z4lvDCkXxD1e24K22IpQXeQ9nSquCsu8qLqbrRKzLJg=;
 b=XdFIdoYFnCy/+YM/Z8Td4jS7GbtSnUPMFTI/fBtbZZSCInUqZPi8cxfGosfQri8hpuyrls
 40czLwITMFFjzxqLrStaLS0GXdWKgj8fJNXz0urw8ckzFtuEKiIatBNlSBpYLcNmz+4U2J
 x6oC90tOsiL9lsvdxdherUaO78/Jn8g=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-407-9qauTiL7Od6nl8AXcpzZNg-1; Tue, 17 Dec 2019 03:14:59 -0500
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2AC20189CD0F
 for <qemu-devel@nongnu.org>; Tue, 17 Dec 2019 08:14:58 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-116-42.ams2.redhat.com
 [10.36.116.42])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id CBC5F620B2;
 Tue, 17 Dec 2019 08:14:57 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id ECE0911385CB; Tue, 17 Dec 2019 09:14:54 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 6/6] qapi: Simplify QAPISchemaModularCVisitor
Date: Tue, 17 Dec 2019 09:14:54 +0100
Message-Id: <20191217081454.8072-7-armbru@redhat.com>
In-Reply-To: <20191217081454.8072-1-armbru@redhat.com>
References: <20191217081454.8072-1-armbru@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-MC-Unique: 9qauTiL7Od6nl8AXcpzZNg-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.120
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Since the previous commit, QAPISchemaVisitor.visit_module() is called
just once.  Simplify QAPISchemaModularCVisitor accordingly.

Signed-off-by: Markus Armbruster <armbru@redhat.com>
Message-Id: <20191120182551.23795-7-armbru@redhat.com>
Reviewed-by: Eric Blake <eblake@redhat.com>
---
 scripts/qapi/commands.py |  2 +-
 scripts/qapi/events.py   |  2 +-
 scripts/qapi/gen.py      | 28 ++++++++++++++--------------
 scripts/qapi/types.py    |  5 +++--
 scripts/qapi/visit.py    |  8 ++++----
 5 files changed, 23 insertions(+), 22 deletions(-)

diff --git a/scripts/qapi/commands.py b/scripts/qapi/commands.py
index 47f4a18cfe..afa55b055c 100644
--- a/scripts/qapi/commands.py
+++ b/scripts/qapi/commands.py
@@ -239,7 +239,7 @@ class QAPISchemaGenCommandVisitor(QAPISchemaModularCVis=
itor):
     def __init__(self, prefix):
         QAPISchemaModularCVisitor.__init__(
             self, prefix, 'qapi-commands',
-            ' * Schema-defined QAPI/QMP commands', __doc__)
+            ' * Schema-defined QAPI/QMP commands', None, __doc__)
         self._regy =3D QAPIGenCCode(None)
         self._visited_ret_types =3D {}
=20
diff --git a/scripts/qapi/events.py b/scripts/qapi/events.py
index 10fc509fa9..2bde3e6128 100644
--- a/scripts/qapi/events.py
+++ b/scripts/qapi/events.py
@@ -140,7 +140,7 @@ class QAPISchemaGenEventVisitor(QAPISchemaModularCVisit=
or):
     def __init__(self, prefix):
         QAPISchemaModularCVisitor.__init__(
             self, prefix, 'qapi-events',
-            ' * Schema-defined QAPI/QMP events', __doc__)
+            ' * Schema-defined QAPI/QMP events', None, __doc__)
         self._event_enum_name =3D c_name(prefix + 'QAPIEvent', protect=3DF=
alse)
         self._event_enum_members =3D []
         self._event_emit_name =3D c_name(prefix + 'qapi_event_emit')
diff --git a/scripts/qapi/gen.py b/scripts/qapi/gen.py
index 112b6d94c5..95afae0615 100644
--- a/scripts/qapi/gen.py
+++ b/scripts/qapi/gen.py
@@ -201,10 +201,11 @@ class QAPISchemaMonolithicCVisitor(QAPISchemaVisitor)=
:
=20
 class QAPISchemaModularCVisitor(QAPISchemaVisitor):
=20
-    def __init__(self, prefix, what, blurb, pydoc):
+    def __init__(self, prefix, what, user_blurb, builtin_blurb, pydoc):
         self._prefix =3D prefix
         self._what =3D what
-        self._blurb =3D blurb
+        self._user_blurb =3D user_blurb
+        self._builtin_blurb =3D builtin_blurb
         self._pydoc =3D pydoc
         self._genc =3D None
         self._genh =3D None
@@ -245,7 +246,7 @@ class QAPISchemaModularCVisitor(QAPISchemaVisitor):
         genc =3D QAPIGenC(basename + '.c', blurb, self._pydoc)
         genh =3D QAPIGenH(basename + '.h', blurb, self._pydoc)
         self._module[name] =3D (genc, genh)
-        self._set_module(name)
+        self._genc, self._genh =3D self._module[name]
=20
     def _add_user_module(self, name, blurb):
         assert self._is_user_module(name)
@@ -256,9 +257,6 @@ class QAPISchemaModularCVisitor(QAPISchemaVisitor):
     def _add_system_module(self, name, blurb):
         self._add_module(name and './' + name, blurb)
=20
-    def _set_module(self, name):
-        self._genc, self._genh =3D self._module[name]
-
     def write(self, output_dir, opt_builtins=3DFalse):
         for name in self._module:
             if self._is_builtin_module(name) and not opt_builtins:
@@ -271,15 +269,17 @@ class QAPISchemaModularCVisitor(QAPISchemaVisitor):
         pass
=20
     def visit_module(self, name):
-        if name in self._module:
-            self._set_module(name)
-        elif self._is_builtin_module(name):
-            # The built-in module has not been created.  No code may
-            # be generated.
-            self._genc =3D None
-            self._genh =3D None
+        if name is None:
+            if self._builtin_blurb:
+                self._add_system_module(None, self._builtin_blurb)
+                self._begin_system_module(name)
+            else:
+                # The built-in module has not been created.  No code may
+                # be generated.
+                self._genc =3D None
+                self._genh =3D None
         else:
-            self._add_user_module(name, self._blurb)
+            self._add_user_module(name, self._user_blurb)
             self._begin_user_module(name)
=20
     def visit_include(self, name, info):
diff --git a/scripts/qapi/types.py b/scripts/qapi/types.py
index d8751daa04..99dcaf7074 100644
--- a/scripts/qapi/types.py
+++ b/scripts/qapi/types.py
@@ -243,8 +243,9 @@ class QAPISchemaGenTypeVisitor(QAPISchemaModularCVisito=
r):
     def __init__(self, prefix):
         QAPISchemaModularCVisitor.__init__(
             self, prefix, 'qapi-types', ' * Schema-defined QAPI types',
-            __doc__)
-        self._add_system_module(None, ' * Built-in QAPI types')
+            ' * Built-in QAPI types', __doc__)
+
+    def _begin_system_module(self, name):
         self._genc.preamble_add(mcgen('''
 #include "qemu/osdep.h"
 #include "qapi/dealloc-visitor.h"
diff --git a/scripts/qapi/visit.py b/scripts/qapi/visit.py
index c72f2bc5c0..4efce62b0c 100644
--- a/scripts/qapi/visit.py
+++ b/scripts/qapi/visit.py
@@ -285,8 +285,9 @@ class QAPISchemaGenVisitVisitor(QAPISchemaModularCVisit=
or):
     def __init__(self, prefix):
         QAPISchemaModularCVisitor.__init__(
             self, prefix, 'qapi-visit', ' * Schema-defined QAPI visitors',
-            __doc__)
-        self._add_system_module(None, ' * Built-in QAPI visitors')
+            ' * Built-in QAPI visitors', __doc__)
+
+    def _begin_system_module(self, name):
         self._genc.preamble_add(mcgen('''
 #include "qemu/osdep.h"
 #include "qapi/error.h"
@@ -296,8 +297,7 @@ class QAPISchemaGenVisitVisitor(QAPISchemaModularCVisit=
or):
 #include "qapi/visitor.h"
 #include "qapi/qapi-builtin-types.h"
=20
-''',
-                                      prefix=3Dprefix))
+'''))
=20
     def _begin_user_module(self, name):
         types =3D self._module_basename('qapi-types', name)
--=20
2.21.0


