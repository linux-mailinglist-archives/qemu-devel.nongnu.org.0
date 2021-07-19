Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 889A63CD47B
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Jul 2021 14:14:15 +0200 (CEST)
Received: from localhost ([::1]:47870 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m5SA2-00074E-J8
	for lists+qemu-devel@lfdr.de; Mon, 19 Jul 2021 08:14:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35250)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1m5S8U-0004x2-JM
 for qemu-devel@nongnu.org; Mon, 19 Jul 2021 08:12:38 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:41108)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1m5S8R-0002Zt-JI
 for qemu-devel@nongnu.org; Mon, 19 Jul 2021 08:12:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626696755;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/ZZ+tCS50PYzYBCLJq/Y0161o+wFQloyGA7BuSTOTWM=;
 b=RGeKxYUqKTJ0L+fB3lJ/83d7rscemeW3xi0yx5Y+chcQiZVvkuj07tPbS3wdWR/5BlKK3Q
 JO8Frs4lajl7KdRF5TQbmIEWe3GPZBHLkhxOZL/qJqv/PXGwFfu8HBbpqxfTjXW4VNyefJ
 JjGMMjY5MzXgbR499/TFsjb4ngLEQW0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-99-ZBcLzQGyM2K3Jh__6b20Tg-1; Mon, 19 Jul 2021 08:12:31 -0400
X-MC-Unique: ZBcLzQGyM2K3Jh__6b20Tg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A26B480365C;
 Mon, 19 Jul 2021 12:12:30 +0000 (UTC)
Received: from localhost.localdomain.com (ovpn-112-193.ams2.redhat.com
 [10.36.112.193])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 90B705DEFA;
 Mon, 19 Jul 2021 12:12:28 +0000 (UTC)
From: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 2/2] gitlab: cut down on jobs run by default in user forks
Date: Mon, 19 Jul 2021 13:12:15 +0100
Message-Id: <20210719121215.2356409-3-berrange@redhat.com>
In-Reply-To: <20210719121215.2356409-1-berrange@redhat.com>
References: <20210719121215.2356409-1-berrange@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.469,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Willian Rampazzo <willianr@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Currently pushes to user forks run the same set of build / test jobs as
pushes to the main repo. This results in creation of 120+ individual
jobs. While it is useful for subsystem maintainers, and even regular
contributors to be able to run the full set of jobs, it is wasteful to
run all of them all the time.

This patch sets up rules to cut down on the jobs run by default to only
only cover a fairly typical set of combinations, which ought to catch
the majority of common breakage

 - Fedora, CentOS, Ubuntu & Debian system emulator builds
   to cover all arch targets.
 - Linux user static build
 - Cross build i386 (to identify any 32-bit build issues)
 - Cross build s390x (to identify any big endian build issues)
 - Containers needed for the above
 - Cirrus CI FreeBSD 12 and macOS 11 (to identify non-Linux issues)

That ends up being the following jobs:

Containers stage

 - amd64-centos8-container
 - amd64-debian10-container
 - amd64-fedora-container
 - amd64-ubuntu2004-container
 - win32-fedora-container

Containers layer2 stage

 - amd64-debian-container
 - i386-fedora-cross-container
 - s390x-debian-cross-container

Build stage

 - build-system-centos
 - build-system-debian
 - build-system-fedora
 - build-system-ubuntu
 - build-tools-and-docs-debian
 - build-user-static
 - check-dco
 - check-patch
 - cross-i386-system
 - cross-s390x-system
 - cross-win32-system
 - x64-freebsd-13-build
 - x64-macos-11-build

Test stage

 - check-system-centos
 - check-system-debian
 - check-system-fedora
 - check-system-ubuntu
 - pages

This gives a reduction from 120+ jobs to 26. It could potentially be
cut down more if we re-arrange the split of targets for the four
build-system-XXX jobs, if we don't want to test all possible arch
targets by default for all contributors (maybe only x86_64 and aarch64
by default) This is left as a future area to explore.

When using inherited templates together with rules, it is ill-defined
what the semantics are when both the template and job define rules.
Thus logic is controlled by create a template containining job rules,
that is then inherited by all jobs / job templates. Individual jobs
can tweak the effect of the inherited rules by setting variables.

The set of default jobs are identified by existance of a special
variable:

 - QEMU_CI_DEFAULT_JOB: 1

