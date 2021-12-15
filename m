Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CADB4753E9
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Dec 2021 08:53:45 +0100 (CET)
Received: from localhost ([::1]:40108 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mxP6e-0002oh-LO
	for lists+qemu-devel@lfdr.de; Wed, 15 Dec 2021 02:53:44 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49822)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1mxOnz-0003JD-O7
 for qemu-devel@nongnu.org; Wed, 15 Dec 2021 02:34:27 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:58210)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1mxOny-0004JU-07
 for qemu-devel@nongnu.org; Wed, 15 Dec 2021 02:34:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1639553665;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=oiZqYOjewc7p1Q2UxhVUivUM+b0uWend4o5DAzlCdBM=;
 b=Jnk7vgBlOCnX4ALmmkK1ez+GoBw74CrTJzEUciWWUjbpw6Fr3WK0db77ZtVvqiXR6FccoF
 VOcxVeWocr6fBACLuRjyoGDYuhPs+a1y+GQrlEYsVtN3+oks2tBNl7CFWydWSN9LIlQvTD
 uvPjs2aHZ1sTUTA7AsiGFQMAOlcKRXw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-197-lzT5yv2LPuCULSxsdh95Vw-1; Wed, 15 Dec 2021 02:34:22 -0500
X-MC-Unique: lzT5yv2LPuCULSxsdh95Vw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2C46E100E326;
 Wed, 15 Dec 2021 07:34:21 +0000 (UTC)
Received: from thuth.com (dhcp-192-183.str.redhat.com [10.33.192.183])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 85AC61092790;
 Wed, 15 Dec 2021 07:34:20 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 11/16] gitlab-ci: Add cirrus-ci based tests for NetBSD and
 OpenBSD
Date: Wed, 15 Dec 2021 08:33:57 +0100
Message-Id: <20211215073402.144286-12-thuth@redhat.com>
In-Reply-To: <20211215073402.144286-1-thuth@redhat.com>
References: <20211215073402.144286-1-thuth@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.719,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Richard Henderson <richard.henderson@linaro.org>
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

The jobs are marked as "manual" only, since this double-indirect setup
(with the cirrus-run script and VMs in the Cirrus-CI containers) might
fail more often than the other jobs, and since we can trigger a limited
amount of Cirrus-CI jobs at a time anyway (due to the restrictions in
the free tier of Cirrus). Thus these jobs are rather added as convenience
for contributors who would like to run the NetBSD/OpenBSD tests without
the need of downloading and installing the corresponding VM images on
their local machines.

Message-Id: <20211209103124.121942-1-thuth@redhat.com>
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 .gitlab-ci.d/cirrus.yml           | 35 +++++++++++++++++++++++++++++++
 .gitlab-ci.d/cirrus/kvm-build.yml | 31 +++++++++++++++++++++++++++
 2 files changed, 66 insertions(+)
 create mode 100644 .gitlab-ci.d/cirrus/kvm-build.yml

diff --git a/.gitlab-ci.d/cirrus.yml b/.gitlab-ci.d/cirrus.yml
index d273a9e713..19e6c21401 100644
--- a/.gitlab-ci.d/cirrus.yml
+++ b/.gitlab-ci.d/cirrus.yml
@@ -89,3 +89,38 @@ x64-macos-11-base-build:
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


