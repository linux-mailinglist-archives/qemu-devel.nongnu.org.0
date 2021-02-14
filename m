Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EEEC31B216
	for <lists+qemu-devel@lfdr.de>; Sun, 14 Feb 2021 19:46:49 +0100 (CET)
Received: from localhost ([::1]:56840 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lBMPw-0003e8-Ah
	for lists+qemu-devel@lfdr.de; Sun, 14 Feb 2021 13:46:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34672)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lBLjH-0001ge-EZ
 for qemu-devel@nongnu.org; Sun, 14 Feb 2021 13:02:43 -0500
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435]:47005)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lBLjF-0004ji-TP
 for qemu-devel@nongnu.org; Sun, 14 Feb 2021 13:02:43 -0500
Received: by mail-wr1-x435.google.com with SMTP id t15so6054380wrx.13
 for <qemu-devel@nongnu.org>; Sun, 14 Feb 2021 10:02:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=gZSzBZ5cwzLEMl1m4ueqOFOq71K8++arIDvi8B+RYEY=;
 b=ZJmI9sTO3d9Js+k0LaDPnWAlUubc7e4so0JyvQgsOxqnyDlcm/O/BqNAdy5G3maddK
 d74hzd6EMrVyrClBRKwEjCgtQsFbNguvDoJqMZGgRYaedWzrGWpfioej3s1L7a1ZKOuX
 vp3E6HaIZTYkWyNvofEU8xxPnUpFb/5BsMCiBjCg91LzvD+CZWWQlyLzLGMOmo2J/Kgj
 PnGN07o/uUjq0qAblADcwrg4PF3i1SBlqxXFKB7q/14WSpoyjUtquqYhtG/aK/WhaaxM
 EB5xuvzDeWNb1GGLXI0+vWOGxiv2Qo2l5ET2XH66JGuVAXfKy9xfCbUDkA5Ee7dIGzit
 PjeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=gZSzBZ5cwzLEMl1m4ueqOFOq71K8++arIDvi8B+RYEY=;
 b=WS48WTAiLzymPnjJxFiBEhoXY77XsQX36B/KUE10wdS9+cKXgHhNuf+HHIy5Pqgyv7
 fnYmf4aM2DCT44p7XlmrKHHNc8Ioim0quf10iuNOr9RDIkByFrcTvm0tNc5nFzdP4bMR
 TE2m26OIA7yWE2JBKdtCKJHJJW+Eg48GW/yG9uRnfdl5/Ae8ayyGH9/7U/9c/jU0rnZQ
 Duz4sn7ydYU2pnU7+jiYYL3VvUBpN9DkED7Ikqr4G2x/LjnxMGuuF3HsaLYm/Dhqxzsa
 MqN4Qsi+dpaMUpAnbH0zB8IztmrXEsio4uCooMFyrmpYD40x4e7rIDYQQ5uZc3itijg3
 qXfg==
X-Gm-Message-State: AOAM530+msZU71xev1kSI6/kb7keOYeusIhguVB0IALEtRq4kbrrdqiH
 +Plccr4OhccNI5uLvFCiU/gm5XUELN4=
X-Google-Smtp-Source: ABdhPJxGGozT7vVqFV87EM4Q6sd89GQ48EFSrEmraPjq4VV4K0SdCNJoTC2ZI1/Hj7qd9j+GycaIfA==
X-Received: by 2002:a5d:5910:: with SMTP id v16mr4258464wrd.304.1613325760376; 
 Sun, 14 Feb 2021 10:02:40 -0800 (PST)
Received: from localhost.localdomain (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id x18sm8701695wrs.16.2021.02.14.10.02.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 14 Feb 2021 10:02:39 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH 41/42] tests/acceptance: Test R5900 CPU with BusyBox from
 Sony PS2
Date: Sun, 14 Feb 2021 18:59:11 +0100
Message-Id: <20210214175912.732946-42-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210214175912.732946-1-f4bug@amsat.org>
References: <20210214175912.732946-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x435.google.com
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

Test BusyBox on the R5900 CPU with 2 different binaries:

- o32 32-bit (statically linked)
- o32 64-bit (dynamically linked, uses multimedia instructions)

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 MAINTAINERS                        |  1 +
 tests/acceptance/mips_r5900_ps2.py | 69 ++++++++++++++++++++++++++++++
 2 files changed, 70 insertions(+)
 create mode 100644 tests/acceptance/mips_r5900_ps2.py

