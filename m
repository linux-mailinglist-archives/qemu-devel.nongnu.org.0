Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E25836BF9AD
	for <lists+qemu-devel@lfdr.de>; Sat, 18 Mar 2023 12:49:01 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pdV1X-0004ot-V1; Sat, 18 Mar 2023 07:46:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pdV1O-0004lT-FS
 for qemu-devel@nongnu.org; Sat, 18 Mar 2023 07:46:50 -0400
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pdV1L-0007CS-ED
 for qemu-devel@nongnu.org; Sat, 18 Mar 2023 07:46:50 -0400
Received: by mail-wr1-x436.google.com with SMTP id j2so6488329wrh.9
 for <qemu-devel@nongnu.org>; Sat, 18 Mar 2023 04:46:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1679140005;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=IytrMAvWC1Jh7uTr+86aE9RmM4K+C1Isx+W5vQcB/p8=;
 b=m2DB8WRavOI3rr0mCb5ehYrj5z1VrPcF6WMyg5aSDMSEN3LJPpzhGoCFjJEVR4HXeW
 geuBY+D9N1ZUuB9SS8In+5HQpJkdBUHfqC/7HNCuZNGRVNal6xZbe2sVSMKJpXnIBWEx
 QzVKT0oQU3m5r2sQhFAb8ehcczHzwkZ479kDUIx/UkUqgqCGVfUJPEAYd7z4wjfXN7yM
 PNGfsN1LeVq3fQ6rwNUGpioFcoZ/iTZPMc7IKhXs6j1nWZM0uT5tPH6IvEo/frQi9ZyE
 wKXVi0D/TICfT3e5qyQqCQ3cMdDxUGiUeStp5QZb7wDgA2X9jfjo0z3Q4X4Qm65KL5Hf
 gb8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679140005;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=IytrMAvWC1Jh7uTr+86aE9RmM4K+C1Isx+W5vQcB/p8=;
 b=rSw0MPVe9pciYhwfCp11KGvUKfl/DcnPJUjsyOf0G3hIz3GsH+UZTq0YH/K6AiA46N
 w7Qeg2a1eOQ0r49SVV9e8YqjVUBsZED2O96xafixmRrcjrLufyKx0cgh7hCtuBb2uZ7L
 dChDhIjdfMcHoBSkFMKElWdWQQTT52sjA3qYJbxdS2G1U9w0FhfOVEiYEFuSr5g0MXBC
 AYCkkDxqOTw32ZD5YQh/P2ujlRCBd0NYTQjfkEA9KImVfF8aj2MCudZZu2DB+hyci+3w
 LNV5POkeKvnreNKtXmrfZGAiwgfmmHwexS7A5uOknOyuId/xmVRm+9b66eWdxa68yqJF
 l+6A==
X-Gm-Message-State: AO0yUKV+3RrVQDAeWEIuLlf5dTjLLcPZpWjJPOnfVLmooE8qz/FDxs40
 yYlnE1010yzv5vGtA+vwziyfwQ==
X-Google-Smtp-Source: AK7set+ic6FoEU2NVYpvx38uhrwbzp1FxJGwDfHPX1QdpTX+PJecM1DqM2G9UUgmQL84MHmqFRyJVw==
X-Received: by 2002:a5d:5914:0:b0:2c7:aed:b97b with SMTP id
 v20-20020a5d5914000000b002c70aedb97bmr8258696wrd.62.1679140005592; 
 Sat, 18 Mar 2023 04:46:45 -0700 (PDT)
Received: from zen.linaroharston ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 a17-20020a5d5091000000b002c7b229b1basm4160135wrt.15.2023.03.18.04.46.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 18 Mar 2023 04:46:45 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id AD8971FFB8;
 Sat, 18 Mar 2023 11:46:44 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org,
 Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Cleber Rosa <crosa@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>, qemu-arm@nongnu.org (open list:Virt)
Subject: [PULL 01/31] tests/avocado: update AArch64 tests to Alpine 3.17.2
Date: Sat, 18 Mar 2023 11:46:14 +0000
Message-Id: <20230318114644.1340899-2-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230318114644.1340899-1-alex.bennee@linaro.org>
References: <20230318114644.1340899-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x436.google.com
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

From: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>

To test Alpine boot on SBSA-Ref target we need Alpine Linux
'standard' image as 'virt' one lacks kernel modules.

So to minimalize Avocado cache I move test to 'standard' image.

Signed-off-by: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20230302191146.1790560-1-marcin.juszkiewicz@linaro.org>
Message-Id: <20230315174331.2959-2-alex.bennee@linaro.org>

diff --git a/tests/avocado/machine_aarch64_virt.py b/tests/avocado/machine_aarch64_virt.py
index 25dab8dc00..a90dc6ff4b 100644
--- a/tests/avocado/machine_aarch64_virt.py
+++ b/tests/avocado/machine_aarch64_virt.py
@@ -38,11 +38,11 @@ def test_alpine_virt_tcg_gic_max(self):
         :avocado: tags=accel:tcg
         """
         iso_url = ('https://dl-cdn.alpinelinux.org/'
-                   'alpine/v3.16/releases/aarch64/'
-                   'alpine-virt-3.16.3-aarch64.iso')
+                   'alpine/v3.17/releases/aarch64/'
+                   'alpine-standard-3.17.2-aarch64.iso')
 
         # Alpine use sha256 so I recalculated this myself
-        iso_sha1 = '0683bc089486d55c91bf6607d5ecb93925769bc0'
+        iso_sha1 = '76284fcd7b41fe899b0c2375ceb8470803eea839'
         iso_path = self.fetch_asset(iso_url, asset_hash=iso_sha1)
 
         self.vm.set_console()
@@ -65,7 +65,7 @@ def test_alpine_virt_tcg_gic_max(self):
         self.vm.add_args('-object', 'rng-random,id=rng0,filename=/dev/urandom')
 
         self.vm.launch()
-        self.wait_for_console_pattern('Welcome to Alpine Linux 3.16')
+        self.wait_for_console_pattern('Welcome to Alpine Linux 3.17')
 
 
     def common_aarch64_virt(self, machine):
-- 
2.39.2


