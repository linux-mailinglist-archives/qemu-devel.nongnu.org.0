Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D8A384DAA49
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Mar 2022 07:03:56 +0100 (CET)
Received: from localhost ([::1]:60822 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nUMlH-0002P5-Ta
	for lists+qemu-devel@lfdr.de; Wed, 16 Mar 2022 02:03:55 -0400
Received: from eggs.gnu.org ([209.51.188.92]:58668)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nUMgI-0002DM-4N
 for qemu-devel@nongnu.org; Wed, 16 Mar 2022 01:58:46 -0400
Received: from [2607:f8b0:4864:20::1029] (port=53155
 helo=mail-pj1-x1029.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nUMgG-0006R7-JS
 for qemu-devel@nongnu.org; Wed, 16 Mar 2022 01:58:45 -0400
Received: by mail-pj1-x1029.google.com with SMTP id v4so1322443pjh.2
 for <qemu-devel@nongnu.org>; Tue, 15 Mar 2022 22:58:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Y5E3xDJc6+sMrDQ5ji+qXAf2mzFdQEZPRXEYBWpijOg=;
 b=Q/6+5ZXz4w3B27yO6K+ylyzoOIxqes3/hpNbFpIzdXSAdBuCq3Dt6I981mL6p1fk2F
 rQ7fvR7dKVS/0PcmbjIlqqrPZ+XVJrlptgTMpyPKYyGtjBIQBfBS8Qn/6ZO0NGdrT7uf
 zQOrZu9jc0Peh9mkE9fM1ETlA3972COEcBLdMb6d2HnPm954J2tNILQQLMqLrT/KeMuF
 2Fqu5FCC8zpYQd8aWhDI0O/lu9XxWdYnYWbk2M6hPz86Uabdzn/telQF8lDRR570eNaP
 ntkacRPA7REN6Uh417LzFh0n9YVXbjq5WBabGVRQlH8zf1EOELes0xy0Wn1OL7sipZ+P
 Jpew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Y5E3xDJc6+sMrDQ5ji+qXAf2mzFdQEZPRXEYBWpijOg=;
 b=x63GAkeJA6vrRvvxrD8pdjr76Aui5flFu7HoRBW0jllhHKbDTEtRHVIGLBLiixc+Y/
 NawKthHja65hysPINLxSQiTrACvs3M4K9sT1mIaNXTStfWyckZK8v6j5XBivie/U0Jr+
 kqND3u9za/RKWe7AWgB65ap4bCyxs1Dwjj699E//20RKvT5wdiXlC59fTuYQU48Kr09C
 fCywo6vcLaci78J9svzahOkiCEL1FL8YJEYwEWMTve3xm+Ll4oyMzZtyuQwyGeBjfKNw
 tqTFbzM/3+d09g9Qo8OvFuhlxdZTsPcoX8giWmeYUei2KIs15B1yJKdDo4EQRIf3WRnq
 aEbA==
X-Gm-Message-State: AOAM532sXK7Gy4HGo8IaUF/wMDI3qyIPeYoSStPTZvUj19Y6E/t3o7YX
 h5Q+JDfqa0ooCryPNzdgQKHmmCmvtcCxCg==
X-Google-Smtp-Source: ABdhPJzuEvKJRsyHQBmTnqZCrV7+sI9qEpe1UwKGLsLRZ1pEUf8Gfo9KRZlygP4xHTnTVd0EAewSoQ==
X-Received: by 2002:a17:90a:5797:b0:1bc:56a9:f6c8 with SMTP id
 g23-20020a17090a579700b001bc56a9f6c8mr8648971pji.12.1647410323194; 
 Tue, 15 Mar 2022 22:58:43 -0700 (PDT)
Received: from localhost.localdomain (174-21-142-130.tukw.qwest.net.
 [174.21.142.130]) by smtp.gmail.com with ESMTPSA id
 i24-20020a056a00225800b004f6edabc9f4sm1236290pfu.72.2022.03.15.22.58.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Mar 2022 22:58:42 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 01/17] target/m68k: Raise the TRAPn exception with the
 correct pc
Date: Tue, 15 Mar 2022 22:58:24 -0700
Message-Id: <20220316055840.727571-2-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220316055840.727571-1-richard.henderson@linaro.org>
References: <20220316055840.727571-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::1029
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::1029;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1029.google.com
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
index 928a18e3cf..a152567624 100644
--- a/linux-user/m68k/cpu_loop.c
+++ b/linux-user/m68k/cpu_loop.c
@@ -57,7 +57,6 @@ void cpu_loop(CPUM68KState *env)
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


