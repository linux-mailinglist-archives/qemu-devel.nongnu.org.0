Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D8A5363889
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Apr 2021 01:37:15 +0200 (CEST)
Received: from localhost ([::1]:44326 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lYGyY-00018h-IB
	for lists+qemu-devel@lfdr.de; Sun, 18 Apr 2021 19:37:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44270)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lYGwN-0008Ht-PL
 for qemu-devel@nongnu.org; Sun, 18 Apr 2021 19:34:59 -0400
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433]:42687)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lYGwL-0002yR-RW
 for qemu-devel@nongnu.org; Sun, 18 Apr 2021 19:34:59 -0400
Received: by mail-wr1-x433.google.com with SMTP id p6so25378567wrn.9
 for <qemu-devel@nongnu.org>; Sun, 18 Apr 2021 16:34:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=1hXnyveSLJsQ7n0YcKe7UrZPwhbG4ssbFPID1DDVw8E=;
 b=unIf2a+vtqiwBehGW7gFu33pJN01KVamOGzD/Zk2ELU61IAsAXDQTHDhOxEkLLEWzh
 A2HbKeTMGxFveXxoc2suCfdDp5IDOBG7kvHFVvBtaHKHPZKsh0SyBZ5uo997zSod7Ybj
 q51hrCbA66RJIQmBxoJ7znCIC1QgB871aTvlAhFkP6ITAJ5WjayxhuNyzn203MLNLOIa
 GfJPYytx/HybudctqYyLnh+7lDpzp2R+xqDboCj2PMiXbcUz5hVh0agTEmutc3cXfzol
 rhiTrMLWVu+6pDXt/JOneN6hkvsTUMVyC1OsVJT5jXKUHy0H5qBxqDdZTlf5jv9OfyAp
 T66w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=1hXnyveSLJsQ7n0YcKe7UrZPwhbG4ssbFPID1DDVw8E=;
 b=S8+AT/j+nuQQqM3JPWNAx2D8dvuTZRIJLKiy2MJCv1nlqtzkOiW3f63NoKSKNLetlU
 LUjUsgUhgT5abqWtjHCBPcWYdhjL9/cJAvf5X2mJBHIvRY1O1zOEl1v6Ygawd9c6tdoG
 s+o/cEbvHH6BAKJcs3QsiMC04sYDYDpFJ4pV/umoaTwZL9rSPSekncFedPglv7/UBrjr
 JpPClW/ocLPzfL+wc/CSARFxiG2qsCNFmT9oywqJndrWaHKR/JtqOvQtSs6TZWEK7zif
 Yfe52kECDGpDhluVVaQfc9ABKF9nSz89K+FD2VUmHXqba6pFDP1lQ4aOtAYMaqrxAL2V
 1cYw==
X-Gm-Message-State: AOAM5312di8MLczsWW/fYQVbTOvx/sja2wECI/JbvNuTPFqrLhXMlUpc
 jeOzmIuEmPMAwg3lKejxWwCnDQUBYcoK9w==
X-Google-Smtp-Source: ABdhPJzi7UocJcqejlapWYin8XqCLgJWtA/fTETFHHQeq1hi+asbhGFnm4OoLNWUTKg+d9QkL9zR2A==
X-Received: by 2002:a5d:524e:: with SMTP id k14mr10909969wrc.282.1618788896216; 
 Sun, 18 Apr 2021 16:34:56 -0700 (PDT)
Received: from localhost.localdomain (39.red-81-40-121.staticip.rima-tde.net.
 [81.40.121.39])
 by smtp.gmail.com with ESMTPSA id h2sm17787030wmc.24.2021.04.18.16.34.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 18 Apr 2021 16:34:55 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 01/15] gitlab-ci: Replace YAML anchors by extends
 (container_job)
Date: Mon, 19 Apr 2021 01:34:34 +0200
Message-Id: <20210418233448.1267991-2-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210418233448.1267991-1-f4bug@amsat.org>
References: <20210418233448.1267991-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x433.google.com
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
Cc: Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Erik Skultety <eskultet@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Willian Rampazzo <willianr@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 Miroslav Rezanina <mrezanin@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Philippe Mathieu-Daudé <philmd@redhat.com>

