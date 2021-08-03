Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B35253DE4F7
	for <lists+qemu-devel@lfdr.de>; Tue,  3 Aug 2021 06:16:59 +0200 (CEST)
Received: from localhost ([::1]:48416 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mAlrO-0005j4-Pw
	for lists+qemu-devel@lfdr.de; Tue, 03 Aug 2021 00:16:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56546)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mAlpS-0002gI-0V
 for qemu-devel@nongnu.org; Tue, 03 Aug 2021 00:14:58 -0400
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d]:44792)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mAlpQ-00024r-Cc
 for qemu-devel@nongnu.org; Tue, 03 Aug 2021 00:14:57 -0400
Received: by mail-pl1-x62d.google.com with SMTP id q2so22127734plr.11
 for <qemu-devel@nongnu.org>; Mon, 02 Aug 2021 21:14:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=ylYuw8LHzZRuxsa1UdWnUJl5AqI35ErW5wGAqPr3fcU=;
 b=wMYCARe3Mj/7BmXDlSGEmRQ7ke7ADoPR5Xhz+UPqFOx1WgbqoZbfxQSxKQBobcpnx+
 qceU0quIXwLl8Ca2ugpJMN0ksJ1kOwp65FnobDrrDSnbWfway3J+imU9DJmQ/5rFulxg
 REgxdhxTYVdfrKifyovr/BvjcFPiMEY1ug6djSSgLjIsrQsNqfagEY9gnr9Rkp+L6wMt
 BeeDzv835GEApQkj9orb8jm+38I7DVmYyYdFEvRvDWQtVrNnsvp0nAFSFpP5unnENmE3
 7mtqFUhZTB7FqQKlyAbBtCL8D8/++AXNHFyeJQ7XBn9iCoBsPGvFfa75aktNP5HAx1ni
 CFoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ylYuw8LHzZRuxsa1UdWnUJl5AqI35ErW5wGAqPr3fcU=;
 b=obcARachNImfOZnUJW5PsNH9jsrZ/hE431yriRwcTVbKsxnQK9KkSDYVE0wl7bOOSz
 2eKlhLPnr8SJOSnvLvcAyT9+6fYIajUV9g88JZtwz/ehVgx6vo0ps4X8x4dcJOQ4i1aR
 8mz4CSBhNXnhKTgcVHMjgf4B8cFmB0MRFZCQCkOKRJXrA3jI7gLe94wxFLPyQMMBbNPR
 QoqlKcVKWwzd7Dco+TanwLPT71RVMpAPaaI+KPWNPqFI8peWg+V3Y1ntuRdo8IrTXbzZ
 fbZ9ZvMPpL21TvRf4DPP8W/mT/bk4HYzzEDxcYTVeSATNc9sx0C74jHcO72Q2AcXZOXl
 eXlQ==
X-Gm-Message-State: AOAM533FSFvpNUS9j4Rf2T2fFqkQ2Ck4ldig0d7hMOdHB2xWI8BLIL5K
 GF2ykQ3EkVGbTbssVSkzm2+e16FVaP0uxg==
X-Google-Smtp-Source: ABdhPJwlOJp4i9kRBS0uC2i2qIL/XtgXjTOsCnLPBMjfva9YLdjhQ2ciTVegox7E31OUqAzQjPuNDA==
X-Received: by 2002:a17:90a:6e47:: with SMTP id
 s7mr21096823pjm.160.1627964095183; 
 Mon, 02 Aug 2021 21:14:55 -0700 (PDT)
Received: from localhost.localdomain (rrcs-173-198-77-218.west.biz.rr.com.
 [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id c23sm13718532pfn.140.2021.08.02.21.14.54
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Aug 2021 21:14:54 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 08/55] target/ppc: Move SPR_DSISR setting to powerpc_excp
Date: Mon,  2 Aug 2021 18:13:56 -1000
Message-Id: <20210803041443.55452-9-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210803041443.55452-1-richard.henderson@linaro.org>
References: <20210803041443.55452-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62d.google.com
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

By doing this while sending the exception, we will have already
done the unwinding, which makes the ppc_cpu_do_unaligned_access
code a bit cleaner.

Update the comment about the expected instruction format.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/ppc/excp_helper.c | 21 +++++++++------------
 1 file changed, 9 insertions(+), 12 deletions(-)

diff --git a/target/ppc/excp_helper.c b/target/ppc/excp_helper.c
index a79a0ed465..0df358f93f 100644
--- a/target/ppc/excp_helper.c
+++ b/target/ppc/excp_helper.c
@@ -478,13 +478,15 @@ static inline void powerpc_excp(PowerPCCPU *cpu, int excp_model, int excp)
         break;
     }
     case POWERPC_EXCP_ALIGN:     /* Alignment exception                      */
-        /* Get rS/rD and rA from faulting opcode */
         /*
-         * Note: the opcode fields will not be set properly for a
-         * direct store load/store, but nobody cares as nobody
-         * actually uses direct store segments.
+         * Get rS/rD and rA from faulting opcode.
+         * Note: We will only invoke ALIGN for atomic operations,
+         * so all instructions are X-form.
          */
-        env->spr[SPR_DSISR] |= (env->error_code & 0x03FF0000) >> 16;
+        {
+            uint32_t insn = cpu_ldl_code(env, env->nip);
+            env->spr[SPR_DSISR] |= (insn & 0x03FF0000) >> 16;
+        }
         break;
     case POWERPC_EXCP_PROGRAM:   /* Program exception                        */
         switch (env->error_code & ~0xF) {
@@ -1501,14 +1503,9 @@ void ppc_cpu_do_unaligned_access(CPUState *cs, vaddr vaddr,
                                  int mmu_idx, uintptr_t retaddr)
 {
     CPUPPCState *env = cs->env_ptr;
-    uint32_t insn;
-
-    /* Restore state and reload the insn we executed, for filling in DSISR.  */
-    cpu_restore_state(cs, retaddr, true);
-    insn = cpu_ldl_code(env, env->nip);
 
     cs->exception_index = POWERPC_EXCP_ALIGN;
-    env->error_code = insn & 0x03FF0000;
-    cpu_loop_exit(cs);
+    env->error_code = 0;
+    cpu_loop_exit_restore(cs, retaddr);
 }
 #endif
-- 
2.25.1


