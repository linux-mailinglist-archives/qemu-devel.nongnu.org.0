Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0780D45CD87
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Nov 2021 20:52:35 +0100 (CET)
Received: from localhost ([::1]:37296 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mpyJm-00083i-2H
	for lists+qemu-devel@lfdr.de; Wed, 24 Nov 2021 14:52:34 -0500
Received: from eggs.gnu.org ([209.51.188.92]:36120)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1mpxvJ-0003yZ-G4
 for qemu-devel@nongnu.org; Wed, 24 Nov 2021 14:27:17 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:40145)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1mpxvF-0007hk-KI
 for qemu-devel@nongnu.org; Wed, 24 Nov 2021 14:27:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1637782033;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=UIGpVd+G0TGJmPBoybxAUYyqPZihySlMnB+UDF+G+2U=;
 b=EPhCFlFJYXPlb/RGm4dgP9wnXyZ2agMLJL5kXxRpyB2oWecQUT7FYZKN8Iuo8sKly798pE
 kCOyiUsZv5yfnkpJtrbbsbfwlimyiEaZROGLg9+q3YaxCXnk4iA4c0v2+TkbG9Hlg0DsSd
 bqVkBMiEiU4+lmPU7n4FZVs0baa+XZA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-193-ikIDWUb_NtiZau2OAjVsJg-1; Wed, 24 Nov 2021 14:27:10 -0500
X-MC-Unique: ikIDWUb_NtiZau2OAjVsJg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id EBF70102ABE5;
 Wed, 24 Nov 2021 19:27:08 +0000 (UTC)
Received: from scv.redhat.com (unknown [10.22.9.79])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 071226C336;
 Wed, 24 Nov 2021 19:27:07 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 19/23] python/aqmp: take QMPBadPortError and parse_address
 from qemu.qmp
Date: Wed, 24 Nov 2021 14:26:13 -0500
Message-Id: <20211124192617.3396403-20-jsnow@redhat.com>
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
Received-SPF: pass client-ip=170.10.129.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
index 5d358d63db..c8183de19a 100644
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
 
 
+class QMPBadPortError(AQMPError):
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


