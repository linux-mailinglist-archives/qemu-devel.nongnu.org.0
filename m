Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F20285BEF70
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Sep 2022 23:54:20 +0200 (CEST)
Received: from localhost ([::1]:54152 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oalC5-0005w9-Th
	for lists+qemu-devel@lfdr.de; Tue, 20 Sep 2022 17:54:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51408)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oagqf-0000ZC-0B
 for qemu-devel@nongnu.org; Tue, 20 Sep 2022 13:15:53 -0400
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e]:38660)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oagqc-0000hZ-NO
 for qemu-devel@nongnu.org; Tue, 20 Sep 2022 13:15:52 -0400
Received: by mail-ed1-x52e.google.com with SMTP id e17so4843968edc.5
 for <qemu-devel@nongnu.org>; Tue, 20 Sep 2022 10:15:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=U3PlFQUpVUZuVdYiZMbaG1H1/BKHYNeI1k/uhxlCRws=;
 b=vWZlW5QQioRMdCtfh/efHRZSVEgVJ3TtGHluajIqDZyDPXBts8C4tjaBeOmvSmDYHc
 pqL8JPl7LElTNmTlk9txvpOfOkYDq27Kqrn+6muB6PqF3CqG7RkBS7LjNiYvmvzj4G59
 poQrYS2h8QB2XGXQfSZc8QNpmB2bgM0nJSfbxD4aBkG7fvIV1CdQi0RlJozx/WHM36BJ
 /jwELjxgh/IOCnn4dBKHPQwrM2rp9zVWEtYJuytsDlirpWtL4MG41YQJ6mE+VxOulQlJ
 xt4DOQTR1FTuUSBRVAmOwe4z2zyG4HzxXA8dHIoHJOyfTUyI/juGoUAaE8IIqtxDiMRm
 2yEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=U3PlFQUpVUZuVdYiZMbaG1H1/BKHYNeI1k/uhxlCRws=;
 b=1pKYWHE6+N/m8yD52W5mhKPMxoMgxVvqvIeqkp+M1JIYaUxi3UxN2e0Ye5IDEe+I6l
 O4IszUTu1ogmPQD7f63vQnIbs1QGTZ8cp7BZ3xy90M3zLrWzPuB4TdrZmFV/+AxclmC2
 AC7MQLc9pK2wZQ2DItEQ5ZXnglqbWVyJijoVLYQ1InTkIOTym9fTwR33V2QqpkuIaGqT
 7uvA4g1M8ZWIt0lqHJRXaFQoplTZdw4x6SPQQtp/K41Nlosyf9etJGQycYss2N1Dgi17
 p07fCWCOoRhsACuIzC8AaC1bh5j6iS3PPE7Q2w+0zGn4QTDXFUWQwUJjPsr/EgYepaMz
 hZ4Q==
X-Gm-Message-State: ACrzQf2hRIC0B6rni6X/ESuWa8MOOTgXrbZ3A/HlL7CoBA6P3MJQ4Hav
 WO5p/f0ldAmMF6UKPGVSKe1ZsA==
X-Google-Smtp-Source: AMsMyM7Fh0LQqW4Cp2Ses5sL+TmrJr6kx/NTmkbZtrvR8rL3+hCl+R02SyNZEaQKUOIJD0vTFvre/w==
X-Received: by 2002:a05:6402:791:b0:454:40f7:63e5 with SMTP id
 d17-20020a056402079100b0045440f763e5mr7380793edy.293.1663694149259; 
 Tue, 20 Sep 2022 10:15:49 -0700 (PDT)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 t22-20020a056402021600b00443d657d8a4sm171599edv.61.2022.09.20.10.15.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Sep 2022 10:15:42 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 4979B1FFBE;
 Tue, 20 Sep 2022 18:15:34 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: stefanha@redhat.com,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Thomas Huth <thuth@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>
Subject: [PULL 06/30] tests/avocado: split the AST2x00Machine classes
Date: Tue, 20 Sep 2022 18:15:09 +0100
Message-Id: <20220920171533.1098094-7-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220920171533.1098094-1-alex.bennee@linaro.org>
References: <20220920171533.1098094-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52e;
 envelope-from=alex.bennee@linaro.org; helo=mail-ed1-x52e.google.com
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The SDK tests take a lot longer to run and hence need a longer
timeout. As they run well over the 60 second maximum for CI lets also
disable them for CI as well.

I suspect they also suffer from the inability to detect the login
prompt due to no newlines being processed.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Thomas Huth <thuth@redhat.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20220914155950.804707-7-alex.bennee@linaro.org>

diff --git a/tests/avocado/machine_aspeed.py b/tests/avocado/machine_aspeed.py
index 65d38f4efa..0f64eb636c 100644
--- a/tests/avocado/machine_aspeed.py
+++ b/tests/avocado/machine_aspeed.py
@@ -6,12 +6,14 @@
 # later.  See the COPYING file in the top-level directory.
 
 import time
+import os
 
 from avocado_qemu import QemuSystemTest
 from avocado_qemu import wait_for_console_pattern
 from avocado_qemu import exec_command
 from avocado_qemu import exec_command_and_wait_for_pattern
 from avocado.utils import archive
+from avocado import skipIf
 
 
 class AST1030Machine(QemuSystemTest):
@@ -176,6 +178,20 @@ def test_arm_ast2600_evb_builroot(self):
         self.do_test_arm_aspeed_buidroot_poweroff()
 
 
+class AST2x00MachineSDK(QemuSystemTest):
+
+    # FIXME: Although these tests boot a whole distro they are still
+    # slower than comparable machine models. There may be some
+    # optimisations which bring down the runtime. In the meantime they
+    # have generous timeouts and are disable for CI which aims for all
+    # tests to run in less than 60 seconds.
+    timeout = 240
+
+    def wait_for_console_pattern(self, success_message, vm=None):
+        wait_for_console_pattern(self, success_message,
+                                 failure_message='Kernel panic - not syncing',
+                                 vm=vm)
+
     def do_test_arm_aspeed_sdk_start(self, image, cpu_id):
         self.vm.set_console()
         self.vm.add_args('-drive', 'file=' + image + ',if=mtd,format=raw',
@@ -187,6 +203,7 @@ def do_test_arm_aspeed_sdk_start(self, image, cpu_id):
         self.wait_for_console_pattern('Starting kernel ...')
         self.wait_for_console_pattern('Booting Linux on physical CPU ' + cpu_id)
 
+    @skipIf(os.getenv('GITLAB_CI'), 'Running on GitLab')
     def test_arm_ast2500_evb_sdk(self):
         """
         :avocado: tags=arch:arm
@@ -204,6 +221,7 @@ def test_arm_ast2500_evb_sdk(self):
             self.workdir + '/ast2500-default/image-bmc', '0x0')
         self.wait_for_console_pattern('ast2500-default login:')
 
+    @skipIf(os.getenv('GITLAB_CI'), 'Running on GitLab')
     def test_arm_ast2600_evb_sdk(self):
         """
         :avocado: tags=arch:arm
-- 
2.34.1


