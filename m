Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 546474D111A
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Mar 2022 08:36:07 +0100 (CET)
Received: from localhost ([::1]:56066 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nRUO6-0001zS-EE
	for lists+qemu-devel@lfdr.de; Tue, 08 Mar 2022 02:36:06 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44994)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nRU8t-00053f-8S
 for qemu-devel@nongnu.org; Tue, 08 Mar 2022 02:20:23 -0500
Received: from [2607:f8b0:4864:20::631] (port=39820
 helo=mail-pl1-x631.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nRU8r-0006HO-Mz
 for qemu-devel@nongnu.org; Tue, 08 Mar 2022 02:20:22 -0500
Received: by mail-pl1-x631.google.com with SMTP id 9so16270797pll.6
 for <qemu-devel@nongnu.org>; Mon, 07 Mar 2022 23:20:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=R0uQojsF6Si9+ZGBrS1uBiVdf/vsBcUNuv5jEVpHMiw=;
 b=CaBb2t3i0XB2x91r+eFkXRZlMuEusdlfAVRpOqmUMgOP/BDfrgslv5WefG/spgbCgp
 QDyXY95oZPH92WQ0CIYN6FE57lhz4yubPUrb74r623fLy4r444vz7JEVhM0vMP3nVJ/s
 Wc8NtTFWL7nnMaa0Mq8RQqdqQsViHqqrNo6CDaHl+1sCXYaRDy+WR6bNoE1rtl3kWrbP
 iB20eyxcHKJGHXMD9VynwAaryZzGP0SobKZCQ0FhF3bM59B9ujFi1arFbPvXYv1aL1xk
 MLDAKxyckH5tKQbj26slGRkdjGbVCPyQb96657GzRmxZ2t83u2KcbhySFlwHyndP2fVu
 aDzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=R0uQojsF6Si9+ZGBrS1uBiVdf/vsBcUNuv5jEVpHMiw=;
 b=wvdtidK7IorUTxz32tfE89leJvaS9kz511bHyHy4/AusyEVHfw1UDPQ5wpO6AGoxER
 6s/1OOnrbTyZy1eZpJbcLpBF/rSVkLu9sQryBGeSPUqD/GP7OfMJjjW9oGSDje2XLb0R
 kFO3nmYr0znSEVcQTzPsCaSG7D3kIoQbUGBt9KhBZBrarOF/SOAaTFQzCQSatq+6Z3Jv
 KAHtjRBl3cdKoVpM/LVKTWR9lRjdlgLmtHN0lG+dWapPqBJZ98ycUIjD5PnTSLt/wCqm
 R1T4IbgecPz5uTvVtOgd3Ctm61NG3/f1fu6wxIUztEQ5p4/WymGTLnt6yQpc9vxfvs5A
 W6XA==
X-Gm-Message-State: AOAM531kD66l8VRZMYadoA1VqsxyVoi2tA84+/KqCwJgNxmTQd1zmmQV
 jv2YERL6IMCPZth5Yx/z2HG79mZA4sHhfg==
X-Google-Smtp-Source: ABdhPJxUB0gi4gU0WYQvjEIPtPv7u/dbjKmWkVsNCQqkcrTjTS+60umD79qj4AS/TqhfDTPT2GmxSQ==
X-Received: by 2002:a17:90a:7c09:b0:1bc:a2fd:d4d8 with SMTP id
 v9-20020a17090a7c0900b001bca2fdd4d8mr3249060pjf.73.1646724020475; 
 Mon, 07 Mar 2022 23:20:20 -0800 (PST)
Received: from localhost.localdomain (cpe-50-113-46-110.hawaii.res.rr.com.
 [50.113.46.110]) by smtp.gmail.com with ESMTPSA id
 p125-20020a622983000000b004f6c5d58225sm13790899pfp.90.2022.03.07.23.20.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Mar 2022 23:20:20 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 07/33] linux-user/nios2: Trim target_pc_regs to sp and pc
Date: Mon,  7 Mar 2022 21:19:39 -1000
Message-Id: <20220308072005.307955-8-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220308072005.307955-1-richard.henderson@linaro.org>
References: <20220308072005.307955-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::631
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::631;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x631.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: marex@denx.de, peter.maydell@linaro.org, amir.gonnen@neuroblade.ai
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The only thing this struct is used for is passing startup values
from elfload.c to the cpu.  We do not need all registers to be
represented, we do not need the kernel internal stack slots.

