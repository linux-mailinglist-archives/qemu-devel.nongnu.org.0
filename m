Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AC6B393B73
	for <lists+qemu-devel@lfdr.de>; Fri, 28 May 2021 04:34:25 +0200 (CEST)
Received: from localhost ([::1]:44678 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lmSKN-0000vF-JO
	for lists+qemu-devel@lfdr.de; Thu, 27 May 2021 22:34:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42690)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lmSIh-00073U-5x
 for qemu-devel@nongnu.org; Thu, 27 May 2021 22:32:39 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:35813)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lmSIe-0007cy-85
 for qemu-devel@nongnu.org; Thu, 27 May 2021 22:32:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1622169155;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=UCXljFF+ZQxxAEdW79oIUdam8EHAz4dS9irWjp++wU0=;
 b=ggowTvxM+JA0QTwPR62RvXOwwfWDjvK7jp81FOKVmWDSuYaQ8HmJgH/gsRppWu0wHuRIf7
 0sT2xfAkSZojkUC2Yg3a/hLC+ocRK13DM7PclEDsj3HYqWcVf3ibJ0/iUkFxDBTAXNiz3e
 TpoB0ZHPFSvBg9OVWkCGgqD09eBX+Jk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-218-yAUHKKYUPCSNjCD__5QmpA-1; Thu, 27 May 2021 22:32:33 -0400
X-MC-Unique: yAUHKKYUPCSNjCD__5QmpA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C9AFF501E0;
 Fri, 28 May 2021 02:32:31 +0000 (UTC)
Received: from scv.redhat.com (ovpn-116-137.rdu2.redhat.com [10.10.116.137])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 232221F0C0;
 Fri, 28 May 2021 02:32:30 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 01/44] Python: expose QEMUMachine's temporary directory
Date: Thu, 27 May 2021 22:31:37 -0400
Message-Id: <20210528023220.417057-2-jsnow@redhat.com>
In-Reply-To: <20210528023220.417057-1-jsnow@redhat.com>
References: <20210528023220.417057-1-jsnow@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.374,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 Thomas Huth <thuth@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 qemu-block@nongnu.org, =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Max Reitz <mreitz@redhat.com>, Willian Rampazzo <willianr@redhat.com>,
 Cleber Rosa <crosa@redhat.com>, John Snow <jsnow@redhat.com>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Cleber Rosa <crosa@redhat.com>

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
Message-Id: <20210211220146.2525771-3-crosa@redhat.com>
Reviewed-by: Wainer dos Santos Moschetta <wainersm@redhat.com>
Signed-off-by: Cleber Rosa <crosa@redhat.com>
Signed-off-by: John Snow <jsnow@redhat.com>
---
 python/qemu/machine.py        | 24 ++++++++++++++++--------
 python/qemu/qtest.py          |  6 +++---
 tests/qemu-iotests/iotests.py |  2 +-
 3 files changed, 20 insertions(+), 12 deletions(-)

diff --git a/python/qemu/machine.py b/python/qemu/machine.py
index 6e44bda337e..b379fcbe726 100644
--- a/python/qemu/machine.py
+++ b/python/qemu/machine.py
@@ -84,7 +84,7 @@ def __init__(self,
                  args: Sequence[str] = (),
                  wrapper: Sequence[str] = (),
                  name: Optional[str] = None,
-                 test_dir: str = "/var/tmp",
+                 base_temp_dir: str = "/var/tmp",
                  monitor_address: Optional[SocketAddrT] = None,
                  socket_scm_helper: Optional[str] = None,
                  sock_dir: Optional[str] = None,
@@ -97,10 +97,10 @@ def __init__(self,
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
@@ -112,8 +112,8 @@ def __init__(self,
         self._wrapper = wrapper
 
         self._name = name or "qemu-%d" % os.getpid()
-        self._test_dir = test_dir
-        self._sock_dir = sock_dir or self._test_dir
+        self._base_temp_dir = base_temp_dir
+        self._sock_dir = sock_dir or self._base_temp_dir
         self._socket_scm_helper = socket_scm_helper
 
         if monitor_address is not None:
@@ -303,9 +303,7 @@ def _base_args(self) -> List[str]:
         return args
 
     def _pre_launch(self) -> None:
-        self._temp_dir = tempfile.mkdtemp(prefix="qemu-machine-",
-                                          dir=self._test_dir)
-        self._qemu_log_path = os.path.join(self._temp_dir, self._name + ".log")
+        self._qemu_log_path = os.path.join(self.temp_dir, self._name + ".log")
         self._qemu_log_file = open(self._qemu_log_path, 'wb')
 
         if self._console_set:
@@ -744,3 +742,13 @@ def console_socket(self) -> socket.socket:
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
index 39a0cf62fe9..78b97d13cf0 100644
--- a/python/qemu/qtest.py
+++ b/python/qemu/qtest.py
@@ -112,14 +112,14 @@ def __init__(self,
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
diff --git a/tests/qemu-iotests/iotests.py b/tests/qemu-iotests/iotests.py
index 777fa2ec0e8..92681907ed9 100644
--- a/tests/qemu-iotests/iotests.py
+++ b/tests/qemu-iotests/iotests.py
@@ -571,7 +571,7 @@ class VM(qtest.QEMUQtestMachine):
     def __init__(self, path_suffix=''):
         name = "qemu%s-%d" % (path_suffix, os.getpid())
         super().__init__(qemu_prog, qemu_opts, name=name,
-                         test_dir=test_dir,
+                         base_temp_dir=test_dir,
                          socket_scm_helper=socket_scm_helper,
                          sock_dir=sock_dir)
         self._num_drives = 0
-- 
2.31.1


