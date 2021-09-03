Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EA6D3FFCC7
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Sep 2021 11:10:57 +0200 (CEST)
Received: from localhost ([::1]:48200 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mM5Ds-0006wb-Gp
	for lists+qemu-devel@lfdr.de; Fri, 03 Sep 2021 05:10:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43318)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1mM572-00064M-GA
 for qemu-devel@nongnu.org; Fri, 03 Sep 2021 05:03:52 -0400
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b]:36732)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1mM56z-0005ZD-Hr
 for qemu-devel@nongnu.org; Fri, 03 Sep 2021 05:03:51 -0400
Received: by mail-wr1-x42b.google.com with SMTP id q14so7179459wrp.3
 for <qemu-devel@nongnu.org>; Fri, 03 Sep 2021 02:03:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=KKnSH+lDAvOjNQH8hqEes6n/qTsZNa6jN/zhCFc0/UU=;
 b=vXdQPPqDZHGgSouXUOEDrFpLo5Q8vV7kwTuyDcHJC6uIg5Gb353k4LrimZlUFoYvN5
 GJ/fl5h8zrdM9k5ozT/kXF17nQHbg4Qmj/r9nq9jI+uvnX5Z8UDNQjp1nPhjJBmdGbyg
 Mcv7milvUFxclkPsrK1Eavu2DH9y2JWMaLw++T5fZJ/mVrw95aKc7J7SrVJWJFkjYuhq
 IYaseP3aODtsKBIW7A2p6/0rgpUwySq5tHh/rYSmK9+Jg+XJbjMAOOulqfq700vp/X9E
 9z1mwjr7qIt6MgoWV1gsFgxyoD3g2CbON26YpQKkVihZIsw9qtt4JefoOERMC/1p6XQd
 y00w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=KKnSH+lDAvOjNQH8hqEes6n/qTsZNa6jN/zhCFc0/UU=;
 b=SOLJiIc5Fi3Unqy+3DwC+sfV54HSX7kqz+KXgV247S45n+TY9P06XcMVD2OmGj6R8s
 EcfZ0XtdOKY838iyDhGc7titWHVdmh4BEgOIrRtrIlepW1GJv8QCoLIyi4M35/LdoVs4
 HZzL84VL5rjCaiGuJFsObuKpMnbgVQgWKBu1x/mH789c6auz4S+fN7J1+lDCL9tBVJK5
 /6L3Up72AhRD9B6oA2NLl4JtNYKTX7vCUzYezezNm/a7dxGb5sFXJPReph+oQHOejthJ
 FA9NUjcu5BEkV7XN2WnsnVNVI8NUcdJQNV12Cla9qpLm0u/dPyz74IEp6jHzHH2balCW
 WrjA==
X-Gm-Message-State: AOAM532wYWh5alVdsgIgkiGZFmJ+Y4baJWB6tsUs1McyNZ+4ok2guWOD
 7WCRR0ggW0jeXNq9oOJ3qEaL9Q==
X-Google-Smtp-Source: ABdhPJw2Hi6C/pmczsISjmfc5XS2YQoEb2WgSapdZW8W+DFlLgKiLQ8nF4LKTXq4utd9tMZwbvJGrA==
X-Received: by 2002:adf:9f0c:: with SMTP id l12mr2940227wrf.146.1630659828175; 
 Fri, 03 Sep 2021 02:03:48 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id c14sm4189745wrr.58.2021.09.03.02.03.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Sep 2021 02:03:42 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 340D01FF9B;
 Fri,  3 Sep 2021 10:03:40 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: peter.maydell@linaro.org
Subject: [PULL 04/22] gitlab-ci: Fix ..._RUNNER_AVAILABLE variables and
 document them
Date: Fri,  3 Sep 2021 10:03:21 +0100
Message-Id: <20210903090339.1074887-5-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210903090339.1074887-1-alex.bennee@linaro.org>
References: <20210903090339.1074887-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42b.google.com
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
Cc: Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org, Wainer dos Santos Moschetta <wainersm@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Willian Rampazzo <willianr@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Thomas Huth <thuth@redhat.com>

The patch that recently introduced the S390X_RUNNER_AVAILABLE variable
in custom-runners.yml missed that the bottom half of the file is rather
about aarch64 than s390x. Thus rename the S390X_RUNNER_AVAILABLE to
AARCH64_RUNNER_AVAILABLE in those jobs.

Finally mention both variables in our CI documentation, too.

