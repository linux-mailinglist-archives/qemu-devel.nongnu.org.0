Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ACCE06D66A9
	for <lists+qemu-devel@lfdr.de>; Tue,  4 Apr 2023 17:02:11 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pji8u-0004dW-5q; Tue, 04 Apr 2023 11:00:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pji8K-0004Hb-Sb
 for qemu-devel@nongnu.org; Tue, 04 Apr 2023 10:59:40 -0400
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pji8E-0005CP-NY
 for qemu-devel@nongnu.org; Tue, 04 Apr 2023 10:59:39 -0400
Received: by mail-wr1-x430.google.com with SMTP id m2so33142157wrh.6
 for <qemu-devel@nongnu.org>; Tue, 04 Apr 2023 07:59:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680620369;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=VLjuwoI0tklS2lCWxChUrAL9FHWkh8xZZV4DuqjaNu8=;
 b=lix3cDab6lA6a5zF/XVL/gEyA6yjcW8V29KxRtTplZ0Pfr/6E9jb66zb94lIUPEbOd
 wrP0TllA8lxVYTuvJd6FsDQSJu209dMmSEUdUn7Wp0QMw9eAVeyHyB8Qxb+ea8Q2604p
 oxpEd6Supc/kDgUVJq1MNH7F/MSXYdBP9hXTli1Ym9qFuVUv4iOMjCUIpTFfLSUdpoPf
 6NMsTHSd8gi+RcJ3pNMV6f9ab5B2N9utsEd0/093S/h6rLPPSsEOc2q6swXLiHc8+Hty
 /3BMw+23FoXSR/z9sMwKV1G8oNg5GgAdrlPAbQCWDDGdnTcsdQrEvHUwhYP5Id5xEMf4
 i6vQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680620369;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=VLjuwoI0tklS2lCWxChUrAL9FHWkh8xZZV4DuqjaNu8=;
 b=uW5mVhovV4yoIIK0a7ifkBntDe7tJY5crXl/E7PoB3z5EPbcxvJerKGfPCtt4nNe6R
 Ef8tMSaX0QQ9CHswMAQKMq+C6B9/YbILW1IdrfaylNTrRt7gK/CY1tG+iHNPXQOlhHhc
 Kp88CjcNpjO1a8EE3U7UGCJT+P8IR8EtSTL20BBkxyX8WYwfegLaubLWwlnTcP/Sq2pS
 lQRXKRsrZBLq+xE8QBqAPvN05JuPMy0EiyYnVmCFjVxvitut2vQLEC3Qpgmsc1515x3H
 hr3dSTbHBtgFbUbKFLAYN5qNt5nEXvrHrEPPtvOQtqdxmdMdPrvpB+fTnj5YZoUS5bSR
 0+zA==
X-Gm-Message-State: AAQBX9cxQER+QZ0A7R2XfjqOH/qtx1zkBHIQnZUi8STLz157d/UIJA8f
 ZDdrPcpPYiTX1pzZvgDrzeGqaA==
X-Google-Smtp-Source: AKy350aS8oM02H/ekewJGRw78SmhX/95fhBiiQMipsq1JRbGn/DJwBmtN/pGqgClUNXKuOqloiJDYw==
X-Received: by 2002:a5d:5704:0:b0:2ce:a8e4:bb79 with SMTP id
 a4-20020a5d5704000000b002cea8e4bb79mr1882574wrv.53.1680620369265; 
 Tue, 04 Apr 2023 07:59:29 -0700 (PDT)
Received: from zen.linaroharston ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 u18-20020a5d5152000000b002be5bdbe40csm12393408wrt.27.2023.04.04.07.59.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Apr 2023 07:59:27 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id BECCE1FFBF;
 Tue,  4 Apr 2023 15:59:25 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Thomas Huth <thuth@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>,
 qemu-block@nongnu.org (open list:Block layer core)
Subject: [PULL 07/10] tests/qemu-iotests: explicitly invoke 'check' via
 'python'
Date: Tue,  4 Apr 2023 15:59:22 +0100
Message-Id: <20230404145925.2638152-8-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230404145925.2638152-1-alex.bennee@linaro.org>
References: <20230404145925.2638152-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x430.google.com
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
Message-Id: <20230403134920.2132362-9-alex.bennee@linaro.org>

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


