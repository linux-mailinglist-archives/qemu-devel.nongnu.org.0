Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F9E8393181
	for <lists+qemu-devel@lfdr.de>; Thu, 27 May 2021 16:53:39 +0200 (CEST)
Received: from localhost ([::1]:50766 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lmHO9-00087V-HL
	for lists+qemu-devel@lfdr.de; Thu, 27 May 2021 10:53:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40102)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lmHH0-0006UB-AF
 for qemu-devel@nongnu.org; Thu, 27 May 2021 10:46:10 -0400
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331]:35679)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lmHGt-0000c0-Fi
 for qemu-devel@nongnu.org; Thu, 27 May 2021 10:46:08 -0400
Received: by mail-wm1-x331.google.com with SMTP id
 z19-20020a7bc7d30000b029017521c1fb75so2796227wmk.0
 for <qemu-devel@nongnu.org>; Thu, 27 May 2021 07:46:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ewvV2+3vJg5Ig4JR2wwg68rlOHbwDN6VwHsBDHnFdrI=;
 b=X7InTI4migS+LnsiH5Y410cvEeTQokvCmSnNAj405QxmvBFfZB5Ejq+7FJ+xi+PJ3Z
 5QVVzYttuLtzi31n/thV9/GO2EfOiS7rz9tPkdGpYaEVR9lMDhf1VVLUaf1UpddOrEj7
 QPFtWKvDpvt5jjyH/9SqYmbeNRA+6gGorVTIZX68RRk3i2cFyAhs6acYDEQlL47GobfX
 opbfeW+pTjFg/caYQYJEiFaMEXsc8QBWvfSwEfHctEi2+6fUEcbjD2uyTd5+dA3+r5NA
 O/ECnfay5Z9BJZbfVOSzV45xgBaQLXwJVhy2aMMwOXJffk7m5jCnOvTfNUHBK5uoSIKq
 4VuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=ewvV2+3vJg5Ig4JR2wwg68rlOHbwDN6VwHsBDHnFdrI=;
 b=Iur8mMpxAae2gJ70yqudStsEc/OX96cPiHzNdedick1pr/278BJQG8lND7QSIM0l0R
 DhV6Y1/se4VZMerEAGp7FUEqeaSYSKIUOBDuQ0qsinLpwtCOrQHaEDK4sFBaCjArGWaO
 SL+3klIsF5CpamyybizF0C6USQMEspM7NlgmYDXUstDs5Sf9cc0PF0RDQsf701CE5wlz
 H3zmesn3HrKlV+Pto5pgf8vaAQUOAq2z3rugOQFJScZrvf50s611h3EEcd9URNTxkcFO
 zigdjklOd0W7Lb+LMvOUFq7yYQhr8fcr5IQBEZDSi2A/7KcNKtXpoPKUVdIe8h8LhlFi
 BJtA==
X-Gm-Message-State: AOAM531tL106HVL8Q1RY9/TuhmnFPWK22qbyv7YLMq46SS/O9B0eLVLQ
 /CJ1TpqOBEgVAK1BnE/kJsrqcEjeuTGrng==
X-Google-Smtp-Source: ABdhPJxZz7zSmYvnq1qaTVIq/jK+NQuaauIR+mdoyu09VGXv7qVflEs9mjc7XAOiZDzYi1BpeK7O7A==
X-Received: by 2002:a7b:ce8d:: with SMTP id q13mr2888030wmj.67.1622126761321; 
 Thu, 27 May 2021 07:46:01 -0700 (PDT)
Received: from x1w.redhat.com (235.red-83-57-168.dynamicip.rima-tde.net.
 [83.57.168.235])
 by smtp.gmail.com with ESMTPSA id l13sm3437759wrv.57.2021.05.27.07.45.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 May 2021 07:46:00 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PULL v2 08/18] gitlab: Extract default build/test jobs templates
