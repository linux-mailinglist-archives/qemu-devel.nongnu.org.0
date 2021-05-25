Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EAC6E38FCCA
	for <lists+qemu-devel@lfdr.de>; Tue, 25 May 2021 10:27:48 +0200 (CEST)
Received: from localhost ([::1]:55934 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1llSPk-0006R1-16
	for lists+qemu-devel@lfdr.de; Tue, 25 May 2021 04:27:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50306)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1llSOM-0004KR-41
 for qemu-devel@nongnu.org; Tue, 25 May 2021 04:26:22 -0400
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b]:41714)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1llSOK-0007Li-71
 for qemu-devel@nongnu.org; Tue, 25 May 2021 04:26:21 -0400
Received: by mail-wr1-x42b.google.com with SMTP id d11so31180072wrw.8
 for <qemu-devel@nongnu.org>; Tue, 25 May 2021 01:26:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=2LHUnVhjDAjzTzxxMMwUXEhFIuA3qKS7lsMw2CoIcy8=;
 b=R8rfDRx2NUtgjXxMjg6EUuZMMi6mn3PZEdj3FVIHkHXTGauBD3eSrlJb6z8JKcykW2
 sRxX2MW3V/mMLKNw42ZgtgLcYkNGWrr7yZbBIfbKCmYN0vKNozc7CDib5gAEKkMYuuWq
 1/lUSklj8+OEj15ffw28iNEZbckJp/5fVLBvn3PbhV6xD1xPS9jVNobjXQKE1m+wLnUw
 MrufieN/Ujzu4hxB9m4OipAamvvPQkkNE3SneyMQCOnHTUHKcsEk5AtqDms0b8M6XsMj
 L/+f91twtmkT+QQUDdnsv+Lk0y90ZGCueUVjF5s87/Zox/sHACpQHReTdxEtq53vM7pV
 A7Mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=2LHUnVhjDAjzTzxxMMwUXEhFIuA3qKS7lsMw2CoIcy8=;
 b=DlcP9V9hbP07CvsnwjLN7XRvAI97cTZa+oxmaB7g/L/Or3Cj/PQiYx1oEvPBm4BnvP
 alEn90WaNV4otWPN9q4ya5Phoi3R2dJZAGyn3jcM+uacaVdxKHx7tgsSlALurFXl/Ej5
 xVi0STVc0n9aoitO7zxrLBIvOTlcViVJMO4C/bP1XgomVW/lTtmpXyZuVG+IwixdwgjJ
 q6+abocybqEa26SqVH6Oo8v9rdTKs9VqarJSm4efgUmhgqPmJEwaI+CvFXMWg+ZpyJz8
 dv5apEwvfxdUG7FvgFpTtLrw3kp3E5PKL5q+44XIUcbA/01fDlhc65X3Ak7v3V3qeYyJ
 lYGA==
X-Gm-Message-State: AOAM530Z+NghkOKGoPXKw8AWxPKxOoTQkYpjqookT46L5jP+njEyqgAd
 yOdmSeBzg0XGlr6jHDFgvWCTFxsdllXdZA==
X-Google-Smtp-Source: ABdhPJxSo9/BfaL8BuNZc2TiRzqVgw04SQ9s9RSyP10kSSCwfi1d1VUG+B/G/gmB5Qm+0ON3ndXJXw==
X-Received: by 2002:adf:cf09:: with SMTP id o9mr26338898wrj.334.1621931178730; 
 Tue, 25 May 2021 01:26:18 -0700 (PDT)
Received: from localhost.localdomain (31.red-83-51-215.dynamicip.rima-tde.net.
 [83.51.215.31])
 by smtp.gmail.com with ESMTPSA id z3sm16044285wrq.42.2021.05.25.01.26.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 May 2021 01:26:18 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 4/9] gitlab-ci: Extract cross-container jobs to
 container-cross.yml
Date: Tue, 25 May 2021 10:25:51 +0200
Message-Id: <20210525082556.4011380-5-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210525082556.4011380-1-f4bug@amsat.org>
References: <20210525082556.4011380-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42b.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
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
Cc: Thomas Huth <thuth@redhat.com>, "Daniel P . Berrange" <berrange@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Willian Rampazzo <willianr@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Extract the jobs preparing the cross containers into a new file
(container-cross.yml).

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 .gitlab-ci.d/container-cross.yml | 164 ++++++++++++++++++++++++++++++
 .gitlab-ci.d/containers.yml      | 166 +------------------------------
 2 files changed, 165 insertions(+), 165 deletions(-)
 create mode 100644 .gitlab-ci.d/container-cross.yml

diff --git a/.gitlab-ci.d/container-cross.yml b/.gitlab-ci.d/container-cross.yml
new file mode 100644
index 00000000000..a8e74360888
--- /dev/null
+++ b/.gitlab-ci.d/container-cross.yml
@@ -0,0 +1,164 @@
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
index 3f8defb5774..bd01ae8f802 100644
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
@@ -44,150 +24,6 @@ amd64-debian-container:
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


