Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AFB636A0D6F
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Feb 2023 17:00:07 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pVDyU-0000gR-MP; Thu, 23 Feb 2023 10:57:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pVDyM-0000DH-IA
 for qemu-devel@nongnu.org; Thu, 23 Feb 2023 10:57:30 -0500
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pVDyJ-0004kX-Qx
 for qemu-devel@nongnu.org; Thu, 23 Feb 2023 10:57:30 -0500
Received: by mail-wm1-x32c.google.com with SMTP id
 o4-20020a05600c4fc400b003e1f5f2a29cso11048256wmq.4
 for <qemu-devel@nongnu.org>; Thu, 23 Feb 2023 07:57:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=N0gT91TwddcekKpXGf8wUv0YctxEtYUGFWLQ38Ww0OA=;
 b=tWcmn04Ni5qFG25NrV+kVowGr37vhOaHoghCfuPNm3Pj8mhb4Pvr1Kc+QKih1b0EtX
 e65tKaMEglDV6Ua00DIgfe7f9Yxyyka72RFAF98k3BpDOFCQLl14um8fK/NebTlYj/5c
 TZkU7ChKC8icSmqo5VGWsvcvvANFg2NG9wACt59Gy+nIRV3+8P8jB6l1hRWlyFI7biQl
 woXJYshDIxl/U29iXSdRyCbM5qXxox0cXGmNj6AZGqRpCN68pQfPT7KVLvklRbu/+8uC
 HM19sCC4gm/pKNJ4OXFwqbgXaNURVh7tWxQAt+LrZ481eTLccC1ptwXJMzjY48ckQiXV
 FDIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=N0gT91TwddcekKpXGf8wUv0YctxEtYUGFWLQ38Ww0OA=;
 b=azeLpSqK6lR7kNKhfMwTkF4qb2NvdzVrEfuODPg+ytw5sBbApkmVmcgie5kuxbwSQS
 UQ9Ebiu4RZMkDf+4nhwaOIqDIPbBks4fv2/c02rdFGKRfRLMY4tpXeqVZIdPqY+PjHOU
 QzzZtFZxN8j4poZx9I5NRurpZFRL+bGYj7b2X1dZe0lwakX96EXWE8dzC38T0T30zcHO
 WirZMtwSLML8dMJkGPi4l1//EgccKDGbxfvC2kmrWK1mwVMVqRRephSFrRaSFCnoNODs
 t0JeENS18eMFLjvpNIbDUylhDUwXHu/JRIX1+lQo74eK66uudRObT5d3Nb/iEOtTXrYY
 hG9w==
X-Gm-Message-State: AO0yUKVQp3nK9UmlQvDceoYMDyd11eQx9W0A2vM4wWGkiyor0XGGlZew
 pjLMGGbXpiE6WIOMpqqvfvE9SA==
X-Google-Smtp-Source: AK7set/A1zbHglEJdotSya1unAvXqW7OPaS5mnq7u+uUhL2UjuWZwJrlhGcK5wz22QzQ/m/daJ4DGw==
X-Received: by 2002:a05:600c:2e93:b0:3e1:f8af:8ef1 with SMTP id
 p19-20020a05600c2e9300b003e1f8af8ef1mr8569068wmn.22.1677167846073; 
 Thu, 23 Feb 2023 07:57:26 -0800 (PST)
Received: from zen.linaroharston ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 r26-20020a05600c2f1a00b003eae73ee4a1sm307879wmn.17.2023.02.23.07.57.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 Feb 2023 07:57:23 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 044421FFC2;
 Thu, 23 Feb 2023 15:57:22 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>
Subject: [PULL 12/13] tests: ensure we export job results for some cross builds
Date: Thu, 23 Feb 2023 15:57:19 +0000
Message-Id: <20230223155720.310593-13-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230223155720.310593-1-alex.bennee@linaro.org>
References: <20230223155720.310593-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32c.google.com
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
Reviewed-by: Thomas Huth <thuth@redhat.com>
Message-Id: <20230221094558.2864616-14-alex.bennee@linaro.org>

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
index 74d6259b90..bbc013725c 100644
--- a/.gitlab-ci.d/crossbuilds.yml
+++ b/.gitlab-ci.d/crossbuilds.yml
@@ -44,7 +44,9 @@ cross-arm64-user:
     IMAGE: debian-arm64-cross
 
 cross-i386-system:
-  extends: .cross_system_build_job
+  extends:
+    - .cross_system_build_job
+    - .cross_test_artifacts
   needs:
     job: i386-fedora-cross-container
   variables:
@@ -52,7 +54,9 @@ cross-i386-system:
     MAKE_CHECK_ARGS: check-qtest
 
 cross-i386-user:
-  extends: .cross_user_build_job
+  extends:
+    - .cross_user_build_job
+    - .cross_test_artifacts
   needs:
     job: i386-fedora-cross-container
   variables:
@@ -60,7 +64,9 @@ cross-i386-user:
     MAKE_CHECK_ARGS: check
 
 cross-i386-tci:
-  extends: .cross_accel_build_job
+  extends:
+    - .cross_accel_build_job
+    - .cross_test_artifacts
   timeout: 60m
   needs:
     job: i386-fedora-cross-container
-- 
2.39.1


