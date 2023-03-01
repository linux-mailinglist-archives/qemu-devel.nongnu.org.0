Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DE166A6F69
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Mar 2023 16:26:53 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pXOJx-0000qy-U3; Wed, 01 Mar 2023 10:24:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pXOJi-0000bD-LK
 for qemu-devel@nongnu.org; Wed, 01 Mar 2023 10:24:31 -0500
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pXOJd-000122-EF
 for qemu-devel@nongnu.org; Wed, 01 Mar 2023 10:24:30 -0500
Received: by mail-wr1-x42c.google.com with SMTP id t15so13622646wrz.7
 for <qemu-devel@nongnu.org>; Wed, 01 Mar 2023 07:24:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+bjdMgi7gvKJmRoe4Wj6ZmFFnB2BlsJgdO9jIRLczPk=;
 b=PUtQ/14vuZDs4oPIIDZMINW3b8BqXVFAXcMs858I8jb5x8Pel7FgOmH3Z1oNf1Fd3p
 +gtokKb0iLXVWGINB9itNwSXnIHmJUDuUyEq3DYTfchYzU+S54vtS/hFwBpxLPL2a3L2
 epzjKA32TYmOgwnvkiq7ywFpj9DILpbhQcB59TrUQ6PV1PzsO9YrCgsCjZ7NIHBUOU0l
 j+P/iRCx+QHBgLUKqykEG4YVJmNlxzhQ9OCeyg/XPGvLs4QbNQ4KFtCIFB+TfR47JIun
 ntL4bS/LVRT+t49qo8j5LOJJ/qJWmrP8vAQRgboDmG+mszWTAcOKRsvhLkxrazM0/ZnT
 2tGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=+bjdMgi7gvKJmRoe4Wj6ZmFFnB2BlsJgdO9jIRLczPk=;
 b=e7DMSvesTdCEqtHfEWHrEj0saj4qeo4s+Qa0ZRiYoU4R1v1mNf3BXvjl0jR80FL4Nh
 vKuvezM7Hy6c5betDi12PpZEXWLFx8iQrNwn35QHjM3P5tg0jYDVMhvr0XSLCKthwJtA
 AwAqFUJ/VM/X93Oef3RY8RtVAahrEsztm3OFhO917z2LZHJXrVZT5qpvEmAagfZZvu7D
 5pSogXjL3M86o/bDtZHXTyggq1+l4tsyzKPD7YaCviXPRPX7mDeNOks+rF+/Hv+DJeu2
 dwKhC6huseR0l323SMk1SaFPzfJ/Jhpzj7teN46Mck/1LKLxHDxZzd3wzpBGSosLbdHe
 NrWw==
X-Gm-Message-State: AO0yUKUc7s3Y6kkjBzWfvBHR8jqdW87FtX0Ca97qTN+haKN0keFZPW2J
 I5zwMbZFVdn9DnGjEgc2XEqOHg==
X-Google-Smtp-Source: AK7set8h2XX1WeJ9FI+0kBJVSg9R9i/ru+hSjbWrUCYUizpbYSfLFFss+Oyc3/x5vxTkx3bF8NhoMw==
X-Received: by 2002:adf:d0d2:0:b0:2c7:7701:2578 with SMTP id
 z18-20020adfd0d2000000b002c777012578mr4205335wrh.54.1677684263448; 
 Wed, 01 Mar 2023 07:24:23 -0800 (PST)
Received: from zen.linaroharston ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 k28-20020a5d525c000000b002c556a4f1casm12782987wrc.42.2023.03.01.07.24.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Mar 2023 07:24:22 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id A21861FFCE;
 Wed,  1 Mar 2023 15:16:07 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Cleber Rosa <crosa@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>
Subject: [PULL v2 24/24] tests/avocado: disable BootLinuxPPC64 test in CI
Date: Wed,  1 Mar 2023 15:16:04 +0000
Message-Id: <20230301151604.1948813-25-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230301151604.1948813-1-alex.bennee@linaro.org>
References: <20230301151604.1948813-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42c.google.com
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

This test is exceptionally heavyweight (nearly 330s) compared to the
two (both endians) TuxRun baseline tests which complete in under 160s.
The coverage is slightly reduced but a more directed test could make
up the difference.

tests/avocado/tuxrun_baselines.py:TuxRunBaselineTest.test_ppc64:

Overall coverage rate:
  lines......: 9.6% (44110 of 458817 lines)
  functions..: 16.5% (6767 of 41054 functions)
  branches...: 6.0% (13395 of 222634 branches)

tests/avocado/boot_linux.py:BootLinuxPPC64.test_pseries_tcg:

Overall coverage rate:
  lines......: 11.6% (53408 of 458817 lines)
  functions..: 18.7% (7691 of 41054 functions)
  branches...: 7.9% (17692 of 224218 branches)

So lets skip for GITLAB_CI and save a few CI minutes.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Message-Id: <20230228190653.1602033-25-alex.bennee@linaro.org>

diff --git a/tests/avocado/boot_linux.py b/tests/avocado/boot_linux.py
index fe0bb180d9..be30dcbd58 100644
--- a/tests/avocado/boot_linux.py
+++ b/tests/avocado/boot_linux.py
@@ -84,6 +84,8 @@ def test_virt_kvm(self):
         self.launch_and_wait(set_up_ssh_connection=False)
 
 
+# See the tux_baseline.py tests for almost the same coverage in a lot
+# less time.
 class BootLinuxPPC64(LinuxTest):
     """
     :avocado: tags=arch:ppc64
@@ -91,6 +93,7 @@ class BootLinuxPPC64(LinuxTest):
 
     timeout = 360
 
+    @skipIf(os.getenv('GITLAB_CI'), 'Running on GitLab')
     def test_pseries_tcg(self):
         """
         :avocado: tags=machine:pseries
-- 
2.39.2


