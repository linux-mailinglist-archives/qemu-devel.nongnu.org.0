Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C247523690
	for <lists+qemu-devel@lfdr.de>; Mon, 20 May 2019 14:52:46 +0200 (CEST)
Received: from localhost ([127.0.0.1]:35107 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hShmX-0005Gp-Sx
	for lists+qemu-devel@lfdr.de; Mon, 20 May 2019 08:52:45 -0400
Received: from eggs.gnu.org ([209.51.188.92]:43364)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <kraxel@redhat.com>) id 1hShhT-0002J5-8s
	for qemu-devel@nongnu.org; Mon, 20 May 2019 08:47:32 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <kraxel@redhat.com>) id 1hShhP-0005sZ-L8
	for qemu-devel@nongnu.org; Mon, 20 May 2019 08:47:29 -0400
Received: from mx1.redhat.com ([209.132.183.28]:59542)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <kraxel@redhat.com>) id 1hShhN-0005ns-PV
	for qemu-devel@nongnu.org; Mon, 20 May 2019 08:47:25 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 97B0B3082E69;
	Mon, 20 May 2019 12:47:23 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-117-74.ams2.redhat.com
	[10.36.117.74])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 821CD78409;
	Mon, 20 May 2019 12:47:18 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
	id 134901753B; Mon, 20 May 2019 14:47:17 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Date: Mon, 20 May 2019 14:47:06 +0200
Message-Id: <20190520124716.30472-5-kraxel@redhat.com>
In-Reply-To: <20190520124716.30472-1-kraxel@redhat.com>
References: <20190520124716.30472-1-kraxel@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.46]);
	Mon, 20 May 2019 12:47:23 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PATCH v3 04/14] tests/vm: use ssh with pty
 unconditionally
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Fam Zheng <fam@euphon.net>, Ed Maste <emaste@freebsd.org>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Kamil Rytarowski <kamil@netbsd.org>, Gerd Hoffmann <kraxel@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
	Li-Wen Hsu <lwhsu@freebsd.org>, Brad Smith <brad@comstyle.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Allways ask ssh to run with a pseudo terminal.
Not having a terminal causes problems now and then.

Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
Tested-by: Thomas Huth <thuth@redhat.com>
---
 tests/vm/basevm.py | 13 ++++---------
 1 file changed, 4 insertions(+), 9 deletions(-)

diff --git a/tests/vm/basevm.py b/tests/vm/basevm.py
index 640f3226929d..878f1a7a32b8 100755
--- a/tests/vm/basevm.py
+++ b/tests/vm/basevm.py
@@ -106,16 +106,14 @@ class BaseVM(object):
         os.rename(fname + ".download", fname)
         return fname
 
-    def _ssh_do(self, user, cmd, check, interactive=False):
-        ssh_cmd = ["ssh", "-q",
+    def _ssh_do(self, user, cmd, check):
+        ssh_cmd = ["ssh", "-q", "-t",
                    "-o", "StrictHostKeyChecking=no",
                    "-o", "UserKnownHostsFile=" + os.devnull,
                    "-o", "ConnectTimeout=1",
                    "-p", self.ssh_port, "-i", self._ssh_key_file]
         for var in self.envvars:
             ssh_cmd += ['-o', "SendEnv=%s" % var ]
-        if interactive:
-            ssh_cmd += ['-t']
         assert not isinstance(cmd, str)
         ssh_cmd += ["%s@127.0.0.1" % user] + list(cmd)
         logging.debug("ssh_cmd: %s", " ".join(ssh_cmd))
@@ -127,9 +125,6 @@ class BaseVM(object):
     def ssh(self, *cmd):
         return self._ssh_do(self.GUEST_USER, cmd, False)
 
-    def ssh_interactive(self, *cmd):
-        return self._ssh_do(self.GUEST_USER, cmd, False, True)
-
     def ssh_root(self, *cmd):
         return self._ssh_do("root", cmd, False)
 
@@ -283,9 +278,9 @@ def main(vmcls):
         return 2
 
     if args.interactive:
-        if vm.ssh_interactive(*cmd) == 0:
+        if vm.ssh(*cmd) == 0:
             return 0
-        vm.ssh_interactive()
+        vm.ssh()
         return 3
     else:
         if vm.ssh(*cmd) != 0:
-- 
2.18.1


