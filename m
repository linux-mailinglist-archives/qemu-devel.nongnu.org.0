Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 95A8E6C4C9E
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Mar 2023 14:58:55 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1peyyB-00010P-Nr; Wed, 22 Mar 2023 09:57:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1peyyA-000104-Bs
 for qemu-devel@nongnu.org; Wed, 22 Mar 2023 09:57:38 -0400
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1peyy8-0001AG-AP
 for qemu-devel@nongnu.org; Wed, 22 Mar 2023 09:57:38 -0400
Received: by mail-wm1-x334.google.com with SMTP id p16so11596859wmq.5
 for <qemu-devel@nongnu.org>; Wed, 22 Mar 2023 06:57:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1679493455;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=RefK/fZ4A/1aRNykjhv1QicsTPvUD23obAEq0f+RH2M=;
 b=lDbzIpvIs2/ob8sRd8N6Sa31gd+8SAMM533la7Vg7oCEhMYKggbmayEg9zBA+fwFbT
 qfIHiH8hE0p09EXHnqkMmctP8qSMi5Z21NAFW8iiO6UH7cSNxb3FtVJOzT508h0ZStGJ
 404+F3Gf8lDtKXEj8I8qDMl28pumCSZ3VWGE2MZI5djmWykhMibsCHyDA/bA9OFoi4dH
 mE8exCvMPoTUIG2+k2a+Uxa9WAGRRuCdzbHvp6IFiBSiiAlLdN7GXSl23vsvzXciPF82
 A49e6Hgq9tSvicy2aYAnq6de/VlwiDExdal99SvfKX6o6z7L8O3kNPotYukPZj8ZNYZV
 +Smg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679493455;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=RefK/fZ4A/1aRNykjhv1QicsTPvUD23obAEq0f+RH2M=;
 b=gAOtSCj80Dvedgynu/FwtLBsU8om6S7kC7qJreVaqgMNyQM1EMNHlAj0w1YpJa19hk
 bVZvJldDR7fQWF1QbmFhrdj3VZYSUJgLhU13nSrm7zq7TfeToKioxP1ir90a42S1fwIX
 v2bH7rSHh0FeNRu3ieJ96HygmVKGkucZDd2uCp5pcy0vF95YWsKXrxYo217uaXsBDa5H
 CUecGpsO4fUzKXRpw6/oZK4jLhVocnNqBb2VWj2BHNivRRl/KzeP9jZrR4ADq5tAzKTT
 HDpLpbYTlPdc3hq/eeHCetEfqoA8n4rt9gzC5HJQ8jeKutB8RMlG77qZcqzq087OTRCc
 pixQ==
X-Gm-Message-State: AO0yUKUL73D7pD0HCbk9fiWNtd2PAkpiJ/DlsiSxRSqrIHGY9wLfHAMP
 t6xbJrUDYDa+IOktbcMSisBHBx0fUTXiu3bstjodog==
X-Google-Smtp-Source: AK7set87pSWtYTHekSo+aWX1c89Lkr5NxTfCWHPPaQY/85VO2PSscP1KdORg3HVC8zsQ/TqT/Ray4w==
X-Received: by 2002:a05:600c:b46:b0:3df:deb5:6ff5 with SMTP id
 k6-20020a05600c0b4600b003dfdeb56ff5mr5066826wmr.24.1679493454692; 
 Wed, 22 Mar 2023 06:57:34 -0700 (PDT)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 t20-20020a1c7714000000b003ee10fb56ebsm7585361wmi.9.2023.03.22.06.57.33
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 22 Mar 2023 06:57:34 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Beraldo Leal <bleal@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Jintao Yin <nicememory@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Yonggang Luo <luoyonggang@gmail.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Subject: [PATCH v2 2/2] cirrus-ci: Remove MSYS2 jobs duplicated with gitlab-ci
Date: Wed, 22 Mar 2023 14:57:21 +0100
Message-Id: <20230322135721.61138-3-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230322135721.61138-1-philmd@linaro.org>
References: <20230322135721.61138-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x334.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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

