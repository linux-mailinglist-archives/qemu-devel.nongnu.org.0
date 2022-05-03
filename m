Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8126A518D7C
	for <lists+qemu-devel@lfdr.de>; Tue,  3 May 2022 21:52:50 +0200 (CEST)
Received: from localhost ([::1]:52904 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nlyZl-0005L6-HC
	for lists+qemu-devel@lfdr.de; Tue, 03 May 2022 15:52:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38808)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nlyVu-0000sc-2Q
 for qemu-devel@nongnu.org; Tue, 03 May 2022 15:48:50 -0400
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b]:35711)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nlyVs-0003Vd-Ad
 for qemu-devel@nongnu.org; Tue, 03 May 2022 15:48:49 -0400
Received: by mail-pj1-x102b.google.com with SMTP id
 w5-20020a17090aaf8500b001d74c754128so3245656pjq.0
 for <qemu-devel@nongnu.org>; Tue, 03 May 2022 12:48:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=96XCoIxFXWNe7OzxTXGAkWBiSUjrkUaQNrXa5Y9vDmM=;
 b=FxosJmDeLkZQSNaEv1jIraPAwjHrnUm3Lm9a+ZR5TTHrAOfHMe6LbKQU2AyCxlGHiW
 gNxuZVqONK0TCZIzeNP6jOyiOhkeUggVPU7HCV/rBbLl/pNybzEZvg3Tgltjqvf8r7/X
 EB0LTob5lcR3ndVV190FNwSC7kZ/qrszqlk9Y8LNzFAXyuXFpXLtMMK+/K3c0CmYq07A
 yxcLiAw56sAvm8nHL8BtmBJX9l3qW/VP4r0yxFxzEoCoSCDtnPRcLpH9hdH6zKpM2JqY
 oY5SW9OCD02SPPL5/0sNyqFZG56YvEbyhhh6AA+lffO43c3mHShFp7oSy3S/wp1MQmnt
 MtcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=96XCoIxFXWNe7OzxTXGAkWBiSUjrkUaQNrXa5Y9vDmM=;
 b=1UWryq+gYrVRg7tWwbumzILiElLf1s2iM+kulHDd2u3JZVM+lEriaUimqDi7c06RLi
 2gxpbzy5jxbB7nfjULuywleUQnNLwiF3c9Nm6tvynuBlvLzW2QhH+dTgBEyE6VwGa6q2
 wtPIdFRnK9n2Npy1XcVnJAkqu27Zbj9+B5T9C1JsoJsO7ZQDz1yCQmOpxrPdw4WDnwoq
 bYOl3Bqxfkb3cuwYZk/XFiHHNCEhwadn3TSXMDHi55BAw9cYS82Vc5ht5Ymxk87hcIBY
 hspdLjr+YExFS9K4AJn/Latlcxn5ke5MmUtvF96yt5jaHLIMYiK4P3svZJ95lmWa427V
 O+rg==
X-Gm-Message-State: AOAM530E2z0IUdWxdAyDYbQ4XVrWHCn/eFZsa9zJ5PrC3Et9V6M0O4sm
 bL5fczsBT8k9hJLV5yYYiKpZsK2qwfH8kA==
X-Google-Smtp-Source: ABdhPJwbT4Hv5DhMikuZGwICOPdTYGKVgSjMjUHSbb8O8pu0xZCOeh0BW1IsnUo2SLAbvmYXrc5vJA==
X-Received: by 2002:a17:902:7e0d:b0:156:47a4:a7c4 with SMTP id
 b13-20020a1709027e0d00b0015647a4a7c4mr18662653plm.141.1651607326238; 
 Tue, 03 May 2022 12:48:46 -0700 (PDT)
Received: from stoup.. ([71.212.142.129]) by smtp.gmail.com with ESMTPSA id
 p11-20020a17090ad30b00b001cd4989fed3sm1712383pju.31.2022.05.03.12.48.45
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 May 2022 12:48:45 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 01/74] semihosting: Move exec/softmmu-semi.h to
 semihosting/softmmu-uaccess.h
Date: Tue,  3 May 2022 12:47:30 -0700
Message-Id: <20220503194843.1379101-2-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220503194843.1379101-1-richard.henderson@linaro.org>
References: <20220503194843.1379101-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102b.google.com
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


