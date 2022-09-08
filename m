Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EB0D75B1F68
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Sep 2022 15:41:08 +0200 (CEST)
Received: from localhost ([::1]:48300 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oWHmG-0005Nb-2S
	for lists+qemu-devel@lfdr.de; Thu, 08 Sep 2022 09:41:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55084)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1oWHaF-0004kA-CN
 for qemu-devel@nongnu.org; Thu, 08 Sep 2022 09:28:43 -0400
Received: from mail-pg1-x533.google.com ([2607:f8b0:4864:20::533]:37729)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1oWHaD-0002cX-Oz
 for qemu-devel@nongnu.org; Thu, 08 Sep 2022 09:28:43 -0400
Received: by mail-pg1-x533.google.com with SMTP id bh13so16774658pgb.4
 for <qemu-devel@nongnu.org>; Thu, 08 Sep 2022 06:28:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=FMKftuYvZGO/ycJsKzJJ5RksJYejGrCyVdxveZnA9MI=;
 b=h8kwEXdVGDokAqP2rCEvhGukyr0RiGbCdGsA7BUJlCPuKmvl6fNctVxC0bG7Crybuq
 LOzzWC4y9/KikhKWLPTCnCHgdsP8uBDGOXezGu3/XnufDvidI8VoBb1tG+mXuQlaL8ut
 bPWOuqTmVCatmpy7x2PGKkGFzg8PINqIRVnbkXTCrSPxpLS8mbs4CIERsktw9QiMsUEg
 WY9t/EbZ5I+GeCalSaDJ+1F+/HoE7Ks0FBQrE95x4KHpXkjdiHfESYPFiA/Q3fh/o2/f
 x9ooV3NJG7EFkEMQ0vZ2JfJ/MEFMbKB+ELM9WVBiO7RKUKrydIIEhp9BiMm/Uv1X4WQV
 vt9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=FMKftuYvZGO/ycJsKzJJ5RksJYejGrCyVdxveZnA9MI=;
 b=UKhKlAt59Wq8REj54/MJGrmeEKt88Y0J7xnjyJ+C7CQ8BB9McnpeBe3h2fKJeTNhGX
 Yqd+XU1om+QMdcbHQuhBvXqQWAQLh9SWqfuUygDlqIIeI44wcMV5nzyd44Mf2J1z4dvF
 PVrJERfmsCgQZyBp0vW4+ZRDaHD8O9OHsS1pRTVB7Ukt/ZPcV/zxLxynn7Z6KOUC+zuv
 8YlwXyn+3kd3dYJBpS3bxyG02Oq0nPo/WEVaYyJdecry+FWOst9FJFwNHZoa/6VNitav
 PHOfg7i0uGQkh/OQEnE2Or1aJMAr8rSWbznRxFx+i5sHSjohwK3jG+B+cGiV2RgOWKgJ
 semA==
X-Gm-Message-State: ACgBeo3cfHJPNBFKHjnE4CgxkZb8evTD6ALxYgCLndrxCjeDN6BPPwEk
 o9f1HS7f6I6ynii6h/Sd30UnhBKcHLY=
X-Google-Smtp-Source: AA6agR47OAjvoYxrDXShyZ06Ym2iju9Rcq4G6Ji2Z0Ey35Xntpi1+TzYTZgUYj3eJZXQXriORK8oVQ==
X-Received: by 2002:a63:1157:0:b0:435:200a:2d23 with SMTP id
 23-20020a631157000000b00435200a2d23mr4075663pgr.329.1662643720378; 
 Thu, 08 Sep 2022 06:28:40 -0700 (PDT)
Received: from ubuntu.. (144.168.56.201.16clouds.com. [144.168.56.201])
 by smtp.gmail.com with ESMTPSA id
 r8-20020a170902be0800b001755ac7dd0asm1731693pls.290.2022.09.08.06.28.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Sep 2022 06:28:40 -0700 (PDT)
From: Bin Meng <bmeng.cn@gmail.com>
To: qemu-devel@nongnu.org
Cc: Bin Meng <bin.meng@windriver.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Beraldo Leal <bleal@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Thomas Huth <thuth@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>
Subject: [PATCH 7/7] .gitlab-ci.d/windows.yml: Test 'make installer' in the CI
Date: Thu,  8 Sep 2022 21:28:17 +0800
Message-Id: <20220908132817.1831008-8-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220908132817.1831008-1-bmeng.cn@gmail.com>
References: <20220908132817.1831008-1-bmeng.cn@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::533;
 envelope-from=bmeng.cn@gmail.com; helo=mail-pg1-x533.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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

