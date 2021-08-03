Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 41B3B3DF4C8
	for <lists+qemu-devel@lfdr.de>; Tue,  3 Aug 2021 20:34:31 +0200 (CEST)
Received: from localhost ([::1]:49704 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mAzFG-0004Op-7L
	for lists+qemu-devel@lfdr.de; Tue, 03 Aug 2021 14:34:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53470)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1mAzB2-0004PS-BO
 for qemu-devel@nongnu.org; Tue, 03 Aug 2021 14:30:09 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:33047)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1mAzAz-00061M-2P
 for qemu-devel@nongnu.org; Tue, 03 Aug 2021 14:30:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1628015404;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Q6jUbh9H2/9vV3SsjGLRIOP5JeT4CMeo3byXCFSggcU=;
 b=V/12tI0B3OgF+cggt04Vlsve25xDVLcHoZ4oE1lvFsoKQklEiXZ3SqfMGshxWJlD4wQ+5e
 471opqcT9PXP1lrjRHYyNwByX+ColdIFOEF12WdnYSAKicxGXKVjKeBbb/v4dBwPYZ0iLv
 WxKi2mOe537kff0h5+X2qROIMeRYaxo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-236-WO6g5sZgPxGWPz5y6fAU-A-1; Tue, 03 Aug 2021 14:30:02 -0400
X-MC-Unique: WO6g5sZgPxGWPz5y6fAU-A-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id F3D991B2C985;
 Tue,  3 Aug 2021 18:30:01 +0000 (UTC)
Received: from scv.redhat.com (unknown [10.22.11.3])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B572560854;
 Tue,  3 Aug 2021 18:30:00 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 08/25] python/aqmp: add logging to AsyncProtocol
Date: Tue,  3 Aug 2021 14:29:24 -0400
Message-Id: <20210803182941.504537-9-jsnow@redhat.com>
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
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
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
Cc: Willian Rampazzo <wrampazz@redhat.com>, Eric Blake <eblake@redhat.com>,
 Markus Armbruster <armbru@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 "Niteesh G . S ." <niteesh.gs@gmail.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 John Snow <jsnow@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Give the connection and the reader/writer tasks nicknames, and add
logging statements throughout.

Signed-off-by: John Snow <jsnow@redhat.com>
---
 python/qemu/aqmp/protocol.py | 82 ++++++++++++++++++++++++++++++++----
 1 file changed, 73 insertions(+), 9 deletions(-)

diff --git a/python/qemu/aqmp/protocol.py b/python/qemu/aqmp/protocol.py
index 3a4703d49dc..77b330627b3 100644
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
@@ -32,8 +33,10 @@
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
@@ -174,14 +177,28 @@ class AsyncProtocol(Generic[T]):
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
@@ -205,6 +222,14 @@ def __init__(self) -> None:
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
@@ -246,6 +271,7 @@ async def disconnect(self) -> None:
 
         :raise Exception: When the reader or writer terminate unexpectedly.
         """
+        self.logger.debug("disconnect() called.")
         self._schedule_disconnect()
         await self._wait_disconnect()
 
@@ -273,6 +299,8 @@ def _set_state(self, state: Runstate) -> None:
         if state == self._runstate:
             return
 
+        self.logger.debug("Transitioning from '%s' to '%s'.",
+                          str(self._runstate), str(state))
         self._runstate = state
         self._runstate_event.set()
         self._runstate_event.clear()
@@ -312,8 +340,15 @@ async def _new_session(self,
 
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
@@ -363,12 +398,16 @@ async def _do_connect(self, address: Union[str, Tuple[str, int]],
 
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
@@ -382,8 +421,8 @@ async def _establish_session(self) -> None:
 
         self._outgoing = asyncio.Queue()
 
-        reader_coro = self._bh_loop_forever(self._bh_recv_message)
-        writer_coro = self._bh_loop_forever(self._bh_send_message)
+        reader_coro = self._bh_loop_forever(self._bh_recv_message, 'Reader')
+        writer_coro = self._bh_loop_forever(self._bh_send_message, 'Writer')
 
         self._reader_task = create_task(reader_coro)
         self._writer_task = create_task(writer_coro)
@@ -410,6 +449,7 @@ def _schedule_disconnect(self) -> None:
         """
         if not self._dc_task:
             self._set_state(Runstate.DISCONNECTING)
+            self.logger.debug("Scheduling disconnect.")
             self._dc_task = create_task(self._bh_disconnect())
 
     @upper_half
@@ -492,30 +532,39 @@ def _done(task: Optional['asyncio.Future[Any]']) -> bool:
             # Try to flush the writer, if possible:
             if not error_pathway:
                 await self._bh_flush_writer()
-        except:
+        except BaseException as err:
             error_pathway = True
+            emsg = "Failed to flush the writer"
+            self.logger.error("%s: %s", emsg, exception_summary(err))
+            self.logger.debug("%s:\n%s\n", emsg, pretty_traceback())
             raise
         finally:
             # Cancel any still-running tasks:
             if self._writer_task is not None and not self._writer_task.done():
+                self.logger.debug("Cancelling writer task.")
                 self._writer_task.cancel()
             if self._reader_task is not None and not self._reader_task.done():
+                self.logger.debug("Cancelling reader task.")
                 self._reader_task.cancel()
 
             # Close out the tasks entirely (Won't raise):
             if tasks:
+                self.logger.debug("Waiting for tasks to complete ...")
                 await asyncio.wait(tasks)
 
             # Lastly, close the stream itself. (May raise):
             await self._bh_close_stream(error_pathway)
+            self.logger.debug("Disconnected.")
 
     @bottom_half
     async def _bh_flush_writer(self) -> None:
         if not self._writer_task:
             return
 
+        self.logger.debug("Draining the outbound queue ...")
         await self._outgoing.join()
         if self._writer is not None:
+            self.logger.debug("Flushing the StreamWriter ...")
             await flush(self._writer)
 
     @bottom_half
@@ -525,8 +574,10 @@ async def _bh_close_stream(self, error_pathway: bool = False) -> None:
             return
 
         if not is_closing(self._writer):
+            self.logger.debug("Closing StreamWriter.")
             self._writer.close()
 
+        self.logger.debug("Waiting for StreamWriter to close ...")
         try:
             await wait_closed(self._writer)
         except Exception:  # pylint: disable=broad-except
@@ -541,13 +592,18 @@ async def _bh_close_stream(self, error_pathway: bool = False) -> None:
                 # just trust that the Exception we already have is the
                 # better one to present to the user, even if we don't
                 # genuinely *know* the relationship between the two.
-                pass
+                self.logger.debug(
+                    "Discarding Exception from wait_closed:\n%s\n",
+                    pretty_traceback(),
+                )
             else:
                 # Oops, this is a brand-new error!
                 raise
+        finally:
+            self.logger.debug("StreamWriter closed.")
 
     @bottom_half
-    async def _bh_loop_forever(self, async_fn: _TaskFN) -> None:
+    async def _bh_loop_forever(self, async_fn: _TaskFN, name: str) -> None:
         """
         Run one of the bottom-half methods in a loop forever.
 
@@ -555,16 +611,24 @@ async def _bh_loop_forever(self, async_fn: _TaskFN) -> None:
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


