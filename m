Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B3513B8CD2
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Jul 2021 06:15:08 +0200 (CEST)
Received: from localhost ([::1]:41116 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lyo6V-0002s6-Eg
	for lists+qemu-devel@lfdr.de; Thu, 01 Jul 2021 00:15:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42314)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lyo53-0008Sm-65
 for qemu-devel@nongnu.org; Thu, 01 Jul 2021 00:13:37 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:22587)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lyo50-0000iN-TF
 for qemu-devel@nongnu.org; Thu, 01 Jul 2021 00:13:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1625112814;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Bxg1hx/6n92aih6fXSibqMb6ZUcqzAfwooFlRpGuGVs=;
 b=hjb1bJuxPTtA0X9K5/H5qwlCmmHiXtOj+KKUaEZDnAOtVM86X14g5/+89g+e0WTlT5WZ+c
 MgRBqDuAMLhHb9UXHfwWitZtFViYAYAgrSquXSpQriMvmrp0nkZcLIJJQCcAyiUF4hb7oN
 l3i4HStnNa+fRGqCDQ41M9BPmI/DmX0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-58-QswAubjBNKe0JHlnUgDMvQ-1; Thu, 01 Jul 2021 00:13:32 -0400
X-MC-Unique: QswAubjBNKe0JHlnUgDMvQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 916A91084F5A;
 Thu,  1 Jul 2021 04:13:31 +0000 (UTC)
Received: from scv.redhat.com (ovpn-118-71.rdu2.redhat.com [10.10.118.71])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 63A7169CB4;
 Thu,  1 Jul 2021 04:13:30 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 08/20] python/aqmp: add logging to AsyncProtocol
Date: Thu,  1 Jul 2021 00:13:01 -0400
Message-Id: <20210701041313.1696009-9-jsnow@redhat.com>
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

Give the connection and the reader/writer tasks nicknames, and add
logging statements throughout.

Signed-off-by: John Snow <jsnow@redhat.com>
---
 python/qemu/aqmp/protocol.py | 64 ++++++++++++++++++++++++++++++++----
 python/qemu/aqmp/util.py     | 32 ++++++++++++++++++
 2 files changed, 90 insertions(+), 6 deletions(-)

diff --git a/python/qemu/aqmp/protocol.py b/python/qemu/aqmp/protocol.py
index a99a191982..dd8564ee02 100644
--- a/python/qemu/aqmp/protocol.py
+++ b/python/qemu/aqmp/protocol.py
@@ -14,6 +14,7 @@
 from asyncio import StreamReader, StreamWriter
 from enum import Enum
 from functools import wraps
