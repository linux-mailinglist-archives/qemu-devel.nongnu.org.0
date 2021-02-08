Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C10C631295D
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Feb 2021 04:31:51 +0100 (CET)
Received: from localhost ([::1]:33980 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l8xHC-0005kV-Mq
	for lists+qemu-devel@lfdr.de; Sun, 07 Feb 2021 22:31:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58672)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l8wSs-0003Jr-2i
 for qemu-devel@nongnu.org; Sun, 07 Feb 2021 21:39:50 -0500
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429]:38458)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l8wSq-0006Gn-A2
 for qemu-devel@nongnu.org; Sun, 07 Feb 2021 21:39:49 -0500
Received: by mail-pf1-x429.google.com with SMTP id d26so7525204pfn.5
 for <qemu-devel@nongnu.org>; Sun, 07 Feb 2021 18:39:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=wEpSveRBqQxH9QCIh+2wXIVlcJM9/sJDV4z9gEqJssk=;
 b=RgdofgZ2++BadXux44Uy10k/X2YD042pBdjkPDajA06TSut4D4DGD9IUAkDl4N4+R0
 ciuVUbwr7P1EvYiEDucq6+dX5v8a2riM44BIKYWVqMu3GAMhIiz9sVamFUknkSOsiajA
 TC2CjQpxJyVRcRhfIEaO7eYcGK1C0g6xytMYPiWJUCIvm4kQGl6Fm4ruSOKZkecth1Vu
 50fkpAahL5AbbB4iqSwHVm1Fv9psNSs8u5HFgNqxFuaUt/RHT+Xw0tajeSJWcQelw24g
 hX9C0J5xRarcne37EplNGNUyR9CH6yJCPDGFN22PZ0MkmUsmQJDdcyaKp5poi3Hq3YPO
 nENg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=wEpSveRBqQxH9QCIh+2wXIVlcJM9/sJDV4z9gEqJssk=;
 b=t+DeEB3Ews5RmwSHBG5NEU3Mr7Uq+/gpkvwXOJSUmnF4PrNq9Eqw02Y43kVcI+MoEj
 NEkMPt+brkI1J0eH7Q6Sm8Qyuq21lsulhEfbWVzDX6hxUJZB6/MDqqTd6uXKjXCJZlc9
 /ANdys2RhsssyE0szCS2qcr2Icc4Y5bH5BiSHKIKtaaAG3PAXAyq7oVWRcBHBB+NVV3A
 N8ek86ag7TY5WGwLGJYdJUqC0yIXWpSzXJ56EQNR45AQLGMqZEPHB4RADTmCh5Kmp17o
 TYuor5b2pT3gwiex6Zxo/jYXcNGHxG55HYbXrTnu2RmU6hZRgVlwi+LdZzZBkR14tAC8
 N0ng==
X-Gm-Message-State: AOAM533hOdS+n/U2qfWiw1EwoGybMiZG1yPiRXVURqMnjG70RK4DS5hu
 t4dBEsJ3D1063S90QUB7Dencl5bv25WHYQ==
X-Google-Smtp-Source: ABdhPJxU2YtsSvb2fPsIP0C9XYiNpq7HyCyjYO+F37enGOend2US457A1mUR+V2f0cckcoHSwsqZoQ==
X-Received: by 2002:a62:d446:0:b029:1d2:8347:9db9 with SMTP id
 u6-20020a62d4460000b02901d283479db9mr15846816pfl.22.1612751987062; 
 Sun, 07 Feb 2021 18:39:47 -0800 (PST)
Received: from localhost.localdomain (174-21-150-71.tukw.qwest.net.
 [174.21.150.71])
 by smtp.gmail.com with ESMTPSA id 74sm650954pfw.53.2021.02.07.18.39.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 07 Feb 2021 18:39:46 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 70/70] gitlab: Enable cross-i386 builds of TCI
