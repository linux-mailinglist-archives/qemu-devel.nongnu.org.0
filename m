Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B34D336DE47
	for <lists+qemu-devel@lfdr.de>; Wed, 28 Apr 2021 19:28:15 +0200 (CEST)
Received: from localhost ([::1]:39410 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lbnyw-0001D9-Nv
	for lists+qemu-devel@lfdr.de; Wed, 28 Apr 2021 13:28:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40918)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lbndq-0001IA-Sl
 for qemu-devel@nongnu.org; Wed, 28 Apr 2021 13:06:27 -0400
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429]:37765)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lbndp-0006ee-67
 for qemu-devel@nongnu.org; Wed, 28 Apr 2021 13:06:26 -0400
Received: by mail-wr1-x429.google.com with SMTP id z6so2561574wrm.4
 for <qemu-devel@nongnu.org>; Wed, 28 Apr 2021 10:06:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=2C0UvV4ix/FbrE14gWIC5d1EOb1/N6nvJDFEzIzr/78=;
 b=mhcTK4J/KHU5AOUl3MxxXLogc3TAvE2WynrzSxHsjCS11u4Hiq1Q/pcWNlKEYnyD5D
 8lEaV+y5ycb9collq5xPThOktkTaXhXRXJr2rT7gLOa4EXw7HOQ3vbZUzuieF95ikKd1
 HShGRdiJQAi+jdl+p2Gp3uYt/szXF4SyrKHDjd+VdVyd7jaSykvrimEcPkBDQRVd/v5N
 MmXDOY9aPxqc+owTOhe8iHIF0exqzRAhpk3TzpBSrDgiaMbDvWwNhv6avdbxKS1tqSiS
 EDwIkjZKDIBeWQP56QHrEpYDYujvCGknOzl771JWE354UIscWLoIZF2jh6N7WqAXjus3
 +SCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=2C0UvV4ix/FbrE14gWIC5d1EOb1/N6nvJDFEzIzr/78=;
 b=CO2GdwTPIlWm/5OFUG3g/l52ElZaZ1cZ5wSRcHdMUCTTG2vAr0IzrQTptFL+JvZWI0
 nP0O3ve/W4tj9KCI37bA26sS4tuyEFUOgHEid+EaxaQkU4fPV8YB27JowtCEhfTQ6HbX
 JejeZddjQPRtjj3/StBDpRO9UPEXFf7/yBpMzMSbpkIJANVFGjTXJTDk8W2agO2NuZYc
 g0p4ic6it46xjzdRGzRajjTbyd9k4BqEVdvE2Hz7+9lvJBOzqFE4WfThHAZS4Y1Pvs0E
 BwpVHHF1N0Ki8maFeqi42+Jf00CKgIXQs8/sMpOFqTf3m5PMqhXns1teTVCIF9gZb8fi
 bkUg==
X-Gm-Message-State: AOAM532LjNgda3cwbE9fKS/sxIZgMY8ifM+1Zo/6IfvVPKDyItV8Y0Q4
 GXQfWepamCA5IWwsnvFeVdRj5Tf6iFz5cg==
X-Google-Smtp-Source: ABdhPJy0OMhAQinlO0AipKVD2kpFapq1pDs/xrft7CLG4ybMLIyIINWK5H9SwESDqE+VtB3wqzrLFw==
X-Received: by 2002:a5d:4412:: with SMTP id z18mr23143711wrq.103.1619629583814; 
 Wed, 28 Apr 2021 10:06:23 -0700 (PDT)
Received: from localhost.localdomain (39.red-81-40-121.staticip.rima-tde.net.
 [81.40.121.39])
 by smtp.gmail.com with ESMTPSA id n5sm418211wrx.92.2021.04.28.10.06.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Apr 2021 10:06:23 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 21/30] target/mips: Move tlb_helper.c to tcg/sysemu/
Date: Wed, 28 Apr 2021 19:04:01 +0200
Message-Id: <20210428170410.479308-22-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210428170410.479308-1-f4bug@amsat.org>
References: <20210428170410.479308-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x429.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Huacai Chen <chenhuacai@kernel.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Move tlb_helper.c to the tcg/sysemu/ subdir, along with
the following 3 declarations to tcg-internal.h:
- cpu_mips_tlb_flush()
- cpu_mips_translate_address()
- r4k_invalidate_tlb()

Simplify tlb_helper.c #ifdef'ry because files in tcg/sysemu/
are only build when sysemu mode is configured.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 target/mips/internal.h                    | 5 -----
 target/mips/tcg/tcg-internal.h            | 5 +++++
 target/mips/{ => tcg/sysemu}/tlb_helper.c | 3 ---
 target/mips/meson.build                   | 1 -
 target/mips/tcg/sysemu/meson.build        | 1 +
 5 files changed, 6 insertions(+), 9 deletions(-)
 rename target/mips/{ => tcg/sysemu}/tlb_helper.c (99%)

