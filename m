Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BC7933DE505
	for <lists+qemu-devel@lfdr.de>; Tue,  3 Aug 2021 06:22:58 +0200 (CEST)
Received: from localhost ([::1]:49080 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mAlxB-0008G0-RR
	for lists+qemu-devel@lfdr.de; Tue, 03 Aug 2021 00:22:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56668)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mAlpa-00037J-Cy
 for qemu-devel@nongnu.org; Tue, 03 Aug 2021 00:15:06 -0400
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634]:40548)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mAlpY-0002D1-OW
 for qemu-devel@nongnu.org; Tue, 03 Aug 2021 00:15:06 -0400
Received: by mail-pl1-x634.google.com with SMTP id c16so22133322plh.7
 for <qemu-devel@nongnu.org>; Mon, 02 Aug 2021 21:15:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=3YfZ/UL664PTCelhcyMYJoABRu6Hh76jEhtzzul4yt8=;
 b=AKQZMOFDu3jfZF/W4XXAaErD4sM2bnytc//mDM0Cm/vtw4WgPCARkm72zINo4aTJn2
 5ZonM3ngy0DtxyNpZW065Wf3R3UtRgf+6HddL7kpIm3QUimqPJtC1tH668PUvzUQqEQ6
 XAQZDN61N4eVEzW1s3OAc/sSXjTEP7o/swgZ0iSUq2O0VZffE40ifaakciuEbcdP4Kde
 u0w8D6yqyo18aaIa/jNqGLlEfqigX2YQvEgTXRP4+gkI9zSTa5KN7f0HNuBX04Xxt8HV
 oceqNF91NpvSGYIGaOSUsKkEXcfClzLO6s3Epknyia3qewbaWnumVNnVIYM+5IoIKWOG
 lHhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=3YfZ/UL664PTCelhcyMYJoABRu6Hh76jEhtzzul4yt8=;
 b=D4QYpJ5N6T7/GYLTY8PmpglqzwWYcHKwBXRkMRMy4+pCdlkwlU8B6OxcNJ6hoKvkvT
 P8Zpu8d+meX51XZCLpSPcHulOnn0IMp/PwwGN/8SoRhJNH5mPiq4wq9zYEWD3CduBZ1j
 N5ut/kq072yUuBrMUJgMA6eW4GHgKnFxMpeww9TQQ+FeA8keBtAgSKwV9pgEtszqjsFh
 fXFhFmdbjb+Wkj6ED+n1UlyJyOjn+xjG27uIwSHn21QYkkO+dIHZ54ASVM/HMTrpCaJL
 SNSV5onffnfTrXy6QQBdZfm7woGxq3CzuZt22BpXIn+iAzHLvSLuTkB5G73+LnICpMZ9
 h7YQ==
X-Gm-Message-State: AOAM533etcR9K0z1eD4comJrRWZn5FPAM5kii6dNF6veUqAKpef5CdNa
 DbRzhdIWKEmzN12TminZ14lyXwOWRjda6Q==
X-Google-Smtp-Source: ABdhPJzxS+UWmfrsKwExr7wVamfdUbfj9Zs6WLtTYH+N6vN8nlWAxtbjW+7L4vG6H1Ewcy9qC8pbcg==
X-Received: by 2002:a05:6a00:1508:b029:332:3aab:d842 with SMTP id
 q8-20020a056a001508b02903323aabd842mr20040884pfu.59.1627964103510; 
 Mon, 02 Aug 2021 21:15:03 -0700 (PDT)
Received: from localhost.localdomain (rrcs-173-198-77-218.west.biz.rr.com.
 [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id c23sm13718532pfn.140.2021.08.02.21.15.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Aug 2021 21:15:03 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 15/55] target/sparc: Remove DEBUG_UNALIGNED
Date: Mon,  2 Aug 2021 18:14:03 -1000
Message-Id: <20210803041443.55452-16-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210803041443.55452-1-richard.henderson@linaro.org>
References: <20210803041443.55452-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::634;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x634.google.com
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
Cc: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The printf should have been qemu_log_mask, the parameters
themselves no longer compile, and because this is placed
before unwinding the PC is actively wrong.

We get better (and correct) logging on the other side of
raising the exception, in sparc_cpu_do_interrupt.

Cc: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/sparc/ldst_helper.c | 9 ---------
 1 file changed, 9 deletions(-)

diff --git a/target/sparc/ldst_helper.c b/target/sparc/ldst_helper.c
index 22327d7d72..974afea041 100644
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


