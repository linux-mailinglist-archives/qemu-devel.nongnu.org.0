Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D9B854D052A
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Mar 2022 18:24:41 +0100 (CET)
Received: from localhost ([::1]:33772 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nRH68-0000QL-En
	for lists+qemu-devel@lfdr.de; Mon, 07 Mar 2022 12:24:40 -0500
Received: from eggs.gnu.org ([209.51.188.92]:45268)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nRH4V-0007GM-Hd
 for qemu-devel@nongnu.org; Mon, 07 Mar 2022 12:22:59 -0500
Received: from [2a00:1450:4864:20::336] (port=44708
 helo=mail-wm1-x336.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nRH4T-0005bp-Km
 for qemu-devel@nongnu.org; Mon, 07 Mar 2022 12:22:59 -0500
Received: by mail-wm1-x336.google.com with SMTP id
 bg31-20020a05600c3c9f00b00381590dbb33so9701860wmb.3
 for <qemu-devel@nongnu.org>; Mon, 07 Mar 2022 09:22:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=A6rlxm4xTsM4J5Mcul43gsC0NEKqa8EwY7xDolJVX/U=;
 b=wPwsPQ75GRRRIkOtTkeu6xmjvamEWklnnSrebVR6Q6UqjK+DkHFktvXztWldetw5Tq
 Rl9w7TJwKI1LPBqCZEwhNNJ1Ke9DuYJCshf3oHgp/onPpbdNkiRmG5zxGsa/facJYCD7
 gCTBtumTTl7vvaq41DxD0kMRReg5bYU2iVAhpbPtPsrl9uKHxQ8dU14jUZhOGHyXHSCv
 G63+qIcleDZ4vYeOqnQvlNqKaeIeexLN6mLF4CavVqFpdrSrrwQvO+FRa16BG/lqRvW6
 xDZ1V5JCoZ1gdWQ5JXCjQhp0DdR7PVC8M1HmjAz//HmPMDcQA7A3JGBFKkSqWTOwcZae
 X3aA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=A6rlxm4xTsM4J5Mcul43gsC0NEKqa8EwY7xDolJVX/U=;
 b=zVUJ73Lrm09Pa+1Kn+jhyOrwQyYEEHvhgXcI3PjOfNvCn03q9V1bALe772rZTDStE0
 LrHCN8wfrIAidELpb072beFpTGppVUxXszQQK9TlEn5UgBlVbe62abc10tW+H2aUoC5b
 j54DA618oJcZ6n+SklGl5oxiQLbKrwvBnIrYZlxUv2+PIHd1XHDszalTcXNbJCfDMEMw
 6CGNl+3S3C7MGr9ONY+oZ20SK7GfDHmT8WOena/CyN553fzWSgKG2J2utpafGOdR3YOI
 6YZB+3b2XUPLDUSxJ31tbweYLuqjcD6OKNKffAaXsXhN1W2kscEWCd6AmOtFZi6G09Zr
 GT0w==
X-Gm-Message-State: AOAM533cUq9h+kQO7jZPgMt8ne/eQj0aaEfPV1D+Ea+F4T10yOix1fre
 649ajPK5pJhvIPugd/IVu3FpWw==
X-Google-Smtp-Source: ABdhPJyngsHQ/uzlWnDsHPB6MWjBsRJdrggKkK4izAEsyXfYyScCKGcW9V0qo7wYwQHXo+H0pkzXlA==
X-Received: by 2002:a05:600c:4f8f:b0:383:d0b:3706 with SMTP id
 n15-20020a05600c4f8f00b003830d0b3706mr10067674wmq.117.1646673775687; 
 Mon, 07 Mar 2022 09:22:55 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id
 9-20020a05600c268900b00381394d74a1sm13630637wmt.9.2022.03.07.09.22.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Mar 2022 09:22:54 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id C8D461FFB7;
 Mon,  7 Mar 2022 17:22:53 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH] tests/avocado: update aarch64_virt test to exercise -cpu
 max
Date: Mon,  7 Mar 2022 17:22:49 +0000
Message-Id: <20220307172249.3125779-1-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::336
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x336.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Beraldo Leal <bleal@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>, qemu-arm@nongnu.org,
 Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The Fedora 29 kernel is quite old and importantly fails when running
in LPA2 scenarios. As it's not really exercising much of the CPU space
replace it with a custom 5.16.12 kernel with all the architecture
options turned on. There is a minimal buildroot initramfs included in
the kernel which has a few tools for stress testing the memory
subsystem. The userspace also targets the Neoverse N1 processor so
will fail without additional v8.x+ features.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Cc: Richard Henderson <richard.henderson@linaro.org>
---
 tests/avocado/boot_linux_console.py | 22 ++++++++++++++--------
 1 file changed, 14 insertions(+), 8 deletions(-)

diff --git a/tests/avocado/boot_linux_console.py b/tests/avocado/boot_linux_console.py
index 9c618d4809..ca3a40e91d 100644
--- a/tests/avocado/boot_linux_console.py
+++ b/tests/avocado/boot_linux_console.py
@@ -12,6 +12,7 @@
 import lzma
 import gzip
 import shutil
+import time
 
 from avocado import skip
 from avocado import skipUnless
@@ -330,25 +331,30 @@ def test_aarch64_virt(self):
         :avocado: tags=arch:aarch64
         :avocado: tags=machine:virt
         :avocado: tags=accel:tcg
-        :avocado: tags=cpu:cortex-a53
+        :avocado: tags=cpu:max
         """
-        kernel_url = ('https://archives.fedoraproject.org/pub/archive/fedora'
-                      '/linux/releases/29/Everything/aarch64/os/images/pxeboot'
-                      '/vmlinuz')
-        kernel_hash = '8c73e469fc6ea06a58dc83a628fc695b693b8493'
+        kernel_url = ('https://fileserver.linaro.org/s/'
+                      'z6B2ARM7DQT3HWN/download')
+
+        kernel_hash = 'ed11daab50c151dde0e1e9c9cb8b2d9bd3215347'
         kernel_path = self.fetch_asset(kernel_url, asset_hash=kernel_hash)
 
         self.vm.set_console()
         kernel_command_line = (self.KERNEL_COMMON_COMMAND_LINE +
                                'console=ttyAMA0')
         self.require_accelerator("tcg")
-        self.vm.add_args('-cpu', 'cortex-a53',
+        self.vm.add_args('-cpu', 'max,pauth-impdef=on',
                          '-accel', 'tcg',
                          '-kernel', kernel_path,
                          '-append', kernel_command_line)
         self.vm.launch()
-        console_pattern = 'Kernel command line: %s' % kernel_command_line
-        self.wait_for_console_pattern(console_pattern)
+        self.wait_for_console_pattern('Welcome to Buildroot')
+        time.sleep(0.1)
+        exec_command(self, 'root')
+        time.sleep(0.1)
+        exec_command(self, 'cat /proc/self/maps')
+        time.sleep(0.1)
+
 
     def test_aarch64_xlnx_versal_virt(self):
         """
-- 
2.30.2


