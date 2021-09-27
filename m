Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A600B419FC9
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Sep 2021 22:08:16 +0200 (CEST)
Received: from localhost ([::1]:41022 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mUwv9-0007Mp-6F
	for lists+qemu-devel@lfdr.de; Mon, 27 Sep 2021 16:08:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58284)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1mUwJN-00072c-D9
 for qemu-devel@nongnu.org; Mon, 27 Sep 2021 15:29:13 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:21662)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1mUwJK-0000Ae-Tx
 for qemu-devel@nongnu.org; Mon, 27 Sep 2021 15:29:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1632770950;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3MiVMx32MtyXm7sd64YRGsQoeddO99I4bKnm+a2JB04=;
 b=St+awBAYeAOjqAMoAQyUYncmribINVFOHMWTg+V8cRdD2KvhujyaCgAUukvusRsO+ZKyGf
 UsPsJSP5rnJVRnQH0a9lR8T52GbkYgFyLc7bvuYVsD6WXoJYXGQm/iHROL3sdQGZdPAmDT
 rK9p8Wvu8tSdsCS7HS8o0mP5ZJQ47A4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-142-PIYQp_uUOGSTdpLaYPm4wQ-1; Mon, 27 Sep 2021 15:29:08 -0400
X-MC-Unique: PIYQp_uUOGSTdpLaYPm4wQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BB251362F8;
 Mon, 27 Sep 2021 19:29:07 +0000 (UTC)
Received: from scv.redhat.com (unknown [10.22.9.55])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 3CA5360871;
 Mon, 27 Sep 2021 19:29:06 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 26/32] python/aqmp: add LineProtocol tests
Date: Mon, 27 Sep 2021 15:25:07 -0400
Message-Id: <20210927192513.744199-27-jsnow@redhat.com>
In-Reply-To: <20210927192513.744199-1-jsnow@redhat.com>
References: <20210927192513.744199-1-jsnow@redhat.com>
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
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 Daniel Berrange <berrange@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Markus Armbruster <armbru@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Willian Rampazzo <willianr@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Tests a real connect, a real accept, and really sending and receiving a
message over a UNIX socket.

Brings coverage of protocol.py up to ~93%.

Signed-off-by: John Snow <jsnow@redhat.com>
Message-id: 20210915162955.333025-27-jsnow@redhat.com
Signed-off-by: John Snow <jsnow@redhat.com>
---
 python/tests/protocol.py | 48 ++++++++++++++++++++++++++++++++++++++++
 1 file changed, 48 insertions(+)

diff --git a/python/tests/protocol.py b/python/tests/protocol.py
index f0682d29ce5..5cd7938be35 100644
--- a/python/tests/protocol.py
+++ b/python/tests/protocol.py
@@ -78,6 +78,25 @@ async def simulate_disconnect(self) -> None:
         self._schedule_disconnect()
 
 
+class LineProtocol(AsyncProtocol[str]):
+    def __init__(self, name=None):
+        super().__init__(name)
+        self.rx_history = []
+
+    async def _do_recv(self) -> str:
+        raw = await self._readline()
+        msg = raw.decode()
+        self.rx_history.append(msg)
+        return msg
+
+    def _do_send(self, msg: str) -> None:
+        assert self._writer is not None
+        self._writer.write(msg.encode() + b'\n')
+
+    async def send_msg(self, msg: str) -> None:
+        await self._outgoing.put(msg)
+
+
 def run_as_task(coro, allow_cancellation=False):
     """
     Run a given coroutine as a task.
@@ -533,3 +552,32 @@ async def testConnectRequireDisconnecting(self):
              " Call disconnect() to return to IDLE state."),
             accept=False,
         )
+
+
+class SimpleSession(TestBase):
+
+    def setUp(self):
+        super().setUp()
+        self.server = LineProtocol(type(self).__name__ + '-server')
+
+    async def _asyncSetUp(self):
+        await super()._asyncSetUp()
+        await self._watch_runstates(*self.GOOD_CONNECTION_STATES)
+
+    async def _asyncTearDown(self):
+        await self.proto.disconnect()
+        try:
+            await self.server.disconnect()
+        except EOFError:
+            pass
+        await super()._asyncTearDown()
+
+    @TestBase.async_test
+    async def testSmoke(self):
+        with TemporaryDirectory(suffix='.aqmp') as tmpdir:
+            sock = os.path.join(tmpdir, type(self.proto).__name__ + ".sock")
+            server_task = create_task(self.server.accept(sock))
+
+            # give the server a chance to start listening [...]
+            await asyncio.sleep(0)
+            await self.proto.connect(sock)
-- 
2.31.1


