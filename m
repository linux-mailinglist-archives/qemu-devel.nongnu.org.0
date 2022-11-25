Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A9596388FD
	for <lists+qemu-devel@lfdr.de>; Fri, 25 Nov 2022 12:42:55 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oyX4z-0000Nx-NU; Fri, 25 Nov 2022 06:41:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1oyX4y-0000Nl-Nz
 for qemu-devel@nongnu.org; Fri, 25 Nov 2022 06:41:12 -0500
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1oyX4w-000774-6m
 for qemu-devel@nongnu.org; Fri, 25 Nov 2022 06:41:12 -0500
Received: by mail-pj1-x1030.google.com with SMTP id
 3-20020a17090a098300b00219041dcbe9so2758339pjo.3
 for <qemu-devel@nongnu.org>; Fri, 25 Nov 2022 03:41:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=KDjVTAH8LlRrZ6tLROLGSUk6FaVM9Pw/d6Cvy7PvHO4=;
 b=WAS7UsDSdOORr5ZjmK8sEAPejxpKoDeTVIEirktZj7YCs+ES9C2Hv3hdMeSkFSPp1E
 9gH74qoH4a8jsmE0OJPqtyjfXxtdYw8ZwHCpoK4IlWEgB9yqbsr9e8xmDGQE1nj7P6gv
 RfdDISJ+/XfIhoLZ8G/5YtmfF3Ass2GWCcyB34P36jEbmpVMLzNdZtvUom8gnqM0+neH
 5iGUtDZeQgdIKGzYmOC83yDUmJX+o1wjyQH10BCiTSdBpeYNPtr/erh/Zwb235X1P91D
 TT9UGE2Ph12kpkzwlOyyM4WWV1E+wQiy4anZon6e/zoWf2IV0W2gE1MVPVKhk6NgmjMH
 ggJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=KDjVTAH8LlRrZ6tLROLGSUk6FaVM9Pw/d6Cvy7PvHO4=;
 b=snysGgldGYvpHBXwFz8H6sGbAlQ6k73cRV+nhJQLq3M88glLn9KhpMEM6I6d0zdj+i
 +DDsfo7aQifstSRHTfS0yUSzyZwqz2O6+qTpTRTEF1goPLyO26Q3tOZWeumiipYC/2Ov
 JBZXrw2dalrqMhdbYwakjo0zZpTAz/Kr7fJhxkLoHIsU/RkCHLxjUrgDOdWLTiQZdFHk
 Ie6UuVs+MTYvaiu2hVAsw/Zd3GgcH5ZH/yRB2g5sr+SVQtXXVZJ5kU9vHmqV7cLPGbE8
 W4nEkHcTpTIgShQmonDqTSeTrSA3JsWaU8hi106blLOIgoAH/NITNBjEW2wdH2s2nmgJ
 l30Q==
X-Gm-Message-State: ANoB5pmBD8ozntlpK9A+s7U1zv4H0l2r32jyoktK7PYohTgE7WWGBtaX
 HLXHltqB5vbxezqxJsudkre7EsPt1s4=
X-Google-Smtp-Source: AA0mqf7j8q4SBDRN8Kl59ppePawnekT0hTGmsltVhBMMfV7C2aXxVlHkH02Zv6wzaaiK/URwIsph1A==
X-Received: by 2002:a17:90b:4f89:b0:218:d481:6b7a with SMTP id
 qe9-20020a17090b4f8900b00218d4816b7amr15991170pjb.4.1669376469339; 
 Fri, 25 Nov 2022 03:41:09 -0800 (PST)
Received: from ubuntu.. (144.168.56.201.16clouds.com. [144.168.56.201])
 by smtp.gmail.com with ESMTPSA id
 h11-20020a62830b000000b0056c063dd4cfsm2917884pfe.66.2022.11.25.03.41.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Nov 2022 03:41:08 -0800 (PST)
From: Bin Meng <bmeng.cn@gmail.com>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Bin Meng <bin.meng@windriver.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Beraldo Leal <bleal@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>
Subject: [PATCH v2 2/4] .gitlab-ci.d/windows.yml: Keep 64-bit and 32-bit build
 scripts consistent
Date: Fri, 25 Nov 2022 19:40:58 +0800
Message-Id: <20221125114100.3184790-2-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221125114100.3184790-1-bmeng.cn@gmail.com>
References: <20221125114100.3184790-1-bmeng.cn@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1030;
 envelope-from=bmeng.cn@gmail.com; helo=mail-pj1-x1030.google.com
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

Changes in v2:
- remove "--enable-capstone"

 .gitlab-ci.d/windows.yml | 21 ++++++++++++++-------
 1 file changed, 14 insertions(+), 7 deletions(-)

diff --git a/.gitlab-ci.d/windows.yml b/.gitlab-ci.d/windows.yml
index 99d78c2213..6741c90ff1 100644
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
-      --enable-capstone --without-default-devices'
-  - .\msys64\usr\bin\bash -lc 'make'
-  - .\msys64\usr\bin\bash -lc 'make check || { cat build/meson-logs/testlog.txt; exit 1; } ;'
+  - mkdir output
+  - cd output
+  # Note: do not remove "--without-default-devices"!
+  # commit 9f8e6cad65a6 ("gitlab-ci: Speed up the msys2-64bit job by using --without-default-devices"
+  # changed to compile QEMU with the --without-default-devices switch
+  # for the msys2 64-bit job, due to the build could not complete within
+  # the project timeout.
+  - ..\msys64\usr\bin\bash -lc '../configure --target-list=x86_64-softmmu
+      --without-default-devices'
+  - ..\msys64\usr\bin\bash -lc 'make'
+  - ..\msys64\usr\bin\bash -lc 'make check || { cat meson-logs/testlog.txt; exit 1; } ;'
 
 msys2-32bit:
   extends: .shared_msys2_builder
@@ -100,10 +107,10 @@ msys2-32bit:
       mingw-w64-i686-usbredir
       mingw-w64-i686-zstd "
   - $env:CHERE_INVOKING = 'yes'  # Preserve the current working directory
-  - $env:MSYSTEM = 'MINGW32'     # Start a 32-bit MinG environment
+  - $env:MSYSTEM = 'MINGW32'     # Start a 32-bit MinGW environment
   - $env:MSYS = 'winsymlinks:native' # Enable native Windows symlink
   - mkdir output
   - cd output
-  - ..\msys64\usr\bin\bash -lc "../configure --target-list=ppc64-softmmu"
+  - ..\msys64\usr\bin\bash -lc '../configure --target-list=ppc64-softmmu'
   - ..\msys64\usr\bin\bash -lc 'make'
   - ..\msys64\usr\bin\bash -lc 'make check || { cat meson-logs/testlog.txt; exit 1; } ;'
-- 
2.34.1


