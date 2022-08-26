Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C35035A2D72
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Aug 2022 19:27:21 +0200 (CEST)
Received: from localhost ([::1]:55944 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oRd72-00078N-UI
	for lists+qemu-devel@lfdr.de; Fri, 26 Aug 2022 13:27:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37998)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oRd1S-0004Fd-Qe
 for qemu-devel@nongnu.org; Fri, 26 Aug 2022 13:21:35 -0400
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e]:40787)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oRd1P-0002Jw-SB
 for qemu-devel@nongnu.org; Fri, 26 Aug 2022 13:21:34 -0400
Received: by mail-wr1-x42e.google.com with SMTP id h5so2551350wru.7
 for <qemu-devel@nongnu.org>; Fri, 26 Aug 2022 10:21:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=ikIbvIVZc9eqSucgMZ0p7NFEFKoNahKLsiVkLjE1kiU=;
 b=fH6Cvtf73fAbc+35zSA77evkyaBq3QUYI7BLIJc7HQzBpvr5sqIaoloyO4lfUBhnRY
 nw5qEyTU3IK70V/Y4g/zsQ7y9YQ4rgH39bWC4XlAo/QsoSqKUTUNxvrhrERAeX33q4oG
 UQ2Vvl9wf3IgCLUnNRdBoSCq2HUVlg1Uj9bwrhfP2Vkzoi9KNq9qshK/yHg77SEAHRB/
 3uAhW+OMcKo9rITWv04qm3sa/9o8DW4p1iz8k5Ife2p6PL0nO07alYsosg9dmC4Fttbs
 NnT1y2yX5nrG2qSZJVkX2yC2jFpGgv/N0DIXjwcgM6Il0XFDEZ+bNBdLwWyzJipq9qDs
 tQTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=ikIbvIVZc9eqSucgMZ0p7NFEFKoNahKLsiVkLjE1kiU=;
 b=v14r54CrA3o6L+Uh2kTNV07P7M74Vj2CqKYSCaQ1CmGrIsEHaH1aQy2Feonm4seLmx
 6wICxIwa7zA1nvgKSVkwi5rmkfsqF3bCR4Loh8031wvhithi95zcvQ+Z0wbgqNsDfK7N
 W0J62YlHa0I2KViYteIqlMQizC/gmJ8qrd67s0Vpxv+bf3bvVRdEWC2Wcp9JAC+zBGLa
 dmye8yyoCJP96RkDq2k4UF2m/3Fvgdm+MQEntZQbMhqFtIN+GoH01mQ9/Wg+8Z/WGeFq
 n4Ozhj777Cui69HUPpmN1ZGb0BCiGA1PlNF/hQaK4ObYYEnWxRpTZqB+cfJzxBifQlvu
 RtQw==
X-Gm-Message-State: ACgBeo2bUnZnZ+BKfov/cMnKnwX9eNA1Epwk2pds33gKuOzbooWq+Vok
 q6zf+fcYvv2DheTkhEOiRChW6Ra/fvjWvQ==
X-Google-Smtp-Source: AA6agR63OEmQEbbV5jDcE9vol+FjIBcfPbmgw+oGseH1+VhFeSyL4CVFvNUgvQRXk6lDO3XTM2TRjA==
X-Received: by 2002:a5d:47a5:0:b0:225:5f81:17fd with SMTP id
 5-20020a5d47a5000000b002255f8117fdmr381622wrb.280.1661534490169; 
 Fri, 26 Aug 2022 10:21:30 -0700 (PDT)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 q28-20020a056000137c00b002205cbc1c74sm225985wrz.101.2022.08.26.10.21.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Aug 2022 10:21:29 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id C371F1FFB8;
 Fri, 26 Aug 2022 18:21:28 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: fam@euphon.net, berrange@redhat.com, f4bug@amsat.org, aurelien@aurel32.net,
 pbonzini@redhat.com, stefanha@redhat.com, crosa@redhat.com,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>
Subject: [PATCH  v1 01/25] tests/avocado: split the AST2x00Machine classes
Date: Fri, 26 Aug 2022 18:21:04 +0100
Message-Id: <20220826172128.353798-2-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220826172128.353798-1-alex.bennee@linaro.org>
References: <20220826172128.353798-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42e.google.com
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
2.30.2


