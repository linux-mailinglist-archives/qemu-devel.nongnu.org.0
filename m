Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 113153B8CD9
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Jul 2021 06:17:06 +0200 (CEST)
Received: from localhost ([::1]:48622 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lyo8P-0007x8-4N
	for lists+qemu-devel@lfdr.de; Thu, 01 Jul 2021 00:17:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42302)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lyo51-0008Kw-2O
 for qemu-devel@nongnu.org; Thu, 01 Jul 2021 00:13:35 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:45232)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lyo4x-0000f0-Ki
 for qemu-devel@nongnu.org; Thu, 01 Jul 2021 00:13:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1625112810;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=dG3x9fQwpD05aHBNaJ/XnfHOuCgPvln6v/gI+g7EU4E=;
 b=X88EqzUQETVyh6hLTvGqtS4Ne8ubzGkgjhIJoSSa9cVTpN5I2J2+Gl/1Pw6ptzYbqBzQ3k
 edSVxWzgNT54iSL2LZZQC4zraTUTyn6NpMjVMGty8Mwt+QIqbp983PvGhyoDiHu/Qei7J2
 xEiOtyYlyy9u1v/NGC5CwH+dtht6Y2g=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-34-0rudA-iVMV6ZdAyXt0xZ4g-1; Thu, 01 Jul 2021 00:13:29 -0400
X-MC-Unique: 0rudA-iVMV6ZdAyXt0xZ4g-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id ADEB8100C611;
 Thu,  1 Jul 2021 04:13:28 +0000 (UTC)
Received: from scv.redhat.com (ovpn-118-71.rdu2.redhat.com [10.10.118.71])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A5FCE69CB4;
 Thu,  1 Jul 2021 04:13:27 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 06/20] python/aqmp: add generic async message-based protocol
 support
Date: Thu,  1 Jul 2021 00:12:59 -0400
Message-Id: <20210701041313.1696009-7-jsnow@redhat.com>
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

This is the bare minimum that you need to establish a full-duplex async
message-based protocol with Python's asyncio.

The features to be added in forthcoming commits are:

- Runstate tracking
- Logging
- Support for incoming connections via accept()
- _cb_outbound, _cb_inbound message hooks
- _readline() method

Signed-off-by: John Snow <jsnow@redhat.com>

---

A note for reviewers: If you believe that it is unsafe to call
certain methods at certain times, you're absolutely correct!
These interfaces are protected in the following commit.

Some of the docstrings have dangling references, but they will resolve
themselves within the next few commits. Forgive me for not wanting to
rewrite them ... !

Signed-off-by: John Snow <jsnow@redhat.com>
---
 python/qemu/aqmp/__init__.py |   4 +-
 python/qemu/aqmp/protocol.py | 523 +++++++++++++++++++++++++++++++++++
 python/qemu/aqmp/util.py     |  54 ++++
 3 files changed, 580 insertions(+), 1 deletion(-)
 create mode 100644 python/qemu/aqmp/protocol.py

diff --git a/python/qemu/aqmp/__init__.py b/python/qemu/aqmp/__init__.py
index 8e955d784d..e003c898bd 100644
--- a/python/qemu/aqmp/__init__.py
+++ b/python/qemu/aqmp/__init__.py
@@ -22,12 +22,14 @@
 # the COPYING file in the top-level directory.
 
 from .error import AQMPError, MultiException
