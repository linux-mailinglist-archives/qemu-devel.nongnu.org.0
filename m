Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E8D32ADB60
	for <lists+qemu-devel@lfdr.de>; Tue, 10 Nov 2020 17:12:32 +0100 (CET)
Received: from localhost ([::1]:43994 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kcWFz-0002NP-3K
	for lists+qemu-devel@lfdr.de; Tue, 10 Nov 2020 11:12:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59674)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kcW6o-0000LV-Nr
 for qemu-devel@nongnu.org; Tue, 10 Nov 2020 11:03:02 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:32299)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kcW6m-0003lH-9q
 for qemu-devel@nongnu.org; Tue, 10 Nov 2020 11:03:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605024179;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=I8UsDXyJ1i+FjjdcS66dSuTsF8UOaFa+Rqx9JYG6xQU=;
 b=LSmcTIQHvru/9Z7zSWvWOoWRBM/MdOz4t7Jm2NncnKd+ID0xNbMvrd5Ecfzxdum9MIKOeS
 xe4e/izsGKYxlFrRp8+/uaOMIf2QSS+9sPYCHf3+XXEoowkM6wJSbSHem9HIvy6MOP6dE4
 0CFI8Gs6eQQaemDiqsNROVFV6Cmydas=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-150-UvnFMarTN7-YIZ516DU1pg-1; Tue, 10 Nov 2020 11:02:56 -0500
X-MC-Unique: UvnFMarTN7-YIZ516DU1pg-1
Received: by mail-wr1-f69.google.com with SMTP id h8so5891733wrt.9
 for <qemu-devel@nongnu.org>; Tue, 10 Nov 2020 08:02:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=I8UsDXyJ1i+FjjdcS66dSuTsF8UOaFa+Rqx9JYG6xQU=;
 b=tbXloJC0tECQ0Bu9/kZy6vapMgeLVHAAh8z3TRKpyD2sr5T9AnO32ccaFPubUAle7Q
 9mEQLR0fQ+IVbdPyK/PnYaZgJAm1h+xpa78r1r0eeygx66oExCMFWiO7r4xlUmqi3wQp
 xRiLvlQKgHar9g1SE7dRG/hpGoEM5XDNDQovmoRbpm1NmaXOPbnXolKf5lYPvgEpyIID
 ggbn2ZqBfvxaOszSAnC76beqPNqUT4TlJxrNlT4sAFRoOP+EwjMpUDEIhHYzCL9JfirM
 kzvkmfK2DDFbok6Kl0rvgiqpb/xfTMOs7yttYNuqy5yLxs3ZCh8TgBn/BRICSLIgGFM+
 Bjig==
X-Gm-Message-State: AOAM532KCAlLh88dhq0FgAxg6gVP7vVM7PckcU0Rjwdmkwr7R2tBC61i
 dN6HV1KvfWlI5DviwWQv8J/Pts/7vIk2LE6ZlSIrv6bu1UrwcU/oXdwYsDc2Ucn/yqBG/uiKGIF
 ++GwifP1yyC3snPs7g79UacPZR54yAnzujyyL0qHt1raMhXh2zIH7mlsMjl6QEAe0
X-Received: by 2002:a1c:7418:: with SMTP id p24mr422687wmc.36.1605024171483;
 Tue, 10 Nov 2020 08:02:51 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzGIjxxsnSdg86CFJyUnfwHHwVb7+kxA6s/S8vtBIYvXIn+waXujgUI0KALqegch2eI+S920w==
X-Received: by 2002:a1c:7418:: with SMTP id p24mr422643wmc.36.1605024171249;
 Tue, 10 Nov 2020 08:02:51 -0800 (PST)
Received: from x1w.redhat.com (234.red-83-42-66.dynamicip.rima-tde.net.
 [83.42.66.234])
 by smtp.gmail.com with ESMTPSA id 34sm19847697wrq.27.2020.11.10.08.02.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Nov 2020 08:02:50 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH 13/16] =?UTF-8?q?gitlab-ci:=20Mark=20Alex=20Benn=C3=A9?=
 =?UTF-8?q?e=20maintainer=20of=20Debian=20/=20Ubuntu=20jobs?=
Date: Tue, 10 Nov 2020 17:01:37 +0100
Message-Id: <20201110160140.2859904-14-philmd@redhat.com>
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

Alex Bennée is maintaining the following jobs:

 - debian11
 - ubuntu*
 - alpha
 - cris
 - armel
 - arm64
 - cross user/test
 - build-disabled
 - build-user/plugins
 - build-deprecated

Cc: "Alex Bennée" <alex.bennee@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 .gitlab-ci.d/containers.yml  | 26 ++++++++++++++++++++++++++
 .gitlab-ci.d/crossbuilds.yml |  6 ++++++
 .gitlab-ci.yml               | 16 ++++++++++++++++
 3 files changed, 48 insertions(+)

