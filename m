Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 121AA6F5A7D
	for <lists+qemu-devel@lfdr.de>; Wed,  3 May 2023 16:56:51 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1puDtt-0006dH-Af; Wed, 03 May 2023 10:56:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1puDtr-0006d8-9M
 for qemu-devel@nongnu.org; Wed, 03 May 2023 10:56:11 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1puDtp-0003K3-Li
 for qemu-devel@nongnu.org; Wed, 03 May 2023 10:56:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1683125769;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qYlZEyUIgBhShDdoKtrA+sf6cGRQZzK2XCoiP8p9400=;
 b=PYXf9d4mW4z8n1Y8WY6A1LJotJdDddMpuGFWsHVM5F0JusQt8w+1m5IO0tUWyxF1Jb7uRa
 itQlIvysW9rVGNSI78KZb2Owrbwx6gUKPIHS1K7M86pBHYOzb/eMSFddoUsaMQcfsV43GF
 R52IxrTvD5pO/gFZPRbLrtCi141HcsA=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-386-6roD2tt5OUalWVy9eCULRg-1; Wed, 03 May 2023 10:56:05 -0400
X-MC-Unique: 6roD2tt5OUalWVy9eCULRg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5E2CC38601C1;
 Wed,  3 May 2023 14:56:05 +0000 (UTC)
Received: from localhost.localdomain.com (unknown [10.42.28.37])
 by smtp.corp.redhat.com (Postfix) with ESMTP id CE9E7C15BAD;
 Wed,  3 May 2023 14:55:59 +0000 (UTC)
From: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
To: qemu-devel@nongnu.org
Cc: Juan Quintela <quintela@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Beraldo Leal <bleal@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Bin Meng <bmeng.cn@gmail.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
Subject: [PATCH 1/2] gitlab: explicit set artifacts publishing criteria
Date: Wed,  3 May 2023 15:55:34 +0100
Message-Id: <20230503145535.91325-2-berrange@redhat.com>
In-Reply-To: <20230503145535.91325-1-berrange@redhat.com>
References: <20230503145535.91325-1-berrange@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.161,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

If not set explicitly, gitlab assumes 'when: on_success" as the
publishing criteria for artifacts. This is reasonable if the
artifact is an output deliverable of the job. This is useless
if the artifact is a log file to be used for debugging job
failures.

This change makes the desired criteria explicit for every job
that publishes artifacts.

Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
---
 .gitlab-ci.d/buildtest-template.yml  | 4 +++-
 .gitlab-ci.d/buildtest.yml           | 2 ++
 .gitlab-ci.d/crossbuild-template.yml | 1 +
 .gitlab-ci.d/crossbuilds.yml         | 2 ++
 .gitlab-ci.d/custom-runners.yml      | 1 +
 .gitlab-ci.d/opensbi.yml             | 1 +
 6 files changed, 10 insertions(+), 1 deletion(-)

diff --git a/.gitlab-ci.d/buildtest-template.yml b/.gitlab-ci.d/buildtest-template.yml
index a6cfe9be97..d90bd6419f 100644
--- a/.gitlab-ci.d/buildtest-template.yml
+++ b/.gitlab-ci.d/buildtest-template.yml
@@ -29,6 +29,7 @@
 # rebuilding all the object files we skip in the artifacts
 .native_build_artifact_template:
   artifacts:
+    when: on_success
     expire_in: 2 days
     paths:
       - build
@@ -57,6 +58,7 @@
   extends: .common_test_job_template
   artifacts:
     name: "$CI_JOB_NAME-$CI_COMMIT_REF_SLUG"
+    when: always
     expire_in: 7 days
     paths:
       - build/meson-logs/testlog.txt
@@ -72,7 +74,7 @@
     policy: pull-push
   artifacts:
     name: "$CI_JOB_NAME-$CI_COMMIT_REF_SLUG"
-    when: on_failure
+    when: always
     expire_in: 7 days
     paths:
       - build/tests/results/latest/results.xml
diff --git a/.gitlab-ci.d/buildtest.yml b/.gitlab-ci.d/buildtest.yml
index bb3650a51c..0bb5cd56f9 100644
--- a/.gitlab-ci.d/buildtest.yml
+++ b/.gitlab-ci.d/buildtest.yml
@@ -462,6 +462,7 @@ gcov:
   coverage: /^\s*lines:\s*\d+.\d+\%/
   artifacts:
     name: ${CI_JOB_NAME}-${CI_COMMIT_REF_NAME}-${CI_COMMIT_SHA}
+    when: on_success
     expire_in: 2 days
     reports:
       coverage_report:
@@ -587,6 +588,7 @@ pages:
     - make -C build install DESTDIR=$(pwd)/temp-install
     - mv temp-install/usr/local/share/doc/qemu/* public/
   artifacts:
+    when: on_success
     paths:
       - public
   variables:
diff --git a/.gitlab-ci.d/crossbuild-template.yml b/.gitlab-ci.d/crossbuild-template.yml
index 4f93b9e4e5..a7e34e0145 100644
--- a/.gitlab-ci.d/crossbuild-template.yml
+++ b/.gitlab-ci.d/crossbuild-template.yml
@@ -55,6 +55,7 @@
 .cross_test_artifacts:
   artifacts:
     name: "$CI_JOB_NAME-$CI_COMMIT_REF_SLUG"
+    when: always
     expire_in: 7 days
     paths:
       - build/meson-logs/testlog.txt
diff --git a/.gitlab-ci.d/crossbuilds.yml b/.gitlab-ci.d/crossbuilds.yml
index 61b8ac86ee..ee4c1b74d9 100644
--- a/.gitlab-ci.d/crossbuilds.yml
+++ b/.gitlab-ci.d/crossbuilds.yml
@@ -161,6 +161,7 @@ cross-win32-system:
     CROSS_SKIP_TARGETS: alpha-softmmu avr-softmmu hppa-softmmu m68k-softmmu
                         microblazeel-softmmu mips64el-softmmu nios2-softmmu
   artifacts:
+    when: on_success
     paths:
       - build/qemu-setup*.exe
 
@@ -176,6 +177,7 @@ cross-win64-system:
                         or1k-softmmu rx-softmmu sh4eb-softmmu sparc64-softmmu
                         tricore-softmmu xtensaeb-softmmu
   artifacts:
+    when: on_success
     paths:
       - build/qemu-setup*.exe
 
diff --git a/.gitlab-ci.d/custom-runners.yml b/.gitlab-ci.d/custom-runners.yml
index 34a1e6f327..a0aef96a07 100644
--- a/.gitlab-ci.d/custom-runners.yml
+++ b/.gitlab-ci.d/custom-runners.yml
@@ -20,6 +20,7 @@ variables:
   artifacts:
     name: "$CI_JOB_NAME-$CI_COMMIT_REF_SLUG"
     expire_in: 7 days
+    when: always
     paths:
       - build/meson-logs/testlog.txt
     reports:
diff --git a/.gitlab-ci.d/opensbi.yml b/.gitlab-ci.d/opensbi.yml
index 9a651465d8..867e34c19f 100644
--- a/.gitlab-ci.d/opensbi.yml
+++ b/.gitlab-ci.d/opensbi.yml
@@ -65,6 +65,7 @@ build-opensbi:
   stage: build
   needs: ['docker-opensbi']
   artifacts:
+    when: on_success
     paths: # 'artifacts.zip' will contains the following files:
       - pc-bios/opensbi-riscv32-generic-fw_dynamic.bin
       - pc-bios/opensbi-riscv64-generic-fw_dynamic.bin
-- 
2.40.1


