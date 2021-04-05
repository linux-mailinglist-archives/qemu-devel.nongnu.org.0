Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 74FFD35430E
	for <lists+qemu-devel@lfdr.de>; Mon,  5 Apr 2021 16:56:52 +0200 (CEST)
Received: from localhost ([::1]:49902 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lTQep-0006Gq-Ic
	for lists+qemu-devel@lfdr.de; Mon, 05 Apr 2021 10:56:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42260)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cupertinomiranda@gmail.com>)
 id 1lTQHG-0001M3-BD
 for qemu-devel@nongnu.org; Mon, 05 Apr 2021 10:32:30 -0400
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436]:42549)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <cupertinomiranda@gmail.com>)
 id 1lTQHB-0001l0-Ts
 for qemu-devel@nongnu.org; Mon, 05 Apr 2021 10:32:30 -0400
Received: by mail-wr1-x436.google.com with SMTP id q26so5404072wrz.9
 for <qemu-devel@nongnu.org>; Mon, 05 Apr 2021 07:32:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=tN982wSTimgJQpbgAF5dTe88Jpv8iR9TuFZglHbAqQY=;
 b=uchPUxVpWgkeeCm0RoeMNpnBbcuSovNAy4bhfItKn7P6sB8A1pLn4WdtEuDbIPNViB
 9+x4nN8ITZpbrhnwI4OXR7e39hLJIijJadsoYbhwdQEUU2nQ/Q50z2aIsuFHrvEXrXyK
 MrAkUFrHm9EOCXBefBk2eYecffqu9h+g4e3w4HVEFIxI6w3LfsMdxGepXLKDygOZIf8q
 ayGk2QZoXcWntoulyBvRvw9UCB8pPC6eHPXG9wEl+h/WTP8dR1T9b0bVxc4Lz6jLmcl+
 VwKCzSdHxs8qj/cvVWELEMkttb4nH0x4IUT6F1Xkl622qoYglzMihC1KutDETCT0wq71
 TcYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=tN982wSTimgJQpbgAF5dTe88Jpv8iR9TuFZglHbAqQY=;
 b=seQzr/m/CMO2MFVi09kZFSTeCLDF7xrKFKCwIycvWqF85BJ9ihz/DGNXSiO7LfsgD4
 5ecETcwy+B+M/hqyC+w2/15KAXiJXm8l++dAhgTj1Pe5lxMO9GBzldqW0cDOAXNAcVSl
 sak+ymeAEqUYLRQvUb7ZPUZCNQ/PrzxUCpMfqjfSEKC5hgA9jTycLvHlELvIGDKfvZl3
 g0cAjEVbI9ASakRi+4g+m/0ruEEnk2Qus5yJo9xGRTeZ8LguvAOupeM2XACLXyRWg0Qb
 iU7pkfAfV2wSan2AKiItGWS/cIM7cMy2hqs1L7vAg6N8TLkJzw2guYKbkBoSFDpc+Kci
 pXFw==
X-Gm-Message-State: AOAM530pPLBvlsuFW8jL9vqJ1zVqMPQClAlih1Fimk8Qkx9gkrreDa58
 fGPUs+Th79KUhkY6Wnm9GYyuKyAsIMA3EA==
X-Google-Smtp-Source: ABdhPJz7rBMtq15Ge5QuefBp0/XacyrDVL09iMHmEA5A8wihBu+tn2xI62JaG4hAIfl1DqlBhOVtzQ==
X-Received: by 2002:a5d:5503:: with SMTP id b3mr6403600wrv.242.1617633144735; 
 Mon, 05 Apr 2021 07:32:24 -0700 (PDT)
Received: from cmiranda-laptop.localdomain (bl15-158-218.dsl.telepac.pt.
 [188.80.158.218])
 by smtp.gmail.com with ESMTPSA id k3sm8231552wrc.67.2021.04.05.07.32.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 05 Apr 2021 07:32:24 -0700 (PDT)
From: cupertinomiranda@gmail.com
To: qemu-devel@nongnu.org
Subject: [PATCH 16/27] tests/acceptance: ARC: Add linux boot testing.
Date: Mon,  5 Apr 2021 15:31:27 +0100
Message-Id: <20210405143138.17016-17-cupertinomiranda@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210405143138.17016-1-cupertinomiranda@gmail.com>
References: <20210405143138.17016-1-cupertinomiranda@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=cupertinomiranda@gmail.com; helo=mail-wr1-x436.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: shahab@synopsys.com, linux-snps-arc@lists.infradead.org,
 claziss@synopsys.com, cmiranda@synopsys.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Cupertino Miranda <cmiranda@synopsys.com>

