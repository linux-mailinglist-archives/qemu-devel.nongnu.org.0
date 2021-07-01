Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2753C3B8CED
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Jul 2021 06:23:43 +0200 (CEST)
Received: from localhost ([::1]:43664 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lyoEo-0006g3-7m
	for lists+qemu-devel@lfdr.de; Thu, 01 Jul 2021 00:23:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42490)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lyo5N-0001JC-7g
 for qemu-devel@nongnu.org; Thu, 01 Jul 2021 00:13:57 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:41594)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lyo5K-0000y8-NA
 for qemu-devel@nongnu.org; Thu, 01 Jul 2021 00:13:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1625112834;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=K+o8mbvF9/lrr7ucl36zrO2mILjZDE5Y2AiqC/Y6US0=;
 b=Zg3Td8mb9DbU+1zRr3MKauTxlQ6KVOoureuoBw0ay27DAzVWVpwvrBSU0tlS2hBJf2PHma
 Ey/rruG1TGr9PRmQfosLod9vVUdIVH2zpYt3Zb1m/Dlk2pU4GiF5A4g7dpVL+yz2ahxcee
 4tRvENANw4aVSAfPDSopkkpyh9Sbi7U=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-397-cwWj02WlOxeSG4WSZdIsRQ-1; Thu, 01 Jul 2021 00:13:53 -0400
X-MC-Unique: cwWj02WlOxeSG4WSZdIsRQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 01C65804143;
 Thu,  1 Jul 2021 04:13:52 +0000 (UTC)
Received: from scv.redhat.com (ovpn-118-71.rdu2.redhat.com [10.10.118.71])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 0933669CB4;
 Thu,  1 Jul 2021 04:13:50 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 16/20] python/aqmp: Add message routing to QMP protocol
Date: Thu,  1 Jul 2021 00:13:09 -0400
Message-Id: <20210701041313.1696009-17-jsnow@redhat.com>
In-Reply-To: <20210701041313.1696009-1-jsnow@redhat.com>
References: <20210701041313.1696009-1-jsnow@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.435,
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
 python/qemu/aqmp/qmp_protocol.py | 98 +++++++++++++++++++++++++++++++-
 1 file changed, 96 insertions(+), 2 deletions(-)

diff --git a/python/qemu/aqmp/qmp_protocol.py b/python/qemu/aqmp/qmp_protocol.py
index 5872bfc017..04c8a8cb54 100644
--- a/python/qemu/aqmp/qmp_protocol.py
+++ b/python/qemu/aqmp/qmp_protocol.py
@@ -7,15 +7,18 @@
 incoming connection from that server.
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
 )
 
-from .error import ProtocolError
+from .error import AQMPError, ProtocolError
 from .events import Events
 from .message import Message
 from .models import Greeting
@@ -56,6 +59,53 @@ class NegotiationError(_WrappedProtocolError):
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
 class QMP(AsyncProtocol[Message], Events):
     """
     Implements a QMP client connection.
@@ -98,6 +148,9 @@ async def run(self, address='/tmp/qemu.socket'):
     #: Logger object used for debugging messages.
     logger = logging.getLogger(__name__)
 
+    # Type alias for pending execute() result items
+    _PendingT = Union[Message, ExecInterruptedError]
+
     def __init__(self, name: Optional[str] = None) -> None:
         super().__init__(name)
         Events.__init__(self)
@@ -112,6 +165,9 @@ def __init__(self, name: Optional[str] = None) -> None:
         # Cached Greeting, if one was awaited.
         self._greeting: Optional[Greeting] = None
 
+        # Incoming RPC reply messages
+        self._pending: Dict[str, 'asyncio.Queue[QMP._PendingT]'] = {}
+
     @upper_half
     async def _begin_new_session(self) -> None:
         """
@@ -191,10 +247,27 @@ async def _negotiate(self) -> None:
             self.logger.error("%s:\n%s\n", emsg, pretty_traceback())
             raise
 
+    @bottom_half
+    async def _bh_disconnect(self, force: bool = False) -> None:
+        await super()._bh_disconnect(force)
+
+        if self._pending:
+            self.logger.debug("Cancelling pending executions")
+        keys = self._pending.keys()
+        for key in keys:
+            self.logger.debug("Cancelling execution '%s'", key)
+            self._pending[key].put_nowait(
+                ExecInterruptedError("Disconnected")
+            )
+
+        self.logger.debug("QMP Disconnected.")
+
     @bottom_half
     async def _on_message(self, msg: Message) -> None:
         """
         Add an incoming message to the appropriate queue/handler.
+
+        :raise ServerParseError: When Message has no 'event' nor 'id' member
         """
         # Incoming messages are not fully parsed/validated here;
         # do only light peeking to know how to route the messages.
@@ -204,7 +277,27 @@ async def _on_message(self, msg: Message) -> None:
             return
 
         # Below, we assume everything left is an execute/exec-oob response.
-        # ... Which we'll implement in the next commit!
+
+        if 'id' not in msg:
+            # This is (very likely) a server parsing error.
+            # It doesn't inherently belong to any pending execution.
+            # Instead of performing clever recovery, just terminate.
+            # See "NOTE" in qmp-spec.txt, section 2.4.2
+            raise ServerParseError("Server sent a message without an ID,"
+                                   " indicating parse failure.", msg)
+
+        assert 'id' in msg
+        exec_id = str(msg['id'])
+
+        if exec_id not in self._pending:
+            # qmp-spec.txt, section 2.4:
+            # 'Clients should drop all the responses
+            # that have an unknown "id" field.'
+            self.logger.warning("Unknown ID '%s', message dropped.", exec_id)
+            self.logger.debug("Unroutable message: %s", str(msg))
+            return
+
+        await self._pending[exec_id].put(msg)
 
     @upper_half
     @bottom_half
@@ -237,6 +330,7 @@ def _do_send(self, msg: Message) -> None:
     def _cleanup(self) -> None:
         super()._cleanup()
         self._greeting = None
+        assert not self._pending
 
     @classmethod
     def make_execute_msg(cls, cmd: str,
-- 
2.31.1


