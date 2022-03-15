Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E9364D9B06
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Mar 2022 13:21:53 +0100 (CET)
Received: from localhost ([::1]:39456 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nU6BT-0005w4-Or
	for lists+qemu-devel@lfdr.de; Tue, 15 Mar 2022 08:21:51 -0400
Received: from eggs.gnu.org ([209.51.188.92]:51676)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nU62u-0005tX-6C
 for qemu-devel@nongnu.org; Tue, 15 Mar 2022 08:13:02 -0400
Received: from [2a00:1450:4864:20::62e] (port=37757
 helo=mail-ej1-x62e.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nU62s-0000Zg-3k
 for qemu-devel@nongnu.org; Tue, 15 Mar 2022 08:12:59 -0400
Received: by mail-ej1-x62e.google.com with SMTP id bg10so40836844ejb.4
 for <qemu-devel@nongnu.org>; Tue, 15 Mar 2022 05:12:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=00fkJAMSPWjEO2aeQpLIdfkZ1JsNH7QRi3pDHneeZfA=;
 b=IyosvKHzgY5xtHkXcMV2lxEKfsYPc61YbrfwOtu8RCvj8bMul/OuAbc8TM5q/iAVqi
 iSkyIBV3gltWtW+wcTkK3458bgLwR1utJoOY2s2vHzoK0ihwpJrS9GuFIEVU+NbQAfVt
 1clPcQ8L/oa+gHILkPTJUsYgqKKuWh1YYsG/EnSNqSnWu2OmXvsfHWmYoeuoqCrKz0lE
 J5Xtdg+lNZOyn/hqzKM0RPF+dCFKQzCOELL3P3E7ZEgjIeedPV/0G8NwlMkDSXxEXqB+
 9s8vWM4IMEu/t7lB/HH8oc7y4LWNnJGdONJA7VG+RxlrCkj587tgwrsLVvLK6DnI/Tz6
 DG1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=00fkJAMSPWjEO2aeQpLIdfkZ1JsNH7QRi3pDHneeZfA=;
 b=I7Jek6ct+oOLy57Uk9sdWqCLBA0dOeq3gLvg9Rph5+IQbfqaqLH3Gm9fKUFIedcDn0
 piHrpgFfXVLuRX43ZleU7z1DtPAbNGMWDDf08TXChcg6H314DbTGZwH9Y87CWDDGc4e/
 yeeSyzJ3Osxkt3E3mrcIJqSqeF57VtRD9o78/havYOEwWcUCbPMeUt+hJnqisvWZHT9B
 rxXZAeL2q+XbGP+AKg3BMvKuSbAqcrg4jxK0VoN8dVyMxHl31y+780vX4Csmxx6k5Pbl
 SSBYmI7D9ZNFyQUB5DgjNtJnZLOHGvOpPnSpeBoYHfNiXa071sl1mcaxXTXCrIyvOAOj
 OPgw==
X-Gm-Message-State: AOAM531bTYtWYFsYgQpSUZJ4vRZOjWN/r8INUiX974D79s5mlMO2WFw+
 xDlwoffZ42r+gIPtgg0Z0pcEcw==
X-Google-Smtp-Source: ABdhPJyWlkWQ68Rjp9OlbIu0iGjVQq+DiklBOYhS0UvdXbAQf34Gz4JAQJAMqFV9V4fyfQGsvzRtdg==
X-Received: by 2002:a17:906:4711:b0:6d0:67bb:59e1 with SMTP id
 y17-20020a170906471100b006d067bb59e1mr21401497ejq.211.1647346376373; 
 Tue, 15 Mar 2022 05:12:56 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id
 cn27-20020a0564020cbb00b00418b0c7fbbfsm777256edb.32.2022.03.15.05.12.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Mar 2022 05:12:52 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 23B081FFBA;
 Tue, 15 Mar 2022 12:12:52 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v1 2/8] tests/avocado: update aarch64_virt test to exercise
 -cpu max
Date: Tue, 15 Mar 2022 12:12:45 +0000
Message-Id: <20220315121251.2280317-3-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220315121251.2280317-1-alex.bennee@linaro.org>
References: <20220315121251.2280317-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::62e
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::62e;
 envelope-from=alex.bennee@linaro.org; helo=mail-ej1-x62e.google.com
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
Cc: fam@euphon.net, berrange@redhat.com, Beraldo Leal <bleal@redhat.com>,
 sw@weilnetz.de, richard.henderson@linaro.org, f4bug@amsat.org,
 Wainer dos Santos Moschetta <wainersm@redhat.com>, qemu-arm@nongnu.org,
 stefanha@redhat.com, crosa@redhat.com, pbonzini@redhat.com,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>, aurelien@aurel32.net
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
Message-Id: <20220307172249.3125779-1-alex.bennee@linaro.org>
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


