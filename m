Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3382B3EA9ED
	for <lists+qemu-devel@lfdr.de>; Thu, 12 Aug 2021 20:07:17 +0200 (CEST)
Received: from localhost ([::1]:34184 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mEF6q-0008V0-7g
	for lists+qemu-devel@lfdr.de; Thu, 12 Aug 2021 14:07:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39324)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mEF4M-0004wK-DZ
 for qemu-devel@nongnu.org; Thu, 12 Aug 2021 14:04:42 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:42769)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mEF4I-0000vg-QG
 for qemu-devel@nongnu.org; Thu, 12 Aug 2021 14:04:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1628791478;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6fuu1RudEDRlu0vZV74JpT/60DjE3fafrS2yll9NY7Q=;
 b=RVUgw7mP4gpNCuqc8a4ybPfAkgOzoPaqD+4YhCt54+OnZbMsF+uz/A/4evM6aT5UP2aZ3b
 5l3Jqmpex4T22lSeWGNW+wQQR7honbvY/RCCfJins0D+sqLM3lU0tOr7P1sf9NHBNZ/1cz
 LQnzDpdx7hjbLWJI07k3vnQ5/wY9qfo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-258-YqbhqTmiNpmY9H9RtrBJhw-1; Thu, 12 Aug 2021 14:04:34 -0400
X-MC-Unique: YqbhqTmiNpmY9H9RtrBJhw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9D010801AEB;
 Thu, 12 Aug 2021 18:04:33 +0000 (UTC)
Received: from localhost.localdomain.com (unknown [10.39.192.85])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 41F21669F2;
 Thu, 12 Aug 2021 18:04:16 +0000 (UTC)
From: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 2/2] gitlab: don't run CI jobs by default on push to user forks
Date: Thu, 12 Aug 2021 19:04:03 +0100
Message-Id: <20210812180403.4129067-3-berrange@redhat.com>
In-Reply-To: <20210812180403.4129067-1-berrange@redhat.com>
References: <20210812180403.4129067-1-berrange@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.701,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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

In addition, with the expected change in GitLab to set a finite CI
minute allowance on all users we need to be much more conservative.

This patch thus sets up rules so that no CI jobs will run by default
on push, except

 - Pushes to branch name prefix 'staging' on 'qemu-project' repo
   run full set of jobs
 - Pushes to 'master' branch, only run jobs needed to publish
   the website.

In any pushes to users forks, CI is now strictly opt-in. The pipeline
will always be created by every singe job will be marked manual. You
can then use the web UI to start individual jobs.

For more convenience there are three levels of increasing comprehensive
CI job sets that can be chosen between

 - Gating - run exactly the same as pushes to 'staging' branch
            (except for jobs needing custom runners)

   Push to 'ci-gating-xxx' branch, or set env QEMU_CI_GATING=1

 - Full - same as 'Gating', except that acceptance tests don't
          get run. This is equivalent to historical CI behaviour
	  for pushes to user forks.

   Push to 'ci-full-xxx' branch, or set env QEMU_CI_FULL=1

 - Minimal - a significantly cut down set of jobs to get a
             decent sanity check of builds without burning
	     massive amounts of CI time.

   Push to 'ci-min-xxx' branch, or set env QEMU_CI=1

The minimal job set covers:

  * Fedora, CentOS, Ubuntu & Debian system emulator builds
    to cover all arch targets.
  * Linux user static build
  * Cross build i386 (to identify any 32-bit build issues)
  * Cross build s390x (to identify any big endian build issues)
  * Containers needed for the above
  * Cirrus CI FreeBSD 12 and macOS 11 (to identify non-Linux issues)
  * Simple checks - python unittests, DCO check, checkpatch.pl, etc

This gives about 30 jobs instead of 120 from the "Full" group. It
is likely reasonable to cut the minimal set down even more, as IMHO
there are too many system emulator jobs there.

This is all controlled by defining a set of 'rules' entries that
apply to (almost) all jobs in the CI pipeline. The exceptions are
those using custom runners, and the firmware build jobs.

