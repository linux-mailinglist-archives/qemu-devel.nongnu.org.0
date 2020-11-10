Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EEC22ADB67
	for <lists+qemu-devel@lfdr.de>; Tue, 10 Nov 2020 17:15:36 +0100 (CET)
Received: from localhost ([::1]:50150 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kcWIv-00052b-L6
	for lists+qemu-devel@lfdr.de; Tue, 10 Nov 2020 11:15:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59584)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kcW6Z-0008Gg-Ph
 for qemu-devel@nongnu.org; Tue, 10 Nov 2020 11:02:47 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:25265)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kcW6X-0003fy-Cp
 for qemu-devel@nongnu.org; Tue, 10 Nov 2020 11:02:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605024164;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=LeltGjkcQ7bvrbp59ZeMUmUFoQ7x2bBgO5/ggTg2iTo=;
 b=MLetwzDLq84SUtKE8/R1dWTSTdzTSDAPOewEHyZNYBm1dTXyb1Btd54SVKgewTewmXNftE
 PvwUb7PVNfqLkzO/d7pWMRbr0Dcds3hyiHoeDxENd+o7dtFHQfVS8ypWko96/Lj+mJ2EGp
 zJ/7igCKfSAWtWkUclTaoVTjrNJxT/k=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-338-BcXLJYT4PuGqs9s36jZqEQ-1; Tue, 10 Nov 2020 11:02:42 -0500
X-MC-Unique: BcXLJYT4PuGqs9s36jZqEQ-1
Received: by mail-wr1-f71.google.com with SMTP id h8so5891430wrt.9
 for <qemu-devel@nongnu.org>; Tue, 10 Nov 2020 08:02:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=LeltGjkcQ7bvrbp59ZeMUmUFoQ7x2bBgO5/ggTg2iTo=;
 b=Y+FsTtY3RUn7pO9uXoAwa0XqNENbTtYkZS8a66q26E9OjHMHWTSPWCQAn2wOtZwRbp
 BEeC9q0QQoVxgfhG6gDcQrYMPVOf5UBstM2/5JJQKzuRI48Fw1mtloEWpL3T/QUjxGGG
 QtOrI9lCKnsF/VlaqR/it+GnLXJcWJ+i5Vovc8UEJmN4FMMZsfU9ZKEZCmVYgNyognTN
 tmhBSFwBVoVFG4SwZOPKFuGjPnephP66oSUCLWomVCdnn+achC7NuURjzSjqPu7WHVTA
 MDpJexhMShTqlT3z5IW0/XM0cBMeJNbItH1ZUO/+kPiZ71kenWFXp3au0Jb21JB83SqH
 KWtA==
X-Gm-Message-State: AOAM5333qfEtyRR7GhcmaB6WYUuMwzIFGmmSlCE7QMsUa9CQeSdLTp9R
 T7uwUASmZp3ge0jJJHq8b8gpYuKjcsBwy/BIcqd+APxKzSdofzg2ITNX+iR24n4fB9923oRrIHG
 1yhXyHZoy2Vlr9OeLqIW1fcj69KVDSep1SLKd5NcubwIBzBtwVLHpdpv4/BRT5Qqk
X-Received: by 2002:adf:f2d2:: with SMTP id d18mr26093703wrp.302.1605024160836; 
 Tue, 10 Nov 2020 08:02:40 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxNTLeeQP5KxkAFGXxjDqyWulCjqs5W44M5TP5cdGYbMJYkE+p3cRHl2fZ3wB5XqlsEZ6hu6Q==
X-Received: by 2002:adf:f2d2:: with SMTP id d18mr26093647wrp.302.1605024160471; 
 Tue, 10 Nov 2020 08:02:40 -0800 (PST)
Received: from x1w.redhat.com (234.red-83-42-66.dynamicip.rima-tde.net.
 [83.42.66.234])
 by smtp.gmail.com with ESMTPSA id 35sm15619238wro.71.2020.11.10.08.02.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Nov 2020 08:02:39 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH 11/16] gitlab-ci: Mark some jobs maintained by Red Hat
 Virt CI team
