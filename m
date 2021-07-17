Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 24BA23CC04B
	for <lists+qemu-devel@lfdr.de>; Sat, 17 Jul 2021 02:42:57 +0200 (CEST)
Received: from localhost ([::1]:32782 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m4YPv-0007RC-UL
	for lists+qemu-devel@lfdr.de; Fri, 16 Jul 2021 20:42:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37538)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1m4YGe-0004iI-DL
 for qemu-devel@nongnu.org; Fri, 16 Jul 2021 20:33:20 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:54953)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1m4YGc-0006Ga-DR
 for qemu-devel@nongnu.org; Fri, 16 Jul 2021 20:33:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626481997;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2thvYTUb2AxxpBuH11DWAFBdww3O5S8KmNCv8dVoICA=;
 b=SWrkxCKSdopF0oS93ciEfLsHSeEs4T6I27KpGmW8NOQt/Qjb4UGBD7cdnzDBJfvrbaHE9h
 oRc+eHfw5bqS8jhKh1wVsN5jdLWM2hLSSAZhj9pRCEKo4KU9p6AX66N+/5m4jziC+35iZH
 KBbEusMoBLJaaRnRuuVAbF9ucSVmcJY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-569-ynObDOtWMYygVz61BpWWmA-1; Fri, 16 Jul 2021 20:33:16 -0400
X-MC-Unique: ynObDOtWMYygVz61BpWWmA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2B787362F9;
 Sat, 17 Jul 2021 00:33:15 +0000 (UTC)
Received: from scv.redhat.com (ovpn-119-183.rdu2.redhat.com [10.10.119.183])
 by smtp.corp.redhat.com (Postfix) with ESMTP id CF5F05C1A1;
 Sat, 17 Jul 2021 00:33:11 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 08/24] python/aqmp: add logging to AsyncProtocol
Date: Fri, 16 Jul 2021 20:32:37 -0400
Message-Id: <20210717003253.457418-9-jsnow@redhat.com>
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
Received-SPF: pass client-ip=216.205.24.124; envelope-from=jsnow@redhat.com;
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

Give the connection and the reader/writer tasks nicknames, and add
logging statements throughout.

Signed-off-by: John Snow <jsnow@redhat.com>
---
 python/qemu/aqmp/protocol.py | 71 ++++++++++++++++++++++++++++++++----
 1 file changed, 64 insertions(+), 7 deletions(-)

diff --git a/python/qemu/aqmp/protocol.py b/python/qemu/aqmp/protocol.py
index 247b60c31a6..f9295546cda 100644
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
@@ -31,8 +32,10 @@
 from .util import (
     bottom_half,
     create_task,
+    exception_summary,
     flush,
     is_closing,
+    pretty_traceback,
     upper_half,
     wait_closed,
 )
@@ -173,14 +176,28 @@ class AsyncProtocol(Generic[T]):
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
@@ -207,6 +224,14 @@ def __init__(self) -> None:
         self._runstate = Runstate.IDLE
         self._runstate_changed: Optional[asyncio.Event] = None
 
+    def __repr__(self) -> str:
+        cls_name = type(self).__name__
+        tokens = []
+        if self.name is not None:
+            tokens.append(f"name={self.name!r}")
+        tokens.append(f"runstate={self.runstate.name}")
+        return f"<{cls_name} {' '.join(tokens)}>"
+
     @property  # @upper_half
     def runstate(self) -> Runstate:
         """The current `Runstate` of the connection."""
@@ -275,6 +300,8 @@ def _set_state(self, state: Runstate) -> None:
         if state == self._runstate:
             return
 
+        self.logger.debug("Transitioning from '%s' to '%s'.",
+                          str(self._runstate), str(state))
         self._runstate = state
         self._runstate_event.set()
         self._runstate_event.clear()
