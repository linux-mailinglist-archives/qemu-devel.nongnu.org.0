Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E613E6C18BE
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Mar 2023 16:27:05 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1peHOt-0005tm-GV; Mon, 20 Mar 2023 11:26:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1peHOr-0005t7-Oi
 for qemu-devel@nongnu.org; Mon, 20 Mar 2023 11:26:17 -0400
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1peHOp-0006aT-7h
 for qemu-devel@nongnu.org; Mon, 20 Mar 2023 11:26:17 -0400
Received: by mail-wr1-x42a.google.com with SMTP id r29so10718750wra.13
 for <qemu-devel@nongnu.org>; Mon, 20 Mar 2023 08:26:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1679325973;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=4wW5ghWUUtpJVS2kWc+y9ru6tmtr3pjltMs5c1719Nw=;
 b=Yl8cAqBVAt1dWckk7gBZq+N1eXOfY5q9aWgarQyTNPzopKS5mYKlNWSF6+VnpgVRsJ
 fXjP8+gC/itud7lnnUAl2JeV+3C74L+ayxLw0a8qZH2QFMpMWmVmL+Tgnw+D7jb8w+4l
 2eybSFv/d4cyNtQx8adgYmh31e4CpfjUBQyQddJQER9NvcWYAj/0wC6GJHRMyMgRtPWG
 FNc17QvRrjeJOIXUYqsNMf8zu41uFI6l7ciWpaclx/S62C/Ht6ey3ASHdR1cWrlC75hy
 m8m80DrvZ8/KHilRLndw3rrn1GKEfkhR42XRdQp1xcr7l0vKSIwjhlrUpCsl1zh+jukU
 InFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679325973;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=4wW5ghWUUtpJVS2kWc+y9ru6tmtr3pjltMs5c1719Nw=;
 b=2A/JySOv1na5zZ2bce1S2CFFjPG8pvpqF5ICtvSo1VOTsf0nMGB9ohw/uiIp86cP71
 rjyxhCFWyjPcxIdbRsq1hztTIIc6e+Cn8ZjfSPcIqPKNff/6LnJvoYqGnfXtNFNQNiry
 PAHe4qmdsUVHMDxKF7bSjgcbJcQvkaPe6CFUNGCOHf+Q5kN5TzoEOqhS5NKO+VRt9lcE
 sjzXNvtsGHSv2MrmP4slkmC7YuBM2HJnZyAW1mZbdeOsyYm5YJiTfecloeJZ5rVAZ+cO
 0OEqVemje6k/ClwIvGdKPgkiP6zNiLKHxzL8acLx4Irmd0pgHPKQ+6XVzoAsD32J7QT3
 8EaQ==
X-Gm-Message-State: AO0yUKXKomWiGP5Ar/nMJ2JrdYnV/uI0O/3qsAC2Mwb/J/c9Q/kih+Ht
 Y6DHM8lzpzZXRw+s2B2yG2fqp3p3LVbKAWA7uD7vsQ==
X-Google-Smtp-Source: AK7set82VMeCiLYc92cX6ABa5vgr+/3ejc1wKOJvv7LUpo/GutfKZ5j/EJWIksRcR4PiItzdiJvYEg==
X-Received: by 2002:adf:db0c:0:b0:2d2:29a4:4457 with SMTP id
 s12-20020adfdb0c000000b002d229a44457mr10572407wri.13.1679325973072; 
 Mon, 20 Mar 2023 08:26:13 -0700 (PDT)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 x2-20020a5d60c2000000b002cfe71153b4sm9158824wrt.60.2023.03.20.08.26.12
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 20 Mar 2023 08:26:12 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Stefan Hajnoczi <stefanha@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 qemu-trivial@nongnu.org,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 qemu-block@nongnu.org, Hanna Reitz <hreitz@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH-for-8.1] block/dmg: Declare a type definition for DMG
 uncompress function
Date: Mon, 20 Mar 2023 16:26:10 +0100
Message-Id: <20230320152610.32052-1-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

Introduce the BdrvDmgUncompressFunc type defintion. To emphasis
dmg_uncompress_bz2 and dmg_uncompress_lzfse are pointer to functions,
declare them using this new typedef.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 block/dmg.h | 8 ++++----
 block/dmg.c | 7 ++-----
 2 files changed, 6 insertions(+), 9 deletions(-)

diff --git a/block/dmg.h b/block/dmg.h
index e488601b62..dcd6165e63 100644
--- a/block/dmg.h
+++ b/block/dmg.h
@@ -51,10 +51,10 @@ typedef struct BDRVDMGState {
     z_stream zstream;
 } BDRVDMGState;
 
-extern int (*dmg_uncompress_bz2)(char *next_in, unsigned int avail_in,
-                                 char *next_out, unsigned int avail_out);
+typedef int BdrvDmgUncompressFunc(char *next_in, unsigned int avail_in,
+                                  char *next_out, unsigned int avail_out);
 
-extern int (*dmg_uncompress_lzfse)(char *next_in, unsigned int avail_in,
-                                   char *next_out, unsigned int avail_out);
+extern BdrvDmgUncompressFunc *dmg_uncompress_bz2;
+extern BdrvDmgUncompressFunc *dmg_uncompress_lzfse;
 
 #endif
diff --git a/block/dmg.c b/block/dmg.c
index e10b9a2ba5..2769900359 100644
--- a/block/dmg.c
+++ b/block/dmg.c
@@ -31,11 +31,8 @@
 #include "qemu/memalign.h"
 #include "dmg.h"
 
-int (*dmg_uncompress_bz2)(char *next_in, unsigned int avail_in,
-                          char *next_out, unsigned int avail_out);
-
-int (*dmg_uncompress_lzfse)(char *next_in, unsigned int avail_in,
-                            char *next_out, unsigned int avail_out);
+BdrvDmgUncompressFunc *dmg_uncompress_bz2;
+BdrvDmgUncompressFunc *dmg_uncompress_lzfse;
 
 enum {
     /* Limit chunk sizes to prevent unreasonable amounts of memory being used
-- 
2.38.1


