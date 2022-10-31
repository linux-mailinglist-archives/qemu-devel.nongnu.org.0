Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F2EA36137DD
	for <lists+qemu-devel@lfdr.de>; Mon, 31 Oct 2022 14:24:39 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1opUiU-0004yz-0z; Mon, 31 Oct 2022 09:20:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1opUhx-00034H-NE
 for qemu-devel@nongnu.org; Mon, 31 Oct 2022 09:20:07 -0400
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1opUhp-0005RD-4o
 for qemu-devel@nongnu.org; Mon, 31 Oct 2022 09:20:03 -0400
Received: by mail-wr1-x42f.google.com with SMTP id j15so15953361wrq.3
 for <qemu-devel@nongnu.org>; Mon, 31 Oct 2022 06:19:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=BNTO1oPO10qcAY9aWmNU3TzyVHXmp7R/Qudvzcnb1Ls=;
 b=EniinSF7WjOkM2VhkvMK8mlh9flKj6JWvuO1RMaSD+Y01/bxBw4AgzQ47BfavTR1lx
 3QA5H72AzMFrVdwX0T5du7zqd/TggUzZnkCeAhJGwE3St4mIeYzhQi+XZ5rok16zH3ZG
 sNoZOmQnhAcTnMPbGNXDliXbMvDFBhk2yXtjsnrkOJ+FHcsNtWnJSgIiAm5pVVuE1WEz
 DOFa5cMO8Ysj9Yf0Xzh/I+WAZKJRGjr1KIA1jiJLegqi9bmLVAUhkRB3Fem5CkVl7MOi
 5Alk7dwLgcZfqn1dz1wj0gd5wfGQc77q1kmZop0s0PO5EfPfoZjkaDQtrrJliU4/kkMD
 622Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=BNTO1oPO10qcAY9aWmNU3TzyVHXmp7R/Qudvzcnb1Ls=;
 b=ndt7Jx9uYHOHtfPMB9hf1vhFlQuvDHgiVqfXVmr/u/5rMItpZzg8I1GSFZ9qgXJ0vk
 0KWe1CEeSIIo5zDzFn0zKaWM8YyoByMQykns4onYLs8El0shJ1RMpdWjLPs44BvDVAwm
 nlSYc30rLvMY2Iuk/KzddDPXV+NXc8YB0P6VsvHxPEvcuzuzA7Oh5iqL/75lcT9MPIDH
 AmY6j+AkFJeou0dcRrFRwlwH77KBQbey2I9Nrhteq1fN7x/5Nzera7PYf4yby4eg3gPS
 qVb5mhrs6FD6EGNrJl9bb9MeIuRdkdmpXkcuxFAic7I2/x73o51qB/xoG4hpQ2Ac8ddv
 z5nw==
X-Gm-Message-State: ACrzQf13lrcChbamzVB8n0s0m+NozimT+MSqMleVQr7xm5zWq/mllWik
 yQLlXmNfjT91FLAtOfyfFVnwGQ==
X-Google-Smtp-Source: AMsMyM6K5s5deyGdUqi6nUKdVQ/q/ZEcE/2XJutN67+Sl3U5q4vGEWq6QaB9vqpy4r6ZHSrZNNYEiw==
X-Received: by 2002:adf:d1c9:0:b0:225:f98:d602 with SMTP id
 b9-20020adfd1c9000000b002250f98d602mr8180576wrd.419.1667222395791; 
 Mon, 31 Oct 2022 06:19:55 -0700 (PDT)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 l7-20020a05600c1d0700b003b505d26776sm2182038wms.5.2022.10.31.06.19.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 31 Oct 2022 06:19:54 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id CEFFF1FFCA;
 Mon, 31 Oct 2022 13:10:12 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: stefanha@redhat.com, Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Thomas Huth <thuth@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>
Subject: [PULL 20/31] tests/avocado: raspi2_initrd: Wait for guest shutdown
 message before stopping
Date: Mon, 31 Oct 2022 13:09:59 +0000
Message-Id: <20221031131010.682984-21-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221031131010.682984-1-alex.bennee@linaro.org>
References: <20221031131010.682984-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42f.google.com
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de+lists+qemu-devel=lfdr.de@nongnu.org

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
Message-Id: <20221027183637.2772968-20-alex.bennee@linaro.org>

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


