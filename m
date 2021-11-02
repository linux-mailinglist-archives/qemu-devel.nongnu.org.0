Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EA534429C0
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Nov 2021 09:44:49 +0100 (CET)
Received: from localhost ([::1]:42594 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mhpPU-0001Iv-AC
	for lists+qemu-devel@lfdr.de; Tue, 02 Nov 2021 04:44:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60332)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mhpNm-0006zW-S3
 for qemu-devel@nongnu.org; Tue, 02 Nov 2021 04:43:02 -0400
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434]:42507)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mhpNk-0007Zp-AJ
 for qemu-devel@nongnu.org; Tue, 02 Nov 2021 04:43:02 -0400
Received: by mail-wr1-x434.google.com with SMTP id c4so2047309wrd.9
 for <qemu-devel@nongnu.org>; Tue, 02 Nov 2021 01:42:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=u3NBrJ1OPNK57q3TFtPyewQdz3cOFKEL+wLt+Ik/B6U=;
 b=lP983CNJ0XXYwWaFqvEi0GzvjGRp/zBLGPL0x+IvzCdznbpVikVnc2ueYp8dXiy/5t
 CzqETTfSasfs9iP6UP7GUDCz4DlxvmWWQXsQPoXOupMLcs+XGApgofSdmIJRT3RfUkK0
 v8Cm1a4i14WaLHMwuelk/tzRDIq0kR3jjFzliboS26lZsjkvLkoFLmQdLlQzJX0YwpB4
 kXqUgASHkLu8cs6lSDyhiqQ5vVHsFTfeXeAjs6Sr+h49aabfcFb9umGPsMFuhFt0UMOS
 rPmiEvWuuLdSjEEuOz22c6Szd/86ICywSHS3B1GZtYWyd+PXRiwstJvWF5Q04I0Fd3XI
 HUnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=u3NBrJ1OPNK57q3TFtPyewQdz3cOFKEL+wLt+Ik/B6U=;
 b=539/1xQCtEG+V/HkcSmQ+kr8CGjeU5UqZ1q9HT9jucR3p9YzQdoR9gbn4j5uFQJzcX
 X3pfuh2sG/tUezAOhSVIoZuP6uO4ajPI42+BEfMLKZlNiNHfkeaENxxNEeGTw7L272XP
 PN+NCUsVOgztZ6tEls2iF3FzybKLNKRqwtdyIMMhzt2nhF2KNYD1J2KW5uLrDejdSUr9
 yB1a2XPSMIHI7ysN6qGJBvOl7d5Pt8rPR6bzBppahru4+fVDqjJrmgw+ZK7KAC8qfBgv
 763PkQOMAqF77BFdPD5PKjlRPgSGbdaBfIMDrr6nN+Zdi+A+h64yQ2AAs8CfhiCeqkxP
 AX3Q==
X-Gm-Message-State: AOAM532lOVf1zh37nmRveXw0CK7TIbQy4tL85TymjG2o399uP6IPzwvi
 mvTsj81jY3MMPGdFJHHF+NxkKwUf7Nc=
X-Google-Smtp-Source: ABdhPJyQ8kP6IhzUzumHrCMXjug9Pm6rVrEL3dRu5unacw/jYKdeg2BSaXP5QyvxMcg44fj5yqb4TQ==
X-Received: by 2002:a05:6000:2a2:: with SMTP id
 l2mr11264283wry.110.1635842578929; 
 Tue, 02 Nov 2021 01:42:58 -0700 (PDT)
Received: from x1w.. (62.red-83-57-168.dynamicip.rima-tde.net. [83.57.168.62])
 by smtp.gmail.com with ESMTPSA id
 k8sm1902997wms.41.2021.11.02.01.42.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Nov 2021 01:42:58 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 5/6] tests/acceptance: Add bFLT loader linux-user test
Date: Tue,  2 Nov 2021 09:42:31 +0100
Message-Id: <20211102084232.2965062-6-f4bug@amsat.org>
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

Add a very quick test that runs a busybox binary in bFLT format:

  $ AVOCADO_ALLOW_UNTRUSTED_CODE=1 \
    avocado --show=app run -t linux_user tests/acceptance/load_bflt.py
  JOB ID     : db94d5960ce564c50904d666a7e259148c27e88f
  JOB LOG    : ~/avocado/job-results/job-2019-06-25T10.52-db94d59/job.log
   (1/1) tests/acceptance/load_bflt.py:LoadBFLT.test_stm32: PASS (0.15 s)
  RESULTS    : PASS 1 | ERROR 0 | FAIL 0 | SKIP 0 | WARN 0 | INTERRUPT 0 | CANCEL 0
  JOB TIME   : 0.54 s

Reviewed-by: Willian Rampazzo <willianr@redhat.com>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
v5: Use os.path.join()
---
 tests/acceptance/load_bflt.py | 54 +++++++++++++++++++++++++++++++++++
 1 file changed, 54 insertions(+)
 create mode 100644 tests/acceptance/load_bflt.py

diff --git a/tests/acceptance/load_bflt.py b/tests/acceptance/load_bflt.py
new file mode 100644
index 00000000000..bb50cec1ee8
--- /dev/null
+++ b/tests/acceptance/load_bflt.py
@@ -0,0 +1,54 @@
+# Test the bFLT loader format
+#
+# Copyright (C) 2019 Philippe Mathieu-Daudé <f4bug@amsat.org>
+#
+# SPDX-License-Identifier: GPL-2.0-or-later
+
+import os
+import bz2
+import subprocess
+
+from avocado import skipUnless
+from avocado_qemu import QemuUserTest
+from avocado_qemu import has_cmd
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
+    @skipUnless(*has_cmd('cpio'))
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
+        busybox_path = os.path.join(self.workdir, "/bin/busybox")
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
2.31.1


