Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C2403B8CDF
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Jul 2021 06:18:57 +0200 (CEST)
Received: from localhost ([::1]:54784 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lyoAC-0003cs-5E
	for lists+qemu-devel@lfdr.de; Thu, 01 Jul 2021 00:18:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42376)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lyo5H-0000y9-EO
 for qemu-devel@nongnu.org; Thu, 01 Jul 2021 00:13:51 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:35576)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lyo5E-0000st-PH
 for qemu-devel@nongnu.org; Thu, 01 Jul 2021 00:13:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1625112828;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+r0GS8hd8wpaV11VOAVCy4OHgC4oU2ZRV6Q7dJgnRuY=;
 b=d3Wh8iyKDmXrmXry9drfQ/hFKteHFKTjeWeY4ftOfBqpJxCYyQrDdVd8Vd66+Y6CUEFFUV
 rBG2GMDdXpoU6oTu/X8W3BR+7IeF2Og8mlb8ZoOqiFo147mFBxibfNc3uVWt4yyuVT7IKU
 CBK/uq5ftARGiDEq8BDow3mRvu6jfAY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-596-nyRNkiOJMqOL-lKEL22iUQ-1; Thu, 01 Jul 2021 00:13:47 -0400
X-MC-Unique: nyRNkiOJMqOL-lKEL22iUQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3450C100C609;
 Thu,  1 Jul 2021 04:13:46 +0000 (UTC)
Received: from scv.redhat.com (ovpn-118-71.rdu2.redhat.com [10.10.118.71])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 49C3B604CC;
 Thu,  1 Jul 2021 04:13:44 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 11/20] python/aqmp: add AsyncProtocol._readline() method
Date: Thu,  1 Jul 2021 00:13:04 -0400
Message-Id: <20210701041313.1696009-12-jsnow@redhat.com>
In-Reply-To: <20210701041313.1696009-1-jsnow@redhat.com>
References: <20210701041313.1696009-1-jsnow@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
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
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.435,
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
Cc: Eduardo Habkost <ehabkost@redhat.com>, Eric Blake <eblake@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 "Niteesh G . S ." <niteesh.gs@gmail.com>,
 Willian Rampazzo <wrampazz@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is added as a courtesy: many protocols are line-based, including
QMP. Putting it in AsyncProtocol lets us keep the QMP class
implementation just a pinch more abstract.

(And, if we decide to add a QTEST implementation later, it will need
this, too. (Yes, I have a QTEST implementation.))

Signed-off-by: John Snow <jsnow@redhat.com>
---
 python/qemu/aqmp/protocol.py | 30 ++++++++++++++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/python/qemu/aqmp/protocol.py b/python/qemu/aqmp/protocol.py
index 72c9e95198..6a2a7be056 100644
--- a/python/qemu/aqmp/protocol.py
+++ b/python/qemu/aqmp/protocol.py
@@ -742,6 +742,36 @@ def _cb_inbound(self, msg: T) -> T:
         self.logger.debug("<-- %s", str(msg))
         return msg
 
+    @upper_half
+    @bottom_half
+    async def _readline(self) -> bytes:
+        """
+        Wait for a newline from the incoming reader.
+
+        This method is provided as a convenience for upper-layer
+        protocols, as many are line-based.
+
+        This method *may* return a sequence of bytes without a trailing
+        newline if EOF occurs, but *some* bytes were received. In this
+        case, the next call will raise `EOFError`. It is assumed that
+        the layer 4 protocol will decide if there is anything meaningful
+        to be done with a partial message.
+
+        :raise OSError: For stream-related errors.
+        :raise EOFError:
+            If the reader stream is at EOF and there are no bytes to return.
+        :return: bytes, including the newline.
+
+        """
+        assert self._reader is not None
+        msg_bytes = await self._reader.readline()
+
+        if not msg_bytes:
+            if self._reader.at_eof():
+                raise EOFError
+
+        return msg_bytes
+
     @upper_half
     @bottom_half
     async def _do_recv(self) -> T:
-- 
2.31.1


