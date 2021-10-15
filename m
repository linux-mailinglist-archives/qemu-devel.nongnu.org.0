Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E6BC42E80B
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Oct 2021 06:47:29 +0200 (CEST)
Received: from localhost ([::1]:51480 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mbF7w-0008AF-Nq
	for lists+qemu-devel@lfdr.de; Fri, 15 Oct 2021 00:47:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39632)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mbEcD-0006tE-Jx
 for qemu-devel@nongnu.org; Fri, 15 Oct 2021 00:14:43 -0400
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435]:46614)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mbEcC-0002ul-24
 for qemu-devel@nongnu.org; Fri, 15 Oct 2021 00:14:41 -0400
Received: by mail-pf1-x435.google.com with SMTP id i76so5155377pfe.13
 for <qemu-devel@nongnu.org>; Thu, 14 Oct 2021 21:14:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=P+LiSx7CkE3blKbhg5ALaxOT08dtFOhalcqlNc9ibvc=;
 b=fkD5lzW8XEdW/8JddIYnS/3TBxtw+Z4dI0TbGhaI8Owa2wXINxDYLYYG4N0ClA3Xy5
 dhDSus9p4jC14sPZXFqh/5UkbhTjlcZyyXyG91Pc1iMvM+H4ALkI8K1yTYG3WR6ltsDu
 Hym9K1DLHee57sI1ZPRMWz+K0/X8AWVEFEPHOXQfCqqzTfS1JHM5yh29ZRBtmCcTKSYE
 T34yzzIkzG8r00mnTgYPVuGP2AW8hGXvzBQOp9Yh8LqJWKvFAhBuVdLvVpRVT5uOKpeA
 eXG1K2QfwdE22EpTNl6Ay8mHRSBlIS3+3RLxvh6Sqo1outCX4mPwXXKpdT4q6XUN56gy
 zM/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=P+LiSx7CkE3blKbhg5ALaxOT08dtFOhalcqlNc9ibvc=;
 b=0H4ZZ0/6vDxD5ue4Uv3d2sfGhoiyN0pDRJobSQNepeQOQcDrMZ1Ik5fYFemyvuPNCx
 obxgKGhmxlfYdRIc7K88JfTH347NdE6mW98wx0itD556QGmt3e6j5eGXWBQ+b4PVllTQ
 yMRPxe5CDp8V2/fu9FyeOvzsNcSC40AAYHac6iX8qk5aTAiDWp7ftXIk3cDCuKFiIRTd
 o4/j1UBHUEphGdJIJ4JTYlnScYwRSr7fBTMNp7/TSHHDpiBcZnlmMICPdB4aH7fSod/d
 IXdTefPjzBFEhBhtwN55jhm6Wg0C4eql0oDC0Qe0uVeG5d1ndPXPI6LOY48tJBTHgHvc
 Bc/A==
X-Gm-Message-State: AOAM5327KRvoBiREg1589wcPGIez2KbEj8J/wekSXYUtKuUxhBzI9iLl
 lFCvRRS5ra35qEZq7kO+YqTucPllO9oMbQ==
X-Google-Smtp-Source: ABdhPJyIMeZXstxhSDuBUlW0f2ojhgl+kBxtHzTX4Def2j2uv4bzrtpd1rjvfssj56E05IiGspePJg==
X-Received: by 2002:a63:f313:: with SMTP id l19mr7496427pgh.40.1634271278750; 
 Thu, 14 Oct 2021 21:14:38 -0700 (PDT)
Received: from localhost.localdomain ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id q8sm10236885pja.52.2021.10.14.21.14.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Oct 2021 21:14:38 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 55/67] target/sparc: Remove DEBUG_UNALIGNED
Date: Thu, 14 Oct 2021 21:10:41 -0700
Message-Id: <20211015041053.2769193-56-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211015041053.2769193-1-richard.henderson@linaro.org>
References: <20211015041053.2769193-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::435;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x435.google.com
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
Cc: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, alex.bennee@linaro.org,
 laurent@vivier.eu, imp@bsdimp.com,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The printf should have been qemu_log_mask, the parameters
themselves no longer compile, and because this is placed
before unwinding the PC is actively wrong.

We get better (and correct) logging on the other side of
raising the exception, in sparc_cpu_do_interrupt.

Reviewed-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/sparc/ldst_helper.c | 9 ---------
 1 file changed, 9 deletions(-)

diff --git a/target/sparc/ldst_helper.c b/target/sparc/ldst_helper.c
index bbf3601cb1..0549b6adf1 100644
--- a/target/sparc/ldst_helper.c
+++ b/target/sparc/ldst_helper.c
@@ -27,7 +27,6 @@
 
 //#define DEBUG_MMU
 //#define DEBUG_MXCC
-//#define DEBUG_UNALIGNED
 //#define DEBUG_UNASSIGNED
 //#define DEBUG_ASI
 //#define DEBUG_CACHE_CONTROL
@@ -364,10 +363,6 @@ static void do_check_align(CPUSPARCState *env, target_ulong addr,
                            uint32_t align, uintptr_t ra)
 {
     if (addr & align) {
-#ifdef DEBUG_UNALIGNED
-        printf("Unaligned access to 0x" TARGET_FMT_lx " from 0x" TARGET_FMT_lx
-               "\n", addr, env->pc);
-#endif
         cpu_raise_exception_ra(env, TT_UNALIGNED, ra);
     }
 }
@@ -1968,10 +1963,6 @@ void QEMU_NORETURN sparc_cpu_do_unaligned_access(CPUState *cs, vaddr addr,
     SPARCCPU *cpu = SPARC_CPU(cs);
     CPUSPARCState *env = &cpu->env;
 
-#ifdef DEBUG_UNALIGNED
-    printf("Unaligned access to 0x" TARGET_FMT_lx " from 0x" TARGET_FMT_lx
-           "\n", addr, env->pc);
-#endif
     cpu_raise_exception_ra(env, TT_UNALIGNED, retaddr);
 }
 #endif
-- 
2.25.1