To trigger remaining non-default jobs, push to a branch called
'ci-XXXXX', or set a git push option. e.g. one of:

 $ git push ci-somefeature
 $ git push -o "ci.variable=QEMU_CI=1" somefeature

Jobs can be marked to never run automatically using the variable:

 - QEMU_CI_MANUAL_JOB: 1

Jobs that provide acceptance (functional/integration) tests are
designated using

 - QEMU_CI_ACCEPTANCE_JOB: 1

These are not run unless pushing to the 'staging' branch of the
main repo. They can be optionally run in other scenarios by pushing
to a branch 'ci-acceptance-XXX', or by setting an additional git
push option, together with the previously CI configurations.
e.g. one of:

 $ git push ci-acceptance-somefeature
 $ git push -o "ci.variable=QEMU_CI_ACEPTANCE=1" ci-somefeature
 $ git push -o "ci.variable=QEMU_CI_ACEPTANCE=1" -o "ci.variable=QEMU_CI=1" somefeature

Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
---
 .gitlab-ci.d/buildtest-template.yml  | 17 ++----
 .gitlab-ci.d/buildtest.yml           | 14 +++++
 .gitlab-ci.d/cirrus.yml              |  5 +-
 .gitlab-ci.d/container-core.yml      |  3 +
 .gitlab-ci.d/container-cross.yml     |  9 +--
 .gitlab-ci.d/container-template.yml  |  1 +
 .gitlab-ci.d/containers.yml          |  2 +
 .gitlab-ci.d/crossbuild-template.yml |  3 +
 .gitlab-ci.d/crossbuilds.yml         |  3 +
 .gitlab-ci.d/workflow.yml            | 90 ++++++++++++++++++++++++++++
 .gitlab-ci.yml                       | 21 +------
 11 files changed, 131 insertions(+), 37 deletions(-)

diff --git a/.gitlab-ci.d/buildtest-template.yml b/.gitlab-ci.d/buildtest-template.yml
index 3e3e19d96b..069f8d9d2d 100644
--- a/.gitlab-ci.d/buildtest-template.yml
+++ b/.gitlab-ci.d/buildtest-template.yml
@@ -1,4 +1,6 @@
+
 .native_build_job_template:
+  extends: .job_workflow
   stage: build
   image: $CI_REGISTRY_IMAGE/qemu/$IMAGE:latest
   before_script:
@@ -27,6 +29,7 @@
       fi
 
 .native_test_job_template:
+  extends: .job_workflow
   stage: test
   image: $CI_REGISTRY_IMAGE/qemu/$IMAGE:latest
   script:
@@ -67,15 +70,5 @@
   after_script:
     - cd build
     - du -chs ${CI_PROJECT_DIR}/avocado-cache
-  rules:
-    # Only run these jobs if running on the mainstream namespace,
-    # or if the user set the QEMU_CI_AVOCADO_TESTING variable (either
-    # in its namespace setting or via git-push option, see documentation
-    # in /.gitlab-ci.yml of this repository).
-    - if: '$CI_PROJECT_NAMESPACE == "qemu-project"'
-      when: always
-    - if: '$QEMU_CI_AVOCADO_TESTING'
-      when: always
-    # Otherwise, set to manual (the jobs are created but not run).
-    - when: manual
-      allow_failure: true
+  variables:
+    - QEMU_CI_ACCEPTANCE_JOB: 1
diff --git a/.gitlab-ci.d/buildtest.yml b/.gitlab-ci.d/buildtest.yml
index 89df51517c..8ea31f4036 100644
--- a/.gitlab-ci.d/buildtest.yml
+++ b/.gitlab-ci.d/buildtest.yml
@@ -40,6 +40,7 @@ build-system-ubuntu:
   needs:
     job: amd64-ubuntu2004-container
   variables:
+    QEMU_CI_DEFAULT_JOB: 1
     IMAGE: ubuntu2004
     CONFIGURE_ARGS: --enable-docs --enable-fdt=system --enable-slirp=system
     TARGETS: aarch64-softmmu alpha-softmmu cris-softmmu hppa-softmmu
@@ -56,6 +57,7 @@ check-system-ubuntu:
     - job: build-system-ubuntu
       artifacts: true
   variables:
