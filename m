Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E896B3CC047
	for <lists+qemu-devel@lfdr.de>; Sat, 17 Jul 2021 02:39:11 +0200 (CEST)
Received: from localhost ([::1]:52762 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m4YMJ-0001am-00
	for lists+qemu-devel@lfdr.de; Fri, 16 Jul 2021 20:39:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37494)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1m4YGZ-0004UY-6n
 for qemu-devel@nongnu.org; Fri, 16 Jul 2021 20:33:15 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:48862)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1m4YGW-0006Bt-Aw
 for qemu-devel@nongnu.org; Fri, 16 Jul 2021 20:33:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626481991;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=kvPl29LtvuKn3ku9Ibc2niPx8xDXoYFLarK+m7DaOKo=;
 b=HHA4iErOFevsU5Uu+9SuKQArQ/3M4lPGllsmPHu9Q4cDKxTbQCAat4rYnO5HwpmrpGaUnm
 7l6uXtS3rbUfZcawXn28yngSCPbA6fyOdIGQh++xVhkpeqkVT6+WgMJh+s0jCKWrfZBF24
 U+tvtdYkOaV3s8KATfnLX27fiiYbH18=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-58-l--pYhAQPAqDwkGEkPGRwA-1; Fri, 16 Jul 2021 20:33:10 -0400
X-MC-Unique: l--pYhAQPAqDwkGEkPGRwA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 25AC51835AC3;
 Sat, 17 Jul 2021 00:33:09 +0000 (UTC)
Received: from scv.redhat.com (ovpn-119-183.rdu2.redhat.com [10.10.119.183])
 by smtp.corp.redhat.com (Postfix) with ESMTP id EEF3F5C1A1;
 Sat, 17 Jul 2021 00:33:07 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 05/24] python/aqmp: add generic async message-based
 protocol support
Date: Fri, 16 Jul 2021 20:32:34 -0400
Message-Id: <20210717003253.457418-6-jsnow@redhat.com>
In-Reply-To: <20210717003253.457418-1-jsnow@redhat.com>
References: <20210717003253.457418-1-jsnow@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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

This is the bare minimum that you need to establish a full-duplex async
message-based protocol with Python's asyncio.

The features to be added in forthcoming commits are:

- Runstate tracking
- Logging
- Support for incoming connections via accept()
- _cb_outbound, _cb_inbound message hooks
- _readline() method

Some of the docstrings have dangling references, but they will resolve
themselves within the next few commits, and have been tested at the
conclusion of this series.

A note on the broad-except in _bh_disconnect:

I'm not sure if there's a more elegant solution here, but the problem is
that if an Exception occurred in the underlying
StreamReader/StreamWriter and causes one of the tasks to fail and
schedule a disconnect, the disconnect method itself will re-stumble
across the exact same Exception when attempting to close/flush the
stream.

Ignoring this Exception means we *might* miss a brand new Exception that
we didn't see already, but as we are in the process of tearing down the
connection anyway, I don't believe it matters. This stanza only really
cares that the writer is flushed and closed -- If it raises an
Exception, we know for sure it is not active and running.

Signed-off-by: John Snow <jsnow@redhat.com>
---
 python/qemu/aqmp/__init__.py |   4 +-
 python/qemu/aqmp/protocol.py | 508 +++++++++++++++++++++++++++++++++++
 python/qemu/aqmp/util.py     |  26 ++
 3 files changed, 537 insertions(+), 1 deletion(-)
 create mode 100644 python/qemu/aqmp/protocol.py

diff --git a/python/qemu/aqmp/__init__.py b/python/qemu/aqmp/__init__.py
index c97be950bf4..5c0de72672d 100644
--- a/python/qemu/aqmp/__init__.py
+++ b/python/qemu/aqmp/__init__.py
@@ -22,10 +22,12 @@
 # the COPYING file in the top-level directory.
 
 from .error import AQMPError
+from .protocol import ConnectError
 
 
 # The order of these fields impact the Sphinx documentation order.
 __all__ = (
-    # Exceptions
+    # Exceptions, most generic to most explicit
     'AQMPError',
+    'ConnectError',
 )
