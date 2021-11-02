Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 08A3B4429CA
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Nov 2021 09:47:07 +0100 (CET)
Received: from localhost ([::1]:48792 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mhpRi-0005RX-6h
	for lists+qemu-devel@lfdr.de; Tue, 02 Nov 2021 04:47:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60272)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mhpNh-0006qI-Vq
 for qemu-devel@nongnu.org; Tue, 02 Nov 2021 04:42:58 -0400
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434]:42506)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mhpNf-0007ZM-KS
 for qemu-devel@nongnu.org; Tue, 02 Nov 2021 04:42:57 -0400
Received: by mail-wr1-x434.google.com with SMTP id c4so2046989wrd.9
 for <qemu-devel@nongnu.org>; Tue, 02 Nov 2021 01:42:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=/GJnQqcSBpzJ9FdoSQJa+0mjU+wATrzkdQ7FymVRsE4=;
 b=L18uFuCDg4ETIcBgozDpwg5ZT8qi3vA8z1r1wFSrnpdIbfilO5GAKPesC5yncSdAbO
 +QBuRtQRq978c4J5VU42IUE4MY0X8z0JvEB4Y+P7LLRylMY/xJCYKNXmXzxrEHRHDb3X
 uXBPYUyxNwBBDVZcH1wjyZGzCPveStyZvf5FOQWUp3gsvxmELn42GDjHT9NdOBsz/1eK
 Ntq7inacRdBsH94LhXWh63kpHLJAY/E8u/f5UpmArP3DX1gOhFeIt6fjHYiYTrIAOalc
 FQLuiWnZPP+y/95M0OPWBwQa1XqXvBWS6BDCcXdKQ8FaGGPzR0+2J3yAzwyz3XQZ1Ne0
 /9LQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=/GJnQqcSBpzJ9FdoSQJa+0mjU+wATrzkdQ7FymVRsE4=;
 b=B8N8+sZYd18nIvx+7P6uqGStUYtDMHE8NGPjBsmvqgEa8OL+ZpC0aP0RTtD9ZVSoRE
 Wp54ONlWfpo84tCopiSrzLWEzEMZFq6OKY0vRofLRGUYdYe1ZgFIYtPwIbHt+7dYBcJp
 RIdw+GnLi0c3XKSi3nryMx3ZslYLjegxAtur6pOUv9mq5PZmftLycoINkKxbytLOM1RW
 HUVG32ck+3L8jCQrBJzrPi8+mPtMgwkKv1zu1FyeEUYnuI/UOhWb+S/rMLWgDw9Mkd3c
 gnDSR8SKVI/Wym3cdBX3RZJkAZRQAaKYR8ANSdACKJpWepVYLB035OPWSNAK99ddmny9
 qy1g==
X-Gm-Message-State: AOAM532Tk4qAvwPuUZQm68KccVYpLRdqnhtemEh8Q3CtHL9PBzj78Fm0
 VIvvUS/tZfRyEca4fUhVBF3GTKsmjvc=
X-Google-Smtp-Source: ABdhPJx2bwdYjsWaDJ/lQOKax5vJidZarDIll5wfw9aDr9Nqv9svYQSd7Rwf+wsLJPYU4vvjY6HrmQ==
X-Received: by 2002:a5d:6d07:: with SMTP id e7mr10471312wrq.311.1635842574127; 
 Tue, 02 Nov 2021 01:42:54 -0700 (PDT)
Received: from x1w.. (62.red-83-57-168.dynamicip.rima-tde.net. [83.57.168.62])
 by smtp.gmail.com with ESMTPSA id
 z11sm6429172wrt.58.2021.11.02.01.42.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Nov 2021 01:42:53 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 4/6] tests/acceptance: Share useful helpers from
 virtiofs_submounts test
Date: Tue,  2 Nov 2021 09:42:30 +0100
Message-Id: <20211102084232.2965062-5-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211102084232.2965062-1-f4bug@amsat.org>
References: <20211102084232.2965062-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x434.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Willian Rampazzo <willianr@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Warner Losh <imp@bsdimp.com>, Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Move the useful has_cmd()/has_cmds() helpers from the virtiofs
test to the avocado_qemu public class.

Reviewed-by: Wainer dos Santos Moschetta <wainersm@redhat.com>
Reviewed-by: Willian Rampazzo <willianr@redhat.com>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 tests/acceptance/avocado_qemu/__init__.py | 57 ++++++++++++++++++++++
 tests/acceptance/virtiofs_submounts.py    | 59 +----------------------
 2 files changed, 59 insertions(+), 57 deletions(-)

