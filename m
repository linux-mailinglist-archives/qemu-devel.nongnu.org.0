Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C4A4D11560C
	for <lists+qemu-devel@lfdr.de>; Fri,  6 Dec 2019 18:06:23 +0100 (CET)
Received: from localhost ([::1]:41454 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1idH3e-0003mf-9l
	for lists+qemu-devel@lfdr.de; Fri, 06 Dec 2019 12:06:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48395)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <crosa@redhat.com>) id 1idF8j-0003Pj-UB
 for qemu-devel@nongnu.org; Fri, 06 Dec 2019 10:03:31 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <crosa@redhat.com>) id 1idF8i-0000lH-K9
 for qemu-devel@nongnu.org; Fri, 06 Dec 2019 10:03:29 -0500
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:59569
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <crosa@redhat.com>) id 1idF8i-0000kQ-Bu
 for qemu-devel@nongnu.org; Fri, 06 Dec 2019 10:03:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1575644608;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=MV0fOidRF7C4EAztP9ZWauegvPnXcw1LymAIIRWE6Bk=;
 b=U9xjQUGiz9C4oX4dEOiVDBFK1vOu6SzmcEprdbKza6jgCJiTtvg0KSkjUBF8fDNiqMp9Hd
 Lrp9hS6K8pY6HykI0AT4NuV+u3yNGB9/TUlK93hwtdcre1hJX2c/sC8ARpgUUTVfrW3Dp3
 EVR7t+GEeeLhLN/oBvW4bcNbcRbeOIo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-265-10PUgkZ-PzSVyKeLLgh9gg-1; Fri, 06 Dec 2019 10:03:17 -0500
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8C6561883521;
 Fri,  6 Dec 2019 15:03:15 +0000 (UTC)
Received: from dhcp-17-72.bos.redhat.com (dhcp-17-72.bos.redhat.com
 [10.18.17.72])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 919235D9E1;
 Fri,  6 Dec 2019 15:03:14 +0000 (UTC)
From: Cleber Rosa <crosa@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>,
	qemu-devel@nongnu.org
Subject: [PATCH 1/1] tests/boot_linux_console: Fetch assets from Debian
 snapshot archives
Date: Fri,  6 Dec 2019 10:03:06 -0500
Message-Id: <20191206150306.19513-2-crosa@redhat.com>
In-Reply-To: <20191206150306.19513-1-crosa@redhat.com>
References: <20191206150306.19513-1-crosa@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-MC-Unique: 10PUgkZ-PzSVyKeLLgh9gg-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=UTF-8
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
Cc: Beraldo Leal <bleal@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Willian Rampazzo <wrampazz@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>

The kernel packaged was fetched from an unstable repository.
Use the stable snapshot archive instead.

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
Message-Id: <20191126223810.20180-2-philmd@redhat.com>
Tested-by: Willian Rampazzo <wrampazz@redhat.com>
Reviewed-by: Cleber Rosa <crosa@redhat.com>
Tested-by: Cleber Rosa <crosa@redhat.com>
Signed-off-by: Cleber Rosa <crosa@redhat.com>
---
 tests/acceptance/boot_linux_console.py | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/tests/acceptance/boot_linux_console.py b/tests/acceptance/boot=
_linux_console.py
index 7e41cebd47..752f776f68 100644
--- a/tests/acceptance/boot_linux_console.py
+++ b/tests/acceptance/boot_linux_console.py
@@ -479,7 +479,8 @@ class BootLinuxConsole(Test):
         :avocado: tags=3Darch:m68k
         :avocado: tags=3Dmachine:q800
         """
-        deb_url =3D ('http://ftp.ports.debian.org/debian-ports/pool-m68k/m=
ain'
+        deb_url =3D ('https://snapshot.debian.org/archive/debian-ports'
+                   '/20191021T083923Z/pool-m68k/main'
                    '/l/linux/kernel-image-5.3.0-1-m68k-di_5.3.7-1_m68k.ude=
b')
         deb_hash =3D '044954bb9be4160a3ce81f8bc1b5e856b75cccd1'
         try:
--=20
2.21.0


