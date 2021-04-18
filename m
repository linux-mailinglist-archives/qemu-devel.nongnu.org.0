Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D2CBC36388C
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Apr 2021 01:39:39 +0200 (CEST)
Received: from localhost ([::1]:52262 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lYH0s-0004Pb-WD
	for lists+qemu-devel@lfdr.de; Sun, 18 Apr 2021 19:39:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44298)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lYGwT-0008Qf-E1
 for qemu-devel@nongnu.org; Sun, 18 Apr 2021 19:35:05 -0400
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a]:35715)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lYGwR-00030a-AV
 for qemu-devel@nongnu.org; Sun, 18 Apr 2021 19:35:05 -0400
Received: by mail-wr1-x42a.google.com with SMTP id a4so32102572wrr.2
 for <qemu-devel@nongnu.org>; Sun, 18 Apr 2021 16:35:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=4k10ItHi8X/62o5b3Q+1SRRAEz1STuAQuVd1i9kEo+M=;
 b=sIe8NlKffV/yS7UIl7qhtIr0unhUbD9pVeyD9Du+99anG26q2HlqwBfI9WQ2c4ZRJr
 inJlkXuV2aW29L1dIxqsuTajDaVpkuTjdW/Kq71FOgHSkSfuUEV4f+RkbcWhgSJx3tZ5
 6vct+sNPAiV74kzsgu1H9FCYRbO1ts6EOaOSlr3Aqx4UxBdoUych57ngIrT6xL7lhkAy
 U4Th4D3TerPCN8Jl7RVwE0rbwzlEFxZ5uU708AkNGheS4jbUUx63HKq3vIjxWeU0rj9Z
 HFs9xfZ70GFtKs5yPxkgxPncGazdH/1uFc4H+u28rB3m0ux1iqjfws/eRCKHNcBU3PxL
 kiRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=4k10ItHi8X/62o5b3Q+1SRRAEz1STuAQuVd1i9kEo+M=;
 b=lkcnI3aazzLcM+9u03j4gypCInU+s9a76zK/4q5DjzDoHHkYgdrHL58EkUsSX6caC7
 JXV1rN1Y0xM+FeUFu9UhEcqGpVsMzUBCDAJlpQKNu5t3cohokfiLjcZ9tUkHEQMjG093
 g/CuLfBex+Tz8kCpTtrDXUkMO35zDAiOmAgIqr7/TprLhQIVYiBjaZ20QQgtQpABq+ta
 mvvJKjAz5FIhw9/S6e5QTRMyYrN8vUBTUbkTbjRasfnNn8zJiWd0icvr/4USGq+7dRt6
 U629iI/V+eKiMB7uXZTYIc8lxuPTQOUBEx02cyNwB2q9bNgcmD82xBl2JN/DDcF4ndFG
 yM0A==
X-Gm-Message-State: AOAM5302TWuY8Xsqug9ix6uxVZ6o459nxgpu1LqSI3mrJwrwk+Kiem0r
 k2AF9ko3gL4C27hFBfZ3UAPbaxRbpe++bw==
X-Google-Smtp-Source: ABdhPJzArSrs6GV9nzAHxEM3zD/ZJ7moRILb/IiTTHiWbno7UN+4EnT5nM1BmKDF+myqzUofxghg5A==
X-Received: by 2002:adf:e6cd:: with SMTP id y13mr11150050wrm.87.1618788901111; 
 Sun, 18 Apr 2021 16:35:01 -0700 (PDT)
Received: from localhost.localdomain (39.red-81-40-121.staticip.rima-tde.net.
 [81.40.121.39])
 by smtp.gmail.com with ESMTPSA id y125sm6617012wmc.40.2021.04.18.16.34.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 18 Apr 2021 16:35:00 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 02/15] gitlab-ci: Replace YAML anchors by extends
 (native_build_job)
Date: Mon, 19 Apr 2021 01:34:35 +0200
Message-Id: <20210418233448.1267991-3-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210418233448.1267991-1-f4bug@amsat.org>
References: <20210418233448.1267991-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42a.google.com
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
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 .gitlab-ci.yml | 64 +++++++++++++++++++++++++-------------------------
 1 file changed, 32 insertions(+), 32 deletions(-)

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index 52d65d6c04f..98d73429405 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -13,7 +13,7 @@ include:
   - local: '/.gitlab-ci.d/containers.yml'
   - local: '/.gitlab-ci.d/crossbuilds.yml'
 
-.native_build_job_template: &native_build_job_definition
+.native_build_job_template:
   stage: build
   image: $CI_REGISTRY_IMAGE/qemu/$IMAGE:latest
   before_script:
