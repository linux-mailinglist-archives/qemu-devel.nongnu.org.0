Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 353AC6655B6
	for <lists+qemu-devel@lfdr.de>; Wed, 11 Jan 2023 09:08:01 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pFW2z-0000aX-Rj; Wed, 11 Jan 2023 03:01:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1pFW2x-0000Vr-QC
 for qemu-devel@nongnu.org; Wed, 11 Jan 2023 03:01:19 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1pFW2w-0007mr-7F
 for qemu-devel@nongnu.org; Wed, 11 Jan 2023 03:01:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1673424077;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qHU/Cv3Zy/GsQ5swx7DU249gMPLTasss25z+tC6OtUw=;
 b=YM1PjuvdKt5QOFaOpw+7e9fn73IgnEp4hclreG+F0ibd+TxkFf9sWZntBUIqis1kK2yaMW
 zdD47cK6OglNDgKTfbySOQSoIcR9twAhO9QquYZ8QYVOydgrI1mBPG/WvYo8lVWehZPSRE
 zGsUcSzg2VmBViL9BLgmP8j2zUSXDnU=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-659-dmXbu1xeMqSlmqWVOvVL3A-1; Wed, 11 Jan 2023 03:01:16 -0500
X-MC-Unique: dmXbu1xeMqSlmqWVOvVL3A-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id CB4C3183B3CA
 for <qemu-devel@nongnu.org>; Wed, 11 Jan 2023 08:01:15 +0000 (UTC)
Received: from localhost (unknown [10.39.208.9])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D709D492C14;
 Wed, 11 Jan 2023 08:01:14 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Cc: berrange@redhat.com, Beraldo Leal <bleal@redhat.com>,
 John Snow <jsnow@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Subject: [PATCH v3 2/3] python/qmp/legacy: make QEMUMonitorProtocol accept a
 socket
Date: Wed, 11 Jan 2023 12:01:00 +0400
Message-Id: <20230111080101.969151-3-marcandre.lureau@redhat.com>
In-Reply-To: <20230111080101.969151-1-marcandre.lureau@redhat.com>
References: <20230111080101.969151-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
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

Teach QEMUMonitorProtocol to accept an exisiting socket.

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
---
 python/qemu/qmp/legacy.py | 18 +++++++++++++++---
 1 file changed, 15 insertions(+), 3 deletions(-)

diff --git a/python/qemu/qmp/legacy.py b/python/qemu/qmp/legacy.py
index 1951754455..8b09ee7dbb 100644
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
2.39.0