@@ -314,8 +341,15 @@ async def _new_session(self,
 
         except BaseException as err:
             emsg = f"Failed to establish {phase}"
-            # Reset from CONNECTING back to IDLE.
-            await self.disconnect()
+            self.logger.error("%s: %s", emsg, exception_summary(err))
+            self.logger.debug("%s:\n%s\n", emsg, pretty_traceback())
+            try:
+                # Reset from CONNECTING back to IDLE.
+                await self.disconnect()
+            except:
+                emsg = "Unexpected bottom half exception"
+                self.logger.critical("%s:\n%s\n", emsg, pretty_traceback())
+                raise
 
             # NB: CancelledError is not a BaseException before Python 3.8
             if isinstance(err, asyncio.CancelledError):
@@ -365,12 +399,16 @@ async def _do_connect(self, address: Union[str, Tuple[str, int]],
 
         :raise OSError: For stream-related errors.
         """
+        self.logger.debug("Connecting to %s ...", address)
+
         if isinstance(address, tuple):
             connect = asyncio.open_connection(address[0], address[1], ssl=ssl)
         else:
             connect = asyncio.open_unix_connection(path=address, ssl=ssl)
         self._reader, self._writer = await connect
 
+        self.logger.debug("Connected.")
+
     @upper_half
     async def _establish_session(self) -> None:
         """
@@ -384,8 +422,8 @@ async def _establish_session(self) -> None:
 
         self._outgoing = asyncio.Queue()
 
-        reader_coro = self._bh_loop_forever(self._bh_recv_message)
-        writer_coro = self._bh_loop_forever(self._bh_send_message)
+        reader_coro = self._bh_loop_forever(self._bh_recv_message, 'Reader')
+        writer_coro = self._bh_loop_forever(self._bh_send_message, 'Writer')
 
         self._reader_task = create_task(reader_coro)
         self._writer_task = create_task(writer_coro)
@@ -412,6 +450,7 @@ def _schedule_disconnect(self) -> None:
         """
         if not self._dc_task:
             self._set_state(Runstate.DISCONNECTING)
+            self.logger.debug("Scheduling disconnect.")
             self._dc_task = create_task(self._bh_disconnect())
 
     @upper_half
@@ -497,8 +536,10 @@ def _exception(
         # This implicitly closes the reader, too.
         if self._writer:
             if not is_closing(self._writer):
+                self.logger.debug("Closing StreamWriter.")
                 self._writer.close()
 
+            self.logger.debug("Waiting for StreamWriter to close ...")
             try:
                 await wait_closed(self._writer)
             except Exception as err:  # pylint: disable=broad-except
@@ -509,6 +550,10 @@ def _exception(
                         self._reader_task, self._writer_task))):
                     raise
 
+            self.logger.debug("StreamWriter closed.")
+
+        self.logger.debug("Disconnected.")
+
     @bottom_half
     async def _bh_stop_writer(self, force: bool = False) -> None:
         if not self._writer_task or self._writer_task.done():
@@ -516,10 +561,13 @@ async def _bh_stop_writer(self, force: bool = False) -> None:
 
         # If we're not in a hurry, drain the outbound queue.
         if not force:
+            self.logger.debug("Draining the outbound queue ...")
             await self._outgoing.join()
             if self._writer is not None:
+                self.logger.debug("Flushing the StreamWriter ...")
                 await flush(self._writer)
 
+        self.logger.debug("Cancelling writer task ...")
         self._writer_task.cancel()
         # Waits for the writer to finish but does NOT raise its exception.
         await asyncio.wait((self._writer_task,))
@@ -529,12 +577,13 @@ async def _bh_stop_reader(self) -> None:
         if not self._reader_task or self._reader_task.done():
             return
 
+        self.logger.debug("Cancelling reader task ...")
         self._reader_task.cancel()
         # Waits for the reader to finish but does NOT raise its exception.
         await asyncio.wait((self._reader_task,))
 
     @bottom_half
-    async def _bh_loop_forever(self, async_fn: _TaskFN) -> None:
+    async def _bh_loop_forever(self, async_fn: _TaskFN, name: str) -> None:
         """
         Run one of the bottom-half methods in a loop forever.
 
@@ -542,16 +591,24 @@ async def _bh_loop_forever(self, async_fn: _TaskFN) -> None:
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
-        except BaseException:
+        except BaseException as err:
+            self.logger.error("Task.%s: %s",
+                              name, exception_summary(err))
+            self.logger.debug("Task.%s: failure:\n%s\n",
+                              name, pretty_traceback())
             self._schedule_disconnect()
             raise
+        finally:
+            self.logger.debug("Task.%s: exiting.", name)
 
     @bottom_half
     async def _bh_send_message(self) -> None:
-- 
2.31.1


