Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 17FBF4DAE7A
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Mar 2022 11:48:37 +0100 (CET)
Received: from localhost ([::1]:36534 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nURCm-0006ML-1o
	for lists+qemu-devel@lfdr.de; Wed, 16 Mar 2022 06:48:36 -0400
Received: from eggs.gnu.org ([209.51.188.92]:44952)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <damien.hedde@greensocs.com>)
 id 1nUQNI-0002U9-5p
 for qemu-devel@nongnu.org; Wed, 16 Mar 2022 05:55:24 -0400
Received: from beetle.greensocs.com ([5.135.226.135]:37366)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <damien.hedde@greensocs.com>)
 id 1nUQNF-000871-FS
 for qemu-devel@nongnu.org; Wed, 16 Mar 2022 05:55:23 -0400
Received: from crumble.bar.greensocs.com (unknown [172.17.10.6])
 by beetle.greensocs.com (Postfix) with ESMTPS id B1E2C2077C;
 Wed, 16 Mar 2022 09:55:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=greensocs.com;
 s=mail; t=1647424517;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=xDgmgKOc2H7XHHBYrssQUDnFNttHwY3wGJ50JVV6H3s=;
 b=Iu0E5JpnzDdOpk3EM8tUGPsJotml+24ehVsoKUuk1/dwR5C8dFjocpYCRJB9EZfqp7+nDD
 R3y58JVGj6LXCTFTc0lb4PrbQUhosTc6s+z/SFvBg9xtyd3sSYL7gtMvX6Qs/j95gFnAjc
 oGFWjBIG4BycpudAARzqi28H/cvfzwQ=
From: Damien Hedde <damien.hedde@greensocs.com>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH] python: add qmp-send program to send raw qmp commands to
 qemu
Date: Wed, 16 Mar 2022 10:54:55 +0100
Message-Id: <20220316095455.6473-1-damien.hedde@greensocs.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=5.135.226.135;
 envelope-from=damien.hedde@greensocs.com; helo=beetle.greensocs.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: Damien Hedde <damien.hedde@greensocs.com>, berrange@redhat.com,
 Beraldo Leal <bleal@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Cleber Rosa <crosa@redhat.com>, John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

It takes an input file containing raw qmp commands (concatenated json
dicts) and send all commands one by one to a qmp server. When one
command fails, it exits.

As a convenience, it can also wrap the qemu process to avoid having
to start qemu in background. When wrapping qemu, the program returns
only when the qemu process terminates.

Signed-off-by: Damien Hedde <damien.hedde@greensocs.com>
---

Hi all,

Following our discussion, I've started this. What do you think ?

I tried to follow Daniel's qmp-shell-wrap. I think it is
better to have similar options (eg: logging). There is also room
for factorizing code if we want to keep them aligned and ease
maintenance.

There are still some pylint issues (too many branches in main and it
does not like my context manager if else line). But it's kind of a
mess to fix theses so I think it's enough for a first version.

I name that qmp-send as Daniel proposed, maybe qmp-test matches better
what I'm doing there ?

Thanks,
Damien
---
 python/qemu/aqmp/qmp_send.py | 229 +++++++++++++++++++++++++++++++++++
 scripts/qmp/qmp-send         |  11 ++
 2 files changed, 240 insertions(+)
 create mode 100644 python/qemu/aqmp/qmp_send.py
 create mode 100755 scripts/qmp/qmp-send

