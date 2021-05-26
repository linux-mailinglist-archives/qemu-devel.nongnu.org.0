Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B6141392238
	for <lists+qemu-devel@lfdr.de>; Wed, 26 May 2021 23:41:24 +0200 (CEST)
Received: from localhost ([::1]:35096 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lm1HH-000315-Pj
	for lists+qemu-devel@lfdr.de; Wed, 26 May 2021 17:41:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37986)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lm0wS-0003bO-RZ
 for qemu-devel@nongnu.org; Wed, 26 May 2021 17:19:52 -0400
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432]:34730)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lm0wQ-0000In-JE
 for qemu-devel@nongnu.org; Wed, 26 May 2021 17:19:52 -0400
Received: by mail-wr1-x432.google.com with SMTP id r12so2567871wrp.1
 for <qemu-devel@nongnu.org>; Wed, 26 May 2021 14:19:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=1KWkuZlvY+TLAeYBW8QJth9AmRm0grBKq41zaEW21NE=;
 b=anS8Ci3PrDQicJR/mex9OVubxcO4hi3CDMHTLRgGJbJRK69yWQF8LVuLGiYCCHqRzh
 fUYVTeOog/AAEomQN3b749hEohjHkxs9g2hsHQKmOjGS5GrakFsYIcCX4cSBK3oorMmC
 rVF/rDsh/KhE7bzqFKcBAIlQTzLPcnh/B3RjSt7bSVHsAehRb9hKUuL8gEQwHDmU25Wk
 lwvRaH4Qho/2t/+IRCXR0Vp9+oGWBv+TYoO9BupWGyxJxlwOd2IhClfM4TLHBkcAyXU8
 bFBz4rPewXzDTC0pBEY108OUErOpOw26x59alRRcqKDHeuUZsxWiblOb70Az7c+vzMRz
 cb8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=1KWkuZlvY+TLAeYBW8QJth9AmRm0grBKq41zaEW21NE=;
 b=U/fYgOZxigWH7Q3gL/88qTOekspERv0RSfqqQdkXHqZPMkLcnITmbgXeTLkpcWZYNH
 WSrhBengKQQvRbmWskdCvIBQGQEzI3T5X0hb79gpa0fcFP7wG9Yl8/CQhR60y69+E9cA
 n4BX+kwx6BuhmTMgAx5Hz0i1H/NZ+SmCUINbCiYQYBahYHdoGbLHIDN23l9r721+XxQ6
 TDU2FjyJolwfcvsVjqu42FN9H89ryc5leYvEl/ZMOimpOXyig6HR5gCjY6gj7wtaRzhS
 hd0ug5ltQKoXmgtEO6MYqUDlMbPcnU28OULiyyHk6katEt1fmF8oTWlSbiUo6/nk74IT
 2z6w==
X-Gm-Message-State: AOAM531yuEo5E0YKA3v5Y/n/kopyBzeCxtQisIwV1pWoP+WtgNQbInpj
 lfrRvoG3NR8Kj8EU8RpB5yu48bQHmuxhNg==
X-Google-Smtp-Source: ABdhPJxEMAl4/qoN4Rok/ayA4vsV3GgKwov5Oat0gvir1asl7wZoDiWnLsO+eylUbKnz2Nb0yNQ4vA==
X-Received: by 2002:a05:6000:511:: with SMTP id
 a17mr34783723wrf.351.1622063988803; 
 Wed, 26 May 2021 14:19:48 -0700 (PDT)
Received: from localhost.localdomain
 (235.red-83-57-168.dynamicip.rima-tde.net. [83.57.168.235])
 by smtp.gmail.com with ESMTPSA id s5sm280793wmh.37.2021.05.26.14.19.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 May 2021 14:19:48 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PULL 14/19] gitlab: Extract cross-container jobs to
 container-cross.yml
Date: Wed, 26 May 2021 23:18:33 +0200
Message-Id: <20210526211838.421716-15-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210526211838.421716-1-f4bug@amsat.org>
References: <20210526211838.421716-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x432.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
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
Cc: Willian Rampazzo <willianr@redhat.com>, Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Extract the jobs preparing the cross containers into a new file
(container-cross.yml).

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Willian Rampazzo <willianr@redhat.com>
Message-Id: <20210525082556.4011380-5-f4bug@amsat.org>
---
 .gitlab-ci.d/container-cross.yml | 192 ++++++++++++++++++++++++++++++
 .gitlab-ci.d/containers.yml      | 194 +------------------------------
 2 files changed, 193 insertions(+), 193 deletions(-)
 create mode 100644 .gitlab-ci.d/container-cross.yml

