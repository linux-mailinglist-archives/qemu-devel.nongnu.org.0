Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 55F236AE2D1
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Mar 2023 15:39:54 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZYSV-0005Iy-AJ; Tue, 07 Mar 2023 09:38:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pZYSN-0005Hh-LL
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 09:38:23 -0500
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pZYSL-0000ah-Sc
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 09:38:23 -0500
Received: by mail-wm1-x332.google.com with SMTP id
 d41-20020a05600c4c2900b003e9e066550fso7322551wmp.4
 for <qemu-devel@nongnu.org>; Tue, 07 Mar 2023 06:38:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678199900;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=yVuBcx8bAraesXJzVw4/vy4BNkiyUUyDJuqC6B8blNU=;
 b=koA48cWXYvlG5bLr7936ZXfUU4EziMOhDULPie8qBo1f5NZ32LrVhZyonBX6r2EPn5
 P1df5c1EvPOmuGhGsIr7r5GMBXNPxH8AoDhZPYVKrTZDF5Ju6EfP41OnxM09n0fu5scT
 SJwjHwxuySGo0tWD/Fx+yhGyTbb4a/vN+++YIjlElRS3iFkWp40CYUBp9nrzDPBwn/5M
 1env4Xhz6Gmjlrmq2B6ydE/xg0MeYBPsbR4Gj/k0rGXXctL5gm1D0C8JnsoQydAdAW1I
 jYmMol7LK2uAgooxXW5qzYIzAfTEDhb80RgSHukM3oyIBlxCqGqVw7+OsBnEFhXSIe9X
 eD1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678199900;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=yVuBcx8bAraesXJzVw4/vy4BNkiyUUyDJuqC6B8blNU=;
 b=bPuuvY6LBSxDHDKs9mex5lhBLLz5n8Us398NUc8BSjP8BN8rQYy7fcyH7rd+KnSdQn
 Ru2r5S5TC4Vn/tEDT5fRbLQPxJqwYC2WEfIkGw83/TJj/r6AUsRJIqjsDsHUT8XtQ/qX
 kef105Fqv46L3MlAYJ8A8gj6H3P0U+2aMO/hSeZ8wHUutSEb3k0qM8svNSyWJ7sOmEKj
 3hg8216yFWKu9wga+6HQraURZIJDqY4rtchXWNKzjwi0yRxFVn/9YNSSlvKxZXDbwAGB
 U+2C4fTEjxwAqs16QI2TemA8C/rbcM/NGB2amnwyTkj8FYGceE2RoAilKNUbzBW+gUWG
 Ov6Q==
X-Gm-Message-State: AO0yUKW+gJfGkwVIQth1HQlvTbY9LWCgukFI+jZwUt/lJPlJYsGxMOdy
 hl3+Zbi4xWxRxwNFOeNlrdgaEHttnQg1qLwbCBk=
X-Google-Smtp-Source: AK7set9z2LccKjide8whhxzgSYNE8q2ss1WHR8pqRuI1uNH6N5XFSW2u6OUSD3T/NxOCuOn2ziBISw==
X-Received: by 2002:a05:600c:3c8a:b0:3ea:dc39:e8b1 with SMTP id
 bg10-20020a05600c3c8a00b003eadc39e8b1mr12989854wmb.12.1678199900252; 
 Tue, 07 Mar 2023 06:38:20 -0800 (PST)
Received: from zen.linaroharston ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 hg13-20020a05600c538d00b003d9aa76dc6asm16858715wmb.0.2023.03.07.06.38.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Mar 2023 06:38:20 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 7BD591FFB8;
 Tue,  7 Mar 2023 14:38:19 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: John Snow <jsnow@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>, Beraldo Leal <bleal@redhat.com>,
 qemu-arm@nongnu.org (open list:Virt)
Subject: [PATCH 1/5] tests/avocado: update AArch64 tests to Alpine 3.17.2
Date: Tue,  7 Mar 2023 14:38:15 +0000
Message-Id: <20230307143819.510186-2-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230307143819.510186-1-alex.bennee@linaro.org>
References: <20230307143819.510186-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x332.google.com
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


