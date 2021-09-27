Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9ED2B419F35
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Sep 2021 21:33:16 +0200 (CEST)
Received: from localhost ([::1]:45604 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mUwNH-0001xW-Ia
	for lists+qemu-devel@lfdr.de; Mon, 27 Sep 2021 15:33:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57534)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1mUwH8-00028Q-Lb
 for qemu-devel@nongnu.org; Mon, 27 Sep 2021 15:26:54 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:31020)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1mUwH6-0006lu-G7
 for qemu-devel@nongnu.org; Mon, 27 Sep 2021 15:26:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1632770811;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8mWniNIMmCePwjlVa0JY+qDWL1wn2A8WJ40ToWhtwqo=;
 b=AEn0bgp8oKCwYdw6u6Z5vtzysM0neYxmGzheppg5kTsryy4AgVvQSQZU3AhSI6zqhwy8F1
 zb2l2GaIFBWkmMUE0rKIrn0ZMz4EEYVUg/1F1wQXooJ8HTGL61u+pgWIDKbdku+q4QQaqI
 Rrv7YIMJRD+9F6khiHNcGUKtJbZLOXg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-402-83S6mfcvPKmqsJt8S73Nqg-1; Mon, 27 Sep 2021 15:26:50 -0400
X-MC-Unique: 83S6mfcvPKmqsJt8S73Nqg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 062F41084681;
 Mon, 27 Sep 2021 19:26:49 +0000 (UTC)
Received: from scv.redhat.com (unknown [10.22.9.55])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 5A38A60871;
 Mon, 27 Sep 2021 19:26:47 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 04/32] python/aqmp: add asyncio compatibility wrappers
Date: Mon, 27 Sep 2021 15:24:45 -0400
Message-Id: <20210927192513.744199-5-jsnow@redhat.com>
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
 John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Python 3.6 does not have all of the goodies that Python 3.7 does, and we
need to support both. Add some compatibility wrappers needed for this
purpose.

(Note: Python 3.6 is EOL December 2021.)

Signed-off-by: John Snow <jsnow@redhat.com>
Message-id: 20210915162955.333025-5-jsnow@redhat.com
Signed-off-by: John Snow <jsnow@redhat.com>
---
 python/qemu/aqmp/util.py | 89 ++++++++++++++++++++++++++++++++++++++++
 1 file changed, 89 insertions(+)
 create mode 100644 python/qemu/aqmp/util.py

diff --git a/python/qemu/aqmp/util.py b/python/qemu/aqmp/util.py
new file mode 100644
index 00000000000..28acd995dbf
--- /dev/null
+++ b/python/qemu/aqmp/util.py
@@ -0,0 +1,89 @@
+"""
+Miscellaneous Utilities
+
+This module provides asyncio utilities and compatibility wrappers for
+Python 3.6 to provide some features that otherwise become available in
+Python 3.7+.
+"""
+
+import asyncio
+import sys
+from typing import (
+    Any,
+    Coroutine,
+    Optional,
+    TypeVar,
+)
+
+
+T = TypeVar('T')
+
+
+# -------------------------------
+# Section: Compatibility Wrappers
+# -------------------------------
+
+
+def create_task(coro: Coroutine[Any, Any, T],
+                loop: Optional[asyncio.AbstractEventLoop] = None
+                ) -> 'asyncio.Future[T]':
+    """
+    Python 3.6-compatible `asyncio.create_task` wrapper.
+
+    :param coro: The coroutine to execute in a task.
+    :param loop: Optionally, the loop to create the task in.
+
+    :return: An `asyncio.Future` object.
+    """
+    if sys.version_info >= (3, 7):
+        if loop is not None:
+            return loop.create_task(coro)
+        return asyncio.create_task(coro)  # pylint: disable=no-member
+
+    # Python 3.6:
+    return asyncio.ensure_future(coro, loop=loop)
+
+
+def is_closing(writer: asyncio.StreamWriter) -> bool:
+    """
+    Python 3.6-compatible `asyncio.StreamWriter.is_closing` wrapper.
+
+    :param writer: The `asyncio.StreamWriter` object.
+    :return: `True` if the writer is closing, or closed.
+    """
+    if sys.version_info >= (3, 7):
+        return writer.is_closing()
+
+    # Python 3.6:
+    transport = writer.transport
+    assert isinstance(transport, asyncio.WriteTransport)
+    return transport.is_closing()
+
+
+async def wait_closed(writer: asyncio.StreamWriter) -> None:
+    """
+    Python 3.6-compatible `asyncio.StreamWriter.wait_closed` wrapper.
+
+    :param writer: The `asyncio.StreamWriter` to wait on.
+    """
+    if sys.version_info >= (3, 7):
+        await writer.wait_closed()
+        return
+
+    # Python 3.6
+    transport = writer.transport
+    assert isinstance(transport, asyncio.WriteTransport)
+
+    while not transport.is_closing():
+        await asyncio.sleep(0)
+
+    # This is an ugly workaround, but it's the best I can come up with.
+    sock = transport.get_extra_info('socket')
+
+    if sock is None:
+        # Our transport doesn't have a socket? ...
+        # Nothing we can reasonably do.
+        return
+
+    while sock.fileno() != -1:
+        await asyncio.sleep(0)
-- 
2.31.1


