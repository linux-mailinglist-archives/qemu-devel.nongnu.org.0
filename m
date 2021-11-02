Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9929F443951
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Nov 2021 00:04:37 +0100 (CET)
Received: from localhost ([::1]:50934 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mi2pY-0005kT-Nc
	for lists+qemu-devel@lfdr.de; Tue, 02 Nov 2021 19:04:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44704)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1mi2ew-00075y-AV
 for qemu-devel@nongnu.org; Tue, 02 Nov 2021 18:53:38 -0400
Received: from mail-io1-xd31.google.com ([2607:f8b0:4864:20::d31]:39636)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1mi2eu-0002qB-9b
 for qemu-devel@nongnu.org; Tue, 02 Nov 2021 18:53:38 -0400
Received: by mail-io1-xd31.google.com with SMTP id h81so581870iof.6
 for <qemu-devel@nongnu.org>; Tue, 02 Nov 2021 15:53:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=6DB47UhSMx0NROvdpxbbFKEeEEfM+Jod+IqssIJkyio=;
 b=YJyo8iQj8KPiGpUA+NO4uFiQIhI2eunq9LSV3pMJ80s6MTXD10JBWlMV7BySjho9wZ
 pt0q67XzmDxv9v59Jnc6UV76cKdNkgKUZGerBeR/o5B/8mEKb9HDvB2w3s+oTVmAGxfu
 ravgq5FLRsGoT1pnxmcmYB45yC5pjqfAuAiOtfraMzhdB9qRgo3jvYH50Ep9/ivRpy0+
 fmV85Bqt3rQ+L8SWpY0tdVGUpoXOQS0Trjf7kWn75RXPLY3P/ohi5FtWfJWYgxYIRudF
 02aHlJVefBHUNY6yj4l6hY5qFnMjHfUOlXVxBmyZof5euuK9AndOMuOTY1PxRP6s72pl
 kcBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=6DB47UhSMx0NROvdpxbbFKEeEEfM+Jod+IqssIJkyio=;
 b=u4u/1mXpCnLwEHl/dHYMvB9Eul4gfOpTFo1+2A1dgDg4+3Ej0AjJ7V/AHUA8gG9vy9
 idWN6qc+EQmpK4UOl0nCv1uaneA7/tj5dvTXNTD/csNC1nkG5+iThcNjyptk5Z6y5BuK
 Vyr4/CLnYKy359Nf3dPQGMEidmjI0xUx+IOjzpSTO4cFUMUMEHlJsuNMBVsCDVGNzJ3q
 0nk8XZedEJYz+PPkJ9NoSXicVhmWBMfPkiLQF5VrjsOG0Np+0tloK/Z8VfjVBYPhsdUJ
 uNL7AMVeaiVZ5MgrsTxmxsujg28Y6XR/lylIOwrvYQW9F1m/z7/ahpQwr0Q+TT+aCdhB
 olow==
X-Gm-Message-State: AOAM53340txDxZLAHSc4XG8nULR4W+OdNy1JPPmpK81j3cX2smgOYMSt
 izdDr2FQBk0uv6A7eBJBfRNS8Ef4vZnatw==
X-Google-Smtp-Source: ABdhPJwydmAVEm7p3xgADwaWtVOa60s2Q2rHjDp79xILx0soXN2+emRbdSe8eRt/xE+ggcRJuWamUQ==
X-Received: by 2002:a05:6638:22d6:: with SMTP id
 j22mr8667717jat.97.1635893615104; 
 Tue, 02 Nov 2021 15:53:35 -0700 (PDT)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174])
 by smtp.gmail.com with ESMTPSA id h14sm205427ils.75.2021.11.02.15.53.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Nov 2021 15:53:34 -0700 (PDT)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 14/30] bsd-user/arm/target_arch_thread.h: Routines to
 create and switch to a thread
Date: Tue,  2 Nov 2021 16:52:32 -0600
Message-Id: <20211102225248.52999-15-imp@bsdimp.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211102225248.52999-1-imp@bsdimp.com>
References: <20211102225248.52999-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::d31;
 envelope-from=imp@bsdimp.com; helo=mail-io1-xd31.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=unavailable autolearn_force=no
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
 Kyle Evans <kevans@FreeBSD.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Philippe Mathieu-Daude <f4bug@amsat.org>, Laurent Vivier <laurent@vivier.eu>,
 Michael Tokarev <mjt@tls.msk.ru>, Warner Losh <imp@bsdimp.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Implement target_thread_init (to create a thread) and target_set_upcall
(to switch to a thread) for arm.

Signed-off-by: Stacey Son <sson@FreeBSD.org>
Signed-off-by: Kyle Evans <kevans@FreeBSD.org>
Signed-off-by: Warner Losh <imp@bsdimp.com>
Reviewed-by: Kyle Evans <kevans@FreeBSD.org>
---
 bsd-user/arm/target_arch_thread.h | 80 +++++++++++++++++++++++++++++++
 1 file changed, 80 insertions(+)
 create mode 100644 bsd-user/arm/target_arch_thread.h

diff --git a/bsd-user/arm/target_arch_thread.h b/bsd-user/arm/target_arch_thread.h
new file mode 100644
index 0000000000..ae5b0d6c38
--- /dev/null
+++ b/bsd-user/arm/target_arch_thread.h
@@ -0,0 +1,80 @@
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
+    if (entry & 0x1) {
+        cpsr_write(env, cpsr_read(env) | CPSR_T, CPSR_T, CPSRWriteByInstr);
+    }
+}
+
+static inline void target_thread_init(struct target_pt_regs *regs,
+        struct image_info *infop)
+{
+    abi_long stack = infop->start_stack;
+    memset(regs, 0, sizeof(*regs));
+    regs->ARM_cpsr = 0x10;
+    /*
+     * Thumb mode is encoded by the low bit in the entry point (since ARM can't
+     * execute at odd addresses). When it's set, set the Thumb bit (T) in the
+     * CPSR.
+     */
+    if (infop->entry & 1) {
+        regs->ARM_cpsr |= CPSR_T;
+    }
+    regs->ARM_pc = infop->entry & 0xfffffffe;
+    regs->ARM_sp = infop->start_stack;
+    if (bsd_type == target_freebsd) {
+        regs->ARM_lr = infop->entry & 0xfffffffe;
+    }
+    /* FIXME - what to for failure of get_user()? */
+    get_user_ual(regs->ARM_r2, stack + 8); /* envp */
+    get_user_ual(regs->ARM_r1, stack + 4); /* envp */
+    /* XXX: it seems that r0 is zeroed after ! */
+    regs->ARM_r0 = 0;
+    /* For uClinux PIC binaries.  */
+    /* XXX: Linux does this only on ARM with no MMU (do we care ?) */
+    regs->ARM_r10 = infop->start_data;
+}
+
+#endif /* !_TARGET_ARCH_THREAD_H_ */
-- 
2.33.0


