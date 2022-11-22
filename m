Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E21D263392F
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Nov 2022 10:57:57 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oxQ0t-0002UM-5h; Tue, 22 Nov 2022 04:56:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oxQ0p-0002Mf-KL
 for qemu-devel@nongnu.org; Tue, 22 Nov 2022 04:56:19 -0500
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oxQ0n-0003sQ-UR
 for qemu-devel@nongnu.org; Tue, 22 Nov 2022 04:56:19 -0500
Received: by mail-wr1-x433.google.com with SMTP id i12so20010224wrb.0
 for <qemu-devel@nongnu.org>; Tue, 22 Nov 2022 01:56:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=6pnofIbm8hUyt3M6Fzw3WVtVx5EbjbRzRyOO8l9wWXg=;
 b=cH6bKdCRV6qZdtzsdLGI5FaJh8VxlvAdTV/bZpZeONa7yi5Kg4qck65e7aWuSGnk3X
 MBXjxMtZ+gur2klSHavMIqKCGAxkMvL/OYuHOlx74ADsIBPXUMvU60B0HHIGruIRsi8U
 aevb5jqVPLBAZItHZRJobrwx1ifXVBCk5j9I1E5+1KOVywDOmBLh+lsj0wYFs0lwnL9W
 CPib3DRJ2oSQBdpVzcwP0Q9JieDTNZILes/3StfPr9y0NK4g+wZy8FMiiSgOXBP4jPro
 i2ciHF48EgZ0SYwTBr/vCKcJKkgxNpmOjOYeiUT+KUOv2RmDdC48l4QHGg1sChOU3Vh1
 u8Cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=6pnofIbm8hUyt3M6Fzw3WVtVx5EbjbRzRyOO8l9wWXg=;
 b=nZEVrFrp3R3vqSUsWZnsNY5V7U3LIyHKJa+kLdIkntZ+nqle0W1uSL2ZdfVzhOXzu+
 F9wr/GRiQfTugToaIjd03qG5JkUrCOGSlCaOO3PCbdkKpG4IsEwWmwo2PL3kO3CwTRm7
 H1gOayVY7akvccJlWeqsoj23pAr6gtxtQW6qIsznt8FdsrWn0ya9NZXI47Q9iR/KuuKT
 SzwvOLmVkD5tGKqH83gp48tvDWpx7ZVAJDhvccoKeyANEa44yZqd6XH9/XTGPpX3pH6i
 asgWDbApx7VKsbdN+K6JBpTR/tXpD6ZeDYesTGWkE5HrEATKYgjcbffxWY2fFQtCqN4+
 br+Q==
X-Gm-Message-State: ANoB5pkLy7YGcPb7FNd0adL/CtQxZLnD+c3mKWn7DPpzF3zR/oeKxxdw
 wScCJU8XpPEIJKHD7N4M9U0xeg==
X-Google-Smtp-Source: AA0mqf6V2a0Y1mXk3pTh5wyiXcuF3/LPEJvTWsdaJBiCgiG8OS2M+5ETSC95YBv6wTFd+nBBWu8Wxg==
X-Received: by 2002:adf:e784:0:b0:241:784b:666b with SMTP id
 n4-20020adfe784000000b00241784b666bmr13587053wrm.483.1669110976158; 
 Tue, 22 Nov 2022 01:56:16 -0800 (PST)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 z11-20020a05600c0a0b00b003c6f1732f65sm23844885wmp.38.2022.11.22.01.56.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Nov 2022 01:56:13 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 833F21FFB7;
 Tue, 22 Nov 2022 09:56:11 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: stefanha@redhat.com,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Cleber Rosa <crosa@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>
Subject: [PULL v2 10/11] tests/avocado: skip aarch64 cloud TCG tests in CI
Date: Tue, 22 Nov 2022 09:56:09 +0000
Message-Id: <20221122095610.3343175-11-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221122095610.3343175-1-alex.bennee@linaro.org>
References: <20221122095610.3343175-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x433.google.com
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

We now have a much lighter weight test in machine_aarch64_virt which
tests the full boot chain in less time. Rename the tests while we are
at it to make it clear it is a Fedora cloud image.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Message-Id: <20221117172532.538149-11-alex.bennee@linaro.org>

diff --git a/tests/avocado/boot_linux.py b/tests/avocado/boot_linux.py
index 8c8a63ec2e..b3e58fa309 100644
--- a/tests/avocado/boot_linux.py
+++ b/tests/avocado/boot_linux.py
@@ -58,6 +58,9 @@ def test_pc_q35_kvm(self):
         self.launch_and_wait(set_up_ssh_connection=False)
 
 
+# For Aarch64 we only boot KVM tests in CI as the TCG tests are very
+# heavyweight. There are lighter weight distros which we use in the
+# machine_aarch64_virt.py tests.
 class BootLinuxAarch64(LinuxTest):
     """
     :avocado: tags=arch:aarch64
@@ -73,7 +76,8 @@ def add_common_args(self):
         self.vm.add_args('-device', 'virtio-rng-pci,rng=rng0')
         self.vm.add_args('-object', 'rng-random,id=rng0,filename=/dev/urandom')
 
-    def test_virt_tcg_gicv2(self):
+    @skipIf(os.getenv('GITLAB_CI'), 'Running on GitLab')
+    def test_fedora_cloud_tcg_gicv2(self):
         """
         :avocado: tags=accel:tcg
         :avocado: tags=cpu:max
@@ -86,7 +90,8 @@ def test_virt_tcg_gicv2(self):
         self.add_common_args()
         self.launch_and_wait(set_up_ssh_connection=False)
 
-    def test_virt_tcg_gicv3(self):
+    @skipIf(os.getenv('GITLAB_CI'), 'Running on GitLab')
+    def test_fedora_cloud_tcg_gicv3(self):
         """
         :avocado: tags=accel:tcg
         :avocado: tags=cpu:max
-- 
2.34.1