@@ -79,7 +79,7 @@ include:
     - du -chs ${CI_PROJECT_DIR}/avocado-cache
 
 build-system-alpine:
-  <<: *native_build_job_definition
+  extends: .native_build_job_template
   needs:
     - job: amd64-alpine-container
   variables:
@@ -114,7 +114,7 @@ acceptance-system-alpine:
   <<: *acceptance_definition
 
 build-system-ubuntu:
-  <<: *native_build_job_definition
+  extends: .native_build_job_template
   needs:
     job: amd64-ubuntu2004-container
   variables:
@@ -148,7 +148,7 @@ acceptance-system-ubuntu:
   <<: *acceptance_definition
 
 build-system-debian:
-  <<: *native_build_job_definition
+  extends: .native_build_job_template
   needs:
     job: amd64-debian-container
   variables:
@@ -182,7 +182,7 @@ acceptance-system-debian:
   <<: *acceptance_definition
 
 build-system-fedora:
-  <<: *native_build_job_definition
+  extends: .native_build_job_template
   needs:
     job: amd64-fedora-container
   variables:
@@ -217,7 +217,7 @@ acceptance-system-fedora:
   <<: *acceptance_definition
 
 build-system-centos:
-  <<: *native_build_job_definition
+  extends: .native_build_job_template
   needs:
     job: amd64-centos8-container
   variables:
@@ -252,7 +252,7 @@ acceptance-system-centos:
   <<: *acceptance_definition
 
 build-system-opensuse:
-  <<: *native_build_job_definition
+  extends: .native_build_job_template
   needs:
     job: amd64-opensuse-leap-container
   variables:
@@ -286,7 +286,7 @@ acceptance-system-opensuse:
 
 
 build-disabled:
-  <<: *native_build_job_definition
+  extends: .native_build_job_template
   needs:
     job: amd64-fedora-container
   variables:
@@ -373,7 +373,7 @@ build-disabled:
 # Also use a different coroutine implementation (which is only really of
 # interest to KVM users, i.e. with TCG disabled)
 build-tcg-disabled:
-  <<: *native_build_job_definition
+  extends: .native_build_job_template
   needs:
     job: amd64-centos8-container
   variables:
@@ -396,7 +396,7 @@ build-tcg-disabled:
             260 261 262 263 264 270 272 273 277 279
 
 build-user:
-  <<: *native_build_job_definition
+  extends: .native_build_job_template
   needs:
     job: amd64-debian-user-cross-container
   variables:
@@ -405,7 +405,7 @@ build-user:
     MAKE_CHECK_ARGS: check-tcg
 
 build-user-static:
-  <<: *native_build_job_definition
+  extends: .native_build_job_template
   needs:
     job: amd64-debian-user-cross-container
   variables:
@@ -415,7 +415,7 @@ build-user-static:
 
 # Only build the softmmu targets we have check-tcg tests for
 build-some-softmmu:
-  <<: *native_build_job_definition
+  extends: .native_build_job_template
   needs:
     job: amd64-debian-user-cross-container
   variables:
@@ -428,7 +428,7 @@ build-some-softmmu:
 # we skip sparc64-linux-user until it has been fixed somewhat
 # we skip cris-linux-user as it doesn't use the common run loop
 build-user-plugins:
-  <<: *native_build_job_definition
+  extends: .native_build_job_template
   needs:
     job: amd64-debian-user-cross-container
   variables:
@@ -438,7 +438,7 @@ build-user-plugins:
   timeout: 1h 30m
 
 build-user-centos7:
-  <<: *native_build_job_definition
+  extends: .native_build_job_template
   needs:
     job: amd64-centos7-container
   variables:
@@ -447,7 +447,7 @@ build-user-centos7:
     MAKE_CHECK_ARGS: check-tcg
 
 build-some-softmmu-plugins:
-  <<: *native_build_job_definition
+  extends: .native_build_job_template
   needs:
     job: amd64-debian-user-cross-container
   variables:
@@ -457,7 +457,7 @@ build-some-softmmu-plugins:
     MAKE_CHECK_ARGS: check-tcg
 
 clang-system:
-  <<: *native_build_job_definition
+  extends: .native_build_job_template
   needs:
     job: amd64-fedora-container
   variables:
@@ -469,7 +469,7 @@ clang-system:
     MAKE_CHECK_ARGS: check-qtest check-tcg
 
 clang-user:
-  <<: *native_build_job_definition
+  extends: .native_build_job_template
   needs:
     job: amd64-debian-user-cross-container
   variables:
