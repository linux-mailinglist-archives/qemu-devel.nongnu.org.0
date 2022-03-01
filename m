Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CC3554C889A
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Mar 2022 10:58:04 +0100 (CET)
Received: from localhost ([::1]:35536 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nOzGd-00082C-UC
	for lists+qemu-devel@lfdr.de; Tue, 01 Mar 2022 04:58:03 -0500
Received: from eggs.gnu.org ([209.51.188.92]:46620)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nOz6c-0003UL-3z
 for qemu-devel@nongnu.org; Tue, 01 Mar 2022 04:47:42 -0500
Received: from [2a00:1450:4864:20::42a] (port=36583
 helo=mail-wr1-x42a.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nOz6Z-0007Bc-UT
 for qemu-devel@nongnu.org; Tue, 01 Mar 2022 04:47:41 -0500
Received: by mail-wr1-x42a.google.com with SMTP id r10so19547986wrp.3
 for <qemu-devel@nongnu.org>; Tue, 01 Mar 2022 01:47:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=FEukhn5LuXoEMOF2RAOm0ngW9ZGKUNwyGsnNN8c0JYU=;
 b=OAc8uy5+5sB7GDcltM7UzhfAdIUSdYcTpvy8aTn37pP6VVgxpaPXHP7HNXzdVVGte8
 JvaE++3N3Y1pahl1oFUzbjHno5naBEA/4aRI18Kx97jcFWuzb+ocohYQahHWSTInPKpV
 0RBpXUc86EuYKyW78jTI9crxWRblk5dIwyPpFDx/slK/SHDHRXNrvYe8KgY6fbM1EDL7
 bu+FRtcE27EPKw6kO+hHzj/UBbCKtK0of10rACu1o6xUTZ3sqt+lTlD6AZ9ZKqTtqFFs
 TDu5ZbXJCopSefbSWT8zYYZwXYABt/A+cLFSjscmx5hNX3VgNw4KopPWccyuEz7HRLQs
 o2wQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=FEukhn5LuXoEMOF2RAOm0ngW9ZGKUNwyGsnNN8c0JYU=;
 b=74rJSmhMHGVq516rKO+ZO0jAIlfKl8qGa27PdJ3gaTw1UO19jyVA2VhzspT2vDXS4I
 JvLytxZHgo3I0/wulYxeKWVHVYPVN4RiP3fvBfYtfr0tWu/27HlgBK+GX7PngWqdvtRJ
 /Ixrm/oy79yF0cLYeYAb+ctIp0X0SQFBc5X1jlfUArYAX423RSE8PsadkOgcGxtEqztm
 C2811/0P0Sxuvs2av87D8K9IISQPi/tZdby/sQ7Jp/H/bkOtld4keQzSxZKiBSHmts+X
 3lN9hdoXG/mmjmEYM6BCmeHXWtn6gtCdHvAAcEN7pvfR/LrhOAr4zaWsRcBCv8S2GzdP
 1y2w==
X-Gm-Message-State: AOAM5306ncuoK0rNbDiHFaaVBVmA8sl47jCrTOFbE9YShY5VZct5b28O
 RRn6CkhZjai2rqw0AeTJav32pQ==
X-Google-Smtp-Source: ABdhPJz73u+OQR6BnnCA25ox8ez79d/kJqe80a+UT5VyXCGeslcQmrBnY+RL5K3dLMPyjPv+qZtu1Q==
X-Received: by 2002:adf:a150:0:b0:1ee:72f9:7c07 with SMTP id
 r16-20020adfa150000000b001ee72f97c07mr17894165wrr.674.1646128058601; 
 Tue, 01 Mar 2022 01:47:38 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id
 z5-20020a05600c0a0500b0037fa93193a8sm2601157wmp.44.2022.03.01.01.47.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Mar 2022 01:47:34 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id BC2631FFC7;
 Tue,  1 Mar 2022 09:47:16 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: peter.maydell@linaro.org
Subject: [PULL 15/18] gitlab: upgrade the job definition for s390x to 20.04
Date: Tue,  1 Mar 2022 09:47:12 +0000
Message-Id: <20220301094715.550871-16-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220301094715.550871-1-alex.bennee@linaro.org>
References: <20220301094715.550871-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::42a
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42a.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Thomas Huth <thuth@redhat.com>, Beraldo Leal <bleal@redhat.com>,
 Cornelia Huck <cohuck@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 "open list:S390 general arch..." <qemu-s390x@nongnu.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The new s390x machine has more of everything including the OS. As
18.04 will soon be going we might as well get onto something moderately
modern.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Acked-by: Christian Borntraeger <borntraeger@de.ibm.com>
Reviewed-by: Thomas Huth <thuth@redhat.com>
Acked-by: Cornelia Huck <cohuck@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Cc: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20220225172021.3493923-16-alex.bennee@linaro.org>

diff --git a/.gitlab-ci.d/custom-runners.yml b/.gitlab-ci.d/custom-runners.yml
index 056c374619..3e76a2034a 100644
--- a/.gitlab-ci.d/custom-runners.yml
+++ b/.gitlab-ci.d/custom-runners.yml
@@ -14,6 +14,6 @@ variables:
   GIT_STRATEGY: clone
 
 include:
-  - local: '/.gitlab-ci.d/custom-runners/ubuntu-18.04-s390x.yml'
+  - local: '/.gitlab-ci.d/custom-runners/ubuntu-20.04-s390x.yml'
   - local: '/.gitlab-ci.d/custom-runners/ubuntu-20.04-aarch64.yml'
   - local: '/.gitlab-ci.d/custom-runners/centos-stream-8-x86_64.yml'
diff --git a/.gitlab-ci.d/custom-runners/ubuntu-18.04-s390x.yml b/.gitlab-ci.d/custom-runners/ubuntu-20.04-s390x.yml
similarity index 87%
rename from .gitlab-ci.d/custom-runners/ubuntu-18.04-s390x.yml
rename to .gitlab-ci.d/custom-runners/ubuntu-20.04-s390x.yml
index f39d874a1e..0333872113 100644
--- a/.gitlab-ci.d/custom-runners/ubuntu-18.04-s390x.yml
+++ b/.gitlab-ci.d/custom-runners/ubuntu-20.04-s390x.yml
@@ -1,12 +1,12 @@
-# All ubuntu-18.04 jobs should run successfully in an environment
+# All ubuntu-20.04 jobs should run successfully in an environment
 # setup by the scripts/ci/setup/build-environment.yml task
-# "Install basic packages to build QEMU on Ubuntu 18.04/20.04"
+# "Install basic packages to build QEMU on Ubuntu 20.04/20.04"
 
-ubuntu-18.04-s390x-all-linux-static:
+ubuntu-20.04-s390x-all-linux-static:
  needs: []
  stage: build
  tags:
- - ubuntu_18.04
+ - ubuntu_20.04
  - s390x
  rules:
  - if: '$CI_PROJECT_NAMESPACE == "qemu-project" && $CI_COMMIT_BRANCH =~ /^staging/'
@@ -21,11 +21,11 @@ ubuntu-18.04-s390x-all-linux-static:
  - make --output-sync -j`nproc` check V=1
  - make --output-sync -j`nproc` check-tcg V=1
 
-ubuntu-18.04-s390x-all:
+ubuntu-20.04-s390x-all:
  needs: []
  stage: build
  tags:
- - ubuntu_18.04
+ - ubuntu_20.04
  - s390x
  rules:
  - if: '$CI_PROJECT_NAMESPACE == "qemu-project" && $CI_COMMIT_BRANCH =~ /^staging/'
@@ -37,11 +37,11 @@ ubuntu-18.04-s390x-all:
  - make --output-sync -j`nproc`
  - make --output-sync -j`nproc` check V=1
 
-ubuntu-18.04-s390x-alldbg:
+ubuntu-20.04-s390x-alldbg:
  needs: []
  stage: build
  tags:
- - ubuntu_18.04
+ - ubuntu_20.04
  - s390x
  rules:
  - if: '$CI_PROJECT_NAMESPACE == "qemu-project" && $CI_COMMIT_BRANCH =~ /^staging/'
@@ -58,11 +58,11 @@ ubuntu-18.04-s390x-alldbg:
  - make --output-sync -j`nproc`
  - make --output-sync -j`nproc` check V=1
 
-ubuntu-18.04-s390x-clang:
+ubuntu-20.04-s390x-clang:
  needs: []
  stage: build
  tags:
- - ubuntu_18.04
+ - ubuntu_20.04
  - s390x
  rules:
  - if: '$CI_PROJECT_NAMESPACE == "qemu-project" && $CI_COMMIT_BRANCH =~ /^staging/'
@@ -78,11 +78,11 @@ ubuntu-18.04-s390x-clang:
  - make --output-sync -j`nproc`
  - make --output-sync -j`nproc` check V=1
 
-ubuntu-18.04-s390x-tci:
+ubuntu-20.04-s390x-tci:
  needs: []
  stage: build
  tags:
- - ubuntu_18.04
+ - ubuntu_20.04
  - s390x
  rules:
  - if: '$CI_PROJECT_NAMESPACE == "qemu-project" && $CI_COMMIT_BRANCH =~ /^staging/'
@@ -97,11 +97,11 @@ ubuntu-18.04-s390x-tci:
  - ../configure --disable-libssh --enable-tcg-interpreter
  - make --output-sync -j`nproc`
 
-ubuntu-18.04-s390x-notcg:
+ubuntu-20.04-s390x-notcg:
  needs: []
  stage: build
  tags:
- - ubuntu_18.04
+ - ubuntu_20.04
  - s390x
  rules:
  - if: '$CI_PROJECT_NAMESPACE == "qemu-project" && $CI_COMMIT_BRANCH =~ /^staging/'
-- 
2.30.2


