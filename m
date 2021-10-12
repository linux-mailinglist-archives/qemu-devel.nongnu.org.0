Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B38D42AF5C
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Oct 2021 23:53:19 +0200 (CEST)
Received: from localhost ([::1]:45266 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1maPi2-0004Ku-IP
	for lists+qemu-devel@lfdr.de; Tue, 12 Oct 2021 17:53:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54118)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1maPYa-0005px-8D
 for qemu-devel@nongnu.org; Tue, 12 Oct 2021 17:43:32 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:47436)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1maPYY-0000Pr-Dq
 for qemu-devel@nongnu.org; Tue, 12 Oct 2021 17:43:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634075009;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=L6wF5o38BapHI3wQa9EHYU5L1He/kjVjqsvwBeHRsIY=;
 b=Q4h9JuPHbReTsuv1tChBAvrewK4zXozQpeA9//m88jBUsbLDgoTrsmigwJfbEoqiigXpiB
 p5YtNv3YtwwaVNruqizio489+xi+Vmkmy8nVcxOEiKOZsottj9yytCrC1NOCsXyU8Gp6Ou
 WLt8e8Mbd71ENas2LHpAA0zQhk4FYC0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-536-m1IsMVzsOnCr-uGMN29xHg-1; Tue, 12 Oct 2021 17:43:25 -0400
X-MC-Unique: m1IsMVzsOnCr-uGMN29xHg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 92EE8802588;
 Tue, 12 Oct 2021 21:43:24 +0000 (UTC)
Received: from scv.redhat.com (unknown [10.22.16.191])
 by smtp.corp.redhat.com (Postfix) with ESMTP id F2C3D5D6A8;
 Tue, 12 Oct 2021 21:43:22 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 09/10] python/qmp: add send_fd_scm directly to
 QEMUMonitorProtocol
Date: Tue, 12 Oct 2021 17:41:51 -0400
Message-Id: <20211012214152.802483-10-jsnow@redhat.com>
In-Reply-To: <20211012214152.802483-1-jsnow@redhat.com>
References: <20211012214152.802483-1-jsnow@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.049,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 Thomas Huth <thuth@redhat.com>, Daniel Berrange <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, qemu-block@nongnu.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Willian Rampazzo <willianr@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

It turns out you can do this directly from Python ... and because of
this, you don't need to worry about setting the inheritability of the
fds or spawning another process.

Doing this is helpful because it allows QEMUMonitorProtocol to keep its
file descriptor and socket object as private implementation
details. /that/ is helpful in turn because it allows me to write a
compatible, alternative implementation.

Signed-off-by: John Snow <jsnow@redhat.com>
Reviewed-by: Hanna Reitz <hreitz@redhat.com>
Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>
Message-id: 20210923004938.3999963-10-jsnow@redhat.com
Signed-off-by: John Snow <jsnow@redhat.com>
---
 python/qemu/machine/machine.py | 44 +++++++---------------------------
 python/qemu/qmp/__init__.py    | 21 +++++++---------
 2 files changed, 18 insertions(+), 47 deletions(-)

diff --git a/python/qemu/machine/machine.py b/python/qemu/machine/machine.py
index ae945ca3c94..1c6532a3d68 100644
--- a/python/qemu/machine/machine.py
+++ b/python/qemu/machine/machine.py
@@ -213,48 +213,22 @@ def add_fd(self: _T, fd: int, fdset: int,
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
index c27594b66a2..358c0971d06 100644
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
@@ -408,18 +409,14 @@ def settimeout(self, timeout: Optional[float]) -> None:
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