From: Bin Meng <bin.meng@windriver.com>

Now that we have supported packaging DLLs automatically, let's add
the 'make installer' in the CI and publish the generated installer
file as an artifact.

Increase the job timeout to 90 minutes to accommodate to it.

Signed-off-by: Bin Meng <bin.meng@windriver.com>
---

 .gitlab-ci.d/windows.yml | 27 +++++++++++++++++++--------
 1 file changed, 19 insertions(+), 8 deletions(-)

diff --git a/.gitlab-ci.d/windows.yml b/.gitlab-ci.d/windows.yml
index fffb202658..3a94d40e73 100644
--- a/.gitlab-ci.d/windows.yml
+++ b/.gitlab-ci.d/windows.yml
@@ -10,7 +10,7 @@
       - ${CI_PROJECT_DIR}/msys64/var/cache
   needs: []
   stage: build
-  timeout: 70m
+  timeout: 90m
   before_script:
   - If ( !(Test-Path -Path msys64\var\cache ) ) {
       mkdir msys64\var\cache
@@ -28,6 +28,11 @@
   - .\msys64\usr\bin\bash -lc 'pacman --noconfirm -Syuu'  # Core update
   - .\msys64\usr\bin\bash -lc 'pacman --noconfirm -Syuu'  # Normal update
   - taskkill /F /FI "MODULES eq msys-2.0.dll"
+  artifacts:
+    name: "$CI_JOB_NAME-$CI_COMMIT_REF_SLUG"
+    expire_in: 7 days
+    paths:
+      - build/qemu-setup*.exe
 
 msys2-64bit:
   extends: .shared_msys2_builder
@@ -51,6 +56,7 @@ msys2-64bit:
       mingw-w64-x86_64-lzo2
       mingw-w64-x86_64-nettle
       mingw-w64-x86_64-ninja
+      mingw-w64-x86_64-nsis
       mingw-w64-x86_64-pixman
       mingw-w64-x86_64-pkgconf
       mingw-w64-x86_64-python
@@ -60,12 +66,15 @@ msys2-64bit:
       mingw-w64-x86_64-usbredir
       mingw-w64-x86_64-zstd "
   - $env:CHERE_INVOKING = 'yes'  # Preserve the current working directory
-  - $env:MSYSTEM = 'MINGW64'     # Start a 64 bit Mingw environment
+  - $env:MSYSTEM = 'MINGW64'     # Start a 64-bit MinGW environment
   - $env:MSYS = 'winsymlinks:native' # Enable native Windows symlink
-  - .\msys64\usr\bin\bash -lc './configure --target-list=x86_64-softmmu
+  - mkdir build
+  - cd build
+  - ..\msys64\usr\bin\bash -lc '../configure --target-list=x86_64-softmmu
       --enable-capstone --without-default-devices'
-  - .\msys64\usr\bin\bash -lc 'make'
-  - .\msys64\usr\bin\bash -lc 'make check'
+  - ..\msys64\usr\bin\bash -lc 'make'
+  - ..\msys64\usr\bin\bash -lc 'make check'
+  - ..\msys64\usr\bin\bash -lc 'make installer'
 
 msys2-32bit:
   extends: .shared_msys2_builder
@@ -89,6 +98,7 @@ msys2-32bit:
       mingw-w64-i686-lzo2
       mingw-w64-i686-nettle
       mingw-w64-i686-ninja
+      mingw-w64-i686-nsis
       mingw-w64-i686-pixman
       mingw-w64-i686-pkgconf
       mingw-w64-i686-python
@@ -98,10 +108,11 @@ msys2-32bit:
       mingw-w64-i686-usbredir
       mingw-w64-i686-zstd "
   - $env:CHERE_INVOKING = 'yes'  # Preserve the current working directory
-  - $env:MSYSTEM = 'MINGW32'     # Start a 32-bit MinG environment
+  - $env:MSYSTEM = 'MINGW32'     # Start a 32-bit MinGW environment
   - $env:MSYS = 'winsymlinks:native' # Enable native Windows symlink
-  - mkdir output
-  - cd output
+  - mkdir build
+  - cd build
   - ..\msys64\usr\bin\bash -lc "../configure --target-list=ppc64-softmmu"
   - ..\msys64\usr\bin\bash -lc 'make'
   - ..\msys64\usr\bin\bash -lc 'make check'
+  - ..\msys64\usr\bin\bash -lc 'make installer'
-- 
2.34.1