Date: Thu, 27 May 2021 16:45:32 +0200
Message-Id: <20210527144533.688225-2-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210527144533.688225-1-f4bug@amsat.org>
References: <20210527144533.688225-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x331.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Willian Rampazzo <willianr@redhat.com>, Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

To be able to reuse the mainstream build/test jobs templates,
extract them into a new file (buildtest-template.yml).

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Willian Rampazzo <willianr@redhat.com>
Message-Id: <20210519185504.2198573-8-f4bug@amsat.org>
[thuth: Keep the "acceptance_test_job_template" name for now]
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 .gitlab-ci.d/buildtest-template.yml | 69 ++++++++++++++++++++++++++++
 .gitlab-ci.yml                      | 71 +----------------------------
 2 files changed, 70 insertions(+), 70 deletions(-)
 create mode 100644 .gitlab-ci.d/buildtest-template.yml

diff --git a/.gitlab-ci.d/buildtest-template.yml b/.gitlab-ci.d/buildtest-template.yml
new file mode 100644
index 00000000000..530d30746c7
--- /dev/null
+++ b/.gitlab-ci.d/buildtest-template.yml
@@ -0,0 +1,69 @@
+.native_build_job_template:
+  stage: build
+  image: $CI_REGISTRY_IMAGE/qemu/$IMAGE:latest
+  before_script:
+    - JOBS=$(expr $(nproc) + 1)
+  script:
+    - if test -n "$LD_JOBS";
+      then
+        scripts/git-submodule.sh update meson ;
+      fi
+    - mkdir build
+    - cd build
+    - if test -n "$TARGETS";
+      then
+        ../configure --enable-werror --disable-docs ${LD_JOBS:+--meson=git} $CONFIGURE_ARGS --target-list="$TARGETS" ;
+      else
+        ../configure --enable-werror --disable-docs ${LD_JOBS:+--meson=git} $CONFIGURE_ARGS ;
+      fi || { cat config.log meson-logs/meson-log.txt && exit 1; }
+    - if test -n "$LD_JOBS";
+      then
+        ../meson/meson.py configure . -Dbackend_max_links="$LD_JOBS" ;
+      fi || exit 1;
+    - make -j"$JOBS"
+    - if test -n "$MAKE_CHECK_ARGS";
+      then
+        make -j"$JOBS" $MAKE_CHECK_ARGS ;
+      fi
+
+.native_test_job_template:
+  stage: test
+  image: $CI_REGISTRY_IMAGE/qemu/$IMAGE:latest
+  script:
+    - scripts/git-submodule.sh update
+        $(sed -n '/GIT_SUBMODULES=/ s/.*=// p' build/config-host.mak)
+    - cd build
+    - find . -type f -exec touch {} +
+    # Avoid recompiling by hiding ninja with NINJA=":"
+    - make NINJA=":" $MAKE_CHECK_ARGS
+
+.acceptance_test_job_template:
+  extends: .native_test_job_template
+  cache:
+    key: "${CI_JOB_NAME}-cache"
+    paths:
+      - ${CI_PROJECT_DIR}/avocado-cache
+    policy: pull-push
+  artifacts:
+    name: "$CI_JOB_NAME-$CI_COMMIT_REF_SLUG"
+    when: always
+    expire_in: 2 days
+    paths:
+      - build/tests/results/latest/results.xml
+      - build/tests/results/latest/test-results
+    reports:
+      junit: build/tests/results/latest/results.xml
+  before_script:
+    - mkdir -p ~/.config/avocado
+    - echo "[datadir.paths]" > ~/.config/avocado/avocado.conf
+    - echo "cache_dirs = ['${CI_PROJECT_DIR}/avocado-cache']"
+           >> ~/.config/avocado/avocado.conf
+    - echo -e '[job.output.testlogs]\nstatuses = ["FAIL", "INTERRUPT"]'
+           >> ~/.config/avocado/avocado.conf
+    - if [ -d ${CI_PROJECT_DIR}/avocado-cache ]; then
+        du -chs ${CI_PROJECT_DIR}/avocado-cache ;
+      fi
+    - export AVOCADO_ALLOW_UNTRUSTED_CODE=1
+  after_script:
+    - cd build
+    - du -chs ${CI_PROJECT_DIR}/avocado-cache
diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index 2be8097f193..ccd11e1625a 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -4,78 +4,9 @@ include:
   - local: '/.gitlab-ci.d/opensbi.yml'
   - local: '/.gitlab-ci.d/containers.yml'
   - local: '/.gitlab-ci.d/crossbuilds.yml'