Using inherited templates together with rules, doesn't work in
the way you might expect. Any rules defined in the child completely
replace those from the parent, rather than augmenting them. Thus we
need to avoid having rules defined in any jobs at all, by inheriting
from a parent job template that contains the rules. The characteristics
of individual jobs are then defined by variables set against the job.
This is described in the updated content for the docs/devel/ci-jobs.rst
file.

Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
---
 .gitlab-ci.d/buildtest-template.yml  |  17 +--
 .gitlab-ci.d/buildtest.yml           |  43 ++++----
 .gitlab-ci.d/cirrus.yml              |   6 +-
 .gitlab-ci.d/container-core.yml      |   4 +
 .gitlab-ci.d/container-cross.yml     |   9 +-
 .gitlab-ci.d/container-template.yml  |   1 +
 .gitlab-ci.d/containers.yml          |   4 +
 .gitlab-ci.d/crossbuild-template.yml |   3 +
 .gitlab-ci.d/crossbuilds.yml         |   3 +
 .gitlab-ci.d/qemu-project.yml        |   1 +
 .gitlab-ci.d/rules.yml               | 116 ++++++++++++++++++++
 .gitlab-ci.d/static_checks.yml       |  18 ++--
 .gitlab-ci.yml                       |   4 -
 docs/devel/ci-jobs.rst               | 155 ++++++++++++++++++++++++---
 14 files changed, 317 insertions(+), 67 deletions(-)
 create mode 100644 .gitlab-ci.d/rules.yml

diff --git a/.gitlab-ci.d/buildtest-template.yml b/.gitlab-ci.d/buildtest-template.yml
index fcbcc4e627..8578b3ed11 100644
--- a/.gitlab-ci.d/buildtest-template.yml
+++ b/.gitlab-ci.d/buildtest-template.yml
@@ -1,4 +1,6 @@
+
 .native_build_job_template:
+  extends: .job_rules
   stage: build
   image: $CI_REGISTRY_IMAGE/qemu/$IMAGE:latest
   before_script:
@@ -27,6 +29,7 @@
       fi
 
 .native_test_job_template:
+  extends: .job_rules
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
-      when: on_success
-    - if: '$QEMU_CI_AVOCADO_TESTING'
-      when: on_success
-    # Otherwise, set to manual (the jobs are created but not run).
-    - when: manual
-      allow_failure: true
+  variables:
+    QEMU_JOB_GATING: 1
diff --git a/.gitlab-ci.d/buildtest.yml b/.gitlab-ci.d/buildtest.yml
index 903ee65f32..c8e03373c5 100644
--- a/.gitlab-ci.d/buildtest.yml
+++ b/.gitlab-ci.d/buildtest.yml
@@ -40,6 +40,7 @@ build-system-ubuntu:
   needs:
     job: amd64-ubuntu2004-container
   variables:
+    QEMU_JOB_MINIMAL: 1
     IMAGE: ubuntu2004
     CONFIGURE_ARGS: --enable-docs --enable-fdt=system --enable-slirp=system
     TARGETS: aarch64-softmmu alpha-softmmu cris-softmmu hppa-softmmu
@@ -56,6 +57,7 @@ check-system-ubuntu:
     - job: build-system-ubuntu
       artifacts: true
   variables:
+    QEMU_JOB_MINIMAL: 1
     IMAGE: ubuntu2004
     MAKE_CHECK_ARGS: check
 
@@ -73,6 +75,7 @@ build-system-debian:
   needs:
     job: amd64-debian-container
   variables:
+    QEMU_JOB_MINIMAL: 1
     IMAGE: debian-amd64
     CONFIGURE_ARGS: --enable-fdt=system
     TARGETS: arm-softmmu avr-softmmu i386-softmmu mipsel-softmmu
@@ -89,6 +92,7 @@ check-system-debian:
     - job: build-system-debian
       artifacts: true
   variables:
+    QEMU_JOB_MINIMAL: 1
     IMAGE: debian-amd64
     MAKE_CHECK_ARGS: check
 
@@ -106,6 +110,7 @@ build-system-fedora:
   needs:
     job: amd64-fedora-container
   variables:
+    QEMU_JOB_MINIMAL: 1
     IMAGE: fedora
     CONFIGURE_ARGS: --disable-gcrypt --enable-nettle --enable-docs
              --enable-fdt=system --enable-slirp=system --enable-capstone=system
@@ -123,6 +128,7 @@ check-system-fedora:
     - job: build-system-fedora
       artifacts: true
   variables:
+    QEMU_JOB_MINIMAL: 1
     IMAGE: fedora
     MAKE_CHECK_ARGS: check
 
@@ -140,6 +146,7 @@ build-system-centos:
   needs:
     job: amd64-centos8-container
   variables:
+    QEMU_JOB_MINIMAL: 1
     IMAGE: centos8
     CONFIGURE_ARGS: --disable-nettle --enable-gcrypt --enable-fdt=system
                     --enable-modules --enable-trace-backends=dtrace
