Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EC3157E217
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Jul 2022 15:12:38 +0200 (CEST)
Received: from localhost ([::1]:56626 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oEsSL-0004cV-BI
	for lists+qemu-devel@lfdr.de; Fri, 22 Jul 2022 09:12:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37888)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1oEsKm-0005cs-Dl
 for qemu-devel@nongnu.org; Fri, 22 Jul 2022 09:04:48 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:26090)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1oEsKk-0000wr-Df
 for qemu-devel@nongnu.org; Fri, 22 Jul 2022 09:04:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1658495084;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=N6fu6PkG7FtkFds8aRWdXbzBIE4yezT2g6lg61ZkHok=;
 b=TYIkOkym89lfbMo9YeQkd4YB57TftfQ8V/4SquZGBnJpzXW2vcWULtE0yIcofyxZlpqX+M
 rAKcjNTHIWajsmh/6uCzCy7J8bZSW19EuErsaAJh5LXswbp3KMi+uwvJVD5F7M5W5HW14Q
 Fp5BqjxLSpgUzqW58xlnw41dDqGrAN0=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-368-FRGlbKUFMe-ND9ABrSZYww-1; Fri, 22 Jul 2022 09:04:37 -0400
X-MC-Unique: FRGlbKUFMe-ND9ABrSZYww-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id BEE493833285;
 Fri, 22 Jul 2022 13:04:36 +0000 (UTC)
Received: from localhost.localdomain.com (unknown [10.33.36.91])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 82E9C492C3B;
 Fri, 22 Jul 2022 13:04:35 +0000 (UTC)
From: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
To: qemu-devel@nongnu.org
Cc: Thomas Huth <thuth@redhat.com>, Beraldo Leal <bleal@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Li-Wen Hsu <lwhsu@freebsd.org>, Ed Maste <emaste@freebsd.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
Subject: [PATCH v2 2/3] gitlab: show testlog.txt contents when
 cirrus/custom-runner jobs fail
Date: Fri, 22 Jul 2022 14:04:30 +0100
Message-Id: <20220722130431.2319019-3-berrange@redhat.com>
In-Reply-To: <20220722130431.2319019-1-berrange@redhat.com>
References: <20220722130431.2319019-1-berrange@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.10
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

When tests fail meson just displays a summary and tells you to look at
the testlog.txt file for details. The native jobs on shared runners
publish testlog.txt as an artifact. For the Cirrus jobs and custom
runner jobs this is not currently possible. The best we can do is cat
the log contents on failure, to give maintainers a fighting chance
of diagnosing the problem.

Reviewed-by: Thomas Huth <thuth@redhat.com>
Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
---
 .gitlab-ci.d/cirrus/build.yml                        |  3 ++-
 .../custom-runners/centos-stream-8-x86_64.yml        |  2 ++
 .gitlab-ci.d/custom-runners/ubuntu-20.04-aarch32.yml |  2 ++
 .gitlab-ci.d/custom-runners/ubuntu-20.04-aarch64.yml | 12 ++++++++++++
 .gitlab-ci.d/custom-runners/ubuntu-20.04-s390x.yml   | 12 ++++++++++++
 5 files changed, 30 insertions(+), 1 deletion(-)

diff --git a/.gitlab-ci.d/cirrus/build.yml b/.gitlab-ci.d/cirrus/build.yml
index c555f5d36e..7ef6af8d33 100644
--- a/.gitlab-ci.d/cirrus/build.yml
+++ b/.gitlab-ci.d/cirrus/build.yml
@@ -32,5 +32,6 @@ build_task:
     - $MAKE -j$(sysctl -n hw.ncpu)
     - for TARGET in $TEST_TARGETS ;
       do
-        $MAKE -j$(sysctl -n hw.ncpu) $TARGET V=1 ;
+        $MAKE -j$(sysctl -n hw.ncpu) $TARGET V=1
+        || { cat meson-logs/testlog.txt; exit 1; } ;
       done
