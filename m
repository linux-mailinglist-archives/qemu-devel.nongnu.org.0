Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CF451E3F3C
	for <lists+qemu-devel@lfdr.de>; Wed, 27 May 2020 12:38:47 +0200 (CEST)
Received: from localhost ([::1]:44998 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jdtSQ-0007Cm-5n
	for lists+qemu-devel@lfdr.de; Wed, 27 May 2020 06:38:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56228)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <Pavel.Dovgaluk@gmail.com>)
 id 1jdtLJ-0001YI-Ka
 for qemu-devel@nongnu.org; Wed, 27 May 2020 06:31:25 -0400
Received: from mail.ispras.ru ([83.149.199.45]:33660)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <Pavel.Dovgaluk@gmail.com>) id 1jdtLI-0001yK-Pr
 for qemu-devel@nongnu.org; Wed, 27 May 2020 06:31:25 -0400
Received: from [127.0.1.1] (unknown [62.118.151.149])
 by mail.ispras.ru (Postfix) with ESMTPSA id B08B8CD463;
 Wed, 27 May 2020 13:31:23 +0300 (MSK)
Subject: [PATCH v2 08/11] tests/acceptance: add record/replay test for m68k
From: Pavel Dovgalyuk <Pavel.Dovgaluk@gmail.com>
To: qemu-devel@nongnu.org
Date: Wed, 27 May 2020 13:31:23 +0300
Message-ID: <159057548345.16818.11231148033171120978.stgit@pasha-ThinkPad-X280>
In-Reply-To: <159057543840.16818.14393433996899521784.stgit@pasha-ThinkPad-X280>
References: <159057543840.16818.14393433996899521784.stgit@pasha-ThinkPad-X280>
User-Agent: StGit/0.17.1-dirty
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Received-SPF: softfail client-ip=83.149.199.45;
 envelope-from=Pavel.Dovgaluk@gmail.com; helo=mail.ispras.ru
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/05/27 06:30:39
X-ACL-Warn: Detected OS   = Linux 3.11 and newer
X-Spam_score_int: 7
X-Spam_score: 0.7
X-Spam_bar: /
X-Spam_report: (0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_ADSP_CUSTOM_MED=0.001,
 FORGED_GMAIL_RCVD=1, FREEMAIL_FROM=0.001, NML_ADSP_CUSTOM_MED=0.9,
 SPF_SOFTFAIL=0.665, URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
Cc: wrampazz@redhat.com, alex.bennee@linaro.org, dovgaluk@ispras.ru,
 pavel.dovgaluk@ispras.ru, crosa@redhat.com, pbonzini@redhat.com,
 philmd@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This patch adds a test for record/replay of the kernel
image boot for m68k platform.

Signed-off-by: Pavel Dovgalyuk <Pavel.Dovgaluk@ispras.ru>
---
 0 files changed

diff --git a/tests/acceptance/replay_kernel.py b/tests/acceptance/replay_kernel.py
index 7ac046b822..0d629d1ee7 100644
--- a/tests/acceptance/replay_kernel.py
+++ b/tests/acceptance/replay_kernel.py
@@ -150,3 +150,21 @@ class ReplayKernel(LinuxKernelUtils):
         kernel_command_line = self.KERNEL_COMMON_COMMAND_LINE + 'console=hvc0'
         console_pattern = 'Kernel command line: %s' % kernel_command_line
         self.run_rr(kernel_path, kernel_command_line, console_pattern)
+
+    def test_m68k_q800(self):
+        """
+        :avocado: tags=arch:m68k
+        :avocado: tags=machine:q800
+        """
+        deb_url = ('https://snapshot.debian.org/archive/debian-ports'
+                   '/20191021T083923Z/pool-m68k/main'
+                   '/l/linux/kernel-image-5.3.0-1-m68k-di_5.3.7-1_m68k.udeb')
+        deb_hash = '044954bb9be4160a3ce81f8bc1b5e856b75cccd1'
+        deb_path = self.fetch_asset(deb_url, asset_hash=deb_hash)
+        kernel_path = self.extract_from_deb(deb_path,
+                                            '/boot/vmlinux-5.3.0-1-m68k')
+
+        kernel_command_line = (self.KERNEL_COMMON_COMMAND_LINE +
+                               'console=ttyS0 vga=off')
+        console_pattern = 'No filesystem could mount root'
+        self.run_rr(kernel_path, kernel_command_line, console_pattern)


