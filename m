Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5884E4C1E51
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Feb 2022 23:15:00 +0100 (CET)
Received: from localhost ([::1]:37870 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nMzuV-0000iL-F5
	for lists+qemu-devel@lfdr.de; Wed, 23 Feb 2022 17:14:59 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54828)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1nMzp6-0000ul-39
 for qemu-devel@nongnu.org; Wed, 23 Feb 2022 17:09:24 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:36305)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1nMzp1-0005re-BX
 for qemu-devel@nongnu.org; Wed, 23 Feb 2022 17:09:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1645654158;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9lizLbjnleLuPHba0e+r2oWDlL2Oo93AzdEmVEKdjiY=;
 b=YNiJx2vC1+Vi5uJ4mVoF+Lvj0syAsDeKTxFyAOHUDlXSL/gy4SbWaYnqLle6WwwJAJgdeh
 qTTZ/J0WGdQTsjgKUZIFExDw/nQ+BpBcAKjj9pdZZz7peBfNUx7kuFp9dVTOFuic+isyt1
 X+s1YR+LwV1meZJegHq8BsPAN8sj1vs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-408-zvQ4cMCtOFGxx82TbaMqdw-1; Wed, 23 Feb 2022 17:09:15 -0500
X-MC-Unique: zvQ4cMCtOFGxx82TbaMqdw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4CB25FC82;
 Wed, 23 Feb 2022 22:09:14 +0000 (UTC)
Received: from scv.redhat.com (unknown [10.22.16.166])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 5613F709E6;
 Wed, 23 Feb 2022 22:09:10 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 1/6] python: introduce qmp-shell-wrap convenience tool
Date: Wed, 23 Feb 2022 17:08:55 -0500
Message-Id: <20220223220900.2226630-2-jsnow@redhat.com>
In-Reply-To: <20220223220900.2226630-1-jsnow@redhat.com>
References: <20220223220900.2226630-1-jsnow@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Kevin Wolf <kwolf@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Beraldo Leal <bleal@redhat.com>, qemu-block@nongnu.org,
 Markus Armbruster <armbru@redhat.com>, Eduardo Habkost <eduardo@habkost.net>,
 Hanna Reitz <hreitz@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Daniel P. Berrangé <berrange@redhat.com>

With the current 'qmp-shell' tool developers must first spawn QEMU with
a suitable -qmp arg and then spawn qmp-shell in a separate terminal
pointing to the right socket.

With 'qmp-shell-wrap' developers can ignore QMP sockets entirely and
just pass the QEMU command and arguments they want. The program will
listen on a UNIX socket and tell QEMU to connect QMP to that.

For example, this:

 # qmp-shell-wrap -- qemu-system-x86_64 -display none

Is roughly equivalent of running:

 # qemu-system-x86_64 -display none -qmp qmp-shell-1234 &
 # qmp-shell qmp-shell-1234

Except that 'qmp-shell-wrap' switches the socket peers around so that
it is the UNIX socket server and QEMU is the socket client. This makes
QEMU reliably go away when qmp-shell-wrap exits, closing the server
socket.

Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
Message-id: 20220128161157.36261-2-berrange@redhat.com
[Edited for rebase. --js]
Signed-off-by: John Snow <jsnow@redhat.com>
---
 python/qemu/aqmp/qmp_shell.py | 65 ++++++++++++++++++++++++++++++++---
 python/setup.cfg              |  1 +
 scripts/qmp/qmp-shell-wrap    | 11 ++++++
 3 files changed, 73 insertions(+), 4 deletions(-)
 create mode 100755 scripts/qmp/qmp-shell-wrap

diff --git a/python/qemu/aqmp/qmp_shell.py b/python/qemu/aqmp/qmp_shell.py
index d11bf54b00..c60df787fc 100644
--- a/python/qemu/aqmp/qmp_shell.py
+++ b/python/qemu/aqmp/qmp_shell.py
@@ -86,6 +86,7 @@
 import os
 import re
 import readline
