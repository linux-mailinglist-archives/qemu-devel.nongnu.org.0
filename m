Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B44334198F3
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Sep 2021 18:36:00 +0200 (CEST)
Received: from localhost ([::1]:50182 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mUtbj-0005jt-Nz
	for lists+qemu-devel@lfdr.de; Mon, 27 Sep 2021 12:35:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43106)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mUtXN-0002Fj-LI; Mon, 27 Sep 2021 12:31:30 -0400
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a]:40610)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mUtXK-0002Sh-0U; Mon, 27 Sep 2021 12:31:28 -0400
Received: by mail-wm1-x32a.google.com with SMTP id
 t16-20020a1c7710000000b003049690d882so1114970wmi.5; 
 Mon, 27 Sep 2021 09:31:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=OTf5iqe9z+S4b3dbtYhCloYbfDKwbKuQuHUgKiVeRVM=;
 b=lGc4yxMd9oe4PrrXyMD2bPLKRXs60FtqmhJw952515zugPAJWmKmBl3mwDTxtM6zJL
 lcXFWywidu3auFFn98Wo/Y8zcuxB+qtX6gEWbca44LQ1zCI1lDbDWo2VX2p5LCEyEMoI
 eZXmpoPxTEH5lVNqrkXa32rqNSekMu+p3HoU3YihEVPqYAseLpNlSdm+oaM2azinR6sY
 1ae6LmRzeY++QKU2HdWaeIkh3iikj+WvTvi/Wo7joheGfyZSSk79ezX/BofjqnjF+VYr
 gFPehN/8zK0PC7u1pIbWQRvMC61jFK/FdKj7cKvgWrmoKXL/tjEpH1dOUzDd4DESUhvg
 +3yA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=OTf5iqe9z+S4b3dbtYhCloYbfDKwbKuQuHUgKiVeRVM=;
 b=b22gnAWfPG4KqdNo15zmJJ8Jc6S0FQdFVqtJLYPXh8slVEcC97fVgYW/L2uisyJy7K
 Xvw9ACVce2fA1Zbv4rLVQ9Z2L+T8l8sIHNs+SMR264KpXx+iwrp8xg2WNbGNZeIuhcbN
 S5Pio7cW2GEdIJKi2bhERs1OEN++EA4fb3cye0wQeGb4PoC91aU7UxWv09tRA6Vm4k3H
 ghJ6DuuBgTvouOPu+gQNSsyTUDxT/GDV01jM9wBRnWLizjsEITSQQoUx0sl5PwCav0Ah
 /9bigKFw7vbQM9SiiDsWdAH8Vb2NUnlUkA9ZS60C3HtH91UOjGpCMzf6UiPfwedWyqH2
 WAGA==
X-Gm-Message-State: AOAM533zNWSfkQjqa3zlIXUvc1WRv1Bm8LLiL5Qxs1J/mZGZyXmj1YJB
 4LEp5Of/uoYwr06V+90VP7jgBr9HRR8=
X-Google-Smtp-Source: ABdhPJxU4m7VWUjrRt9R41o+xLGscQudGT7aHfwZSs/AsiL5Z7fHQtURKR+aYH6FdXFkR7Id4ZloBw==
X-Received: by 2002:a7b:ce19:: with SMTP id m25mr831051wmc.152.1632760283800; 
 Mon, 27 Sep 2021 09:31:23 -0700 (PDT)
Received: from x1w.redhat.com (118.red-83-35-24.dynamicip.rima-tde.net.
 [83.35.24.118])
 by smtp.gmail.com with ESMTPSA id s2sm16702131wrn.77.2021.09.27.09.31.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Sep 2021 09:31:23 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 1/6] tests/acceptance: Extract QemuBaseTest from Test
Date: Mon, 27 Sep 2021 18:31:11 +0200
Message-Id: <20210927163116.1998349-2-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210927163116.1998349-1-f4bug@amsat.org>
References: <20210927163116.1998349-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32a.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Laurent Vivier <laurent@vivier.eu>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Willian Rampazzo <willianr@redhat.com>, qemu-arm@nongnu.org,
 Warner Losh <imp@bsdimp.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The Avocado Test::fetch_asset() is handy to download artifacts
before running tests. The current class is named Test but only
tests system emulation. As we want to test user emulation,
refactor the common code as QemuBaseTest.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 tests/acceptance/avocado_qemu/__init__.py | 72 +++++++++++++----------
 1 file changed, 41 insertions(+), 31 deletions(-)

diff --git a/tests/acceptance/avocado_qemu/__init__.py b/tests/acceptance/avocado_qemu/__init__.py
index 2c4fef3e149..8fcbed74849 100644
--- a/tests/acceptance/avocado_qemu/__init__.py
+++ b/tests/acceptance/avocado_qemu/__init__.py
@@ -175,7 +175,7 @@ def exec_command_and_wait_for_pattern(test, command,
     """
     _console_interaction(test, success_message, failure_message, command + '\r')
 
-class Test(avocado.Test):
+class QemuBaseTest(avocado.Test):
     def _get_unique_tag_val(self, tag_name):
         """
         Gets a tag value, if unique for a key
@@ -185,6 +185,46 @@ def _get_unique_tag_val(self, tag_name):
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
+        return super(QemuBaseTest, self).fetch_asset(name,
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
+        super(Test, self).setUp()
+
+        self.machine = self.params.get('machine',
+                                       default=self._get_unique_tag_val('machine'))
+
     def require_accelerator(self, accelerator):
         """
         Requires an accelerator to be available for the test to continue
@@ -207,24 +247,6 @@ def require_accelerator(self, accelerator):
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
@@ -277,18 +299,6 @@ def tearDown(self):
             vm.shutdown()
         self._sd = None
 
-    def fetch_asset(self, name,
-                    asset_hash=None, algorithm=None,
-                    locations=None, expire=None,
-                    find_only=False, cancel_on_missing=True):
-        return super(Test, self).fetch_asset(name,
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


