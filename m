Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A21203F0BB6
	for <lists+qemu-devel@lfdr.de>; Wed, 18 Aug 2021 21:24:26 +0200 (CEST)
Received: from localhost ([::1]:47968 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mGRAn-0000ar-Mh
	for lists+qemu-devel@lfdr.de; Wed, 18 Aug 2021 15:24:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57736)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mGR6A-0000Df-Di
 for qemu-devel@nongnu.org; Wed, 18 Aug 2021 15:19:38 -0400
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b]:56211)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mGR68-0008PG-Op
 for qemu-devel@nongnu.org; Wed, 18 Aug 2021 15:19:38 -0400
Received: by mail-pj1-x102b.google.com with SMTP id mq3so3259286pjb.5
 for <qemu-devel@nongnu.org>; Wed, 18 Aug 2021 12:19:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=ylYuw8LHzZRuxsa1UdWnUJl5AqI35ErW5wGAqPr3fcU=;
 b=elC0AGlqRDKSWX263Ym1JuHkwyQkixkvsM++KFByZzI9FIBthPF5g7N0sMUH9O24D7
 iPAcJfJ+XShTiwPDkESKUbG44YcGFnQYeLnpPsjyR/2RP4jEtcFrU1hwQ7P0ymrSYmml
 vHFC5kzCEPn4w/A2r9pqZm5CIdJ9ZRBk1matmB93QrQAljxVnzlyHZzeqOsSS20I22pp
 9Ea6F9diCfhmIxvhm0L7OY8Z6hHGTUjN73fue8TfL4COW8dF5t03M7ryQ4JB8X7xlmlC
 ++vWfuXNwiSFvIo6X4vWXUAAHpE0Xw7D0mTtQTCzueF8oIyZQnb7qTk5WluHwQDr2KDA
 dAkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ylYuw8LHzZRuxsa1UdWnUJl5AqI35ErW5wGAqPr3fcU=;
 b=g68udjxSzYYanLjplXYDD77mwS60Q9M0HE4NV6sgTTU5TRm3qpzlgAhYtcJkMnLLb+
 KXD+fffR+aynfvywur0RC5arvpU32KziOoU/ZqF9PM0sLQu9qvORM+YkcdqSiQthZnpl
 d1bQPry3MBApoIpyeoO62NPNnyw/wRX3fZ2vWOhMhaYyeeWaQLvpvSKSh5v3ehBoSy2w
 umK7SlWf2ZxuBSsYXj5pFXGI+D5Ry0g5kkAuyDiZaG/ScSNojg85ok6vmn17p5X12OLd
 zsv+qD2Ya0JdRli/1lOVFOsoRZmpfI8tQrDIL2+pSMGAxOANvL84vXQLCLYx6UEmoDHh
 2pPw==
X-Gm-Message-State: AOAM531FvIzZUgNrlYXCPXeDNfNiINNT1gJYDT50VhukSitmFeedmC2z
 P37Irmn03pVkI6vPnqIcRAzBuIET7Zr+gA==
X-Google-Smtp-Source: ABdhPJwePf/W8K7W2z2k71MVTqgZXf6aocjey+4xMUppHPELgWlf47ha6RW9BLaDIHz/rn9tIXgN1g==
X-Received: by 2002:a17:902:8c81:b029:12c:ee37:3f58 with SMTP id
 t1-20020a1709028c81b029012cee373f58mr8533270plo.45.1629314374226; 
 Wed, 18 Aug 2021 12:19:34 -0700 (PDT)
Received: from localhost.localdomain ([173.197.107.15])
 by smtp.gmail.com with ESMTPSA id a6sm524108pjs.40.2021.08.18.12.19.33
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Aug 2021 12:19:34 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 09/66] target/ppc: Move SPR_DSISR setting to powerpc_excp
Date: Wed, 18 Aug 2021 09:18:23 -1000
Message-Id: <20210818191920.390759-10-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210818191920.390759-1-richard.henderson@linaro.org>
References: <20210818191920.390759-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102b.google.com
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


