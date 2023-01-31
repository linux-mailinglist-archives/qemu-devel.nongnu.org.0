Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E92F368294A
	for <lists+qemu-devel@lfdr.de>; Tue, 31 Jan 2023 10:44:05 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pMnAN-0002BD-Gw; Tue, 31 Jan 2023 04:43:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pMnA2-0002Ac-UY
 for qemu-devel@nongnu.org; Tue, 31 Jan 2023 04:42:42 -0500
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pMnA1-0001fa-6X
 for qemu-devel@nongnu.org; Tue, 31 Jan 2023 04:42:42 -0500
Received: by mail-wm1-x335.google.com with SMTP id q8so9867305wmo.5
 for <qemu-devel@nongnu.org>; Tue, 31 Jan 2023 01:42:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=OLR+bI0/lJP2K0uDO1O4tQXfXXXstBm7WjMh3wgoSZY=;
 b=G3qEyB1cvYv9oAJqP51gsA6dQgEbCJ6WjslrYVujwTh99f0y7LBhe2cote0pvZTkZd
 Q79tO0yfTtPTEs35tqeQRXYYOovCHkIXNEDQvWl1eQ5sBV+RFyCBFkHrqQeHtaPEXaYT
 9TPmgYs/nk+q8fphvX+m7vWJRjAGAMKCZLVHhr16gk2/ScjknzOmBMs9qBzmVTwDvY1d
 LFfJ3CdjvmyPhIwvR0MhkdIRAJBzYbfqix+4LgJ8OIPy4KsODn3QPczHKL8PQ/rE/6iu
 BHgpTi5fKAyliv04G4OOTMa1mn14hRzNY320kWQPi/YTAuf84vuiHhMdBftEvkgHdOot
 k9xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=OLR+bI0/lJP2K0uDO1O4tQXfXXXstBm7WjMh3wgoSZY=;
 b=b0YzDhy8Cwkq1WR41sU/Mscr4UvUdx7T96qG/oTObTDVCcpMZZfyaw+xuQXUjbS/1d
 UnJ6L4XgHp7nAdFVAAAPFgXXkmdVfhqbsMxT1g9lhpehAv8EoogQ4LMTNDfYx/OZvQiV
 iigtN81JzZ1Id/ZlfcdzwbBlp8kWL0ZQGDWHLa8lubMokjiMg++p9EmxyrJ5bbPDKGcp
 Xouzg4Hib4VymqSdynvIgDgmD7vwaR0peefmXVXaOOHTXE8Tfo6+AWeJPPJMkZqcpdT9
 UmeU3A0xD/AeH7OvEzG2Dt1Uc9CaH3MpM5HnTB3LzOW+Nx7qDUBa0K7q7Cms9Xv6orYZ
 wUyg==
X-Gm-Message-State: AO0yUKU3nieH2a7NrPl26kuIV/yQBsyGGBqsydD5SAEMn2X9bnph+Ees
 drYBAcwaxkBPsLHFXcT+iY+XnA==
X-Google-Smtp-Source: AK7set8RlKM8vG38WVoqQtrsm1meNE9iY+5lSaA89e3qKeyvjjnHkWG/HEKknlEoxSqCm3+oXM4Weg==
X-Received: by 2002:a05:600c:3d18:b0:3dc:2c58:e6f2 with SMTP id
 bh24-20020a05600c3d1800b003dc2c58e6f2mr18525551wmb.4.1675158157740; 
 Tue, 31 Jan 2023 01:42:37 -0800 (PST)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 3-20020a05600c248300b003db0ad636d1sm8311909wms.28.2023.01.31.01.42.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 31 Jan 2023 01:42:37 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id CC1E51FFB7;
 Tue, 31 Jan 2023 09:42:36 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>,
 libvir-list@redhat.com (reviewer:Incompatible changes),
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
Subject: [RFC PATCH] build: deprecate --enable-gprof builds and remove from CI
Date: Tue, 31 Jan 2023 09:42:23 +0000
Message-Id: <20230131094224.861621-1-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x335.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

