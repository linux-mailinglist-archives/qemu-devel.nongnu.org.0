Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 64ED458009A
	for <lists+qemu-devel@lfdr.de>; Mon, 25 Jul 2022 16:19:10 +0200 (CEST)
Received: from localhost ([::1]:33986 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oFyvN-0001TH-JF
	for lists+qemu-devel@lfdr.de; Mon, 25 Jul 2022 10:19:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47778)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oFyiD-0000t5-42
 for qemu-devel@nongnu.org; Mon, 25 Jul 2022 10:05:34 -0400
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e]:36723)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oFyiB-0000Da-Ev
 for qemu-devel@nongnu.org; Mon, 25 Jul 2022 10:05:32 -0400
Received: by mail-wr1-x42e.google.com with SMTP id g2so8065300wru.3
 for <qemu-devel@nongnu.org>; Mon, 25 Jul 2022 07:05:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=zdxW6z5bLU/Pb6aFUspnYaHiHoxpeGOigvgPyctL6UM=;
 b=DScNfJlMu6LtUIV1XaaONy5cibk46J2G67Fs+3r7nI+uorqtWi0/BrQAMjASrE4v0R
 NkinlXr8dVc2N31MIZ2tTPaLV4XN0R2GBjt+4apYE/JYKr1fSL9EhAHT2hJloceuG0fi
 TH0mdvMZaxCdcZTqa2+6xaRwTuD+MiaK2nJaOGE5Jj6bawO0oP6KywACryLtmJqWOQXE
 G1ItQTFQwEBxRYMo9HUn5l/ZMuqEHfZ95BqHit+oGnLo6CDy3A6j9S/X14Px3WeLKAFx
 UPvmjiTl+gciavMxtsnutG1pHMNX13zJdOdeYc4wKqw+K8yQGwY4mrH56+YVKUgm1ReA
 hfPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=zdxW6z5bLU/Pb6aFUspnYaHiHoxpeGOigvgPyctL6UM=;
 b=mURsWESUhvNCUvgxLWCHEZJ+iK6s+gPzlJ7IjxsbYN8AlL4HUHtKnGNDFTF3ubByEY
 ULVAYS+SmzDXouXnRllORkG7qYES6gvmln/0fTBAOIhMXCoeOSl79Ez+ey2Y57uYHFCq
 gjsvqlq8HkFJ6qnC2ZLlZDLvEj3pvD0LmYrydjRNg9gLIt9ro+wuwHEzYSGaoCxpks1f
 f2C5SqM32N9B/vIE+qUdjAJkzUv1OwaJvfAH19KwbJDVrdCEnbn74MmdUHhrFwspStUZ
 7K9wp11yD0mOQebCfRT9z6bya5bY/JpTe47L2F3YHXiBbelFm3eD1hmDi6OaFc5OwrkQ
 FHNg==
X-Gm-Message-State: AJIora8h+lEQcoLO04y4k01Exh/1hj0msOZkBQoloU7CKDKf8XhBbaIT
 gVKffKfrXu5JAUDogmaFKUOb8kjk3KN2PQ==
X-Google-Smtp-Source: AGRyM1sYicD2IDj7ooFNjS6KXYUZSdN99z3XMckdOWY+zlKY7Yh9JC+8KNGT0FZKleuYMWkSjWv80Q==
X-Received: by 2002:a5d:6c6b:0:b0:1ea:77ea:dde8 with SMTP id
 r11-20020a5d6c6b000000b001ea77eadde8mr7825288wrz.690.1658757929885; 
 Mon, 25 Jul 2022 07:05:29 -0700 (PDT)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 a8-20020adfe5c8000000b0021e5d77a489sm9919263wrn.31.2022.07.25.07.05.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 25 Jul 2022 07:05:25 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 1605F1FFBD;
 Mon, 25 Jul 2022 15:05:21 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: fam@euphon.net, berrange@redhat.com, f4bug@amsat.org, aurelien@aurel32.net,
 pbonzini@redhat.com, stefanha@redhat.com, crosa@redhat.com,
 peter.maydell@linaro.org, Bin Meng <bin.meng@windriver.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Thomas Huth <thuth@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>
Subject: [PATCH v1 05/13] .gitlab-ci.d/windows.yml: Enable native Windows
 symlink
Date: Mon, 25 Jul 2022 15:05:12 +0100
Message-Id: <20220725140520.515340-6-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220725140520.515340-1-alex.bennee@linaro.org>
References: <20220725140520.515340-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Message-Id: <20220725123000.807608-1-bmeng.cn@gmail.com>
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
2.30.2


