Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EC33831B253
	for <lists+qemu-devel@lfdr.de>; Sun, 14 Feb 2021 20:47:24 +0100 (CET)
Received: from localhost ([::1]:51202 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lBNMZ-0001hJ-F8
	for lists+qemu-devel@lfdr.de; Sun, 14 Feb 2021 14:47:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56452)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lBNKn-0000iC-Sj; Sun, 14 Feb 2021 14:45:33 -0500
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e]:35675)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lBNKm-0005X1-0C; Sun, 14 Feb 2021 14:45:33 -0500
Received: by mail-wm1-x32e.google.com with SMTP id n10so6040477wmq.0;
 Sun, 14 Feb 2021 11:45:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=jJRdV1ZLz9Wc3UruihO3ipliHXOgtCfriX4mx0iNut0=;
 b=M4dkOy/Vk2vtelSOG7LuO7nQ1Uuk09qnnbcPbyJcmDF7UZO/xZvknn/b+g2VZwE8et
 LksrBUjNFXdpHK1BTKd7IGLXRC2wt4JmqZfYwhjHrbiZzwQsqBhaUKr0Dv3PUHr0TibH
 es6hSOb1kF1CmF5PXmCypFrx18vaNoiB13hIXMMbV0W4rcL68k7cPK8rpd1JzLFraDPY
 A28+X31olZ/yRtDxaGjxcLdqdk1gBEhBoHfUdhHyml8z+9zar5IEJnS4Qju/Y3zpyvWz
 BJECL7hUIG0TtPupgzJf5As8P4DG0AvtfSa+rbrRF6dC1ciknGiF3akQFzPBBy5M3hcH
 Hkuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=jJRdV1ZLz9Wc3UruihO3ipliHXOgtCfriX4mx0iNut0=;
 b=gMKmWlB9fFVMpNdkvg6OF2sLl4k59lBzGtGyX6ntFtocG2pcYLYW8PkmF8ts/V+x9q
 snaDN3LCvXJ/gb8w2G9lGgBjMrwP0rR52p7a8QofmBz7sbgW3C15iR+2tJ9d+40h2fH/
 56w91NsuonDtZ9Fcv0BkD5dL/h7iGCnRaCCcd+e00+izx8hqAqvPrJMkTB1/m937dULn
 HlKrR4GuAVEYKSrGcF0TeqLa5kNJUBYC/W6vZYEBlLdb8FFvsSWee21VjnuplHc7HsQE
 CJgtTY+VnGXSPIpprGvNILgnUgW5K+oKDGZRC0Q08ubKj1WV4lew4NnJ/YogYJEhc14c
 vJ9g==
X-Gm-Message-State: AOAM532u3Cn1R6sYfSOWNolE3CI7IZKhQaEzvhO8/mF/LFSws3i1rZbf
 3/dMHk+qS8xrAvP7wN1s5tknDfxajQQ=
X-Google-Smtp-Source: ABdhPJzPLoP4DSgZdLqamRgO6TVOkbb7yXLDtdc5GHxaytfL8vpOUqJY6zLuKBG2inoGbmduzPbcXw==
X-Received: by 2002:a05:600c:1552:: with SMTP id
 f18mr11411321wmg.149.1613331927791; 
 Sun, 14 Feb 2021 11:45:27 -0800 (PST)
Received: from localhost.localdomain (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id a17sm25907907wrx.63.2021.02.14.11.45.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 14 Feb 2021 11:45:27 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2] tests/acceptance: Add bFLT loader linux-user test
Date: Sun, 14 Feb 2021 20:45:24 +0100
Message-Id: <20210214194524.768660-1-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32e.google.com
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
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Laurent Vivier <laurent@vivier.eu>, Willian Rampazzo <willianr@redhat.com>,
 qemu-arm@nongnu.org, Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Add a very quick test that runs a busybox binary in bFLT format:

  $ avocado --show=app run -t linux_user tests/acceptance/load_bflt.py
  JOB ID     : db94d5960ce564c50904d666a7e259148c27e88f
  JOB LOG    : ~/avocado/job-results/job-2019-06-25T10.52-db94d59/job.log
   (1/1) tests/acceptance/load_bflt.py:LoadBFLT.test_stm32: PASS (0.15 s)
  RESULTS    : PASS 1 | ERROR 0 | FAIL 0 | SKIP 0 | WARN 0 | INTERRUPT 0 | CANCEL 0
  JOB TIME   : 0.54 s

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
Based-on: <20210214175912.732946-1-f4bug@amsat.org>
  tests/acceptance: Extract QemuBaseTest from Test
  tests/acceptance: Make pick_default_qemu_bin() more generic
  tests/acceptance: Introduce QemuUserTest base class
---
 tests/acceptance/load_bflt.py | 51 +++++++++++++++++++++++++++++++++++
 1 file changed, 51 insertions(+)
 create mode 100644 tests/acceptance/load_bflt.py

diff --git a/tests/acceptance/load_bflt.py b/tests/acceptance/load_bflt.py
new file mode 100644
index 00000000000..4b7796d0775
--- /dev/null
+++ b/tests/acceptance/load_bflt.py
@@ -0,0 +1,51 @@
+# Test the bFLT format
+#
+# Copyright (C) 2019 Philippe Mathieu-Daudé <f4bug@amsat.org>
+#
+# SPDX-License-Identifier: GPL-2.0-or-later
+
+import os
+import bz2
+import subprocess
+
+from avocado_qemu import QemuUserTest
+
+
+class LoadBFLT(QemuUserTest):
+
+    def extract_cpio(self, cpio_path):
+        """
+        Extracts a cpio archive into the test workdir
+
+        :param cpio_path: path to the cpio archive
+        """
+        cwd = os.getcwd()
+        os.chdir(self.workdir)
+        with bz2.open(cpio_path, 'rb') as archive_cpio:
+            subprocess.run(['cpio', '-i'], input=archive_cpio.read(),
+                           stderr=subprocess.DEVNULL)
+        os.chdir(cwd)
+
+    @skipUnless(os.getenv('AVOCADO_ALLOW_UNTRUSTED_CODE'), 'untrusted code')
+    def test_stm32(self):
+        """
+        :avocado: tags=arch:arm
+        :avocado: tags=linux_user
+        :avocado: tags=quick
+        """
+        # See https://elinux.org/STM32#User_Space
+        rootfs_url = ('https://elinux.org/images/5/51/'
+                      'Stm32_mini_rootfs.cpio.bz2')
+        rootfs_hash = '9f065e6ba40cce7411ba757f924f30fcc57951e6'
+        rootfs_path_bz2 = self.fetch_asset(rootfs_url, asset_hash=rootfs_hash)
+        busybox_path = self.workdir + "/bin/busybox"
+
+        self.extract_cpio(rootfs_path_bz2)
+
+        res = self.run(busybox_path)
+        ver = 'BusyBox v1.24.0.git (2015-02-03 22:17:13 CET) multi-call binary.'
+        self.assertIn(ver, res.stdout_text)
+
+        res = self.run(busybox_path, ['uname', '-a'])
+        unm = 'armv7l GNU/Linux'
+        self.assertIn(unm, res.stdout_text)
-- 
2.26.2


