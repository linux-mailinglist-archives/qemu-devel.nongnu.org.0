Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AD1D5419F6D
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Sep 2021 21:49:46 +0200 (CEST)
Received: from localhost ([::1]:59372 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mUwdF-0005LA-N4
	for lists+qemu-devel@lfdr.de; Mon, 27 Sep 2021 15:49:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58162)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1mUwJ6-0006UF-BO
 for qemu-devel@nongnu.org; Mon, 27 Sep 2021 15:28:57 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:52073)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1mUwJ3-0008Lm-7d
 for qemu-devel@nongnu.org; Mon, 27 Sep 2021 15:28:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1632770931;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=W6qRcWayYtbFZ1XErwlWGn15q7qsOLnZBhyJXS1hkNM=;
 b=Sk9wkOUF1fao8n61+0R9tjS6xWqZ3KBsLG6d+7ua1OHHN+moCAS5CYGOM0urkB0PAZ48yA
 DULbwOS/ClZRMzo7ZIAeuPjjVV5pFd97viclHJpnGpGwcbeE2HoftoYgpXM1ewjVyLEerJ
 yEYt3q4VcvnW1sOd65Xe+4r9LziRLNg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-588-s1f5zal1N_ewJxmCt3uDDQ-1; Mon, 27 Sep 2021 15:28:47 -0400
X-MC-Unique: s1f5zal1N_ewJxmCt3uDDQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5BAD719200C0;
 Mon, 27 Sep 2021 19:28:46 +0000 (UTC)
Received: from scv.redhat.com (unknown [10.22.9.55])
 by smtp.corp.redhat.com (Postfix) with ESMTP id CB12460871;
 Mon, 27 Sep 2021 19:28:44 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 20/32] python/aqmp: add execute() interfaces
Date: Mon, 27 Sep 2021 15:25:01 -0400
Message-Id: <20210927192513.744199-21-jsnow@redhat.com>
In-Reply-To: <20210927192513.744199-1-jsnow@redhat.com>
References: <20210927192513.744199-1-jsnow@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 Daniel Berrange <berrange@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Markus Armbruster <armbru@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Willian Rampazzo <willianr@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Add execute() and execute_msg().

_execute() is split into _issue() and _reply() halves so that
hypothetical subclasses of QMP that want to support different execution
paradigms can do so.

I anticipate a synchronous interface may have need of separating the
send/reply phases. However, I do not wish to expose that interface here
and want to actively discourage it, so they remain private interfaces.

Signed-off-by: John Snow <jsnow@redhat.com>
Message-id: 20210915162955.333025-21-jsnow@redhat.com
Signed-off-by: John Snow <jsnow@redhat.com>
---
 python/qemu/aqmp/__init__.py   |   4 +-
 python/qemu/aqmp/qmp_client.py | 202 +++++++++++++++++++++++++++++++--
 2 files changed, 198 insertions(+), 8 deletions(-)

diff --git a/python/qemu/aqmp/__init__.py b/python/qemu/aqmp/__init__.py
index d975c752eaa..4b7df53e006 100644
--- a/python/qemu/aqmp/__init__.py
+++ b/python/qemu/aqmp/__init__.py
@@ -25,7 +25,7 @@
 from .events import EventListener
 from .message import Message
 from .protocol import ConnectError, Runstate, StateError
-from .qmp_client import QMPClient
+from .qmp_client import ExecInterruptedError, ExecuteError, QMPClient
 
 
 # The order of these fields impact the Sphinx documentation order.
@@ -40,4 +40,6 @@
     'AQMPError',
     'StateError',
     'ConnectError',
+    'ExecuteError',
+    'ExecInterruptedError',
 )
diff --git a/python/qemu/aqmp/qmp_client.py b/python/qemu/aqmp/qmp_client.py
index fa0cc7c5ae5..879348feaaa 100644
--- a/python/qemu/aqmp/qmp_client.py
+++ b/python/qemu/aqmp/qmp_client.py
@@ -7,8 +7,7 @@
 accept an incoming connection from that server.
 """
 
-# The import workarounds here are fixed in the next commit.
-import asyncio  # pylint: disable=unused-import # noqa
+import asyncio
 import logging
 from typing import (
     Dict,
@@ -22,8 +21,8 @@
 from .error import AQMPError, ProtocolError
 from .events import Events
 from .message import Message
-from .models import Greeting
-from .protocol import AsyncProtocol
+from .models import ErrorResponse, Greeting
+from .protocol import AsyncProtocol, Runstate, require
 from .util import (
     bottom_half,
     exception_summary,
@@ -65,11 +64,32 @@ class NegotiationError(_WrappedProtocolError):
     """
 
 
