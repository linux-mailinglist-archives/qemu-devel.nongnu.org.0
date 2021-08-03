Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 163C73DF4D3
	for <lists+qemu-devel@lfdr.de>; Tue,  3 Aug 2021 20:37:31 +0200 (CEST)
Received: from localhost ([::1]:58422 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mAzI9-0001tO-NC
	for lists+qemu-devel@lfdr.de; Tue, 03 Aug 2021 14:37:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53436)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1mAzAy-0004Mh-Ez
 for qemu-devel@nongnu.org; Tue, 03 Aug 2021 14:30:04 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:25569)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1mAzAv-0005xW-Tn
 for qemu-devel@nongnu.org; Tue, 03 Aug 2021 14:30:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1628015401;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=MkENGZUkRGgkxcZhoWc7cZuse+/fSHReYA/kXjoGrsI=;
 b=eEG1Uqwi6WfE+3vbO2XHCv/3wqCuAZFD6S6IXWsg1ZCHmm9YkQcgJaSemPewonrqQT+9q+
 7nkJ6Zszntba/b789UTMOkYBfc0TCV+nooQKRojaYiExqwMYaulJBY5kDZrjhKpWvf0t/m
 YjjMcBgt+UZQcTpnSWPoJ1c9s9c8VzM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-462-o8itxGioMnGHdlpFqDkMQw-1; Tue, 03 Aug 2021 14:30:00 -0400
X-MC-Unique: o8itxGioMnGHdlpFqDkMQw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2C09C87D543;
 Tue,  3 Aug 2021 18:29:59 +0000 (UTC)
Received: from scv.redhat.com (unknown [10.22.11.3])
 by smtp.corp.redhat.com (Postfix) with ESMTP id F309960854;
 Tue,  3 Aug 2021 18:29:57 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 06/25] python/aqmp: add runstate state machine to
 AsyncProtocol
Date: Tue,  3 Aug 2021 14:29:22 -0400
Message-Id: <20210803182941.504537-7-jsnow@redhat.com>
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
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -15
X-Spam_score: -1.6
X-Spam_bar: -
X-Spam_report: (-1.6 / 5.0 requ) DKIMWL_WL_HIGH=-0.699, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Cc: Willian Rampazzo <wrampazz@redhat.com>, Eric Blake <eblake@redhat.com>,
 Markus Armbruster <armbru@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 "Niteesh G . S ." <niteesh.gs@gmail.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 John Snow <jsnow@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This serves a few purposes:

1. Protect interfaces when it's not safe to call them (via @require)

2. Add an interface by which an async client can determine if the state
has changed, for the purposes of connection management.

Signed-off-by: John Snow <jsnow@redhat.com>
---
 python/qemu/aqmp/__init__.py |   6 +-
 python/qemu/aqmp/protocol.py | 159 ++++++++++++++++++++++++++++++++++-
 2 files changed, 160 insertions(+), 5 deletions(-)

diff --git a/python/qemu/aqmp/__init__.py b/python/qemu/aqmp/__init__.py
index 5c0de72672d..88ead4c0238 100644
--- a/python/qemu/aqmp/__init__.py
+++ b/python/qemu/aqmp/__init__.py
@@ -22,12 +22,16 @@
 # the COPYING file in the top-level directory.
 
 from .error import AQMPError
-from .protocol import ConnectError
+from .protocol import ConnectError, Runstate, StateError
 
 
 # The order of these fields impact the Sphinx documentation order.
 __all__ = (
+    # Classes
+    'Runstate',
+
     # Exceptions, most generic to most explicit
     'AQMPError',
+    'StateError',
     'ConnectError',
 )
diff --git a/python/qemu/aqmp/protocol.py b/python/qemu/aqmp/protocol.py
index 2a93da791e2..3a4703d49dc 100644
--- a/python/qemu/aqmp/protocol.py
+++ b/python/qemu/aqmp/protocol.py
@@ -12,11 +12,10 @@
 
 import asyncio
 from asyncio import StreamReader, StreamWriter
+from enum import Enum
+from functools import wraps
 from ssl import SSLContext
