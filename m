Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4ECB7494134
	for <lists+qemu-devel@lfdr.de>; Wed, 19 Jan 2022 20:48:55 +0100 (CET)
Received: from localhost ([::1]:48602 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nAGww-0003XX-Et
	for lists+qemu-devel@lfdr.de; Wed, 19 Jan 2022 14:48:54 -0500
Received: from eggs.gnu.org ([209.51.188.92]:52042)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1nAGoA-0002LK-Vx
 for qemu-devel@nongnu.org; Wed, 19 Jan 2022 14:39:51 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:22950)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1nAGo9-0007eY-0w
 for qemu-devel@nongnu.org; Wed, 19 Jan 2022 14:39:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1642621188;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=AGhNdAQBME3pk+N57nd5SaJV8m2S3KfkktNXxKusS0s=;
 b=eYnGrLv3KRc2JORifUFp/ObP5j/Vd1DGoQ0vaE8Ma0fVNPNEfIsbGnNN8kyT2EeIuZlK5w
 OttGmwKcqGr53BiyezEqf/UWld+4vHrQKkdDTRMgeIs0LwDdjIwePfMEVtk+ynuNFD4Slz
 8aKhRLCVak8LNCPytsnbpji85nf2Kuo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-380-G5TzNbqXMJK4a1aaWbKgkQ-1; Wed, 19 Jan 2022 14:39:45 -0500
X-MC-Unique: G5TzNbqXMJK4a1aaWbKgkQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 423961083F60;
 Wed, 19 Jan 2022 19:39:44 +0000 (UTC)
Received: from scv.redhat.com (unknown [10.22.19.60])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 6BCFF196F1;
 Wed, 19 Jan 2022 19:39:42 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 5/5] python/aqmp: add socket bind step to legacy.py
Date: Wed, 19 Jan 2022 14:39:16 -0500
Message-Id: <20220119193916.4138217-6-jsnow@redhat.com>
In-Reply-To: <20220119193916.4138217-1-jsnow@redhat.com>
References: <20220119193916.4138217-1-jsnow@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, Eduardo Habkost <eduardo@habkost.net>,
 Beraldo Leal <bleal@redhat.com>, qemu-block@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>,
 Markus Armbruster <armbru@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 Cleber Rosa <crosa@redhat.com>, John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The old QMP library would actually bind to the server address during
__init__(). The new library delays this to the accept() call, because
binding occurs inside of the call to start_[unix_]server(), which is an
async method -- so it cannot happen during __init__ anymore.

Python 3.7+ adds the ability to create the server (and thus the bind()
call) and begin the active listening in separate steps, but we don't
have that functionality in 3.6, our current minimum.

Therefore ... Add a temporary workaround that allows the synchronous
version of the client to bind the socket in advance, guaranteeing that
there will be a UNIX socket in the filesystem ready for the QEMU client
to connect to without a race condition.

(Yes, it's ugly; fixing it more nicely will unfortunately have to wait
until I can stipulate Python 3.7+ as our minimum version. Python 3.6 is
EOL as of the beginning of this year, but I haven't checked if all of
our supported build platforms have a properly modern Python available
yet.)

Signed-off-by: John Snow <jsnow@redhat.com>
---
 python/qemu/aqmp/legacy.py   |  3 +++
 python/qemu/aqmp/protocol.py | 41 +++++++++++++++++++++++++++++++++---
 2 files changed, 41 insertions(+), 3 deletions(-)

diff --git a/python/qemu/aqmp/legacy.py b/python/qemu/aqmp/legacy.py
index 9e7b9fb80b..cf7634ee95 100644
--- a/python/qemu/aqmp/legacy.py
+++ b/python/qemu/aqmp/legacy.py
@@ -33,6 +33,9 @@ def __init__(self, address: SocketAddrT,
         self._address = address
         self._timeout: Optional[float] = None
 
+        if server:
+            self._aqmp._bind_hack(address)  # pylint: disable=protected-access
+
     _T = TypeVar('_T')
 
     def _sync(
diff --git a/python/qemu/aqmp/protocol.py b/python/qemu/aqmp/protocol.py
index c4fbe35a0e..eb740a5452 100644
--- a/python/qemu/aqmp/protocol.py
+++ b/python/qemu/aqmp/protocol.py
@@ -15,6 +15,7 @@
 from enum import Enum
 from functools import wraps
 import logging
+import socket
 from ssl import SSLContext
 from typing import (
     Any,
@@ -234,6 +235,9 @@ def __init__(self, name: Optional[str] = None) -> None:
         self._runstate = Runstate.IDLE
         self._runstate_changed: Optional[asyncio.Event] = None
 
+        # Workaround for bind()
+        self._sock: Optional[socket.socket] = None
+
     def __repr__(self) -> str:
         cls_name = type(self).__name__
         tokens = []
@@ -423,6 +427,34 @@ async def _establish_connection(
         else:
             await self._do_connect(address, ssl)
 
+    def _bind_hack(self, address: Union[str, Tuple[str, int]]) -> None:
+        """
+        Used to create a socket in advance of accept().
+
+        This is a workaround to ensure that we can guarantee timing of
+        precisely when a socket exists to avoid a connection attempt
+        bouncing off of nothing.
+
+        Python 3.7+ adds a feature to separate the server creation and
+        listening phases instead, and should be used instead of this
+        hack.
+        """
+        if isinstance(address, tuple):
+            family = socket.AF_INET
+        else:
+            family = socket.AF_UNIX
+
+        sock = socket.socket(family, socket.SOCK_STREAM)
+        sock.setsockopt(socket.SOL_SOCKET, socket.SO_REUSEADDR, 1)
+
+        try:
+            sock.bind(address)
+        except:
+            sock.close()
+            raise
+
+        self._sock = sock
+
     @upper_half
     async def _do_accept(self, address: Union[str, Tuple[str, int]],
                          ssl: Optional[SSLContext] = None) -> None:
@@ -460,24 +492,27 @@ async def _client_connected_cb(reader: asyncio.StreamReader,
         if isinstance(address, tuple):
             coro = asyncio.start_server(
                 _client_connected_cb,
-                host=address[0],
-                port=address[1],
+                host=None if self._sock else address[0],
+                port=None if self._sock else address[1],
                 ssl=ssl,
                 backlog=1,
                 limit=self._limit,
+                sock=self._sock,
             )
         else:
             coro = asyncio.start_unix_server(
                 _client_connected_cb,
-                path=address,
+                path=None if self._sock else address,
                 ssl=ssl,
                 backlog=1,
                 limit=self._limit,
+                sock=self._sock,
             )
 
         server = await coro     # Starts listening
         await connected.wait()  # Waits for the callback to fire (and finish)
         assert server is None
+        self._sock = None
 
         self.logger.debug("Connection accepted.")
 
-- 
2.31.1


