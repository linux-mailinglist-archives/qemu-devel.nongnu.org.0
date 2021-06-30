Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A016D3B7B3E
	for <lists+qemu-devel@lfdr.de>; Wed, 30 Jun 2021 03:28:33 +0200 (CEST)
Received: from localhost ([::1]:46850 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lyP1k-0006qX-M9
	for lists+qemu-devel@lfdr.de; Tue, 29 Jun 2021 21:28:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44898)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <crosa@redhat.com>) id 1lyOzw-000476-4b
 for qemu-devel@nongnu.org; Tue, 29 Jun 2021 21:26:40 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:38685)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <crosa@redhat.com>) id 1lyOzs-0004Ua-Ls
 for qemu-devel@nongnu.org; Tue, 29 Jun 2021 21:26:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1625016395;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=hhhKaXg4xVWVkGgP+8LO1sCXiVIGAsi0mHlXv8Wh9ds=;
 b=CpwZGrWiYFRTAsQfN2UvnUykcWvJGw81vG7M0HjzBSwwZzLTVexgelyPAIQnktaBx/Fa7W
 0kZrAdOR7hlUZ23EH3Et0n6lB9VqsH/XtWVE3PGpDhNJrAlWlE5Z71383FhrC/blGkxjAX
 fdWU5FDJdruwVUgs+DKsIuJP8ng9O8M=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-444-VK5ZxAaVPveyzKxCe9NkcQ-1; Tue, 29 Jun 2021 21:26:34 -0400
X-MC-Unique: VK5ZxAaVPveyzKxCe9NkcQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3BC3E1084F54;
 Wed, 30 Jun 2021 01:26:33 +0000 (UTC)
Received: from fedora.hsd1.nh.comcast.net (ovpn-114-132.rdu2.redhat.com
 [10.10.114.132])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id C9D2C5C1D1;
 Wed, 30 Jun 2021 01:26:31 +0000 (UTC)
From: Cleber Rosa <crosa@redhat.com>
To: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
Subject: [PATCH v7 4/4] Jobs based on custom runners: add job definitions for
 QEMU's machines
Date: Tue, 29 Jun 2021 21:26:19 -0400
Message-Id: <20210630012619.115262-5-crosa@redhat.com>
In-Reply-To: <20210630012619.115262-1-crosa@redhat.com>
References: <20210630012619.115262-1-crosa@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=crosa@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=crosa@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.435,
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
Cc: Fam Zheng <fam@euphon.net>, Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Erik Skultety <eskultet@redhat.com>,
 Stefan Hajnoczi <stefanha@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Willian Rampazzo <willianr@redhat.com>, Willian Rampazzo <wrampazz@redhat.com>,
 Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Beraldo Leal <bleal@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The QEMU project has two machines (aarch64 and s390x) that can be used
for jobs that do build and run tests.  This introduces those jobs,
which are a mapping of custom scripts used for the same purpose.

Signed-off-by: Cleber Rosa <crosa@redhat.com>
Reviewed-by: Willian Rampazzo <willianr@redhat.com>
---
 .gitlab-ci.d/custom-runners.yml | 208 ++++++++++++++++++++++++++++++++
 1 file changed, 208 insertions(+)

diff --git a/.gitlab-ci.d/custom-runners.yml b/.gitlab-ci.d/custom-runners.yml
index a07b27384c..061d3cdfed 100644
--- a/.gitlab-ci.d/custom-runners.yml
+++ b/.gitlab-ci.d/custom-runners.yml
@@ -12,3 +12,211 @@
 # guarantees a fresh repository on each job run.
 variables:
   GIT_STRATEGY: clone
