Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 39A204C8918
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Mar 2022 11:17:05 +0100 (CET)
Received: from localhost ([::1]:41192 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nOzZ1-00066F-Nz
	for lists+qemu-devel@lfdr.de; Tue, 01 Mar 2022 05:17:04 -0500
Received: from eggs.gnu.org ([209.51.188.92]:46418)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nOz6V-0003S8-63
 for qemu-devel@nongnu.org; Tue, 01 Mar 2022 04:47:36 -0500
Received: from [2a00:1450:4864:20::430] (port=37608
 helo=mail-wr1-x430.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1nOz6T-00079V-J5
 for qemu-devel@nongnu.org; Tue, 01 Mar 2022 04:47:34 -0500
Received: by mail-wr1-x430.google.com with SMTP id bk29so2219276wrb.4
 for <qemu-devel@nongnu.org>; Tue, 01 Mar 2022 01:47:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=2RgP2zpDIIOZAiHgV2LS00sHgCVEIEgHBVaYSoh4o8M=;
 b=VYOIiBd2OCqlXLR+rKb3WdTvegRM/z9aiyaAIFpqZXte/4QnZ27qgQh8kYo7Y3A7B8
 HpdxNVSTOFlXXPyDB9PEfVCu1cP19gdTNhTRtdOIFQGHhBnqGM+j+n/dcfS7oM4VAvYn
 0GxXKcoQKDpOAhZdrvreZ02TKX46Dqy6XC1yU8ggFHNqe3jCLiGrK73cKAY0RF89WtBO
 kevf0D6Y43Svjz5pa7a9DhEaiAir0fqElrWgA41ennYEpsHTn4eR7uU7LehRbmLvnelF
 SNATxrMwbtSz3O6fdUjYgXNU0kGo/65NmRexL4fUxVUXbgqr1l7VdSjEsgkVtTot/ktj
 XVpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=2RgP2zpDIIOZAiHgV2LS00sHgCVEIEgHBVaYSoh4o8M=;
 b=T7wcypWwgCzaYJiEPQiOENPwFpP1+ZgAQMma7uSbGOjUWKeRYhisz/4OTvZMjhHK+0
 c2I56GIhI3vtgOVPX28CCEwjopdUlCidLiI1Pw0X9/v0OinIVNjLv89di6DeA4zeu+hP
 37hJaRPbqKakiXb1ONECGb9OgkKeNqfSh1XRjHAUVrcAE5T5GwwH/2ijmpYPlmDDF/sJ
 ifvslqok+4ZFgSa+2enI6V7O74BmjeE5Qy1Qss/k3n0U1kgcGzcREEyF+6IyPgS6pdE9
 gM1ANxkaHDgMsy5DcWA9fJS5BTAssXkNuphwlgdgfrnbryp8pWwEMfAExTAR6nJ8ANXP
 Gthg==
X-Gm-Message-State: AOAM533il2CeTOkJava602yRP85E+oetgR+yXFrF76YeXo/tsMqXr8oU
 7b3hDXAdBC2XcZ2bAtDEjjIGNA==
X-Google-Smtp-Source: ABdhPJzpaaKpbpIm9qJXgkuVsPm9pnm+V8FH1NNZhFMOxpmAFvPvjxIUJfZd0IycMfPRc+ylyLtd/w==
X-Received: by 2002:a5d:5541:0:b0:1ef:607a:798d with SMTP id
 g1-20020a5d5541000000b001ef607a798dmr15616782wrw.610.1646128052226; 
 Tue, 01 Mar 2022 01:47:32 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id
 h9-20020adff189000000b001ea913352c9sm13035652wro.100.2022.03.01.01.47.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Mar 2022 01:47:22 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 30A6B1FFC1;
 Tue,  1 Mar 2022 09:47:16 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: peter.maydell@linaro.org
Subject: [PULL 09/18] gitlab: add a new aarch32 custom runner definition
Date: Tue,  1 Mar 2022 09:47:06 +0000
Message-Id: <20220301094715.550871-10-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220301094715.550871-1-alex.bennee@linaro.org>
References: <20220301094715.550871-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::430
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x430.google.com
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
 qemu-devel@nongnu.org, Wainer dos Santos Moschetta <wainersm@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Although running on aarch64 hardware we can still target 32bit builds
with a cross compiler and run the resulting binaries.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20220225172021.3493923-10-alex.bennee@linaro.org>

diff --git a/docs/devel/ci-jobs.rst.inc b/docs/devel/ci-jobs.rst.inc
index db3f571d5f..92e25872aa 100644
--- a/docs/devel/ci-jobs.rst.inc
+++ b/docs/devel/ci-jobs.rst.inc
@@ -44,6 +44,13 @@ If you've got access to an aarch64 host that can be used as a gitlab-CI
 runner, you can set this variable to enable the tests that require this
 kind of host. The runner should be tagged with "aarch64".
 
+AARCH32_RUNNER_AVAILABLE
+~~~~~~~~~~~~~~~~~~~~~~~~
+If you've got access to an armhf host or an arch64 host that can run
+aarch32 EL0 code to be used as a gitlab-CI runner, you can set this
+variable to enable the tests that require this kind of host. The
+runner should be tagged with "aarch32".
+
 S390X_RUNNER_AVAILABLE
 ~~~~~~~~~~~~~~~~~~~~~~
 If you've got access to an IBM Z host that can be used as a gitlab-CI
diff --git a/.gitlab-ci.d/custom-runners/ubuntu-20.40-aarch32.yml b/.gitlab-ci.d/custom-runners/ubuntu-20.40-aarch32.yml
new file mode 100644
index 0000000000..9c589bc4cf
--- /dev/null
+++ b/.gitlab-ci.d/custom-runners/ubuntu-20.40-aarch32.yml
@@ -0,0 +1,23 @@
+# All ubuntu-20.04 jobs should run successfully in an environment
+# setup by the scripts/ci/setup/qemu/build-environment.yml task
+# "Install basic packages to build QEMU on Ubuntu 18.04/20.04"
+
+ubuntu-20.04-aarch32-all:
+ needs: []
+ stage: build
+ tags:
+ - ubuntu_20.04
+ - aarch32
+ rules:
+ - if: '$CI_PROJECT_NAMESPACE == "qemu-project" && $CI_COMMIT_BRANCH =~ /^staging/'
+   when: manual
+   allow_failure: true
+ - if: "$AARCH32_RUNNER_AVAILABLE"
+   when: manual
+   allow_failure: true
+ script:
+ - mkdir build
+ - cd build
+ - ../configure --cross-prefix=arm-linux-gnueabihf-
+ - make --output-sync -j`nproc`
+ - make --output-sync -j`nproc` check V=1
-- 
2.30.2