diff --git a/python/qemu/aqmp/qmp_send.py b/python/qemu/aqmp/qmp_send.py
new file mode 100644
index 0000000000..cbca1d0205
--- /dev/null
+++ b/python/qemu/aqmp/qmp_send.py
@@ -0,0 +1,229 @@
+#
+# Copyright (C) 2022 Greensocs
+#
+# This work is licensed under the terms of the GNU GPL, version 2 or
+# later.  See the COPYING file in the top-level directory.
+#
+
+"""
+usage: qmp-send [-h] [-f FILE] [-s SOCKET] [-v] [-p] [--wrap ...]
+
+Send raw qmp commands to qemu as long as they succeed. It either connects to a
+remote qmp server using the provided socket or wrap the qemu process. It stops
+sending the provided commands when a command fails (disconnection or error
+response).
+
+optional arguments:
+  -h, --help            show this help message and exit
+  -f FILE, --file FILE  Input file containing the commands
+  -s SOCKET, --socket SOCKET
+                        < UNIX socket path | TCP address:port >
+  -v, --verbose         Verbose (echo commands sent and received)
+  -p, --pretty          Pretty-print JSON
+  --wrap ...            QEMU command line to invoke
+
+When qemu wrap option is used, this script waits for qemu to terminate but
+never send any quit or kill command. This needs to be done manually.
+"""
+
+import argparse
+import contextlib
+import json
+import logging
+import os
+from subprocess import Popen
+import sys
+from typing import List, TextIO
+
+from qemu.aqmp import ConnectError, QMPError, SocketAddrT
+from qemu.aqmp.legacy import (
+    QEMUMonitorProtocol,
+    QMPBadPortError,
+    QMPMessage,
+)
+
+
+LOG = logging.getLogger(__name__)
+
+
+class QmpRawDecodeError(Exception):
+    """
+    Exception for raw qmp decoding
+
+    msg: exception message
+    lineno: input line of the error
+    colno: input column of the error
+    """
+    def __init__(self, msg: str, lineno: int, colno: int):
+        self.msg = msg
+        self.lineno = lineno
+        self.colno = colno
+        super().__init__(f"{msg}: line {lineno} column {colno}")
+
+
+class QMPSendError(QMPError):
+    """
+    QMP Send Base error class.
+    """
+
+
+class QMPSend(QEMUMonitorProtocol):
+    """
+    QMP Send class.
+    """
+    def __init__(self, address: SocketAddrT,
+                 pretty: bool = False,
+                 verbose: bool = False,
+                 server: bool = False):
+        super().__init__(address, server=server)
+        self._verbose = verbose
+        self._pretty = pretty
+        self._server = server
+
+    def setup_connection(self) -> None:
+        """Setup the connetion with the remote client/server."""
+        if self._server:
+            self.accept()
+        else:
+            self.connect()
+
+    def _print(self, qmp_message: object) -> None:
+        jsobj = json.dumps(qmp_message,
+                           indent=4 if self._pretty else None,
+                           sort_keys=self._pretty)
+        print(str(jsobj))
+
+    def execute_cmd(self, cmd: QMPMessage) -> None:
+        """Execute a qmp command."""
+        if self._verbose:
+            self._print(cmd)
+        resp = self.cmd_obj(cmd)
+        if resp is None:
+            raise QMPSendError("Disconnected")
+        if self._verbose:
+            self._print(resp)
+        if 'error' in resp:
+            raise QMPSendError(f"Command failed: {resp['error']}")
+
+
+def raw_load(file: TextIO) -> List[QMPMessage]:
+    """parse a raw qmp command file.
+
+    JSON formatted commands can expand on several lines but must
+    be separated by an end-of-line (two commands can not share the
+    same line).
+    File must not end with empty lines.
+    """
+    cmds: List[QMPMessage] = []
+    linecnt = 0
+    while True:
+        buf = file.readline()
+        if not buf:
+            return cmds
+        prev_err_pos = None
+        buf_linecnt = 1
+        while True:
+            try:
+                cmds.append(json.loads(buf))
+                break
+            except json.JSONDecodeError as err:
+                if prev_err_pos == err.pos:
+                    # adding a line made no progress so
+                    #  + either we're at EOF and json data is truncated
+                    #  + or the parsing error is before
+                    raise QmpRawDecodeError(err.msg, linecnt + err.lineno,
+                                            err.colno) from err
+                prev_err_pos = err.pos
+            buf += file.readline()
+            buf_linecnt += 1
+        linecnt += buf_linecnt
+
+
+def report_error(msg: str) -> None:
+    """Write an error to stderr."""
+    sys.stderr.write('ERROR: %s\n' % msg)
+
+
+def main() -> None:
+    """
+    qmp-send entry point: parse command line arguments and start the REPL.
+    """
+    parser = argparse.ArgumentParser(
+            description="""
+            Send raw qmp commands to qemu as long as they succeed. It either
+            connects to a remote qmp server using the provided socket or wrap
+            the qemu process. It stops sending the provided commands when a
+            command fails (disconnection or error response).
+            """,
+            epilog="""
+            When qemu wrap option is used, this script waits for qemu
+            to terminate but never send any quit or kill command. This
+            needs to be done manually.
+            """)
+
+    parser.add_argument('-f', '--file', action='store',
+                        help='Input file containing the commands')
+    parser.add_argument('-s', '--socket', action='store',
+                        help='< UNIX socket path | TCP address:port >')
+    parser.add_argument('-v', '--verbose', action='store_true',
+                        help='Verbose (echo commands sent and received)')
+    parser.add_argument('-p', '--pretty', action='store_true',
+                        help='Pretty-print JSON')
+
+    parser.add_argument('--wrap', nargs=argparse.REMAINDER,
+                        help='QEMU command line to invoke')
+
+    args = parser.parse_args()
+
+    socket = args.socket
+    wrap_qemu = args.wrap is not None
+
+    if wrap_qemu:
+        if len(args.wrap) != 0:
+            qemu_cmdline = args.wrap
+        else:
+            qemu_cmdline = ["qemu-system-x86_64"]
+        if socket is None:
+            socket = "qmp-send-wrap-%d" % os.getpid()
+        qemu_cmdline += ["-qmp", "unix:%s" % socket]
+
+    try:
+        address = QMPSend.parse_address(socket)
+    except QMPBadPortError:
+        parser.error(f"Bad port number: {socket}")
+        return  # pycharm doesn't know error() is noreturn
+
+    try:
+        with open(args.file, mode='rt', encoding='utf8') as file:
+            qmp_cmds = raw_load(file)
+    except QmpRawDecodeError as err:
+        report_error(str(err))
+        sys.exit(1)
+
+    try:
+        with QMPSend(address, args.pretty, args.verbose,
+                     server=wrap_qemu) as qmp:
+            # starting with python 3.7 we could use contextlib.nullcontext
+            qemu = Popen(qemu_cmdline) if wrap_qemu else contextlib.suppress()
+            with qemu:
+                try:
+                    qmp.setup_connection()
+                except ConnectError as err:
+                    if isinstance(err.exc, OSError):
+                        report_error(f"Couldn't connect to {socket}: {err!s}")
+                    else:
+                        report_error(str(err))
+                    sys.exit(1)
+                try:
+                    for cmd in qmp_cmds:
+                        qmp.execute_cmd(cmd)
+                except QMPError as err:
+                    report_error(str(err))
+                    sys.exit(1)
+    finally:
+        if wrap_qemu:
+            os.unlink(socket)
+
+
+if __name__ == '__main__':
+    main()
diff --git a/scripts/qmp/qmp-send b/scripts/qmp/qmp-send
new file mode 100755
index 0000000000..8d3063797c
--- /dev/null
+++ b/scripts/qmp/qmp-send
@@ -0,0 +1,11 @@
+#!/usr/bin/env python3
+
+import os
+import sys
+
+sys.path.append(os.path.join(os.path.dirname(__file__), '..', '..', 'python'))
+from qemu.aqmp import qmp_send
+
+
+if __name__ == '__main__':
+    qmp_send.main()
-- 
2.35.1


