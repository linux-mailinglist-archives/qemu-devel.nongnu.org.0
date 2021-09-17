Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A08540F1CC
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Sep 2021 07:57:33 +0200 (CEST)
Received: from localhost ([::1]:37326 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mR6sO-00031u-7a
	for lists+qemu-devel@lfdr.de; Fri, 17 Sep 2021 01:57:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48342)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1mR6cw-0005JX-LL
 for qemu-devel@nongnu.org; Fri, 17 Sep 2021 01:41:34 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:38993)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1mR6cp-0003cy-F0
 for qemu-devel@nongnu.org; Fri, 17 Sep 2021 01:41:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631857282;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=vuzZfn/XMSo92JCqVP8WeIskaIB6XTwn/YGc4lWALmI=;
 b=VaA+bU3IkeXuiDd5fS3Lg3QNb8xBrJM8DydGkR5wFyyIJ1E9f9QV2r2EvJsaN45vK7REnI
 46KRQ/uMM+jFZOCSLasrMQ1eXP8jaH3j0zmYcyuhvJJEPkLnRzT30VZcVI94AUolW5wOp+
 lwQ8Vxp9YbZtkirKMqKoUjXqz1wUjM4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-203-uZXK43_ENTOUtzZNspef2Q-1; Fri, 17 Sep 2021 01:41:21 -0400
X-MC-Unique: uZXK43_ENTOUtzZNspef2Q-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 90BEB1808308;
 Fri, 17 Sep 2021 05:41:20 +0000 (UTC)
Received: from scv.redhat.com (unknown [10.22.11.132])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E54047A8CA;
 Fri, 17 Sep 2021 05:41:17 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 11/15] python/aqmp: Create sync QMP wrapper for iotests
Date: Fri, 17 Sep 2021 01:40:43 -0400
Message-Id: <20210917054047.2042843-12-jsnow@redhat.com>
In-Reply-To: <20210917054047.2042843-1-jsnow@redhat.com>
References: <20210917054047.2042843-1-jsnow@redhat.com>
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
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.392,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_PASS=-0.001,
 T_SPF_HELO_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Eduardo Habkost <ehabkost@redhat.com>, qemu-block@nongnu.org,
 Hanna Reitz <hreitz@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is a wrapper around the async QMPClient that mimics the old,
synchronous QEMUMonitorProtocol class. It is designed to be
interchangeable with the old implementation.

It does not, however, attempt to mimic Exception compatibility.

Signed-off-by: John Snow <jsnow@redhat.com>
---
 python/qemu/aqmp/legacy.py | 131 +++++++++++++++++++++++++++++++++++++
 1 file changed, 131 insertions(+)
 create mode 100644 python/qemu/aqmp/legacy.py

diff --git a/python/qemu/aqmp/legacy.py b/python/qemu/aqmp/legacy.py
new file mode 100644
index 0000000000..b8544083ad
--- /dev/null
+++ b/python/qemu/aqmp/legacy.py
@@ -0,0 +1,131 @@
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
+
+        if self._aqmp.greeting is not None:
+            return dict(self._aqmp.greeting)
+        return None
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
+        assert self._aqmp.greeting is not None
+        return dict(self._aqmp.greeting)
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
+        if wait is False:
+            # Return None if there's no event ready to go
+            if self._aqmp.events.empty():
+                return None
+
+        timeout = None
+        if isinstance(wait, float):
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


