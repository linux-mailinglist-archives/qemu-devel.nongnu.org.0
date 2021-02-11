Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CBC23195B4
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Feb 2021 23:19:16 +0100 (CET)
Received: from localhost ([::1]:46214 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lAKIt-0005Bm-0v
	for lists+qemu-devel@lfdr.de; Thu, 11 Feb 2021 17:19:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59410)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <crosa@redhat.com>) id 1lAK2G-0000Ky-4u
 for qemu-devel@nongnu.org; Thu, 11 Feb 2021 17:02:04 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:52078)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <crosa@redhat.com>) id 1lAK2D-0005tn-Fs
 for qemu-devel@nongnu.org; Thu, 11 Feb 2021 17:02:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1613080920;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=y2hvibq9qOY9t7tRlKusvRT2KSYUM2Z2KjXnneBL7KQ=;
 b=JlwdDYmOFw9tV/9TuA5Ukb6uyMApCPR1fq4S55nn5SSE9Pd7Gg72TJqpVeDrFLPUhoaRrt
 ze2JJD7zgIKZ6jVoK6wEGpZLnWguuE+W3p6n07a5yQOX6EIVTpYwjFez0nkaMBgd20jgwq
 mNZb9rd86hUx+PRcnS/5oVaRMQxpzlA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-25-N9mEZOxZNTG9mQzr4OPW-g-1; Thu, 11 Feb 2021 17:01:57 -0500
X-MC-Unique: N9mEZOxZNTG9mQzr4OPW-g-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0E9A0C7402;
 Thu, 11 Feb 2021 22:01:56 +0000 (UTC)
Received: from localhost.localdomain.com (ovpn-116-89.rdu2.redhat.com
 [10.10.116.89])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id B213D60BF1;
 Thu, 11 Feb 2021 22:01:54 +0000 (UTC)
From: Cleber Rosa <crosa@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 2/6] Python: expose QEMUMachine's temporary directory
Date: Thu, 11 Feb 2021 17:01:42 -0500
Message-Id: <20210211220146.2525771-3-crosa@redhat.com>
In-Reply-To: <20210211220146.2525771-1-crosa@redhat.com>
References: <20210211220146.2525771-1-crosa@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=crosa@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=crosa@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.569,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, qemu-block@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Max Reitz <mreitz@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Willian Rampazzo <wrampazz@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 John Snow <jsnow@redhat.com>, Beraldo Leal <bleal@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Each instance of qemu.machine.QEMUMachine currently has a "test
directory", which may not have any relation to a "test", and it's
really a temporary directory.

Users instantiating the QEMUMachine class will be able to set the
location of the directory that will *contain* the QEMUMachine unique
temporary directory, so that parameter name has been changed from
test_dir to base_temp_dir.

A property has been added to allow users to access it without using
private attributes, and with that, the directory is created on first
use of the property.

Signed-off-by: Cleber Rosa <crosa@redhat.com>
---
 python/qemu/machine.py         | 24 ++++++++++++++++--------
 python/qemu/qtest.py           |  6 +++---
 tests/acceptance/virtio-gpu.py |  2 +-
 tests/qemu-iotests/iotests.py  |  2 +-
 4 files changed, 21 insertions(+), 13 deletions(-)

diff --git a/python/qemu/machine.py b/python/qemu/machine.py
index 6e44bda337..b379fcbe72 100644
--- a/python/qemu/machine.py
+++ b/python/qemu/machine.py
@@ -84,7 +84,7 @@ class QEMUMachine:
                  args: Sequence[str] = (),
                  wrapper: Sequence[str] = (),
                  name: Optional[str] = None,
-                 test_dir: str = "/var/tmp",
+                 base_temp_dir: str = "/var/tmp",
                  monitor_address: Optional[SocketAddrT] = None,
                  socket_scm_helper: Optional[str] = None,
                  sock_dir: Optional[str] = None,
@@ -97,10 +97,10 @@ class QEMUMachine:
         @param args: list of extra arguments
         @param wrapper: list of arguments used as prefix to qemu binary
         @param name: prefix for socket and log file names (default: qemu-PID)
-        @param test_dir: where to create socket and log file
+        @param base_temp_dir: default location where temporary files are created
         @param monitor_address: address for QMP monitor
         @param socket_scm_helper: helper program, required for send_fd_scm()
