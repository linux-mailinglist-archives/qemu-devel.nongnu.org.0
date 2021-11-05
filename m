Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 68969446526
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Nov 2021 15:41:11 +0100 (CET)
Received: from localhost ([::1]:34098 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mj0P0-0002Ox-3b
	for lists+qemu-devel@lfdr.de; Fri, 05 Nov 2021 10:41:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46732)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mj0IX-0002V1-C7
 for qemu-devel@nongnu.org; Fri, 05 Nov 2021 10:34:29 -0400
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432]:36552)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mj0IT-0006TP-N7
 for qemu-devel@nongnu.org; Fri, 05 Nov 2021 10:34:29 -0400
Received: by mail-wr1-x432.google.com with SMTP id s13so14108926wrb.3
 for <qemu-devel@nongnu.org>; Fri, 05 Nov 2021 07:34:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=rI+pJRZdgBJj1qAySozCFJaw5RK4SLLby5wlQgBeonc=;
 b=FgIIY4pI2THzfPqUiIRyeb1eVVEiuHlpw/7awK1H58lmd2rC5+rznDvZRwdovacy2d
 1gmG0Yk5RXUARMd42QnYw0hGvsAmeXLLgrmWqOf/XpBzRAPGSmweuQCQKTX2HIJYp5YI
 SoXFPjy6c0sVcf7PqkLD/EnduUskGIbfO+f86ageeiLRFGX369jA/JfBkAZlzVSbZzPy
 GjZgzBOXfio/3myEfWmW5qdCi8ksLPJW/vs7LZH+waXLrShUjOlYRgRqQ1y2ucRC0gfa
 znIV7hfs43kugKFgPLn0AKMSUPtsBIYXbVTG65PI3wNBd6CSElrND3co/JqLriA1FZi1
 QVmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=rI+pJRZdgBJj1qAySozCFJaw5RK4SLLby5wlQgBeonc=;
 b=rHyneeT28tDm3f865fBbAjGCCLXjKup1sFUY4FcHGFA1eg4Qx8ZrHXr6bT66odaR9u
 /XTMblLdUU0kOdcSz3pVj1YZnUoZEhLeZ1B1faUwXT+5PBH+zHmxNJqH4ACAF3j3YF01
 PTDY2WSpd5+6X9bGEL21DwzIbREZJbJ02YWeqTse1Mh8GcAySpyidi1CNeK+F3QPBEca
 Q89J4332XDT8AqthifDaibTo9gylPGO4KH4fujkQy67liOFosPvafUUWFLg+yBhCNsjd
 BgpkZ1gY63G19f+NJpD8qu3tXfFKXLUm0R4qLPkHqko+ecvamGkim6q/yJHrR0tFj9LO
 jjaQ==
X-Gm-Message-State: AOAM531xGrPis2RDRM1Cvk+YcsYmHExwoDz3TPVdto1YVt4Ax2IQVRCr
 gVddiltMUBA30nV3wIdnOzjb37ev1TI=
X-Google-Smtp-Source: ABdhPJyT+7L2UpE3zviIMHLjMRd7QGL/dLkEvtKkSZYla/bGMFMbRSaq34AtiR3WEmZfYnnC7T/njQ==
X-Received: by 2002:a05:6000:1544:: with SMTP id
 4mr38806119wry.358.1636122863756; 
 Fri, 05 Nov 2021 07:34:23 -0700 (PDT)
Received: from x1w.redhat.com (62.red-83-57-168.dynamicip.rima-tde.net.
 [83.57.168.62])
 by smtp.gmail.com with ESMTPSA id t127sm11824903wma.9.2021.11.05.07.34.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Nov 2021 07:34:22 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v6 1/6] tests/acceptance: Extract QemuBaseTest from Test
Date: Fri,  5 Nov 2021 15:34:11 +0100
Message-Id: <20211105143416.148332-2-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211105143416.148332-1-f4bug@amsat.org>
References: <20211105143416.148332-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x432.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
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
 Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The Avocado Test::fetch_asset() is handy to download artifacts
before running tests. The current class is named Test but only
tests system emulation. As we want to test user emulation,
refactor the common code as QemuBaseTest.

