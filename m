Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CABC48A3ED
	for <lists+qemu-devel@lfdr.de>; Tue, 11 Jan 2022 00:49:28 +0100 (CET)
Received: from localhost ([::1]:58066 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n74Pn-000826-3Z
	for lists+qemu-devel@lfdr.de; Mon, 10 Jan 2022 18:49:27 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43068)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1n748l-0004SF-2f
 for qemu-devel@nongnu.org; Mon, 10 Jan 2022 18:31:51 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:43078)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1n748j-0000HN-7u
 for qemu-devel@nongnu.org; Mon, 10 Jan 2022 18:31:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1641857508;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=AW2FhHRH7pKjv6l/23XsAtQ4lKxZE7wChiPYstouEvU=;
 b=cCc5f8Oe2etSBKsUk6giOLjj1R9AtJYMPD0G+8MwjLsWNCNmFVjWP+m0w2jxbEt3O5+ytL
 LJszkz5y4W2fRO6NjYWg+LEJnCIqwEzoy2ZIdixZfwjLX4goELxa+gb7rR+wrxufwTbuug
 CN7TcsVqHrhTf78Bp8bzwEjy3EWixFE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-214-CxVlVZoKMjiW3aUNTBiXjQ-1; Mon, 10 Jan 2022 18:31:45 -0500
X-MC-Unique: CxVlVZoKMjiW3aUNTBiXjQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 09E9E10247A6;
 Mon, 10 Jan 2022 23:31:44 +0000 (UTC)
Received: from scv.redhat.com (unknown [10.22.16.219])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D31DC7B028;
 Mon, 10 Jan 2022 23:31:42 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 12/31] python/qmp: switch qemu-ga-client to AQMP
Date: Mon, 10 Jan 2022 18:28:51 -0500
Message-Id: <20220110232910.1923864-13-jsnow@redhat.com>
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
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.597,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Eduardo Habkost <eduardo@habkost.net>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Daniel Berrange <berrange@redhat.com>, Beraldo Leal <bleal@redhat.com>,
 qemu-block@nongnu.org, Markus Armbruster <armbru@redhat.com>,
 Wainer Moschetta <wainersm@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Async QMP always raises a "ConnectError" on any connection error which
houses the cause in a second exception. We can check if this root cause
was python's ConnectionError to determine a fairly similar condition to
the original error check here.

Signed-off-by: John Snow <jsnow@redhat.com>
Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Reviewed-by: Beraldo Leal <bleal@redhat.com>
---
 python/qemu/qmp/qemu_ga_client.py | 22 +++++++++++-----------
 1 file changed, 11 insertions(+), 11 deletions(-)

diff --git a/python/qemu/qmp/qemu_ga_client.py b/python/qemu/qmp/qemu_ga_client.py
index b3e1d98c9e..15ed430c61 100644
--- a/python/qemu/qmp/qemu_ga_client.py
+++ b/python/qemu/qmp/qemu_ga_client.py
@@ -37,8 +37,8 @@
 # the COPYING file in the top-level directory.
 
 import argparse
+import asyncio
 import base64
-import errno
 import os
 import random
 import sys
@@ -50,8 +50,8 @@
     Sequence,
 )
 
-from qemu import qmp
-from qemu.qmp import SocketAddrT
+from qemu.aqmp import ConnectError, SocketAddrT
+from qemu.aqmp.legacy import QEMUMonitorProtocol
 
 
 # This script has not seen many patches or careful attention in quite
@@ -61,7 +61,7 @@
 # pylint: disable=missing-docstring
 
 
-class QemuGuestAgent(qmp.QEMUMonitorProtocol):
+class QemuGuestAgent(QEMUMonitorProtocol):
     def __getattr__(self, name: str) -> Callable[..., Any]:
         def wrapper(**kwds: object) -> object:
             return self.command('guest-' + name.replace('_', '-'), **kwds)
@@ -149,7 +149,7 @@ def ping(self, timeout: Optional[float]) -> bool:
         self.qga.settimeout(timeout)
         try:
             self.qga.ping()
-        except TimeoutError:
+        except asyncio.TimeoutError:
             return False
         return True
 
@@ -172,7 +172,7 @@ def suspend(self, mode: str) -> None:
         try:
             getattr(self.qga, 'suspend' + '_' + mode)()
             # On error exception will raise
-        except TimeoutError:
+        except asyncio.TimeoutError:
             # On success command will timed out
             return
 
@@ -182,7 +182,7 @@ def shutdown(self, mode: str = 'powerdown') -> None:
 
         try:
             self.qga.shutdown(mode=mode)
-        except TimeoutError:
+        except asyncio.TimeoutError:
             pass
 
 
@@ -277,7 +277,7 @@ def _cmd_reboot(client: QemuGuestAgentClient, args: Sequence[str]) -> None:
 
 def send_command(address: str, cmd: str, args: Sequence[str]) -> None:
     if not os.path.exists(address):
-        print('%s not found' % address)
+        print(f"'{address}' not found. (Is QEMU running?)")
         sys.exit(1)
 
     if cmd not in commands:
@@ -287,10 +287,10 @@ def send_command(address: str, cmd: str, args: Sequence[str]) -> None:
 
     try:
         client = QemuGuestAgentClient(address)
-    except OSError as err:
+    except ConnectError as err:
         print(err)
-        if err.errno == errno.ECONNREFUSED:
-            print('Hint: qemu is not running?')
+        if isinstance(err.exc, ConnectionError):
+            print('(Is QEMU running?)')
         sys.exit(1)
 
     if cmd == 'fsfreeze' and args[0] == 'freeze':
-- 
2.31.1


