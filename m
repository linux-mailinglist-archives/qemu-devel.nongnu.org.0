Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 42D5D4968BB
	for <lists+qemu-devel@lfdr.de>; Sat, 22 Jan 2022 01:29:34 +0100 (CET)
Received: from localhost ([::1]:35160 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nB4Hd-0000g1-Cd
	for lists+qemu-devel@lfdr.de; Fri, 21 Jan 2022 19:29:33 -0500
Received: from eggs.gnu.org ([209.51.188.92]:39114)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1nB3yo-0000sZ-Am
 for qemu-devel@nongnu.org; Fri, 21 Jan 2022 19:10:06 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:41830)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1nB3ym-0005Kd-3l
 for qemu-devel@nongnu.org; Fri, 21 Jan 2022 19:10:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1642810203;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=AW2FhHRH7pKjv6l/23XsAtQ4lKxZE7wChiPYstouEvU=;
 b=iwCq1Xt/Y+v2oSSdidk9EoVZHungt/tCIaRdwItMhCYS1stALqVvYtM2TiLviwlCL9sMGk
 WM9f0OmLyfFPeS8YSqTDECb/tZmjOqcxl4vsguBfFC7O4dcAaRLW457gNn30Qh86d2cSB8
 vO7pz/2DYVjXFziDLUIVpcnZF7BclSU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-5-eQNXAlPzObyGwQm5-fbUHw-1; Fri, 21 Jan 2022 19:09:55 -0500
X-MC-Unique: eQNXAlPzObyGwQm5-fbUHw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D5DDC1083F61;
 Sat, 22 Jan 2022 00:09:53 +0000 (UTC)
Received: from scv.redhat.com (unknown [10.22.19.60])
 by smtp.corp.redhat.com (Postfix) with ESMTP id EB83C66E1B;
 Sat, 22 Jan 2022 00:09:52 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 10/17] python/qmp: switch qemu-ga-client to AQMP
Date: Fri, 21 Jan 2022 19:09:24 -0500
Message-Id: <20220122000931.536322-11-jsnow@redhat.com>
In-Reply-To: <20220122000931.536322-1-jsnow@redhat.com>
References: <20220122000931.536322-1-jsnow@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
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
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
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
Cc: Eduardo Habkost <eduardo@habkost.net>,
 Peter Maydell <peter.maydell@linaro.org>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Beraldo Leal <bleal@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Cleber Rosa <crosa@redhat.com>, John Snow <jsnow@redhat.com>
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