As gprof relies on instrumentation you rarely get useful data compared
to a real optimised build. Lets deprecate the build option and
simplify the CI configuration as a result.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Cc: Thomas Huth <thuth@redhat.com>
---
 docs/about/deprecated.rst  | 14 ++++++++++++++
 meson.build                |  7 ++++++-
 .gitlab-ci.d/buildtest.yml | 19 ++++---------------
 meson_options.txt          |  3 ++-
 4 files changed, 26 insertions(+), 17 deletions(-)

diff --git a/docs/about/deprecated.rst b/docs/about/deprecated.rst
index 9f1bbc495d..87b4511535 100644
--- a/docs/about/deprecated.rst
+++ b/docs/about/deprecated.rst
@@ -20,6 +20,20 @@ they were first deprecated in the 2.10.0 release.
 What follows is a list of all features currently marked as
 deprecated.
 
+Build options
+-------------
+
+``gprof`` builds (since 8.0)
+''''''''''''''''''''''''''''
+
+The ``--enable-gprof`` configure setting relies on compiler
+instrumentation to gather its data which can distort the generated
+profile. As other non-instrumenting tools are available that give a
+more holistic view of the system with non-instrumented binaries we are
+deprecating the build option and no longer defend it in CI. The
+``--enable-gcov`` build option remains for analysis test case
+coverage.
+
 System emulator command line arguments
 --------------------------------------
 
diff --git a/meson.build b/meson.build
index 56320ae717..ecf44ea534 100644
--- a/meson.build
+++ b/meson.build
@@ -3791,7 +3791,12 @@ summary_info += {'mutex debugging':   get_option('debug_mutex')}
 summary_info += {'memory allocator':  get_option('malloc')}
 summary_info += {'avx2 optimization': config_host_data.get('CONFIG_AVX2_OPT')}
 summary_info += {'avx512f optimization': config_host_data.get('CONFIG_AVX512F_OPT')}
-summary_info += {'gprof enabled':     get_option('gprof')}
+if get_option('gprof')
+  gprof_info = 'YES (deprecated)'
+else
+  gprof_info = get_option('gprof')
+endif
+summary_info += {'gprof':             gprof_info}
 summary_info += {'gcov':              get_option('b_coverage')}
 summary_info += {'thread sanitizer':  config_host.has_key('CONFIG_TSAN')}
 summary_info += {'CFI support':       get_option('cfi')}
diff --git a/.gitlab-ci.d/buildtest.yml b/.gitlab-ci.d/buildtest.yml
index 9a6ba1fe3b..dc8fa0a498 100644
--- a/.gitlab-ci.d/buildtest.yml
+++ b/.gitlab-ci.d/buildtest.yml
@@ -468,27 +468,16 @@ tsan-build:
     TARGETS: x86_64-softmmu ppc64-softmmu riscv64-softmmu x86_64-linux-user
     MAKE_CHECK_ARGS: bench V=1
 
-# gprof/gcov are GCC features
-build-gprof-gcov:
+# gcov is a GCC features
+gcov:
   extends: .native_build_job_template
   needs:
     job: amd64-ubuntu2004-container
+  timeout: 80m
   variables:
     IMAGE: ubuntu2004
-    CONFIGURE_ARGS: --enable-gprof --enable-gcov
+    CONFIGURE_ARGS: --enable-gcov
     TARGETS: aarch64-softmmu ppc64-softmmu s390x-softmmu x86_64-softmmu
-  artifacts:
-    expire_in: 1 days
-    paths:
-      - build
-
-check-gprof-gcov:
-  extends: .native_test_job_template
-  needs:
-    - job: build-gprof-gcov
-      artifacts: true
-  variables:
-    IMAGE: ubuntu2004
     MAKE_CHECK_ARGS: check
   after_script:
     - cd build
diff --git a/meson_options.txt b/meson_options.txt
index 559a571b6b..53459c15fc 100644
--- a/meson_options.txt
+++ b/meson_options.txt
@@ -316,7 +316,8 @@ option('debug_stack_usage', type: 'boolean', value: false,
 option('qom_cast_debug', type: 'boolean', value: false,
        description: 'cast debugging support')
 option('gprof', type: 'boolean', value: false,
-       description: 'QEMU profiling with gprof')
+       description: 'QEMU profiling with gprof',
+       deprecated: true)
 option('profiler', type: 'boolean', value: false,
        description: 'profiler support')
 option('slirp_smbd', type : 'feature', value : 'auto',
-- 
2.34.1


