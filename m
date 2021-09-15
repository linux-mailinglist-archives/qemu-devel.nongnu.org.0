Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F143E40CABC
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Sep 2021 18:41:10 +0200 (CEST)
Received: from localhost ([::1]:57314 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mQXyA-0003bu-0U
	for lists+qemu-devel@lfdr.de; Wed, 15 Sep 2021 12:41:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59774)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1mQXoZ-00043O-5a
 for qemu-devel@nongnu.org; Wed, 15 Sep 2021 12:31:15 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:43528)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1mQXoW-0004uf-Os
 for qemu-devel@nongnu.org; Wed, 15 Sep 2021 12:31:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631723472;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=252kVfb3qyFd6mzpp+co0OW3S/qXcMRHawcaccOecCw=;
 b=irHUzwlzDv3AkWmnCsDIDo2piV6ogORGiiiuXxzO6klxtAUWd1zHwucsLALCv2Af5S2nOt
 UFcUe/jI2rsd59m+e5KxojarpUkDFVuvXxHpxkxi0fMV4b4WwmwOsrR/54GXKSvkHzcn+m
 wdLt9OdCqJtH7yq6pOqQACGHD0One74=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-604-qBh0kNSmOGCOxAGo5l2eJg-1; Wed, 15 Sep 2021 12:31:10 -0400
X-MC-Unique: qBh0kNSmOGCOxAGo5l2eJg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 12AF9802B9F;
 Wed, 15 Sep 2021 16:31:10 +0000 (UTC)
Received: from scv.redhat.com (unknown [10.22.11.132])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B68D47771A;
 Wed, 15 Sep 2021 16:31:08 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 10/27] python/aqmp: add configurable read buffer limit
Date: Wed, 15 Sep 2021 12:29:38 -0400
Message-Id: <20210915162955.333025-11-jsnow@redhat.com>
In-Reply-To: <20210915162955.333025-1-jsnow@redhat.com>
References: <20210915162955.333025-1-jsnow@redhat.com>
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
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.39,
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
Cc: Eduardo Habkost <ehabkost@redhat.com>, Eric Blake <eblake@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 "Niteesh G . S ." <niteesh.gs@gmail.com>,
 Willian Rampazzo <wrampazz@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

QMP can transmit some pretty big messages, and the default limit of 64KB
isn't sufficient. Make sure that we can configure it.

Reported-by: G S Niteesh Babu <niteesh.gs@gmail.com>
Signed-off-by: John Snow <jsnow@redhat.com>
Reviewed-by: Eric Blake <eblake@redhat.com>
---
 python/qemu/aqmp/protocol.py | 18 ++++++++++++++++--
 1 file changed, 16 insertions(+), 2 deletions(-)

diff --git a/python/qemu/aqmp/protocol.py b/python/qemu/aqmp/protocol.py
index 62c26ede5a..2ef19e9693 100644
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


