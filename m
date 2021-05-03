Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 04E86372390
	for <lists+qemu-devel@lfdr.de>; Tue,  4 May 2021 01:23:18 +0200 (CEST)
Received: from localhost ([::1]:34716 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ldhuH-0003Sg-0T
	for lists+qemu-devel@lfdr.de; Mon, 03 May 2021 19:23:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57764)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wainersm@redhat.com>)
 id 1ldhIY-0002d4-Dg
 for qemu-devel@nongnu.org; Mon, 03 May 2021 18:44:18 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:47976)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wainersm@redhat.com>)
 id 1ldhIU-0007O9-4L
 for qemu-devel@nongnu.org; Mon, 03 May 2021 18:44:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620081853;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=oWmBDj0X7pqBTNb7vLvWwbmx9NBQbuoI3GJsk/rhxT8=;
 b=RLgTV94KqtkpXTsqR35ZJoU/vsg+cM9sXNssalbdrsBdgyXdBTYl5WUU9hDiN6yHmf2dg3
 Ok9jdScliniGHEbtJrLNLXf0QzyuiZH0I85NqmGwI4nm1PtVYl+VBvK4yVJLSf/abrWqGS
 MDaXONrskDsHvTS0mTzJV3+PwZp3ieU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-474-RCOZiWqxOKeOGkL-mWRlPA-1; Mon, 03 May 2021 18:44:11 -0400
X-MC-Unique: RCOZiWqxOKeOGkL-mWRlPA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E88731804968
 for <qemu-devel@nongnu.org>; Mon,  3 May 2021 22:44:10 +0000 (UTC)
Received: from wainer-laptop.localdomain.com (ovpn-116-131.gru2.redhat.com
 [10.97.116.131])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 7ABC560937;
 Mon,  3 May 2021 22:44:07 +0000 (UTC)
From: Wainer dos Santos Moschetta <wainersm@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 7/7] tests/acceptance: Move _console_interaction to
 ConsoleMixIn
Date: Mon,  3 May 2021 19:43:26 -0300
Message-Id: <20210503224326.206208-8-wainersm@redhat.com>
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

This moved the last remaining _console_interaction() to ConsoleMixIn.

None tests call it directly, so only the other methods in ConsoleMixIn
needed to be adapted.

Signed-off-by: Wainer dos Santos Moschetta <wainersm@redhat.com>
---
 tests/acceptance/avocado_qemu/__init__.py | 57 +++++++++++------------
 1 file changed, 28 insertions(+), 29 deletions(-)

diff --git a/tests/acceptance/avocado_qemu/__init__.py b/tests/acceptance/avocado_qemu/__init__.py
index b21f9ea3ff..a6de3fe11a 100644
--- a/tests/acceptance/avocado_qemu/__init__.py
+++ b/tests/acceptance/avocado_qemu/__init__.py
@@ -76,34 +76,33 @@ def pick_default_qemu_bin(arch=None):
     if is_readable_executable_file(qemu_bin_from_bld_dir_path):
         return qemu_bin_from_bld_dir_path
 
-
-def _console_interaction(test, success_message, failure_message,
-                         send_string, keep_sending=False, vm=None):
-    assert not keep_sending or send_string
-    if vm is None:
-        vm = test.vm
-    console = vm.console_socket.makefile()
-    console_logger = logging.getLogger('console')
-    while True:
-        if send_string:
-            vm.console_socket.sendall(send_string.encode())
-            if not keep_sending:
-                send_string = None # send only once
-        msg = console.readline().strip()
-        if not msg:
-            continue
-        console_logger.debug(msg)
-        if success_message is None or success_message in msg:
-            break
-        if failure_message and failure_message in msg:
-            console.close()
-            fail = 'Failure message found in console: "%s". Expected: "%s"' % \
-                    (failure_message, success_message)
-            test.fail(fail)
-
 class ConsoleMixIn():
     """Contains utilities for interacting with a guest via Console."""
 
+    def _console_interaction(self, success_message, failure_message,
+                             send_string, keep_sending=False, vm=None):
+        assert not keep_sending or send_string
+        if vm is None:
+            vm = self.vm
+        console = vm.console_socket.makefile()
+        console_logger = logging.getLogger('console')
+        while True:
+            if send_string:
+                vm.console_socket.sendall(send_string.encode())
+                if not keep_sending:
+                    send_string = None # send only once
+            msg = console.readline().strip()
+            if not msg:
+                continue
+            console_logger.debug(msg)
+            if success_message is None or success_message in msg:
+                break
+            if failure_message and failure_message in msg:
+                console.close()
+                fail = 'Failure message found in console: "%s". Expected: "%s"' % \
+                        (failure_message, success_message)
+                self.fail(fail)
+
     def exec_command(self, command):
         """
         Send a command to a console (appending CRLF characters), while logging
@@ -112,7 +111,7 @@ def exec_command(self, command):
         :param command: the command to send
         :type command: str
         """
-        _console_interaction(self, None, None, command + '\r')
+        self._console_interaction(None, None, command + '\r')
 
     def exec_command_and_wait_for_pattern(self, command,
                                           success_message, failure_message=None):
@@ -125,7 +124,7 @@ def exec_command_and_wait_for_pattern(self, command,
         :param success_message: if this message appears, test succeeds
         :param failure_message: if this message appears, test fails
         """
-        _console_interaction(self, success_message, failure_message, command + '\r')
+        self._console_interaction(success_message, failure_message, command + '\r')
 
     def interrupt_interactive_console_until_pattern(self, success_message,
                                                     failure_message=None,
@@ -147,7 +146,7 @@ def interrupt_interactive_console_until_pattern(self, success_message,
         :param interrupt_string: a string to send to the console before trying
                                 to read a new line
         """
-        _console_interaction(self, success_message, failure_message,
+        self._console_interaction(success_message, failure_message,
                          interrupt_string, True)
 
     def wait_for_console_pattern(self, success_message, failure_message=None,
@@ -158,7 +157,7 @@ def wait_for_console_pattern(self, success_message, failure_message=None,
         :param success_message: if this message appears, test succeeds
         :param failure_message: if this message appears, test fails
         """
-        _console_interaction(self, success_message, failure_message, None, vm=vm)
+        self._console_interaction(success_message, failure_message, None, vm=vm)
 
 class Test(avocado.Test):
     def _get_unique_tag_val(self, tag_name):
-- 
2.29.2


