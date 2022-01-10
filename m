Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 10FA148A408
	for <lists+qemu-devel@lfdr.de>; Tue, 11 Jan 2022 00:57:04 +0100 (CET)
Received: from localhost ([::1]:53260 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n74X9-0007M2-6Z
	for lists+qemu-devel@lfdr.de; Mon, 10 Jan 2022 18:57:03 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43532)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1n749b-0005u6-5D
 for qemu-devel@nongnu.org; Mon, 10 Jan 2022 18:32:43 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:43201)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1n749Q-0000Nm-9x
 for qemu-devel@nongnu.org; Mon, 10 Jan 2022 18:32:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1641857551;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=BvJnSkuKelxwwkz6mxHaYFKgr6xeEh3QGZiP2CFIE0Y=;
 b=QH6vZ4nV7STPAG01jSqiBD6OEmW/AG+GSzQNpk++AlG7YBJXrlZbA1aofup/FWmOjX4Acf
 85ayJfcTnNkySLOMBJWeG/wU/+blDPJqL01GZB+U5RSn4OA7QfkFa2ziUElissEud8qcjx
 tK0jFsq3CObBpEO1rwF8DCnf3oh5GYw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-261-i8gNzxekPiqNWVJp-aEnDw-1; Mon, 10 Jan 2022 18:32:28 -0500
X-MC-Unique: i8gNzxekPiqNWVJp-aEnDw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 49C04192CC41;
 Mon, 10 Jan 2022 23:32:27 +0000 (UTC)
Received: from scv.redhat.com (unknown [10.22.16.219])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 1C65D7B035;
 Mon, 10 Jan 2022 23:32:26 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 26/31] python/aqmp: fully separate from
 qmp.QEMUMonitorProtocol
Date: Mon, 10 Jan 2022 18:29:05 -0500
Message-Id: <20220110232910.1923864-27-jsnow@redhat.com>
In-Reply-To: <20220110232910.1923864-1-jsnow@redhat.com>
References: <20220110232910.1923864-1-jsnow@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.597,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, Eduardo Habkost <eduardo@habkost.net>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Daniel Berrange <berrange@redhat.com>, Beraldo Leal <bleal@redhat.com>,
 qemu-block@nongnu.org, Markus Armbruster <armbru@redhat.com>,
 Wainer Moschetta <wainersm@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

After this patch, qemu.aqmp.legacy.QEMUMonitorProtocol no longer
inherits from qemu.qmp.QEMUMonitorProtocol. To do this, several
inherited methods need to be explicitly re-defined.

Signed-off-by: John Snow <jsnow@redhat.com>
Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Reviewed-by: Beraldo Leal <bleal@redhat.com>
---
 python/qemu/aqmp/legacy.py | 38 ++++++++++++++++++++++++++++++++------
 1 file changed, 32 insertions(+), 6 deletions(-)

diff --git a/python/qemu/aqmp/legacy.py b/python/qemu/aqmp/legacy.py
index 76b09671cc..8f38e7d912 100644
--- a/python/qemu/aqmp/legacy.py
+++ b/python/qemu/aqmp/legacy.py
@@ -5,18 +5,18 @@
 """
 
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
@@ -48,9 +48,9 @@ class QMPBadPortError(QMPError):
     """
 
 
-class QEMUMonitorProtocol(qemu.qmp.QEMUMonitorProtocol):
+class QEMUMonitorProtocol:
     def __init__(self, address: SocketAddrT,
-                 server: bool = False,
+                 server: bool = False,  # pylint: disable=unused-argument
                  nickname: Optional[str] = None):
 
         # pylint: disable=super-init-not-called
@@ -74,7 +74,18 @@ def _get_greeting(self) -> Optional[QMPMessage]:
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
@@ -131,7 +142,22 @@ def cmd_obj(self, qmp_cmd: QMPMessage) -> QMPMessage:
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
2.31.1


