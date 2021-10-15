Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 728D142E7F4
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Oct 2021 06:39:28 +0200 (CEST)
Received: from localhost ([::1]:55152 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mbF0B-0007rG-Go
	for lists+qemu-devel@lfdr.de; Fri, 15 Oct 2021 00:39:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39532)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mbEc9-0006j0-0U
 for qemu-devel@nongnu.org; Fri, 15 Oct 2021 00:14:37 -0400
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f]:39689)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mbEc7-0002pt-Dl
 for qemu-devel@nongnu.org; Fri, 15 Oct 2021 00:14:36 -0400
Received: by mail-pl1-x62f.google.com with SMTP id c4so5603165pls.6
 for <qemu-devel@nongnu.org>; Thu, 14 Oct 2021 21:14:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=54O7y5F6cil48JbVjJeuP4tBSWG4MHFPBxntrZflWpI=;
 b=j2F0q+XNNa4YJAjmRIlOE/2uI6va5is0BkOliZCkPSdM7yJyMQUqHTbOAtG48UZmKP
 WOFj2VBzpwAVJe5hwAnT4DoEAL5/c88wBCspBHTdpkXBGWryHUcwNKrFNHYyJYJ5vzE5
 +QpsoqzihaJgoAt8eR5JWf3O3gNbkjQPeunVM43bjcegqJ/xO95tMCxNBLk3qlrgcy8y
 OGawaDSThIqkTadqRim9C45riL3gzXFxbwMlQJgengKjWvp1hqIviEHxzzt2DsI3LFRM
 4Ze6QHSc6WoYdJkA+YGjp/li2WJcfbqdv04PtKwCbJM3LlbiiN0WSUtWqaZpRiO+ZtGX
 fKcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=54O7y5F6cil48JbVjJeuP4tBSWG4MHFPBxntrZflWpI=;
 b=chrrrNmB4YuhsrnPokHtTdvtCc86gnihwLmCz2yFg8C01MkvSivMB88vfRT2kkY4xH
 RQBMS8VqEXVr/2EN5X/Tt2+yTtPjaIvrpAOWAdpjvsZwAe25zsdDqKdbjaj5ykp4/SRF
 PX0n3Ds63sQIwpfgy56BVValh59yErVYlEgQFBZ5d87sh5EsIrN/UCYRedB+6bl0Ee0r
 9CZCWZb+r16B3XrmEvYuLzX599P0avhE0sdDkJhYt51Gght4+MsXtB2Q/zhYsOTDUlj6
 66BjJ7eSZ8bAOTAmGAiWQfGiqopwyU9YLgXUfcBphy+YL2RYx19WFxM9PeYgVXBsZJEY
 imJQ==
X-Gm-Message-State: AOAM530wfwpPSz7/I6njoW8w/YBRFkz2j6RAyPcafxxSRv0XlvQWUp0J
 01PogRa28a1Ll8y9/x5yauROpRiU9B3fIw==
X-Google-Smtp-Source: ABdhPJwwVXBlIe3Qb1+uLTnVo+s4TZUlVwe3fFjyTGwhYoW35utpqRZlLSpcPs8olfaO8G10pvhamw==
X-Received: by 2002:a17:90b:2248:: with SMTP id
 hk8mr10808447pjb.102.1634271274244; 
 Thu, 14 Oct 2021 21:14:34 -0700 (PDT)
Received: from localhost.localdomain ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id q8sm10236885pja.52.2021.10.14.21.14.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Oct 2021 21:14:33 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 49/67] target/ppc: Move SPR_DSISR setting to powerpc_excp
Date: Thu, 14 Oct 2021 21:10:35 -0700
Message-Id: <20211015041053.2769193-50-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211015041053.2769193-1-richard.henderson@linaro.org>
References: <20211015041053.2769193-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62f.google.com
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
 laurent@vivier.eu, imp@bsdimp.com
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


