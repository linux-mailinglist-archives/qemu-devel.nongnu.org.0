Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D3FF93CC0C0
	for <lists+qemu-devel@lfdr.de>; Sat, 17 Jul 2021 04:41:14 +0200 (CEST)
Received: from localhost ([::1]:54268 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m4aGP-0008BJ-V1
	for lists+qemu-devel@lfdr.de; Fri, 16 Jul 2021 22:41:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49636)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1m4aDl-0004D5-NN
 for qemu-devel@nongnu.org; Fri, 16 Jul 2021 22:38:29 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:35041)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1m4aDi-0005BU-Ou
 for qemu-devel@nongnu.org; Fri, 16 Jul 2021 22:38:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626489505;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=bjzHs636GoxCcuKOi21v3h6QbJipRMBYuDCRBZ3uFuI=;
 b=fEAqBIivccmsOF8IU/ofy2orzwkQ22HtwmYqqWwBKqbeb4cLwrleF45NBVsSWyTI5VOlHm
 KPMiEc+d3QZs6fC9TBfJUxmGyIsTbLCRcA49dhssKwZJPmiqL7mSip8VJCxNKSwTDf3Qv5
 FQ9888Kq2O0iyouSFpXAmEBfGo/qBmk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-9-P9AiioAVPWWeZQ6no15N4A-1; Fri, 16 Jul 2021 22:38:23 -0400
X-MC-Unique: P9AiioAVPWWeZQ6no15N4A-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2E5DE802C80;
 Sat, 17 Jul 2021 02:38:22 +0000 (UTC)
Received: from scv.redhat.com (ovpn-119-183.rdu2.redhat.com [10.10.119.183])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 67AEF10016F7;
 Sat, 17 Jul 2021 02:38:21 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 1/2] python/qmp: add send_fd_scm directly to
 QEMUMonitorProtocol
Date: Fri, 16 Jul 2021 22:38:18 -0400
Message-Id: <20210717023819.884039-2-jsnow@redhat.com>
In-Reply-To: <20210717023819.884039-1-jsnow@redhat.com>
References: <20210717023819.884039-1-jsnow@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

It turns out you can do this directly from Python ... and because of
this, you don't need to worry about setting the fds, or spawning another
process.

Doing this is helpful because it allows QEMUMonitorProtocol to keep its
file descriptor and socket object as private implementation details,
which allows me to construct a different implementation -- a Synchronous
wrapper around my Async QMP library.

Signed-off-by: John Snow <jsnow@redhat.com>
---
 python/qemu/machine/machine.py | 44 +++++++---------------------------
 python/qemu/qmp/__init__.py    | 21 +++++++---------
 2 files changed, 18 insertions(+), 47 deletions(-)

diff --git a/python/qemu/machine/machine.py b/python/qemu/machine/machine.py
index 971ed7e8c6a..da47e2704cf 100644
--- a/python/qemu/machine/machine.py
+++ b/python/qemu/machine/machine.py
@@ -205,48 +205,22 @@ def add_fd(self, fd: int, fdset: int,
     def send_fd_scm(self, fd: Optional[int] = None,
                     file_path: Optional[str] = None) -> int:
         """
-        Send an fd or file_path to socket_scm_helper.
+        Send an fd or file_path to the remote via SCM_RIGHTS.
 
-        Exactly one of fd and file_path must be given.
-        If it is file_path, the helper will open that file and pass its own fd.
+        Exactly one of fd and file_path must be given.  If it is
+        file_path, the file will be opened read-only and the new file
+        descriptor will be sent to the remote.
         """
-        # In iotest.py, the qmp should always use unix socket.
-        assert self._qmp.is_scm_available()
-        if self._socket_scm_helper is None:
-            raise QEMUMachineError("No path to socket_scm_helper set")
-        if not os.path.exists(self._socket_scm_helper):
-            raise QEMUMachineError("%s does not exist" %
-                                   self._socket_scm_helper)
-
-        # This did not exist before 3.4, but since then it is
-        # mandatory for our purpose
-        if hasattr(os, 'set_inheritable'):
-            os.set_inheritable(self._qmp.get_sock_fd(), True)
-            if fd is not None:
-                os.set_inheritable(fd, True)
-
-        fd_param = ["%s" % self._socket_scm_helper,
-                    "%d" % self._qmp.get_sock_fd()]
-
         if file_path is not None:
             assert fd is None
-            fd_param.append(file_path)
+            with open(file_path, "rb") as passfile:
+                fd = passfile.fileno()
+                self._qmp.send_fd_scm(fd)
         else:
             assert fd is not None
-            fd_param.append(str(fd))
+            self._qmp.send_fd_scm(fd)
 
-        proc = subprocess.run(
-            fd_param,
-            stdin=subprocess.DEVNULL,
-            stdout=subprocess.PIPE,
-            stderr=subprocess.STDOUT,
-            check=False,
-            close_fds=False,
-        )
-        if proc.stdout:
-            LOG.debug(proc.stdout)
-
-        return proc.returncode
+        return 0
 
     @staticmethod
     def _remove_if_exists(path: str) -> None:
diff --git a/python/qemu/qmp/__init__.py b/python/qemu/qmp/__init__.py
index 269516a79b9..8a1710f3a10 100644
--- a/python/qemu/qmp/__init__.py
+++ b/python/qemu/qmp/__init__.py
@@ -21,6 +21,7 @@
 import json
 import logging
 import socket
+import struct
 from types import TracebackType
 from typing import (
     Any,
@@ -406,18 +407,14 @@ def settimeout(self, timeout: Optional[float]) -> None:
             raise ValueError(msg)
         self.__sock.settimeout(timeout)
 
-    def get_sock_fd(self) -> int:
+    def send_fd_scm(self, fd: int) -> None:
         """
-        Get the socket file descriptor.
-
-        @return The file descriptor number.
-        """
-        return self.__sock.fileno()
-
-    def is_scm_available(self) -> bool:
+        Send a file descriptor to the remote via SCM_RIGHTS.
         """
-        Check if the socket allows for SCM_RIGHTS.
+        if self.__sock.family != socket.AF_UNIX:
+            raise RuntimeError("Can't use SCM_RIGHTS on non-AF_UNIX socket.")
 
-        @return True if SCM_RIGHTS is available, otherwise False.
-        """
-        return self.__sock.family == socket.AF_UNIX
+        self.__sock.sendmsg(
+            [b' '],
+            [(socket.SOL_SOCKET, socket.SCM_RIGHTS, struct.pack('@i', fd))]
+        )
-- 
2.31.1


