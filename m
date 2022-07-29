Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F06A1584E07
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Jul 2022 11:30:16 +0200 (CEST)
Received: from localhost ([::1]:39100 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oHMJy-00007h-HP
	for lists+qemu-devel@lfdr.de; Fri, 29 Jul 2022 05:30:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44292)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oHMA6-0002WX-Lm
 for qemu-devel@nongnu.org; Fri, 29 Jul 2022 05:20:02 -0400
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c]:53039)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oHMA5-0005tC-09
 for qemu-devel@nongnu.org; Fri, 29 Jul 2022 05:20:02 -0400
Received: by mail-wm1-x32c.google.com with SMTP id c22so2242023wmr.2
 for <qemu-devel@nongnu.org>; Fri, 29 Jul 2022 02:20:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=vDDDAtTRJ4elteu1Ws3KBzxZl/nQbgq+eqnl2bGuaM8=;
 b=qZlyx0j87fPHUf5XTPkXD/AZgcM8XUJMUgJQavwv8p1CVLU94MDq5d4opqxav0JBFJ
 MFvy2kMnxLz3tzmmbDUgfXf0fQiXTrGYVEWJVhexBPrCoG4xu8oFH8bz4gC3j3+x1glL
 sRgUsCvnetqAotrOwJEVOCc8f1UdY/n6mYX2DwaXw7eNQzI67KeRqZXlVfzwQyKGleRO
 ll65ux6Bk/Ez9l4IZR1ayvqas0xs2eNOh7KXnMxRg9ZvFzXTPAgqcDQo9f40MZZTIG1O
 ghwzRDyf0hxy+q4o0uiLOjDVaFmNi0cLsaVNOsQeET9S5Rp3hN5GmNamOpmotItOdchS
 EjQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=vDDDAtTRJ4elteu1Ws3KBzxZl/nQbgq+eqnl2bGuaM8=;
 b=XcYfTePwZBerL6Q7u+PqdTeca0+FYrHs3aiEYutpbXxxCpYQ92TI0tCl26yTfHNAYH
 eClLVZjTGpkkmNDO/9lD8ggMBVuGI3NW9LGFcZdBg9o8Tf/ROXK4Fk7jWLDlzeCWT6fW
 DjtjqI6GKf0hO0eZFV12M+DXEGbNCNgUa9USc6aLrEdBY5Mv/L3SsmH0Z/2C0yjuxCGZ
 BON2ziFaghQeZO+oKymo/emaxxTiULmQ7BmIpTuk6wsrvapUH1P3gLtebmI4NT25cLwD
 6YvGM7eb/ZT3qczlAV/rL2whMehUXoqDPcidxJQdTKFMiHpWyYJFT7eNbzzETr1DaXMw
 5CiA==
X-Gm-Message-State: AJIora8ldBRaChccef9U6WnntieP/+i9oKUopuiv+jxHzBD5Z3iUrhhc
 zq3lcOTH+/HZP1RFLx+Ip/ftNO6pOjuO4Q==
X-Google-Smtp-Source: AGRyM1s3WbpX4xMbly/Nw9hFi09s0sgx/E/jFmDGXjxNdApedSI7gwAq5DRNK1RpmOIS2cqQ1ojLNw==
X-Received: by 2002:a05:600c:4296:b0:3a3:58f6:9520 with SMTP id
 v22-20020a05600c429600b003a358f69520mr1827859wmc.52.1659086399730; 
 Fri, 29 Jul 2022 02:19:59 -0700 (PDT)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 t13-20020adfe44d000000b0021e2fccea97sm3146860wrm.64.2022.07.29.02.19.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 Jul 2022 02:19:52 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 5056A1FFBD;
 Fri, 29 Jul 2022 10:19:44 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: peter.maydell@linaro.org,
	richard.henderson@linaro.org
Cc: qemu-devel@nongnu.org, Bin Meng <bin.meng@windriver.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Thomas Huth <thuth@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>
Subject: [PULL 05/13] .gitlab-ci.d/windows.yml: Enable native Windows symlink
Date: Fri, 29 Jul 2022 10:19:35 +0100
Message-Id: <20220729091943.2152410-6-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220729091943.2152410-1-alex.bennee@linaro.org>
References: <20220729091943.2152410-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32c.google.com
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
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20220725123000.807608-1-bmeng.cn@gmail.com>
Message-Id: <20220725140520.515340-6-alex.bennee@linaro.org>

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


