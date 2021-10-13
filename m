Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AEB742CD3B
	for <lists+qemu-devel@lfdr.de>; Thu, 14 Oct 2021 00:04:12 +0200 (CEST)
Received: from localhost ([::1]:46450 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mamM7-0006TM-DL
	for lists+qemu-devel@lfdr.de; Wed, 13 Oct 2021 18:04:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48928)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1mamGH-0006Fk-4w
 for qemu-devel@nongnu.org; Wed, 13 Oct 2021 17:58:09 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:51225)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1mamGE-0003uX-2j
 for qemu-devel@nongnu.org; Wed, 13 Oct 2021 17:58:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634162285;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=pNkumLhAQCxxnmqXVCE5nbKfqoIhJY7Inz+zB/lk0AE=;
 b=F8y32emAjRmMdxMkhuTNFPi/vZGPYIXkjvBHgsFAq3+x8kZDkDb9c0AmSs+nSmeHIbK1LR
 hOHGPT25D9ui9YHNkgOWm8gVhIVINRKClv0D9G8X0ArXk9Csh/0MtWJ040C9kQ2K50Tzra
 hgqvysyyVqVDl2OYzWWRzlrvdxn4Fxo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-551-ZMX3rnLjOz2LjAN919qDOg-1; Wed, 13 Oct 2021 17:58:02 -0400
X-MC-Unique: ZMX3rnLjOz2LjAN919qDOg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4B32319067E5;
 Wed, 13 Oct 2021 21:58:01 +0000 (UTC)
Received: from scv.redhat.com (unknown [10.22.16.191])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2FAC9102AE41;
 Wed, 13 Oct 2021 21:58:00 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 7/8] python/aqmp: Create sync QMP wrapper for iotests
Date: Wed, 13 Oct 2021 17:57:47 -0400
Message-Id: <20211013215748.2154908-8-jsnow@redhat.com>
In-Reply-To: <20211013215748.2154908-1-jsnow@redhat.com>
References: <20211013215748.2154908-1-jsnow@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -8
X-Spam_score: -0.9
X-Spam_bar: /
X-Spam_report: (-0.9 / 5.0 requ) DKIMWL_WL_HIGH=-0.049, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Acked-by: Hanna Reitz <hreitz@redhat.com>
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


