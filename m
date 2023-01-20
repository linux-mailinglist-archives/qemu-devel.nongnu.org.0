Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E5AA675615
	for <lists+qemu-devel@lfdr.de>; Fri, 20 Jan 2023 14:44:54 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pIrfy-00013a-Jy; Fri, 20 Jan 2023 08:43:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pIrfw-000138-Bo
 for qemu-devel@nongnu.org; Fri, 20 Jan 2023 08:43:24 -0500
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pIrfu-0007Wx-SL
 for qemu-devel@nongnu.org; Fri, 20 Jan 2023 08:43:24 -0500
Received: by mail-wm1-x32a.google.com with SMTP id g10so4114050wmo.1
 for <qemu-devel@nongnu.org>; Fri, 20 Jan 2023 05:43:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=UNHd8/T89f0TRHea37adZgQvQ+f5+hWer7661K7hDXI=;
 b=qHk0TYqXYGW8iALXaE11M3MlMIxhkCjmG4yJZismQtXQG97rzmhRqZ5r0GoMLNgsZ7
 CN1qJ8bGYYWss5i1LGDomJnR+6JsKMZkqPzHOSqeAtLFWcLmHZA7akjkYXE4sqWhCqwt
 IdQ5sCwaQgWNmhy4XkOLQlXbU2mMvKczMjhJasZfEjXQhivjGnnALEgMqZZPrQD84rLD
 QBao2M9nkpE5JhiLb/vFWzUddlmrJ2/gN5Blhn9fMGz4SbOUh+NKA2hAVXREQujAiH3m
 bJx4SII0RkieQnjQAFpZHUOWB3zdMJ8lU78T78YQMUpCj82hSpkjIGrBIKVP6X6bWp7y
 Bs7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=UNHd8/T89f0TRHea37adZgQvQ+f5+hWer7661K7hDXI=;
 b=6MRDE6uWpaNNkUdxXYOvf4oJrCcziAh32/Da135BtyYi7LkhkXO7HaQxbY8ltn1t8s
 VVXFrZThZn6nPaC7FM9cTylNkSTeyjaktXLb/mUx6xV9mpgi0bQ4gLIHC2w0WGAkoRdK
 +FXFrnCfPK9rslVbIhPFbJclprH46FPmFpCX8rj9ouy2Qf8QLWEi+Y7qvZE4ahq3Lgcm
 hsc353ZPo6gK+9j1Lw5mQF+Ll4/qhDs01Gq8LB1gwJBhCUMHpSupQvZvdc17g4BkIc06
 s2W/miVyhJ6g/VAmaIy7L/LWaqElIocuGUNL7gjFD7WE8pI9t9yyRQwsGYhvWehdA4jJ
 x1gQ==
X-Gm-Message-State: AFqh2kriXkRtT207ld8l6pr1XLtcPo5Y3VWTRTgH8WfD8f3ldXbynbDy
 w1A0oT/XeWxs8w4CEd4p9ysiZQg1wd4O7MzK
X-Google-Smtp-Source: AMrXdXu/p6afDDUBeaVXrcoNM/x+G1HbqU3AR1tfoBWY/bRoZof5jt6q5TBPWU849DQugXwle7lOyQ==
X-Received: by 2002:a05:600c:1712:b0:3d9:a145:91a with SMTP id
 c18-20020a05600c171200b003d9a145091amr14158241wmn.28.1674222201108; 
 Fri, 20 Jan 2023 05:43:21 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 h13-20020a05600c2cad00b003cfa622a18asm2691725wmc.3.2023.01.20.05.43.20
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 20 Jan 2023 05:43:20 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Beraldo Leal <bleal@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-arm@nongnu.org, =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Cleber Rosa <crosa@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 Subbaraya Sundeep <sundeep.lkml@gmail.com>
Subject: [PATCH v2 1/2] tests/avocado: Factor file_truncate() helper out
Date: Fri, 20 Jan 2023 14:43:13 +0100
Message-Id: <20230120134314.81956-2-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230120134314.81956-1-philmd@linaro.org>
References: <20230120134314.81956-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32a.google.com
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

Factor file_truncate() helper out of image_pow2ceil_expand()
for reuse.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 tests/avocado/boot_linux_console.py | 13 +++++++------
 1 file changed, 7 insertions(+), 6 deletions(-)

diff --git a/tests/avocado/boot_linux_console.py b/tests/avocado/boot_linux_console.py
index 8c1d981586..8a598be966 100644
--- a/tests/avocado/boot_linux_console.py
+++ b/tests/avocado/boot_linux_console.py
@@ -30,15 +30,16 @@
 def pow2ceil(x):
     return 1 if x == 0 else 2**(x - 1).bit_length()
 
+def file_truncate(path, size):
+    if size != os.path.getsize(path):
+        with open(path, 'ab+') as fd:
+            fd.truncate(size)
+
 """
 Expand file size to next power of 2
 """
-def image_pow2ceil_expand(path):
-        size = os.path.getsize(path)
-        size_aligned = pow2ceil(size)
-        if size != size_aligned:
-            with open(path, 'ab+') as fd:
-                fd.truncate(size_aligned)
+def image_pow2ceil_expand(path, size):
+    file_truncate(path, pow2ceil(size))
 
 class LinuxKernelTest(QemuSystemTest):
     KERNEL_COMMON_COMMAND_LINE = 'printk.time=0 '
-- 
2.38.1