-# import exceptions will be removed in a forthcoming commit.
-# The problem stems from pylint/flake8 believing that 'Any'
-# is unused because of its only use in a string-quoted type.
-from typing import (  # pylint: disable=unused-import # noqa
+from typing import (
     Any,
     Awaitable,
     Callable,
@@ -26,6 +25,7 @@
     Tuple,
     TypeVar,
     Union,
+    cast,
 )
 
 from .error import AQMPError
@@ -44,6 +44,20 @@
 _FutureT = TypeVar('_FutureT', bound=Optional['asyncio.Future[Any]'])
 
 
+class Runstate(Enum):
+    """Protocol session runstate."""
+
+    #: Fully quiesced and disconnected.
+    IDLE = 0
+    #: In the process of connecting or establishing a session.
+    CONNECTING = 1
+    #: Fully connected and active session.
+    RUNNING = 2
+    #: In the process of disconnecting.
+    #: Runstate may be returned to `IDLE` by calling `disconnect()`.
+    DISCONNECTING = 3
+
+
 class ConnectError(AQMPError):
     """
     Raised when the initial connection process has failed.
@@ -65,6 +79,76 @@ def __str__(self) -> str:
         return f"{self.error_message}: {self.exc!s}"
 
 
+class StateError(AQMPError):
+    """
+    An API command (connect, execute, etc) was issued at an inappropriate time.
+
+    This error is raised when a command like
+    :py:meth:`~AsyncProtocol.connect()` is issued at an inappropriate
+    time.
+
+    :param error_message: Human-readable string describing the state violation.
+    :param state: The actual `Runstate` seen at the time of the violation.
+    :param required: The `Runstate` required to process this command.
+    """
+    def __init__(self, error_message: str,
+                 state: Runstate, required: Runstate):
+        super().__init__(error_message)
+        self.error_message = error_message
+        self.state = state
+        self.required = required
+
+
+F = TypeVar('F', bound=Callable[..., Any])  # pylint: disable=invalid-name
+
+
+# Don't Panic.
+def require(required_state: Runstate) -> Callable[[F], F]:
+    """
+    Decorator: protect a method so it can only be run in a certain `Runstate`.
+
+    :param required_state: The `Runstate` required to invoke this method.
+    :raise StateError: When the required `Runstate` is not met.
+    """
+    def _decorator(func: F) -> F:
+        # _decorator is the decorator that is built by calling the
+        # require() decorator factory; e.g.:
+        #
+        # @require(Runstate.IDLE) def # foo(): ...
+        # will replace 'foo' with the result of '_decorator(foo)'.
+
+        @wraps(func)
+        def _wrapper(proto: 'AsyncProtocol[Any]',
+                     *args: Any, **kwargs: Any) -> Any:
+            # _wrapper is the function that gets executed prior to the
+            # decorated method.
+
+            name = type(proto).__name__
+
+            if proto.runstate != required_state:
+                if proto.runstate == Runstate.CONNECTING:
+                    emsg = f"{name} is currently connecting."
+                elif proto.runstate == Runstate.DISCONNECTING:
+                    emsg = (f"{name} is disconnecting."
+                            " Call disconnect() to return to IDLE state.")
+                elif proto.runstate == Runstate.RUNNING:
+                    emsg = f"{name} is already connected and running."
+                elif proto.runstate == Runstate.IDLE:
+                    emsg = f"{name} is disconnected and idle."
+                else:
+                    assert False
+                raise StateError(emsg, proto.runstate, required_state)
+            # No StateError, so call the wrapped method.
+            return func(proto, *args, **kwargs)
+
+        # Return the decorated method;
+        # Transforming Func to Decorated[Func].
+        return cast(F, _wrapper)
+
+    # Return the decorator instance from the decorator factory. Phew!
+    return _decorator
+
+
 class AsyncProtocol(Generic[T]):
     """
     AsyncProtocol implements a generic async message-based protocol.
@@ -118,7 +202,24 @@ def __init__(self) -> None:
         #: exit.
         self._dc_task: Optional[asyncio.Future[None]] = None
 
+        self._runstate = Runstate.IDLE
+        self._runstate_changed: Optional[asyncio.Event] = None
+
+    @property  # @upper_half
+    def runstate(self) -> Runstate:
+        """The current `Runstate` of the connection."""
+        return self._runstate
+
     @upper_half
+    async def runstate_changed(self) -> Runstate:
+        """
+        Wait for the `runstate` to change, then return that runstate.
+        """
+        await self._runstate_event.wait()
+        return self.runstate
+
+    @upper_half
+    @require(Runstate.IDLE)
     async def connect(self, address: Union[str, Tuple[str, int]],
                       ssl: Optional[SSLContext] = None) -> None:
         """
@@ -152,6 +253,30 @@ async def disconnect(self) -> None:
     # Section: Session machinery
     # --------------------------
 
+    @property
+    def _runstate_event(self) -> asyncio.Event:
+        # asyncio.Event() objects should not be created prior to entrance into
+        # an event loop, so we can ensure we create it in the correct context.
+        # Create it on-demand *only* at the behest of an 'async def' method.
+        if not self._runstate_changed:
+            self._runstate_changed = asyncio.Event()
+        return self._runstate_changed
+
+    @upper_half
+    @bottom_half
+    def _set_state(self, state: Runstate) -> None:
+        """
+        Change the `Runstate` of the protocol connection.
+
+        Signals the `runstate_changed` event.
+        """
+        if state == self._runstate:
+            return
+
+        self._runstate = state
+        self._runstate_event.set()
+        self._runstate_event.clear()
+
     @upper_half
     async def _new_session(self,
                            address: Union[str, Tuple[str, int]],
@@ -176,6 +301,8 @@ async def _new_session(self,
             protocol-level failure occurs while establishing a new
             session, the wrapped error may also be an `AQMPError`.
         """
+        assert self.runstate == Runstate.IDLE
+
         try:
             phase = "connection"
             await self._establish_connection(address, ssl)
@@ -185,6 +312,7 @@ async def _new_session(self,
 
         except BaseException as err:
             emsg = f"Failed to establish {phase}"
+            # Reset from CONNECTING back to IDLE.
             await self.disconnect()
 
             # NB: CancelledError is not a BaseException before Python 3.8
@@ -197,6 +325,8 @@ async def _new_session(self,
             # Raise BaseExceptions un-wrapped, they're more important.
             raise
 
+        assert self.runstate == Runstate.RUNNING
+
     @upper_half
     async def _establish_connection(
             self,
@@ -211,6 +341,14 @@ async def _establish_connection(
             UNIX socket path or TCP address/port.
         :param ssl: SSL context to use, if any.
         """
+        assert self.runstate == Runstate.IDLE
+        self._set_state(Runstate.CONNECTING)
+
+        # Allow runstate watchers to witness 'CONNECTING' state; some
+        # failures in the streaming layer are synchronous and will not
+        # otherwise yield.
+        await asyncio.sleep(0)
+
         await self._do_connect(address, ssl)
 
     @upper_half
@@ -240,6 +378,8 @@ async def _establish_session(self) -> None:
         own negotiations here. The Runstate will be RUNNING upon
         successful conclusion.
         """
+        assert self.runstate == Runstate.CONNECTING
+
         self._outgoing = asyncio.Queue()
 
         reader_coro = self._bh_loop_forever(self._bh_recv_message)
@@ -253,6 +393,9 @@ async def _establish_session(self) -> None:
             self._writer_task,
         )
 
+        self._set_state(Runstate.RUNNING)
+        await asyncio.sleep(0)  # Allow runstate_event to process
+
     @upper_half
     @bottom_half
     def _schedule_disconnect(self) -> None:
@@ -266,6 +409,7 @@ def _schedule_disconnect(self) -> None:
         It can be invoked no matter what the `runstate` is.
         """
         if not self._dc_task:
+            self._set_state(Runstate.DISCONNECTING)
             self._dc_task = create_task(self._bh_disconnect())
 
     @upper_half
@@ -281,6 +425,7 @@ async def _wait_disconnect(self) -> None:
         :raise Exception:
             Arbitrary exception re-raised on behalf of the reader/writer.
         """
+        assert self.runstate == Runstate.DISCONNECTING
         assert self._dc_task
 
         aws: List[Awaitable[object]] = [self._dc_task]
@@ -295,6 +440,7 @@ async def _wait_disconnect(self) -> None:
             await all_defined_tasks  # Raise Exceptions from the bottom half.
         finally:
             self._cleanup()
+            self._set_state(Runstate.IDLE)
 
     @upper_half
     def _cleanup(self) -> None:
@@ -306,6 +452,7 @@ def _paranoid_task_erase(task: _FutureT) -> Optional[_FutureT]:
             assert (task is None) or task.done()
             return None if (task and task.done()) else task
 
+        assert self.runstate == Runstate.DISCONNECTING
         self._dc_task = _paranoid_task_erase(self._dc_task)
         self._reader_task = _paranoid_task_erase(self._reader_task)
         self._writer_task = _paranoid_task_erase(self._writer_task)
@@ -314,6 +461,9 @@ def _paranoid_task_erase(task: _FutureT) -> Optional[_FutureT]:
         self._reader = None
         self._writer = None
 
+        # NB: _runstate_changed cannot be cleared because we still need it to
+        # send the final runstate changed event ...!
+
     # ----------------------------
     # Section: Bottom Half methods
     # ----------------------------
@@ -328,6 +478,7 @@ async def _bh_disconnect(self) -> None:
         it is free to wait on any pending actions that may still need to
         occur in either the reader or writer tasks.
         """
+        assert self.runstate == Runstate.DISCONNECTING
 
         def _done(task: Optional['asyncio.Future[Any]']) -> bool:
             return task is not None and task.done()
-- 
2.31.1


