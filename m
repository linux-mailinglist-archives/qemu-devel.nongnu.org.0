Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 83F604C504B
	for <lists+qemu-devel@lfdr.de>; Fri, 25 Feb 2022 22:04:29 +0100 (CET)
Received: from localhost ([::1]:41032 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nNhlM-0005bD-7j
	for lists+qemu-devel@lfdr.de; Fri, 25 Feb 2022 16:04:28 -0500
Received: from eggs.gnu.org ([209.51.188.92]:59444)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1nNhhJ-0002li-Ma
 for qemu-devel@nongnu.org; Fri, 25 Feb 2022 16:00:17 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:42566)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1nNhhH-0004x2-R6
 for qemu-devel@nongnu.org; Fri, 25 Feb 2022 16:00:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1645822815;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qHOvFHVxpJhWNOXim+AS67YyAPV0V9RBDERH/lGTDjg=;
 b=hjuKNhmdnj0biaGpFgi3i6dcnhoTY5OoWvztvLEm7dppeyG49Uht/7uv1AccVWqxOHUEhh
 JzLQbK3AbQacda7Qj5q/jm9abiPwO/hcsaZ98ryleBtd1xaTxED2VJuyA/7Z00MsFdVfaN
 ZyKxwTHvYZ9QMPPBR0HdcXmr68IE+I4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-664-3nO3Ng7uMm2YM2PThmnY5g-1; Fri, 25 Feb 2022 16:00:12 -0500
X-MC-Unique: 3nO3Ng7uMm2YM2PThmnY5g-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7A267180FD74;
 Fri, 25 Feb 2022 21:00:11 +0000 (UTC)
Received: from scv.redhat.com (unknown [10.22.34.166])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 8F0871081310;
 Fri, 25 Feb 2022 21:00:10 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 02/10] python/aqmp: rename 'accept()' to
 'start_server_and_accept()'
Date: Fri, 25 Feb 2022 15:59:40 -0500
Message-Id: <20220225205948.3693480-3-jsnow@redhat.com>
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

Previously, I had a method named "accept()" that under-the-hood calls
bind(2), listen(2) *and* accept(2). I meant this as a simplification and
counterpart to the one-shot "connect()" method.

This is confusing to readers who expect accept() to mean *just*
accept(2). Since I need to split apart the "accept()" method into
multiple methods anyway (one of which strongly resembling accept(2)), it
feels pertinent to rename this method *now*.

Rename this all-in-one method "start_server_and_accept()" instead.

Signed-off-by: John Snow <jsnow@redhat.com>
---
 python/qemu/aqmp/legacy.py   |  2 +-
 python/qemu/aqmp/protocol.py |  6 ++++--
 python/tests/protocol.py     | 24 ++++++++++++------------
 3 files changed, 17 insertions(+), 15 deletions(-)

diff --git a/python/qemu/aqmp/legacy.py b/python/qemu/aqmp/legacy.py
index 6baa5f3409..dca1e76ed4 100644
--- a/python/qemu/aqmp/legacy.py
+++ b/python/qemu/aqmp/legacy.py
@@ -91,7 +91,7 @@ def accept(self, timeout: Optional[float] = 15.0) -> QMPMessage:
         self._aqmp.negotiate = True
 
         self._sync(
-            self._aqmp.accept(self._address),
+            self._aqmp.start_server_and_accept(self._address),
             timeout
         )
 
diff --git a/python/qemu/aqmp/protocol.py b/python/qemu/aqmp/protocol.py
index 009883f64d..73719257e0 100644
--- a/python/qemu/aqmp/protocol.py
+++ b/python/qemu/aqmp/protocol.py
@@ -265,8 +265,10 @@ async def runstate_changed(self) -> Runstate:
 
     @upper_half
     @require(Runstate.IDLE)
