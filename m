Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B68784C4CDA
	for <lists+qemu-devel@lfdr.de>; Fri, 25 Feb 2022 18:49:30 +0100 (CET)
Received: from localhost ([::1]:58846 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nNeif-0001QM-RP
	for lists+qemu-devel@lfdr.de; Fri, 25 Feb 2022 12:49:29 -0500
Received: from eggs.gnu.org ([209.51.188.92]:41524)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nNeMK-0002oW-AL
 for qemu-devel@nongnu.org; Fri, 25 Feb 2022 12:26:24 -0500
Received: from [2a00:1450:4864:20::52f] (port=40666
 helo=mail-ed1-x52f.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nNeMG-0004Hn-Jp
 for qemu-devel@nongnu.org; Fri, 25 Feb 2022 12:26:23 -0500
Received: by mail-ed1-x52f.google.com with SMTP id h15so8361379edv.7
 for <qemu-devel@nongnu.org>; Fri, 25 Feb 2022 09:26:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=0oBkta3GCwdwLjFZvcNTgip4U0wX9WaLemmg12u8TiI=;
 b=eBZr8pprttau3jYTlX1IGwIkU7KvewwCXvkYFUi3gOpuRJ6XHO52nYkjEaq3cPKcje
 7tazM4ROG5vDs4Sm7zSLl8fgKoW1Imz+yTwQ6FXAUTww9vynpecH9s+UvoU5sd628CTb
 UQSHK39rcOcKUeW3zkkqVJLst8kwbB4mVmQ8vIfLAmwmagg7qbPAj9EiygXwE2g07Tvd
 DFibgeSWP40C+jqiyXaarSdCNJy7fU/xktPvDXSS4i/30grGHnmlQX2ioZMEmLYdNr1n
 r095Ev77aKHrvYMgteiPHEXWUfHyMJfC5hoaU+4sgg3OWB8Q+vvs6GFecO8z+jQfjBNr
 Z/9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=0oBkta3GCwdwLjFZvcNTgip4U0wX9WaLemmg12u8TiI=;
 b=y0l1pEe/fm446nd8l/M2B26vJSnV/5dJehsILY/byrjxPR/WcrjaTBFMMLJ7AOfRgn
 e3lA7VP+BFxL84TFNiBQyk6v7byAystD2oSKqtl5s5wrqi9GqU3bqYAqAtGE83/AviOq
 zhyiDtyXxU41PgTh811adKR97KS4Ohn41JVD6WsoWNYHREX/lv+UDKGYR5hVEEQBViiO
 AbSmAW8QlQbvWWdlfAGnBWhpJ+rvYoLt8/6274VDYGTjWUvDl0Q446VbDhUZLJMqJlrm
 q/D8lfREo0wL8Z61ovGykUDK23+VQ+hX92R7KdYvtxgnKkbHpaqMGk+pbcqIj/ynch8J
 xdPQ==
X-Gm-Message-State: AOAM533/sAqTJMoRDd6iL6HxgEUP0HLpMq9RAZrfbQnqP2Kgk980rb5w
 IdZXeZZ+qAdzqmfAGWIdjwIodg==
X-Google-Smtp-Source: ABdhPJwrWjHlsqj3AlqrPP64P8+x8bwqbiLYmboZa/3zDM+UU8iCIurae04jpUFn4NTOQ8khdChpzw==
X-Received: by 2002:a05:6402:4392:b0:412:ac91:6c70 with SMTP id
 o18-20020a056402439200b00412ac916c70mr7995577edc.83.1645809977186; 
 Fri, 25 Feb 2022 09:26:17 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id
 el9-20020a170907284900b006cf8e3c83e3sm1246265ejc.168.2022.02.25.09.26.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Feb 2022 09:26:16 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 7345C1FFC7;
 Fri, 25 Feb 2022 17:20:23 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 15/18] gitlab: upgrade the job definition for s390x to 20.04
Date: Fri, 25 Feb 2022 17:20:18 +0000
Message-Id: <20220225172021.3493923-16-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220225172021.3493923-1-alex.bennee@linaro.org>
References: <20220225172021.3493923-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::52f
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::52f;
 envelope-from=alex.bennee@linaro.org; helo=mail-ed1-x52f.google.com
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
Cc: fam@euphon.net, Peter Maydell <peter.maydell@linaro.org>,
 Thomas Huth <thuth@redhat.com>, berrange@redhat.com,
 Beraldo Leal <bleal@redhat.com>, sw@weilnetz.de,
 Cornelia Huck <cohuck@redhat.com>, richard.henderson@linaro.org,
 f4bug@amsat.org, Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 "open list:S390 general arch..." <qemu-s390x@nongnu.org>, qemu-arm@nongnu.org,
 stefanha@redhat.com, crosa@redhat.com, pbonzini@redhat.com,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>, aurelien@aurel32.net
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
---
 .gitlab-ci.d/custom-runners.yml               |  2 +-
 ...18.04-s390x.yml => ubuntu-20.04-s390x.yml} | 28 +++++++++----------
 2 files changed, 15 insertions(+), 15 deletions(-)
 rename .gitlab-ci.d/custom-runners/{ubuntu-18.04-s390x.yml => ubuntu-20.04-s390x.yml} (87%)

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


