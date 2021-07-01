Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CC323B8D23
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Jul 2021 06:26:42 +0200 (CEST)
Received: from localhost ([::1]:52078 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lyoHh-0003xB-Db
	for lists+qemu-devel@lfdr.de; Thu, 01 Jul 2021 00:26:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42530)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lyo5P-0001So-Oa
 for qemu-devel@nongnu.org; Thu, 01 Jul 2021 00:13:59 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:38395)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lyo5K-0000yA-Qf
 for qemu-devel@nongnu.org; Thu, 01 Jul 2021 00:13:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1625112834;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=yvCKp+a4gWOikI8Cdi3Sz7v0HoKXlDnKgk4n24Yb9mQ=;
 b=cQ7nho0u8lQHE50JwXsjMMgBN02evXMXpyYBgtuRLjNhoVvjTL+aXtoaN0idHKunYe6tkv
 moBL5xF1yGr9P8sQJAiIRiCNBzLzp8oeVv3nbRePU1WToHReq/YslkQl/l+XdDefL0kZ66
 GuhqoQc8v8bf1e8RXEk6yn9oMuubXzA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-270-rt--H_1CN-643SnioJoD-g-1; Thu, 01 Jul 2021 00:13:51 -0400
X-MC-Unique: rt--H_1CN-643SnioJoD-g-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DCDCE362FB;
 Thu,  1 Jul 2021 04:13:50 +0000 (UTC)
Received: from scv.redhat.com (ovpn-118-71.rdu2.redhat.com [10.10.118.71])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E68BD69CB4;
 Thu,  1 Jul 2021 04:13:49 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 15/20] python/aqmp: add QMP protocol support
Date: Thu,  1 Jul 2021 00:13:08 -0400
Message-Id: <20210701041313.1696009-16-jsnow@redhat.com>
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
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jsnow@redhat.com;
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

The star of our show!

Add most of the QMP protocol, sans support for actually executing
commands. No problem, that happens in the next two commits.

Signed-off-by: John Snow <jsnow@redhat.com>
---
 python/qemu/aqmp/__init__.py     |   2 +
 python/qemu/aqmp/qmp_protocol.py | 257 +++++++++++++++++++++++++++++++
 2 files changed, 259 insertions(+)
 create mode 100644 python/qemu/aqmp/qmp_protocol.py

diff --git a/python/qemu/aqmp/__init__.py b/python/qemu/aqmp/__init__.py
index ae87436470..68d98cca75 100644
--- a/python/qemu/aqmp/__init__.py
+++ b/python/qemu/aqmp/__init__.py
@@ -25,11 +25,13 @@
 from .events import EventListener
 from .message import Message
 from .protocol import ConnectError, Runstate
