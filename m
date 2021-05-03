Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 532A5372362
	for <lists+qemu-devel@lfdr.de>; Tue,  4 May 2021 01:05:15 +0200 (CEST)
Received: from localhost ([::1]:33738 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ldhcn-0007av-Ri
	for lists+qemu-devel@lfdr.de; Mon, 03 May 2021 19:05:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57612)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wainersm@redhat.com>)
 id 1ldhI8-0002HF-BF
 for qemu-devel@nongnu.org; Mon, 03 May 2021 18:43:52 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:23302)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wainersm@redhat.com>)
 id 1ldhI6-0007EK-HB
 for qemu-devel@nongnu.org; Mon, 03 May 2021 18:43:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620081829;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+C14LeSAWSNkxm/A+5bC2ZEsXaXapDFhzDpcd9j4pfw=;
 b=HsW1tL1VmwVHS0k8/4cOaKu4REjhZY2oJDjAw3/aVJ3Cm6DAE2BxEg9drklBcsKpc4g2z/
 jciRjqPR7QrOLckPb/wHui2qiqdKn6ToP3X7EbhTJchM8wUCtVnK2ZHQdYO7QnO9kZtH1q
 K4RnWaNp1aWMBGRt/5RQvcYmBFm6fP8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-387-ARz_xlIpNjyeRVnb5Xmm-w-1; Mon, 03 May 2021 18:43:47 -0400
X-MC-Unique: ARz_xlIpNjyeRVnb5Xmm-w-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0E2D51922035
 for <qemu-devel@nongnu.org>; Mon,  3 May 2021 22:43:46 +0000 (UTC)
Received: from wainer-laptop.localdomain.com (ovpn-116-131.gru2.redhat.com
 [10.97.116.131])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 680D460C5C;
 Mon,  3 May 2021 22:43:42 +0000 (UTC)
From: Wainer dos Santos Moschetta <wainersm@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 2/7] tests/acceptance: Move exec_command to ConsoleMixIn
Date: Mon,  3 May 2021 19:43:21 -0300
Message-Id: <20210503224326.206208-3-wainersm@redhat.com>
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
Received-SPF: pass client-ip=216.205.24.124; envelope-from=wainersm@redhat.com;
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

This moved exec_command() to ConsoleMixIn class.

Only the multiprocess.py file were touched by that change, so its tests
were adapted.

Signed-off-by: Wainer dos Santos Moschetta <wainersm@redhat.com>
---
 tests/acceptance/avocado_qemu/__init__.py | 22 ++++++++++------------
 tests/acceptance/multiprocess.py          |  6 +++---
 2 files changed, 13 insertions(+), 15 deletions(-)

diff --git a/tests/acceptance/avocado_qemu/__init__.py b/tests/acceptance/avocado_qemu/__init__.py
index 6f4e0edfa3..4d3b869765 100644
--- a/tests/acceptance/avocado_qemu/__init__.py
+++ b/tests/acceptance/avocado_qemu/__init__.py
@@ -114,18 +114,6 @@ def wait_for_console_pattern(test, success_message, failure_message=None,
     """
     _console_interaction(test, success_message, failure_message, None, vm=vm)
 
-def exec_command(test, command):
-    """
-    Send a command to a console (appending CRLF characters), while logging
-    the content.
-
-    :param test: an Avocado test containing a VM.
-    :type test: :class:`avocado_qemu.Test`
-    :param command: the command to send
-    :type command: str
-    """
-    _console_interaction(test, None, None, command + '\r')
-
 def exec_command_and_wait_for_pattern(test, command,
                                       success_message, failure_message=None):
     """
@@ -145,6 +133,16 @@ def exec_command_and_wait_for_pattern(test, command,
 class ConsoleMixIn():
     """Contains utilities for interacting with a guest via Console."""
 
+    def exec_command(self, command):
+        """
+        Send a command to a console (appending CRLF characters), while logging
+        the content.
+
+        :param command: the command to send
+        :type command: str
+        """
+        _console_interaction(self, None, None, command + '\r')
+
     def interrupt_interactive_console_until_pattern(self, success_message,
                                                     failure_message=None,
                                                     interrupt_string='\r'):
diff --git a/tests/acceptance/multiprocess.py b/tests/acceptance/multiprocess.py
index 96627f022a..41d3e51164 100644
--- a/tests/acceptance/multiprocess.py
+++ b/tests/acceptance/multiprocess.py
@@ -9,10 +9,10 @@
 
 from avocado_qemu import Test
 from avocado_qemu import wait_for_console_pattern
-from avocado_qemu import exec_command
+from avocado_qemu import ConsoleMixIn
 from avocado_qemu import exec_command_and_wait_for_pattern
 
-class Multiprocess(Test):
+class Multiprocess(Test, ConsoleMixIn):
     """
     :avocado: tags=multiprocess
     """
@@ -59,7 +59,7 @@ def do_test(self, kernel_url, initrd_url, kernel_command_line,
         self.vm.launch()
         wait_for_console_pattern(self, 'as init process',
                                  'Kernel panic - not syncing')
-        exec_command(self, 'mount -t sysfs sysfs /sys')
+        self.exec_command('mount -t sysfs sysfs /sys')
         exec_command_and_wait_for_pattern(self,
                                           'cat /sys/bus/pci/devices/*/uevent',
                                           'PCI_ID=1000:0012')
-- 
2.29.2


