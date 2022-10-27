Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C61D610148
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Oct 2022 21:13:47 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oo830-0001cY-Co; Thu, 27 Oct 2022 14:56:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oo82G-000059-C0
 for qemu-devel@nongnu.org; Thu, 27 Oct 2022 14:55:27 -0400
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oo81n-0006AM-KY
 for qemu-devel@nongnu.org; Thu, 27 Oct 2022 14:55:23 -0400
Received: by mail-wr1-x436.google.com with SMTP id k8so3777607wrh.1
 for <qemu-devel@nongnu.org>; Thu, 27 Oct 2022 11:54:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+MUx8tu/rSHErPzSyKT8A82g1ji64kTn3Kr9KzrS0Qo=;
 b=V31VVniP9/h+TPAj1GY6ndRreRTWw9TtoY3WFnnIkfENog3Nkqs6jx0g27npvOe8H7
 X+w8OLu/SQjGY60HK+yBj9RZj6dRsP2++Blgny1UNyxER8KahXlWIvfGb1JLstiOYhw/
 ZmT2C63sMrshlbxPrsSM+/usScRyS78uiCH/1ee4K7xaZPwhExGjCa4vEmoJXcGKTl+0
 K555HWm03gvx/ne08EWlmIw+fhCgRC3HHKoN7qX5n2+gzy2o5F8MWuI8vqMat0U+8wON
 IMFcSuskPs8PE2O8/9LXTth8M8wNOv1xK5bBlYKd2Acx7V2E+078Ankji5Gm/hCghc43
 ZCxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=+MUx8tu/rSHErPzSyKT8A82g1ji64kTn3Kr9KzrS0Qo=;
 b=125vIlsXBCF3MTGxLnomBRxVa3mR7/ASROO8qGK23mwN0K3iinwMyD6RNnRRzj2vI/
 ZrMDEa4irUnrtZQKRgrFZnuPUK+iFJkzwkRZVu/tpFNjdkN1uyHaEW8KNHCCicAfxr4K
 LcPe6wIXQFUtw7sRVNjW7bVWmR8XCjLXYFgMJrnYuy+eZoWPn2DxB4rijvorA4mRawwQ
 Clb1z/4C3BNqvxGUgdJukTbYweT0yyLDZCX/m2BOwEvpi2fJfsppPCzyUykKVK3UIpEj
 ZwbC1eOUsi+1/3TNHPNLO/keqQcC180lWhJe2iS5CmDbhO2ICXbPTZkXZFqKx/1Zd7MR
 zx/A==
X-Gm-Message-State: ACrzQf3VjBCmwJGpoVjcq6tAglWEyc+inPMnBlDanuLH3iVCfSQVrwrG
 SbRGTr61NeseIGHdechZfGKGVA==
X-Google-Smtp-Source: AMsMyM6Ih6bExTbKalkO28uHgRe7mbKn/Sc9FcHq0J1OS6LOkN2GUrfN6Y66E/2Ni9yiXQeIOVLqsA==
X-Received: by 2002:adf:eb41:0:b0:22e:fb16:cc43 with SMTP id
 u1-20020adfeb41000000b0022efb16cc43mr31508652wrn.489.1666896893055; 
 Thu, 27 Oct 2022 11:54:53 -0700 (PDT)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 j31-20020a05600c1c1f00b003c701c12a17sm5609606wms.12.2022.10.27.11.54.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Oct 2022 11:54:51 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 21F9C1FFBA;
 Thu, 27 Oct 2022 19:36:39 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: fam@euphon.net, berrange@redhat.com, f4bug@amsat.org, aurelien@aurel32.net,
 pbonzini@redhat.com, stefanha@redhat.com, crosa@redhat.com,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Thomas Huth <thuth@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>
Subject: [PATCH v4 19/30] tests/avocado: raspi2_initrd: Wait for guest
 shutdown message before stopping
Date: Thu, 27 Oct 2022 19:36:25 +0100
Message-Id: <20221027183637.2772968-20-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221027183637.2772968-1-alex.bennee@linaro.org>
References: <20221027183637.2772968-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x436.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Peter Maydell <peter.maydell@linaro.org>

The avocado test
 tests/avocado/boot_linux_console.py:BootLinuxConsole.test_arm_raspi2_initrd
finishes with

    exec_command(self, 'halt')
    # Wait for VM to shut down gracefully
    self.vm.wait()

In theory this should be fine. In practice it runs into two bugs:

 * when the test calls self.vm.wait() Avocado closes the socket
   connection to the guest serial console immediately, so the
   avocado logs don't have the last part of the guest output:
   https://gitlab.com/qemu-project/qemu/-/issues/1265
 * when the socket is closed, a bug in the QEMU socket chardev
   means that it loses any data that the guest UART has not
   yet consumed. This means that the guest doesn't always read
   the full 'halt' command string, so the test intermittently
   fails with a timeout:
   https://gitlab.com/qemu-project/qemu/-/issues/1264

Work around both of these by waiting for the guest to print the
string that means it has completed the shutdown process.  This fixes
a very long standing intermittent failure in this test.

Resolves: https://gitlab.com/qemu-project/qemu/-/issues/636
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Thomas Huth <thuth@redhat.com>
Message-Id: <20221020102012.3015662-1-peter.maydell@linaro.org>
---
 tests/avocado/boot_linux_console.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/avocado/boot_linux_console.py b/tests/avocado/boot_linux_console.py
index ca9d09b0d7..eed4b49e6e 100644
--- a/tests/avocado/boot_linux_console.py
+++ b/tests/avocado/boot_linux_console.py
@@ -489,7 +489,7 @@ def test_arm_raspi2_initrd(self):
                                                 'BCM2835')
         exec_command_and_wait_for_pattern(self, 'cat /proc/iomem',
                                                 '/soc/cprman@7e101000')
-        exec_command(self, 'halt')
+        exec_command_and_wait_for_pattern(self, 'halt', 'reboot: System halted')
         # Wait for VM to shut down gracefully
         self.vm.wait()
 
-- 
2.34.1


