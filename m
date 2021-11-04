Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BB4D9445540
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Nov 2021 15:23:19 +0100 (CET)
Received: from localhost ([::1]:43772 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mideA-0005v8-U3
	for lists+qemu-devel@lfdr.de; Thu, 04 Nov 2021 10:23:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37300)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1midNr-0006t9-8M
 for qemu-devel@nongnu.org; Thu, 04 Nov 2021 10:06:27 -0400
Received: from mail-il1-x12f.google.com ([2607:f8b0:4864:20::12f]:33372)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1midNo-00010f-K0
 for qemu-devel@nongnu.org; Thu, 04 Nov 2021 10:06:26 -0400
Received: by mail-il1-x12f.google.com with SMTP id l19so6331298ilk.0
 for <qemu-devel@nongnu.org>; Thu, 04 Nov 2021 07:06:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=4oZ5iwXqrJmDcU+2qXHAQ++/SNnYAx62sujgKs8Ho4M=;
 b=XAfZ5Vt5r1Ugl1YVtw3+EYHA54XfZs5bP3dsKqLQPD00BC6okED8HrXQCt3VrK1/l/
 Geck2s6exQtAW+Bd2VQT/mRUMORnKLRfeAFjzDYbD3tivhRTZNA75Z91WOeePqicCA16
 UCfFU3F3bLek05hfmbobPww72pQGnhVagXBKxGzoU2XB0Gs6S5jG6euefF52A7QEjtAM
 f9FKKBO/VysHcbCJETFJ43NcZcZbFmo3brpXhvalVbFFrRAbSe1KhhVqvvMFmOqw8BZa
 mjH1WhiYaq9hA/ZbEKGXYPO01567M7408XZ1xywJSTQOyhO9ZWEoR+PqO3DLLaYSOlkt
 QGpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=4oZ5iwXqrJmDcU+2qXHAQ++/SNnYAx62sujgKs8Ho4M=;
 b=ZArFpxcB84wQ/zn3txbXuP1n/odIIAJiBlBd6KpuoeC+Qm2IZAzPCLzwBV9RxAISwE
 WoOrxkJu3XTQvZXDgOUePnstDFTqw7bmlIZ8+Jgya/OTuG+dOELRD8ImyalDvE+XQSUJ
 vU4mo6RImn+zMFtMXIzApmBcntAOk7waghO2uCr3HrHAEL4KFq6iTaa17WehseQSfR/O
 +zDV8N6zPVEgvIAEKGZvhYa2OFEDLkW0U7sAYYBJS0uWj7EHp/UMDY+TlhPDRIj7LN3D
 9rifWC1UGySa2/UETM0GeIKc8LYcPf1+v2MKTjkwpzp5wEEwNNLjKvHCh/xB/N/BLZTN
 sZPA==
X-Gm-Message-State: AOAM530BRxyPbN3LPQeMPHlFG5gml0vh7ZOzv0JgL4sLiOPks+ocOm1r
 iF1YlXTKiEG1DfxPyKVYvuewlsKNrikOWA==
X-Google-Smtp-Source: ABdhPJx0iyb1m/XwCr35/xvT13QfPJ/Iiv9J8FV6QvDgik9d50XjqpT0hse6s/QGFSCqeKiS0FvPEw==
X-Received: by 2002:a05:6e02:1aa2:: with SMTP id
 l2mr24092449ilv.114.1636034780726; 
 Thu, 04 Nov 2021 07:06:20 -0700 (PDT)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174])
 by smtp.gmail.com with ESMTPSA id l2sm3206741iln.50.2021.11.04.07.06.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 Nov 2021 07:06:20 -0700 (PDT)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 13/29] bsd-user/arm/target_arch_thread.h: Routines to
 create and switch to a thread
Date: Thu,  4 Nov 2021 08:05:20 -0600
Message-Id: <20211104140536.42573-14-imp@bsdimp.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211104140536.42573-1-imp@bsdimp.com>
References: <20211104140536.42573-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::12f;
 envelope-from=imp@bsdimp.com; helo=mail-il1-x12f.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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


