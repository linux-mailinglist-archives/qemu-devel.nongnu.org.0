Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 13351E2FF0
	for <lists+qemu-devel@lfdr.de>; Thu, 24 Oct 2019 13:06:48 +0200 (CEST)
Received: from localhost ([::1]:38894 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iNax4-0003sX-Mb
	for lists+qemu-devel@lfdr.de; Thu, 24 Oct 2019 07:06:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59155)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <armbru@redhat.com>) id 1iNatE-0000oR-7X
 for qemu-devel@nongnu.org; Thu, 24 Oct 2019 07:02:50 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <armbru@redhat.com>) id 1iNatC-0004oN-6O
 for qemu-devel@nongnu.org; Thu, 24 Oct 2019 07:02:48 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:27434
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <armbru@redhat.com>) id 1iNatB-0004kK-QJ
 for qemu-devel@nongnu.org; Thu, 24 Oct 2019 07:02:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1571914962;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=lp9FhpPqPeW4kPws4YpI5d1qIzH6KB4ie+B1xHi7htA=;
 b=CW/5RUHmmtqOOScrxfoW9sTy0iU5hNqmedoqS/8Gf9WgC8mDa28DdlfPcDrMmjVo7QbudS
 jTaOwGyVeLQPetFiy3pfZJIQNpZ6Utn4tOosPbGcGJb9v3tm17Cr2kefzX2OB8YI6OD/Pm
 OEgXNZy502PZFWRLgt7eMfIs82Qiai4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-310-u0xY2OtINme5AWY6k0hlcQ-1; Thu, 24 Oct 2019 07:02:40 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DD67780183E;
 Thu, 24 Oct 2019 11:02:39 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.36.118.123])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id BC7356061E;
 Thu, 24 Oct 2019 11:02:38 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 3598A11384A8; Thu, 24 Oct 2019 13:02:37 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 01/19] tests/qapi-schema: Demonstrate feature and enum doc
 comment bugs
Date: Thu, 24 Oct 2019 13:02:19 +0200
Message-Id: <20191024110237.30963-2-armbru@redhat.com>
In-Reply-To: <20191024110237.30963-1-armbru@redhat.com>
References: <20191024110237.30963-1-armbru@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-MC-Unique: u0xY2OtINme5AWY6k0hlcQ-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=WINDOWS-1252
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 205.139.110.120
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
Cc: kwolf@redhat.com, pkrempa@redhat.com, mdroth@linux.vnet.ibm.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Add negative tests doc-bad-enum-member and doc-bad-feature to cover
documentation for nonexistent enum members and features, and test
doc-undoc-feature to cover features lacking documentation.  None of
them works.  To be fixed later in this series.

Signed-off-by: Markus Armbruster <armbru@redhat.com>
---
 tests/Makefile.include                     |  3 +++
 tests/qapi-schema/doc-bad-enum-member.err  |  0
 tests/qapi-schema/doc-bad-enum-member.json |  9 +++++++++
 tests/qapi-schema/doc-bad-enum-member.out  | 21 +++++++++++++++++++++
 tests/qapi-schema/doc-bad-feature.err      |  0
 tests/qapi-schema/doc-bad-feature.json     | 10 ++++++++++
 tests/qapi-schema/doc-bad-feature.out      | 17 +++++++++++++++++
 tests/qapi-schema/doc-undoc-feature.err    |  0
 tests/qapi-schema/doc-undoc-feature.json   | 10 ++++++++++
 tests/qapi-schema/doc-undoc-feature.out    | 19 +++++++++++++++++++
 10 files changed, 89 insertions(+)
 create mode 100644 tests/qapi-schema/doc-bad-enum-member.err
 create mode 100644 tests/qapi-schema/doc-bad-enum-member.json
 create mode 100644 tests/qapi-schema/doc-bad-enum-member.out
 create mode 100644 tests/qapi-schema/doc-bad-feature.err
 create mode 100644 tests/qapi-schema/doc-bad-feature.json
 create mode 100644 tests/qapi-schema/doc-bad-feature.out
 create mode 100644 tests/qapi-schema/doc-undoc-feature.err
 create mode 100644 tests/qapi-schema/doc-undoc-feature.json
 create mode 100644 tests/qapi-schema/doc-undoc-feature.out

diff --git a/tests/Makefile.include b/tests/Makefile.include
index 09e5b410dc..b9deb131fb 100644
--- a/tests/Makefile.include
+++ b/tests/Makefile.include
@@ -342,6 +342,8 @@ qapi-schema +=3D command-int.json
 qapi-schema +=3D comments.json
 qapi-schema +=3D doc-bad-alternate-member.json
 qapi-schema +=3D doc-bad-command-arg.json
+qapi-schema +=3D doc-bad-enum-member.json
+qapi-schema +=3D doc-bad-feature.json
 qapi-schema +=3D doc-bad-section.json
 qapi-schema +=3D doc-bad-symbol.json
 qapi-schema +=3D doc-bad-union-member.json