@@ -157,6 +164,7 @@ check-system-centos:
     - job: build-system-centos
       artifacts: true
   variables:
+    QEMU_JOB_MINIMAL: 1
     IMAGE: centos8
     MAKE_CHECK_ARGS: check
 
@@ -325,6 +333,7 @@ build-user-static:
   needs:
     job: amd64-debian-user-cross-container
   variables:
+    QEMU_JOB_MINIMAL: 1
     IMAGE: debian-all-test-cross
     CONFIGURE_ARGS: --disable-tools --disable-system --static
     MAKE_CHECK_ARGS: check-tcg
@@ -411,17 +420,15 @@ build-cfi-aarch64:
       --enable-safe-stack --enable-slirp=git
     TARGETS: aarch64-softmmu
     MAKE_CHECK_ARGS: check-build
+    # FIXME: This job is often failing, likely due to out-of-memory problems in
+    # the constrained containers of the shared runners. Thus this is marked as
+    # manual until the situation has been solved.
+    QEMU_JOB_MANUAL: 1
   timeout: 70m
   artifacts:
     expire_in: 2 days
     paths:
       - build
-  rules:
-    # FIXME: This job is often failing, likely due to out-of-memory problems in
-    # the constrained containers of the shared runners. Thus this is marked as
-    # manual until the situation has been solved.
-    - when: manual
-      allow_failure: true
 
 check-cfi-aarch64:
   extends: .native_test_job_template
@@ -453,17 +460,15 @@ build-cfi-ppc64-s390x:
       --enable-safe-stack --enable-slirp=git
     TARGETS: ppc64-softmmu s390x-softmmu
     MAKE_CHECK_ARGS: check-build
+    # FIXME: This job is often failing, likely due to out-of-memory problems in
+    # the constrained containers of the shared runners. Thus this is marked as
+    # manual until the situation has been solved.
+    QEMU_JOB_MANUAL: 1
   timeout: 70m
   artifacts:
     expire_in: 2 days
     paths:
       - build
-  rules:
-    # FIXME: This job is often failing, likely due to out-of-memory problems in
-    # the constrained containers of the shared runners. Thus this is marked as
-    # manual until the situation has been solved.
-    - when: manual
-      allow_failure: true
 
 check-cfi-ppc64-s390x:
   extends: .native_test_job_template
@@ -657,6 +662,7 @@ build-without-default-features:
     MAKE_CHECK_ARGS: check-unit
 
 build-libvhost-user:
+  extends: .job_rules
   stage: build
   image: $CI_REGISTRY_IMAGE/qemu/fedora:latest
   needs:
@@ -676,6 +682,8 @@ build-tools-and-docs-debian:
   needs:
     job: amd64-debian-container
   variables:
+    QEMU_JOB_MINIMAL: 1
+    QEMU_JOB_PUBLISH: 1
     IMAGE: debian-amd64
     MAKE_CHECK_ARGS: check-unit check-softfloat ctags TAGS cscope
     CONFIGURE_ARGS: --disable-system --disable-user --enable-docs --enable-tools
@@ -698,10 +706,14 @@ build-tools-and-docs-debian:
 # that users can see the results of their commits, regardless
 # of what topic branch they're currently using
 pages:
+  extends: .native_build_job_template
   image: $CI_REGISTRY_IMAGE/qemu/debian-amd64:latest
   stage: test
   needs:
     - job: build-tools-and-docs-debian
+  variables:
+    QEMU_JOB_MINIMAL: 1
+    QEMU_JOB_PUBLISH: 1
   script:
     - mkdir -p public
     # HTML-ised source tree
@@ -715,10 +727,3 @@ pages:
   artifacts:
     paths:
       - public
-  rules:
-    - if: '$CI_PROJECT_NAMESPACE == "qemu-project" && $CI_COMMIT_BRANCH == $CI_DEFAULT_BRANCH'
-      when: on_success
-    - if: '$CI_PROJECT_NAMESPACE == "qemu-project"'
-      when: never
-    - if: '$CI_PROJECT_NAMESPACE != "qemu-project"'
-      when: on_success
diff --git a/.gitlab-ci.d/cirrus.yml b/.gitlab-ci.d/cirrus.yml
index 675db69622..4334736796 100644
--- a/.gitlab-ci.d/cirrus.yml
+++ b/.gitlab-ci.d/cirrus.yml
@@ -11,6 +11,7 @@
 # special care, because we can't just override it at the GitLab CI job
 # definition level or we risk breaking it completely.
 .cirrus_build_job:
