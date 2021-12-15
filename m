Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B192476257
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Dec 2021 20:57:18 +0100 (CET)
Received: from localhost ([::1]:36494 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mxaOr-0004ps-Bb
	for lists+qemu-devel@lfdr.de; Wed, 15 Dec 2021 14:57:17 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49288)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1mxaAd-00053T-Jo
 for qemu-devel@nongnu.org; Wed, 15 Dec 2021 14:42:38 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:27097)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1mxaAb-0000lb-Rj
 for qemu-devel@nongnu.org; Wed, 15 Dec 2021 14:42:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1639597353;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=pdCv53NqcC/gHhN4IgKau9iSfhdUIeYYu37PK97CXuY=;
 b=F6KON8W+T4spTI8ng71isecD5hCcaT+bT9azL8Z/FCgnJO9Ohwas99Zfc3afXjqBL8utXH
 Ntw/FWvVukl3yQj/ebCfyLGYpG2ZpB/TDUAm4WeucqG817pK67S9mKk4623yrbku7/xjGi
 k3jBuLy2hYGbxZi40XyTbMdHm3CxYxs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-541-tVOq3d69Orm7rgDBno8wvw-1; Wed, 15 Dec 2021 14:42:30 -0500
X-MC-Unique: tVOq3d69Orm7rgDBno8wvw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D15628042A2;
 Wed, 15 Dec 2021 19:42:28 +0000 (UTC)
Received: from scv.redhat.com (unknown [10.22.19.57])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 90A5B1036D00;
 Wed, 15 Dec 2021 19:42:27 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 12/25] python/machine: permanently switch to AQMP
Date: Wed, 15 Dec 2021 14:39:26 -0500
Message-Id: <20211215193939.3768033-13-jsnow@redhat.com>
In-Reply-To: <20211215193939.3768033-1-jsnow@redhat.com>
References: <20211215193939.3768033-1-jsnow@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
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
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.719,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Eduardo Habkost <eduardo@habkost.net>, Kevin Wolf <kwolf@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Daniel Berrange <berrange@redhat.com>, Beraldo Leal <bleal@redhat.com>,
 qemu-block@nongnu.org, Andrea Bolognani <abologna@redhat.com>,
 Wainer Moschetta <wainersm@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Cleber Rosa <crosa@redhat.com>, John Snow <jsnow@redhat.com>
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