Date: Sun,  7 Feb 2021 18:37:52 -0800
Message-Id: <20210208023752.270606-71-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210208023752.270606-1-richard.henderson@linaro.org>
References: <20210208023752.270606-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::429;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x429.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: sw@weilnetz.de
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We're currently only testing TCI with a 64-bit host -- also test
with a 32-bit host.  Enable a selection of softmmu and user-only
targets, 32-bit LE, 64-bit LE, 32-bit BE, as there are ifdefs for each.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 .gitlab-ci.d/crossbuilds.yml                    | 17 ++++++++++++++---
 .../docker/dockerfiles/fedora-i386-cross.docker |  1 +
 2 files changed, 15 insertions(+), 3 deletions(-)

diff --git a/.gitlab-ci.d/crossbuilds.yml b/.gitlab-ci.d/crossbuilds.yml
index 66547b6683..99300f786b 100644
--- a/.gitlab-ci.d/crossbuilds.yml
+++ b/.gitlab-ci.d/crossbuilds.yml
@@ -6,7 +6,8 @@
     - mkdir build
     - cd build
     - PKG_CONFIG_PATH=$PKG_CONFIG_PATH
-      ../configure --enable-werror $QEMU_CONFIGURE_OPTS --disable-user
+      ../configure --enable-werror $QEMU_CONFIGURE_OPTS $ACCEL_CONFIGURE_OPTS
+        --disable-user
         --target-list-exclude="arm-softmmu cris-softmmu i386-softmmu
           microblaze-softmmu mips-softmmu mipsel-softmmu mips64-softmmu
           ppc-softmmu sh4-softmmu xtensa-softmmu"
@@ -27,7 +28,7 @@
     - PKG_CONFIG_PATH=$PKG_CONFIG_PATH
       ../configure --enable-werror $QEMU_CONFIGURE_OPTS --disable-tools
         --enable-${ACCEL:-kvm} $ACCEL_CONFIGURE_OPTS
-    - make -j$(expr $(nproc) + 1) all check-build
+    - make -j$(expr $(nproc) + 1) all check-build $MAKE_CHECK_ARGS
 
 .cross_user_build_job:
   stage: build
@@ -36,7 +37,8 @@
     - mkdir build
     - cd build
     - PKG_CONFIG_PATH=$PKG_CONFIG_PATH
-      ../configure --enable-werror $QEMU_CONFIGURE_OPTS --disable-system
+      ../configure --enable-werror $QEMU_CONFIGURE_OPTS $ACCEL_CONFIGURE_OPTS
+        --disable-system
     - make -j$(expr $(nproc) + 1) all check-build $MAKE_CHECK_ARGS
 
 cross-armel-system:
@@ -81,6 +83,15 @@ cross-i386-user:
     IMAGE: fedora-i386-cross
     MAKE_CHECK_ARGS: check
 
+cross-i386-tci:
+  extends: .cross_accel_build_job
+  timeout: 60m
+  variables:
+    IMAGE: fedora-i386-cross
+    ACCEL: tcg-interpreter
+    ACCEL_CONFIGURE_OPTS: --target-list=i386-softmmu,i386-linux-user,aarch64-softmmu,aarch64-linux-user,ppc-softmmu,ppc-linux-user
+    MAKE_CHECK_ARGS: check
+
 cross-mips-system:
   extends: .cross_system_build_job
   variables:
diff --git a/tests/docker/dockerfiles/fedora-i386-cross.docker b/tests/docker/dockerfiles/fedora-i386-cross.docker
index a6e411291b..aa66314c65 100644
--- a/tests/docker/dockerfiles/fedora-i386-cross.docker
+++ b/tests/docker/dockerfiles/fedora-i386-cross.docker
@@ -5,6 +5,7 @@ ENV PACKAGES \
     findutils \
     gcc \
     git \
+    libffi-devel.i686 \
     libtasn1-devel.i686 \
     libzstd-devel.i686 \
     make \
-- 
2.25.1


