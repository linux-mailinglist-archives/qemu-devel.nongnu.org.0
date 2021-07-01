Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 003803B8CE6
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Jul 2021 06:22:47 +0200 (CEST)
Received: from localhost ([::1]:41030 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lyoDu-0004uB-Vu
	for lists+qemu-devel@lfdr.de; Thu, 01 Jul 2021 00:22:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42336)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lyo56-0000Gw-NA
 for qemu-devel@nongnu.org; Thu, 01 Jul 2021 00:13:40 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:20072)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lyo54-0000lL-Py
 for qemu-devel@nongnu.org; Thu, 01 Jul 2021 00:13:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1625112818;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=IigzW1skemNVRbczM0Veq/ZUl4qm+ThwuBp/NS4dbPA=;
 b=Utxsb7wG0NeugfnbUB8SLnTDyebvP+AnegOEL86ueeVhYnKImQxnv8BF0gwNYw9+VPaAs6
 ASbemx4Qy9t5AIKj4Vg5fY4YNpGM/TbgE+kkycaei0QQcwmRGcOpNdeIzSRhF6sRrK+0TB
 0ZPmVJc7NYaWo+acuQWZ2qrXgDUDLHQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-372-rPLDLt0ZPBqcpJExoEksBg-1; Thu, 01 Jul 2021 00:13:37 -0400
X-MC-Unique: rPLDLt0ZPBqcpJExoEksBg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 37323362F9;
 Thu,  1 Jul 2021 04:13:36 +0000 (UTC)
Received: from scv.redhat.com (ovpn-118-71.rdu2.redhat.com [10.10.118.71])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B4EE8604CC;
 Thu,  1 Jul 2021 04:13:31 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 09/20] python/aqmp: add AsyncProtocol.accept() method
Date: Thu,  1 Jul 2021 00:13:02 -0400
Message-Id: <20210701041313.1696009-10-jsnow@redhat.com>
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

It's a little messier than connect, because it wasn't designed to accept
*precisely one* connection. Such is life.

Signed-off-by: John Snow <jsnow@redhat.com>
---
 python/qemu/aqmp/protocol.py | 85 ++++++++++++++++++++++++++++++++++--
 1 file changed, 82 insertions(+), 3 deletions(-)

diff --git a/python/qemu/aqmp/protocol.py b/python/qemu/aqmp/protocol.py
index dd8564ee02..a32a8cbbf6 100644
--- a/python/qemu/aqmp/protocol.py
+++ b/python/qemu/aqmp/protocol.py
@@ -242,6 +242,24 @@ def runstate(self) -> Runstate:
         """The current `Runstate` of the connection."""
         return self._runstate
 
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
@@ -302,7 +320,8 @@ def _set_state(self, state: Runstate) -> None:
     @upper_half
     async def _new_session(self,
                            address: Union[str, Tuple[str, int]],
-                           ssl: Optional[SSLContext] = None) -> None:
+                           ssl: Optional[SSLContext] = None,
+                           accept: bool = False) -> None:
         """
         Establish a new connection and initialize the session.
 
@@ -311,9 +330,10 @@ async def _new_session(self,
         to be set back to `IDLE`.
 
         :param address:
-            Address to connect to;
+            Address to connect to/listen on;
             UNIX socket path or TCP address/port.
         :param ssl: SSL context to use, if any.
+        :param accept: Accept a connection instead of connecting when `True`.
 
         :raise ConnectError:
             When a connection or session cannot be established.
@@ -332,7 +352,10 @@ async def _new_session(self,
 
         phase = "connection"
         try:
-            await self._do_connect(address, ssl)
+            if accept:
+                await self._do_accept(address, ssl)
+            else:
+                await self._do_connect(address, ssl)
 
             phase = "session"
             await self._begin_new_session()
@@ -351,6 +374,62 @@ async def _new_session(self,
 
         assert self.runstate == Runstate.RUNNING
 
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
+        self.logger.debug("Awaiting connection ...")
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
+        self.logger.debug("Connection accepted")
+
     @upper_half
     async def _do_connect(self, address: Union[str, Tuple[str, int]],
                           ssl: Optional[SSLContext] = None) -> None:
-- 
2.31.1


