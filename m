Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B36E63FF85E
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Sep 2021 02:28:03 +0200 (CEST)
Received: from localhost ([::1]:51254 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mLx3q-0005la-Ic
	for lists+qemu-devel@lfdr.de; Thu, 02 Sep 2021 20:28:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59002)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1mLwRR-0007CJ-QU
 for qemu-devel@nongnu.org; Thu, 02 Sep 2021 19:48:21 -0400
Received: from mail-il1-x12e.google.com ([2607:f8b0:4864:20::12e]:33766)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1mLwRO-0003Bs-3C
 for qemu-devel@nongnu.org; Thu, 02 Sep 2021 19:48:21 -0400
Received: by mail-il1-x12e.google.com with SMTP id z2so3603092iln.0
 for <qemu-devel@nongnu.org>; Thu, 02 Sep 2021 16:48:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=LNbH1I77zy3cQ+KkOf+Ir3agYJUL7LCubRGwYCm4scg=;
 b=RCoJVkCGNIGrh2qQGmuFls2LXO+QLcB8u5T/ohtMCIWEICiMQ8xATU+80pfvvsW/Q1
 BAScU2srD8F3Z2Me7Wr58+q9FdpcRB7NRAHWddpzguEtIB85a7FApyEYVqrb8BMPHGtL
 Zf2CUAQ75I+UBJMLejHIz+fZyMDasBycilYN2POTO/awBhgAJnP2/Nm/lohUcFy/KMbG
 Vey3/RrEDHX1tqK2bvnPDbNwdk+F7ftDgj/yApwQSP0U62CWQghL0Jf+rDJw5eDnmYKD
 RcEAcwX5zUAKxn7n6xgp+GxywoGj8FNaBfWAKxYQeMAxV/iUeBDsl3cP4OejstE86qcU
 ty/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=LNbH1I77zy3cQ+KkOf+Ir3agYJUL7LCubRGwYCm4scg=;
 b=CYgBby9doJBLTJ17xc0Y8bYvoKfLUxcyBSW37BptrTYfBMifV5wB/NEoc/JDLIcoj4
 /It88O6J2s6wFOhgRpyQGxS9cqlRxxrqhk6tAhT8p0lPhVE5wSl3DU3TbrOYuPFjg+7x
 xfntDnKzwFUDl0Bxgx6+LP8U50WGTTuprbbzdb8RupwC9Y6BvVGGbizGeRtpDIPhpnQp
 tsSId0/yJgnJVtWYkdV05TZK18gbGMJf2VuPXL4U3Bho/spZ8eLxIbrMwCCTa2F+v+FB
 KCkLjybX2UpTDp0gsgDk1jqV78X8woHJ7wx4IHiyVYsyfGnLPcgGOHSkOq6OryQw+q1c
 OS3A==
X-Gm-Message-State: AOAM532KgFV3yht6jZoHMnqjeGQrZG6a3lKGlQyxopEYl6lFpE6kum1h
 pFrfA6nP+6SAFxCnatlgWzWo+n+GM79qZa2r
X-Google-Smtp-Source: ABdhPJwJZsOebE17fVqrWQX1EOtTtgotQGkqaJPCXDLygZZ728n2CmqUR3DssXpvLtvD7r0P1NNoAg==
X-Received: by 2002:a92:d606:: with SMTP id w6mr551833ilm.28.1630626496734;
 Thu, 02 Sep 2021 16:48:16 -0700 (PDT)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174])
 by smtp.gmail.com with ESMTPSA id u10sm1740502ilg.15.2021.09.02.16.48.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Sep 2021 16:48:16 -0700 (PDT)
From: imp@bsdimp.com
To: qemu-devel@nongnu.org
Subject: [PATCH v3 35/43] bsd-user: Add target_arch_reg to describe a target's
 register set
