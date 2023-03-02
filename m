Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C14F66A8945
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Mar 2023 20:14:02 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pXoLn-0000Jr-BI; Thu, 02 Mar 2023 14:12:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcin.juszkiewicz@linaro.org>)
 id 1pXoLW-0008PO-55; Thu, 02 Mar 2023 14:12:06 -0500
Received: from muminek.juszkiewicz.com.pl ([213.251.184.221])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcin.juszkiewicz@linaro.org>)
 id 1pXoLU-0006jN-CK; Thu, 02 Mar 2023 14:12:05 -0500
Received: from localhost (localhost [127.0.0.1])
 by muminek.juszkiewicz.com.pl (Postfix) with ESMTP id 89055260167;
 Thu,  2 Mar 2023 20:12:02 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at juszkiewicz.com.pl
Received: from muminek.juszkiewicz.com.pl ([127.0.0.1])
 by localhost (muminek.juszkiewicz.com.pl [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id SznqlDZupR5i; Thu,  2 Mar 2023 20:11:56 +0100 (CET)
Received: from puchatek.lan (83.11.36.13.ipv4.supernova.orange.pl
 [83.11.36.13])
 by muminek.juszkiewicz.com.pl (Postfix) with ESMTPSA id 550682606A3;
 Thu,  2 Mar 2023 20:11:52 +0100 (CET)
From: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
To: Radoslaw Biernacki <rad@semihalf.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Leif Lindholm <quic_llindhol@quicinc.com>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
Subject: [PATCH 3/3] tests/avocado: add Alpine Linux boot on AArch64/sbsa-ref
Date: Thu,  2 Mar 2023 20:11:46 +0100
Message-Id: <20230302191146.1790560-3-marcin.juszkiewicz@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230302191146.1790560-1-marcin.juszkiewicz@linaro.org>
References: <20230302191146.1790560-1-marcin.juszkiewicz@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: softfail client-ip=213.251.184.221;
 envelope-from=marcin.juszkiewicz@linaro.org; helo=muminek.juszkiewicz.com.pl
X-Spam_score_int: -11
X-Spam_score: -1.2
X-Spam_bar: -
X-Spam_report: (-1.2 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_SOFTFAIL=0.665 autolearn=no autolearn_force=no
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

To unify tests for AArch64/virt and AArch64/sbsa-ref we boot
same Alpine Linux image on both.

Signed-off-by: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
---
 tests/avocado/machine_aarch64_sbsaref.py | 29 ++++++++++++++++++++++++
 1 file changed, 29 insertions(+)

diff --git a/tests/avocado/machine_aarch64_sbsaref.py b/tests/avocado/machine_aarch64_sbsaref.py
index e36e53d4d5..fdbde4b891 100644
--- a/tests/avocado/machine_aarch64_sbsaref.py
+++ b/tests/avocado/machine_aarch64_sbsaref.py
@@ -148,3 +148,32 @@ def test_sbsaref_linux_max(self):
         :avocado: tags=cpu:max
         """
         self.boot_linux('max')
+
+    # This tests the whole boot chain from EFI to Userspace
+    # We only boot a whole OS for the current top level CPU and GIC
+    # Other test profiles should use more minimal boots
+    def test_alpine_sbsaref_max(self):
+        """
+        :avocado: tags=arch:aarch64
+        :avocado: tags=machine:sbsa-ref
+        """
+        self.fetch_firmware()
+
+        iso_url = ('https://dl-cdn.alpinelinux.org/'
+                   'alpine/v3.17/releases/aarch64/'
+                   'alpine-standard-3.17.2-aarch64.iso')
+
+        # Alpine use sha256 so I recalculated this myself
+        iso_sha1 = '76284fcd7b41fe899b0c2375ceb8470803eea839'
+        iso_path = self.fetch_asset(iso_url, asset_hash=iso_sha1)
+
+        self.vm.set_console()
+        self.vm.add_args("-cpu", "max,pauth-impdef=on")
+        self.vm.add_args("-machine", "sbsa-ref")
+        self.vm.add_args("-drive", f"file={iso_path},format=raw")
+        self.vm.add_args('-device', 'virtio-rng-pci,rng=rng0')
+        self.vm.add_args('-object', 'rng-random,id=rng0,filename=/dev/urandom')
+
+        self.vm.launch()
+        wait_for_console_pattern(self, 'Welcome to Alpine Linux 3.17')
+
-- 
2.39.2


