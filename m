Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E4E9B2ECDB2
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Jan 2021 11:22:08 +0100 (CET)
Received: from localhost ([::1]:42100 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kxSQh-0001Qa-So
	for lists+qemu-devel@lfdr.de; Thu, 07 Jan 2021 05:22:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40216)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1kxSOW-00086E-NQ
 for qemu-devel@nongnu.org; Thu, 07 Jan 2021 05:19:52 -0500
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633]:40137)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1kxSOK-00052c-BZ
 for qemu-devel@nongnu.org; Thu, 07 Jan 2021 05:19:48 -0500
Received: by mail-pl1-x633.google.com with SMTP id q4so3248268plr.7
 for <qemu-devel@nongnu.org>; Thu, 07 Jan 2021 02:19:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=h231b8tLTi0WVz8zrZQ87p8PdEzOjSGm/ceVy+4Rnto=;
 b=b2Iq+8svi7Hu5CDNiYCGCtbyA9L7iyNWQ4BN/Hb9sBoVy89D7qwZG2r3MJkSnzjq67
 km/sGpUNb6NZL0MOYF5qVM0hezeLR4MSvspf0uECZVAkO4k/1oN73Nnlok9K/gtJefx1
 uedPnhOXAz44XQdbCwfU7m0WZxUpk0WWWeSCy0d4+gysQq3fIf+0VJU/VTQ7Qp4c43Fl
 G1cFW0DWIYztwAAJmOiJhAuRBsscDDfn3PbA0nVaOpJI3ax7RIgXpaLV6EIzogRQAZl2
 4u0E4djiE+OAziFxawxEN3HwPukJC8pkM9UutvsO7YtV8iLCdvAzmapGqLeyec/nOkL1
 iFAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=h231b8tLTi0WVz8zrZQ87p8PdEzOjSGm/ceVy+4Rnto=;
 b=HlIUp06o84iWd+9GVMcM2KXq4wL1FsSLc8FG+A8rYPLHHkv30KEgXmB9K6PqKk63Vh
 8XCs2wKlyFynUbzuVDVT2ZD0e+pPC2GK6WPKl315ZN61YViUVdzqlDRI7U17veDD7SOK
 6PqSvACZup0UHXlvxNDD58Wi17ni1XORB3HVQtTB9Xy+5wnZZRp2bWy3/F6rmN9q1FU2
 5FBTVFc/G7NuorPlesT4Jent5tzvXlNd5dv+6VcB2cHw0nVoOP6Do1LYrpkf8SD0eZFZ
 ZS1m766ZQUz7t0/z6LVy/t3iMKCR6pDesnAIHgR/5w34CZhYTP37qfpbmbC20fnApHMH
 AVwA==
X-Gm-Message-State: AOAM532kIF7rOBzpX5RuVpBCfsMocIhctWmDDQhFDVMJf6Qs5++zTHcL
 rUEqFJq5lsgBDsZ9qPZryG55YSMquy7oPXOX
X-Google-Smtp-Source: ABdhPJyP5+70xdRVZd7tJHY0Rxh0dV/xh2vZmxoOKxxNCMFo64Su7BwZULsumbUkQVSCji/lrm1tkQ==
X-Received: by 2002:a17:902:d202:b029:da:d86b:78be with SMTP id
 t2-20020a170902d202b02900dad86b78bemr1615678ply.0.1610014778519; 
 Thu, 07 Jan 2021 02:19:38 -0800 (PST)
Received: from localhost.localdomain ([103.94.185.75])
 by smtp.googlemail.com with ESMTPSA id s5sm4934662pju.9.2021.01.07.02.19.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Jan 2021 02:19:37 -0800 (PST)
From: Yonggang Luo <luoyonggang@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 2/5] cirrus/msys2: Cache msys2 mingw in a better way.
Date: Thu,  7 Jan 2021 02:19:16 -0800
Message-Id: <20210107101919.80-3-luoyonggang@gmail.com>
X-Mailer: git-send-email 2.29.2.windows.3
In-Reply-To: <20210107101919.80-1-luoyonggang@gmail.com>
References: <20210107101919.80-1-luoyonggang@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::633;
 envelope-from=luoyonggang@gmail.com; helo=mail-pl1-x633.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Sunil Muthuswamy <sunilmut@microsoft.com>, Ed Maste <emaste@freebsd.org>,
 Yonggang Luo <luoyonggang@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Yonggang Luo <luoyonggang@gmail.com>
---
 .cirrus.yml | 117 ++++++++++++++++++++++++++++++----------------------
 1 file changed, 68 insertions(+), 49 deletions(-)

