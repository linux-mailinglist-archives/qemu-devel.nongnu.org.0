Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 30AEE3CC05D
	for <lists+qemu-devel@lfdr.de>; Sat, 17 Jul 2021 02:47:18 +0200 (CEST)
Received: from localhost ([::1]:49366 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m4YU9-0001eG-7s
	for lists+qemu-devel@lfdr.de; Fri, 16 Jul 2021 20:47:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37708)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1m4YH4-0005b2-Q6
 for qemu-devel@nongnu.org; Fri, 16 Jul 2021 20:33:46 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:39809)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1m4YH2-0006XY-Ec
 for qemu-devel@nongnu.org; Fri, 16 Jul 2021 20:33:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626482023;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=bOeziBfI86iWBqGqcpBJY1awsc/AHn3zImxMQF5aWoA=;
 b=aWErGXO/kieYxiboPZKjba4zwoJCACntaOpI6QrtSRG+hX1GKQZZZOyHwXfd1NXoUsDZoC
 nLgESHDZT9uDCx6yoxIx7bQ0cto6PmdB3VzOhNotnfwXVYFLnusaPq75V4AKva2KXQ0gDK
 C7fBoYYYeSmR1foKGYNCwniBRzMUX6w=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-528-XDgarJaQMdWRkkZEpl9AfQ-1; Fri, 16 Jul 2021 20:33:42 -0400
X-MC-Unique: XDgarJaQMdWRkkZEpl9AfQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BF28D100B3AC;
 Sat, 17 Jul 2021 00:33:41 +0000 (UTC)
Received: from scv.redhat.com (ovpn-119-183.rdu2.redhat.com [10.10.119.183])
 by smtp.corp.redhat.com (Postfix) with ESMTP id DD8765C1A1;
 Sat, 17 Jul 2021 00:33:33 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 19/24] python/aqmp: Add message routing to QMP protocol
Date: Fri, 16 Jul 2021 20:32:48 -0400
Message-Id: <20210717003253.457418-20-jsnow@redhat.com>
In-Reply-To: <20210717003253.457418-1-jsnow@redhat.com>
References: <20210717003253.457418-1-jsnow@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
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
Cc: Eduardo Habkost <ehabkost@redhat.com>, Eric Blake <eblake@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 "Niteesh G . S ." <niteesh.gs@gmail.com>,
 Willian Rampazzo <wrampazz@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Add the ability to handle and route messages in qmp_protocol.py. The
interface for actually sending anything still isn't added until next
commit.

Signed-off-by: John Snow <jsnow@redhat.com>
---
 python/qemu/aqmp/qmp_client.py | 122 ++++++++++++++++++++++++++++++++-
 1 file changed, 120 insertions(+), 2 deletions(-)

diff --git a/python/qemu/aqmp/qmp_client.py b/python/qemu/aqmp/qmp_client.py
index 000ff59c7a7..fa0cc7c5ae5 100644
--- a/python/qemu/aqmp/qmp_client.py
+++ b/python/qemu/aqmp/qmp_client.py
@@ -7,15 +7,19 @@
 accept an incoming connection from that server.
 """
 
+# The import workarounds here are fixed in the next commit.
+import asyncio  # pylint: disable=unused-import # noqa
 import logging
 from typing import (
     Dict,
     List,
     Mapping,
     Optional,
+    Union,
+    cast,
 )
 
-from .error import ProtocolError
+from .error import AQMPError, ProtocolError
 from .events import Events
 from .message import Message
 from .models import Greeting
@@ -61,6 +65,53 @@ class NegotiationError(_WrappedProtocolError):
     """
 
 
