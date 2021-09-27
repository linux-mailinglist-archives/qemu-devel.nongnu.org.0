Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9531A419F50
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Sep 2021 21:42:18 +0200 (CEST)
Received: from localhost ([::1]:42528 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mUwW1-0002Jg-JL
	for lists+qemu-devel@lfdr.de; Mon, 27 Sep 2021 15:42:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57812)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1mUwHt-0003Sd-JX
 for qemu-devel@nongnu.org; Mon, 27 Sep 2021 15:27:41 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:38297)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1mUwHr-0007P9-St
 for qemu-devel@nongnu.org; Mon, 27 Sep 2021 15:27:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1632770859;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5bXw48pGXenFR8Znjwp1tOJ/BfFdT4xpOZbVwehQB38=;
 b=Kj31D7iEAuAnrqEyw+rmPWEnQjx8zmc5b9eFj7ecDDel9ANIlbOLLbXmummLEir8C6oaj2
 xmbBcUxN1aXNoBq6u2Nigbcj4KwLwwHFfBkLoAZp+Bd2zpVakypXYdPpeB43tVUo9YZ6i9
 uZM1VNBhqGsdqmi8CwiuXgv6zi2WqMU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-358-tp7kp0mtPWuBiHh0KB9mow-1; Mon, 27 Sep 2021 15:27:37 -0400
X-MC-Unique: tp7kp0mtPWuBiHh0KB9mow-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A3C5E1006AA3;
 Mon, 27 Sep 2021 19:27:36 +0000 (UTC)
Received: from scv.redhat.com (unknown [10.22.9.55])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 715F060871;
 Mon, 27 Sep 2021 19:27:21 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 10/32] python/aqmp: add configurable read buffer limit
Date: Mon, 27 Sep 2021 15:24:51 -0400
Message-Id: <20210927192513.744199-11-jsnow@redhat.com>
In-Reply-To: <20210927192513.744199-1-jsnow@redhat.com>
References: <20210927192513.744199-1-jsnow@redhat.com>
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
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 Daniel Berrange <berrange@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Markus Armbruster <armbru@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Willian Rampazzo <willianr@redhat.com>,
 G S Niteesh Babu <niteesh.gs@gmail.com>, Cleber Rosa <crosa@redhat.com>,
 John Snow <jsnow@redhat.com>, Eric Blake <eblake@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

QMP can transmit some pretty big messages, and the default limit of 64KB
isn't sufficient. Make sure that we can configure it.

Reported-by: G S Niteesh Babu <niteesh.gs@gmail.com>
Signed-off-by: John Snow <jsnow@redhat.com>
Reviewed-by: Eric Blake <eblake@redhat.com>
Message-id: 20210915162955.333025-11-jsnow@redhat.com
Signed-off-by: John Snow <jsnow@redhat.com>
---
 python/qemu/aqmp/protocol.py | 18 ++++++++++++++++--
 1 file changed, 16 insertions(+), 2 deletions(-)

diff --git a/python/qemu/aqmp/protocol.py b/python/qemu/aqmp/protocol.py
index 62c26ede5a4..2ef19e96932 100644
--- a/python/qemu/aqmp/protocol.py
+++ b/python/qemu/aqmp/protocol.py
@@ -189,6 +189,9 @@ class AsyncProtocol(Generic[T]):
     #: Logger object for debugging messages from this connection.
     logger = logging.getLogger(__name__)
 
+    # Maximum allowable size of read buffer
+    _limit = (64 * 1024)
+
     # -------------------------
     # Section: Public interface
     # -------------------------
@@ -452,6 +455,7 @@ async def _client_connected_cb(reader: asyncio.StreamReader,
                 port=address[1],
                 ssl=ssl,
                 backlog=1,
+                limit=self._limit,
             )
         else:
             coro = asyncio.start_unix_server(
@@ -459,6 +463,7 @@ async def _client_connected_cb(reader: asyncio.StreamReader,
                 path=address,
                 ssl=ssl,
                 backlog=1,
+                limit=self._limit,
             )
 
         server = await coro     # Starts listening
@@ -482,9 +487,18 @@ async def _do_connect(self, address: Union[str, Tuple[str, int]],
         self.logger.debug("Connecting to %s ...", address)
 
         if isinstance(address, tuple):
-            connect = asyncio.open_connection(address[0], address[1], ssl=ssl)
+            connect = asyncio.open_connection(
+                address[0],
+                address[1],
+                ssl=ssl,
+                limit=self._limit,
+            )
         else:
-            connect = asyncio.open_unix_connection(path=address, ssl=ssl)
+            connect = asyncio.open_unix_connection(
+                path=address,
+                ssl=ssl,
+                limit=self._limit,
+            )
         self._reader, self._writer = await connect
 
         self.logger.debug("Connected.")
-- 
2.31.1