+  extends: .job_rules
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
@@ -61,6 +60,8 @@ x64-freebsd-12-build:
 x64-freebsd-13-build:
   extends: .cirrus_build_job
   variables:
+    QEMU_JOB_SOFT_FAIL: 1
+    QEMU_JOB_MINIMAL: 1
     NAME: freebsd-13
     CIRRUS_VM_INSTANCE_TYPE: freebsd_instance
     CIRRUS_VM_IMAGE_SELECTOR: image_family
@@ -74,6 +75,7 @@ x64-freebsd-13-build:
 x64-macos-11-base-build:
   extends: .cirrus_build_job
   variables:
+    QEMU_JOB_MINIMAL: 1
     NAME: macos-11
     CIRRUS_VM_INSTANCE_TYPE: osx_instance
     CIRRUS_VM_IMAGE_SELECTOR: image
diff --git a/.gitlab-ci.d/container-core.yml b/.gitlab-ci.d/container-core.yml
index e8dd1f476a..8983c32b3b 100644
--- a/.gitlab-ci.d/container-core.yml
+++ b/.gitlab-ci.d/container-core.yml
@@ -4,14 +4,18 @@ include:
 amd64-centos8-container:
   extends: .container_job_template
   variables:
+    QEMU_JOB_MINIMAL: 1
     NAME: centos8
 
 amd64-fedora-container:
   extends: .container_job_template
   variables:
+    QEMU_JOB_MINIMAL: 1
     NAME: fedora
 
 amd64-debian10-container:
   extends: .container_job_template
   variables:
+    QEMU_JOB_MINIMAL: 1
+    QEMU_JOB_PUBLISH: 1
     NAME: debian10
diff --git a/.gitlab-ci.d/container-cross.yml b/.gitlab-ci.d/container-cross.yml
index 0fcebe363a..ef316668eb 100644
--- a/.gitlab-ci.d/container-cross.yml
+++ b/.gitlab-ci.d/container-cross.yml
@@ -50,13 +50,11 @@ armhf-debian-cross-container:
 # We never want to build hexagon in the CI system and by default we
 # always want to refer to the master registry where it lives.
 hexagon-cross-container:
+  extends: .job_rules
   image: docker:stable
   stage: containers
-  rules:
-    - if: '$CI_PROJECT_NAMESPACE == "qemu-project"'
-      when: never
-    - when: always
   variables:
+    QEMU_JOB_MANUAL: 1
     NAME: debian-hexagon-cross
     GIT_DEPTH: 1
   services:
@@ -143,6 +141,7 @@ s390x-debian-cross-container:
   stage: containers-layer2
   needs: ['amd64-debian10-container']
   variables:
+    QEMU_JOB_MINIMAL: 1
     NAME: debian-s390x-cross
 
 sh4-debian-cross-container:
@@ -179,11 +178,13 @@ cris-fedora-cross-container:
 i386-fedora-cross-container:
   extends: .container_job_template
   variables:
+    QEMU_JOB_MINIMAL: 1
     NAME: fedora-i386-cross
 
 win32-fedora-cross-container:
   extends: .container_job_template
   variables:
+    QEMU_JOB_MINIMAL: 1
     NAME: fedora-win32-cross
 
 win64-fedora-cross-container:
diff --git a/.gitlab-ci.d/container-template.yml b/.gitlab-ci.d/container-template.yml
index 1baecd9460..e2954e4ed3 100644
--- a/.gitlab-ci.d/container-template.yml
+++ b/.gitlab-ci.d/container-template.yml
@@ -1,4 +1,5 @@
 .container_job_template:
+  extends: .job_rules
   image: docker:stable
   stage: containers
   services:
diff --git a/.gitlab-ci.d/containers.yml b/.gitlab-ci.d/containers.yml
index cd06d3f5f4..6948923892 100644
--- a/.gitlab-ci.d/containers.yml
+++ b/.gitlab-ci.d/containers.yml
@@ -17,6 +17,8 @@ amd64-debian-container:
   stage: containers-layer2
   needs: ['amd64-debian10-container']
   variables:
+    QEMU_JOB_MINIMAL: 1
+    QEMU_JOB_PUBLISH: 1
     NAME: debian-amd64
 
 amd64-ubuntu1804-container:
@@ -27,6 +29,7 @@ amd64-ubuntu1804-container:
 amd64-ubuntu2004-container:
   extends: .container_job_template
   variables:
+    QEMU_JOB_MINIMAL: 1
     NAME: ubuntu2004
 
 amd64-ubuntu-container:
@@ -42,4 +45,5 @@ amd64-opensuse-leap-container:
 python-container:
   extends: .container_job_template
   variables:
+    QEMU_JOB_MINIMAL: 1
     NAME: python
diff --git a/.gitlab-ci.d/crossbuild-template.yml b/.gitlab-ci.d/crossbuild-template.yml
index 7d3ad00a1e..997ec02f79 100644
--- a/.gitlab-ci.d/crossbuild-template.yml
+++ b/.gitlab-ci.d/crossbuild-template.yml
@@ -1,4 +1,5 @@
 .cross_system_build_job:
+  extends: .job_rules
   stage: build
   image: $CI_REGISTRY_IMAGE/qemu/$IMAGE:latest
   timeout: 80m
@@ -23,6 +24,7 @@
 # KVM), and set extra options (such disabling other accelerators) via the
 # $EXTRA_CONFIGURE_OPTS variable.
 .cross_accel_build_job:
+  extends: .job_rules
   stage: build
   image: $CI_REGISTRY_IMAGE/qemu/$IMAGE:latest
   timeout: 30m
@@ -35,6 +37,7 @@
     - make -j$(expr $(nproc) + 1) all check-build $MAKE_CHECK_ARGS
 
 .cross_user_build_job:
+  extends: .job_rules
   stage: build
   image: $CI_REGISTRY_IMAGE/qemu/$IMAGE:latest
   script:
diff --git a/.gitlab-ci.d/crossbuilds.yml b/.gitlab-ci.d/crossbuilds.yml
index 4ff3aa3cfc..9fcd2ac567 100644
--- a/.gitlab-ci.d/crossbuilds.yml
+++ b/.gitlab-ci.d/crossbuilds.yml
@@ -48,6 +48,7 @@ cross-i386-system:
   needs:
     job: i386-fedora-cross-container
   variables:
+    QEMU_JOB_MINIMAL: 1
     IMAGE: fedora-i386-cross
     MAKE_CHECK_ARGS: check-qtest
 
@@ -129,6 +130,7 @@ cross-s390x-system:
   needs:
     job: s390x-debian-cross-container
   variables:
+    QEMU_JOB_MINIMAL: 1
     IMAGE: debian-s390x-cross
 
 cross-s390x-user:
@@ -159,6 +161,7 @@ cross-win32-system:
   needs:
     job: win32-fedora-cross-container
   variables:
+    QEMU_JOB_MINIMAL: 1
     IMAGE: fedora-win32-cross
   artifacts:
     paths:
diff --git a/.gitlab-ci.d/qemu-project.yml b/.gitlab-ci.d/qemu-project.yml
index b3d79bc429..7007193fc0 100644
--- a/.gitlab-ci.d/qemu-project.yml
+++ b/.gitlab-ci.d/qemu-project.yml
@@ -2,6 +2,7 @@
 # https://gitlab.com/qemu-project/qemu/-/pipelines
 
 include:
+  - local: '/.gitlab-ci.d/rules.yml'
   - local: '/.gitlab-ci.d/stages.yml'
   - local: '/.gitlab-ci.d/edk2.yml'
   - local: '/.gitlab-ci.d/opensbi.yml'
