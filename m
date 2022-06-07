Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A9CE8541C07
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Jun 2022 23:57:11 +0200 (CEST)
Received: from localhost ([::1]:46352 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nyhCI-0003ph-PI
	for lists+qemu-devel@lfdr.de; Tue, 07 Jun 2022 17:57:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38672)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nyg5U-0006ug-PN
 for qemu-devel@nongnu.org; Tue, 07 Jun 2022 16:46:05 -0400
Received: from mail-pf1-x430.google.com ([2607:f8b0:4864:20::430]:41974)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nyg5R-0001J4-F1
 for qemu-devel@nongnu.org; Tue, 07 Jun 2022 16:46:03 -0400
Received: by mail-pf1-x430.google.com with SMTP id p8so16526537pfh.8
 for <qemu-devel@nongnu.org>; Tue, 07 Jun 2022 13:46:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=hL15phHiFTEeYUryTllbE9QTsXahphlhPjpE5IcwyII=;
 b=QVdmCfJ1+XHVBNsf6+tkHwaE3JYc3nRCMlyfPYQ3XeD0MpVO9c3RyKe8JXpTF0uzRL
 jwbhanIaMMbnombweeC8/M7WWMCULG58XS4hqSiNtKhwIIsr9HYdT3bH1+kqi9hVlL0J
 SMZHW1V2n23wwejuRVqItEkqmR2oKxgOkWExTFY261zRX9nYBK/Oi/LxzCnZIWUNp19M
 VPJOhS+p+gstvI1vu+mqx9A+Pb0SMcM5lwEQQSOAH2jck2XsKV8v2979hQRaY3z8yF2+
 ic3dZpipbGZD6BOkjg/yULLwBzS9JChg/LVmjvfjU9jc+5ovd/h4rz/WBn8r3+AYobdz
 bHqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=hL15phHiFTEeYUryTllbE9QTsXahphlhPjpE5IcwyII=;
 b=jruOas91RE9go8t8Ek/JjfR29ewFy2nFffqZOzJxl3lR8zRyyZH0ZduXfzcmZo7iHT
 WGlXNzCym+B2eyK47jkNq7ZC3fUJ7P5410tmp5wnr/jpMAbU1Ia9i9BRY88R8TZgoTXi
 nnWgbCxgkawmaaVlAeV41vRMKelvrW8p9VasE31eIo0NF9wEe8dI+M1zwNn7Vo230JaN
 pBWC4803SaDzRJ/al0YWQ2N+J5VDNb0Qsf/Po9sGuuWBGMK130anMID6nkV1VeHdk5cf
 H30Rwo8kOpFn2GwADQ/JAqfnAFbDvrgvU1J42Vxy2nZN/tBZt9ucNt23wrTP5dbcyeqp
 ml4w==
X-Gm-Message-State: AOAM530+4DpNHa8MkUWpiURrcqfVkq8F9wCKpagoZJ68chIk+OhlIXjI
 MaazlqFulEXEBD0dMIKwVIzBqIPK8Anu2w==
X-Google-Smtp-Source: ABdhPJyU8HNgHHK9usDHOB0btRdR945VkLK0oZ4ZalABTNbDmzjm7qLOI8hNpVsEEoGqGW5WuhW/Mg==
X-Received: by 2002:a65:6854:0:b0:3fc:d602:3cf8 with SMTP id
 q20-20020a656854000000b003fcd6023cf8mr26899641pgt.176.1654634759919; 
 Tue, 07 Jun 2022 13:45:59 -0700 (PDT)
Received: from stoup.. ([2602:ae:1547:e101:3cf2:c634:5b19:25f6])
 by smtp.gmail.com with ESMTPSA id
 r6-20020a170902be0600b00162037fbacdsm12971279pls.187.2022.06.07.13.45.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Jun 2022 13:45:59 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v4 01/53] semihosting: Move exec/softmmu-semi.h to
 semihosting/softmmu-uaccess.h
Date: Tue,  7 Jun 2022 13:45:05 -0700
Message-Id: <20220607204557.658541-2-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220607204557.658541-1-richard.henderson@linaro.org>
References: <20220607204557.658541-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::430;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x430.google.com
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

We have a subdirectory for semihosting; move this file out of exec.
Rename to emphasize the contents are a replacement for the functions
in linux-user/bsd-user uaccess.c.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
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
index b6ddaf863a..1033e751ef 100644
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


