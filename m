Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F8286BDD70
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Mar 2023 01:14:44 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pcxjE-00066H-NT; Thu, 16 Mar 2023 20:13:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <strahinjapjankovic@gmail.com>)
 id 1pcxj5-0005kt-KL; Thu, 16 Mar 2023 20:13:44 -0400
Received: from mail-lf1-x12a.google.com ([2a00:1450:4864:20::12a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <strahinjapjankovic@gmail.com>)
 id 1pcxj2-0004St-4q; Thu, 16 Mar 2023 20:13:42 -0400
Received: by mail-lf1-x12a.google.com with SMTP id r27so4493353lfe.10;
 Thu, 16 Mar 2023 17:13:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1679012018;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=xfZjNMjzWHrnALAVPW0l5NgU6D15/Iv55fFst8PORK8=;
 b=a6jHcY4R91CJmYGbXSHvN4ENjYSfKRyiFxBtoRlSCMgBm7AWU5meRyU0s6tHfauQUV
 GDCRrHJJoZ54oDPQ4ADAwsdO/2w6a5Xv1azdxYPHmuAiv1wzKI+4qnkDB/EhPcwkW8KT
 vxo9WXzJS53QWz2baJ1EKNAZuePBuhj1EOXpj5PqqDtDpCGuFbVbEtxznRcmJCTkImLd
 kC6uGYG8tCy2o+NbCv7Dc86MtUgwkXxp/tCf/NUIVARPprdVXs42/y9d4fPJx7ThaTZG
 uz9pNKtmGvm9fMvR3rU63WTDk8CadVSSCzR9A6cAu350JwFFzerfEZ+sd3ANEzC+rwJh
 J+Nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679012018;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=xfZjNMjzWHrnALAVPW0l5NgU6D15/Iv55fFst8PORK8=;
 b=CG203iNitApCupr6hSUEE0ueP8zKx5v1k91KtPoOcL5Z/5yfFDZmr0hhHase6p1DuN
 YLO1wl5xa1AsdOMa/J/JlpDI41BKydYzf0s9id3+wP4mpyEGMVBXdHomntVInZxMeMY2
 tc5bRCzo88OumldVw6tSU60g9TFDuD0PRXrH75d7n+ROMRwBi09cURSnI/pzQmtFzSFC
 r0Exbs8Vf2vpSP9XvhdYLlpYMffyKNBTQWJNB9hELRoxA8ZYTEnhcOM1DHW35+EH9bCM
 xMOKA4KduFWgaSqF1YH2jPM53SsG3qtCd3EeEBPFxnhMTFK59QvZP1ygjHtuxGsVjwrA
 Zk5w==
X-Gm-Message-State: AO0yUKXe+7lCNpdiDnsutxE2nRpMj6VHv4feFKEhxwDhOzxWr04VPKWM
 Tp99AdEWfntlEBxdXDmN3GV0TWJjO9g1NZffO/8=
X-Google-Smtp-Source: AK7set9mWgNvftohHw8c6u9R6SRLx4hMcLxYLkmgqBKK4q3XYtNB+XQVr0Ag36/Vle20+TMeGH+j1A==
X-Received: by 2002:a19:7613:0:b0:4db:1fdf:4c64 with SMTP id
 c19-20020a197613000000b004db1fdf4c64mr213170lff.54.1679012018308; 
 Thu, 16 Mar 2023 17:13:38 -0700 (PDT)
Received: from penguin.lxd (213-67-202-254-no43.tbcn.telia.com.
 [213.67.202.254]) by smtp.googlemail.com with ESMTPSA id
 y17-20020ac24211000000b004ddaea30ba6sm97776lfh.235.2023.03.16.17.13.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Mar 2023 17:13:38 -0700 (PDT)
From: Strahinja Jankovic <strahinjapjankovic@gmail.com>
X-Google-Original-From: Strahinja Jankovic <strahinja.p.jankovic@gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: Beniamino Galvani <b.galvani@gmail.com>,
 Niek Linnenbank <nieklinnenbank@gmail.com>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org, Strahinja Jankovic <strahinja.p.jankovic@gmail.com>
Subject: [PATCH v2 4/4] tests/avocado: Add reboot tests to Cubieboard
Date: Fri, 17 Mar 2023 01:12:06 +0100
Message-Id: <20230317001203.18425-5-strahinja.p.jankovic@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230317001203.18425-1-strahinja.p.jankovic@gmail.com>
References: <20230317001203.18425-1-strahinja.p.jankovic@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::12a;
 envelope-from=strahinjapjankovic@gmail.com; helo=mail-lf1-x12a.google.com
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


