Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 32F5F447928
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Nov 2021 05:10:47 +0100 (CET)
Received: from localhost ([::1]:35060 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mjvza-0003eX-Bm
	for lists+qemu-devel@lfdr.de; Sun, 07 Nov 2021 23:10:46 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48450)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1mjvi2-0006op-BG
 for qemu-devel@nongnu.org; Sun, 07 Nov 2021 22:52:38 -0500
Received: from [2607:f8b0:4864:20::129] (port=39456
 helo=mail-il1-x129.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1mjvhz-0002uz-2I
 for qemu-devel@nongnu.org; Sun, 07 Nov 2021 22:52:37 -0500
Received: by mail-il1-x129.google.com with SMTP id x9so15559212ilu.6
 for <qemu-devel@nongnu.org>; Sun, 07 Nov 2021 19:52:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=4oZ5iwXqrJmDcU+2qXHAQ++/SNnYAx62sujgKs8Ho4M=;
 b=PvUeTMgN885XhJuKwa4LoMcKbwULkKoBW0eTfmjnXuT0KtKY4bL4ZwKhqNkWLbyg2F
 yLnWWoSVBPunLqZA3wieBmnI/aIKLVCbMO8ouYrmntFh/9vCmAAtXYPsuNj2kW8B06D5
 2v+2sboCWdWClzcac2u92UEDGl/xFyd+54tK/ZkAYUYsp2qiObysJ4dEbIpJibQd+cKn
 m/7AkpsImVe5k4Rd8f7oCHcFL7lpW2i6lc0X0VGRLZT1O+LBlF1ZNdmJSM/VbmaGMTb/
 WQU7EXXrXzJamGWAe6zlovFiK+t6tWIJKkHlY0Roknfpg+XNEOtKu5O63tK9BQUY/s4n
 zgAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=4oZ5iwXqrJmDcU+2qXHAQ++/SNnYAx62sujgKs8Ho4M=;
 b=N724P0oclTh0R0n9AJOEqvdOCLdxleB2j3eOcZmQLqwGyp4K1CXv162YTZfI5G09b1
 QRAlLIuj4RdJLYgQg/rjpT2cZMO3fV/A5/8IhBw5Ffbi2dCBRQRUlzg+ULYKbUiqdVSR
 WQmLxNfplYNI/FW+BuvZg9mHbVSCyW+Idk15it7FAGeuKYprdmN3izrtIRt69Gu32boP
 Y1KlW5AeFxoy4RkANR6ljE8HOm3ajBzHQ/0LkVerEDebMMV0ifMsH2w8iXXRLokdpd2n
 lBXlPjIxVNzR3GjslzO/XMdYe+q3KzLsR9KOOe2yZqVRtpPVuHWI+ksEBAlhKo4RIpFh
 Ft0w==
X-Gm-Message-State: AOAM533CmH+JGXAWx/272TUweXvW3jkiBWInTt/+mkPxTc227BeWvnh0
 ldBzsbxzzEhXuv4G44l93ZhHPV+W/sOkSg==
X-Google-Smtp-Source: ABdhPJz8xGzgiab25RBf/itPVeHqnz0njYapsXV1UTiJ3llF7+cP1k5Cgbx/pQEen50H7NATQvAXVQ==
X-Received: by 2002:a92:dc0c:: with SMTP id t12mr46060285iln.198.1636343553575; 
 Sun, 07 Nov 2021 19:52:33 -0800 (PST)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174])
 by smtp.gmail.com with ESMTPSA id x15sm876909iob.8.2021.11.07.19.52.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 07 Nov 2021 19:52:33 -0800 (PST)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 25/37] bsd-user/arm/target_arch_thread.h: Routines to
 create and switch to a thread
Date: Sun,  7 Nov 2021 20:51:24 -0700
Message-Id: <20211108035136.43687-26-imp@bsdimp.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211108035136.43687-1-imp@bsdimp.com>
References: <20211108035136.43687-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::129
 (failed)
Received-SPF: none client-ip=2607:f8b0:4864:20::129;
 envelope-from=imp@bsdimp.com; helo=mail-il1-x129.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=no autolearn_force=no
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
Cc: Stacey Son <sson@FreeBSD.org>, qemu-trivial@nongnu.org,
 Kyle Evans <kevans@FreeBSD.org>, Michael Tokarev <mjt@tls.msk.ru>,
 Laurent Vivier <laurent@vivier.eu>, Philippe Mathieu-Daude <f4bug@amsat.org>,
 Richard Henderson <richard.henderson@linaro.org>, Warner Losh <imp@bsdimp.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Implement target_thread_init (to create a thread) and target_set_upcall