Date: Thu,  2 Sep 2021 17:47:21 -0600
Message-Id: <20210902234729.76141-36-imp@bsdimp.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210902234729.76141-1-imp@bsdimp.com>
References: <20210902234729.76141-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::12e;
 envelope-from=imp@bsdimp.com; helo=mail-il1-x12e.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: kevans@freebsd.org, Richard Henderson <richard.henderson@linaro.org>,
 Warner Losh <imp@FreeBSD.org>, Warner Losh <imp@bsdimp.com>,
 Stacey Son <sson@FreeBSD.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Warner Losh <imp@FreeBSD.org>

target_reg_t is the normal register. target_fpreg_t is the floating
point registers. target_copy_regs copies the registers out of CPU
context for things like core dumps.

Signed-off-by: Stacey Son <sson@FreeBSD.org>
Signed-off-by: Warner Losh <imp@bsdimp.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 bsd-user/i386/target_arch_reg.h   | 82 +++++++++++++++++++++++++++
 bsd-user/x86_64/target_arch_reg.h | 92 +++++++++++++++++++++++++++++++
 2 files changed, 174 insertions(+)
 create mode 100644 bsd-user/i386/target_arch_reg.h
 create mode 100644 bsd-user/x86_64/target_arch_reg.h

diff --git a/bsd-user/i386/target_arch_reg.h b/bsd-user/i386/target_arch_reg.h
new file mode 100644
index 0000000000..1fce1daf01
--- /dev/null
+++ b/bsd-user/i386/target_arch_reg.h
@@ -0,0 +1,82 @@
+/*
+ *  FreeBSD i386 register structures
+ *
+ *  Copyright (c) 2015 Stacey Son
+ *  All rights reserved.
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
+
+#ifndef _TARGET_ARCH_REG_H_
+#define _TARGET_ARCH_REG_H_
+
+/* See sys/i386/include/reg.h */
+typedef struct target_reg {
+    uint32_t        r_fs;
+    uint32_t        r_es;
+    uint32_t        r_ds;
+    uint32_t        r_edi;
+    uint32_t        r_esi;
+    uint32_t        r_ebp;
+    uint32_t        r_isp;
+    uint32_t        r_ebx;
+    uint32_t        r_edx;
+    uint32_t        r_ecx;
+    uint32_t        r_eax;
+    uint32_t        r_trapno;
+    uint32_t        r_err;
+    uint32_t        r_eip;
+    uint32_t        r_cs;
+    uint32_t        r_eflags;
+    uint32_t        r_esp;
+    uint32_t        r_ss;
+    uint32_t        r_gs;
+} target_reg_t;
+
+typedef struct target_fpreg {
+    uint32_t        fpr_env[7];
+    uint8_t         fpr_acc[8][10];
+    uint32_t        fpr_ex_sw;
+    uint8_t         fpr_pad[64];
+} target_fpreg_t;
+
+static inline void target_copy_regs(target_reg_t *regs, const CPUX86State *env)
+{
+
+    regs->r_fs = env->segs[R_FS].selector & 0xffff;
+    regs->r_es = env->segs[R_ES].selector & 0xffff;
+    regs->r_ds = env->segs[R_DS].selector & 0xffff;
+
+    regs->r_edi = env->regs[R_EDI];
+    regs->r_esi = env->regs[R_ESI];
+    regs->r_ebp = env->regs[R_EBP];
+    /* regs->r_isp = env->regs[R_ISP]; XXX */
+    regs->r_ebx = env->regs[R_EBX];
+    regs->r_edx = env->regs[R_EDX];
+    regs->r_ecx = env->regs[R_ECX];
+    regs->r_eax = env->regs[R_EAX];
+    /* regs->r_trapno = env->regs[R_TRAPNO]; XXX */
+    regs->r_err = env->error_code;  /* XXX ? */
+    regs->r_eip = env->eip;
+
+    regs->r_cs = env->segs[R_CS].selector & 0xffff;
+
+    regs->r_eflags = env->eflags;
+    regs->r_esp = env->regs[R_ESP];
+
+    regs->r_ss = env->segs[R_SS].selector & 0xffff;
+    regs->r_gs = env->segs[R_GS].selector & 0xffff;
+}
+
+#endif /* !_TARGET_ARCH_REG_H_ */
diff --git a/bsd-user/x86_64/target_arch_reg.h b/bsd-user/x86_64/target_arch_reg.h
new file mode 100644
index 0000000000..00e9624517
--- /dev/null
+++ b/bsd-user/x86_64/target_arch_reg.h
@@ -0,0 +1,92 @@
+/*
+ *  FreeBSD amd64 register structures
+ *
+ *  Copyright (c) 2015 Stacey Son
+ *  All rights reserved.
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
+
+#ifndef _TARGET_ARCH_REG_H_
+#define _TARGET_ARCH_REG_H_
+
+/* See sys/amd64/include/reg.h */
+typedef struct target_reg {
+    uint64_t        r_r15;
+    uint64_t        r_r14;
+    uint64_t        r_r13;
+    uint64_t        r_r12;
+    uint64_t        r_r11;
+    uint64_t        r_r10;
+    uint64_t        r_r9;
+    uint64_t        r_r8;
+    uint64_t        r_rdi;
+    uint64_t        r_rsi;
+    uint64_t        r_rbp;
+    uint64_t        r_rbx;
+    uint64_t        r_rdx;
+    uint64_t        r_rcx;
+    uint64_t        r_rax;
+    uint32_t        r_trapno;
+    uint16_t        r_fs;
+    uint16_t        r_gs;
+    uint32_t        r_err;
+    uint16_t        r_es;
+    uint16_t        r_ds;
+    uint64_t        r_rip;
+    uint64_t        r_cs;
+    uint64_t        r_rflags;
+    uint64_t        r_rsp;
+    uint64_t        r_ss;
+} target_reg_t;
+
+typedef struct target_fpreg {
+    uint64_t        fpr_env[4];
+    uint8_t         fpr_acc[8][16];
+    uint8_t         fpr_xacc[16][16];
+    uint64_t        fpr_spare[12];
+} target_fpreg_t;
+
+static inline void target_copy_regs(target_reg_t *regs, const CPUX86State *env)
+{
+
+    regs->r_r15 = env->regs[15];
+    regs->r_r14 = env->regs[14];
+    regs->r_r13 = env->regs[13];
+    regs->r_r12 = env->regs[12];
+    regs->r_r11 = env->regs[11];
+    regs->r_r10 = env->regs[10];
+    regs->r_r9 = env->regs[9];
+    regs->r_r8 = env->regs[8];
+    regs->r_rdi = env->regs[R_EDI];
+    regs->r_rsi = env->regs[R_ESI];
+    regs->r_rbp = env->regs[R_EBP];
+    regs->r_rbx = env->regs[R_EBX];
+    regs->r_rdx = env->regs[R_EDX];
+    regs->r_rcx = env->regs[R_ECX];
+    regs->r_rax = env->regs[R_EAX];
+    /* regs->r_trapno = env->regs[R_TRAPNO]; XXX */
+    regs->r_fs = env->segs[R_FS].selector & 0xffff;
+    regs->r_gs = env->segs[R_GS].selector & 0xffff;
+    regs->r_err = env->error_code;  /* XXX ? */
+    regs->r_es = env->segs[R_ES].selector & 0xffff;
+    regs->r_ds = env->segs[R_DS].selector & 0xffff;
+    regs->r_rip = env->eip;
+    regs->r_cs = env->segs[R_CS].selector & 0xffff;
+    regs->r_rflags = env->eflags;
+    regs->r_rsp = env->regs[R_ESP];
+    regs->r_ss = env->segs[R_SS].selector & 0xffff;
+}
+
+#endif /* !_TARGET_ARCH_REG_H_ */
-- 
2.32.0