Fixes: c5dd0f0342 ("Improve rules for the staging branch")
Signed-off-by: Thomas Huth <thuth@redhat.com>
Reviewed-by: Willian Rampazzo <willianr@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Message-Id: <20210730143809.717079-4-thuth@redhat.com>
[AJB: moved due to docu changes]
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20210806141015.2487502-5-alex.bennee@linaro.org>

diff --git a/docs/devel/ci-jobs.rst b/docs/devel/ci-jobs.rst
index 9cd9819786..277975e4ad 100644
--- a/docs/devel/ci-jobs.rst
+++ b/docs/devel/ci-jobs.rst
@@ -38,3 +38,14 @@ these artifacts are not already cached, downloading them make the jobs
 reach the timeout limit). Set this variable to have the tests using the
 Avocado framework run automatically.
 
+AARCH64_RUNNER_AVAILABLE
+~~~~~~~~~~~~~~~~~~~~~~~~
+If you've got access to an aarch64 host that can be used as a gitlab-CI
+runner, you can set this variable to enable the tests that require this
+kind of host. The runner should be tagged with "aarch64".
+
+S390X_RUNNER_AVAILABLE
+~~~~~~~~~~~~~~~~~~~~~~
+If you've got access to an IBM Z host that can be used as a gitlab-CI
+runner, you can set this variable to enable the tests that require this
+kind of host. The runner should be tagged with "s390x".
diff --git a/.gitlab-ci.d/custom-runners.yml b/.gitlab-ci.d/custom-runners.yml
index 564b94565d..0d3e4a7b4b 100644
--- a/.gitlab-ci.d/custom-runners.yml
+++ b/.gitlab-ci.d/custom-runners.yml
@@ -137,7 +137,7 @@ ubuntu-20.04-aarch64-all-linux-static:
  - aarch64
  rules:
  - if: '$CI_PROJECT_NAMESPACE == "qemu-project" && $CI_COMMIT_BRANCH =~ /^staging/'
- - if: "$S390X_RUNNER_AVAILABLE"
+ - if: "$AARCH64_RUNNER_AVAILABLE"
  script:
  # --disable-libssh is needed because of https://bugs.launchpad.net/qemu/+bug/1838763
  # --disable-glusterfs is needed because there's no static version of those libs in distro supplied packages
@@ -157,7 +157,7 @@ ubuntu-20.04-aarch64-all:
  - aarch64
  rules:
  - if: '$CI_PROJECT_NAMESPACE == "qemu-project" && $CI_COMMIT_BRANCH =~ /^staging/'
- - if: "$S390X_RUNNER_AVAILABLE"
+ - if: "$AARCH64_RUNNER_AVAILABLE"
  script:
  - mkdir build
  - cd build
@@ -174,7 +174,7 @@ ubuntu-20.04-aarch64-alldbg:
  - aarch64
  rules:
  - if: '$CI_PROJECT_NAMESPACE == "qemu-project" && $CI_COMMIT_BRANCH =~ /^staging/'
- - if: "$S390X_RUNNER_AVAILABLE"
+ - if: "$AARCH64_RUNNER_AVAILABLE"
  script:
  - mkdir build
  - cd build
@@ -193,7 +193,7 @@ ubuntu-20.04-aarch64-clang:
  rules:
  - if: '$CI_PROJECT_NAMESPACE == "qemu-project" && $CI_COMMIT_BRANCH =~ /^staging/'
    when: manual
- - if: "$S390X_RUNNER_AVAILABLE"
+ - if: "$AARCH64_RUNNER_AVAILABLE"
    when: manual
  script:
  - mkdir build
@@ -211,7 +211,7 @@ ubuntu-20.04-aarch64-tci:
  - aarch64
  rules:
  - if: '$CI_PROJECT_NAMESPACE == "qemu-project" && $CI_COMMIT_BRANCH =~ /^staging/'
- - if: "$S390X_RUNNER_AVAILABLE"
+ - if: "$AARCH64_RUNNER_AVAILABLE"
  script:
  - mkdir build
  - cd build
@@ -228,7 +228,7 @@ ubuntu-20.04-aarch64-notcg:
  rules:
  - if: '$CI_PROJECT_NAMESPACE == "qemu-project" && $CI_COMMIT_BRANCH =~ /^staging/'
    when: manual
- - if: "$S390X_RUNNER_AVAILABLE"
+ - if: "$AARCH64_RUNNER_AVAILABLE"
    when: manual
  script:
  - mkdir build
-- 
2.30.2


