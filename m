Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B1E234499A7
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Nov 2021 17:26:53 +0100 (CET)
Received: from localhost ([::1]:33198 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mk7Tw-0004kC-KP
	for lists+qemu-devel@lfdr.de; Mon, 08 Nov 2021 11:26:52 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35898)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mk7Lm-00022e-Dh
 for qemu-devel@nongnu.org; Mon, 08 Nov 2021 11:18:27 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:33563)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mk7Lk-0000s6-9M
 for qemu-devel@nongnu.org; Mon, 08 Nov 2021 11:18:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1636388303;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=HRNtpWns45KouVxWx+F2QK9RfjAkimgxL52hvvUyjt4=;
 b=TeYqtJIB3A5CpnguYkxJVnv1nhfKBRMg4v0jFsEYLCZSsqAZHONh5TNEXlw+LfIo2jy0pw
 x7ztNDwfWb3xLAzCbGpjZVJz1J06pkoO5ylVGerVEywO9xbWLazh99nkPisMNi5h/gXHfE
 VYMPbnIlELrvavfpcJRlSerCNXRoY7E=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-139-EDaomukRMC2Mjmtzn880ww-1; Mon, 08 Nov 2021 11:18:21 -0500
X-MC-Unique: EDaomukRMC2Mjmtzn880ww-1
Received: by mail-wr1-f71.google.com with SMTP id
 y9-20020a5d6209000000b001684625427eso4227480wru.7
 for <qemu-devel@nongnu.org>; Mon, 08 Nov 2021 08:18:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=HRNtpWns45KouVxWx+F2QK9RfjAkimgxL52hvvUyjt4=;
 b=faAeX/0M9unwjUgjcL1CHO+9VRUtT30PPbnn+/rNouc4KTE3SoHv00ZciplN8Au73H
 FCu++mf7RNpfbUp8zl1wacLUtrNR61ZjdnW+kLSMxHUokV7s8MU3vBaHQLzydK1LhJwv
 XHM0/7utpaCepoNEBzcg+oD6e2ksubd9koXLMQXw52j1fBcCnscQzHkb24jh/Trb0dga
 7hd/86wEMr4I8l1/v2miqu4tUsPD0Byn9WwEtMHgY3zFoMHaEoNaoxqGmrqfJQpXrDpj
 rm6nceMBaDxsTQeKTtWtgrHLtwMk/9jTG1VmOAL4T+yNEiCktZ1vQpUbMi7gouY53ZEX
 5ZcA==
X-Gm-Message-State: AOAM531HIiSrzGzk9qAIogb1CjTupR3bb979OuJ6OhJBtFVUgw9GY5hw
 o/oHGmwh5Zmpips4INe48T22vT52J0J1AZA7i8SUT4WSdrJUZ5w9rHdol37SZLrIYvoIzn3olxe
 Rl03NA01X+6OOX0t+TZ3rKKB2WxjFCD0LA92bO74hUmdQqQOSXCUGoUYJqC9A5k7G
X-Received: by 2002:a1c:7f0c:: with SMTP id a12mr519731wmd.14.1636388299641;
 Mon, 08 Nov 2021 08:18:19 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyf6UIKMvlOcPb/WxgPWdga/4PFSVv/zknW5FmByjRxxaghC+j0fVTlqY4UX9AyLqY7Xf5wmw==
X-Received: by 2002:a1c:7f0c:: with SMTP id a12mr519690wmd.14.1636388299361;
 Mon, 08 Nov 2021 08:18:19 -0800 (PST)
Received: from x1w.. (46.red-193-152-127.dynamicip.rima-tde.net.
 [193.152.127.46])
 by smtp.gmail.com with ESMTPSA id o10sm7694081wri.15.2021.11.08.08.18.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Nov 2021 08:18:19 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 7/9] tests/avocado: Add bFLT loader linux-user test
Date: Mon,  8 Nov 2021 17:17:37 +0100
Message-Id: <20211108161739.1371503-8-philmd@redhat.com>
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

Add a very quick test that runs a busybox binary in bFLT format:

  $ AVOCADO_ALLOW_UNTRUSTED_CODE=1 \
    avocado --show=app run -t linux_user tests/avocado/load_bflt.py
  JOB ID     : db94d5960ce564c50904d666a7e259148c27e88f
  JOB LOG    : ~/avocado/job-results/job-2019-06-25T10.52-db94d59/job.log
   (1/1) tests/avocado/load_bflt.py:LoadBFLT.test_stm32: PASS (0.15 s)
  RESULTS    : PASS 1 | ERROR 0 | FAIL 0 | SKIP 0 | WARN 0 | INTERRUPT 0 | CANCEL 0
  JOB TIME   : 0.54 s

Reviewed-by: Willian Rampazzo <willianr@redhat.com>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-Id: <20211105143416.148332-6-f4bug@amsat.org>
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


