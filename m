Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 876EEDFEDC
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Oct 2019 10:01:02 +0200 (CEST)
Received: from localhost ([::1]:51276 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iMp6D-0007WP-14
	for lists+qemu-devel@lfdr.de; Tue, 22 Oct 2019 04:01:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42412)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <armbru@redhat.com>) id 1iMp1j-0002hk-0S
 for qemu-devel@nongnu.org; Tue, 22 Oct 2019 03:56:24 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <armbru@redhat.com>) id 1iMp1h-0005qg-En
 for qemu-devel@nongnu.org; Tue, 22 Oct 2019 03:56:22 -0400
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:42331
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <armbru@redhat.com>) id 1iMp1h-0005on-3Q
 for qemu-devel@nongnu.org; Tue, 22 Oct 2019 03:56:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1571730979;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=QfKkkQJoQ0s4p6vhIxg0f578kjicEt7kTPooi9NUAT4=;
 b=ApBfThh5+k5BJhEZxDx8D/d2XYP2A4d5KBVpf22ir3/CZCJsQD7Qjnc9M84Q0+Z0K1OaOa
 CqtapDxVDCZamXOdQ+j6DneAevM5wDrvKnYFXoFCM3/IME2UY6dD8crOjK4sM0KPKjLsPK
 Psz7Lov/4pyu1UMyNIIhL/9ztniB2jg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-108-16jJJW-9N7ueYdRTBgC7mw-1; Tue, 22 Oct 2019 03:56:17 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2A0811005500
 for <qemu-devel@nongnu.org>; Tue, 22 Oct 2019 07:56:17 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.36.118.123])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id EC7B95D6A5;
 Tue, 22 Oct 2019 07:56:16 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 620E011384A8; Tue, 22 Oct 2019 09:56:15 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 01/12] qapi: Don't suppress doc generation without pragma
 doc-required
Date: Tue, 22 Oct 2019 09:56:04 +0200
Message-Id: <20191022075615.956-2-armbru@redhat.com>
In-Reply-To: <20191022075615.956-1-armbru@redhat.com>
References: <20191022075615.956-1-armbru@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-MC-Unique: 16jJJW-9N7ueYdRTBgC7mw-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 205.139.110.61
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
Reviewed-by: Eric Blake <eblake@redhat.com>
Message-Id: <20191018074345.24034-2-armbru@redhat.com>
---
 scripts/qapi/doc.py    | 2 --
 tests/Makefile.include | 1 +
 2 files changed, 1 insertion(+), 2 deletions(-)

diff --git a/scripts/qapi/doc.py b/scripts/qapi/doc.py
index 5fc0fc7e06..693cc4486b 100755
--- a/scripts/qapi/doc.py
+++ b/scripts/qapi/doc.py
@@ -283,8 +283,6 @@ class QAPISchemaGenDocVisitor(qapi.common.QAPISchemaVis=
itor):
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
 =09$(call quiet-command,$(PYTHON) $(SRC_PATH)/scripts/qapi-gen.py \
 =09=09-o tests -p "test-" $<, \
 =09=09"GEN","$(@:%-timestamp=3D%)")
+=09@rm -f tests/test-qapi-doc.texi
 =09@>$@
=20
 tests/qapi-schema/doc-good.test.texi: $(SRC_PATH)/tests/qapi-schema/doc-go=
od.json $(qapi-py)
--=20
2.21.0


