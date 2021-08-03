Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D3A123DF4D2
	for <lists+qemu-devel@lfdr.de>; Tue,  3 Aug 2021 20:37:28 +0200 (CEST)
Received: from localhost ([::1]:58274 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mAzI7-0001nd-SH
	for lists+qemu-devel@lfdr.de; Tue, 03 Aug 2021 14:37:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53596)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1mAzBF-0004VB-NU
 for qemu-devel@nongnu.org; Tue, 03 Aug 2021 14:30:22 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:58454)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1mAzBC-0006Al-Rx
 for qemu-devel@nongnu.org; Tue, 03 Aug 2021 14:30:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1628015418;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/rySWcgeC8+VsWEgHdLwSmjxG0chmhIKEQ9PnHh8QrA=;
 b=W8FcKHdruk4slX7LoqbDfHyutgfxymgCPYcEH0NbtOcPlrtBhXox78nIT72QoWIQn6rNHe
 pXp/oAWSkSKIyw0CKtWYapc7fSFeKhOP5qq0Jvqxh/URsVpydjI8x5PpAnPpfx6xPLHo+i
 wtMi1vYJVXYn38p2GDPihUnkCRvSZrc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-284-xq0Jv-S2NA68V3ySJwFOfw-1; Tue, 03 Aug 2021 14:30:17 -0400
X-MC-Unique: xq0Jv-S2NA68V3ySJwFOfw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 219CF87D541;
 Tue,  3 Aug 2021 18:30:16 +0000 (UTC)
Received: from scv.redhat.com (unknown [10.22.11.3])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E4E9B7A8D5;
 Tue,  3 Aug 2021 18:30:14 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 10/25] python/aqmp: add configurable read buffer limit
Date: Tue,  3 Aug 2021 14:29:26 -0400
Message-Id: <20210803182941.504537-11-jsnow@redhat.com>
In-Reply-To: <20210803182941.504537-1-jsnow@redhat.com>
References: <20210803182941.504537-1-jsnow@redhat.com>
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
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Willian Rampazzo <wrampazz@redhat.com>, Eric Blake <eblake@redhat.com>,
 Markus Armbruster <armbru@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 "Niteesh G . S ." <niteesh.gs@gmail.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 John Snow <jsnow@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

QMP can transmit some pretty big messages, and the default limit of 64KB
isn't sufficient. Make sure that we can configure it.

Reported-by: G S Niteesh Babu <niteesh.gs@gmail.com>
Signed-off-by: John Snow <jsnow@redhat.com>
---
 python/qemu/aqmp/protocol.py | 18 ++++++++++++++++--
 1 file changed, 16 insertions(+), 2 deletions(-)

diff --git a/python/qemu/aqmp/protocol.py b/python/qemu/aqmp/protocol.py
index 7eca65aa265..28f025928c0 100644
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


