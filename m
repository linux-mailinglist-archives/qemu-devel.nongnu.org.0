Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A39E4515DA1
	for <lists+qemu-devel@lfdr.de>; Sat, 30 Apr 2022 15:34:51 +0200 (CEST)
Received: from localhost ([::1]:52162 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nknFK-00053x-Pk
	for lists+qemu-devel@lfdr.de; Sat, 30 Apr 2022 09:34:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55574)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nknAI-0004eF-W5
 for qemu-devel@nongnu.org; Sat, 30 Apr 2022 09:29:39 -0400
Received: from mail-pg1-x52a.google.com ([2607:f8b0:4864:20::52a]:42634)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nknAH-0006CU-5o
 for qemu-devel@nongnu.org; Sat, 30 Apr 2022 09:29:38 -0400
Received: by mail-pg1-x52a.google.com with SMTP id bg9so8493306pgb.9
 for <qemu-devel@nongnu.org>; Sat, 30 Apr 2022 06:29:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=96XCoIxFXWNe7OzxTXGAkWBiSUjrkUaQNrXa5Y9vDmM=;
 b=Y2X0oNMtOoWplti87uXxcjno/x4sZmMulwUCrLdlAiCNMEMpfBxt4KPGA+fPrn2N/+
 kPJUOyZxuHa/vQETYsnTgMz/3cExIg7VK3UeXW67v873+2cb7aS81404diaCYWzRMaBS
 Y2GclQTXDryLaWVhrKNKcH/ySJ/wEgLYoanvzDNZ2dAtejwCcoyqXP4KfZjhgOp/Tuoe
 QKjINdd3eiUt6Aonbs7gHDsJbP8+toP88eeChepEIAAIXOXVpXrFucrgi+fJZ8FPGQd/
 o9HUKpA2gFse5DWKXA+LPz798ZmCv8LoIgYGc7VonMz62zWF8X5IhoI/WUqPZI882QDu
 VRzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=96XCoIxFXWNe7OzxTXGAkWBiSUjrkUaQNrXa5Y9vDmM=;
 b=k9L5nerQAn8O4K9fuUwmnZsHhI1BwIkmwkr3LNkyJLCoA50cL8OR2f7XD3YnTcxCf+
 CYCGaLmEBPBwrHmKWq4jbih0UO7furU8yXLBwHDWrV99Pyn8nlOc1ZH24ZVbCk0Ma1uz
 KYYP1DG/jEMqEDX/vNz2E6xvFUnfC2Ymb8hnhbqic7TRxoHG1iBVYqBh9hdLHL6p/JX3
 ypRCpay4a+Dxgr8wkG3g6nV5PgzvFNXvbpyxPDvZa8/cJYfWkam76u1h6JQasdmpvJjG
 u5Zq5WSE2Cd8obCDHfybJXXWdsCQNbktzWFdry+D7xNE6AvUhjMmX2nTmOO4p/PEOqXb
 0NTg==
X-Gm-Message-State: AOAM530aWPkjK2t1xzvp8gL1k6vDjFzFlU5zuCf/qjGXF8rcRGW86qdg
 q3StvMEThhrUhp9n08ZMJ+ctfUzB+NK3Tg==
X-Google-Smtp-Source: ABdhPJzz4tT2nNjhZR0GLRsrBXpwntjGhIScFqIznjOPpcA3HefYjwRn6nJ8GUYXH0eJJx2QbAJI3Q==
X-Received: by 2002:a63:1b5e:0:b0:3aa:593c:9392 with SMTP id
 b30-20020a631b5e000000b003aa593c9392mr3146605pgm.470.1651325375256; 
 Sat, 30 Apr 2022 06:29:35 -0700 (PDT)
Received: from stoup.. ([71.212.142.129]) by smtp.gmail.com with ESMTPSA id
 x5-20020aa793a5000000b0050dc7628201sm1522606pff.219.2022.04.30.06.29.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 30 Apr 2022 06:29:34 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 01/43] semihosting: Move exec/softmmu-semi.h to
 semihosting/softmmu-uaccess.h
