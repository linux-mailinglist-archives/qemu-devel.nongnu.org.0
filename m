Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 706BA440AF9
	for <lists+qemu-devel@lfdr.de>; Sat, 30 Oct 2021 20:27:57 +0200 (CEST)
Received: from localhost ([::1]:42738 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mgt5A-00018k-J4
	for lists+qemu-devel@lfdr.de; Sat, 30 Oct 2021 14:27:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58730)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mgs1s-0001UW-5f
 for qemu-devel@nongnu.org; Sat, 30 Oct 2021 13:20:28 -0400
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e]:43932)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mgs1m-0002Bt-PL
 for qemu-devel@nongnu.org; Sat, 30 Oct 2021 13:20:25 -0400
Received: by mail-pl1-x62e.google.com with SMTP id y1so8902423plk.10
 for <qemu-devel@nongnu.org>; Sat, 30 Oct 2021 10:20:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=54O7y5F6cil48JbVjJeuP4tBSWG4MHFPBxntrZflWpI=;
 b=ibu/o+rJIff6CuW/WKtJapnHSvuNL5Uywd2jck1FIAu6ae0RKiWodiNq+f/waHzgbj
 WPR9ira2DgQBK1GnIIXEYYS+qX8vn7Y6fuGahGvMbzlAn0GyEf4RAj3nP5sU7zdKle3k
 vZwd2sWX74unrVwzksgvQrlJllvPBTUXkzmN8pnY7nTcELiXICB3TCAvh2hHUclgl7yv
 repJ4EBmQGWo8NB5KBIMKfmNqkfYthYCMYEe+zapjr/v7pY/BRJbD+Q7TqpaJan9BVc3
 uNdVnAf6R9fRpONExFqpJarm8l63KHmkQAVXFINlj84LcqI4oOU6+X0X1UGOsbW/3a+M
 GIEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=54O7y5F6cil48JbVjJeuP4tBSWG4MHFPBxntrZflWpI=;
 b=Ai75KX8c0s6Xn736mV9uR56ZH+8ZgaHutoPCtlYXTcEELh7HGHx9C2SW5tGiAifKqm
 BXSWZ6Z5dOHtG10xJ3TtHMq+nf+74onBdairEIJH4tJi73q6VIllGaJBjGY7bP5mON5/
 JAhObkSesuyMxFo6uJv5Rci6LjhDuUmUewjB1whIx8LhTCudgWqChsWeZ/pbVac/tMnb
 EjBANVXvK9+K5g68KoWs0gxLjF3QI//W0oY5/uvPqytab7StMVt8CB3bSmjdLIRX+Cko
 Tp+DDhYnictFSzSJKNDIXvF42M8z2APX76Gy8fLE1AMEYDdIjiGS+c64jNeVD13IknpV
 m6dw==
X-Gm-Message-State: AOAM532oxoR6uvaE3hR+VCAAyvYWUINY9TejIKlYTqAZOoKHk0eW+TFT
 jUEct8U3Ye0uNjiYEt5L09KXhW8DyTdMpw==
X-Google-Smtp-Source: ABdhPJwiFa9bZgXS50vy12J1Nakd/AEbZ0l1u9mYRenz9gWUpKJMuFVH3KMtuwTxOOQcqxeYVn/8lA==
X-Received: by 2002:a17:90b:350c:: with SMTP id
 ls12mr6529680pjb.197.1635614421083; 
 Sat, 30 Oct 2021 10:20:21 -0700 (PDT)
Received: from localhost.localdomain (174-21-75-75.tukw.qwest.net.
 [174.21.75.75])
 by smtp.gmail.com with ESMTPSA id k14sm9584798pji.45.2021.10.30.10.20.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 30 Oct 2021 10:20:20 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v6 48/66] target/ppc: Move SPR_DSISR setting to powerpc_excp
Date: Sat, 30 Oct 2021 10:16:17 -0700
Message-Id: <20211030171635.1689530-49-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211030171635.1689530-1-richard.henderson@linaro.org>
References: <20211030171635.1689530-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62e.google.com
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
Cc: Peter Maydell <peter.maydell@linaro.org>, alex.bennee@linaro.org,
 laurent@vivier.eu, imp@bsdimp.com, f4bug@amsat.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

By doing this while sending the exception, we will have already
done the unwinding, which makes the ppc_cpu_do_unaligned_access
code a bit cleaner.

Update the comment about the expected instruction format.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/ppc/excp_helper.c | 21 +++++++++------------
 1 file changed, 9 insertions(+), 12 deletions(-)

diff --git a/target/ppc/excp_helper.c b/target/ppc/excp_helper.c
index b7d1767920..88a8de4b80 100644
--- a/target/ppc/excp_helper.c
+++ b/target/ppc/excp_helper.c
@@ -454,13 +454,15 @@ static inline void powerpc_excp(PowerPCCPU *cpu, int excp_model, int excp)
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
@@ -1462,14 +1464,9 @@ void ppc_cpu_do_unaligned_access(CPUState *cs, vaddr vaddr,
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