diff --git a/.cirrus.yml b/.cirrus.yml
index 68b8a8fa9c..bc40a0550d 100644
--- a/.cirrus.yml
+++ b/.cirrus.yml
@@ -64,23 +64,61 @@ windows_msys2_task:
     CIRRUS_SHELL: powershell
     MSYS: winsymlinks:nativestrict
     MSYSTEM: MINGW64
+    MSYS2_URL: https://github.com/msys2/msys2-installer/releases/download/2021-01-05/msys2-base-x86_64-20210105.sfx.exe
+    MSYS2_FINGERPRINT: 0
+    MSYS2_PACKAGES: "
+      diffutils git grep make pkg-config sed
+      mingw-w64-x86_64-python
+      mingw-w64-x86_64-python-sphinx
+      mingw-w64-x86_64-toolchain
+      mingw-w64-x86_64-SDL2
+      mingw-w64-x86_64-SDL2_image
+      mingw-w64-x86_64-gtk3
+      mingw-w64-x86_64-glib2
+      mingw-w64-x86_64-ninja
+      mingw-w64-x86_64-jemalloc
+      mingw-w64-x86_64-lzo2
+      mingw-w64-x86_64-zstd
+      mingw-w64-x86_64-libjpeg-turbo
+      mingw-w64-x86_64-pixman
+      mingw-w64-x86_64-libgcrypt
+      mingw-w64-x86_64-libpng
+      mingw-w64-x86_64-libssh
+      mingw-w64-x86_64-libxml2
+      mingw-w64-x86_64-snappy
+      mingw-w64-x86_64-libusb
+      mingw-w64-x86_64-usbredir
+      mingw-w64-x86_64-libtasn1
+      mingw-w64-x86_64-nettle
+      mingw-w64-x86_64-cyrus-sasl
+      mingw-w64-x86_64-curl
+      mingw-w64-x86_64-gnutls
+      mingw-w64-x86_64-libnfs
+    "
     CHERE_INVOKING: 1
-  setup_script:
-    - choco install -y --no-progress 7zip
-    - Write-Output $env:PATH
   msys2_cache:
     folder: C:\tools\archive
     reupload_on_changes: false
-    fingerprint_script: cat .cirrus.yml
+    # These env variables are used to generate fingerprint to trigger the cache procedure
+    # If wanna to force re-populate msys2, increase MSYS2_FINGERPRINT
+    fingerprint_script:
+      - |
+        echo $env:CIRRUS_TASK_NAME
+        echo $env:MSYS2_URL
+        echo $env:MSYS2_FINGERPRINT
+        echo $env:MSYS2_PACKAGES
     populate_script:
       - |
-        md C:\tools
-        md C:\tools\archive
+        md -Force C:\tools\archive\pkg
         $start_time = Get-Date
+        bitsadmin /transfer msys_download /dynamic /download /priority FOREGROUND $env:MSYS2_URL C:\tools\archive\base.exe
+        Write-Output "Download time taken: $((Get-Date).Subtract($start_time))"
         cd C:\tools
-        bitsadmin /transfer msys_download /dynamic /download /priority FOREGROUND https://github.com/msys2/msys2-installer/releases/download/2020-09-03/msys2-base-x86_64-20200903.sfx.exe C:\tools\base.exe
-        Write-Output "Download time taken: $((Get-Date).Subtract($start_time).Seconds) second(s)"
-        C:\tools\base.exe -y
+        C:\tools\archive\base.exe -y
+        del -Force C:\tools\archive\base.exe
+        Write-Output "Base install time taken: $((Get-Date).Subtract($start_time))"
+        $start_time = Get-Date
+
         ((Get-Content -path C:\tools\msys64\etc\\post-install\\07-pacman-key.post -Raw) -replace '--refresh-keys', '--version') | Set-Content -Path C:\tools\msys64\etc\\post-install\\07-pacman-key.post
         C:\tools\msys64\usr\bin\bash.exe -lc "sed -i 's/^CheckSpace/#CheckSpace/g' /etc/pacman.conf"
         C:\tools\msys64\usr\bin\bash.exe -lc "export"
@@ -90,49 +128,30 @@ windows_msys2_task:
         tasklist
         C:\tools\msys64\usr\bin\bash.exe -lc "mv -f /etc/pacman.conf.pacnew /etc/pacman.conf || true"
         C:\tools\msys64\usr\bin\bash.exe -lc "pacman --noconfirm -Suu --overwrite=*"
