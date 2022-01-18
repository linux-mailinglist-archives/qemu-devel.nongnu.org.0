Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 627DE492377
	for <lists+qemu-devel@lfdr.de>; Tue, 18 Jan 2022 11:06:43 +0100 (CET)
Received: from localhost ([::1]:48574 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n9lNy-0005GS-H5
	for lists+qemu-devel@lfdr.de; Tue, 18 Jan 2022 05:06:42 -0500
Received: from eggs.gnu.org ([209.51.188.92]:52064)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1n9lJK-0001RY-VA
 for qemu-devel@nongnu.org; Tue, 18 Jan 2022 05:01:54 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:23831)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1n9lJJ-0003e1-4i
 for qemu-devel@nongnu.org; Tue, 18 Jan 2022 05:01:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1642500112;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=vg7wtdNl7EHdOs1pzdEMmalySNr2Ja7mGOZjXy4QXjM=;
 b=ImK9JQtzxgtOrck9K6k22c8vHZj/0EcueqDa8oWSR2TLxbGy8MbiW1OSlEgIBNRhXn/2L2
 aHwyJDJC985TcNXh10i6qGSd1f0iQveVrqiZNaucnYaGIqQwypfPcHnapTStyxB1fZslA8
 bAZrKoV4DdPp+4nBrF/ohwiXESyjCVg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-655-eecB9D5zMzS7TQnP0oChCA-1; Tue, 18 Jan 2022 05:01:49 -0500
X-MC-Unique: eecB9D5zMzS7TQnP0oChCA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7254F8143EB;
 Tue, 18 Jan 2022 10:01:48 +0000 (UTC)
Received: from localhost.localdomain.com (unknown [10.39.195.32])
 by smtp.corp.redhat.com (Postfix) with ESMTP id EB41F752B0;
 Tue, 18 Jan 2022 10:01:46 +0000 (UTC)
From: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 2/2] python: support recording QMP session to a file
Date: Tue, 18 Jan 2022 10:01:40 +0000
Message-Id: <20220118100140.252920-3-berrange@redhat.com>
In-Reply-To: <20220118100140.252920-1-berrange@redhat.com>
References: <20220118100140.252920-1-berrange@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
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

Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
---
 python/qemu/qmp/qmp_shell.py | 29 ++++++++++++++++++++++-------
 python/setup.cfg             |  3 +++
 2 files changed, 25 insertions(+), 7 deletions(-)

diff --git a/python/qemu/qmp/qmp_shell.py b/python/qemu/qmp/qmp_shell.py
index fb9e7701af..2b54114bd2 100644
--- a/python/qemu/qmp/qmp_shell.py
+++ b/python/qemu/qmp/qmp_shell.py
@@ -89,6 +89,7 @@
 from subprocess import Popen
 import sys
 from typing import (
+    IO,
     Iterator,
     List,
     NoReturn,
@@ -165,7 +166,8 @@ class QMPShell(qmp.QEMUMonitorProtocol):
     def __init__(self, address: qmp.SocketAddrT,
                  pretty: bool = False,
                  verbose: bool = False,
-                 server: bool = False):
+                 server: bool = False,
+                 logfile: Optional[str] = None):
         super().__init__(address, server=server)
         self._greeting: Optional[QMPMessage] = None
         self._completer = QMPCompleter()
@@ -175,6 +177,10 @@ def __init__(self, address: qmp.SocketAddrT,
                                       '.qmp-shell_history')
         self.pretty = pretty
         self.verbose = verbose
+        self.logfile = None
+
+        if logfile is not None:
+            self.logfile = open(logfile, "w", encoding='utf-8')
 
     def close(self) -> None:
         # Hook into context manager of parent to save shell history.
@@ -315,11 +321,11 @@ def _build_cmd(self, cmdline: str) -> Optional[QMPMessage]:
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
@@ -342,6 +348,9 @@ def _execute_cmd(self, cmdline: str) -> bool:
             print('Disconnected')
             return False
         self._print(resp)
+        if self.logfile is not None:
+            cmd = {**qmpcmd, **resp}
+            self._print(cmd, fh=self.logfile)
         return True
 
     def connect(self, negotiate: bool = True) -> None:
@@ -409,8 +418,9 @@ class HMPShell(QMPShell):
     def __init__(self, address: qmp.SocketAddrT,
                  pretty: bool = False,
                  verbose: bool = False,
-                 server: bool = False):
-        super().__init__(address, pretty, verbose, server)
+                 server: bool = False,
+                 logfile: Optional[str] = None):
+        super().__init__(address, pretty, verbose, server, logfile)
         self._cpu_index = 0
 
     def _cmd_completion(self) -> None:
@@ -503,6 +513,8 @@ def main() -> None:
                         help='Verbose (echo commands sent and received)')
     parser.add_argument('-p', '--pretty', action='store_true',
                         help='Pretty-print JSON')
+    parser.add_argument('-l', '--logfile',
+                        help='Save log of all QMP messages to PATH')
 
     default_server = os.environ.get('QMP_SOCKET')
     parser.add_argument('qmp_server', action='store',
@@ -521,7 +533,7 @@ def main() -> None:
         parser.error(f"Bad port number: {args.qmp_server}")
         return  # pycharm doesn't know error() is noreturn
 
-    with shell_class(address, args.pretty, args.verbose) as qemu:
+    with shell_class(address, args.pretty, args.verbose, args.logfile) as qemu:
         try:
             qemu.connect(negotiate=not args.skip_negotiation)
         except qmp.QMPConnectError:
@@ -547,6 +559,8 @@ def main_wrap() -> None:
                         help='Verbose (echo commands sent and received)')
     parser.add_argument('-p', '--pretty', action='store_true',
                         help='Pretty-print JSON')
+    parser.add_argument('-l', '--logfile',
+                        help='Save log of all QMP messages to PATH')
 
     parser.add_argument('command', nargs=argparse.REMAINDER,
                         help='QEMU command line to invoke')
@@ -571,7 +585,8 @@ def main_wrap() -> None:
         return  # pycharm doesn't know error() is noreturn
 
     try:
-        with shell_class(address, args.pretty, args.verbose, True) as qemu:
+        with shell_class(address, args.pretty, args.verbose,
+                         True, args.logfile) as qemu:
             with Popen(cmd):
 
                 try:
diff --git a/python/setup.cfg b/python/setup.cfg
index 417e937839..a909321d00 100644
--- a/python/setup.cfg
+++ b/python/setup.cfg
@@ -113,7 +113,10 @@ ignore_missing_imports = True
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
2.33.1


