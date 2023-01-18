Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C4ED9671856
	for <lists+qemu-devel@lfdr.de>; Wed, 18 Jan 2023 10:59:29 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pI5Cr-000295-TW; Wed, 18 Jan 2023 04:58:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pI5Cp-00027O-W3
 for qemu-devel@nongnu.org; Wed, 18 Jan 2023 04:58:08 -0500
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pI5Co-00061r-1G
 for qemu-devel@nongnu.org; Wed, 18 Jan 2023 04:58:07 -0500
Received: by mail-wr1-x433.google.com with SMTP id b5so12175746wrn.0
 for <qemu-devel@nongnu.org>; Wed, 18 Jan 2023 01:58:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=oaRo0GU0CDZsZLHw/XFQ9FNLJtHubTjXB+uAlLi3+pE=;
 b=vkaqV3prQ62srRNEwW6iAbQUyoKaesap+TeKhhjSkxRNadLWVskerWWMVFncsxqj5J
 e41cyWKrHSqmrrcHO6/q4f3ZXcIN72Oq0ixFTsJewODRuB5JV2DJ18GUb9o59kzTM1qo
 5lKNaORSJVl35GxFQf0+lk9VWE8HRO93IDk+wAYd3piAOOr+ygBS10bqiq+jhpd0MGq0
 ZCPLG2K9FXRX89rcUhLnxSOagGu79/O/ZsleffTcZ/tVKvF5A2r+PvEWKKaxQk2g8zGk
 SE55PHmGxhxGoXMI9+F98No6MA0ThXVxcQkk96j5PcC6AsuBIGvLsmaePyxFPYoSBL8B
 dU0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=oaRo0GU0CDZsZLHw/XFQ9FNLJtHubTjXB+uAlLi3+pE=;
 b=YnQMxV5/87qeEIWH63Brp4IQKYAnWLsYDUAWQm5+w4uwq1RXjdMcimsAUztY9jVrrZ
 wd85GMXzQe41tlT62mIKVh3WD9j0DhuozSUp33WFIPQzgdy9W56UweA7yp6MkZuasGDy
 F1MEZ3fTLm5emfjydpJvHEb50NFxoibuOtftTKkSR6zY9DVFMH6M9JGxfOJ+xwUEhYY1
 AksOiiF6mEMtOZbgzfUNtXGa89TWFrACw3JW9jFU7rEQvn5vf4QRQb45Fa2v5gPoA1Gx
 yNUfqNSw36Cqxds3Ie5lpWXomFPuj7WJz02MlyohSQUnu95nHJBkz2XyvjvzvUWfYShj
 /Ivg==
X-Gm-Message-State: AFqh2kpjtHzkJ+8aCClxutcEKmEk3pa8Z3QeL/tjqE6PmyA2WwfpLoma
 KBTIZ3msFl1472ULiG0Oc2a/exdl/H0ZPMhq
X-Google-Smtp-Source: AMrXdXtJbzEYt7WqRgC1jS4CglFRUpWC7qjfaBmJH9Pz4fBW4BKtUdU3uqYt2P5MHt7OTR5EJQ2BZA==
X-Received: by 2002:a05:6000:98d:b0:25f:8ead:96cc with SMTP id
 by13-20020a056000098d00b0025f8ead96ccmr5701460wrb.70.1674035883720; 
 Wed, 18 Jan 2023 01:58:03 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 c6-20020adffb06000000b002423620d356sm10761161wrr.35.2023.01.18.01.58.02
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 18 Jan 2023 01:58:03 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Jiaxun Yang <jiaxun.yang@flygoat.com>, Klaus Jensen <its@irrelevant.dk>,
 Aurelien Jarno <aurelien@aurel32.net>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Beraldo Leal <bleal@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Cleber Rosa <crosa@redhat.com>
Subject: [PATCH v2 2/2] tests/avocado: Add test accessing NVMe on big-endian
 MIPS target
Date: Wed, 18 Jan 2023 10:57:51 +0100
Message-Id: <20230118095751.49728-3-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230118095751.49728-1-philmd@linaro.org>
References: <20230118095751.49728-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x433.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Add a Linux-boot test accessing PCI NVMe drive on big-endian MIPS:

