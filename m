Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 840E3372380
	for <lists+qemu-devel@lfdr.de>; Tue,  4 May 2021 01:18:08 +0200 (CEST)
Received: from localhost ([::1]:55850 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ldhpH-0000FF-JR
	for lists+qemu-devel@lfdr.de; Mon, 03 May 2021 19:18:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57586)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wainersm@redhat.com>)
 id 1ldhI3-00026B-IT
 for qemu-devel@nongnu.org; Mon, 03 May 2021 18:43:47 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:37344)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wainersm@redhat.com>)
 id 1ldhI1-0007Bc-Mq
 for qemu-devel@nongnu.org; Mon, 03 May 2021 18:43:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620081825;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=sVGGxRmryoN3O41NzZEQDV26ZA/0SnU3HZG5IX6YOAw=;
 b=VnXWH/W7824sw3E2Z6KHh/nIe7PhY5SV/Fo2DJoOgmIHc8IcDqG1g13ebzSXjYiM+q1Wq6
 PXPrXnlgb5DaySLNm13qjfqpqsEPMYbK4xUxlzhWmAFlV5ctOG7SAMIOlurdzEyYDSLe8G
 UzyXfqnf6j1x893tBWS2yB94Lz5D2nI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-428-_L65d9xoMdSvrQeeH_OJKA-1; Mon, 03 May 2021 18:43:43 -0400
X-MC-Unique: _L65d9xoMdSvrQeeH_OJKA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6859F801106
 for <qemu-devel@nongnu.org>; Mon,  3 May 2021 22:43:42 +0000 (UTC)
Received: from wainer-laptop.localdomain.com (ovpn-116-131.gru2.redhat.com
 [10.97.116.131])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B15D660937;
 Mon,  3 May 2021 22:43:38 +0000 (UTC)
From: Wainer dos Santos Moschetta <wainersm@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 1/7] tests/acceptance: Introduce the ConsoleMixIn class
Date: Mon,  3 May 2021 19:43:20 -0300
Message-Id: <20210503224326.206208-2-wainersm@redhat.com>
In-Reply-To: <20210503224326.206208-1-wainersm@redhat.com>
References: <20210503224326.206208-1-wainersm@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=wainersm@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=wainersm@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.698,
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
Cc: willianr@redhat.com, philmd@redhat.com, crosa@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This created the ConsoleMixIn class to wrap the methods related with console
interaction with the guest that currently are loose in the avocado_qemu
package. It should be used as a mixin on the test classes.

At this point only the interrupt_interactive_console_until_pattern() was moved
to ConsoleMixIn. This method is only used in boot_linux_console.py tests, so
there was needed to adapt them.

Signed-off-by: Wainer dos Santos Moschetta <wainersm@redhat.com>
---
 tests/acceptance/avocado_qemu/__init__.py | 52 +++++++++++------------
 tests/acceptance/boot_linux_console.py    | 10 ++---
 2 files changed, 31 insertions(+), 31 deletions(-)

diff --git a/tests/acceptance/avocado_qemu/__init__.py b/tests/acceptance/avocado_qemu/__init__.py
index 83b1741ec8..6f4e0edfa3 100644
--- a/tests/acceptance/avocado_qemu/__init__.py
+++ b/tests/acceptance/avocado_qemu/__init__.py
@@ -101,32 +101,6 @@ def _console_interaction(test, success_message, failure_message,
                     (failure_message, success_message)
             test.fail(fail)
 
-def interrupt_interactive_console_until_pattern(test, success_message,
-                                                failure_message=None,
-                                                interrupt_string='\r'):
-    """
-    Keep sending a string to interrupt a console prompt, while logging the
-    console output. Typical use case is to break a boot loader prompt, such:
-
-        Press a key within 5 seconds to interrupt boot process.
-        5
-        4
-        3
-        2
-        1
-        Booting default image...
-
-    :param test: an Avocado test containing a VM that will have its console
-                 read and probed for a success or failure message
-    :type test: :class:`avocado_qemu.Test`
-    :param success_message: if this message appears, test succeeds
-    :param failure_message: if this message appears, test fails
-    :param interrupt_string: a string to send to the console before trying
-                             to read a new line
-    """
-    _console_interaction(test, success_message, failure_message,
-                         interrupt_string, True)
-
 def wait_for_console_pattern(test, success_message, failure_message=None,
                              vm=None):
     """
@@ -168,6 +142,32 @@ def exec_command_and_wait_for_pattern(test, command,
     """
     _console_interaction(test, success_message, failure_message, command + '\r')
 
+class ConsoleMixIn():
+    """Contains utilities for interacting with a guest via Console."""
+
+    def interrupt_interactive_console_until_pattern(self, success_message,
+                                                    failure_message=None,
+                                                    interrupt_string='\r'):
+        """
+        Keep sending a string to interrupt a console prompt, while logging the
+        console output. Typical use case is to break a boot loader prompt, such:
+
+            Press a key within 5 seconds to interrupt boot process.
+            5
+            4
+            3
+            2
+            1
+            Booting default image...
+
+        :param success_message: if this message appears, test succeeds
+        :param failure_message: if this message appears, test fails
+        :param interrupt_string: a string to send to the console before trying
+                                to read a new line
+        """
+        _console_interaction(self, success_message, failure_message,
+                         interrupt_string, True)
+
 class Test(avocado.Test):
     def _get_unique_tag_val(self, tag_name):
         """
diff --git a/tests/acceptance/boot_linux_console.py b/tests/acceptance/boot_linux_console.py
index 1ca32ecf25..10317b232b 100644
--- a/tests/acceptance/boot_linux_console.py
+++ b/tests/acceptance/boot_linux_console.py
@@ -17,7 +17,7 @@
 from avocado import skipUnless
 from avocado_qemu import Test
 from avocado_qemu import exec_command_and_wait_for_pattern
-from avocado_qemu import interrupt_interactive_console_until_pattern
+from avocado_qemu import ConsoleMixIn
 from avocado_qemu import wait_for_console_pattern
 from avocado.utils import process
 from avocado.utils import archive
@@ -45,7 +45,7 @@ def image_pow2ceil_expand(path):
             with open(path, 'ab+') as fd:
                 fd.truncate(size_aligned)
 
-class LinuxKernelTest(Test):
+class LinuxKernelTest(Test, ConsoleMixIn):
     KERNEL_COMMON_COMMAND_LINE = 'printk.time=0 '
 
     def wait_for_console_pattern(self, success_message, vm=None):
@@ -626,8 +626,8 @@ def test_arm_quanta_gsj(self):
         self.wait_for_console_pattern('>Device: Poleg BMC NPCM730')
         self.wait_for_console_pattern('>Skip DDR init.')
         self.wait_for_console_pattern('U-Boot ')
-        interrupt_interactive_console_until_pattern(
-                self, 'Hit any key to stop autoboot:', 'U-Boot>')
+        self.interrupt_interactive_console_until_pattern(
+                'Hit any key to stop autoboot:', 'U-Boot>')
         exec_command_and_wait_for_pattern(
                 self, "setenv bootargs ${bootargs} " + kernel_command_line,
                 'U-Boot>')
@@ -879,7 +879,7 @@ def test_arm_orangepi_uboot_netbsd9(self):
                          '-no-reboot')
         self.vm.launch()
         wait_for_console_pattern(self, 'U-Boot 2020.01+dfsg-1')
-        interrupt_interactive_console_until_pattern(self,
+        self.interrupt_interactive_console_until_pattern(
                                        'Hit any key to stop autoboot:',
                                        'switch to partitions #0, OK')
 
-- 
2.29.2