- Various developers are reluctant to git Cirrus-CI the permissions
  requested to access their GitHub account.

- When we use the cirrus-run script to trigger Cirrus-CI job from
  GitLab-CI, the GitLab-CI job is restricted to a 1h timeout
  (often not enough).

- Although Cirrus-CI VMs are more powerful than GitLab-CI ones,
  its free plan is limited in 2 concurrent jobs.

- The GitLab-CI MSYS2 jobs are a 1:1 mapping with the Cirrus-CI ones
  (modulo the environment caching).

Reduce the maintenance burden by removing the Cirrus-CI config file,
keeping the GitLab-CI jobs.

Update Yonggang Luo's maintenance file list to the new file, which
use the same environment shell.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 MAINTAINERS |   3 +-
 .cirrus.yml | 111 ----------------------------------------------------
 2 files changed, 1 insertion(+), 113 deletions(-)
 delete mode 100644 .cirrus.yml

diff --git a/MAINTAINERS b/MAINTAINERS
index 9b56ccdd92..34b50b267c 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -3818,8 +3818,7 @@ W: https://cirrus-ci.com/github/qemu/qemu
 Windows Hosted Continuous Integration
 M: Yonggang Luo <luoyonggang@gmail.com>
 S: Maintained
-F: .cirrus.yml
-W: https://cirrus-ci.com/github/qemu/qemu
+F: .gitlab-ci.d/windows.yml
 
 Guest Test Compilation Support
 M: Alex Bennée <alex.bennee@linaro.org>
