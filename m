Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3472750A3EE
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Apr 2022 17:23:12 +0200 (CEST)
Received: from localhost ([::1]:52410 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhYeF-00059o-Am
	for lists+qemu-devel@lfdr.de; Thu, 21 Apr 2022 11:23:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41680)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1nhYXa-0003g6-N1
 for qemu-devel@nongnu.org; Thu, 21 Apr 2022 11:16:18 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:44915)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1nhYXU-0005o8-Pg
 for qemu-devel@nongnu.org; Thu, 21 Apr 2022 11:16:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1650554171;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2ME+/WcDKvJomDQ4P/h9DJ6AVEG1Hai+PPCl2ZCbZvY=;
 b=ZxtBQ+1hca7HYBVlzFaMEuADBGbHNuPIH9RFM6n5tM7vX/LpsTszQXymGvhUqh2U/yRCr8
 QscigytovAGUPMyJQsBhW2cHFq1iatADf5NNGOq3GInM6qWKCK8o1E2kzJ/XxqEvgm9txs
 uPDa0BCks+/FGeIT7DjJx5apMNiF1zI=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-518-XFW1MtoPMy-6j7AfDQK8QQ-1; Thu, 21 Apr 2022 11:16:08 -0400
X-MC-Unique: XFW1MtoPMy-6j7AfDQK8QQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 8B4003C1E8EC;
 Thu, 21 Apr 2022 15:16:07 +0000 (UTC)
Received: from scv.redhat.com (unknown [10.22.34.80])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 1891340D016A;
 Thu, 21 Apr 2022 15:16:07 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 11/17] python/aqmp: fully separate from qmp.QEMUMonitorProtocol
Date: Thu, 21 Apr 2022 11:15:54 -0400
Message-Id: <20220421151600.984189-12-jsnow@redhat.com>
In-Reply-To: <20220421151600.984189-1-jsnow@redhat.com>
References: <20220421151600.984189-1-jsnow@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.1
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
 Vladimir Sementsov-Ogievskiy <v.sementsov-og@mail.ru>,
 Beraldo Leal <bleal@redhat.com>, qemu-block@nongnu.org,
 Markus Armbruster <armbru@redhat.com>, Eduardo Habkost <eduardo@habkost.net>,
 Hanna Reitz <hreitz@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Cleber Rosa <crosa@redhat.com>, John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

After this patch, qemu.aqmp.legacy.QEMUMonitorProtocol no longer
inherits from qemu.qmp.QEMUMonitorProtocol. To do this, several
inherited methods need to be explicitly re-defined.

(Licensing: This is copying and modifying GPLv2-only code into a
GPLv2-only file.)

Signed-off-by: John Snow <jsnow@redhat.com>
Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Reviewed-by: Beraldo Leal <bleal@redhat.com>
Message-id: 20220330172812.3427355-4-jsnow@redhat.com
Signed-off-by: John Snow <jsnow@redhat.com>
---
 python/qemu/aqmp/legacy.py | 37 +++++++++++++++++++++++++++++++------
 1 file changed, 31 insertions(+), 6 deletions(-)

diff --git a/python/qemu/aqmp/legacy.py b/python/qemu/aqmp/legacy.py
index f0262749491..10c7c99c4f0 100644
--- a/python/qemu/aqmp/legacy.py
+++ b/python/qemu/aqmp/legacy.py
@@ -16,18 +16,18 @@
 #
 
 import asyncio
+from types import TracebackType
 from typing import (
     Any,
     Awaitable,
     Dict,
     List,
     Optional,
+    Type,
     TypeVar,
     Union,
 )
 
-import qemu.qmp
-
 from .error import QMPError
 from .protocol import Runstate, SocketAddrT
 from .qmp_client import QMPClient
@@ -59,12 +59,11 @@ class QMPBadPortError(QMPError):
     """
 
 
-class QEMUMonitorProtocol(qemu.qmp.QEMUMonitorProtocol):
+class QEMUMonitorProtocol:
     def __init__(self, address: SocketAddrT,
                  server: bool = False,
                  nickname: Optional[str] = None):
 
-        # pylint: disable=super-init-not-called
         self._aqmp = QMPClient(nickname)
         self._aloop = asyncio.get_event_loop()
         self._address = address
@@ -88,7 +87,18 @@ def _get_greeting(self) -> Optional[QMPMessage]:
             return self._aqmp.greeting._asdict()
         return None
 
-    # __enter__ and __exit__ need no changes
+    def __enter__(self: _T) -> _T:
+        # Implement context manager enter function.
+        return self
+
+    def __exit__(self,
+                 # pylint: disable=duplicate-code
+                 # see https://github.com/PyCQA/pylint/issues/3619
+                 exc_type: Optional[Type[BaseException]],
+                 exc_val: Optional[BaseException],
+                 exc_tb: Optional[TracebackType]) -> None:
+        # Implement context manager exit function.
+        self.close()
 
     @classmethod
     def parse_address(cls, address: str) -> SocketAddrT:
@@ -142,7 +152,22 @@ def cmd_obj(self, qmp_cmd: QMPMessage) -> QMPMessage:
             )
         )
 
-    # Default impl of cmd() delegates to cmd_obj
+    def cmd(self, name: str,
+            args: Optional[Dict[str, object]] = None,
+            cmd_id: Optional[object] = None) -> QMPMessage:
+        """
+        Build a QMP command and send it to the QMP Monitor.
+
+        @param name: command name (string)
+        @param args: command arguments (dict)
+        @param cmd_id: command id (dict, list, string or int)
+        """
+        qmp_cmd: QMPMessage = {'execute': name}
+        if args:
+            qmp_cmd['arguments'] = args
+        if cmd_id:
+            qmp_cmd['id'] = cmd_id
+        return self.cmd_obj(qmp_cmd)
 
     def command(self, cmd: str, **kwds: object) -> QMPReturnValue:
         return self._sync(
-- 
2.34.1


