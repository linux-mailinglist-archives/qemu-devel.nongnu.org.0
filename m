Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DD1A36A5F8C
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Feb 2023 20:21:33 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pX5X9-0007fd-KZ; Tue, 28 Feb 2023 14:21:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pX5X7-0007as-2o
 for qemu-devel@nongnu.org; Tue, 28 Feb 2023 14:21:05 -0500
Received: from mail-lj1-x22e.google.com ([2a00:1450:4864:20::22e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pX5X5-00068o-29
 for qemu-devel@nongnu.org; Tue, 28 Feb 2023 14:21:04 -0500
Received: by mail-lj1-x22e.google.com with SMTP id by8so11430732ljb.7
 for <qemu-devel@nongnu.org>; Tue, 28 Feb 2023 11:21:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=zjfLbbeWo1zRN8aNmhtafD+qUQTe9TytE2JRGCWnF7o=;
 b=DL6ivUit2IrH5OAEzagTY4OxPP6moKy93Bs8Z8xWKoMxE8GoNJeddSepbG5NrZ4xyn
 OhY81QXBgAD+A81ydRHmvcBUm5gmAR597XLF4M7JXRPrrYzyiDb0LpfV8i9kMN7dL0mh
 ktS0I4lFiIpekVg2uw1azH+yt6zlBPNcvlCRuz1NSGF1V9I9IqCSwuCEz96n6iWZrpEH
 KbX8UlnJ9yld9TgIN8q5d25o3uVVPHp6wGNCoD3ja7eyxRe0JmQJH2NEw97nUdUD/uFW
 l1VXPC1p3mU+fk89Yfc9EepgSEl2DNM/9paEXypgqD9R9zNCrnSkGPNVQmw1xzqfzLd3
 fYaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=zjfLbbeWo1zRN8aNmhtafD+qUQTe9TytE2JRGCWnF7o=;
 b=V06kCFmUEIv+KsX/E3RRF9UeUNlk2QbOR0OCz72ykaYHCikwUKQbBPsEdXuBjmJdi+
 JPTPd1dMkDyYLz13OsJA855I7F1rQiOM26UFl/K4/zMpuTBPkOoii8Sg3xeztBMspzzF
 +Q0RrjxtPD+jM3At+qvD9CDKAN+tZIAJ4L05bn4+p4GBRlchcJxTnATAxwQjIeKt+7Vq
 5uSWbaDcXajORel6rB8eGqTaOciowu75y3IgZFOsBS7PWB+TvKxzJaJ7GCZVHPTiHtyD
 AK/Ja7zfqDIPIvvUWxNU2qbPXA6d3iQ0piPVdG00gL37Ms996iLJ63fhTTmEhzlh5Vbf
 MKmA==
X-Gm-Message-State: AO0yUKX7FOaUBqtoWISiv0qY96TyqQ2AsoFW48ctfjPJT2mmKfEqcMSw
 zvLOBw0ntzyBMP9bo87VYCG/X6XXgM/JhMQe
X-Google-Smtp-Source: AK7set//QCnD6y2HHGUdeeDXo+1ml41pmnGt2ufVOwOndFyKR55tNu5Qjj/Gyy8cXk//HpNzcv5u+w==
X-Received: by 2002:a05:600c:3296:b0:3ea:e582:48dd with SMTP id
 t22-20020a05600c329600b003eae58248ddmr3057294wmp.34.1677611663440; 
 Tue, 28 Feb 2023 11:14:23 -0800 (PST)
Received: from zen.linaroharston ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 t3-20020a5d6903000000b002c56af32e8csm10765603wru.35.2023.02.28.11.14.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Feb 2023 11:14:22 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 257451FFC9;
 Tue, 28 Feb 2023 19:06:56 +0000 (GMT)
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
Subject: [PATCH v3 22/24] gitlab: move the majority of artefact handling to a
 template
Date: Tue, 28 Feb 2023 19:06:51 +0000
Message-Id: <20230228190653.1602033-23-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230228190653.1602033-1-alex.bennee@linaro.org>
References: <20230228190653.1602033-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::22e;
 envelope-from=alex.bennee@linaro.org; helo=mail-lj1-x22e.google.com
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

To avoid lots of copy and paste lets deal with artefacts in a
template. This way we can filter out most of the pre-binary object and
library files we no longer need as we have the final binaries.

build-system-alpine also saved .git-submodule-status so for simplicity
we bring that into the template as well.

As an example the build-system-ubuntu artefacts before this patch
where around 1.3 GB, after dropping the object files it comes to 970
MB.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 .gitlab-ci.d/buildtest-template.yml | 16 ++++++
 .gitlab-ci.d/buildtest.yml          | 81 +++++++++++------------------
 2 files changed, 46 insertions(+), 51 deletions(-)

diff --git a/.gitlab-ci.d/buildtest-template.yml b/.gitlab-ci.d/buildtest-template.yml
index cb96b55c3f..a6cfe9be97 100644
--- a/.gitlab-ci.d/buildtest-template.yml
+++ b/.gitlab-ci.d/buildtest-template.yml
@@ -25,6 +25,22 @@
         make -j"$JOBS" $MAKE_CHECK_ARGS ;
       fi
 
+# We jump some hoops in common_test_job_template to avoid
+# rebuilding all the object files we skip in the artifacts
+.native_build_artifact_template:
+  artifacts:
+    expire_in: 2 days
+    paths:
+      - build
+      - .git-submodule-status
+    exclude:
+      - build/**/*.p
+      - build/**/*.a.p
+      - build/**/*.fa.p
+      - build/**/*.c.o
+      - build/**/*.c.o.d
+      - build/**/*.fa
+
 .common_test_job_template:
   extends: .base_job_template
   stage: test
diff --git a/.gitlab-ci.d/buildtest.yml b/.gitlab-ci.d/buildtest.yml
index 43f9e4a81d..44b8275299 100644
--- a/.gitlab-ci.d/buildtest.yml
+++ b/.gitlab-ci.d/buildtest.yml
@@ -2,7 +2,9 @@ include:
   - local: '/.gitlab-ci.d/buildtest-template.yml'
 
 build-system-alpine:
-  extends: .native_build_job_template
+  extends:
+    - .native_build_job_template
+    - .native_build_artifact_template
   needs:
     - job: amd64-alpine-container
   variables:
@@ -11,11 +13,6 @@ build-system-alpine:
       microblazeel-softmmu mips64el-softmmu
     MAKE_CHECK_ARGS: check-build
     CONFIGURE_ARGS: --enable-docs --enable-trace-backends=log,simple,syslog
-  artifacts:
-    expire_in: 2 days
-    paths:
-      - .git-submodule-status
-      - build
 
 check-system-alpine:
   extends: .native_test_job_template
@@ -36,7 +33,9 @@ avocado-system-alpine:
     MAKE_CHECK_ARGS: check-avocado
 
 build-system-ubuntu:
-  extends: .native_build_job_template
+  extends:
+    - .native_build_job_template
+    - .native_build_artifact_template
   needs:
     job: amd64-ubuntu2204-container
   variables:
@@ -45,10 +44,6 @@ build-system-ubuntu:
     TARGETS: alpha-softmmu cris-softmmu hppa-softmmu
       microblazeel-softmmu mips64el-softmmu
     MAKE_CHECK_ARGS: check-build
-  artifacts:
-    expire_in: 2 days
-    paths:
-      - build
 
 check-system-ubuntu:
   extends: .native_test_job_template
@@ -69,7 +64,9 @@ avocado-system-ubuntu:
     MAKE_CHECK_ARGS: check-avocado
 
 build-system-debian:
-  extends: .native_build_job_template
+  extends:
+    - .native_build_job_template
+    - .native_build_artifact_template
   needs:
     job: amd64-debian-container
   variables:
@@ -78,10 +75,6 @@ build-system-debian:
     TARGETS: arm-softmmu avr-softmmu i386-softmmu mipsel-softmmu
       riscv64-softmmu sh4eb-softmmu sparc-softmmu xtensaeb-softmmu
     MAKE_CHECK_ARGS: check-build
-  artifacts:
-    expire_in: 2 days
-    paths:
-      - build
 
 check-system-debian:
   extends: .native_test_job_template
@@ -114,7 +107,9 @@ crash-test-debian:
     - tests/venv/bin/python3 scripts/device-crash-test -q ./qemu-system-i386
 
 build-system-fedora:
-  extends: .native_build_job_template
+  extends:
+    - .native_build_job_template
+    - .native_build_artifact_template
   needs:
     job: amd64-fedora-container
   variables:
@@ -123,10 +118,6 @@ build-system-fedora:
     TARGETS: tricore-softmmu microblaze-softmmu mips-softmmu
       xtensa-softmmu m68k-softmmu riscv32-softmmu ppc-softmmu sparc64-softmmu
     MAKE_CHECK_ARGS: check-build
-  artifacts:
-    expire_in: 2 days
-    paths:
-      - build
 
 check-system-fedora:
   extends: .native_test_job_template
@@ -160,7 +151,9 @@ crash-test-fedora:
     - tests/venv/bin/python3 scripts/device-crash-test -q ./qemu-system-riscv32
 
 build-system-centos:
-  extends: .native_build_job_template
+  extends:
+    - .native_build_job_template
+    - .native_build_artifact_template
   needs:
     job: amd64-centos8-container
   variables:
@@ -170,10 +163,6 @@ build-system-centos:
     TARGETS: ppc64-softmmu or1k-softmmu s390x-softmmu
       x86_64-softmmu rx-softmmu sh4-softmmu nios2-softmmu
     MAKE_CHECK_ARGS: check-build
-  artifacts:
-    expire_in: 2 days
-    paths:
-      - build
 
 check-system-centos:
   extends: .native_test_job_template
@@ -194,17 +183,15 @@ avocado-system-centos:
     MAKE_CHECK_ARGS: check-avocado
 
 build-system-opensuse:
-  extends: .native_build_job_template
+  extends:
+    - .native_build_job_template
+    - .native_build_artifact_template
   needs:
     job: amd64-opensuse-leap-container
   variables:
     IMAGE: opensuse-leap
     TARGETS: s390x-softmmu x86_64-softmmu aarch64-softmmu
     MAKE_CHECK_ARGS: check-build
-  artifacts:
-    expire_in: 2 days
-    paths:
-      - build
 
 check-system-opensuse:
   extends: .native_test_job_template
@@ -339,7 +326,9 @@ clang-user:
 # Split in three sets of build/check/avocado to limit the execution time of each
 # job
 build-cfi-aarch64:
-  extends: .native_build_job_template
+  extends:
+    - .native_build_job_template
+    - .native_build_artifact_template
   needs:
   - job: amd64-fedora-container
   variables:
@@ -355,10 +344,6 @@ build-cfi-aarch64:
     # skipped until the situation has been solved.
     QEMU_JOB_SKIPPED: 1
   timeout: 90m
-  artifacts:
-    expire_in: 2 days
-    paths:
-      - build
 
 check-cfi-aarch64:
   extends: .native_test_job_template
@@ -379,7 +364,9 @@ avocado-cfi-aarch64:
     MAKE_CHECK_ARGS: check-avocado
 
 build-cfi-ppc64-s390x:
-  extends: .native_build_job_template
+  extends:
+    - .native_build_job_template
+    - .native_build_artifact_template
   needs:
   - job: amd64-fedora-container
   variables:
@@ -395,10 +382,6 @@ build-cfi-ppc64-s390x:
     # skipped until the situation has been solved.
     QEMU_JOB_SKIPPED: 1
   timeout: 80m
-  artifacts:
-    expire_in: 2 days
-    paths:
-      - build
 
 check-cfi-ppc64-s390x:
   extends: .native_test_job_template
@@ -419,7 +402,9 @@ avocado-cfi-ppc64-s390x:
     MAKE_CHECK_ARGS: check-avocado
 
 build-cfi-x86_64:
-  extends: .native_build_job_template
+  extends:
+    - .native_build_job_template
+    - .native_build_artifact_template
   needs:
   - job: amd64-fedora-container
   variables:
@@ -431,10 +416,6 @@ build-cfi-x86_64:
     TARGETS: x86_64-softmmu
     MAKE_CHECK_ARGS: check-build
   timeout: 70m
-  artifacts:
-    expire_in: 2 days
-    paths:
-      - build
 
 check-cfi-x86_64:
   extends: .native_test_job_template
@@ -564,7 +545,9 @@ build-libvhost-user:
 # No targets are built here, just tools, docs, and unit tests. This
 # also feeds into the eventual documentation deployment steps later
 build-tools-and-docs-debian:
-  extends: .native_build_job_template
+  extends:
+    - .native_build_job_template
+    - .native_build_artifact_template
   needs:
     job: amd64-debian-container
     # when running on 'master' we use pre-existing container
@@ -574,10 +557,6 @@ build-tools-and-docs-debian:
     MAKE_CHECK_ARGS: check-unit ctags TAGS cscope
     CONFIGURE_ARGS: --disable-system --disable-user --enable-docs --enable-tools
     QEMU_JOB_PUBLISH: 1
-  artifacts:
-    expire_in: 2 days
-    paths:
-      - build
 
 # Prepare for GitLab pages deployment. Anything copied into the
 # "public" directory will be deployed to $USER.gitlab.io/$PROJECT
-- 
2.39.2


