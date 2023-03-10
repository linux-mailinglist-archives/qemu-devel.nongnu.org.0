Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D16B46B3C42
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Mar 2023 11:32:59 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1paa27-0007V6-H1; Fri, 10 Mar 2023 05:31:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1paa24-0007Sd-3U
 for qemu-devel@nongnu.org; Fri, 10 Mar 2023 05:31:28 -0500
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1paa21-0004F5-QL
 for qemu-devel@nongnu.org; Fri, 10 Mar 2023 05:31:27 -0500
Received: by mail-wm1-x32e.google.com with SMTP id
 t25-20020a1c7719000000b003eb052cc5ccso5644659wmi.4
 for <qemu-devel@nongnu.org>; Fri, 10 Mar 2023 02:31:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678444284;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Zi6VB9UypSQYVjsaNXXR4LjTYb9nNfCWY76hjcqaqgY=;
 b=Z6yYhL3hIORdDWNBitdAJVrjg7yvotYXxm8ewRsSa7tXUUdL45Di0LN9CgV7XJfQDN
 N9NzgpisMfjX7mDDHkGXpgaAgB7gWmjkugTh3D5SCDzjG8Rkmqs4+YPxciCbXdt2EdNS
 aefKJxRBoTt0paYpRCbAHB2auruNWtaY6tEvcCenpXrmwF7jAxvbhoNV/bxDTFP2md7M
 rFmJ2qplaAEFrwxlZ9kaOQ7QRCIRkN1tH37Xa/01MuRSZ7hqKlA3l7bT5KOiyyaJwtl3
 cV0W+jQHOd1bX8h/yhFfhuMPDr7NmGMGxFYFj7k6YyqSI0N8j2dOrS7iTcJuBG/7wj4d
 cBvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678444284;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Zi6VB9UypSQYVjsaNXXR4LjTYb9nNfCWY76hjcqaqgY=;
 b=wom9OiP6sylzUglGzOYCIdrzsdauEO7iIM6YTrEgVoyZ3or1FtA2V7X4tdE4sVl+iD
 k0kD3ZPfOaUmyj4WGLuV1dRmZ8RChDDSe/CCVQsk+EfJI3bhp1QYcaO4J0BJXSPdOCTc
 51YPwEBuWd+pVNz7+Udi10VJrSkAVQ+SkAw+2rkCueTSWiItt29JQV20o/4vVLZUnYwZ
 RQAT26uEQyGR6AejrebLwFA5UwqbVo2h12X4D6rRKhVMU9cQB0sTPb34PVAtumAbib2T
 vUVTrF0KRIcI7B09wrKkdPfXQmoi4BaIOF+SyYzYczXDrnj11U5qfQfuTa6zetbSrFw+
 I1OQ==
X-Gm-Message-State: AO0yUKVrFf8XNC+odaPH1Z0NywyRuSzqc/d7cVjUZ8FK+llNid2GW5Dx
 tckQKIgInoTvYV5vo7bQpFopNw==
X-Google-Smtp-Source: AK7set/eN4cnMfNSzDVCHylDbzGgUMD0wNulXbvsH++eHM+vVLibYjb2+M/enytdnLdwfklPGWJ2ug==
X-Received: by 2002:a05:600c:354f:b0:3ea:f883:4f5 with SMTP id
 i15-20020a05600c354f00b003eaf88304f5mr2100591wmq.17.1678444284347; 
 Fri, 10 Mar 2023 02:31:24 -0800 (PST)
Received: from zen.linaroharston ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 16-20020a05600c021000b003eb966d39desm1848036wmi.2.2023.03.10.02.31.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Mar 2023 02:31:24 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 9DC2B1FFB8;
 Fri, 10 Mar 2023 10:31:23 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: David Hildenbrand <david@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-arm@nongnu.org,
 Peter Xu <peterx@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>, Cleber Rosa <crosa@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Beraldo Leal <bleal@redhat.com>,
 Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
Subject: [PATCH 01/11] tests/avocado: update AArch64 tests to Alpine 3.17.2
Date: Fri, 10 Mar 2023 10:31:13 +0000
Message-Id: <20230310103123.2118519-2-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230310103123.2118519-1-alex.bennee@linaro.org>
References: <20230310103123.2118519-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32e.google.com
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

From: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>

To test Alpine boot on SBSA-Ref target we need Alpine Linux
'standard' image as 'virt' one lacks kernel modules.

So to minimalize Avocado cache I move test to 'standard' image.

Signed-off-by: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Message-Id: <20230302191146.1790560-1-marcin.juszkiewicz@linaro.org>
---
 tests/avocado/machine_aarch64_virt.py | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

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