+    QEMU_CI_DEFAULT_JOB: 1
     IMAGE: ubuntu2004
     MAKE_CHECK_ARGS: check
 
@@ -73,6 +75,7 @@ build-system-debian:
   needs:
     job: amd64-debian-container
   variables:
+    QEMU_CI_DEFAULT_JOB: 1
     IMAGE: debian-amd64
     CONFIGURE_ARGS: --enable-fdt=system
     TARGETS: arm-softmmu avr-softmmu i386-softmmu mipsel-softmmu
@@ -89,6 +92,7 @@ check-system-debian:
     - job: build-system-debian
       artifacts: true
   variables:
+    QEMU_CI_DEFAULT_JOB: 1
     IMAGE: debian-amd64
     MAKE_CHECK_ARGS: check
 
@@ -106,6 +110,7 @@ build-system-fedora:
   needs:
     job: amd64-fedora-container
   variables:
+    QEMU_CI_DEFAULT_JOB: 1
     IMAGE: fedora
     CONFIGURE_ARGS: --disable-gcrypt --enable-nettle --enable-docs
              --enable-fdt=system --enable-slirp=system --enable-capstone=system
@@ -123,6 +128,7 @@ check-system-fedora:
     - job: build-system-fedora
       artifacts: true
   variables:
+    QEMU_CI_DEFAULT_JOB: 1
     IMAGE: fedora
     MAKE_CHECK_ARGS: check
 
@@ -140,6 +146,7 @@ build-system-centos:
   needs:
     job: amd64-centos8-container
   variables:
+    QEMU_CI_DEFAULT_JOB: 1
     IMAGE: centos8
     CONFIGURE_ARGS: --disable-nettle --enable-gcrypt --enable-fdt=system
                     --enable-modules --enable-trace-backends=dtrace
@@ -157,6 +164,7 @@ check-system-centos:
     - job: build-system-centos
       artifacts: true
   variables:
+    QEMU_CI_DEFAULT_JOB: 1
     IMAGE: centos8
     MAKE_CHECK_ARGS: check
 
@@ -325,6 +333,7 @@ build-user-static:
   needs:
     job: amd64-debian-user-cross-container
   variables:
+    QEMU_CI_DEFAULT_JOB: 1
     IMAGE: debian-all-test-cross
     CONFIGURE_ARGS: --disable-tools --disable-system --static
     MAKE_CHECK_ARGS: check-tcg
@@ -634,6 +643,7 @@ build-without-default-features:
     MAKE_CHECK_ARGS: check-unit
 
 build-libvhost-user:
+  extends: .job_workflow
   stage: build
   image: $CI_REGISTRY_IMAGE/qemu/fedora:latest
   needs:
@@ -653,6 +663,7 @@ build-tools-and-docs-debian:
   needs:
     job: amd64-debian-container
   variables:
+    QEMU_CI_DEFAULT_JOB: 1
     IMAGE: debian-amd64
     MAKE_CHECK_ARGS: check-unit check-softfloat ctags TAGS cscope
     CONFIGURE_ARGS: --disable-system --disable-user --enable-docs --enable-tools
@@ -664,10 +675,13 @@ build-tools-and-docs-debian:
 # Prepare for GitLab pages deployment. Anything copied into the
 # "public" directory will be deployed to $USER.gitlab.io/$PROJECT
 pages:
+  extends: .native_build_job_template
   image: $CI_REGISTRY_IMAGE/qemu/debian-amd64:latest
   stage: test
   needs:
     - job: build-tools-and-docs-debian
+  variables:
+    QEMU_CI_DEFAULT_JOB: 1
   script:
     - mkdir -p public
     # HTML-ised source tree
diff --git a/.gitlab-ci.d/cirrus.yml b/.gitlab-ci.d/cirrus.yml
index 60b13ed83f..d76eb18477 100644
--- a/.gitlab-ci.d/cirrus.yml
+++ b/.gitlab-ci.d/cirrus.yml
@@ -11,6 +11,7 @@
 # special care, because we can't just override it at the GitLab CI job
 # definition level or we risk breaking it completely.
 .cirrus_build_job:
+  extends: .job_workflow
   stage: build
   image: registry.gitlab.com/libvirt/libvirt-ci/cirrus-run:master
   needs: []
