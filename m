Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E3B426967CB
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Feb 2023 16:18:13 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pRx3r-0005o1-H1; Tue, 14 Feb 2023 10:17:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pRx3p-0005mO-92
 for qemu-devel@nongnu.org; Tue, 14 Feb 2023 10:17:37 -0500
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pRx3n-0005Ti-LS
 for qemu-devel@nongnu.org; Tue, 14 Feb 2023 10:17:36 -0500
Received: by mail-wr1-x429.google.com with SMTP id y1so16035373wru.2
 for <qemu-devel@nongnu.org>; Tue, 14 Feb 2023 07:17:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=fU/yBgdFMVlopZf6+UCk25Y+63cTrg34eGsGdzxBXFg=;
 b=EWLr4GVawRKkMIByEgAxV3FgELypY7bdPH0UYY7dWW6TJQnY2QxqEThPzps6e41r+P
 Hiz80J5rEvqNol/Y7Ak7/QPzp99KLGKbcO0GkhK3cKUa4YD7x95sgjLp5//YnDOfqrgi
 DuN9YLIfFrZ3tTQMO9OfZzTPSTmeoBZRrINhG9WiK9puhN12G7yUGk/xyq5mV/iSCA+g
 zBKKaqzgUX2sr8nCoCV933GK1HGmSmUuiqJgOsqrbUIRN2HDjuya/fcCOVjNa97NldMy
 laX8BBE7e1SP2fPD9Bb52beG6+B5kt7sTUqPCh514TqgsaEFmrae4fW8r6Yy8fk9OxZh
 z7fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=fU/yBgdFMVlopZf6+UCk25Y+63cTrg34eGsGdzxBXFg=;
 b=yVePCb69aczVrqoOudI5mBsLJZL9cEJzPthE+Q5cg2VmoWplmwADRhllupEkCBDzef
 YxwyOujq9mUyAzufH2QI4J8wRXEGRYSF18k76V0R5aOEl3VOBCG5qEed1ClPYbVV+IiO
 Il1vXH5TXpNhxL/EHo+nafYNaDVvYRg1GGdaJqjM9sfZAgM/KtN5EWM45MJNotCufqtB
 THovk4qVRgVG5TRZUzjSHSOgGduiBHfT0X7JCpbzBWMC/QrS5JPrTWUiXlkPbiKXWL0q
 aB0MIDBWcKnHmtm6ueoIgrZ7DWLfcVjKeXRi6uqcvQhGrb25W0zjOimoCOr4lj/NbaBk
 laQw==
X-Gm-Message-State: AO0yUKUNRAv/HbhHveMagq15k0LSmOuxEaI0KYh7gq93tIh/sQbv8tA1
 FqxdCLYMIerrCctnrwh6vnuYJA==
X-Google-Smtp-Source: AK7set88fbBeTH5+srcGXqRKxegEzXBHvUMyFCvHganT+LPDnvik4b/Kt7OCO/qXNInm37L/XxO35w==
X-Received: by 2002:adf:e48b:0:b0:2c5:4480:b590 with SMTP id
 i11-20020adfe48b000000b002c54480b590mr2329844wrm.54.1676387854139; 
 Tue, 14 Feb 2023 07:17:34 -0800 (PST)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 o7-20020a056000010700b002c559def236sm4620778wrx.57.2023.02.14.07.17.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Feb 2023 07:17:33 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 2DB8A1FFB7;
 Tue, 14 Feb 2023 15:17:33 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Thomas Huth <thuth@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>
Subject: [RFC PATCH] tests: ensure we export job results for some cross builds
Date: Tue, 14 Feb 2023 15:17:26 +0000
Message-Id: <20230214151726.3844382-1-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x429.google.com
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

We do run tests on some cross builds. Provide a template to ensure we
export the testlog to the build artefacts and report the test results
via the junit.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Reported-by: Peter Maydell <peter.maydell@linaro.org>
---
 .gitlab-ci.d/crossbuild-template.yml | 11 +++++++++++
 .gitlab-ci.d/crossbuilds.yml         |  6 +++---
 2 files changed, 14 insertions(+), 3 deletions(-)

diff --git a/.gitlab-ci.d/crossbuild-template.yml b/.gitlab-ci.d/crossbuild-template.yml
index 6d709628f1..24a41a7b21 100644
--- a/.gitlab-ci.d/crossbuild-template.yml
+++ b/.gitlab-ci.d/crossbuild-template.yml
@@ -48,3 +48,14 @@
           nios2-linux-user or1k-linux-user ppc-linux-user sparc-linux-user
           xtensa-linux-user $CROSS_SKIP_TARGETS"
     - make -j$(expr $(nproc) + 1) all check-build $MAKE_CHECK_ARGS
+
+# We can still run some tests on some of our cross build jobs. They can add this
+# template to their extends to save the build logs and test results
+.cross_test_artifacts:
+  artifacts:
+    name: "$CI_JOB_NAME-$CI_COMMIT_REF_SLUG"
+    expire_in: 7 days
+    paths:
+      - build/meson-logs/testlog.txt
+    reports:
+      junit: build/meson-logs/testlog.junit.xml
diff --git a/.gitlab-ci.d/crossbuilds.yml b/.gitlab-ci.d/crossbuilds.yml
index 74d6259b90..ab783e90db 100644
--- a/.gitlab-ci.d/crossbuilds.yml
+++ b/.gitlab-ci.d/crossbuilds.yml
@@ -44,7 +44,7 @@ cross-arm64-user:
     IMAGE: debian-arm64-cross
 
 cross-i386-system:
-  extends: .cross_system_build_job
+  extends: .cross_system_build_job .cross_test_artifacts
   needs:
     job: i386-fedora-cross-container
   variables:
@@ -52,7 +52,7 @@ cross-i386-system:
     MAKE_CHECK_ARGS: check-qtest
 
 cross-i386-user:
-  extends: .cross_user_build_job
+  extends: .cross_user_build_job .cross_test_artifacts
   needs:
     job: i386-fedora-cross-container
   variables:
@@ -60,7 +60,7 @@ cross-i386-user:
     MAKE_CHECK_ARGS: check
 
 cross-i386-tci:
-  extends: .cross_accel_build_job
+  extends: .cross_accel_build_job .cross_test_artifacts
   timeout: 60m
   needs:
     job: i386-fedora-cross-container
-- 
2.39.1


