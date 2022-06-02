Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 080BF53B14A
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Jun 2022 03:38:02 +0200 (CEST)
Received: from localhost ([::1]:53122 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nwZmi-0005F7-8n
	for lists+qemu-devel@lfdr.de; Wed, 01 Jun 2022 21:38:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43424)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nwZix-0002KI-17
 for qemu-devel@nongnu.org; Wed, 01 Jun 2022 21:34:07 -0400
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a]:40670)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nwZiv-0005E2-BY
 for qemu-devel@nongnu.org; Wed, 01 Jun 2022 21:34:06 -0400
Received: by mail-pj1-x102a.google.com with SMTP id
 n13-20020a17090a394d00b001e30a60f82dso7944900pjf.5
 for <qemu-devel@nongnu.org>; Wed, 01 Jun 2022 18:34:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=v6GsMd9l2dAfQx+Uj+qJ1gCQp2pHPy4DQInBPdc5TCM=;
 b=Qg8/PLu8Zu5+LZyYhCNcSfO3eQLy/+KrGp2UPo57WrKp2FNzJv6/R5JugOmcoBd8g8
 Q6+48+Yth8+d7bNyLXzOKiHvU40oquMdEBZ7+Is4jewIOFdlrcs0Fzwv5umgZnJHWNl1
 ipFYFg2KnroRZRt3u4VFI+t01EGLvMR86d82kHFQG4ElGyyJH/X1xTjjmPXVR8PobeST
 neBFoHW7+p0MTDqFDDc8mvHZiKol8iKBKGlufC1ng1sUUUBQDaypO4EWmyflTxJnFCBa
 IbCFVQbNTL2dR2xI5sZ+4GqSUDboG5v0uWI2n8iYg5NWkKfuQWDxIejOC8xA0rwdKxAl
 tfKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=v6GsMd9l2dAfQx+Uj+qJ1gCQp2pHPy4DQInBPdc5TCM=;
 b=vYTHk3IGWj//PLAjkj6VOtGaL9wQE4P8Ia2XILUFZNhnznDK8x+iF9iGyAmn8g/X6S
 IYkVENqwIMtNo3HuBT5gpPF2I6w1qOLL0MdcUowir2Myd54FxGJIqE32xXFSrv0VvjbH
 tmdugfWGpwZfX2CnLdK1W07t4BzWKqDdgnMSXGGVt0V7a2BpLLW2/sp6GGFT+BnnFOoI
 eGvNAqK8+GqQl4kf68isFag4ozDuuW0oT0i711Qv5hdFvAdMFRusaaf3H/9BN0K0TrG6
 uc+EO7j2Vl0MuAm/1N/3Ml199mCgmHevlgoLZT+vD+B5xwpPjsuXkQWq6Di4Yo+eGavd
 nvGA==
X-Gm-Message-State: AOAM532GdbQdbC0xGdpYv/gfqU+LB78YmgAdP1qNxjNkTdLp4gnQbp1W
 Pel5cixpy66XAmfL2Kn4SNSslCI6eVniDw==
X-Google-Smtp-Source: ABdhPJzg7elFncZg10kOPHp7phsyH9uC5DzWBNnb64ptOxce8i9VkPmjFxcfuiIxEQe4pBotaSGeeg==
X-Received: by 2002:a17:902:a9ca:b0:161:54a6:af3f with SMTP id
 b10-20020a170902a9ca00b0016154a6af3fmr2358404plr.48.1654133644052; 
 Wed, 01 Jun 2022 18:34:04 -0700 (PDT)
Received: from stoup.. ([2602:ae:1547:e101:1eca:8ee3:9269:e00c])
 by smtp.gmail.com with ESMTPSA id
 l191-20020a6391c8000000b003fc5b1db26fsm1962875pge.52.2022.06.01.18.34.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Jun 2022 18:34:03 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: laurent@vivier.eu
Subject: [PATCH v6 01/17] target/m68k: Raise the TRAPn exception with the
 correct pc
Date: Wed,  1 Jun 2022 18:33:45 -0700
Message-Id: <20220602013401.303699-2-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220602013401.303699-1-richard.henderson@linaro.org>
References: <20220602013401.303699-1-richard.henderson@linaro.org>
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


