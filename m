Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EA59A52F68F
	for <lists+qemu-devel@lfdr.de>; Sat, 21 May 2022 02:08:48 +0200 (CEST)
Received: from localhost ([::1]:57846 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nsCfn-0002hy-Ha
	for lists+qemu-devel@lfdr.de; Fri, 20 May 2022 20:08:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59006)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nsCbK-0007zt-82
 for qemu-devel@nongnu.org; Fri, 20 May 2022 20:04:11 -0400
Received: from mail-pg1-x535.google.com ([2607:f8b0:4864:20::535]:41741)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nsCbG-0003y9-4P
 for qemu-devel@nongnu.org; Fri, 20 May 2022 20:04:07 -0400
Received: by mail-pg1-x535.google.com with SMTP id 31so8967887pgp.8
 for <qemu-devel@nongnu.org>; Fri, 20 May 2022 17:04:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=8nTEBA0ibtyn59fqrnvMD1vJ/OB33r4Ox7u7QZwpM0M=;
 b=okgZTs/gWshfiWF9hJ9WQg6ZmZB64+y4B+as/FChp6kjAjj7rkMIJcWVqSZtCrPK1+
 tNaAiA9pRp5ITZGfoBr0XO5oE4iFv/1g3sAZaWaLaexZKCBo7615Gh4ztZwC9nQejxNj
 FjxO93m4cgghF+cL7KxydpmdK0TE1jiK7mPhgv9An13YEfVw5RiljzjO6D5VqD44qmjy
 0T8HG/uBYA0DOjRIRLTii06zo49OMeeNp+erbxY+xQcAPJojDoDS9dt3Ix5kMM2ebq7R
 DnRZvLTuEbukeTrj6g/nSVOzv/FOaz4Lku1iFBFscTQa2B1sQpe/TyQayQAGgsT2yCdt
 Fsog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=8nTEBA0ibtyn59fqrnvMD1vJ/OB33r4Ox7u7QZwpM0M=;
 b=dDye6mR2SmmeYYrecU4faPsjVhqFG+1WVlXdxn2G5H29PkTC5caZT8Bf3nLi8cfIGF
 8Ei8pbqbftAyoR0/6he+hnVzdavrmwvIi+blD36P9KaoRn1o6fDTSk95H/xUoudNe/7O
 ODHZ142Qt0iRUmKaoGAIX4dwMi0I7ha/ZQsMH/JCqmeFJcmHIfWMhYtb+HFGbaMlA/cu
 92CttAq09mzBQVxKixh/MmeJJkOi1l3xhptKYtuI9EESAiv2/4f3giPmwEQyXMrOEmq1
 FHjy5o3fZ5fVppfzVQXK1zic1j/TzStq/2c4A9t3/DFyJ4kf11ZA5vLpaIyyeBbRfoVp
 w4nA==
X-Gm-Message-State: AOAM532Hc11UvrvFqh2BZtEUKbzwnSY+q2f7AN/x5M0XleA1HeWq9Bou
 MUtxGevsCfupHWA++mdK1/AGkt2blwCqVA==
X-Google-Smtp-Source: ABdhPJzdgXYPVxGNt60fcLySJBjfl+8eG6AC34zDb1Do9KNnvgMyxo8npaqqObWWL+f/KTW1hUy3/A==
X-Received: by 2002:a63:fc5e:0:b0:3db:5804:f3b with SMTP id
 r30-20020a63fc5e000000b003db58040f3bmr10746366pgk.126.1653091444415; 
 Fri, 20 May 2022 17:04:04 -0700 (PDT)
Received: from stoup.. ([71.212.142.129]) by smtp.gmail.com with ESMTPSA id
 h8-20020a654808000000b003f9d1c020cbsm306369pgs.51.2022.05.20.17.04.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 May 2022 17:04:03 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org,
	alex.bennee@linaro.org
Subject: [PATCH v3 01/49] semihosting: Move exec/softmmu-semi.h to
 semihosting/softmmu-uaccess.h
Date: Fri, 20 May 2022 17:03:12 -0700
Message-Id: <20220521000400.454525-2-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220521000400.454525-1-richard.henderson@linaro.org>
References: <20220521000400.454525-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::535;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x535.google.com
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


