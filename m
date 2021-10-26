Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 63EFC43AFF9
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Oct 2021 12:24:56 +0200 (CEST)
Received: from localhost ([::1]:33024 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mfJdX-0002rh-HN
	for lists+qemu-devel@lfdr.de; Tue, 26 Oct 2021 06:24:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51258)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1mfJbT-0000qx-0Q
 for qemu-devel@nongnu.org; Tue, 26 Oct 2021 06:22:47 -0400
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a]:43545)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1mfJbN-0007Ph-TK
 for qemu-devel@nongnu.org; Tue, 26 Oct 2021 06:22:45 -0400
Received: by mail-wm1-x32a.google.com with SMTP id
 67-20020a1c1946000000b0030d4c90fa87so1657854wmz.2
 for <qemu-devel@nongnu.org>; Tue, 26 Oct 2021 03:22:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=i/ilTMHjD7pndzO8L34GGfxe3eBn4K4fjkK0HYYsKOc=;
 b=FT3wVJa2m05ivtVIwRu7CvttpM4wdn448xDTxzqgfVn5OgTXfesDn+gMtTnGrrvXNt
 0bAcmpGxOciv8LR5sTfvkV4niYdOCY7K2cUt4PkwIP/eGo/HDFFZpfGjVaBO0bVzb5PC
 lG7mwmHtmoZYQ11uQsKKxwW0ENKRjw65TBP5lWda51+ZtkLLozGCRbh+ULXadhn8GQYG
 +wk/SSNR9cXDILSeiloJ4wdnBkl++u23P92oWT5DqXV7i4qMbo73j4o7jhfMHelpmo7D
 OCEV6Z4hCNq5apGVlgVSPHhf63eCVzCASiE9I6tYv3CsUojEl96g+WP2Js+dTHj747OT
 WRqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=i/ilTMHjD7pndzO8L34GGfxe3eBn4K4fjkK0HYYsKOc=;
 b=7vHYL9fU9jPGKeqoraJxi4HFKdUkF6aPkyPXU/oPtzuSBiPrFfV9tgW2+sMs97zfld
 vvAlZpirMt55aUeNhwLbPTa+wjESJ4Gz5YES21aH7qiGOO+XaubmPLQf22FxYjScUABh
 OBsWWwYT+W/h1M355RjhxNu9Civd5EiraQ442XRCHJsK2d+WX9P6Zv1TwGmDtvNOaGq6
 c6mQSg315J0EFOU2rEZfEbZ4kIRChdCM95jYUXblKze5V0cPhMS3k9H43oyoqwz7lx6c
 dogeTF/ID44dma3/b3Mii8OHR0DF0wqBQcuyjz3RxRyjN5fDaEXft8lWwdDOiKgrmOqh
 h4cw==
X-Gm-Message-State: AOAM532jQKud/i+DPaa6s7cz9iVS4SAzskEA1YHUk2gRnTnOIxnjD/AL
 aEPYuNBLwuvnc+WrA53fDQYAuQ==
X-Google-Smtp-Source: ABdhPJwwcQCcx3FzdP7J8RG/fwxnSr+H+V03oopfu5Ea5rdWm99cNTmNgcgoIjA7s/XSCIUlBLVJlQ==
X-Received: by 2002:a05:600c:2f81:: with SMTP id
 t1mr11841116wmn.56.1635243760466; 
 Tue, 26 Oct 2021 03:22:40 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id o10sm176035wmr.31.2021.10.26.03.22.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Oct 2021 03:22:39 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 1B74E1FF9B;
 Tue, 26 Oct 2021 11:22:35 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v1 04/28] gitlab-ci: Remove special casing for hexagon testing
Date: Tue, 26 Oct 2021 11:22:10 +0100
Message-Id: <20211026102234.3961636-5-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211026102234.3961636-1-alex.bennee@linaro.org>
References: <20211026102234.3961636-1-alex.bennee@linaro.org>
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
Cc: fam@euphon.net, Thomas Huth <thuth@redhat.com>, minyihh@uci.edu,
 berrange@redhat.com, kuhn.chenqun@huawei.com,
 Richard Henderson <richard.henderson@linaro.org>, f4bug@amsat.org,
 robhenry@microsoft.com, Willian Rampazzo <willianr@redhat.com>,
 mahmoudabdalghany@outlook.com, aaron@os.amperecomputing.com, cota@braap.org,
 Wainer dos Santos Moschetta <wainersm@redhat.com>, stefanha@redhat.com,
 crosa@redhat.com, pbonzini@redhat.com, ma.mandourr@gmail.com,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>, aurelien@aurel32.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Richard Henderson <richard.henderson@linaro.org>

Now that the hexagon container is using a pre-built
toolchain, we do not need to make the build optional.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20211014224435.2539547-5-richard.henderson@linaro.org>
---
 .gitlab-ci.d/buildtest.yml       |  4 ----
 .gitlab-ci.d/container-cross.yml | 27 +++------------------------
 2 files changed, 3 insertions(+), 28 deletions(-)

diff --git a/.gitlab-ci.d/buildtest.yml b/.gitlab-ci.d/buildtest.yml
index 5c378e35f9..27b9b6be6b 100644
--- a/.gitlab-ci.d/buildtest.yml
+++ b/.gitlab-ci.d/buildtest.yml
@@ -249,14 +249,10 @@ build-user-static:
     CONFIGURE_ARGS: --disable-tools --disable-system --static
     MAKE_CHECK_ARGS: check-tcg
 
-# Because the hexagon cross-compiler takes so long to build we don't rely
-# on the CI system to build it and hence this job has an optional dependency
-# declared. The image is manually uploaded.
 build-user-hexagon:
   extends: .native_build_job_template
   needs:
     job: hexagon-cross-container
-    optional: true
   variables:
     IMAGE: debian-hexagon-cross
     TARGETS: hexagon-linux-user
diff --git a/.gitlab-ci.d/container-cross.yml b/.gitlab-ci.d/container-cross.yml
index a3b5b90552..ed7a849a69 100644
--- a/.gitlab-ci.d/container-cross.yml
+++ b/.gitlab-ci.d/container-cross.yml
@@ -47,33 +47,12 @@ armhf-debian-cross-container:
   variables:
     NAME: debian-armhf-cross
 
-# We never want to build hexagon in the CI system and by default we
-# always want to refer to the master registry where it lives.
 hexagon-cross-container:
-  image: docker:stable
-  stage: containers
-  rules:
-    - if: '$CI_PROJECT_NAMESPACE == "qemu-project"'
-      when: never
-    - when: always
+  extends: .container_job_template
+  stage: containers-layer2
+  needs: ['amd64-debian10-container']
   variables:
     NAME: debian-hexagon-cross
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
 
 hppa-debian-cross-container:
   extends: .container_job_template
-- 
2.30.2


