Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6346E4D0AF5
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Mar 2022 23:22:31 +0100 (CET)
Received: from localhost ([::1]:35538 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nRLkM-00052j-G2
	for lists+qemu-devel@lfdr.de; Mon, 07 Mar 2022 17:22:30 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48034)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1nRLdZ-0006Qx-AP
 for qemu-devel@nongnu.org; Mon, 07 Mar 2022 17:15:29 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:48318)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1nRLdT-00016g-J6
 for qemu-devel@nongnu.org; Mon, 07 Mar 2022 17:15:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646691323;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=E8KbTXbhlSsycVB2+i4RNmY4qy9EQwnMi4MC4red4Ys=;
 b=L044+yXZuZoU6I1If7WqtdRsK4xyDL0IpD+Jflaaiqt+aTMKcaX5vmefKju2ghZVI/JUku
 3BADdotJMLeHyqizrw9jBtMi4GtM3jDuczZnjcjuz1S8YXMuG7ZrTOqy1D80CU9M42HDyV
 7RyXTUIWms2xhXfLU1i/ife84KTuRVc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-225-TZ8tLnwUP-GxoLZ8nF_CBA-1; Mon, 07 Mar 2022 17:15:20 -0500
X-MC-Unique: TZ8tLnwUP-GxoLZ8nF_CBA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D528D51F8;
 Mon,  7 Mar 2022 22:15:18 +0000 (UTC)
Received: from scv.redhat.com (unknown [10.22.10.176])
 by smtp.corp.redhat.com (Postfix) with ESMTP id CB9695E253;
 Mon,  7 Mar 2022 22:15:17 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 08/11] python/aqmp: add start_server() and accept() methods
Date: Mon,  7 Mar 2022 17:15:04 -0500
Message-Id: <20220307221507.1218892-9-jsnow@redhat.com>
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
Received-SPF: pass client-ip=170.10.129.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Beraldo Leal <bleal@redhat.com>, qemu-block@nongnu.org,
 Markus Armbruster <armbru@redhat.com>, Eduardo Habkost <eduardo@habkost.net>,
 Hanna Reitz <hreitz@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Add start_server() and accept() methods that can be used instead of
start_server_and_accept() to allow more fine-grained control over the
incoming connection process.

(Eagle-eyed reviewers will surely notice that it's a bit weird that
"CONNECTING" is a state that's shared between both the start_server()
and connect() states. That's absolutely true, and it's very true that
checking on the presence of _accepted as an indicator of state is a
hack. That's also very certainly true. But ... this keeps client code an
awful lot simpler, as it doesn't have to care exactly *how* the
connection is being made, just that it *is*. Is it worth disrupting that
simplicity in order to provide a better state guard on `accept()`? Hm.)

Signed-off-by: John Snow <jsnow@redhat.com>
Acked-by: Kevin Wolf <kwolf@redhat.com>
Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
Message-id: 20220225205948.3693480-9-jsnow@redhat.com
Signed-off-by: John Snow <jsnow@redhat.com>
---
 python/qemu/aqmp/protocol.py | 67 +++++++++++++++++++++++++++++++++---
 python/tests/protocol.py     |  7 ++++
 2 files changed, 69 insertions(+), 5 deletions(-)

