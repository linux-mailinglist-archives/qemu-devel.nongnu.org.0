Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ED3D743736
	for <lists+qemu-devel@lfdr.de>; Thu, 13 Jun 2019 16:28:33 +0200 (CEST)
Received: from localhost ([::1]:40374 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hbQiO-0002Ai-V4
	for lists+qemu-devel@lfdr.de; Thu, 13 Jun 2019 10:28:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46190)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <crosa@redhat.com>) id 1hbPSA-0003QQ-UZ
 for qemu-devel@nongnu.org; Thu, 13 Jun 2019 09:07:45 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <crosa@redhat.com>) id 1hbPS8-0006AD-N1
 for qemu-devel@nongnu.org; Thu, 13 Jun 2019 09:07:42 -0400
Received: from mx1.redhat.com ([209.132.183.28]:14285)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <crosa@redhat.com>) id 1hbPS8-00066z-GQ
 for qemu-devel@nongnu.org; Thu, 13 Jun 2019 09:07:40 -0400
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id A19B97EAB0;
 Thu, 13 Jun 2019 13:07:36 +0000 (UTC)
Received: from dhcp-17-47.bos.redhat.com (dhcp-17-47.bos.redhat.com
 [10.18.17.47])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id D2D5145A3;
 Thu, 13 Jun 2019 13:07:35 +0000 (UTC)
From: Cleber Rosa <crosa@redhat.com>
To: qemu-devel@nongnu.org
Date: Thu, 13 Jun 2019 09:07:18 -0400
Message-Id: <20190613130718.3763-5-crosa@redhat.com>
In-Reply-To: <20190613130718.3763-1-crosa@redhat.com>
References: <20190613130718.3763-1-crosa@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.28]); Thu, 13 Jun 2019 13:07:36 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PATCH 4/4] tests/vm: add source repos on ubuntu.i386
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
Cc: Fam Zheng <fam@euphon.net>, Eduardo Habkost <ehabkost@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Possibly because of different behavior on the newly update
cloud-image, trying to run 'apt-get build-dep' results in:

   E: You must put some 'source' URIs in your sources.list

This enables all source repos (even though some are not
needed) for simplicity sake.

Signed-off-by: Cleber Rosa <crosa@redhat.com>
---
 tests/vm/ubuntu.i386 | 1 +
 1 file changed, 1 insertion(+)

diff --git a/tests/vm/ubuntu.i386 b/tests/vm/ubuntu.i386
index 7017e6d388..3ea459ee20 100755
--- a/tests/vm/ubuntu.i386
+++ b/tests/vm/ubuntu.i386
@@ -77,6 +77,7 @@ class UbuntuX86VM(basevm.BaseVM):
         time.sleep(5)
         self.wait_ssh()
         # The previous update sometimes doesn't survive a reboot, so do =
it again
+        self.ssh_root_check("sed -ie s/^#\ deb-src/deb-src/g /etc/apt/so=
urces.list")
         self.ssh_root_check("apt-get update")
         self.ssh_root_check("apt-get build-dep -y qemu")
         self.ssh_root_check("apt-get install -y libfdt-dev flex bison")
--=20
2.21.0


