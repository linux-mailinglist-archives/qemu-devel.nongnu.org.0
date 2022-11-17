Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 62E8862E30E
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Nov 2022 18:30:23 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ovieD-0006Nt-59; Thu, 17 Nov 2022 12:25:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ovidu-0006HO-3l
 for qemu-devel@nongnu.org; Thu, 17 Nov 2022 12:25:38 -0500
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ovidr-0006DU-CZ
 for qemu-devel@nongnu.org; Thu, 17 Nov 2022 12:25:37 -0500
Received: by mail-wr1-x429.google.com with SMTP id bs21so4977417wrb.4
 for <qemu-devel@nongnu.org>; Thu, 17 Nov 2022 09:25:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=TUmxKKupzWW40b+PE4O2JXEtmFVLtKng4SrYWCxYHqo=;
 b=DegIAvdQiHWEZQiTfemoqQ0Gpyp1faaDm5g7reLzxrMBiKw0AoB277uXcEqjInqJnt
 L+En6UpTlL+kbZbkyI522UBzi+GXmzcQ4DpD3st3iyzse2JyLd02xIBKGDUsrBOHm/J/
 I/KMdNthDw4JiCVaQ1JrnJ27XI7gMzlaTmFxnSeMaecO2tzJsimmAg0NVgK9aHYx1XGJ
 89IvG+8rOg5OcOat1TbyIiW/W5Nmu4j4C6ax953gHLo8os8mnEX42vShbJ5cZqUBwzHk
 9vnIeaMOyQ6BfD5RwFOL5Z6czCcATF+KS2f+dM9SeALD/RZ34AieA2n9tDlB5ZqPM8y7
 fivA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=TUmxKKupzWW40b+PE4O2JXEtmFVLtKng4SrYWCxYHqo=;
 b=BPCS9upQkf/CVhOK8WZfLAZ7XTVdM26rQ2/jNYBQeK1vSTPuDC+r96YQ6Yg1ysMaZa
 eoyqR3NCpER8JhFyIzr5lzqyZTusF267E/0skv1men+euHddyi6J4VOrdR4bZWAZNl5S
 p+qCw6m9RcknfmZTihH+LLqCmmD6KkRXUHJRIF8pEDOD9lp4g6TZpYgM7jZ3d8ZqwikP
 PLeGpLM81h90Dxnq9QWv7/MROgabsHhV6HFEPFLMGDgsFaFadQn0IL07Bmg6ioibdvfe
 3N0KhI251xB1+WfIHQQaKUipJcEm4PRJJBssnxKBEetijkz1J8qx05LHh7fZsWbr/4by
 2zsA==
X-Gm-Message-State: ANoB5pldWtBP9PlzQjVpCe+UdkyOkzxwjldqWI5a9diVGqnNAX7K+fSA
 nwbWXgAyprOV1DyMSs1kJjz2JA==
X-Google-Smtp-Source: AA0mqf4YxERPpTjonbWiWPFiKw8CfDWDHgirNOPOL2lqCsi9KUFVLFtVzNsho/yJuwByOLM1fCeDIw==
X-Received: by 2002:a5d:4c4d:0:b0:235:25b7:5084 with SMTP id
 n13-20020a5d4c4d000000b0023525b75084mr2119232wrt.135.1668705933801; 
 Thu, 17 Nov 2022 09:25:33 -0800 (PST)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 l24-20020a05600c1d1800b003cf878c4468sm7265846wms.5.2022.11.17.09.25.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Nov 2022 09:25:33 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 0A7BE1FFBA;
 Thu, 17 Nov 2022 17:25:33 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: fam@euphon.net, berrange@redhat.com, f4bug@amsat.org, aurelien@aurel32.net,
 pbonzini@redhat.com, stefanha@redhat.com, crosa@redhat.com,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>
Subject: [PATCH v3 02/13] tests/avocado/machine_aspeed.py: Reduce noise on the
 console for SDK tests
Date: Thu, 17 Nov 2022 17:25:21 +0000
Message-Id: <20221117172532.538149-3-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221117172532.538149-1-alex.bennee@linaro.org>
References: <20221117172532.538149-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x429.google.com
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

From: Cédric Le Goater <clg@kaod.org>

