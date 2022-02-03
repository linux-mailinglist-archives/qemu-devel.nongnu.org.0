Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 749F84A7DE8
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Feb 2022 03:28:17 +0100 (CET)
Received: from localhost ([::1]:38860 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nFRr6-0005iQ-KU
	for lists+qemu-devel@lfdr.de; Wed, 02 Feb 2022 21:28:16 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48908)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1nFRni-00038Q-Fh
 for qemu-devel@nongnu.org; Wed, 02 Feb 2022 21:24:46 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:20977)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1nFRng-0000WL-Oe
 for qemu-devel@nongnu.org; Wed, 02 Feb 2022 21:24:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1643855084;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xEF69ok/j8twN801V3ietxykPA38oe4dvJicwK/x9zg=;
 b=MsM9w6UAMhV4uoWjfTwB6JI8pL9D4ohDXZB6zDgIjftMoX3W+Ws+GBe2imAhzKrOfxE8CH
 NEeqyAqSbEu9MtxK3xKR6QIgZOZ4Ted1Z8PGFpmtER+KBuGaBcYd/EhRWmCoG5LdDyk3Ip
 g6UR0horiPaEjMDVtFr/9W3Tn3eQOx8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-517-cae4baXwOvi5mNZKmu-N4w-1; Wed, 02 Feb 2022 21:24:41 -0500
X-MC-Unique: cae4baXwOvi5mNZKmu-N4w-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2AD49802932;
 Thu,  3 Feb 2022 02:24:40 +0000 (UTC)
Received: from scv.redhat.com (unknown [10.22.16.25])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 1914E17A89;
 Thu,  3 Feb 2022 02:24:33 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 1/4] python/machine: permanently switch to AQMP
Date: Wed,  2 Feb 2022 21:24:02 -0500
Message-Id: <20220203022405.1336635-2-jsnow@redhat.com>
In-Reply-To: <20220203022405.1336635-1-jsnow@redhat.com>
References: <20220203022405.1336635-1-jsnow@redhat.com>
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
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.086,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Eduardo Habkost <eduardo@habkost.net>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Beraldo Leal <bleal@redhat.com>, qemu-block@nongnu.org,
 Hanna Reitz <hreitz@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Remove the QEMU_PYTHON_LEGACY_QMP environment variable, making the
switch permanent. Update Exceptions and import paths as necessary.

Signed-off-by: John Snow <jsnow@redhat.com>
Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Reviewed-by: Beraldo Leal <bleal@redhat.com>
---
 python/qemu/machine/machine.py | 18 +++++++-----------
 python/qemu/machine/qtest.py   |  2 +-
 2 files changed, 8 insertions(+), 12 deletions(-)

diff --git a/python/qemu/machine/machine.py b/python/qemu/machine/machine.py
index a5972fab4d..41be025ac7 100644
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
index f2f9aaa5e5..13e0aaff84 100644
--- a/python/qemu/machine/qtest.py
+++ b/python/qemu/machine/qtest.py
@@ -26,7 +26,7 @@
     TextIO,
 )
 
-from qemu.qmp import SocketAddrT  # pylint: disable=import-error
+from qemu.aqmp import SocketAddrT
 
 from .machine import QEMUMachine
 
-- 
2.31.1