'extends' is an alternative to using YAML anchors
and is a little more flexible and readable. See:
https://docs.gitlab.com/ee/ci/yaml/#extends

Reviewed-by: Wainer dos Santos Moschetta <wainersm@redhat.com>
Reviewed-by: Thomas Huth <thuth@redhat.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 .gitlab-ci.d/containers.yml | 76 ++++++++++++++++++-------------------
 1 file changed, 38 insertions(+), 38 deletions(-)

diff --git a/.gitlab-ci.d/containers.yml b/.gitlab-ci.d/containers.yml
index 33e4046e233..4ef76d1f54d 100644
--- a/.gitlab-ci.d/containers.yml
+++ b/.gitlab-ci.d/containers.yml
@@ -1,4 +1,4 @@
-.container_job_template: &container_job_definition
+.container_job_template:
   image: docker:stable
   stage: containers
   services:
@@ -22,230 +22,230 @@
     - docker logout
 
 amd64-alpine-container:
-  <<: *container_job_definition
+  extends: .container_job_template
   variables:
     NAME: alpine
 
 amd64-centos7-container:
-  <<: *container_job_definition
+  extends: .container_job_template
   variables:
     NAME: centos7
 
 amd64-centos8-container:
-  <<: *container_job_definition
+  extends: .container_job_template
   variables:
     NAME: centos8
 
 amd64-debian10-container:
-  <<: *container_job_definition
+  extends: .container_job_template
   variables:
     NAME: debian10
 
 amd64-debian11-container:
-  <<: *container_job_definition
+  extends: .container_job_template
   variables:
     NAME: debian11
 
 alpha-debian-cross-container:
-  <<: *container_job_definition
+  extends: .container_job_template
   stage: containers-layer2
   needs: ['amd64-debian10-container']
   variables:
     NAME: debian-alpha-cross
 
 amd64-debian-cross-container:
-  <<: *container_job_definition
+  extends: .container_job_template
   stage: containers-layer2
   needs: ['amd64-debian10-container']
   variables:
     NAME: debian-amd64-cross
 
 amd64-debian-user-cross-container:
-  <<: *container_job_definition
+  extends: .container_job_template
   stage: containers-layer2
   needs: ['amd64-debian10-container']
   variables:
     NAME: debian-all-test-cross
 
 amd64-debian-container:
-  <<: *container_job_definition
+  extends: .container_job_template
   stage: containers-layer2
   needs: ['amd64-debian10-container']
   variables:
     NAME: debian-amd64
 
 arm64-debian-cross-container:
-  <<: *container_job_definition
+  extends: .container_job_template
   stage: containers-layer2
   needs: ['amd64-debian10-container']
   variables:
     NAME: debian-arm64-cross
 
 arm64-test-debian-cross-container:
-  <<: *container_job_definition
+  extends: .container_job_template
   stage: containers-layer2
   needs: ['amd64-debian11-container']
   variables:
     NAME: debian-arm64-test-cross
 
 armel-debian-cross-container:
-  <<: *container_job_definition
+  extends: .container_job_template
   stage: containers-layer2
   needs: ['amd64-debian10-container']
   variables:
     NAME: debian-armel-cross
 
 armhf-debian-cross-container:
-  <<: *container_job_definition
+  extends: .container_job_template
   stage: containers-layer2
   needs: ['amd64-debian10-container']
   variables:
     NAME: debian-armhf-cross
 
 hppa-debian-cross-container:
-  <<: *container_job_definition
+  extends: .container_job_template
   stage: containers-layer2
   needs: ['amd64-debian10-container']
   variables:
     NAME: debian-hppa-cross
 
 m68k-debian-cross-container:
-  <<: *container_job_definition
+  extends: .container_job_template
   stage: containers-layer2
   needs: ['amd64-debian10-container']
   variables:
     NAME: debian-m68k-cross
 
 mips64-debian-cross-container:
-  <<: *container_job_definition
+  extends: .container_job_template
   stage: containers-layer2
   needs: ['amd64-debian10-container']
   variables:
     NAME: debian-mips64-cross
 
 mips64el-debian-cross-container:
-  <<: *container_job_definition
+  extends: .container_job_template
   stage: containers-layer2
   needs: ['amd64-debian10-container']
   variables:
     NAME: debian-mips64el-cross
 
 mips-debian-cross-container:
-  <<: *container_job_definition
+  extends: .container_job_template
   stage: containers-layer2
   needs: ['amd64-debian10-container']
   variables:
     NAME: debian-mips-cross
 
 mipsel-debian-cross-container:
-  <<: *container_job_definition
+  extends: .container_job_template
   stage: containers-layer2
   needs: ['amd64-debian10-container']
   variables:
     NAME: debian-mipsel-cross
 
 powerpc-debian-cross-container:
-  <<: *container_job_definition
+  extends: .container_job_template
   stage: containers-layer2
   needs: ['amd64-debian10-container']
   variables:
     NAME: debian-powerpc-cross
 
 ppc64-debian-cross-container:
-  <<: *container_job_definition
+  extends: .container_job_template
   stage: containers-layer2
   needs: ['amd64-debian10-container']
   variables:
     NAME: debian-ppc64-cross
 
 ppc64el-debian-cross-container:
-  <<: *container_job_definition
+  extends: .container_job_template
   stage: containers-layer2
   needs: ['amd64-debian10-container']
   variables:
     NAME: debian-ppc64el-cross
 
 riscv64-debian-cross-container:
-  <<: *container_job_definition
+  extends: .container_job_template
   stage: containers-layer2
   needs: ['amd64-debian10-container']
   variables:
     NAME: debian-riscv64-cross
 
 s390x-debian-cross-container:
-  <<: *container_job_definition
+  extends: .container_job_template
   stage: containers-layer2
   needs: ['amd64-debian10-container']
   variables:
     NAME: debian-s390x-cross
 
 sh4-debian-cross-container:
-  <<: *container_job_definition
+  extends: .container_job_template
   stage: containers-layer2
   needs: ['amd64-debian10-container']
   variables:
     NAME: debian-sh4-cross
 
 sparc64-debian-cross-container:
-  <<: *container_job_definition
+  extends: .container_job_template
   stage: containers-layer2
   needs: ['amd64-debian10-container']
   variables:
     NAME: debian-sparc64-cross
 
 tricore-debian-cross-container:
-  <<: *container_job_definition
+  extends: .container_job_template
   stage: containers-layer2
   needs: ['amd64-debian10-container']
   variables:
     NAME: debian-tricore-cross
 
 xtensa-debian-cross-container:
-  <<: *container_job_definition
+  extends: .container_job_template
   variables:
     NAME: debian-xtensa-cross
 
 cris-fedora-cross-container:
-  <<: *container_job_definition
+  extends: .container_job_template
   variables:
     NAME: fedora-cris-cross
 
 amd64-fedora-container:
-  <<: *container_job_definition
+  extends: .container_job_template
   variables:
     NAME: fedora
 
 i386-fedora-cross-container:
-  <<: *container_job_definition
+  extends: .container_job_template
   variables:
     NAME: fedora-i386-cross
 
 win32-fedora-cross-container:
-  <<: *container_job_definition
+  extends: .container_job_template
   variables:
     NAME: fedora-win32-cross
 
 win64-fedora-cross-container:
-  <<: *container_job_definition
+  extends: .container_job_template
   variables:
     NAME: fedora-win64-cross
 
 amd64-ubuntu1804-container:
-  <<: *container_job_definition
+  extends: .container_job_template
   variables:
     NAME: ubuntu1804
 
 amd64-ubuntu2004-container:
-  <<: *container_job_definition
+  extends: .container_job_template
   variables:
     NAME: ubuntu2004
 
 amd64-ubuntu-container:
-  <<: *container_job_definition
+  extends: .container_job_template
   variables:
     NAME: ubuntu
 
 amd64-opensuse-leap-container:
-  <<: *container_job_definition
+  extends: .container_job_template
   variables:
     NAME: opensuse-leap
-- 
2.26.3