+class ExecuteError(AQMPError):
+    """
+    Exception raised by `QMPClient.execute()` on RPC failure.
+
+    :param error_response: The RPC error response object.
+    :param sent: The sent RPC message that caused the failure.
+    :param received: The raw RPC error reply received.
+    """
+    def __init__(self, error_response: ErrorResponse,
+                 sent: Message, received: Message):
+        super().__init__(error_response.error.desc)
+        #: The sent `Message` that caused the failure
+        self.sent: Message = sent
+        #: The received `Message` that indicated failure
+        self.received: Message = received
+        #: The parsed error response
+        self.error: ErrorResponse = error_response
+        #: The QMP error class
+        self.error_class: str = error_response.error.class_
+
+
 class ExecInterruptedError(AQMPError):
     """
-    Exception raised when an RPC is interrupted.
+    Exception raised by `execute()` (et al) when an RPC is interrupted.
 
-    This error is raised when an execute() statement could not be
+    This error is raised when an `execute()` statement could not be
     completed.  This can occur because the connection itself was
     terminated before a reply was received.
 
@@ -112,6 +132,27 @@ class ServerParseError(_MsgProtocolError):
     """
 
 
+class BadReplyError(_MsgProtocolError):
+    """
+    An execution reply was successfully routed, but not understood.
+
+    If a QMP message is received with an 'id' field to allow it to be
+    routed, but is otherwise malformed, this exception will be raised.
+
+    A reply message is malformed if it is missing either the 'return' or
+    'error' keys, or if the 'error' value has missing keys or members of
+    the wrong type.
+
+    :param error_message: Human-readable string describing the error.
+    :param msg: The malformed reply that was received.
+    :param sent: The message that was sent that prompted the error.
+    """
+    def __init__(self, error_message: str, msg: Message, sent: Message):
+        super().__init__(error_message, msg)
+        #: The sent `Message` that caused the failure
+        self.sent = sent
+
+
 class QMPClient(AsyncProtocol[Message], Events):
     """
     Implements a QMP client connection.
@@ -174,6 +215,9 @@ def __init__(self, name: Optional[str] = None) -> None:
         # Cached Greeting, if one was awaited.
         self._greeting: Optional[Greeting] = None
 
+        # Command ID counter
+        self._execute_id = 0
+
         # Incoming RPC reply messages.
         self._pending: Dict[
             Union[str, None],
@@ -363,12 +407,135 @@ def _do_send(self, msg: Message) -> None:
         assert self._writer is not None
         self._writer.write(bytes(msg))
 
+    @upper_half
+    def _get_exec_id(self) -> str:
+        exec_id = f"__aqmp#{self._execute_id:05d}"
+        self._execute_id += 1
+        return exec_id
+
+    @upper_half
+    async def _issue(self, msg: Message) -> Union[None, str]:
+        """
+        Issue a QMP `Message` and do not wait for a reply.
+
+        :param msg: The QMP `Message` to send to the server.
+
+        :return: The ID of the `Message` sent.
+        """
+        msg_id: Optional[str] = None
+        if 'id' in msg:
+            assert isinstance(msg['id'], str)
+            msg_id = msg['id']
+
+        self._pending[msg_id] = asyncio.Queue(maxsize=1)
+        await self._outgoing.put(msg)
+
+        return msg_id
+
+    @upper_half
+    async def _reply(self, msg_id: Union[str, None]) -> Message:
+        """
+        Await a reply to a previously issued QMP message.
+
+        :param msg_id: The ID of the previously issued message.
+
+        :return: The reply from the server.
+        :raise ExecInterruptedError:
+            When the reply could not be retrieved because the connection
+            was lost, or some other problem.
+        """
+        queue = self._pending[msg_id]
+        result = await queue.get()
+
+        try:
+            if isinstance(result, ExecInterruptedError):
+                raise result
+            return result
+        finally:
+            del self._pending[msg_id]
+
+    @upper_half
+    async def _execute(self, msg: Message, assign_id: bool = True) -> Message:
+        """
+        Send a QMP `Message` to the server and await a reply.
+
+        This method *assumes* you are sending some kind of an execute
+        statement that *will* receive a reply.
+
+        An execution ID will be assigned if assign_id is `True`. It can be
+        disabled, but this requires that an ID is manually assigned
+        instead. For manually assigned IDs, you must not use the string
+        '__aqmp#' anywhere in the ID.
+
+        :param msg: The QMP `Message` to execute.
+        :param assign_id: If True, assign a new execution ID.
+
+        :return: Execution reply from the server.
+        :raise ExecInterruptedError:
+            When the reply could not be retrieved because the connection
+            was lost, or some other problem.
+        """
+        if assign_id:
+            msg['id'] = self._get_exec_id()
+        elif 'id' in msg:
+            assert isinstance(msg['id'], str)
+            assert '__aqmp#' not in msg['id']
+
+        exec_id = await self._issue(msg)
+        return await self._reply(exec_id)
+
+    @upper_half
+    @require(Runstate.RUNNING)
+    async def execute_msg(self, msg: Message) -> object:
+        """
+        Execute a QMP command and return its value.
+
+        :param msg: The QMP `Message` to execute.
+
+        :return:
+            The command execution return value from the server. The type of
+            object returned depends on the command that was issued,
+            though most in QEMU return a `dict`.
+        :raise ValueError:
+            If the QMP `Message` does not have either the 'execute' or
+            'exec-oob' fields set.
+        :raise ExecuteError: When the server returns an error response.
+        :raise ExecInterruptedError: if the connection was terminated early.
+        """
+        if not ('execute' in msg or 'exec-oob' in msg):
+            raise ValueError("Requires 'execute' or 'exec-oob' message")
+
+        # Copy the Message so that the ID assigned by _execute() is
+        # local to this method; allowing the ID to be seen in raised
+        # Exceptions but without modifying the caller's held copy.
+        msg = Message(msg)
+        reply = await self._execute(msg)
+
+        if 'error' in reply:
+            try:
+                error_response = ErrorResponse(reply)
+            except (KeyError, TypeError) as err:
+                # Error response was malformed.
+                raise BadReplyError(
+                    "QMP error reply is malformed", reply, msg,
+                ) from err
+
+            raise ExecuteError(error_response, msg, reply)
+
+        if 'return' not in reply:
+            raise BadReplyError(
+                "QMP reply is missing a 'error' or 'return' member",
+                reply, msg,
+            )
+
+        return reply['return']
+
     @classmethod
     def make_execute_msg(cls, cmd: str,
                          arguments: Optional[Mapping[str, object]] = None,
                          oob: bool = False) -> Message:
         """
-        Create an executable message to be sent later.
+        Create an executable message to be sent by `execute_msg` later.
 
         :param cmd: QMP command name.
         :param arguments: Arguments (if any). Must be JSON-serializable.
@@ -380,3 +547,24 @@ def make_execute_msg(cls, cmd: str,
         if arguments is not None:
             msg['arguments'] = arguments
         return msg
+
+    @upper_half
+    async def execute(self, cmd: str,
+                      arguments: Optional[Mapping[str, object]] = None,
+                      oob: bool = False) -> object:
+        """
+        Execute a QMP command and return its value.
+
+        :param cmd: QMP command name.
+        :param arguments: Arguments (if any). Must be JSON-serializable.
+        :param oob: If `True`, execute "out of band".
+
+        :return:
+            The command execution return value from the server. The type of
+            object returned depends on the command that was issued,
+            though most in QEMU return a `dict`.
+        :raise ExecuteError: When the server returns an error response.
+        :raise ExecInterruptedError: if the connection was terminated early.
+        """
+        msg = self.make_execute_msg(cmd, arguments, oob=oob)
+        return await self.execute_msg(msg)
-- 
2.31.1