diff --git a/target/mips/internal.h b/target/mips/internal.h
index 2c9666905df..558cdca4e84 100644
--- a/target/mips/internal.h
+++ b/target/mips/internal.h
@@ -164,16 +164,12 @@ void r4k_helper_tlbp(CPUMIPSState *env);
 void r4k_helper_tlbr(CPUMIPSState *env);
 void r4k_helper_tlbinv(CPUMIPSState *env);
 void r4k_helper_tlbinvf(CPUMIPSState *env);
-void r4k_invalidate_tlb(CPUMIPSState *env, int idx, int use_extra);
 
 void mips_cpu_do_transaction_failed(CPUState *cs, hwaddr physaddr,
                                     vaddr addr, unsigned size,
                                     MMUAccessType access_type,
                                     int mmu_idx, MemTxAttrs attrs,
                                     MemTxResult response, uintptr_t retaddr);
-hwaddr cpu_mips_translate_address(CPUMIPSState *env, target_ulong address,
-                                  MMUAccessType access_type, uintptr_t retaddr);
-
 extern const VMStateDescription vmstate_mips_cpu;
 
 #endif /* !CONFIG_USER_ONLY */
@@ -423,7 +419,6 @@ static inline void compute_hflags(CPUMIPSState *env)
     }
 }
 
-void cpu_mips_tlb_flush(CPUMIPSState *env);
 void sync_c0_status(CPUMIPSState *env, CPUMIPSState *cpu, int tc);
 void cpu_mips_store_status(CPUMIPSState *env, target_ulong val);
 void cpu_mips_store_cause(CPUMIPSState *env, target_ulong val);
diff --git a/target/mips/tcg/tcg-internal.h b/target/mips/tcg/tcg-internal.h
index 70655bab45c..a39ff45d58f 100644
--- a/target/mips/tcg/tcg-internal.h
+++ b/target/mips/tcg/tcg-internal.h
@@ -24,8 +24,13 @@ void mmu_init(CPUMIPSState *env, const mips_def_t *def);
 
 void update_pagemask(CPUMIPSState *env, target_ulong arg1, int32_t *pagemask);
 
+void r4k_invalidate_tlb(CPUMIPSState *env, int idx, int use_extra);
 uint32_t cpu_mips_get_random(CPUMIPSState *env);
 
+hwaddr cpu_mips_translate_address(CPUMIPSState *env, target_ulong address,
+                                  MMUAccessType access_type, uintptr_t retaddr);
+void cpu_mips_tlb_flush(CPUMIPSState *env);
+
 #endif /* !CONFIG_USER_ONLY */
 
 #endif
diff --git a/target/mips/tlb_helper.c b/target/mips/tcg/sysemu/tlb_helper.c
similarity index 99%
rename from target/mips/tlb_helper.c
rename to target/mips/tcg/sysemu/tlb_helper.c
index bfb08eaf506..bf242f5e65a 100644
--- a/target/mips/tlb_helper.c
+++ b/target/mips/tcg/sysemu/tlb_helper.c
@@ -25,8 +25,6 @@
 #include "exec/log.h"
 #include "hw/mips/cpudevs.h"
 
-#if !defined(CONFIG_USER_ONLY)
-
 /* no MMU emulation */
 int no_mmu_map_address(CPUMIPSState *env, hwaddr *physical, int *prot,
                        target_ulong address, MMUAccessType access_type)
@@ -1072,4 +1070,3 @@ void r4k_invalidate_tlb(CPUMIPSState *env, int idx, int use_extra)
         }
     }
 }
-#endif /* !CONFIG_USER_ONLY */
diff --git a/target/mips/meson.build b/target/mips/meson.build
index a55af1cd6cf..ff5eb210dfd 100644
--- a/target/mips/meson.build
+++ b/target/mips/meson.build
@@ -31,7 +31,6 @@
   'msa_translate.c',
   'op_helper.c',
   'rel6_translate.c',
-  'tlb_helper.c',
   'translate.c',
   'translate_addr_const.c',
   'txx9_translate.c',
diff --git a/target/mips/tcg/sysemu/meson.build b/target/mips/tcg/sysemu/meson.build
index 5c3024e7760..73ab9571ba6 100644
--- a/target/mips/tcg/sysemu/meson.build
+++ b/target/mips/tcg/sysemu/meson.build
@@ -1,4 +1,5 @@
 mips_softmmu_ss.add(files(
   'cp0_helper.c',
   'mips-semi.c',
+  'tlb_helper.c',
 ))
-- 
2.26.3


