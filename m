Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 32D57419F45
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Sep 2021 21:38:16 +0200 (CEST)
Received: from localhost ([::1]:57638 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mUwS7-0001x2-6S
	for lists+qemu-devel@lfdr.de; Mon, 27 Sep 2021 15:38:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57948)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1mUwIK-0004qT-AS
 for qemu-devel@nongnu.org; Mon, 27 Sep 2021 15:28:08 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:40312)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1mUwII-0007kK-Lq
 for qemu-devel@nongnu.org; Mon, 27 Sep 2021 15:28:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1632770886;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8HgubT+gcsKzy0EClhxzcr9TxdKVNnDWr7mCMUpDRDI=;
 b=WJ6AXoWA4C4+1Q37+9n2/2YGQLRCvH9ALIZS6XbLRq2F7oD/aHoje6J7Y9LdYpaBoNKgPa
 oN/9NVfEqONt7SVTydxm2s5SgBmvu9bc7Xlpgf9fiVXBn84kZoFSgm8xJiu3MyOcGhsAcy
 Qzpzy0XyBdSwYa5iken11NablsdQvaU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-384-j_FpR6xwPlmKnXLY7fWw1g-1; Mon, 27 Sep 2021 15:28:04 -0400
X-MC-Unique: j_FpR6xwPlmKnXLY7fWw1g-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7447C835DE1;
 Mon, 27 Sep 2021 19:28:03 +0000 (UTC)
Received: from scv.redhat.com (unknown [10.22.9.55])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 7315260871;
 Mon, 27 Sep 2021 19:27:59 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 12/32] python/aqmp: add AsyncProtocol._readline() method
Date: Mon, 27 Sep 2021 15:24:53 -0400
Message-Id: <20210927192513.744199-13-jsnow@redhat.com>
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
 Willian Rampazzo <willianr@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 John Snow <jsnow@redhat.com>, Eric Blake <eblake@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is added as a courtesy: many protocols are line-based, including
QMP. Putting it in AsyncProtocol lets us keep the QMP class
implementation just a pinch more abstract.

(And, if we decide to add a QTEST implementation later, it will need
this, too. (Yes, I have a QTEST implementation.))

Signed-off-by: John Snow <jsnow@redhat.com>
Reviewed-by: Eric Blake <eblake@redhat.com>
Message-id: 20210915162955.333025-13-jsnow@redhat.com
Signed-off-by: John Snow <jsnow@redhat.com>
---
 python/qemu/aqmp/protocol.py | 29 +++++++++++++++++++++++++++++
 1 file changed, 29 insertions(+)

diff --git a/python/qemu/aqmp/protocol.py b/python/qemu/aqmp/protocol.py
index 80c2004737e..32e78749c11 100644
--- a/python/qemu/aqmp/protocol.py
+++ b/python/qemu/aqmp/protocol.py
@@ -794,6 +794,35 @@ def _cb_inbound(self, msg: T) -> T:
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
+        the layer 5 protocol will decide if there is anything meaningful
+        to be done with a partial message.
+
+        :raise OSError: For stream-related errors.
+        :raise EOFError:
+            If the reader stream is at EOF and there are no bytes to return.
+        :return: bytes, including the newline.
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