diff --git a/.cirrus.yml b/.cirrus.yml
deleted file mode 100644
index 5fb00da73d..0000000000
--- a/.cirrus.yml
+++ /dev/null
@@ -1,111 +0,0 @@
-env:
-  CIRRUS_CLONE_DEPTH: 1
-
-windows_msys2_task:
-  timeout_in: 90m
-  windows_container:
-    image: cirrusci/windowsservercore:2019
-    os_version: 2019
-    cpu: 8
-    memory: 8G
-  env:
-    CIRRUS_SHELL: powershell
-    MSYS: winsymlinks:native
-    MSYSTEM: MINGW64
-    MSYS2_URL: https://github.com/msys2/msys2-installer/releases/download/2022-06-03/msys2-base-x86_64-20220603.sfx.exe
-    MSYS2_FINGERPRINT: 0
-    MSYS2_PACKAGES: "
-      diffutils git grep make pkg-config sed
-      mingw-w64-x86_64-python
-      mingw-w64-x86_64-python-sphinx
-      mingw-w64-x86_64-toolchain
-      mingw-w64-x86_64-SDL2
-      mingw-w64-x86_64-SDL2_image
-      mingw-w64-x86_64-gtk3
-      mingw-w64-x86_64-glib2
-      mingw-w64-x86_64-ninja
-      mingw-w64-x86_64-jemalloc
-      mingw-w64-x86_64-lzo2
-      mingw-w64-x86_64-zstd
-      mingw-w64-x86_64-libjpeg-turbo
-      mingw-w64-x86_64-pixman
-      mingw-w64-x86_64-libgcrypt
-      mingw-w64-x86_64-libpng
-      mingw-w64-x86_64-libssh
-      mingw-w64-x86_64-snappy
-      mingw-w64-x86_64-libusb
-      mingw-w64-x86_64-usbredir
-      mingw-w64-x86_64-libtasn1
-      mingw-w64-x86_64-nettle
-      mingw-w64-x86_64-cyrus-sasl
-      mingw-w64-x86_64-curl
-      mingw-w64-x86_64-gnutls
-      mingw-w64-x86_64-libnfs
-    "
-    CHERE_INVOKING: 1
-  msys2_cache:
-    folder: C:\tools\archive
-    reupload_on_changes: false
-    # These env variables are used to generate fingerprint to trigger the cache procedure
-    # If wanna to force re-populate msys2, increase MSYS2_FINGERPRINT
-    fingerprint_script:
-      - |
-        echo $env:CIRRUS_TASK_NAME
-        echo $env:MSYS2_URL
-        echo $env:MSYS2_FINGERPRINT
-        echo $env:MSYS2_PACKAGES
-    populate_script:
-      - |
-        md -Force C:\tools\archive\pkg
-        $start_time = Get-Date
-        bitsadmin /transfer msys_download /dynamic /download /priority FOREGROUND $env:MSYS2_URL C:\tools\archive\base.exe
-        Write-Output "Download time taken: $((Get-Date).Subtract($start_time))"
-        cd C:\tools
-        C:\tools\archive\base.exe -y
-        del -Force C:\tools\archive\base.exe
-        Write-Output "Base install time taken: $((Get-Date).Subtract($start_time))"
-        $start_time = Get-Date
-
-        ((Get-Content -path C:\tools\msys64\etc\\post-install\\07-pacman-key.post -Raw) -replace '--refresh-keys', '--version') | Set-Content -Path C:\tools\msys64\etc\\post-install\\07-pacman-key.post
-        C:\tools\msys64\usr\bin\bash.exe -lc "sed -i 's/^CheckSpace/#CheckSpace/g' /etc/pacman.conf"
-        C:\tools\msys64\usr\bin\bash.exe -lc "export"
-        C:\tools\msys64\usr\bin\pacman.exe --noconfirm -Sy
-        echo Y | C:\tools\msys64\usr\bin\pacman.exe --noconfirm -Suu --overwrite=*
-        taskkill /F /FI "MODULES eq msys-2.0.dll"
-        tasklist
-        C:\tools\msys64\usr\bin\bash.exe -lc "mv -f /etc/pacman.conf.pacnew /etc/pacman.conf || true"
-        C:\tools\msys64\usr\bin\bash.exe -lc "pacman --noconfirm -Syuu --overwrite=*"
-        Write-Output "Core install time taken: $((Get-Date).Subtract($start_time))"
-        $start_time = Get-Date
-
-        C:\tools\msys64\usr\bin\bash.exe -lc "pacman --noconfirm -S --needed $env:MSYS2_PACKAGES"
-        Write-Output "Package install time taken: $((Get-Date).Subtract($start_time))"
-        $start_time = Get-Date
-
-        del -Force -ErrorAction SilentlyContinue C:\tools\msys64\etc\mtab
-        del -Force -ErrorAction SilentlyContinue C:\tools\msys64\dev\fd
-        del -Force -ErrorAction SilentlyContinue C:\tools\msys64\dev\stderr
-        del -Force -ErrorAction SilentlyContinue C:\tools\msys64\dev\stdin
-        del -Force -ErrorAction SilentlyContinue C:\tools\msys64\dev\stdout
-        del -Force -Recurse -ErrorAction SilentlyContinue C:\tools\msys64\var\cache\pacman\pkg
-        tar cf C:\tools\archive\msys64.tar -C C:\tools\ msys64
-
-        Write-Output "Package archive time taken: $((Get-Date).Subtract($start_time))"
-        del -Force -Recurse -ErrorAction SilentlyContinue c:\tools\msys64 
-  install_script:
-    - |
-      $start_time = Get-Date
-      cd C:\tools
-      ls C:\tools\archive\msys64.tar
-      tar xf C:\tools\archive\msys64.tar
-      Write-Output "Extract msys2 time taken: $((Get-Date).Subtract($start_time))"
-  script:
-    - mkdir build
-    - cd build
-    - C:\tools\msys64\usr\bin\bash.exe -lc "../configure --python=python3
-        --target-list-exclude=i386-softmmu,ppc64-softmmu,aarch64-softmmu,mips64-softmmu,mipsel-softmmu,sh4-softmmu"
-    - C:\tools\msys64\usr\bin\bash.exe -lc "make -j8"
-    - exit $LastExitCode
-  test_script:
-    - C:\tools\msys64\usr\bin\bash.exe -lc "cd build && make V=1 check"
-    - exit $LastExitCode
-- 
2.38.1


