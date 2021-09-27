Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E65A4198FD
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Sep 2021 18:37:03 +0200 (CEST)
Received: from localhost ([::1]:52926 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mUtck-0007Zf-4D
	for lists+qemu-devel@lfdr.de; Mon, 27 Sep 2021 12:37:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43220)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mUtXe-0002bw-Jb; Mon, 27 Sep 2021 12:31:48 -0400
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d]:45716)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mUtXc-0002hu-Rz; Mon, 27 Sep 2021 12:31:46 -0400
Received: by mail-wr1-x42d.google.com with SMTP id d21so52867712wra.12;
 Mon, 27 Sep 2021 09:31:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=UMcabUUT2V3YtrSUdazOXLcQv5cKyuk2eIlpKelVaGY=;
 b=j7xN9IET1ta4BGWLbVCvF5ywKwzXrRQbKrPKTZ3fT5DkUFYwE8UKOsuxE/KPln3m5C
 CzkVd3uEYECnwg7BmfMwXpHgC4NlYnhGmwOvYSQ4bFAseNO7MnRqx2yutoLmffoWuyYt
 Egkt8uoCOrdRnXBrfbtGpHkMypiH3EKyLe7CPE0tca1mXZKBfmAnXJIoruqMrAgMj+Hd
 8m486OzPoS1TyCCni9UbqshwJwAsLOxQOUqmAbEtS4hEL5oLT37RLN1q9kpN6uSsNrJA
 Uw37wu84fjfbbMJcF1Jbh4QiX7L+D3Wqr+p2A/rvnoSLea+gaCxL9csFbpqWYDAg5iS+
 +TMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=UMcabUUT2V3YtrSUdazOXLcQv5cKyuk2eIlpKelVaGY=;
 b=B+rrj1O88WE9b44UwhThjDt6ZYyXMPPjKDxlU3YZ9ftV2AkLTX0wsME6z5/Mammtxh
 F83DcKauzMoUxHiUVdMzaAbonukx+j2+qoCfvIxdGb1GyzQH9q5u9DWH2Wkq++FIK3a+
 bI/nXhXv5/Bz37cYtuEhM+YXqQ3rye9GyTELH1lenzqFYJr3vySyZYzdmdUa8FJdjq/b
 KoQk8M1aXKNv6VHcwvSPZNO9CVqQ/c0uZYtgpzZn3KSSQ3iPDAMs6xOlxFULSihoI5Gk
 /RpTC+TY5xyqR/dsSS1J9aPs7gvpAr5a97NR9Zn4IhAzzJUTWnq6CCt1ZY2cstaMNFnS
 SE0w==
X-Gm-Message-State: AOAM531b1zkbHDT0KrEnbvbrjeuzMvIpPYkPv8V4Lqal1H0cPWuzfEBH
 qF61bbHTOlhytF7vhA5GFjxECZHFvsc=
X-Google-Smtp-Source: ABdhPJzO6/KIIgyOzz0s6sImlZTeOCl9W1SBRl387kZkZjtkYtTSs/fcrEQDjFeb+CyexfWwtf+iFQ==
X-Received: by 2002:adf:ff8f:: with SMTP id j15mr885816wrr.115.1632760302728; 
 Mon, 27 Sep 2021 09:31:42 -0700 (PDT)
Received: from x1w.redhat.com (118.red-83-35-24.dynamicip.rima-tde.net.
 [83.35.24.118])
 by smtp.gmail.com with ESMTPSA id c30sm17238730wrb.74.2021.09.27.09.31.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Sep 2021 09:31:42 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 5/6] tests/acceptance: Add bFLT loader linux-user test
Date: Mon, 27 Sep 2021 18:31:15 +0200
Message-Id: <20210927163116.1998349-6-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210927163116.1998349-1-f4bug@amsat.org>
References: <20210927163116.1998349-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42d.google.com
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
 tests/acceptance/load_bflt.py | 54 +++++++++++++++++++++++++++++++++++
 1 file changed, 54 insertions(+)
 create mode 100644 tests/acceptance/load_bflt.py

diff --git a/tests/acceptance/load_bflt.py b/tests/acceptance/load_bflt.py
new file mode 100644
index 00000000000..f071a979d8e
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
2.31.1