+from .protocol import ConnectError
 
 
 # The order of these fields impact the Sphinx documentation order.
 __all__ = (
-    # Exceptions
+    # Exceptions, most generic to most explicit
     'AQMPError',
+    'ConnectError',
 
     # Niche topics
     'MultiException',
diff --git a/python/qemu/aqmp/protocol.py b/python/qemu/aqmp/protocol.py
new file mode 100644
index 0000000000..beb7e12d9c
--- /dev/null
+++ b/python/qemu/aqmp/protocol.py
@@ -0,0 +1,523 @@
+"""
+Generic Asynchronous Message-based Protocol Support
+
+This module provides a generic framework for sending and receiving
+messages over an asyncio stream. `AsyncProtocol` is an abstract class
+that implements the core mechanisms of a simple send/receive protocol,
+and is designed to be extended.
+
+In this package, it is used as the implementation for the
+:py:class:`~qmp_protocol.QMP` class.
+"""
+
+import asyncio
+from asyncio import StreamReader, StreamWriter
+from ssl import SSLContext
+# import exceptions will be removed in a forthcoming commit.
+# The problem stems from pylint/flake8 believing that 'Any'
+# is unused because of its only use in a string-quoted type.
+from typing import (  # pylint: disable=unused-import # noqa
+    Any,
+    Awaitable,
+    Callable,
+    Generic,
+    List,
+    Optional,
+    Tuple,
+    TypeVar,
+    Union,
+)
+
+from .error import AQMPError, MultiException
+from .util import (
+    bottom_half,
+    create_task,
+    flush,
+    is_closing,
+    upper_half,
+    wait_closed,
+    wait_task_done,
+)
+
+
+T = TypeVar('T')
+_TaskFN = Callable[[], Awaitable[None]]  # aka ``async def func() -> None``
+_FutureT = TypeVar('_FutureT', bound=Optional['asyncio.Future[Any]'])
+
+
+class ConnectError(AQMPError):
+    """
+    Raised when the initial connection process has failed.
+
+    This Exception always wraps a "root cause" exception that can be
+    interrogated for additional information.
+
+    :param error_message: Human-readable string describing the error.
+    :param exc: The root-cause exception.
+    """
+    def __init__(self, error_message: str, exc: Exception):
+        super().__init__(error_message)
+        #: Human-readable error string
+        self.error_message: str = error_message
+        #: Wrapped root cause exception
+        self.exc: Exception = exc
+
+    def __str__(self) -> str:
+        return f"{self.error_message}: {self.exc!s}"
+
+
+class AsyncProtocol(Generic[T]):
+    """
+    AsyncProtocol implements a generic async message-based protocol.
+
+    This protocol assumes the basic unit of information transfer between
+    client and server is a "message", the details of which are left up
+    to the implementation. It assumes the sending and receiving of these
+    messages is full-duplex and not necessarily correlated; i.e. it
+    supports asynchronous inbound messages.
+
+    It is designed to be extended by a specific protocol which provides
+    the implementations for how to read and send messages. These must be
+    defined in `_do_recv()` and `_do_send()`, respectively.
+
+    Other callbacks have a default implementation, but are intended to be
+    either extended or overridden:
+
+     - `_begin_new_session`:
+         The base implementation starts the reader/writer tasks.
+         A protocol implementation can override this call, inserting
+         actions to be taken prior to starting the reader/writer tasks
+         before the super() call; actions needing to occur afterwards
+         can be written after the super() call.
+     - `_on_message`:
+         Actions to be performed when a message is received.
+    """
+    # pylint: disable=too-many-instance-attributes
+
+    # -------------------------
+    # Section: Public interface
+    # -------------------------
+
+    def __init__(self) -> None:
+        # stream I/O
+        self._reader: Optional[StreamReader] = None
+        self._writer: Optional[StreamWriter] = None
+
+        # Outbound Message queue
+        self._outgoing: asyncio.Queue[T] = asyncio.Queue()
+
+        # Special, long-running tasks:
+        self._reader_task: Optional[asyncio.Future[None]] = None
+        self._writer_task: Optional[asyncio.Future[None]] = None
+
+        # Aggregate of the above tasks; this is useful for Exception
+        # aggregation when leaving the loop and ensuring that all tasks
+        # are done.
+        self._bh_tasks: Optional[asyncio.Future[Tuple[
+            Optional[BaseException],
+            Optional[BaseException],
+        ]]] = None
+
+        #: Disconnect task. The disconnect implementation runs in a task
+        #: so that asynchronous disconnects (initiated by the
+        #: reader/writer) are allowed to wait for the reader/writers to
+        #: exit.
+        self._dc_task: Optional[asyncio.Future[None]] = None
+
+    @upper_half
+    async def connect(self, address: Union[str, Tuple[str, int]],
+                      ssl: Optional[SSLContext] = None) -> None:
+        """
+        Connect to the server and begin processing message queues.
+
+        If this call fails, `runstate` is guaranteed to be set back to `IDLE`.
+
+        :param address:
+            Address to connect to; UNIX socket path or TCP address/port.
+        :param ssl: SSL context to use, if any.
+
+        :raise StateError: When the `Runstate` is not `IDLE`.
+        :raise ConnectError: If a connection cannot be made to the server.
+        """
+        await self._new_session(address, ssl)
+
+    @upper_half
+    async def disconnect(self, force: bool = False) -> None:
+        """
+        Disconnect and wait for all tasks to fully stop.
+
+        If there were exceptions that caused the reader/writers to terminate
+        prematurely, they will be raised here.
+
+        :param force:
+            When `False`, drain the outgoing message queue first before
+            terminating execution. When `True`, terminate immediately.
+
+        :raise Exception: When the reader or writer terminate unexpectedly.
+        :raise MultiException:
+            When both the reader and writer terminate unexpectedly. This
+            exception is iterable and multiplexes both root cause exceptions.
+        """
+        self._schedule_disconnect(force)
+        await self._wait_disconnect()
+
+    # --------------------------
+    # Section: Session machinery
+    # --------------------------
+
+    @upper_half
+    async def _new_session(self,
+                           address: Union[str, Tuple[str, int]],
+                           ssl: Optional[SSLContext] = None) -> None:
+        """
+        Establish a new connection and initialize the session.
+
+        Connect or accept a new connection, then begin the protocol
+        session machinery. If this call fails, `runstate` is guaranteed
+        to be set back to `IDLE`.
+
+        :param address:
+            Address to connect to;
+            UNIX socket path or TCP address/port.
+        :param ssl: SSL context to use, if any.
+
+        :raise ConnectError:
+            When a connection or session cannot be established.
+
+            This exception will wrap a more concrete one. In most cases,
+            the wrapped exception will be `OSError` or `EOFError`. If a
+            protocol-level failure occurs while establishing a new
+            session, the wrapped error may also be an `AQMPError`.
+        """
+        self._outgoing = asyncio.Queue()
+
+        phase = "connection"
+        try:
+            await self._do_connect(address, ssl)
+
+            phase = "session"
+            await self._begin_new_session()
+
+        except Exception as err:
+            # Reset from CONNECTING back to IDLE.
+            await self.disconnect()
+            emsg = f"Failed to establish {phase}"
+            raise ConnectError(emsg, err) from err
+
+    @upper_half
+    async def _do_connect(self, address: Union[str, Tuple[str, int]],
+                          ssl: Optional[SSLContext] = None) -> None:
+        """
+        Acting as the transport client, initiate a connection to a server.
+
+        :param address:
+            Address to connect to; UNIX socket path or TCP address/port.
+        :param ssl: SSL context to use, if any.
+
+        :raise OSError: For stream-related errors.
+        """
+        if isinstance(address, tuple):
+            connect = asyncio.open_connection(address[0], address[1], ssl=ssl)
+        else:
+            connect = asyncio.open_unix_connection(path=address, ssl=ssl)
+        self._reader, self._writer = await connect
+
+    @upper_half
+    async def _begin_new_session(self) -> None:
+        """
+        After a connection is established, start the bottom half machinery.
+        """
+        reader_coro = self._bh_loop_forever(self._bh_recv_message)
+        writer_coro = self._bh_loop_forever(self._bh_send_message)
+
+        self._reader_task = create_task(reader_coro)
+        self._writer_task = create_task(writer_coro)
+
+        self._bh_tasks = asyncio.gather(
+            self._reader_task,
+            self._writer_task,
+            return_exceptions=True,
+        )
+
+    @upper_half
+    @bottom_half
+    def _schedule_disconnect(self, force: bool = False) -> None:
+        """
+        Initiate a disconnect; idempotent.
+
+        This method is used both in the upper-half as a direct
+        consequence of `disconnect()`, and in the bottom-half in the
+        case of unhandled exceptions in the reader/writer tasks.
+
+        It can be invoked no matter what the `runstate` is.
+
+        :param force:
+            When `False`, drain the outgoing message queue first before
+            terminating execution. When `True`, terminate immediately.
+        """
+        if not self._dc_task:
+            self._dc_task = create_task(self._bh_disconnect(force))
+
+    @upper_half
+    def _results(self) -> None:
+        """
+        Raises exception(s) from the finished tasks, if any.
+
+        Called to fully quiesce the reader/writer. In the event of an
+        intentional cancellation by the user that completes gracefully,
+        this method will not raise any exceptions.
+
+        In the event that both the reader and writer task should fail,
+        a `MultiException` will be raised containing both exceptions.
+
+        :raise Exception:
+            Arbitrary exceptions re-raised on behalf of a failing Task.
+        :raise MultiException:
+            Iterable Exception used to multiplex multiple exceptions in the
+            event that multiple Tasks failed with non-cancellation reasons.
+        """
+        exceptions: List[BaseException] = []
+
+        assert self._bh_tasks is None or self._bh_tasks.done()
+        results = self._bh_tasks.result() if self._bh_tasks else ()
+
+        for result in results:
+            if result is None:
+                continue
+            exceptions.append(result)
+
+        if len(exceptions) == 1:
+            raise exceptions.pop()
+        if len(exceptions) > 1:
+            # This is possible in theory, but I am not sure if it can
+            # occur in practice. The reader could suffer an Exception
+            # and then immediately schedule a disconnect. That
+            # disconnect is not guaranteed to run immediately, so the
+            # writer could be scheduled immediately afterwards instead
+            # of the disconnect task, and encounter another exception.
+            #
+            # An improved solution may be to raise the *first* exception
+            # which occurs, leaving the *second* exception to be merely
+            # logged. Still, what if the caller wants to interrogate
+            # that second exception?
+            raise MultiException(exceptions)
+
+    @upper_half
+    async def _wait_disconnect(self) -> None:
+        """
+        Waits for a previously scheduled disconnect to finish.
+
+        This method will gather any bottom half exceptions and
+        re-raise them; so it is intended to be used in the upper half
+        call chain.
+
+        If a single exception is encountered, it will be re-raised
+        faithfully.  If multiple are found, they will be multiplexed
+        into a `MultiException`.
+
+        :raise Exception:
+            Arbitrary exceptions re-raised on behalf of a failing Task.
+        :raise MultiException:
+            Iterable Exception used to multiplex multiple exceptions in the
+            event that multiple Tasks failed with non-cancellation reasons.
+        """
+        assert self._dc_task
+        await self._dc_task
+        self._dc_task = None
+
+        try:
+            self._results()  # Raises BH errors here.
+        finally:
+            self._cleanup()
+
+    @upper_half
+    def _cleanup(self) -> None:
+        """
+        Fully reset this object to a clean state and return to `IDLE`.
+        """
+        def _paranoid_task_erase(task: _FutureT) -> Optional[_FutureT]:
+            # Help to erase a task, ENSURING it is fully quiesced first.
+            assert (task is None) or task.done()
+            return None if (task and task.done()) else task
+
+        self._dc_task = _paranoid_task_erase(self._dc_task)
+        self._reader_task = _paranoid_task_erase(self._reader_task)
+        self._writer_task = _paranoid_task_erase(self._writer_task)
+        self._bh_tasks = _paranoid_task_erase(self._bh_tasks)
+
+        self._reader = None
+        self._writer = None
+
+    # ----------------------------
+    # Section: Bottom Half methods
+    # ----------------------------
+
+    @bottom_half
+    async def _bh_disconnect(self, force: bool = False) -> None:
+        """
+        Disconnect and cancel all outstanding tasks.
+
+        It is designed to be called from its task context,
+        :py:obj:`~AsyncProtocol._dc_task`. By running in its own task,
+        it is free to wait on any pending actions that may still need to
+        occur in either the reader or writer tasks.
+
+        :param force:
+            When `False`, drain the outgoing message queue first before
+            terminating execution. When `True`, terminate immediately.
+
+        """
+        await self._bh_stop_writer(force)
+        await self._bh_stop_reader()
+
+        # Next, close the writer stream itself.
+        # This implicitly closes the reader, too.
+        if self._writer:
+            if not is_closing(self._writer):
+                self._writer.close()
+            await wait_closed(self._writer)
+
+    @bottom_half
+    async def _bh_stop_writer(self, force: bool = False) -> None:
+        # If we're not in a hurry, drain the outbound queue.
+        if self._writer_task and not self._writer_task.done():
+            if not force:
+                await self._outgoing.join()
+                assert self._writer is not None
+                await flush(self._writer)
+
+        # Cancel the writer task.
+        if self._writer_task and not self._writer_task.done():
+            self._writer_task.cancel()
+        await wait_task_done(self._writer_task)
+
+    @bottom_half
+    async def _bh_stop_reader(self) -> None:
+        if self._reader_task and not self._reader_task.done():
+            self._reader_task.cancel()
+        await wait_task_done(self._reader_task)
+
+    @bottom_half
+    async def _bh_loop_forever(self, async_fn: _TaskFN) -> None:
+        """
+        Run one of the bottom-half methods in a loop forever.
+
+        If the bottom half ever raises any exception, schedule a
+        disconnect that will terminate the entire loop.
+
+        :param async_fn: The bottom-half method to run in a loop.
+        """
+        try:
+            while True:
+                await async_fn()
+        except asyncio.CancelledError:
+            # We have been cancelled by _bh_disconnect, exit gracefully.
+            return
+        except BaseException:
+            self._schedule_disconnect(force=True)
+            raise
+
+    @bottom_half
+    async def _bh_send_message(self) -> None:
+        """
+        Wait for an outgoing message, then send it.
+
+        Designed to be run in `_bh_loop_forever()`.
+        """
+        msg = await self._outgoing.get()
+        try:
+            await self._send(msg)
+        finally:
+            self._outgoing.task_done()
+
+    @bottom_half
+    async def _bh_recv_message(self) -> None:
+        """
+        Wait for an incoming message and call `_on_message` to route it.
+
+        Designed to be run in `_bh_loop_forever()`.
+        """
+        msg = await self._recv()
+        await self._on_message(msg)
+
+    # --------------------
+    # Section: Message I/O
+    # --------------------
+
+    @upper_half
+    @bottom_half
+    async def _do_recv(self) -> T:
+        """
+        Abstract: Read from the stream and return a message.
+
+        Very low-level; intended to only be called by `_recv()`.
+        """
+        raise NotImplementedError
+
+    @upper_half
+    @bottom_half
+    async def _recv(self) -> T:
+        """
+        Read an arbitrary protocol message.
+
+        .. warning::
+            This method is intended primarily for `_bh_recv_message()`
+            to use in an asynchronous task loop. Using it outside of
+            this loop will "steal" messages from the normal routing
+            mechanism. It is safe to use prior to `_begin_new_session()`,
+            but should not be used otherwise.
+
+        This method uses `_do_recv()` to retrieve the raw message, and
+        then transforms it using `_cb_inbound()`.
+
+        :return: A single (filtered, processed) protocol message.
+        """
+        # A forthcoming commit makes this method less trivial.
+        return await self._do_recv()
+
+    @upper_half
+    @bottom_half
+    def _do_send(self, msg: T) -> None:
+        """
+        Abstract: Write a message to the stream.
+
+        Very low-level; intended to only be called by `_send()`.
+        """
+        raise NotImplementedError
+
+    @upper_half
+    @bottom_half
+    async def _send(self, msg: T) -> None:
+        """
+        Send an arbitrary protocol message.
+
+        This method will transform any outgoing messages according to
+        `_cb_outbound()`.
+
+        .. warning::
+            Like `_recv()`, this method is intended to be called by
+            the writer task loop that processes outgoing
+            messages. Calling it directly may circumvent logic
+            implemented by the caller meant to correlate outgoing and
+            incoming messages.
+
+        :raise OSError: For problems with the underlying stream.
+        """
+        # A forthcoming commit makes this method less trivial.
+        self._do_send(msg)
+
+    @bottom_half
+    async def _on_message(self, msg: T) -> None:
+        """
+        Called to handle the receipt of a new message.
+
+        .. caution::
+            This is executed from within the reader loop, so be advised
+            that waiting on either the reader or writer task will lead
+            to deadlock. Additionally, any unhandled exceptions will
+            directly cause the loop to halt, so logic may be best-kept
+            to a minimum if at all possible.
+
+        :param msg: The incoming message
+        """
+        # Nothing to do in the abstract case.
diff --git a/python/qemu/aqmp/util.py b/python/qemu/aqmp/util.py
index c88a2201bc..9ea91f2862 100644
--- a/python/qemu/aqmp/util.py
+++ b/python/qemu/aqmp/util.py
@@ -12,6 +12,7 @@
     Coroutine,
     Optional,
     TypeVar,
+    cast,
 )
 
 
