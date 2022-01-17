Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BD124490B32
	for <lists+qemu-devel@lfdr.de>; Mon, 17 Jan 2022 16:10:46 +0100 (CET)
Received: from localhost ([::1]:57944 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n9Tef-0000GJ-LA
	for lists+qemu-devel@lfdr.de; Mon, 17 Jan 2022 10:10:45 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51186)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1n9SjB-0004Az-KY
 for qemu-devel@nongnu.org; Mon, 17 Jan 2022 09:11:23 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:53474)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1n9Sj8-0001Ih-7E
 for qemu-devel@nongnu.org; Mon, 17 Jan 2022 09:11:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1642428675;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ArD7xnkSOO5ZbXgjjJ0HN0qCpvjQ+TviCku5pzHFDrQ=;
 b=UCNu1hdYfAxOxUpdQWyYHXtreftPEzRBF3f1KiOaZvjIzbMsG3lthzkVaq17tZfjFVAL67
 SH4mVK8xOzjbEX0s3RTnu5lCNXayWz2ldiN2T8+ZjBAL4dYvc45UAgwC2bqTRgixMmq+fz
 I9ThteXmaVkvarE6viWuT7CCR3tfDcw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-464-3J_fDL9APCirvzh6EJENag-1; Mon, 17 Jan 2022 09:11:11 -0500
X-MC-Unique: 3J_fDL9APCirvzh6EJENag-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B28AE184608E;
 Mon, 17 Jan 2022 14:11:10 +0000 (UTC)
Received: from localhost.localdomain.com (unknown [10.33.36.172])
 by smtp.corp.redhat.com (Postfix) with ESMTP id DAC7A79C53;
 Mon, 17 Jan 2022 14:11:08 +0000 (UTC)
From: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 1/2] python: introduce qmp-shell-wrap convenience tool
Date: Mon, 17 Jan 2022 14:11:02 +0000
Message-Id: <20220117141103.157288-2-berrange@redhat.com>
In-Reply-To: <20220117141103.157288-1-berrange@redhat.com>
References: <20220117141103.157288-1-berrange@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Eduardo Habkost <eduardo@habkost.net>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 John Snow <jsnow@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

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
---
 python/qemu/qmp/qmp_shell.py | 61 +++++++++++++++++++++++++++++++++---
 scripts/qmp/qmp-shell-wrap   | 11 +++++++
 2 files changed, 68 insertions(+), 4 deletions(-)
 create mode 100755 scripts/qmp/qmp-shell-wrap

diff --git a/python/qemu/qmp/qmp_shell.py b/python/qemu/qmp/qmp_shell.py
index e7d7eb18f1..12f7d28afc 100644
--- a/python/qemu/qmp/qmp_shell.py
+++ b/python/qemu/qmp/qmp_shell.py
@@ -86,6 +86,7 @@
 import os
 import re
 import readline
+from subprocess import Popen
 import sys
 from typing import (
     Iterator,
@@ -162,8 +163,10 @@ class QMPShell(qmp.QEMUMonitorProtocol):
     :param verbose: Echo outgoing QMP messages to console.
     """
     def __init__(self, address: qmp.SocketAddrT,
-                 pretty: bool = False, verbose: bool = False):
-        super().__init__(address)
+                 pretty: bool = False,
+                 verbose: bool = False,
+                 server: bool = False):
+        super().__init__(address, server=server)
         self._greeting: Optional[QMPMessage] = None
         self._completer = QMPCompleter()
         self._transmode = False
@@ -404,8 +407,10 @@ class HMPShell(QMPShell):
     :param verbose: Echo outgoing QMP messages to console.
     """
     def __init__(self, address: qmp.SocketAddrT,
-                 pretty: bool = False, verbose: bool = False):
-        super().__init__(address, pretty, verbose)
+                 pretty: bool = False,
+                 verbose: bool = False,
+                 server: bool = False):
+        super().__init__(address, pretty, verbose, server)
         self._cpu_index = 0
 
     def _cmd_completion(self) -> None:
@@ -529,6 +534,54 @@ def main() -> None:
         for _ in qemu.repl():
             pass
 
+def main_wrap() -> None:
+    """
+    qmp-shell-wrap entry point: parse command line arguments and start the REPL.
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
+        cmd = "qemu-system-x86_64"
+
+    sockpath = "qmp-shell-wrap-%d" % os.getpid()
+    cmd += ["-qmp", "unix:%s" % sockpath]
+
+    shell_class = HMPShell if args.hmp else QMPShell
+
+    try:
+        address = shell_class.parse_address(sockpath)
+    except qmp.QMPBadPortError:
+        parser.error(f"Bad port number: {socketpath}")
+        return  # pycharm doesn't know error() is noreturn
+
+    with shell_class(address, args.pretty, args.verbose, True) as qemu:
+        qemuproc = Popen(cmd)
+
+        try:
+            qemu.accept()
+        except qmp.QMPConnectError:
+            die("Didn't get QMP greeting message")
+        except qmp.QMPCapabilitiesError:
+            die("Couldn't negotiate capabilities")
+        except OSError as err:
+            die(f"Couldn't connect to {sockpath}: {err!s}")
+
+        for _ in qemu.repl():
+            pass
 
 if __name__ == '__main__':
     main()
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
2.33.1


