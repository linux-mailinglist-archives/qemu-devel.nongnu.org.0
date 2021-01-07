Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E35F2ECA37
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Jan 2021 06:41:54 +0100 (CET)
Received: from localhost ([::1]:56532 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kxO3V-0006yg-GX
	for lists+qemu-devel@lfdr.de; Thu, 07 Jan 2021 00:41:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39156)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1kxO0X-0004Y4-7n
 for qemu-devel@nongnu.org; Thu, 07 Jan 2021 00:38:49 -0500
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d]:35495)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1kxO0V-0007zF-5T
 for qemu-devel@nongnu.org; Thu, 07 Jan 2021 00:38:49 -0500
Received: by mail-pj1-x102d.google.com with SMTP id b5so3081624pjl.0
 for <qemu-devel@nongnu.org>; Wed, 06 Jan 2021 21:38:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=s34oWwCnva9zYTMUljLNrMCgt8yidhr4qiHW1p0SC0A=;
 b=uTBL38c6M7OrGe18r9FcU2xcZ8U3A+bPhdg396QfkDflfRZXXxigD9ZzUurmfK2Xou
 DNPbwjFyWgyz0PNh1OOBTW4tq3ZINe41S3QVWRY26XplFxprnBQTFq1VlMKRq59GtbKP
 uS4c8+AaAPx7zG7temh8c68pUsC5eejiXMBNvUJZdvqOKD66RLeMuHyEDna7UHgbGXpk
 j9P7T2muaswgD/00zlRs2929ZeH/2gx9DmFkMgzV51UbfW+1Wf9EExqbmhcOfxSSrFNX
 DDwu/FGItMysaHnTf1U6Tj+xCsG/Aqnzsu8a651GVBR68AtFm2V0sxdGGISMOHP1mBVQ
 tW5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=s34oWwCnva9zYTMUljLNrMCgt8yidhr4qiHW1p0SC0A=;
 b=S9apDhfplxbn3dxGp1+i1l+S9EuayFmen5OKp2zw2q9oGJuMOjQkLxoees3WxbCCm8
 tGqNjWZPgynwxeKYXAXSpbrqr/dLhm4vHRVyEENtljnNncI4oYKrXO+8Qk+nOkkGdElG
 Arl4oqL3ZtiP0sItLh/otWzvqH+XhQr84FtdgM6znDnCb5zJVvmTZ2fz+Q5Ca0mCXq2k
 SC1mW5PrvDvLxYsIzgNRt94h2RFoY/jTSzdvQRjhprwEyPs5ipbmiYaIPgZrlO1fbf9X
 ZV0Vz0RsRbHqoyJdrw8ksmlXa9Z2vXNA4p/ZKkFwZ/ySkYeyznDolpJ48mYAm8Mo7Uic
 NLJA==
X-Gm-Message-State: AOAM532AQbNzWVsAIVV8QWsPNb0ruKCRONMYk3PCPNtnmR0AYFA529wl
 B4Pp7dUMiwnvQf/5ffZ0RrYCEQE4uzCmDK8J
X-Google-Smtp-Source: ABdhPJyABCnz9vBbNEuetBz/o5JkEoWPqKJbJStWTXEXMnC+imfdqSfsTF14BviMF3ZhfX6prNSQAA==
X-Received: by 2002:a17:90b:1213:: with SMTP id
 gl19mr7811623pjb.232.1609997925103; 
 Wed, 06 Jan 2021 21:38:45 -0800 (PST)
Received: from localhost.localdomain ([103.94.185.75])
 by smtp.googlemail.com with ESMTPSA id y6sm7660091pjl.0.2021.01.06.21.38.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Jan 2021 21:38:44 -0800 (PST)
From: Yonggang Luo <luoyonggang@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 2/4] cirrus/msys2: Cache msys2 mingw in a better way.
Date: Wed,  6 Jan 2021 21:38:23 -0800
Message-Id: <20210107053825.2010-3-luoyonggang@gmail.com>
X-Mailer: git-send-email 2.29.2.windows.3
In-Reply-To: <20210107053825.2010-1-luoyonggang@gmail.com>
References: <20210107053825.2010-1-luoyonggang@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102d;
 envelope-from=luoyonggang@gmail.com; helo=mail-pj1-x102d.google.com
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
index ff6adabd0d..6f2a958472 100644
--- a/.cirrus.yml
+++ b/.cirrus.yml
@@ -58,23 +58,61 @@ windows_msys2_task:
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
@@ -84,49 +122,30 @@ windows_msys2_task:
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


