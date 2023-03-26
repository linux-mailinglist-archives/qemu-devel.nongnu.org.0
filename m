Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C5E56C97C0
	for <lists+qemu-devel@lfdr.de>; Sun, 26 Mar 2023 22:24:49 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pgWtg-0001rH-5l; Sun, 26 Mar 2023 16:23:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <strahinjapjankovic@gmail.com>)
 id 1pgWte-0001py-4J; Sun, 26 Mar 2023 16:23:22 -0400
Received: from mail-lj1-x22c.google.com ([2a00:1450:4864:20::22c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <strahinjapjankovic@gmail.com>)
 id 1pgWtc-0003qZ-Jq; Sun, 26 Mar 2023 16:23:21 -0400
Received: by mail-lj1-x22c.google.com with SMTP id f16so6869932ljq.10;
 Sun, 26 Mar 2023 13:23:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1679862198;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=xfZjNMjzWHrnALAVPW0l5NgU6D15/Iv55fFst8PORK8=;
 b=c1RmMlHjJlHQafM3+qpaL5eyFu9qmYA6jYw5N7b/H1up3ykW8aUEKHyCdxKKJDDbjD
 xv//HO3XD6t+6mAFkV4I1sWyBsa1yQgVFBSCvxmpORS37zqf5IOlKde6VSEuuWr/dxvl
 mhZr0QZxlrLYOj6JLAnvQGTOYDfoSh4xC5opOV/J9O4wikQ4XxSiuxrrCy5iLXImr06R
 wrvQ1vx6egb8xlVGBSK3DPO7wd6RZi3SxmIqsrhdRJcLnAQmO/sCxzvM4ffKHCdPhaO7
 eAQtt6FcOsWuD3vwc4Bf2lZpHyHf8IGQbpV0jpA/+qSjrTL8HLcOjo/+/Xgon/SiXqyf
 OIgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679862198;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=xfZjNMjzWHrnALAVPW0l5NgU6D15/Iv55fFst8PORK8=;
 b=nwEJrXwvkOnOdS9k5DE2RHNXoo0SI5heoA4p9YHVqjAxgzbMr/XGxRDXdZxQFdRFQL
 bWw62WUkaTjniIe0AA0S/blAsmz0KptR+9jepYiM9sONc8UfrGKryvydV7XukG+CagVU
 tnAci+8AFpx9ZD3Upsfp6w8J8VOkcbg5bWdJealEO58i+4Pl1x881a2cOb06nWpLfADL
 1LGC6y3B/AtUgvigEZJcQ+5pFknijOehJAkUx1aitnMKpPc7v7VckR6XqehP7EqIA/69
 CCdpnCsRiqVKouRFByQu/oZz1igUSqh7R/wUsySFSTmYo5f4Z1uPhcNftwPt8YNomL/I
 /D8w==
X-Gm-Message-State: AAQBX9cXqKEri/myyx3+NBDL4jt9S81ZV/mtVfYl2VipPA5Jgar5yhNP
 KsfpYqj6HK+ajiGK1kmEx+c=
X-Google-Smtp-Source: AKy350ZmoZZgKjWyV+OeWzeQBmZC2FbUbH6CgBGubbFVsMhgQNaaYkY9HRTq4p8hIm/FWI5aMKNLEg==
X-Received: by 2002:a2e:7a08:0:b0:299:ac26:f781 with SMTP id
 v8-20020a2e7a08000000b00299ac26f781mr3036650ljc.18.1679862198650; 
 Sun, 26 Mar 2023 13:23:18 -0700 (PDT)
Received: from penguin.lxd (213-67-202-254-no43.tbcn.telia.com.
 [213.67.202.254]) by smtp.googlemail.com with ESMTPSA id
 u3-20020a2e9f03000000b002a2b9d9429esm1427773ljk.117.2023.03.26.13.23.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 26 Mar 2023 13:23:18 -0700 (PDT)
From: Strahinja Jankovic <strahinjapjankovic@gmail.com>
X-Google-Original-From: Strahinja Jankovic <strahinja.p.jankovic@gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: Beniamino Galvani <b.galvani@gmail.com>,
 Niek Linnenbank <nieklinnenbank@gmail.com>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org, Strahinja Jankovic <strahinja.p.jankovic@gmail.com>
Subject: [PATCH v3 4/4] tests/avocado: Add reboot tests to Cubieboard
Date: Sun, 26 Mar 2023 22:22:56 +0200
Message-Id: <20230326202256.22980-5-strahinja.p.jankovic@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230326202256.22980-1-strahinja.p.jankovic@gmail.com>
References: <20230326202256.22980-1-strahinja.p.jankovic@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::22c;
 envelope-from=strahinjapjankovic@gmail.com; helo=mail-lj1-x22c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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

Cubieboard tests end with comment "reboot not functioning; omit test".
Fix this so reboot is done at the end of each test.

Signed-off-by: Strahinja Jankovic <strahinja.p.jankovic@gmail.com>

Reviewed-by: Niek Linnenbank <nieklinnenbank@gmail.com>
Tested-by: Niek Linnenbank <nieklinnenbank@gmail.com>
---
 tests/avocado/boot_linux_console.py | 15 ++++++++++++---
 1 file changed, 12 insertions(+), 3 deletions(-)

diff --git a/tests/avocado/boot_linux_console.py b/tests/avocado/boot_linux_console.py
index 574609bf43..c0675809e6 100644
--- a/tests/avocado/boot_linux_console.py
+++ b/tests/avocado/boot_linux_console.py
@@ -581,7 +581,10 @@ def test_arm_cubieboard_initrd(self):
                                                 'Allwinner sun4i/sun5i')
         exec_command_and_wait_for_pattern(self, 'cat /proc/iomem',
                                                 'system-control@1c00000')
-        # cubieboard's reboot is not functioning; omit reboot test.
+        exec_command_and_wait_for_pattern(self, 'reboot',
+                                                'reboot: Restarting system')
+        # Wait for VM to shut down gracefully
+        self.vm.wait()
 
     def test_arm_cubieboard_sata(self):
         """
@@ -625,7 +628,10 @@ def test_arm_cubieboard_sata(self):
                                                 'Allwinner sun4i/sun5i')
         exec_command_and_wait_for_pattern(self, 'cat /proc/partitions',
                                                 'sda')
-        # cubieboard's reboot is not functioning; omit reboot test.
+        exec_command_and_wait_for_pattern(self, 'reboot',
+                                                'reboot: Restarting system')
+        # Wait for VM to shut down gracefully
+        self.vm.wait()
 
     @skipUnless(os.getenv('AVOCADO_ALLOW_LARGE_STORAGE'), 'storage limited')
     def test_arm_cubieboard_openwrt_22_03_2(self):
@@ -672,7 +678,10 @@ def test_arm_cubieboard_openwrt_22_03_2(self):
 
         exec_command_and_wait_for_pattern(self, 'cat /proc/cpuinfo',
                                                 'Allwinner sun4i/sun5i')
-        # cubieboard's reboot is not functioning; omit reboot test.
+        exec_command_and_wait_for_pattern(self, 'reboot',
+                                                'reboot: Restarting system')
+        # Wait for VM to shut down gracefully
+        self.vm.wait()
 
     @skipUnless(os.getenv('AVOCADO_TIMEOUT_EXPECTED'), 'Test might timeout')
     def test_arm_quanta_gsj(self):
-- 
2.30.2


