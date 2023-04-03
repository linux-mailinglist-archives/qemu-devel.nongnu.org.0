Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B89BE6D462C
	for <lists+qemu-devel@lfdr.de>; Mon,  3 Apr 2023 15:50:36 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pjKYx-00032H-9B; Mon, 03 Apr 2023 09:49:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pjKYs-0002xX-Jm
 for qemu-devel@nongnu.org; Mon, 03 Apr 2023 09:49:30 -0400
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pjKYo-0004vi-Av
 for qemu-devel@nongnu.org; Mon, 03 Apr 2023 09:49:30 -0400
Received: by mail-wm1-x332.google.com with SMTP id
 n10-20020a05600c4f8a00b003ee93d2c914so19552524wmq.2
 for <qemu-devel@nongnu.org>; Mon, 03 Apr 2023 06:49:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680529765;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=BNNm+hFhYmn6A4btsbTy8z3ys/wMqr7F5fsQ6UPTE0U=;
 b=uMZTW/+EF5o1W2A5JdfLs4oBqxYHeVBh65G8DF6NWJWPjReRFhKuCC/ncNpHwzh1qs
 mMEW2tZDNckEfFHS0GjWwR6IQexwG7ZXXRhicNL8f20z5m5Wdk3P5cQ8w/jkdpiCdqDL
 nLh92n6g0umdfLVI/eQbiF1cxRXgRItEeUiApK+mbKSMit9AUhnjl4hdTriQp+jk79nE
 6tFc8cnDjdFMut0KwN1OCHIduIw+ynMVFPZ/mXSo/w5MIZx1TOwiMx0bB0B/C3Z3gm0j
 6ePgrajdov1CzO49xyt1IvyKD+1XurKgKZaKP/PrY/1o3SOzUPkceYK5rLcstSpCjaYb
 OY9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680529765;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=BNNm+hFhYmn6A4btsbTy8z3ys/wMqr7F5fsQ6UPTE0U=;
 b=PAgQW8SVBaO7qrjjQJiXbsV7dlV2FtGrDSZkTqf3EnGB05PBI6nP4CXj559X9oRPwl
 o5RP25Ex7eqMNO7qcCvsMgZuq/jS+fZlXqYIrUUVb1fme/UUn1I5tiSraHk8ySYM4UhA
 og/3EzTaghnKHH4tkfrWPognNYVo+CKVborXO0sN6kTcNSwtsu6PZqNl2bxFJUDuix3h
 bvxaxMf1CprMyCPdYUS+q04g8bJvXjC+K3oBfKujlIAw+uF0H/wpVtV0MP92GS6khpsG
 xJ/JIj0huP2lPMxQ1hYgUXgQoHZ/RHoDMoVCRKah+manRs93j7hVvsqd4E6eUR/qXJly
 E4bw==
X-Gm-Message-State: AAQBX9dg5lOdP8L2Th+af3v6Jek8IQR77naTuOaBkIWs6XC8E5qXllZI
 LyDNmXim3AHQXEPe48afYDjSdg==
X-Google-Smtp-Source: AKy350b3NNR46AzUUhLxuq4xz5tHpBeQaaVzMjYEw3SBCZ7bSYJ9UQeC7a2TmNiaH4Ew781UGyqx8w==
X-Received: by 2002:a7b:c4c7:0:b0:3ef:6ae7:8994 with SMTP id
 g7-20020a7bc4c7000000b003ef6ae78994mr21868141wmk.22.1680529765031; 
 Mon, 03 Apr 2023 06:49:25 -0700 (PDT)
Received: from zen.linaroharston ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 r16-20020a05600c35d000b003ee9f396dcesm19503795wmq.30.2023.04.03.06.49.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 Apr 2023 06:49:23 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 7E9FF1FFB7;
 Mon,  3 Apr 2023 14:49:21 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, Reinoud Zandijk <reinoud@netbsd.org>,
 Ryo ONODERA <ryoon@netbsd.org>, qemu-block@nongnu.org,
 Hanna Reitz <hreitz@redhat.com>, Warner Losh <imp@bsdimp.com>,
 Beraldo Leal <bleal@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Kyle Evans <kevans@freebsd.org>, kvm@vger.kernel.org,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Cleber Rosa <crosa@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Kevin Wolf <kwolf@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
Subject: [PATCH v2 08/11] tests/qemu-iotests: explicitly invoke 'check' via
 'python'
Date: Mon,  3 Apr 2023 14:49:17 +0100
Message-Id: <20230403134920.2132362-9-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230403134920.2132362-1-alex.bennee@linaro.org>
References: <20230403134920.2132362-1-alex.bennee@linaro.org>
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
Reviewed-by: Thomas Huth <thuth@redhat.com>
Message-Id: <20230330101141.30199-8-alex.bennee@linaro.org>
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


