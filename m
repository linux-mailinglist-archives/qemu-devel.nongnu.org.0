Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 21A273DF4E9
	for <lists+qemu-devel@lfdr.de>; Tue,  3 Aug 2021 20:43:54 +0200 (CEST)
Received: from localhost ([::1]:50510 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mAzOL-0007Ls-69
	for lists+qemu-devel@lfdr.de; Tue, 03 Aug 2021 14:43:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53730)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1mAzBT-0004yq-Ev
 for qemu-devel@nongnu.org; Tue, 03 Aug 2021 14:30:35 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:45630)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1mAzBQ-0006LG-Pa
 for qemu-devel@nongnu.org; Tue, 03 Aug 2021 14:30:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1628015432;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Rf0H8rNF7ntDxiamJ+enk3JtsYwy9/0J7fZr71svCII=;
 b=U6TmpIl9kWNuib0LCF60emAv18NzLsoCVIxmO/Yp4A9t+wFCr+ZGuxrd5HOqsn4JsfpojN
 IC37kbizAOj7rqsU24thAc893cEFP5pfS7tCSZY/r0gqSQLMbcph9iMoEyncWxFUaVdeCa
 ll7TosHQVfePR2mfabfxdoOfnUdrFFs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-549-MarOygM4OQmdKKEuNCS-vg-1; Tue, 03 Aug 2021 14:30:30 -0400
X-MC-Unique: MarOygM4OQmdKKEuNCS-vg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id AF8B61008061;
 Tue,  3 Aug 2021 18:30:29 +0000 (UTC)
Received: from scv.redhat.com (unknown [10.22.11.3])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 71DA060854;
 Tue,  3 Aug 2021 18:30:28 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 17/25] python/aqmp: add QMP protocol support
Date: Tue,  3 Aug 2021 14:29:33 -0400
Message-Id: <20210803182941.504537-18-jsnow@redhat.com>
In-Reply-To: <20210803182941.504537-1-jsnow@redhat.com>
References: <20210803182941.504537-1-jsnow@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Willian Rampazzo <wrampazz@redhat.com>, Eric Blake <eblake@redhat.com>,
 Markus Armbruster <armbru@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 "Niteesh G . S ." <niteesh.gs@gmail.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 John Snow <jsnow@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The star of our show!

Add most of the QMP protocol, sans support for actually executing
commands. No problem, that happens in the next several commits.

Signed-off-by: John Snow <jsnow@redhat.com>
---
 python/qemu/aqmp/__init__.py   |   2 +
 python/qemu/aqmp/qmp_client.py | 264 +++++++++++++++++++++++++++++++++
 2 files changed, 266 insertions(+)
 create mode 100644 python/qemu/aqmp/qmp_client.py

diff --git a/python/qemu/aqmp/__init__.py b/python/qemu/aqmp/__init__.py
index 829166a2e2e..d975c752eaa 100644
--- a/python/qemu/aqmp/__init__.py
+++ b/python/qemu/aqmp/__init__.py
@@ -25,11 +25,13 @@
 from .events import EventListener
 from .message import Message
 from .protocol import ConnectError, Runstate, StateError
+from .qmp_client import QMPClient
 
 
 # The order of these fields impact the Sphinx documentation order.
 __all__ = (
     # Classes, most to least important
+    'QMPClient',
     'Message',
     'EventListener',
     'Runstate',
diff --git a/python/qemu/aqmp/qmp_client.py b/python/qemu/aqmp/qmp_client.py
new file mode 100644
index 00000000000..000ff59c7a7
--- /dev/null
+++ b/python/qemu/aqmp/qmp_client.py
@@ -0,0 +1,264 @@
+"""
+QMP Protocol Implementation
+
+This module provides the `QMPClient` class, which can be used to connect
+and send commands to a QMP server such as QEMU. The QMP class can be
+used to either connect to a listening server, or used to listen and
+accept an incoming connection from that server.
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
+from .util import (
+    bottom_half,
+    exception_summary,
+    pretty_traceback,
+    upper_half,
+)
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
+class QMPClient(AsyncProtocol[Message], Events):
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
+      qmp = QMPClient('my_virtual_machine_name')
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
+              self.qmp = QMPClient(name)
+
+          async def watch_events(self):
+              try:
+                  async for event in self.qmp.events:
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
+    # Read buffer limit; large enough to accept query-qmp-schema
+    _limit = (256 * 1024)
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
+    async def _establish_session(self) -> None:
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
+        await super()._establish_session()
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
+            self.logger.error("%s: %s", emsg, exception_summary(err))
+            self.logger.debug("%s:\n%s\n", emsg, pretty_traceback())
+            raise GreetingError(emsg, err) from err
+        except BaseException as err:
+            # EOFError, OSError, or something unexpected.
+            emsg = "Failed to receive Greeting"
+            self.logger.error("%s: %s", emsg, exception_summary(err))
+            self.logger.debug("%s:\n%s\n", emsg, pretty_traceback())
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
+            self.logger.error("%s: %s", emsg, exception_summary(err))
+            self.logger.debug("%s:\n%s\n", emsg, pretty_traceback())
+            raise NegotiationError(emsg, err) from err
+        except BaseException as err:
+            # EOFError, OSError, or something unexpected.
+            emsg = "Negotiation failed"
+            self.logger.error("%s: %s", emsg, exception_summary(err))
+            self.logger.debug("%s:\n%s\n", emsg, pretty_traceback())
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


