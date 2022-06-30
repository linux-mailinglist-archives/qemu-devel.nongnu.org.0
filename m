Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DDDB8561A8C
	for <lists+qemu-devel@lfdr.de>; Thu, 30 Jun 2022 14:42:17 +0200 (CEST)
Received: from localhost ([::1]:38924 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o6tUu-0006AP-S7
	for lists+qemu-devel@lfdr.de; Thu, 30 Jun 2022 08:42:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43622)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1o6tNn-0001GQ-FS
 for qemu-devel@nongnu.org; Thu, 30 Jun 2022 08:34:59 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:37504)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1o6tNV-0002M8-Jk
 for qemu-devel@nongnu.org; Thu, 30 Jun 2022 08:34:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1656592471;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=bSckYAWpr9FcEPLtfR0e6hVV7wSy7kRQQ9SKtegPjxE=;
 b=Mo/w01yCwg9+c6apim1JbN7AgtfFvGp0KFC2+F+lwUXQJ2hasY/kJNVAb4/P7J10wF1T6J
 koUbs76EyyAXDJq9l90Z/1F/2sYMpgsof68+U9C2/QezWKqxyqg25Gwlo2AlLxO6Gdskj4
 A7kC8c92nWQuDM314UBJoPE8u8ptJDY=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-367-uOu62abpODmNtNIqEIpEtg-1; Thu, 30 Jun 2022 08:34:30 -0400
X-MC-Unique: uOu62abpODmNtNIqEIpEtg-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 1400A1C0013B;
 Thu, 30 Jun 2022 12:34:30 +0000 (UTC)
Received: from localhost (unknown [10.39.208.43])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 221F641615A;
 Thu, 30 Jun 2022 12:34:28 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Cc: Cleber Rosa <crosa@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 John Snow <jsnow@redhat.com>, berrange@redhat.com,
 Beraldo Leal <bleal@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Subject: [PATCH v2 1/3] python/qmp/protocol: add open_with_socket()
Date: Thu, 30 Jun 2022 16:34:17 +0400
Message-Id: <20220630123419.1019367-2-marcandre.lureau@redhat.com>
In-Reply-To: <20220630123419.1019367-1-marcandre.lureau@redhat.com>
References: <20220630123419.1019367-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.10
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=marcandre.lureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Marc-André Lureau <marcandre.lureau@redhat.com>

Instead of listening for incoming connections with a SocketAddr, add a
new method open_with_socket() that accepts an existing socket.

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
---
 python/qemu/qmp/protocol.py | 25 ++++++++++++++++++++-----
 1 file changed, 20 insertions(+), 5 deletions(-)

diff --git a/python/qemu/qmp/protocol.py b/python/qemu/qmp/protocol.py
index 6ea86650ad24..4710a57f9126 100644
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
2.37.0.rc0


