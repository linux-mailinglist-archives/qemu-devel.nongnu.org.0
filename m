Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 931C26A1286
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Feb 2023 23:04:30 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pVJhE-0003YX-BN; Thu, 23 Feb 2023 17:04:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pVJhC-0003YA-3B
 for qemu-devel@nongnu.org; Thu, 23 Feb 2023 17:04:10 -0500
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pVJhA-0003Gx-Bg
 for qemu-devel@nongnu.org; Thu, 23 Feb 2023 17:04:09 -0500
Received: by mail-wm1-x32e.google.com with SMTP id p16so7903604wmq.5
 for <qemu-devel@nongnu.org>; Thu, 23 Feb 2023 14:04:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=A+/Zrv73fk9zwP5dPTfpPsyKAPTq/JZVT85L0gd3xDE=;
 b=pj/T/AwsLSJPnHrxYFjP1pbd7ruWk4QhJPhfnAgaPdKiMw0U/V5kjAAc1XCeyOZEcn
 PX4pJ7PBsXepFlkxTGRCQCRfDSvKe08v88409l+EXbKg4yOnOj/XkqOuCveG6SAoHAh0
 nzgsY6NQWfVKcKMiwH4dAMNDsuCLsIc061S4LnXYD1jetR+YLzWMtRN66BPKd9IOKi+c
 WmSdATh6C6sC0yTwGdvM1C1/pyWJSv9U96JAlS1chh3yjxH3tq69DnU7qoLAGtI8bXOV
 6iLm1PR0iSAbz05kLx5L7fPEQC6kfuhemL/xO4IGOlOh2ZEZzM3uYn4rEmlOa1kGvVDb
 iLjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=A+/Zrv73fk9zwP5dPTfpPsyKAPTq/JZVT85L0gd3xDE=;
 b=YyB7R019uKOMoxNzNvlXDPQb54ePwwrEM8d1w7I1kq+SQM8lEAL62bsm8XAvwwqbcR
 pUkMJqoqYFfX9wKuQ/g7M9VWA2Xx1RLW9+R/CK5F5Y38tuv8I61oX2fmhc5/C73WVOpj
 EMHhzhUiPboVJoHQURNdQrIlnx4ETUdeq6xSbwMFZLZHAC6S3BuzbAvhJkz4sLX2jUUr
 xCuX6MmIZL8c0Tu4lHvSnopdooCVrtRnLv4QIvl4WiuIYtu/3fzFGyB6/rRXrvqxOomw
 PdBJdLtBdiHcmmgOFUM3kM+hoXR7bCL4LtugRf+LQl5RYRuAq/4JgmRaotoY1622A9Uk
 IDBg==
X-Gm-Message-State: AO0yUKWl+XeNNtD5rqwa1cRoNvYJRA19FFyomksa3qgmK7UwwXPo5tUa
 H2LCqsgJGYoloMuD/GcKU20DuPmdHKbMAp9t
X-Google-Smtp-Source: AK7set+4V6gKMlRKKxMRGRInNye4/GcmnaYPEVkUINur91X1pstV6UPVI8URucUzKHjTFtOiNDdUCg==
X-Received: by 2002:a05:600c:328f:b0:3ea:e4bb:4e93 with SMTP id
 t15-20020a05600c328f00b003eae4bb4e93mr1086871wmp.10.1677189846443; 
 Thu, 23 Feb 2023 14:04:06 -0800 (PST)
Received: from localhost.localdomain ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 c11-20020a7bc00b000000b003e91b9a92c9sm598475wmb.24.2023.02.23.14.04.05
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 23 Feb 2023 14:04:06 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Thomas Huth <thuth@redhat.com>,
 Cleber Rosa <crosa@redhat.com>, Beraldo Leal <bleal@redhat.com>
Subject: [PATCH] tests/avocado: Enable TuxRun/mips64 (big-endian) test
Date: Thu, 23 Feb 2023 23:04:04 +0100
Message-Id: <20230223220404.63630-1-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32e.google.com
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

Now that the previous commit ("hw/mips/gt64xxx_pci: Don't
endian-swap GT_PCI0_CFGADDR") fixed the issue accessing
the GT64120 PCI config-address register on big-endian
targets, we can enable this TuxRun test.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
Based-on: <20230223161958.48696-1-jiaxun.yang@flygoat.com>
https://lore.kernel.org/qemu-devel/20230223161958.48696-1-jiaxun.yang@flygoat.com/
---
 tests/avocado/tuxrun_baselines.py | 1 -
 1 file changed, 1 deletion(-)

diff --git a/tests/avocado/tuxrun_baselines.py b/tests/avocado/tuxrun_baselines.py
index 30aaefc1d3..c06e90986f 100644
--- a/tests/avocado/tuxrun_baselines.py
+++ b/tests/avocado/tuxrun_baselines.py
@@ -276,7 +276,6 @@ def test_mips32el(self):
         """
         self.common_tuxrun()
 
-    @skip("QEMU currently broken") # regression against stable QEMU
     def test_mips64(self):
         """
         :avocado: tags=arch:mips64
-- 
2.38.1


