Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EFF9B062C
	for <lists+qemu-devel@lfdr.de>; Thu, 12 Sep 2019 02:19:30 +0200 (CEST)
Received: from localhost ([::1]:57244 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1i8Cpc-0005BY-KX
	for lists+qemu-devel@lfdr.de; Wed, 11 Sep 2019 20:19:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58588)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <jsnow@redhat.com>) id 1i8Cmy-0002hB-0e
 for qemu-devel@nongnu.org; Wed, 11 Sep 2019 20:16:45 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <jsnow@redhat.com>) id 1i8Cmw-0006IO-MN
 for qemu-devel@nongnu.org; Wed, 11 Sep 2019 20:16:43 -0400
Received: from mx1.redhat.com ([209.132.183.28]:51276)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <jsnow@redhat.com>)
 id 1i8Cmt-0006Gp-SC; Wed, 11 Sep 2019 20:16:40 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 0ADB48BA2D4;
 Thu, 12 Sep 2019 00:16:39 +0000 (UTC)
Received: from probe.bos.redhat.com (dhcp-17-203.bos.redhat.com [10.18.17.203])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 6A7065D6A5;
 Thu, 12 Sep 2019 00:16:38 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Date: Wed, 11 Sep 2019 20:16:32 -0400
Message-Id: <20190912001633.11372-4-jsnow@redhat.com>
In-Reply-To: <20190912001633.11372-1-jsnow@redhat.com>
References: <20190912001633.11372-1-jsnow@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2
 (mx1.redhat.com [10.5.110.68]); Thu, 12 Sep 2019 00:16:39 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PATCH v4 3/4] iotests: specify protocol support via
 initialization info
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
Cc: Kevin Wolf <kwolf@redhat.com>, John Snow <jsnow@redhat.com>,
 qemu-block@nongnu.org, Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Switch from verify_protocols to any one of:
iotests.main, iotests.script_main, iotests.script_initialize.

Signed-off-by: John Snow <jsnow@redhat.com>
---
 tests/qemu-iotests/207 | 4 ++--
 tests/qemu-iotests/210 | 4 ++--
 tests/qemu-iotests/211 | 4 ++--
 tests/qemu-iotests/212 | 4 ++--
 tests/qemu-iotests/213 | 4 ++--
 5 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/tests/qemu-iotests/207 b/tests/qemu-iotests/207
index ab9e3b6747..35d98f2736 100755
--- a/tests/qemu-iotests/207
+++ b/tests/qemu-iotests/207
@@ -24,8 +24,8 @@ import iotests
 import subprocess
 import re
=20
-iotests.script_initialize(supported_fmts=3D['raw'])
-iotests.verify_protocol(supported=3D['ssh'])
+iotests.script_initialize(supported_fmts=3D['raw'],
+                          supported_protocols=3D['ssh'])
=20
 def filter_hash(qmsg):
     def _filter(key, value):
diff --git a/tests/qemu-iotests/210 b/tests/qemu-iotests/210
index 5a7013cd34..d9fe780c07 100755
--- a/tests/qemu-iotests/210
+++ b/tests/qemu-iotests/210
@@ -23,8 +23,8 @@
 import iotests
 from iotests import imgfmt
=20
-iotests.script_initialize(supported_fmts=3D['luks'])
-iotests.verify_protocol(supported=3D['file'])
+iotests.script_initialize(supported_fmts=3D['luks'],
+                          supported_protocols=3D['file'])
=20
 def blockdev_create(vm, options):
     result =3D vm.qmp_log('blockdev-create', job_id=3D'job0', options=3D=
options,
diff --git a/tests/qemu-iotests/211 b/tests/qemu-iotests/211
index 4d6aac497f..155fac4e87 100755
--- a/tests/qemu-iotests/211
+++ b/tests/qemu-iotests/211
@@ -23,8 +23,8 @@
 import iotests
 from iotests import imgfmt
=20
-iotests.script_initialize(supported_fmts=3D['vdi'])
-iotests.verify_protocol(supported=3D['file'])
+iotests.script_initialize(supported_fmts=3D['vdi'],
+                          supported_protocols=3D['file'])
=20
 def blockdev_create(vm, options):
     result =3D vm.qmp_log('blockdev-create', job_id=3D'job0', options=3D=
options,
diff --git a/tests/qemu-iotests/212 b/tests/qemu-iotests/212
index ec35bceb11..67e5a1dbb5 100755
--- a/tests/qemu-iotests/212
+++ b/tests/qemu-iotests/212
@@ -23,8 +23,8 @@
 import iotests
 from iotests import imgfmt
=20
-iotests.script_initialize(supported_fmts=3D['parallels'])
-iotests.verify_protocol(supported=3D['file'])
+iotests.script_initialize(supported_fmts=3D['parallels'],
+                          supported_protocols=3D['file'])
=20
 def blockdev_create(vm, options):
     result =3D vm.qmp_log('blockdev-create', job_id=3D'job0', options=3D=
options,
diff --git a/tests/qemu-iotests/213 b/tests/qemu-iotests/213
index 3d2c024375..23f387ab63 100755
--- a/tests/qemu-iotests/213
+++ b/tests/qemu-iotests/213
@@ -23,8 +23,8 @@
 import iotests
 from iotests import imgfmt
=20
-iotests.script_initialize(supported_fmts=3D['vhdx'])
-iotests.verify_protocol(supported=3D['file'])
+iotests.script_initialize(supported_fmts=3D['vhdx'],
+                          supported_protocols=3D['file'])
=20
 def blockdev_create(vm, options):
     result =3D vm.qmp_log('blockdev-create', job_id=3D'job0', options=3D=
options,
--=20
2.21.0