+import logging
 from ssl import SSLContext
 from typing import (
     Any,
@@ -34,6 +35,7 @@
     create_task,
     flush,
     is_closing,
+    pretty_traceback,
     upper_half,
     wait_closed,
     wait_task_done,
@@ -174,14 +176,28 @@ class AsyncProtocol(Generic[T]):
          can be written after the super() call.
      - `_on_message`:
          Actions to be performed when a message is received.
+
+    :param name:
+        Name used for logging messages, if any. By default, messages
+        will log to 'qemu.aqmp.protocol', but each individual connection
+        can be given its own logger by giving it a name; messages will
+        then log to 'qemu.aqmp.protocol.${name}'.
     """
     # pylint: disable=too-many-instance-attributes
 
+    #: Logger object for debugging messages from this connection.
+    logger = logging.getLogger(__name__)
+
     # -------------------------
     # Section: Public interface
     # -------------------------
 
-    def __init__(self) -> None:
+    def __init__(self, name: Optional[str] = None) -> None:
+        #: The nickname for this connection, if any.
+        self.name: Optional[str] = name
+        if self.name is not None:
+            self.logger = self.logger.getChild(self.name)
+
         # stream I/O
         self._reader: Optional[StreamReader] = None
         self._writer: Optional[StreamWriter] = None
@@ -212,6 +228,15 @@ def __init__(self) -> None:
         #: An `asyncio.Event` that signals when `runstate` is changed.
         self.runstate_changed: asyncio.Event = asyncio.Event()
 
+    def __repr__(self) -> str:
+        argstr = ''
+        if self.name is not None:
+            argstr += f"name={self.name}"
+        return "{:s}({:s})".format(
+            type(self).__name__,
+            argstr,
+        )
+
     @property
     def runstate(self) -> Runstate:
         """The current `Runstate` of the connection."""
@@ -301,6 +326,8 @@ async def _new_session(self,
         assert self.runstate == Runstate.IDLE
         self._set_state(Runstate.CONNECTING)
 
+        if not self._outgoing.empty():
+            self.logger.warning("Outgoing message queue was not empty!")
         self._outgoing = asyncio.Queue()
 
         phase = "connection"
@@ -311,9 +338,15 @@ async def _new_session(self,
             await self._begin_new_session()
 
         except Exception as err:
-            # Reset from CONNECTING back to IDLE.
-            await self.disconnect()
             emsg = f"Failed to establish {phase}"
+            self.logger.error("%s:\n%s\n", emsg, pretty_traceback())
+            try:
+                # Reset from CONNECTING back to IDLE.
+                await self.disconnect()
+            except:
+                emsg = "Unexpected bottom half exceptions"
+                self.logger.error("%s:\n%s\n", emsg, pretty_traceback())
+                raise
             raise ConnectError(emsg, err) from err
 
         assert self.runstate == Runstate.RUNNING
@@ -330,12 +363,16 @@ async def _do_connect(self, address: Union[str, Tuple[str, int]],
 
         :raise OSError: For stream-related errors.
         """
+        self.logger.debug("Connecting ...")
+
         if isinstance(address, tuple):
             connect = asyncio.open_connection(address[0], address[1], ssl=ssl)
         else:
             connect = asyncio.open_unix_connection(path=address, ssl=ssl)
         self._reader, self._writer = await connect
 
+        self.logger.debug("Connected.")
+
     @upper_half
     async def _begin_new_session(self) -> None:
         """
@@ -343,8 +380,8 @@ async def _begin_new_session(self) -> None:
         """
         assert self.runstate == Runstate.CONNECTING
 
-        reader_coro = self._bh_loop_forever(self._bh_recv_message)
-        writer_coro = self._bh_loop_forever(self._bh_send_message)
+        reader_coro = self._bh_loop_forever(self._bh_recv_message, 'Reader')
+        writer_coro = self._bh_loop_forever(self._bh_send_message, 'Writer')
 
         self._reader_task = create_task(reader_coro)
         self._writer_task = create_task(writer_coro)
@@ -374,6 +411,7 @@ def _schedule_disconnect(self, force: bool = False) -> None:
             terminating execution. When `True`, terminate immediately.
         """
         if not self._dc_task:
+            self.logger.debug("scheduling disconnect.")
             self._dc_task = create_task(self._bh_disconnect(force))
 
     @upper_half
@@ -499,8 +537,13 @@ async def _bh_disconnect(self, force: bool = False) -> None:
         # This implicitly closes the reader, too.
         if self._writer:
             if not is_closing(self._writer):
+                self.logger.debug("Closing StreamWriter.")
                 self._writer.close()
+            self.logger.debug("Waiting for writer to close.")
             await wait_closed(self._writer)
+            self.logger.debug("Writer closed.")
+
+        self.logger.debug("Disconnected.")
 
     @bottom_half
     async def _bh_stop_writer(self, force: bool = False) -> None:
@@ -513,17 +556,19 @@ async def _bh_stop_writer(self, force: bool = False) -> None:
 
         # Cancel the writer task.
         if self._writer_task and not self._writer_task.done():
+            self.logger.debug("Cancelling writer task.")
             self._writer_task.cancel()
         await wait_task_done(self._writer_task)
 
     @bottom_half
     async def _bh_stop_reader(self) -> None:
         if self._reader_task and not self._reader_task.done():
+            self.logger.debug("Cancelling reader task.")
             self._reader_task.cancel()
         await wait_task_done(self._reader_task)
 
     @bottom_half
-    async def _bh_loop_forever(self, async_fn: _TaskFN) -> None:
+    async def _bh_loop_forever(self, async_fn: _TaskFN, name: str) -> None:
         """
         Run one of the bottom-half methods in a loop forever.
 
@@ -531,16 +576,23 @@ async def _bh_loop_forever(self, async_fn: _TaskFN) -> None:
         disconnect that will terminate the entire loop.
 
         :param async_fn: The bottom-half method to run in a loop.
+        :param name: The name of this task, used for logging.
         """
         try:
             while True:
                 await async_fn()
         except asyncio.CancelledError:
             # We have been cancelled by _bh_disconnect, exit gracefully.
+            self.logger.debug("Task.%s: cancelled.", name)
             return
         except BaseException:
+            self.logger.error(
+                "Task.%s: failure:\n%s\n", name, pretty_traceback()
+            )
             self._schedule_disconnect(force=True)
             raise
+        finally:
+            self.logger.debug("Task.%s: exiting.", name)
 
     @bottom_half
     async def _bh_send_message(self) -> None:
diff --git a/python/qemu/aqmp/util.py b/python/qemu/aqmp/util.py
index 9ea91f2862..2311be5893 100644
--- a/python/qemu/aqmp/util.py
+++ b/python/qemu/aqmp/util.py
@@ -3,10 +3,14 @@
 
 This module primarily provides compatibility wrappers for Python 3.6 to
 provide some features that otherwise become available in Python 3.7+.
+
+It additionally provides `pretty_traceback()`, used for formatting
+tracebacks for inclusion in the logging stream.
 """
 
 import asyncio
 import sys
+import traceback
 from typing import (
     Any,
     Coroutine,
@@ -105,6 +109,34 @@ async def wait_task_done(task: Optional['asyncio.Future[Any]']) -> None:
             break
 
 
+def pretty_traceback(prefix: str = "  | ") -> str:
+    """
+    Formats the current traceback, indented to provide visual distinction.
+
+    This is useful for printing a traceback within a traceback for
+    debugging purposes when encapsulating errors to deliver them up the
+    stack; when those errors are printed, this helps provide a nice
+    visual grouping to quickly identify the parts of the error that
+    belong to the inner exception.
+
+    :param prefix: The prefix to append to each line of the traceback.
+    :return: A string, formatted something like the following::
+
+      | Traceback (most recent call last):
+      |   File "foobar.py", line 42, in arbitrary_example
+      |     foo.baz()
+      | ArbitraryError: [Errno 42] Something bad happened!
+    """
+    output = "".join(traceback.format_exception(*sys.exc_info()))
+
+    exc_lines = []
+    for line in output.split('\n'):
+        exc_lines.append(prefix + line)
+
+    # The last line is always empty, omit it
+    return "\n".join(exc_lines[:-1])
+
+
 def upper_half(func: T) -> T:
     """
     Do-nothing decorator that annotates a method as an "upper-half" method.
-- 
2.31.1