diff --git a/.gitlab-ci.d/containers.yml b/.gitlab-ci.d/containers.yml
index 8ad15874e6e..e2f59a4524f 100644
--- a/.gitlab-ci.d/containers.yml
+++ b/.gitlab-ci.d/containers.yml
@@ -54,6 +54,8 @@ amd64-debian10-container:
 amd64-debian11-container:
   extends: .container_job
   variables:
+    JOB_MAINTAINER_NAME: "Alex Bennée"
+    JOB_MAINTAINER_EMAIL: alex.bennee@linaro.org
     NAME: debian11
 
 alpha-debian-cross-container:
@@ -61,6 +63,8 @@ alpha-debian-cross-container:
   stage: containers-layer2
   needs: ['amd64-debian10-container']
   variables:
+    JOB_MAINTAINER_NAME: "Alex Bennée"
+    JOB_MAINTAINER_EMAIL: alex.bennee@linaro.org
     NAME: debian-alpha-cross
 
 amd64-debian-cross-container:
@@ -68,6 +72,8 @@ amd64-debian-cross-container:
   stage: containers-layer2
   needs: ['amd64-debian10-container']
   variables:
+    JOB_MAINTAINER_NAME: "Alex Bennée"
+    JOB_MAINTAINER_EMAIL: alex.bennee@linaro.org
     NAME: debian-amd64-cross
 
 amd64-debian-user-cross-container:
@@ -75,6 +81,8 @@ amd64-debian-user-cross-container:
   stage: containers-layer2
   needs: ['amd64-debian10-container']
   variables:
+    JOB_MAINTAINER_NAME: "Alex Bennée"
+    JOB_MAINTAINER_EMAIL: alex.bennee@linaro.org
     NAME: debian-all-test-cross
 
 amd64-debian-container:
@@ -82,6 +90,8 @@ amd64-debian-container:
   stage: containers-layer2
   needs: ['amd64-debian10-container']
   variables:
+    JOB_MAINTAINER_NAME: "Alex Bennée"
+    JOB_MAINTAINER_EMAIL: alex.bennee@linaro.org
     NAME: debian-amd64
 
 arm64-debian-cross-container:
@@ -89,6 +99,8 @@ arm64-debian-cross-container:
   stage: containers-layer2
   needs: ['amd64-debian10-container']
   variables:
+    JOB_MAINTAINER_NAME: "Alex Bennée"
+    JOB_MAINTAINER_EMAIL: alex.bennee@linaro.org
     NAME: debian-arm64-cross
 
 arm64-test-debian-cross-container:
@@ -96,6 +108,8 @@ arm64-test-debian-cross-container:
   stage: containers-layer2
   needs: ['amd64-debian11-container']
   variables:
+    JOB_MAINTAINER_NAME: "Alex Bennée"
+    JOB_MAINTAINER_EMAIL: alex.bennee@linaro.org
     NAME: debian-arm64-test-cross
 
 armel-debian-cross-container:
@@ -103,6 +117,8 @@ armel-debian-cross-container:
   stage: containers-layer2
   needs: ['amd64-debian10-container']
   variables:
+    JOB_MAINTAINER_NAME: "Alex Bennée"
+    JOB_MAINTAINER_EMAIL: alex.bennee@linaro.org
     NAME: debian-armel-cross
 
 armhf-debian-cross-container:
@@ -117,6 +133,8 @@ hppa-debian-cross-container:
   stage: containers-layer2
   needs: ['amd64-debian10-container']
   variables:
+    JOB_MAINTAINER_NAME: "Alex Bennée"
+    JOB_MAINTAINER_EMAIL: alex.bennee@linaro.org
     NAME: debian-hppa-cross
 
 m68k-debian-cross-container:
@@ -218,6 +236,8 @@ xtensa-debian-cross-container:
 cris-fedora-cross-container:
   extends: .container_job
   variables:
+    JOB_MAINTAINER_NAME: "Alex Bennée"
+    JOB_MAINTAINER_EMAIL: alex.bennee@linaro.org
     NAME: fedora-cris-cross
 
 amd64-fedora-container:
@@ -251,14 +271,20 @@ win64-fedora-cross-container:
 amd64-ubuntu1804-container:
   extends: .container_job
   variables:
+    JOB_MAINTAINER_NAME: "Alex Bennée"
+    JOB_MAINTAINER_EMAIL: alex.bennee@linaro.org
     NAME: ubuntu1804
 
 amd64-ubuntu2004-container:
   extends: .container_job
   variables:
+    JOB_MAINTAINER_NAME: "Alex Bennée"
+    JOB_MAINTAINER_EMAIL: alex.bennee@linaro.org
     NAME: ubuntu2004
 
 amd64-ubuntu-container:
   extends: .container_job
   variables:
+    JOB_MAINTAINER_NAME: "Alex Bennée"
+    JOB_MAINTAINER_EMAIL: alex.bennee@linaro.org
     NAME: ubuntu