@@ -39,8 +40,6 @@
       <.gitlab-ci.d/cirrus/build.yml >.gitlab-ci.d/cirrus/$NAME.yml
     - cat .gitlab-ci.d/cirrus/$NAME.yml
     - cirrus-run -v --show-build-log always .gitlab-ci.d/cirrus/$NAME.yml
-  rules:
-    - if: "$CIRRUS_GITHUB_REPO && $CIRRUS_API_TOKEN"
 
 x64-freebsd-12-build:
   extends: .cirrus_build_job
@@ -61,6 +60,7 @@ x64-freebsd-12-build:
 x64-freebsd-13-build:
   extends: .cirrus_build_job
   variables:
+    QEMU_CI_DEFAULT_JOB: 1
     NAME: freebsd-13
     CIRRUS_VM_INSTANCE_TYPE: freebsd_instance
     CIRRUS_VM_IMAGE_SELECTOR: image_family
@@ -74,6 +74,7 @@ x64-freebsd-13-build:
 x64-macos-11-base-build:
   extends: .cirrus_build_job
   variables:
+    QEMU_CI_DEFAULT_JOB: 1
     NAME: macos-11
     CIRRUS_VM_INSTANCE_TYPE: osx_instance
     CIRRUS_VM_IMAGE_SELECTOR: image
diff --git a/.gitlab-ci.d/container-core.yml b/.gitlab-ci.d/container-core.yml
index e8dd1f476a..38be992593 100644
--- a/.gitlab-ci.d/container-core.yml
+++ b/.gitlab-ci.d/container-core.yml
@@ -4,14 +4,17 @@ include:
 amd64-centos8-container:
   extends: .container_job_template
   variables:
+    QEMU_CI_DEFAULT_JOB: 1
     NAME: centos8
 
 amd64-fedora-container:
   extends: .container_job_template
   variables:
+    QEMU_CI_DEFAULT_JOB: 1
     NAME: fedora
 
 amd64-debian10-container:
   extends: .container_job_template
   variables:
+    QEMU_CI_DEFAULT_JOB: 1
     NAME: debian10
diff --git a/.gitlab-ci.d/container-cross.yml b/.gitlab-ci.d/container-cross.yml
index 0fcebe363a..1f41c88f11 100644
--- a/.gitlab-ci.d/container-cross.yml
+++ b/.gitlab-ci.d/container-cross.yml
@@ -50,13 +50,11 @@ armhf-debian-cross-container:
 # We never want to build hexagon in the CI system and by default we
 # always want to refer to the master registry where it lives.
 hexagon-cross-container:
+  extends: .job_workflow
   image: docker:stable
   stage: containers
-  rules:
-    - if: '$CI_PROJECT_NAMESPACE == "qemu-project"'
-      when: never
-    - when: always
   variables:
+    QEMU_CI_MANUAL_JOB: 1
     NAME: debian-hexagon-cross
     GIT_DEPTH: 1
   services:
@@ -143,6 +141,7 @@ s390x-debian-cross-container:
   stage: containers-layer2
   needs: ['amd64-debian10-container']
   variables:
+    QEMU_CI_DEFAULT_JOB: 1
     NAME: debian-s390x-cross
 
 sh4-debian-cross-container:
@@ -179,11 +178,13 @@ cris-fedora-cross-container:
 i386-fedora-cross-container:
   extends: .container_job_template
   variables:
+    QEMU_CI_DEFAULT_JOB: 1
     NAME: fedora-i386-cross
 
 win32-fedora-cross-container:
   extends: .container_job_template
   variables:
+    QEMU_CI_DEFAULT_JOB: 1
     NAME: fedora-win32-cross
 
 win64-fedora-cross-container:
diff --git a/.gitlab-ci.d/container-template.yml b/.gitlab-ci.d/container-template.yml
index 1baecd9460..5bf6360260 100644
--- a/.gitlab-ci.d/container-template.yml
+++ b/.gitlab-ci.d/container-template.yml
@@ -1,4 +1,5 @@
 .container_job_template:
+  extends: .job_workflow
   image: docker:stable
   stage: containers
   services:
diff --git a/.gitlab-ci.d/containers.yml b/.gitlab-ci.d/containers.yml
index cd06d3f5f4..b1c5bc6e6e 100644
--- a/.gitlab-ci.d/containers.yml
+++ b/.gitlab-ci.d/containers.yml
@@ -17,6 +17,7 @@ amd64-debian-container:
   stage: containers-layer2
   needs: ['amd64-debian10-container']
   variables:
