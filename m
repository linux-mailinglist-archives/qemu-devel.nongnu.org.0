Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A3B686F08B4
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Apr 2023 17:49:50 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ps3oh-0002Eu-WC; Thu, 27 Apr 2023 11:45:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ps3o8-0001qC-0x
 for qemu-devel@nongnu.org; Thu, 27 Apr 2023 11:45:20 -0400
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ps3o5-0004ko-Dr
 for qemu-devel@nongnu.org; Thu, 27 Apr 2023 11:45:19 -0400
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-3f1950f5676so75277875e9.3
 for <qemu-devel@nongnu.org>; Thu, 27 Apr 2023 08:45:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1682610314; x=1685202314;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=5NIko2Gkapa67pYfAhG5iuG1fjGYEcV1kfLWbhJ/29M=;
 b=R/YfWNF7TxvKeV1Jam9mUpdUzX5F/j8f3yUjjo5v1YTiKoGQLZzgqNO+J5bMlzdgaX
 KNYx6dzjxxWNl/Vx15ZP4YACRo7lUxJlKyOBlWnmgLlA0QgV1e1E/ivQAgo35chPEcBD
 83qMLNRouxUx+uX6+bq0G1HsEIsNXNJiu2mqJY24SawKiUE7eQFX2JHZdibyA3PiW+XP
 lKEACrJBlGT/zl37JyjtW5TKTtCJN0zwrt+1hnJ8P/24TGdxYANRqaYmbM+AJFbiGSCB
 kmT2M/QdLlKMWJOagyXLAPHV4KejDecex24vvujwUuPX/bYjsr4Zp0x9Q+rtl6qsZRzs
 kUxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682610314; x=1685202314;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=5NIko2Gkapa67pYfAhG5iuG1fjGYEcV1kfLWbhJ/29M=;
 b=V6/2MFLALYQOVJ8wdD18WPTvUb7GGXPcZyKMnBTW7QXkCR8fManufw+YwrT2vicUy7
 RC8NUfG5BmUC+62Dw/PvNue4/Xe9oR1qzhomitnplw5aGQby+Xsa/U5NutBODa9OEPo9
 sQ1mZFa9WGg6wb75mKG5hkblGy/1txSRciHag4shs2D8jwhuY3ru5qN3yIBF96j0gH4T
 L9UuuJ2RA9Vg0B5DxMNKr7nwe80t2rOR7g8ZqcZBpaWbxDl0m9yP6nsUYDLklMFRhbhy
 z0+ICYElGW63IGhr9Tv2e22CiLtfk+WNvLMyiyRT064VhHkxbp1AlLjJBBmzvM/nM1QZ
 MDlg==
X-Gm-Message-State: AC+VfDypWkfX75mT6ZH49JD3lBuQkbK1WuBJ7PPs6Gnd0I4Ue2ej+6+l
 EuFmADEIHlQ0A2UrnclXsdwA7Q==
X-Google-Smtp-Source: ACHHUZ55+PPjnXxizLgd1HAqalP86PczOGQ6FqSeWRcGNtJq085GKWTLF+EgROYG/qxqTfPgOaMzDw==
X-Received: by 2002:a7b:c4da:0:b0:3f1:8aaa:c212 with SMTP id
 g26-20020a7bc4da000000b003f18aaac212mr1920110wmk.33.1682610313955; 
 Thu, 27 Apr 2023 08:45:13 -0700 (PDT)
Received: from zen.linaroharston ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 c10-20020a7bc2aa000000b003f080b2f9f4sm24820201wmk.27.2023.04.27.08.45.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Apr 2023 08:45:12 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 9696D1FFB8;
 Thu, 27 Apr 2023 16:45:11 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: richard.henderson@linaro.org, Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>, Andrew Jeffery <andrew@aj.id.au>,
 Joel Stanley <joel@jms.id.au>, Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>,
 qemu-arm@nongnu.org (open list:ASPEED BMCs)
Subject: [PULL 09/18] tests/avocado/machine_aspeed: Fix the broken
 ast2[56]00_evb_sdk tests
Date: Thu, 27 Apr 2023 16:45:01 +0100
Message-Id: <20230427154510.1791273-10-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230427154510.1791273-1-alex.bennee@linaro.org>
References: <20230427154510.1791273-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

From: Thomas Huth <thuth@redhat.com>

test_arm_ast2500_evb_sdk and test_arm_ast2600_evb_sdk are currently
failing. The problem is that they are trying to look for the login
prompt that does not have a newline at the end - but the logic in
_console_interaction() only handles full lines. It used to work by
accident in the past since there were sometimes kernel (warning and
error) messages popping up that finally provided a newline character
in the output, but since the tests have been changed to run with the
"quiet" kernel parameter, this is not working anymore.

