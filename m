Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 776672B8EAC
	for <lists+qemu-devel@lfdr.de>; Thu, 19 Nov 2020 10:25:00 +0100 (CET)
Received: from localhost ([::1]:34868 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kfgBX-0008J7-IV
	for lists+qemu-devel@lfdr.de; Thu, 19 Nov 2020 04:24:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33304)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kfgAT-0007r9-1n
 for qemu-devel@nongnu.org; Thu, 19 Nov 2020 04:23:53 -0500
Received: from mail-wm1-x341.google.com ([2a00:1450:4864:20::341]:37252)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kfgAR-00082d-5w
 for qemu-devel@nongnu.org; Thu, 19 Nov 2020 04:23:52 -0500
Received: by mail-wm1-x341.google.com with SMTP id h21so6062390wmb.2
 for <qemu-devel@nongnu.org>; Thu, 19 Nov 2020 01:23:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Yj53cEFkdkPBJfGtqOhOnAwZS+iUdO9LlKG8+p6OSKw=;
 b=JN+6QarJgOzHr8LN+rPVDT+azw3YRl2dxiV46Yna+ZfbLecRq1UizR2YFh08h1S4vi
 Bs6PzOE7FKN676dhqLz4Wx9/3lXrQHmPXWiTQKXxWk8wNv3nZ9KaaC62XF/KcNxJEaC5
 gTfn4ZENPjEfl6YjdFkm6RVqIP04bIyyyDm4ff5IDXGxQomD8aENXWqwhlBsqJQkXjSq
 SKboFMPVBt77DO6R1j3+X+idzs6EAWRWlpr2l2Yk2oqCt0B1BlCRVAXpRCe/BWoNFW6l
 i9E1aju59AvAnz3slrjCXNU1DGVPxt0p9YtTfxqbunEV9AoTiRe+x2MQQJSMmnPI2s+s
 T/9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Yj53cEFkdkPBJfGtqOhOnAwZS+iUdO9LlKG8+p6OSKw=;
 b=Tix9Mzf3AyrNsXtBIT3kDNymO6d23+ArMNXvTYsB6hHT4HFHfUgc6gMVLfq4r3IREH
 a81clvw/109O1UVFXrs5i78JeEVqrRMCBzlSgJwkMTv4w3K8OvFZOZBPNBEadMeTQQgm
 5E7Q8/Vma+lB2YIovpYu7JLJw7whVS5leoCE46gHhpx0BvMvrL0KYLhZGWdDa0JTj0D9
 LnDcjTbBfi16eVeKRcjXAmxz3sY5bQfP/8AHVjTSER6FiS16hDE6cGEEqBsgB5d7HCj5
 L/NkbpV5l18vBYyycYt1n922UJdLn4m9WsE9Oao08YIW2aemRIsMeJWvO4wb1Zzg8BYR
 zXjQ==
X-Gm-Message-State: AOAM531DYf3fYuCaJDIwztnaiGd+AfvjEzEdcw7r5H30MPmhYnrsH+jf
 s/snm49/KU0tC1JJ7KGOd6bgqIWzPVINDA==
X-Google-Smtp-Source: ABdhPJzfMEDZc/lRRbN7eoE3BV6PzYpUnaPUt15dZ7diw1GmXNG4iy0+per0fxKpKZTeYG3ESkRBSA==
X-Received: by 2002:a1c:7f48:: with SMTP id a69mr3582444wmd.21.1605777829286; 
 Thu, 19 Nov 2020 01:23:49 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id a18sm8178699wme.18.2020.11.19.01.23.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Nov 2020 01:23:48 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH for-5.2] target/arm: Make SYS_HEAPINFO work with RAM that
 doesn't start at 0
Date: Thu, 19 Nov 2020 09:23:46 +0000
Message-Id: <20201119092346.32356-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::341;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x341.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
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
---
Marked for-5.2 as it's a relatively simple bug fix, though on the
other hand the bug has been present since forever, so if it
doesn't make it in it's not a huge deal.

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