diff --git a/.gitlab-ci.d/rules.yml b/.gitlab-ci.d/rules.yml
new file mode 100644
index 0000000000..3399722ca9
--- /dev/null
+++ b/.gitlab-ci.d/rules.yml
@@ -0,0 +1,116 @@
+
+# This defines rules used to control individual job execution
+# See docs/devel/ci-jobs.rst for an explanation of the various
+# variables and branch naming conventions applied here.
+#
+.job_rules:
+  rules:
+    # ======================================================================
+    # Rules that apply regardless of whether the primary qemu repo or a fork
+    # ======================================================================
+
+    # Skip any cirrus job if either repo or api token are missing
+    # as we won't be able to talk to cirrus
+    - if: '$CIRRUS_VM_INSTANCE_TYPE && ($CIRRUS_GITHUB_REPO == null || $CIRRUS_API_TOKEN == null)'
+      when: never
+
+    # Any jobs marked as manual, never get automatically run in any scenario
+    # and don't contribute to pipeline status
+    - if: '$QEMU_JOB_MANUAL'
+      when: manual
+      allow_failure: true
+
+    # For the main repo, tags represent official releases.
+    # The branch associated with the release will have passed
+    # a CI pipeline already
+    #
+    # For user forks, tags are tyically added by tools like
+    # git-publish at the same time as pushing the branch prior
+    # to sending out for review
+    #
+    # In neither case do we wish to run CI pipelines for tags
+    - if: '$CI_PIPELINE_SOURCE == "push" && $CI_COMMIT_TAG'
+      when: never
+
+
+    # ==================================================
+    # Rules to control what happens in primary qemu repo
+    # ==================================================
+
+    # The 'pages' job must never run on a non-default branch as we don't
+    # want to publish the website from pre-merged content
+    - if: '$CI_PIPELINE_SOURCE == "push" && $CI_PROJECT_NAMESPACE == "qemu-project" && $CI_COMMIT_BRANCH != $CI_DEFAULT_BRANCH && $CI_JOB_NAME == "pages"'
+      when: never
+
+    # Run all jobs for main repo staging branch
+    - if: '$CI_PIPELINE_SOURCE == "push" && $CI_PROJECT_NAMESPACE == "qemu-project" && $CI_COMMIT_BRANCH == "staging"'
+      when: on_success
+
+    # Run jobs needed to support website publishing on the main branch
+    - if: '$CI_PIPELINE_SOURCE == "push" && $CI_PROJECT_NAMESPACE == "qemu-project" && $CI_COMMIT_BRANCH == $CI_DEFAULT_BRANCH && $QEMU_JOB_PUBLISH'
+      when: on_success
+
+    # Prevent jobs from running on pushes to any other branch / tag
+    - if: '$CI_PIPELINE_SOURCE == "push" && $CI_PROJECT_NAMESPACE == "qemu-project" && $CI_COMMIT_BRANCH != "staging"'
+      when: never
+
+
+    # Remainining pipeline sources follow the same rules as for fork repos
+
+
+
+    # ====================================
+    # Rules for running jobs in user forks
+    # ====================================
+
+    # Part 1: gating jobs
+    # -------------------
+
+    # If on a branch with name prefix 'ci-acceptance-', then run
+    # everything, just as a gating job on 'staging' branch would
+    - if: '$CI_COMMIT_BRANCH =~ /^ci-gating-/'
+      when: on_success
+
+    # If user set QEMU_CI_GATING=1, then run everything just as
+    # a gating job on 'staging' branch would
+    - if: '$QEMU_CI_GATING'
+      when: on_success
+
+    # Otherwise never run jobs marked as gating, but allow manual trigger
+    # without affecting pipeline status
+    - if: '$QEMU_JOB_GATING'
+      when: manual
+      allow_failure: true
+
+
+    # =============================================
+    # Part 2: opt-in for all CI, except gating jobs
+    # =============================================
+
+    # If pushing to a branch with name prefix 'ci-all', then run all jobs
+    - if: '$CI_COMMIT_BRANCH =~ /^ci-all/'
+      when: on_success
+
+    # If user QEMU_CI_ALL=1, then run all jobs
+    - if: '$QEMU_CI_ALL'
+      when: on_success
+
+
+    # ===============================
+    # Part 3: the minimal set of jobs
+    # ===============================
+
+    # If pushing to a branch with name prefix 'ci-min', then run
+    # only a minimal set of jobs
+    - if: '$CI_COMMIT_BRANCH =~ /^ci-min/ && $QEMU_JOB_MINIMAL'
+      when: on_success
+
+    # If user set QEMU_CI=1, then run only a minimal set of jobs
+    - if: '$QEMU_CI && $QEMU_JOB_MINIMAL'
+      when: on_success
+
+    # Any other scenario, let the jobs be manually triggered only.
+    # Set to be non-fatal, so that pending manual jobs don't
+    # affect overall pipeline status
+    - when: manual
+      allow_failure: true
diff --git a/.gitlab-ci.d/static_checks.yml b/.gitlab-ci.d/static_checks.yml
index 96dbd9e310..4ba3e038dd 100644
--- a/.gitlab-ci.d/static_checks.yml
+++ b/.gitlab-ci.d/static_checks.yml
@@ -1,4 +1,5 @@
 check-patch:
+  extends: .job_rules
   stage: build
   image: $CI_REGISTRY_IMAGE/qemu/centos8:latest
   needs:
@@ -6,42 +7,41 @@ check-patch:
   script:
     - .gitlab-ci.d/check-patch.py
   variables:
