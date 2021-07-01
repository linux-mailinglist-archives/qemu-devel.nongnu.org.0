Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EA0C43B8CE2
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Jul 2021 06:20:27 +0200 (CEST)
Received: from localhost ([::1]:32850 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lyoBe-0007oe-Vi
	for lists+qemu-devel@lfdr.de; Thu, 01 Jul 2021 00:20:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42304)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lyo51-0008L8-44
 for qemu-devel@nongnu.org; Thu, 01 Jul 2021 00:13:35 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:38849)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lyo4y-0000gO-Tp
 for qemu-devel@nongnu.org; Thu, 01 Jul 2021 00:13:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1625112812;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=XKh+OOhOkA7eclMe7X5kXZhj9ThrlHpOSJDa0G90vWQ=;
 b=XRnpvhc9BCCf5xAymV4+I39udHg2nnKZHHs/sp4A8+k+xm++vqQUq6IeurvrYbkwHWcQPw
 Mn/iKRE9iRS8RqdSWQQdW83JHuMMVY0u9Hq8UL/wxaB48Je7SLZa/5IW4WQTd/VPOHYWcH
 3mFraey9CRB6E+DjNSkgfMjInlh9Q+w=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-587-HsMc9ZOBP3C4u0uODSJWNQ-1; Thu, 01 Jul 2021 00:13:31 -0400
X-MC-Unique: HsMc9ZOBP3C4u0uODSJWNQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 30D4C800D62;
 Thu,  1 Jul 2021 04:13:30 +0000 (UTC)
Received: from scv.redhat.com (ovpn-118-71.rdu2.redhat.com [10.10.118.71])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D2E52604CC;
 Thu,  1 Jul 2021 04:13:28 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 07/20] python/aqmp: add runstate state machine to AsyncProtocol
Date: Thu,  1 Jul 2021 00:13:00 -0400
Message-Id: <20210701041313.1696009-8-jsnow@redhat.com>
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

This serves a few purposes:

1. Protect interfaces when it's not safe to call them (via @require)

2. Add an interface by which an async client can determine if the state
has changed, for the purposes of connection management.

Signed-off-by: John Snow <jsnow@redhat.com>
---
 python/qemu/aqmp/__init__.py |   5 +-
 python/qemu/aqmp/protocol.py | 133 +++++++++++++++++++++++++++++++++--
 2 files changed, 133 insertions(+), 5 deletions(-)

diff --git a/python/qemu/aqmp/__init__.py b/python/qemu/aqmp/__init__.py
index e003c898bd..5c44fabeea 100644
--- a/python/qemu/aqmp/__init__.py
+++ b/python/qemu/aqmp/__init__.py
@@ -22,11 +22,14 @@
 # the COPYING file in the top-level directory.
 
 from .error import AQMPError, MultiException