Reviewed-by: Willian Rampazzo <willianr@redhat.com>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-Id: <20211102084232.2965062-2-f4bug@amsat.org>
---
 tests/avocado/avocado_qemu/__init__.py | 72 +++++++++++++++-----------
 1 file changed, 41 insertions(+), 31 deletions(-)

diff --git a/tests/avocado/avocado_qemu/__init__.py b/tests/avocado/avocado_qemu/__init__.py
index cd21b59e040..a495e106d03 100644
--- a/tests/avocado/avocado_qemu/__init__.py
+++ b/tests/avocado/avocado_qemu/__init__.py
@@ -169,7 +169,7 @@ def exec_command_and_wait_for_pattern(test, command,
     """
     _console_interaction(test, success_message, failure_message, command + '\r')
 
-class Test(avocado.Test):
+class QemuBaseTest(avocado.Test):
     def _get_unique_tag_val(self, tag_name):
         """
         Gets a tag value, if unique for a key
@@ -179,6 +179,46 @@ def _get_unique_tag_val(self, tag_name):
             return vals.pop()
         return None
 
+    def setUp(self):
+        self.arch = self.params.get('arch',
+                                    default=self._get_unique_tag_val('arch'))
+
+        self.cpu = self.params.get('cpu',
+                                   default=self._get_unique_tag_val('cpu'))
+
+        default_qemu_bin = pick_default_qemu_bin(arch=self.arch)
+        self.qemu_bin = self.params.get('qemu_bin',
+                                        default=default_qemu_bin)
+        if self.qemu_bin is None:
+            self.cancel("No QEMU binary defined or found in the build tree")
+
+    def fetch_asset(self, name,
+                    asset_hash=None, algorithm=None,
+                    locations=None, expire=None,
+                    find_only=False, cancel_on_missing=True):
+        return super().fetch_asset(name,
+                        asset_hash=asset_hash,
+                        algorithm=algorithm,
+                        locations=locations,
+                        expire=expire,
+                        find_only=find_only,
+                        cancel_on_missing=cancel_on_missing)
+
+
+class Test(QemuBaseTest):
+    """Facilitates system emulation tests.
+
+    TODO: Rename this class as `QemuSystemTest`.
+    """
+
+    def setUp(self):
+        self._vms = {}
+
+        super().setUp()
+
+        self.machine = self.params.get('machine',
+                                       default=self._get_unique_tag_val('machine'))
+
     def require_accelerator(self, accelerator):
         """
         Requires an accelerator to be available for the test to continue
@@ -201,24 +241,6 @@ def require_accelerator(self, accelerator):
             self.cancel("%s accelerator does not seem to be "
                         "available" % accelerator)
 
-    def setUp(self):
-        self._vms = {}
-
-        self.arch = self.params.get('arch',
-                                    default=self._get_unique_tag_val('arch'))
-
-        self.cpu = self.params.get('cpu',
-                                   default=self._get_unique_tag_val('cpu'))
-
-        self.machine = self.params.get('machine',
-                                       default=self._get_unique_tag_val('machine'))
-
-        default_qemu_bin = pick_default_qemu_bin(arch=self.arch)
-        self.qemu_bin = self.params.get('qemu_bin',
-                                        default=default_qemu_bin)
-        if self.qemu_bin is None:
-            self.cancel("No QEMU binary defined or found in the build tree")
-
     def _new_vm(self, name, *args):
         self._sd = tempfile.TemporaryDirectory(prefix="avo_qemu_sock_")
         vm = QEMUMachine(self.qemu_bin, base_temp_dir=self.workdir,
@@ -272,18 +294,6 @@ def tearDown(self):
         self._sd = None
         super().tearDown()
 
-    def fetch_asset(self, name,
-                    asset_hash=None, algorithm=None,
-                    locations=None, expire=None,
-                    find_only=False, cancel_on_missing=True):
-        return super().fetch_asset(name,
-                        asset_hash=asset_hash,
-                        algorithm=algorithm,
-                        locations=locations,
-                        expire=expire,
-                        find_only=find_only,
-                        cancel_on_missing=cancel_on_missing)
-
 
 class LinuxSSHMixIn:
     """Contains utility methods for interacting with a guest via SSH."""
-- 
2.31.1


