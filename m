Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BE313AD5A7
	for <lists+qemu-devel@lfdr.de>; Sat, 19 Jun 2021 01:10:05 +0200 (CEST)
Received: from localhost ([::1]:37796 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1luNci-0007Aa-D6
	for lists+qemu-devel@lfdr.de; Fri, 18 Jun 2021 19:10:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34734)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1luNXw-0006oS-2f
 for qemu-devel@nongnu.org; Fri, 18 Jun 2021 19:05:08 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:48004)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1luNXs-00062w-3X
 for qemu-devel@nongnu.org; Fri, 18 Jun 2021 19:05:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1624057503;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=yOJVbKVXGhkLp6BsQ57DKegG+6NrrEG99aIHfZWI0BQ=;
 b=YNDxrQxzneC1T2E1CXqnK4zCLgZNHK70WDp5ZFq+8rnXTp/68g5aiMTHCQsJ5BE5QSHh0Y
 VaSo5+j1agIV/y3O10rOKhqiwJOpAcwAVQSxoCpF/u0oDXntceZTCG8pMB09aXx2tdXOPK
 S5Og4RpCb0kyPnVIP5r60yjlFPJ6dU0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-290-C3XJrz7zMDy-Z9W2dNoHrw-1; Fri, 18 Jun 2021 19:05:01 -0400
X-MC-Unique: C3XJrz7zMDy-Z9W2dNoHrw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6CC07801B0A;
 Fri, 18 Jun 2021 23:05:00 +0000 (UTC)
Received: from scv.redhat.com (ovpn-113-126.rdu2.redhat.com [10.10.113.126])
 by smtp.corp.redhat.com (Postfix) with ESMTP id BDBB71017CE5;
 Fri, 18 Jun 2021 23:04:59 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 03/72] python/qmp: add parse_address classmethod
Date: Fri, 18 Jun 2021 19:03:46 -0400
Message-Id: <20210618230455.2891199-4-jsnow@redhat.com>
In-Reply-To: <20210618230455.2891199-1-jsnow@redhat.com>
References: <20210618230455.2891199-1-jsnow@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.194,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Markus Armbruster <armbru@redhat.com>, John Snow <jsnow@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This takes the place of qmp-shell's __get_address function. It also
allows other utilities to share the same parser and syntax for
specifying QMP locations.

Signed-off-by: John Snow <jsnow@redhat.com>
Message-id: 20210603003719.1321369-4-jsnow@redhat.com
Signed-off-by: John Snow <jsnow@redhat.com>
---
 python/qemu/qmp/__init__.py | 26 ++++++++++++++++++++++++++
 scripts/qmp/qmp-shell       | 21 ++-------------------
 2 files changed, 28 insertions(+), 19 deletions(-)

diff --git a/python/qemu/qmp/__init__.py b/python/qemu/qmp/__init__.py
index 5fb970f8a8..822c793c32 100644
--- a/python/qemu/qmp/__init__.py
+++ b/python/qemu/qmp/__init__.py
@@ -92,6 +92,12 @@ def __init__(self, reply: QMPMessage):
         self.reply = reply
 
 
+class QMPBadPortError(QMPError):
+    """
+    Unable to parse socket address: Port was non-numerical.
+    """
+
+
 class QEMUMonitorProtocol:
     """
     Provide an API to connect to QEMU via QEMU Monitor Protocol (QMP) and then
@@ -219,6 +225,26 @@ def __exit__(self,
         # Implement context manager exit function.
         self.close()
 
+    @classmethod
+    def parse_address(cls, address: str) -> SocketAddrT:
+        """
+        Parse a string into a QMP address.
+
+        Figure out if the argument is in the port:host form.
+        If it's not, it's probably a file path.
+        """
+        components = address.split(':')
+        if len(components) == 2:
+            try:
+                port = int(components[1])
+            except ValueError:
+                msg = f"Bad port: '{components[1]}' in '{address}'."
+                raise QMPBadPortError(msg) from None
+            return (components[0], port)
+
+        # Treat as filepath.
+        return address
+
     def connect(self, negotiate: bool = True) -> Optional[QMPMessage]:
         """
         Connect to the QMP Monitor and perform capabilities negotiation.
diff --git a/scripts/qmp/qmp-shell b/scripts/qmp/qmp-shell
index b4d06096ab..d5ae8a9b21 100755
--- a/scripts/qmp/qmp-shell
+++ b/scripts/qmp/qmp-shell
@@ -89,8 +89,6 @@ class QMPCompleter(list):
 class QMPShellError(Exception):
     pass
 
-class QMPShellBadPort(QMPShellError):
-    pass
 
 class FuzzyJSON(ast.NodeTransformer):
     '''This extension of ast.NodeTransformer filters literal "true/false/null"
@@ -109,7 +107,7 @@ class FuzzyJSON(ast.NodeTransformer):
 #       _execute_cmd()). Let's design a better one.
 class QMPShell(qmp.QEMUMonitorProtocol):
     def __init__(self, address, pretty=False):
-        super(QMPShell, self).__init__(self.__get_address(address))
+        super(QMPShell, self).__init__(self.parse_address(address))
         self._greeting = None
         self._completer = None
         self._pretty = pretty
@@ -118,21 +116,6 @@ class QMPShell(qmp.QEMUMonitorProtocol):
         self._histfile = os.path.join(os.path.expanduser('~'),
                                       '.qmp-shell_history')
 
-    def __get_address(self, arg):
-        """
-        Figure out if the argument is in the port:host form, if it's not it's
-        probably a file path.
-        """
-        addr = arg.split(':')
-        if len(addr) == 2:
-            try:
-                port = int(addr[1])
-            except ValueError:
-                raise QMPShellBadPort
-            return ( addr[0], port )
-        # socket path
-        return arg
-
     def _fill_completion(self):
         cmds = self.cmd('query-commands')
         if 'error' in cmds:
@@ -437,7 +420,7 @@ def main():
 
         if qemu is None:
             fail_cmdline()
-    except QMPShellBadPort:
+    except qmp.QMPBadPortError:
         die('bad port number in command-line')
 
     try:
-- 
2.31.1


