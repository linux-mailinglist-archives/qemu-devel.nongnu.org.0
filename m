Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 23F50403CCA
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Sep 2021 17:48:21 +0200 (CEST)
Received: from localhost ([::1]:58132 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mNzoC-0002jt-7H
	for lists+qemu-devel@lfdr.de; Wed, 08 Sep 2021 11:48:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36560)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mNzkH-0006KE-TP
 for qemu-devel@nongnu.org; Wed, 08 Sep 2021 11:44:17 -0400
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330]:47042)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mNzkF-0002Or-C2
 for qemu-devel@nongnu.org; Wed, 08 Sep 2021 11:44:17 -0400
Received: by mail-wm1-x330.google.com with SMTP id
 m25-20020a7bcb99000000b002e751bcb5dbso1902618wmi.5
 for <qemu-devel@nongnu.org>; Wed, 08 Sep 2021 08:44:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Kzn87CUbq07JP4fXuQ2TmNBT339OoCbu3roEnkTCod8=;
 b=iZc+lfyNsfxK2F2cGrIMz/fvWvM14C2DOAFhkKuWjIRzfahRN5eGMBV95omEd6UjcN
 B0mxMIN0yMRZs0ydWN/l2sNS6ewOmjPunocefhjZDHvXO3i3c4hpO+ADYda6n+6Uzh+t
 fGTKJU5HnOKqohY74S8YK4tGuJJvEzFttiB8VlvMrJuPgkeW23uNLQzhhhDDrFvVP+Ej
 /t0s/0YDQgQcWBWyQoap/JwU1IRrQirl8fkFxkSrY/s/Hrhs8Djf5UphfFM6/TiNAlQH
 NqFj7A1+RcbMftLDY4HjYxIjQ14vlsT2v0s+pze42UsOOjVP7aWeP4XmLwixW2K6DpV+
 3UPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Kzn87CUbq07JP4fXuQ2TmNBT339OoCbu3roEnkTCod8=;
 b=zUT/btQMMAUVZuOL1Lz/1MQaf4l8460w7hXAezXZ5zTg++ujL4PDli1TT0GjUKG88u
 +9NYHTd79sfayXC9vy3bXW0lG6NAQdqO1/JKcIX58R821xgajckhIRmlJcQi5z7oDAff
 n/y/PGKEVpfT/fN3534z+ZiGJQXa0R18vPQ9vJtWbwQpv/HSRGkBOwiS2nCZ11W6MjN/
 IvqYyUEZva7nOunI1ceG2ZdgurddahxvA9rUFG21FgOokZXqpeJmhtV0hLVIZW4pBmKU
 ZEw5GmzZgQkZtvym6MmBECvI9jyLgw5tlg7a8OtYb7dpr4DQH77jLj+3k5KKA6XzkHWe
 HF8g==
X-Gm-Message-State: AOAM531YyDsRIjTOqA0XAKsk3Yq/XIFeJFQ4ki+isYX//+JHYEIP972v
 uU649NyHABpi5DGHJfWM41GR2NyD2sT9VA==
X-Google-Smtp-Source: ABdhPJysjcPIYVqYSSdkNm9f0Vz6UWZi0kYn8Ti6NBa6YCFyKwbJfXfwfKin262GKGGfdKP10jUU7Q==
X-Received: by 2002:a05:600c:4106:: with SMTP id
 j6mr4389290wmi.102.1631115853973; 
 Wed, 08 Sep 2021 08:44:13 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id s10sm2587307wrg.42.2021.09.08.08.44.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Sep 2021 08:44:13 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 8/9] linux-user: Don't include gdbstub.h in qemu.h
Date: Wed,  8 Sep 2021 16:44:04 +0100
Message-Id: <20210908154405.15417-9-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210908154405.15417-1-peter.maydell@linaro.org>
References: <20210908154405.15417-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x330.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Riku Voipio <riku.voipio@iki.fi>, Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Currently the linux-user qemu.h pulls in gdbstub.h. There's no real reason
why it should do this; include it directly from the C files which require
it, and drop the include line in qemu.h.

(Note that several of the C files previously relying on this indirect
include were going out of their way to only include gdbstub.h conditionally
on not CONFIG_USER_ONLY!)

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 linux-user/qemu.h             | 1 -
 gdbstub.c                     | 2 +-
 linux-user/exit.c             | 1 +
 linux-user/main.c             | 1 +
 linux-user/signal.c           | 2 ++
 semihosting/arm-compat-semi.c | 2 +-
 target/m68k/m68k-semi.c       | 2 +-
 target/nios2/nios2-semi.c     | 2 +-
 8 files changed, 8 insertions(+), 5 deletions(-)

