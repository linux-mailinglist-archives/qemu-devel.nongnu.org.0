Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 37EA32920FC
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Oct 2020 03:56:00 +0200 (CEST)
Received: from localhost ([::1]:44168 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kUKP1-0008Qa-8k
	for lists+qemu-devel@lfdr.de; Sun, 18 Oct 2020 21:55:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51826)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <crosa@redhat.com>) id 1kUKJh-0001k7-Bb
 for qemu-devel@nongnu.org; Sun, 18 Oct 2020 21:50:29 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:59204)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <crosa@redhat.com>) id 1kUKJe-0001HY-67
 for qemu-devel@nongnu.org; Sun, 18 Oct 2020 21:50:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1603072221;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Ves9dhQ7uA40qroFqiDykwJd40sbkpK3awlCdW3aOiE=;
 b=X47BeEeCOh7ZesDXIAg4jCRMME9GUVGbFxzkNuBkDfUlDTxFh785uw3PZq+cP5kVfEs43g
 yq7AVx8OL25GEdJIfi/9B8ghiVXscZ41igrviggUJZZvELKTRfd2dZABfRdK5696qMbnVp
 xSK8pIqVpDBvB3XyeV5PBud8LVQjf08=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-372-pCJqHEF3MUOO1-ZKoL4zAA-1; Sun, 18 Oct 2020 21:50:19 -0400
X-MC-Unique: pCJqHEF3MUOO1-ZKoL4zAA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 962D21DE0F;
 Mon, 19 Oct 2020 01:50:18 +0000 (UTC)
Received: from localhost.localdomain.com (ovpn-119-55.rdu2.redhat.com
 [10.10.119.55])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 49FEC6EF45;
 Mon, 19 Oct 2020 01:50:17 +0000 (UTC)
From: Cleber Rosa <crosa@redhat.com>
To: qemu-devel@nongnu.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v4 4/4] Jobs based on custom runners: add job definitions for
 QEMU's machines
Date: Sun, 18 Oct 2020 21:50:03 -0400
Message-Id: <20201019015003.1527746-5-crosa@redhat.com>
In-Reply-To: <20201019015003.1527746-1-crosa@redhat.com>
References: <20201019015003.1527746-1-crosa@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=crosa@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=crosa@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/18 21:50:19
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=-1, RCVD_IN_MSPIKE_WL=-0.01,
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
 Beraldo Leal <bleal@redhat.com>, Erik Skultety <eskultet@redhat.com>,
 Stefan Hajnoczi <stefanha@gmail.com>, Andrea Bolognani <abologna@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Willian Rampazzo <wrampazz@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The QEMU project has two machines (aarch64 and s390) that can be used
for jobs that do build and run tests.  This introduces those jobs,
which are a mapping of custom scripts used for the same purpose.

Signed-off-by: Cleber Rosa <crosa@redhat.com>
---
 .gitlab-ci.d/custom-runners.yml | 192 ++++++++++++++++++++++++++++++++
 1 file changed, 192 insertions(+)

diff --git a/.gitlab-ci.d/custom-runners.yml b/.gitlab-ci.d/custom-runners.yml
index 3004da2bda..5b51d1b336 100644
--- a/.gitlab-ci.d/custom-runners.yml
+++ b/.gitlab-ci.d/custom-runners.yml
@@ -12,3 +12,195 @@
 # strategy.
 variables:
   GIT_SUBMODULE_STRATEGY: recursive
+
+# All ubuntu-18.04 jobs should run successfully in an environment
+# setup by the scripts/ci/setup/build-environment.yml task
+# "Install basic packages to build QEMU on Ubuntu 18.04/20.04"
+ubuntu-18.04-s390x-all-linux-static:
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
+ - ../configure --disable-libssh --cc=clang --cxx=clang++ --enable-sanitizers
+ - make --output-sync -j`nproc`
+ - make --output-sync -j`nproc` check V=1
+
+ubuntu-18.04-s390x-tci:
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
+ - ../configure --disable-libssh --disable-tcg
+ - make --output-sync -j`nproc`
+ - make --output-sync -j`nproc` check V=1
+
+# All ubuntu-20.04 jobs should run successfully in an environment
+# setup by the scripts/ci/setup/qemu/build-environment.yml task
+# "Install basic packages to build QEMU on Ubuntu 18.04/20.04"
+ubuntu-20.04-aarch64-all-linux-static:
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
+ - ../configure --disable-libssh --cc=clang --cxx=clang++ --enable-sanitizers
+ - make --output-sync -j`nproc`
+ - make --output-sync -j`nproc` check V=1
+
+ubuntu-20.04-aarch64-tci:
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
+ - ../configure --disable-libssh --disable-tcg
+ - make --output-sync -j`nproc`
+ - make --output-sync -j`nproc` check V=1
-- 
2.25.4