+from subprocess import Popen
 import sys
 from typing import (
     Iterator,
@@ -167,8 +168,10 @@ class QMPShell(QEMUMonitorProtocol):
     :param verbose: Echo outgoing QMP messages to console.
     """
     def __init__(self, address: SocketAddrT,
-                 pretty: bool = False, verbose: bool = False):
-        super().__init__(address)
+                 pretty: bool = False,
+                 verbose: bool = False,
+                 server: bool = False):
+        super().__init__(address, server=server)
         self._greeting: Optional[QMPMessage] = None
         self._completer = QMPCompleter()
         self._transmode = False
@@ -409,8 +412,10 @@ class HMPShell(QMPShell):
     :param verbose: Echo outgoing QMP messages to console.
     """
     def __init__(self, address: SocketAddrT,
-                 pretty: bool = False, verbose: bool = False):
-        super().__init__(address, pretty, verbose)
+                 pretty: bool = False,
+                 verbose: bool = False,
+                 server: bool = False):
+        super().__init__(address, pretty, verbose, server)
         self._cpu_index = 0
 
     def _cmd_completion(self) -> None:
@@ -533,5 +538,57 @@ def main() -> None:
             pass
 
 
+def main_wrap() -> None:
+    """
+    qmp-shell-wrap entry point: parse command line arguments and
+    start the REPL.
+    """
+    parser = argparse.ArgumentParser()
+    parser.add_argument('-H', '--hmp', action='store_true',
+                        help='Use HMP interface')
+    parser.add_argument('-v', '--verbose', action='store_true',
+                        help='Verbose (echo commands sent and received)')
+    parser.add_argument('-p', '--pretty', action='store_true',
+                        help='Pretty-print JSON')
+
+    parser.add_argument('command', nargs=argparse.REMAINDER,
+                        help='QEMU command line to invoke')
+
+    args = parser.parse_args()
+
+    cmd = args.command
+    if len(cmd) != 0 and cmd[0] == '--':
+        cmd = cmd[1:]
+    if len(cmd) == 0:
+        cmd = ["qemu-system-x86_64"]
+
+    sockpath = "qmp-shell-wrap-%d" % os.getpid()
+    cmd += ["-qmp", "unix:%s" % sockpath]
+
+    shell_class = HMPShell if args.hmp else QMPShell
+
+    try:
+        address = shell_class.parse_address(sockpath)
+    except QMPBadPortError:
+        parser.error(f"Bad port number: {sockpath}")
+        return  # pycharm doesn't know error() is noreturn
+
+    try:
+        with shell_class(address, args.pretty, args.verbose, True) as qemu:
+            with Popen(cmd):
+
+                try:
+                    qemu.accept()
+                except ConnectError as err:
+                    if isinstance(err.exc, OSError):
+                        die(f"Couldn't connect to {args.qmp_server}: {err!s}")
+                    die(str(err))
+
+                for _ in qemu.repl():
+                    pass
+    finally:
+        os.unlink(sockpath)
+
+
 if __name__ == '__main__':
     main()
diff --git a/python/setup.cfg b/python/setup.cfg
index 18aea2bab3..0959603238 100644
--- a/python/setup.cfg
+++ b/python/setup.cfg
@@ -68,6 +68,7 @@ console_scripts =
     qom-fuse = qemu.utils.qom_fuse:QOMFuse.entry_point [fuse]
     qemu-ga-client = qemu.utils.qemu_ga_client:main
     qmp-shell = qemu.aqmp.qmp_shell:main
+    qmp-shell-wrap = qemu.aqmp.qmp_shell:main_wrap
     aqmp-tui = qemu.aqmp.aqmp_tui:main [tui]
 
 [flake8]
diff --git a/scripts/qmp/qmp-shell-wrap b/scripts/qmp/qmp-shell-wrap
new file mode 100755
index 0000000000..9e94da114f
--- /dev/null
+++ b/scripts/qmp/qmp-shell-wrap
@@ -0,0 +1,11 @@
+#!/usr/bin/env python3
+
+import os
+import sys
+
+sys.path.append(os.path.join(os.path.dirname(__file__), '..', '..', 'python'))
+from qemu.qmp import qmp_shell
+
+
+if __name__ == '__main__':
+    qmp_shell.main_wrap()
-- 
2.34.1


