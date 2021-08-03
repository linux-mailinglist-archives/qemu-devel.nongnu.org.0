Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 75D263DF4D4
	for <lists+qemu-devel@lfdr.de>; Tue,  3 Aug 2021 20:37:32 +0200 (CEST)
Received: from localhost ([::1]:58684 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mAzIB-00023x-F9
	for lists+qemu-devel@lfdr.de; Tue, 03 Aug 2021 14:37:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53576)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1mAzBE-0004V8-ST
 for qemu-devel@nongnu.org; Tue, 03 Aug 2021 14:30:22 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:56819)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1mAzBB-00069z-H6
 for qemu-devel@nongnu.org; Tue, 03 Aug 2021 14:30:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1628015416;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1Ub4PqydIJDpb6BFqbFMxhRLh3iwvuoQIBFfqF0fuJo=;
 b=KrnPuXupZ0HIbyN/vUiuW7HA/UsnKov2+EEDHAEc27i6t+8WKTWJRJI5rwx72Otjqo4kas
 zfTfPOPEhNCm8m/u4XaUkwjBOqpylfg+RBBA8Xutpjmtzheb7NV/Ntv0Ae148zse1M7ajv
 OyRSiCs5FdxagBS/gkXyCmXSGUqFL8Y=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-141-tVEW2GZHOQCUxyw23_KqVA-1; Tue, 03 Aug 2021 14:30:15 -0400
X-MC-Unique: tVEW2GZHOQCUxyw23_KqVA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B930887D544;
 Tue,  3 Aug 2021 18:30:14 +0000 (UTC)
Received: from scv.redhat.com (unknown [10.22.11.3])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 34F52226E8;
 Tue,  3 Aug 2021 18:30:02 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 09/25] python/aqmp: add AsyncProtocol.accept() method
Date: Tue,  3 Aug 2021 14:29:25 -0400
Message-Id: <20210803182941.504537-10-jsnow@redhat.com>
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
X-Spam_score_int: -15
X-Spam_score: -1.6
X-Spam_bar: -
X-Spam_report: (-1.6 / 5.0 requ) DKIMWL_WL_HIGH=-0.699, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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

It's a little messier than connect, because it wasn't designed to accept
*precisely one* connection. Such is life.

Signed-off-by: John Snow <jsnow@redhat.com>
---
 python/qemu/aqmp/protocol.py | 89 ++++++++++++++++++++++++++++++++++--
 1 file changed, 85 insertions(+), 4 deletions(-)

diff --git a/python/qemu/aqmp/protocol.py b/python/qemu/aqmp/protocol.py
index 77b330627b3..7eca65aa265 100644
--- a/python/qemu/aqmp/protocol.py
+++ b/python/qemu/aqmp/protocol.py
@@ -243,6 +243,24 @@ async def runstate_changed(self) -> Runstate:
         await self._runstate_event.wait()
         return self.runstate
 
+    @upper_half
+    @require(Runstate.IDLE)
+    async def accept(self, address: Union[str, Tuple[str, int]],
+                     ssl: Optional[SSLContext] = None) -> None:
+        """
+        Accept a connection and begin processing message queues.
+
+        If this call fails, `runstate` is guaranteed to be set back to `IDLE`.
+
+        :param address:
+            Address to listen to; UNIX socket path or TCP address/port.
+        :param ssl: SSL context to use, if any.
+
+        :raise StateError: When the `Runstate` is not `IDLE`.
+        :raise ConnectError: If a connection could not be accepted.
+        """
+        await self._new_session(address, ssl, accept=True)
+
     @upper_half
     @require(Runstate.IDLE)
     async def connect(self, address: Union[str, Tuple[str, int]],
@@ -308,7 +326,8 @@ def _set_state(self, state: Runstate) -> None:
     @upper_half
     async def _new_session(self,
                            address: Union[str, Tuple[str, int]],
-                           ssl: Optional[SSLContext] = None) -> None:
+                           ssl: Optional[SSLContext] = None,
+                           accept: bool = False) -> None:
         """
         Establish a new connection and initialize the session.
 
@@ -317,9 +336,10 @@ async def _new_session(self,
         to be set back to `IDLE`.
 
         :param address:
-            Address to connect to;
+            Address to connect to/listen on;
             UNIX socket path or TCP address/port.
         :param ssl: SSL context to use, if any.
+        :param accept: Accept a connection instead of connecting when `True`.
 
         :raise ConnectError:
             When a connection or session cannot be established.
@@ -333,7 +353,7 @@ async def _new_session(self,
 
         try:
             phase = "connection"
-            await self._establish_connection(address, ssl)
+            await self._establish_connection(address, ssl, accept)
 
             phase = "session"
             await self._establish_session()
@@ -367,6 +387,7 @@ async def _establish_connection(
             self,
             address: Union[str, Tuple[str, int]],
             ssl: Optional[SSLContext] = None,
+            accept: bool = False
     ) -> None:
         """
         Establish a new connection.
@@ -375,6 +396,7 @@ async def _establish_connection(
             Address to connect to/listen on;
             UNIX socket path or TCP address/port.
         :param ssl: SSL context to use, if any.
+        :param accept: Accept a connection instead of connecting when `True`.
         """
         assert self.runstate == Runstate.IDLE
         self._set_state(Runstate.CONNECTING)
@@ -384,7 +406,66 @@ async def _establish_connection(
         # otherwise yield.
         await asyncio.sleep(0)
 
-        await self._do_connect(address, ssl)
+        if accept:
+            await self._do_accept(address, ssl)
+        else:
+            await self._do_connect(address, ssl)
+
+    @upper_half
+    async def _do_accept(self, address: Union[str, Tuple[str, int]],
+                         ssl: Optional[SSLContext] = None) -> None:
+        """
+        Acting as the transport server, accept a single connection.
+
+        :param address:
+            Address to listen on; UNIX socket path or TCP address/port.
+        :param ssl: SSL context to use, if any.
+
+        :raise OSError: For stream-related errors.
+        """
+        self.logger.debug("Awaiting connection on %s ...", address)
+        connected = asyncio.Event()
+        server: Optional[asyncio.AbstractServer] = None
+
+        async def _client_connected_cb(reader: asyncio.StreamReader,
+                                       writer: asyncio.StreamWriter) -> None:
+            """Used to accept a single incoming connection, see below."""
+            nonlocal server
+            nonlocal connected
+
+            # A connection has been accepted; stop listening for new ones.
+            assert server is not None
+            server.close()
+            await server.wait_closed()
+            server = None
+
+            # Register this client as being connected
+            self._reader, self._writer = (reader, writer)
+
+            # Signal back: We've accepted a client!
+            connected.set()
+
+        if isinstance(address, tuple):
+            coro = asyncio.start_server(
+                _client_connected_cb,
+                host=address[0],
+                port=address[1],
+                ssl=ssl,
+                backlog=1,
+            )
+        else:
+            coro = asyncio.start_unix_server(
+                _client_connected_cb,
+                path=address,
+                ssl=ssl,
+                backlog=1,
+            )
+
+        server = await coro     # Starts listening
+        await connected.wait()  # Waits for the callback to fire (and finish)
+        assert server is None
+
+        self.logger.debug("Connection accepted.")
 
     @upper_half
     async def _do_connect(self, address: Union[str, Tuple[str, int]],
-- 
2.31.1