To make this work reliably, we must not look for the "login:" prompt,
but have to use some text ending with a newline instead. And in the
ast2600 test, switch to ssh instead of trying to log into the serial
console - this works much more reliable and also has the benefit of
excercising the network interface here a little bit, too.

Signed-off-by: Thomas Huth <thuth@redhat.com>
Reviewed-by: Cédric Le Goater <clg@kaod.org>
Message-Id: <20230421110345.1294131-3-thuth@redhat.com>
[AJB: remove stray debug log]
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20230424092249.58552-10-alex.bennee@linaro.org>

diff --git a/tests/avocado/machine_aspeed.py b/tests/avocado/machine_aspeed.py
index 2b532c4834..724ee72c02 100644
--- a/tests/avocado/machine_aspeed.py
+++ b/tests/avocado/machine_aspeed.py
@@ -10,6 +10,7 @@
 import tempfile
 import subprocess
 
+from avocado_qemu import LinuxSSHMixIn
 from avocado_qemu import QemuSystemTest
 from avocado_qemu import wait_for_console_pattern
 from avocado_qemu import exec_command
@@ -268,7 +269,7 @@ def test_arm_ast2600_evb_buildroot_tpm(self):
 
         self.do_test_arm_aspeed_buildroot_poweroff()
 
-class AST2x00MachineSDK(QemuSystemTest):
+class AST2x00MachineSDK(QemuSystemTest, LinuxSSHMixIn):
 
     EXTRA_BOOTARGS = (
         'quiet '
@@ -295,7 +296,7 @@ def do_test_arm_aspeed_sdk_start(self, image):
         self.require_netdev('user')
         self.vm.set_console()
         self.vm.add_args('-drive', 'file=' + image + ',if=mtd,format=raw',
-                         '-net', 'nic', '-net', 'user')
+                         '-net', 'nic', '-net', 'user,hostfwd=:127.0.0.1:0-:22')
         self.vm.launch()
 
         self.wait_for_console_pattern('U-Boot 2019.04')
@@ -323,7 +324,7 @@ def test_arm_ast2500_evb_sdk(self):
 
         self.do_test_arm_aspeed_sdk_start(
             self.workdir + '/ast2500-default/image-bmc')
-        self.wait_for_console_pattern('ast2500-default login:')
+        self.wait_for_console_pattern('nodistro.0 ast2500-default ttyS4')
 
     @skipIf(os.getenv('GITLAB_CI'), 'Running on GitLab')
     def test_arm_ast2600_evb_sdk(self):
@@ -345,22 +346,25 @@ def test_arm_ast2600_evb_sdk(self):
                          'ds1338,bus=aspeed.i2c.bus.5,address=0x32');
         self.do_test_arm_aspeed_sdk_start(
             self.workdir + '/ast2600-default/image-bmc')
-        self.wait_for_console_pattern('ast2600-default login:')
-        exec_command_and_wait_for_pattern(self, 'root', 'Password:')
-        exec_command_and_wait_for_pattern(self, '0penBmc', 'root@ast2600-default:~#')
+        self.wait_for_console_pattern('nodistro.0 ast2600-default ttyS4')
 
-        exec_command_and_wait_for_pattern(self,
-             'echo lm75 0x4d > /sys/class/i2c-dev/i2c-5/device/new_device',
+        self.ssh_connect('root', '0penBmc', False)
+        self.ssh_command('dmesg -c > /dev/null')
+
+        self.ssh_command_output_contains(
+             'echo lm75 0x4d > /sys/class/i2c-dev/i2c-5/device/new_device ; '
+             'dmesg -c',
              'i2c i2c-5: new_device: Instantiated device lm75 at 0x4d');
-        exec_command_and_wait_for_pattern(self,
+        self.ssh_command_output_contains(
                              'cat /sys/class/hwmon/hwmon19/temp1_input', '0')
         self.vm.command('qom-set', path='/machine/peripheral/tmp-test',
                         property='temperature', value=18000);
-        exec_command_and_wait_for_pattern(self,
+        self.ssh_command_output_contains(
                              'cat /sys/class/hwmon/hwmon19/temp1_input', '18000')
 
-        exec_command_and_wait_for_pattern(self,
-             'echo ds1307 0x32 > /sys/class/i2c-dev/i2c-5/device/new_device',
+        self.ssh_command_output_contains(
+             'echo ds1307 0x32 > /sys/class/i2c-dev/i2c-5/device/new_device ; '
+             'dmesg -c',
              'i2c i2c-5: new_device: Instantiated device ds1307 at 0x32');
         year = time.strftime("%Y")
-        exec_command_and_wait_for_pattern(self, 'hwclock -f /dev/rtc1', year);
+        self.ssh_command_output_contains('/sbin/hwclock -f /dev/rtc1', year);
-- 
2.39.2


