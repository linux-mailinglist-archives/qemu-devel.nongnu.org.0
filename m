Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CF15745CD7B
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Nov 2021 20:45:09 +0100 (CET)
Received: from localhost ([::1]:45872 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mpyCa-0003E2-DX
	for lists+qemu-devel@lfdr.de; Wed, 24 Nov 2021 14:45:08 -0500
Received: from eggs.gnu.org ([209.51.188.92]:36180)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1mpxvL-00048I-8v
 for qemu-devel@nongnu.org; Wed, 24 Nov 2021 14:27:19 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:29010)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1mpxvH-0007iV-4n
 for qemu-devel@nongnu.org; Wed, 24 Nov 2021 14:27:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1637782034;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=OWMnQTSKoUxcRE4rHmCpOut0hwsKX2RMqMpsEOBKbYA=;
 b=eum36Zt0Yw12DX56MUCGtSyFmwpOgmG1OUR79OhMSRpGadK5xrll8B/o3kJumw76d6N0+0
 k0EZ3iqOnVrRdgBziEm+OGap+uZLTHsxPokCg8SyNeqOwXdOvhC1Yx3cxWIeQ6eyx4D4HO
 rd6yQfkoqrYkyiVLAhr+U01PFfNToR8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-264-MHlAYz-OMGmObFwAnvAGcw-1; Wed, 24 Nov 2021 14:27:11 -0500
X-MC-Unique: MHlAYz-OMGmObFwAnvAGcw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 191AC1800D41;
 Wed, 24 Nov 2021 19:27:10 +0000 (UTC)
Received: from scv.redhat.com (unknown [10.22.9.79])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 19FFF67840;
 Wed, 24 Nov 2021 19:27:09 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 20/23] python/aqmp: fully separate from qmp.QEMUMonitorProtocol
Date: Wed, 24 Nov 2021 14:26:14 -0500
Message-Id: <20211124192617.3396403-21-jsnow@redhat.com>
In-Reply-To: <20211124192617.3396403-1-jsnow@redhat.com>
References: <20211124192617.3396403-1-jsnow@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Eduardo Habkost <ehabkost@redhat.com>, qemu-block@nongnu.org,
 Markus Armbruster <armbru@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

After this patch, qemu.aqmp.legacy.QEMUMonitorProtocol no longer
inherits from qemu.qmp.QEMUMonitorProtocol. To do this, several
inherited methods need to be explicitly re-defined.

Signed-off-by: John Snow <jsnow@redhat.com>
---
 python/qemu/aqmp/legacy.py | 38 ++++++++++++++++++++++++++++++++------
 1 file changed, 32 insertions(+), 6 deletions(-)

diff --git a/python/qemu/aqmp/legacy.py b/python/qemu/aqmp/legacy.py
index c8183de19a..71f3d378db 100644
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
 from .error import AQMPError
 from .protocol import Runstate, SocketAddrT
 from .qmp_client import QMPClient
@@ -48,9 +48,9 @@ class QMPBadPortError(AQMPError):
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


