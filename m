Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 89CF8EE381
	for <lists+qemu-devel@lfdr.de>; Mon,  4 Nov 2019 16:19:17 +0100 (CET)
Received: from localhost ([::1]:34432 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iRe8S-0007fc-EF
	for lists+qemu-devel@lfdr.de; Mon, 04 Nov 2019 10:19:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40399)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <crosa@redhat.com>) id 1iRe38-0002Ue-Vy
 for qemu-devel@nongnu.org; Mon, 04 Nov 2019 10:13:48 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <crosa@redhat.com>) id 1iRe37-0002cZ-Ub
 for qemu-devel@nongnu.org; Mon, 04 Nov 2019 10:13:46 -0500
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:43437
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <crosa@redhat.com>) id 1iRe37-0002cE-Qx
 for qemu-devel@nongnu.org; Mon, 04 Nov 2019 10:13:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1572880425;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=sSUELfnrVYtkXpTtuIBRLY6tkamPIObtTgXDiupYXx4=;
 b=cUQGx9MNoTTRSJwhEIi7krGYVpyRAyWWnFdLb4u4nx/rLazKclM2+b8H7NjoMhUl5vQpDm
 1JplY51u/4aGM/4t0xkA3iHFY3yGuVY0eyAAFfYT9PP9/IAgMHMZMWKmU74Io1PgKgqyqV
 SDNJd2FSL+lmEPP4fQBXjx7Qie04Xfo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-44-mrASq1UiOoq78_TLnaJJow-1; Mon, 04 Nov 2019 10:13:42 -0500
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A1812800A02;
 Mon,  4 Nov 2019 15:13:40 +0000 (UTC)
Received: from localhost.localdomain.com (ovpn-123-183.rdu2.redhat.com
 [10.10.123.183])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id E92BC5D6C8;
 Mon,  4 Nov 2019 15:13:38 +0000 (UTC)
From: Cleber Rosa <crosa@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v7 2/8] Acceptance tests: introduce utility method for tags
 unique vals
Date: Mon,  4 Nov 2019 10:13:17 -0500
Message-Id: <20191104151323.9883-3-crosa@redhat.com>
In-Reply-To: <20191104151323.9883-1-crosa@redhat.com>
References: <20191104151323.9883-1-crosa@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-MC-Unique: mrASq1UiOoq78_TLnaJJow-1
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
Cc: Beraldo Leal <bleal@redhat.com>, Fabien Chouteau <chouteau@adacore.com>,
 KONRAD Frederic <frederic.konrad@adacore.com>,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Willian Rampazzo <wrampazz@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 qemu-ppc@nongnu.org, Aleksandar Rikalo <aleksandar.rikalo@rt-rk.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Aurelien Jarno <aurelien@aurel32.net>, Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Currently a test can describe the target architecture binary that it
should primarily be run with, be setting a single tag value.

The same approach is expected to be done with other QEMU aspects to be
tested, for instance, the machine type and accelerator, so let's
generalize the logic into a utility method.

Signed-off-by: Cleber Rosa <crosa@redhat.com>
---
 tests/acceptance/avocado_qemu/__init__.py | 19 +++++++++++++------
 1 file changed, 13 insertions(+), 6 deletions(-)

diff --git a/tests/acceptance/avocado_qemu/__init__.py b/tests/acceptance/a=
vocado_qemu/__init__.py
index 9a57c020d8..e676d9c4e7 100644
--- a/tests/acceptance/avocado_qemu/__init__.py
+++ b/tests/acceptance/avocado_qemu/__init__.py
@@ -100,14 +100,21 @@ def exec_command_and_wait_for_pattern(test, command,
=20
=20
 class Test(avocado.Test):
+    def _get_unique_tag_val(self, tag_name):
+        """
+        Gets a tag value, if unique for a key
+        """
+        vals =3D self.tags.get(tag_name, [])
+        if len(vals) =3D=3D 1:
+            return vals.pop()
+        return None
+
     def setUp(self):
         self._vms =3D {}
-        arches =3D self.tags.get('arch', [])
-        if len(arches) =3D=3D 1:
-            arch =3D arches.pop()
-        else:
-            arch =3D None
-        self.arch =3D self.params.get('arch', default=3Darch)
+
+        self.arch =3D self.params.get('arch',
+                                    default=3Dself._get_unique_tag_val('ar=
ch'))
+
         default_qemu_bin =3D pick_default_qemu_bin(arch=3Dself.arch)
         self.qemu_bin =3D self.params.get('qemu_bin',
                                         default=3Ddefault_qemu_bin)
--=20
2.21.0


