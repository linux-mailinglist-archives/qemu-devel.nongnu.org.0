Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BC33A31E16A
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Feb 2021 22:33:38 +0100 (CET)
Received: from localhost ([::1]:33590 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lCUS1-0001ca-IV
	for lists+qemu-devel@lfdr.de; Wed, 17 Feb 2021 16:33:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33896)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lCTNB-0002FA-Dk
 for qemu-devel@nongnu.org; Wed, 17 Feb 2021 15:24:39 -0500
Received: from mail-pf1-x430.google.com ([2607:f8b0:4864:20::430]:44880)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lCTN8-0007qa-89
 for qemu-devel@nongnu.org; Wed, 17 Feb 2021 15:24:33 -0500
Received: by mail-pf1-x430.google.com with SMTP id t29so9156473pfg.11
 for <qemu-devel@nongnu.org>; Wed, 17 Feb 2021 12:24:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=sOfLAVkLgg63RmxbpsuuYlLjEnk78TrO9DvNZg7MM0M=;
 b=KpEDhHjJU1fEaPrRmgNhVvzuhtX94/lEiSJlVG3LnJCakS0Jm24kMlIgWWlROa9NoT
 eTAnhnJEi8QUAYTkDGsL1NI7z/fe5GCR5sh3K26qSUnXUbePGlotysGaNNvlZMzqdYyt
 zKA53XySDymb9+mcGeUib75l/KlH7a3OeAyMq2uANDviRCQOV17Ssu8IBvJo344MC3nR
 GRTvVS/hBC8W2x+ebQNmBMMajsiS/d1FAtQFkC37ENmaCJzzYF5+YL/6j8eXpPOTuTD6
 fFODUx2p0bjiMMktV3gDLMSAkZiWcd4hLAm2fOFWEgiXuIV7t7F2umAICTwH3xQ5JYee
 umvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=sOfLAVkLgg63RmxbpsuuYlLjEnk78TrO9DvNZg7MM0M=;
 b=Uo86jXponE4rZoynRUIXUPq10Vc48JEx0DqQl4WVieJ2CD1VP2hLwuZDGx7aNYTISn
 gyHH0sl/qZSUAYy0WibrV9rPsqSeoPiN9KWJAK5g9aD4viMMS8ykXrQJxCGlVOU2I11e
 c5rHon/x8KNVTC0tSKPYbxw3tsd8AvR/AshQAx0NcXHHgHmOHQvvgGdMwnLXHG0PpKmX
 lUt/+YxpR8LtXYjMSsKCMpMmkHqgeliGOKT2Rkie6FmwKimY/N++7VY04XXceJFnjb6m
 q0G///UI99tFAZK6+BB5chZ727kYFFVsdVuWSdbINvr2kXQNfyQz2NpKHQVs7zgStwQ4
 RoPg==
X-Gm-Message-State: AOAM533xajCXVr0cMQhpupWBxnyxb0P8IKtCVrOwW9609+BNTRGFd3aD
 meKJT8LxIxPOejxTYCCOC0FZTt6wHVL5Kg==
X-Google-Smtp-Source: ABdhPJxsscCg3/VGNKmmXy7fGgpVJMNSORBIDUAU8/B9KrH2RXOFIsoZIGfTFJv+eposhwp4RoG5vg==
X-Received: by 2002:a62:cf83:0:b029:1ec:df4e:d66a with SMTP id
 b125-20020a62cf830000b02901ecdf4ed66amr935172pfg.5.1613593468967; 
 Wed, 17 Feb 2021 12:24:28 -0800 (PST)
Received: from localhost.localdomain (047-051-160-125.biz.spectrum.com.
 [47.51.160.125])
 by smtp.gmail.com with ESMTPSA id v126sm3232038pfv.163.2021.02.17.12.24.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 Feb 2021 12:24:28 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 71/71] gitlab: Enable cross-i386 builds of TCI
Date: Wed, 17 Feb 2021 12:20:36 -0800
Message-Id: <20210217202036.1724901-72-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210217202036.1724901-1-richard.henderson@linaro.org>
References: <20210217202036.1724901-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::430;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x430.google.com
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
Cc: sw@weilnetz.de, alex.bennee@linaro.org, f4bug@amsat.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We're currently only testing TCI with a 64-bit host -- also test
with a 32-bit host.  Enable a selection of softmmu and user-only
targets, 32-bit LE, 64-bit LE, 32-bit BE, as there are ifdefs for each.

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
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


