Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 500EBC11E9
	for <lists+qemu-devel@lfdr.de>; Sat, 28 Sep 2019 20:58:49 +0200 (CEST)
Received: from localhost ([::1]:34478 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iEHvc-0000pW-2Z
	for lists+qemu-devel@lfdr.de; Sat, 28 Sep 2019 14:58:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44003)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <armbru@redhat.com>) id 1iEHdB-0008T9-Tm
 for qemu-devel@nongnu.org; Sat, 28 Sep 2019 14:39:49 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <armbru@redhat.com>) id 1iEHd7-00040h-K8
 for qemu-devel@nongnu.org; Sat, 28 Sep 2019 14:39:45 -0400
Received: from mx1.redhat.com ([209.132.183.28]:52470)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <armbru@redhat.com>) id 1iEHd7-0003wJ-52
 for qemu-devel@nongnu.org; Sat, 28 Sep 2019 14:39:41 -0400
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id EAC87307D8BE
 for <qemu-devel@nongnu.org>; Sat, 28 Sep 2019 18:39:39 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-117-142.ams2.redhat.com
 [10.36.117.142])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 950C025261;
 Sat, 28 Sep 2019 18:39:39 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 884E71136427; Sat, 28 Sep 2019 20:39:34 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 27/27] qapi: Improve source file read error handling
Date: Sat, 28 Sep 2019 20:39:34 +0200
Message-Id: <20190928183934.12459-28-armbru@redhat.com>
In-Reply-To: <20190928183934.12459-1-armbru@redhat.com>
References: <20190928183934.12459-1-armbru@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.48]); Sat, 28 Sep 2019 18:39:39 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.132.183.28
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

qapi-gen.py crashes when it can't open the main schema file, and when
it can't read from any schema file.  Lazy.

Change QAPISchema.__init__() to take a file name instead of a file
object.  Move the open code from _include() to __init__(), so it's
used for the main schema file, too.

Move the read into the try for good measure, and rephrase the error
message.

Reporting open or read failure for the main schema file needs a
QAPISourceInfo representing "no source".  Make QAPISourceInfo cope
with fname=3DNone.

Signed-off-by: Markus Armbruster <armbru@redhat.com>
Reviewed-by: Eric Blake <eblake@redhat.com>
Message-Id: <20190927134639.4284-27-armbru@redhat.com>
---
 scripts/qapi/common.py                | 46 +++++++++++++++------------
 tests/qapi-schema/include-no-file.err |  2 +-
 2 files changed, 27 insertions(+), 21 deletions(-)

diff --git a/scripts/qapi/common.py b/scripts/qapi/common.py
index a74cd957d4..d6e00c80ea 100644
--- a/scripts/qapi/common.py
+++ b/scripts/qapi/common.py
@@ -53,7 +53,12 @@ class QAPISourceInfo(object):
         return info
=20
     def loc(self):
-        return '%s:%d' % (self.fname, self.line)
+        if self.fname is None:
+            return sys.argv[0]
+        ret =3D self.fname
+        if self.line is not None:
+            ret +=3D ':%d' % self.line
+        return ret
=20
     def in_defn(self):
         if self.defn_name:
@@ -383,14 +388,26 @@ class QAPIDoc(object):
=20
 class QAPISchemaParser(object):
=20
-    def __init__(self, fp, previously_included=3D[], incl_info=3DNone):
-        self.fname =3D fp.name
-        previously_included.append(os.path.abspath(fp.name))
-        self.src =3D fp.read()
+    def __init__(self, fname, previously_included=3D[], incl_info=3DNone=
):
+        previously_included.append(os.path.abspath(fname))
+
+        try:
+            if sys.version_info[0] >=3D 3:
+                fp =3D open(fname, 'r', encoding=3D'utf-8')
+            else:
+                fp =3D open(fname, 'r')
+            self.src =3D fp.read()
+        except IOError as e:
+            raise QAPISemError(incl_info or QAPISourceInfo(None, None, N=
one),
+                               "can't read %s file '%s': %s"
+                               % ("include" if incl_info else "schema",
+                                  fname,
+                                  e.strerror))
+
         if self.src =3D=3D '' or self.src[-1] !=3D '\n':
             self.src +=3D '\n'
         self.cursor =3D 0
-        self.info =3D QAPISourceInfo(self.fname, 1, incl_info)
+        self.info =3D QAPISourceInfo(fname, 1, incl_info)
         self.line_pos =3D 0
         self.exprs =3D []
         self.docs =3D []
@@ -414,7 +431,7 @@ class QAPISchemaParser(object):
                 if not isinstance(include, str):
                     raise QAPISemError(info,
                                        "value of 'include' must be a str=
ing")
-                incl_fname =3D os.path.join(os.path.dirname(self.fname),
+                incl_fname =3D os.path.join(os.path.dirname(fname),
                                           include)
                 self.exprs.append({'expr': {'include': incl_fname},
                                    'info': info})
@@ -466,14 +483,7 @@ class QAPISchemaParser(object):
         if incl_abs_fname in previously_included:
             return None
=20
-        try:
-            if sys.version_info[0] >=3D 3:
-                fobj =3D open(incl_fname, 'r', encoding=3D'utf-8')
-            else:
-                fobj =3D open(incl_fname, 'r')
-        except IOError as e:
-            raise QAPISemError(info, "%s: %s" % (e.strerror, incl_fname)=
)
-        return QAPISchemaParser(fobj, previously_included, info)
+        return QAPISchemaParser(incl_fname, previously_included, info)
=20
     def _pragma(self, name, value, info):
         global doc_required, returns_whitelist, name_case_whitelist
@@ -1734,11 +1744,7 @@ class QAPISchemaEvent(QAPISchemaEntity):
 class QAPISchema(object):
     def __init__(self, fname):
         self.fname =3D fname
-        if sys.version_info[0] >=3D 3:
-            f =3D open(fname, 'r', encoding=3D'utf-8')
-        else:
-            f =3D open(fname, 'r')
-        parser =3D QAPISchemaParser(f)
+        parser =3D QAPISchemaParser(fname)
         exprs =3D check_exprs(parser.exprs)
         self.docs =3D parser.docs
         self._entity_list =3D []
diff --git a/tests/qapi-schema/include-no-file.err b/tests/qapi-schema/in=
clude-no-file.err
index e42bcf4bc1..0a6c6bb4a9 100644
--- a/tests/qapi-schema/include-no-file.err
+++ b/tests/qapi-schema/include-no-file.err
@@ -1 +1 @@
-tests/qapi-schema/include-no-file.json:1: No such file or directory: tes=
ts/qapi-schema/include-no-file-sub.json
+tests/qapi-schema/include-no-file.json:1: can't read include file 'tests=
/qapi-schema/include-no-file-sub.json': No such file or directory
--=20
2.21.0


