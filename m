Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7484862D93B
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Nov 2022 12:17:27 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ovctI-0005Z5-TA; Thu, 17 Nov 2022 06:17:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ovcsl-0005Jb-OV
 for qemu-devel@nongnu.org; Thu, 17 Nov 2022 06:16:43 -0500
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ovcsj-0003yz-51
 for qemu-devel@nongnu.org; Thu, 17 Nov 2022 06:16:34 -0500
Received: by mail-wr1-x42e.google.com with SMTP id l14so3295732wrw.2
 for <qemu-devel@nongnu.org>; Thu, 17 Nov 2022 03:16:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=fzi4KYJh/qM2ppaYMaOLMZPqnWLshUFWMV6nz7L5wKg=;
 b=ti5j5fwTtqWWItxhCUTVFwgAsrXmeM+uEpoTiAqHlzdMWUUteqqXjzZu40NlHs9bPz
 pCc7db2mVXnq6upuC8CzP9sBtCECSMLth478X4YKIP5aanRNy7NHd0H4g49/SiMle1Fw
 jmPzGI3aEFcC/7majFh+ZNUcCDV/l/f0JxqCmOXxhYIY72l4OHJ0ausWYTpfeWgYJD7A
 +jhzUJ2mksJkvz0gAiV3Y2pHb9Uxfb6bYkYngFKPDF+pJqpMuunR43c2lx/F8oDdhjXD
 BWBbzsXg72OBxF4cGvpLIZ4PNFyqNJg+vnZcxdSJ1rxZcx4Z6rSDlNw1hMvQwl7XaLc5
 jFPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=fzi4KYJh/qM2ppaYMaOLMZPqnWLshUFWMV6nz7L5wKg=;
 b=JWZI5uIO0FHnwR/lDpCmXIbetVDiNR+6ZLNym2uKzmJZFg1A3QuKdQ3gpQtAKsi/4/
 /xjRpYddDBlMlIiQs9dqM746OZOarupdyOkuIAxuNkLOfxx22aTwi/1UGmNk95aqwxXp
 PMYRwfZ6uQaskwv6Pm6QG1klCyDb5FlKkTTpqR1EpetLFTUOXxU4b/4rTHA5dE0fXDyc
 bz5v3YGRgJmiYtyxCeJEqHKukE4/uqrw6YJl1yujZxjfZB1Xpbz/OfUL3cXROcKlncGS
 s6Tcs3w8ql9Yt8pe9VU9+2PomowPIvruT36jFWhIV+6colZr5u35hCvNhhVesIpR9AgW
 aHUQ==
X-Gm-Message-State: ANoB5pmhA4JWKK70OtZreuh7b5ZC6UJx0nA95eetW3eIH8B1fU5vyPqp
 USz3XmP7CH5ybvLyC83Cf0pkyw==
X-Google-Smtp-Source: AA0mqf7DcdEiu1BjgcBKZP3l6QzsIPjpG1Mh6uMlk3FaxiUAp5ZD51mQab6ZbOswOQmZcfugVx+E+w==
X-Received: by 2002:a5d:5144:0:b0:22d:d4c:e99c with SMTP id
 u4-20020a5d5144000000b0022d0d4ce99cmr1131147wrt.582.1668683791366; 
 Thu, 17 Nov 2022 03:16:31 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 bg21-20020a05600c3c9500b003b497138093sm991144wmb.47.2022.11.17.03.16.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Nov 2022 03:16:30 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Thomas Huth <thuth@redhat.com>
Subject: [PATCH for-7.2] tests/avocado/boot_linux.py: Bump aarch64 virt test
 timeout to 720s
Date: Thu, 17 Nov 2022 11:16:28 +0000
Message-Id: <20221117111628.911686-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

The two tests
tests/avocado/boot_linux.py:BootLinuxAarch64.test_virt_tcg_gicv2
tests/avocado/boot_linux.py:BootLinuxAarch64.test_virt_tcg_gicv3

take quite a long time to run, and the current timeout of 240s
is not enough for the tests to complete on slow machines:
we've seen these tests time out in the gitlab CI in the
'avocado-system-alpine' CI job, for instance. The timeout
is also insufficient for running the test with a debug build
of QEMU: on my machine the tests take over 10 minutes to run
in that config.

Push the timeout up to 720s so that the test definitely has
enough time to complete.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 tests/avocado/boot_linux.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/avocado/boot_linux.py b/tests/avocado/boot_linux.py
index 571d33882ae..32adae6ff6a 100644
--- a/tests/avocado/boot_linux.py
+++ b/tests/avocado/boot_linux.py
@@ -64,7 +64,7 @@ class BootLinuxAarch64(LinuxTest):
     :avocado: tags=machine:virt
     :avocado: tags=machine:gic-version=2
     """
-    timeout = 240
+    timeout = 720
 
     def add_common_args(self):
         self.vm.add_args('-bios',
-- 
2.25.1