-from .protocol import ConnectError
+from .protocol import ConnectError, Runstate
 
 
 # The order of these fields impact the Sphinx documentation order.
 __all__ = (
+    # Classes
+    'Runstate',
+
     # Exceptions, most generic to most explicit
     'AQMPError',
     'ConnectError',
diff --git a/python/qemu/aqmp/protocol.py b/python/qemu/aqmp/protocol.py
index beb7e12d9c..a99a191982 100644
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
 
 from .error import AQMPError, MultiException
@@ -45,6 +45,20 @@
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
@@ -66,6 +80,75 @@ def __str__(self) -> str:
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
+
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
+            if proto.runstate != required_state:
+                if proto.runstate == Runstate.CONNECTING:
+                    emsg = "Client is currently connecting."
+                elif proto.runstate == Runstate.DISCONNECTING:
+                    emsg = ("Client is disconnecting."
+                            " Call disconnect() to return to IDLE state.")
+                elif proto.runstate == Runstate.RUNNING:
+                    emsg = "Client is already connected and running."
+                elif proto.runstate == Runstate.IDLE:
+                    emsg = "Client is disconnected and idle."
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
@@ -124,7 +207,18 @@ def __init__(self) -> None:
         #: exit.
         self._dc_task: Optional[asyncio.Future[None]] = None
 
+        self._runstate = Runstate.IDLE
+
+        #: An `asyncio.Event` that signals when `runstate` is changed.
+        self.runstate_changed: asyncio.Event = asyncio.Event()
+
+    @property
+    def runstate(self) -> Runstate:
+        """The current `Runstate` of the connection."""
+        return self._runstate
+
     @upper_half
+    @require(Runstate.IDLE)
     async def connect(self, address: Union[str, Tuple[str, int]],
                       ssl: Optional[SSLContext] = None) -> None:
         """
@@ -165,6 +259,21 @@ async def disconnect(self, force: bool = False) -> None:
     # Section: Session machinery
     # --------------------------
 
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
+        self.runstate_changed.set()
+        self.runstate_changed.clear()
+
     @upper_half
     async def _new_session(self,
                            address: Union[str, Tuple[str, int]],
@@ -189,6 +298,9 @@ async def _new_session(self,
             protocol-level failure occurs while establishing a new
             session, the wrapped error may also be an `AQMPError`.
         """
+        assert self.runstate == Runstate.IDLE
+        self._set_state(Runstate.CONNECTING)
+
         self._outgoing = asyncio.Queue()
 
         phase = "connection"
@@ -204,6 +316,8 @@ async def _new_session(self,
             emsg = f"Failed to establish {phase}"
             raise ConnectError(emsg, err) from err
 
+        assert self.runstate == Runstate.RUNNING
+
     @upper_half
     async def _do_connect(self, address: Union[str, Tuple[str, int]],
                           ssl: Optional[SSLContext] = None) -> None:
@@ -227,6 +341,8 @@ async def _begin_new_session(self) -> None:
         """
         After a connection is established, start the bottom half machinery.
         """
+        assert self.runstate == Runstate.CONNECTING
+
         reader_coro = self._bh_loop_forever(self._bh_recv_message)
         writer_coro = self._bh_loop_forever(self._bh_send_message)
 
@@ -239,6 +355,8 @@ async def _begin_new_session(self) -> None:
             return_exceptions=True,
         )
 
+        self._set_state(Runstate.RUNNING)
+
     @upper_half
     @bottom_half
     def _schedule_disconnect(self, force: bool = False) -> None:
@@ -276,6 +394,7 @@ def _results(self) -> None:
             Iterable Exception used to multiplex multiple exceptions in the
             event that multiple Tasks failed with non-cancellation reasons.
         """
+        assert self.runstate == Runstate.DISCONNECTING
         exceptions: List[BaseException] = []
 
         assert self._bh_tasks is None or self._bh_tasks.done()
@@ -340,6 +459,7 @@ def _paranoid_task_erase(task: _FutureT) -> Optional[_FutureT]:
             assert (task is None) or task.done()
             return None if (task and task.done()) else task
 
+        assert self.runstate == Runstate.DISCONNECTING
         self._dc_task = _paranoid_task_erase(self._dc_task)
         self._reader_task = _paranoid_task_erase(self._reader_task)
         self._writer_task = _paranoid_task_erase(self._writer_task)
@@ -348,6 +468,8 @@ def _paranoid_task_erase(task: _FutureT) -> Optional[_FutureT]:
         self._reader = None
         self._writer = None
 
+        self._set_state(Runstate.IDLE)
+
     # ----------------------------
     # Section: Bottom Half methods
     # ----------------------------
@@ -367,6 +489,9 @@ async def _bh_disconnect(self, force: bool = False) -> None:
             terminating execution. When `True`, terminate immediately.
 
         """
+        # Prohibit new calls to execute() et al.
+        self._set_state(Runstate.DISCONNECTING)
+
         await self._bh_stop_writer(force)
         await self._bh_stop_reader()
 
-- 
2.31.1