diff --git a/python/qemu/aqmp/protocol.py b/python/qemu/aqmp/protocol.py
index cdbc9cba0d..2ecba14555 100644
--- a/python/qemu/aqmp/protocol.py
+++ b/python/qemu/aqmp/protocol.py
@@ -280,6 +280,8 @@ async def start_server_and_accept(
         Accept a connection and begin processing message queues.
 
         If this call fails, `runstate` is guaranteed to be set back to `IDLE`.
+        This method is precisely equivalent to calling `start_server()`
+        followed by `accept()`.
 
         :param address:
             Address to listen on; UNIX socket path or TCP address/port.
@@ -294,9 +296,62 @@ async def start_server_and_accept(
             protocol-level failure occurs while establishing a new
             session, the wrapped error may also be an `QMPError`.
         """
+        await self.start_server(address, ssl)
+        await self.accept()
+        assert self.runstate == Runstate.RUNNING
+
+    @upper_half
+    @require(Runstate.IDLE)
+    async def start_server(self, address: SocketAddrT,
+                           ssl: Optional[SSLContext] = None) -> None:
+        """
+        Start listening for an incoming connection, but do not wait for a peer.
+
+        This method starts listening for an incoming connection, but
+        does not block waiting for a peer. This call will return
+        immediately after binding and listening on a socket. A later
+        call to `accept()` must be made in order to finalize the
+        incoming connection.
+
+        :param address:
+            Address to listen on; UNIX socket path or TCP address/port.
+        :param ssl: SSL context to use, if any.
+
+        :raise StateError: When the `Runstate` is not `IDLE`.
+        :raise ConnectError:
+            When the server could not start listening on this address.
+
+            This exception will wrap a more concrete one. In most cases,
+            the wrapped exception will be `OSError`.
+        """
         await self._session_guard(
             self._do_start_server(address, ssl),
             'Failed to establish connection')
+        assert self.runstate == Runstate.CONNECTING
+
+    @upper_half
+    @require(Runstate.CONNECTING)
+    async def accept(self) -> None:
+        """
+        Accept an incoming connection and begin processing message queues.
+
+        If this call fails, `runstate` is guaranteed to be set back to `IDLE`.
+
+        :raise StateError: When the `Runstate` is not `CONNECTING`.
+        :raise QMPError: When `start_server()` was not called yet.
+        :raise ConnectError:
+            When a connection or session cannot be established.
+
+            This exception will wrap a more concrete one. In most cases,
+            the wrapped exception will be `OSError` or `EOFError`. If a
+            protocol-level failure occurs while establishing a new
+            session, the wrapped error may also be an `QMPError`.
+        """
+        if self._accepted is None:
+            raise QMPError("Cannot call accept() before start_server().")
+        await self._session_guard(
+            self._do_accept(),
+            'Failed to establish connection')
         await self._session_guard(
             self._establish_session(),
             'Failed to establish session')
@@ -512,7 +567,12 @@ def _bind_hack(self, address: Union[str, Tuple[str, int]]) -> None:
     async def _do_start_server(self, address: SocketAddrT,
                                ssl: Optional[SSLContext] = None) -> None:
         """
-        Acting as the transport server, accept a single connection.
+        Start listening for an incoming connection, but do not wait for a peer.
+
+        This method starts listening for an incoming connection, but does not
+        block waiting for a peer. This call will return immediately after
+        binding and listening to a socket. A later call to accept() must be
+        made in order to finalize the incoming connection.
 
         :param address:
             Address to listen on; UNIX socket path or TCP address/port.
@@ -554,10 +614,7 @@ async def _do_start_server(self, address: SocketAddrT,
         # This will start the server (bind(2), listen(2)). It will also
         # call accept(2) if we yield, but we don't block on that here.
         self._server = await coro
-
-        # Just for this one commit, wait for a peer.
-        # This gets split out in the next patch.
-        await self._do_accept()
+        self.logger.debug("Server listening on %s", address)
 
     @upper_half
     async def _do_accept(self) -> None:
diff --git a/python/tests/protocol.py b/python/tests/protocol.py
index 5e442e1efb..d6849ad306 100644
--- a/python/tests/protocol.py
+++ b/python/tests/protocol.py
@@ -43,11 +43,18 @@ async def _establish_session(self):
 
     async def _do_start_server(self, address, ssl=None):
         if self.fake_session:
+            self._accepted = asyncio.Event()
             self._set_state(Runstate.CONNECTING)
             await asyncio.sleep(0)
         else:
             await super()._do_start_server(address, ssl)
 
+    async def _do_accept(self):
+        if self.fake_session:
+            self._accepted = None
+        else:
+            await super()._do_accept()
+
     async def _do_connect(self, address, ssl=None):
         if self.fake_session:
             self._set_state(Runstate.CONNECTING)
-- 
2.34.1