-        C:\tools\msys64\usr\bin\bash.exe -lc "pacman --noconfirm -S --needed \
-          diffutils git grep make pkg-config sed \
-          mingw-w64-x86_64-python \
-          mingw-w64-x86_64-toolchain \
-          mingw-w64-x86_64-SDL2 \
-          mingw-w64-x86_64-SDL2_image \
-          mingw-w64-x86_64-gtk3 \
-          mingw-w64-x86_64-glib2 \
-          mingw-w64-x86_64-ninja \
-          mingw-w64-x86_64-jemalloc \
-          mingw-w64-x86_64-lzo2 \
-          mingw-w64-x86_64-zstd \
-          mingw-w64-x86_64-libjpeg-turbo \
-          mingw-w64-x86_64-pixman \
-          mingw-w64-x86_64-libgcrypt \
-          mingw-w64-x86_64-libpng \
-          mingw-w64-x86_64-libssh \
-          mingw-w64-x86_64-libxml2 \
-          mingw-w64-x86_64-snappy \
-          mingw-w64-x86_64-libusb \
-          mingw-w64-x86_64-usbredir \
-          mingw-w64-x86_64-libtasn1 \
-          mingw-w64-x86_64-nettle \
-          mingw-w64-x86_64-cyrus-sasl \
-          mingw-w64-x86_64-curl \
-          mingw-w64-x86_64-gnutls \
-          mingw-w64-x86_64-libnfs \
-          "
-        bitsadmin /transfer msys_download /dynamic /download /priority FOREGROUND `
-          https://repo.msys2.org/mingw/x86_64/mingw-w64-x86_64-python-sphinx-2.3.1-1-any.pkg.tar.xz `
-          C:\tools\mingw-w64-x86_64-python-sphinx-2.3.1-1-any.pkg.tar.xz
-        C:\tools\msys64\usr\bin\bash.exe -lc "pacman --noconfirm -U /c/tools/mingw-w64-x86_64-python-sphinx-2.3.1-1-any.pkg.tar.xz"
-        del C:\tools\mingw-w64-x86_64-python-sphinx-2.3.1-1-any.pkg.tar.xz
-        C:\tools\msys64\usr\bin\bash.exe -lc "rm -rf /var/cache/pacman/pkg/*"
-        cd C:\tools\msys64
-        echo "Start archive"
-        cmd /C "7z a -ttar . -so | 7z a -txz -simsys2-x86_64.tar C:\tools\archive\msys2-x86_64.tar.xz"
+        Write-Output "Core install time taken: $((Get-Date).Subtract($start_time))"
+        $start_time = Get-Date
+
+        C:\tools\msys64\usr\bin\bash.exe -lc "pacman --noconfirm -S --needed $env:MSYS2_PACKAGES"
+        Write-Output "Package install time taken: $((Get-Date).Subtract($start_time))"
+        $start_time = Get-Date
+
+        del -Force -ErrorAction SilentlyContinue C:\tools\msys64\etc\mtab
+        del -Force -ErrorAction SilentlyContinue C:\tools\msys64\dev\fd
+        del -Force -ErrorAction SilentlyContinue C:\tools\msys64\dev\stderr
+        del -Force -ErrorAction SilentlyContinue C:\tools\msys64\dev\stdin
+        del -Force -ErrorAction SilentlyContinue C:\tools\msys64\dev\stdout
+        del -Force -Recurse -ErrorAction SilentlyContinue C:\tools\msys64\var\cache\pacman\pkg
+        tar cf C:\tools\archive\msys64.tar -C C:\tools\ msys64
+
+        Write-Output "Package archive time taken: $((Get-Date).Subtract($start_time))"
+        del -Force -Recurse -ErrorAction SilentlyContinue c:\tools\msys64 
   install_script:
     - |
+      $start_time = Get-Date
       cd C:\tools
-      cmd /C "7z x C:\tools\archive\msys2-x86_64.tar.xz -so | 7z x -aoa -simsys2-x86_64.tar -ttar -omsys64"
-      C:\tools\msys64\usr\bin\bash.exe -lc "export"
-
+      ls C:\tools\archive\msys64.tar
+      tar xf C:\tools\archive\msys64.tar
+      Write-Output "Extract msys2 time taken: $((Get-Date).Subtract($start_time))"
   script:
     - C:\tools\msys64\usr\bin\bash.exe -lc "mkdir build"
     - C:\tools\msys64\usr\bin\bash.exe -lc "cd build && ../configure --python=python3"
-- 
2.29.2.windows.3


