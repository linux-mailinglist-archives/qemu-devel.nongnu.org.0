Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8758C2F37B2
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Jan 2021 18:54:22 +0100 (CET)
Received: from localhost ([::1]:34066 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kzNs5-0006a0-Fv
	for lists+qemu-devel@lfdr.de; Tue, 12 Jan 2021 12:54:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35240)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1kzNG0-0003Yi-Ex
 for qemu-devel@nongnu.org; Tue, 12 Jan 2021 12:15:02 -0500
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d]:47007)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1kzNFy-0004rX-8D
 for qemu-devel@nongnu.org; Tue, 12 Jan 2021 12:14:59 -0500
Received: by mail-ed1-x52d.google.com with SMTP id v26so3125711eds.13
 for <qemu-devel@nongnu.org>; Tue, 12 Jan 2021 09:14:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=D6VYmYcxC74HseBh4tGL9VlXtclJEhKjM/IexQ8E7H8=;
 b=AdJvOMQH2UHG1ZA4wN1O1OD2aZ5vPOujOZl6OHTxh+9+OGN5V45Dnm4TJnYV/ROoHG
 2+SADcBucBvk7jPpi7P6OasbRXtPzgCYdUDUr6gQdOBBXBOjtbsdI40PTncE7jGqvkUX
 /grL468vuNkdoe/fLxTcQ0q4QAOUGIcfpAxfmo/C1dtnrxIaHvBR0rxIzw1ApSttlJgr
 WAB8p1Vgplo+ZBxz1N/A4Gg9PymIt1Dv4WGYZvyRs5k87brzPRxLjfe2VPAeCImoViRQ
 pI1Do8Ajz47E6DIYhUTVX0IYrHmwZDQ/nwLhDYPITaceT3+RYxvBAWoMxmlszLd8MTSJ
 yRJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=D6VYmYcxC74HseBh4tGL9VlXtclJEhKjM/IexQ8E7H8=;
 b=rd1i2NtRCv+wwdXeKK6AD94vhvPXWAbHFinnGQp7B3uWc0STcQbCzGW9oGW61ieiRJ
 azNFhuGs3ODu+k3fu4sSUAnzm46kNwPCk3xuZ4j/SdfyhtcNGraOu2uZLATLaww2X3qA
 0WIyRssUZssVqFN/Rksw5AJd9lBgIDJbLajm9zSdTM0SuZnsVGnRhGVeIYK+kv2no6hn
 HRp2JIZXd1VEzOBkxq5G01DzwmJc9qutLPs0Ly0NgmMGZHEV41+aEGqqLPHPUu5yYcNM
 gXTKbblOEFgY0Rwvg/HoH10OTN96gmOXkUsnF31aVNC8NKXH24GS0iHb5XtxXye6KY3y
 KcLQ==
X-Gm-Message-State: AOAM531QjiOmGMqhRM7Su4wE8Ja+sP2sruSM3JFHzExJfKGBRAWMj5po
 0FdX8B3bJ6/DcxObRkxSlC9Ek1cCQwiJWg==
X-Google-Smtp-Source: ABdhPJyFu3USdaisgUQfwruI6YEqWQ4o+2LfDP/hBWVlhOBTlGQnn3JIoG3oLXH9fDYHwnV8YLhQMA==
X-Received: by 2002:a05:6402:1c8b:: with SMTP id
 cy11mr140174edb.256.1610471696842; 
 Tue, 12 Jan 2021 09:14:56 -0800 (PST)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id k22sm397302edv.33.2021.01.12.09.14.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Jan 2021 09:14:56 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 05/20] cirrus/msys2: Cache msys2 mingw in a better way.
Date: Tue, 12 Jan 2021 18:14:35 +0100
Message-Id: <20210112171450.791427-6-pbonzini@redhat.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210112171450.791427-1-pbonzini@redhat.com>
References: <20210112171450.791427-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52d;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x52d.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
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
Cc: Yonggang Luo <luoyonggang@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Yonggang Luo <luoyonggang@gmail.com>

Signed-off-by: Yonggang Luo <luoyonggang@gmail.com>
Message-Id: <20210107101919.80-3-luoyonggang@gmail.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
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
2.29.2



