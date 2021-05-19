Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4861D3896C9
	for <lists+qemu-devel@lfdr.de>; Wed, 19 May 2021 21:33:12 +0200 (CEST)
Received: from localhost ([::1]:57878 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ljRwN-0001WR-0X
	for lists+qemu-devel@lfdr.de; Wed, 19 May 2021 15:33:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60218)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1ljRLu-0006ps-JT
 for qemu-devel@nongnu.org; Wed, 19 May 2021 14:55:30 -0400
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330]:36583)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1ljRLs-0002Ib-M1
 for qemu-devel@nongnu.org; Wed, 19 May 2021 14:55:30 -0400
Received: by mail-wm1-x330.google.com with SMTP id
 n17-20020a7bc5d10000b0290169edfadac9so4024989wmk.1
 for <qemu-devel@nongnu.org>; Wed, 19 May 2021 11:55:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=otmO7cV5sbn1QwMinKoN9JECUO1gQ96dd58xZqbWwRU=;
 b=cKKawsq3OtIYz6hz9/RH64I/6z3nDrBz9JV+plTmMxeqNL5gXC35lbFcXTyj+ZniWV
 nYJvCxnC0t5n7SepxWLObAZlPZUN1YCyExV+rGq/EaYJOU1v8RXAPNUhAMdyWsDVIfqe
 1MMpC/Ekv2ertkxSJI7iZOmqsqI6v79MBP8vyFvM9Up5G2F1BdS7hduBRWLXQ5ZAxxOk
 FnlG0xhz4hFl7WdNo1W5coscU74gFbTJtaSLbRHBqDtENYVF33U4GGzXuFKaSPDn4nx2
 nAhrrMrc46QH4j3WdaPb3jJYZtYZZANAgBgPwlLqVQRnPWlHnvq2/S8GGnje7RmbNSDL
 6BHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=otmO7cV5sbn1QwMinKoN9JECUO1gQ96dd58xZqbWwRU=;
 b=P5jR2blimcdxcqXE/nAwQmV5tzz98QrVwFkfgGxvPN2Qq7KmBth9DrsffxgNhiCALI
 h2TXK/dsjqF+bAu6opx+1mdQHefsJjhaBU+y+BFKykJfA8xJXohKNuzoAwGRgzmDlF11
 k42qCRmmepv9+TZ0IzdoNANnS8CIrSDICnkLQdPg58J/LlhE30r+CuqzJfMT8Env5Zno
 wZllGYcYbK6k2KIuF5duhNhtAEP4nlXuwmQdRAdlIJY6fZwONT60qAhufiNJIYOzJmby
 Flv+/tAl1kHKcu2Vs+Fet0r1hsOetbnr3Ej0MSIQRQonYDHeueecANEVJ63hTNOGnI55
 /5eg==
X-Gm-Message-State: AOAM530bLrwcdwih5RSc+4Hh59alOzPNnnZefhUJGI6Bb3GYIApoike7
 M1gjh00rM/WwMsDu6Ar+Iixuf8Cxqd5QNg==
X-Google-Smtp-Source: ABdhPJwdOizko43XbVMXBXqOxuF557jJVGHgrL1NOendcYNLd096rTi2rLCZRyV5+Kc5pb5BzeeLNg==
X-Received: by 2002:a1c:7315:: with SMTP id d21mr212167wmb.155.1621450526984; 
 Wed, 19 May 2021 11:55:26 -0700 (PDT)
Received: from x1w.redhat.com (31.red-83-51-215.dynamicip.rima-tde.net.
 [83.51.215.31])
 by smtp.gmail.com with ESMTPSA id e8sm257331wrt.30.2021.05.19.11.55.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 May 2021 11:55:26 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 04/10] gitlab-ci: Extract crossbuild job templates to
 crossbuild-template.yml
Date: Wed, 19 May 2021 20:54:58 +0200
Message-Id: <20210519185504.2198573-5-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210519185504.2198573-1-f4bug@amsat.org>
References: <20210519185504.2198573-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x330.google.com
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
Cc: Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Willian Rampazzo <willianr@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Extract the crossbuild job templates to a new file
(crossbuild-template.yml) to be able to reuse them
without having to run all the jobs included, which
are mainly useful for mainstream CI.

Reviewed-by: Willian Rampazzo <willianr@redhat.com>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 .gitlab-ci.d/crossbuild-template.yml | 41 ++++++++++++++++++++++++++
 .gitlab-ci.d/crossbuilds.yml         | 43 ++--------------------------
 2 files changed, 43 insertions(+), 41 deletions(-)
 create mode 100644 .gitlab-ci.d/crossbuild-template.yml

