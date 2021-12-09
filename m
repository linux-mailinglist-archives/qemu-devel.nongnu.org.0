Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 80B0246E6A0
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Dec 2021 11:33:42 +0100 (CET)
Received: from localhost ([::1]:41890 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mvGk9-0002aS-8H
	for lists+qemu-devel@lfdr.de; Thu, 09 Dec 2021 05:33:41 -0500
Received: from eggs.gnu.org ([209.51.188.92]:45076)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1mvGi6-0000nN-AP
 for qemu-devel@nongnu.org; Thu, 09 Dec 2021 05:31:34 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:53640)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1mvGi3-0005fR-VP
 for qemu-devel@nongnu.org; Thu, 09 Dec 2021 05:31:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1639045890;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=gtRooo6LVdqSTbQrPCY/Dof/deS0+JpAvhpCQVC7mts=;
 b=E7UIXv6rl68vlyvPm4xZWUUyPiDy7ZjeukhxhPifjmQzIlwK5rEZrao4QbO6grteYYaRGA
 ZVik7OymTWiih8213doJlsI0KDJsASw3iIQLJk7qe0X+ptHza5iML6P31xDDzDQQff5pHx
 CsehyZvkaV3llmn4tNrq1Ahq+1Me1yY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-236-heHKPujbO0qiS29YzK_nWA-1; Thu, 09 Dec 2021 05:31:29 -0500
X-MC-Unique: heHKPujbO0qiS29YzK_nWA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 490931018720;
 Thu,  9 Dec 2021 10:31:28 +0000 (UTC)
Received: from thuth.com (dhcp-192-183.str.redhat.com [10.33.192.183])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2D0E817DBA;
 Thu,  9 Dec 2021 10:31:26 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: [PATCH for-7.0] gitlab-ci: Add cirrus-ci based tests for NetBSD and
 OpenBSD
Date: Thu,  9 Dec 2021 11:31:24 +0100
Message-Id: <20211209103124.121942-1-thuth@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.618,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: Beraldo Leal <bleal@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Kamil Rytarowski <kamil@netbsd.org>, Reinoud Zandijk <reinoud@netbsd.org>,
 Ryo ONODERA <ryoon@netbsd.org>, Brad Smith <brad@comstyle.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Cirrus-CI provides KVM in their Linux containers, so we can also run
our VM-based NetBSD and OpenBSD build jobs there.
Since the VM installation might take a while, we only run the "help"
target on the first invocation to avoid timeouts, and then only check
the build during the next run, once the base image has been cached.
For the the build tests, we also only use very a limited set of target
CPUs since compiling in these VMs is not very fast (especially the
build on OpenBSD seems to be incredibly slow).
For the time being, the jobs are also marked as manually only, since
this double-indirect setup (with the cirrus-run script and VMs in
the Cirrus-CI containers) might fail more often than the other jobs.

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 If you're interested, you can see some runs here:
 NetBSD: https://gitlab.com/thuth/qemu/-/jobs/1865965079
 OpenBSD: https://gitlab.com/thuth/qemu/-/jobs/1866116634

 .gitlab-ci.d/cirrus.yml           | 35 +++++++++++++++++++++++++++++++
 .gitlab-ci.d/cirrus/kvm-build.yml | 31 +++++++++++++++++++++++++++
 2 files changed, 66 insertions(+)
 create mode 100644 .gitlab-ci.d/cirrus/kvm-build.yml

diff --git a/.gitlab-ci.d/cirrus.yml b/.gitlab-ci.d/cirrus.yml
index 90bbe9f8ff..f2d4c0ca4f 100644
--- a/.gitlab-ci.d/cirrus.yml
+++ b/.gitlab-ci.d/cirrus.yml
@@ -64,3 +64,38 @@ x64-macos-11-base-build:
     PATH_EXTRA: /usr/local/opt/ccache/libexec:/usr/local/opt/gettext/bin
     PKG_CONFIG_PATH: /usr/local/opt/curl/lib/pkgconfig:/usr/local/opt/ncurses/lib/pkgconfig:/usr/local/opt/readline/lib/pkgconfig
     TEST_TARGETS: check-unit check-block check-qapi-schema check-softfloat check-qtest-x86_64