diff --git a/linux-user/qemu.h b/linux-user/qemu.h
index 92290a55c0d..fda90fc28d6 100644
--- a/linux-user/qemu.h
+++ b/linux-user/qemu.h
@@ -11,7 +11,6 @@
 
 #include "syscall_defs.h"
 #include "target_syscall.h"
-#include "exec/gdbstub.h"
 
 /*
  * This is the size of the host kernel's sigset_t, needed where we make
diff --git a/gdbstub.c b/gdbstub.c
index 5d8e6ae3cd9..36b85aa50e2 100644
--- a/gdbstub.c
+++ b/gdbstub.c
@@ -31,13 +31,13 @@
 #include "qemu/cutils.h"
 #include "qemu/module.h"
 #include "trace/trace-root.h"
+#include "exec/gdbstub.h"
 #ifdef CONFIG_USER_ONLY
 #include "qemu.h"
 #else
 #include "monitor/monitor.h"
 #include "chardev/char.h"
 #include "chardev/char-fe.h"
-#include "exec/gdbstub.h"
 #include "hw/cpu/cluster.h"
 #include "hw/boards.h"
 #endif
diff --git a/linux-user/exit.c b/linux-user/exit.c
index 68a3a6f9df0..fa6ef0b9b44 100644
--- a/linux-user/exit.c
+++ b/linux-user/exit.c
@@ -17,6 +17,7 @@
  *  along with this program; if not, see <http://www.gnu.org/licenses/>.
  */
 #include "qemu/osdep.h"
+#include "exec/gdbstub.h"
 #include "qemu.h"
 #include "user-internals.h"
 #ifdef CONFIG_GPROF
diff --git a/linux-user/main.c b/linux-user/main.c
index 9edc0b22207..5ce17e423db 100644
--- a/linux-user/main.c
+++ b/linux-user/main.c
@@ -40,6 +40,7 @@
 #include "qemu/module.h"
 #include "qemu/plugin.h"
 #include "exec/exec-all.h"
+#include "exec/gdbstub.h"
 #include "tcg/tcg.h"
 #include "qemu/timer.h"
 #include "qemu/envlist.h"
diff --git a/linux-user/signal.c b/linux-user/signal.c
index 6af66123d0f..f8346f5ec5f 100644
--- a/linux-user/signal.c
+++ b/linux-user/signal.c
@@ -18,6 +18,8 @@
  */
 #include "qemu/osdep.h"
 #include "qemu/bitops.h"
+#include "exec/gdbstub.h"
+
 #include <sys/ucontext.h>
 #include <sys/resource.h>
 
diff --git a/semihosting/arm-compat-semi.c b/semihosting/arm-compat-semi.c
index 1c29146dcfa..01badea99c8 100644
--- a/semihosting/arm-compat-semi.c
+++ b/semihosting/arm-compat-semi.c
@@ -37,12 +37,12 @@
 #include "semihosting/console.h"
 #include "semihosting/common-semi.h"
 #include "qemu/timer.h"
+#include "exec/gdbstub.h"
 #ifdef CONFIG_USER_ONLY
 #include "qemu.h"
 
 #define COMMON_SEMI_HEAP_SIZE (128 * 1024 * 1024)
 #else
-#include "exec/gdbstub.h"
 #include "qemu/cutils.h"
 #ifdef TARGET_ARM
 #include "hw/arm/boot.h"
diff --git a/target/m68k/m68k-semi.c b/target/m68k/m68k-semi.c
index d919245e4f8..44ec7e4612c 100644
--- a/target/m68k/m68k-semi.c
+++ b/target/m68k/m68k-semi.c
@@ -20,11 +20,11 @@
 #include "qemu/osdep.h"
 
 #include "cpu.h"
+#include "exec/gdbstub.h"
 #if defined(CONFIG_USER_ONLY)
 #include "qemu.h"
 #define SEMIHOSTING_HEAP_SIZE (128 * 1024 * 1024)
 #else
-#include "exec/gdbstub.h"
 #include "exec/softmmu-semi.h"
 #include "hw/boards.h"
 #endif
diff --git a/target/nios2/nios2-semi.c b/target/nios2/nios2-semi.c
index e508b2fafce..fe5598bae4d 100644
--- a/target/nios2/nios2-semi.c
+++ b/target/nios2/nios2-semi.c
@@ -24,11 +24,11 @@
 #include "qemu/osdep.h"
 
 #include "cpu.h"
+#include "exec/gdbstub.h"
 #if defined(CONFIG_USER_ONLY)
 #include "qemu.h"
 #else
 #include "qemu-common.h"
-#include "exec/gdbstub.h"
 #include "exec/softmmu-semi.h"
 #endif
 #include "qemu/log.h"
-- 
2.20.1


