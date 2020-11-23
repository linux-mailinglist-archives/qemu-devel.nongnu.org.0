Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E60D42C04F0
	for <lists+qemu-devel@lfdr.de>; Mon, 23 Nov 2020 12:52:59 +0100 (CET)
Received: from localhost ([::1]:47204 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1khAOv-0000hI-KH
	for lists+qemu-devel@lfdr.de; Mon, 23 Nov 2020 06:52:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55744)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1khAFs-0004ge-NC
 for qemu-devel@nongnu.org; Mon, 23 Nov 2020 06:43:36 -0500
Received: from mail-wm1-x344.google.com ([2a00:1450:4864:20::344]:37515)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1khAFq-0002ka-VW
 for qemu-devel@nongnu.org; Mon, 23 Nov 2020 06:43:36 -0500
Received: by mail-wm1-x344.google.com with SMTP id h21so16927952wmb.2
 for <qemu-devel@nongnu.org>; Mon, 23 Nov 2020 03:43:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=2EFSGdXaXPglsbHvrj9zVVUzg9trWwVra2b8EjQE1o4=;
 b=CDsGPxhla+KllnG1JLVgzNmwoXlm4tQT0xvayMctnRGXrDlLK1n0RKKHxL2R3/vxZ1
 xZ0zEE2FnTe82yBU3ITvZ2UKz7ram9joIDMKrlUzJHf2fCNjYfw4ppgntOFO3YCEYYPy
 P1n1PxBDJlmyhraq4csj0w1/jVSD45hRliVs3jlYsQ7HnLOiY1q7JhHbdEoHCpXcc3hH
 k9IXDKvcQiJ18sfuym2DdJB8wrTqRs4hX9ZErtMx02H7AnF8cZpHQVXzhsx4dabIq+WN
 JO6y5j9XGPPDOt7zkoC6rBz/pwnjIJc0ZWDGkUcNt/nwWyLBCBwEsFcELJSYNrE8PDMu
 VTnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=2EFSGdXaXPglsbHvrj9zVVUzg9trWwVra2b8EjQE1o4=;
 b=pXZQlkLzqPDR8fY4hyaqsGMjMx7ke6HMgelxB7svhw0cegh8WqrHpNqHpRrC67pQDd
 RfapuC07wRYKOx/JF91K+cV7bGAn3nwZbzyX/r35RG9T0syReTkLpeAzojRdrbkjv3x9
 ManRfo4pg+5jXf2N2LMupXN7dIlQ/M/xTI6qEeQMe+iE/3sGFsKMt9EdlMdCx2lzroX6
 ho2/v2AMwWwssBhytkoUBlG72j685gpZtBHk36HVB73ghcKNVwo6h+TVx1SRR2vIA8TJ
 fg5nrrrhBleMVNV25MwJ730jRccl25PYSO7/ALau26jTdymNXhlmklRZeS/5mjddc4M2
 RyCA==
X-Gm-Message-State: AOAM533Xw7sBUAk9sozW2uJFN/RYi9JC9ogyquLPryXzdjXzMEk6XwKY
 /8G92TJwUXRTGRQ/Zi+QHTbLLo7uxsWmeg==
X-Google-Smtp-Source: ABdhPJwHwV4x2f8ZjZU2uguTrlyI5o+BL8Y+bzc7miHfwTrJU48hg86tw8UICTVFx4UBZTbnZO4geA==
X-Received: by 2002:a1c:495:: with SMTP id 143mr24108402wme.137.1606131813285; 
 Mon, 23 Nov 2020 03:43:33 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id g186sm50836495wma.1.2020.11.23.03.43.31
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Nov 2020 03:43:32 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 14/24] target/arm: Make SYS_HEAPINFO work with RAM that doesn't
 start at 0
Date: Mon, 23 Nov 2020 11:43:05 +0000
Message-Id: <20201123114315.13372-15-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201123114315.13372-1-peter.maydell@linaro.org>
References: <20201123114315.13372-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::344;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x344.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The semihosting SYS_HEAPINFO call is supposed to return an array
of four guest addresses:
 * base of heap memory
 * limit of heap memory
 * base of stack memory
 * limit of stack memory

Some semihosting programs (including those compiled to use the
'newlib' embedded C library) use this call to work out where they
should initialize themselves to.

QEMU's implementation when in system emulation mode is very
simplistic: we say that the heap starts halfway into RAM and
continues to the end of RAM, and the stack starts at the top of RAM
and works down to the bottom.  Unfortunately the code assumes that
the base address of RAM is at address 0, so on boards like 'virt'
where this is not true the addresses returned will all be wrong and
the guest application will usually crash.

Conveniently since all Arm boards call arm_load_kernel() we have the
base address of the main RAM block in the arm_boot_info struct which
is accessible via the CPU object.  Use this to return sensible values
from SYS_HEAPINFO.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Message-id: 20201119092346.32356-1-peter.maydell@linaro.org
---
 target/arm/arm-semi.c | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/target/arm/arm-semi.c b/target/arm/arm-semi.c
index c1df664f7e5..c892e0e674e 100644
--- a/target/arm/arm-semi.c
+++ b/target/arm/arm-semi.c
@@ -36,6 +36,7 @@
 #else
 #include "exec/gdbstub.h"
 #include "qemu/cutils.h"
+#include "hw/arm/boot.h"
 #endif
 
 #define TARGET_SYS_OPEN        0x01
@@ -1014,6 +1015,9 @@ target_ulong do_arm_semihosting(CPUARMState *env)
             int i;
 #ifdef CONFIG_USER_ONLY
             TaskState *ts = cs->opaque;
+#else
+            const struct arm_boot_info *info = env->boot_info;
+            target_ulong rambase = info->loader_start;
 #endif
 
             GET_ARG(0);
@@ -1046,10 +1050,10 @@ target_ulong do_arm_semihosting(CPUARMState *env)
 #else
             limit = ram_size;
             /* TODO: Make this use the limit of the loaded application.  */
-            retvals[0] = limit / 2;
-            retvals[1] = limit;
-            retvals[2] = limit; /* Stack base */
-            retvals[3] = 0; /* Stack limit.  */
+            retvals[0] = rambase + limit / 2;
+            retvals[1] = rambase + limit;
+            retvals[2] = rambase + limit; /* Stack base */
+            retvals[3] = rambase; /* Stack limit.  */
 #endif
 
             for (i = 0; i < ARRAY_SIZE(retvals); i++) {
-- 
2.20.1


