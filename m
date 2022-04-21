Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C9BB850A41A
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Apr 2022 17:29:18 +0200 (CEST)
Received: from localhost ([::1]:43200 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhYk8-00026S-QT
	for lists+qemu-devel@lfdr.de; Thu, 21 Apr 2022 11:29:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41642)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1nhYXZ-0003bK-M9
 for qemu-devel@nongnu.org; Thu, 21 Apr 2022 11:16:17 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:51791)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1nhYXU-0005o3-0z
 for qemu-devel@nongnu.org; Thu, 21 Apr 2022 11:16:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1650554170;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=De8dZw0bbkZLJg8Ef8RNcja9f7rKLvmtPt3ZklVYdw0=;
 b=ZkRXZRgX+hJwgJQaylJvdqN+pu/spOT09Dnp1HhN76bOZZhHp4gTqlcw9GYRKeZfSZYU6e
 Fv3xN7ej5xCTXXKb2IH4dOIrZyIl2aeZP2IuzznYjE2qW2S1zAxZ0wtzu2Q0groRf7QsSX
 TLuzL3LOXFZwL7RDT1jS/SCZKOB/uDQ=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-475-i2zlULzKNDSIRB0fnxIxjA-1; Thu, 21 Apr 2022 11:16:07 -0400
X-MC-Unique: i2zlULzKNDSIRB0fnxIxjA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 0AF413811F2D;
 Thu, 21 Apr 2022 15:16:07 +0000 (UTC)
Received: from scv.redhat.com (unknown [10.22.34.80])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 8E75640D016E;
 Thu, 21 Apr 2022 15:16:06 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 10/17] python/aqmp: take QMPBadPortError and parse_address from
 qemu.qmp
Date: Thu, 21 Apr 2022 11:15:53 -0400
Message-Id: <20220421151600.984189-11-jsnow@redhat.com>
In-Reply-To: <20220421151600.984189-1-jsnow@redhat.com>
References: <20220421151600.984189-1-jsnow@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.1
Received-SPF: pass client-ip=170.10.129.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
 Vladimir Sementsov-Ogievskiy <v.sementsov-og@mail.ru>,
 Beraldo Leal <bleal@redhat.com>, qemu-block@nongnu.org,
 Markus Armbruster <armbru@redhat.com>, Eduardo Habkost <eduardo@habkost.net>,
 Hanna Reitz <hreitz@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Cleber Rosa <crosa@redhat.com>, John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Shift these definitions over from the qmp package to the async qmp
package.

(Licensing: this is a lateral move, from GPLv2 (only) to GPLv2 (only))

Signed-off-by: John Snow <jsnow@redhat.com>
Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Reviewed-by: Beraldo Leal <bleal@redhat.com>
Message-id: 20220330172812.3427355-3-jsnow@redhat.com
Signed-off-by: John Snow <jsnow@redhat.com>
---
 python/qemu/aqmp/aqmp_tui.py |  3 +--
 python/qemu/aqmp/legacy.py   | 30 ++++++++++++++++++++++++++----
 python/qemu/qmp/__init__.py  | 26 --------------------------
 3 files changed, 27 insertions(+), 32 deletions(-)

diff --git a/python/qemu/aqmp/aqmp_tui.py b/python/qemu/aqmp/aqmp_tui.py
index 946ba9af24e..59d3036be38 100644
--- a/python/qemu/aqmp/aqmp_tui.py
+++ b/python/qemu/aqmp/aqmp_tui.py
@@ -35,9 +35,8 @@
 import urwid
 import urwid_readline
 
-from qemu.qmp import QEMUMonitorProtocol, QMPBadPortError
-
 from .error import ProtocolError
+from .legacy import QEMUMonitorProtocol, QMPBadPortError
 from .message import DeserializationError, Message, UnexpectedTypeError
 from .protocol import ConnectError, Runstate
 from .qmp_client import ExecInterruptedError, QMPClient
diff --git a/python/qemu/aqmp/legacy.py b/python/qemu/aqmp/legacy.py
index f86cb298049..f0262749491 100644
--- a/python/qemu/aqmp/legacy.py
+++ b/python/qemu/aqmp/legacy.py
@@ -33,9 +33,6 @@
 from .qmp_client import QMPClient
 
 
-# (Temporarily) Re-export QMPBadPortError
-QMPBadPortError = qemu.qmp.QMPBadPortError
-
 #: QMPMessage is an entire QMP message of any kind.
 QMPMessage = Dict[str, Any]
 
@@ -56,6 +53,12 @@
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
@@ -86,7 +89,26 @@ def _get_greeting(self) -> Optional[QMPMessage]:
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
index 358c0971d06..4e086411544 100644
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
2.34.1


