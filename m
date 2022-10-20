Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A5E56062E6
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Oct 2022 16:24:38 +0200 (CEST)
Received: from localhost ([::1]:34854 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olWT2-0001cM-4o
	for lists+qemu-devel@lfdr.de; Thu, 20 Oct 2022 10:24:24 -0400
Received: from [::1] (helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olWEB-00011v-PN
	for lists+qemu-devel@lfdr.de; Thu, 20 Oct 2022 10:08:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59698)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1olUDQ-0000bk-3i
 for qemu-devel@nongnu.org; Thu, 20 Oct 2022 08:00:19 -0400
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431]:36655)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1olUDM-00050g-3I
 for qemu-devel@nongnu.org; Thu, 20 Oct 2022 07:59:59 -0400
Received: by mail-wr1-x431.google.com with SMTP id j7so34031208wrr.3
 for <qemu-devel@nongnu.org>; Thu, 20 Oct 2022 04:59:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=32dQNvuQE0WB5UgXj4/0Ow+Vp+DtTMBdaIfa03x7tow=;
 b=HYr751Jhr6JamZPkBp11jC0J709v0eyykBTs7PHtEQgd/X7r5rbLU9Rk2gyr2N0wZw
 6M8iEnD+dWMY1GXHbtyagc+Nki+4s0ZXCkZlElFMq4uSWHKlXLlHR7by2gGpHjLYxovd
 DdTcNGGBhG66WUfYPi3yRGXIcj2ge+aS4IytLi26ujMlITkWiSXkjNdRaqpx+5jC92zC
 S7D0kBZ9qJ5NrZdSXwtnZQ9H0HdtgSse9qdCHEpSF7AcAqAnD2L/0r1DA7YHjLDjsXbR
 LKa5StS7lbYOAr/AKMeMAX2SWwKs9wOFVlqntK8CJULXNrYH2W+8fVU4RJggsxv9tD+6
 Dziw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=32dQNvuQE0WB5UgXj4/0Ow+Vp+DtTMBdaIfa03x7tow=;
 b=ETvwQA/Vze/dHTrb3UP3azsmPqNgvnRYqEkZdHD1BVOQ356fZs6/jq8JFT4HWV6Bk7
 CVtOsB2EQGCWSG2tl9jnUNkjz9l9zpDrayMYrIw8QQMP1G99Z5MMqI7+qAq13SAOtlBq
 Mb58jofMosHTWiQKJr2Fi+BluuXoqws8JUxjcwmQorGQAbgJfMJuDqMmolFXDLvH0qv6
 6gIWhE8XxkP2j7JbNRTb8LNW/gHZt0htUgMSO/TZqbXm8hKfr5TEGR8mmU7zDI+vt41W
 5jbYSaSJ3nsKvYqNa1LJatlt5zFiyoDXgITDVWoYi3/RylKzr2qapmIN4mklYxiaxVx3
 L0OA==
X-Gm-Message-State: ACrzQf0tOVCeMk7fToul650O4JyLm9HLrpmptSrHPXqe1ZebaAN45rJo
 lz5THly4H7qQY2CmNQM4YQV8/A==
X-Google-Smtp-Source: AMsMyM7+bMfwiNUDsNky9cemTSdaoScxG+zXIBbwCF+a2QwB9/f3AnDEC8JADQvzYJKeT067ApQOAw==
X-Received: by 2002:adf:d215:0:b0:22e:479e:8cc1 with SMTP id
 j21-20020adfd215000000b0022e479e8cc1mr8836978wrh.39.1666267194806; 
 Thu, 20 Oct 2022 04:59:54 -0700 (PDT)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 b10-20020a5d550a000000b0022860e8ae7csm15881668wrv.77.2022.10.20.04.59.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Oct 2022 04:59:54 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id CC7E71FFBB;
 Thu, 20 Oct 2022 12:52:11 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: fam@euphon.net, berrange@redhat.com, f4bug@amsat.org, aurelien@aurel32.net,
 pbonzini@redhat.com, stefanha@redhat.com, crosa@redhat.com,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>
Subject: [PATCH v3 19/26] tests/avocado: raspi2_initrd: Wait for guest
 shutdown message before stopping
Date: Thu, 20 Oct 2022 12:52:02 +0100
Message-Id: <20221020115209.1761864-20-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221020115209.1761864-1-alex.bennee@linaro.org>
References: <20221020115209.1761864-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x431.google.com
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

From: Peter Maydell <peter.maydell@linaro.org>

The avocado test
 tests/avocado/boot_linux_console.py:BootLinuxConsole.test_arm_raspi2_initrd
finishes wiith

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


