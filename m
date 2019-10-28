Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 879CAE7D56
	for <lists+qemu-devel@lfdr.de>; Tue, 29 Oct 2019 00:57:49 +0100 (CET)
Received: from localhost ([::1]:45678 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iPEtP-0001iV-Uv
	for lists+qemu-devel@lfdr.de; Mon, 28 Oct 2019 19:57:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59055)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <crosa@redhat.com>) id 1iPEn7-000308-9D
 for qemu-devel@nongnu.org; Mon, 28 Oct 2019 19:51:18 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <crosa@redhat.com>) id 1iPEmH-0003rR-4p
 for qemu-devel@nongnu.org; Mon, 28 Oct 2019 19:50:26 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:47452
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <crosa@redhat.com>) id 1iPEmH-0003rE-16
 for qemu-devel@nongnu.org; Mon, 28 Oct 2019 19:50:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1572306624;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=j6XMJ7oaR6H4k2ejCpBmhtIkHf4Dl/cHAsvxZUwenwE=;
 b=NZnfAcSOixTXtgYbEhaR6PRr6VxNIjO18fNcrc5ajC72wgJryNmBogFpGbFCM+lilV13mA
 hZ/C6g/vuXjkmUT+L0rPVjvP2B0tYxQHzWB7RCVvL3UPCn4L/wxImSyNgE0CX8jxqYhfVg
 XWwPNwBeYJGFneazhn52JI9P5tss97Y=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-247-i_iCR8-qOzKyTItekElhoA-1; Mon, 28 Oct 2019 19:50:20 -0400
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5BFF61800DCB;
 Mon, 28 Oct 2019 23:50:19 +0000 (UTC)
Received: from localhost.localdomain.com (ovpn-123-183.rdu2.redhat.com
 [10.10.123.183])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 5AD0A5C1B2;
 Mon, 28 Oct 2019 23:50:17 +0000 (UTC)
From: Cleber Rosa <crosa@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org,
 Eduardo Habkost <ehabkost@redhat.com>
Subject: [PULL 2/16] Acceptance tests: work around socket dir
Date: Mon, 28 Oct 2019 19:49:48 -0400
Message-Id: <20191028235002.17691-3-crosa@redhat.com>
In-Reply-To: <20191028235002.17691-1-crosa@redhat.com>
References: <20191028235002.17691-1-crosa@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-MC-Unique: i_iCR8-qOzKyTItekElhoA-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=WINDOWS-1252
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
Cc: Fam Zheng <fam@euphon.net>, Aleksandar Rikalo <arikalo@wavecomp.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Fabien Chouteau <chouteau@adacore.com>,
 KONRAD Frederic <frederic.konrad@adacore.com>,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Willian Rampazzo <wrampazz@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 qemu-ppc@nongnu.org, Aleksandar Rikalo <aleksandar.rikalo@rt-rk.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Change 32558ce7a4 introduced specific directories for the socket dir
when using python/qemu/machine.py:QEMUMachine.  iotests probably
didn't catch the condition that two simultaneous QEMUMachine
instances, without manually set temporary or socket dirs would clash.

Having two QEMUMachine instances is a condition expected for many
acceptance tests, and it's already used by the migration tests.

Signed-off-by: Cleber Rosa <crosa@redhat.com>
---
 tests/acceptance/avocado_qemu/__init__.py | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/tests/acceptance/avocado_qemu/__init__.py b/tests/acceptance/a=
vocado_qemu/__init__.py
index bd41e0443c..711c29609a 100644
--- a/tests/acceptance/avocado_qemu/__init__.py
+++ b/tests/acceptance/avocado_qemu/__init__.py
@@ -11,6 +11,7 @@
 import os
 import sys
 import uuid
+import tempfile
=20
 import avocado
=20
@@ -69,7 +70,7 @@ class Test(avocado.Test):
             self.cancel("No QEMU binary defined or found in the source tre=
e")
=20
     def _new_vm(self, *args):
-        vm =3D QEMUMachine(self.qemu_bin)
+        vm =3D QEMUMachine(self.qemu_bin, sock_dir=3Dtempfile.mkdtemp())
         if args:
             vm.add_args(*args)
         return vm
--=20
2.21.0


