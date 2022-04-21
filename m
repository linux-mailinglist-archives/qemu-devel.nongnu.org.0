Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2271750A40A
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Apr 2022 17:26:39 +0200 (CEST)
Received: from localhost ([::1]:35210 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhYha-0004bQ-84
	for lists+qemu-devel@lfdr.de; Thu, 21 Apr 2022 11:26:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41732)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1nhYXc-0003ka-55
 for qemu-devel@nongnu.org; Thu, 21 Apr 2022 11:16:20 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:21507)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1nhYXW-0005pH-09
 for qemu-devel@nongnu.org; Thu, 21 Apr 2022 11:16:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1650554173;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=GzXaTanbvs0aPCypeTjC5Oo4DdPAf2rdQiauUne8//Y=;
 b=WKMeIEGrAIDoUBR3Ep2uSn5WJAeO78M3Z2A7Ve//ue/7IyVirID0hhNQBtzkIw0Ecr7gS8
 oFrhndLCM28EnNWlwWbmfHYvvTd9KqVulNUkXmeklr22F1/OyLT/cLwEey7AHxbuYZvRS1
 I9m6MpsMukLpPzVN+NWZPwk+ExIHKgg=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-417-RdrkahdbOAaQhCGo27wV7w-1; Thu, 21 Apr 2022 11:16:02 -0400
X-MC-Unique: RdrkahdbOAaQhCGo27wV7w-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 3EF40802819;
 Thu, 21 Apr 2022 15:16:02 +0000 (UTC)
Received: from scv.redhat.com (unknown [10.22.34.80])
 by smtp.corp.redhat.com (Postfix) with ESMTP id BE9E140D016A;
 Thu, 21 Apr 2022 15:16:01 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 01/17] python/machine: permanently switch to AQMP
Date: Thu, 21 Apr 2022 11:15:44 -0400
Message-Id: <20220421151600.984189-2-jsnow@redhat.com>
In-Reply-To: <20220421151600.984189-1-jsnow@redhat.com>
References: <20220421151600.984189-1-jsnow@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.1
Received-SPF: pass client-ip=170.10.129.124; envelope-from=jsnow@redhat.com;
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

Remove the QEMU_PYTHON_LEGACY_QMP environment variable, making the
switch from sync qmp to async qmp permanent. Update exceptions and
import paths as necessary.

Signed-off-by: John Snow <jsnow@redhat.com>
Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Reviewed-by: Beraldo Leal <bleal@redhat.com>
Acked-by: Hanna Reitz <hreitz@redhat.com>
Message-id: 20220321203315.909411-2-jsnow@redhat.com
Signed-off-by: John Snow <jsnow@redhat.com>
---
 python/qemu/machine/machine.py | 18 +++++++-----------
 python/qemu/machine/qtest.py   |  2 +-
 2 files changed, 8 insertions(+), 12 deletions(-)

diff --git a/python/qemu/machine/machine.py b/python/qemu/machine/machine.py
index a5972fab4d2..41be025ac7b 100644
--- a/python/qemu/machine/machine.py
+++ b/python/qemu/machine/machine.py
@@ -40,21 +40,16 @@
     TypeVar,
 )
 
-from qemu.qmp import (  # pylint: disable=import-error
+from qemu.aqmp import SocketAddrT
+from qemu.aqmp.legacy import (
+    QEMUMonitorProtocol,
     QMPMessage,
     QMPReturnValue,
-    SocketAddrT,
 )
 
 from . import console_socket
 
 
-if os.environ.get('QEMU_PYTHON_LEGACY_QMP'):
-    from qemu.qmp import QEMUMonitorProtocol
-else:
-    from qemu.aqmp.legacy import QEMUMonitorProtocol
-
-
 LOG = logging.getLogger(__name__)
 
 
@@ -743,8 +738,9 @@ def events_wait(self,
         :param timeout: Optional timeout, in seconds.
                         See QEMUMonitorProtocol.pull_event.
 
-        :raise QMPTimeoutError: If timeout was non-zero and no matching events
-                                were found.
+        :raise asyncio.TimeoutError:
+            If timeout was non-zero and no matching events were found.
+
         :return: A QMP event matching the filter criteria.
                  If timeout was 0 and no event matched, None.
         """
@@ -767,7 +763,7 @@ def _match(event: QMPMessage) -> bool:
             event = self._qmp.pull_event(wait=timeout)
             if event is None:
                 # NB: None is only returned when timeout is false-ish.
-                # Timeouts raise QMPTimeoutError instead!
+                # Timeouts raise asyncio.TimeoutError instead!
                 break
             if _match(event):
                 return event
diff --git a/python/qemu/machine/qtest.py b/python/qemu/machine/qtest.py
index f2f9aaa5e50..13e0aaff846 100644
--- a/python/qemu/machine/qtest.py
+++ b/python/qemu/machine/qtest.py
@@ -26,7 +26,7 @@
     TextIO,
 )
 
-from qemu.qmp import SocketAddrT  # pylint: disable=import-error
+from qemu.aqmp import SocketAddrT
 
 from .machine import QEMUMachine
 
-- 
2.34.1


