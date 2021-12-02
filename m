Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3150F466B34
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Dec 2021 21:53:15 +0100 (CET)
Received: from localhost ([::1]:45530 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mst4s-0007sY-95
	for lists+qemu-devel@lfdr.de; Thu, 02 Dec 2021 15:53:14 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43980)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mst0r-0008WR-HK
 for qemu-devel@nongnu.org; Thu, 02 Dec 2021 15:49:05 -0500
Received: from [2607:f8b0:4864:20::1032] (port=53865
 helo=mail-pj1-x1032.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mst0p-0005So-HS
 for qemu-devel@nongnu.org; Thu, 02 Dec 2021 15:49:04 -0500
Received: by mail-pj1-x1032.google.com with SMTP id iq11so667801pjb.3
 for <qemu-devel@nongnu.org>; Thu, 02 Dec 2021 12:49:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=p6wlTrgyamt5pJcbz/NPTMdqMfp2gadP3Gsui6+XSsw=;
 b=HpW4FJKxeHYqJBd1tP9+DQCava5jqPxcFLLU2zL/15wj/v9ouCslBSc/vgJjZmOvSS
 gYVyqxX0GCh+T8y3zQn6545SjDqNJaVHGoG4ABxIYqR1zpse/21OPQl5zSq+m/YTK7AI
 T/G7i+zNLlOYbptTf3FnAr39KvCtefF5BBexsFcOz4ChNANeenLRqm5y8Sb5Pe5ajzTc
 qTFHlLKbxsngTlWBXS8OcGGgvP/MAQi2sYQUz12gipA+CskHlaTbnXlLWB2/nZM4Yasv
 kdrL+TE8Z1A64ou31gSDxe4n+B7RbUvvB1n6g7+GbIAFk4oZhVw1+OmHbMEhscDrCMgF
 eGqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=p6wlTrgyamt5pJcbz/NPTMdqMfp2gadP3Gsui6+XSsw=;
 b=XBwo8LI4HrnFlpEbwHXtR7n7lHqhX3Jp7yprJO7Md9yrU0Y1SnnNMm/ciatZ3WgbxW
 ttWmr/NRJ1lCmo2/6cugsWdQg2/pbdya8W72eixBd3pRK5jAO776L71A11YZVooWRedN
 HbJjqXCHY/T+Nh4GhrDTZqMP7lCrDfZhqD3ffy4ULPOiHtzZl4umYyvrU64bsMqNh5bR
 5D6iLPSnL0pDk8/5B3GOFg7n728n+FqozkRytyCu2uKrAYKi6V7WBACH0RAemjVKDZKv
 gNPjPHg8wXGVLB2ZpSr1tneaIgbY5wkB8tPHC89VItRHaiqLq6FrVBWp+9iXOYWh1ZUa
 AtMA==
X-Gm-Message-State: AOAM530YTI2A7Ezoi5Nr2niG5p9i+HWjrAy2+Fy4CL6xfMMwMN9wYclo
 ptPUN74fdZQfKiuouiqAUg9T3LsvvSLgWg==
X-Google-Smtp-Source: ABdhPJzig1zJL+gq4DIUK7vSK93emvlgtiuWN03tbtxgYT9dX4niTaNUGRWjS3gbRlfglc/Fv5E8Cw==
X-Received: by 2002:a17:90b:390f:: with SMTP id
 ob15mr8763333pjb.32.1638478142248; 
 Thu, 02 Dec 2021 12:49:02 -0800 (PST)
Received: from localhost.localdomain (174-21-75-75.tukw.qwest.net.
 [174.21.75.75])
 by smtp.gmail.com with ESMTPSA id pi17sm3721391pjb.34.2021.12.02.12.49.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Dec 2021 12:49:01 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 01/15] target/m68k: Raise the TRAPn exception with the
 correct pc
Date: Thu,  2 Dec 2021 12:48:46 -0800
Message-Id: <20211202204900.50973-2-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211202204900.50973-1-richard.henderson@linaro.org>
References: <20211202204900.50973-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::1032
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::1032;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1032.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: laurent@vivier.eu
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Rather than adjust the PC in all of the consumers, raise
the exception with the correct PC in the first place.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 linux-user/m68k/cpu_loop.c | 1 -
 target/m68k/op_helper.c    | 9 ---------
 target/m68k/translate.c    | 2 +-
 3 files changed, 1 insertion(+), 11 deletions(-)

diff --git a/linux-user/m68k/cpu_loop.c b/linux-user/m68k/cpu_loop.c
index 790bd558c3..287f24cc60 100644
--- a/linux-user/m68k/cpu_loop.c
+++ b/linux-user/m68k/cpu_loop.c
@@ -70,7 +70,6 @@ void cpu_loop(CPUM68KState *env)
             {
                 abi_long ret;
                 n = env->dregs[0];
-                env->pc += 2;
                 ret = do_syscall(env,
                                  n,
                                  env->dregs[1],
diff --git a/target/m68k/op_helper.c b/target/m68k/op_helper.c
index cfbc987ba6..36662de149 100644
--- a/target/m68k/op_helper.c
+++ b/target/m68k/op_helper.c
@@ -216,11 +216,6 @@ static void cf_interrupt_all(CPUM68KState *env, int is_hw)
             cpu_loop_exit(cs);
             return;
         }
-        if (cs->exception_index >= EXCP_TRAP0
-            && cs->exception_index <= EXCP_TRAP15) {
-            /* Move the PC after the trap instruction.  */
-            retaddr += 2;
-        }
     }
 
     vector = cs->exception_index << 2;
@@ -303,10 +298,6 @@ static void m68k_interrupt_all(CPUM68KState *env, int is_hw)
             /* Return from an exception.  */
             m68k_rte(env);
             return;
-        case EXCP_TRAP0 ...  EXCP_TRAP15:
-            /* Move the PC after the trap instruction.  */
-            retaddr += 2;
-            break;
         }
     }
 
diff --git a/target/m68k/translate.c b/target/m68k/translate.c
index af43c8eab8..af3febdd48 100644
--- a/target/m68k/translate.c
+++ b/target/m68k/translate.c
@@ -4860,7 +4860,7 @@ DISAS_INSN(wdebug)
 
 DISAS_INSN(trap)
 {
-    gen_exception(s, s->base.pc_next, EXCP_TRAP0 + (insn & 0xf));
+    gen_exception(s, s->pc, EXCP_TRAP0 + (insn & 0xf));
 }
 
 static void gen_load_fcr(DisasContext *s, TCGv res, int reg)
-- 
2.25.1


