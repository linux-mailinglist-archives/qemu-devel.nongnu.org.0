Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D95683C78EE
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Jul 2021 23:23:36 +0200 (CEST)
Received: from localhost ([::1]:57954 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m3PsN-0004wZ-Tj
	for lists+qemu-devel@lfdr.de; Tue, 13 Jul 2021 17:23:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45018)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <crosa@redhat.com>) id 1m3Ppe-00013F-2V
 for qemu-devel@nongnu.org; Tue, 13 Jul 2021 17:20:47 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:26996)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <crosa@redhat.com>) id 1m3Ppb-000814-2k
 for qemu-devel@nongnu.org; Tue, 13 Jul 2021 17:20:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626211241;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=OS8v8CG+34mphZBpB0HybgdUv1BniMG/SDhz9sxy3DQ=;
 b=GFq6GFPaN1VpqQY59DwMqacYSZaC2x8N1QsBhxOVAEG+RYp3zQSdvw527ekDWVl0lXbc6T
 3xVRu8EFmC+URy3rCZ4tM4dYBp2rsip5yPemcn6zAliC/oDOVsl8Ei8jbbPfQP8gOmETAM
 vkJg4SpoyZ7D2IniB8UB7fNGXl8exIw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-151-_rGCbJSxO0GpXpu42Le2Tg-1; Tue, 13 Jul 2021 17:20:34 -0400
X-MC-Unique: _rGCbJSxO0GpXpu42Le2Tg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9CC431005E46;
 Tue, 13 Jul 2021 21:20:31 +0000 (UTC)
Received: from p50.localhost.net (ovpn-117-22.rdu2.redhat.com [10.10.117.22])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id A5A9119C44;
 Tue, 13 Jul 2021 21:20:18 +0000 (UTC)
From: Cleber Rosa <crosa@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>,
	qemu-devel@nongnu.org
Subject: [PULL 03/23] Acceptance Tests: distinguish between temp and logs dir
Date: Tue, 13 Jul 2021 17:19:03 -0400
Message-Id: <20210713211923.3809241-4-crosa@redhat.com>
In-Reply-To: <20210713211923.3809241-1-crosa@redhat.com>
References: <20210713211923.3809241-1-crosa@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=crosa@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=crosa@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Thomas Huth <thuth@redhat.com>, Willian Rampazzo <wrampazz@redhat.com>,
 John Snow <jsnow@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Willian Rampazzo <willianr@redhat.com>, Kamil Rytarowski <kamil@netbsd.org>,
 Reinoud Zandijk <reinoud@netbsd.org>,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Greg Kurz <groug@kaod.org>,
 Eric Auger <eric.auger@redhat.com>, qemu-arm@nongnu.org,
 Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>, Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 David Gibson <david@gibson.dropbear.id.au>, Beraldo Leal <bleal@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 qemu-ppc@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 Ryo ONODERA <ryoon@netbsd.org>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Logs can be very important to debug issues, and currently QEMUMachine
instances will remove logs that are created under the temporary
directories.

With this change, the stdout and stderr generated by the QEMU process
started by QEMUMachine will always be kept along the test results
directory.

Signed-off-by: Cleber Rosa <crosa@redhat.com>
Message-Id: <20210211220146.2525771-6-crosa@redhat.com>
Reviewed-by: Wainer dos Santos Moschetta <wainersm@redhat.com>
Signed-off-by: Cleber Rosa <crosa@redhat.com>
---
 python/qemu/machine/machine.py            | 17 ++++++++++++++---
 tests/acceptance/avocado_qemu/__init__.py |  3 ++-
 2 files changed, 16 insertions(+), 4 deletions(-)

diff --git a/python/qemu/machine/machine.py b/python/qemu/machine/machine.py
index d47ab3d896..94846dd71b 100644
--- a/python/qemu/machine/machine.py
+++ b/python/qemu/machine/machine.py
@@ -96,7 +96,8 @@ def __init__(self,
                  socket_scm_helper: Optional[str] = None,
                  sock_dir: Optional[str] = None,
                  drain_console: bool = False,
-                 console_log: Optional[str] = None):
+                 console_log: Optional[str] = None,
+                 log_dir: Optional[str] = None):
         '''
         Initialize a QEMUMachine
 
@@ -110,6 +111,7 @@ def __init__(self,
         @param sock_dir: where to create socket (defaults to base_temp_dir)
         @param drain_console: (optional) True to drain console socket to buffer
         @param console_log: (optional) path to console log file
+        @param log_dir: where to create and keep log files
         @note: Qemu process is not started until launch() is used.
         '''
         # pylint: disable=too-many-arguments
@@ -123,6 +125,7 @@ def __init__(self,
         self._name = name or "qemu-%d" % os.getpid()
         self._base_temp_dir = base_temp_dir
         self._sock_dir = sock_dir or self._base_temp_dir
+        self._log_dir = log_dir
         self._socket_scm_helper = socket_scm_helper
 
         if monitor_address is not None:
@@ -314,8 +317,6 @@ def _base_args(self) -> List[str]:
         return args
 
     def _pre_launch(self) -> None:
-        self._qemu_log_path = os.path.join(self.temp_dir, self._name + ".log")
-
         if self._console_set:
             self._remove_files.append(self._console_address)
 
@@ -332,6 +333,7 @@ def _pre_launch(self) -> None:
         # NOTE: Make sure any opened resources are *definitely* freed in
         # _post_shutdown()!
         # pylint: disable=consider-using-with
+        self._qemu_log_path = os.path.join(self.log_dir, self._name + ".log")
         self._qemu_log_file = open(self._qemu_log_path, 'wb')
 
     def _post_launch(self) -> None:
@@ -770,3 +772,12 @@ def temp_dir(self) -> str:
             self._temp_dir = tempfile.mkdtemp(prefix="qemu-machine-",
                                               dir=self._base_temp_dir)
         return self._temp_dir
+
+    @property
+    def log_dir(self) -> str:
+        """
+        Returns a directory to be used for writing logs
+        """
+        if self._log_dir is None:
+            return self.temp_dir
+        return self._log_dir
diff --git a/tests/acceptance/avocado_qemu/__init__.py b/tests/acceptance/avocado_qemu/__init__.py
index 4ce09de4fa..420c00f1a9 100644
--- a/tests/acceptance/avocado_qemu/__init__.py
+++ b/tests/acceptance/avocado_qemu/__init__.py
@@ -222,9 +222,10 @@ def setUp(self):
     def _new_vm(self, name, *args):
         self._sd = tempfile.TemporaryDirectory(prefix="avo_qemu_sock_")
         vm = QEMUMachine(self.qemu_bin, base_temp_dir=self.workdir,
-                         sock_dir=self._sd.name)
+                         sock_dir=self._sd.name, log_dir=self.logdir)
         self.log.debug('QEMUMachine "%s" created', name)
         self.log.debug('QEMUMachine "%s" temp_dir: %s', name, vm.temp_dir)
+        self.log.debug('QEMUMachine "%s" log_dir: %s', name, vm.log_dir)
         if args:
             vm.add_args(*args)
         return vm
-- 
2.31.1


