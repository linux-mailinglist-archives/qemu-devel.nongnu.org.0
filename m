Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B1E73CC6C2
	for <lists+qemu-devel@lfdr.de>; Sun, 18 Jul 2021 01:26:08 +0200 (CEST)
Received: from localhost ([::1]:40058 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m4th9-0002dv-MF
	for lists+qemu-devel@lfdr.de; Sat, 17 Jul 2021 19:26:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59970)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m4tcS-0001mD-8P
 for qemu-devel@nongnu.org; Sat, 17 Jul 2021 19:21:16 -0400
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330]:42536)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m4tcP-0000jQ-BH
 for qemu-devel@nongnu.org; Sat, 17 Jul 2021 19:21:16 -0400
Received: by mail-wm1-x330.google.com with SMTP id
 a23-20020a05600c2257b0290236ec98bebaso5635668wmm.1
 for <qemu-devel@nongnu.org>; Sat, 17 Jul 2021 16:21:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=NyzpfK1WCrk/eJzlVhQMae9mDkY1H1hE1WXMP7wH75I=;
 b=Eh86BrTun3iECHMeGUPOSZ45ZEd74fk5MyFYBtgMUaXS3iCH/TsF672XrJjHi1+WYG
 C3tajFgRDTKgnYeNZ2vAWjtXOLSnbIhKZTB2MbgViXBXNhd5ST3SFZgB0ov3kzN5qAi2
 50vaqaHPQQDT1IvTyclGzueGSlJxyKRdog+Ji0R+HMgCZLyrKkNfQFaqVMJueFLdYEfe
 lLFpSr5oUS/WMJ+iQ2YuJa/XCrhNRzslxby7ZJ8S4X5gNdRSPrqX6Jv1Z67jrMFC5i8Z
 GYAZMZ8DSU2p8JYZBIrcuGf8hOsvEgMI2kj+ewlSpmte8nmpw2RNFvFSS7rQ4u0WPUzu
 zX7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=NyzpfK1WCrk/eJzlVhQMae9mDkY1H1hE1WXMP7wH75I=;
 b=ewhtJOavMXWvzB95kdSiHcRict7DhvjjFgi2oYoQyQ1XJsyuQMr/4NshvnIR5z9t2L
 kuAyar/mc/WZFmFe/Nf/0GDdyOz11C6M9NoCSZhRAzfk5AV1tggcntJZ9xj/QMQut13S
 qjRAifZ3oIOLmzOEb2kcVxNdQms+qd40dUgaF8Het8racC7/iAVK4FuBH54N6imuE5bo
 hBDo0/ZuiCCS6+QTqUUB3zL4Ne75hFRkUZPON86fDgC60Ml7PNhdrB4flG6LW2/rvVOP
 BPFDmlXD4x9lijgouwFvBwX9GXI73PxEAVuhQ+XYJ/lDmUg5UNonEB9SEPtRYjq164Rp
 /9jQ==
X-Gm-Message-State: AOAM533tQ4zob2qR7B2fH4wCyxcfxR9v7FJ2Nl7H/gZxoZigQODqjxm4
 VqFMfHmM7I36AEJiNcIq+3k1U/8pH7CU/w==
X-Google-Smtp-Source: ABdhPJyi4h27mGSWsJrXFPWQibUUS0x7kNrzTMTHOmIEUmY0JRjLEO7Mz+AXowpRVZ5E8I1end7Mlg==
X-Received: by 2002:a1c:c90f:: with SMTP id f15mr24453800wmb.142.1626564072055; 
 Sat, 17 Jul 2021 16:21:12 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id o15sm7082517wmh.40.2021.07.17.16.21.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 17 Jul 2021 16:21:11 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH for-6.2 08/10] linux-user: Don't include gdbstub.h in qemu.h
Date: Sun, 18 Jul 2021 00:21:01 +0100
Message-Id: <20210717232103.18047-9-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210717232103.18047-1-peter.maydell@linaro.org>
References: <20210717232103.18047-1-peter.maydell@linaro.org>
MIME-Version: 1.0
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
Cc: Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Currently the linux-user qemu.h pulls in gdbstub.h. There's no real reason
why it should do this; include it directly from the C files which require
it, and drop the include line in qemu.h.

(Note that several of the C files previously relying on this indirect
include were going out of their way to only include gdbstub.h conditionally
on not CONFIG_USER_ONLY!)

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
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
index 52bde5bdc97..480745152b8 100644
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
index 371a0803ece..9f78be5feda 100644
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
index 21fe674de3d..8157a208efc 100644
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
index 7c14f17fb2c..ca2f585b082 100644
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


