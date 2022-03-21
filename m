Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AE034E31F2
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Mar 2022 21:38:43 +0100 (CET)
Received: from localhost ([::1]:37968 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nWOna-000640-Dc
	for lists+qemu-devel@lfdr.de; Mon, 21 Mar 2022 16:38:42 -0400
Received: from eggs.gnu.org ([209.51.188.92]:36668)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1nWOiT-0004MS-HM
 for qemu-devel@nongnu.org; Mon, 21 Mar 2022 16:33:25 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:46513)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1nWOiP-0006by-9N
 for qemu-devel@nongnu.org; Mon, 21 Mar 2022 16:33:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1647894798;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Udfak1XwaNfheJn8jjtOYizOmvE0eto1dzDDl3Sj5sA=;
 b=hYMc/WZP85iDS2IMIMmaQQD68MDCgfmRfEKFb/HATDVviKzV2Y35jzlPiDo13ibDvYhxFk
 nw0QA6ErRelRjwemsbcAaFX3suaEdPgDOx265AQAC7FHPInPnKOSmJrn8/J0L0pKjKTqex
 /+z6lhusbLeo/tJIqqMMRCGWMZAGw1Q=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-439-x_Z8QF-KORW_t7k0ftYOng-1; Mon, 21 Mar 2022 16:33:17 -0400
X-MC-Unique: x_Z8QF-KORW_t7k0ftYOng-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id F248585A5A8;
 Mon, 21 Mar 2022 20:33:16 +0000 (UTC)
Received: from scv.redhat.com (unknown [10.22.16.64])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9651C141DEE9;
 Mon, 21 Mar 2022 20:33:16 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 1/4] python/machine: permanently switch to AQMP
Date: Mon, 21 Mar 2022 16:33:12 -0400
Message-Id: <20220321203315.909411-2-jsnow@redhat.com>
In-Reply-To: <20220321203315.909411-1-jsnow@redhat.com>
References: <20220321203315.909411-1-jsnow@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.7
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
switch from sync qmp to async qmp permanent. Update exceptions and
import paths as necessary.

Signed-off-by: John Snow <jsnow@redhat.com>
Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Reviewed-by: Beraldo Leal <bleal@redhat.com>
Acked-by: Hanna Reitz <hreitz@redhat.com>
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
2.34.1