@@ -491,7 +491,7 @@ clang-user:
 # Split in three sets of build/check/acceptance to limit the execution time of each
 # job
 build-cfi-aarch64:
-  <<: *native_build_job_definition
+  extends: .native_build_job_template
   needs:
   - job: amd64-fedora-container
   variables:
@@ -528,7 +528,7 @@ acceptance-cfi-aarch64:
   <<: *acceptance_definition
 
 build-cfi-ppc64-s390x:
-  <<: *native_build_job_definition
+  extends: .native_build_job_template
   needs:
   - job: amd64-fedora-container
   variables:
@@ -565,7 +565,7 @@ acceptance-cfi-ppc64-s390x:
   <<: *acceptance_definition
 
 build-cfi-x86_64:
-  <<: *native_build_job_definition
+  extends: .native_build_job_template
   needs:
   - job: amd64-fedora-container
   variables:
@@ -602,7 +602,7 @@ acceptance-cfi-x86_64:
   <<: *acceptance_definition
 
 tsan-build:
-  <<: *native_build_job_definition
+  extends: .native_build_job_template
   needs:
     job: amd64-ubuntu2004-container
   variables:
@@ -614,7 +614,7 @@ tsan-build:
 
 # These targets are on the way out
 build-deprecated:
-  <<: *native_build_job_definition
+  extends: .native_build_job_template
   needs:
     job: amd64-debian-user-cross-container
   variables:
@@ -641,7 +641,7 @@ check-deprecated:
 
 # gprof/gcov are GCC features
 gprof-gcov:
-  <<: *native_build_job_definition
+  extends: .native_build_job_template
   needs:
     job: amd64-ubuntu2004-container
   variables:
@@ -654,7 +654,7 @@ gprof-gcov:
     - ${CI_PROJECT_DIR}/scripts/ci/coverage-summary.sh
 
 build-oss-fuzz:
-  <<: *native_build_job_definition
+  extends: .native_build_job_template
   needs:
     job: amd64-fedora-container
   variables:
@@ -674,7 +674,7 @@ build-oss-fuzz:
     - cd build-oss-fuzz && make check-qtest-i386 check-unit
 
 build-tci:
-  <<: *native_build_job_definition
+  extends: .native_build_job_template
   needs:
     job: amd64-debian-user-cross-container
   variables:
@@ -699,7 +699,7 @@ build-tci:
 # Alternate coroutines implementations are only really of interest to KVM users
 # However we can't test against KVM on Gitlab-CI so we can only run unit tests
 build-coroutine-sigaltstack:
-  <<: *native_build_job_definition
+  extends: .native_build_job_template
   needs:
     job: amd64-ubuntu2004-container
   variables:
@@ -713,7 +713,7 @@ build-coroutine-sigaltstack:
 # These jobs test old gcrypt and nettle from RHEL7
 # which had some API differences.
 crypto-old-nettle:
-  <<: *native_build_job_definition
+  extends: .native_build_job_template
   needs:
     job: amd64-centos7-container
   variables:
@@ -723,7 +723,7 @@ crypto-old-nettle:
     MAKE_CHECK_ARGS: check
 
 crypto-old-gcrypt:
-  <<: *native_build_job_definition
+  extends: .native_build_job_template
   needs:
     job: amd64-centos7-container
   variables:
@@ -733,7 +733,7 @@ crypto-old-gcrypt:
     MAKE_CHECK_ARGS: check
 
 crypto-only-gnutls:
-  <<: *native_build_job_definition
+  extends: .native_build_job_template
   needs:
     job: amd64-centos7-container
   variables:
@@ -745,7 +745,7 @@ crypto-only-gnutls:
 
 # Check our reduced build configurations
 build-without-default-devices:
-  <<: *native_build_job_definition
+  extends: .native_build_job_template
   needs:
     job: amd64-centos8-container
   variables:
@@ -753,7 +753,7 @@ build-without-default-devices:
     CONFIGURE_ARGS: --without-default-devices --disable-user
 
 build-without-default-features:
-  <<: *native_build_job_definition
+  extends: .native_build_job_template
   needs:
     job: amd64-debian-container
   variables:
@@ -803,7 +803,7 @@ build-libvhost-user:
 # No targets are built here, just tools, docs, and unit tests. This
 # also feeds into the eventual documentation deployment steps later
 build-tools-and-docs-debian:
-  <<: *native_build_job_definition
+  extends: .native_build_job_template
   needs:
     job: amd64-debian-container
   variables:
-- 
2.26.3


