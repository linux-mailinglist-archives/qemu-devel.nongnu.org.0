Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D5B8F1882CA
	for <lists+qemu-devel@lfdr.de>; Tue, 17 Mar 2020 13:01:08 +0100 (CET)
Received: from localhost ([::1]:59702 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jEAuB-00085B-Qx
	for lists+qemu-devel@lfdr.de; Tue, 17 Mar 2020 08:01:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56731)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <armbru@redhat.com>) id 1jEAoV-000831-Ki
 for qemu-devel@nongnu.org; Tue, 17 Mar 2020 07:55:17 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <armbru@redhat.com>) id 1jEAoU-0006K7-22
 for qemu-devel@nongnu.org; Tue, 17 Mar 2020 07:55:15 -0400
Received: from us-smtp-delivery-74.mimecast.com ([216.205.24.74]:52802)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <armbru@redhat.com>) id 1jEAoT-0006H3-Sl
 for qemu-devel@nongnu.org; Tue, 17 Mar 2020 07:55:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1584446113;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=deHWtMLcOFVqmfety9mvhUjyvqnRYqCfdMv/VU5iTRQ=;
 b=ZqrjliA070QOckY++isPr0JQ3F/3I4iX/Am2EFesZuNyiyFS8Pctr2z10uI7KZ4ClXKJkm
 PZXQUyE8+B2coU8dES4fbt6cHseybl+pJZAGdaUVuDHJ9slSzowPEiMeppaXflJ3T7gDhv
 CgLz+yCurkzW5RDCI3cnJOJ9mmNPT7w=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-363-cL444LzyOvCr-0-BUk0Clg-1; Tue, 17 Mar 2020 07:55:12 -0400
X-MC-Unique: cL444LzyOvCr-0-BUk0Clg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id EB7CA1034B05;
 Tue, 17 Mar 2020 11:55:10 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-130.ams2.redhat.com
 [10.36.112.130])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id B3CCB9129A;
 Tue, 17 Mar 2020 11:55:09 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 47C831135A59; Tue, 17 Mar 2020 12:55:00 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 16/34] qapi/schema: Change _make_features() to a take
 feature list
Date: Tue, 17 Mar 2020 12:54:41 +0100
Message-Id: <20200317115459.31821-17-armbru@redhat.com>
In-Reply-To: <20200317115459.31821-1-armbru@redhat.com>
References: <20200317115459.31821-1-armbru@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
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
Cc: marcandre.lureau@gmail.com, mdroth@linux.vnet.ibm.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

QAPISchema._make_features() takes a definition expression, and
extracts its 'features' member.  The other ._make_FOO() leave
destructuring expressions to their callers.  Change ._make_features()
to match them.

Signed-off-by: Markus Armbruster <armbru@redhat.com>
---
 scripts/qapi/schema.py | 17 +++++++++--------
 1 file changed, 9 insertions(+), 8 deletions(-)

diff --git a/scripts/qapi/schema.py b/scripts/qapi/schema.py
index 958756ecd6..4d8ad67303 100644
--- a/scripts/qapi/schema.py
+++ b/scripts/qapi/schema.py
@@ -904,8 +904,9 @@ class QAPISchema:
         self._def_entity(QAPISchemaEnumType('QType', None, None, None, Non=
e,
                                             qtype_values, 'QTYPE'))
=20
-    def _make_features(self, expr, info):
-        features =3D expr.get('features', [])
+    def _make_features(self, features, info):
+        if features is None:
+            return []
         return [QAPISchemaFeature(f['name'], info, f.get('if'))
                 for f in features]
=20
@@ -955,7 +956,7 @@ class QAPISchema:
         data =3D expr['data']
         prefix =3D expr.get('prefix')
         ifcond =3D expr.get('if')
-        features =3D self._make_features(expr, info)
+        features =3D self._make_features(expr.get('features'), info)
         self._def_entity(QAPISchemaEnumType(
             name, info, doc, ifcond, features,
             self._make_enum_members(data, info), prefix))
@@ -979,7 +980,7 @@ class QAPISchema:
         base =3D expr.get('base')
         data =3D expr['data']
         ifcond =3D expr.get('if')
-        features =3D self._make_features(expr, info)
+        features =3D self._make_features(expr.get('features'), info)
         self._def_entity(QAPISchemaObjectType(
             name, info, doc, ifcond, features, base,
             self._make_members(data, info),
@@ -1002,7 +1003,7 @@ class QAPISchema:
         data =3D expr['data']
         base =3D expr.get('base')
         ifcond =3D expr.get('if')
-        features =3D self._make_features(expr, info)
+        features =3D self._make_features(expr.get('features'), info)
         tag_name =3D expr.get('discriminator')
         tag_member =3D None
         if isinstance(base, dict):
@@ -1032,7 +1033,7 @@ class QAPISchema:
         name =3D expr['alternate']
         data =3D expr['data']
         ifcond =3D expr.get('if')
-        features =3D self._make_features(expr, info)
+        features =3D self._make_features(expr.get('features'), info)
         variants =3D [self._make_variant(key, value['type'], value.get('if=
'),
                                        info)
                     for (key, value) in data.items()]
@@ -1052,7 +1053,7 @@ class QAPISchema:
         allow_oob =3D expr.get('allow-oob', False)
         allow_preconfig =3D expr.get('allow-preconfig', False)
         ifcond =3D expr.get('if')
-        features =3D self._make_features(expr, info)
+        features =3D self._make_features(expr.get('features'), info)
         if isinstance(data, OrderedDict):
             data =3D self._make_implicit_object_type(
                 name, info, ifcond,
@@ -1070,7 +1071,7 @@ class QAPISchema:
         data =3D expr.get('data')
         boxed =3D expr.get('boxed', False)
         ifcond =3D expr.get('if')
-        features =3D self._make_features(expr, info)
+        features =3D self._make_features(expr.get('features'), info)
         if isinstance(data, OrderedDict):
             data =3D self._make_implicit_object_type(
                 name, info, ifcond,
--=20
2.21.1