-        @param sock_dir: where to create socket (overrides test_dir for sock)
+        @param sock_dir: where to create socket (defaults to base_temp_dir)
         @param drain_console: (optional) True to drain console socket to buffer
         @param console_log: (optional) path to console log file
         @note: Qemu process is not started until launch() is used.
@@ -112,8 +112,8 @@ class QEMUMachine:
         self._wrapper = wrapper
 
         self._name = name or "qemu-%d" % os.getpid()
-        self._test_dir = test_dir
-        self._sock_dir = sock_dir or self._test_dir
+        self._base_temp_dir = base_temp_dir
+        self._sock_dir = sock_dir or self._base_temp_dir
         self._socket_scm_helper = socket_scm_helper
 
         if monitor_address is not None:
@@ -303,9 +303,7 @@ class QEMUMachine:
         return args
 
     def _pre_launch(self) -> None:
-        self._temp_dir = tempfile.mkdtemp(prefix="qemu-machine-",
-                                          dir=self._test_dir)
-        self._qemu_log_path = os.path.join(self._temp_dir, self._name + ".log")
+        self._qemu_log_path = os.path.join(self.temp_dir, self._name + ".log")
         self._qemu_log_file = open(self._qemu_log_path, 'wb')
 
         if self._console_set:
@@ -744,3 +742,13 @@ class QEMUMachine:
                 file=self._console_log_path,
                 drain=self._drain_console)
         return self._console_socket
+
+    @property
+    def temp_dir(self) -> str:
+        """
+        Returns a temporary directory to be used for this machine
+        """
+        if self._temp_dir is None:
+            self._temp_dir = tempfile.mkdtemp(prefix="qemu-machine-",
+                                              dir=self._base_temp_dir)
+        return self._temp_dir
diff --git a/python/qemu/qtest.py b/python/qemu/qtest.py
index 39a0cf62fe..78b97d13cf 100644
--- a/python/qemu/qtest.py
+++ b/python/qemu/qtest.py
@@ -112,14 +112,14 @@ class QEMUQtestMachine(QEMUMachine):
                  binary: str,
                  args: Sequence[str] = (),
                  name: Optional[str] = None,
-                 test_dir: str = "/var/tmp",
+                 base_temp_dir: str = "/var/tmp",
                  socket_scm_helper: Optional[str] = None,
                  sock_dir: Optional[str] = None):
         if name is None:
             name = "qemu-%d" % os.getpid()
         if sock_dir is None:
-            sock_dir = test_dir
-        super().__init__(binary, args, name=name, test_dir=test_dir,
+            sock_dir = base_temp_dir
+        super().__init__(binary, args, name=name, base_temp_dir=base_temp_dir,
                          socket_scm_helper=socket_scm_helper,
                          sock_dir=sock_dir)
         self._qtest: Optional[QEMUQtestProtocol] = None
diff --git a/tests/acceptance/virtio-gpu.py b/tests/acceptance/virtio-gpu.py
index 211f02932f..8d689eb820 100644
--- a/tests/acceptance/virtio-gpu.py
+++ b/tests/acceptance/virtio-gpu.py
@@ -119,7 +119,7 @@ class VirtioGPUx86(Test):
         os.set_inheritable(vug_sock.fileno(), True)
 
         self._vug_log_path = os.path.join(
-            self.vm._test_dir, "vhost-user-gpu.log"
+            self.vm.temp_dir, "vhost-user-gpu.log"
         )
         self._vug_log_file = open(self._vug_log_path, "wb")
         print(self._vug_log_path)
diff --git a/tests/qemu-iotests/iotests.py b/tests/qemu-iotests/iotests.py
index 00be68eca3..b02a3dc092 100644
--- a/tests/qemu-iotests/iotests.py
+++ b/tests/qemu-iotests/iotests.py
@@ -562,7 +562,7 @@ class VM(qtest.QEMUQtestMachine):
     def __init__(self, path_suffix=''):
         name = "qemu%s-%d" % (path_suffix, os.getpid())
         super().__init__(qemu_prog, qemu_opts, name=name,
-                         test_dir=test_dir,
+                         base_temp_dir=test_dir,
                          socket_scm_helper=socket_scm_helper,
                          sock_dir=sock_dir)
         self._num_drives = 0
-- 
2.25.4


