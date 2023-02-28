Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B85216A5F55
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Feb 2023 20:11:22 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pX5KE-0002Z9-W0; Tue, 28 Feb 2023 14:07:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pX5Jk-0002JP-Gb
 for qemu-devel@nongnu.org; Tue, 28 Feb 2023 14:07:18 -0500
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pX5JV-0002lm-CV
 for qemu-devel@nongnu.org; Tue, 28 Feb 2023 14:07:12 -0500
Received: by mail-wm1-x32a.google.com with SMTP id
 j19-20020a05600c1c1300b003e9b564fae9so10325123wms.2
 for <qemu-devel@nongnu.org>; Tue, 28 Feb 2023 11:07:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=d4/zhLSmWu13QgiQEwsSfeYVh8tCmBtEQrl59j5YpTg=;
 b=rC4TFzncAMB3T8V8Yj44eWdFnaC9m1ZYtwQGg9xS11jJmWPrpvBHBpjt6HTaeDtMZF
 CLXYAQWThT3G2blEqiJhr1S/vl0FaUCFjYAQZTK454yq7kViK/Obg6vZu3nOKyaxBd1Y
 IXtP7B8h5tt1bxs3y9k5dqSeQ8zLTkUFGY0SSiHrv+N9VRorCoqCZddi10KM97kR1jsr
 zr3csqoqom6gedCTZfcJcjswivk2ziZB/UBptZAU+61llKr17aIYnpxCzV2JsV56FPp1
 mOluBmQjK4VjlgVZkN5l76I2VSSD7dW4uFuUYZqxjwXoSUcGAGkZ1JtWiI63GZzmTFsi
 wz+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=d4/zhLSmWu13QgiQEwsSfeYVh8tCmBtEQrl59j5YpTg=;
 b=VR8YVcN/xNRcaBuoZBXEUP7cdCQW2PyyuOsZowIBSCKwpDSRH1MjII/6wegWbwltbW
 ucMPchx3okI4YDgbRA3Saz13zKdXreGS6LWI6Abj0isS0yXDgY5ryqJH/jR4DhkXSa2T
 yPisrQA/CtiOXxkYcNqp32FaqSLELNmFLmVf4zQljnR4aj4yrXZI/z4lltL8beFZkSE4
 BZxD6rPWXCueZKIH8arUlp+8e/AEslqND7G376iSku3xFJx4BpWKlpeKshsz6jolszvU
 1Fp4/pW7YBdNJvnqbsh+rmU6MU8NJajbdPLjTU6RA5iVOMEifyUcH7G+Vbl3LZ5E2kO/
 3cSg==
X-Gm-Message-State: AO0yUKXTriQl7f2Jo+cyEOsYqVhHLM5HH2tK1K9p5zoJ46lgx0bH9S7S
 p+jFNaVYszyvnBCFTB4G2iOMqQ==
X-Google-Smtp-Source: AK7set+ZTpJkKEkkVr9iGmOWyDtwydlg0yb1R4Lv4aLS+Il4nmZEIVA72vg0fA94YYyIz1ZbFgM2LQ==
X-Received: by 2002:a05:600c:a694:b0:3dc:4b87:a570 with SMTP id
 ip20-20020a05600ca69400b003dc4b87a570mr3395774wmb.35.1677611220433; 
 Tue, 28 Feb 2023 11:07:00 -0800 (PST)
Received: from zen.linaroharston ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 m4-20020a05600c4f4400b003e209b45f6bsm18218045wmq.29.2023.02.28.11.06.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Feb 2023 11:06:56 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id B15711FFC2;
 Tue, 28 Feb 2023 19:06:54 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Michael Roth <michael.roth@amd.com>,
 Peter Maydell <peter.maydell@linaro.org>, Kevin Wolf <kwolf@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Beraldo Leal <bleal@redhat.com>, Alexander Bulekov <alxndr@bu.edu>,
 Aurelien Jarno <aurelien@aurel32.net>,
 Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Darren Kenny <darren.kenny@oracle.com>, Hanna Reitz <hreitz@redhat.com>,
 Cleber Rosa <crosa@redhat.com>, John Snow <jsnow@redhat.com>,
 Ed Maste <emaste@freebsd.org>, qemu-arm@nongnu.org,
 Fam Zheng <fam@euphon.net>, Thomas Huth <thuth@redhat.com>,
 Yonggang Luo <luoyonggang@gmail.com>, qemu-block@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Bandan Das <bsd@redhat.com>, Li-Wen Hsu <lwhsu@freebsd.org>,
 Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>,
 Laurent Vivier <lvivier@redhat.com>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Qiuhao Li <Qiuhao.Li@outlook.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>
Subject: [PATCH v3 12/24] tests: ensure we export job results for some cross
 builds
Date: Tue, 28 Feb 2023 19:06:41 +0000
Message-Id: <20230228190653.1602033-13-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230228190653.1602033-1-alex.bennee@linaro.org>
References: <20230228190653.1602033-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32a.google.com
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
---
 .gitlab-ci.d/crossbuild-template.yml | 11 +++++++++++
 .gitlab-ci.d/crossbuilds.yml         | 12 +++++++++---
 2 files changed, 20 insertions(+), 3 deletions(-)

diff --git a/.gitlab-ci.d/crossbuild-template.yml b/.gitlab-ci.d/crossbuild-template.yml
index d07989e3b0..4f93b9e4e5 100644
--- a/.gitlab-ci.d/crossbuild-template.yml
+++ b/.gitlab-ci.d/crossbuild-template.yml
@@ -49,3 +49,14 @@
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
index 101416080c..d3a31a2112 100644
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
2.39.2


