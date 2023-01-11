Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ECA446655B4
	for <lists+qemu-devel@lfdr.de>; Wed, 11 Jan 2023 09:06:28 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pFW2v-0000Ur-4j; Wed, 11 Jan 2023 03:01:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1pFW2s-0000UB-2n
 for qemu-devel@nongnu.org; Wed, 11 Jan 2023 03:01:14 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1pFW2q-0007mB-HR
 for qemu-devel@nongnu.org; Wed, 11 Jan 2023 03:01:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1673424071;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=bS+AcDY46aV7gj40IMfXK2m89SOwLfuN33Bzse56FHI=;
 b=NxdYzUqbtaKWR9SxRlwnKvbUQTEtkV8CPz6m/ZJKfREV4v5kA7ZQqa3CbFJ2+us9ARjmsE
 WmqmXz/TdQe7ltmmu9KLJ0nfX5d3UNisWP52NJJWCrTd6YzZJRCtCqNGEc+dDC/rWRHPsl
 6T/rfWBvMTmkT3ukg5fszOEjVDdhGjs=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-73-MQu2vmAzO8-7eoHcWkvfmg-1; Wed, 11 Jan 2023 03:01:10 -0500
X-MC-Unique: MQu2vmAzO8-7eoHcWkvfmg-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E648785C6EA
 for <qemu-devel@nongnu.org>; Wed, 11 Jan 2023 08:01:09 +0000 (UTC)
Received: from localhost (unknown [10.39.208.9])
 by smtp.corp.redhat.com (Postfix) with ESMTP id DBE47492B00;
 Wed, 11 Jan 2023 08:01:08 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Cc: berrange@redhat.com, Beraldo Leal <bleal@redhat.com>,
 John Snow <jsnow@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Subject: [PATCH v3 1/3] python/qmp/protocol: add open_with_socket()
Date: Wed, 11 Jan 2023 12:00:59 +0400
Message-Id: <20230111080101.969151-2-marcandre.lureau@redhat.com>
In-Reply-To: <20230111080101.969151-1-marcandre.lureau@redhat.com>
References: <20230111080101.969151-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=marcandre.lureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
---
 python/qemu/qmp/protocol.py | 25 ++++++++++++++++++++-----
 1 file changed, 20 insertions(+), 5 deletions(-)

diff --git a/python/qemu/qmp/protocol.py b/python/qemu/qmp/protocol.py
index 6ea86650ad..4710a57f91 100644
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


