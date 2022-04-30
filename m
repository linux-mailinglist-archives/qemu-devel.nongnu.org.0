Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F93E515FB0
	for <lists+qemu-devel@lfdr.de>; Sat, 30 Apr 2022 19:55:51 +0200 (CEST)
Received: from localhost ([::1]:37348 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nkrJu-00076w-FQ
	for lists+qemu-devel@lfdr.de; Sat, 30 Apr 2022 13:55:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33220)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nkrHv-0004Sy-Ev
 for qemu-devel@nongnu.org; Sat, 30 Apr 2022 13:53:47 -0400
Received: from mail-pg1-x52e.google.com ([2607:f8b0:4864:20::52e]:36810)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nkrHt-00080p-Rm
 for qemu-devel@nongnu.org; Sat, 30 Apr 2022 13:53:47 -0400
Received: by mail-pg1-x52e.google.com with SMTP id g3so8815340pgg.3
 for <qemu-devel@nongnu.org>; Sat, 30 Apr 2022 10:53:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=v6GsMd9l2dAfQx+Uj+qJ1gCQp2pHPy4DQInBPdc5TCM=;
 b=NVnL/mWE6QEmcPQDULe7H0h4Ra4GIcs10ieZtq1UQIg9Z7lcSeo2y0wGgvW3QRUBTn
 x0/Ni42kmkg5NOg708YivN2Y8SO4KFAzTje/5QqgcbvRKw9pbqSBA5PLhN2bvN+0GbYL
 drBolSCnPlc9TJx83X+BBq0UUijfB2Jq5upy2bJOu2kyByIGZkhqQDI57k9irkH8q3eY
 aGNS7oAmp3CInl6zYdzRWaxn6eF17eQst3mZIoaFMn2QIrDtDlGTh43XMWych7dCztE/
 fxHbnr2Y2cp8Lw97X4O0/YROTd8kNzdZtYD6LM2XHA6HhU1nYNWSoNL4mwPH5kOYPsAB
 Kzmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=v6GsMd9l2dAfQx+Uj+qJ1gCQp2pHPy4DQInBPdc5TCM=;
 b=otOh9sdz1c64VKsKFgHWQ7j2jKRYypGQkPSXZY0Ipgu66iwXE3FrpVVXPHHWCwAgeS
 E63kCtc6gY4pnmPfbF1K93iKnzj44ToN2kR9Q02sM2j2zGaZJ6pcw++0rYu8lDKPmS6t
 vNQWp/YttKdjOoKPGokrouf2xTi5NUi2dAmExcp8MfvHXxCqFa5Ol0n54omu0oykHvm+
 WJHApJbjNXfU3IEW5V2syhgYcgbvUdw6ax+G5rW/kAo0b5n8OnLGQw9WCRxG047L/tlB
 0toxvycvkYZ9H5/Kbb4wGYdwbeLs7DIXIyvZPTV64xD1osYAlcq86suUUjL+B7NdYezY
 gwrw==
X-Gm-Message-State: AOAM5324wTT2R7yKelCJM1IpjkurvRwuL20M9t7FXcNpkgo0ks7L4YoD
 jXbiJZXQ6cj4/MpBohtX8XHWFfJvzJre7w==
X-Google-Smtp-Source: ABdhPJwmKGaDw5tEMQegacWa7f9O8Pc0FsZzNsjUQl1J0uo1wl3I/mZfmksJFd//xrz7iwwXpM9ANQ==
X-Received: by 2002:a05:6a00:1411:b0:4fd:e594:fac0 with SMTP id
 l17-20020a056a00141100b004fde594fac0mr4474679pfu.79.1651341224414; 
 Sat, 30 Apr 2022 10:53:44 -0700 (PDT)
Received: from stoup.. ([71.212.142.129]) by smtp.gmail.com with ESMTPSA id
 5-20020a170902c20500b0015e8d4eb282sm1740910pll.204.2022.04.30.10.53.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 30 Apr 2022 10:53:44 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 01/17] target/m68k: Raise the TRAPn exception with the
 correct pc
Date: Sat, 30 Apr 2022 10:53:26 -0700
Message-Id: <20220430175342.370628-2-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220430175342.370628-1-richard.henderson@linaro.org>
References: <20220430175342.370628-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52e.google.com
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
Cc: laurent@vivier.eu
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


