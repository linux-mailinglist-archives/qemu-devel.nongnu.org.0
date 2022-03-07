Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 764424D0AFA
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Mar 2022 23:23:26 +0100 (CET)
Received: from localhost ([::1]:39912 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nRLlF-0007vs-J9
	for lists+qemu-devel@lfdr.de; Mon, 07 Mar 2022 17:23:25 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48030)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1nRLdZ-0006Qt-8z
 for qemu-devel@nongnu.org; Mon, 07 Mar 2022 17:15:29 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:32925)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1nRLdV-00017U-Uj
 for qemu-devel@nongnu.org; Mon, 07 Mar 2022 17:15:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646691325;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=t8gz09ntCPRLWwaJkHCehmtew93vnxuUfAtDfOtlsXg=;
 b=dH0nnhIXOohJoE1Mo7mnaAyJlwlABWZcs3QdkWSMfrO5jTS88M7Cc9zr3JnYVpkBT8k5pR
 xKP2NDQHJ8AjD7orL80cy7wEW+kHfNLETT2ZyFv9AG+QTHHTKYvs3uL4nqzLj5QJTbksEQ
 exoYZnzHCAoMj6TNat2BTpGoiCE1Bcs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-433-U4F2Aak9PHmVOVMaJuAa4A-1; Mon, 07 Mar 2022 17:15:22 -0500
X-MC-Unique: U4F2Aak9PHmVOVMaJuAa4A-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2E7BE801AFC;
 Mon,  7 Mar 2022 22:15:21 +0000 (UTC)
Received: from scv.redhat.com (unknown [10.22.10.176])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2AB6B5E253;
 Mon,  7 Mar 2022 22:15:20 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 10/11] python/aqmp: drop _bind_hack()
Date: Mon,  7 Mar 2022 17:15:06 -0500
Message-Id: <20220307221507.1218892-11-jsnow@redhat.com>
In-Reply-To: <20220307221507.1218892-1-jsnow@redhat.com>
References: <20220307221507.1218892-1-jsnow@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Beraldo Leal <bleal@redhat.com>, qemu-block@nongnu.org,
 Markus Armbruster <armbru@redhat.com>, Eduardo Habkost <eduardo@habkost.net>,
 Hanna Reitz <hreitz@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

_bind_hack() was a quick fix to allow async QMP to call bind(2) prior to
calling listen(2) and accept(2). This wasn't sufficient to fully address
the race condition present in synchronous clients.

With the race condition in legacy.py fixed (see the previous commit),
there are no longer any users of _bind_hack(). Drop it.

Fixes: b0b662bb2b3
Signed-off-by: John Snow <jsnow@redhat.com>
Acked-by: Kevin Wolf <kwolf@redhat.com>
Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
Message-id: 20220225205948.3693480-11-jsnow@redhat.com
[Expanded commit message. --js]
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


