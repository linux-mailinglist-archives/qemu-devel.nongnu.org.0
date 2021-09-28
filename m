Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CC9441B155
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Sep 2021 15:56:35 +0200 (CEST)
Received: from localhost ([::1]:53234 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mVDb0-0005IW-Ae
	for lists+qemu-devel@lfdr.de; Tue, 28 Sep 2021 09:56:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52558)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1mVDY8-0003DM-2Q
 for qemu-devel@nongnu.org; Tue, 28 Sep 2021 09:53:36 -0400
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a]:40920)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1mVDY6-0004be-2I
 for qemu-devel@nongnu.org; Tue, 28 Sep 2021 09:53:35 -0400
Received: by mail-ed1-x52a.google.com with SMTP id g8so83670728edt.7
 for <qemu-devel@nongnu.org>; Tue, 28 Sep 2021 06:53:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=2G1GFCQNbOJFx5keFGzEJBeOKV62iPssw9Ehaz2Zo6A=;
 b=bYYUGrYXregYTkMTDgF0DptZbRT7UfLw/ZpwzUrqS7qjU0sJ8KVTS283ZFqf7OFaB4
 0vM/HCY7Otl2UCCJ2x99TcL/zK46yX4fDyNd6yAM4NmdGfJa7JPVu7mOLiR8xK2+P/WV
 E/FcPNh0x7/8Ojacen213lTZ1ITnnBtYqqjx4bFCxfNfjiEQL8z/uCMNnL0jCVfzwZ3C
 Er4IjKnwQtfC7VhPqc5CIuX2IhFw83PILfZavv3j26K4NKxEDErCj9G2rIC+3x4qZ3/d
 tWxIE3VVuWVvQX6Wrfu4BJ9DW6oQYzbdkLVrZUZLscfd0c/MVTTiKhjM8bi3oXO6ZIxr
 OQDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=2G1GFCQNbOJFx5keFGzEJBeOKV62iPssw9Ehaz2Zo6A=;
 b=2xpVzuuLNFIOB5IXYp91xAz++WrDrPCxcXGseASn5ixiiRPUgm2O2aWXJMmPi8E0Ii
 TPzFbNa6xqMt6saWx0N9vOsFyWCg45LkIzfpGs6zEJh1wxkiDrX0WEC5ObDM/weHIA16
 2l9kuZWto1gt68N4TW2sZzs1T1VcVT1nxw7z3su4PRixwOPELvEq15WupQRPy0jEvGWs
 Ir9T2qfqiI4aTC61dX9SOy3THSRCuXZqdrAimP2Y2moWGpenvN7du5ebHxkC+0AtQ1y8
 fQ9aJnlKUs4lcuBhRLQbGZozppbsUOJ/VY3+zsLfylFMr8SmRVFkbX2//gEQytwudsf7
 n4Ew==
X-Gm-Message-State: AOAM531ZMpwg54ARg+c7aF8d06K9lJ9YftrH373isHoldi/Os9B9w2/g
 NWdqP0HG4LEaDJMfiCvZq6f9VmvhN8Q=
X-Google-Smtp-Source: ABdhPJyPos1gQVNAF+PA3clI/u5wPU4EzOzdEFK54qXzIaoW6Szqzn2kqHqs/1hiRhSiSU51/230wA==
X-Received: by 2002:a17:906:d8a4:: with SMTP id
 qc4mr7099372ejb.323.1632837193814; 
 Tue, 28 Sep 2021 06:53:13 -0700 (PDT)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id v13sm10373247ejh.62.2021.09.28.06.53.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Sep 2021 06:53:13 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 4/4] python: split the two sides of send_fd_scm
Date: Tue, 28 Sep 2021 15:53:09 +0200
Message-Id: <20210928135309.199796-5-pbonzini@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210928135309.199796-1-pbonzini@redhat.com>
References: <20210928135309.199796-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52a;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x52a.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: jsnow@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

send_fd_scm can be used as a simple wrapper for self._qmp.send_fd, or it
can be given a file that will be opened for the duration of the sendmsg
system call.  Split the two cases to separate functions.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 python/qemu/machine/machine.py | 34 ++++++++++++++++------------------
 tests/qemu-iotests/045         |  2 +-
 tests/qemu-iotests/147         |  2 +-
 3 files changed, 18 insertions(+), 20 deletions(-)

diff --git a/python/qemu/machine/machine.py b/python/qemu/machine/machine.py
index 813ccb17c2..8ad3604049 100644
--- a/python/qemu/machine/machine.py
+++ b/python/qemu/machine/machine.py
@@ -207,30 +207,28 @@ def add_fd(self: _T, fd: int, fdset: int,
         self._args.append(','.join(options))
         return self
 
-    def send_fd_scm(self, fd: Optional[int] = None,
-                    file_path: Optional[str] = None) -> None:
+    def send_file_scm(self, file_path: str) -> None:
         """
-        Send an fd or file_path via QMP.
-
-        Exactly one of fd and file_path must be given.
-        If it is file_path, the function will open that file and pass
-        its own fd.
+        Open a file and pass it to QEMU as a file descriptor.
         """
         # In iotest.py, the qmp should always use unix socket.
         assert self._qmp.is_scm_available()
 
-        if file_path is not None:
-            assert fd is None
-            fd = -1
-            try:
-                fd = os.open(file_path, os.O_RDONLY)
-                self._qmp.send_fd(fd)
-            finally:
-                if fd != -1:
-                    os.close(fd)
-        else:
-            assert fd is not None
+        fd = -1
+        try:
+            fd = os.open(file_path, os.O_RDONLY)
             self._qmp.send_fd(fd)
+        finally:
+            if fd != -1:
+                os.close(fd)
+
+    def send_fd_scm(self, fd: int) -> None:
+        """
+        Send a file descriptor via QMP.
+        """
+        # In iotest.py, the qmp should always use unix socket.
+        assert self._qmp.is_scm_available()
+        self._qmp.send_fd(fd)
 
     @staticmethod
     def _remove_if_exists(path: str) -> None:
diff --git a/tests/qemu-iotests/045 b/tests/qemu-iotests/045
index 3e6d42010e..1d1fe4a19a 100755
--- a/tests/qemu-iotests/045
+++ b/tests/qemu-iotests/045
@@ -141,7 +141,7 @@ class TestSCMFd(iotests.QMPTestCase):
         os.remove(image0)
 
     def _send_fd_by_SCM(self):
-        self.vm.send_fd_scm(file_path=image0)
+        self.vm.send_file_scm(image0)
 
     def test_add_fd(self):
         self._send_fd_by_SCM()
diff --git a/tests/qemu-iotests/147 b/tests/qemu-iotests/147
index 58de6db52e..e493ff4d0d 100755
--- a/tests/qemu-iotests/147
+++ b/tests/qemu-iotests/147
@@ -269,7 +269,7 @@ class BuiltinNBD(NBDBlockdevAddBase):
         sockfd = socket.socket(socket.AF_UNIX, socket.SOCK_STREAM)
         sockfd.connect(unix_socket)
 
-        self.vm.send_fd_scm(fd=sockfd.fileno())
+        self.vm.send_fd_scm(sockfd.fileno())
 
         result = self.vm.qmp('getfd', fdname='nbd-fifo')
         self.assert_qmp(result, 'return', {})
-- 
2.31.1