Date: Tue, 10 Nov 2020 17:01:35 +0100
Message-Id: <20201110160140.2859904-12-philmd@redhat.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201110160140.2859904-1-philmd@redhat.com>
References: <20201110160140.2859904-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/10 00:21:06
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Fam Zheng <fam@euphon.net>, Thomas Huth <thuth@redhat.com>,
 "Daniel P . Berrange" <berrange@redhat.com>, Stefan Weil <sw@weilnetz.de>,
 Bin Meng <bin.meng@windriver.com>, Michael Tokarev <mjt@tls.msk.ru>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 virt-ci-maint-team@redhat.com, Bin Meng <bmeng.cn@gmail.com>,
 Laszlo Ersek <lersek@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Red Hat contributed some CI jobs, and have a CI team.
Make it responsible for the following jobs:

 - centos7
 - centos8
 - fedora
 - edk2
 - clang
 - tcg disabled
 - fuzzer
 - crypto
 - checkpatch
 - dco check

Cc: Red Hat Virt CI maintainers <virt-ci-maint-team@redhat.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 .gitlab-ci.d/containers.yml  | 12 ++++++++++++
 .gitlab-ci.d/crossbuilds.yml |  4 ++++
 .gitlab-ci.d/edk2.yml        |  4 ++++
 .gitlab-ci.yml               | 34 ++++++++++++++++++++++++++++++++++
 4 files changed, 54 insertions(+)

diff --git a/.gitlab-ci.d/containers.yml b/.gitlab-ci.d/containers.yml
index bd2a05008d1..8ad15874e6e 100644
--- a/.gitlab-ci.d/containers.yml
+++ b/.gitlab-ci.d/containers.yml
@@ -36,11 +36,15 @@ amd64-centos7-container:
   extends: .container_job
   variables:
     NAME: centos7
+    JOB_MAINTAINER_NAME: "Red Hat Virt CI maintainers"
+    JOB_MAINTAINER_EMAIL: virt-ci-maint-team@redhat.com
 
 amd64-centos8-container:
   extends: .container_job
   variables:
     NAME: centos8
+    JOB_MAINTAINER_NAME: "Red Hat Virt CI maintainers"
+    JOB_MAINTAINER_EMAIL: virt-ci-maint-team@redhat.com
 
 amd64-debian10-container:
   extends: .container_job
@@ -220,21 +224,29 @@ amd64-fedora-container:
   extends: .container_job
   variables:
     NAME: fedora
+    JOB_MAINTAINER_NAME: "Red Hat Virt CI maintainers"
+    JOB_MAINTAINER_EMAIL: virt-ci-maint-team@redhat.com
 
 i386-fedora-cross-container:
   extends: .container_job
   variables:
     NAME: fedora-i386-cross
+    JOB_MAINTAINER_NAME: "Red Hat Virt CI maintainers"
+    JOB_MAINTAINER_EMAIL: virt-ci-maint-team@redhat.com
 
 win32-fedora-cross-container:
   extends: .container_job
   variables:
     NAME: fedora-win32-cross
+    JOB_MAINTAINER_NAME: "Red Hat Virt CI maintainers"
+    JOB_MAINTAINER_EMAIL: virt-ci-maint-team@redhat.com
 
 win64-fedora-cross-container:
   extends: .container_job
   variables:
     NAME: fedora-win64-cross
+    JOB_MAINTAINER_NAME: "Red Hat Virt CI maintainers"
+    JOB_MAINTAINER_EMAIL: virt-ci-maint-team@redhat.com
 
 amd64-ubuntu1804-container:
   extends: .container_job
diff --git a/.gitlab-ci.d/crossbuilds.yml b/.gitlab-ci.d/crossbuilds.yml
index aecdb2a38f1..a7e69a54074 100644
--- a/.gitlab-ci.d/crossbuilds.yml
+++ b/.gitlab-ci.d/crossbuilds.yml
@@ -114,8 +114,12 @@ cross-win32-system:
   extends: .cross_system_build_job
   variables:
     IMAGE: fedora-win32-cross
+    JOB_MAINTAINER_NAME: "Red Hat Virt CI maintainers"
+    JOB_MAINTAINER_EMAIL: virt-ci-maint-team@redhat.com
 
 cross-win64-system:
   extends: .cross_system_build_job
   variables:
     IMAGE: fedora-win64-cross
