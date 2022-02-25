Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 264D04C506F
	for <lists+qemu-devel@lfdr.de>; Fri, 25 Feb 2022 22:14:45 +0100 (CET)
Received: from localhost ([::1]:34170 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nNhvI-0003hB-7N
	for lists+qemu-devel@lfdr.de; Fri, 25 Feb 2022 16:14:44 -0500
Received: from eggs.gnu.org ([209.51.188.92]:59680)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1nNhi5-0003OV-Cl
 for qemu-devel@nongnu.org; Fri, 25 Feb 2022 16:01:05 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:31475)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1nNhi2-0005CK-EY
 for qemu-devel@nongnu.org; Fri, 25 Feb 2022 16:01:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1645822861;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qBeIBPnr1GcAbXlScMYi5nSzr6XuOopJrddRAo1JUl4=;
 b=e0fLLy7i0afYrwAWhkSaOStNvIJRDmN6C6LU1XurYRTwrMW++T1qlW+7RqfyxLoFGhhNWM
 RKhO+RZP6CeY6Ks8VTkZoGBT5HmRsJugl1g1IDDPtW6eB/ATJNvDXaWiQdWkG8EzjwFur7
 pcWNNXbUeEyHu7R8jnI1ZB1CnkzFIsQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-425-fDeCxZwVN3ioe3D0sgXNOQ-1; Fri, 25 Feb 2022 16:00:58 -0500
X-MC-Unique: fDeCxZwVN3ioe3D0sgXNOQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8C8115200;
 Fri, 25 Feb 2022 21:00:57 +0000 (UTC)
Received: from scv.redhat.com (unknown [10.22.34.166])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9CC871081302;
 Fri, 25 Feb 2022 21:00:56 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 10/10] python/aqmp: drop _bind_hack()
Date: Fri, 25 Feb 2022 15:59:48 -0500
Message-Id: <20220225205948.3693480-11-jsnow@redhat.com>
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

With the better fix in place, we don't need this anymore.

Fixes: b0b662bb2b3
Signed-off-by: John Snow <jsnow@redhat.com>
---
 python/qemu/aqmp/legacy.py   |  2 +-
 python/qemu/aqmp/protocol.py | 41 +++---------------------------------
 2 files changed, 4 insertions(+), 39 deletions(-)

diff --git a/python/qemu/aqmp/legacy.py b/python/qemu/aqmp/legacy.py
index cb50e60564..46026e9fdc 100644
--- a/python/qemu/aqmp/legacy.py
+++ b/python/qemu/aqmp/legacy.py
@@ -57,7 +57,7 @@ def __init__(self, address: SocketAddrT,
         self._timeout: Optional[float] = None
 
         if server:
-            self._sync(self._aqmp.start_server(address))
+            self._sync(self._aqmp.start_server(self._address))
 
     _T = TypeVar('_T')
 
diff --git a/python/qemu/aqmp/protocol.py b/python/qemu/aqmp/protocol.py
index 2ecba14555..36fae57f27 100644
--- a/python/qemu/aqmp/protocol.py
+++ b/python/qemu/aqmp/protocol.py
@@ -18,7 +18,6 @@
 from enum import Enum
 from functools import wraps
 import logging
-import socket
 from ssl import SSLContext
 from typing import (
     Any,
@@ -242,9 +241,6 @@ def __init__(self, name: Optional[str] = None) -> None:
         self._runstate = Runstate.IDLE
         self._runstate_changed: Optional[asyncio.Event] = None
 
-        # Workaround for bind()
-        self._sock: Optional[socket.socket] = None
-
         # Server state for start_server() and _incoming()
         self._server: Optional[asyncio.AbstractServer] = None
         self._accepted: Optional[asyncio.Event] = None
@@ -535,34 +531,6 @@ async def _incoming(self,
         self._reader, self._writer = (reader, writer)
         self._accepted.set()
 
-    def _bind_hack(self, address: Union[str, Tuple[str, int]]) -> None:
-        """
-        Used to create a socket in advance of accept().
-
-        This is a workaround to ensure that we can guarantee timing of
-        precisely when a socket exists to avoid a connection attempt
-        bouncing off of nothing.
-
-        Python 3.7+ adds a feature to separate the server creation and
-        listening phases instead, and should be used instead of this
-        hack.
-        """
-        if isinstance(address, tuple):
-            family = socket.AF_INET
-        else:
-            family = socket.AF_UNIX
-
-        sock = socket.socket(family, socket.SOCK_STREAM)
-        sock.setsockopt(socket.SOL_SOCKET, socket.SO_REUSEADDR, 1)
-
-        try:
-            sock.bind(address)
-        except:
-            sock.close()
-            raise
-
-        self._sock = sock
-
     @upper_half
     async def _do_start_server(self, address: SocketAddrT,
                                ssl: Optional[SSLContext] = None) -> None:
@@ -589,21 +557,19 @@ async def _do_start_server(self, address: SocketAddrT,
         if isinstance(address, tuple):
             coro = asyncio.start_server(
                 self._incoming,
-                host=None if self._sock else address[0],
-                port=None if self._sock else address[1],
+                host=address[0],
+                port=address[1],
                 ssl=ssl,
                 backlog=1,
                 limit=self._limit,
-                sock=self._sock,
             )
         else:
             coro = asyncio.start_unix_server(
                 self._incoming,
-                path=None if self._sock else address,
+                path=address,
                 ssl=ssl,
                 backlog=1,
                 limit=self._limit,
-                sock=self._sock,
             )
 
         # Allow runstate watchers to witness 'CONNECTING' state; some
@@ -630,7 +596,6 @@ async def _do_accept(self) -> None:
         await self._accepted.wait()
         assert self._server is None
         self._accepted = None
-        self._sock = None
 
         self.logger.debug("Connection accepted.")
 
-- 
2.34.1


