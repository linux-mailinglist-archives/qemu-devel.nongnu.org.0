Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 31CAF3F0BC8
	for <lists+qemu-devel@lfdr.de>; Wed, 18 Aug 2021 21:29:31 +0200 (CEST)
Received: from localhost ([::1]:36848 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mGRFi-0003Xw-4w
	for lists+qemu-devel@lfdr.de; Wed, 18 Aug 2021 15:29:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57884)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mGR6H-0000Wz-6k
 for qemu-devel@nongnu.org; Wed, 18 Aug 2021 15:19:45 -0400
Received: from mail-pf1-x430.google.com ([2607:f8b0:4864:20::430]:44745)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mGR6F-00005z-Hx
 for qemu-devel@nongnu.org; Wed, 18 Aug 2021 15:19:44 -0400
Received: by mail-pf1-x430.google.com with SMTP id k19so3188079pfc.11
 for <qemu-devel@nongnu.org>; Wed, 18 Aug 2021 12:19:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Sr+t+X0stQpP3YzmfZ0VHjnwAUZiovyNWFs9rYnnbC8=;
 b=ByS8nCfzaGzTwRBGcJEQQUQtEuGKqT0X4ErcF/NMeX+ybzPeKEWkcSGmDq38CBFomW
 gk1KdMXdw9PQ5Vs9n0IKbkY0BgmK3Ht9Da76MzkexCFrvg8UM0fBoMXrd/2i2tmi58TY
 qu579tAqopAq+qclWbC3NFaLumprxnbUg/amzs8cFaGanAQPU5KId+OTT48hJuvT+GXN
 i487rjgjZNx1kan3BhXbzyxdMK97NvrGAEGlpitVf1Q776Xttc3HzdNulhzOmZlRFNwB
 A3B0xNkPmTOrsHen3Vq5ef9LcaTjkas11hJ8aaenv3+xTa+ebwXKtjHismAv4yXcSjbl
 eq6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Sr+t+X0stQpP3YzmfZ0VHjnwAUZiovyNWFs9rYnnbC8=;
 b=Icj0dfFIJylxgSC/6o0rruN2RwsiP9IVZdpBoInMVf5GNhLbDLdcJdKG4iZYlHWa/a
 MHOvFH6xAvZypS81JXn0gm7gu9d0HeTYcsE6a8H9X9H9VskbU5XAlgfmFpYb7pKyFLqj
 rOeEOxsk/DV0lds3YL2LT1VYD/l08LsfPkta6uY/OrJFqtA8CnT/bPJUE2q49PCBdvGv
 bDw82GuMO2SgLeFKZNatUNj02oAaQc7khOcgb3QJFLYL8Z7/azyXXmaIur2u7AnoojXo
 Eot0tm3NOy6a1d2/lF8mIVx+HJ9WSzw+W+wYpjaRtObdvMtw/Lef877v+2HwAaSfBPYE
 0P8Q==
X-Gm-Message-State: AOAM5327sZAWAnLLbuMOb6Sk1HxqR5wu0pR0p9yhw3MK2q0RiQWirn96
 +5lGR65EwuvkT2jEEUD9Ubeon3HgxvZPUQ==
X-Google-Smtp-Source: ABdhPJz2O1DHijzrTcXfHFozchGj9LwxNNq7nOkn89N0pKY5zJGiJNzO1qhAMyjK0uhh3/Vd8OlxXQ==
X-Received: by 2002:a63:4c1f:: with SMTP id z31mr10445165pga.50.1629314382349; 
 Wed, 18 Aug 2021 12:19:42 -0700 (PDT)
Received: from localhost.localdomain ([173.197.107.15])
 by smtp.gmail.com with ESMTPSA id a6sm524108pjs.40.2021.08.18.12.19.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Aug 2021 12:19:42 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 16/66] target/sparc: Remove DEBUG_UNALIGNED
Date: Wed, 18 Aug 2021 09:18:30 -1000
Message-Id: <20210818191920.390759-17-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210818191920.390759-1-richard.henderson@linaro.org>
References: <20210818191920.390759-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::430;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x430.google.com
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

Reviewed-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
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