-    async def accept(self, address: SocketAddrT,
-                     ssl: Optional[SSLContext] = None) -> None:
+    async def start_server_and_accept(
+            self, address: SocketAddrT,
+            ssl: Optional[SSLContext] = None
+    ) -> None:
         """
         Accept a connection and begin processing message queues.
 
diff --git a/python/tests/protocol.py b/python/tests/protocol.py
index 5cd7938be3..354d6559b9 100644
--- a/python/tests/protocol.py
+++ b/python/tests/protocol.py
@@ -413,14 +413,14 @@ async def _bad_connection(self, family: str):
         assert family in ('INET', 'UNIX')
 
         if family == 'INET':
-            await self.proto.accept(('example.com', 1))
+            await self.proto.start_server_and_accept(('example.com', 1))
         elif family == 'UNIX':
-            await self.proto.accept('/dev/null')
+            await self.proto.start_server_and_accept('/dev/null')
 
     async def _hanging_connection(self):
         with TemporaryDirectory(suffix='.aqmp') as tmpdir:
             sock = os.path.join(tmpdir, type(self.proto).__name__ + ".sock")
-            await self.proto.accept(sock)
+            await self.proto.start_server_and_accept(sock)
 
 
 class FakeSession(TestBase):
@@ -449,13 +449,13 @@ async def testFakeConnect(self):
     @TestBase.async_test
     async def testFakeAccept(self):
         """Test the full state lifecycle (via accept) with a no-op session."""
-        await self.proto.accept('/not/a/real/path')
+        await self.proto.start_server_and_accept('/not/a/real/path')
         self.assertEqual(self.proto.runstate, Runstate.RUNNING)
 
     @TestBase.async_test
     async def testFakeRecv(self):
         """Test receiving a fake/null message."""
-        await self.proto.accept('/not/a/real/path')
+        await self.proto.start_server_and_accept('/not/a/real/path')
 
         logname = self.proto.logger.name
         with self.assertLogs(logname, level='DEBUG') as context:
@@ -471,7 +471,7 @@ async def testFakeRecv(self):
     @TestBase.async_test
     async def testFakeSend(self):
         """Test sending a fake/null message."""
-        await self.proto.accept('/not/a/real/path')
+        await self.proto.start_server_and_accept('/not/a/real/path')
 
         logname = self.proto.logger.name
         with self.assertLogs(logname, level='DEBUG') as context:
@@ -493,7 +493,7 @@ async def _prod_session_api(
     ):
         with self.assertRaises(StateError) as context:
             if accept:
-                await self.proto.accept('/not/a/real/path')
+                await self.proto.start_server_and_accept('/not/a/real/path')
             else:
                 await self.proto.connect('/not/a/real/path')
 
@@ -504,7 +504,7 @@ async def _prod_session_api(
     @TestBase.async_test
     async def testAcceptRequireRunning(self):
         """Test that accept() cannot be called when Runstate=RUNNING"""
-        await self.proto.accept('/not/a/real/path')
+        await self.proto.start_server_and_accept('/not/a/real/path')
 
         await self._prod_session_api(
             Runstate.RUNNING,
@@ -515,7 +515,7 @@ async def testAcceptRequireRunning(self):
     @TestBase.async_test
     async def testConnectRequireRunning(self):
         """Test that connect() cannot be called when Runstate=RUNNING"""
-        await self.proto.accept('/not/a/real/path')
+        await self.proto.start_server_and_accept('/not/a/real/path')
 
         await self._prod_session_api(
             Runstate.RUNNING,
@@ -526,7 +526,7 @@ async def testConnectRequireRunning(self):
     @TestBase.async_test
     async def testAcceptRequireDisconnecting(self):
         """Test that accept() cannot be called when Runstate=DISCONNECTING"""
-        await self.proto.accept('/not/a/real/path')
+        await self.proto.start_server_and_accept('/not/a/real/path')
 
         # Cheat: force a disconnect.
         await self.proto.simulate_disconnect()
@@ -541,7 +541,7 @@ async def testAcceptRequireDisconnecting(self):
     @TestBase.async_test
     async def testConnectRequireDisconnecting(self):
         """Test that connect() cannot be called when Runstate=DISCONNECTING"""
-        await self.proto.accept('/not/a/real/path')
+        await self.proto.start_server_and_accept('/not/a/real/path')
 
         # Cheat: force a disconnect.
         await self.proto.simulate_disconnect()
@@ -576,7 +576,7 @@ async def _asyncTearDown(self):
     async def testSmoke(self):
         with TemporaryDirectory(suffix='.aqmp') as tmpdir:
             sock = os.path.join(tmpdir, type(self.proto).__name__ + ".sock")
-            server_task = create_task(self.server.accept(sock))
+            server_task = create_task(self.server.start_server_and_accept(sock))
 
             # give the server a chance to start listening [...]
             await asyncio.sleep(0)
-- 
2.34.1


