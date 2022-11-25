Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D6736387E2
	for <lists+qemu-devel@lfdr.de>; Fri, 25 Nov 2022 11:51:37 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oyWHY-0004xk-Js; Fri, 25 Nov 2022 05:50:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1oyWHT-0004xV-JF
 for qemu-devel@nongnu.org; Fri, 25 Nov 2022 05:50:05 -0500
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1oyWHR-0004N3-Qa
 for qemu-devel@nongnu.org; Fri, 25 Nov 2022 05:50:03 -0500
Received: by mail-pj1-x1031.google.com with SMTP id
 k2-20020a17090a4c8200b002187cce2f92so7373509pjh.2
 for <qemu-devel@nongnu.org>; Fri, 25 Nov 2022 02:50:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=OjNuEto+tnE18PPcNQPWC8m9fl8QijoQZONWq7QG7BQ=;
 b=Y21wD0hepRivJWIenJL09W2/LO28VzUoA1k1ZpkCg1rZohaY1sZBZ6FwFCbhxqSkjf
 2D5CIVAbAWsqe6gFtNq9Yu5Bdim/dW1hBYJqVSrHqOBF/9pcSRzzdUqOBsOIw12Vw6dL
 PBJwWx1sg/u/SktEe0akLEwmEJQpFTL+DfqP+SoEA29YJiC2l/p/WqR5UN00lSahks49
 2QfjMP1f0W4IU5CRZPadgN7E9FoKBOpGq8O48uyduG8w7NA6w4cM95lPNiEAnnlrFwaf
 m1m3JBEGR+e6F9E1FwCYDpNHXORSzaNzXs/k1iyQo2oHN1+KL/CFv9ZXg3luLqMQHXTk
 AUDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=OjNuEto+tnE18PPcNQPWC8m9fl8QijoQZONWq7QG7BQ=;
 b=cPB+Lvrg4pzAPFavasBVKzVQ0i4bNWH+qUUKfKM1CMHaDSsJTWEK7GMUZmFE96oXPr
 /ZQAn6ocPhHuK5kP/d7ZYQW7mn7CNkXmhswPdMmY+pcVtRaOzGixQkRGDlWe5lMZg4Wl
 gB/beVIjck08TW+JhI4QT3iH6LxVtbwuTlDI7b/yj2bZQiQ0M2zNoBn4E/+bYSJ9AyHo
 nEOIMEtmCf6hVyJ6kVm5S81si17yyj3PNWuqr4jVyTLmjpRVIGPFSPjZuwKfWXYRsAoG
 HSCLu8/mvLY+tK9di8uEo/IBKoapimRQDmIH3+idltcmWpUByDHX2E/7k7yIMTEnaRFD
 TUfQ==
X-Gm-Message-State: ANoB5pl7AE3op9TQTN43e6B/lqJTnICIN3TP3xkKugR0315vSkJAwzqb
 yArA2oOq7bikjoh8UjixxXz9D1ikyv4=
X-Google-Smtp-Source: AA0mqf6isKzZQckfb9ECnwJbypmD7Sv173L4BoFVI0YSMXFdBvEkDrANXCJhVWOIhy9MchaA0ZddIA==
X-Received: by 2002:a17:90a:ca13:b0:218:cf25:1e7a with SMTP id
 x19-20020a17090aca1300b00218cf251e7amr17541730pjt.29.1669373400081; 
 Fri, 25 Nov 2022 02:50:00 -0800 (PST)
Received: from ubuntu.. (144.168.56.201.16clouds.com. [144.168.56.201])
 by smtp.gmail.com with ESMTPSA id
 j7-20020a170902da8700b00188f7ad561asm3055966plx.249.2022.11.25.02.49.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Nov 2022 02:49:59 -0800 (PST)
