Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 96B5E57FF4A
	for <lists+qemu-devel@lfdr.de>; Mon, 25 Jul 2022 14:50:22 +0200 (CEST)
Received: from localhost ([::1]:39112 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oFxXR-0008C2-LV
	for lists+qemu-devel@lfdr.de; Mon, 25 Jul 2022 08:50:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50670)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1oFxDt-0004Dl-JO
 for qemu-devel@nongnu.org; Mon, 25 Jul 2022 08:30:12 -0400
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c]:44833)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1oFxDr-0007Xs-V0
 for qemu-devel@nongnu.org; Mon, 25 Jul 2022 08:30:09 -0400
Received: by mail-pl1-x62c.google.com with SMTP id p1so1750642plr.11
 for <qemu-devel@nongnu.org>; Mon, 25 Jul 2022 05:30:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=0mHPZSpB8wgYz45okWIPlPIfk7Qb13AyzkPDaGW9aLI=;
 b=EL2LiOLeRYIaayhlf9uyRsVZNIEtCItNmwahw18hjwthm+M86c9aFgLPpLvkW+DNSj
 JZX/TLSmOaYi4tUYJ0aFtldCAZdtV9+AVOAYjoOfbRgLjNKRpzIRmi+fbU+YDMiZNuaS
 T36WahFq5J7Z6FCecUZcvfWVXTjNfG+uB16cLHiwe16EXZyo2OVFYqO+EMT97ZttKGGC
 jINhr+tRLacKXEl2uQUKAYe77WMleUOKARD91Mczlaau8aYVo588fh10znDYcqimQEwS
 s1P6uUphpU8zomlD+bgrrQtDEkTOJuUjaA4Xh+Vsl9E6FrtMhXvfRrc4XRg2t0ggEaF7
 j6UQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=0mHPZSpB8wgYz45okWIPlPIfk7Qb13AyzkPDaGW9aLI=;
 b=JTAon/VkDULEaLPSbaLdijpbzLXGJDZ1CRZfyHUhZvfbn7y6qNt1wiwcLKCJh6tD5O
 1iHADH+RL7N7hcXtZZLqGuZwJ5DSZ2OODUGWORXV7yMvslX/kibczgKKZU2+3RK7D2Nj
 G3SqWOxle8D0GI7gbSCHNdiEl5Xt0OK9oeB5blBckDXsfcIOwuBHNbaWzsvJpQwXrPMh
 orYO4ZtzWoWjCnsqae05AnaNihv/25gX9mpXPEqh7o9dbnldoDtOIdDuflGxPdjoOGM0
 jokZlIWm+3UeXEI9oviP+esSlO4Vra/izwPA1+3/1EIW53RhRh2Mr0sc5sWoiE1kWI+2
 ryTw==
X-Gm-Message-State: AJIora9UMdVcJ2tDUOHA/SP0UicPMs9Ac++8lOl9nhS5u61Ml6aRarWN
 r+wbfz5JdNCYhY19MPJZ4yU=
X-Google-Smtp-Source: AGRyM1vd7rjl5oL0LuYlAsR0toEhzpbFrr4Q33CCtTkdl1tofaNnvjCmymBB0IUNvSWNgqHGGcxzDw==
X-Received: by 2002:a17:902:f541:b0:16d:46f1:bd14 with SMTP id
 h1-20020a170902f54100b0016d46f1bd14mr12041201plf.77.1658752206159; 
 Mon, 25 Jul 2022 05:30:06 -0700 (PDT)
Received: from ubuntu.. (144.168.56.201.16clouds.com. [144.168.56.201])
 by smtp.gmail.com with ESMTPSA id
 p16-20020a170902e75000b0016b90620910sm9163781plf.71.2022.07.25.05.30.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 25 Jul 2022 05:30:05 -0700 (PDT)
From: Bin Meng <bmeng.cn@gmail.com>
To: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Beraldo Leal <bleal@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Thomas Huth <thuth@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>, qemu-devel@nongnu.org
Cc: Bin Meng <bin.meng@windriver.com>
Subject: [PATCH] .gitlab-ci.d/windows.yml: Enable native Windows symlink
Date: Mon, 25 Jul 2022 20:30:00 +0800
Message-Id: <20220725123000.807608-1-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62c;
 envelope-from=bmeng.cn@gmail.com; helo=mail-pl1-x62c.google.com
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

The following error message was seen during the configure:

  "ln: failed to create symbolic link
  'x86_64-softmmu/qemu-system-x86_64.exe': No such file or directory"

By default the MSYS environment variable is not defined, so the runtime
behavior of winsymlinks is: if <target> does not exist, 'ln -s' fails.
At the configure phase, the qemu-system-x86_64.exe has not been built
so creation of the symbolic link fails hence the error message.

Set winsymlinks to 'native' whose behavior is most similar to the
behavior of 'ln -s' on *nix, that is:

  a) if native symlinks are enabled, and whether <target> exists
     or not, creates <destination> as a native Windows symlink;
  b) else if native symlinks are not enabled, and whether <target>
     exists or not, 'ln -s' creates as a Windows shortcut file.

Signed-off-by: Bin Meng <bin.meng@windriver.com>
---

 .gitlab-ci.d/windows.yml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/.gitlab-ci.d/windows.yml b/.gitlab-ci.d/windows.yml
index 1b2ede49e1..0b9572a8a3 100644
--- a/.gitlab-ci.d/windows.yml
+++ b/.gitlab-ci.d/windows.yml
@@ -57,6 +57,7 @@ msys2-64bit:
       mingw-w64-x86_64-zstd "
   - $env:CHERE_INVOKING = 'yes'  # Preserve the current working directory
   - $env:MSYSTEM = 'MINGW64'     # Start a 64 bit Mingw environment
+  - $env:MSYS = 'winsymlinks:native' # Enable native Windows symlink
   - .\msys64\usr\bin\bash -lc './configure --target-list=x86_64-softmmu
       --enable-capstone --without-default-devices'
   - .\msys64\usr\bin\bash -lc "sed -i '/^ROMS=/d' build/config-host.mak"
@@ -89,6 +90,7 @@ msys2-32bit:
       mingw-w64-i686-usbredir "
   - $env:CHERE_INVOKING = 'yes'  # Preserve the current working directory
   - $env:MSYSTEM = 'MINGW32'     # Start a 32-bit MinG environment
+  - $env:MSYS = 'winsymlinks:native' # Enable native Windows symlink
   - mkdir output
   - cd output
   - ..\msys64\usr\bin\bash -lc "../configure --target-list=ppc64-softmmu"
-- 
2.34.1


