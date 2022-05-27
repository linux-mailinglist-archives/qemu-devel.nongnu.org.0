Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 50887536623
	for <lists+qemu-devel@lfdr.de>; Fri, 27 May 2022 18:51:15 +0200 (CEST)
Received: from localhost ([::1]:42566 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nudBC-0003RC-ED
	for lists+qemu-devel@lfdr.de; Fri, 27 May 2022 12:51:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52776)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nud8G-0001Fk-Mn
 for qemu-devel@nongnu.org; Fri, 27 May 2022 12:48:13 -0400
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a]:34174)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nud8E-0005Nh-Vz
 for qemu-devel@nongnu.org; Fri, 27 May 2022 12:48:12 -0400
Received: by mail-pj1-x102a.google.com with SMTP id
 nn3-20020a17090b38c300b001e0e091cf03so3227967pjb.1
 for <qemu-devel@nongnu.org>; Fri, 27 May 2022 09:48:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=v6GsMd9l2dAfQx+Uj+qJ1gCQp2pHPy4DQInBPdc5TCM=;
 b=rzH4B/EN6wNnP0USKTRUwXz9icJW+eI/yIXE2yOsaVVUT3Ye0ClBjVehFBlQOyRahG
 ylCYK1rx8BOtz5rsi3p+1ZHlJwyyOBzj+wwLTcIba9vGb+Q4L5PIr0TlSndwmfbETFzC
 xqVXKXs4spxb5sIOhyasbzA3T3Y9Qn2YPBwQeieBxwae0QfHKdWAc63+zR58KeSeQT2B
 7WnTkfX1uiKdFq9VqIEAepzh9GfPnAZLljVkE+s6BPfvFsri+EUXM121kB4lBJGdWy0P
 7Sy+jDuTrCXUhfWkRn1WPFysxXX+JgJLOPNiY5TnSxPUO9c6a8f8vJkT6mfjR/Aevn/3
 /hoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=v6GsMd9l2dAfQx+Uj+qJ1gCQp2pHPy4DQInBPdc5TCM=;
 b=gytoCK+qF+24nrrW449KgV7PFidf5v3K2y6atjcPuhQXeMMS/4dBNToxguPG7rhSMp
 sCZeV3oOHYEff7XdjdIljjg2KJY5teNAbjdVKFjdQiwvm6O9ioki3lS64Acn3ngepzTi
 JKbBPvndm7XYtkA7oF7atpbBtwVgUl8sSNYqXVvAH/yxAf9CEgAGbtBYPJiPcrVA/9XF
 gCkQt2e9j4EqDREqBpLfKKHm9iEgw9QqDulUH9wqFw42UEC5260Spo0faZE+exI/3ZLo
 nE9K0vuO4LLq7yVIs4/sai5JI5tZ1rXxF4y80t29hwTEGFwZx+0gOvs4/qDMYKHYWdJl
 SeeA==
X-Gm-Message-State: AOAM532gLIQTdsQm6rvAEffVok2vZdVkHl2gmm+uf8oVfaEL77C30n28
 347C0O8IHsnVB/HI0EfBsS48AkD2NJy3pg==
X-Google-Smtp-Source: ABdhPJzFJXEAlaQ+qN76qG5tIiizDnbHecfrx7CzI/eUvi+N2q2w2Qd68uGqCWWmIR9tEDvbgeHREA==
X-Received: by 2002:a17:90b:1d0b:b0:1df:b3dc:5140 with SMTP id
 on11-20020a17090b1d0b00b001dfb3dc5140mr9387411pjb.225.1653670089592; 
 Fri, 27 May 2022 09:48:09 -0700 (PDT)
Received: from stoup.. (174-21-71-225.tukw.qwest.net. [174.21.71.225])
 by smtp.gmail.com with ESMTPSA id
 j11-20020aa7928b000000b0050dc7628133sm3861420pfa.13.2022.05.27.09.48.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 May 2022 09:48:09 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: laurent@vivier.eu
Subject: [PATCH v5 01/17] target/m68k: Raise the TRAPn exception with the
 correct pc
Date: Fri, 27 May 2022 09:47:51 -0700
Message-Id: <20220527164807.135038-2-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220527164807.135038-1-richard.henderson@linaro.org>
References: <20220527164807.135038-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Rather than adjust the PC in all of the consumers, raise
the exception with the correct PC in the first place.

Reviewed-by: Laurent Vivier <laurent@vivier.eu>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 linux-user/m68k/cpu_loop.c | 1 -
 target/m68k/op_helper.c    | 9 ---------
 target/m68k/translate.c    | 2 +-
 3 files changed, 1 insertion(+), 11 deletions(-)

diff --git a/linux-user/m68k/cpu_loop.c b/linux-user/m68k/cpu_loop.c
index d1bf8548b7..56417f7401 100644
--- a/linux-user/m68k/cpu_loop.c
+++ b/linux-user/m68k/cpu_loop.c
@@ -56,7 +56,6 @@ void cpu_loop(CPUM68KState *env)
             {
                 abi_long ret;
                 n = env->dregs[0];
-                env->pc += 2;
                 ret = do_syscall(env,
                                  n,
                                  env->dregs[1],
diff --git a/target/m68k/op_helper.c b/target/m68k/op_helper.c
index 8decc61240..d30f988ae0 100644
--- a/target/m68k/op_helper.c
+++ b/target/m68k/op_helper.c
@@ -217,11 +217,6 @@ static void cf_interrupt_all(CPUM68KState *env, int is_hw)
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
@@ -304,10 +299,6 @@ static void m68k_interrupt_all(CPUM68KState *env, int is_hw)
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
index 4026572ed8..6d6d026e3c 100644
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
2.34.1


