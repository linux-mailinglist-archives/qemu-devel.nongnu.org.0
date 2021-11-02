Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4ADE04429BE
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Nov 2021 09:44:34 +0100 (CET)
Received: from localhost ([::1]:41074 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mhpPE-0000JL-VE
	for lists+qemu-devel@lfdr.de; Tue, 02 Nov 2021 04:44:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60172)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mhpNT-0006HD-84
 for qemu-devel@nongnu.org; Tue, 02 Nov 2021 04:42:43 -0400
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335]:41765)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mhpNQ-0007Vc-Sq
 for qemu-devel@nongnu.org; Tue, 02 Nov 2021 04:42:42 -0400
Received: by mail-wm1-x335.google.com with SMTP id
 f7-20020a1c1f07000000b0032ee11917ceso1509798wmf.0
 for <qemu-devel@nongnu.org>; Tue, 02 Nov 2021 01:42:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Im+Cf99LFyjhzp+sO6pePzS2IqjUlJiZTNDKG3hFU1M=;
 b=Soycesse4dQU9Tlkek37qRL7lCYw9L/at5sFFSlTx96vDIfktGh+SLQmAlh4yN3Ry0
 MUPTK+HcDNUelOFXfMS9oO2oLBhyl4ODwmE6CDGSkSZH5MLru9GbuMJOWfgvKBSkEpcR
 ELwBsNZeChQFmfUADzuRSCJQG3s1w8GSbM/xM6s5mYxVrcqF/3vNaUk6e20cBDsumjLY
 +DoeJHuk3RUoOJypVBxPxwebcwooWYUjYj42Wh1EIdMbajsTBvQHOYezuchrmuVK8VuV
 /x3yW/10sZPpHeRpdFMM+texjlIi36tInyA7mGz/XQdMdsKvKcSiKqA8O1vQoND8Zz8o
 wqNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=Im+Cf99LFyjhzp+sO6pePzS2IqjUlJiZTNDKG3hFU1M=;
 b=XhL8h2sQZ+qcdP9/N8++Sq3CavBkUkOiWeLwiLfD21fTag/hu2YuHg0rXTfcz0Ihrm
 NWhpd9zXSe8Os/RUbbkDNJpUOqKLuO/DUEOmJ3Cl6D1rKoXznvrqbfJo8oDXye3d3Hrd
 zusmH6rQh7KPRJsBv2BWB0Os1e8Nu0rKQ4ZoSFzYzJzJQGBiUKSLrEmA+0UxQJpoXZuu
 oKugd/96GHH3MKJweEwWJfKs1KCeseItkotxV+CQteLG4qQz/nnt9oXNOWSRmDVKroE7
 XI+K4J5D9z30PqXDPbj4Rq6KBg1OJNBnzsukM80Ro6iDSD540KaiGfVvpJ8HVqyk1CdF
 QIFA==
X-Gm-Message-State: AOAM532pW+be3N55sB0WzIZBqmGlDqpViRFyBoapx+qLDTg95m1e2IcG
 Ud3XqQLAZ4es/fsEIa3UAAtHDb5HwC4=
X-Google-Smtp-Source: ABdhPJyuNll1Lk840v5vN/twTkiFye5FBM4Yye2mLyLdwyYNFvrMH9JPXgArysXapraLV0zBJymKFg==
X-Received: by 2002:a1c:ac86:: with SMTP id v128mr5216223wme.3.1635842559438; 
 Tue, 02 Nov 2021 01:42:39 -0700 (PDT)
Received: from x1w.. (62.red-83-57-168.dynamicip.rima-tde.net. [83.57.168.62])
 by smtp.gmail.com with ESMTPSA id
 u15sm1932391wmq.12.2021.11.02.01.42.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Nov 2021 01:42:38 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 1/6] tests/acceptance: Extract QemuBaseTest from Test
Date: Tue,  2 Nov 2021 09:42:27 +0100
Message-Id: <20211102084232.2965062-2-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211102084232.2965062-1-f4bug@amsat.org>
References: <20211102084232.2965062-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x335.google.com
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

The Avocado Test::fetch_asset() is handy to download artifacts
before running tests. The current class is named Test but only
tests system emulation. As we want to test user emulation,
refactor the common code as QemuBaseTest.

Reviewed-by: Willian Rampazzo <willianr@redhat.com>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
v5: Use PEP3135 (Willian)
---
 tests/acceptance/avocado_qemu/__init__.py | 72 +++++++++++++----------
 1 file changed, 41 insertions(+), 31 deletions(-)

diff --git a/tests/acceptance/avocado_qemu/__init__.py b/tests/acceptance/avocado_qemu/__init__.py
index 1841053e2c1..1ed381f5037 100644
--- a/tests/acceptance/avocado_qemu/__init__.py
+++ b/tests/acceptance/avocado_qemu/__init__.py
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


