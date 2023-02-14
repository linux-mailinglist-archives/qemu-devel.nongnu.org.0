Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 66C4A69624E
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Feb 2023 12:23:15 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pRtNs-0007BA-87; Tue, 14 Feb 2023 06:22:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pRtNq-0007AV-4h
 for qemu-devel@nongnu.org; Tue, 14 Feb 2023 06:22:02 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pRtNo-0002IA-C5
 for qemu-devel@nongnu.org; Tue, 14 Feb 2023 06:22:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1676373719;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=gXC9nOhmw431muOUO3PKW2gGl+LHnqMb3NoVo1sovCg=;
 b=BfVFj1fz4X2HqPuCUGa9iHBqibXw//Duxup1+vywh6Py9Dq/0J+J0yI9aYoNH5HF19NWWD
 s2ZwJjT5EJdkX846s4MPv0XVSR6mLXU4C1cY9qPLMxGVaLtu5ADPqhGF54+bgIJSjCiZri
 T7jI+PILQtgcXDzMRxzdYsYecmlpVLA=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-195-H0325RPvOC2bdVZpOUgTFA-1; Tue, 14 Feb 2023 06:21:56 -0500
X-MC-Unique: H0325RPvOC2bdVZpOUgTFA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id F25463C0F191;
 Tue, 14 Feb 2023 11:21:55 +0000 (UTC)
Received: from thuth.com (unknown [10.39.192.14])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 12E994010E85;
 Tue, 14 Feb 2023 11:21:54 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>,
	qemu-devel@nongnu.org
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PULL 04/22] build: deprecate --enable-gprof builds and remove from CI
Date: Tue, 14 Feb 2023 12:21:30 +0100
Message-Id: <20230214112148.646077-5-thuth@redhat.com>
In-Reply-To: <20230214112148.646077-1-thuth@redhat.com>
References: <20230214112148.646077-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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

From: Alex Bennée <alex.bennee@linaro.org>

As gprof relies on instrumentation you rarely get useful data compared
to a real optimised build. Lets deprecate the build option and
simplify the CI configuration as a result.

Buglink: https://gitlab.com/qemu-project/qemu/-/issues/1338
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20230131094224.861621-1-alex.bennee@linaro.org>
Reviewed-by: Thomas Huth <thuth@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 docs/about/deprecated.rst  | 14 ++++++++++++++
 meson.build                |  7 ++++++-
 .gitlab-ci.d/buildtest.yml | 19 ++++---------------
 meson_options.txt          |  3 ++-
 4 files changed, 26 insertions(+), 17 deletions(-)

diff --git a/docs/about/deprecated.rst b/docs/about/deprecated.rst
index da2e6fe63d..9317046177 100644
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
index 0026bba0ce..a76c855312 100644
--- a/meson.build
+++ b/meson.build
@@ -3805,7 +3805,12 @@ summary_info += {'memory allocator':  get_option('malloc')}
 summary_info += {'avx2 optimization': config_host_data.get('CONFIG_AVX2_OPT')}
 summary_info += {'avx512bw optimization': config_host_data.get('CONFIG_AVX512BW_OPT')}
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
index 0aa149a352..8f332fc36f 100644
--- a/.gitlab-ci.d/buildtest.yml
+++ b/.gitlab-ci.d/buildtest.yml
@@ -467,27 +467,16 @@ tsan-build:
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
index 56415c5c23..7e5801db90 100644
--- a/meson_options.txt
+++ b/meson_options.txt
@@ -320,7 +320,8 @@ option('debug_stack_usage', type: 'boolean', value: false,
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
2.31.1


