Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EAB0F4ECAB5
	for <lists+qemu-devel@lfdr.de>; Wed, 30 Mar 2022 19:32:51 +0200 (CEST)
Received: from localhost ([::1]:35662 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nZcBf-0005Sm-2A
	for lists+qemu-devel@lfdr.de; Wed, 30 Mar 2022 13:32:51 -0400
Received: from eggs.gnu.org ([209.51.188.92]:34778)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1nZc7T-0005wM-B5
 for qemu-devel@nongnu.org; Wed, 30 Mar 2022 13:28:31 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:33029)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1nZc7R-0003Le-FZ
 for qemu-devel@nongnu.org; Wed, 30 Mar 2022 13:28:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1648661308;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=r/lbW38Dac4FP2QCfnPFGoUNhpMgEiZ/GraSrqfBdQQ=;
 b=NP1b9848mEbdGBnpiURFoZi9pYoYcCVPgCveSddJ8xPhK3b7pXj83xAS8YxoyeX+/B5TUy
 bIpJJCwVQP1N37TUqrIQ0kI4+GJQQ+ywk2Fq9rxs/wnv+52y9kopdgWLW6VxJP5AHFsvov
 FB0T78WBvp2tnEEYo76IM6c0IbTLqTk=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-379-aDiyQ2NuNo6S1ErgIZGZiQ-1; Wed, 30 Mar 2022 13:28:27 -0400
X-MC-Unique: aDiyQ2NuNo6S1ErgIZGZiQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 52DE2899EE7;
 Wed, 30 Mar 2022 17:28:21 +0000 (UTC)
Received: from scv.redhat.com (unknown [10.22.35.177])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 726BD40CFD22;
 Wed, 30 Mar 2022 17:28:16 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 2/9] python/aqmp: take QMPBadPortError and parse_address
 from qemu.qmp
Date: Wed, 30 Mar 2022 13:28:05 -0400
Message-Id: <20220330172812.3427355-3-jsnow@redhat.com>
In-Reply-To: <20220330172812.3427355-1-jsnow@redhat.com>
References: <20220330172812.3427355-1-jsnow@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.1
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true
Received-SPF: pass client-ip=170.10.129.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 Vladimir Sementsov-Ogievskiy <v.sementsov-og@mail.ru>,
 Beraldo Leal <bleal@redhat.com>, qemu-block@nongnu.org,
 Markus Armbruster <armbru@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
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