+    QEMU_CI_DEFAULT_JOB: 1
     NAME: debian-amd64
 
 amd64-ubuntu1804-container:
@@ -27,6 +28,7 @@ amd64-ubuntu1804-container:
 amd64-ubuntu2004-container:
   extends: .container_job_template
   variables:
+    QEMU_CI_DEFAULT_JOB: 1
     NAME: ubuntu2004
 
 amd64-ubuntu-container:
diff --git a/.gitlab-ci.d/crossbuild-template.yml b/.gitlab-ci.d/crossbuild-template.yml
index 1be541174c..5f6839cc21 100644
--- a/.gitlab-ci.d/crossbuild-template.yml
+++ b/.gitlab-ci.d/crossbuild-template.yml
@@ -1,4 +1,5 @@
 .cross_system_build_job:
+  extends: .job_workflow
   stage: build
   image: $CI_REGISTRY_IMAGE/qemu/$IMAGE:latest
   timeout: 80m
@@ -18,6 +19,7 @@
 # KVM), and set extra options (such disabling other accelerators) via the
 # $EXTRA_CONFIGURE_OPTS variable.
 .cross_accel_build_job:
+  extends: .job_workflow
   stage: build
   image: $CI_REGISTRY_IMAGE/qemu/$IMAGE:latest
   timeout: 30m
@@ -30,6 +32,7 @@
     - make -j$(expr $(nproc) + 1) all check-build $MAKE_CHECK_ARGS
 
 .cross_user_build_job:
+  extends: .job_workflow
   stage: build
   image: $CI_REGISTRY_IMAGE/qemu/$IMAGE:latest
   script:
diff --git a/.gitlab-ci.d/crossbuilds.yml b/.gitlab-ci.d/crossbuilds.yml
index 6b3865c9e8..83dd17041b 100644
--- a/.gitlab-ci.d/crossbuilds.yml
+++ b/.gitlab-ci.d/crossbuilds.yml
@@ -48,6 +48,7 @@ cross-i386-system:
   needs:
     job: i386-fedora-cross-container
   variables:
+    QEMU_CI_DEFAULT_JOB: 1
     IMAGE: fedora-i386-cross
     MAKE_CHECK_ARGS: check-qtest
 
@@ -129,6 +130,7 @@ cross-s390x-system:
   needs:
     job: s390x-debian-cross-container
   variables:
+    QEMU_CI_DEFAULT_JOB: 1
     IMAGE: debian-s390x-cross
 
 cross-s390x-user:
@@ -159,6 +161,7 @@ cross-win32-system:
   needs:
     job: win32-fedora-cross-container
   variables:
+    QEMU_CI_DEFAULT_JOB: 1
     IMAGE: fedora-win32-cross
 
 cross-win64-system:
diff --git a/.gitlab-ci.d/workflow.yml b/.gitlab-ci.d/workflow.yml
index 5c877bae11..4803d6dcd2 100644
--- a/.gitlab-ci.d/workflow.yml
+++ b/.gitlab-ci.d/workflow.yml
@@ -54,3 +54,93 @@ workflow:
     # covering: external, chat, webide, merge_request_event,
     # external_pull_request_event, parent_pipeline, trigger, or pipeline)
     - when: never