+    QEMU_JOB_MINIMAL: 1
     GIT_DEPTH: 1000
-  rules:
-    - if: '$CI_PROJECT_NAMESPACE == "qemu-project" && $CI_COMMIT_BRANCH == $CI_DEFAULT_BRANCH'
-      when: never
-    - when: on_success
-      allow_failure: true
+  allow_failure: true
 
 check-dco:
+  extends: .job_rules
   stage: build
   image: $CI_REGISTRY_IMAGE/qemu/centos8:latest
   needs:
     job: amd64-centos8-container
   script: .gitlab-ci.d/check-dco.py
   variables:
+    QEMU_JOB_MINIMAL: 1
     GIT_DEPTH: 1000
-  rules:
-    - if: '$CI_PROJECT_NAMESPACE == "qemu-project" && $CI_COMMIT_BRANCH == $CI_DEFAULT_BRANCH'
-      when: never
-    - when: on_success
 
 check-python-pipenv:
+  extends: .job_rules
   stage: test
   image: $CI_REGISTRY_IMAGE/qemu/python:latest
   script:
     - make -C python check-pipenv
   variables:
+    QEMU_JOB_MINIMAL: 1
     GIT_DEPTH: 1
   needs:
     job: python-container
 
 check-python-tox:
+  extends: .job_rules
   stage: test
   image: $CI_REGISTRY_IMAGE/qemu/python:latest
   script:
     - make -C python check-tox
   variables:
+    QEMU_JOB_MINIMAL: 1
     GIT_DEPTH: 1
     QEMU_TOX_EXTRA_ARGS: --skip-missing-interpreters=false
   needs:
diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index 9762dda2ee..d5bd31f294 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -15,10 +15,6 @@
 #
 # QEMU CI jobs are based on templates. Some templates provide
 # user-configurable options, modifiable via configuration variables.
-#
-# See https://qemu-project.gitlab.io/qemu/devel/ci.html#custom-ci-cd-variables
-# for more information.
-#
 
 include:
   - local: '/.gitlab-ci.d/qemu-project.yml'
diff --git a/docs/devel/ci-jobs.rst b/docs/devel/ci-jobs.rst
index 9cd9819786..6d3f13d495 100644
--- a/docs/devel/ci-jobs.rst
+++ b/docs/devel/ci-jobs.rst
@@ -1,22 +1,49 @@
-Custom CI/CD variables
-======================
+CI Job Rules
+============
 
-QEMU CI pipelines can be tuned by setting some CI environment variables.
+The following documents how CI rules control execution of jobs in a pipeline
 
-Set variable globally in the user's CI namespace
-------------------------------------------------
+Job variable naming
+-------------------
 
-Variables can be set globally in the user's CI namespace setting.
+The rules for controlling jobs in a pipeline will be driven by a number of
+variables:
+
+ - ``CI_XXX``, ``GITLAB_XXX`` - variables defined by GitLab:
+
+   https://docs.gitlab.com/ee/ci/variables/predefined_variables.html
+
+ - ``QEMU_JOB_XXX`` - variables defined in the YAML files that express
+   characteristics of the job used to control default behaviour
+
+ - ``QEMU_CI_XXX`` - variables defined by the user that are used to fine
+   tune which jobs are run dynamically
+
+and in some cases based on the branch name prefixes.
+
+Job fine tuning strategies
+--------------------------
+
+Using a combination of the ``QEMU_CI_XXX`` variables and ``ci-``
+branch name prefix, users can fine tune what jobs are run.
+
+Set variable globally in the gitlab repository CI config
+~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+
+Variables can be set globally in the user's gitlab repository CI config.
+These variables will apply to all pipelines associated with the repository
+thereafter. This is useful for fine tuning the jobs indefinitely.
 
 For further information about how to set these variables, please refer to::
 
   https://docs.gitlab.com/ee/ci/variables/#add-a-cicd-variable-to-a-project
 
-Set variable manually when pushing a branch or tag to the user's repository
----------------------------------------------------------------------------
+Set variable manually when pushing to git
+~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
 
 Variables can be set manually when pushing a branch or tag, using
-git-push command line arguments.
+git-push command line arguments. This is useful for fine tuning the
+jobs on an adhoc basis.
 
 Example setting the QEMU_CI_EXAMPLE_VAR variable:
 
@@ -28,13 +55,107 @@ For further information about how to set these variables, please refer to::
 
   https://docs.gitlab.com/ee/user/project/push_options.html#push-options-for-gitlab-cicd
 