The userland argc, argv, and envp values are passed on
the stack, so only SP and PC need updating.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 linux-user/nios2/target_syscall.h | 25 ++-----------------------
 linux-user/elfload.c              |  3 +--
 linux-user/nios2/cpu_loop.c       | 24 +-----------------------
 3 files changed, 4 insertions(+), 48 deletions(-)

diff --git a/linux-user/nios2/target_syscall.h b/linux-user/nios2/target_syscall.h
index 561b28d281..0999ce25fd 100644
--- a/linux-user/nios2/target_syscall.h
+++ b/linux-user/nios2/target_syscall.h
@@ -5,29 +5,8 @@
 #define UNAME_MINIMUM_RELEASE "3.19.0"
 
 struct target_pt_regs {
-    unsigned long  r8;    /* r8-r15 Caller-saved GP registers */
-    unsigned long  r9;
-    unsigned long  r10;
-    unsigned long  r11;
-    unsigned long  r12;
-    unsigned long  r13;
-    unsigned long  r14;
-    unsigned long  r15;
-    unsigned long  r1;    /* Assembler temporary */
-    unsigned long  r2;    /* Retval LS 32bits */
-    unsigned long  r3;    /* Retval MS 32bits */
-    unsigned long  r4;    /* r4-r7 Register arguments */
-    unsigned long  r5;
-    unsigned long  r6;
-    unsigned long  r7;
-    unsigned long  orig_r2;    /* Copy of r2 ?? */
-    unsigned long  ra;    /* Return address */
-    unsigned long  fp;    /* Frame pointer */
-    unsigned long  sp;    /* Stack pointer */
-    unsigned long  gp;    /* Global pointer */
-    unsigned long  estatus;
-    unsigned long  ea;    /* Exception return address (pc) */
-    unsigned long  orig_r7;
+    target_ulong sp;
+    target_ulong pc;
 };
 
 #define TARGET_MCL_CURRENT 1
diff --git a/linux-user/elfload.c b/linux-user/elfload.c
index 23ff9659a5..cb14c5f786 100644
--- a/linux-user/elfload.c
+++ b/linux-user/elfload.c
@@ -1094,9 +1094,8 @@ static void elf_core_copy_regs(target_elf_gregset_t *regs, const CPUMBState *env
 
 static void init_thread(struct target_pt_regs *regs, struct image_info *infop)
 {
-    regs->ea = infop->entry;
+    regs->pc = infop->entry;
     regs->sp = infop->start_stack;
-    regs->estatus = 0x3;
 }
 
 #define LO_COMMPAGE  TARGET_PAGE_SIZE
diff --git a/linux-user/nios2/cpu_loop.c b/linux-user/nios2/cpu_loop.c
index 7b20c024db..37e1dfecfd 100644
--- a/linux-user/nios2/cpu_loop.c
+++ b/linux-user/nios2/cpu_loop.c
@@ -132,28 +132,6 @@ void cpu_loop(CPUNios2State *env)
 
 void target_cpu_copy_regs(CPUArchState *env, struct target_pt_regs *regs)
 {
-    env->regs[0] = 0;
-    env->regs[1] = regs->r1;
-    env->regs[2] = regs->r2;
-    env->regs[3] = regs->r3;
-    env->regs[4] = regs->r4;
-    env->regs[5] = regs->r5;
-    env->regs[6] = regs->r6;
-    env->regs[7] = regs->r7;
-    env->regs[8] = regs->r8;
-    env->regs[9] = regs->r9;
-    env->regs[10] = regs->r10;
-    env->regs[11] = regs->r11;
-    env->regs[12] = regs->r12;
-    env->regs[13] = regs->r13;
-    env->regs[14] = regs->r14;
-    env->regs[15] = regs->r15;
-    /* TODO: unsigned long  orig_r2; */
-    env->regs[R_RA] = regs->ra;
-    env->regs[R_FP] = regs->fp;
     env->regs[R_SP] = regs->sp;
-    env->regs[R_GP] = regs->gp;
-    env->regs[CR_ESTATUS] = regs->estatus;
-    env->pc = regs->ea;
-    /* TODO: unsigned long  orig_r7; */
+    env->pc = regs->pc;
 }
-- 
2.25.1


