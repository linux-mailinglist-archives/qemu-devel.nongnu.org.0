Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D2364D0AED
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Mar 2022 23:20:40 +0100 (CET)
Received: from localhost ([::1]:55480 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nRLiZ-0007uF-Mj
	for lists+qemu-devel@lfdr.de; Mon, 07 Mar 2022 17:20:39 -0500
Received: from eggs.gnu.org ([209.51.188.92]:47910)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1nRLdW-0006JM-GE
 for qemu-devel@nongnu.org; Mon, 07 Mar 2022 17:15:26 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:43794)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1nRLdR-00015l-Jc
 for qemu-devel@nongnu.org; Mon, 07 Mar 2022 17:15:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646691318;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=EX84oLX6c+vG8gpKnoiP7xQjkuvSV2Hr2eFWSJzoge0=;
 b=Ffemr5pxEl81hJXpifQseGE2Oalkk0gr8qTj85YGaaFsYl6dGJdJTQ6VdWA0abyz1LbWai
 CB7Z7172N4IeM4NhfbWHLsjsB1ucC+vg11dKhmABt+sx2oQhybMa8u4MqC0GM47oj8F41K
 l7qwCWdH5DzxqSzfdaB5tXYNGikR1+E=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-500-761H1q4ZOmOK3f8pUFL1SQ-1; Mon, 07 Mar 2022 17:15:15 -0500
X-MC-Unique: 761H1q4ZOmOK3f8pUFL1SQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2564F51DF;
 Mon,  7 Mar 2022 22:15:14 +0000 (UTC)
Received: from scv.redhat.com (unknown [10.22.10.176])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 221355E253;
 Mon,  7 Mar 2022 22:15:13 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 04/11] python/aqmp: split _client_connected_cb() out as
 _incoming()
Date: Mon,  7 Mar 2022 17:15:00 -0500
Message-Id: <20220307221507.1218892-5-jsnow@redhat.com>
In-Reply-To: <20220307221507.1218892-1-jsnow@redhat.com>
References: <20220307221507.1218892-1-jsnow@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Kevin Wolf <kwolf@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Beraldo Leal <bleal@redhat.com>, qemu-block@nongnu.org,
 Markus Armbruster <armbru@redhat.com>, Eduardo Habkost <eduardo@habkost.net>,
 Hanna Reitz <hreitz@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

As part of disentangling the monolithic nature of _do_accept(), split
out the incoming callback to prepare for factoring out the "wait for a
peer" step. Namely, this means using an event signal we can wait on from
outside of this method.

Signed-off-by: John Snow <jsnow@redhat.com>
Acked-by: Kevin Wolf <kwolf@redhat.com>
Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
Message-id: 20220225205948.3693480-5-jsnow@redhat.com
Signed-off-by: John Snow <jsnow@redhat.com>
---
 python/qemu/aqmp/protocol.py | 83 +++++++++++++++++++++++++-----------
 1 file changed, 58 insertions(+), 25 deletions(-)

diff --git a/python/qemu/aqmp/protocol.py b/python/qemu/aqmp/protocol.py
index b7e5e635d8..56f05b9030 100644
--- a/python/qemu/aqmp/protocol.py
+++ b/python/qemu/aqmp/protocol.py
@@ -242,6 +242,10 @@ def __init__(self, name: Optional[str] = None) -> None:
         # Workaround for bind()
         self._sock: Optional[socket.socket] = None
 
+        # Server state for start_server() and _incoming()
+        self._server: Optional[asyncio.AbstractServer] = None
+        self._accepted: Optional[asyncio.Event] = None
+
     def __repr__(self) -> str:
         cls_name = type(self).__name__
         tokens = []
@@ -425,6 +429,54 @@ def _set_state(self, state: Runstate) -> None:
         self._runstate_event.set()
         self._runstate_event.clear()
 
+    @bottom_half  # However, it does not run from the R/W tasks.
+    async def _stop_server(self) -> None:
+        """
+        Stop listening for / accepting new incoming connections.
+        """
+        if self._server is None:
+            return
+
+        try:
+            self.logger.debug("Stopping server.")
+            self._server.close()
+            await self._server.wait_closed()
+            self.logger.debug("Server stopped.")
+        finally:
+            self._server = None
+
+    @bottom_half  # However, it does not run from the R/W tasks.
+    async def _incoming(self,
+                        reader: asyncio.StreamReader,
+                        writer: asyncio.StreamWriter) -> None:
+        """
+        Accept an incoming connection and signal the upper_half.
+
+        This method does the minimum necessary to accept a single
+        incoming connection. It signals back to the upper_half ASAP so
+        that any errors during session initialization can occur
+        naturally in the caller's stack.
+
+        :param reader: Incoming `asyncio.StreamReader`
+        :param writer: Incoming `asyncio.StreamWriter`
+        """
+        peer = writer.get_extra_info('peername', 'Unknown peer')
+        self.logger.debug("Incoming connection from %s", peer)
+
+        if self._reader or self._writer:
+            # Sadly, we can have more than one pending connection
+            # because of https://bugs.python.org/issue46715
+            # Close any extra connections we don't actually want.
+            self.logger.warning("Extraneous connection inadvertently accepted")
+            writer.close()
+            return
+
+        # A connection has been accepted; stop listening for new ones.
+        assert self._accepted is not None
+        await self._stop_server()
+        self._reader, self._writer = (reader, writer)
+        self._accepted.set()
+
     def _bind_hack(self, address: Union[str, Tuple[str, int]]) -> None:
         """
         Used to create a socket in advance of accept().
@@ -469,30 +521,11 @@ async def _do_accept(self, address: SocketAddrT,
         self._set_state(Runstate.CONNECTING)
 
         self.logger.debug("Awaiting connection on %s ...", address)
-        connected = asyncio.Event()
-        server: Optional[asyncio.AbstractServer] = None
-
-        async def _client_connected_cb(reader: asyncio.StreamReader,
-                                       writer: asyncio.StreamWriter) -> None:
-            """Used to accept a single incoming connection, see below."""
-            nonlocal server
-            nonlocal connected
-
-            # A connection has been accepted; stop listening for new ones.
-            assert server is not None
-            server.close()
-            await server.wait_closed()
-            server = None
-
-            # Register this client as being connected
-            self._reader, self._writer = (reader, writer)
-
-            # Signal back: We've accepted a client!
-            connected.set()
+        self._accepted = asyncio.Event()
 
         if isinstance(address, tuple):
             coro = asyncio.start_server(
-                _client_connected_cb,
+                self._incoming,
                 host=None if self._sock else address[0],
                 port=None if self._sock else address[1],
                 ssl=ssl,
@@ -502,7 +535,7 @@ async def _client_connected_cb(reader: asyncio.StreamReader,
             )
         else:
             coro = asyncio.start_unix_server(
-                _client_connected_cb,
+                self._incoming,
                 path=None if self._sock else address,
                 ssl=ssl,
                 backlog=1,
@@ -515,9 +548,9 @@ async def _client_connected_cb(reader: asyncio.StreamReader,
         # otherwise yield.
         await asyncio.sleep(0)
 
-        server = await coro     # Starts listening
-        await connected.wait()  # Waits for the callback to fire (and finish)
-        assert server is None
+        self._server = await coro    # Starts listening
+        await self._accepted.wait()  # Waits for the callback to finish
+        assert self._server is None
         self._sock = None
 
         self.logger.debug("Connection accepted.")
-- 
2.34.1