+    JOB_MAINTAINER_NAME: "Red Hat Virt CI maintainers"
+    JOB_MAINTAINER_EMAIL: virt-ci-maint-team@redhat.com
diff --git a/.gitlab-ci.d/edk2.yml b/.gitlab-ci.d/edk2.yml
index 335c99035c9..27692eabb5a 100644
--- a/.gitlab-ci.d/edk2.yml
+++ b/.gitlab-ci.d/edk2.yml
@@ -4,6 +4,8 @@ docker-edk2:
  services:
  - docker:19.03.1-dind
  variables:
+  JOB_MAINTAINER_NAME: "Red Hat Virt CI team"
+  JOB_MAINTAINER_EMAIL: virt-ci-test-results@redhat.com
   GIT_DEPTH: 3
   IMAGE_TAG: $CI_REGISTRY_IMAGE:edk2-cross-build
   # We don't use TLS
@@ -38,6 +40,8 @@ build-edk2:
    - edk2-stderr.log
  image: $CI_REGISTRY_IMAGE:edk2-cross-build
  variables:
+   JOB_MAINTAINER_NAME: "Red Hat Virt CI team"
+   JOB_MAINTAINER_EMAIL: virt-ci-test-results@redhat.com
    GIT_DEPTH: 3
  script: # Clone the required submodules and build EDK2
  - git submodule update --init roms/edk2
diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index ded4f0bdd18..ebb40fbf546 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -146,6 +146,8 @@ integration-system-debian:
 build-system-fedora:
   extends: .native_build_job
   variables:
+    JOB_MAINTAINER_NAME: "Red Hat Virt CI maintainers"
+    JOB_MAINTAINER_EMAIL: virt-ci-maint-team@redhat.com
     IMAGE: fedora
     CONFIGURE_ARGS: --disable-gcrypt --enable-nettle --enable-docs
     TARGETS: tricore-softmmu microblaze-softmmu mips-softmmu
@@ -162,6 +164,8 @@ check-system-fedora:
     - job: build-system-fedora
       artifacts: true
   variables:
+    JOB_MAINTAINER_NAME: "Red Hat Virt CI maintainers"
+    JOB_MAINTAINER_EMAIL: virt-ci-maint-team@redhat.com
     IMAGE: fedora
     MAKE_CHECK_ARGS: check
 
@@ -171,12 +175,16 @@ integration-system-fedora:
     - job: build-system-fedora
       artifacts: true
   variables:
+    JOB_MAINTAINER_NAME: "Red Hat Virt CI maintainers"
+    JOB_MAINTAINER_EMAIL: virt-ci-maint-team@redhat.com
     IMAGE: fedora
     MAKE_CHECK_ARGS: check-acceptance
 
 build-system-centos:
   extends: .native_build_job
   variables:
+    JOB_MAINTAINER_NAME: "Red Hat Virt CI maintainers"
+    JOB_MAINTAINER_EMAIL: virt-ci-maint-team@redhat.com
     IMAGE: centos8
     CONFIGURE_ARGS: --disable-nettle --enable-gcrypt
     TARGETS: ppc64-softmmu or1k-softmmu s390x-softmmu
@@ -193,6 +201,8 @@ check-system-centos:
     - job: build-system-centos
       artifacts: true
   variables:
+    JOB_MAINTAINER_NAME: "Red Hat Virt CI maintainers"
+    JOB_MAINTAINER_EMAIL: virt-ci-maint-team@redhat.com
     IMAGE: centos8
     MAKE_CHECK_ARGS: check
 
@@ -202,6 +212,8 @@ integration-system-centos:
     - job: build-system-centos
       artifacts: true
   variables:
+    JOB_MAINTAINER_NAME: "Red Hat Virt CI maintainers"
+    JOB_MAINTAINER_EMAIL: virt-ci-maint-team@redhat.com
     IMAGE: centos8
     MAKE_CHECK_ARGS: check-acceptance
 
@@ -233,6 +245,8 @@ build-disabled:
 build-tcg-disabled:
   extends: .native_build_job
   variables:
+    JOB_MAINTAINER_NAME: "Red Hat Virt CI maintainers"
+    JOB_MAINTAINER_EMAIL: virt-ci-maint-team@redhat.com
     IMAGE: centos8
   script:
     - mkdir build
@@ -271,6 +285,8 @@ build-user-plugins:
 build-clang:
   extends: .native_build_job
   variables:
+    JOB_MAINTAINER_NAME: "Red Hat Virt CI maintainers"
+    JOB_MAINTAINER_EMAIL: virt-ci-maint-team@redhat.com
     IMAGE: fedora
     CONFIGURE_ARGS: --cc=clang --cxx=clang++
     TARGETS: alpha-softmmu arm-softmmu m68k-softmmu mips64-softmmu
@@ -306,6 +322,8 @@ check-deprecated:
 build-oss-fuzz:
   extends: .native_build_job
   variables:
+    JOB_MAINTAINER_NAME: "Red Hat Virt CI maintainers"
+    JOB_MAINTAINER_EMAIL: virt-ci-maint-team@redhat.com
     IMAGE: fedora
   script:
     - mkdir build-oss-fuzz
@@ -349,6 +367,8 @@ build-tci:
 build-crypto-old-nettle:
   extends: .native_build_job
   variables:
+    JOB_MAINTAINER_NAME: "Red Hat Virt CI maintainers"
+    JOB_MAINTAINER_EMAIL: virt-ci-maint-team@redhat.com
     IMAGE: centos7
     TARGETS: x86_64-softmmu x86_64-linux-user
     CONFIGURE_ARGS: --disable-gcrypt --enable-nettle
@@ -363,6 +383,8 @@ check-crypto-old-nettle:
     - job: build-crypto-old-nettle
       artifacts: true
   variables:
+    JOB_MAINTAINER_NAME: "Red Hat Virt CI maintainers"
+    JOB_MAINTAINER_EMAIL: virt-ci-maint-team@redhat.com
     IMAGE: centos7
     MAKE_CHECK_ARGS: check
 
@@ -370,6 +392,8 @@ check-crypto-old-nettle:
 build-crypto-old-gcrypt:
   extends: .native_build_job
   variables:
+    JOB_MAINTAINER_NAME: "Red Hat Virt CI maintainers"
+    JOB_MAINTAINER_EMAIL: virt-ci-maint-team@redhat.com
     IMAGE: centos7
     TARGETS: x86_64-softmmu x86_64-linux-user
     CONFIGURE_ARGS: --disable-nettle --enable-gcrypt
@@ -384,6 +408,8 @@ check-crypto-old-gcrypt:
     - job: build-crypto-old-gcrypt
       artifacts: true
   variables:
+    JOB_MAINTAINER_NAME: "Red Hat Virt CI maintainers"
+    JOB_MAINTAINER_EMAIL: virt-ci-maint-team@redhat.com
     IMAGE: centos7
     MAKE_CHECK_ARGS: check
 
@@ -391,6 +417,8 @@ check-crypto-old-gcrypt:
 build-crypto-only-gnutls:
   extends: .native_build_job
   variables:
+    JOB_MAINTAINER_NAME: "Red Hat Virt CI maintainers"
+    JOB_MAINTAINER_EMAIL: virt-ci-maint-team@redhat.com
     IMAGE: centos7
     TARGETS: x86_64-softmmu x86_64-linux-user
     CONFIGURE_ARGS: --disable-nettle --disable-gcrypt --enable-gnutls
@@ -405,6 +433,8 @@ check-crypto-only-gnutls:
     - job: build-crypto-only-gnutls
       artifacts: true
   variables:
+    JOB_MAINTAINER_NAME: "Red Hat Virt CI maintainers"
+    JOB_MAINTAINER_EMAIL: virt-ci-maint-team@redhat.com
     IMAGE: centos7
     MAKE_CHECK_ARGS: check
 
@@ -417,6 +447,8 @@ check-patch:
     variables:
       - $CI_PROJECT_NAMESPACE == 'qemu-project' && $CI_COMMIT_BRANCH == 'master'
   variables:
+    JOB_MAINTAINER_NAME: "Red Hat Virt CI maintainers"
+    JOB_MAINTAINER_EMAIL: virt-ci-maint-team@redhat.com
     GIT_DEPTH: 1000
   allow_failure: true
 
@@ -428,6 +460,8 @@ check-dco:
     variables:
       - $CI_PROJECT_NAMESPACE == 'qemu-project' && $CI_COMMIT_BRANCH == 'master'
   variables:
+    JOB_MAINTAINER_NAME: "Red Hat Virt CI maintainers"
+    JOB_MAINTAINER_EMAIL: virt-ci-maint-team@redhat.com
     GIT_DEPTH: 1000
 
 pages:
-- 
2.26.2


