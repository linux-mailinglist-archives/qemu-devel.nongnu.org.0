Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DF03245CD58
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Nov 2021 20:36:02 +0100 (CET)
Received: from localhost ([::1]:52430 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mpy3l-0005CM-VT
	for lists+qemu-devel@lfdr.de; Wed, 24 Nov 2021 14:36:02 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35906)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1mpxvE-0003fv-Ud
 for qemu-devel@nongnu.org; Wed, 24 Nov 2021 14:27:12 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:56655)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1mpxvA-0007dU-T0
 for qemu-devel@nongnu.org; Wed, 24 Nov 2021 14:27:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1637782027;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=pdCv53NqcC/gHhN4IgKau9iSfhdUIeYYu37PK97CXuY=;
 b=YavIFtP4L3+I6cslWUBBw4KE6UemOie2E48SRE5T4NI0vScObQ1y7t9cCQVW1NxsjuTJ46
 2AqtcVzqOiKx0wLviX+6JDfIoRmWd/HRemJPUAw085q8pR0KvBhoixusE1gab6QNmIJ45s
 yzXLttcBhCeW3q/Df3Hx63FzZ375GeA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-574-xvrVO2J5NkSrGY095lMC1A-1; Wed, 24 Nov 2021 14:27:06 -0500
X-MC-Unique: xvrVO2J5NkSrGY095lMC1A-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 25848190A7A6;
 Wed, 24 Nov 2021 19:27:00 +0000 (UTC)
Received: from scv.redhat.com (unknown [10.22.9.79])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 00EC367842;
 Wed, 24 Nov 2021 19:26:58 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 11/23] python/machine: permanently switch to AQMP
Date: Wed, 24 Nov 2021 14:26:05 -0500
Message-Id: <20211124192617.3396403-12-jsnow@redhat.com>
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

Remove the QEMU_PYTHON_LEGACY_QMP environment variable, making the
switch permanent. Update Exceptions and import paths as necessary.

Signed-off-by: John Snow <jsnow@redhat.com>
---
 python/qemu/machine/machine.py | 18 +++++++-----------
 python/qemu/machine/qtest.py   |  2 +-
 2 files changed, 8 insertions(+), 12 deletions(-)

diff --git a/python/qemu/machine/machine.py b/python/qemu/machine/machine.py
index 67ab06ca2b..21fb4a4f30 100644
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
 
 
@@ -710,8 +705,9 @@ def events_wait(self,
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
@@ -734,7 +730,7 @@ def _match(event: QMPMessage) -> bool:
             event = self._qmp.pull_event(wait=timeout)
             if event is None:
                 # NB: None is only returned when timeout is false-ish.
-                # Timeouts raise QMPTimeoutError instead!
+                # Timeouts raise asyncio.TimeoutError instead!
                 break
             if _match(event):
                 return event
diff --git a/python/qemu/machine/qtest.py b/python/qemu/machine/qtest.py
index f2f9aaa5e5..817c8a5425 100644
--- a/python/qemu/machine/qtest.py
+++ b/python/qemu/machine/qtest.py
@@ -26,7 +26,7 @@
     TextIO,
 )
 
-from qemu.qmp import SocketAddrT  # pylint: disable=import-error
+from qemu.aqmp.protocol import SocketAddrT
 
 from .machine import QEMUMachine
 
-- 
2.31.1