(to switch to a thread) for arm.

Signed-off-by: Stacey Son <sson@FreeBSD.org>
Signed-off-by: Kyle Evans <kevans@FreeBSD.org>
Signed-off-by: Warner Losh <imp@bsdimp.com>
Reviewed-by: Kyle Evans <kevans@FreeBSD.org>
---
 bsd-user/arm/target_arch_thread.h | 82 +++++++++++++++++++++++++++++++
 1 file changed, 82 insertions(+)
 create mode 100644 bsd-user/arm/target_arch_thread.h

diff --git a/bsd-user/arm/target_arch_thread.h b/bsd-user/arm/target_arch_thread.h
new file mode 100644
index 0000000000..11c7f76583
--- /dev/null
+++ b/bsd-user/arm/target_arch_thread.h
@@ -0,0 +1,82 @@
+/*
+ *  arm thread support
+ *
+ *  Copyright (c) 2013 Stacey D. Son
+ *
+ *  This program is free software; you can redistribute it and/or modify
+ *  it under the terms of the GNU General Public License as published by
+ *  the Free Software Foundation; either version 2 of the License, or
+ *  (at your option) any later version.
+ *
+ *  This program is distributed in the hope that it will be useful,
+ *  but WITHOUT ANY WARRANTY; without even the implied warranty of
+ *  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ *  GNU General Public License for more details.
+ *
+ *  You should have received a copy of the GNU General Public License
+ *  along with this program; if not, see <http://www.gnu.org/licenses/>.
+ */
+#ifndef _TARGET_ARCH_THREAD_H_
+#define _TARGET_ARCH_THREAD_H_
+
+/* Compare to arm/arm/vm_machdep.c cpu_set_upcall_kse() */
+static inline void target_thread_set_upcall(CPUARMState *env, abi_ulong entry,
+    abi_ulong arg, abi_ulong stack_base, abi_ulong stack_size)
+{
+    abi_ulong sp;
+
+    /*
+     * Make sure the stack is properly aligned.
+     * arm/include/param.h (STACKLIGN() macro)
+     */
+    sp = (u_int)(stack_base + stack_size) & ~0x7;
+
+    /* sp = stack base */
+    env->regs[13] = sp;
+    /* pc = start function entry */
+    env->regs[15] = entry & 0xfffffffe;
+    /* r0 = arg */
+    env->regs[0] = arg;
+    env->spsr = ARM_CPU_MODE_USR;
+    /*
+     * Thumb mode is encoded by the low bit in the entry point (since ARM can't
+     * execute at odd addresses). When it's set, set the Thumb bit (T) in the
+     * CPSR.
+     */
+    cpsr_write(env, (entry & 1) * CPSR_T, CPSR_T, CPSRWriteByInstr);
+}
+
+static inline void target_thread_init(struct target_pt_regs *regs,
+        struct image_info *infop)
+{
+    abi_long stack = infop->start_stack;
+    memset(regs, 0, sizeof(*regs));
+    regs->ARM_cpsr = ARM_CPU_MODE_USR;
+    /*
+     * Thumb mode is encoded by the low bit in the entry point (since ARM can't
+     * execute at odd addresses). When it's set, set the Thumb bit (T) in the
+     * CPSR.
+     */
+    if (infop->entry & 1) {
+        regs->ARM_cpsr |= CPSR_T;
+    }
+    regs->ARM_pc = infop->entry & 0xfffffffe;
+    regs->ARM_sp = stack;
+    if (bsd_type == target_freebsd) {
+        regs->ARM_lr = infop->entry & 0xfffffffe;
+    }
+    /*
+     * FreeBSD kernel passes the ps_strings pointer in r0. This is used by some
+     * programs to set status messages that we see in ps. bsd-user doesn't
+     * support that functionality, so it's ignored. When set to 0, FreeBSD's csu
+     * code ignores it. For the static case, r1 and r2 are effectively ignored
+     * by the csu __startup() routine. For the dynamic case, rtld saves r0 but
+     * generates r1 and r2 and passes them into the csu _startup.
+     *
+     * r0 ps_strings 0 passed since ps arg setting not supported
+     * r1 obj_main   ignored by _start(), so 0 passed
+     * r2 cleanup    generated by rtld or ignored by _start(), so 0 passed
+     */
+}
+
+#endif /* !_TARGET_ARCH_THREAD_H_ */
-- 
2.33.0