Just an acceptance test with ARC Linux booting.

Signed-off-by: Cupertino Miranda <cmiranda@synopsys.com>
---
 tests/acceptance/boot_linux_console.py | 55 ++++++++++++++++++++++++++
 1 file changed, 55 insertions(+)

diff --git a/tests/acceptance/boot_linux_console.py b/tests/acceptance/boot_linux_console.py
index 1ca32ecf25..b5a781b6b4 100644
--- a/tests/acceptance/boot_linux_console.py
+++ b/tests/acceptance/boot_linux_console.py
@@ -138,6 +138,26 @@ def test_mips_malta(self):
         console_pattern = 'Kernel command line: %s' % kernel_command_line
         self.wait_for_console_pattern(console_pattern)
 
+    def test_mips_malta(self):
+        """
+        :avocado: tags=arch:arc
+        """
+        deb_url = ('http://snapshot.debian.org/archive/debian/'
+                   '20130217T032700Z/pool/main/l/linux-2.6/'
+                   'linux-image-2.6.32-5-4kc-malta_2.6.32-48_mips.deb')
+        deb_hash = 'a8cfc28ad8f45f54811fc6cf74fc43ffcfe0ba04'
+        deb_path = self.fetch_asset(deb_url, asset_hash=deb_hash)
+        kernel_path = self.extract_from_deb(deb_path,
+                                            '/boot/vmlinux-archs')
+
+        self.vm.set_console()
+        kernel_command_line = self.KERNEL_COMMON_COMMAND_LINE + 'console=ttyS0'
+        self.vm.add_args('-kernel', kernel_path,
+                         '-append', kernel_command_line)
+        self.vm.launch()
+        console_pattern = 'Kernel command line: %s' % kernel_command_line
+        self.wait_for_console_pattern(console_pattern)
+
     def test_mips64el_malta(self):
         """
         This test requires the ar tool to extract "data.tar.gz" from
@@ -966,6 +986,17 @@ def test_alpha_clipper(self):
         console_pattern = 'Kernel command line: %s' % kernel_command_line
         self.wait_for_console_pattern(console_pattern)
 
+    def do_test_arc(self, kernel_name, console=0):
+        tar_url = ('https://github.com/cupertinomiranda/arc-qemu-resources/archive/master.tar.gz')
+        file_path = self.fetch_asset(tar_url)
+        archive.extract(file_path, self.workdir)
+
+        self.vm.set_console(console_index=console)
+        self.vm.add_args('-kernel',
+                         self.workdir + '/' + kernel_name)
+        self.vm.launch()
+        self.wait_for_console_pattern('QEMU advent calendar')
+
     def test_m68k_q800(self):
         """
         :avocado: tags=arch:m68k
@@ -1086,3 +1117,27 @@ def test_xtensa_lx60(self):
         tar_hash = '49e88d9933742f0164b60839886c9739cb7a0d34'
         self.vm.add_args('-cpu', 'dc233c')
         self.do_test_advcal_2018('02', tar_hash, 'santas-sleigh-ride.elf')
+
+    timeout = 240
+    def test_arc_virt(self):
+        """
+        :avocado: tags=arch:arc
+        :avocado: tags=machine:virt
+        """
+
+        tar_url = ('https://github.com/cupertinomiranda/'
+                   'arc-qemu-resources/archive/master.tar.gz')
+        file_path = self.fetch_asset(tar_url)
+        archive.extract(file_path, self.workdir)
+
+        kernel_path = self.workdir + '/arc-qemu-resources-master/vmlinux_archs'
+
+        self.vm.set_console()
+        kernel_command_line = (self.KERNEL_COMMON_COMMAND_LINE)
+        self.vm.add_args('-kernel', kernel_path)
+        self.vm.add_args('-device', 'virtio-net-device,netdev=net0')
+        self.vm.add_args('-netdev', 'user,id=net0,hostfwd=tcp::5558-:21,hostfwd=tcp::5557-:23')
+        self.vm.launch()
+
+        console_pattern = 'Welcome to Buildroot'
+        self.wait_for_console_pattern(console_pattern)
-- 
2.20.1


