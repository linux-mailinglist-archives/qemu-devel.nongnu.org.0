Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 64835189013
	for <lists+qemu-devel@lfdr.de>; Tue, 17 Mar 2020 22:08:21 +0100 (CET)
Received: from localhost ([::1]:41446 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jEJRk-00036t-DP
	for lists+qemu-devel@lfdr.de; Tue, 17 Mar 2020 17:08:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51467)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <armbru@redhat.com>) id 1jEJL9-0002p0-HI
 for qemu-devel@nongnu.org; Tue, 17 Mar 2020 17:01:33 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <armbru@redhat.com>) id 1jEJL4-0002j0-SW
 for qemu-devel@nongnu.org; Tue, 17 Mar 2020 17:01:30 -0400
Received: from us-smtp-delivery-74.mimecast.com ([216.205.24.74]:55978)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <armbru@redhat.com>) id 1jEJL4-0002di-Fm
 for qemu-devel@nongnu.org; Tue, 17 Mar 2020 17:01:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1584478886;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ZoMkCWmT8FEiTrumvhxhIC4sVKxqjhPLDvzcW8ZXvYY=;
 b=IWrMqfVk4lSbFA7XWiDYb/yBLn7XDcuV9jYZn1b2tlnIm6b0h8WqDVB7On+cxjEIGOlxM4
 27evFEWKPvub+DAnLHPvyZosZZY6t/IgZ+zrjKpmQ3IW3zw9T5UrqlpXKZAoMm1H5dTUyg
 Cgzj/G6ADGz4Od0yP3NEAIn9zYqiCLA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-269-2_fmLPr3OYiyTDzfkUUmow-1; Tue, 17 Mar 2020 17:01:22 -0400
X-MC-Unique: 2_fmLPr3OYiyTDzfkUUmow-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 50EA5190B2A0
 for <qemu-devel@nongnu.org>; Tue, 17 Mar 2020 21:01:21 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-130.ams2.redhat.com
 [10.36.112.130])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 0A1D792D0E;
 Tue, 17 Mar 2020 21:01:21 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 7342F1135A70; Tue, 17 Mar 2020 22:01:15 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 20/30] qapi/schema: Call QAPIDoc.connect_member() in just one
 place
Date: Tue, 17 Mar 2020 22:01:05 +0100
Message-Id: <20200317210115.8864-21-armbru@redhat.com>
In-Reply-To: <20200317210115.8864-1-armbru@redhat.com>
References: <20200317210115.8864-1-armbru@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 216.205.24.74
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
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The .connect_doc() of classes that have QAPISchemaMember connect them
to their documentation.  Change them to delegate the actual work to
new QAPISchemaMember.connect_doc().  Matches the .connect_doc() that
already exist.

Signed-off-by: Markus Armbruster <armbru@redhat.com>
Reviewed-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
Message-Id: <20200317115459.31821-20-armbru@redhat.com>
---
 scripts/qapi/schema.py | 23 ++++++++++++-----------
 1 file changed, 12 insertions(+), 11 deletions(-)

diff --git a/scripts/qapi/schema.py b/scripts/qapi/schema.py
index 033c84c4a0..59e1f5a395 100644
--- a/scripts/qapi/schema.py
+++ b/scripts/qapi/schema.py
@@ -252,9 +252,8 @@ class QAPISchemaEnumType(QAPISchemaType):
     def connect_doc(self, doc=3DNone):
         super().connect_doc(doc)
         doc =3D doc or self.doc
-        if doc:
-            for m in self.members:
-                doc.connect_member(m)
+        for m in self.members:
+            m.connect_doc(doc)
=20
     def is_implicit(self):
         # See QAPISchema._make_implicit_enum_type() and ._def_predefineds(=
)
@@ -396,11 +395,10 @@ class QAPISchemaObjectType(QAPISchemaType):
     def connect_doc(self, doc=3DNone):
         super().connect_doc(doc)
         doc =3D doc or self.doc
-        if doc:
-            if self.base and self.base.is_implicit():
-                self.base.connect_doc(doc)
-            for m in self.local_members:
-                doc.connect_member(m)
+        if self.base and self.base.is_implicit():
+            self.base.connect_doc(doc)
+        for m in self.local_members:
+            m.connect_doc(doc)
=20
     @property
     def ifcond(self):
@@ -496,9 +494,8 @@ class QAPISchemaAlternateType(QAPISchemaType):
     def connect_doc(self, doc=3DNone):
         super().connect_doc(doc)
         doc =3D doc or self.doc
-        if doc:
-            for v in self.variants.variants:
-                doc.connect_member(v)
+        for v in self.variants.variants:
+            v.connect_doc(doc)
=20
     def c_type(self):
         return c_name(self.name) + pointer_suffix
@@ -627,6 +624,10 @@ class QAPISchemaMember:
                 % (self.describe(info), seen[cname].describe(info)))
         seen[cname] =3D self
=20
+    def connect_doc(self, doc):
+        if doc:
+            doc.connect_member(self)
+
     def describe(self, info):
         role =3D self.role
         defined_in =3D self.defined_in
--=20
2.21.1


