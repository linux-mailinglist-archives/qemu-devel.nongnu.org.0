Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A4FE419F57
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Sep 2021 21:44:00 +0200 (CEST)
Received: from localhost ([::1]:46298 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mUwXf-0004nc-Du
	for lists+qemu-devel@lfdr.de; Mon, 27 Sep 2021 15:43:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57922)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1mUwIH-0004dI-52
 for qemu-devel@nongnu.org; Mon, 27 Sep 2021 15:28:05 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:44841)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1mUwIF-0007hV-C3
 for qemu-devel@nongnu.org; Mon, 27 Sep 2021 15:28:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1632770881;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=vCFPN4woAGZkEh8h0rkrAcdSMP8m+13G+1mPAhIik60=;
 b=hYAkd+V8kpxkKyi8IKC8rrxn5S+LnO2JPkIiy86hz7u81x35K2p8+gdfeOPLjwFpoGHez6
 XON8AcmrBGCx9LcaqJyVNVaTfsI+ZpHMxVq9zdc71xdMpL3jvkw1/QvzLLZYNKbGmNgcay
 A620XGqZgMwAFgUbZXlDYbIB9KdcwJs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-551-M3uKzz15O2W1BjICd1rpag-1; Mon, 27 Sep 2021 15:28:00 -0400
X-MC-Unique: M3uKzz15O2W1BjICd1rpag-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 28F221084683;
 Mon, 27 Sep 2021 19:27:59 +0000 (UTC)
Received: from scv.redhat.com (unknown [10.22.9.55])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E9EC360871;
 Mon, 27 Sep 2021 19:27:36 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 11/32] python/aqmp: add _cb_inbound and _cb_outbound logging
 hooks
Date: Mon, 27 Sep 2021 15:24:52 -0400
Message-Id: <20210927192513.744199-12-jsnow@redhat.com>
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
Received-SPF: pass client-ip=216.205.24.124; envelope-from=jsnow@redhat.com;
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
 Willian Rampazzo <willianr@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 John Snow <jsnow@redhat.com>, Eric Blake <eblake@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Add hooks designed to log/filter incoming/outgoing messages. The primary
intent for these is to be able to support iotests which may want to log
messages with specific filters for reproducible output.

Another use is for plugging into Urwid frameworks; all messages in/out
can be automatically added to a rendering list for the purposes of a
qmp-shell like tool.

Signed-off-by: John Snow <jsnow@redhat.com>
Reviewed-by: Eric Blake <eblake@redhat.com>
Message-id: 20210915162955.333025-12-jsnow@redhat.com
Signed-off-by: John Snow <jsnow@redhat.com>
---
 python/qemu/aqmp/protocol.py | 50 +++++++++++++++++++++++++++++++++---
 1 file changed, 46 insertions(+), 4 deletions(-)

diff --git a/python/qemu/aqmp/protocol.py b/python/qemu/aqmp/protocol.py
index 2ef19e96932..80c2004737e 100644
--- a/python/qemu/aqmp/protocol.py
+++ b/python/qemu/aqmp/protocol.py
@@ -177,6 +177,11 @@ class AsyncProtocol(Generic[T]):
          can be written after the super() call.
      - `_on_message`:
          Actions to be performed when a message is received.
+     - `_cb_outbound`:
+         Logging/Filtering hook for all outbound messages.
+     - `_cb_inbound`:
+         Logging/Filtering hook for all inbound messages.
+         This hook runs *before* `_on_message()`.
 
     :param name:
         Name used for logging messages, if any. By default, messages
@@ -752,6 +757,43 @@ async def _bh_recv_message(self) -> None:
     # Section: Message I/O
     # --------------------
 
+    @upper_half
+    @bottom_half
+    def _cb_outbound(self, msg: T) -> T:
+        """
+        Callback: outbound message hook.
+
+        This is intended for subclasses to be able to add arbitrary
+        hooks to filter or manipulate outgoing messages. The base
+        implementation does nothing but log the message without any
+        manipulation of the message.
+
+        :param msg: raw outbound message
+        :return: final outbound message
+        """
+        self.logger.debug("--> %s", str(msg))
+        return msg
+
+    @upper_half
+    @bottom_half
+    def _cb_inbound(self, msg: T) -> T:
+        """
+        Callback: inbound message hook.
+
+        This is intended for subclasses to be able to add arbitrary
+        hooks to filter or manipulate incoming messages. The base
+        implementation does nothing but log the message without any
+        manipulation of the message.
+
+        This method does not "handle" incoming messages; it is a filter.
+        The actual "endpoint" for incoming messages is `_on_message()`.
+
+        :param msg: raw inbound message
+        :return: processed inbound message
+        """
+        self.logger.debug("<-- %s", str(msg))
+        return msg
+
     @upper_half
     @bottom_half
     async def _do_recv(self) -> T:
@@ -780,8 +822,8 @@ async def _recv(self) -> T:
 
         :return: A single (filtered, processed) protocol message.
         """
-        # A forthcoming commit makes this method less trivial.
-        return await self._do_recv()
+        message = await self._do_recv()
+        return self._cb_inbound(message)
 
     @upper_half
     @bottom_half
@@ -811,7 +853,7 @@ async def _send(self, msg: T) -> None:
 
         :raise OSError: For problems with the underlying stream.
         """
-        # A forthcoming commit makes this method less trivial.
+        msg = self._cb_outbound(msg)
         self._do_send(msg)
 
     @bottom_half
@@ -826,6 +868,6 @@ async def _on_message(self, msg: T) -> None:
             directly cause the loop to halt, so logic may be best-kept
             to a minimum if at all possible.
 
-        :param msg: The incoming message
+        :param msg: The incoming message, already logged/filtered.
         """
         # Nothing to do in the abstract case.
-- 
2.31.1