Date: Sat, 30 Apr 2022 06:28:50 -0700
Message-Id: <20220430132932.324018-2-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220430132932.324018-1-richard.henderson@linaro.org>
References: <20220430132932.324018-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52a.google.com
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
Cc: crwulff@gmail.com, alex.bennee@linaro.org, f4bug@amsat.org,
 laurent@vivier.eu
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We have a subdirectory for semihosting; move this file out of exec.
Rename to emphasize the contents are a replacement for the functions
in linux-user/bsd-user uaccess.c.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 .../{exec/softmmu-semi.h => semihosting/softmmu-uaccess.h}  | 6 +++---
 semihosting/arm-compat-semi.c                               | 2 +-
 target/m68k/m68k-semi.c                                     | 2 +-
 target/mips/tcg/sysemu/mips-semi.c                          | 2 +-
 target/nios2/nios2-semi.c                                   | 2 +-
 5 files changed, 7 insertions(+), 7 deletions(-)
 rename include/{exec/softmmu-semi.h => semihosting/softmmu-uaccess.h} (95%)

diff --git a/include/exec/softmmu-semi.h b/include/semihosting/softmmu-uaccess.h
similarity index 95%
rename from include/exec/softmmu-semi.h
rename to include/semihosting/softmmu-uaccess.h
index fbcae88f4b..e69e3c8548 100644
--- a/include/exec/softmmu-semi.h
+++ b/include/semihosting/softmmu-uaccess.h
@@ -7,8 +7,8 @@
  * This code is licensed under the GPL
  */
 
-#ifndef SOFTMMU_SEMI_H
-#define SOFTMMU_SEMI_H
+#ifndef SEMIHOSTING_SOFTMMU_UACCESS_H
+#define SEMIHOSTING_SOFTMMU_UACCESS_H
 
 #include "cpu.h"
 
@@ -98,4 +98,4 @@ static void softmmu_unlock_user(CPUArchState *env, void *p, target_ulong addr,
 }
 #define unlock_user(s, args, len) softmmu_unlock_user(env, s, args, len)
 
-#endif
+#endif /* SEMIHOSTING_SOFTMMU_UACCESS_H */
diff --git a/semihosting/arm-compat-semi.c b/semihosting/arm-compat-semi.c
index 7a51fd0737..dbef280b87 100644
--- a/semihosting/arm-compat-semi.c
+++ b/semihosting/arm-compat-semi.c
@@ -370,7 +370,7 @@ static GuestFD *get_guestfd(int guestfd)
 #ifndef CONFIG_USER_ONLY
 static target_ulong syscall_err;
 
-#include "exec/softmmu-semi.h"
+#include "semihosting/softmmu-uaccess.h"
 #endif
 
 static inline uint32_t set_swi_errno(CPUState *cs, uint32_t code)
diff --git a/target/m68k/m68k-semi.c b/target/m68k/m68k-semi.c
index 37343d47e2..a31db38fc3 100644
--- a/target/m68k/m68k-semi.c
+++ b/target/m68k/m68k-semi.c
@@ -25,7 +25,7 @@
 #include "qemu.h"
 #define SEMIHOSTING_HEAP_SIZE (128 * 1024 * 1024)
 #else
-#include "exec/softmmu-semi.h"
+#include "semihosting/softmmu-uaccess.h"
 #include "hw/boards.h"
 #endif
 #include "qemu/log.h"
diff --git a/target/mips/tcg/sysemu/mips-semi.c b/target/mips/tcg/sysemu/mips-semi.c
index b4a383ae90..6d6296e709 100644
--- a/target/mips/tcg/sysemu/mips-semi.c
+++ b/target/mips/tcg/sysemu/mips-semi.c
@@ -21,7 +21,7 @@
 #include "cpu.h"
 #include "qemu/log.h"
 #include "exec/helper-proto.h"
-#include "exec/softmmu-semi.h"
+#include "semihosting/softmmu-uaccess.h"
 #include "semihosting/semihost.h"
 #include "semihosting/console.h"
 
diff --git a/target/nios2/nios2-semi.c b/target/nios2/nios2-semi.c
index ec88474a73..373e6b9436 100644
--- a/target/nios2/nios2-semi.c
+++ b/target/nios2/nios2-semi.c
@@ -28,7 +28,7 @@
 #if defined(CONFIG_USER_ONLY)
 #include "qemu.h"
 #else
-#include "exec/softmmu-semi.h"
+#include "semihosting/softmmu-uaccess.h"
 #endif
 #include "qemu/log.h"
 
-- 
2.34.1


