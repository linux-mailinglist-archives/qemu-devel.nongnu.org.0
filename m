Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0327C476215
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Dec 2021 20:48:35 +0100 (CET)
Received: from localhost ([::1]:41016 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mxaGR-0005TE-4O
	for lists+qemu-devel@lfdr.de; Wed, 15 Dec 2021 14:48:35 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48860)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1mxaA1-0004JM-GN
 for qemu-devel@nongnu.org; Wed, 15 Dec 2021 14:41:58 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:21453)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1mxa9x-0006mp-Bk
 for qemu-devel@nongnu.org; Wed, 15 Dec 2021 14:41:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1639597309;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=vLFhR7ZJ7BWeCLyQJFXmxjzGjmcX2i8VzFRc8cNrtAM=;
 b=W54O17KwrK4uy7jUm/NdbbU/0xqhBW0zctROoWF6e6PZVszdH/oo1Brkibhgx5HI0N9oWd
 pVhc0wZL6Ad3Ufb1oKzP4KIqG+/6xFVk3h/3+j4FK1QTkOVbeRvRk0JyAK/e3qAYOqDNTK
 p8Wx2GKAkORjRWB/WOLKegJ/Vvuygts=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-581-BB49RfWnPI--fHivSZIKEw-1; Wed, 15 Dec 2021 14:41:46 -0500
X-MC-Unique: BB49RfWnPI--fHivSZIKEw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9F09E760C9;
 Wed, 15 Dec 2021 19:41:44 +0000 (UTC)
Received: from scv.redhat.com (unknown [10.22.19.57])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 605C110074FD;
 Wed, 15 Dec 2021 19:41:43 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 07/25] python/qmp: switch qemu-ga-client to AQMP
Date: Wed, 15 Dec 2021 14:39:21 -0500
Message-Id: <20211215193939.3768033-8-jsnow@redhat.com>
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
Cc: Eduardo Habkost <eduardo@habkost.net>, Kevin Wolf <kwolf@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Daniel Berrange <berrange@redhat.com>, Beraldo Leal <bleal@redhat.com>,
 qemu-block@nongnu.org, Andrea Bolognani <abologna@redhat.com>,
 Wainer Moschetta <wainersm@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Cleber Rosa <crosa@redhat.com>, John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: John Snow <jsnow@redhat.com>
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