From: Bin Meng <bmeng.cn@gmail.com>
To: qemu-devel@nongnu.org
Cc: Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Bin Meng <bin.meng@windriver.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Beraldo Leal <bleal@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>
Subject: [PATCH 2/4] .gitlab-ci.d/windows.yml: Keep 64-bit and 32-bit build
 scripts consistent
Date: Fri, 25 Nov 2022 18:49:49 +0800
Message-Id: <20221125104951.3169611-2-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221125104951.3169611-1-bmeng.cn@gmail.com>
References: <20221125104951.3169611-1-bmeng.cn@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1031;
 envelope-from=bmeng.cn@gmail.com; helo=mail-pj1-x1031.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Bin Meng <bin.meng@windriver.com>

At present the build scripts of 32-bit and 64-bit are inconsistent.
Let's keep them consistent for easier maintenance.

While we are here, add some comments to explain that for the 64-bit
job, "--without-default-devices" is a must have, at least for now.

Signed-off-by: Bin Meng <bin.meng@windriver.com>
---

 .gitlab-ci.d/windows.yml | 20 ++++++++++++++------
 1 file changed, 14 insertions(+), 6 deletions(-)

diff --git a/.gitlab-ci.d/windows.yml b/.gitlab-ci.d/windows.yml
index 99d78c2213..c6de65c784 100644
--- a/.gitlab-ci.d/windows.yml
+++ b/.gitlab-ci.d/windows.yml
@@ -61,12 +61,19 @@ msys2-64bit:
       mingw-w64-x86_64-usbredir
       mingw-w64-x86_64-zstd "
   - $env:CHERE_INVOKING = 'yes'  # Preserve the current working directory
-  - $env:MSYSTEM = 'MINGW64'     # Start a 64 bit Mingw environment
+  - $env:MSYSTEM = 'MINGW64'     # Start a 64-bit MinGW environment
   - $env:MSYS = 'winsymlinks:native' # Enable native Windows symlink
-  - .\msys64\usr\bin\bash -lc './configure --target-list=x86_64-softmmu
+  - mkdir output
+  - cd output
+  # Note: do not remove "--without-default-devices"!
+  # commit 9f8e6cad65a6 ("gitlab-ci: Speed up the msys2-64bit job by using --without-default-devices"
+  # changed to compile QEMU with the --without-default-devices switch
+  # for the msys2 64-bit job, due to the build could not complete within
+  # the project timeout.
+  - ..\msys64\usr\bin\bash -lc '../configure --target-list=x86_64-softmmu
       --enable-capstone --without-default-devices'
-  - .\msys64\usr\bin\bash -lc 'make'
-  - .\msys64\usr\bin\bash -lc 'make check || { cat build/meson-logs/testlog.txt; exit 1; } ;'
+  - ..\msys64\usr\bin\bash -lc 'make'
+  - ..\msys64\usr\bin\bash -lc 'make check || { cat meson-logs/testlog.txt; exit 1; } ;'
 
 msys2-32bit:
   extends: .shared_msys2_builder
@@ -100,10 +107,11 @@ msys2-32bit:
       mingw-w64-i686-usbredir
       mingw-w64-i686-zstd "
   - $env:CHERE_INVOKING = 'yes'  # Preserve the current working directory
-  - $env:MSYSTEM = 'MINGW32'     # Start a 32-bit MinG environment
+  - $env:MSYSTEM = 'MINGW32'     # Start a 32-bit MinGW environment
   - $env:MSYS = 'winsymlinks:native' # Enable native Windows symlink
   - mkdir output
   - cd output
-  - ..\msys64\usr\bin\bash -lc "../configure --target-list=ppc64-softmmu"
+  - ..\msys64\usr\bin\bash -lc '../configure --target-list=ppc64-softmmu
+      --enable-capstone'
   - ..\msys64\usr\bin\bash -lc 'make'
   - ..\msys64\usr\bin\bash -lc 'make check || { cat meson-logs/testlog.txt; exit 1; } ;'
-- 
2.34.1