diff --git a/MAINTAINERS b/MAINTAINERS
index de5fe1c65f5..1a23f471b0e 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -242,6 +242,7 @@ F: include/hw/mips/
 F: include/hw/misc/mips_*
 F: include/hw/timer/mips_gictimer.h
 F: tests/tcg/mips/
+F: tests/acceptance/mips_r5900_ps2.py
 K: ^Subject:.*(?i)mips
 
 MIPS TCG CPUs (nanoMIPS ISA)
diff --git a/tests/acceptance/mips_r5900_ps2.py b/tests/acceptance/mips_r5900_ps2.py
new file mode 100644
index 00000000000..ff73f994e59
--- /dev/null
+++ b/tests/acceptance/mips_r5900_ps2.py
@@ -0,0 +1,69 @@
+# Test the MIPS R5900 CPU
+#
+# Copyright (C) 2021 Philippe Mathieu-Daudé <f4bug@amsat.org>
+#
+# SPDX-License-Identifier: GPL-2.0-or-later
+
+import os
+import lzma
+import shutil
+
+from avocado import skipUnless
+
+from avocado.utils import archive
+from avocado_qemu import QemuUserTest
+
+class R5900(QemuUserTest):
+
+    @skipUnless(os.getenv('AVOCADO_ALLOW_UNTRUSTED_CODE'), 'untrusted code')
+    def test_gentoo_busybox_32bit(self):
+        """
+        :avocado: tags=arch:r5900o32el
+        :avocado: tags=linux_user
+        :avocado: tags=quick
+        """
+        busybox_url = ('https://raw.githubusercontent.com/philmd'
+                       '/qemu-testing-blob/bf6a300cf0bc56e4a2c5b'
+                       '/mips/ps2/busybox-gentoo-v1.32.0.xz')
+        busybox_hash = 'd2a0abc2c7c3adb6b2fdd63356be78bc5e99f324'
+        busybox_path_xz = self.fetch_asset(busybox_url, asset_hash=busybox_hash)
+
+        busybox_path = os.path.join(self.workdir, "busybox")
+        with lzma.open(busybox_path_xz, 'rb') as f_in:
+            with open(busybox_path, 'wb') as f_out:
+                shutil.copyfileobj(f_in, f_out)
+        os.chmod(busybox_path, 0o755)
+
+        res = self.run(busybox_path)
+        ver = 'BusyBox v1.32.0 (2021-02-09 15:13:23 -00) multi-call binary'
+        self.assertIn(ver, res.stdout_text)
+
+        res = self.run(busybox_path, ['uname', '-a'])
+        unm = 'mips64 mips64 mips64 GNU/Linux'
+        self.assertIn(unm, res.stdout_text)
+
+    @skipUnless(os.getenv('AVOCADO_ALLOW_UNTRUSTED_CODE'), 'untrusted code')
+    def test_ps2_busybox_64bit(self):
+        """
+        :avocado: tags=arch:r5900o32el
+        :avocado: tags=linux_user
+        :avocado: tags=quick
+        """
+        rootfs_url = ('https://raw.githubusercontent.com/philmd'
+                       '/qemu-testing-blob/bf6a300cf0bc56e4a2c5b/mips'
+                       '/ps2/ps2linux_live_v5_pal_netsurf_usb_busybox.tar.gz')
+        rootfs_hash = '9aa8fdd974cd3332c7167bceb6dd7137853d3a10'
+        rootfs_path_tgz = self.fetch_asset(rootfs_url, asset_hash=rootfs_hash)
+
+        archive.extract(rootfs_path_tgz, self.workdir)
+        busybox_path = self.workdir + "/bin/busybox"
+
+        self.add_ldpath(self.workdir)
+
+        res = self.run(busybox_path)
+        ver = 'BusyBox v0.60.5 (2010.06.06-16:16+0000) multi-call binary'
+        self.assertIn(ver, res.stderr_text)
+
+        res = self.run(busybox_path, ['uname', '-a'])
+        unm = 'mips64 unknown'
+        self.assertIn(unm, res.stdout_text)
-- 
2.26.2


