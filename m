Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C19F538745E
	for <lists+qemu-devel@lfdr.de>; Tue, 18 May 2021 10:49:57 +0200 (CEST)
Received: from localhost ([::1]:46086 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1livQK-0005kM-TR
	for lists+qemu-devel@lfdr.de; Tue, 18 May 2021 04:49:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49660)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1livIQ-0007hs-2d
 for qemu-devel@nongnu.org; Tue, 18 May 2021 04:41:46 -0400
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c]:35551)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1livIO-0005Zv-4e
 for qemu-devel@nongnu.org; Tue, 18 May 2021 04:41:45 -0400
Received: by mail-ed1-x52c.google.com with SMTP id di13so10112698edb.2
 for <qemu-devel@nongnu.org>; Tue, 18 May 2021 01:41:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=B+UfyAyUGiAiWnXT7MW23ziiefpESfd+gUg+NeuudDA=;
 b=mhxgj2Xn8bCbWNuzh3R4tMTSTTEksfjjifbAmvhv1tx9/RvStmNiJClumsWbRhZyFu
 MP+/HevnP7DvtOmNb2kRBVzQPlXV53l8SUmC9RxQgqWnINYVn/YuUnTxNRjHiT+VAL9A
 g3Tp4oC4oYPOuff9+qU/ZET/1KtWpdLrAeaGJLizo5nIHs13esVZjTBhk0NQfCNL+v7i
 p6/BtXjQQu2s7cN03agKUaSNtliFLmYKudUrGOE2dnj73pt0KXbNX4pp3QW6rEZH60AK
 RILTdn6VDL6SJU9SNMzMlqC4wci2EAWe6/AWqcCUgyAoeJ9AhBtaQFPr8XWH+/sCO9yQ
 Dozw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=B+UfyAyUGiAiWnXT7MW23ziiefpESfd+gUg+NeuudDA=;
 b=Idex/85y28VNKXs6+93sDhKGzQvcD9JJyZXbT0MECT4PnTsXU2gPSNKf/FanmZ6ind
 +VOglhQodoMuX/8If4x8uj+STDDOZcEz+tHYei+j2Z6Yct6I3jIsgMzvIH92+a3t9160
 YPQttTu7qt5PKYCOYQG6jI0QczGnMijjYg4sRr/lHjXdFGIPOs5TzSv+XK0PUer9QxZm
 ve32ijFIKJmCHNHATlnf8xQ2Zh9SVZv/YBbIqe0B2dGC5iYqghrfgTGqHB03hCwE8EZE
 wv7XRfSE1pJcEdxFR/Ohma7vJRYbmGvO3VH6uKYuFsJMbl7k97vHVvJfjoL33oYjXI0W
 OUAQ==
X-Gm-Message-State: AOAM53124AC50UFv1tRKxgMjoU0W3HwvYk4qXKQHKgTUu7G5PqGgfgle
 yDnQBYEMx2zZM+YdJ0HdXmQbPVNyLKKiDQ==
X-Google-Smtp-Source: ABdhPJxS/bhWlTuZMoNWXPSLsMqDvM9wc7fisD+leMe2irjcnjCk8yXB2oUaoNp8dFGaVjLumSYtpQ==
X-Received: by 2002:a05:6402:652:: with SMTP id
 u18mr5689688edx.388.1621327302786; 
 Tue, 18 May 2021 01:41:42 -0700 (PDT)
Received: from avogadro.redhat.com ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id
 d7sm9851917ejk.55.2021.05.18.01.41.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 May 2021 01:41:42 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 3/3] ci: add -j to all "make" jobs
Date: Tue, 18 May 2021 10:41:39 +0200
Message-Id: <20210518084139.97957-4-pbonzini@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210518084139.97957-1-pbonzini@redhat.com>
References: <20210518084139.97957-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52c;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x52c.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: alex.bennee@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Run the tests in parallel, as that can greatly speed up the jobs.
"meson test" is able to report failures to the terminal in a way
that is readable enough even when tests are run in parallel.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 .cirrus.yml    | 18 +++++++++---------
 .gitlab-ci.yml |  8 ++++----
 .travis.yml    | 10 +++++-----
 3 files changed, 18 insertions(+), 18 deletions(-)

diff --git a/.cirrus.yml b/.cirrus.yml
index 340fd395c0..fcf0f34a4c 100644
--- a/.cirrus.yml
+++ b/.cirrus.yml
@@ -32,11 +32,11 @@ macos_task:
                    --extra-cflags='-Wno-error=deprecated-declarations'
                    || { cat config.log meson-logs/meson-log.txt; exit 1; }
     - gmake -j$(sysctl -n hw.ncpu)
-    - gmake check-unit V=1
+    - gmake -j$(sysctl -n hw.ncpu) check-unit V=1
     - gmake check-block V=1
-    - gmake check-qapi-schema V=1
-    - gmake check-softfloat V=1
-    - gmake check-qtest-x86_64 V=1
+    - gmake -j$(sysctl -n hw.ncpu) check-qapi-schema V=1
+    - gmake -j$(sysctl -n hw.ncpu) check-softfloat V=1
+    - gmake -j$(sysctl -n hw.ncpu) check-qtest-x86_64 V=1
     - gmake install DESTDIR=$PWD/destdir
 
 macos_xcode_task:
@@ -51,11 +51,11 @@ macos_xcode_task:
     - ../configure --extra-cflags='-Wno-error=deprecated-declarations' --enable-modules --disable-strip
                    --enable-werror --cc=clang || { cat config.log meson-logs/meson-log.txt; exit 1; }
     - gmake -j$(sysctl -n hw.ncpu)
-    - gmake check-unit V=1
+    - gmake -j$(sysctl -n hw.ncpu) check-unit V=1
     - gmake check-block V=1
-    - gmake check-qapi-schema V=1
-    - gmake check-softfloat V=1
-    - gmake check-qtest-x86_64 V=1
+    - gmake -j$(sysctl -n hw.ncpu) check-qapi-schema V=1
+    - gmake -j$(sysctl -n hw.ncpu) check-softfloat V=1
+    - gmake -j$(sysctl -n hw.ncpu) check-qtest-x86_64 V=1
     - gmake install DESTDIR=$PWD/destdir
 
 windows_msys2_task:
@@ -163,5 +163,5 @@ windows_msys2_task:
     - C:\tools\msys64\usr\bin\bash.exe -lc "cd build && make -j8"
     - exit $LastExitCode
   test_script:
-    - C:\tools\msys64\usr\bin\bash.exe -lc "cd build && make V=1 check"
+    - C:\tools\msys64\usr\bin\bash.exe -lc "cd build && make -j4 V=1 check"
     - exit $LastExitCode
diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index 3f0d86cf0a..4c0cc47c25 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -50,7 +50,7 @@ include:
     - cd build
     - find . -type f -exec touch {} +
     # Avoid recompiling by hiding ninja with NINJA=":"
-    - make NINJA=":" $MAKE_CHECK_ARGS
+    - make -j"$JOBS" NINJA=":" $MAKE_CHECK_ARGS
 
 .meson_test_template: &meson_test_definition
   artifacts:
@@ -402,8 +402,8 @@ build-tcg-disabled:
     - ../configure --disable-tcg --audio-drv-list="" --with-coroutine=ucontext
       || { cat config.log meson-logs/meson-log.txt && exit 1; }
     - make -j"$JOBS"
-    - make check-unit
-    - make check-qapi-schema
+    - make check-unit -j"$JOBS"
+    - make check-qapi-schema -j"$JOBS"
     - cd tests/qemu-iotests/
     - ./check -raw 001 002 003 004 005 008 009 010 011 012 021 025 032 033 048
             052 063 077 086 101 104 106 113 148 150 151 152 157 159 160 163
@@ -689,7 +689,7 @@ build-oss-fuzz:
         "${fuzzer}" -runs=1 -seed=1 || exit 1 ;
       done
     # Unrelated to fuzzer: run some tests with -fsanitize=address
-    - cd build-oss-fuzz && make check-qtest-i386 check-unit MTESTARGS="-t 2"
+    - cd build-oss-fuzz && make check-qtest-i386 check-unit -j"$JOBS" MTESTARGS="-t 2"
 
 build-tci:
   extends: .native_build_job_template
diff --git a/.travis.yml b/.travis.yml
index 4609240b5a..42e8f0b348 100644
--- a/.travis.yml
+++ b/.travis.yml
@@ -73,7 +73,7 @@ env:
     - BUILD_DIR="build"
     - BASE_CONFIG="--disable-docs --disable-tools"
     - TEST_BUILD_CMD=""
-    - TEST_CMD="make check V=1"
+    - TEST_CMD="make check -j${JOBS} V=1"
     # This is broadly a list of "mainline" softmmu targets which have support across the major distros
     - MAIN_SOFTMMU_TARGETS="aarch64-softmmu,mips64-softmmu,ppc64-softmmu,riscv64-softmmu,s390x-softmmu,x86_64-softmmu"
     - CCACHE_SLOPPINESS="include_file_ctime,include_file_mtime"
@@ -151,7 +151,7 @@ jobs:
           # Tests dependencies
           - genisoimage
       env:
-        - TEST_CMD="make check check-tcg V=1"
+        - TEST_CMD="make check check-tcg -j${JOBS} V=1"
         - CONFIG="--disable-containers --target-list=${MAIN_SOFTMMU_TARGETS} --cxx=/bin/false"
         - UNRELIABLE=true
 
@@ -185,7 +185,7 @@ jobs:
           # Tests dependencies
           - genisoimage
       env:
-        - TEST_CMD="make check check-tcg V=1"
+        - TEST_CMD="make check check-tcg -j${JOBS} V=1"
         - CONFIG="--disable-containers --target-list=ppc64-softmmu,ppc64le-linux-user"
 
     - name: "[s390x] GCC check-tcg"
@@ -218,7 +218,7 @@ jobs:
           # Tests dependencies
           - genisoimage
       env:
-        - TEST_CMD="make check check-tcg V=1"
+        - TEST_CMD="make check check-tcg -j${JOBS} V=1"
         - CONFIG="--disable-containers --target-list=${MAIN_SOFTMMU_TARGETS},s390x-linux-user"
         - UNRELIABLE=true
       script:
@@ -301,7 +301,7 @@ jobs:
           - libvte-2.91-dev
           - ninja-build
       env:
-        - TEST_CMD="make check-unit"
+        - TEST_CMD="make check-unit -j${JOBS}"
         - CONFIG="--disable-containers --disable-tcg --enable-kvm
                   --disable-tools --host-cc=clang --cxx=clang++"
         - UNRELIABLE=true
-- 
2.31.1


