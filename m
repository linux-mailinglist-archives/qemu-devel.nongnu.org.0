Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 48B04476299
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Dec 2021 21:05:52 +0100 (CET)
Received: from localhost ([::1]:55398 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mxaX9-0000to-DD
	for lists+qemu-devel@lfdr.de; Wed, 15 Dec 2021 15:05:51 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49980)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1mxaC2-0007MA-HX
 for qemu-devel@nongnu.org; Wed, 15 Dec 2021 14:44:05 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:58374)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1mxaBp-00024A-MH
 for qemu-devel@nongnu.org; Wed, 15 Dec 2021 14:43:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1639597429;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7U9JZYOTPQZQgw/PHuo/PYbKF6YyV2ZYNcjsl11jO8o=;
 b=GCb9ieP3ENlxO46w8cb6qeLMgtSFrZXie77OJ1TsrNfURnf3yeZj8c5V/Bv/p21VtaPkA7
 FlrsY8XHX8gZA+GCqDwIRukf5EeXlGM5Og+A+XsHhaARowXcudcfQjiXg3ts2xreElb/Aj
 xztTN8qMBV/GE+2BcgDVfwB3wy5BHmI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-385-FzWeoijUPmSKjQOuw3l4_A-1; Wed, 15 Dec 2021 14:43:43 -0500
X-MC-Unique: FzWeoijUPmSKjQOuw3l4_A-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B0244100C662;
 Wed, 15 Dec 2021 19:43:41 +0000 (UTC)
Received: from scv.redhat.com (unknown [10.22.19.57])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 4C4A810074FD;
 Wed, 15 Dec 2021 19:43:25 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 20/25] python/aqmp: take QMPBadPortError and parse_address
 from qemu.qmp
Date: Wed, 15 Dec 2021 14:39:34 -0500
Message-Id: <20211215193939.3768033-21-jsnow@redhat.com>
In-Reply-To: <20211215193939.3768033-1-jsnow@redhat.com>
References: <20211215193939.3768033-1-jsnow@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.719,
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
Cc: Eduardo Habkost <eduardo@habkost.net>, Kevin Wolf <kwolf@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Daniel Berrange <berrange@redhat.com>, Beraldo Leal <bleal@redhat.com>,
 qemu-block@nongnu.org, Andrea Bolognani <abologna@redhat.com>,
 Wainer Moschetta <wainersm@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Cleber Rosa <crosa@redhat.com>, John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Shift these definitions over from the qmp package to the async qmp
package.

Signed-off-by: John Snow <jsnow@redhat.com>
---
 python/qemu/aqmp/aqmp_tui.py |  2 +-
 python/qemu/aqmp/legacy.py   | 30 ++++++++++++++++++++++++++----
 python/qemu/qmp/__init__.py  | 26 --------------------------
 3 files changed, 27 insertions(+), 31 deletions(-)

diff --git a/python/qemu/aqmp/aqmp_tui.py b/python/qemu/aqmp/aqmp_tui.py
index a2929f771c..184a3e4690 100644
--- a/python/qemu/aqmp/aqmp_tui.py
+++ b/python/qemu/aqmp/aqmp_tui.py
@@ -35,8 +35,8 @@
 import urwid
 import urwid_readline
 
-from ..qmp import QEMUMonitorProtocol, QMPBadPortError
 from .error import ProtocolError
+from .legacy import QEMUMonitorProtocol, QMPBadPortError
 from .message import DeserializationError, Message, UnexpectedTypeError
 from .protocol import ConnectError, Runstate
 from .qmp_client import ExecInterruptedError, QMPClient
diff --git a/python/qemu/aqmp/legacy.py b/python/qemu/aqmp/legacy.py
index 0890f95b16..76b09671cc 100644
--- a/python/qemu/aqmp/legacy.py
+++ b/python/qemu/aqmp/legacy.py
@@ -22,9 +22,6 @@
 from .qmp_client import QMPClient
 
 
-# (Temporarily) Re-export QMPBadPortError
-QMPBadPortError = qemu.qmp.QMPBadPortError
-
 #: QMPMessage is an entire QMP message of any kind.
 QMPMessage = Dict[str, Any]
 
@@ -45,6 +42,12 @@
 # pylint: disable=missing-docstring
 
 
+class QMPBadPortError(QMPError):
+    """
+    Unable to parse socket address: Port was non-numerical.
+    """
+
+
 class QEMUMonitorProtocol(qemu.qmp.QEMUMonitorProtocol):
     def __init__(self, address: SocketAddrT,
                  server: bool = False,
@@ -72,7 +75,26 @@ def _get_greeting(self) -> Optional[QMPMessage]:
         return None
 
     # __enter__ and __exit__ need no changes
-    # parse_address needs no changes
+
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
 
     def connect(self, negotiate: bool = True) -> Optional[QMPMessage]:
         self._aqmp.await_greeting = negotiate
diff --git a/python/qemu/qmp/__init__.py b/python/qemu/qmp/__init__.py
index 358c0971d0..4e08641154 100644
--- a/python/qemu/qmp/__init__.py
+++ b/python/qemu/qmp/__init__.py
@@ -102,12 +102,6 @@ def __init__(self, reply: QMPMessage):
         self.reply = reply
 
 
-class QMPBadPortError(QMPError):
-    """
-    Unable to parse socket address: Port was non-numerical.
-    """
-
-
 class QEMUMonitorProtocol:
     """
     Provide an API to connect to QEMU via QEMU Monitor Protocol (QMP) and then
@@ -237,26 +231,6 @@ def __exit__(self,
         # Implement context manager exit function.
         self.close()
 
-    @classmethod
-    def parse_address(cls, address: str) -> SocketAddrT:
-        """
-        Parse a string into a QMP address.
-
-        Figure out if the argument is in the port:host form.
-        If it's not, it's probably a file path.
-        """
-        components = address.split(':')
-        if len(components) == 2:
-            try:
-                port = int(components[1])
-            except ValueError:
-                msg = f"Bad port: '{components[1]}' in '{address}'."
-                raise QMPBadPortError(msg) from None
-            return (components[0], port)
-
-        # Treat as filepath.
-        return address
-
     def connect(self, negotiate: bool = True) -> Optional[QMPMessage]:
         """
         Connect to the QMP Monitor and perform capabilities negotiation.
-- 
2.31.1


