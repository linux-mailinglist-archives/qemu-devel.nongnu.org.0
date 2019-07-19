Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 095006E6C2
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Jul 2019 15:45:48 +0200 (CEST)
Received: from localhost ([::1]:45645 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hoTCk-0000x5-GU
	for lists+qemu-devel@lfdr.de; Fri, 19 Jul 2019 09:45:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40528)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <kwolf@redhat.com>) id 1hoTBI-00048w-T3
 for qemu-devel@nongnu.org; Fri, 19 Jul 2019 09:44:17 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <kwolf@redhat.com>) id 1hoTBH-0003dB-HA
 for qemu-devel@nongnu.org; Fri, 19 Jul 2019 09:44:16 -0400
Received: from mx1.redhat.com ([209.132.183.28]:38608)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <kwolf@redhat.com>)
 id 1hoTBD-0003Yj-Dr; Fri, 19 Jul 2019 09:44:11 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 40852307D96D;
 Fri, 19 Jul 2019 13:44:09 +0000 (UTC)
Received: from dhcp-200-226.str.redhat.com (dhcp-200-226.str.redhat.com
 [10.33.200.226])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 57470608A4;
 Fri, 19 Jul 2019 13:44:08 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Date: Fri, 19 Jul 2019 15:43:42 +0200
Message-Id: <20190719134345.23526-11-kwolf@redhat.com>
In-Reply-To: <20190719134345.23526-1-kwolf@redhat.com>
References: <20190719134345.23526-1-kwolf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.48]); Fri, 19 Jul 2019 13:44:09 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PULL 10/13] iotests: Add @has_quit to vm.shutdown()
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
Cc: kwolf@redhat.com, peter.maydell@linaro.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Max Reitz <mreitz@redhat.com>

If a test has issued a quit command already (which may be useful to do
explicitly because the test wants to show its effects),
QEMUMachine.shutdown() should not do so again.  Otherwise, the VM may
well return an ECONNRESET which will lead QEMUMachine.shutdown() to
killing it, which then turns into a "qemu received signal 9" line.

Signed-off-by: Max Reitz <mreitz@redhat.com>
Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 python/qemu/machine.py | 5 +++--
 tests/qemu-iotests/255 | 2 +-
 2 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/python/qemu/machine.py b/python/qemu/machine.py
index 49445e675b..128a3d1dc2 100644
--- a/python/qemu/machine.py
+++ b/python/qemu/machine.py
@@ -329,13 +329,14 @@ class QEMUMachine(object):
         self._load_io_log()
         self._post_shutdown()
=20
-    def shutdown(self):
+    def shutdown(self, has_quit=3DFalse):
         """
         Terminate the VM and clean up
         """
         if self.is_running():
             try:
-                self._qmp.cmd('quit')
+                if not has_quit:
+                    self._qmp.cmd('quit')
                 self._qmp.close()
             except:
                 self._popen.kill()
diff --git a/tests/qemu-iotests/255 b/tests/qemu-iotests/255
index 49433ec122..3632d507d0 100755
--- a/tests/qemu-iotests/255
+++ b/tests/qemu-iotests/255
@@ -132,4 +132,4 @@ with iotests.FilePath('src.qcow2') as src_path, \
     vm.qmp_log('block-job-cancel', device=3D'job0')
     vm.qmp_log('quit')
=20
-    vm.shutdown()
+    vm.shutdown(has_quit=3DTrue)
--=20
2.20.1


