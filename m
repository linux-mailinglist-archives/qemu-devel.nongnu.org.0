Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F1B9221AE65
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Jul 2020 07:13:05 +0200 (CEST)
Received: from localhost ([::1]:51412 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jtlLN-0001uR-2b
	for lists+qemu-devel@lfdr.de; Fri, 10 Jul 2020 01:13:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47842)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1jtlFi-0000Ja-Gw
 for qemu-devel@nongnu.org; Fri, 10 Jul 2020 01:07:14 -0400
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:46776
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1jtlFg-0006XI-Un
 for qemu-devel@nongnu.org; Fri, 10 Jul 2020 01:07:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1594357632;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7RSC9dk+Bze1qWcHsXFC05yc+15D4zpv7aFC+x/Cbow=;
 b=V4IuzbjnE9DENJv7IXdVqSXhB4AypmTNsTPjLmZ7W8DDsUfkU5r6JobwNAVEuodWtMtqPN
 EQNZCi/vhrJ8If9nhDvn8CRNyTtLq9PWjy5rTr8zYO5jNQj4BJ32dmIv8/TyL4YJFiAmid
 WPe07JbzlvO+cRXkrE6r8/bYOZqPs7Y=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-59-mhY2WKGyO5qI9eiUBK6PXw-1; Fri, 10 Jul 2020 01:07:09 -0400
X-MC-Unique: mhY2WKGyO5qI9eiUBK6PXw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 65293801E6A;
 Fri, 10 Jul 2020 05:07:08 +0000 (UTC)
Received: from probe.redhat.com (ovpn-118-196.rdu2.redhat.com [10.10.118.196])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2DF791010404;
 Fri, 10 Jul 2020 05:07:07 +0000 (UTC)
From: John Snow <jsnow@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 08/12] tests/acceptance: wait() instead of shutdown() where
 appropriate
Date: Fri, 10 Jul 2020 01:06:45 -0400
Message-Id: <20200710050649.32434-9-jsnow@redhat.com>
In-Reply-To: <20200710050649.32434-1-jsnow@redhat.com>
References: <20200710050649.32434-1-jsnow@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=207.211.31.81; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/07/09 23:35:58
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
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
Cc: kwolf@redhat.com, Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Eduardo Habkost <ehabkost@redhat.com>, John Snow <jsnow@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>,
 Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

When issuing 'reboot' to a VM with the no-reboot option, that VM will
exit. When then issuing a shutdown command, the cleanup may race.

Add calls to vm.wait() which will gracefully mark the VM as having
exited. Subsequent vm.shutdown() calls in generic tearDown code will not
race when called after completion of the call.

Signed-off-by: John Snow <jsnow@redhat.com>
---
 tests/acceptance/boot_linux_console.py   | 10 ++++++++++
 tests/acceptance/linux_ssh_mips_malta.py |  2 ++
 2 files changed, 12 insertions(+)

diff --git a/tests/acceptance/boot_linux_console.py b/tests/acceptance/boot_linux_console.py
index 3d02519660..5867ef760c 100644
--- a/tests/acceptance/boot_linux_console.py
+++ b/tests/acceptance/boot_linux_console.py
@@ -191,6 +191,8 @@ def test_mips_malta_cpio(self):
                                                 'Debian')
         exec_command_and_wait_for_pattern(self, 'reboot',
                                                 'reboot: Restarting system')
+        # Wait for VM to shut down gracefully
+        self.vm.wait()
 
     @skipUnless(os.getenv('AVOCADO_ALLOW_UNTRUSTED_CODE'), 'untrusted code')
     def test_mips64el_malta_5KEc_cpio(self):
@@ -231,6 +233,8 @@ def test_mips64el_malta_5KEc_cpio(self):
                                                 '3.19.3.mtoman.20150408')
         exec_command_and_wait_for_pattern(self, 'reboot',
                                                 'reboot: Restarting system')
+        # Wait for VM to shut down gracefully
+        self.vm.wait()
 
     def do_test_mips_malta32el_nanomips(self, kernel_url, kernel_hash):
         kernel_path_xz = self.fetch_asset(kernel_url, asset_hash=kernel_hash)
@@ -506,6 +510,7 @@ def test_arm_cubieboard_initrd(self):
                                                 'system-control@1c00000')
         exec_command_and_wait_for_pattern(self, 'reboot',
                                                 'reboot: Restarting system')
+        # NB: Do not issue vm.wait() here, cubieboard's reboot does not exit!
 
     def test_arm_cubieboard_sata(self):
         """
@@ -550,6 +555,7 @@ def test_arm_cubieboard_sata(self):
                                                 'sda')
         exec_command_and_wait_for_pattern(self, 'reboot',
                                                 'reboot: Restarting system')
+        # NB: Do not issue vm.wait() here, cubieboard's reboot does not exit!
 
     def test_arm_orangepi(self):
         """
@@ -615,6 +621,8 @@ def test_arm_orangepi_initrd(self):
                                                 'system-control@1c00000')
         exec_command_and_wait_for_pattern(self, 'reboot',
                                                 'reboot: Restarting system')
+        # Wait for VM to shut down gracefully
+        self.vm.wait()
 
     def test_arm_orangepi_sd(self):
         """
@@ -662,6 +670,8 @@ def test_arm_orangepi_sd(self):
             '3 packets transmitted, 3 packets received, 0% packet loss')
         exec_command_and_wait_for_pattern(self, 'reboot',
                                                 'reboot: Restarting system')
+        # Wait for VM to shut down gracefully
+        self.vm.wait()
 
     @skipUnless(os.getenv('AVOCADO_ALLOW_LARGE_STORAGE'), 'storage limited')
     @skipUnless(P7ZIP_AVAILABLE, '7z not installed')
diff --git a/tests/acceptance/linux_ssh_mips_malta.py b/tests/acceptance/linux_ssh_mips_malta.py
index 90d7f2f167..25c5c5f741 100644
--- a/tests/acceptance/linux_ssh_mips_malta.py
+++ b/tests/acceptance/linux_ssh_mips_malta.py
@@ -212,6 +212,8 @@ def check_mips_malta(self, uname_m, endianess):
 
         self.run_common_commands(wordsize)
         self.shutdown_via_ssh()
+        # Wait for VM to shut down gracefully
+        self.vm.wait()
 
     def test_mips_malta32eb_kernel3_2_0(self):
         """
-- 
2.21.3


