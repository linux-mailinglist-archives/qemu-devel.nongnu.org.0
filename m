Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 437C940CA7C
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Sep 2021 18:39:57 +0200 (CEST)
Received: from localhost ([::1]:54976 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mQXwy-000243-8a
	for lists+qemu-devel@lfdr.de; Wed, 15 Sep 2021 12:39:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60138)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1mQXpI-0005TH-9A
 for qemu-devel@nongnu.org; Wed, 15 Sep 2021 12:32:00 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:54837)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1mQXpG-0005Yi-Mf
 for qemu-devel@nongnu.org; Wed, 15 Sep 2021 12:32:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631723518;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=lW4p/EelRiZW36aOLnrsvp2tjcOz5ulxundD4GJSKOg=;
 b=HiTyZ2QqnyBFkEIs0Pjs98lJ3VkSV66BGzEqCmVsa48dHdyoB6Un57s81UCelWcTrq9TSA
 i12QUyu3GIum0GsaMshYHyuI0HOszvWvLuMWp/3SIaGgeZYnYivvOsxHvC8f5KNoiUu85v
 YluuCGS2W+dTwMUV6I5VlH6TgyKMEqE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-154-UaQgBdJpPzOH5cx96I3c5A-1; Wed, 15 Sep 2021 12:31:56 -0400
X-MC-Unique: UaQgBdJpPzOH5cx96I3c5A-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A45FA800FF4;
 Wed, 15 Sep 2021 16:31:55 +0000 (UTC)
Received: from scv.redhat.com (unknown [10.22.11.132])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 668C97771A;
 Wed, 15 Sep 2021 16:31:54 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 26/27] python/aqmp: add LineProtocol tests
Date: Wed, 15 Sep 2021 12:29:54 -0400
Message-Id: <20210915162955.333025-27-jsnow@redhat.com>
In-Reply-To: <20210915162955.333025-1-jsnow@redhat.com>
References: <20210915162955.333025-1-jsnow@redhat.com>
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
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.39,
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
Cc: Eduardo Habkost <ehabkost@redhat.com>, Eric Blake <eblake@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 "Niteesh G . S ." <niteesh.gs@gmail.com>,
 Willian Rampazzo <wrampazz@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Tests a real connect, a real accept, and really sending and receiving a
message over a UNIX socket.

Brings coverage of protocol.py up to ~93%.

Signed-off-by: John Snow <jsnow@redhat.com>
---
 python/tests/protocol.py | 48 ++++++++++++++++++++++++++++++++++++++++
 1 file changed, 48 insertions(+)

diff --git a/python/tests/protocol.py b/python/tests/protocol.py
index f0682d29ce..5cd7938be3 100644
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


