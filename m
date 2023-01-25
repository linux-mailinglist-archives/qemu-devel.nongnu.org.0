Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B060467A8D9
	for <lists+qemu-devel@lfdr.de>; Wed, 25 Jan 2023 03:36:33 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pKVcq-0008It-KS; Tue, 24 Jan 2023 21:35:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1pKVcm-0008F3-UM
 for qemu-devel@nongnu.org; Tue, 24 Jan 2023 21:34:56 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1pKVck-0005MH-K6
 for qemu-devel@nongnu.org; Tue, 24 Jan 2023 21:34:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1674614094;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Kh2UIVP0oDViKp1JJ8UeYAuwvNJ0YjmX6dknYE+RpOc=;
 b=Tw9pOOO2uCfqKdt3PSjNLVqVgKCCcb9C/q5e68Vuc2rU7EDaGVgil5naB9G1mb9ZtcBSdL
 c9OeNEeLSYip/7TptVwSzYh9GgnDtR3M/9yW0lISN+LtyeVq2ceKFlFy95iIWkQ/NCB3nl
 hLk9isGxMO1x9fj3qPApMpOpn6Y/N7g=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-320-xFSe0r5XN-uxftm8OrUxXg-1; Tue, 24 Jan 2023 21:34:50 -0500
X-MC-Unique: xFSe0r5XN-uxftm8OrUxXg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 1B79F802BF5;
 Wed, 25 Jan 2023 02:34:50 +0000 (UTC)
Received: from scv.redhat.com (unknown [10.22.16.119])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 831182026D4B;
 Wed, 25 Jan 2023 02:34:49 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Kevin Wolf <kwolf@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>, John Snow <jsnow@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>, qemu-block@nongnu.org,
 Cleber Rosa <crosa@redhat.com>,
 Vladimir Sementsov-Ogievskiy <v.sementsov-og@mail.ru>,
 Beraldo Leal <bleal@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>
Subject: [PULL 5/7] python/qmp/protocol: add open_with_socket()
Date: Tue, 24 Jan 2023 21:34:43 -0500
Message-Id: <20230125023445.3655253-6-jsnow@redhat.com>
In-Reply-To: <20230125023445.3655253-1-jsnow@redhat.com>
References: <20230125023445.3655253-1-jsnow@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Marc-André Lureau <marcandre.lureau@redhat.com>

Instead of listening for incoming connections with a SocketAddr, add a
new method open_with_socket() that accepts an existing socket.

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
Message-id: 20230111080101.969151-2-marcandre.lureau@redhat.com
Signed-off-by: John Snow <jsnow@redhat.com>
---
 python/qemu/qmp/protocol.py | 25 ++++++++++++++++++++-----
 1 file changed, 20 insertions(+), 5 deletions(-)

diff --git a/python/qemu/qmp/protocol.py b/python/qemu/qmp/protocol.py
index 15909b7dbad..6d3d739daa7 100644
--- a/python/qemu/qmp/protocol.py
+++ b/python/qemu/qmp/protocol.py
@@ -18,6 +18,7 @@
 from enum import Enum
 from functools import wraps
 import logging
+import socket
 from ssl import SSLContext
 from typing import (
     Any,
@@ -296,6 +297,19 @@ async def start_server_and_accept(
         await self.accept()
         assert self.runstate == Runstate.RUNNING
 
+    @upper_half
+    @require(Runstate.IDLE)
+    async def open_with_socket(self, sock: socket.socket) -> None:
+        """
+        Start connection with given socket.
+
+        :param sock: A socket.
+
+        :raise StateError: When the `Runstate` is not `IDLE`.
+        """
+        self._reader, self._writer = await asyncio.open_connection(sock=sock)
+        self._set_state(Runstate.CONNECTING)
+
     @upper_half
     @require(Runstate.IDLE)
     async def start_server(self, address: SocketAddrT,
@@ -343,11 +357,12 @@ async def accept(self) -> None:
             protocol-level failure occurs while establishing a new
             session, the wrapped error may also be an `QMPError`.
         """
-        if self._accepted is None:
-            raise QMPError("Cannot call accept() before start_server().")
-        await self._session_guard(
-            self._do_accept(),
-            'Failed to establish connection')
+        if not self._reader:
+            if self._accepted is None:
+                raise QMPError("Cannot call accept() before start_server().")
+            await self._session_guard(
+                self._do_accept(),
+                'Failed to establish connection')
         await self._session_guard(
             self._establish_session(),
             'Failed to establish session')
-- 
2.39.0