@@ -365,6 +367,7 @@ qapi-schema +=3D doc-missing-expr.json
 qapi-schema +=3D doc-missing-space.json
 qapi-schema +=3D doc-missing.json
 qapi-schema +=3D doc-no-symbol.json
+qapi-schema +=3D doc-undoc-feature.json
 qapi-schema +=3D double-type.json
 qapi-schema +=3D duplicate-key.json
 qapi-schema +=3D empty.json
diff --git a/tests/qapi-schema/doc-bad-enum-member.err b/tests/qapi-schema/=
doc-bad-enum-member.err
new file mode 100644
index 0000000000..e69de29bb2
diff --git a/tests/qapi-schema/doc-bad-enum-member.json b/tests/qapi-schema=
/doc-bad-enum-member.json
new file mode 100644
index 0000000000..9f32fe64b4
--- /dev/null
+++ b/tests/qapi-schema/doc-bad-enum-member.json
@@ -0,0 +1,9 @@
+# Members listed in the doc comment must exist in the actual schema
+# BUG: nonexistent @a is not rejected
+
+##
+# @Foo:
+# @a: a
+# @b: b
+##
+{ 'enum': 'Foo', 'data': [ 'b' ] }
diff --git a/tests/qapi-schema/doc-bad-enum-member.out b/tests/qapi-schema/=
doc-bad-enum-member.out
new file mode 100644
index 0000000000..6ca31c1e9b
--- /dev/null
+++ b/tests/qapi-schema/doc-bad-enum-member.out
@@ -0,0 +1,21 @@
+module None
+object q_empty
+enum QType
+    prefix QTYPE
+    member none
+    member qnull
+    member qnum
+    member qstring
+    member qdict
+    member qlist
+    member qbool
+module doc-bad-enum-member.json
+enum Foo
+    member b
+doc symbol=3DFoo
+    body=3D
+
+    arg=3Da
+a
+    arg=3Db
+b
diff --git a/tests/qapi-schema/doc-bad-feature.err b/tests/qapi-schema/doc-=
bad-feature.err
new file mode 100644
index 0000000000..e69de29bb2
diff --git a/tests/qapi-schema/doc-bad-feature.json b/tests/qapi-schema/doc=
-bad-feature.json
new file mode 100644
index 0000000000..2a78e3b1db
--- /dev/null
+++ b/tests/qapi-schema/doc-bad-feature.json
@@ -0,0 +1,10 @@
+# Features listed in the doc comment must exist in the actual schema
+# BUG: nonexistent @a is not rejected
+
+##
+# @foo:
+#
+# Features:
+# @a: a
+##
+{ 'command': 'foo' }
diff --git a/tests/qapi-schema/doc-bad-feature.out b/tests/qapi-schema/doc-=
bad-feature.out
new file mode 100644
index 0000000000..4670be3a72
--- /dev/null
+++ b/tests/qapi-schema/doc-bad-feature.out
@@ -0,0 +1,17 @@
+module None
+object q_empty
+enum QType
+    prefix QTYPE
+    member none
+    member qnull
+    member qnum
+    member qstring
+    member qdict
+    member qlist
+    member qbool
+module doc-bad-feature.json
+command foo None -> None
+    gen=3DTrue success_response=3DTrue boxed=3DFalse oob=3DFalse preconfig=
=3DFalse
+doc symbol=3Dfoo
+    body=3D
+
diff --git a/tests/qapi-schema/doc-undoc-feature.err b/tests/qapi-schema/do=
c-undoc-feature.err
new file mode 100644
index 0000000000..e69de29bb2
diff --git a/tests/qapi-schema/doc-undoc-feature.json b/tests/qapi-schema/d=
oc-undoc-feature.json
new file mode 100644
index 0000000000..c7650d9974
--- /dev/null
+++ b/tests/qapi-schema/doc-undoc-feature.json
@@ -0,0 +1,10 @@
+# Doc comment must cover all features
+# BUG: missing documentation for @undoc not caught
+
+##
+# @foo:
+#
+# Features:
+# @doc: documented feature
+##
+{ 'command': 'foo', 'features': ['undoc', 'doc'] }
diff --git a/tests/qapi-schema/doc-undoc-feature.out b/tests/qapi-schema/do=
c-undoc-feature.out
new file mode 100644
index 0000000000..faae777f0d
--- /dev/null
+++ b/tests/qapi-schema/doc-undoc-feature.out
@@ -0,0 +1,19 @@
+module None
+object q_empty
+enum QType
+    prefix QTYPE
+    member none
+    member qnull
+    member qnum
+    member qstring
+    member qdict
+    member qlist
+    member qbool
+module doc-undoc-feature.json
+command foo None -> None
+    gen=3DTrue success_response=3DTrue boxed=3DFalse oob=3DFalse preconfig=
=3DFalse
+    feature undoc
+    feature doc
+doc symbol=3Dfoo
+    body=3D
+
--=20
2.21.0


