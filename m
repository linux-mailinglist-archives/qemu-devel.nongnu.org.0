Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 509C949FE79
	for <lists+qemu-devel@lfdr.de>; Fri, 28 Jan 2022 17:54:24 +0100 (CET)
Received: from localhost ([::1]:38834 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nDUVz-0004EK-EG
	for lists+qemu-devel@lfdr.de; Fri, 28 Jan 2022 11:54:23 -0500
Received: from eggs.gnu.org ([209.51.188.92]:40250)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nDTrG-0007cB-Jm
 for qemu-devel@nongnu.org; Fri, 28 Jan 2022 11:12:20 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:40838)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nDTrD-0004Id-D6
 for qemu-devel@nongnu.org; Fri, 28 Jan 2022 11:12:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1643386334;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7NEXdKnMUbMJfTY228LczyVEJmY/9xPMcUHzPhisFmI=;
 b=KB9M1Ay+XStxHltfllPfMpcl+eMoNWfmiCOjNIOoKd7T8NC6bs79ne6ZdWEOlbltq9B+Po
 yU2MTYr1/W9MxjxsziEenbiwxICVzY1aicYmtSYfsoTZqBlIAe4HQMHx3/NInOyMflHNGR
 9zVSLpJ9xPPOw0Y9iFwV9YpEfhwCs14=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-347-2YbYU1I7OBCyYyUBEl1Jvg-1; Fri, 28 Jan 2022 11:12:11 -0500
X-MC-Unique: 2YbYU1I7OBCyYyUBEl1Jvg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8690B18C8C04;
 Fri, 28 Jan 2022 16:12:10 +0000 (UTC)
Received: from localhost.localdomain.com (unknown [10.33.37.9])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 0E7DE7D3F4;
 Fri, 28 Jan 2022 16:12:08 +0000 (UTC)
From: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 2/2] python: support recording QMP session to a file
Date: Fri, 28 Jan 2022 16:11:57 +0000
Message-Id: <20220128161157.36261-3-berrange@redhat.com>
In-Reply-To: <20220128161157.36261-1-berrange@redhat.com>
References: <20220128161157.36261-1-berrange@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.167,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: Eduardo Habkost <eduardo@habkost.net>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Markus Armbruster <armbru@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

When running QMP commands with very large response payloads, it is often
not easy to spot the info you want. If we can save the response to a
file then tools like 'grep' or 'jq' can be used to extract information.

For convenience of processing, we merge the QMP command and response
dictionaries together:

  {
      "arguments": {},
      "execute": "query-kvm",
      "return": {
          "enabled": false,
          "present": true
      }
  }

Example usage

  $ ./scripts/qmp/qmp-shell-wrap -l q.log -p -- ./build/qemu-system-x86_64 -display none
  Welcome to the QMP low-level shell!
  Connected
  (QEMU) query-kvm
  {
      "return": {
          "enabled": false,
          "present": true
      }
  }
  (QEMU) query-mice
  {
      "return": [
          {
              "absolute": false,
              "current": true,
              "index": 2,
              "name": "QEMU PS/2 Mouse"
          }
      ]
  }

 $ jq --slurp '. | to_entries[] | select(.value.execute == "query-kvm") |
               .value.return.enabled' < q.log
   false

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
---
 python/qemu/aqmp/qmp_shell.py | 29 ++++++++++++++++++++++-------
 python/setup.cfg              |  3 +++
 2 files changed, 25 insertions(+), 7 deletions(-)

diff --git a/python/qemu/aqmp/qmp_shell.py b/python/qemu/aqmp/qmp_shell.py
index 185f5066ef..85988d9f2e 100644
--- a/python/qemu/aqmp/qmp_shell.py
+++ b/python/qemu/aqmp/qmp_shell.py
@@ -89,6 +89,7 @@
 from subprocess import Popen
 import sys
 from typing import (
+    IO,
     Iterator,
     List,
     NoReturn,
@@ -170,7 +171,8 @@ class QMPShell(QEMUMonitorProtocol):
     def __init__(self, address: SocketAddrT,
                  pretty: bool = False,
                  verbose: bool = False,
-                 server: bool = False):
+                 server: bool = False,
+                 logfile: Optional[str] = None):
         super().__init__(address, server=server)
         self._greeting: Optional[QMPMessage] = None
         self._completer = QMPCompleter()