diff --git a/.gitlab-ci.d/custom-runners/centos-stream-8-x86_64.yml b/.gitlab-ci.d/custom-runners/centos-stream-8-x86_64.yml
index 49aa703f55..068b0c4335 100644
--- a/.gitlab-ci.d/custom-runners/centos-stream-8-x86_64.yml
+++ b/.gitlab-ci.d/custom-runners/centos-stream-8-x86_64.yml
@@ -23,6 +23,8 @@ centos-stream-8-x86_64:
  - mkdir build
  - cd build
  - ../scripts/ci/org.centos/stream/8/x86_64/configure
+   || { cat config.log meson-logs/meson-log.txt; exit 1; }
  - make -j"$JOBS"
  - make NINJA=":" check
+   || { cat meson-logs/testlog.txt; exit 1; } ;
  - ../scripts/ci/org.centos/stream/8/x86_64/test-avocado
diff --git a/.gitlab-ci.d/custom-runners/ubuntu-20.04-aarch32.yml b/.gitlab-ci.d/custom-runners/ubuntu-20.04-aarch32.yml
index 1998460d06..cbfa9cc164 100644
--- a/.gitlab-ci.d/custom-runners/ubuntu-20.04-aarch32.yml
+++ b/.gitlab-ci.d/custom-runners/ubuntu-20.04-aarch32.yml
@@ -19,5 +19,7 @@ ubuntu-20.04-aarch32-all:
  - mkdir build
  - cd build
  - ../configure --cross-prefix=arm-linux-gnueabihf-
+   || { cat config.log meson-logs/meson-log.txt; exit 1; }
  - make --output-sync -j`nproc --ignore=40`
  - make --output-sync -j`nproc --ignore=40` check V=1
+   || { cat meson-logs/testlog.txt; exit 1; } ;
diff --git a/.gitlab-ci.d/custom-runners/ubuntu-20.04-aarch64.yml b/.gitlab-ci.d/custom-runners/ubuntu-20.04-aarch64.yml
index 65718a188a..3d878914e7 100644
--- a/.gitlab-ci.d/custom-runners/ubuntu-20.04-aarch64.yml
+++ b/.gitlab-ci.d/custom-runners/ubuntu-20.04-aarch64.yml
@@ -17,9 +17,12 @@ ubuntu-20.04-aarch64-all-linux-static:
  - mkdir build
  - cd build
  - ../configure --enable-debug --static --disable-system --disable-glusterfs --disable-libssh
+   || { cat config.log meson-logs/meson-log.txt; exit 1; }
  - make --output-sync -j`nproc --ignore=40`
  - make --output-sync -j`nproc --ignore=40` check V=1
+   || { cat meson-logs/testlog.txt; exit 1; } ;
  - make --output-sync -j`nproc --ignore=40` check-tcg V=1
+   || { cat meson-logs/testlog.txt; exit 1; } ;
 
 ubuntu-20.04-aarch64-all:
  needs: []
@@ -38,8 +41,10 @@ ubuntu-20.04-aarch64-all:
  - mkdir build
  - cd build
  - ../configure --disable-libssh
+   || { cat config.log meson-logs/meson-log.txt; exit 1; }
  - make --output-sync -j`nproc --ignore=40`
  - make --output-sync -j`nproc --ignore=40` check V=1
+   || { cat meson-logs/testlog.txt; exit 1; } ;
 
 ubuntu-20.04-aarch64-alldbg:
  needs: []
@@ -54,9 +59,11 @@ ubuntu-20.04-aarch64-alldbg:
  - mkdir build
  - cd build
  - ../configure --enable-debug --disable-libssh
+   || { cat config.log meson-logs/meson-log.txt; exit 1; }
  - make clean
  - make --output-sync -j`nproc --ignore=40`
  - make --output-sync -j`nproc --ignore=40` check V=1
+   || { cat meson-logs/testlog.txt; exit 1; } ;
 
 ubuntu-20.04-aarch64-clang:
  needs: []
@@ -75,8 +82,10 @@ ubuntu-20.04-aarch64-clang:
  - mkdir build
  - cd build
  - ../configure --disable-libssh --cc=clang-10 --cxx=clang++-10 --enable-sanitizers
+   || { cat config.log meson-logs/meson-log.txt; exit 1; }
  - make --output-sync -j`nproc --ignore=40`
  - make --output-sync -j`nproc --ignore=40` check V=1
+   || { cat meson-logs/testlog.txt; exit 1; } ;
 
 ubuntu-20.04-aarch64-tci:
  needs: []