+
+# All ubuntu-18.04 jobs should run successfully in an environment
+# setup by the scripts/ci/setup/build-environment.yml task
+# "Install basic packages to build QEMU on Ubuntu 18.04/20.04"
+ubuntu-18.04-s390x-all-linux-static:
+ allow_failure: true
+ needs: []
+ stage: build
+ tags:
+ - ubuntu_18.04
+ - s390x
+ rules:
+ - if: '$CI_COMMIT_BRANCH =~ /^staging/'
+ script:
+ # --disable-libssh is needed because of https://bugs.launchpad.net/qemu/+bug/1838763
+ # --disable-glusterfs is needed because there's no static version of those libs in distro supplied packages
+ - mkdir build
+ - cd build
+ - ../configure --enable-debug --static --disable-system --disable-glusterfs --disable-libssh
+ - make --output-sync -j`nproc`
+ - make --output-sync -j`nproc` check V=1
+ - make --output-sync -j`nproc` check-tcg V=1
+
+ubuntu-18.04-s390x-all:
+ allow_failure: true
+ needs: []
+ stage: build
+ tags:
+ - ubuntu_18.04
+ - s390x
+ rules:
+ - if: '$CI_COMMIT_BRANCH =~ /^staging/'
+ script:
+ - mkdir build
+ - cd build
+ - ../configure --disable-libssh
+ - make --output-sync -j`nproc`
+ - make --output-sync -j`nproc` check V=1
+
+ubuntu-18.04-s390x-alldbg:
+ allow_failure: true
+ needs: []
+ stage: build
+ tags:
+ - ubuntu_18.04
+ - s390x
+ rules:
+ - if: '$CI_COMMIT_BRANCH =~ /^staging/'
+ script:
+ - mkdir build
+ - cd build
+ - ../configure --enable-debug --disable-libssh
+ - make clean
+ - make --output-sync -j`nproc`
+ - make --output-sync -j`nproc` check V=1
+
+ubuntu-18.04-s390x-clang:
+ allow_failure: true
+ needs: []
+ stage: build
+ tags:
+ - ubuntu_18.04
+ - s390x
+ rules:
+ - if: '$CI_COMMIT_BRANCH =~ /^staging/'
+   when: manual
+ script:
+ - mkdir build
+ - cd build
+ - ../configure --disable-libssh --cc=clang --cxx=clang++ --enable-sanitizers
+ - make --output-sync -j`nproc`
+ - make --output-sync -j`nproc` check V=1
+
+ubuntu-18.04-s390x-tci:
+ allow_failure: true
+ needs: []
+ stage: build
+ tags:
+ - ubuntu_18.04
+ - s390x
+ rules:
+ - if: '$CI_COMMIT_BRANCH =~ /^staging/'
+ script:
+ - mkdir build
+ - cd build
+ - ../configure --disable-libssh --enable-tcg-interpreter
+ - make --output-sync -j`nproc`
+
+ubuntu-18.04-s390x-notcg:
+ allow_failure: true
+ needs: []
+ stage: build
+ tags:
+ - ubuntu_18.04
+ - s390x
+ rules:
+ - if: '$CI_COMMIT_BRANCH =~ /^staging/'
+   when: manual
+ script:
+ - mkdir build
+ - cd build
+ - ../configure --disable-libssh --disable-tcg
+ - make --output-sync -j`nproc`
+ - make --output-sync -j`nproc` check V=1
+
+# All ubuntu-20.04 jobs should run successfully in an environment
+# setup by the scripts/ci/setup/qemu/build-environment.yml task
+# "Install basic packages to build QEMU on Ubuntu 18.04/20.04"
+ubuntu-20.04-aarch64-all-linux-static:
+ allow_failure: true
+ needs: []
+ stage: build
+ tags:
+ - ubuntu_20.04
+ - aarch64
+ rules:
+ - if: '$CI_COMMIT_BRANCH =~ /^staging/'
+ script:
+ # --disable-libssh is needed because of https://bugs.launchpad.net/qemu/+bug/1838763
+ # --disable-glusterfs is needed because there's no static version of those libs in distro supplied packages
+ - mkdir build
+ - cd build
+ - ../configure --enable-debug --static --disable-system --disable-glusterfs --disable-libssh
+ - make --output-sync -j`nproc`
+ - make --output-sync -j`nproc` check V=1
+ - make --output-sync -j`nproc` check-tcg V=1
+
+ubuntu-20.04-aarch64-all:
+ allow_failure: true
+ needs: []
+ stage: build
+ tags:
+ - ubuntu_20.04
+ - aarch64
+ rules:
+ - if: '$CI_COMMIT_BRANCH =~ /^staging/'
+ script:
+ - mkdir build
+ - cd build
+ - ../configure --disable-libssh
+ - make --output-sync -j`nproc`
+ - make --output-sync -j`nproc` check V=1
+
+ubuntu-20.04-aarch64-alldbg:
+ allow_failure: true
+ needs: []
+ stage: build
+ tags:
+ - ubuntu_20.04
+ - aarch64
+ rules:
+ - if: '$CI_COMMIT_BRANCH =~ /^staging/'
+ script:
+ - mkdir build
+ - cd build
+ - ../configure --enable-debug --disable-libssh
+ - make clean
+ - make --output-sync -j`nproc`
+ - make --output-sync -j`nproc` check V=1
+
+ubuntu-20.04-aarch64-clang:
+ allow_failure: true
+ needs: []
+ stage: build
+ tags:
+ - ubuntu_20.04
+ - aarch64
+ rules:
+ - if: '$CI_COMMIT_BRANCH =~ /^staging/'
+   when: manual
+ script:
+ - mkdir build
+ - cd build
+ - ../configure --disable-libssh --cc=clang-10 --cxx=clang++-10 --enable-sanitizers
+ - make --output-sync -j`nproc`
+ - make --output-sync -j`nproc` check V=1
+
+ubuntu-20.04-aarch64-tci:
+ allow_failure: true
+ needs: []
+ stage: build
+ tags:
+ - ubuntu_20.04
+ - aarch64
+ rules:
+ - if: '$CI_COMMIT_BRANCH =~ /^staging/'
+ script:
+ - mkdir build
+ - cd build
+ - ../configure --disable-libssh --enable-tcg-interpreter
+ - make --output-sync -j`nproc`
+
+ubuntu-20.04-aarch64-notcg:
+ allow_failure: true
+ needs: []
+ stage: build
+ tags:
+ - ubuntu_20.04
+ - aarch64
+ rules:
+ - if: '$CI_COMMIT_BRANCH =~ /^staging/'
+   when: manual
+ script:
+ - mkdir build
+ - cd build
+ - ../configure --disable-libssh --disable-tcg
+ - make --output-sync -j`nproc`
+ - make --output-sync -j`nproc` check V=1
-- 
2.31.1


