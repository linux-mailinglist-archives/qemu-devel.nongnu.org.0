Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 65E56A0B53
	for <lists+qemu-devel@lfdr.de>; Wed, 28 Aug 2019 22:25:01 +0200 (CEST)
Received: from localhost ([::1]:42296 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1i34V2-0000E3-BM
	for lists+qemu-devel@lfdr.de; Wed, 28 Aug 2019 16:25:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44151)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <crosa@redhat.com>) id 1i33kG-0008VU-4A
 for qemu-devel@nongnu.org; Wed, 28 Aug 2019 15:36:41 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <crosa@redhat.com>) id 1i33kE-0001nc-DS
 for qemu-devel@nongnu.org; Wed, 28 Aug 2019 15:36:39 -0400
Received: from mx1.redhat.com ([209.132.183.28]:35416)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <crosa@redhat.com>) id 1i33kE-0001nK-5w
 for qemu-devel@nongnu.org; Wed, 28 Aug 2019 15:36:38 -0400
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 7339118C4266
 for <qemu-devel@nongnu.org>; Wed, 28 Aug 2019 19:36:37 +0000 (UTC)
Received: from localhost.localdomain.com (ovpn-123-242.rdu2.redhat.com
 [10.10.123.242])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 9664760CD0;
 Wed, 28 Aug 2019 19:36:36 +0000 (UTC)
From: Cleber Rosa <crosa@redhat.com>
To: qemu-devel@nongnu.org
Date: Wed, 28 Aug 2019 15:36:26 -0400
Message-Id: <20190828193628.7687-2-crosa@redhat.com>
In-Reply-To: <20190828193628.7687-1-crosa@redhat.com>
References: <20190828193628.7687-1-crosa@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2
 (mx1.redhat.com [10.5.110.62]); Wed, 28 Aug 2019 19:36:37 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PATCH 1/3] Acceptance test x86_cpu_model_versions:
 shutdown VMs
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
Cc: Willian Rampazzo <wrampazz@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This shuts down the VMs that won't be used any longer during the
remainder of the test.

It's debatable if the very last one should also be shutdown manually,
and my opinion is that it shouldn't because that's taken care by the
immediately following tearDown().

Signed-off-by: Cleber Rosa <crosa@redhat.com>
---
 tests/acceptance/x86_cpu_model_versions.py | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/tests/acceptance/x86_cpu_model_versions.py b/tests/acceptanc=
e/x86_cpu_model_versions.py
index 1c9fd6a56e..e6c76b0d4c 100644
--- a/tests/acceptance/x86_cpu_model_versions.py
+++ b/tests/acceptance/x86_cpu_model_versions.py
@@ -243,6 +243,7 @@ class X86CPUModelAliases(avocado_qemu.Test):
         vm.launch()
         self.assertFalse(get_cpu_prop(vm, 'arch-capabilities'),
                          'pc-i440fx-4.1 + Cascadelake-Server should not =
have arch-capabilities')
+        vm.shutdown()
=20
         vm =3D self.get_vm()
         vm.add_args('-S')
@@ -251,6 +252,7 @@ class X86CPUModelAliases(avocado_qemu.Test):
         vm.launch()
         self.assertFalse(get_cpu_prop(vm, 'arch-capabilities'),
                          'pc-i440fx-4.0 + Cascadelake-Server should not =
have arch-capabilities')
+        vm.shutdown()
=20
         # command line must override machine-type if CPU model is not ve=
rsioned:
         vm =3D self.get_vm()
@@ -260,6 +262,7 @@ class X86CPUModelAliases(avocado_qemu.Test):
         vm.launch()
         self.assertTrue(get_cpu_prop(vm, 'arch-capabilities'),
                         'pc-i440fx-4.0 + Cascadelake-Server,+arch-capabi=
lities should have arch-capabilities')
+        vm.shutdown()
=20
         vm =3D self.get_vm()
         vm.add_args('-S')
@@ -268,6 +271,7 @@ class X86CPUModelAliases(avocado_qemu.Test):
         vm.launch()
         self.assertFalse(get_cpu_prop(vm, 'arch-capabilities'),
                          'pc-i440fx-4.1 + Cascadelake-Server,-arch-capab=
ilities should not have arch-capabilities')
+        vm.shutdown()
=20
         # versioned CPU model overrides machine-type:
         vm =3D self.get_vm()
@@ -277,6 +281,7 @@ class X86CPUModelAliases(avocado_qemu.Test):
         vm.launch()
         self.assertFalse(get_cpu_prop(vm, 'arch-capabilities'),
                          'pc-i440fx-4.1 + Cascadelake-Server-v1 should n=
ot have arch-capabilities')
+        vm.shutdown()
=20
         vm =3D self.get_vm()
         vm.add_args('-S')
@@ -285,6 +290,7 @@ class X86CPUModelAliases(avocado_qemu.Test):
         vm.launch()
         self.assertTrue(get_cpu_prop(vm, 'arch-capabilities'),
                          'pc-i440fx-4.1 + Cascadelake-Server-v1 should h=
ave arch-capabilities')
+        vm.shutdown()
=20
         # command line must override machine-type and versioned CPU mode=
l:
         vm =3D self.get_vm()
@@ -294,6 +300,7 @@ class X86CPUModelAliases(avocado_qemu.Test):
         vm.launch()
         self.assertTrue(get_cpu_prop(vm, 'arch-capabilities'),
                          'pc-i440fx-4.0 + Cascadelake-Server-v1,+arch-ca=
pabilities should have arch-capabilities')
+        vm.shutdown()
=20
         vm =3D self.get_vm()
         vm.add_args('-S')
--=20
2.21.0


