Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F5AB59C66B
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Aug 2022 20:34:44 +0200 (CEST)
Received: from localhost ([::1]:53728 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oQCG3-0001gs-Gy
	for lists+qemu-devel@lfdr.de; Mon, 22 Aug 2022 14:34:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59032)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oQAik-0008Hv-CV
 for qemu-devel@nongnu.org; Mon, 22 Aug 2022 12:56:14 -0400
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e]:33293)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oQAih-0005zc-TN
 for qemu-devel@nongnu.org; Mon, 22 Aug 2022 12:56:14 -0400
Received: by mail-ej1-x62e.google.com with SMTP id j21so17064453ejs.0
 for <qemu-devel@nongnu.org>; Mon, 22 Aug 2022 09:56:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=tH+S96YG7MrATd+UfWrcxHJyLkHS0vJjmDHxh+mEr/I=;
 b=ifwHtZObLHcLmpfnF/mXSFlr+aMbNgRfGAm8vwQ66+kV+/oHgNUidrdt8zaxFqwu/K
 42aMn9MPb93Eyl6alsc0drLI3gF23xSZ6kHbMa9i5Ob3BafEhxnd1hUURH6kHwFohyRE
 qKMpdMM+KsnmEqW4wH+O4GtWR6/8qKsiEnQHZv/uk0cNRj8RcEk1eToIU+8bjmcdBJAx
 avWDtUnoGOubJE17b/55p55/f2IqVK6ly+oDyTQeNiWe6XetPdFGngrAACW7bsOMWtoQ
 LbtMCYd5gZ8H3+g752GhMxU6ZVALykGEDafQRqkaDF11lJGe66BLJSbPZvhYtSfiV42T
 H4zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=tH+S96YG7MrATd+UfWrcxHJyLkHS0vJjmDHxh+mEr/I=;
 b=Qbeu60DgpURd+jwYXPZMrJJZQGPb330Hhw3RPefu3PuJozh7z6Z/tI9GFdgjPR2vT3
 0cJcno+XoWyFaE/gzy00i4rd5pPMqlUVr7K0RU1nmEZr3JRJcU2LZPybk3GEYEkTGdLT
 lUEzfyPc1swUMFnd58jY5fPzL1mfyHsvUUjPqKUCUckxHlkwHuCNAfTMg6YMygnFBT14
 rAWE1OXZxPOa4jdwRMhidkhoNoFyTpYHlC6smZeT84V/GAuH82xD+7PwyvYW74yCS3Z8
 3wVkmtlL+0R1zGhJFR8sR5mqgzTEU+JZyRa6K2T/HF3RBJD0TYKKcc3VTzUYuycKNT0p
 6r9A==
X-Gm-Message-State: ACgBeo3bMXhV259STgKh6IrFLP2UiKDi/DJdamhVi8bKv5N1q4QfJyzG
 j1nzMnyUE55+ThHUC46NlArCnQ==
X-Google-Smtp-Source: AA6agR69okBYbwzny+VziXLf3+FyW/zuRj+m7gChEqeS3xQ6oSlzssQWjwp71peUlGmspwoapmlT/g==
X-Received: by 2002:a17:907:6d06:b0:731:5809:ec67 with SMTP id
 sa6-20020a1709076d0600b007315809ec67mr13505133ejc.195.1661187369840; 
 Mon, 22 Aug 2022 09:56:09 -0700 (PDT)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 k8-20020a17090632c800b0073cd7cc2c81sm5299260ejk.181.2022.08.22.09.56.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Aug 2022 09:56:09 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 01EFC1FFB8;
 Mon, 22 Aug 2022 17:56:09 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>
Subject: [PATCH  v1 1/6] tests/avocado: push default timeout to QemuBaseTest
Date: Mon, 22 Aug 2022 17:56:03 +0100
Message-Id: <20220822165608.2980552-2-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220822165608.2980552-1-alex.bennee@linaro.org>
References: <20220822165608.2980552-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62e;
 envelope-from=alex.bennee@linaro.org; helo=mail-ej1-x62e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

All of the QEMU tests eventually end up derrived from this class. Move
the default timeout from LinuxTest to ensure we catch them all. As 15
minutes is fairly excessive we drop the default down to 2 minutes
which is a more reasonable target for tests to aim for.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20220816133831.2166761-1-alex.bennee@linaro.org>

---
v2
  - lower timeout to 2 minutes/120 seconds
---
 tests/avocado/avocado_qemu/__init__.py | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/tests/avocado/avocado_qemu/__init__.py b/tests/avocado/avocado_qemu/__init__.py
index ed4853c805..0efd2bd212 100644
--- a/tests/avocado/avocado_qemu/__init__.py
+++ b/tests/avocado/avocado_qemu/__init__.py
@@ -227,6 +227,10 @@ def exec_command_and_wait_for_pattern(test, command,
     _console_interaction(test, success_message, failure_message, command + '\r')
 
 class QemuBaseTest(avocado.Test):
+
+    # default timeout for all tests, can be overridden
+    timeout = 120
+
     def _get_unique_tag_val(self, tag_name):
         """
         Gets a tag value, if unique for a key
@@ -512,7 +516,6 @@ class LinuxTest(LinuxSSHMixIn, QemuSystemTest):
     to start with than the more vanilla `QemuSystemTest` class.
     """
 
-    timeout = 900
     distro = None
     username = 'root'
     password = 'password'
-- 
2.30.2


