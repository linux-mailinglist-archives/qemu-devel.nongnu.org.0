Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 791DF4C5062
	for <lists+qemu-devel@lfdr.de>; Fri, 25 Feb 2022 22:12:30 +0100 (CET)
Received: from localhost ([::1]:58244 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nNht7-0000jk-3D
	for lists+qemu-devel@lfdr.de; Fri, 25 Feb 2022 16:12:29 -0500
Received: from eggs.gnu.org ([209.51.188.92]:59598)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1nNhhy-0003Dl-8w
 for qemu-devel@nongnu.org; Fri, 25 Feb 2022 16:01:02 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:20563)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1nNhhw-0005BQ-89
 for qemu-devel@nongnu.org; Fri, 25 Feb 2022 16:00:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1645822855;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qp3TmzQC0iIdFoN6yDz66LNiWkRVhj677mzdc5qavKY=;
 b=AjeA6rTjoguIdHz0ltPLIcxMkFTMcj4wAKtcrjFYT7Arbxprm7QHDpXSgEv4csHK1bti+D
 k1Y1s7xfZQHIHxySHV94OIifSFGYO85BkrTAx29D6fwT4oQR/POECJxezmw3izPP3wO2UD
 y/KhycOq4G1rQrGMOKPzQyy4kxGLCFg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-671-RYaabJKJPBWv6Rqu_dpLWw-1; Fri, 25 Feb 2022 16:00:54 -0500
X-MC-Unique: RYaabJKJPBWv6Rqu_dpLWw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1813D180FD71;
 Fri, 25 Feb 2022 21:00:53 +0000 (UTC)
Received: from scv.redhat.com (unknown [10.22.34.166])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 33FC71081357;
 Fri, 25 Feb 2022 21:00:52 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 06/10] python/aqmp: refactor _do_accept() into two distinct
 steps
Date: Fri, 25 Feb 2022 15:59:44 -0500
Message-Id: <20220225205948.3693480-7-jsnow@redhat.com>
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
Received-SPF: pass client-ip=170.10.129.124; envelope-from=jsnow@redhat.com;
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

Refactor _do_accept() into _do_start_server() and _do_accept(). As of
this commit, the former calls the latter, but in subsequent commits
they'll be split apart.

(So please forgive the misnomer for _do_start_server(); it will live up
to its name shortly, and the docstring will be updated then too. I'm
just cutting down on some churn.)

Signed-off-by: John Snow <jsnow@redhat.com>
---
 python/qemu/aqmp/protocol.py | 29 ++++++++++++++++++++++++-----
 python/tests/protocol.py     |  4 ++--
 2 files changed, 26 insertions(+), 7 deletions(-)

diff --git a/python/qemu/aqmp/protocol.py b/python/qemu/aqmp/protocol.py
index 631bcdaa55..e2bdad542d 100644
--- a/python/qemu/aqmp/protocol.py
+++ b/python/qemu/aqmp/protocol.py
@@ -295,7 +295,7 @@ async def start_server_and_accept(
             session, the wrapped error may also be an `QMPError`.
         """
         await self._session_guard(
-            self._do_accept(address, ssl),
+            self._do_start_server(address, ssl),
             'Failed to establish connection')
         await self._session_guard(
             self._establish_session(),
@@ -509,8 +509,8 @@ def _bind_hack(self, address: Union[str, Tuple[str, int]]) -> None:
         self._sock = sock
 
     @upper_half
-    async def _do_accept(self, address: SocketAddrT,
-                         ssl: Optional[SSLContext] = None) -> None:
+    async def _do_start_server(self, address: SocketAddrT,
+                               ssl: Optional[SSLContext] = None) -> None:
         """
         Acting as the transport server, accept a single connection.
 
@@ -551,9 +551,28 @@ async def _do_accept(self, address: SocketAddrT,
         # otherwise yield.
         await asyncio.sleep(0)
 
-        self._server = await coro    # Starts listening
-        await self._accepted.wait()  # Waits for the callback to finish
+        # This will start the server (bind(2), listen(2)). It will also
+        # call accept(2) if we yield, but we don't block on that here.
+        self._server = await coro
+
+        # Just for this one commit, wait for a peer.
+        # This gets split out in the next patch.
+        await self._do_accept()
+
+    @upper_half
+    async def _do_accept(self) -> None:
+        """
+        Wait for and accept an incoming connection.
+
+        Requires that we have not yet accepted an incoming connection
+        from the upper_half, but it's OK if the server is no longer
+        running because the bottom_half has already accepted the
+        connection.
+        """
+        assert self._accepted is not None
+        await self._accepted.wait()
         assert self._server is None
+        self._accepted = None
         self._sock = None
 
         self.logger.debug("Connection accepted.")
diff --git a/python/tests/protocol.py b/python/tests/protocol.py
index 8dd26c4ed1..5e442e1efb 100644
--- a/python/tests/protocol.py
+++ b/python/tests/protocol.py
@@ -41,12 +41,12 @@ async def _establish_session(self):
         self.trigger_input = asyncio.Event()
         await super()._establish_session()
 
-    async def _do_accept(self, address, ssl=None):
+    async def _do_start_server(self, address, ssl=None):
         if self.fake_session:
             self._set_state(Runstate.CONNECTING)
             await asyncio.sleep(0)
         else:
-            await super()._do_accept(address, ssl)
+            await super()._do_start_server(address, ssl)
 
     async def _do_connect(self, address, ssl=None):
         if self.fake_session:
-- 
2.34.1


