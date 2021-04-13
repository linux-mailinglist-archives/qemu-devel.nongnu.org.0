Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D7A435E34B
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Apr 2021 17:58:07 +0200 (CEST)
Received: from localhost ([::1]:43866 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lWLQT-00037C-29
	for lists+qemu-devel@lfdr.de; Tue, 13 Apr 2021 11:58:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38406)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lWLOb-0001RF-FW
 for qemu-devel@nongnu.org; Tue, 13 Apr 2021 11:56:09 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:58774)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lWLOX-00009E-4c
 for qemu-devel@nongnu.org; Tue, 13 Apr 2021 11:56:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1618329362;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=lkwW4qd7cXMVTa9AkNsmmBjla4GICLiyPDDcma8u0a4=;
 b=aD0IgotGpM+NIY5WdJ9QdvWNcwhlawfk3BanwMNjiyuey3/rl7/3g3iNkRSNi1YNP7TTuQ
 RXuoK/TIpINi8es7epWF0rzmuSBGXnZt1GcPy+LPUBh2XtuZ+nu2z/hKbVvLbedXrhXnh5
 WsPermGeYmGI8sYx7PpYGE8IC5ouL38=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-157-9ulr9YSiPf-13uA4TPR50g-1; Tue, 13 Apr 2021 11:56:00 -0400
X-MC-Unique: 9ulr9YSiPf-13uA4TPR50g-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 74F1B79EC6
 for <qemu-devel@nongnu.org>; Tue, 13 Apr 2021 15:55:59 +0000 (UTC)
Received: from scv.redhat.com (ovpn-117-61.rdu2.redhat.com [10.10.117.61])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 990886A034;
 Tue, 13 Apr 2021 15:55:58 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH RFC 1/7] util: asyncio-related helpers
Date: Tue, 13 Apr 2021 11:55:47 -0400
Message-Id: <20210413155553.2660523-2-jsnow@redhat.com>
In-Reply-To: <20210413155553.2660523-1-jsnow@redhat.com>
References: <20210413155553.2660523-1-jsnow@redhat.com>
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
Cc: crosa@redhat.com, John Snow <jsnow@redhat.com>, ehabkost@redhat.com,
 stefanha@redhat.com, armbru@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Nothing too interesting design-wise here; mostly asyncio-related helpers
designed to make writing Python 3.6-compliant code a little nicer to
read.

Signed-off-by: John Snow <jsnow@redhat.com>
---
 util.py | 87 +++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 87 insertions(+)
 create mode 100644 util.py

diff --git a/util.py b/util.py
new file mode 100644
index 0000000..2640f82
--- /dev/null
+++ b/util.py
@@ -0,0 +1,87 @@
+"""
+Misc. utils and helper functions
+"""
+
+import asyncio
+import traceback
+import sys
+from typing import (
+    Any,
+    Coroutine,
+    TypeVar,
+)
+
+
+T = TypeVar('T')
+
+
+def create_task(coro: Coroutine[Any, Any, T]) -> 'asyncio.Future[T]':
+    """
+    Python 3.6-compatible create_task() wrapper.
+    """
+    if hasattr(asyncio, 'create_task'):
+        # Python 3.7+
+        return asyncio.create_task(coro)
+
+    # Python 3.6
+    return asyncio.ensure_future(coro)
+
+
+async def wait_closed(writer: asyncio.StreamWriter) -> None:
+    """
+    Python 3.6-compatible StreamWriter.wait_closed() wrapper.
+    """
+    if hasattr(writer, 'wait_closed'):
+        # Python 3.7+
+        await writer.wait_closed()
+    else:
+        # Python 3.6
+        transport = writer.transport
+        assert isinstance(transport, asyncio.WriteTransport)
+
+        while not transport.is_closing():
+            await asyncio.sleep(0.0)
+        while transport.get_write_buffer_size() > 0:
+            await asyncio.sleep(0.0)
+
+
+def asyncio_run(coro: Coroutine[Any, Any, T]) -> T:
+    """
+    Python 3.6-compatible asyncio.run() wrapper.
+    """
+    # Python 3.7+
+    if hasattr(asyncio, 'run'):
+        return asyncio.run(coro)
+
+    # Python 3.6
+    loop = asyncio.get_event_loop()
+    ret = loop.run_until_complete(coro)
+    loop.close()
+
+    return ret
+
+
+def pretty_traceback() -> str:
+    """
+    Print the current traceback, but indented to provide visual distinction.
+
+    This is useful for printing a traceback within a traceback for
+    debugging purposes when encapsulating errors to deliver them up the
+    stack; when those errors are printed, this helps provide a nice
+    visual grouping to quickly identify the parts of the error that
+    belong to the inner exception.
+
+    :returns: A string, formatted something like the following::
+
+      | Traceback (most recent call last):
+      |   File "foobar.py", line 42, in arbitrary_example
+      |     foo.baz()
+      | ArbitraryError: [Errno 42] Something bad happened!
+
+    """
+    exc_lines = []
+    for chunk in traceback.format_exception(*sys.exc_info()):
+        for line in chunk.split("\n"):
+            if line:
+                exc_lines.append(f"  | {line}")
+    return "\n".join(exc_lines)
-- 
2.30.2