diff --git a/tests/acceptance/avocado_qemu/__init__.py b/tests/acceptance/avocado_qemu/__init__.py
index 85bb3519969..0d0478374c3 100644
--- a/tests/acceptance/avocado_qemu/__init__.py
+++ b/tests/acceptance/avocado_qemu/__init__.py
@@ -11,6 +11,7 @@
 import logging
 import os
 import shutil
+import subprocess
 import sys
 import tempfile
 import time
@@ -41,6 +42,62 @@
                         tcg_available)
 
 
+def has_cmd(name, args=None):
+    """
+    This function is for use in a @avocado.skipUnless decorator, e.g.:
+
+        @skipUnless(*has_cmd('sudo -n', ('sudo', '-n', 'true')))
+        def test_something_that_needs_sudo(self):
+            ...
+    """
+
+    if args is None:
+        args = ('which', name)
+
+    try:
+        _, stderr, exitcode = run_cmd(args)
+    except Exception as e:
+        exitcode = -1
+        stderr = str(e)
+
+    if exitcode != 0:
+        cmd_line = ' '.join(args)
+        err = f'{name} required, but "{cmd_line}" failed: {stderr.strip()}'
+        return (False, err)
+    else:
+        return (True, '')
+
+def has_cmds(*cmds):
+    """
+    This function is for use in a @avocado.skipUnless decorator and
+    allows checking for the availability of multiple commands, e.g.:
+
+        @skipUnless(*has_cmds(('cmd1', ('cmd1', '--some-parameter')),
+                              'cmd2', 'cmd3'))
+        def test_something_that_needs_cmd1_and_cmd2(self):
+            ...
+    """
+
+    for cmd in cmds:
+        if isinstance(cmd, str):
+            cmd = (cmd,)
+
+        ok, errstr = has_cmd(*cmd)
+        if not ok:
+            return (False, errstr)
+
+    return (True, '')
+
+def run_cmd(args):
+    subp = subprocess.Popen(args,
+                            stdout=subprocess.PIPE,
+                            stderr=subprocess.PIPE,
+                            universal_newlines=True)
+    stdout, stderr = subp.communicate()
+    ret = subp.returncode
+
+    return (stdout, stderr, ret)
+
 def is_readable_executable_file(path):
     return os.path.isfile(path) and os.access(path, os.R_OK | os.X_OK)
 
diff --git a/tests/acceptance/virtiofs_submounts.py b/tests/acceptance/virtiofs_submounts.py
index 21ad7d792e7..e6dc32ffd4e 100644
--- a/tests/acceptance/virtiofs_submounts.py
+++ b/tests/acceptance/virtiofs_submounts.py
@@ -6,67 +6,12 @@
 
 from avocado import skipUnless
 from avocado_qemu import LinuxTest, BUILD_DIR
+from avocado_qemu import has_cmds
+from avocado_qemu import run_cmd
 from avocado_qemu import wait_for_console_pattern
 from avocado.utils import ssh
 
 
-def run_cmd(args):
-    subp = subprocess.Popen(args,
-                            stdout=subprocess.PIPE,
-                            stderr=subprocess.PIPE,
-                            universal_newlines=True)
-    stdout, stderr = subp.communicate()
-    ret = subp.returncode
-
-    return (stdout, stderr, ret)
-
-def has_cmd(name, args=None):
-    """
-    This function is for use in a @avocado.skipUnless decorator, e.g.:
-
-        @skipUnless(*has_cmd('sudo -n', ('sudo', '-n', 'true')))
-        def test_something_that_needs_sudo(self):
-            ...
-    """
-
-    if args is None:
-        args = ('which', name)
-
-    try:
-        _, stderr, exitcode = run_cmd(args)
-    except Exception as e:
-        exitcode = -1
-        stderr = str(e)
-
-    if exitcode != 0:
-        cmd_line = ' '.join(args)
-        err = f'{name} required, but "{cmd_line}" failed: {stderr.strip()}'
-        return (False, err)
-    else:
-        return (True, '')
-
-def has_cmds(*cmds):
-    """
-    This function is for use in a @avocado.skipUnless decorator and
-    allows checking for the availability of multiple commands, e.g.:
-
-        @skipUnless(*has_cmds(('cmd1', ('cmd1', '--some-parameter')),
-                              'cmd2', 'cmd3'))
-        def test_something_that_needs_cmd1_and_cmd2(self):
-            ...
-    """
-
-    for cmd in cmds:
-        if isinstance(cmd, str):
-            cmd = (cmd,)
-
-        ok, errstr = has_cmd(*cmd)
-        if not ok:
-            return (False, errstr)
-
-    return (True, '')
-
-
 class VirtiofsSubmountsTest(LinuxTest):
     """
     :avocado: tags=arch:x86_64
-- 
2.31.1