diff --git a/.gitlab-ci.d/crossbuilds.yml b/.gitlab-ci.d/crossbuilds.yml
index a7e69a54074..56e362ee421 100644
--- a/.gitlab-ci.d/crossbuilds.yml
+++ b/.gitlab-ci.d/crossbuilds.yml
@@ -38,6 +38,8 @@ cross-armel-system:
 cross-armel-user:
   extends: .cross_user_build_job
   variables:
+    JOB_MAINTAINER_NAME: "Alex Bennée"
+    JOB_MAINTAINER_EMAIL: alex.bennee@linaro.org
     IMAGE: debian-armel-cross
 
 cross-armhf-system:
@@ -53,11 +55,15 @@ cross-armhf-user:
 cross-arm64-system:
   extends: .cross_system_build_job
   variables:
+    JOB_MAINTAINER_NAME: "Alex Bennée"
+    JOB_MAINTAINER_EMAIL: alex.bennee@linaro.org
     IMAGE: debian-arm64-cross
 
 cross-arm64-user:
   extends: .cross_user_build_job
   variables:
+    JOB_MAINTAINER_NAME: "Alex Bennée"
+    JOB_MAINTAINER_EMAIL: alex.bennee@linaro.org
     IMAGE: debian-arm64-cross
 
 cross-mips-system:
diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index ebb40fbf546..bafbdc0e1a7 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -84,6 +84,8 @@ include:
 build-system-ubuntu:
   extends: .native_build_job
   variables:
+    JOB_MAINTAINER_NAME: "Alex Bennée"
+    JOB_MAINTAINER_EMAIL: alex.bennee@linaro.org
     IMAGE: ubuntu2004
     TARGETS: aarch64-softmmu alpha-softmmu cris-softmmu hppa-softmmu
       moxie-softmmu microblazeel-softmmu mips64el-softmmu
@@ -100,6 +102,8 @@ check-system-ubuntu:
     - job: build-system-ubuntu
       artifacts: true
   variables:
+    JOB_MAINTAINER_NAME: "Alex Bennée"
+    JOB_MAINTAINER_EMAIL: alex.bennee@linaro.org
     IMAGE: ubuntu2004
     MAKE_CHECK_ARGS: check
 
@@ -109,6 +113,8 @@ integration-system-ubuntu:
     - job: build-system-ubuntu
       artifacts: true
   variables:
+    JOB_MAINTAINER_NAME: "Alex Bennée"
+    JOB_MAINTAINER_EMAIL: alex.bennee@linaro.org
     IMAGE: ubuntu2004
     MAKE_CHECK_ARGS: check-acceptance
 
@@ -220,6 +226,8 @@ integration-system-centos:
 build-disabled:
   extends: .native_build_job
   variables:
+    JOB_MAINTAINER_NAME: "Alex Bennée"
+    JOB_MAINTAINER_EMAIL: alex.bennee@linaro.org
     IMAGE: fedora
     CONFIGURE_ARGS: --disable-attr --disable-avx2 --disable-bochs
       --disable-brlapi --disable-bzip2 --disable-cap-ng --disable-capstone
@@ -267,6 +275,8 @@ build-tcg-disabled:
 build-user:
   extends: .native_build_job
   variables:
+    JOB_MAINTAINER_NAME: "Alex Bennée"
+    JOB_MAINTAINER_EMAIL: alex.bennee@linaro.org
     IMAGE: debian-all-test-cross
     CONFIGURE_ARGS: --disable-tools --disable-system
     MAKE_CHECK_ARGS: check-tcg
@@ -277,6 +287,8 @@ build-user:
 build-user-plugins:
   extends: .native_build_job
   variables:
+    JOB_MAINTAINER_NAME: "Alex Bennée"
+    JOB_MAINTAINER_EMAIL: alex.bennee@linaro.org
     IMAGE: debian-all-test-cross
     CONFIGURE_ARGS: --disable-tools --disable-system --enable-plugins --enable-debug-tcg --target-list-exclude=sparc64-linux-user,cris-linux-user
     MAKE_CHECK_ARGS: check-tcg
@@ -297,6 +309,8 @@ build-clang:
 build-deprecated:
   extends: .native_build_job
   variables:
+    JOB_MAINTAINER_NAME: "Alex Bennée"
+    JOB_MAINTAINER_EMAIL: alex.bennee@linaro.org
     IMAGE: debian-all-test-cross
     CONFIGURE_ARGS: --disable-docs --disable-tools
     MAKE_CHECK_ARGS: build-tcg
@@ -315,6 +329,8 @@ check-deprecated:
     - job: build-deprecated
       artifacts: true
   variables:
+    JOB_MAINTAINER_NAME: "Alex Bennée"
+    JOB_MAINTAINER_EMAIL: alex.bennee@linaro.org
     IMAGE: debian-all-test-cross
     MAKE_CHECK_ARGS: check-tcg
   allow_failure: true
-- 
2.26.2


