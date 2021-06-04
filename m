Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5393939BF64
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Jun 2021 20:12:51 +0200 (CEST)
Received: from localhost ([::1]:55364 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lpEJO-0004fS-Cv
	for lists+qemu-devel@lfdr.de; Fri, 04 Jun 2021 14:12:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38662)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1lpEGV-000176-EU
 for qemu-devel@nongnu.org; Fri, 04 Jun 2021 14:09:51 -0400
Received: from smtp-out2.suse.de ([195.135.220.29]:52642)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1lpEGS-0000lc-Hw
 for qemu-devel@nongnu.org; Fri, 04 Jun 2021 14:09:51 -0400
Received: from imap.suse.de (imap-alt.suse-dmz.suse.de [192.168.254.47])
 (using TLSv1.2 with cipher ECDHE-ECDSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 6B9FB1FD47;
 Fri,  4 Jun 2021 18:09:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1622830187; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=t/CFClYqrFXR8F8FDCj/sYttFkBajfb4rlQduic3Yss=;
 b=H9n8Dei39s6amYYPGG8LnunB/hbe1JMO8ilP5dKtPsjZxxGkybBTkeViRIEPD/NTlVvOFU
 RrJ2QO//U5ZqTR/njCaRA7qTnUIvLA/+AbfFHvpYyeiIDHyJ0h87LHAQG92AdXW0cDTLTx
 1BUwXF+QcoIJmjb2jxEXBGl6H4NwuEc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1622830187;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=t/CFClYqrFXR8F8FDCj/sYttFkBajfb4rlQduic3Yss=;
 b=XK9KwCppE9MBoAD5T6eeLsgO3xB+B55NHeVHGA9BbD9YDlmHh+Xj1mCJIBJO6l9n69ErTQ
 Xe+6Jl+kWOypxCCg==
Received: from imap3-int (imap-alt.suse-dmz.suse.de [192.168.254.47])
 by imap.suse.de (Postfix) with ESMTP id 1A45F118DD;
 Fri,  4 Jun 2021 18:09:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1622830187; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=t/CFClYqrFXR8F8FDCj/sYttFkBajfb4rlQduic3Yss=;
 b=H9n8Dei39s6amYYPGG8LnunB/hbe1JMO8ilP5dKtPsjZxxGkybBTkeViRIEPD/NTlVvOFU
 RrJ2QO//U5ZqTR/njCaRA7qTnUIvLA/+AbfFHvpYyeiIDHyJ0h87LHAQG92AdXW0cDTLTx
 1BUwXF+QcoIJmjb2jxEXBGl6H4NwuEc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1622830187;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=t/CFClYqrFXR8F8FDCj/sYttFkBajfb4rlQduic3Yss=;
 b=XK9KwCppE9MBoAD5T6eeLsgO3xB+B55NHeVHGA9BbD9YDlmHh+Xj1mCJIBJO6l9n69ErTQ
 Xe+6Jl+kWOypxCCg==
Received: from director2.suse.de ([192.168.254.72]) by imap3-int with ESMTPSA
 id UMnhBGtsumC8TwAALh3uQQ
 (envelope-from <cfontana@suse.de>); Fri, 04 Jun 2021 18:09:47 +0000
From: Claudio Fontana <cfontana@suse.de>
To: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Cleber Rosa Junior <crosa@redhat.com>
Subject: [PATCH v1 2/2] tests/acceptance: add OVMF firmware test to cover
 x86_64 "host" cpu bug
Date: Fri,  4 Jun 2021 20:09:45 +0200
Message-Id: <20210604180945.9330-3-cfontana@suse.de>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210604180945.9330-1-cfontana@suse.de>
References: <20210604180945.9330-1-cfontana@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=195.135.220.29; envelope-from=cfontana@suse.de;
 helo=smtp-out2.suse.de
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Vitaly Kuznetsov <vkuznets@redhat.com>,
 Claudio Fontana <cfontana@suse.de>, Eduardo Habkost <ehabkost@redhat.com>,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

recent refactoring of i386 broke OVMF firmware with a wrong initialization
order for host cpu. This test covers this issue for potential regressions.

For the actual fixes, see:
commit ("i386: run accel_cpu_instance_init as post_init"),
commit ("i386: reorder call to cpu_exec_realizefn"),

Cc: Eduardo Habkost <ehabkost@redhat.com>
Cc: Vitaly Kuznetsov <vkuznets@redhat.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>
Signed-off-by: Claudio Fontana <cfontana@suse.de>
---
 tests/acceptance/boot_ovmf_fc33.py | 75 ++++++++++++++++++++++++++++++
 1 file changed, 75 insertions(+)
 create mode 100644 tests/acceptance/boot_ovmf_fc33.py

diff --git a/tests/acceptance/boot_ovmf_fc33.py b/tests/acceptance/boot_ovmf_fc33.py
new file mode 100644
index 0000000000..c0c4e0e394
--- /dev/null
+++ b/tests/acceptance/boot_ovmf_fc33.py
@@ -0,0 +1,75 @@
+# Functional test that boots OVMF firmware with cpu host.
+#
+# This test was added to capture x86 "host" cpu initialization and realization
+# ordering problems.
+#
+# Copyright (c) 2021 SUSE LLC
+#
+# Author:
+#  Claudio Fontana <cfontana@suse.de>
+#
+# This work is licensed under the terms of the GNU GPL, version 2 or
+# later.  See the COPYING file in the top-level directory.
+
+import os
+import time
+
+from avocado_qemu import Test
+from avocado_qemu import extract_from_rpm
+from avocado_qemu import wait_for_console_pattern
+from avocado.utils import process
+from avocado.utils.path import find_command, CmdNotFoundError
+
+class FirmwareTest(Test):
+    def wait_for_firmware_message(self, success_message):
+        wait_for_console_pattern(self, success_message, failure_message=None)
+
+class BootOVMF(FirmwareTest):
+    """
+    Boots OVMF secureboot and checks for a specific message.
+    If we do not see the message, it's an ERROR that we express via a timeout.
+    """
+    timeout = 10
+
+    def test_cpu_host_x86(self):
+        """
+        :avocado: tags=arch:x86_64
+        :avocado: tags=machine:q35
+        :avocado: tags=cpu:host
+        :avocado: tags=accel:kvm
+        """
+        self.require_accelerator("kvm")
+
+        rpm_url = ('https://download-ib01.fedoraproject.org/'
+                   'pub/fedora/linux/updates/33/Everything/x86_64/Packages/e/'
+                   'edk2-ovmf-20200801stable-3.fc33.noarch.rpm')
+        rpm_hash = '45e1001313dc2deed9b41a532ef090682a11ccd1'
+        rpm_path = self.fetch_asset(rpm_url, asset_hash=rpm_hash)
+
+        # Note the use of "./" at the beginning of the paths in the rpm,
+        # it is not an accident, see extract_from_rpm in avocado_qemu/
+
+        ovmf_code_sec = extract_from_rpm(self, rpm_path,
+                                  './usr/share/edk2/ovmf/OVMF_CODE.secboot.fd')
+        ovmf_vars_sec = extract_from_rpm(self, rpm_path,
+                                  './usr/share/edk2/ovmf/OVMF_VARS.secboot.fd')
+
+        # at this point the ovmf code should be reachable in the tmp dir; we
+        # can use this sleep to debug issues with the extraction above.
+        #time.sleep(3600)
+
+        self.vm.set_console()
+        self.vm.add_args(
+            '-accel', 'kvm',
+            '-cpu', 'host',
+            '-machine', 'q35,smm=on',
+            '-m', '4G',
+            '-drive',
+               'if=pflash,format=raw,readonly=on,unit=0,file=' + ovmf_code_sec,
+            '-drive',
+               'if=pflash,format=raw,unit=1,file=' + ovmf_vars_sec,
+            '-display', 'none',
+            '-serial', 'stdio')
+        self.vm.launch()
+        console_pattern = 'BdsDxe: failed to load Boot0001'
+        self.wait_for_firmware_message(success_message=console_pattern);
-- 
2.26.2