diff --git a/.gitlab-ci.d/container-cross.yml b/.gitlab-ci.d/container-cross.yml
new file mode 100644
index 00000000000..0fcebe363a4
--- /dev/null
+++ b/.gitlab-ci.d/container-cross.yml
@@ -0,0 +1,192 @@
+alpha-debian-cross-container:
+  extends: .container_job_template
+  stage: containers-layer2
+  needs: ['amd64-debian10-container']
+  variables:
+    NAME: debian-alpha-cross
+
+amd64-debian-cross-container:
+  extends: .container_job_template
+  stage: containers-layer2
+  needs: ['amd64-debian10-container']
+  variables:
+    NAME: debian-amd64-cross
+
+amd64-debian-user-cross-container:
+  extends: .container_job_template
+  stage: containers-layer2
+  needs: ['amd64-debian10-container']
+  variables:
+    NAME: debian-all-test-cross
+
+arm64-debian-cross-container:
+  extends: .container_job_template
+  stage: containers-layer2
+  needs: ['amd64-debian10-container']
+  variables:
+    NAME: debian-arm64-cross
+
+arm64-test-debian-cross-container:
+  extends: .container_job_template
+  stage: containers-layer2
+  needs: ['amd64-debian11-container']
+  variables:
+    NAME: debian-arm64-test-cross
+
+armel-debian-cross-container:
+  extends: .container_job_template
+  stage: containers-layer2
+  needs: ['amd64-debian10-container']
+  variables:
+    NAME: debian-armel-cross
+
+armhf-debian-cross-container:
+  extends: .container_job_template
+  stage: containers-layer2
+  needs: ['amd64-debian10-container']
+  variables:
+    NAME: debian-armhf-cross
+
+# We never want to build hexagon in the CI system and by default we
+# always want to refer to the master registry where it lives.
+hexagon-cross-container:
+  image: docker:stable
+  stage: containers
+  rules:
+    - if: '$CI_PROJECT_NAMESPACE == "qemu-project"'
+      when: never
+    - when: always
+  variables:
+    NAME: debian-hexagon-cross
+    GIT_DEPTH: 1
+  services:
+    - docker:dind
+  before_script:
+    - export TAG="$CI_REGISTRY_IMAGE/qemu/$NAME:latest"
+    - export COMMON_TAG="$CI_REGISTRY/qemu-project/qemu/qemu/$NAME:latest"
+    - docker info
+    - docker login $CI_REGISTRY -u "$CI_REGISTRY_USER" -p "$CI_REGISTRY_PASSWORD"
+  script:
+    - echo "TAG:$TAG"
+    - echo "COMMON_TAG:$COMMON_TAG"
+    - docker pull $COMMON_TAG
+    - docker tag $COMMON_TAG $TAG
+    - docker push "$TAG"
+  after_script:
+    - docker logout
+
+hppa-debian-cross-container:
+  extends: .container_job_template
+  stage: containers-layer2
+  needs: ['amd64-debian10-container']
+  variables:
+    NAME: debian-hppa-cross
+
+m68k-debian-cross-container:
+  extends: .container_job_template
+  stage: containers-layer2
+  needs: ['amd64-debian10-container']
+  variables:
+    NAME: debian-m68k-cross
+
+mips64-debian-cross-container:
+  extends: .container_job_template
+  stage: containers-layer2
+  needs: ['amd64-debian10-container']
+  variables:
+    NAME: debian-mips64-cross
+
+mips64el-debian-cross-container:
+  extends: .container_job_template
+  stage: containers-layer2
+  needs: ['amd64-debian10-container']
+  variables:
+    NAME: debian-mips64el-cross
+
+mips-debian-cross-container:
+  extends: .container_job_template
+  stage: containers-layer2
+  needs: ['amd64-debian10-container']
+  variables:
+    NAME: debian-mips-cross
+
+mipsel-debian-cross-container:
+  extends: .container_job_template
+  stage: containers-layer2
+  needs: ['amd64-debian10-container']
+  variables:
+    NAME: debian-mipsel-cross
+
+powerpc-test-cross-container:
+  extends: .container_job_template
+  stage: containers-layer2
+  needs: ['amd64-debian11-container']
+  variables:
+    NAME: debian-powerpc-test-cross
+
+ppc64el-debian-cross-container:
+  extends: .container_job_template
+  stage: containers-layer2
+  needs: ['amd64-debian10-container']
+  variables:
+    NAME: debian-ppc64el-cross
+
+riscv64-debian-cross-container:
+  extends: .container_job_template
+  stage: containers-layer2
+  needs: ['amd64-debian10-container']
+  variables:
+    NAME: debian-riscv64-cross
+
+s390x-debian-cross-container:
+  extends: .container_job_template
+  stage: containers-layer2
+  needs: ['amd64-debian10-container']
+  variables:
+    NAME: debian-s390x-cross
+
+sh4-debian-cross-container:
+  extends: .container_job_template
+  stage: containers-layer2
+  needs: ['amd64-debian10-container']
+  variables:
+    NAME: debian-sh4-cross
+
+sparc64-debian-cross-container:
+  extends: .container_job_template
+  stage: containers-layer2
+  needs: ['amd64-debian10-container']
+  variables:
+    NAME: debian-sparc64-cross
+
+tricore-debian-cross-container:
+  extends: .container_job_template
+  stage: containers-layer2
+  needs: ['amd64-debian10-container']
+  variables:
+    NAME: debian-tricore-cross
+
+xtensa-debian-cross-container:
+  extends: .container_job_template
+  variables:
+    NAME: debian-xtensa-cross
+
+cris-fedora-cross-container:
+  extends: .container_job_template
+  variables:
+    NAME: fedora-cris-cross
+
+i386-fedora-cross-container:
+  extends: .container_job_template
+  variables:
+    NAME: fedora-i386-cross
+
+win32-fedora-cross-container:
+  extends: .container_job_template
+  variables:
+    NAME: fedora-win32-cross
+
+win64-fedora-cross-container:
+  extends: .container_job_template
+  variables:
+    NAME: fedora-win64-cross
diff --git a/.gitlab-ci.d/containers.yml b/.gitlab-ci.d/containers.yml
index 0acc8381ac1..bd01ae8f802 100644
--- a/.gitlab-ci.d/containers.yml
+++ b/.gitlab-ci.d/containers.yml
@@ -1,5 +1,6 @@
 include:
   - local: '/.gitlab-ci.d/container-core.yml'
