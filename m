Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E88F445CD81
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Nov 2021 20:47:11 +0100 (CET)
Received: from localhost ([::1]:49566 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mpyEZ-0005jV-23
	for lists+qemu-devel@lfdr.de; Wed, 24 Nov 2021 14:47:11 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35724)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1mpxvB-0003TD-4g
 for qemu-devel@nongnu.org; Wed, 24 Nov 2021 14:27:09 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:39136)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1mpxv8-0007cq-JY
 for qemu-devel@nongnu.org; Wed, 24 Nov 2021 14:27:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1637782025;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7nu3wISZgyH4rIz4CD8Pwamst4jQqGzOKhrf8q9W8DY=;
 b=JAINeoLUcz6mSQp+b7+BWcyHuzaPvPkCA3ySshpLuhJNCvrx1zmwU+Bwr6la9kO1gdWoT1
 HzLwAaHmVmDXRqJcTa9Rz7+PYbaa7cPMaMQV1KRxboca9SbCp6o9XBUoRH9Kec75GdDHj3
 HrhSfVMLPmHAgHdFpdapCzKV3gEBhM0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-558-xMFC7Ao6NLGSf26F70qGJg-1; Wed, 24 Nov 2021 14:27:02 -0500
X-MC-Unique: xMFC7Ao6NLGSf26F70qGJg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8A6B080F051;
 Wed, 24 Nov 2021 19:26:56 +0000 (UTC)
Received: from scv.redhat.com (unknown [10.22.9.79])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 7F0252B178;
 Wed, 24 Nov 2021 19:26:55 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 08/23] python/qmp: switch qmp-shell to AQMP
Date: Wed, 24 Nov 2021 14:26:02 -0500
Message-Id: <20211124192617.3396403-9-jsnow@redhat.com>
In-Reply-To: <20211124192617.3396403-1-jsnow@redhat.com>
References: <20211124192617.3396403-1-jsnow@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Eduardo Habkost <ehabkost@redhat.com>, qemu-block@nongnu.org,
 Markus Armbruster <armbru@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We have a replacement for async QMP, but it doesn't have feature parity
yet. For now, then, port the old tool onto the new backend.

Signed-off-by: John Snow <jsnow@redhat.com>
---
 python/qemu/aqmp/legacy.py   |  3 +++
 python/qemu/qmp/qmp_shell.py | 31 +++++++++++++++++--------------
 2 files changed, 20 insertions(+), 14 deletions(-)

diff --git a/python/qemu/aqmp/legacy.py b/python/qemu/aqmp/legacy.py
index 9431fe9330..5d358d63db 100644
--- a/python/qemu/aqmp/legacy.py
+++ b/python/qemu/aqmp/legacy.py
@@ -22,6 +22,9 @@
 from .qmp_client import QMPClient
 
 
+# (Temporarily) Re-export QMPBadPortError
+QMPBadPortError = qemu.qmp.QMPBadPortError
+
 #: QMPMessage is an entire QMP message of any kind.
 QMPMessage = Dict[str, Any]
 
diff --git a/python/qemu/qmp/qmp_shell.py b/python/qemu/qmp/qmp_shell.py
index e7d7eb18f1..2260ae016e 100644
--- a/python/qemu/qmp/qmp_shell.py
+++ b/python/qemu/qmp/qmp_shell.py
@@ -95,8 +95,13 @@
     Sequence,
 )
 
-from qemu import qmp
-from qemu.qmp import QMPMessage
+from qemu.aqmp import AQMPError, ConnectError, SocketAddrT
+from qemu.aqmp.legacy import (
+    QEMUMonitorProtocol,
+    QMPBadPortError,
+    QMPMessage,
+    QMPObject,
+)
 
 
 LOG = logging.getLogger(__name__)
@@ -125,7 +130,7 @@ def complete(self, text: str, state: int) -> Optional[str]:
         return None
 
 
-class QMPShellError(qmp.QMPError):
+class QMPShellError(AQMPError):
     """
     QMP Shell Base error class.
     """
@@ -153,7 +158,7 @@ def visit_Name(cls,  # pylint: disable=invalid-name
         return node
 
 
-class QMPShell(qmp.QEMUMonitorProtocol):
+class QMPShell(QEMUMonitorProtocol):
     """
     QMPShell provides a basic readline-based QMP shell.
 
@@ -161,7 +166,7 @@ class QMPShell(qmp.QEMUMonitorProtocol):
     :param pretty: Pretty-print QMP messages.
     :param verbose: Echo outgoing QMP messages to console.
     """
-    def __init__(self, address: qmp.SocketAddrT,
+    def __init__(self, address: SocketAddrT,
                  pretty: bool = False, verbose: bool = False):
         super().__init__(address)
         self._greeting: Optional[QMPMessage] = None
@@ -237,7 +242,7 @@ def _parse_value(cls, val: str) -> object:
 
     def _cli_expr(self,
                   tokens: Sequence[str],
-                  parent: qmp.QMPObject) -> None:
+                  parent: QMPObject) -> None:
         for arg in tokens:
             (key, sep, val) = arg.partition('=')
             if sep != '=':
@@ -403,7 +408,7 @@ class HMPShell(QMPShell):
     :param pretty: Pretty-print QMP messages.
     :param verbose: Echo outgoing QMP messages to console.
     """
-    def __init__(self, address: qmp.SocketAddrT,
+    def __init__(self, address: SocketAddrT,
                  pretty: bool = False, verbose: bool = False):
         super().__init__(address, pretty, verbose)
         self._cpu_index = 0
@@ -512,19 +517,17 @@ def main() -> None:
 
     try:
         address = shell_class.parse_address(args.qmp_server)
-    except qmp.QMPBadPortError:
+    except QMPBadPortError:
         parser.error(f"Bad port number: {args.qmp_server}")
         return  # pycharm doesn't know error() is noreturn
 
     with shell_class(address, args.pretty, args.verbose) as qemu:
         try:
             qemu.connect(negotiate=not args.skip_negotiation)
-        except qmp.QMPConnectError:
-            die("Didn't get QMP greeting message")
-        except qmp.QMPCapabilitiesError:
-            die("Couldn't negotiate capabilities")
-        except OSError as err:
-            die(f"Couldn't connect to {args.qmp_server}: {err!s}")
+        except ConnectError as err:
+            if isinstance(err.exc, OSError):
+                die(f"Couldn't connect to {args.qmp_server}: {err!s}")
+            die(str(err))
 
         for _ in qemu.repl():
             pass
-- 
2.31.1


