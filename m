Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6182958008D
	for <lists+qemu-devel@lfdr.de>; Mon, 25 Jul 2022 16:15:11 +0200 (CEST)
Received: from localhost ([::1]:55710 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oFyrW-00058Y-Gk
	for lists+qemu-devel@lfdr.de; Mon, 25 Jul 2022 10:15:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47724)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oFyi9-0000re-SA
 for qemu-devel@nongnu.org; Mon, 25 Jul 2022 10:05:31 -0400
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335]:43602)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oFyi6-0000Ei-K8
 for qemu-devel@nongnu.org; Mon, 25 Jul 2022 10:05:29 -0400
Received: by mail-wm1-x335.google.com with SMTP id
 j29-20020a05600c1c1d00b003a2fdafdefbso6431079wms.2
 for <qemu-devel@nongnu.org>; Mon, 25 Jul 2022 07:05:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=bM/w8+B7ncjv5XtvNRo9ixZZ47c0W7NUiHr8jF0XJI4=;
 b=ZkkkWPrS4rtAqbK9HDEmqIBZXIyIK59VPM/PiMhW0b5EHcpb6e/OqtghYYjNt1MWTo
 ClppAtYh3Ix7PMFaIF6U1hz/ae/rwqDOT2N/tf2YDG/BBbesLkjmDt6GPxQGwC+MTUqY
 YIX+oRo/s/huvdAv2ayFL59OXmer3rSaWKqxzzly0SwP7sj/oa6/qA6YRm0mb6KIEZ/l
 l0YQj/8DvWyE6uGoUto+QlauWQu915Vii5MyBfkHqgz3t34lHCHotXURjfWYZUt897h7
 9J+j+XhCj0C4cqwAFPI1NUZI7fgJtasSMdX0RWXDNYYZ24/wwwwxBM+L/JRx5uxCECIE
 ssFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=bM/w8+B7ncjv5XtvNRo9ixZZ47c0W7NUiHr8jF0XJI4=;
 b=LV8AbgZ3HpuSNB/AMI0KVMKTb4LOCaRwdwYmUgLv3ClsJkyEIb9xZGTDv1aB3InR5P
 MXvjg942TFgdrbA/NCFaCdn+6AYS301wmaZgrTYPSlXwDYXKwJ2hiHyRrd0sFNZbaAQc
 bNT5Vxd5qTnAvJ8/Muupp9LH1NAIJipjXZq6TVz0ABdYSypaxIx+JhDmQSgfl/XNs52i
 Puu5AQm6/g+W64jCFjhPKv00Fro4VeHMXNpsrmBkP6prDifL3R6kzrmZCYb9qa66nteo
 vRTiwl5Whz+INUo7MrcaDjsQ88h+9mtV2idIwUf9d7ryLbrD+hGwxQNUoE5TXG+a6MNe
 ocuA==
X-Gm-Message-State: AJIora/OaSrhZKL2D1kfkMDmPxkHj10j9fAR39L+DHHY1oz1Qas9kVAC
 tMrB1pSEoPCbD5z+QjcE7BUGtQ==
X-Google-Smtp-Source: AGRyM1urbkIwaFA121M/94cxATqRVKbVxBe5Exb/BIgnk1L02CjiAF88y7PPr6PbXzmFM1njF/Cfwg==
X-Received: by 2002:a05:600c:148:b0:3a3:2753:e551 with SMTP id
 w8-20020a05600c014800b003a32753e551mr21396132wmm.131.1658757925036; 
 Mon, 25 Jul 2022 07:05:25 -0700 (PDT)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 l37-20020a05600c1d2500b003a33227e49bsm14606414wms.4.2022.07.25.07.05.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 25 Jul 2022 07:05:21 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id CCEDE1FFBA;
 Mon, 25 Jul 2022 15:05:20 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: fam@euphon.net, berrange@redhat.com, f4bug@amsat.org, aurelien@aurel32.net,
 pbonzini@redhat.com, stefanha@redhat.com, crosa@redhat.com,
 peter.maydell@linaro.org, Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>
Subject: [PATCH v1 02/13] gitlab: show testlog.txt contents when
 cirrus/custom-runner jobs fail
Date: Mon, 25 Jul 2022 15:05:09 +0100
Message-Id: <20220725140520.515340-3-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220725140520.515340-1-alex.bennee@linaro.org>
References: <20220725140520.515340-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x335.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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

From: Daniel P. Berrangé <berrange@redhat.com>

When tests fail meson just displays a summary and tells you to look at
the testlog.txt file for details. The native jobs on shared runners
publish testlog.txt as an artifact. For the Cirrus jobs and custom
runner jobs this is not currently possible. The best we can do is cat
the log contents on failure, to give maintainers a fighting chance
of diagnosing the problem.

Reviewed-by: Thomas Huth <thuth@redhat.com>
Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
Message-Id: <20220722130431.2319019-3-berrange@redhat.com>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
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
2.30.2


