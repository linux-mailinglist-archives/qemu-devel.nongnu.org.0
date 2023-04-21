Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CBB46EA8CD
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Apr 2023 13:05:20 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ppoYg-0002ge-F6; Fri, 21 Apr 2023 07:04:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1ppoYe-0002gO-7D
 for qemu-devel@nongnu.org; Fri, 21 Apr 2023 07:04:04 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1ppoYV-0002Gk-8W
 for qemu-devel@nongnu.org; Fri, 21 Apr 2023 07:04:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1682075034;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=hi/oUGaXMoV06BL3wZJ1BxUnFn7Ff8nVmyxC46JJHdE=;
 b=EP2LxUH9tAHPS7rQjXwD4Y4/kLWoabllbRw7FJv2evs9qcro4XMx3Zf23OwD0KbqwsQXEo
 SPEifLKvs50Xt6RInk738YC+dfw4nbpmipsPucMi8csy0BqtAzr5OPqW/n1D8qBfQIUqE1
 pReNffgCWxjaykGzoLQE7YTbnHWuGeA=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-235-t3jtXE3vOXqDTx0UG0Nu5Q-1; Fri, 21 Apr 2023 07:03:51 -0400
X-MC-Unique: t3jtXE3vOXqDTx0UG0Nu5Q-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id BE14C87B2A5;
 Fri, 21 Apr 2023 11:03:50 +0000 (UTC)
Received: from thuth.com (unknown [10.39.193.14])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 53D5B140EBF4;
 Fri, 21 Apr 2023 11:03:49 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Peter Maydell <peter.maydell@linaro.org>
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Cleber Rosa <crosa@redhat.com>, Andrew Jeffery <andrew@aj.id.au>,
 Joel Stanley <joel@jms.id.au>, qemu-arm@nongnu.org
Subject: [PATCH 1/3] tests/avocado: Make ssh_command_output_contains()
 globally available
Date: Fri, 21 Apr 2023 13:03:43 +0200
Message-Id: <20230421110345.1294131-2-thuth@redhat.com>
In-Reply-To: <20230421110345.1294131-1-thuth@redhat.com>
References: <20230421110345.1294131-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

This function will be useful in other tests, too, so move it to the
core LinuxSSHMixIn class.

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 tests/avocado/avocado_qemu/__init__.py | 8 ++++++++
 tests/avocado/linux_ssh_mips_malta.py  | 8 --------
 2 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/tests/avocado/avocado_qemu/__init__.py b/tests/avocado/avocado_qemu/__init__.py
index cb71f50db9..6788837e1b 100644
--- a/tests/avocado/avocado_qemu/__init__.py
+++ b/tests/avocado/avocado_qemu/__init__.py
@@ -431,6 +431,14 @@ def ssh_command(self, command):
                          f'Guest command failed: {command}')
         return stdout_lines, stderr_lines
 
+    def ssh_command_output_contains(self, cmd, exp):
+        stdout, _ = self.ssh_command(cmd)
+        for line in stdout:
+            if exp in line:
+                break
+        else:
+            self.fail('"%s" output does not contain "%s"' % (cmd, exp))
+
 class LinuxDistro:
     """Represents a Linux distribution
 
diff --git a/tests/avocado/linux_ssh_mips_malta.py b/tests/avocado/linux_ssh_mips_malta.py
index 0179d8a6ca..d9bb525ad9 100644
--- a/tests/avocado/linux_ssh_mips_malta.py
+++ b/tests/avocado/linux_ssh_mips_malta.py
@@ -101,14 +101,6 @@ def shutdown_via_ssh(self):
         self.ssh_disconnect_vm()
         wait_for_console_pattern(self, 'Power down', 'Oops')
 
-    def ssh_command_output_contains(self, cmd, exp):
-        stdout, _ = self.ssh_command(cmd)
-        for line in stdout:
-            if exp in line:
-                break
-        else:
-            self.fail('"%s" output does not contain "%s"' % (cmd, exp))
-
     def run_common_commands(self, wordsize):
         self.ssh_command_output_contains(
             'cat /proc/cpuinfo',
-- 
2.31.1


