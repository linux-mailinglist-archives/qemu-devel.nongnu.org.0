Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BAED128551F
	for <lists+qemu-devel@lfdr.de>; Wed,  7 Oct 2020 02:09:11 +0200 (CEST)
Received: from localhost ([::1]:46338 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kPx14-0008UB-Mn
	for lists+qemu-devel@lfdr.de; Tue, 06 Oct 2020 20:09:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38372)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1kPwqs-0007on-OG
 for qemu-devel@nongnu.org; Tue, 06 Oct 2020 19:58:38 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:30448)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1kPwqn-0002JL-W3
 for qemu-devel@nongnu.org; Tue, 06 Oct 2020 19:58:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1602028711;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=aYDwOvBaZTLf7VnYdeUTS/wPHO3+/u8SxUA78Ch0tKM=;
 b=VsiEPHuZHRvCFnXWVM1XCnec6i7YdtsGmqgqnFliH/kN9V5J89VNOq/L114QI+cB7IroB+
 y9u8Xddfhb9fjzI54GX41pkqlH6Lysy8+h0WIjU6aesgQZSSHyFVE20gSzSydGmGSn3kUY
 GASSVCH6yx6rC6epm4xMx/deq9hVbok=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-589-xAeD5HxpNSGJ_yAkEC5HDw-1; Tue, 06 Oct 2020 19:58:27 -0400
X-MC-Unique: xAeD5HxpNSGJ_yAkEC5HDw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3DFCC18BE165;
 Tue,  6 Oct 2020 23:58:26 +0000 (UTC)
Received: from scv.redhat.com (ovpn-120-38.rdu2.redhat.com [10.10.120.38])
 by smtp.corp.redhat.com (Postfix) with ESMTP id AC0C760BFA;
 Tue,  6 Oct 2020 23:58:22 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 04/20] python/machine.py: Don't modify state in _base_args()
Date: Tue,  6 Oct 2020 19:58:01 -0400
Message-Id: <20201006235817.3280413-5-jsnow@redhat.com>
In-Reply-To: <20201006235817.3280413-1-jsnow@redhat.com>
References: <20201006235817.3280413-1-jsnow@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/06 00:55:20
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.733,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Kevin Wolf <kwolf@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 qemu-block@nongnu.org, Max Reitz <mreitz@redhat.com>,
 Cleber Rosa <crosa@redhat.com>, John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Don't append to the _remove_files list during _base_args; instead do so
during _launch. Rework _base_args as a @property to help facilitate
this impression.

This has the additional benefit of making the type of _console_address
easier to analyze statically.

Signed-off-by: John Snow <jsnow@redhat.com>
Reviewed-by: Kevin Wolf <kwolf@redhat.com>
---
 python/qemu/machine.py | 17 ++++++++++-------
 python/qemu/qtest.py   |  7 ++++---
 2 files changed, 14 insertions(+), 10 deletions(-)

diff --git a/python/qemu/machine.py b/python/qemu/machine.py
index 71fe58be050..812ca7d3497 100644
--- a/python/qemu/machine.py
+++ b/python/qemu/machine.py
@@ -25,7 +25,7 @@
 import subprocess
 import tempfile
 from types import TracebackType
-from typing import Optional, Type
+from typing import List, Optional, Type
 
 from . import console_socket, qmp
 from .qmp import SocketAddrT
@@ -137,7 +137,9 @@ def __init__(self, binary, args=None, wrapper=None, name=None,
         self._console_index = 0
         self._console_set = False
         self._console_device_type = None
-        self._console_address = None
+        self._console_address = os.path.join(
+            self._sock_dir, f"{self._name}-console.sock"
+        )
         self._console_socket = None
         self._remove_files = []
         self._user_killed = False
@@ -253,7 +255,8 @@ def _load_io_log(self):
             with open(self._qemu_log_path, "r") as iolog:
                 self._iolog = iolog.read()
 
-    def _base_args(self):
+    @property
+    def _base_args(self) -> List[str]:
         args = ['-display', 'none', '-vga', 'none']
 
         if self._qmp_set:
@@ -271,9 +274,6 @@ def _base_args(self):
         for _ in range(self._console_index):
             args.extend(['-serial', 'null'])
         if self._console_set:
-            self._console_address = os.path.join(self._sock_dir,
-                                                 self._name + "-console.sock")
-            self._remove_files.append(self._console_address)
             chardev = ('socket,id=console,path=%s,server,nowait' %
                        self._console_address)
             args.extend(['-chardev', chardev])
@@ -289,6 +289,9 @@ def _pre_launch(self):
         self._qemu_log_path = os.path.join(self._temp_dir, self._name + ".log")
         self._qemu_log_file = open(self._qemu_log_path, 'wb')
 
+        if self._console_set:
+            self._remove_files.append(self._console_address)
+
         if self._qmp_set:
             if self._remove_monitor_sockfile:
                 assert isinstance(self._monitor_address, str)
@@ -374,7 +377,7 @@ def _launch(self):
         devnull = open(os.path.devnull, 'rb')
         self._pre_launch()
         self._qemu_full_args = (self._wrapper + [self._binary] +
-                                self._base_args() + self._args)
+                                self._base_args + self._args)
         LOG.debug('VM launch command: %r', ' '.join(self._qemu_full_args))
         self._popen = subprocess.Popen(self._qemu_full_args,
                                        stdin=devnull,
diff --git a/python/qemu/qtest.py b/python/qemu/qtest.py
index 7700c0b09b6..7fde2565a0a 100644
--- a/python/qemu/qtest.py
+++ b/python/qemu/qtest.py
@@ -19,7 +19,7 @@
 
 import os
 import socket
-from typing import Optional, TextIO
+from typing import List, Optional, TextIO
 
 from .machine import QEMUMachine
 
@@ -111,8 +111,9 @@ def __init__(self, binary, args=None, name=None, test_dir="/var/tmp",
         self._qtest = None
         self._qtest_path = os.path.join(sock_dir, name + "-qtest.sock")
 
-    def _base_args(self):
-        args = super()._base_args()
+    @property
+    def _base_args(self) -> List[str]:
+        args = super()._base_args
         args.extend(['-qtest', 'unix:path=' + self._qtest_path,
                      '-accel', 'qtest'])
         return args
-- 
2.26.2


