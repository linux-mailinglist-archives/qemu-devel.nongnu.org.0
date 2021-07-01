Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DAFF93B8CD1
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Jul 2021 06:15:05 +0200 (CEST)
Received: from localhost ([::1]:40844 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lyo6S-0002gO-Ra
	for lists+qemu-devel@lfdr.de; Thu, 01 Jul 2021 00:15:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42296)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lyo50-0008If-55
 for qemu-devel@nongnu.org; Thu, 01 Jul 2021 00:13:34 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:34551)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lyo4w-0000di-De
 for qemu-devel@nongnu.org; Thu, 01 Jul 2021 00:13:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1625112809;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=seoFGKa3kTLAoNY38uU4GpNn7IHY7I0UEY0RjfUZw7w=;
 b=C7xqFEth81CaCYOJ0M/Fj9Ez6QaRMDKLAnZwR9TjVlx0JW2HE06oHI0jfI92wnae/Achw2
 QxadSYXy8zzxU1MqWTsfBAsDUEGZKNtB58nfGUAocZw4O7LIsCZwfLQ4hqUQoE4qcageXO
 +5/sXiRCxvXQgu6EYrFoseyZxiV+qlw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-535-lXzhjoWcOg-VieWWaFshGA-1; Thu, 01 Jul 2021 00:13:28 -0400
X-MC-Unique: lXzhjoWcOg-VieWWaFshGA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 83A5718414A0;
 Thu,  1 Jul 2021 04:13:27 +0000 (UTC)
Received: from scv.redhat.com (ovpn-118-71.rdu2.redhat.com [10.10.118.71])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 7774469CB4;
 Thu,  1 Jul 2021 04:13:26 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 05/20] python/aqmp: add asyncio compatibility wrappers
Date: Thu,  1 Jul 2021 00:12:58 -0400
Message-Id: <20210701041313.1696009-6-jsnow@redhat.com>
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
Received-SPF: pass client-ip=216.205.24.124; envelope-from=jsnow@redhat.com;
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

Python 3.6 does not have all of the goodies that Python 3.7 does, and I
need to support both. Add some compatibility wrappers needed for this
purpose.

(Note: Python 3.6 is EOL December 2021.)

Signed-off-by: John Snow <jsnow@redhat.com>
---
 python/qemu/aqmp/util.py | 77 ++++++++++++++++++++++++++++++++++++++++
 1 file changed, 77 insertions(+)
 create mode 100644 python/qemu/aqmp/util.py

diff --git a/python/qemu/aqmp/util.py b/python/qemu/aqmp/util.py
new file mode 100644
index 0000000000..c88a2201bc
--- /dev/null
+++ b/python/qemu/aqmp/util.py
@@ -0,0 +1,77 @@
+"""
+Miscellaneous Utilities
+
+This module primarily provides compatibility wrappers for Python 3.6 to
+provide some features that otherwise become available in Python 3.7+.
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
+    # Python 3.7+:
+    if sys.version_info >= (3, 7):
+        # pylint: disable=no-member
+        if loop is not None:
+            return loop.create_task(coro)
+        return asyncio.create_task(coro)
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
+    if hasattr(writer, 'is_closing'):
+        # Python 3.7+
+        return writer.is_closing()  # type: ignore
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
+    if hasattr(writer, 'wait_closed'):
+        # Python 3.7+
+        await writer.wait_closed()  # type: ignore
+    else:
+        # Python 3.6
+        transport = writer.transport
+        assert isinstance(transport, asyncio.WriteTransport)
+
+        while not transport.is_closing():
+            await asyncio.sleep(0.0)
+        while transport.get_write_buffer_size() > 0:
+            await asyncio.sleep(0.0)
-- 
2.31.1