@@ -95,6 +104,7 @@ ubuntu-20.04-aarch64-tci:
  - mkdir build
  - cd build
  - ../configure --disable-libssh --enable-tcg-interpreter
+   || { cat config.log meson-logs/meson-log.txt; exit 1; }
  - make --output-sync -j`nproc --ignore=40`
 
 ubuntu-20.04-aarch64-notcg:
@@ -114,5 +124,7 @@ ubuntu-20.04-aarch64-notcg:
  - mkdir build
  - cd build
  - ../configure --disable-libssh --disable-tcg
+   || { cat config.log meson-logs/meson-log.txt; exit 1; }
  - make --output-sync -j`nproc --ignore=40`
  - make --output-sync -j`nproc --ignore=40` check V=1
+   || { cat meson-logs/testlog.txt; exit 1; } ;
diff --git a/.gitlab-ci.d/custom-runners/ubuntu-20.04-s390x.yml b/.gitlab-ci.d/custom-runners/ubuntu-20.04-s390x.yml
index 03e74c97db..0c835939db 100644
--- a/.gitlab-ci.d/custom-runners/ubuntu-20.04-s390x.yml
+++ b/.gitlab-ci.d/custom-runners/ubuntu-20.04-s390x.yml
@@ -17,9 +17,12 @@ ubuntu-20.04-s390x-all-linux-static:
  - mkdir build
  - cd build
  - ../configure --enable-debug --static --disable-system --disable-glusterfs --disable-libssh
+   || { cat config.log meson-logs/meson-log.txt; exit 1; }
  - make --output-sync -j`nproc`
  - make --output-sync -j`nproc` check V=1
+   || { cat meson-logs/testlog.txt; exit 1; } ;
  - make --output-sync -j`nproc` check-tcg V=1
+   || { cat meson-logs/testlog.txt; exit 1; } ;
 
 ubuntu-20.04-s390x-all:
  needs: []
@@ -35,8 +38,10 @@ ubuntu-20.04-s390x-all:
  - mkdir build
  - cd build
  - ../configure --disable-libssh
+   || { cat config.log meson-logs/meson-log.txt; exit 1; }
  - make --output-sync -j`nproc`
  - make --output-sync -j`nproc` check V=1
+   || { cat meson-logs/testlog.txt; exit 1; } ;
 
 ubuntu-20.04-s390x-alldbg:
  needs: []
@@ -55,9 +60,11 @@ ubuntu-20.04-s390x-alldbg:
  - mkdir build
  - cd build
  - ../configure --enable-debug --disable-libssh
+   || { cat config.log meson-logs/meson-log.txt; exit 1; }
  - make clean
  - make --output-sync -j`nproc`
  - make --output-sync -j`nproc` check V=1
+   || { cat meson-logs/testlog.txt; exit 1; } ;
 
 ubuntu-20.04-s390x-clang:
  needs: []
@@ -76,8 +83,10 @@ ubuntu-20.04-s390x-clang:
  - mkdir build
  - cd build
  - ../configure --disable-libssh --cc=clang --cxx=clang++ --enable-sanitizers
+   || { cat config.log meson-logs/meson-log.txt; exit 1; }
  - make --output-sync -j`nproc`
  - make --output-sync -j`nproc` check V=1
+   || { cat meson-logs/testlog.txt; exit 1; } ;
 
 ubuntu-20.04-s390x-tci:
  needs: []
@@ -96,6 +105,7 @@ ubuntu-20.04-s390x-tci:
  - mkdir build
  - cd build
  - ../configure --disable-libssh --enable-tcg-interpreter
+   || { cat config.log meson-logs/meson-log.txt; exit 1; }
  - make --output-sync -j`nproc`
 
 ubuntu-20.04-s390x-notcg:
@@ -115,5 +125,7 @@ ubuntu-20.04-s390x-notcg:
  - mkdir build
  - cd build
  - ../configure --disable-libssh --disable-tcg
+   || { cat config.log meson-logs/meson-log.txt; exit 1; }
  - make --output-sync -j`nproc`
  - make --output-sync -j`nproc` check V=1
+   || { cat meson-logs/testlog.txt; exit 1; } ;
-- 
2.36.1


