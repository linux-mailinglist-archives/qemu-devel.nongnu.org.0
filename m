Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E3CB11E7663
	for <lists+qemu-devel@lfdr.de>; Fri, 29 May 2020 09:10:39 +0200 (CEST)
Received: from localhost ([::1]:50146 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jeZA6-0005bI-WC
	for lists+qemu-devel@lfdr.de; Fri, 29 May 2020 03:10:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40946)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Pavel.Dovgaluk@gmail.com>)
 id 1jeZ5D-0004z6-4H
 for qemu-devel@nongnu.org; Fri, 29 May 2020 03:05:35 -0400
Received: from mail.ispras.ru ([83.149.199.45]:33410)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <Pavel.Dovgaluk@gmail.com>) id 1jeZ5B-0001Ve-BA
 for qemu-devel@nongnu.org; Fri, 29 May 2020 03:05:34 -0400
Received: from [127.0.1.1] (unknown [62.118.151.149])
 by mail.ispras.ru (Postfix) with ESMTPSA id 35540CD461;
 Fri, 29 May 2020 10:05:32 +0300 (MSK)
Subject: [PATCH v3 10/11] tests/acceptance: refactor boot_linux to allow
 code reuse
From: Pavel Dovgalyuk <Pavel.Dovgaluk@gmail.com>
To: qemu-devel@nongnu.org
Date: Fri, 29 May 2020 10:05:31 +0300
Message-ID: <159073593167.20809.17582679291556188984.stgit@pasha-ThinkPad-X280>
In-Reply-To: <159073587336.20809.5404476664125786279.stgit@pasha-ThinkPad-X280>
References: <159073587336.20809.5404476664125786279.stgit@pasha-ThinkPad-X280>
User-Agent: StGit/0.17.1-dirty
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Received-SPF: softfail client-ip=83.149.199.45;
 envelope-from=Pavel.Dovgaluk@gmail.com; helo=mail.ispras.ru
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/05/29 01:56:22
X-ACL-Warn: Detected OS   = Linux 3.11 and newer
X-Spam_score_int: 17
X-Spam_score: 1.7
X-Spam_bar: +
X-Spam_report: (1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_ADSP_CUSTOM_MED=0.001,
 FORGED_GMAIL_RCVD=1, FREEMAIL_FROM=0.001, FROM_WORDY=1,
 NML_ADSP_CUSTOM_MED=0.9, SPF_SOFTFAIL=0.665, T_FILL_THIS_FORM_SHORT=0.01,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
Cc: wrampazz@redhat.com, alex.bennee@linaro.org, dovgaluk@ispras.ru,
 pavel.dovgaluk@ispras.ru, crosa@redhat.com, pbonzini@redhat.com,
 philmd@redhat.com, ehabkost@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This patch moves image downloading functions to the separate class to allow
reusing them from record/replay tests.

Signed-off-by: Pavel Dovgalyuk <Pavel.Dovgaluk@ispras.ru>
---
 0 files changed

diff --git a/tests/acceptance/boot_linux.py b/tests/acceptance/boot_linux.py
index 075a386300..3aa57e88b0 100644
--- a/tests/acceptance/boot_linux.py
+++ b/tests/acceptance/boot_linux.py
@@ -26,22 +26,8 @@ KVM_NOT_AVAILABLE = ACCEL_NOT_AVAILABLE_FMT % "KVM"
 TCG_NOT_AVAILABLE = ACCEL_NOT_AVAILABLE_FMT % "TCG"
 
 
-class BootLinux(Test):
-    """
-    Boots a Linux system, checking for a successful initialization
-    """
-
-    timeout = 900
-    chksum = None
-
-    def setUp(self):
-        super(BootLinux, self).setUp()
-        self.vm.add_args('-smp', '2')
-        self.vm.add_args('-m', '1024')
-        self.prepare_boot()
-        self.prepare_cloudinit()
-
-    def prepare_boot(self):
+class BootLinuxBase(Test):
+    def download_boot(self):
         self.log.debug('Looking for and selecting a qemu-img binary to be '
                        'used to create the bootable snapshot image')
         # If qemu-img has been built, use it, otherwise the system wide one
@@ -60,17 +46,17 @@ class BootLinux(Test):
         if image_arch == 'ppc64':
             image_arch = 'ppc64le'
         try:
-            self.boot = vmimage.get(
+            boot = vmimage.get(
                 'fedora', arch=image_arch, version='31',
                 checksum=self.chksum,
                 algorithm='sha256',
                 cache_dir=self.cache_dirs[0],
                 snapshot_dir=self.workdir)
-            self.vm.add_args('-drive', 'file=%s' % self.boot.path)
         except:
             self.cancel('Failed to download/prepare boot image')
+        return boot.path
 
-    def prepare_cloudinit(self):
+    def download_cloudinit(self):
         self.log.info('Preparing cloudinit image')
         try:
             cloudinit_iso = os.path.join(self.workdir, 'cloudinit.iso')
@@ -81,9 +67,32 @@ class BootLinux(Test):
                           # QEMU's hard coded usermode router address
                           phone_home_host='10.0.2.2',
                           phone_home_port=self.phone_home_port)
-            self.vm.add_args('-drive', 'file=%s,format=raw' % cloudinit_iso)
         except Exception:
             self.cancel('Failed to prepared cloudinit image')
+        return cloudinit_iso
+
+class BootLinux(BootLinuxBase):
+    """
+    Boots a Linux system, checking for a successful initialization
+    """
+
+    timeout = 900
+    chksum = None
+
+    def setUp(self):
+        super(BootLinux, self).setUp()
+        self.vm.add_args('-smp', '2')
+        self.vm.add_args('-m', '1024')
+        self.prepare_boot()
+        self.prepare_cloudinit()
+
+    def prepare_boot(self):
+        path = self.download_boot()
+        self.vm.add_args('-drive', 'file=%s' % path)
+
+    def prepare_cloudinit(self):
+        cloudinit_iso = self.download_cloudinit()
+        self.vm.add_args('-drive', 'file=%s,format=raw' % cloudinit_iso)
 
     def launch_and_wait(self):
         self.vm.set_console()


