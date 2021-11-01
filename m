Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 348684420DC
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Nov 2021 20:30:32 +0100 (CET)
Received: from localhost ([::1]:39992 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mhd0p-0004JE-5o
	for lists+qemu-devel@lfdr.de; Mon, 01 Nov 2021 15:30:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34682)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1mhbHN-0006tE-Cr
 for qemu-devel@nongnu.org; Mon, 01 Nov 2021 13:39:30 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:60614)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1mhbHI-0004zU-Ev
 for qemu-devel@nongnu.org; Mon, 01 Nov 2021 13:39:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635788363;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Wyx64pleORoLQwf1Ou3jTAQ4rFCRiKLbPxAZZhkT94I=;
 b=if08JlpJQa8z3W0gfJ5N0j8hv5OBC6/AfFdK/8DZaG8ZUQr/eImJSvQxguoryiK+zUBsjs
 PerlxLpSyp597cKKNXDMstUv6WGa1aoravZQ4bV0V1ctA+meXNJjGCqeeinEfRfg3SmCU8
 AGMb3Zm4P1ZN9kgjHhtTO+Muk9nHt3Q=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-105-Q63GCEUsPUiDVvzSn44gTQ-1; Mon, 01 Nov 2021 13:39:20 -0400
X-MC-Unique: Q63GCEUsPUiDVvzSn44gTQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id EB6E11030C23;
 Mon,  1 Nov 2021 17:38:54 +0000 (UTC)
Received: from scv.redhat.com (unknown [10.22.11.188])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D925019C79;
 Mon,  1 Nov 2021 17:38:07 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 21/22] python/aqmp: Create sync QMP wrapper for iotests
Date: Mon,  1 Nov 2021 13:30:05 -0400
Message-Id: <20211101173006.656673-22-jsnow@redhat.com>
In-Reply-To: <20211101173006.656673-1-jsnow@redhat.com>
References: <20211101173006.656673-1-jsnow@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.734,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Kevin Wolf <kwolf@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 Thomas Huth <thuth@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Daniel Berrange <berrange@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 qemu-block@nongnu.org, =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Markus Armbruster <armbru@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Willian Rampazzo <willianr@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 Cleber Rosa <crosa@redhat.com>, John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is a wrapper around the async QMPClient that mimics the old,
synchronous QEMUMonitorProtocol class. It is designed to be
interchangeable with the old implementation.

It does not, however, attempt to mimic Exception compatibility.

Signed-off-by: John Snow <jsnow@redhat.com>
Acked-by: Hanna Reitz <hreitz@redhat.com>
Reviewed-by: Kevin Wolf <kwolf@redhat.com>
Reviewed-by: Hanna Reitz <hreitz@redhat.com>
Message-id: 20211026175612.4127598-8-jsnow@redhat.com
Signed-off-by: John Snow <jsnow@redhat.com>
---
 python/qemu/aqmp/legacy.py | 138 +++++++++++++++++++++++++++++++++++++
 1 file changed, 138 insertions(+)
 create mode 100644 python/qemu/aqmp/legacy.py

diff --git a/python/qemu/aqmp/legacy.py b/python/qemu/aqmp/legacy.py
new file mode 100644
index 00000000000..9e7b9fb80b9
--- /dev/null
+++ b/python/qemu/aqmp/legacy.py
@@ -0,0 +1,138 @@
+"""
+Sync QMP Wrapper
+
+This class pretends to be qemu.qmp.QEMUMonitorProtocol.
+"""
+
+import asyncio
+from typing import (
+    Awaitable,
+    List,
+    Optional,
+    TypeVar,
+    Union,
+)
+
+import qemu.qmp
+from qemu.qmp import QMPMessage, QMPReturnValue, SocketAddrT
+
+from .qmp_client import QMPClient
+
+
+# pylint: disable=missing-docstring
+
+
+class QEMUMonitorProtocol(qemu.qmp.QEMUMonitorProtocol):
+    def __init__(self, address: SocketAddrT,
+                 server: bool = False,
+                 nickname: Optional[str] = None):
+
+        # pylint: disable=super-init-not-called
+        self._aqmp = QMPClient(nickname)
+        self._aloop = asyncio.get_event_loop()
+        self._address = address
+        self._timeout: Optional[float] = None
+
+    _T = TypeVar('_T')
+
+    def _sync(
+            self, future: Awaitable[_T], timeout: Optional[float] = None
+    ) -> _T:
+        return self._aloop.run_until_complete(
+            asyncio.wait_for(future, timeout=timeout)
+        )
+
+    def _get_greeting(self) -> Optional[QMPMessage]:
+        if self._aqmp.greeting is not None:
+            # pylint: disable=protected-access
+            return self._aqmp.greeting._asdict()
+        return None
+
+    # __enter__ and __exit__ need no changes
+    # parse_address needs no changes
+
+    def connect(self, negotiate: bool = True) -> Optional[QMPMessage]:
+        self._aqmp.await_greeting = negotiate
+        self._aqmp.negotiate = negotiate
+
+        self._sync(
+            self._aqmp.connect(self._address)
+        )
+        return self._get_greeting()
+
+    def accept(self, timeout: Optional[float] = 15.0) -> QMPMessage:
+        self._aqmp.await_greeting = True
+        self._aqmp.negotiate = True
+
+        self._sync(
+            self._aqmp.accept(self._address),
+            timeout
+        )
+
+        ret = self._get_greeting()
+        assert ret is not None
+        return ret
+
+    def cmd_obj(self, qmp_cmd: QMPMessage) -> QMPMessage:
+        return dict(
+            self._sync(
+                # pylint: disable=protected-access
+
+                # _raw() isn't a public API, because turning off
+                # automatic ID assignment is discouraged. For
+                # compatibility with iotests *only*, do it anyway.
+                self._aqmp._raw(qmp_cmd, assign_id=False),
+                self._timeout
+            )
+        )
+
+    # Default impl of cmd() delegates to cmd_obj
+
+    def command(self, cmd: str, **kwds: object) -> QMPReturnValue:
+        return self._sync(
+            self._aqmp.execute(cmd, kwds),
+            self._timeout
+        )
+
+    def pull_event(self,
+                   wait: Union[bool, float] = False) -> Optional[QMPMessage]:
+        if not wait:
+            # wait is False/0: "do not wait, do not except."
+            if self._aqmp.events.empty():
+                return None
+
+        # If wait is 'True', wait forever. If wait is False/0, the events
+        # queue must not be empty; but it still needs some real amount
+        # of time to complete.
+        timeout = None
+        if wait and isinstance(wait, float):
+            timeout = wait
+
+        return dict(
+            self._sync(
+                self._aqmp.events.get(),
+                timeout
+            )
+        )
+
+    def get_events(self, wait: Union[bool, float] = False) -> List[QMPMessage]:
+        events = [dict(x) for x in self._aqmp.events.clear()]
+        if events:
+            return events
+
+        event = self.pull_event(wait)
+        return [event] if event is not None else []
+
+    def clear_events(self) -> None:
+        self._aqmp.events.clear()
+
+    def close(self) -> None:
+        self._sync(
+            self._aqmp.disconnect()
+        )
+
+    def settimeout(self, timeout: Optional[float]) -> None:
+        self._timeout = timeout
+
+    def send_fd_scm(self, fd: int) -> None:
+        self._aqmp.send_fd_scm(fd)
-- 
2.31.1


