Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 76B496D00C1
	for <lists+qemu-devel@lfdr.de>; Thu, 30 Mar 2023 12:12:20 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1phpG9-0007Yv-Bx; Thu, 30 Mar 2023 06:11:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1phpG6-0007W7-4T
 for qemu-devel@nongnu.org; Thu, 30 Mar 2023 06:11:54 -0400
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1phpG0-0000ID-1d
 for qemu-devel@nongnu.org; Thu, 30 Mar 2023 06:11:52 -0400
Received: by mail-wm1-x332.google.com with SMTP id
 v20-20020a05600c471400b003ed8826253aso3172141wmo.0
 for <qemu-devel@nongnu.org>; Thu, 30 Mar 2023 03:11:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680171106;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=xJESc3vRxMeUkJokIIbDRbo6dBnH1WDID4CWuuBjrPc=;
 b=y4WJhZMeMc8S6zRFYuAO1yg8qQeNukRifQTeynVVGg33Q86rPnl+9tQ0nUXUhrq8TX
 c3bihTW0U61yPcRdTTvZ3PQPoH85s5Y01Po0lnO6diiM2SuCwK0XqgYN2wvsmPh5kHKL
 qY/PLb5hAo4eS1PqsjNXJwcuG2M7zqCCmLzxx+sRt8yclcu4owjiIAQG4zuvBkPBdYNA
 lAvzwlGTDe93x+WQL71uFrvrTLWZgVA2WSmWfbHqmOM65oBNHNLCgeo+0SKwcKC8RZpI
 ntaEMUSCIMdbhSIdZ4p44cUu3KyHphsa4tcSuT9InGiNyUzEM1U/cWJ74LusLMWIiSIf
 n6Zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680171106;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=xJESc3vRxMeUkJokIIbDRbo6dBnH1WDID4CWuuBjrPc=;
 b=oWK5Ayg7LGjq+Qjpi3ADMy8bbFcNNUeiYTivOe0VpAqnzEase62uhSnBBRThnaXLgc
 Hq7kkA4HEJWPu556Sxf9/ThHkk5V7d5fbhNPsaEBwAXjBG2CCzzdpm9mmBrdclVRgHo6
 fhsPpZYRgLuLu1SrU/JOScZ4dI4YK1D9vII2M5pGl7o097lnnKpGzmRce0YZbeaCW1LE
 eoWE7hgn+XHsIvntGwr9EAx5tw8z501hp89cTf9A0jtAp8TZ9fb3+VEizHKsLXgnHKJv
 nqhoWAJCU2lHMoYOVzWQaoTy6tGlhPS70R5sMP6Yz0foxM3Fb4iyo8tiHqLJFPQVZUVQ
 4R2w==
X-Gm-Message-State: AO0yUKVQRzO3E2r53/vz7lkveBRRWuFLmyfpA6eaxbZHQdpX/EH1Td3D
 2wIryqDJwfLCDWGY4UVZu6RyiQ==
X-Google-Smtp-Source: AK7set9LcYcxzZQ1tbTDrqpYmII1/rA4Tz4OvyIyTH8G64pT5F8aivBfbYXXzT6R3e4T7SOFQZb/bw==
X-Received: by 2002:a1c:790b:0:b0:3ee:7022:5eda with SMTP id
 l11-20020a1c790b000000b003ee70225edamr17455877wme.7.1680171106468; 
 Thu, 30 Mar 2023 03:11:46 -0700 (PDT)
Received: from zen.linaroharston ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 m16-20020a7bca50000000b003ee10fb56ebsm5370560wml.9.2023.03.30.03.11.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 Mar 2023 03:11:44 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id C33BF1FFBF;
 Thu, 30 Mar 2023 11:11:42 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Warner Losh <imp@bsdimp.com>, Ryo ONODERA <ryoon@netbsd.org>,
 Kevin Wolf <kwolf@redhat.com>, Beraldo Leal <bleal@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>, qemu-block@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Kyle Evans <kevans@freebsd.org>, Reinoud Zandijk <reinoud@netbsd.org>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Subject: [PATCH 07/11] tests/qemu-iotests: explicitly invoke 'check' via
 'python'
Date: Thu, 30 Mar 2023 11:11:37 +0100
Message-Id: <20230330101141.30199-8-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230330101141.30199-1-alex.bennee@linaro.org>
References: <20230330101141.30199-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

From: Daniel P. Berrangé <berrange@redhat.com>

The 'check' script will use "#!/usr/bin/env python3" by default
to locate python, but this doesn't work in distros which lack a
bare 'python3' binary like NetBSD.

We need to explicitly invoke 'check' by referring to the 'python'
variable in meson, which resolves to the detected python binary
that QEMU intends to use.

This fixes a regression introduced by

  commit 51ab5f8bd795d8980351f8531e54995ff9e6d163
  Author: Daniel P. Berrangé <berrange@redhat.com>
  Date:   Wed Mar 15 17:43:23 2023 +0000

    iotests: register each I/O test separately with meson

Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Message-Id: <20230329124539.822022-1-berrange@redhat.com>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 tests/qemu-iotests/meson.build | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/tests/qemu-iotests/meson.build b/tests/qemu-iotests/meson.build
index a162f683ef..9735071a29 100644
--- a/tests/qemu-iotests/meson.build
+++ b/tests/qemu-iotests/meson.build
@@ -47,19 +47,20 @@ foreach format, speed: qemu_iotests_formats
   endif
 
   rc = run_command(
-      [qemu_iotests_check_cmd] + args + ['-n'],
+      [python, qemu_iotests_check_cmd] + args + ['-n'],
       check: true,
   )
 
   foreach item: rc.stdout().strip().split()
-      args = ['-tap', '-' + format, item,
+      args = [qemu_iotests_check_cmd,
+              '-tap', '-' + format, item,
               '--source-dir', meson.current_source_dir(),
               '--build-dir', meson.current_build_dir()]
       # Some individual tests take as long as 45 seconds
       # Bump the timeout to 3 minutes for some headroom
       # on slow machines to minimize spurious failures
       test('io-' + format + '-' + item,
-           qemu_iotests_check_cmd,
+           python,
            args: args,
            depends: qemu_iotests_binaries,
            env: qemu_iotests_env,
-- 
2.39.2