@@ -57,6 +58,20 @@ def is_closing(writer: asyncio.StreamWriter) -> bool:
     return transport.is_closing()
 
 
+async def flush(writer: asyncio.StreamWriter) -> None:
+    """
+    Utility function to ensure a StreamWriter is *fully* drained.
+
+    `asyncio.StreamWriter.drain` only promises we will return to below
+    the "high-water mark". This function ensures we flush the entire
+    buffer.
+    """
+    transport = cast(asyncio.WriteTransport, writer.transport)
+
+    while transport.get_write_buffer_size() > 0:
+        await writer.drain()
+
+
 async def wait_closed(writer: asyncio.StreamWriter) -> None:
     """
     Python 3.6-compatible `asyncio.StreamWriter.wait_closed` wrapper.
@@ -75,3 +90,42 @@ async def wait_closed(writer: asyncio.StreamWriter) -> None:
             await asyncio.sleep(0.0)
         while transport.get_write_buffer_size() > 0:
             await asyncio.sleep(0.0)
+
+
+async def wait_task_done(task: Optional['asyncio.Future[Any]']) -> None:
+    """
+    Await a task to finish, but do not consume its result.
+
+    :param task: The task to await completion for.
+    """
+    while True:
+        if task and not task.done():
+            await asyncio.sleep(0)  # Yield
+        else:
+            break
+
+
+def upper_half(func: T) -> T:
+    """
+    Do-nothing decorator that annotates a method as an "upper-half" method.
+
+    These methods must not call bottom-half functions directly, but can
+    schedule them to run.
+    """
+    return func
+
+
+def bottom_half(func: T) -> T:
+    """
+    Do-nothing decorator that annotates a method as a "bottom-half" method.
+
+    These methods must take great care to handle their own exceptions whenever
+    possible. If they go unhandled, they will cause termination of the loop.
+
+    These methods do not, in general, have the ability to directly
+    report information to a caller's context and will usually be
+    collected as a Task result instead.
+
+    They must not call upper-half functions directly.
+    """
+    return func
-- 
2.31.1