@@ -180,6 +182,10 @@ def __init__(self, address: SocketAddrT,
                                       '.qmp-shell_history')
         self.pretty = pretty
         self.verbose = verbose
+        self.logfile = None
+
+        if logfile is not None:
+            self.logfile = open(logfile, "w", encoding='utf-8')
 
     def close(self) -> None:
         # Hook into context manager of parent to save shell history.
@@ -320,11 +326,11 @@ def _build_cmd(self, cmdline: str) -> Optional[QMPMessage]:
         self._cli_expr(cmdargs[1:], qmpcmd['arguments'])
         return qmpcmd
 
-    def _print(self, qmp_message: object) -> None:
+    def _print(self, qmp_message: object, fh: IO[str] = sys.stdout) -> None:
         jsobj = json.dumps(qmp_message,
                            indent=4 if self.pretty else None,
                            sort_keys=self.pretty)
-        print(str(jsobj))
+        print(str(jsobj), file=fh)
 
     def _execute_cmd(self, cmdline: str) -> bool:
         try:
@@ -347,6 +353,9 @@ def _execute_cmd(self, cmdline: str) -> bool:
             print('Disconnected')
             return False
         self._print(resp)
+        if self.logfile is not None:
+            cmd = {**qmpcmd, **resp}
+            self._print(cmd, fh=self.logfile)
         return True
 
     def connect(self, negotiate: bool = True) -> None:
@@ -414,8 +423,9 @@ class HMPShell(QMPShell):
     def __init__(self, address: SocketAddrT,
                  pretty: bool = False,
                  verbose: bool = False,
-                 server: bool = False):
-        super().__init__(address, pretty, verbose, server)
+                 server: bool = False,
+                 logfile: Optional[str] = None):
+        super().__init__(address, pretty, verbose, server, logfile)
         self._cpu_index = 0
 
     def _cmd_completion(self) -> None:
@@ -508,6 +518,8 @@ def main() -> None:
                         help='Verbose (echo commands sent and received)')
     parser.add_argument('-p', '--pretty', action='store_true',
                         help='Pretty-print JSON')
+    parser.add_argument('-l', '--logfile',
+                        help='Save log of all QMP messages to PATH')
 
     default_server = os.environ.get('QMP_SOCKET')
     parser.add_argument('qmp_server', action='store',
@@ -526,7 +538,7 @@ def main() -> None:
         parser.error(f"Bad port number: {args.qmp_server}")
         return  # pycharm doesn't know error() is noreturn
 
-    with shell_class(address, args.pretty, args.verbose) as qemu:
+    with shell_class(address, args.pretty, args.verbose, args.logfile) as qemu:
         try:
             qemu.connect(negotiate=not args.skip_negotiation)
         except ConnectError as err:
@@ -550,6 +562,8 @@ def main_wrap() -> None:
                         help='Verbose (echo commands sent and received)')
     parser.add_argument('-p', '--pretty', action='store_true',
                         help='Pretty-print JSON')
+    parser.add_argument('-l', '--logfile',
+                        help='Save log of all QMP messages to PATH')
 
     parser.add_argument('command', nargs=argparse.REMAINDER,
                         help='QEMU command line to invoke')
@@ -574,7 +588,8 @@ def main_wrap() -> None:
         return  # pycharm doesn't know error() is noreturn
 
     try:
-        with shell_class(address, args.pretty, args.verbose, True) as qemu:
+        with shell_class(address, args.pretty, args.verbose,
+                         True, args.logfile) as qemu:
             with Popen(cmd):
 
                 try:
diff --git a/python/setup.cfg b/python/setup.cfg
index 84c0f33baf..9aeb74aed4 100644
--- a/python/setup.cfg
+++ b/python/setup.cfg
@@ -114,7 +114,10 @@ ignore_missing_imports = True
 # no Warning level messages displayed, use "--disable=all --enable=classes
 # --disable=W".
 disable=consider-using-f-string,
+        consider-using-with,
+        too-many-arguments,
         too-many-function-args,  # mypy handles this with less false positives.
+        too-many-instance-attributes,
         no-member,  # mypy also handles this better.
 
 [pylint.basic]
-- 
2.34.1