-Here is a list of the most used variables:
+Pushing to specially named branches
+~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+
+Branch names starting with a 'ci-' prefix can be used as an alternative
+to setting variables. Details of supported branch names are detailed
+later in this document.
+
+Provide a custom gitlab CI configuration
+~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+
+The above strategies all provide a way to fine tune the jobs defined by the
+standard QEMU gitlab CI configuration file. If this is not sufficient it is
+possible to completely replace the CI configuration file with a custom
+version. This allows the contributor to achieve essentially anything they
+desire, within the scope of what GitLab supports.
+
+Replacing the ``.gitlab-ci.yml`` file is done in the repository settings:
+
+  https://docs.gitlab.com/ee/ci/pipelines/settings.html#specify-a-custom-cicd-configuration-file
+
+Note that it is possible to reference an arbitrary URL. This could point
+to a replacement .gitlab-ci.yml on a specific branch in the same repo,
+or can point to any external site.
+
+
+Job grouping sets
+-----------------
+
+There are many different jobs defined in the GitLab CI pipeline used by QEMU.
+It is not practical to run all jobs in every scenario, so there are a set of
+rules defined that control which jobs are executed on each pipeline run. At
+a high level the jobs can be grouped into a number of mutually exclusive
+sets.
+
+ - Manual jobs
+
+   This is a set of jobs that will never be run automatically in any scenario.
+   The reason a job will be marked manual is if it is known to exhibit some
+   non-deterministic failures, or liable to trigger timeouts. Ideally jobs are
+   only present in this set for a short period of time while the problems are
+   investigated and resolved. Users can manually trigger these jobs from the
+   the pipelines web UI if desired, but they will never contribute to the
+   overall pipeline status.
+
+   Identified by the variable ``QEMU_JOB_MANUAL: 1``
+
+
+ - Minimal jobs
+
+   This is a minimal set of jobs that give a reasonable build and test sanity
+   check, which will be run by default in all possible scenarios. This set of
+   jobs is intended to be controlled fairly strictly to avoid wasting CI
+   minutes of maintainers/contributors. The intent is to get 80-90% coverage
+   of build and unit tests across the most important host platforms and
+   architectures.
+
+   Identified by the variable ``QEMU_JOB_MINIMAL: 1``
+
+   Run by setting the variable ``QEMU_CI: 1`` or pushing to a branch
+   named ``ci-min-XXX``.
+
+
+ - Gating jobs
+
+   This is a set of jobs will will always run as a gating test prior to code
+   merging into the default branch of the primary QEMU git repository. In user
+   forks the jobs will not run by default, but the user can opt-in to trigger
+   their execution. These jobs may run a particularly thorough set of scenarios
+   that maintainers are not normally going to exercise before sending series.
+
+   Identified by the variable ``QEMU_JOB_GATING: 1``
+
+   Run by setting the variable ``QEMU_CI_GATING: 1`` or pushing to a branch
+   named ``ci-gating-XXX``
+
+
+ - Optional jobs
+
+   This is all remaining jobs that don't fall into one of the above buckets.
+   These jobs will always be run as a gating test prior to code merging into
+   the default branch of the primary QEMU git repository. In user forks the
+   jobs will not run by default, but the user can opt-in to trigger their
+   execution. These jobs will aim to expand the host/platform build coverage
+   gaps left by the default jobs.
+
+   Identified by not having any of the above variables set.
+
+   Run by setting the variable ``QEMU_CI_ALL: 1`` or pushing to a branch
+   named ``ci-all-XXXX``
+
+Since the sets are mutually exclusive, if more than one of the variables above
+is set, then only one of them will be honoured. The precedence matches the
+ordering of the above docs.
+
+In addition to the above, there are some special extra sets that can augment
+any of the above sets
+
+ - Publishing jobs
 
-QEMU_CI_AVOCADO_TESTING
-~~~~~~~~~~~~~~~~~~~~~~~
-By default, tests using the Avocado framework are not run automatically in
-the pipelines (because multiple artifacts have to be downloaded, and if
-these artifacts are not already cached, downloading them make the jobs
-reach the timeout limit). Set this variable to have the tests using the
-Avocado framework run automatically.
+   These are jobs that are needed to publish the QEMU website. For user fork
+   repos these follow the normal rules set out above. For the primary QEMU
+   repo, however, the jobs will also run on the default branch.
 
+   Identified by the variable ``QEMU_JOB_PUBLISH: 1``
-- 
2.31.1


