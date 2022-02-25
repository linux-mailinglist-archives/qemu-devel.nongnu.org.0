Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F5B14C504D
	for <lists+qemu-devel@lfdr.de>; Fri, 25 Feb 2022 22:04:39 +0100 (CET)
Received: from localhost ([::1]:41738 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nNhlW-00063b-7X
	for lists+qemu-devel@lfdr.de; Fri, 25 Feb 2022 16:04:38 -0500
Received: from eggs.gnu.org ([209.51.188.92]:59560)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1nNhhw-0003DT-63
 for qemu-devel@nongnu.org; Fri, 25 Feb 2022 16:01:02 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:58960)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1nNhhr-00059e-KW
 for qemu-devel@nongnu.org; Fri, 25 Feb 2022 16:00:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1645822848;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0sXPR8E+3qaVmVeSZjwbrBAf3H7HBSLjBKQUaxR2Jg4=;
 b=frSaKFDdzvyRLe33xNhJrjGsKy743TjiQVvrY0r19fZbCjpjwQSziG8UEOzmTK8sO7cY4Q
 HtEhg4ZS4fPJSYaQm620dfMbVIaLKqcA291q0xr1TY4wJiLFSWhTAX/0ZzwEVBBfZ7uLkD
 fJ0VvWkrsDInJVeWOzk7px3SX0K1w2w=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-220-iZib6m6EPDWL0NiCGUgVuw-1; Fri, 25 Feb 2022 16:00:47 -0500
X-MC-Unique: iZib6m6EPDWL0NiCGUgVuw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1594E1006AA8;
 Fri, 25 Feb 2022 21:00:46 +0000 (UTC)
Received: from scv.redhat.com (unknown [10.22.34.166])
 by smtp.corp.redhat.com (Postfix) with ESMTP id BC5751081357;
 Fri, 25 Feb 2022 21:00:11 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 03/10] python/aqmp: remove _new_session and
 _establish_connection
Date: Fri, 25 Feb 2022 15:59:41 -0500
Message-Id: <20220225205948.3693480-4-jsnow@redhat.com>
In-Reply-To: <20220225205948.3693480-1-jsnow@redhat.com>
References: <20220225205948.3693480-1-jsnow@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
 Daniel Berrange <berrange@redhat.com>, Beraldo Leal <bleal@redhat.com>,
 Cleber Rosa <crosa@redhat.com>, John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

These two methods attempted to entirely envelop the logic of
establishing a connection to a peer start to finish. However, we need to
break apart the incoming connection step into more granular steps. We
will no longer be able to reasonably constrain the logic inside of these
helper functions.

So, remove them - with _session_guard(), they no longer serve a real
purpose.

Although the public API doesn't change, the internal API does. Now that
there are no intermediary methods between e.g. connect() and
_do_connect(), there's no hook where the runstate is set. As a result,
the test suite changes a little to cope with the new semantics of
_do_accept() and _do_connect().

Lastly, take some pieces of the now-deleted docstrings and move
them up to the public interface level. They were a little more detailed,
and it won't hurt to keep them.

Signed-off-by: John Snow <jsnow@redhat.com>
---
 python/qemu/aqmp/protocol.py | 117 ++++++++++++++---------------------
 python/tests/protocol.py     |  10 ++-
 2 files changed, 53 insertions(+), 74 deletions(-)

