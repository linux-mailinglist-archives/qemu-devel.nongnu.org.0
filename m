Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A99A3CC046
	for <lists+qemu-devel@lfdr.de>; Sat, 17 Jul 2021 02:39:04 +0200 (CEST)
Received: from localhost ([::1]:52508 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m4YMB-0001Qo-8G
	for lists+qemu-devel@lfdr.de; Fri, 16 Jul 2021 20:39:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37464)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1m4YGX-0004PM-6T
 for qemu-devel@nongnu.org; Fri, 16 Jul 2021 20:33:13 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:51252)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1m4YGV-0006B8-GS
 for qemu-devel@nongnu.org; Fri, 16 Jul 2021 20:33:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626481991;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=YX3VXuQwcUPQKAUl9AKnsGr0t5dTnKQ7JVIZDcLP+OA=;
 b=JZYBGB/8oaAdlOIMeFSVmnGkmLIBx4tEIsgwcwDZGePKBVNRQ7DdCT9UnSOwtgfeybvYJr
 breoi8EFBx+6on8+3casMKvCp5cbtzkvbOONEGrY+BMuHhITG78Qw9Jv5LSk0aeIIa3QN9
 5v6kV8TRieMWB5PgSZgmrvKaNh+zbTo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-271-GTj0AmFCOIS-3DIixqdDkg-1; Fri, 16 Jul 2021 20:33:08 -0400
X-MC-Unique: GTj0AmFCOIS-3DIixqdDkg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C787C801B26;
 Sat, 17 Jul 2021 00:33:07 +0000 (UTC)
Received: from scv.redhat.com (ovpn-119-183.rdu2.redhat.com [10.10.119.183])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B09E25C1A1;
 Sat, 17 Jul 2021 00:33:06 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 04/24] python/aqmp: add asyncio compatibility wrappers
Date: Fri, 16 Jul 2021 20:32:33 -0400
Message-Id: <20210717003253.457418-5-jsnow@redhat.com>
In-Reply-To: <20210717003253.457418-1-jsnow@redhat.com>
References: <20210717003253.457418-1-jsnow@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
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

Python 3.6 does not have all of the goodies that Python 3.7 does, and I
need to support both. Add some compatibility wrappers needed for this
purpose.

(Note: Python 3.6 is EOL December 2021.)

Signed-off-by: John Snow <jsnow@redhat.com>
---
 python/qemu/aqmp/util.py | 106 +++++++++++++++++++++++++++++++++++++++
 1 file changed, 106 insertions(+)
 create mode 100644 python/qemu/aqmp/util.py

diff --git a/python/qemu/aqmp/util.py b/python/qemu/aqmp/util.py
new file mode 100644
index 00000000000..7e7c2584d2b
--- /dev/null
+++ b/python/qemu/aqmp/util.py
@@ -0,0 +1,106 @@
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
+    cast,
+)
+
+
+T = TypeVar('T')
+
+
+# --------------------------
+# Section: Utility Functions
+# --------------------------
+
+
+async def flush(writer: asyncio.StreamWriter) -> None:
+    """
+    Utility function to ensure a StreamWriter is *fully* drained.
+
+    `asyncio.StreamWriter.drain` only promises we will return to below
+    the "high-water mark". This function ensures we flush the entire
+    buffer -- by setting the high water mark to 0 and then calling
+    drain. The flow control limits are restored after the call is
+    completed.
+    """
+    transport = cast(asyncio.WriteTransport, writer.transport)
+
+    # https://github.com/python/typeshed/issues/5779
+    low, high = transport.get_write_buffer_limits()  # type: ignore
+    transport.set_write_buffer_limits(0, 0)
+    try:
+        await writer.drain()
+    finally:
+        transport.set_write_buffer_limits(high, low)
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
+    await flush(writer)
-- 
2.31.1