diff --git a/.gitlab-ci.d/crossbuild-template.yml b/.gitlab-ci.d/crossbuild-template.yml
new file mode 100644
index 00000000000..bc790a43486
--- /dev/null
+++ b/.gitlab-ci.d/crossbuild-template.yml
@@ -0,0 +1,41 @@
+.cross_system_build_job:
+  stage: build
+  image: $CI_REGISTRY_IMAGE/qemu/$IMAGE:latest
+  timeout: 80m
+  script:
+    - mkdir build
+    - cd build
+    - PKG_CONFIG_PATH=$PKG_CONFIG_PATH
+      ../configure --enable-werror --disable-docs $QEMU_CONFIGURE_OPTS
+        --disable-user --target-list-exclude="arm-softmmu cris-softmmu
+          i386-softmmu microblaze-softmmu mips-softmmu mipsel-softmmu
+          mips64-softmmu ppc-softmmu sh4-softmmu xtensa-softmmu"
+    - make -j$(expr $(nproc) + 1) all check-build $MAKE_CHECK_ARGS
+
+# Job to cross-build specific accelerators.
+#
+# Set the $ACCEL variable to select the specific accelerator (default to
+# KVM), and set extra options (such disabling other accelerators) via the
+# $ACCEL_CONFIGURE_OPTS variable.
+.cross_accel_build_job:
+  stage: build
+  image: $CI_REGISTRY_IMAGE/qemu/$IMAGE:latest
+  timeout: 30m
+  script:
+    - mkdir build
+    - cd build
+    - PKG_CONFIG_PATH=$PKG_CONFIG_PATH
+      ../configure --enable-werror --disable-docs $QEMU_CONFIGURE_OPTS
+        --disable-tools --enable-${ACCEL:-kvm} $ACCEL_CONFIGURE_OPTS
+    - make -j$(expr $(nproc) + 1) all check-build
+
+.cross_user_build_job:
+  stage: build
+  image: $CI_REGISTRY_IMAGE/qemu/$IMAGE:latest
+  script:
+    - mkdir build
+    - cd build
+    - PKG_CONFIG_PATH=$PKG_CONFIG_PATH
+      ../configure --enable-werror --disable-docs $QEMU_CONFIGURE_OPTS
+        --disable-system
+    - make -j$(expr $(nproc) + 1) all check-build $MAKE_CHECK_ARGS
diff --git a/.gitlab-ci.d/crossbuilds.yml b/.gitlab-ci.d/crossbuilds.yml
index e44e4b49a25..bf626bed1cc 100644
--- a/.gitlab-ci.d/crossbuilds.yml
+++ b/.gitlab-ci.d/crossbuilds.yml
@@ -1,44 +1,5 @@
-.cross_system_build_job:
-  stage: build
-  image: $CI_REGISTRY_IMAGE/qemu/$IMAGE:latest
-  timeout: 80m
-  script:
-    - mkdir build
-    - cd build
-    - PKG_CONFIG_PATH=$PKG_CONFIG_PATH
-      ../configure --enable-werror --disable-docs $QEMU_CONFIGURE_OPTS
-        --disable-user --target-list-exclude="arm-softmmu cris-softmmu
-          i386-softmmu microblaze-softmmu mips-softmmu mipsel-softmmu
-          mips64-softmmu ppc-softmmu sh4-softmmu xtensa-softmmu"
-    - make -j$(expr $(nproc) + 1) all check-build $MAKE_CHECK_ARGS
-
-# Job to cross-build specific accelerators.
-#
-# Set the $ACCEL variable to select the specific accelerator (default to
-# KVM), and set extra options (such disabling other accelerators) via the
-# $ACCEL_CONFIGURE_OPTS variable.
-.cross_accel_build_job:
-  stage: build
-  image: $CI_REGISTRY_IMAGE/qemu/$IMAGE:latest
-  timeout: 30m
-  script:
-    - mkdir build
-    - cd build
-    - PKG_CONFIG_PATH=$PKG_CONFIG_PATH
-      ../configure --enable-werror --disable-docs $QEMU_CONFIGURE_OPTS
-        --disable-tools --enable-${ACCEL:-kvm} $ACCEL_CONFIGURE_OPTS
-    - make -j$(expr $(nproc) + 1) all check-build
-
-.cross_user_build_job:
-  stage: build
-  image: $CI_REGISTRY_IMAGE/qemu/$IMAGE:latest
-  script:
-    - mkdir build
-    - cd build
-    - PKG_CONFIG_PATH=$PKG_CONFIG_PATH
-      ../configure --enable-werror --disable-docs $QEMU_CONFIGURE_OPTS
-        --disable-system
-    - make -j$(expr $(nproc) + 1) all check-build $MAKE_CHECK_ARGS
+include:
+  - local: '/.gitlab-ci.d/crossbuild-template.yml'
 
 cross-armel-system:
   extends: .cross_system_build_job
-- 
2.26.3


