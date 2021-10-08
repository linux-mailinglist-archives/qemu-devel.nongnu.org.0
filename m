Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 31D2B426AE0
	for <lists+qemu-devel@lfdr.de>; Fri,  8 Oct 2021 14:34:36 +0200 (CEST)
Received: from localhost ([::1]:57158 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mYp59-0003qw-8L
	for lists+qemu-devel@lfdr.de; Fri, 08 Oct 2021 08:34:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60578)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1mYowz-00032G-E6
 for qemu-devel@nongnu.org; Fri, 08 Oct 2021 08:26:11 -0400
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b]:44969)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1mYowx-0006vT-FJ
 for qemu-devel@nongnu.org; Fri, 08 Oct 2021 08:26:09 -0400
Received: by mail-wr1-x42b.google.com with SMTP id s15so29382056wrv.11
 for <qemu-devel@nongnu.org>; Fri, 08 Oct 2021 05:26:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ntHPAm7ZTn3P7GMc4eSupec9FlVNAY5eKw7rkTf/RLU=;
 b=e36UzqJ+2WHKi4j1zXyKR7/CUVaPtkfm1PZJe/hjQuWX7VjBN25G+YPRAWYshSqWgr
 dPHLw4SGWrUdlcNZGFoKBG0yOocPFyVMjMKL6NVpj++HJrUZToNT3FEdCEfuwvxfWCg2
 KuveMR695UoV4yYsQppqgSuebKwmwuwYDGr6ilCLlbXopBVA25ee0zLNrnLOl9WBhLKG
 dzopEro1cFsf5VrK5QowgFSIYDntxy8MLBOs4FIFgFPbKQEbyea29+H6Awb0e3mayGxY
 AmpoYf88KTq3UAem0F3bxwFBF02b4KujdrlZgNMU0M/tsw9Sv9HegbYHtaH8wOTnX/1X
 VM6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ntHPAm7ZTn3P7GMc4eSupec9FlVNAY5eKw7rkTf/RLU=;
 b=L+ldnQ4YVRRfk6DY6lvi2AOZIpalOStiPOsuYY5Oj3zk1umq8DTy3pc8BWgjx1Jb40
 PbntgNitrTCNp3TMtPXh6F0ig/9xSf5WgPuJO53kujTmcQRGWHPFVAchJjp9YOSEv6Sf
 tEUgaYABI0k7eScHR8mN/KfIcCoiMx3U3j2fLTwqIBLw+bo6Kj62nrJxpbLbnW2pUj6k
 8bPtI4pOnwA4zHnbrvlrT6T9xh+t5SLiHPb+kaJ0BTxIEprsyZ4qQCtNPlsdY5onlvqe
 zfFj37VnuUVqALMloAInzFgAaYba70eNtXIINr7KH87sRcFYsdM8/9jCajYhHOpx8LQc
 /QXw==
X-Gm-Message-State: AOAM531SNmId/0cJJyjf1xlW5BL2InRrstU8PrVi3D27CRCQUaQ1SWYL
 /Iplgl80dz8xoXrmm9grTf6pqg==
X-Google-Smtp-Source: ABdhPJwAuKbf0Vc4oWoGMVfxJb+TA4szYKDNRO9Dkg8X/JzieZuw77WvOFB1SrDi/ReZRPw9DLIzAA==
X-Received: by 2002:adf:97d0:: with SMTP id t16mr3549183wrb.124.1633695966185; 
 Fri, 08 Oct 2021 05:26:06 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id s3sm2383556wrm.40.2021.10.08.05.25.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Oct 2021 05:26:00 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id C7FEA1FF9F;
 Fri,  8 Oct 2021 13:25:56 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: richard.henderson@linaro.org
Subject: [PULL 08/12] gitlab: fix passing of TEST_TARGETS env to cirrus
Date: Fri,  8 Oct 2021 13:25:52 +0100
Message-Id: <20211008122556.757252-9-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211008122556.757252-1-alex.bennee@linaro.org>
References: <20211008122556.757252-1-alex.bennee@linaro.org>
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
Cc: peter.maydell@linaro.org, Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 qemu-devel@nongnu.org, Wainer dos Santos Moschetta <wainersm@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Willian Rampazzo <willianr@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Daniel P. Berrangé <berrange@redhat.com>

A typo meant the substitution would not work, and the placeholder in the
target file didn't even exist.

The result was that tests were never run on the FreeBSD and macOS jobs,
only a basic build.

Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
Acked-by: Thomas Huth <thuth@redhat.com>
Reviewed-by: Willian Rampazzo <willianr@redhat.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20210915125452.1704899-3-berrange@redhat.com>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20210917162332.3511179-10-alex.bennee@linaro.org>

diff --git a/.gitlab-ci.d/cirrus.yml b/.gitlab-ci.d/cirrus.yml
index 675db69622..e7b25e7427 100644
--- a/.gitlab-ci.d/cirrus.yml
+++ b/.gitlab-ci.d/cirrus.yml
@@ -35,7 +35,7 @@
           -e "s|[@]PIP3@|$PIP3|g"
           -e "s|[@]PYPI_PKGS@|$PYPI_PKGS|g"
           -e "s|[@]CONFIGURE_ARGS@|$CONFIGURE_ARGS|g"
-          -e "s|[@]TEST_TARGETSS@|$TEST_TARGETSS|g"
+          -e "s|[@]TEST_TARGETS@|$TEST_TARGETS|g"
       <.gitlab-ci.d/cirrus/build.yml >.gitlab-ci.d/cirrus/$NAME.yml
     - cat .gitlab-ci.d/cirrus/$NAME.yml
     - cirrus-run -v --show-build-log always .gitlab-ci.d/cirrus/$NAME.yml
diff --git a/.gitlab-ci.d/cirrus/build.yml b/.gitlab-ci.d/cirrus/build.yml
index 857bdc5536..c555f5d36e 100644
--- a/.gitlab-ci.d/cirrus/build.yml
+++ b/.gitlab-ci.d/cirrus/build.yml
@@ -13,6 +13,7 @@ env:
   PYTHON: "@PYTHON@"
   MAKE: "@MAKE@"
   CONFIGURE_ARGS: "@CONFIGURE_ARGS@"
+  TEST_TARGETS: "@TEST_TARGETS@"
 
 build_task:
   install_script:
-- 
2.30.2