$ avocado --show=app,console run -t device:nvme tests/avocado/
   (1/1) tests/avocado/boot_linux_console.py:BootLinuxConsole.test_mips64_malta_I6400_nvme:
  console: Linux version 6.2.0-rc4 (kbj@butter) (mips64-buildroot-linux-gnu-gcc.br_real (Buildroot 2022.11) 11.3.0, GNU ld (GNU Binutils) 2.38) #6 Tue Jan 17 18:48:25 CET 2023
  console: CPU0 revision is: 0001a900 (MIPS I6400)
  console: FPU revision is: 20f30300
  console: MIPS: machine is mti,malta
  ...
  console: PCI host bridge to bus 0000:00
  console: pci_bus 0000:00: root bus resource [mem 0x10000000-0x17ffffff]
  console: pci_bus 0000:00: root bus resource [io  0x1000-0x1fffff]
  console: pci_bus 0000:00: No busn resource found for root bus, will use [bus 00-ff]
  console: pci 0000:00:0a.0: [8086:7110] type 00 class 0x060100
  console: pci 0000:00:0a.1: [8086:7111] type 00 class 0x010180
  console: pci 0000:00:0a.1: reg 0x20: [io  0x0000-0x000f]
  console: pci 0000:00:0a.1: legacy IDE quirk: reg 0x10: [io  0x01f0-0x01f7]
  console: pci 0000:00:0a.1: legacy IDE quirk: reg 0x14: [io  0x03f6]
  console: pci 0000:00:0a.1: legacy IDE quirk: reg 0x18: [io  0x0170-0x0177]
  console: pci 0000:00:0a.1: legacy IDE quirk: reg 0x1c: [io  0x0376]
  console: pci 0000:00:0a.2: [8086:7112] type 00 class 0x0c0300
  console: pci 0000:00:12.0: [1b36:0010] type 00 class 0x010802
  console: pci 0000:00:12.0: reg 0x10: [mem 0x00000000-0x00003fff 64bit]
  console: pci_bus 0000:00: busn_res: [bus 00-ff] end is updated to 00
  console: pci 0000:00:12.0: BAR 0: assigned [mem 0x10040000-0x10043fff 64bit]
  console: pci 0000:00:0a.1: BAR 4: assigned [io  0x1080-0x108f]
  ...
  console: ata_piix 0000:00:0a.1: enabling device (0000 -> 0001)
  console: nvme nvme0: pci function 0000:00:12.0
  console: nvme 0000:00:12.0: enabling device (0000 -> 0002)
  console: nvme nvme0: 1/0/0 default/read/poll queues
  console: nvme nvme0: Ignoring bogus Namespace Identifiers
  ...
  console: Run /sbin/init as init process
  console: EXT4-fs (nvme0n1): re-mounted bf659b11-5a77-4ab5-a337-3d71ced26114. Quota mode: disabled.
  ...
  console: Welcome to Buildroot
  console: buildroot login: root
  ...
  console: # reboot
  ...
  console: umount: devtmpfs busy - remounted read-only
  console: EXT4-fs (nvme0n1): re-mounted bf659b11-5a77-4ab5-a337-3d71ced26114. Quota mode: disabled.
  console: The system is going down NOW!
  console: Requesting system reboot
  console: reboot: Restarting system
  PASS (11.17 s)
  JOB TIME   : 11.91 s

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 tests/avocado/boot_linux_console.py | 44 +++++++++++++++++++++++++++++
 1 file changed, 44 insertions(+)

diff --git a/tests/avocado/boot_linux_console.py b/tests/avocado/boot_linux_console.py
index 8c1d981586..176793482e 100644
--- a/tests/avocado/boot_linux_console.py
+++ b/tests/avocado/boot_linux_console.py
@@ -12,6 +12,7 @@
 import lzma
 import gzip
 import shutil
+import time
 
 from avocado import skip
 from avocado import skipUnless
@@ -269,6 +270,49 @@ def test_mips64el_malta_5KEc_cpio(self):
         # Wait for VM to shut down gracefully
         self.vm.wait()
 
+    @skipUnless(os.getenv('AVOCADO_ALLOW_UNTRUSTED_CODE'), 'untrusted code')
+    def test_mips64_malta_I6400_nvme(self):
+        """
+        :avocado: tags=arch:mips64
+        :avocado: tags=machine:malta
+        :avocado: tags=endian:big
+        :avocado: tags=cpu:I6400
+        :avocado: tags=device:nvme
+        """
+        kernel_url = ('https://github.com/birkelund/qemu-nvme-boot/'
+                      'raw/main/mips64/images/vmlinux')
+        kernel_hash = '665662d7f7b17dc261ffb0e0ff4a1a7da91de948'
+        kernel_path = self.fetch_asset(kernel_url, asset_hash=kernel_hash)
+        rootfs_url = ('https://github.com/birkelund/qemu-nvme-boot/'
+                      'raw/main/mips64/images/rootfs.ext2.gz')
+        rootfs_hash = '66f5ca4ef20ab983ec424c3ed8462bab305bbb73'
+        rootfs_path_gz = self.fetch_asset(rootfs_url, asset_hash=rootfs_hash)
+        rootfs_path = os.path.join(self.workdir, "rootfs.ext2")
+        archive.gzip_uncompress(rootfs_path_gz, rootfs_path)
+
+        self.vm.set_console()
+        kernel_command_line = (self.KERNEL_COMMON_COMMAND_LINE
+                               + 'console=ttyS0,115200 '
+                               + 'root=/dev/nvme0n1 '
+                               + 'rdinit=/sbin/init noreboot')
+        self.vm.add_args('-kernel', kernel_path,
+                         '-append', kernel_command_line,
+                         '-drive',
+                                f'file={rootfs_path},format=raw,if=none,id=d0',
+                         '-device', 'nvme,serial=default,drive=d0',
+                         '-nic', 'user,model=pcnet',
+                         '-no-reboot', '-snapshot', '-nodefaults')
+        self.vm.launch()
+        wait_for_console_pattern(self, 'Welcome to Buildroot')
+        time.sleep(0.1)
+        exec_command(self, 'root')
+        time.sleep(0.1)
+
+        exec_command_and_wait_for_pattern(self, 'cat /proc/cpuinfo',
+                                                'MIPS I6400')
+        exec_command_and_wait_for_pattern(self, 'reboot',
+                                                'reboot: Restarting system')
+
     def do_test_mips_malta32el_nanomips(self, kernel_url, kernel_hash):
         kernel_path_xz = self.fetch_asset(kernel_url, asset_hash=kernel_hash)
         kernel_path = self.workdir + "kernel"
-- 
2.38.1


