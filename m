Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E621446527
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Nov 2021 15:41:22 +0100 (CET)
Received: from localhost ([::1]:35050 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mj0PA-000338-A6
	for lists+qemu-devel@lfdr.de; Fri, 05 Nov 2021 10:41:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46986)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mj0Iq-0003Ec-B0
 for qemu-devel@nongnu.org; Fri, 05 Nov 2021 10:34:48 -0400
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f]:52046)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mj0Im-00075u-Jj
 for qemu-devel@nongnu.org; Fri, 05 Nov 2021 10:34:47 -0400
Received: by mail-wm1-x32f.google.com with SMTP id z200so7234715wmc.1
 for <qemu-devel@nongnu.org>; Fri, 05 Nov 2021 07:34:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=IIEx33G/J0TCpoWoz1iKtvvioVnW0tK0nHMtNavnDjw=;
 b=MoAP7ZPQt26ko1XAFdl4TIQQzMivXRSUqMhUyzDEVUuKT5rsYrX9lP8kiAN+vsRrsC
 ybwtwsacMVVemP6blcCHxQ4jZW5Gmm1VSKi5Vremkd8rCthbAMipk6gI7gEl98GSPRa7
 897D+A6g5fUz0RdBlygp5nFoe/QQQMuEFeRHcXy+uAp3ViGDwlNkZrQ+ipYTKMIRN4kI
 9j/2+ussIh/Ri7jPejvtye861DCdARfnYJ+0xISe/LKGr0xPpPBXupiqHsVp7ha1hGTX
 oP6ue8OrYe7CB7ck/syJzPuv5MlbFFyKqTA2ucTXT6pu+h5j7Fum0Aiel86wnYDGEerZ
 jo1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=IIEx33G/J0TCpoWoz1iKtvvioVnW0tK0nHMtNavnDjw=;
 b=mSKrJiEeOhnacx55FYx6HliOlM1C1Bfv8B4Co8JSlxlaCvbxY87wZWW62nbpx8N87Y
 OkVcGY7k0GYFotCTq+F3vadI2rLG/Lcilrk/Eujg36pSxtqYPfzAVM/9X41tBU+Q82S4
 +x/iN/M1SEP6Gxb/5CPFGA58moORLIT8my/9iu9LsvBIGl0djXq0K33EibhE3552jNg/
 zmfMAdpjTFp0rPt3ZAgIrTb3L4/HRBrm9VYRD3O2Jo33mcA2IQ+0EY9AJK2lVaKqR53M
 yNE9z91OB+R+zfIJuKq9xYRQZl8iIpEgkMs6/ONcGe4fFE8wSZcGLq30zL6wfrig+H21
 gIIg==
X-Gm-Message-State: AOAM533/qNJEiZT2Q8Op3mUooCK/ECAE7tF5EQK9e5Zevtgdpw5KzPMn
 75C+q9kWf/CqH3zDoEIxFeme2Pp3fJc=
X-Google-Smtp-Source: ABdhPJxPERsAoB/xYsaqsUebvlmrYvFfIKQ4meybp6jwHsUwII25LlkH0H0Y9+7QN0Vf6/ankTk1yQ==
X-Received: by 2002:a1c:a344:: with SMTP id m65mr30070049wme.32.1636122882853; 
 Fri, 05 Nov 2021 07:34:42 -0700 (PDT)
Received: from x1w.redhat.com (62.red-83-57-168.dynamicip.rima-tde.net.
 [83.57.168.62])
 by smtp.gmail.com with ESMTPSA id f18sm7892330wrg.3.2021.11.05.07.34.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Nov 2021 07:34:42 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v6 5/6] tests/acceptance: Add bFLT loader linux-user test
Date: Fri,  5 Nov 2021 15:34:15 +0100
Message-Id: <20211105143416.148332-6-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211105143416.148332-1-f4bug@amsat.org>
References: <20211105143416.148332-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32f.google.com
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
Message-Id: <20211102084232.2965062-6-f4bug@amsat.org>
---
 tests/avocado/load_bflt.py | 54 ++++++++++++++++++++++++++++++++++++++
 1 file changed, 54 insertions(+)
 create mode 100644 tests/avocado/load_bflt.py

diff --git a/tests/avocado/load_bflt.py b/tests/avocado/load_bflt.py
new file mode 100644
index 00000000000..bb50cec1ee8
--- /dev/null
+++ b/tests/avocado/load_bflt.py
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