+  - local: '/.gitlab-ci.d/buildtest-template.yml'
   - local: '/.gitlab-ci.d/static_checks.yml'
 
-.native_build_job_template:
-  stage: build
-  image: $CI_REGISTRY_IMAGE/qemu/$IMAGE:latest
-  before_script:
-    - JOBS=$(expr $(nproc) + 1)
-  script:
-    - if test -n "$LD_JOBS";
-      then
-        scripts/git-submodule.sh update meson ;
-      fi
-    - mkdir build
-    - cd build
-    - if test -n "$TARGETS";
-      then
-        ../configure --enable-werror --disable-docs ${LD_JOBS:+--meson=git} $CONFIGURE_ARGS --target-list="$TARGETS" ;
-      else
-        ../configure --enable-werror --disable-docs ${LD_JOBS:+--meson=git} $CONFIGURE_ARGS ;
-      fi || { cat config.log meson-logs/meson-log.txt && exit 1; }
-    - if test -n "$LD_JOBS";
-      then
-        ../meson/meson.py configure . -Dbackend_max_links="$LD_JOBS" ;
-      fi || exit 1;
-    - make -j"$JOBS"
-    - if test -n "$MAKE_CHECK_ARGS";
-      then
-        make -j"$JOBS" $MAKE_CHECK_ARGS ;
-      fi
-
-.native_test_job_template:
-  stage: test
-  image: $CI_REGISTRY_IMAGE/qemu/$IMAGE:latest
-  script:
-    - scripts/git-submodule.sh update
-        $(sed -n '/GIT_SUBMODULES=/ s/.*=// p' build/config-host.mak)
-    - cd build
-    - find . -type f -exec touch {} +
-    # Avoid recompiling by hiding ninja with NINJA=":"
-    - make NINJA=":" $MAKE_CHECK_ARGS
-
-.acceptance_test_job_template:
-  extends: .native_test_job_template
-  cache:
-    key: "${CI_JOB_NAME}-cache"
-    paths:
-      - ${CI_PROJECT_DIR}/avocado-cache
-    policy: pull-push
-  artifacts:
-    name: "$CI_JOB_NAME-$CI_COMMIT_REF_SLUG"
-    when: always
-    expire_in: 2 days
-    paths:
-      - build/tests/results/latest/results.xml
-      - build/tests/results/latest/test-results
-    reports:
-      junit: build/tests/results/latest/results.xml
-  before_script:
-    - mkdir -p ~/.config/avocado
-    - echo "[datadir.paths]" > ~/.config/avocado/avocado.conf
-    - echo "cache_dirs = ['${CI_PROJECT_DIR}/avocado-cache']"
-           >> ~/.config/avocado/avocado.conf
-    - echo -e '[job.output.testlogs]\nstatuses = ["FAIL", "INTERRUPT"]'
-           >> ~/.config/avocado/avocado.conf
-    - if [ -d ${CI_PROJECT_DIR}/avocado-cache ]; then
-        du -chs ${CI_PROJECT_DIR}/avocado-cache ;
-      fi
-    - export AVOCADO_ALLOW_UNTRUSTED_CODE=1
-  after_script:
-    - cd build
-    - du -chs ${CI_PROJECT_DIR}/avocado-cache
-
 build-system-alpine:
   extends: .native_build_job_template
   needs:
-- 
2.26.3


