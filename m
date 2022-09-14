Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 456275B8C83
	for <lists+qemu-devel@lfdr.de>; Wed, 14 Sep 2022 18:09:33 +0200 (CEST)
Received: from localhost ([::1]:45626 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oYUxA-0004za-DQ
	for lists+qemu-devel@lfdr.de; Wed, 14 Sep 2022 12:09:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37168)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oYUnu-0006TY-Pt
 for qemu-devel@nongnu.org; Wed, 14 Sep 2022 11:59:58 -0400
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333]:34793)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oYUns-0002mc-Cf
 for qemu-devel@nongnu.org; Wed, 14 Sep 2022 11:59:58 -0400
Received: by mail-wm1-x333.google.com with SMTP id
 n35-20020a05600c502300b003b4924c6868so2485821wmr.1
 for <qemu-devel@nongnu.org>; Wed, 14 Sep 2022 08:59:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=kZdq/uKjk12WdalK+7NLnICP9eMfFlhN/OCSVSt/d/Y=;
 b=iaC73sLPBN9HQvbiYfjSGwo6G5d52DPu5Q0zWbFak+CT06xmrthNRkG06HrvEMexJC
 Tpc9vmjBqgN9F8bKAN1Ipci5bAWVZkL/Z4okIVYNSmYYJaAnjtnZiMx+01hAT8uTjQqh
 AARB/cIbaxnPhO0v4QPKEBv874+BGyCLPJi2n4j5Kvglz/AwM1jVmUZ8jOkswjykAfRQ
 IkV5f5LtWSBfiGc8/99GWqrCqKFJ26bG1H2hdG8xj/gHufW8AQ1RIQhkIIQcHzxipK/x
 PvmzxUokR2JivltsXMGTmN020ttGYuLpzr17DwJUsb+cPpnMnJvC0/tyGfr8N2U1O95O
 Usug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=kZdq/uKjk12WdalK+7NLnICP9eMfFlhN/OCSVSt/d/Y=;
 b=f9QaQTUpTpRxj9KWJyZic0HRvVVuqSxvBISQ4ZIbJy46jm6DP0TVta/CKHkvQcqdil
 vDcOJWk/16fm6ZpMQxEGFif9rNASzPf7+7P0Brpp996KD9RbwH5S/B3YfTAavp6fTBa8
 zgW98+MkJjVEDe8PMAqMNmde1lZWvm+kwQre7LCaCxVrAaEfJKr4qYNhbxfDvqym1y6C
 2W3a1e0MmESwV/Frd2lT9nf2irRg/hA3RuZmYJmE5RBHUF20OqE9iLkDyFWqsbHmvAFW
 /vpOrv66wuMGgoEoXHYaqZ1k1buAJJ0CxtfyzziNdjJ4JZ11KVdMTg76IG1CLZ7UJZXz
 wtYw==
X-Gm-Message-State: ACgBeo3IMeGD+QEOO451jwmgLxxUo691TOdXdQtVT2TgT3El+J/munIf
 h5M4ruGZfks78L6PclIaCdVurA==
X-Google-Smtp-Source: AA6agR4+8bDBcavDtjWbbbQCXka5ib0Pw4HN79A6FgLN93HlWTbKf7HGQfTlNfkjizAzENT+Xq43Wg==
X-Received: by 2002:a05:600c:3492:b0:3b4:9fcc:cbb6 with SMTP id
 a18-20020a05600c349200b003b49fcccbb6mr3075520wmq.42.1663171195069; 
 Wed, 14 Sep 2022 08:59:55 -0700 (PDT)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 bt4-20020a056000080400b002238ea5750csm16849072wrb.72.2022.09.14.08.59.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 Sep 2022 08:59:54 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id DA3E61FFBE;
 Wed, 14 Sep 2022 16:59:50 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: fam@euphon.net, berrange@redhat.com, f4bug@amsat.org, aurelien@aurel32.net,
 pbonzini@redhat.com, stefanha@redhat.com, crosa@redhat.com,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Thomas Huth <thuth@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>
Subject: [PATCH  v2 06/30] tests/avocado: split the AST2x00Machine classes
Date: Wed, 14 Sep 2022 16:59:26 +0100
Message-Id: <20220914155950.804707-7-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220914155950.804707-1-alex.bennee@linaro.org>
References: <20220914155950.804707-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x333.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Message-Id: <20220826172128.353798-2-alex.bennee@linaro.org>
---
 tests/avocado/machine_aspeed.py | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

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


