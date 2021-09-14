Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 80E5E40A1D6
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Sep 2021 02:21:39 +0200 (CEST)
Received: from localhost ([::1]:59796 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mPwCg-000217-HM
	for lists+qemu-devel@lfdr.de; Mon, 13 Sep 2021 20:21:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53660)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mPw6X-0001mn-7I
 for qemu-devel@nongnu.org; Mon, 13 Sep 2021 20:15:22 -0400
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031]:34550)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mPw6V-0007kQ-9g
 for qemu-devel@nongnu.org; Mon, 13 Sep 2021 20:15:16 -0400
Received: by mail-pj1-x1031.google.com with SMTP id
 on12-20020a17090b1d0c00b001997c60aa29so943487pjb.1
 for <qemu-devel@nongnu.org>; Mon, 13 Sep 2021 17:15:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=JRbtZ+CDX2+nXrEBnFYxf52cfF6x2rj7k+e/RTOAXu4=;
 b=T0nJiHXU9Vx9IPXfsUZ3QY++PjPPLYKSl8yXwYfn6YZn1Jn6GwXwiS+vaTcYU2Tp2K
 VASUOvYY0hirRgvNMfiT7H/RUmEhZ5l6SBikNn5UVlxRGBTRYuQB66maV/2sZVlC5HIp
 R3SW/cmlknpzPIvfYHGqNurdr1wU5xshgKI2KIyGrpuCKSCqunUB+M1LgqFhGO1UMLcx
 tzLOLOJ0Nx46mQaakPPjvgSZsJgVPtZxFY6ns7eGW+wX25vyByknnKivDnG0udqtWoj9
 TVKG+yLlH03a+YUppSURTV2162dFfwV/nMnms+IR/vzYUZF0ORUQ+Yu7yVPDVw+8Wom2
 IePQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=JRbtZ+CDX2+nXrEBnFYxf52cfF6x2rj7k+e/RTOAXu4=;
 b=tncFAcYbxIeaWDj+Xytt1gyG0Y3oVcbah6/XLOax1WbMKskaK5nzJOc6qKF4s4+2Mb
 FlJAdzOsjSP/+EJHr4Md3YSDDYhi4FVXshmc7wSrFPhaK8sNNpXRglmbDObr0XEkuxUR
 K9z6MR7I7drYrCtADwoj0vVQDPMMtylrx0pa8djOT4WdyDDAC60MaLuoY0FxRmO6nW80
 fYZvpc2QVuqpTslkcqWalBXJVSHwY+7xem0CrAvxLTFjXwT/5waOH1gn8qrDIsO1hK6Q
 qq1u6jNKKPQikqOFyt+Cv5V1hwHCs8ke9Sdvlghxr5VF+7s6x7szv0p4S3PsBzvB9bRp
 p/OQ==
X-Gm-Message-State: AOAM533uCKeS6TfSQds+BfCsjPNy8OG8jTFaow1b/pkiXbRc4zAgFe6/
 ElnbgWovm3Un8UuUhthyPNp5YYmvbb7LxA==
X-Google-Smtp-Source: ABdhPJz5KugDi8HXymW9WdrqvpUQJbEYWckTYRp8RwiX4SpnKIQLSeqFQYZme5Js2GYALBhNgTpNwg==
X-Received: by 2002:a17:90a:77c2:: with SMTP id
 e2mr2310033pjs.96.1631578513515; 
 Mon, 13 Sep 2021 17:15:13 -0700 (PDT)
Received: from localhost.localdomain ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id m7sm9334179pgn.32.2021.09.13.17.15.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Sep 2021 17:15:13 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 21/44] target/microblaze: Restrict cpu_exec_interrupt() handler
 to sysemu
Date: Mon, 13 Sep 2021 17:14:33 -0700
Message-Id: <20210914001456.793490-22-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210914001456.793490-1-richard.henderson@linaro.org>
References: <20210914001456.793490-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1031;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1031.google.com
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
Cc: peter.maydell@linaro.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Warner Losh <imp@bsdimp.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Philippe Mathieu-Daudé <f4bug@amsat.org>

Restrict cpu_exec_interrupt() and its callees to sysemu.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Warner Losh <imp@bsdimp.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20210911165434.531552-14-f4bug@amsat.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/microblaze/cpu.h    |  2 ++
 target/microblaze/cpu.c    |  2 +-
 target/microblaze/helper.c | 13 ++-----------
 3 files changed, 5 insertions(+), 12 deletions(-)

diff --git a/target/microblaze/cpu.h b/target/microblaze/cpu.h
index e4bba8a755..40401c33b7 100644
--- a/target/microblaze/cpu.h
+++ b/target/microblaze/cpu.h
@@ -355,8 +355,10 @@ struct MicroBlazeCPU {
 };
 
 
+#ifndef CONFIG_USER_ONLY
 void mb_cpu_do_interrupt(CPUState *cs);
 bool mb_cpu_exec_interrupt(CPUState *cs, int int_req);
+#endif /* !CONFIG_USER_ONLY */
 void mb_cpu_do_unaligned_access(CPUState *cs, vaddr vaddr,
                                 MMUAccessType access_type,
                                 int mmu_idx, uintptr_t retaddr);
diff --git a/target/microblaze/cpu.c b/target/microblaze/cpu.c
index 72d8f2a0da..15db277925 100644
--- a/target/microblaze/cpu.c
+++ b/target/microblaze/cpu.c
@@ -365,10 +365,10 @@ static const struct SysemuCPUOps mb_sysemu_ops = {
 static const struct TCGCPUOps mb_tcg_ops = {
     .initialize = mb_tcg_init,
     .synchronize_from_tb = mb_cpu_synchronize_from_tb,
-    .cpu_exec_interrupt = mb_cpu_exec_interrupt,
     .tlb_fill = mb_cpu_tlb_fill,
 
 #ifndef CONFIG_USER_ONLY
+    .cpu_exec_interrupt = mb_cpu_exec_interrupt,
     .do_interrupt = mb_cpu_do_interrupt,
     .do_transaction_failed = mb_cpu_transaction_failed,
     .do_unaligned_access = mb_cpu_do_unaligned_access,
diff --git a/target/microblaze/helper.c b/target/microblaze/helper.c
index 20dbd67313..dd2aecd1d5 100644
--- a/target/microblaze/helper.c
+++ b/target/microblaze/helper.c
@@ -26,16 +26,6 @@
 
 #if defined(CONFIG_USER_ONLY)
 
-void mb_cpu_do_interrupt(CPUState *cs)
-{
-    MicroBlazeCPU *cpu = MICROBLAZE_CPU(cs);
-    CPUMBState *env = &cpu->env;
-
-    cs->exception_index = -1;
-    env->res_addr = RES_ADDR_NONE;
-    env->regs[14] = env->pc;
-}
-
 bool mb_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
                      MMUAccessType access_type, int mmu_idx,
                      bool probe, uintptr_t retaddr)
@@ -271,7 +261,6 @@ hwaddr mb_cpu_get_phys_page_attrs_debug(CPUState *cs, vaddr addr,
 
     return paddr;
 }
-#endif
 
 bool mb_cpu_exec_interrupt(CPUState *cs, int interrupt_request)
 {
@@ -289,6 +278,8 @@ bool mb_cpu_exec_interrupt(CPUState *cs, int interrupt_request)
     return false;
 }
 
+#endif /* !CONFIG_USER_ONLY */
+
 void mb_cpu_do_unaligned_access(CPUState *cs, vaddr addr,
                                 MMUAccessType access_type,
                                 int mmu_idx, uintptr_t retaddr)
-- 
2.25.1


