Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1367731B203
	for <lists+qemu-devel@lfdr.de>; Sun, 14 Feb 2021 19:33:27 +0100 (CET)
Received: from localhost ([::1]:58692 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lBMD0-0000UI-3T
	for lists+qemu-devel@lfdr.de; Sun, 14 Feb 2021 13:33:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34588)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lBLj2-0001Hw-EE
 for qemu-devel@nongnu.org; Sun, 14 Feb 2021 13:02:28 -0500
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c]:37193)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lBLj0-0004hT-UU
 for qemu-devel@nongnu.org; Sun, 14 Feb 2021 13:02:28 -0500
Received: by mail-wm1-x32c.google.com with SMTP id m1so5842922wml.2
 for <qemu-devel@nongnu.org>; Sun, 14 Feb 2021 10:02:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=tAIy7FUQhIbkzhnlwKrYWaoIdkoCcq/sJqrD/3OuL28=;
 b=L7kU2i88pK4c1X1MYEzU2BgcBam0+Ky3HFvwlyl47piV557P6LyLhIN0RhcfCPrsVN
 zz2FqWSQhyfjx56vN0pzKgmez3hZdemnKo7J34quLLvH8GnUf7sYHlGNm2M1/u6qUoUk
 yvWEkuYKxb2yneZ3LSDby2AojTi1aDBV9f6VQK+A6WZ0ee7o3NOphe9L7ZxO/KuT5IgC
 WIXWiB42HAjyGMJ/VV+fdU7mvgU3ijIa3bTYxpOGfbs9lkmIjKhjtErgRqSzpEsl6oSr
 92GdaeYOUsY1j4msrpGre8gz/sXj+L79lVSC6qWrNAwpwdZ3vTDiAUCCe7Hiiug40siy
 yghg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=tAIy7FUQhIbkzhnlwKrYWaoIdkoCcq/sJqrD/3OuL28=;
 b=Z9+f4XA9rRiD2aiEtPBxNk4+KKIloIbaYazKhRGr9STA9FlY2d4WgRYexW6hpn69Aj
 +lOwyAM9nZKAC+J9O4CTeUb3XEaHH5BKbo6tCtaqPwhJXFS4b1PtNta3rk/r85Uz5Kzl
 0OLybhxrUHaH3M1QOgkkxDEi0b7n5jDy05fkqHeT602QOlFj3TFoLOZUYwRaCE/BPYqE
 CejjzxIO1vNwtXTP5VdtIf3f8eaUkOc9OfeH6ewsoGe7p0i2+eIJjwkacdPDjHNG5HI5
 Te2l40IdCzmEhye7VQHOqt3YwmGkdpcRhOTzjppgSVRJMw8o4rcRnFJBUnwKDy16XUvT
 JazQ==
X-Gm-Message-State: AOAM533OXqGZ3WeVwWulXVQVEKnnuy/1EOSVrM81igmSGd05UiPxVcT9
 8LZsH3tj8VpcbV7glKPVrW67fVERkak=
X-Google-Smtp-Source: ABdhPJwhDsBPJJSpjDEErKfL4N7mN8WOG2ORpQYzFWPtVwOowa3xwqF9LM0C6J27pI5wfsMV36v0AA==
X-Received: by 2002:a1c:de08:: with SMTP id v8mr11126032wmg.143.1613325745249; 
 Sun, 14 Feb 2021 10:02:25 -0800 (PST)
Received: from localhost.localdomain (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id v11sm20863355wrr.3.2021.02.14.10.02.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 14 Feb 2021 10:02:24 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH 38/42] tests/acceptance: Extract QemuBaseTest from Test
Date: Sun, 14 Feb 2021 18:59:08 +0100
Message-Id: <20210214175912.732946-39-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210214175912.732946-1-f4bug@amsat.org>
References: <20210214175912.732946-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32c.google.com
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
Cc: Fredrik Noring <noring@nocrew.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Cleber Rosa <crosa@redhat.com>, Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Aurelien Jarno <aurelien@aurel32.net>, "Maciej W. Rozycki" <macro@orcam.me.uk>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The Avocado Test::fetch_asset() is handy to download artifacts
before running tests. The current class is named Test but only
tests system emulation. As we want to test user emulation,
refactor the common code as QemuBaseTest.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 tests/acceptance/avocado_qemu/__init__.py | 35 +++++++++++++----------
 1 file changed, 20 insertions(+), 15 deletions(-)

diff --git a/tests/acceptance/avocado_qemu/__init__.py b/tests/acceptance/avocado_qemu/__init__.py
index bf54e419da2..31b7064c0e5 100644
--- a/tests/acceptance/avocado_qemu/__init__.py
+++ b/tests/acceptance/avocado_qemu/__init__.py
@@ -145,7 +145,7 @@ def exec_command_and_wait_for_pattern(test, command,
     """
     _console_interaction(test, success_message, failure_message, command + '\r')
 
-class Test(avocado.Test):
+class QemuBaseTest(avocado.Test):
     def _get_unique_tag_val(self, tag_name):
         """
         Gets a tag value, if unique for a key
@@ -156,8 +156,6 @@ def _get_unique_tag_val(self, tag_name):
         return None
 
     def setUp(self):
-        self._vms = {}
-
         self.arch = self.params.get('arch',
                                     default=self._get_unique_tag_val('arch'))
 
@@ -170,6 +168,25 @@ def setUp(self):
         if self.qemu_bin is None:
             self.cancel("No QEMU binary defined or found in the build tree")
 
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
+# a.k.a. QemuSystemTest for system emulation...
+class Test(QemuBaseTest):
+    def setUp(self):
+        self._vms = {}
+        super(Test, self).setUp()
+
     def _new_vm(self, *args):
         self._sd = tempfile.TemporaryDirectory(prefix="avo_qemu_sock_")
         vm = QEMUMachine(self.qemu_bin, sock_dir=self._sd.name)
@@ -194,15 +211,3 @@ def tearDown(self):
         for vm in self._vms.values():
             vm.shutdown()
         self._sd = None
-
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
-- 
2.26.2


