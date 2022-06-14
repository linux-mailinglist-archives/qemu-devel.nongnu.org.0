Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A1EA054A34C
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Jun 2022 02:54:37 +0200 (CEST)
Received: from localhost ([::1]:48262 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o0upI-0005aV-NG
	for lists+qemu-devel@lfdr.de; Mon, 13 Jun 2022 20:54:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48690)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1o0udS-0008QK-R5
 for qemu-devel@nongnu.org; Mon, 13 Jun 2022 20:42:24 -0400
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432]:44873)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1o0udR-00054D-99
 for qemu-devel@nongnu.org; Mon, 13 Jun 2022 20:42:22 -0400
Received: by mail-wr1-x432.google.com with SMTP id q15so9034803wrc.11
 for <qemu-devel@nongnu.org>; Mon, 13 Jun 2022 17:42:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=6W2OhkT13Bqd3qEKUsCAt2ot9YsgaiLRb6IaOc9KPSA=;
 b=UeG9Ku5KpZ/yAKj8SXk5xkzo/hbGVflEGRuvPWENoZ8f0fX4hczfVEnmVrKbHiyzDc
 7IFbx/Nu3Y8BciPjZeMH3EKJRabiq9/A8koqcE08nhZXeiwNFKz6XpAhCWtnxy5pw5Zd
 t1mUdLFaNKFea5PBF2K/O1Pdp32l2cICQidAp7RY2+6C+n9LRlR6DZZKtwj7BATfCUEd
 5FD8B7jgEBFHL6T8dXSSXPSSo5nOMkvNgnDfGu2rrjulhlyDs/ujeIeicfZmG35D4IkZ
 rRpXrnnwzoVxgJFFvBT+DJIPm0jgUTJv/fMmYWZlXdtrdZ3C0q4H4rnci4w3hl6DOpUj
 FaXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=6W2OhkT13Bqd3qEKUsCAt2ot9YsgaiLRb6IaOc9KPSA=;
 b=ZChYhDLnMeEonKHrSiomIGHgJstPlRkocCNkt9h2GAN49Fcv9mV3gZsvZNk1CeJGt2
 sm6+vqeuUTG08gYs+5Ui0DDkShpLP5CFg+errUktP8LR/kxT0us99f3lXPPOz5B+EYTW
 sEJ9N0HGvbZ05HaLN/aIDIALDrXggHJHotTHwSp3t6eN2xJ1pXq1VK+7NEO0mleruMwu
 xNi5YljAkjngHfhDzDX5HUwp98inmenrGoJAQi4Qe7cA+Q1Z3BXcra5onM0/KtzBMgl/
 Np7kwDGRbQgy/Caw/3mu4jyp2+4D3SgihiuoFcYFnnwtzGy3Qi0addvg19E8xwUAW2aM
 AiqA==
X-Gm-Message-State: AJIora+k2HRVnUN2TtcROfDGtfYEj/8nOoL0cBZj+VyvXo14DoUHr6LL
 z3ul97zWYl5Yol1YKmxHKa7Zzw==
X-Google-Smtp-Source: AGRyM1utKRkmJaM7j9T3SKNJye3zD77UPWRfrmC9YBHY+c/I/3K5N8QIIYjqYEYPjXs/YvEqnzABaQ==
X-Received: by 2002:a05:6000:1883:b0:205:c0cb:33c6 with SMTP id
 a3-20020a056000188300b00205c0cb33c6mr2198894wri.39.1655167339508; 
 Mon, 13 Jun 2022 17:42:19 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id
 o6-20020a05600c510600b0039748be12dbsm15802228wms.47.2022.06.13.17.42.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Jun 2022 17:42:15 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 9D6FF1FFBF;
 Tue, 14 Jun 2022 01:42:09 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: peter.maydell@linaro.org,
	richard.henderson@linaro.org
Cc: qemu-devel@nongnu.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Thomas Huth <thuth@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>
Subject: [PULL 7/7] .gitlab: use less aggressive nproc on our aarch64/32
 runners
Date: Tue, 14 Jun 2022 01:42:09 +0100
Message-Id: <20220614004209.1970284-8-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220614004209.1970284-1-alex.bennee@linaro.org>
References: <20220614004209.1970284-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x432.google.com
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