diff --git a/python/qemu/aqmp/protocol.py b/python/qemu/aqmp/protocol.py
index 73719257e0..b7e5e635d8 100644
--- a/python/qemu/aqmp/protocol.py
+++ b/python/qemu/aqmp/protocol.py
@@ -275,13 +275,25 @@ async def start_server_and_accept(
         If this call fails, `runstate` is guaranteed to be set back to `IDLE`.
 
         :param address:
-            Address to listen to; UNIX socket path or TCP address/port.
+            Address to listen on; UNIX socket path or TCP address/port.
         :param ssl: SSL context to use, if any.
 
         :raise StateError: When the `Runstate` is not `IDLE`.
-        :raise ConnectError: If a connection could not be accepted.
+        :raise ConnectError:
+            When a connection or session cannot be established.
+
+            This exception will wrap a more concrete one. In most cases,
+            the wrapped exception will be `OSError` or `EOFError`. If a
+            protocol-level failure occurs while establishing a new
+            session, the wrapped error may also be an `QMPError`.
         """
-        await self._new_session(address, ssl, accept=True)
+        await self._session_guard(
+            self._do_accept(address, ssl),
+            'Failed to establish connection')
+        await self._session_guard(
+            self._establish_session(),
+            'Failed to establish session')
+        assert self.runstate == Runstate.RUNNING
 
     @upper_half
     @require(Runstate.IDLE)
@@ -297,9 +309,21 @@ async def connect(self, address: SocketAddrT,
         :param ssl: SSL context to use, if any.
 
         :raise StateError: When the `Runstate` is not `IDLE`.
-        :raise ConnectError: If a connection cannot be made to the server.
+        :raise ConnectError:
+            When a connection or session cannot be established.
+
+            This exception will wrap a more concrete one. In most cases,
+            the wrapped exception will be `OSError` or `EOFError`. If a
+            protocol-level failure occurs while establishing a new
+            session, the wrapped error may also be an `QMPError`.
         """
-        await self._new_session(address, ssl)
+        await self._session_guard(
+            self._do_connect(address, ssl),
+            'Failed to establish connection')
+        await self._session_guard(
+            self._establish_session(),
+            'Failed to establish session')
+        assert self.runstate == Runstate.RUNNING
 
     @upper_half
     async def disconnect(self) -> None:
@@ -401,73 +425,6 @@ def _set_state(self, state: Runstate) -> None:
         self._runstate_event.set()
         self._runstate_event.clear()
 
-    @upper_half
-    async def _new_session(self,
-                           address: SocketAddrT,
-                           ssl: Optional[SSLContext] = None,
-                           accept: bool = False) -> None:
-        """
-        Establish a new connection and initialize the session.
-
-        Connect or accept a new connection, then begin the protocol
-        session machinery. If this call fails, `runstate` is guaranteed
-        to be set back to `IDLE`.
-
-        :param address:
-            Address to connect to/listen on;
-            UNIX socket path or TCP address/port.
-        :param ssl: SSL context to use, if any.
-        :param accept: Accept a connection instead of connecting when `True`.
-
-        :raise ConnectError:
-            When a connection or session cannot be established.
-
-            This exception will wrap a more concrete one. In most cases,
-            the wrapped exception will be `OSError` or `EOFError`. If a
-            protocol-level failure occurs while establishing a new
-            session, the wrapped error may also be an `QMPError`.
-        """
-        assert self.runstate == Runstate.IDLE
-
-        await self._session_guard(
-            self._establish_connection(address, ssl, accept),
-            'Failed to establish connection')
-
-        await self._session_guard(
-            self._establish_session(),
-            'Failed to establish session')
-
-        assert self.runstate == Runstate.RUNNING
-
-    @upper_half
-    async def _establish_connection(
-            self,
-            address: SocketAddrT,
-            ssl: Optional[SSLContext] = None,
-            accept: bool = False
-    ) -> None:
-        """
-        Establish a new connection.
-
-        :param address:
-            Address to connect to/listen on;
-            UNIX socket path or TCP address/port.
-        :param ssl: SSL context to use, if any.
-        :param accept: Accept a connection instead of connecting when `True`.
-        """
-        assert self.runstate == Runstate.IDLE
-        self._set_state(Runstate.CONNECTING)
-
-        # Allow runstate watchers to witness 'CONNECTING' state; some
-        # failures in the streaming layer are synchronous and will not
-        # otherwise yield.
-        await asyncio.sleep(0)
-
-        if accept:
-            await self._do_accept(address, ssl)
-        else:
-            await self._do_connect(address, ssl)
-
     def _bind_hack(self, address: Union[str, Tuple[str, int]]) -> None:
         """
         Used to create a socket in advance of accept().
@@ -508,6 +465,9 @@ async def _do_accept(self, address: SocketAddrT,
 
         :raise OSError: For stream-related errors.
         """
+        assert self.runstate == Runstate.IDLE
+        self._set_state(Runstate.CONNECTING)
+
         self.logger.debug("Awaiting connection on %s ...", address)
         connected = asyncio.Event()
         server: Optional[asyncio.AbstractServer] = None
@@ -550,6 +510,11 @@ async def _client_connected_cb(reader: asyncio.StreamReader,
                 sock=self._sock,
             )
 
+        # Allow runstate watchers to witness 'CONNECTING' state; some
+        # failures in the streaming layer are synchronous and will not
+        # otherwise yield.
+        await asyncio.sleep(0)
+
         server = await coro     # Starts listening
         await connected.wait()  # Waits for the callback to fire (and finish)
         assert server is None
@@ -569,6 +534,14 @@ async def _do_connect(self, address: SocketAddrT,
 
         :raise OSError: For stream-related errors.
         """
+        assert self.runstate == Runstate.IDLE
+        self._set_state(Runstate.CONNECTING)
+
+        # Allow runstate watchers to witness 'CONNECTING' state; some
+        # failures in the streaming layer are synchronous and will not
+        # otherwise yield.
+        await asyncio.sleep(0)
+
         self.logger.debug("Connecting to %s ...", address)
 
         if isinstance(address, tuple):
diff --git a/python/tests/protocol.py b/python/tests/protocol.py
index 354d6559b9..8dd26c4ed1 100644
--- a/python/tests/protocol.py
+++ b/python/tests/protocol.py
@@ -42,11 +42,17 @@ async def _establish_session(self):
         await super()._establish_session()
 
     async def _do_accept(self, address, ssl=None):
-        if not self.fake_session:
+        if self.fake_session:
+            self._set_state(Runstate.CONNECTING)
+            await asyncio.sleep(0)
+        else:
             await super()._do_accept(address, ssl)
 
     async def _do_connect(self, address, ssl=None):
-        if not self.fake_session:
+        if self.fake_session:
+            self._set_state(Runstate.CONNECTING)
+            await asyncio.sleep(0)
+        else:
             await super()._do_connect(address, ssl)
 
     async def _do_recv(self) -> None:
-- 
2.34.1