+  - local: '/.gitlab-ci.d/container-cross.yml'
 
 amd64-alpine-container:
   extends: .container_job_template
@@ -16,27 +17,6 @@ amd64-debian11-container:
   variables:
     NAME: debian11
 
-alpha-debian-cross-container:
-  extends: .container_job_template
-  stage: containers-layer2
-  needs: ['amd64-debian10-container']
-  variables:
-    NAME: debian-alpha-cross
-
-amd64-debian-cross-container:
-  extends: .container_job_template
-  stage: containers-layer2
-  needs: ['amd64-debian10-container']
-  variables:
-    NAME: debian-amd64-cross
-
-amd64-debian-user-cross-container:
-  extends: .container_job_template
-  stage: containers-layer2
-  needs: ['amd64-debian10-container']
-  variables:
-    NAME: debian-all-test-cross
-
 amd64-debian-container:
   extends: .container_job_template
   stage: containers-layer2
@@ -44,178 +24,6 @@ amd64-debian-container:
   variables:
     NAME: debian-amd64
 
-arm64-debian-cross-container:
-  extends: .container_job_template
-  stage: containers-layer2
-  needs: ['amd64-debian10-container']
-  variables:
-    NAME: debian-arm64-cross
-
-arm64-test-debian-cross-container:
-  extends: .container_job_template
-  stage: containers-layer2
-  needs: ['amd64-debian11-container']
-  variables:
-    NAME: debian-arm64-test-cross
-
-armel-debian-cross-container:
-  extends: .container_job_template
-  stage: containers-layer2
-  needs: ['amd64-debian10-container']
-  variables:
-    NAME: debian-armel-cross
-
-armhf-debian-cross-container:
-  extends: .container_job_template
-  stage: containers-layer2
-  needs: ['amd64-debian10-container']
-  variables:
-    NAME: debian-armhf-cross
-
-# We never want to build hexagon in the CI system and by default we
-# always want to refer to the master registry where it lives.
-hexagon-cross-container:
-  image: docker:stable
-  stage: containers
-  rules:
-    - if: '$CI_PROJECT_NAMESPACE == "qemu-project"'
-      when: never
-    - when: always
-  variables:
-    NAME: debian-hexagon-cross
-    GIT_DEPTH: 1
-  services:
-    - docker:dind
-  before_script:
-    - export TAG="$CI_REGISTRY_IMAGE/qemu/$NAME:latest"
-    - export COMMON_TAG="$CI_REGISTRY/qemu-project/qemu/qemu/$NAME:latest"
-    - docker info
-    - docker login $CI_REGISTRY -u "$CI_REGISTRY_USER" -p "$CI_REGISTRY_PASSWORD"
-  script:
-    - echo "TAG:$TAG"
-    - echo "COMMON_TAG:$COMMON_TAG"
-    - docker pull $COMMON_TAG
-    - docker tag $COMMON_TAG $TAG
-    - docker push "$TAG"
-  after_script:
-    - docker logout
-
-hppa-debian-cross-container:
-  extends: .container_job_template
-  stage: containers-layer2
-  needs: ['amd64-debian10-container']
-  variables:
-    NAME: debian-hppa-cross
-
-m68k-debian-cross-container:
-  extends: .container_job_template
-  stage: containers-layer2
-  needs: ['amd64-debian10-container']
-  variables:
-    NAME: debian-m68k-cross
-
-mips64-debian-cross-container:
-  extends: .container_job_template
-  stage: containers-layer2
-  needs: ['amd64-debian10-container']
-  variables:
-    NAME: debian-mips64-cross
-
-mips64el-debian-cross-container:
-  extends: .container_job_template
-  stage: containers-layer2
-  needs: ['amd64-debian10-container']
-  variables:
-    NAME: debian-mips64el-cross
-
-mips-debian-cross-container:
-  extends: .container_job_template
-  stage: containers-layer2
-  needs: ['amd64-debian10-container']
-  variables:
-    NAME: debian-mips-cross
-
-mipsel-debian-cross-container:
-  extends: .container_job_template
-  stage: containers-layer2
-  needs: ['amd64-debian10-container']
-  variables:
-    NAME: debian-mipsel-cross
-
-powerpc-test-cross-container:
-  extends: .container_job_template
-  stage: containers-layer2
-  needs: ['amd64-debian11-container']
-  variables:
-    NAME: debian-powerpc-test-cross
-
-ppc64el-debian-cross-container:
-  extends: .container_job_template
-  stage: containers-layer2
-  needs: ['amd64-debian10-container']
-  variables:
-    NAME: debian-ppc64el-cross
-
-riscv64-debian-cross-container:
-  extends: .container_job_template
-  stage: containers-layer2
-  needs: ['amd64-debian10-container']
-  variables:
-    NAME: debian-riscv64-cross
-
-s390x-debian-cross-container:
-  extends: .container_job_template
-  stage: containers-layer2
-  needs: ['amd64-debian10-container']
-  variables:
-    NAME: debian-s390x-cross
-
-sh4-debian-cross-container:
-  extends: .container_job_template
-  stage: containers-layer2
-  needs: ['amd64-debian10-container']
-  variables:
-    NAME: debian-sh4-cross
-
-sparc64-debian-cross-container:
-  extends: .container_job_template
-  stage: containers-layer2
-  needs: ['amd64-debian10-container']
-  variables:
-    NAME: debian-sparc64-cross
-
-tricore-debian-cross-container:
-  extends: .container_job_template
-  stage: containers-layer2
-  needs: ['amd64-debian10-container']
-  variables:
-    NAME: debian-tricore-cross
-
-xtensa-debian-cross-container:
-  extends: .container_job_template
-  variables:
-    NAME: debian-xtensa-cross
-
-cris-fedora-cross-container:
-  extends: .container_job_template
-  variables:
-    NAME: fedora-cris-cross
-
-i386-fedora-cross-container:
-  extends: .container_job_template
-  variables:
-    NAME: fedora-i386-cross
-
-win32-fedora-cross-container:
-  extends: .container_job_template
-  variables:
-    NAME: fedora-win32-cross
-
-win64-fedora-cross-container:
-  extends: .container_job_template
-  variables:
-    NAME: fedora-win64-cross
-
 amd64-ubuntu1804-container:
   extends: .container_job_template
   variables:
-- 
2.26.3


