Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 270DA61019E
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Oct 2022 21:28:09 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oo7m8-0002KT-OS; Thu, 27 Oct 2022 14:38:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oo7kC-0001IY-GZ
 for qemu-devel@nongnu.org; Thu, 27 Oct 2022 14:36:46 -0400
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oo7k8-0003K2-Pr
 for qemu-devel@nongnu.org; Thu, 27 Oct 2022 14:36:43 -0400
Received: by mail-wm1-x334.google.com with SMTP id
 az22-20020a05600c601600b003c6b72797fdso1850935wmb.5
 for <qemu-devel@nongnu.org>; Thu, 27 Oct 2022 11:36:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=s+7e67dYziM0ASwMkluF/JHdWOtxzR9FEiDumxeR7RY=;
 b=pHOv8Uamu6/sPu+bkKUNHuL6xrn/C9MaB7gjhEUJTjOuykWZQjvp/19p1eyTTrdSd1
 ZDCk1Z1+vgnCEwXqpSjZQrtJgnGvtd+Zruy+NGSyPQ9votoLUZQC6xbqZQBgunOgSIcZ
 Nn6YidO3uPVV4xYtYImaAFCuhwigQza0DAbGorktQyj7A+51TpKhIBcboXvFtI8vaBqU
 Pc004JH+6HRacGneaoLaxE699s9QbmV7SYSwFXudoMNdwpRIvcIa4TYiNgvH+bAGMovG
 zm9zNVeYQRVUqj0ywQTg7SzEpKAV1dAxqHmdjfdiFgfvuMmeEwJJKacsKQLYIaKu80HG
 lXyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=s+7e67dYziM0ASwMkluF/JHdWOtxzR9FEiDumxeR7RY=;
 b=0vj1cBEbenyUWXwap7SSxBtwWBdM8tRP2cJMchK1pSFsikuLHyPegBrcdmGM+GjcI7
 DIce9b57WQtqXeMBZZwyIaOiZZQRb1DWEWoeyDo51bpruAqFEVi7A61d4hWV51OegEL6
 jOPJthGPKyRTjWdDJlEC/Lukpxp+x5U4nLCfLHPHmfKIcKtDbhhIP5J6sm9NSNAyJ1jm
 NFPXkdIeUjtBT6hA3B33A6fuWTOeJYjJuK8X5QV6Z/YnBpvUOkEeJN5Liw/R/z4707CN
 r5O0C7BG1fuuhSqzQWBB6A/gHV5znU0VeEa1hmXWD73c1KFsJzyDMJgJtY9NY27QjAbk
 CNjA==
X-Gm-Message-State: ACrzQf1iaYORHzhprJgRLQqx4USmGVTSJyyu988U0qT1B6y9p0W2prkl
 d3ZMA/S+bIqMpHGQNq8OYinfFg==
X-Google-Smtp-Source: AMsMyM7Xa5CDagAhJVjcOKURGhyaUFPZrIxDlCpaO6psgj8gPy0P9T/67/qehoOZcXTGQInA1tzsew==
X-Received: by 2002:a7b:c047:0:b0:3b4:adc7:1ecb with SMTP id
 u7-20020a7bc047000000b003b4adc71ecbmr6907644wmc.144.1666895799012; 
 Thu, 27 Oct 2022 11:36:39 -0700 (PDT)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 d13-20020adff84d000000b0023682011c1dsm1720871wrq.104.2022.10.27.11.36.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Oct 2022 11:36:38 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 8BB851FFBA;
 Thu, 27 Oct 2022 19:36:37 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: fam@euphon.net, berrange@redhat.com, f4bug@amsat.org, aurelien@aurel32.net,
 pbonzini@redhat.com, stefanha@redhat.com, crosa@redhat.com,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Thomas Huth <thuth@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>
Subject: [PATCH v4 02/30] tests/docker: update test-mingw to run single build
Date: Thu, 27 Oct 2022 19:36:08 +0100
Message-Id: <20221027183637.2772968-3-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221027183637.2772968-1-alex.bennee@linaro.org>
References: <20221027183637.2772968-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x334.google.com
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

While the test-build test happily run for mingw the test-mingw case
runs more of the packaging inline with what our CI does. It however
fails if we don't find both compilers and expects to be run on a
docker image with both.

Remove that distinction and make it work more like the other build
test scripts.

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 tests/docker/test-mingw | 16 ++++++----------
 1 file changed, 6 insertions(+), 10 deletions(-)

diff --git a/tests/docker/test-mingw b/tests/docker/test-mingw
index 0bc6d78872..18366972eb 100755
--- a/tests/docker/test-mingw
+++ b/tests/docker/test-mingw
@@ -13,14 +13,12 @@
 
 . common.rc
 
-requires_binary x86_64-w64-mingw32-gcc
-requires_binary i686-w64-mingw32-gcc
+requires_binary x86_64-w64-mingw32-gcc i686-w64-mingw32-gcc
 
 cd "$BUILD_DIR"
 
-for prefix in x86_64-w64-mingw32- i686-w64-mingw32-; do
-    TARGET_LIST=${TARGET_LIST:-$DEF_TARGET_LIST} \
-        build_qemu --cross-prefix=$prefix \
+TARGET_LIST=${TARGET_LIST:-$DEF_TARGET_LIST} \
+build_qemu \
         --enable-trace-backends=simple \
         --enable-gnutls \
         --enable-nettle \
@@ -29,8 +27,6 @@ for prefix in x86_64-w64-mingw32- i686-w64-mingw32-; do
         --enable-bzip2 \
         --enable-guest-agent \
         --enable-docs
-    install_qemu
-    make installer
-    make clean
-
-done
+install_qemu
+make installer
+make clean
-- 
2.34.1