The Aspeed SDK images are based on OpenBMC which starts a lot of
services. The output noise on the console can break from time to time
the test waiting for the logging prompt.

Change the U-Boot bootargs variable to add "quiet" to the kernel
command line and reduce the output volume. This also drops the test on
the CPU id which was nice to have but not essential.

Signed-off-by: Cédric Le Goater <clg@kaod.org>
Message-Id: <20221104075347.370503-1-clg@kaod.org>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20221111145529.4020801-4-alex.bennee@linaro.org>
---
 tests/avocado/machine_aspeed.py | 17 ++++++++++++-----
 1 file changed, 12 insertions(+), 5 deletions(-)

diff --git a/tests/avocado/machine_aspeed.py b/tests/avocado/machine_aspeed.py
index fba6527026..1fc385e1c8 100644
--- a/tests/avocado/machine_aspeed.py
+++ b/tests/avocado/machine_aspeed.py
@@ -12,6 +12,7 @@
 from avocado_qemu import wait_for_console_pattern
 from avocado_qemu import exec_command
 from avocado_qemu import exec_command_and_wait_for_pattern
+from avocado_qemu import interrupt_interactive_console_until_pattern
 from avocado.utils import archive
 from avocado import skipIf
 
@@ -182,6 +183,8 @@ def test_arm_ast2600_evb_buildroot(self):
 
 class AST2x00MachineSDK(QemuSystemTest):
 
+    EXTRA_BOOTARGS = ' quiet'
+
     # FIXME: Although these tests boot a whole distro they are still
     # slower than comparable machine models. There may be some
     # optimisations which bring down the runtime. In the meantime they
@@ -194,7 +197,7 @@ def wait_for_console_pattern(self, success_message, vm=None):
                                  failure_message='Kernel panic - not syncing',
                                  vm=vm)
 
-    def do_test_arm_aspeed_sdk_start(self, image, cpu_id):
+    def do_test_arm_aspeed_sdk_start(self, image):
         self.require_netdev('user')
         self.vm.set_console()
         self.vm.add_args('-drive', 'file=' + image + ',if=mtd,format=raw',
@@ -202,9 +205,13 @@ def do_test_arm_aspeed_sdk_start(self, image, cpu_id):
         self.vm.launch()
 
         self.wait_for_console_pattern('U-Boot 2019.04')
-        self.wait_for_console_pattern('## Loading kernel from FIT Image')
+        interrupt_interactive_console_until_pattern(
+            self, 'Hit any key to stop autoboot:', 'ast#')
+        exec_command_and_wait_for_pattern(
+            self, 'setenv bootargs ${bootargs}' + self.EXTRA_BOOTARGS, 'ast#')
+        exec_command_and_wait_for_pattern(
+            self, 'boot', '## Loading kernel from FIT Image')
         self.wait_for_console_pattern('Starting kernel ...')
-        self.wait_for_console_pattern('Booting Linux on physical CPU ' + cpu_id)
 
     @skipIf(os.getenv('GITLAB_CI'), 'Running on GitLab')
     def test_arm_ast2500_evb_sdk(self):
@@ -221,7 +228,7 @@ def test_arm_ast2500_evb_sdk(self):
         archive.extract(image_path, self.workdir)
 
         self.do_test_arm_aspeed_sdk_start(
-            self.workdir + '/ast2500-default/image-bmc', '0x0')
+            self.workdir + '/ast2500-default/image-bmc')
         self.wait_for_console_pattern('ast2500-default login:')
 
     @skipIf(os.getenv('GITLAB_CI'), 'Running on GitLab')
@@ -243,7 +250,7 @@ def test_arm_ast2600_evb_sdk(self):
         self.vm.add_args('-device',
                          'ds1338,bus=aspeed.i2c.bus.5,address=0x32');
         self.do_test_arm_aspeed_sdk_start(
-            self.workdir + '/ast2600-default/image-bmc', '0xf00')
+            self.workdir + '/ast2600-default/image-bmc')
         self.wait_for_console_pattern('ast2600-default login:')
         exec_command_and_wait_for_pattern(self, 'root', 'Password:')
         exec_command_and_wait_for_pattern(self, '0penBmc', 'root@ast2600-default:~#')
-- 
2.34.1


