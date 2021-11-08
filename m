Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 530DF4499A8
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Nov 2021 17:27:03 +0100 (CET)
Received: from localhost ([::1]:33264 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mk7U5-0004mN-0Y
	for lists+qemu-devel@lfdr.de; Mon, 08 Nov 2021 11:27:01 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35698)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mk7LQ-0001b9-DL
 for qemu-devel@nongnu.org; Mon, 08 Nov 2021 11:18:05 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:20815)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mk7LO-0000oU-1B
 for qemu-devel@nongnu.org; Mon, 08 Nov 2021 11:18:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1636388281;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=SkxNHhX0QyQYxC8RhzB2xljeUh5RuXRUdAlFWY5fKNk=;
 b=OklF9xDLQgaO3nNQQS8nDrzBcF4fU1XL5XA785bYjlbb8DrKrS3BvpV7Kv/CZ1MSkr6uEf
 sMK/B6IvR0RRJMtDWGQfFcilQAXeHTPMBO3BTCpAZ3VXK/7cTIdFYCClWADKoSS/zHTFeV
 ClLxmB1XxhhreHD2ku4YQ7jEfpPff2Y=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-183-tNuQAusdOIaUoDsHDuV6uw-1; Mon, 08 Nov 2021 11:18:00 -0500
X-MC-Unique: tNuQAusdOIaUoDsHDuV6uw-1
Received: by mail-wm1-f70.google.com with SMTP id
 z138-20020a1c7e90000000b003319c5f9164so10318742wmc.7
 for <qemu-devel@nongnu.org>; Mon, 08 Nov 2021 08:17:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=SkxNHhX0QyQYxC8RhzB2xljeUh5RuXRUdAlFWY5fKNk=;
 b=TGHFdx8l4XhAXYwzSihBRU8h8rpltFIJ/OtHHA711Zv6lmbWCdJEKec+gNrndd3gYc
 W6kkTI0HjUZ8RtpubP5KEoZHQsfTJw1h/OIKvbODlTD+CxKzV+EVYUBAJewd0yj/GG6S
 5ZiAKEyca9fHhjmYNLs8yvB4HiHI0uUhrEwuUehgv54wsxKu6nG2ma8jf1MgnNN4D2Bh
 D+8Xl/88D5GpWOg3JZr62pqk9MZOulwHTHMqCamFbzJJe0S/o58iJlRmFxlKmvZYSiX6
 JtXagRhmGrkYtsX/qKVJd5riizLsxBkKyDdw2xIKXsIlgR3wKOCZDykNxApBu+6EJp4p
 92Lg==
X-Gm-Message-State: AOAM530gk29dfKBgYuu9ztds+Vj1vL0OBlM7AJ0/0NQZBMPWUlE9hNRo
 lyfaQzp6kta7AlX3d2ai0dDFmeiBHviTa7utZatItvjZ/V1CdauavNxGtx8/8LbhIxvPUARCJbV
 P49Q4l0N09Wg77XPT0pe0bmRIZbXFqxoQyB8nqtbkbsoLpolEohg8hu2FL2J/6Xjd
X-Received: by 2002:a1c:f601:: with SMTP id w1mr52958093wmc.112.1636388278710; 
 Mon, 08 Nov 2021 08:17:58 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyU1qEb2Tt0PN1PqdGZQvCUOFktUodF1gpcslcUV8/wGW+gwQKWF5jQf9TVB/pKtfVN+BOkmA==
X-Received: by 2002:a1c:f601:: with SMTP id w1mr52958068wmc.112.1636388278523; 
 Mon, 08 Nov 2021 08:17:58 -0800 (PST)
Received: from x1w.. (46.red-193-152-127.dynamicip.rima-tde.net.
 [193.152.127.46])
 by smtp.gmail.com with ESMTPSA id a22sm2510255wme.19.2021.11.08.08.17.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Nov 2021 08:17:58 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 3/9] tests/avocado: Extract QemuBaseTest from Test
Date: Mon,  8 Nov 2021 17:17:33 +0100
Message-Id: <20211108161739.1371503-4-philmd@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211108161739.1371503-1-philmd@redhat.com>
References: <20211108161739.1371503-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

From: Philippe Mathieu-Daudé <f4bug@amsat.org>

The Avocado Test::fetch_asset() is handy to download artifacts
before running tests. The current class is named Test but only
tests system emulation. As we want to test user emulation,
refactor the common code as QemuBaseTest.

Reviewed-by: Willian Rampazzo <willianr@redhat.com>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-Id: <20211105143416.148332-2-f4bug@amsat.org>
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