+class ExecInterruptedError(AQMPError):
+    """
+    Exception raised when an RPC is interrupted.
+
+    This error is raised when an execute() statement could not be
+    completed.  This can occur because the connection itself was
+    terminated before a reply was received.
+
+    The true cause of the interruption will be available via `disconnect()`.
+    """
+
+
+class _MsgProtocolError(ProtocolError):
+    """
+    Abstract error class for protocol errors that have a `Message` object.
+
+    This Exception class is used for protocol errors where the `Message`
+    was mechanically understood, but was found to be inappropriate or
+    malformed.
+
+    :param error_message: Human-readable string describing the error.
+    :param msg: The QMP `Message` that caused the error.
+    """
+    def __init__(self, error_message: str, msg: Message):
+        super().__init__(error_message)
+        #: The received `Message` that caused the error.
+        self.msg: Message = msg
+
+    def __str__(self) -> str:
+        return "\n".join([
+            super().__str__(),
+            f"  Message was: {str(self.msg)}\n",
+        ])
+
+
+class ServerParseError(_MsgProtocolError):
+    """
+    The Server sent a `Message` indicating parsing failure.
+
+    i.e. A reply has arrived from the server, but it is missing the "ID"
+    field, indicating a parsing error.
+
+    :param error_message: Human-readable string describing the error.
+    :param msg: The QMP `Message` that caused the error.
+    """
+
+
 class QMPClient(AsyncProtocol[Message], Events):
     """
     Implements a QMP client connection.
@@ -106,6 +157,9 @@ async def run(self, address='/tmp/qemu.socket'):
     # Read buffer limit; large enough to accept query-qmp-schema
     _limit = (256 * 1024)
 
+    # Type alias for pending execute() result items
+    _PendingT = Union[Message, ExecInterruptedError]
+
     def __init__(self, name: Optional[str] = None) -> None:
         super().__init__(name)
         Events.__init__(self)
@@ -120,6 +174,12 @@ def __init__(self, name: Optional[str] = None) -> None:
         # Cached Greeting, if one was awaited.
         self._greeting: Optional[Greeting] = None
 
+        # Incoming RPC reply messages.
+        self._pending: Dict[
+            Union[str, None],
+            'asyncio.Queue[QMPClient._PendingT]'
+        ] = {}
+
     @upper_half
     async def _establish_session(self) -> None:
         """
@@ -132,6 +192,9 @@ async def _establish_session(self) -> None:
         :raise EOFError: When the server unexpectedly hangs up.
         :raise OSError: For underlying stream errors.
         """
+        self._greeting = None
+        self._pending = {}
+
         if self.await_greeting or self.negotiate:
             self._greeting = await self._get_greeting()
 
@@ -203,10 +266,33 @@ async def _negotiate(self) -> None:
             self.logger.debug("%s:\n%s\n", emsg, pretty_traceback())
             raise
 
+    @bottom_half
+    async def _bh_disconnect(self) -> None:
+        try:
+            await super()._bh_disconnect()
+        finally:
+            if self._pending:
+                self.logger.debug("Cancelling pending executions")
+            keys = self._pending.keys()
+            for key in keys:
+                self.logger.debug("Cancelling execution '%s'", key)
+                self._pending[key].put_nowait(
+                    ExecInterruptedError("Disconnected")
+                )
+
+            self.logger.debug("QMP Disconnected.")
+
+    @upper_half
+    def _cleanup(self) -> None:
+        super()._cleanup()
+        assert not self._pending
+
     @bottom_half
     async def _on_message(self, msg: Message) -> None:
         """
         Add an incoming message to the appropriate queue/handler.
+
+        :raise ServerParseError: When Message indicates server parse failure.
         """
         # Incoming messages are not fully parsed/validated here;
         # do only light peeking to know how to route the messages.
@@ -216,7 +302,39 @@ async def _on_message(self, msg: Message) -> None:
             return
 
         # Below, we assume everything left is an execute/exec-oob response.
-        # ... Which we'll implement in the next commit!
+
+        exec_id = cast(Optional[str], msg.get('id'))
+
+        if exec_id in self._pending:
+            await self._pending[exec_id].put(msg)
+            return
+
+        # We have a message we can't route back to a caller.
+
+        is_error = 'error' in msg
+        has_id = 'id' in msg
+
+        if is_error and not has_id:
+            # This is very likely a server parsing error.
+            # It doesn't inherently belong to any pending execution.
+            # Instead of performing clever recovery, just terminate.
+            # See "NOTE" in qmp-spec.txt, section 2.4.2
+            raise ServerParseError(
+                ("Server sent an error response without an ID, "
+                 "but there are no ID-less executions pending. "
+                 "Assuming this is a server parser failure."),
+                msg
+            )
+
+        # qmp-spec.txt, section 2.4:
+        # 'Clients should drop all the responses
+        # that have an unknown "id" field.'
+        self.logger.log(
+            logging.ERROR if is_error else logging.WARNING,
+            "Unknown ID '%s', message dropped.",
+            exec_id,
+        )
+        self.logger.debug("Unroutable message: %s", str(msg))
 
     @upper_half
     @bottom_half
-- 
2.31.1


