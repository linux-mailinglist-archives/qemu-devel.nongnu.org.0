Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 063C2698487
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Feb 2023 20:28:03 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pSNPh-00072m-KK; Wed, 15 Feb 2023 14:25:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pSNPR-0006kf-HP
 for qemu-devel@nongnu.org; Wed, 15 Feb 2023 14:25:42 -0500
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pSNPP-0001ir-1O
 for qemu-devel@nongnu.org; Wed, 15 Feb 2023 14:25:41 -0500
Received: by mail-wr1-x42e.google.com with SMTP id bu23so20230836wrb.8
 for <qemu-devel@nongnu.org>; Wed, 15 Feb 2023 11:25:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=HrkxQ4C8k4Tf9raZcUSEIFG81EdtIwTYG8FkdkShoug=;
 b=cuOWh82eTNLuO4Ql+ZYMaRjCYwpl2RsbFSkfEVePIXW/t7kAR9f092btU8BPWh6/oC
 UKKR1gnjio1qpDfc5KwWwjUjP4UlyGb45wyzNwApO0Qd9vzhx2enTH38VAwiw4PKEWje
 pqOaPE/gj9Bwu/BuoOLnKHgTfgL3hFN0j1X/eqJcmntVBZhcSuLj/OeyOvM4oOSIfRLc
 4IFKznThYRrLqH/YLYrAMDK3AGrprucKDZuU4+54Ri48wwqZ/4k5U2AREM/jqbIBWWBW
 GbToE/0SsifU8fFURdxAY7eeaIS4cmAH+6C8p0uIWoN73a6C7Afvuyd165LVrnLWtuor
 z2FA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=HrkxQ4C8k4Tf9raZcUSEIFG81EdtIwTYG8FkdkShoug=;
 b=zsAUVt0glm+7h8fx2fpZm2ZVnUlSVS9srvX97EH771SXKckvn4LdauzeHpGIIfddsL
 qLSx+/YKnnqtrg4ZGi1CUgfMCl4VMK6AZiWfh9uUBcAUV+mMFykH7CWM9/Nd7I3OKN/D
 1/K8ZjGTgiMW7lt1Gn8jAzqMeloZdtL7ctWheR7wZ11JbASLOUOOZWMEg9HugFwLlVra
 hcLQ3Ku0oolufF3t0C74ZUx1LyDpMXYAX5ZmMTaQsl7EvQBlVhAvVap/D4BBOjGLvEgd
 WPwTdd/wqsMTLeZYI1K842OdXHKMqu5NbzZTCDfrvxxfBSX5DNsrZ4uzgDykel86r9Yt
 AmMw==
X-Gm-Message-State: AO0yUKWVd0W9NLyLY7yxI/vqE2WdRkoXR2piKt0rphdALhsNSCO3/qK5
 d26HoXKeIgljBw5niRoXr+VmxA==
X-Google-Smtp-Source: AK7set9MEhfBMGdddqhD0PWGcu4p9bw3r1ciLlJ2chpBmd9z0u+qWPA56UpjTFuiC1v4W5cG1q7qYA==
X-Received: by 2002:adf:f64f:0:b0:2c5:592b:b71b with SMTP id
 x15-20020adff64f000000b002c5592bb71bmr2653740wrp.45.1676489137534; 
 Wed, 15 Feb 2023 11:25:37 -0800 (PST)
Received: from zen.linaroharston ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 r3-20020a5d6943000000b002c551ae8cc1sm11213538wrw.67.2023.02.15.11.25.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Feb 2023 11:25:35 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id ECAF31FFC2;
 Wed, 15 Feb 2023 19:25:31 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: Michael Roth <michael.roth@amd.com>, Alexander Bulekov <alxndr@bu.edu>,
 Qiuhao Li <Qiuhao.Li@outlook.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Markus Armbruster <armbru@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 qemu-arm@nongnu.org, John Snow <jsnow@redhat.com>,
 Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>,
 Darren Kenny <darren.kenny@oracle.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Stefan Hajnoczi <stefanha@redhat.com>, Bandan Das <bsd@redhat.com>,
 Cleber Rosa <crosa@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Yonggang Luo <luoyonggang@gmail.com>, Li-Wen Hsu <lwhsu@freebsd.org>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Beraldo Leal <bleal@redhat.com>,
 Ed Maste <emaste@freebsd.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>
Subject: [PATCH 12/12] tests: ensure we export job results for some cross
 builds
Date: Wed, 15 Feb 2023 19:25:30 +0000
Message-Id: <20230215192530.299263-13-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230215192530.299263-1-alex.bennee@linaro.org>
References: <20230215192530.299263-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42e.google.com
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
v2
  - properly format extends
---
 .gitlab-ci.d/crossbuild-template.yml | 11 +++++++++++
 .gitlab-ci.d/crossbuilds.yml         | 12 +++++++++---
 2 files changed, 20 insertions(+), 3 deletions(-)

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