Running on all 80 cores of our aarch64 runner does occasionally
trigger a race condition which fails the build. However the CI system
is not the time and place to play with much heisenbugs so turn down
the nproc to "only" use 40 cores in the build.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Tested-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-Id: <20220613171258.1905715-8-alex.bennee@linaro.org>

diff --git a/.gitlab-ci.d/custom-runners/ubuntu-20.04-aarch32.yml b/.gitlab-ci.d/custom-runners/ubuntu-20.04-aarch32.yml
index 47856ac53c..1998460d06 100644
--- a/.gitlab-ci.d/custom-runners/ubuntu-20.04-aarch32.yml
+++ b/.gitlab-ci.d/custom-runners/ubuntu-20.04-aarch32.yml
@@ -19,5 +19,5 @@ ubuntu-20.04-aarch32-all:
  - mkdir build
  - cd build
  - ../configure --cross-prefix=arm-linux-gnueabihf-
- - make --output-sync -j`nproc`
- - make --output-sync -j`nproc` check V=1
+ - make --output-sync -j`nproc --ignore=40`
+ - make --output-sync -j`nproc --ignore=40` check V=1
diff --git a/.gitlab-ci.d/custom-runners/ubuntu-20.04-aarch64.yml b/.gitlab-ci.d/custom-runners/ubuntu-20.04-aarch64.yml
index 951e490db1..65718a188a 100644
--- a/.gitlab-ci.d/custom-runners/ubuntu-20.04-aarch64.yml
+++ b/.gitlab-ci.d/custom-runners/ubuntu-20.04-aarch64.yml
@@ -17,9 +17,9 @@ ubuntu-20.04-aarch64-all-linux-static:
  - mkdir build
  - cd build
  - ../configure --enable-debug --static --disable-system --disable-glusterfs --disable-libssh
- - make --output-sync -j`nproc`
- - make --output-sync -j`nproc` check V=1
- - make --output-sync -j`nproc` check-tcg V=1
+ - make --output-sync -j`nproc --ignore=40`
+ - make --output-sync -j`nproc --ignore=40` check V=1
+ - make --output-sync -j`nproc --ignore=40` check-tcg V=1
 
 ubuntu-20.04-aarch64-all:
  needs: []
@@ -38,8 +38,8 @@ ubuntu-20.04-aarch64-all:
  - mkdir build
  - cd build
  - ../configure --disable-libssh
- - make --output-sync -j`nproc`
- - make --output-sync -j`nproc` check V=1
+ - make --output-sync -j`nproc --ignore=40`
+ - make --output-sync -j`nproc --ignore=40` check V=1
 
 ubuntu-20.04-aarch64-alldbg:
  needs: []
@@ -55,8 +55,8 @@ ubuntu-20.04-aarch64-alldbg:
  - cd build
  - ../configure --enable-debug --disable-libssh
  - make clean
- - make --output-sync -j`nproc`
- - make --output-sync -j`nproc` check V=1
+ - make --output-sync -j`nproc --ignore=40`
+ - make --output-sync -j`nproc --ignore=40` check V=1
 
 ubuntu-20.04-aarch64-clang:
  needs: []
@@ -75,8 +75,8 @@ ubuntu-20.04-aarch64-clang:
  - mkdir build
  - cd build
  - ../configure --disable-libssh --cc=clang-10 --cxx=clang++-10 --enable-sanitizers
- - make --output-sync -j`nproc`
- - make --output-sync -j`nproc` check V=1
+ - make --output-sync -j`nproc --ignore=40`
+ - make --output-sync -j`nproc --ignore=40` check V=1
 
 ubuntu-20.04-aarch64-tci:
  needs: []
@@ -95,7 +95,7 @@ ubuntu-20.04-aarch64-tci:
  - mkdir build
  - cd build
  - ../configure --disable-libssh --enable-tcg-interpreter
- - make --output-sync -j`nproc`
+ - make --output-sync -j`nproc --ignore=40`
 
 ubuntu-20.04-aarch64-notcg:
  needs: []
@@ -114,5 +114,5 @@ ubuntu-20.04-aarch64-notcg:
  - mkdir build
  - cd build
  - ../configure --disable-libssh --disable-tcg
- - make --output-sync -j`nproc`
- - make --output-sync -j`nproc` check V=1
+ - make --output-sync -j`nproc --ignore=40`
+ - make --output-sync -j`nproc --ignore=40` check V=1
-- 
2.30.2


