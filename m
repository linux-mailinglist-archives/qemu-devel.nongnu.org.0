Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 617DF40CAE1
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Sep 2021 18:43:20 +0200 (CEST)
Received: from localhost ([::1]:37520 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mQY0F-0000sD-C3
	for lists+qemu-devel@lfdr.de; Wed, 15 Sep 2021 12:43:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59802)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1mQXoc-0004AZ-2k
 for qemu-devel@nongnu.org; Wed, 15 Sep 2021 12:31:18 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:20895)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1mQXoY-0004wh-P8
 for qemu-devel@nongnu.org; Wed, 15 Sep 2021 12:31:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631723474;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ql7qHMnCPcMjUdlKcrwJZIjYAvQwVDRPsiDtlHR+MEk=;
 b=USOB0ANuHHdJnloSoRKBuxDegD7pZv31Q5OuY5UW3TRFtSKab6zlu3Tr75KAmoWQP7HD4Y
 jrvzHzkoFW34AiMHA/8lv1mb3jUUwEkJSTrOjTqlB3amn1c0pC0L/OgsIqiI2izmsTG9EQ
 j6KtODPXcfB7W+f0AJbEQ40bO9FCtnk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-173-o6ALeV3GMkCm-UrHZN-c4A-1; Wed, 15 Sep 2021 12:31:12 -0400
X-MC-Unique: o6ALeV3GMkCm-UrHZN-c4A-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D4F6C802B9F;
 Wed, 15 Sep 2021 16:31:11 +0000 (UTC)
Received: from scv.redhat.com (unknown [10.22.11.132])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 420857771A;
 Wed, 15 Sep 2021 16:31:10 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 11/27] python/aqmp: add _cb_inbound and _cb_outbound
 logging hooks
Date: Wed, 15 Sep 2021 12:29:39 -0400
Message-Id: <20210915162955.333025-12-jsnow@redhat.com>
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
Received-SPF: pass client-ip=216.205.24.124; envelope-from=jsnow@redhat.com;
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

Add hooks designed to log/filter incoming/outgoing messages. The primary
intent for these is to be able to support iotests which may want to log
messages with specific filters for reproducible output.

Another use is for plugging into Urwid frameworks; all messages in/out
can be automatically added to a rendering list for the purposes of a
qmp-shell like tool.

Signed-off-by: John Snow <jsnow@redhat.com>
Reviewed-by: Eric Blake <eblake@redhat.com>
---
 python/qemu/aqmp/protocol.py | 50 +++++++++++++++++++++++++++++++++---
 1 file changed, 46 insertions(+), 4 deletions(-)

diff --git a/python/qemu/aqmp/protocol.py b/python/qemu/aqmp/protocol.py
index 2ef19e9693..80c2004737 100644
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


