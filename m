Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C73E37A111
	for <lists+qemu-devel@lfdr.de>; Tue, 11 May 2021 09:43:08 +0200 (CEST)
Received: from localhost ([::1]:44424 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lgN2p-0000hm-Am
	for lists+qemu-devel@lfdr.de; Tue, 11 May 2021 03:43:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51984)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lgMqd-0004Ra-5C
 for qemu-devel@nongnu.org; Tue, 11 May 2021 03:30:31 -0400
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429]:43753)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lgMqb-0008SA-Dn
 for qemu-devel@nongnu.org; Tue, 11 May 2021 03:30:30 -0400
Received: by mail-wr1-x429.google.com with SMTP id s8so19048731wrw.10
 for <qemu-devel@nongnu.org>; Tue, 11 May 2021 00:30:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=fRPFGdw6PWmrtWhxsB0bN4SSbxkOLvWecakHL8Bq24c=;
 b=TMBh6qemUp/uAKA3q27y1qxklJTr0YkN5ldHCm8LUdFMNDTCnrTxvxoX+Ya5tkg8qJ
 h+lw+wWTYvmG0cGeoBKqnqkqspkS8EU3hjbhMDauT0vJ7COk7xvaJJNBvwhBcMnfuePq
 xgqW69EhK6lx2wVi+esff8MKFgUc2mJrTjdm1ENxr1cbko4As+o1s84Mj+6WQu3VSkDQ
 eA5mVA/tWUS0dyQLh6RngbGx18BrlF+1vkLU2FvuJMrsFDIYVoNUyF+7N5oH++Q4fXfi
 UnQ2xPhGNUB5hzYK9RkcJ+PhnwwTYhbZgY++vGiSInAeMqgUKD4mfUKGwZHG5OgcGE+o
 BopA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=fRPFGdw6PWmrtWhxsB0bN4SSbxkOLvWecakHL8Bq24c=;
 b=J8CI5XK4vG69zRO3bylCoWv0BbnGaYAOdu3vrg1a3NcdjUjfQ126MlyKAKTZOpsrKF
 HrK5LQesEJKzsLcwRwzuDc/UW/2cwEEi1zSlQb7SoO/itgB59lz9a9YPqpbZkhNNqhG7
 yDbJlHcsI/h8E9/NXFaOZKkn6UR3A7/erB6WUP5kqaBBfvZu099WUPI3ivGzFkx34hGM
 V2Ty8ou28qgVLgl3+vuc7MbjuvnCiMBOjUsdTVr7eHOs0rIaL9O+5yrdSgyDJRZjTV/4
 5X53C3u40O/xmxt/NLjCi+Z6i3y4K63xm010HABkZw9PPDCunQcnkiIJpGevJ3WYQwFb
 Jv7w==
X-Gm-Message-State: AOAM530aOAtUNac0UMqISPtDGK3SZAEEj/OiKhbmI0yFkZkRflyqUzf3
 eiU6kCpIzFp4i+ImkEKnTI8zMM+z2zaO5g==
X-Google-Smtp-Source: ABdhPJzQBiLx7tFmBv8a5wodrXQtj+R+vRs80b4l37pPGbtGbuHU0jLec1ymJrj+IkgOfBlg0Sq7rQ==
X-Received: by 2002:adf:e552:: with SMTP id z18mr34853471wrm.226.1620718227860; 
 Tue, 11 May 2021 00:30:27 -0700 (PDT)
Received: from localhost.localdomain (39.red-81-40-121.staticip.rima-tde.net.
 [81.40.121.39])
 by smtp.gmail.com with ESMTPSA id f8sm20739045wmg.43.2021.05.11.00.30.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 May 2021 00:30:27 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 07/10] gitlab-ci: Extract default build/test jobs templates
Date: Tue, 11 May 2021 09:29:49 +0200
Message-Id: <20210511072952.2813358-8-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210511072952.2813358-1-f4bug@amsat.org>
References: <20210511072952.2813358-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x429.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248,
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
Cc: Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Willian Rampazzo <willianr@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

To be able to reuse the mainstream build/test jobs templates,
extract them into a new file (buildtest-template.yml).

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 .gitlab-ci.d/buildtest-template.yml | 69 ++++++++++++++++++++++++++++
 .gitlab-ci.yml                      | 71 +----------------------------
 2 files changed, 70 insertions(+), 70 deletions(-)
 create mode 100644 .gitlab-ci.d/buildtest-template.yml

diff --git a/.gitlab-ci.d/buildtest-template.yml b/.gitlab-ci.d/buildtest-template.yml
new file mode 100644
index 00000000000..32aaef1a213
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
+        ../configure --enable-werror --disable-docs ${LD_JOBS:+--meson=internal} $CONFIGURE_ARGS --target-list="$TARGETS" ;
+      else
+        ../configure --enable-werror --disable-docs ${LD_JOBS:+--meson=internal} $CONFIGURE_ARGS ;
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
+.integration_test_job_template:
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
index 5bfcd8aaca4..d1c8fcc3874 100644
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
-        ../configure --enable-werror --disable-docs ${LD_JOBS:+--meson=internal} $CONFIGURE_ARGS --target-list="$TARGETS" ;
-      else
-        ../configure --enable-werror --disable-docs ${LD_JOBS:+--meson=internal} $CONFIGURE_ARGS ;
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
-.integration_test_job_template:
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