diff --git a/python/qemu/aqmp/protocol.py b/python/qemu/aqmp/protocol.py
new file mode 100644
index 00000000000..5413f4e50c1
--- /dev/null
+++ b/python/qemu/aqmp/protocol.py
@@ -0,0 +1,508 @@
+"""
+Generic Asynchronous Message-based Protocol Support
+
+This module provides a generic framework for sending and receiving
+messages over an asyncio stream. `AsyncProtocol` is an abstract class
+that implements the core mechanisms of a simple send/receive protocol,
+and is designed to be extended.
+
+In this package, it is used as the implementation for the `QMPClient`
+class.
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
+    Optional,
+    Tuple,
+    TypeVar,
+    Union,
+)
+
+from .error import AQMPError
+from .util import (
+    bottom_half,
+    create_task,
+    flush,
+    is_closing,
+    upper_half,
+    wait_closed,
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
+     - `_establish_session`:
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
+        self._outgoing: asyncio.Queue[T]
+
+        # Special, long-running tasks:
+        self._reader_task: Optional[asyncio.Future[None]] = None
+        self._writer_task: Optional[asyncio.Future[None]] = None
+
+        # Aggregate of the above two tasks, used for Exception management.
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
+    async def disconnect(self) -> None:
+        """
+        Disconnect and wait for all tasks to fully stop.
+
+        If there were was an exception that caused the reader/writers to
+        terminate prematurely, it will be raised here.
+
+        :raise Exception: When the reader or writer terminate unexpectedly.
+        """
+        self._schedule_disconnect()
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
+        try:
+            phase = "connection"
+            await self._establish_connection(address, ssl)
+
+            phase = "session"
+            await self._establish_session()
+
+        except BaseException as err:
+            emsg = f"Failed to establish {phase}"
+            await self.disconnect()
+
+            # NB: CancelledError is not a BaseException before Python 3.8
+            if isinstance(err, asyncio.CancelledError):
+                raise
+
+            if isinstance(err, Exception):
+                raise ConnectError(emsg, err) from err
+
+            # Raise BaseExceptions un-wrapped, they're more important.
+            raise
+
+    @upper_half
+    async def _establish_connection(
+            self,
+            address: Union[str, Tuple[str, int]],
+            ssl: Optional[SSLContext] = None,
+    ) -> None:
+        """
+        Establish a new connection.
+
+        :param address:
+            Address to connect to/listen on;
+            UNIX socket path or TCP address/port.
+        :param ssl: SSL context to use, if any.
+        """
+        await self._do_connect(address, ssl)
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
+    async def _establish_session(self) -> None:
+        """
+        Establish a new session.
+
+        Starts the readers/writer tasks; subclasses may perform their
+        own negotiations here. The Runstate will be RUNNING upon
+        successful conclusion.
+        """
+        self._outgoing = asyncio.Queue()
+
+        reader_coro = self._bh_loop_forever(self._bh_recv_message)
+        writer_coro = self._bh_loop_forever(self._bh_send_message)
+
+        self._reader_task = create_task(reader_coro)
+        self._writer_task = create_task(writer_coro)
+
+        self._bh_tasks = asyncio.gather(
+            self._reader_task,
+            self._writer_task,
+        )
+
+    @upper_half
+    @bottom_half
+    def _schedule_disconnect(self) -> None:
+        """
+        Initiate a disconnect; idempotent.
+
+        This method is used both in the upper-half as a direct
+        consequence of `disconnect()`, and in the bottom-half in the
+        case of unhandled exceptions in the reader/writer tasks.
+
+        It can be invoked no matter what the `runstate` is.
+        """
+        if not self._dc_task:
+            self._dc_task = create_task(self._bh_disconnect())
+
+    @upper_half
+    async def _wait_disconnect(self) -> None:
+        """
+        Waits for a previously scheduled disconnect to finish.
+
+        This method will gather any bottom half exceptions and re-raise
+        the one that occurred first; presuming it to be the root cause
+        of any subsequent Exceptions. It is intended to be used in the
+        upper half of the call chain.
+
+        :raise Exception:
+            Arbitrary exception re-raised on behalf of the reader/writer.
+        """
+        assert self._dc_task
+
+        try:
+            await self._dc_task
+            if self._bh_tasks:
+                await self._bh_tasks  # Raise exception from reader/writer
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
+    async def _bh_disconnect(self) -> None:
+        """
+        Disconnect and cancel all outstanding tasks.
+
+        It is designed to be called from its task context,
+        :py:obj:`~AsyncProtocol._dc_task`. By running in its own task,
+        it is free to wait on any pending actions that may still need to
+        occur in either the reader or writer tasks.
+        """
+
+        def _done(task: Optional['asyncio.Future[Any]']) -> bool:
+            return task is not None and task.done()
+
+        def _exception(
+                task: Optional['asyncio.Future[Any]']
+        ) -> Optional[BaseException]:
+            if task is None or not task.done():
+                return None
+            return task.exception()
+
+        # NB: We can't rely on _bh_tasks being done() here, it may not
+        #     yet have had a chance to run and gather itself.
+        error_pathway = _done(self._reader_task) or _done(self._writer_task)
+
+        await self._bh_stop_writer(error_pathway)
+        await self._bh_stop_reader()
+
+        # Next, close the writer stream itself.
+        # This implicitly closes the reader, too.
+        if self._writer:
+            if not is_closing(self._writer):
+                self._writer.close()
+
+            try:
+                await wait_closed(self._writer)
+            except Exception as err:  # pylint: disable=broad-except
+                # Waiting for the stream to close if the underlying transport
+                # has already raised an Exception will unfortunately re-raise
+                # that Exception, which it shares with the StreamReader.
+                if all((err is not _exception(task) for task in (
+                        self._reader_task, self._writer_task))):
+                    raise
+
+    @bottom_half
+    async def _bh_stop_writer(self, force: bool = False) -> None:
+        if not self._writer_task or self._writer_task.done():
+            return
+
+        # If we're not in a hurry, drain the outbound queue.
+        if not force:
+            await self._outgoing.join()
+            if self._writer is not None:
+                await flush(self._writer)
+
+        self._writer_task.cancel()
+        # Waits for the writer to finish but does NOT raise its exception.
+        await asyncio.wait((self._writer_task,))
+
+    @bottom_half
+    async def _bh_stop_reader(self) -> None:
+        if not self._reader_task or self._reader_task.done():
+            return
+
+        self._reader_task.cancel()
+        # Waits for the reader to finish but does NOT raise its exception.
+        await asyncio.wait((self._reader_task,))
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
+            self._schedule_disconnect()
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
+            mechanism. It is safe to use prior to `_establish_session()`,
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
index 7e7c2584d2b..88abfc9eb22 100644
--- a/python/qemu/aqmp/util.py
+++ b/python/qemu/aqmp/util.py
@@ -46,6 +46,32 @@ async def flush(writer: asyncio.StreamWriter) -> None:
         transport.set_write_buffer_limits(high, low)
 
 
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
+    report information to a caller’s context and will usually be
+    collected as a Task result instead.
+
+    They must not call upper-half functions directly.
+    """
+    return func
+
+
 # -------------------------------
 # Section: Compatibility Wrappers
 # -------------------------------
-- 
2.31.1


