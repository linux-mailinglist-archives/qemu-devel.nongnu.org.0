Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AFEE561A9B
	for <lists+qemu-devel@lfdr.de>; Thu, 30 Jun 2022 14:46:05 +0200 (CEST)
Received: from localhost ([::1]:46196 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o6tYa-0003pd-92
	for lists+qemu-devel@lfdr.de; Thu, 30 Jun 2022 08:46:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43670)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1o6tNq-0001HP-OV
 for qemu-devel@nongnu.org; Thu, 30 Jun 2022 08:35:42 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:46084)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1o6tNc-0002W1-DC
 for qemu-devel@nongnu.org; Thu, 30 Jun 2022 08:34:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1656592476;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=acfNEE+jF8Kbvxf5gT3sZcb8N5T6JldKBqTYFPg6/Fo=;
 b=QtqIZnWAYPkYDzpD1KcrjR2jFdrKgTdGG84wjsEEsTnGKc5ksmTeA9OP7DyhORTdEjA/vZ
 wNcCXmJsAEjnMn1MvlK6c3HC9+dnRZ8lgcg9CUEH9FCNAiD2/m5IZKLlEzdTN5SZNDNuiI
 Z0sizfzwyBNP4T7FNVWtFmduTcA/psU=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-77-JwhknGffNx6sW1THY93KFw-1; Thu, 30 Jun 2022 08:34:34 -0400
X-MC-Unique: JwhknGffNx6sW1THY93KFw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 42199299E746;
 Thu, 30 Jun 2022 12:34:34 +0000 (UTC)
Received: from localhost (unknown [10.39.208.43])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 1FBF740C141F;
 Thu, 30 Jun 2022 12:34:32 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Cc: Cleber Rosa <crosa@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 John Snow <jsnow@redhat.com>, berrange@redhat.com,
 Beraldo Leal <bleal@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Subject: [PATCH v2 2/3] python/qmp/legacy: make QEMUMonitorProtocol accept a
 socket
Date: Thu, 30 Jun 2022 16:34:18 +0400
Message-Id: <20220630123419.1019367-3-marcandre.lureau@redhat.com>
In-Reply-To: <20220630123419.1019367-1-marcandre.lureau@redhat.com>
References: <20220630123419.1019367-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.2
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

Teach QEMUMonitorProtocol to accept an exisiting socket.

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
---
 python/qemu/qmp/legacy.py | 18 +++++++++++++++---
 1 file changed, 15 insertions(+), 3 deletions(-)

diff --git a/python/qemu/qmp/legacy.py b/python/qemu/qmp/legacy.py
index 03b5574618fa..72e8f9af7362 100644
--- a/python/qemu/qmp/legacy.py
+++ b/python/qemu/qmp/legacy.py
@@ -22,6 +22,7 @@
 #
 
 import asyncio
+import socket
 from types import TracebackType
 from typing import (
     Any,
@@ -69,22 +70,32 @@ class QEMUMonitorProtocol:
 
     :param address:  QEMU address, can be either a unix socket path (string)
                      or a tuple in the form ( address, port ) for a TCP
-                     connection
+                     connection or None
+    :param sock:     a socket or None
     :param server:   Act as the socket server. (See 'accept')
     :param nickname: Optional nickname used for logging.
     """
 
-    def __init__(self, address: SocketAddrT,
+    def __init__(self,
+                 address: Optional[SocketAddrT] = None,
+                 sock: Optional[socket.socket] = None,
                  server: bool = False,
                  nickname: Optional[str] = None):
 
+        assert address or sock
         self._qmp = QMPClient(nickname)
         self._aloop = asyncio.get_event_loop()
         self._address = address
+        self._sock = sock
         self._timeout: Optional[float] = None
 
         if server:
-            self._sync(self._qmp.start_server(self._address))
+            if sock:
+                assert self._sock is not None
+                self._sync(self._qmp.open_with_socket(self._sock))
+            else:
+                assert self._address is not None
+                self._sync(self._qmp.start_server(self._address))
 
     _T = TypeVar('_T')
 
@@ -139,6 +150,7 @@ def connect(self, negotiate: bool = True) -> Optional[QMPMessage]:
         :return: QMP greeting dict, or None if negotiate is false
         :raise ConnectError: on connection errors
         """
+        assert self._address is not None
         self._qmp.await_greeting = negotiate
         self._qmp.negotiate = negotiate
 
-- 
2.37.0.rc0


