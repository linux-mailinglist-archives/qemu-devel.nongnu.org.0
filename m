Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4416DC4100
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Oct 2019 21:26:52 +0200 (CEST)
Received: from localhost ([::1]:46972 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iFNnO-0002eV-V9
	for lists+qemu-devel@lfdr.de; Tue, 01 Oct 2019 15:26:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46683)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <armbru@redhat.com>) id 1iFNcJ-0004NI-Dv
 for qemu-devel@nongnu.org; Tue, 01 Oct 2019 15:15:24 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <armbru@redhat.com>) id 1iFNcH-0003In-CE
 for qemu-devel@nongnu.org; Tue, 01 Oct 2019 15:15:22 -0400
Received: from mx1.redhat.com ([209.132.183.28]:57834)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <armbru@redhat.com>) id 1iFNcH-0003HR-5M
 for qemu-devel@nongnu.org; Tue, 01 Oct 2019 15:15:21 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 133293175282;
 Tue,  1 Oct 2019 19:15:19 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.36.118.123])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 7A7E55D9CC;
 Tue,  1 Oct 2019 19:15:16 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id F421111386A0; Tue,  1 Oct 2019 21:15:14 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 1/7] qapi: Don't suppress doc generation without pragma
 doc-required
Date: Tue,  1 Oct 2019 21:15:08 +0200
Message-Id: <20191001191514.11208-2-armbru@redhat.com>
In-Reply-To: <20191001191514.11208-1-armbru@redhat.com>
References: <20191001191514.11208-1-armbru@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.49]); Tue, 01 Oct 2019 19:15:19 +0000 (UTC)
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
Cc: marcandre.lureau@redhat.com, mdroth@linux.vnet.ibm.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Commit bc52d03ff5 "qapi: Make doc comments optional where we don't
need them" made scripts/qapi2texi.py fail[*] unless the schema had
pragma 'doc-required': true.  The stated reason was inability to cope
with incomplete documentation.

When commit fb0bc835e5 "qapi-gen: New common driver for code and doc
generators" folded scripts/qapi2texi.py into scripts/qapi-gen.py, it
turned the failure into silent suppression.

The doc generator can cope with incomplete documentation now.  I don't
know since when, or what the problem was, or even whether it ever
existed.

Drop the silent suppression.

[*] The fail part was broken, fixed in commit e8ba07ea9a.

Signed-off-by: Markus Armbruster <armbru@redhat.com>
---
 scripts/qapi/doc.py    | 2 --
 tests/Makefile.include | 1 +
 2 files changed, 1 insertion(+), 2 deletions(-)

diff --git a/scripts/qapi/doc.py b/scripts/qapi/doc.py
index 5fc0fc7e06..693cc4486b 100755
--- a/scripts/qapi/doc.py
+++ b/scripts/qapi/doc.py
@@ -283,8 +283,6 @@ class QAPISchemaGenDocVisitor(qapi.common.QAPISchemaV=
isitor):
=20
=20
 def gen_doc(schema, output_dir, prefix):
-    if not qapi.common.doc_required:
-        return
     vis =3D QAPISchemaGenDocVisitor(prefix)
     vis.visit_begin(schema)
     for doc in schema.docs:
diff --git a/tests/Makefile.include b/tests/Makefile.include
index 3543451ed3..214fbd941c 100644
--- a/tests/Makefile.include
+++ b/tests/Makefile.include
@@ -609,6 +609,7 @@ tests/test-qapi-gen-timestamp: \
 	$(call quiet-command,$(PYTHON) $(SRC_PATH)/scripts/qapi-gen.py \
 		-o tests -p "test-" $<, \
 		"GEN","$(@:%-timestamp=3D%)")
+	@rm -f tests/test-qapi-doc.texi
 	@>$@
=20
 tests/qapi-schema/doc-good.test.texi: $(SRC_PATH)/tests/qapi-schema/doc-=
good.json $(qapi-py)
--=20
2.21.0