+from .qmp_protocol import QMP
 
 
 # The order of these fields impact the Sphinx documentation order.
 __all__ = (
     # Classes, most to least important
+    'QMP',
     'Message',
     'EventListener',
     'Runstate',
diff --git a/python/qemu/aqmp/qmp_protocol.py b/python/qemu/aqmp/qmp_protocol.py
new file mode 100644
index 0000000000..5872bfc017
--- /dev/null
+++ b/python/qemu/aqmp/qmp_protocol.py
@@ -0,0 +1,257 @@
+"""
+QMP Protocol Implementation
+
+This module provides the `QMP` class, which can be used to connect and
+send commands to a QMP server such as QEMU. The QMP class can be used to
+either connect to a listening server, or used to listen and accept an
+incoming connection from that server.
+"""
+
+import logging
+from typing import (
+    Dict,
+    List,
+    Mapping,
+    Optional,
+)
+
+from .error import ProtocolError
+from .events import Events
+from .message import Message
+from .models import Greeting
+from .protocol import AsyncProtocol
+from .util import bottom_half, pretty_traceback, upper_half
+
+
+class _WrappedProtocolError(ProtocolError):
+    """
+    Abstract exception class for Protocol errors that wrap an Exception.
+
+    :param error_message: Human-readable string describing the error.
+    :param exc: The root-cause exception.
+    """
+    def __init__(self, error_message: str, exc: Exception):
+        super().__init__(error_message)
+        self.exc = exc
+
+    def __str__(self) -> str:
+        return f"{self.error_message}: {self.exc!s}"
+
+
+class GreetingError(_WrappedProtocolError):
+    """
+    An exception occurred during the Greeting phase.
+
+    :param error_message: Human-readable string describing the error.
+    :param exc: The root-cause exception.
+    """
+
+
+class NegotiationError(_WrappedProtocolError):
+    """
+    An exception occurred during the Negotiation phase.
+
+    :param error_message: Human-readable string describing the error.
+    :param exc: The root-cause exception.
+    """
+
+
+class QMP(AsyncProtocol[Message], Events):
+    """
+    Implements a QMP client connection.
+
+    QMP can be used to establish a connection as either the transport
+    client or server, though this class always acts as the QMP client.
+
+    :param name: Optional nickname for the connection, used for logging.
+
+    Basic script-style usage looks like this::
+
+      qmp = QMP('my_virtual_machine_name')
+      await qmp.connect(('127.0.0.1', 1234))
+      ...
+      res = await qmp.execute('block-query')
+      ...
+      await qmp.disconnect()
+
+    Basic async client-style usage looks like this::
+
+      class Client:
+          def __init__(self, name: str):
+              self.qmp = QMP(name)
+
+          async def watch_events(self):
+              try:
+                  async for event in self.events:
+                      print(f"Event: {event['event']}")
+              except asyncio.CancelledError:
+                  return
+
+          async def run(self, address='/tmp/qemu.socket'):
+              await self.qmp.connect(address)
+              asyncio.create_task(self.watch_events())
+              await self.qmp.runstate_changed.wait()
+              await self.disconnect()
+
+    See `aqmp.events` for more detail on event handling patterns.
+    """
+    #: Logger object used for debugging messages.
+    logger = logging.getLogger(__name__)
+
+    def __init__(self, name: Optional[str] = None) -> None:
+        super().__init__(name)
+        Events.__init__(self)
+
+        #: Whether or not to await a greeting after establishing a connection.
+        self.await_greeting: bool = True
+
+        #: Whether or not to perform capabilities negotiation upon connection.
+        #: Implies `await_greeting`.
+        self.negotiate: bool = True
+
+        # Cached Greeting, if one was awaited.
+        self._greeting: Optional[Greeting] = None
+
+    @upper_half
+    async def _begin_new_session(self) -> None:
+        """
+        Initiate the QMP session.
+
+        Wait for the QMP greeting and perform capabilities negotiation.
+
+        :raise GreetingError: When the greeting is not understood.
+        :raise NegotiationError: If the negotiation fails.
+        :raise EOFError: When the server unexpectedly hangs up.
+        :raise OSError: For underlying stream errors.
+        """
+        if self.await_greeting or self.negotiate:
+            self._greeting = await self._get_greeting()
+
+        if self.negotiate:
+            await self._negotiate()
+
+        # This will start the reader/writers:
+        await super()._begin_new_session()
+
+    @upper_half
+    async def _get_greeting(self) -> Greeting:
+        """
+        :raise GreetingError: When the greeting is not understood.
+        :raise EOFError: When the server unexpectedly hangs up.
+        :raise OSError: For underlying stream errors.
+
+        :return: the Greeting object given by the server.
+        """
+        self.logger.debug("Awaiting greeting ...")
+
+        try:
+            msg = await self._recv()
+            return Greeting(msg)
+        except (ProtocolError, KeyError, TypeError) as err:
+            emsg = "Did not understand Greeting"
+            self.logger.error("%s:\n%s\n", emsg, pretty_traceback())
+            raise GreetingError(emsg, err) from err
+        except BaseException:
+            # EOFError, OSError, or something unexpected.
+            emsg = "Failed to receive Greeting"
+            self.logger.error("%s:\n%s\n", emsg, pretty_traceback())
+            raise
+
+    @upper_half
+    async def _negotiate(self) -> None:
+        """
+        Perform QMP capabilities negotiation.
+
+        :raise NegotiationError: When negotiation fails.
+        :raise EOFError: When the server unexpectedly hangs up.
+        :raise OSError: For underlying stream errors.
+        """
+        self.logger.debug("Negotiating capabilities ...")
+
+        arguments: Dict[str, List[str]] = {'enable': []}
+        if self._greeting and 'oob' in self._greeting.QMP.capabilities:
+            arguments['enable'].append('oob')
+        msg = self.make_execute_msg('qmp_capabilities', arguments=arguments)
+
+        # It's not safe to use execute() here, because the reader/writers
+        # aren't running. AsyncProtocol *requires* that a new session
+        # does not fail after the reader/writers are running!
+        try:
+            await self._send(msg)
+            reply = await self._recv()
+            assert 'return' in reply
+            assert 'error' not in reply
+        except (ProtocolError, AssertionError) as err:
+            emsg = "Negotiation failed"
+            self.logger.error("%s:\n%s\n", emsg, pretty_traceback())
+            raise NegotiationError(emsg, err) from err
+        except BaseException:
+            # EOFError, OSError, or something unexpected.
+            emsg = "Negotiation failed"
+            self.logger.error("%s:\n%s\n", emsg, pretty_traceback())
+            raise
+
+    @bottom_half
+    async def _on_message(self, msg: Message) -> None:
+        """
+        Add an incoming message to the appropriate queue/handler.
+        """
+        # Incoming messages are not fully parsed/validated here;
+        # do only light peeking to know how to route the messages.
+
+        if 'event' in msg:
+            await self._event_dispatch(msg)
+            return
+
+        # Below, we assume everything left is an execute/exec-oob response.
+        # ... Which we'll implement in the next commit!
+
+    @upper_half
+    @bottom_half
+    async def _do_recv(self) -> Message:
+        """
+        :raise OSError: When a stream error is encountered.
+        :raise EOFError: When the stream is at EOF.
+        :raise ProtocolError:
+            When the Message is not understood.
+            See also `Message._deserialize`.
+
+        :return: A single QMP `Message`.
+        """
+        msg_bytes = await self._readline()
+        msg = Message(msg_bytes, eager=True)
+        return msg
+
+    @upper_half
+    @bottom_half
+    def _do_send(self, msg: Message) -> None:
+        """
+        :raise ValueError: JSON serialization failure
+        :raise TypeError: JSON serialization failure
+        :raise OSError: When a stream error is encountered.
+        """
+        assert self._writer is not None
+        self._writer.write(bytes(msg))
+
+    @upper_half
+    def _cleanup(self) -> None:
+        super()._cleanup()
+        self._greeting = None
+
+    @classmethod
+    def make_execute_msg(cls, cmd: str,
+                         arguments: Optional[Mapping[str, object]] = None,
+                         oob: bool = False) -> Message:
+        """
+        Create an executable message to be sent later.
+
+        :param cmd: QMP command name.
+        :param arguments: Arguments (if any). Must be JSON-serializable.
+        :param oob: If `True`, execute "out of band".
+
+        :return: An executable QMP `Message`.
+        """
+        msg = Message({'exec-oob' if oob else 'execute': cmd})
+        if arguments is not None:
+            msg['arguments'] = arguments
+        return msg
-- 
2.31.1