+
+
+# The following jobs run VM-based tests via KVM on a Linux-based Cirrus-CI job
+.cirrus_kvm_job:
+  stage: build
+  image: registry.gitlab.com/libvirt/libvirt-ci/cirrus-run:master
+  needs: []
+  timeout: 80m
+  allow_failure: true
+  script:
+    - sed -e "s|[@]CI_REPOSITORY_URL@|$CI_REPOSITORY_URL|g"
+          -e "s|[@]CI_COMMIT_REF_NAME@|$CI_COMMIT_REF_NAME|g"
+          -e "s|[@]CI_COMMIT_SHA@|$CI_COMMIT_SHA|g"
+          -e "s|[@]NAME@|$NAME|g"
+          -e "s|[@]CONFIGURE_ARGS@|$CONFIGURE_ARGS|g"
+          -e "s|[@]TEST_TARGETS@|$TEST_TARGETS|g"
+      <.gitlab-ci.d/cirrus/kvm-build.yml >.gitlab-ci.d/cirrus/$NAME.yml
+    - cat .gitlab-ci.d/cirrus/$NAME.yml
+    - cirrus-run -v --show-build-log always .gitlab-ci.d/cirrus/$NAME.yml
+  rules:
+    - when: manual
+
+x86-netbsd:
+  extends: .cirrus_kvm_job
+  variables:
+    NAME: netbsd
+    CONFIGURE_ARGS: --target-list=x86_64-softmmu,ppc64-softmmu,aarch64-softmmu
+    TEST_TARGETS: check
+
+x86-openbsd:
+  extends: .cirrus_kvm_job
+  variables:
+    NAME: openbsd
+    CONFIGURE_ARGS: --target-list=i386-softmmu,riscv64-softmmu,mips64-softmmu
+    TEST_TARGETS: check
diff --git a/.gitlab-ci.d/cirrus/kvm-build.yml b/.gitlab-ci.d/cirrus/kvm-build.yml
new file mode 100644
index 0000000000..4334fabf39
--- /dev/null
+++ b/.gitlab-ci.d/cirrus/kvm-build.yml
@@ -0,0 +1,31 @@
+container:
+  image: fedora:35
+  cpu: 4
+  memory: 8Gb
+  kvm: true
+
+env:
+  CIRRUS_CLONE_DEPTH: 1
+  CI_REPOSITORY_URL: "@CI_REPOSITORY_URL@"
+  CI_COMMIT_REF_NAME: "@CI_COMMIT_REF_NAME@"
+  CI_COMMIT_SHA: "@CI_COMMIT_SHA@"
+
+@NAME@_task:
+  @NAME@_vm_cache:
+    folder: $HOME/.cache/qemu-vm
+  install_script:
+    - dnf update -y
+    - dnf install -y git make openssh-clients qemu-img qemu-system-x86 wget
+  clone_script:
+    - git clone --depth 100 "$CI_REPOSITORY_URL" .
+    - git fetch origin "$CI_COMMIT_REF_NAME"
+    - git reset --hard "$CI_COMMIT_SHA"
+  build_script:
+    - if [ -f $HOME/.cache/qemu-vm/images/@NAME@.img ]; then
+        make vm-build-@NAME@ J=$(getconf _NPROCESSORS_ONLN)
+          EXTRA_CONFIGURE_OPTS="@CONFIGURE_ARGS@"
+          BUILD_TARGET="@TEST_TARGETS@" ;
+      else
+        make vm-build-@NAME@ J=$(getconf _NPROCESSORS_ONLN) BUILD_TARGET=help
+          EXTRA_CONFIGURE_OPTS="--disable-system --disable-user --disable-tools" ;
+      fi
-- 
2.27.0


