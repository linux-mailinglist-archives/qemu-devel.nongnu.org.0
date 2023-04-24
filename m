Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E9FCC6EC8B5
	for <lists+qemu-devel@lfdr.de>; Mon, 24 Apr 2023 11:23:48 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pqsQB-00084y-UN; Mon, 24 Apr 2023 05:23:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pqsPi-0007Fu-4R
 for qemu-devel@nongnu.org; Mon, 24 Apr 2023 05:23:23 -0400
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pqsPQ-0004nC-U3
 for qemu-devel@nongnu.org; Mon, 24 Apr 2023 05:23:12 -0400
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-3f1957e80a2so69597045e9.1
 for <qemu-devel@nongnu.org>; Mon, 24 Apr 2023 02:22:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1682328175; x=1684920175;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=iONo8m57sFQhz/fKHL0PRqYNSYb2qqSH+RERi0fWhz0=;
 b=LEuyv/e3JqCM1JRBQ/80AUwhCkNtixL5P+kLNXbmykg4VQAjPIIOYkZd7KVH0xlzK0
 NX6+MSDjcLG0Q7CA2yZeMchuCvyA733XhykLN95rWNe3xk5W0iqZyWYFaR4HddhNjX9r
 TmGkbTBC9X9TzVrNo4HDxudtyu+g67CsHiEt/kzmlHSVCe+ojTmEDLGh2pR9V/8awmnX
 gwSTIPwirSxlue0VTF1ADZgqV30dOnwYC95gT9BAZeQwyklJ+Mlr9LwN4TTdPCdE800W
 WvZs+rm78T6HkGelekl7e3sRa8ssZicRm055vKt+Tboyvs212fNXIq7zSg/RM+sYDlUk
 YNWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682328175; x=1684920175;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=iONo8m57sFQhz/fKHL0PRqYNSYb2qqSH+RERi0fWhz0=;
 b=DtBAT2RsJLGoNboyt5g0UtjEjyj1DdlajluwYM/tcuzfQTkBFHOVuZ5WK4dXyyAQDa
 LWzvCuFFlQEUMTOUBbrAljNpR4cSHQ7xHgnSCUaUGwHo2YuFjpGAcWmP1+LVBsOk9bSp
 14WR72JJQH4D18Vk5dukjFJIOPAs6t+/B5+Djlm+ehRuS+yShJxpdAOmeg8Ux4gqG242
 mE+6LwlW8zF8P2mYII3qC9NCuD1dV9NBanxsCJ+n3f5N0vfb5oZYE8zNMIaqROIFKVTS
 SRirpECCDp+25gS8CAxZAguXHTiraT0Yg++D64qTqpCKTWWEUUN89spcqXXMnz2lBIVq
 8XMA==
X-Gm-Message-State: AAQBX9fdVi7lv0sdDo/UEQuzlIS2Q3NqyFiWbqohhBa/AUiiYVKuXHOv
 uee9ZNgkFbI6vgvHErVJ7GcfTQ==
X-Google-Smtp-Source: AKy350aQUUi+JnX1NY7j0jNzS3pufc8VG6o9jWK5g6Ppd6ghIbfmZAwPQUJ7/3mLuLD0ndld0vWOGQ==
X-Received: by 2002:a05:6000:1181:b0:2fc:3596:7392 with SMTP id
 g1-20020a056000118100b002fc35967392mr10023134wrx.24.1682328175002; 
 Mon, 24 Apr 2023 02:22:55 -0700 (PDT)
Received: from zen.linaroharston ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 z14-20020a5d4d0e000000b002efb4f2d240sm10339317wrt.87.2023.04.24.02.22.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Apr 2023 02:22:53 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 77D8C1FFC1;
 Mon, 24 Apr 2023 10:22:50 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>, Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>,
 Peter Maydell <peter.maydell@linaro.org>,
 Juan Quintela <quintela@redhat.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Joel Stanley <joel@jms.id.au>, Leif Lindholm <quic_llindhol@quicinc.com>,
 Markus Armbruster <armbru@redhat.com>,
 Radoslaw Biernacki <rad@semihalf.com>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 John Snow <jsnow@redhat.com>, Andrew Jeffery <andrew@aj.id.au>,
 David Hildenbrand <david@redhat.com>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Max Filippov <jcmvbkbc@gmail.com>, qemu-s390x@nongnu.org,
 Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 qemu-arm@nongnu.org, Eduardo Habkost <eduardo@habkost.net>,
 Ilya Leoshkevich <iii@linux.ibm.com>
Subject: [PATCH 09/18] tests/avocado/machine_aspeed: Fix the broken
 ast2[56]00_evb_sdk tests
Date: Mon, 24 Apr 2023 10:22:40 +0100
Message-Id: <20230424092249.58552-10-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230424092249.58552-1-alex.bennee@linaro.org>
References: <20230424092249.58552-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32d.google.com
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
---
 tests/avocado/machine_aspeed.py | 30 +++++++++++++++++-------------
 1 file changed, 17 insertions(+), 13 deletions(-)

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


