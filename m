Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 83A34442D3D
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Nov 2021 12:52:24 +0100 (CET)
Received: from localhost ([::1]:42158 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mhsL1-0002x0-Ma
	for lists+qemu-devel@lfdr.de; Tue, 02 Nov 2021 07:52:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44648)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mhrhD-0001cb-Uk
 for qemu-devel@nongnu.org; Tue, 02 Nov 2021 07:11:19 -0400
Received: from mail-qt1-x82f.google.com ([2607:f8b0:4864:20::82f]:44756)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mhrhC-00020Q-Dw
 for qemu-devel@nongnu.org; Tue, 02 Nov 2021 07:11:15 -0400
Received: by mail-qt1-x82f.google.com with SMTP id j1so11238106qtq.11
 for <qemu-devel@nongnu.org>; Tue, 02 Nov 2021 04:11:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=P+LiSx7CkE3blKbhg5ALaxOT08dtFOhalcqlNc9ibvc=;
 b=Usx/HpVAgrQX+OlK893iSPRF+0iol38QPXU3Hy/cSAXJKSBhhpYf0L+mzNS1/CugTV
 AAqvjPIN9SfJd8k9MqrHPzp06BOnZ+PyWMiEQ3HtUGZ3S7Tz7T1cHBTdaea0nQ+0ghgT
 p3Mrdj6todbzIq9G8qVLVeUclTeksXRY9BNscMZuOPFrnMvoAnNKjkA7haDl8VZAhH4E
 gCyLvKMWgmYFV+9WZDqrGncN++YCdAEIfxw9ogTFm5Iso5YUb+yJEBJzlyn4s1rDFwQm
 NFYNCmsEzlYmRorr38xJYHrihEqUym5UKgQxlRZI46/Y+8r3fu+/2do4DuNuDegtyDTT
 SBzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=P+LiSx7CkE3blKbhg5ALaxOT08dtFOhalcqlNc9ibvc=;
 b=imZq+Ut3Ty8IG76N94iOrmEr4zLbc3Z+iv615tl2m0znlA0Vi+dABnNr+QzxsmU7ZX
 cWMLLkzoX11WN+jNstV2VBQeNeNBQWKsFR5+NurKMfIFgJO7i/60QJywmLwyIx0d1pDT
 w7Obarq1KRsFJ/QZsVy6oAcowfRXeFuRWgdGhzoJIcYMsFrVhbnN1n5oYsTAvpO+54p+
 Ku/V2r019osSVblE8GZ405E6/itIGZHDypRIjdmNWDuvkDUw8GaaBfxjAR5C0kR8xsGI
 iIi8dP8L5s4D/jc4HBRfTWORlBc+Bxu1l8Poseo+TFVzuwXPqjeYb+2ZOhTcS9S/j6C6
 8BPQ==
X-Gm-Message-State: AOAM533g54jXSHZHyU1Cix37dwZTvVwyy5QUDkpb/MtPllBROsdzNTGe
 d1FyQ9m+135adIRJ8hPYR0u7Y91ihQhd3Q==
X-Google-Smtp-Source: ABdhPJxMcxqeyyI/5AMpaj8UYyNjyCjUFW9vU7dY5Kmc746gMM0JS7yIelkReOECQnQFSUVaBPf+yQ==
X-Received: by 2002:ac8:7a82:: with SMTP id x2mr36678971qtr.260.1635851473569; 
 Tue, 02 Nov 2021 04:11:13 -0700 (PDT)
Received: from localhost.localdomain (rrcs-172-254-253-57.nyc.biz.rr.com.
 [172.254.253.57])
 by smtp.gmail.com with ESMTPSA id bm25sm12730854qkb.4.2021.11.02.04.11.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Nov 2021 04:11:13 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 54/60] target/sparc: Remove DEBUG_UNALIGNED
Date: Tue,  2 Nov 2021 07:07:34 -0400
Message-Id: <20211102110740.215699-55-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211102110740.215699-1-richard.henderson@linaro.org>
References: <20211102110740.215699-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::82f;
 envelope-from=richard.henderson@linaro.org; helo=mail-qt1-x82f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
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