+
+
+# This defines rules used to control individual job execution
+#
+# By default only a small subset of jobs are run, to give a
+# basic sanity check of the build. The set of default jobs
+# are identified by existance of a special variable:
+#
+#  - QEMU_CI_DEFAULT_JOB: 1
+#
+# To trigger remaining non-default jobs, push to a branch
+# called 'ci-XXXXX', or set a git push option. e.g. one of:
+#
+#  $ git push ci-somefeature
+#  $ git push -o "ci.variable=QEMU_CI=1" somefeature
+#
+# Jobs can be marked to never run automatically using the
+# variable:
+#
+#  - QEMU_CI_MANUAL_JOB: 1
+#
+# Jobs that provide acceptance (functional/integration) tests
+# are designated using
+#
+#  - QEMU_CI_ACCEPTANCE_JOB: 1
+#
+# These are not run unless pushing to the 'staging' branch of
+# the main repo. They can be optionally run in other scenarios
+# by pushing to a branch 'ci-acceptance-XXX', or by setting an
+# additional git push option, together with the previously
+# CI configurations. e.g. one of:
+#
+#  $ git push ci-acceptance-somefeature
+#  $ git push -o "ci.variable=QEMU_CI_ACEPTANCE=1" ci-somefeature
+#  $ git push -o "ci.variable=QEMU_CI_ACEPTANCE=1" -o "ci.variable=QEMU_CI=1" somefeature
+#
+.job_workflow:
+  rules:
+    # Skip any cirrus job if either repo or api token are missing
+    - if: '$CIRRUS_VM_INSTANCE_TYPE && ($CIRRUS_GITHUB_REPO == null || $CIRRUS_API_TOKEN == null)'
+      when: never
+
+    # Any jobs marked as manual, never get automatically run in any scenario
+    - if: '$QEMU_CI_MANUAL_JOB'
+      when: manual
+      allow_failure: true
+
+    # Run all jobs for main repo staging branch, including acceptance jobs
+    - if: '$CI_PROJECT_NAMESPACE == "qemu-project" && $CI_COMMIT_BRANCH == "staging"'
+      when: always
+
+    # If pushing to a branch with name prefix 'ci-acceptance-', then run
+    # acceptance tests, in addition to other jobs
+    - if: '$CI_COMMIT_BRANCH =~ /^ci-acceptance-/ && $QEMU_CI_ACCEPTANCE_JOB'
+      when: always
+
+    # If user requested acceptance tests using 'git push' option to
+    # set QEMU_CI_ACCEPTANCE=1, with branch ci-XXXX
+    - if: '$CI_COMMIT_BRANCH =~ /^ci-/ && $QEMU_CI_ACCEPTANCE_JOB && $QEMU_CI_ACCEPTANCE'
+      when: always
+
+    # If user requested acceptance tests using 'git push' option to
+    # set QEMU_CI_ACCEPTANCE=1, with varaible QEMU_CI=1
+    - if: '$QEMU_CI && $QEMU_CI_ACCEPTANCE_JOB && $QEMU_CI_ACCEPTANCE'
+      when: always
+
+    # Otherwise never run acceptance tests, but allow manual trigger
+    - if: '$QEMU_CI_ACCEPTANCE_JOB'
+      when: manual
+      allow_failure: true
+
+    # If pushing to a branch with name prefix 'ci-', then run all jobs
+    - if: '$CI_COMMIT_BRANCH =~ /^ci-/'
+      when: always
+
+    # If user requested CI using 'git push -o ci.variable="QEMU_CI=1"',
+    # then run all jobs
+    - if: '$QEMU_CI'
+      when: always
+
+    # If user pushed in any other way, only default the small
+    # number of default jobs needed to sanity check basic build
+    - if: '$QEMU_CI_DEFAULT_JOB == "1"'
+      when: always
+
+    # Any other scenario, let the jobs be manually triggered.
+    # Set to be non-fatal, so that pending manual jobs don't
+    # affect overall pipeline status
+    - when: manual
+      allow_failure: true
diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index 6dc5385e69..f95d2b65f1 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -15,25 +15,8 @@
 #
 # QEMU CI jobs are based on templates. Some templates provide
 # user-configurable options, modifiable via configuration variables.
-#
-# These variables can be set globally in the user's CI namespace
-# setting:
-# https://docs.gitlab.com/ee/ci/variables/#create-a-custom-variable-in-the-ui
-# or set manually each time a branch/tag is pushed, as a git-push
-# command line argument:
-# https://docs.gitlab.com/ee/user/project/push_options.html#push-options-for-gitlab-cicd
-#
-# Example setting the QEMU_CI_EXAMPLE_VAR variable:
-#
-#   git push -o ci.variable="QEMU_CI_EXAMPLE_VAR=value" myrepo mybranch
-#
-# ----------------------------------------------------------------------
-#
-# List of environment variables that can be use to modify the set
-# of jobs selected:
-#
-# - QEMU_CI_AVOCADO_TESTING
-#   If set, tests using the Avocado framework will be run
+# Refer to 'workflow.yml' for guidance on how to trigger non-default
+# jobs using git push options, or special branch names
 
 include:
   - local: '/.gitlab-ci.d/qemu-project.yml'
-- 
2.31.1


