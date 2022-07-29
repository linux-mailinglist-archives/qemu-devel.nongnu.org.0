Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8288B584E09
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Jul 2022 11:31:11 +0200 (CEST)
Received: from localhost ([::1]:40274 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oHMKs-0000x9-He
	for lists+qemu-devel@lfdr.de; Fri, 29 Jul 2022 05:31:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44166)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oHM9w-0002Ui-Mz
 for qemu-devel@nongnu.org; Fri, 29 Jul 2022 05:19:53 -0400
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d]:38753)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oHM9t-0005s1-Fo
 for qemu-devel@nongnu.org; Fri, 29 Jul 2022 05:19:52 -0400
Received: by mail-wr1-x42d.google.com with SMTP id k8so3091346wrd.5
 for <qemu-devel@nongnu.org>; Fri, 29 Jul 2022 02:19:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=9TB20DlqBprHHxxOekwwN1RvvKSvZYxOn7yLSPiI1qg=;
 b=Od7oE8RQCzDn3L0XR6GX6D/MyLuZ4nEQIq0ikjYPOvqdEDQiUY2NjqQIax+3WyzY14
 tkldi5kRx31j/n+rpuXSYCddOa8MziNQllLwRwvlt3hDiSc9mn/OHQ9CR49tE49eB+xE
 24/SN87M0hP2yqtlzBh24MTVt4zbPkDNNWnPgGYfBMSCSgD0efs9USEd092rUh/4tKD6
 7qQzoSv58OMp0XO6VFSOpQZyIjhuG8TWPHdQBvUpNfUoudIen026QuGrgJPRcaIhFckR
 meFQEJLUYmn4PsQj0ZMlGDt0k0sq84IyGU7MPV0XOIOkXIc+EubyhP3v4KkFzKfb2u8q
 hR2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=9TB20DlqBprHHxxOekwwN1RvvKSvZYxOn7yLSPiI1qg=;
 b=5sXX3cBXBHQKDA1hun2aADLNFN9oir/c7wm4LgrKpBTE3VwQzSO2O2kIQiemQPcuwj
 u7RRXyx5DKfTDKKtM6XRXdQdZYmI4XJoZb/NlSFGljpQAQ9GOG6XDZZErzfPiJ4yXrEl
 53ks9dpSSR9oskdZOfRqUNouEs5Z28inruJL2aHfzjISxbNvPRnVOWRB5bq2wadj9LWC
 SOAq65IoNiuqKkgMIkrcGmky+RtDE1O366fKrO8ElHXAj+2O2y6cR2xiXj96ojWFxXJU
 qZaZjNUKagqkPMjKqaPdUcDX6+r8rbHfOCkraHiqgLu0GdIyZ6jzrYCG1ovIcYuUFlfq
 9egQ==
X-Gm-Message-State: ACgBeo0dLsBVuzgMrK22Af0Kpg1TqqNKi8khsyjVt0NhhQO8lyP9cBKu
 y9OO7gI2oUUYnpU8vM2Zj9wutw==
X-Google-Smtp-Source: AA6agR7/txvfuCA/vF4YisY7yG9PfFYpvRtILFr37gD0bMqXty51hneBZ846WY6s44HyCzcxmKc+/Q==
X-Received: by 2002:a05:6000:1542:b0:21e:9018:f648 with SMTP id
 2-20020a056000154200b0021e9018f648mr1773201wry.160.1659086387251; 
 Fri, 29 Jul 2022 02:19:47 -0700 (PDT)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 l13-20020a5d668d000000b0021d63fe0f03sm3127823wru.12.2022.07.29.02.19.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 Jul 2022 02:19:45 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 0E13C1FFBA;
 Fri, 29 Jul 2022 10:19:44 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: peter.maydell@linaro.org,
	richard.henderson@linaro.org
Cc: qemu-devel@nongnu.org,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>
Subject: [PULL 02/13] gitlab: show testlog.txt contents when
 cirrus/custom-runner jobs fail
Date: Fri, 29 Jul 2022 10:19:32 +0100
Message-Id: <20220729091943.2152410-3-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220729091943.2152410-1-alex.bennee@linaro.org>
References: <20220729091943.2152410-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42d.google.com
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
Message-Id: <20220725140520.515340-3-alex.bennee@linaro.org>

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


