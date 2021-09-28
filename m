Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D588D41B184
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Sep 2021 16:02:56 +0200 (CEST)
Received: from localhost ([::1]:35928 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mVDh9-0004Nb-QK
	for lists+qemu-devel@lfdr.de; Tue, 28 Sep 2021 10:02:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52620)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1mVDYJ-0003NW-JZ
 for qemu-devel@nongnu.org; Tue, 28 Sep 2021 09:53:47 -0400
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535]:39934)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1mVDYH-0004lg-VV
 for qemu-devel@nongnu.org; Tue, 28 Sep 2021 09:53:47 -0400
Received: by mail-ed1-x535.google.com with SMTP id x7so68925286edd.6
 for <qemu-devel@nongnu.org>; Tue, 28 Sep 2021 06:53:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=YUuWRaYOqtXVrbNdK1ZefmQ6EAecdKXF8ILSBKR+oFE=;
 b=idTPRsNaZ7zosTWLBFEK582nJkC8zkL39evSuVEZ+BaOHiLeHeY3EapKsQNaKplPR0
 HvrZuJsKYWU5R3BL+5dXVi+DZqFCegT6+nMbf7/Zb1vny86I64D51/GsIZOBfk5OW6du
 y4yB1awQiFvch5HTzeKMDf4zAMiyZIi8p4MGmVt9CVVtXsCBQskW+h5EGpo07ikrc0au
 LuATj4EQHq+lqttHgp46lFBBNTWTXncsPAQ1T/PzQoDZE5tzvI8M7paRpYGlfBY7qAzM
 hhtG7f8UM1uQMs7ew6i77c58TSxBTO8W7WZdXw4NplJ22nFVzsF9jlKsZF5HtxXFvJxS
 P6XQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=YUuWRaYOqtXVrbNdK1ZefmQ6EAecdKXF8ILSBKR+oFE=;
 b=KaMJ6qYhEOv56em0RE/qDTwDozI2jTWy/8p0Z/u0agpnnh+xXppUpZOGT6XisjgoeP
 7wmk8Pdce6h1uLgeXnWTle3k1Uu5Pl752Dqkxlp4xcgc5pXX1/SAafhGNlFJkEiUUgae
 eqT/MgRCvUUpdSzkrFlQJohF/48epyVH7DQQJpj0kafgpq6L+dutHwNV7zoU/zTZWGsG
 CilABk1O6twFnx2CV/+SJEzwidE/aJpfOvpvoUdDhNGckRdiZFO7X2Ke5qANv3zpii5N
 fBuSz+4gI8kR6mjXbV4mUymCPqpqKd6OCl0Ej8gu/ihFn/RM314ndkNaH8aY6Ph0c6a7
 aSGw==
X-Gm-Message-State: AOAM531nd0oQwWHPRyciw9Z07bsBaUqPDO08Zpr8UQhncrbUx+0xsaZw
 5CNXboLPit/T+rwvYiMeVCZttkVDg6k=
X-Google-Smtp-Source: ABdhPJzuaayZpOLp84pDvpk3mPa2XsmQh/5xNHlYUAYAv55ylCn4Uf/w+Fbeg2pfxwLoMZmy7oOMCQ==
X-Received: by 2002:a17:906:1109:: with SMTP id
 h9mr6900974eja.296.1632837191588; 
 Tue, 28 Sep 2021 06:53:11 -0700 (PDT)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id v13sm10373247ejh.62.2021.09.28.06.53.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Sep 2021 06:53:11 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 1/4] python: stop using socket_scm_helper
Date: Tue, 28 Sep 2021 15:53:06 +0200
Message-Id: <20210928135309.199796-2-pbonzini@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210928135309.199796-1-pbonzini@redhat.com>
References: <20210928135309.199796-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::535;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x535.google.com
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

Python is able to call sendmsg, it does not need a helper.  Write the
code directly; for now, keep the weird calling convention.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 python/qemu/machine/machine.py | 48 ++++++++++++----------------------
 python/qemu/qmp/__init__.py    | 15 +++++++++++
 2 files changed, 32 insertions(+), 31 deletions(-)

diff --git a/python/qemu/machine/machine.py b/python/qemu/machine/machine.py
index 34131884a5..e4356ea99e 100644
--- a/python/qemu/machine/machine.py
+++ b/python/qemu/machine/machine.py
@@ -213,48 +213,34 @@ def add_fd(self: _T, fd: int, fdset: int,
     def send_fd_scm(self, fd: Optional[int] = None,
                     file_path: Optional[str] = None) -> int:
         """
-        Send an fd or file_path to socket_scm_helper.
+        Send an fd or file_path via QMP.
 
         Exactly one of fd and file_path must be given.
-        If it is file_path, the helper will open that file and pass its own fd.
+        If it is file_path, the function will open that file and pass
+        its own fd.
         """
         # In iotest.py, the qmp should always use unix socket.
         assert self._qmp.is_scm_available()
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
 
         if file_path is not None:
             assert fd is None
-            fd_param.append(file_path)
+            fd = -1
+            try:
+                fd = os.open(file_path, os.O_RDONLY)
+                self._qmp.send_fd(fd)
+            except OSError:
+                return 1
+            finally:
+                if fd != -1:
+                    os.close(fd)
         else:
             assert fd is not None
-            fd_param.append(str(fd))
+            try:
+                self._qmp.send_fd(fd)
+            except OSError:
+                return 1
 
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
index 269516a79b..27a3e8f7af 100644
--- a/python/qemu/qmp/__init__.py
+++ b/python/qemu/qmp/__init__.py
@@ -17,6 +17,7 @@
 # This work is licensed under the terms of the GNU GPL, version 2.  See
 # the COPYING file in the top-level directory.
 
+import array
 import errno
 import json
 import logging
@@ -421,3 +422,17 @@ def is_scm_available(self) -> bool:
         @return True if SCM_RIGHTS is available, otherwise False.
         """
         return self.__sock.family == socket.AF_UNIX
+
+    def send_fd(self, fd: int) -> None:
+        """
+        Send a file descriptor to QEMU via SCM_RIGHTS.
+
+        @param fd (int): file descriptor do be sent
+
+        @raise OSError: if the sendmsg system call fails.
+        """
+        # Send a single space so that QEMU looks at the ancillary data
+        self.__sock.sendmsg((b" ", ),
+                            [(socket.SOL_SOCKET,
+                              socket.SCM_RIGHTS,
+                              array.array("i", [fd]).tobytes())])
-- 
2.31.1



